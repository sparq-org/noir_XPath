# Vendored: sha256 (noir-lang)

The `xpath` library's SPARQL hash-digest layer (`xpath/src/hash.nr`:
`sha256_hex*`) depends on the official noir-lang SHA-256 library. The pinned
toolchain's stdlib (`nargo 1.0.0-beta.21`) exposes no byte-oriented digest
(verified by probe — see `../../VENDOR.md`, "Hash"), so the external crate is
vendored here as a path dependency, matching this repo's policy for
`json_parser` (nargo cannot pin git deps to commit SHAs, and floating tags
drift and are cached forever).

## Provenance

- **Upstream:** https://github.com/noir-lang/sha256
- **Upstream ref:** tag `v0.3.0` @ commit
  `9442e5b6856f98b2ec029882d7e90199ecff91ba`
- **Vendored on:** 2026-07-06, **unmodified** `Nargo.toml`, `src/` (byte-identical),
  `README.md`, `CHANGELOG.md`. NOT vendored: `.github/`, `scripts/`, and the
  TypeScript oracle-test harness (`oracle_server.ts`, `package.json`,
  `yarn.lock`, `tsconfig.json`, `release-please-config.json`) — not needed to
  build `xpath`; this package is not a workspace member.
- **License:** MIT (upstream `package.json`; the repo ships no standalone
  LICENSE file).
- **No transitive dependencies** (`[dependencies]` is empty).

## Verification (2026-07-06, nargo 1.0.0-beta.21)

`nargo test` on the upstream checkout: **30/38 pass**. The 8 failures are all
`oracle_tests::*` — they require the upstream TypeScript RPC oracle server
(`yarn oracle`) and fail offline BY DESIGN ("0 output values were provided as a
foreign call result"). All deterministic known-answer tests (NIST/FIPS 180-4
vectors, `sha256`/`sha256_var`/`sha224` equivalence) pass. The oracle tests are
never run by this repo's CI (`scripts/run_real_tests.sh` does not include
vendored packages).

Do not edit vendored sources here; contribute upstream to noir-lang/sha256 and
re-vendor.
