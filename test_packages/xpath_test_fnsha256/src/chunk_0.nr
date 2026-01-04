//! Test chunk 0 for SPARQL SHA256 hash function
//! Contains test cases for SHA256, string_to_bytes, bytes_to_hex, hex_to_bytes

use dep::xpath::{sha256_bytes, string_to_bytes, bytes_to_hex, hex_to_bytes, hash_equal};

// ============================================================================
// SHA256 Basic Tests (SPARQL SHA256 function)
// ============================================================================

#[test]
fn sha256_empty_string() {
    // SHA256("") = e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
    let input: [u8; 0] = [];
    let hash = sha256_bytes(input);
    assert(hash[0] == 0xe3);
    assert(hash[1] == 0xb0);
    assert(hash[2] == 0xc4);
    assert(hash[3] == 0x42);
    assert(hash[31] == 0x55);
}

#[test]
fn sha256_hello() {
    // SHA256("hello") = 2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824
    let input: [u8; 5] = [104, 101, 108, 108, 111]; // "hello"
    let hash = sha256_bytes(input);
    assert(hash[0] == 0x2c);
    assert(hash[1] == 0xf2);
    assert(hash[2] == 0x4d);
    assert(hash[3] == 0xba);
    assert(hash[31] == 0x24);
}

#[test]
fn sha256_abc() {
    // SHA256("abc") = ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad
    let input: [u8; 3] = [97, 98, 99]; // "abc"
    let hash = sha256_bytes(input);
    assert(hash[0] == 0xba);
    assert(hash[1] == 0x78);
    assert(hash[2] == 0x16);
    assert(hash[3] == 0xbf);
    assert(hash[31] == 0xad);
}

#[test]
fn sha256_single_a() {
    // SHA256("a") = ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb
    let input: [u8; 1] = [97]; // "a"
    let hash = sha256_bytes(input);
    assert(hash[0] == 0xca);
    assert(hash[1] == 0x97);
    assert(hash[2] == 0x81);
    assert(hash[3] == 0x12);
    assert(hash[31] == 0xbb);
}

#[test]
fn sha256_deterministic() {
    // Same input should always produce same output
    let input: [u8; 4] = [1, 2, 3, 4];
    let hash1 = sha256_bytes(input);
    let hash2 = sha256_bytes(input);
    assert(hash_equal(hash1, hash2));
}

#[test]
fn sha256_different_inputs_produce_different_hashes() {
    let input1: [u8; 3] = [1, 2, 3];
    let input2: [u8; 3] = [1, 2, 4];
    let hash1 = sha256_bytes(input1);
    let hash2 = sha256_bytes(input2);
    assert(!hash_equal(hash1, hash2));
}

// ============================================================================
// String to Bytes Conversion Tests
// ============================================================================

#[test]
fn string_to_bytes_hello() {
    let bytes = string_to_bytes("hello");
    assert(bytes[0] == 104); // 'h'
    assert(bytes[1] == 101); // 'e'
    assert(bytes[2] == 108); // 'l'
    assert(bytes[3] == 108); // 'l'
    assert(bytes[4] == 111); // 'o'
}

#[test]
fn string_to_bytes_empty() {
    let bytes: [u8; 0] = string_to_bytes("");
    assert(bytes.len() == 0);
}

#[test]
fn string_to_bytes_single_char() {
    let bytes = string_to_bytes("a");
    assert(bytes[0] == 97); // 'a'
}

#[test]
fn string_to_bytes_digits() {
    let bytes = string_to_bytes("123");
    assert(bytes[0] == 49); // '1'
    assert(bytes[1] == 50); // '2'
    assert(bytes[2] == 51); // '3'
}

// ============================================================================
// Bytes to Hex Conversion Tests
// ============================================================================

#[test]
fn bytes_to_hex_zeros() {
    let bytes: [u8; 32] = [0; 32];
    let hex = bytes_to_hex(bytes);
    // All zeros should produce "00" repeated 32 times
    for i in 0..64 {
        assert(hex[i] == 48); // '0'
    }
}

#[test]
fn bytes_to_hex_ff() {
    let mut bytes: [u8; 32] = [0; 32];
    bytes[0] = 0xff;
    let hex = bytes_to_hex(bytes);
    // First byte 0xff -> "ff"
    assert(hex[0] == 102); // 'f'
    assert(hex[1] == 102); // 'f'
}

#[test]
fn bytes_to_hex_0a() {
    let mut bytes: [u8; 32] = [0; 32];
    bytes[0] = 0x0a;
    let hex = bytes_to_hex(bytes);
    // First byte 0x0a -> "0a"
    assert(hex[0] == 48); // '0'
    assert(hex[1] == 97); // 'a'
}

#[test]
fn bytes_to_hex_sha256_hello() {
    // SHA256 of "hello" = 2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824
    let input: [u8; 5] = [104, 101, 108, 108, 111]; // "hello"
    let hash = sha256_bytes(input);
    let hex = bytes_to_hex(hash);
    // First four hex chars should be "2cf2"
    assert(hex[0] == 50);  // '2'
    assert(hex[1] == 99);  // 'c'
    assert(hex[2] == 102); // 'f'
    assert(hex[3] == 50);  // '2'
}

// ============================================================================
// Hex to Bytes Conversion Tests
// ============================================================================

#[test]
fn hex_to_bytes_zeros() {
    // "00" repeated 32 times
    let hex: [u8; 64] = [48; 64]; // all '0's
    let bytes = hex_to_bytes(hex);
    for i in 0..32 {
        assert(bytes[i] == 0);
    }
}

#[test]
fn hex_to_bytes_ff() {
    // "ff" followed by "00"s
    let mut hex: [u8; 64] = [48; 64]; // all '0's
    hex[0] = 102; // 'f'
    hex[1] = 102; // 'f'
    let bytes = hex_to_bytes(hex);
    assert(bytes[0] == 0xff);
    assert(bytes[1] == 0);
}

#[test]
fn hex_to_bytes_uppercase_ff() {
    // Test uppercase hex characters "FF"
    let mut hex: [u8; 64] = [48; 64]; // all '0's
    hex[0] = 70; // 'F'
    hex[1] = 70; // 'F'
    let bytes = hex_to_bytes(hex);
    assert(bytes[0] == 0xff);
}

#[test]
fn hex_to_bytes_mixed_case() {
    // Test mixed case "Af"
    let mut hex: [u8; 64] = [48; 64]; // all '0's
    hex[0] = 65; // 'A'
    hex[1] = 102; // 'f'
    let bytes = hex_to_bytes(hex);
    assert(bytes[0] == 0xaf);
}

// ============================================================================
// Roundtrip Tests
// ============================================================================

#[test]
fn bytes_to_hex_roundtrip() {
    // Test that bytes -> hex -> bytes is identity
    let original: [u8; 32] = [
        0x2c, 0xf2, 0x4d, 0xba, 0x5f, 0xb0, 0xa3, 0x0e,
        0x26, 0xe8, 0x3b, 0x2a, 0xc5, 0xb9, 0xe2, 0x9e,
        0x1b, 0x16, 0x1e, 0x5c, 0x1f, 0xa7, 0x42, 0x5e,
        0x73, 0x04, 0x33, 0x62, 0x93, 0x8b, 0x98, 0x24
    ];
    let hex = bytes_to_hex(original);
    let recovered = hex_to_bytes(hex);
    assert(hash_equal(original, recovered));
}

#[test]
fn sha256_string_to_hex_workflow() {
    // Full SPARQL SHA256 workflow: string -> bytes -> hash -> hex
    let input_bytes = string_to_bytes("hello");
    let hash = sha256_bytes(input_bytes);
    let hex = bytes_to_hex(hash);
    
    // Verify first few characters: "2cf2..."
    assert(hex[0] == 50);  // '2'
    assert(hex[1] == 99);  // 'c'
    assert(hex[2] == 102); // 'f'
    assert(hex[3] == 50);  // '2'
}

// ============================================================================
// Hash Equality Tests
// ============================================================================

#[test]
fn hash_equal_same() {
    let hash1: [u8; 32] = [1; 32];
    let hash2: [u8; 32] = [1; 32];
    assert(hash_equal(hash1, hash2));
}

#[test]
fn hash_equal_different() {
    let hash1: [u8; 32] = [1; 32];
    let mut hash2: [u8; 32] = [1; 32];
    hash2[0] = 2;
    assert(!hash_equal(hash1, hash2));
}

#[test]
fn hash_equal_all_zeros() {
    let hash1: [u8; 32] = [0; 32];
    let hash2: [u8; 32] = [0; 32];
    assert(hash_equal(hash1, hash2));
}

#[test]
fn hash_equal_last_byte_different() {
    let hash1: [u8; 32] = [0; 32];
    let mut hash2: [u8; 32] = [0; 32];
    hash2[31] = 1;
    assert(!hash_equal(hash1, hash2));
}

#[test]
fn hash_equal_middle_byte_different() {
    let hash1: [u8; 32] = [0; 32];
    let mut hash2: [u8; 32] = [0; 32];
    hash2[15] = 1;
    assert(!hash_equal(hash1, hash2));
}
