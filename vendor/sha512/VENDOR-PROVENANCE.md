# Vendored: sha512 (noir-lang) — SHA-512 + SHA-384

The `xpath` library's SPARQL hash-digest layer (`xpath/src/hash.nr`:
`sha384_hex*`, `sha512_hex*`) depends on the official noir-lang SHA-512
library, which provides both SHA-512 and SHA-384 (truncated SHA-512 with the
FIPS 180-4 SHA-384 IV). The pinned toolchain's stdlib (`nargo 1.0.0-beta.21`)
exposes no byte-oriented digest (verified by probe — see `../../VENDOR.md`,
"Hash"), so the external crate is vendored here as a path dependency, matching
this repo's policy for `json_parser` (nargo cannot pin git deps to commit SHAs,
and floating refs drift and are cached forever).

## Provenance

- **Upstream:** https://github.com/noir-lang/sha512
- **Upstream ref:** `main` @ commit `e92ffb4a4a6952ca29e8bd4dd8b02cf62a558d15`
  (2026-05, "feat: Remove duplicated decompose_witness call (#17)"). The
  upstream repo has **no release tags**, so the tip commit is pinned here —
  the same rationale as the `json_parser` vendoring.
- **Vendored on:** 2026-07-06, **unmodified** `Nargo.toml`, `src/`
  (byte-identical, including `src/benchmarks/`), `README.md`, `LICENSE`. NOT
  vendored: `.github/`, `scripts/`, and the TypeScript oracle-test harness
  (`oracle_server.ts`, `package.json`, `yarn.lock`, `tsconfig.json`,
  `release-please-config.json`) — not needed to build `xpath`; this package is
  not a workspace member.
- **License:** Apache-2.0 (upstream `LICENSE` file, vendored alongside; note
  the upstream `package.json` metadata says "MIT" — the repo-level LICENSE
  file is taken as governing).
- **No transitive dependencies** (`[dependencies]` is empty).

## Verification (2026-07-06, nargo 1.0.0-beta.21)

`nargo test` on the upstream checkout: **19/25 pass**. The 6 failures are all
`oracle_tests::*` — they require the upstream TypeScript RPC oracle server and
fail offline BY DESIGN. All deterministic known-answer tests (FIPS 180-4 "abc",
empty-string, multi-block vectors for both SHA-512 and SHA-384, plus
`digest`/`*_var` agreement) pass. The oracle tests are never run by this repo's
CI (`scripts/run_real_tests.sh` does not include vendored packages).

Do not edit vendored sources here; contribute upstream to noir-lang/sha512 and
re-vendor.
