//! XPath 2.0 String Functions
//!
//! This module implements XPath 2.0 string functions that work correctly in Noir.
//! These functions are required by SPARQL 1.1 Query Language.
//!
//! ## Working Functions
//!
//! The following functions work correctly and are exported:
//! - `string_length` - Returns the length as a number
//! - `starts_with` - Returns boolean
//! - `ends_with` - Returns boolean
//! - `contains` - Returns boolean
//!
//! ## Limitations
//!
//! **IMPORTANT**: Functions that need to create new strings from byte arrays
//! (substring, upper-case, lower-case, concat, etc.) cannot be implemented in Noir
//! because Noir doesn't provide a way to convert byte arrays back to strings at runtime.
//! These functions have been removed from this implementation.

/// fn:string-length - Returns the length of a string
/// XPath: fn:string-length($arg as xs:string?) as xs:integer
/// SPARQL: STRLEN(?str)
///
/// For fixed-size strings in Noir, this returns the actual length by counting
/// non-null bytes. If your strings always fill their capacity (no trailing nulls),
/// this will equal N.
pub fn string_length<let N: u32>(s: str<N>) -> u64 {
    let s_bytes = s.as_bytes();
    let mut len: u64 = 0;
    let mut ended = false;

    for i in 0..N {
        let byte = s_bytes[i];
        let is_zero = byte == 0;
        let increment = (!ended) & (!is_zero);
        len = len + (increment as u64);
        ended = ended | is_zero;
    }

    len
}

/// fn:starts-with - Returns true if a string starts with a given prefix
/// XPath: fn:starts-with($arg1 as xs:string?, $arg2 as xs:string?) as xs:boolean
/// SPARQL: STRSTARTS(?str, ?prefix)
pub fn starts_with<let N: u32, let M: u32>(s: str<N>, prefix: str<M>) -> bool {
    if M > N {
        false
    } else {
        let s_bytes = s.as_bytes();
        let prefix_bytes = prefix.as_bytes();
        let mut matches = true;

        for i in 0..M {
            if s_bytes[i] != prefix_bytes[i] {
                matches = false;
            }
        }

        matches
    }
}

/// fn:ends-with - Returns true if a string ends with a given suffix
/// XPath: fn:ends-with($arg1 as xs:string?, $arg2 as xs:string?) as xs:boolean
/// SPARQL: STRENDS(?str, ?suffix)
pub fn ends_with<let N: u32, let M: u32>(s: str<N>, suffix: str<M>) -> bool {
    if M > N {
        false
    } else {
        let s_bytes = s.as_bytes();
        let suffix_bytes = suffix.as_bytes();
        let start_pos = N - M;
        let mut matches = true;

        for i in 0..M {
            if s_bytes[start_pos + i] != suffix_bytes[i] {
                matches = false;
            }
        }

        matches
    }
}

/// Helper function to find index of substring
///
/// **Performance Note**: This function has O(N*M) time complexity and, due to Noir's
/// lack of early return/break, continues checking all positions even after finding a
/// match. For large strings, this could significantly impact proof generation time.
fn index_of<let N: u32, let M: u32>(s: str<N>, substring: str<M>) -> i64 {
    let mut result: i64 = -1;

    // Handle edge cases without early return
    let size_ok = M <= N;
    let empty_substring = M == 0;

    if empty_substring {
        result = 0;
    } else if size_ok {
        let s_bytes = s.as_bytes();
        let sub_bytes = substring.as_bytes();
        let mut found_index: i64 = -1;

        // Can't use break, so we iterate through all positions
        for i in 0..(N - M + 1) {
            let mut matches = true;
            for j in 0..M {
                if s_bytes[i + j] != sub_bytes[j] {
                    matches = false;
                }
            }
            // Only update if this is the first match
            if matches & (found_index == -1) {
                found_index = i as i64;
            }
        }
        result = found_index;
    }

    result
}

/// fn:contains - Returns true if a string contains a given substring
/// XPath: fn:contains($arg1 as xs:string?, $arg2 as xs:string?) as xs:boolean
/// SPARQL: CONTAINS(?str, ?substring)
pub fn contains<let N: u32, let M: u32>(s: str<N>, substring: str<M>) -> bool {
    index_of(s, substring) != -1
}

// ============================================================================
// String Comparison Functions
// ============================================================================

/// fn:compare - Compares two strings lexicographically
/// Returns -1 if s1 < s2, 0 if s1 == s2, 1 if s1 > s2
/// XPath: fn:compare($comparand1 as xs:string?, $comparand2 as xs:string?) as xs:integer?
pub fn compare<let N: u32, let M: u32>(s1: str<N>, s2: str<M>) -> i64 {
    let s1_bytes = s1.as_bytes();
    let s2_bytes = s2.as_bytes();

    // Determine the minimum length for comparison
    let min_len = if N < M { N } else { M };

    let mut result: i64 = 0;
    let mut determined = false;

    // Compare byte by byte
    for i in 0..min_len {
        if !determined {
            if s1_bytes[i] < s2_bytes[i] {
                result = -1;
                determined = true;
            } else if s1_bytes[i] > s2_bytes[i] {
                result = 1;
                determined = true;
            }
        }
    }

    // If all compared bytes are equal, shorter string comes first
    if !determined {
        if N < M {
            result = -1;
        } else if N > M {
            result = 1;
        }
        // else result stays 0 (strings are equal)
    }

    result
}

/// fn:codepoint-equal - Returns true if two strings are equal codepoint by codepoint
/// XPath: fn:codepoint-equal($comparand1 as xs:string?, $comparand2 as xs:string?) as xs:boolean?
/// This is equivalent to string equality for ASCII strings
pub fn codepoint_equal<let N: u32, let M: u32>(s1: str<N>, s2: str<M>) -> bool {
    if N != M {
        false
    } else {
        let s1_bytes = s1.as_bytes();
        let s2_bytes = s2.as_bytes();
        let mut equal = true;
        for i in 0..N {
            if s1_bytes[i] != s2_bytes[i] {
                equal = false;
            }
        }
        equal
    }
}

/// op:string-equal - Returns true if both strings are equal
/// XPath: op:string-equal($arg1 as xs:string, $arg2 as xs:string) as xs:boolean
pub fn string_equal<let N: u32, let M: u32>(s1: str<N>, s2: str<M>) -> bool {
    compare(s1, s2) == 0
}

/// op:string-less-than - Returns true if s1 is lexicographically less than s2
/// XPath: op:string-less-than($arg1 as xs:string, $arg2 as xs:string) as xs:boolean
pub fn string_less_than<let N: u32, let M: u32>(s1: str<N>, s2: str<M>) -> bool {
    compare(s1, s2) < 0
}

/// op:string-greater-than - Returns true if s1 is lexicographically greater than s2
/// XPath: op:string-greater-than($arg1 as xs:string, $arg2 as xs:string) as xs:boolean
pub fn string_greater_than<let N: u32, let M: u32>(s1: str<N>, s2: str<M>) -> bool {
    compare(s1, s2) > 0
}

/// String less than or equal
pub fn string_le<let N: u32, let M: u32>(s1: str<N>, s2: str<M>) -> bool {
    compare(s1, s2) <= 0
}

/// String greater than or equal
pub fn string_ge<let N: u32, let M: u32>(s1: str<N>, s2: str<M>) -> bool {
    compare(s1, s2) >= 0
}

// ============================================================================
// Codepoint Functions
// ============================================================================

/// fn:string-to-codepoints - Converts a string to a sequence of Unicode codepoints
/// XPath: fn:string-to-codepoints($arg as xs:string?) as xs:integer*
/// Note: For ASCII strings, each byte is a codepoint. Returns (array, length).
pub fn string_to_codepoints<let N: u32>(s: str<N>) -> ([u32; N], u32) {
    let s_bytes = s.as_bytes();
    let mut result: [u32; N] = [0; N];
    let mut len: u32 = 0;

    for i in 0..N {
        let byte = s_bytes[i];
        if byte != 0 {
            result[i] = byte as u32;
            len = (i + 1) as u32;
        }
    }

    (result, len)
}

// ============================================================================
// URI Comparison Functions (URIs are treated as strings)
// ============================================================================

/// op:anyURI-equal - Compare two URIs for equality
pub fn anyuri_equal<let N: u32, let M: u32>(uri1: str<N>, uri2: str<M>) -> bool {
    string_equal(uri1, uri2)
}

/// op:anyURI-less-than - Compare two URIs lexicographically
pub fn anyuri_less_than<let N: u32, let M: u32>(uri1: str<N>, uri2: str<M>) -> bool {
    string_less_than(uri1, uri2)
}

/// op:anyURI-greater-than - Compare two URIs lexicographically
pub fn anyuri_greater_than<let N: u32, let M: u32>(uri1: str<N>, uri2: str<M>) -> bool {
    string_greater_than(uri1, uri2)
}
