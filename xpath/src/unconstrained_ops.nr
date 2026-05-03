//! Unconstrained-hint + verified-relation optimisations for XPath operators.
//!
//! Pattern: when a function has an expensive in-circuit implementation but a
//! cheap functional spec, compute the answer in an `unconstrained` (Brillig)
//! hint and verify it inside the constraint system with a relation that
//! uniquely characterises the output. The hint contributes zero ACIR gates;
//! only the verifier costs gates.
//!
//! References:
//! - <https://noir-lang.org/docs/noir/concepts/unconstrained>
//! - Howard Hinnant style "tight verifier" pattern used widely in Aztec circuits.
//!
//! British English is used throughout the documentation.

// ============================================================================
// Helpers
// ============================================================================

/// 10^k for k in 0..=19 -- exact under u64 (10^19 < 2^64 < 10^20).
/// Constant-folded at compile time so each lookup is a free assignment.
fn pow10_u64(k: u32) -> u64 {
    let table: [u64; 20] = [
        1,
        10,
        100,
        1_000,
        10_000,
        100_000,
        1_000_000,
        10_000_000,
        100_000_000,
        1_000_000_000,
        10_000_000_000,
        100_000_000_000,
        1_000_000_000_000,
        10_000_000_000_000,
        100_000_000_000_000,
        1_000_000_000_000_000,
        10_000_000_000_000_000,
        100_000_000_000_000_000,
        1_000_000_000_000_000_000,
        10_000_000_000_000_000_000,
    ];
    table[k]
}

// ============================================================================
// Unsigned integer -> decimal byte-string
// ============================================================================

/// Brillig hint: compute the canonical decimal representation of `value`.
///
/// Returns `(bytes, len)` such that `bytes[0..len]` are ASCII digits forming
/// the canonical (no-leading-zero) decimal string of `value`, with all other
/// positions zero. `value == 0` returns `(['0', 0, ...], 1)`.
///
/// This function is `unconstrained` and contributes no ACIR gates. Its output
/// MUST be validated by `unsigned_to_string_verified` before being trusted.
pub unconstrained fn unsigned_to_string_unconstrained<let N: u32>(
    value: u64,
) -> ([u8; N], u32) {
    let mut result: [u8; N] = [0; N];

    if value == 0 {
        if N > 0 {
            result[0] = 48; // '0'
        }
        (result, 1)
    } else {
        // Count digits.
        let mut temp: u64 = value;
        let mut digit_count: u32 = 0;
        for _ in 0..20 {
            if temp > 0 {
                digit_count += 1;
                temp = temp / 10;
            }
        }

        // Write digits in reverse order.
        let mut write_pos: u32 = digit_count;
        let mut v: u64 = value;
        for _ in 0..20 {
            if v > 0 {
                write_pos -= 1;
                if write_pos < N {
                    result[write_pos] = 48 + ((v % 10) as u8);
                }
                v = v / 10;
            }
        }

        (result, digit_count)
    }
}

/// Constrained verifier: returns the decimal byte-string of `value`, asserting
/// the result is canonical and unique.
///
/// # Public-input contract
/// - Input: `value: u64`.
/// - Output: `(bytes: [u8; N], len: u32)` where `bytes[0..len]` is the canonical
///   decimal representation of `value` and `bytes[len..N]` is all zeros.
/// - Requires `N >= 20` (u64 has at most 20 decimal digits) -- asserted at
///   the start.
///
/// # SAFETY PROOF (sketch -- not mechanised)
/// The verifier asserts the following relation `R(value, bytes, len)`:
///
/// 1. `1 <= len <= 20`.
/// 2. For every `i` in `0..N`:
///    - if `i < len`: `bytes[i]` is an ASCII digit in `[48, 57]` (i.e. `'0'..'9'`).
///    - if `i >= len`: `bytes[i] == 0`.
/// 3. If `len > 1` then `bytes[0] != 48` (no leading zero).
/// 4. `value == sum_{i=0..len} (bytes[i] - 48) * 10^(len - 1 - i)`.
///
/// **Uniqueness** (no second `(bytes', len')` satisfies `R(value, bytes', len')`):
///
/// - The trailing-zero clause (2) pins down `bytes[i]` for every `i >= len`,
///   so the only degrees of freedom are `len` and the digits at positions
///   `0..len`.
/// - For a fixed `value`, the standard positional-notation theorem gives a
///   unique base-10 expansion of length `floor(log10(value)) + 1` (or 1 if
///   `value == 0`) with no leading zero. Clause (3) excludes representations
///   with a leading zero (e.g. `"042"` for `42`), and clause (4) ties the
///   digits to `value`. Clause (1) bounds `len` so a longer all-zero-padded
///   form (e.g. `"0042"`) cannot satisfy clause (3).
/// - For `value == 0` the special case `len == 1, bytes[0] == '0'` is the
///   only solution because clause (4) forces the (single) digit to be 0,
///   and clauses (1)+(3) forbid `len == 0` and longer representations.
///
/// Therefore exactly one `(bytes, len)` tuple satisfies `R` for any input
/// `value: u64`, so the unconstrained hint cannot be substituted with a
/// different valid value.
///
/// This sketch is a reading aid; the soundness has not been mechanised
/// (no Lean / Lampe proof is in scope this round).
pub fn unsigned_to_string_verified<let N: u32>(value: u64) -> ([u8; N], u32) {
    // We need at least 20 bytes to hold any u64.
    assert(N >= 20, "unsigned_to_string_verified: N must be >= 20");

    // Safety: the relation below uniquely determines (bytes, len) given value;
    // see the SAFETY PROOF block above.
    let (bytes, len) = unsafe { unsigned_to_string_unconstrained::<N>(value) };

    // Clause (1): 1 <= len <= 20.
    assert(len >= 1, "unsigned_to_string_verified: len must be >= 1");
    assert(len <= 20, "unsigned_to_string_verified: len must be <= 20");

    // Clauses (2) + (4): walk the array once, enforcing per-position properties
    // and accumulating the reconstructed value.
    let mut reconstructed: u64 = 0;
    for i in 0..N {
        let i_u32: u32 = i as u32;
        let b: u8 = bytes[i];
        let in_digits: bool = i_u32 < len;

        if in_digits {
            // Clause (2a): digit must be ASCII '0'..'9'.
            assert(b >= 48, "unsigned_to_string_verified: byte below '0'");
            assert(b <= 57, "unsigned_to_string_verified: byte above '9'");

            // Reconstruction term: digit * 10^(len - 1 - i).
            // `len - 1 - i_u32` is non-negative because `i_u32 < len`.
            let exponent: u32 = len - 1 - i_u32;
            let weight: u64 = pow10_u64(exponent);
            let digit: u64 = (b - 48) as u64;
            reconstructed = reconstructed + digit * weight;
        } else {
            // Clause (2b): trailing positions must be zero.
            assert(b == 0, "unsigned_to_string_verified: trailing byte not zero");
        }
    }

    // Clause (3): no leading zero, unless len == 1.
    // (If len == 1 then bytes[0] is the only digit and may legally be '0'
    //  -- that's the canonical form for value == 0.)
    let leading_byte: u8 = bytes[0];
    let leading_is_zero: bool = leading_byte == 48;
    let single_digit: bool = len == 1;
    assert(
        !leading_is_zero | single_digit,
        "unsigned_to_string_verified: leading zero in multi-digit form",
    );

    // Clause (4): the reconstruction must equal the input.
    assert(reconstructed == value, "unsigned_to_string_verified: digits do not match value");

    (bytes, len)
}

// ============================================================================
// Tests
// ============================================================================

#[test]
fn test_unsigned_to_string_verified_zero() {
    let (bytes, len): ([u8; 20], u32) = unsigned_to_string_verified(0);
    assert(len == 1);
    assert(bytes[0] == 48); // '0'
    for i in 1..20 {
        assert(bytes[i] == 0);
    }
}

#[test]
fn test_unsigned_to_string_verified_small() {
    let (bytes, len): ([u8; 20], u32) = unsigned_to_string_verified(7);
    assert(len == 1);
    assert(bytes[0] == 48 + 7); // '7'
}

#[test]
fn test_unsigned_to_string_verified_multi_digit() {
    let (bytes, len): ([u8; 20], u32) = unsigned_to_string_verified(12_345);
    assert(len == 5);
    assert(bytes[0] == 49); // '1'
    assert(bytes[1] == 50); // '2'
    assert(bytes[2] == 51); // '3'
    assert(bytes[3] == 52); // '4'
    assert(bytes[4] == 53); // '5'
    for i in 5..20 {
        assert(bytes[i] == 0);
    }
}

#[test]
fn test_unsigned_to_string_verified_max_u64() {
    // 18_446_744_073_709_551_615 is 2^64 - 1 (20 digits).
    let (bytes, len): ([u8; 20], u32) = unsigned_to_string_verified(18_446_744_073_709_551_615);
    assert(len == 20);
    let expected = "18446744073709551615".as_bytes();
    for i in 0..20 {
        assert(bytes[i] == expected[i]);
    }
}

#[test]
fn test_unsigned_to_string_verified_powers_of_ten() {
    let (bytes1, len1): ([u8; 20], u32) = unsigned_to_string_verified(10);
    assert(len1 == 2);
    assert(bytes1[0] == 49); // '1'
    assert(bytes1[1] == 48); // '0'

    let (bytes2, len2): ([u8; 20], u32) = unsigned_to_string_verified(1_000_000);
    assert(len2 == 7);
    assert(bytes2[0] == 49); // '1'
    for i in 1..7 {
        assert(bytes2[i] == 48); // '0'
    }
}

// --- Adversarial: a hand-rolled wrong hint must fail the verifier. ---

/// A deliberately-wrong unconstrained hint that returns "0" for any input.
unconstrained fn wrong_hint<let N: u32>(_value: u64) -> ([u8; N], u32) {
    let mut result: [u8; N] = [0; N];
    if N > 0 {
        result[0] = 48; // '0'
    }
    (result, 1)
}

/// A "tampered" verifier identical to `unsigned_to_string_verified` but with
/// the unconstrained hint replaced by `wrong_hint`. Used to exercise the
/// adversarial path: the constrained checks must reject the bad hint.
pub fn unsigned_to_string_verified_with_wrong_hint<let N: u32>(
    value: u64,
) -> ([u8; N], u32) {
    assert(N >= 20, "N must be >= 20");

    // Safety: this is the adversarial test path -- we expect the verifier
    // below to reject the result whenever the hint is wrong.
    let (bytes, len) = unsafe { wrong_hint::<N>(value) };

    assert(len >= 1, "len must be >= 1");
    assert(len <= 20, "len must be <= 20");

    let mut reconstructed: u64 = 0;
    for i in 0..N {
        let i_u32: u32 = i as u32;
        let b: u8 = bytes[i];
        let in_digits: bool = i_u32 < len;
        if in_digits {
            assert(b >= 48);
            assert(b <= 57);
            let exponent: u32 = len - 1 - i_u32;
            let weight: u64 = pow10_u64(exponent);
            let digit: u64 = (b - 48) as u64;
            reconstructed = reconstructed + digit * weight;
        } else {
            assert(b == 0);
        }
    }

    let leading_byte: u8 = bytes[0];
    let leading_is_zero: bool = leading_byte == 48;
    let single_digit: bool = len == 1;
    assert(!leading_is_zero | single_digit);

    assert(reconstructed == value, "digits do not match value");

    (bytes, len)
}

#[test]
fn test_wrong_hint_passes_for_zero() {
    // The wrong hint *happens* to be correct when value == 0, so the
    // verifier should accept it: a sanity check that the test harness works.
    let (bytes, len): ([u8; 20], u32) = unsigned_to_string_verified_with_wrong_hint(0);
    assert(len == 1);
    assert(bytes[0] == 48);
}

#[test(should_fail_with = "digits do not match value")]
fn test_wrong_hint_fails_for_nonzero() {
    // For any non-zero input the wrong hint returns "0", so reconstruction
    // gives 0 != value and the verifier must reject.
    let _ = unsigned_to_string_verified_with_wrong_hint::<20>(42);
}

#[test(should_fail_with = "digits do not match value")]
fn test_wrong_hint_fails_for_large() {
    let _ = unsigned_to_string_verified_with_wrong_hint::<20>(1_000_000);
}
