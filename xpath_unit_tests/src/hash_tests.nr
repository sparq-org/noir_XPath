//! Unit tests for the circuit-native string hash + hex formatter.
//!
//! [OPUS-4.8] sq-y73. `string_pedersen_hash` is a content commitment (NOT a
//! SPARQL MD5/SHA* digest -- those have no stdlib primitive at the pinned
//! toolchain; see xpath/src/hash.nr). `bytes_to_lower_hex` is the SPARQL hash
//! return-value (lowercase hex) formatter, ready to wrap a future byte digest.

use dep::xpath::{bytes_to_lower_hex, string_pedersen_hash};

#[test]
fn test_pedersen_hash_equal_inputs_via_api() {
    let a: str<6> = "sparql";
    let b: str<6> = "sparql";
    assert(string_pedersen_hash::<6, 2>(a) == string_pedersen_hash::<6, 2>(b));
}

#[test]
fn test_pedersen_hash_distinct_inputs_via_api() {
    let a: str<6> = "sparql";
    let b: str<6> = "sparqm";
    assert(string_pedersen_hash::<6, 2>(a) != string_pedersen_hash::<6, 2>(b));
}

#[test]
fn test_pedersen_hash_collision_resistance_length() {
    // "ab" vs "ab " (trailing space) must differ -- the space is real content.
    let a: str<3> = "ab\0";
    let b: str<3> = "ab ";
    assert(string_pedersen_hash::<3, 2>(a) != string_pedersen_hash::<3, 2>(b));
}

#[test]
fn test_hex_formatter_via_api() {
    // 0x0f 0xa0 -> "0fa0"
    let digest: [u8; 2] = [0x0F, 0xA0];
    let (hex, len) = bytes_to_lower_hex::<2, 4>(digest);
    assert(len == 4);
    let expected = "0fa0".as_bytes();
    for i in 0..4 {
        assert(hex[i] == expected[i]);
    }
}

// ============================================================================
// [FABLE-5] sq-3kd2g.4: SPARQL SHA-2 digests via the public API.
// FIPS 180-4 KATs, independently cross-checked against Python hashlib.
// ============================================================================

#[test]
fn test_sha256_hex_via_api() {
    let s: str<3> = "abc";
    let (hex, len) = dep::xpath::sha256_hex(s);
    assert(len == 64);
    let expected = "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad".as_bytes();
    for i in 0..64 {
        assert(hex[i] == expected[i]);
    }
}

#[test]
fn test_sha384_hex_via_api() {
    let s: str<3> = "abc";
    let (hex, len) = dep::xpath::sha384_hex(s);
    assert(len == 96);
    let expected = "cb00753f45a35e8bb5a03d699ac65007272c32ab0eded1631a8b605a43ff5bed8086072ba1e7cc2358baeca134c825a7"
        .as_bytes();
    for i in 0..96 {
        assert(hex[i] == expected[i]);
    }
}

#[test]
fn test_sha512_hex_via_api() {
    let s: str<3> = "abc";
    let (hex, len) = dep::xpath::sha512_hex(s);
    assert(len == 128);
    let expected = "ddaf35a193617abacc417349ae20413112e6fa4e89a97ea20a9eeee64b55d39a2192992a274fc1a836ba3c23a3feebbd454d4423643ce80e2a9ac94fa54ca49f"
        .as_bytes();
    for i in 0..128 {
        assert(hex[i] == expected[i]);
    }
}

#[test]
fn test_sha256_hex_bytes_composes_with_string_builders() {
    // SHA256 over a ([u8; N], len) tuple produced by a string builder:
    // upper_case("abc") = "ABC"; SHA256("ABC") =
    // b5d4045c3f466fa91fe2cc6abe79232a1a57cdf104f7a26e716e0a1e2789df78
    // (Python hashlib cross-check).
    let s: str<3> = "abc";
    let (up, up_len) = dep::xpath::upper_case(s);
    let (hex, len) = dep::xpath::sha256_hex_bytes(up, up_len);
    assert(len == 64);
    let expected = "b5d4045c3f466fa91fe2cc6abe79232a1a57cdf104f7a26e716e0a1e2789df78".as_bytes();
    for i in 0..64 {
        assert(hex[i] == expected[i]);
    }
}
