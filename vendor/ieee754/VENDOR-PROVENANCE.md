# Vendored: sparq_ieee754

The `xpath` library's float/double layer (`xpath/src/numeric_types.nr`) depends
on `sparq_ieee754`, the IEEE-754 f32/f64 library developed in the sparq
monorepo under `zk/ieee754`.

In the sparq monorepo the dependency is an in-tree path dep
(`sparq_ieee754 = { path = "../../ieee754" }`). In this standalone publication
repo there is no sibling `zk/ieee754`, so the library source is vendored here
and the dependency is repointed to `sparq_ieee754 = { path = "../vendor/ieee754" }`.

## Provenance

- **Upstream (canonical dev):** https://github.com/sparq-org/sparq — `zk/ieee754`
- **Vendored from sparq commit:** `397ce99058776f1c12482fcbaeb256e394ac69e5`
- **Package:** `sparq_ieee754` (type `lib`, no dependencies)
- **Contents:** `Nargo.toml`, `src/`, `README.md` only. The upstream crate's
  `bench/`, `differential/`, `tests/`, `scripts/`, and root `ct.nr` are NOT
  vendored (not needed to build `xpath`; they are not workspace members).
- Vendored source is byte-identical to upstream `zk/ieee754/{Nargo.toml,src,README.md}`.

Do not edit vendored sources here; make changes upstream in sparq-org/sparq and
re-vendor.
