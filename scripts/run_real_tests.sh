#!/usr/bin/env bash
# run_real_tests.sh -- run the REAL noir_XPath test suite on the pinned toolchain.
#
# Pinned toolchain: nargo 1.0.0-beta.21 (see .github/workflows/ci.yml NARGO_VERSION).
#
# The suite has three parts:
#   1. xpath/            -- library inline #[test] functions
#   2. xpath_unit_tests/ -- the dedicated unit-test binary
#   3. test_packages/*   -- 360 auto-generated packages from the W3C qt3tests suite.
#
# test_packages partition into REAL vs STUB-wired. A package is a STUB if any
# .nr file in its src/ contains 'stub_' (a stub_-prefixed import whose body is
# `assert(false, "... not available in ZK")`) OR the generated placeholder
# marker 'No qt3tests cases could be converted' (an unconditional assert(false)
# where the generator could not convert any qt3tests case). Only the REAL subset
# is gated -- stubs document unimplemented-in-ZK features (regex, XML/document
# model, env/context, higher-order fns, collation, format-*) and fail BY DESIGN.
#
# KNOWN_FAILING: packages in the REAL set with a documented latent failure. They
# are SKIPPED with a ::warning, never masked silently. See TESTING.md.
#
# Development happens in https://github.com/sparq-org/sparq under zk/xpath;
# this standalone repo is the published face. See README.md.
set -euo pipefail
shopt -s nullglob

cd "$(dirname "$0")/.."

# --- KNOWN_FAILING (bare package names under test_packages/) ---
# Currently EMPTY: every previously-listed package now passes.
#   - The 7 former assert(false) placeholders (fncontains, fnends_with,
#     fnstarts_with, fnstring_length, opadd_daytimeduration_to_datetime,
#     opnotation_equal, opsubtract_daytimeduration_from_datetime) received
#     real qt3tests vectors in sparq PR #1550 (synced in face re-sync #3/#4).
#   - fnmonths_from_duration / fnyears_from_duration now compile and pass
#     (fn applied to an xs:dayTimeDuration returns 0 per XPath F&O).
# If a real package regresses, add its bare name here with a reason and a
# tracking reference; it is skipped with a ::warning, never masked silently.
KNOWN_FAILING=()

fail_fast="${FAIL_FAST:-0}"   # FAIL_FAST=1 to stop on first failure

echo "=== nargo test -- xpath (library inline tests) ==="
(cd xpath && nargo test)

echo "=== nargo test -- xpath_unit_tests ==="
(cd xpath_unit_tests && nargo test)

echo "=== test_packages: partition REAL vs STUB ==="
real_count=0
stub_count=0
for pkg_dir in test_packages/*/; do
  if grep -rE "stub_|No qt3tests cases could be converted" "${pkg_dir}src/" --include="*.nr" -q 2>/dev/null; then
    stub_count=$((stub_count + 1))
  else
    real_count=$((real_count + 1))
  fi
done
if [ $((real_count + stub_count)) -eq 0 ]; then
  echo "ERROR: no test_packages/*/ directories found -- broken checkout; failing closed." >&2
  exit 1
fi
echo "Partition: ${real_count} real | ${stub_count} stub-wired (excluded)"

echo "=== nargo test -- real test_packages ==="
pass_pkgs=0
known_failing_count=0
failed_pkgs=()
for pkg_dir in test_packages/*/; do
  if grep -rE "stub_|No qt3tests cases could be converted" "${pkg_dir}src/" --include="*.nr" -q 2>/dev/null; then
    continue
  fi
  pkg_name=$(basename "${pkg_dir}")
  is_known_failing=0
  for kf in "${KNOWN_FAILING[@]}"; do
    [[ "${pkg_name}" == "${kf}" ]] && is_known_failing=1 && break
  done
  if [[ ${is_known_failing} -eq 1 ]]; then
    echo "::warning::Skipping known-failing package ${pkg_name} (see TESTING.md)"
    known_failing_count=$((known_failing_count + 1))
    continue
  fi
  echo "--- nargo test: ${pkg_name} ---"
  if (cd "${pkg_dir}" && nargo test); then
    pass_pkgs=$((pass_pkgs + 1))
  else
    failed_pkgs+=("${pkg_name}")
    if [[ "${fail_fast}" == "1" ]]; then
      echo "FAIL (fail-fast): ${pkg_name}" >&2
      exit 1
    fi
  fi
done

echo ""
echo "=== SUMMARY ==="
echo "real packages passed:        ${pass_pkgs}"
echo "known-failing skipped:       ${known_failing_count}"
echo "stub-wired excluded:         ${stub_count}"
echo "unexpected failures:         ${#failed_pkgs[@]}"
if [[ ${#failed_pkgs[@]} -gt 0 ]]; then
  printf '  - %s\n' "${failed_pkgs[@]}"
  exit 1
fi
echo "All real test_packages passed (${known_failing_count} known-failing skipped)."
