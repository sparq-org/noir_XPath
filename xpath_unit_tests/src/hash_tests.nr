//! Tests for hash functions

use dep::xpath::{
    hash_blake2s, hash_blake3, hash_equal, hash_keccak256, hash_pedersen, hash_poseidon,
    hash_poseidon2, hash_sha256,
};

// ============================================================================
// SHA256 Tests
// ============================================================================

#[test]
fn test_hash_sha256_empty() {
    // SHA256 of empty input
    let input: [u8; 0] = [];
    let hash = hash_sha256(input);
    // SHA256("") = e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
    assert(hash[0] == 0xe3);
    assert(hash[1] == 0xb0);
    assert(hash[31] == 0x55);
}

#[test]
fn test_hash_sha256_hello() {
    // SHA256 of "hello" = 2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824
    let input: [u8; 5] = [104, 101, 108, 108, 111]; // "hello"
    let hash = hash_sha256(input);
    assert(hash[0] == 0x2c);
    assert(hash[1] == 0xf2);
    assert(hash[31] == 0x24);
}

#[test]
fn test_hash_sha256_deterministic() {
    // Same input should produce same output
    let input: [u8; 4] = [1, 2, 3, 4];
    let hash1 = hash_sha256(input);
    let hash2 = hash_sha256(input);
    assert(hash_equal(hash1, hash2));
}

// ============================================================================
// Keccak256 Tests
// ============================================================================

#[test]
fn test_hash_keccak256_empty() {
    // Keccak256 of empty input
    let input: [u8; 0] = [];
    let hash = hash_keccak256(input);
    // Keccak256("") = c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470
    assert(hash[0] == 0xc5);
    assert(hash[1] == 0xd2);
    assert(hash[31] == 0x70);
}

#[test]
fn test_hash_keccak256_hello() {
    // Keccak256 of "hello" = 1c8aff950685c2ed4bc3174f3472287b56d9517b9c948127319a09a7a36deac8
    let input: [u8; 5] = [104, 101, 108, 108, 111]; // "hello"
    let hash = hash_keccak256(input);
    assert(hash[0] == 0x1c);
    assert(hash[1] == 0x8a);
    assert(hash[31] == 0xc8);
}

#[test]
fn test_hash_keccak256_deterministic() {
    let input: [u8; 4] = [1, 2, 3, 4];
    let hash1 = hash_keccak256(input);
    let hash2 = hash_keccak256(input);
    assert(hash_equal(hash1, hash2));
}

// ============================================================================
// Blake2s Tests
// ============================================================================

#[test]
fn test_hash_blake2s_empty() {
    let input: [u8; 0] = [];
    let hash = hash_blake2s(input);
    // Blake2s produces a 32-byte hash
    // Just verify it's a valid 32-byte output
    assert(hash.len() == 32);
}

#[test]
fn test_hash_blake2s_hello() {
    let input: [u8; 5] = [104, 101, 108, 108, 111]; // "hello"
    let hash = hash_blake2s(input);
    assert(hash.len() == 32);
}

#[test]
fn test_hash_blake2s_deterministic() {
    let input: [u8; 4] = [1, 2, 3, 4];
    let hash1 = hash_blake2s(input);
    let hash2 = hash_blake2s(input);
    assert(hash_equal(hash1, hash2));
}

// ============================================================================
// Blake3 Tests
// ============================================================================

#[test]
fn test_hash_blake3_empty() {
    let input: [u8; 0] = [];
    let hash = hash_blake3(input);
    assert(hash.len() == 32);
}

#[test]
fn test_hash_blake3_hello() {
    let input: [u8; 5] = [104, 101, 108, 108, 111]; // "hello"
    let hash = hash_blake3(input);
    assert(hash.len() == 32);
}

#[test]
fn test_hash_blake3_deterministic() {
    let input: [u8; 4] = [1, 2, 3, 4];
    let hash1 = hash_blake3(input);
    let hash2 = hash_blake3(input);
    assert(hash_equal(hash1, hash2));
}

// ============================================================================
// Poseidon Tests (ZK-Friendly)
// ============================================================================

#[test]
fn test_hash_poseidon_single() {
    let input: [Field; 1] = [42];
    let hash = hash_poseidon(input);
    // Poseidon returns a Field element
    // Just verify it produces a valid Field
    assert(hash != 0);
}

#[test]
fn test_hash_poseidon_multiple() {
    let input: [Field; 3] = [1, 2, 3];
    let hash = hash_poseidon(input);
    assert(hash != 0);
}

#[test]
fn test_hash_poseidon_deterministic() {
    let input: [Field; 2] = [100, 200];
    let hash1 = hash_poseidon(input);
    let hash2 = hash_poseidon(input);
    assert(hash1 == hash2);
}

#[test]
fn test_hash_poseidon_different_inputs() {
    let input1: [Field; 2] = [1, 2];
    let input2: [Field; 2] = [2, 1];
    let hash1 = hash_poseidon(input1);
    let hash2 = hash_poseidon(input2);
    // Different inputs should produce different hashes
    assert(hash1 != hash2);
}

// ============================================================================
// Poseidon2 Tests (Improved ZK-Friendly)
// ============================================================================

#[test]
fn test_hash_poseidon2_single() {
    let input: [Field; 1] = [42];
    let hash = hash_poseidon2(input);
    assert(hash != 0);
}

#[test]
fn test_hash_poseidon2_multiple() {
    let input: [Field; 3] = [1, 2, 3];
    let hash = hash_poseidon2(input);
    assert(hash != 0);
}

#[test]
fn test_hash_poseidon2_deterministic() {
    let input: [Field; 2] = [100, 200];
    let hash1 = hash_poseidon2(input);
    let hash2 = hash_poseidon2(input);
    assert(hash1 == hash2);
}

#[test]
fn test_hash_poseidon2_different_inputs() {
    let input1: [Field; 2] = [1, 2];
    let input2: [Field; 2] = [2, 1];
    let hash1 = hash_poseidon2(input1);
    let hash2 = hash_poseidon2(input2);
    assert(hash1 != hash2);
}

// ============================================================================
// Pedersen Tests (ZK-Friendly)
// ============================================================================

#[test]
fn test_hash_pedersen_single() {
    let input: [Field; 1] = [42];
    let hash = hash_pedersen(input);
    assert(hash != 0);
}

#[test]
fn test_hash_pedersen_multiple() {
    let input: [Field; 3] = [1, 2, 3];
    let hash = hash_pedersen(input);
    assert(hash != 0);
}

#[test]
fn test_hash_pedersen_deterministic() {
    let input: [Field; 2] = [100, 200];
    let hash1 = hash_pedersen(input);
    let hash2 = hash_pedersen(input);
    assert(hash1 == hash2);
}

#[test]
fn test_hash_pedersen_different_inputs() {
    let input1: [Field; 2] = [1, 2];
    let input2: [Field; 2] = [2, 1];
    let hash1 = hash_pedersen(input1);
    let hash2 = hash_pedersen(input2);
    assert(hash1 != hash2);
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
