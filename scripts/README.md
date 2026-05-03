# Scripts

This directory contains tooling scripts for the noir_XPath project: test generators
(`generate_tests.py`), the broad gate-count sweep (`benchmark_gates.py`), and a focused
benchmark harness for the unconstrained-hint optimisations (`benchmark_unconstrained.py`).

## benchmark_unconstrained.py

A small, focused harness that compares the constrained baseline `unsigned_to_string`
(in `xpath/src/cast.nr`) against the unconstrained-hint + verified-relation variant
`unsigned_to_string_verified` (in `xpath/src/unconstrained_ops.nr`).

Use this script to settle the deferred call-site decision for the unconstrained
primitive: `nargo info` is invoked once per variant, the `main` row plus every
ancillary helper row (`directive_invert`, `unsigned_to_string_unconstrained`, etc.)
are summed into `total_acir_opcodes`, and a side-by-side table is printed.

### Usage

```bash
# Run the benchmark and append a record to bench/unconstrained_gate_counts.json
python3 scripts/benchmark_unconstrained.py

# Print the most recent ledger entry without re-running the benchmark
python3 scripts/benchmark_unconstrained.py --summary

# Direct results to a custom JSON ledger
python3 scripts/benchmark_unconstrained.py --output /tmp/my_bench.json
```

### What it measures

For each variant the harness builds a throwaway crate that calls the operation on a
witness-driven `pub u64` (no constant folding) and folds the entire output buffer
into a public `Field` so dead-code elimination cannot drop the call. Because the
witness is unconstrained, the reported counts are the **worst-case** prover work —
call-sites that pass a compile-time constant will be cheaper.

| Field | Source | Notes |
|-------|--------|-------|
| `main_expression_width` | `nargo info` (`main` row) | Closely tracks prover-side cost. |
| `main_acir_opcodes` | `nargo info` (`main` row) | Compressed ACIR count for `main` only. |
| `ancillary_acir_opcodes` | sum of helper rows | Captures `directive_invert`, the Brillig hint, etc. |
| `total_acir_opcodes` | `main + ancillary` | The figure to compare across variants. |

### Ledger format

`bench/unconstrained_gate_counts.json` is a JSON list. Each invocation appends one
record with timestamp, abbreviated commit, and the per-variant fields above. Older
entries are preserved so regressions or wins show up across runs.

### Why a separate ledger?

`benchmark_gates.py` sweeps a broad set of XPath ops at a coarse granularity. This
harness is deliberately scoped to one primitive and captures Expression Width
(which `benchmark_gates.py` does not), so it lives in its own ledger to avoid
schema collisions.

---

## Test Generation Scripts

The remainder of this document covers the qt3tests-driven test generators.

## generate_tests.py

Generates Noir test packages from the [qt3tests](https://github.com/w3c/qt3tests) repository.

### Usage

```bash
# Generate tests for ALL functions (default)
python generate_tests.py

# Generate tests for specific functions only
python generate_tests.py --functions "fn:abs,op:numeric-add"

# List implemented functions
python generate_tests.py --list-functions

# List all discoverable functions (implemented and unimplemented)
python generate_tests.py --list-all

# Skip cloning qt3tests (if already present)
python generate_tests.py --skip-clone

# Skip running nargo fmt after generation
python generate_tests.py --skip-fmt

# Custom output directory
python generate_tests.py --output-dir ../custom_tests
```

### Options

| Option | Description |
|--------|-------------|
| `--output-dir` | Output directory for generated test packages (default: `../test_packages`) |
| `--qt3-dir` | Directory for qt3tests repository (default: `./qt3tests`) |
| `--functions` | Comma-separated list of XPath functions to generate tests for |
| `--skip-clone` | Skip cloning/updating the qt3tests repository |
| `--list-functions` | List implemented functions and exit |
| `--list-all` | List all discoverable functions (implemented and unimplemented) and exit |
| `--skip-fmt` | Skip running `nargo fmt` after generation |

### How It Works

The script generates a Noir test for every test case in the W3C qt3tests suite:

1. **Implemented Functions**: Tests call the actual implementation in the xpath library
2. **Unimplemented Functions**: Tests call auto-generated stub functions that assert false

### Stub Functions

For XPath functions that haven't been implemented yet, the script generates stub functions
in `xpath/src/stubs.nr`. These stub functions always assert false, causing tests to fail
until the real implementation is provided:

```rust
/// Stub for fn:concat - NOT YET IMPLEMENTED
pub fn stub_fnconcat() -> bool {
    assert(false, "fn:concat is not yet implemented");
    false
}
```

Tests for unimplemented functions call these stubs:

```rust
#[test]
fn fn_concat_1() {
    // Evaluates the 'concat' function
    // XPath: fn:concat("a", "b")
    // Expected: ab
    // Calls stub function - will fail until fn:concat is implemented
    let _ = stub_fnconcat();
}
```

This ensures:
- Every qt3test has a corresponding Noir test
- Tests for unimplemented functions fail clearly
- Progress can be tracked by the number of passing tests

### Generated Structure

```
xpath/
├── src/
│   ├── lib.nr          # Updated to include stubs module
│   ├── stubs.nr        # Auto-generated stub functions
│   └── ...

test_packages/
├── xpath_test_fnabs/
│   ├── Nargo.toml
│   └── src/
│       ├── lib.nr
│       └── chunk_0.nr
├── xpath_test_fnconcat/   # Uses stub functions
│   └── ...
```

### Formatting

The script automatically runs `nargo fmt` after generation to ensure all code is
properly formatted. Use `--skip-fmt` to disable this behavior.

### After Generation

After generating tests, the script automatically:
1. Updates the workspace `Nargo.toml` to include all test packages
2. Generates stub functions in `xpath/src/stubs.nr`
3. Updates `xpath/src/lib.nr` to export stub functions
4. Runs `nargo fmt` to format all generated code
