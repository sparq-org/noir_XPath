# Refactor wave 17 — methods + traits + opt sweep

Refactor brief: replace free-function APIs with methods on the relevant
struct; add `Eq` / `lt`-`le`-`gt`-`ge` inherent methods on every
value-type that supports them; take optimisation opportunities from the
`noir-optimisation` skill. Free functions stay as thin wrappers so the
existing public surface keeps working.

## Tooling at session start

- `nargo --version`: `1.0.0-beta.17`
- `bb --version`: `3.0.0-nightly.20251104`
- Branch: `refactor/new-ieee754-api` (PR #39); HEAD `928dccc`.

## Baseline-test block (resolved mid-session)

Initial `nargo test --workspace` fail-stopped on
`Float::signed_zero(0)` / `signed_infinity(0)` in
`xpath/src/numeric_types.nr`: the new IEEE754 API takes `bool` and PR
#39's migration commit (`633bec2`) still passed `Field` literals. Eight
call-sites flipped to `true`/`false` (Phase 1 build-fix, committed in
`f93d4c9`) and the crate compiles end-to-end again.

I spent ~15 minutes mis-diagnosing this as "IEEE754 dep is broken
upstream" -- the dep's `kernels/{common,div,mul,sqrt}.nr` *do* have
uncommitted edits, but they are internally consistent and a stale
`nargo` test cache + the `signed_zero`/`signed_infinity` Field/bool
bug were the only real obstacles. After the fix the `xpath` crate, the
`xpath_unit_tests` crate, every probed `test_packages/*` and the new
`qname_bench` bin all compile and `bb gates` cleanly.

Baseline test counts (post-build-fix, HEAD `f93d4c9` and onward):

- `nargo test --package xpath`: **82 passed**.
- `nargo test --package xpath_unit_tests`: **244 passed**.

These are the load-bearing numbers for "no regression after refactor".
Phases 2 and 3 keep both at 82 / 244.

## Per-module audit

| Module                  | Target struct(s)       | Traits today          | Free-fn count[1] | Phase notes |
|-------------------------|------------------------|-----------------------|------------------|-------------|
| `qname.nr`              | `XsdQName<NS, L>`      | none                  | 5                | Add `Eq` (same-shape); free `qname_equal` stays for cross-shape, delegates to inherent. Byte-loop optimisation candidate. |
| `duration.nr`           | `XsdDayTimeDuration`   | `Eq` (in `types.nr`)  | 15               | Inherent `add/subtract/multiply/divide/negate` already exist on the struct. Add `lt/le/gt/ge` methods; free `*_less_than` etc. become wrappers. Move `datetime_add_duration` etc. into inherent methods on `XsdDateTime`. |
| `year_month_duration.nr`| `XsdYearMonthDuration` | `Eq`                  | 18               | Add inherent `add/subtract/multiply/divide/divide_by/negate/lt/le/gt/ge`. Free fns stay as wrappers. `datetime_add_ym_duration` / `date_add_ym_duration` move to inherent methods. |
| `datetime.nr`           | `XsdDateTime`          | `Eq` (in `types.nr`)  | 22               | Already uses typed-u64 compares (good). Add inherent `equal/lt/le/gt/ge` for symmetry; free fns become wrappers. |
| `date.nr`               | `XsdDate`              | `Eq` (in `types.nr`)  | 17               | Add `lt/le/gt/ge` inherent. `date.epoch_days` is `i32` -- typed compare already cheap. |
| `time.nr`               | `XsdTime`              | `Eq` (in `types.nr`)  | 14               | Compares via `utc_microseconds()` (i64) -- typed already. Add `lt/le/gt/ge` inherent. |
| `gregorian.nr`          | five partial-date types| none                  | 5                | Add `Eq` to every gregorian struct. No ordering (XPath spec is equality-only for these). |
| `numeric_types.nr`      | `XsdFloat`, `XsdDouble`| `Eq`                  | ~30              | Phase 3: add `lt/le/gt/ge` inherent methods delegating to `Float::flt` / `fle` etc. **Do NOT** add `Ord` -- IEEE NaN-unordered breaks the contract. |

[1] approximate; counted from `pub fn` declarations exported via `lib.nr`.

## Optimisation candidates spotted in the audit

- **qname byte loop** -- `for i in 0..NS1 { if (i as u32) < a.namespace_len { ... } }`. The `(i as u32)` cast is redundant (`i` is already `u32`); the inner `if (i as u32) < NS2` branch can be hoisted out as a `comptime` predicate via `if NS1 <= NS2` because `NS1` / `NS2` are const generics.
- **`datetime_less_than` and siblings** -- already cast to `u64` before `<`. Good.
- **`date_less_than`** -- `epoch_days` is `i32`; `a.epoch_days < b.epoch_days` uses signed `i32` compare which lowers cheaply. No change.
- **`duration_less_than`** -- compares `i64`; already typed.
- **`ym_duration_less_than`** -- compares `i32`; already typed.
- **`assert(divisor != 0, ...)`** in duration / ym-duration -- branchful, but each only one assert per call. Not a meaningful target.
- The `*_from_components` parsers in `year_month_duration.nr` have huge `for _ in 0..N` loops; out of scope for this round, flagged for future.

## Phase deltas

### Phase 1 -- qname (`f93d4c9`)

- `XsdQName<NS, L>` now implements `Eq`; same-shape `==` and `!=` work.
- Cross-shape `qname_equal` free function preserved as the public entry
  for the cross-shape case (trait `Eq` cannot express `Self != Self`).
- New inherent accessors: `XsdQName::local_name(self)` and
  `namespace_uri(self)`. Free `local_name_from_qname` /
  `namespace_uri_from_qname` are thin wrappers.
- Build-fix piggy-backed: 8 x `Float::signed_zero(...)` /
  `signed_infinity(...)` call-sites switched `Field` -> `bool`.

#### Byte-loop optimisation attempt (reverted)

I tried a "mismatch-mask" body replacing the nested-`if` chain in
`eq_same_size` / `qname_equal`, expecting fewer ACIR opcodes per byte.
Measured against the nested-`if` form via `qname_bench` (32-call
amplified harness, UltraHonk):

| Form                         | ACIR opcodes | `bb gates` |
|------------------------------|-------------:|-----------:|
| `qname_equal_nested_if`      |          419 |       4444 |
| `qname_equal_mask`           |          453 |       8232 |

The mask form regresses both metrics -- ACIR opcodes +8.1%, `bb gates`
+85.3%. The `(in_range * neq)` multiplication and the `mismatch | ...`
fold both compile to extra constraints per byte that the previous
nested-`if`'s constant-folded short-circuits avoided. **Reverted** in
the same commit per `noir-optimisation` skill's "If a refactor in a
module regresses gate count with no readability win, revert." See
`qname_bench/src/main.nr` -- both forms are kept side-by-side as a
regression guard.

Production `eq_same_size` / `qname_equal` therefore carry the same
body shape as commit `928dccc` but routed through the trait.

### Phase 2 -- temporal types (`160e597`)

Inherent ordering methods added (`lt`/`le`/`gt`/`ge` mirror
`Float::flt`/`fle`/`fgt`/`fge`):

| Struct                  | Methods added            | Where             |
|-------------------------|--------------------------|-------------------|
| `XsdDateTime`           | lt/le/gt/ge + add_day_time_duration / subtract_day_time_duration / difference | `types.nr` |
| `XsdDate`               | lt/le/gt/ge              | `types.nr`        |
| `XsdTime`               | lt/le/gt/ge              | `types.nr`        |
| `XsdDayTimeDuration`    | lt/le/gt/ge + divide_by  | `types.nr`        |
| `XsdYearMonthDuration`  | lt/le/gt/ge + add/subtract/multiply/divide/divide_by/negate | `year_month_duration.nr` |

Free functions (`datetime_less_than`, `duration_less_than`,
`ym_duration_*`, etc.) collapse to thin wrappers. Existing call-sites
unaffected.

Gregorian partial-date types -- `Eq` added on all five
(`XsdGYear`, `XsdGMonth`, `XsdGDay`, `XsdGYearMonth`, `XsdGMonthDay`).
`gyear_equal` and siblings now wrap `==`.

Tests after Phase 2: **82 + 244 = 326 passing** (unchanged vs. Phase 1
baseline).

### Phase 3 -- numeric_types (`dbebcc1`)

Inherent methods on `XsdFloat` and `XsdDouble`:

| Type        | Methods added                                       |
|-------------|-----------------------------------------------------|
| `XsdFloat`  | add / subtract / multiply / divide / abs / lt / le / gt / ge |
| `XsdDouble` | add / subtract / multiply / divide / abs / lt / le / gt / ge |

Body delegates to the `Float<E, M, RM>` operator overloads
(`a.value + b.value` etc.) and `Float::flt` / `fle` / `fgt` / `fge`.
Free `numeric_*_float` / `numeric_*_double` / `abs_*` functions collapse
to thin wrappers.

Deliberately **NOT** implementing `Ord`: IEEE 754 `<` is non-total
(NaN unordered), so `Ord`'s contract cannot hold. See the
`noir-circuit-patterns` skill, "Standard library traits in this stack".

The `compare_int_float_*` polymorphic-cast matrix is deferred per the
wave brief (no obvious method-home until a future `promote_*` trait).

### Phase 4 -- sweep

- `nargo check` / `nargo test --package xpath`: clean, 82 passing.
- `nargo test --package xpath_unit_tests`: clean, 244 passing.
- Probed test packages (`qname_equal`, `numeric_add_float`,
  `numeric_equal_float`, `numeric_less_than_float`, `duration_equal`,
  `daytimeduration_less_than`, `datetime_less_than`, `date_equal`,
  `gyear_equal`, `numeric_multiply_float`): all `nargo check` clean,
  the mul one `nargo compile`s through the IEEE754 mul kernel
  successfully (resolving my mid-session confusion).
- `qname_bench` -- new bin package; nested-if form is 4444 backend
  gates / 419 ACIR opcodes at N=32 amplification, mask form is 8232 /
  453 (kept side-by-side as regression guard).

Workspace test (`nargo test --workspace`) covers 250+ packages and
takes too long to fit in a single session iteration -- I ran the
xpath-crate + xpath_unit_tests for the regression confirmation and
relied on per-package `nargo check` for the test_packages.

## Tool / dep blockers

None resolved blocked the round. Note for future agents: the IEEE754
dep at `../../../../noir_IEEE754/ieee754` is on its main branch with
**uncommitted local edits** in the kernel files (mul / div / sqrt /
common). They are internally consistent and compile cleanly; do not
add an upstream-versioning concern unless you actually hit a build
break against that path.

## Deferred / future rounds

- `compare_int_float_*` matrix in `numeric_types.nr` -- polymorphic
  across numeric type pairs; the brief explicitly defers these.
- `*_from_string` / `*_to_string` parsers (`year_month_duration.nr`,
  `ietf_date.nr`, `cast.nr`) -- their loops have a clear constant-fold
  story but no caller cares about gate-count regressions in pre-parser
  paths today.
- Stub modules (`stubs.nr`) -- thin pass-throughs; no traits to add.
