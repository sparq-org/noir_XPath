//! Hash functions for SPARQL/XPath strings -- SPARQL SHA-2 digests +
//! circuit-native commitment hash
//!
//! [OPUS-4.8] Added for beads task sq-y73 (string/regex/hash XPath functions).
//! [FABLE-5] sq-3kd2g.4: SHA256/SHA384/SHA512 digests with canonical
//! lowercase-hex output added on the vendored noir-lang crates.
//!
//! ## Scope and honesty note
//!
//! SPARQL 1.1 defines the hash builtins `MD5`, `SHA1`, `SHA256`, `SHA384`,
//! `SHA512`, each mapping a lexical string to a **lowercase hex digest string**.
//!
//! **Implemented (the sound subset):** `SHA256`, `SHA384`, `SHA512` -- as
//! `sha256_hex` / `sha384_hex` / `sha512_hex` (plus `*_hex_bytes` variants for
//! `([u8; N], len)` byte-tuple pipelines). The digest cores are the official
//! noir-lang libraries, vendored under `vendor/sha256/` (tag v0.3.0) and
//! `vendor/sha512/` (SHA-512 + SHA-384) -- see their VENDOR-PROVENANCE.md for
//! pin, license, and the FIPS 180-4 known-answer verification on the pinned
//! toolchain. The stdlib itself exposes no byte-oriented digest at
//! `nargo 1.0.0-beta.21` (verified by probe: `std::hash::sha256`,
//! `std::keccak256`, `std::hash::poseidon2` all fail to resolve -- the crypto
//! hashes moved out to external crates), hence the vendored dependencies.
//!
//! **Deliberately NOT implemented:** `MD5` and `SHA-1`. Both are
//! cryptographically broken (MD5 collisions are trivial; SHA-1 is
//! `SHAttered`), there is no maintained noir-lang implementation of either,
//! and adding a bespoke bit-twiddled compression function to a ZK crypto
//! library would be a footgun: high constraint cost for a hash nobody should
//! rely on. This is a permanent, documented omission (SPARQL_COVERAGE.md
//! 17.4.6), not a pending TODO.
//!
//! ## What IS provided
//!
//! 1. `sha256_hex` / `sha384_hex` / `sha512_hex` (+ `*_hex_bytes`) -- the
//!    SPARQL `SHA256`/`SHA384`/`SHA512` builtins: digest of the string's
//!    logical UTF-8 bytes, returned as the canonical lowercase-hex
//!    `([u8; 2*D], len)` byte-array tuple.
//! 2. `string_pedersen_hash` -- a **circuit-native content hash** over the bytes
//!    of a string, returning a single `Field`. Pedersen is the hash the
//!    Barretenberg backend computes cheaply, and is exactly the right tool for
//!    the ZK use case the SPARQL hash builtins are usually a proxy for:
//!    *committing to / comparing string identity inside the proof* (e.g.
//!    proving two private literals are equal by equal commitment, or binding a
//!    literal to a public commitment). It is **not** MD5/SHA -- it is the
//!    appropriate substitute when the goal is an in-circuit content digest.
//!    Domain-separated so digests of different "kinds" cannot collide.
//!    NOTE: the SHA-2 lanes above cost tens of thousands of constraints per
//!    call; when the *semantics* needed is "commit to / compare a private
//!    string", `string_pedersen_hash` is the cheap, correct choice, and the
//!    SHA-2 lanes are for when a query's observable RESULT is the SPARQL
//!    hex digest itself.
//! 3. `bytes_to_lower_hex` -- the digest->hex-string formatter (the SPARQL hash
//!    return-value shape), shared by the SHA-2 lanes.
//!
//! ## Cost model
//!
//! `string_pedersen_hash` packs the `N` bytes into `ceil((N+8)/31)` field limbs
//! (31 bytes/limb keeps each limb < the BN254 modulus; an extra leading limb
//! carries the domain tag + logical length) and calls `pedersen_hash` once over
//! the limb array. Packing is O(N) cheap field MACs; the Pedersen cost is the
//! dominant term and is fixed-size in the number of limbs. See
//! `noir-circuit-patterns` "Triple commitment patterns" -- this is the
//! per-value sponge-style commitment, domain-separated.

/// Domain-separation tag for string content hashes. Mixed into the length limb
/// so a string digest can never collide with a digest of some other committed
/// object that happens to reuse `pedersen_hash` (cf. the domain-separation
/// discipline in `noir-circuit-patterns` / `verifiable-credentials-zk`).
global STRING_HASH_DOMAIN: Field = 0x73_70_61_72_71_5f_73_74; // "sparq_st"

/// Number of raw bytes packed into one BN254 field limb. 31 bytes < 2^248 stays
/// safely under the ~254-bit field modulus with no reduction ambiguity.
global BYTES_PER_LIMB: u32 = 31;

/// Logical length of a `str<N>` payload: bytes up to the first NUL terminator
/// (the capacity convention used across this crate).
fn logical_len<let N: u32>(bytes: [u8; N]) -> u32 {
    let mut len: u32 = 0;
    let mut ended = false;
    for i in 0..N {
        let is_zero = bytes[i] == 0;
        if (!ended) & (!is_zero) {
            len += 1;
        }
        ended = ended | is_zero;
    }
    len
}

/// Circuit-native content hash of a string's bytes -> `Field`.
///
/// Domain-separated and length-prefixed Pedersen hash over the byte payload.
/// Two strings hash equal **iff** they have the same logical length and the
/// same bytes in `[0, len)` (trailing capacity NULs are ignored because the
/// length is bound into the digest and bytes past `len` are not packed).
///
/// This is the right primitive for in-proof string identity / commitment. It is
/// NOT a SPARQL `SHA256`-compatible digest (see the module note).
///
/// `LIMBS` must satisfy `LIMBS * BYTES_PER_LIMB >= N` plus one for the header
/// limb; the function asserts the capacity so a too-small `LIMBS` fails loudly
/// rather than silently truncating.
pub fn string_pedersen_hash<let N: u32, let LIMBS: u32>(s: str<N>) -> Field {
    let bytes = s.as_bytes();
    let len = logical_len(bytes);

    // Header limb binds the domain tag and the logical length.
    let mut limbs: [Field; LIMBS] = [0; LIMBS];
    assert(LIMBS >= 1, "hash: need at least the header limb");
    limbs[0] = STRING_HASH_DOMAIN * 0x1_00_00_00_00 + (len as Field);

    // Pack the payload bytes (only those < len) into the remaining limbs,
    // BYTES_PER_LIMB per limb, big-endian within a limb.
    let payload_limbs = LIMBS - 1;
    assert(payload_limbs * BYTES_PER_LIMB >= N, "hash: LIMBS too small for string capacity N");

    for i in 0..N {
        // Only fold real payload bytes; bytes at/after len are skipped so the
        // digest depends only on the logical content.
        if (i as u32) < len {
            let limb_idx = 1 + ((i as u32) / BYTES_PER_LIMB);
            // Shift the running limb left one byte and add the new byte.
            limbs[limb_idx] = limbs[limb_idx] * 256 + (bytes[i] as Field);
        }
    }

    std::hash::pedersen_hash(limbs)
}

/// Convert a nibble (0-15) to its lowercase hex ASCII byte.
fn nibble_to_lower_hex(n: u8) -> u8 {
    if n < 10 {
        48 + n // '0'..'9'
    } else {
        97 + n - 10 // 'a'..'f'
    }
}

/// Format a digest byte array as a lowercase hex string -- the SPARQL hash
/// return-value shape (`MD5`/`SHA*` all return lowercase hex). Each input byte
/// becomes two hex chars, so `OUT` must be `>= 2*N`. Returns `([u8; OUT], len)`.
///
/// Provided so that, once a byte-digest primitive is available (vendored SHA-256
/// crate or a future stdlib re-add), the SPARQL `SHA256(?s)` facade is a
/// one-liner: hash to `[u8; 32]`, then `bytes_to_lower_hex::<32, 64>`.
pub fn bytes_to_lower_hex<let N: u32, let OUT: u32>(digest: [u8; N]) -> ([u8; OUT], u32) {
    let mut out: [u8; OUT] = [0; OUT];
    let mut out_len: u32 = 0;
    for i in 0..N {
        if out_len + 2 <= (OUT as u32) {
            let b = digest[i];
            out[out_len] = nibble_to_lower_hex((b >> 4) & 0x0F);
            out[out_len + 1] = nibble_to_lower_hex(b & 0x0F);
            out_len += 2;
        }
    }
    (out, out_len)
}

// ============================================================================
// SPARQL SHA-2 digests (canonical lowercase-hex output) -- sq-3kd2g.4 [FABLE-5]
//
// SPARQL 1.1 17.4.6: SHA256/SHA384/SHA512 map the UTF-8 bytes of the lexical
// form to a lowercase-hex digest string. The digest cores are the vendored
// noir-lang crates (vendor/sha256, vendor/sha512 -- FIPS 180-4 KAT-verified on
// the pinned toolchain); the hex formatting is `bytes_to_lower_hex`.
//
// Two shapes per algorithm, matching the crate's string conventions:
//  - `*_hex_bytes(bytes, len)`: byte-tuple pipeline input (compose with the
//    `([u8; N], u32)`-returning string builders). Hashes exactly
//    `bytes[0..len]`; asserts `len <= N` (fails loudly, never truncates).
//  - `*_hex(s: str<N>)`: convenience wrapper over the logical content of a
//    `str` (bytes before the first NUL -- the crate-wide capacity convention).
//
// The hex output is ALWAYS full-length (64/96/128 chars) with len == capacity;
// the tuple shape is kept for uniformity with the other string builders.
// ============================================================================

/// SPARQL `SHA256(?s)` over an explicit byte window: digest of `bytes[0..len]`
/// as a canonical lowercase-hex `([u8; 64], 64)` tuple.
pub fn sha256_hex_bytes<let N: u32>(bytes: [u8; N], len: u32) -> ([u8; 64], u32) {
    assert(len <= N, "sha256_hex_bytes: len exceeds buffer capacity");
    let digest: [u8; 32] = dep::sha256::sha256_var(bytes, len);
    bytes_to_lower_hex::<32, 64>(digest)
}

/// SPARQL `SHA256(?s)`: lowercase-hex SHA-256 digest of the string's logical
/// UTF-8 content (bytes before the first NUL).
pub fn sha256_hex<let N: u32>(s: str<N>) -> ([u8; 64], u32) {
    let bytes = s.as_bytes();
    sha256_hex_bytes(bytes, logical_len(bytes))
}

/// SPARQL `SHA384(?s)` over an explicit byte window: digest of `bytes[0..len]`
/// as a canonical lowercase-hex `([u8; 96], 96)` tuple.
pub fn sha384_hex_bytes<let N: u32>(bytes: [u8; N], len: u32) -> ([u8; 96], u32) {
    assert(len <= N, "sha384_hex_bytes: len exceeds buffer capacity");
    // from_parts asserts len <= N and zeroes the tail, so the digest depends
    // only on bytes[0..len].
    let msg: BoundedVec<u8, N> = BoundedVec::from_parts(bytes, len);
    let digest: [u8; 48] = dep::sha512::sha384::sha384_var(msg);
    bytes_to_lower_hex::<48, 96>(digest)
}

/// SPARQL `SHA384(?s)`: lowercase-hex SHA-384 digest of the string's logical
/// UTF-8 content (bytes before the first NUL).
pub fn sha384_hex<let N: u32>(s: str<N>) -> ([u8; 96], u32) {
    let bytes = s.as_bytes();
    sha384_hex_bytes(bytes, logical_len(bytes))
}

/// SPARQL `SHA512(?s)` over an explicit byte window: digest of `bytes[0..len]`
/// as a canonical lowercase-hex `([u8; 128], 128)` tuple.
pub fn sha512_hex_bytes<let N: u32>(bytes: [u8; N], len: u32) -> ([u8; 128], u32) {
    assert(len <= N, "sha512_hex_bytes: len exceeds buffer capacity");
    let msg: BoundedVec<u8, N> = BoundedVec::from_parts(bytes, len);
    let digest: [u8; 64] = dep::sha512::sha512::sha512_var(msg);
    bytes_to_lower_hex::<64, 128>(digest)
}

/// SPARQL `SHA512(?s)`: lowercase-hex SHA-512 digest of the string's logical
/// UTF-8 content (bytes before the first NUL).
pub fn sha512_hex<let N: u32>(s: str<N>) -> ([u8; 128], u32) {
    let bytes = s.as_bytes();
    sha512_hex_bytes(bytes, logical_len(bytes))
}

// ============================================================================
// Tests
// ============================================================================

/// Test helper: assert a `([u8; OUT], u32)` hex tuple equals an expected
/// full-capacity ASCII string.
fn assert_hex_eq<let OUT: u32>(actual: ([u8; OUT], u32), expected: str<OUT>) {
    let (bytes, len) = actual;
    assert(len == OUT);
    let exp = expected.as_bytes();
    for i in 0..OUT {
        assert(bytes[i] == exp[i]);
    }
}

#[test]
fn test_string_pedersen_hash_deterministic() {
    let a: str<5> = "hello";
    let b: str<5> = "hello";
    assert(string_pedersen_hash::<5, 2>(a) == string_pedersen_hash::<5, 2>(b));
}

#[test]
fn test_string_pedersen_hash_distinguishes() {
    let a: str<5> = "hello";
    let b: str<5> = "world";
    assert(string_pedersen_hash::<5, 2>(a) != string_pedersen_hash::<5, 2>(b));
}

#[test]
fn test_string_pedersen_hash_length_bound() {
    // "ab\0\0" (logical "ab") must NOT collide with "abc" -- length is bound in.
    let a: str<4> = "ab\0\0";
    let b: str<3> = "abc";
    assert(string_pedersen_hash::<4, 2>(a) != string_pedersen_hash::<3, 2>(b));
}

#[test]
fn test_string_pedersen_hash_ignores_trailing_capacity() {
    // Same logical content "ab" in different capacities hashes the same.
    let a: str<2> = "ab";
    let b: str<5> = "ab\0\0\0";
    assert(string_pedersen_hash::<2, 2>(a) == string_pedersen_hash::<5, 2>(b));
}

#[test]
fn test_bytes_to_lower_hex() {
    // 0xDE 0xAD 0xBE 0xEF -> "deadbeef"
    let digest: [u8; 4] = [0xDE, 0xAD, 0xBE, 0xEF];
    let (hex, len) = bytes_to_lower_hex::<4, 8>(digest);
    assert(len == 8);
    let expected = "deadbeef".as_bytes();
    for i in 0..8 {
        assert(hex[i] == expected[i]);
    }
}

#[test]
fn test_bytes_to_lower_hex_zero_and_max() {
    // 0x00 0xFF -> "00ff"
    let digest: [u8; 2] = [0x00, 0xFF];
    let (hex, len) = bytes_to_lower_hex::<2, 4>(digest);
    assert(len == 4);
    let expected = "00ff".as_bytes();
    for i in 0..4 {
        assert(hex[i] == expected[i]);
    }
}

// ---- SPARQL SHA-2 digests (sq-3kd2g.4) ----
//
// Expected values are FIPS 180-4 known-answer vectors for "abc" and the empty
// string, independently cross-checked against Python hashlib.

#[test]
fn test_sha256_hex_abc() {
    // SHA256("abc") -- FIPS 180-4 KAT; also the SPARQL 1.1 spec's own 17.4.6
    // hash-family example input.
    let s: str<3> = "abc";
    assert_hex_eq::<64>(
        sha256_hex(s),
        "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad",
    );
}

#[test]
fn test_sha256_hex_empty() {
    // SHA256("") = e3b0c442... (KAT for the empty message).
    let s: str<4> = "\0\0\0\0";
    assert_hex_eq::<64>(
        sha256_hex(s),
        "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    );
}

#[test]
fn test_sha256_hex_logical_length() {
    // Trailing capacity NULs are not part of the content: "abc\0\0" == "abc".
    let padded: str<5> = "abc\0\0";
    let exact: str<3> = "abc";
    let (a, alen) = sha256_hex(padded);
    let (b, blen) = sha256_hex(exact);
    assert(alen == blen);
    for i in 0..64 {
        assert(a[i] == b[i]);
    }
}

#[test]
fn test_sha256_hex_bytes_window() {
    // Byte-tuple lane hashes exactly bytes[0..len]: window "ab" out of "abX".
    let buf: [u8; 3] = [97, 98, 88];
    // SHA256("ab") KAT.
    assert_hex_eq::<64>(
        sha256_hex_bytes(buf, 2),
        "fb8e20fc2e4c3f248c60c39bd652f3c1347298bb977b8b4d5903b85055620603",
    );
}

#[test(should_fail_with = "len exceeds buffer capacity")]
fn test_sha256_hex_bytes_len_over_capacity_fails() {
    let buf: [u8; 2] = [97, 98];
    let _ = sha256_hex_bytes(buf, 3);
}

#[test]
fn test_sha384_hex_abc() {
    // SHA384("abc") -- FIPS 180-4 KAT.
    let s: str<3> = "abc";
    assert_hex_eq::<96>(
        sha384_hex(s),
        "cb00753f45a35e8bb5a03d699ac65007272c32ab0eded1631a8b605a43ff5bed8086072ba1e7cc2358baeca134c825a7",
    );
}

#[test]
fn test_sha384_hex_logical_length() {
    let padded: str<6> = "abc\0\0\0";
    let exact: str<3> = "abc";
    let (a, alen) = sha384_hex(padded);
    let (b, blen) = sha384_hex(exact);
    assert(alen == blen);
    for i in 0..96 {
        assert(a[i] == b[i]);
    }
}

#[test]
fn test_sha512_hex_abc() {
    // SHA512("abc") -- FIPS 180-4 KAT.
    let s: str<3> = "abc";
    assert_hex_eq::<128>(
        sha512_hex(s),
        "ddaf35a193617abacc417349ae20413112e6fa4e89a97ea20a9eeee64b55d39a2192992a274fc1a836ba3c23a3feebbd454d4423643ce80e2a9ac94fa54ca49f",
    );
}

#[test]
fn test_sha512_hex_empty() {
    // SHA512("") KAT.
    let s: str<2> = "\0\0";
    assert_hex_eq::<128>(
        sha512_hex(s),
        "cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e",
    );
}
