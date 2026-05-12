# IEEE 754 migration notes

`circuits/noir_XPath/xpath/Nargo.toml` currently uses a **path dependency**
on the local working copy of `jeswr/noir_IEEE754`:

```toml
ieee754 = { path = "../../../../noir_IEEE754/ieee754" }
```

This is a temporary arrangement because the rewritten
`Float<EXP_BITS, MANT_BITS, RM>` API (with `f32` / `f64` aliases, operator
overloads via `std::ops::{Add, Sub, Mul, Div, Neg}`, `From<Field>`-based
bit-extraction, IEEE-aware `==`, etc.) lives on the **local `main`** of
`jeswr/noir_IEEE754` (commit `f064139` at migration time) and has not yet
been published to the GitHub `main` branch.

## TODO: revert to Git tag once published

Once the new API lands on `github.com/jeswr/noir_IEEE754` `main`:

1. Replace the path dependency in
   `circuits/noir_XPath/xpath/Nargo.toml` with the canonical Git form:

   ```toml
   ieee754 = { tag = "<tag>", git = "https://github.com/jeswr/noir_IEEE754", directory = "ieee754" }
   ```

2. Delete this file.
3. Run `nargo check --workspace` from `circuits/noir_XPath/` to confirm
   the swap is clean.

## Summary of the API changes consumed by XPath

Old (free-function + opaque struct) | New (generic struct + methods)
------------------------------------|------------------------------------
`IEEE754Float32` / `IEEE754Float64` | `f32` / `f64` (aliases for `Float<8, 23, RNE>` / `Float<11, 52, RNE>`)
`float32_from_bits(u32)`            | `f32::from(bits as Field)` (via `From<Field>`)
`float32_to_bits(f) -> u32`         | `f.to_field() as u32`
`add_float32(a, b)`                 | `a + b` (operator) or `a.add::<RM>(b)`
`add_float32_with_rounding::<RM>(a, b)` | `a.add::<RM>(b)` (turbofish on inherent method)
`float32_eq` / `_lt` / `_gt` / `_le` / `_ge` | `a == b` (IEEE-aware) / `a.flt(b)` / `a.fgt(b)` / `a.fle(b)` / `a.fge(b)`
`float32_is_nan` / `_is_infinity` / `_is_zero` | `f.is_nan()` / `f.is_infinity()` / `f.is_zero()`
`abs_float32`                       | `f.abs()`
`FLOAT32_ZERO` / `FLOAT64_ZERO`     | `f32::signed_zero(0)` / `f64::signed_zero(0)`
`FLOAT{32,64}_{SIGN,EXPONENT,MANTISSA}_MASK` | (no longer exported -- redefined inline in `numeric_types.nr` where bit manipulation is still needed for `round` / `ceil` / `floor`)
`ROUNDING_MODE_NEAREST_AWAY` etc.   | `ROUNDING_MODE::NEAREST_AWAY` etc.

The `cast_*` helpers (`cast_double_to_float`, `cast_float_to_integer`,
`cast_double_to_integer`) and the `fn:round` / `fn:ceiling` / `fn:floor`
implementations still consume / produce raw bit patterns directly, so
those code paths convert to / from `Field` via `to_field()` and
`Float::from(...)` rather than going through the structured API. This
matches the old behaviour and avoids gate-count regressions.
