//! Hash functions for XPath/SPARQL
//!
//! This module provides cryptographic hash functions as specified by SPARQL 1.1.
//!
//! SPARQL 1.1 specifies the following hash functions (Section 17.4.6):
//! - MD5, SHA1, SHA256, SHA384, SHA512
//!
//! Currently, only SHA256 is available in Noir's standard library.
//! Other hash functions (MD5, SHA1, SHA384, SHA512) are not implemented.
//!
//! SPARQL hash functions return lowercase hexadecimal strings.
//! This module provides both raw byte output and hex string conversion functions.

use std::hash::sha256;

// ============================================================================
// SHA256 Hash Function (SPARQL 1.1)
// ============================================================================

/// Computes the SHA-256 hash of the input byte array.
/// Returns a 32-byte hash as raw bytes.
///
/// This corresponds to SPARQL's SHA256() function.
/// Use `bytes_to_hex` to convert the result to a hex string for SPARQL compatibility.
///
/// # Example
/// ```noir
/// let input: [u8; 5] = [104, 101, 108, 108, 111]; // "hello"
/// let hash = sha256_bytes(input);
/// let hex = bytes_to_hex(hash);
/// ```
pub fn sha256_bytes<let N: u32>(input: [u8; N]) -> [u8; 32] {
    sha256(input)
}

// ============================================================================
// String/Bytes Conversion Functions
// ============================================================================

/// Converts a string literal to a byte array.
/// This is useful for hashing string inputs in SPARQL.
///
/// # Example
/// ```noir
/// let bytes = string_to_bytes("hello");
/// let hash = sha256_bytes(bytes);
/// ```
pub fn string_to_bytes<let N: u32>(s: str<N>) -> [u8; N] {
    s.as_bytes()
}

/// Converts a single byte to its two-character lowercase hex representation.
/// Returns an array of 2 bytes representing the hex characters.
fn byte_to_hex(b: u8) -> [u8; 2] {
    let hex_chars: [u8; 16] = [
        48, 49, 50, 51, 52, 53, 54, 55, // '0'-'7'
        56, 57, 97, 98, 99, 100, 101, 102, // '8'-'9', 'a'-'f'
    ];
    let high = (b >> 4) & 0x0f;
    let low = b & 0x0f;
    [hex_chars[high], hex_chars[low]]
}

/// Converts a 32-byte hash to a 64-character lowercase hex string.
/// This produces the SPARQL-compatible hex string output.
///
/// # Example
/// ```noir
/// let hash = sha256_bytes([104, 101, 108, 108, 111]); // "hello"
/// let hex = bytes_to_hex(hash);
/// // hex is "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824"
/// ```
pub fn bytes_to_hex(bytes: [u8; 32]) -> [u8; 64] {
    let mut hex: [u8; 64] = [0; 64];
    for i in 0..32 {
        let pair = byte_to_hex(bytes[i]);
        hex[i * 2] = pair[0];
        hex[i * 2 + 1] = pair[1];
    }
    hex
}

/// Converts a single hex character to its numeric value (0-15).
/// Returns the value or 0 for invalid characters.
fn hex_char_to_value(c: u8) -> u8 {
    // Character ranges are non-overlapping:
    // '0'-'9' (48-57), 'A'-'F' (65-70), 'a'-'f' (97-102)
    let is_digit = (c >= 48) & (c <= 57);
    let is_upper = (c >= 65) & (c <= 70);
    let is_lower = (c >= 97) & (c <= 102);

    let digit_val = c - 48; // For '0'-'9'
    let upper_val = c - 65 + 10; // For 'A'-'F'
    let lower_val = c - 97 + 10; // For 'a'-'f'

    // Select the appropriate value based on character type
    // Only one condition can be true at a time due to non-overlapping ranges
    let mut result: u8 = 0;
    if is_digit {
        result = digit_val;
    }
    if is_upper {
        result = upper_val;
    }
    if is_lower {
        result = lower_val;
    }
    result
}

/// Converts a 64-character hex string to a 32-byte array.
/// This is useful for parsing hex-encoded hash values.
///
/// # Example
/// ```noir
/// let hex: [u8; 64] = [...]; // hex-encoded hash
/// let bytes = hex_to_bytes(hex);
/// ```
pub fn hex_to_bytes(hex: [u8; 64]) -> [u8; 32] {
    let mut bytes: [u8; 32] = [0; 32];
    for i in 0..32 {
        let high = hex_char_to_value(hex[i * 2]);
        let low = hex_char_to_value(hex[i * 2 + 1]);
        bytes[i] = (high << 4) | low;
    }
    bytes
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
/// let hash1 = sha256_bytes([104, 101, 108, 108, 111]);
/// let hash2 = sha256_bytes([104, 101, 108, 108, 111]);
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
