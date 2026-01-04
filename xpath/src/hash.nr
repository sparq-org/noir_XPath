//! Hash functions for XPath/SPARQL
//!
//! This module provides wrappers for cryptographic hash functions
//! available in Noir's standard library and community libraries.
//!
//! SPARQL 1.1 specifies the following hash functions:
//! - MD5, SHA1, SHA256, SHA384, SHA512
//!
//! However, Noir's standard library provides a different set of
//! hash functions optimized for ZK circuits:
//! - SHA256, Keccak256, Blake2s, Blake3, Poseidon, Pedersen
//!
//! Note: SPARQL hash functions return hexadecimal string representations,
//! but in ZK circuits we work with the raw byte/field outputs.

use std::hash::{blake2s, blake3, pedersen_hash, poseidon, poseidon2, sha256};

// ============================================================================
// SHA256 Hash Function
// ============================================================================

/// Computes the SHA-256 hash of the input byte array.
/// Returns a 32-byte hash.
///
/// This is the most commonly used hash function in SPARQL 1.1.
/// Note: SPARQL expects hexadecimal string output, but in ZK circuits
/// we return the raw 32-byte hash.
///
/// # Example
/// ```noir
/// let input: [u8; 5] = [104, 101, 108, 108, 111]; // "hello"
/// let hash = hash_sha256(input);
/// ```
pub fn hash_sha256<let N: u32>(input: [u8; N]) -> [u8; 32] {
    sha256(input)
}

// ============================================================================
// Keccak256 Hash Function
// ============================================================================

/// Computes the Keccak-256 hash of the input byte array.
/// Returns a 32-byte hash.
///
/// Keccak-256 is the hash function used in Ethereum.
/// This is different from SHA-3 (which is standardized Keccak with different padding).
///
/// # Example
/// ```noir
/// let input: [u8; 5] = [104, 101, 108, 108, 111]; // "hello"
/// let hash = hash_keccak256(input);
/// ```
pub fn hash_keccak256<let N: u32>(input: [u8; N]) -> [u8; 32] {
    std::hash::keccak256(input, N)
}

// ============================================================================
// Blake2s Hash Function
// ============================================================================

/// Computes the Blake2s hash of the input byte array.
/// Returns a 32-byte hash.
///
/// Blake2s is a fast, secure hash function optimized for 8-bit to 32-bit platforms.
/// It is widely used in ZK circuits due to its efficiency.
///
/// # Example
/// ```noir
/// let input: [u8; 5] = [104, 101, 108, 108, 111]; // "hello"
/// let hash = hash_blake2s(input);
/// ```
pub fn hash_blake2s<let N: u32>(input: [u8; N]) -> [u8; 32] {
    blake2s(input)
}

// ============================================================================
// Blake3 Hash Function
// ============================================================================

/// Computes the Blake3 hash of the input byte array.
/// Returns a 32-byte hash.
///
/// Blake3 is a highly parallelizable and efficient hash function,
/// making it well-suited for ZK applications.
///
/// # Example
/// ```noir
/// let input: [u8; 5] = [104, 101, 108, 108, 111]; // "hello"
/// let hash = hash_blake3(input);
/// ```
pub fn hash_blake3<let N: u32>(input: [u8; N]) -> [u8; 32] {
    blake3(input)
}

// ============================================================================
// Poseidon Hash Function (ZK-Friendly)
// ============================================================================

/// Computes the Poseidon hash of field elements.
/// Returns a single Field element as the hash.
///
/// Poseidon is a ZK-friendly hash function designed specifically
/// for efficient computation in zero-knowledge proof circuits.
/// It operates on Field elements rather than bytes.
///
/// # Example
/// ```noir
/// let input: [Field; 2] = [1, 2];
/// let hash = hash_poseidon(input);
/// ```
pub fn hash_poseidon<let N: u32>(input: [Field; N]) -> Field {
    poseidon::bn254::hash(input, N)
}

// ============================================================================
// Poseidon2 Hash Function (ZK-Friendly, Improved)
// ============================================================================

/// Computes the Poseidon2 hash of field elements.
/// Returns a single Field element as the hash.
///
/// Poseidon2 is an improved version of Poseidon with better
/// performance characteristics in ZK circuits.
///
/// Note: The API uses the struct-based pattern `Poseidon2::hash` as defined
/// in the Noir standard library.
///
/// # Example
/// ```noir
/// let input: [Field; 2] = [1, 2];
/// let hash = hash_poseidon2(input);
/// ```
pub fn hash_poseidon2<let N: u32>(input: [Field; N]) -> Field {
    poseidon2::Poseidon2::hash(input, N)
}

// ============================================================================
// Pedersen Hash Function (ZK-Friendly)
// ============================================================================

/// Computes the Pedersen hash of field elements.
/// Returns a single Field element as the hash.
///
/// Pedersen hash is commonly used in ZK applications for
/// commitment schemes and Merkle trees.
///
/// # Example
/// ```noir
/// let input: [Field; 2] = [1, 2];
/// let hash = hash_pedersen(input);
/// ```
pub fn hash_pedersen<let N: u32>(input: [Field; N]) -> Field {
    pedersen_hash(input)
}

// ============================================================================
// Utility Functions
// ============================================================================

/// Compares two 32-byte hash outputs for equality in constant time.
/// Returns true if both hashes are identical.
///
/// This function is implemented to be constant-time to prevent
/// timing-based side-channel attacks. It always compares all 32 bytes
/// regardless of when a difference is found.
///
/// # Example
/// ```noir
/// let hash1 = hash_sha256([104, 101, 108, 108, 111]);
/// let hash2 = hash_sha256([104, 101, 108, 108, 111]);
/// assert(hash_equal(hash1, hash2));
/// ```
pub fn hash_equal(a: [u8; 32], b: [u8; 32]) -> bool {
    // Constant-time comparison: accumulate XOR differences
    // If any byte differs, diff will be non-zero
    let mut diff: u8 = 0;
    for i in 0..32 {
        diff |= a[i] ^ b[i];
    }
    diff == 0
}
