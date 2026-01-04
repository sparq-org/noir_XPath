# Test Generation Scripts

This directory contains scripts for generating Noir tests from the W3C qt3tests test suite.

## generate_tests.py

Generates Noir test packages from the [qt3tests](https://github.com/w3c/qt3tests) repository.

### Usage

```bash
# Generate tests for all implemented functions
python generate_tests.py

# Generate tests for specific functions
python generate_tests.py --functions "fn:abs,op:numeric-add"

# List implemented functions
python generate_tests.py --list-functions

# List all discoverable functions (implemented and unimplemented)
python generate_tests.py --list-all

# Generate tests for ALL functions (including stub tests for unimplemented)
python generate_tests.py --all --generate-stubs

# Skip cloning qt3tests (if already present)
python generate_tests.py --skip-clone

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
| `--all` | Process all test files found in qt3tests (not just implemented functions) |
| `--generate-stubs` | Generate stub tests for unimplemented functions (tests assert false) |

### Stub Tests

When using `--generate-stubs`, the script generates placeholder tests for functions
that haven't been implemented yet. These stub tests always assert false, so they
will fail until the function is correctly implemented:

```rust
#[test]
fn test_example() {
    // Description of the test
    // XPath: fn:some-function(...)
    // Expected: result
    // TODO: Implement fn:some-function
    assert(false); // Stub test - will fail until function is implemented
}
```

This is useful for:
- Tracking which functions still need implementation
- Ensuring tests exist before implementation
- Verifying implementations against W3C test suite

### Supported Functions

The script currently supports generating tests for:

**Numeric Functions:**
- `fn:abs`, `fn:ceiling`, `fn:floor`, `fn:round`
- `op:numeric-add`, `op:numeric-subtract`, `op:numeric-multiply`
- `op:numeric-divide`, `op:numeric-integer-divide`, `op:numeric-mod`
- `op:numeric-equal`, `op:numeric-less-than`, `op:numeric-greater-than`

**DateTime Functions:**
- `fn:year-from-dateTime`, `fn:month-from-dateTime`, `fn:day-from-dateTime`
- `fn:hours-from-dateTime`, `fn:minutes-from-dateTime`, `fn:seconds-from-dateTime`
- `fn:timezone-from-dateTime`
- `op:dateTime-equal`, `op:dateTime-less-than`, `op:dateTime-greater-than`

**Boolean Functions:**
- `fn:not`, `op:boolean-equal`

**Type Casting Functions:**
- `xs:float-from-int`, `xs:double-from-int`
- `xs:integer-from-float`, `xs:integer-from-double`
- `xs:float-from-double`

Note: Type casting functions are mapped in the script but tests from qt3tests cannot be auto-generated because they use cast expression syntax rather than function call syntax. Manual test packages have been created for these functions.

### Generated Test Structure

For each function, the script generates a test package:

```
test_packages/
├── xpath_test_fnabs/
│   ├── Nargo.toml
│   └── src/
│       ├── lib.nr
│       └── chunk_0.nr
├── xpath_test_opnumeric_add/
│   └── ...
```

Tests are split into chunks of 50 tests per file for manageability.

### Limitations

The script can only convert simple test cases. Complex expressions involving:
- Variables and external references
- Multiple function calls
- String operations
- Schema validation

...will be skipped and noted in the output.

### After Generation

After generating tests, the script automatically updates the workspace `Nargo.toml`
to include all generated test packages. Obsolete packages are also automatically
removed.
