//! Tests for SPARQL 1.1 hash functions (Section 17.4.6)

use dep::xpath::{bytes_to_hex, hash_equal, hex_to_bytes, sha256_bytes, string_to_bytes};

// ============================================================================
// SHA256 Tests (SPARQL SHA256 function)
// ============================================================================

#[test]
fn test_sha256_empty() {
    // SHA256 of empty input
    let input: [u8; 0] = [];
    let hash = sha256_bytes(input);
    // SHA256("") = e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
    assert(hash[0] == 0xe3);
    assert(hash[1] == 0xb0);
    assert(hash[31] == 0x55);
}

#[test]
fn test_sha256_hello() {
    // SHA256 of "hello" = 2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824
    let input: [u8; 5] = [104, 101, 108, 108, 111]; // "hello"
    let hash = sha256_bytes(input);
    assert(hash[0] == 0x2c);
    assert(hash[1] == 0xf2);
    assert(hash[31] == 0x24);
}

#[test]
fn test_sha256_deterministic() {
    // Same input should produce same output
    let input: [u8; 4] = [1, 2, 3, 4];
    let hash1 = sha256_bytes(input);
    let hash2 = sha256_bytes(input);
    assert(hash_equal(hash1, hash2));
}

// ============================================================================
// String to Bytes Conversion Tests
// ============================================================================

#[test]
fn test_string_to_bytes_hello() {
    let bytes = string_to_bytes("hello");
    assert(bytes[0] == 104); // 'h'
    assert(bytes[1] == 101); // 'e'
    assert(bytes[2] == 108); // 'l'
    assert(bytes[3] == 108); // 'l'
    assert(bytes[4] == 111); // 'o'
}

#[test]
fn test_string_to_bytes_empty() {
    let bytes: [u8; 0] = string_to_bytes("");
    assert(bytes.len() == 0);
}

#[test]
fn test_string_to_bytes_single_char() {
    let bytes = string_to_bytes("a");
    assert(bytes[0] == 97); // 'a'
}

// ============================================================================
// Bytes to Hex Conversion Tests
// ============================================================================

#[test]
fn test_bytes_to_hex_zeros() {
    let bytes: [u8; 32] = [0; 32];
    let hex = bytes_to_hex(bytes);
    // All zeros should produce "00" repeated 32 times
    for i in 0..64 {
        assert(hex[i] == 48); // '0'
    }
}

#[test]
fn test_bytes_to_hex_ff() {
    let mut bytes: [u8; 32] = [0; 32];
    bytes[0] = 0xff;
    let hex = bytes_to_hex(bytes);
    // First byte 0xff -> "ff"
    assert(hex[0] == 102); // 'f'
    assert(hex[1] == 102); // 'f'
}

#[test]
fn test_bytes_to_hex_sha256_hello() {
    // SHA256 of "hello" = 2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824
    let input: [u8; 5] = [104, 101, 108, 108, 111]; // "hello"
    let hash = sha256_bytes(input);
    let hex = bytes_to_hex(hash);
    // First four hex chars should be "2cf2"
    assert(hex[0] == 50); // '2'
    assert(hex[1] == 99); // 'c'
    assert(hex[2] == 102); // 'f'
    assert(hex[3] == 50); // '2'
}

// ============================================================================
// Hex to Bytes Conversion Tests
// ============================================================================

#[test]
fn test_hex_to_bytes_zeros() {
    // "00" repeated 32 times
    let hex: [u8; 64] = [48; 64]; // all '0's
    let bytes = hex_to_bytes(hex);
    for i in 0..32 {
        assert(bytes[i] == 0);
    }
}

#[test]
fn test_hex_to_bytes_ff() {
    // "ff" followed by "00"s
    let mut hex: [u8; 64] = [48; 64]; // all '0's
    hex[0] = 102; // 'f'
    hex[1] = 102; // 'f'
    let bytes = hex_to_bytes(hex);
    assert(bytes[0] == 0xff);
    assert(bytes[1] == 0);
}

#[test]
fn test_hex_to_bytes_uppercase() {
    // Test uppercase hex characters "FF"
    let mut hex: [u8; 64] = [48; 64]; // all '0's
    hex[0] = 70; // 'F'
    hex[1] = 70; // 'F'
    let bytes = hex_to_bytes(hex);
    assert(bytes[0] == 0xff);
}

#[test]
fn test_bytes_to_hex_roundtrip() {
    // Test that bytes -> hex -> bytes is identity
    let original: [u8; 32] = [
        0x2c, 0xf2, 0x4d, 0xba, 0x5f, 0xb0, 0xa3, 0x0e, 0x26, 0xe8, 0x3b, 0x2a, 0xc5, 0xb9, 0xe2,
        0x9e, 0x1b, 0x16, 0x1e, 0x5c, 0x1f, 0xa7, 0x42, 0x5e, 0x73, 0x04, 0x33, 0x62, 0x93, 0x8b,
        0x98, 0x24,
    ];
    let hex = bytes_to_hex(original);
    let recovered = hex_to_bytes(hex);
    assert(hash_equal(original, recovered));
}

// ============================================================================
// Hash Equality Utility Tests
// ============================================================================

#[test]
fn test_hash_equal_same() {
    let hash1: [u8; 32] = [1; 32];
    let hash2: [u8; 32] = [1; 32];
    assert(hash_equal(hash1, hash2));
}

#[test]
fn test_hash_equal_different() {
    let hash1: [u8; 32] = [1; 32];
    let mut hash2: [u8; 32] = [1; 32];
    hash2[0] = 2;
    assert(!hash_equal(hash1, hash2));
}

#[test]
fn test_hash_equal_all_zeros() {
    let hash1: [u8; 32] = [0; 32];
    let hash2: [u8; 32] = [0; 32];
    assert(hash_equal(hash1, hash2));
}

#[test]
fn test_hash_equal_last_byte_different() {
    let hash1: [u8; 32] = [0; 32];
    let mut hash2: [u8; 32] = [0; 32];
    hash2[31] = 1;
    assert(!hash_equal(hash1, hash2));
}

// ============================================================================
// Integration Tests: Full SPARQL SHA256 workflow
// ============================================================================

#[test]
fn test_sparql_sha256_workflow() {
    // SPARQL query: SELECT SHA256("hello")
    // Expected result: "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824"

    // Step 1: Convert string to bytes
    let input_bytes = string_to_bytes("hello");

    // Step 2: Compute SHA256 hash
    let hash = sha256_bytes(input_bytes);

    // Step 3: Convert to hex string
    let hex_result = bytes_to_hex(hash);

    // Verify first few characters: "2cf2..."
    assert(hex_result[0] == 50); // '2'
    assert(hex_result[1] == 99); // 'c'
    assert(hex_result[2] == 102); // 'f'
    assert(hex_result[3] == 50); // '2'
}
