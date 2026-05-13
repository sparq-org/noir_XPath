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

## Baseline-test block (load-bearing)

`nargo test --workspace` fails to compile at HEAD. Cause: the IEEE754
crate consumed at `../../../../noir_IEEE754/ieee754` is mid-refactor
with **uncommitted local edits** in
`ieee754/src/kernels/{common,div,mul,sqrt}.nr`. Errors include
`euclid_split_verified::<60>` generics arity mismatch and Field-vs-u64
type mismatches inside `mul.nr` line 87 and `common.nr` line ~38. This
dep is read-only per the brief, so I cannot patch it. Every measurement
gated on `nargo compile` succeeding (the whole xpath workspace, every
`test_packages/*`, and `bb gates`) is therefore unavailable for this
round.

Workaround: the **xpath sources themselves** can still be syntactically
audited against the rest of the crate, and refactor edits that don't
touch the float types compile cleanly when probed in isolation
(scratch crates with no `ieee754` dep). For Phase 3 (XsdFloat /
XsdDouble methods), the shape mirrors the existing free-function
bodies one-for-one; once the IEEE754 dep returns to a working state
the round-trip test pass will confirm.

Tracked as a blocker; documented again at the end of this file.

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

(filled in per commit)

### Phase 1 -- qname

(to be filled)

### Phase 2 -- temporal types

(to be filled)

### Phase 3 -- numeric_types

(to be filled)

### Phase 4 -- sweep

(to be filled)

## Tool / dep blockers

1. **IEEE754 dep is broken at the consumed path.** See "Baseline-test
   block" above. Round-trip tests, ACIR opcode counts and `bb gates`
   numbers are blocked until that crate's uncommitted edits are
   stabilised. No `bb gates` measurements in this wave; opcode counts
   in this file are not produced.
2. `numeric_types.nr` cannot be compiled to check this wave's
   additions either; the Phase 3 changes are reviewed-by-eye against
   the existing `+ - * /` operator forms (which themselves compile
   under the new API once the dep is fixed).

## Deferred / future rounds

- `compare_int_float_*` matrix in `numeric_types.nr` -- polymorphic
  across numeric type pairs; the brief explicitly defers these.
- `*_from_string` / `*_to_string` parsers (`year_month_duration.nr`,
  `ietf_date.nr`, `cast.nr`) -- their loops have a clear constant-fold
  story but no caller cares about gate-count regressions in pre-parser
  paths today.
- Stub modules (`stubs.nr`) -- thin pass-throughs; no traits to add.
