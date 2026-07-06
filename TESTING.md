# Testing Guide

This document describes the test suite for `noir_XPath`, how to run it, and the
**upstream → current test mapping** that certifies the comprehensive testing of
the original `jeswr/noir_XPath` repository was preserved when this repository was
re-published from the sparq monorepo.

> This repository is the source of truth for noir_XPath (externalized from
> the sparq monorepo's `zk/xpath` at v0.2.0).

## Toolchain

Pinned: **nargo 1.0.0-beta.21** (`.github/workflows/ci.yml` `NARGO_VERSION`
records the pin; CI installs exactly this version and verifies it).

## Test layout

The suite has three layers:

1. **Library inline tests** — `#[test]` functions inside `xpath/src/*.nr`
   (`comparison`, `datetime`, `duration`, `numeric`, `string`, `regex`, `hash`,
   `json`, …). Run with `nargo test --package xpath`.
2. **Unit-test binary** — `xpath_unit_tests/` (type `bin`), a dedicated
   collection of `#[test]` modules (date, gregorian, sequence, numeric, string,
   hash, regex, qname, …). Run with `nargo test --package xpath_unit_tests`.
3. **Generated `test_packages/`** — 360 packages auto-generated from the W3C
   **qt3tests** suite by `scripts/generate_tests.py` (using `elementpath` as the
   evaluation oracle).

### REAL vs STUB partition

The 360 generated packages partition into two classes:

- **REAL** — packages with genuine `#[test]` assertions against implemented
  library functions.
- **STUB-wired** — packages that either import a `stub_`-prefixed function whose
  body is `assert(false, "... not available in ZK")`, or carry the generator
  placeholder marker `No qt3tests cases could be converted` (an unconditional
  `assert(false)`). These document features that are **unimplemented or
  infeasible** in data-oblivious ZK circuits (regex, the XML/document model,
  environment/context functions, higher-order functions, collation, `format-*`).
  They fail **by design** and are **excluded** from the gated run.

Detection is dynamic (a `grep` for `stub_` / the placeholder marker), so as stub
functions are retired upstream, their packages automatically join the REAL gated
set with no workflow edit.

### KNOWN_FAILING

A list (in `scripts/run_real_tests.sh`) of REAL packages with a documented,
tracked latent failure. Entries are **skipped with a `::warning`, never masked
silently**.

The list is **currently empty**. Historical entries, all retired:

| Former entry | Resolution |
|---|---|
| `xpath_test_fncontains`, `xpath_test_fnends_with`, `xpath_test_fnstarts_with`, `xpath_test_fnstring_length`, `xpath_test_opadd_daytimeduration_to_datetime`, `xpath_test_opnotation_equal`, `xpath_test_opsubtract_daytimeduration_from_datetime` | were single `assert(false)` placeholders; received real qt3tests vectors in sparq PR #1550 (synced in face re-sync #3/#4) and now pass |
| `xpath_test_fnmonths_from_duration`, `xpath_test_fnyears_from_duration` | now compile and pass — the fn applied to an `xs:dayTimeDuration` returns 0 per XPath F&O |

## Running the tests

Requires nargo 1.0.0-beta.21.

```bash
# Full REAL suite: library + unit-test bin + real (non-stub) test_packages,
# honoring KNOWN_FAILING. This is what CI runs.
bash scripts/run_real_tests.sh

# Individual real targets:
nargo test --package xpath
nargo test --package xpath_unit_tests
```

> Do **not** run `nargo test --workspace` from the repository root: it would
> include the ~247 stub-wired packages that `assert(false)` by design, which
> always "fail".

### Latest measured results (nargo 1.0.0-beta.21, v0.3.0)

- `xpath` library: **204 `#[test]` functions** pass (includes the sq-3kd2g.4
  additions: SHA-2 digest KATs, langMatches, TZ, GROUP_CONCAT, SAMPLE).
- `xpath_unit_tests`: **303 `#[test]` functions** pass.
- `test_packages` partition: **113 REAL | 247 stub-wired (excluded)**.
- REAL packages run: **113 passed**, **0 skipped** (KNOWN_FAILING is empty),
  **0 unexpected failures** — **1454 tests** across the real packages.
- The vendored digest crates (`vendor/sha256`, `vendor/sha512`) are not
  workspace members; their deterministic KATs were verified on the upstream
  checkouts at vendoring time (see their `VENDOR-PROVENANCE.md`), and the
  `xpath` inline tests re-verify the FIPS 180-4 vectors through the wrappers.

## Upstream → current test mapping (preservation certificate)

This repository is re-published from `sparq-org/sparq:zk/xpath`, which is the
continuation of the original `jeswr/noir_XPath`. The maintainer's requirement is
that **the comprehensive testing performed in the old versions is preserved**.
The mapping below is derived empirically by diffing the old `jeswr/noir_XPath`
tree (its `main` branch plus every `ci/noir-*` branch) against the current suite.

### Method

- Enumerated every generated `test_packages/*/` directory in both trees.
- Extracted every `#[test]` function name (qt3-case identifier) across all
  packages in both trees (test-fn names are the stable qt3-case IDs, so a
  matching name is the same case).
- Computed the set differences (old − current) and (current − old).

### Result

| Quantity | Old `jeswr/noir_XPath` `main` | Current (this repo) |
|---|---:|---:|
| Generated `test_packages/` | 358 | 360 |
| Unique `#[test]` cases (all packages) | 15088 | 15095 |
| STUB/placeholder packages (`No qt3tests …`) | 7 | 7 (identical set) |

- **Old cases dropped from current: 0.** Every one of the 15088 unique old
  test-case identifiers is present in the current suite.
- **Current adds:** 2 packages — `xpath_test_fnmonths_from_duration`,
  `xpath_test_fnyears_from_duration` — and 7 net new cases (including 5 added to
  `xpath_test_opnumeric_divide`, 25 → 30).
- **`ci/noir-*` branches:** these are toolchain-version CI automation branches.
  Diffed against old `main`, the *only* `test_packages` content they carry beyond
  `main` is exactly the two packages above (`fnmonths_from_duration`,
  `fnyears_from_duration`) — and **both of their cases are present in the current
  suite**. They introduce no other unique test content.

**Conclusion:** the current suite is a strict **superset** of the old suite at
the test-case level.

- Old real test cases **ported** (adapted because not already covered): **0**
  (none required porting — all old cases are already present).
- Old real test cases **documented obsolete/invalid**: **0** (no old case was
  dropped).

The current suite additionally runs the two libraries' inline/unit `#[test]`
functions (128 + 292 = 420 more assertions) that the qt3-derived packages do not
cover, and it is exercised on a single pinned toolchain (beta.21) rather than the
old multi-version CI matrix.

## Generating tests

```bash
cd scripts
python generate_tests.py                                  # all functions
python generate_tests.py --functions "fn:timezone-from-dateTime"  # one function
```

See [scripts/README.md](./scripts/README.md).

## Adding tests

1. Implement in the appropriate `xpath/src/*.nr` module and export from `lib.nr`.
2. Add inline `#[test]`s in the module and/or `xpath_unit_tests/src/`.
3. Where a qt3tests mapping applies, extend `scripts/generate_tests.py` and
   regenerate the package.
4. Open a pull request against **this repository** (the source of truth since
   the v0.2.0 externalization).
