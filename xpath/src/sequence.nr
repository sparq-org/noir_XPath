//! Sequence and aggregate functions for XPath/SPARQL
//!
//! Implements functions that operate on sequences of values.
//! In SPARQL context, these are typically used with GROUP BY.
//!
//! XPath functions implemented:
//! - fn:empty, fn:exists (sequence tests)
//! - fn:count (cardinality)
//! - fn:sum, fn:avg, fn:min, fn:max (aggregates for integers)
//!
//! Note: These work on fixed-size arrays in Noir. For variable-length
//! sequences, the caller must track the actual length.

// ============================================================================
// Sequence Test Functions
// ============================================================================

/// fn:empty for arrays
/// Returns true if the sequence is empty (length is 0)
pub fn is_empty<T, let N: u32>(arr: [T; N]) -> bool {
    N == 0
}

/// fn:exists for arrays
/// Returns true if the sequence is not empty (has at least one item)
pub fn exists<T, let N: u32>(arr: [T; N]) -> bool {
    N > 0
}

/// fn:count for arrays
/// Returns the number of items in the sequence
pub fn count<T, let N: u32>(_arr: [T; N]) -> u32 {
    N
}

// ============================================================================
// Integer Aggregate Functions
// ============================================================================

/// fn:sum for integer arrays
/// Returns the sum of all values
pub fn sum_int<let N: u32>(arr: [i64; N]) -> i64 {
    let mut total: i64 = 0;
    for i in 0..N {
        total += arr[i];
    }
    total
}

/// fn:avg for integer arrays (truncated to integer)
/// Returns the average value (integer division)
/// Panics if array is empty
pub fn avg_int<let N: u32>(arr: [i64; N]) -> i64 {
    assert(N > 0, "Cannot compute average of empty sequence");
    sum_int(arr) / (N as i64)
}

/// fn:min for integer arrays
/// Returns the minimum value
/// Panics if array is empty
pub fn min_int_seq<let N: u32>(arr: [i64; N]) -> i64 {
    assert(N > 0, "Cannot compute minimum of empty sequence");
    let mut result = arr[0];
    for i in 1..N {
        if arr[i] < result {
            result = arr[i];
        }
    }
    result
}

/// fn:max for integer arrays
/// Returns the maximum value
/// Panics if array is empty
pub fn max_int_seq<let N: u32>(arr: [i64; N]) -> i64 {
    assert(N > 0, "Cannot compute maximum of empty sequence");
    let mut result = arr[0];
    for i in 1..N {
        if arr[i] > result {
            result = arr[i];
        }
    }
    result
}

// ============================================================================
// Partial Sequence Functions (with explicit length)
// ============================================================================

/// Sum for arrays with explicit length
/// Only sums the first `len` elements
pub fn sum_int_partial<let N: u32>(arr: [i64; N], len: u32) -> i64 {
    assert(len <= N, "Length exceeds array size");
    let mut total: i64 = 0;
    for i in 0..N {
        if i < len {
            total += arr[i];
        }
    }
    total
}

/// Average for arrays with explicit length
pub fn avg_int_partial<let N: u32>(arr: [i64; N], len: u32) -> i64 {
    assert(len > 0, "Cannot compute average of empty sequence");
    assert(len <= N, "Length exceeds array size");
    sum_int_partial(arr, len) / (len as i64)
}

/// Minimum for arrays with explicit length
pub fn min_int_partial<let N: u32>(arr: [i64; N], len: u32) -> i64 {
    assert(len > 0, "Cannot compute minimum of empty sequence");
    assert(len <= N, "Length exceeds array size");
    let mut result = arr[0];
    for i in 1..N {
        if (i < len) & (arr[i] < result) {
            result = arr[i];
        }
    }
    result
}

/// Maximum for arrays with explicit length
pub fn max_int_partial<let N: u32>(arr: [i64; N], len: u32) -> i64 {
    assert(len > 0, "Cannot compute maximum of empty sequence");
    assert(len <= N, "Length exceeds array size");
    let mut result = arr[0];
    for i in 1..N {
        if (i < len) & (arr[i] > result) {
            result = arr[i];
        }
    }
    result
}

// ============================================================================
// Boolean Aggregate Functions
// ============================================================================

/// Returns true if all values are true (universal quantification)
pub fn all_true<let N: u32>(arr: [bool; N]) -> bool {
    let mut result = true;
    for i in 0..N {
        result &= arr[i];
    }
    result
}

/// Returns true if any value is true (existential quantification)
pub fn any_true<let N: u32>(arr: [bool; N]) -> bool {
    let mut result = false;
    for i in 0..N {
        result |= arr[i];
    }
    result
}

/// Count of true values in array
pub fn count_true<let N: u32>(arr: [bool; N]) -> u32 {
    let mut count: u32 = 0;
    for i in 0..N {
        if arr[i] {
            count += 1;
        }
    }
    count
}

// ============================================================================
// Sequence Access Functions
// ============================================================================

/// fn:head - Returns the first item in a sequence
/// Panics if the sequence is empty
pub fn head<T, let N: u32>(arr: [T; N]) -> T {
    assert(N > 0, "Cannot get head of empty sequence");
    arr[0]
}

/// fn:tail - Returns all items except the first
/// Returns an array of size N-1
pub fn tail<T, let N: u32, let M: u32>(arr: [T; N]) -> [T; M]
where
    T: Default,
{
    // M should equal N - 1, but we can't express that constraint directly
    assert(N > 0, "Cannot get tail of empty sequence");
    assert(M == N - 1, "Output array size must be N-1");
    let mut result: [T; M] = [T::default(); M];
    for i in 0..M {
        result[i] = arr[i + 1];
    }
    result
}

/// fn:reverse - Returns the sequence in reverse order
pub fn reverse<T, let N: u32>(arr: [T; N]) -> [T; N]
where
    T: Default,
{
    let mut result: [T; N] = [T::default(); N];
    for i in 0..N {
        result[i] = arr[N - 1 - i];
    }
    result
}

/// fn:index-of - Returns positions where a value occurs (1-indexed as per XPath)
/// Returns an array with found positions; unused positions are 0
pub fn index_of<T, let N: u32, let M: u32>(arr: [T; N], value: T) -> ([u32; M], u32)
where
    T: Eq,
{
    let mut result: [u32; M] = [0; M];
    let mut found_count: u32 = 0;
    for i in 0..N {
        if (arr[i] == value) & (found_count < M) {
            result[found_count] = (i + 1) as u32; // XPath uses 1-based indexing
            found_count += 1;
        }
    }
    (result, found_count)
}

/// fn:distinct-values - Returns unique values from a sequence
/// Returns (result_array, count_of_distinct_values)
pub fn distinct_values<T, let N: u32>(arr: [T; N]) -> ([T; N], u32)
where
    T: Eq + Default,
{
    let mut result: [T; N] = [T::default(); N];
    let mut count: u32 = 0;

    for i in 0..N {
        let mut is_duplicate = false;
        for j in 0..N {
            if (j < count) & (arr[i] == result[j]) {
                is_duplicate = true;
            }
        }
        if !is_duplicate {
            result[count] = arr[i];
            count += 1;
        }
    }
    (result, count)
}

/// fn:subsequence - Returns a subsequence starting at position (1-indexed)
/// start_pos: 1-indexed position to start from
/// length: number of items to return
pub fn subsequence<T, let N: u32, let M: u32>(arr: [T; N], start_pos: u32, length: u32) -> [T; M]
where
    T: Default,
{
    let mut result: [T; M] = [T::default(); M];
    // XPath uses 1-based indexing, convert to 0-based
    let start_idx = if start_pos > 0 { start_pos - 1 } else { 0 };

    for i in 0..M {
        let src_idx = start_idx + i;
        if (i < length) & (src_idx < N) {
            result[i] = arr[src_idx];
        }
    }
    result
}

/// fn:zero-or-one - Returns the argument if it has zero or one items, otherwise errors
/// For fixed-size arrays in Noir, this just checks the constraint
pub fn zero_or_one<T, let N: u32>(arr: [T; N]) -> [T; N] {
    assert(N <= 1, "Sequence contains more than one item");
    arr
}

/// fn:one-or-more - Returns the argument if it has one or more items, otherwise errors
pub fn one_or_more<T, let N: u32>(arr: [T; N]) -> [T; N] {
    assert(N >= 1, "Sequence is empty");
    arr
}

/// fn:exactly-one - Returns the argument if it has exactly one item, otherwise errors
pub fn exactly_one<T, let N: u32>(arr: [T; N]) -> [T; N] {
    assert(N == 1, "Sequence does not contain exactly one item");
    arr
}

// ============================================================================
// Tests
// ============================================================================

#[test]
fn test_sequence_empty_exists() {
    let empty: [i64; 0] = [];
    let non_empty: [i64; 3] = [1, 2, 3];

    assert(is_empty(empty) == true);
    assert(is_empty(non_empty) == false);

    assert(exists(empty) == false);
    assert(exists(non_empty) == true);
}

#[test]
fn test_count() {
    let arr: [i64; 5] = [1, 2, 3, 4, 5];
    assert(count(arr) == 5);

    let empty: [i64; 0] = [];
    assert(count(empty) == 0);
}

#[test]
fn test_sum_int() {
    let arr: [i64; 5] = [1, 2, 3, 4, 5];
    assert(sum_int(arr) == 15);

    let negative: [i64; 3] = [-1, -2, 3];
    assert(sum_int(negative) == 0);
}

#[test]
fn test_avg_int() {
    let arr: [i64; 5] = [10, 20, 30, 40, 50];
    assert(avg_int(arr) == 30);

    // Integer division truncates
    let arr2: [i64; 3] = [1, 2, 3];
    assert(avg_int(arr2) == 2); // (1+2+3)/3 = 2
}

#[test]
fn test_min_max_int_seq() {
    let arr: [i64; 5] = [3, 1, 4, 1, 5];
    assert(min_int_seq(arr) == 1);
    assert(max_int_seq(arr) == 5);

    let negative: [i64; 3] = [-5, 0, 5];
    assert(min_int_seq(negative) == -5);
    assert(max_int_seq(negative) == 5);
}

#[test]
fn test_partial_aggregates() {
    let arr: [i64; 5] = [10, 20, 30, 40, 50];

    // Sum first 3 elements
    assert(sum_int_partial(arr, 3) == 60);

    // Average of first 2
    assert(avg_int_partial(arr, 2) == 15);

    // Min/max of first 3
    assert(min_int_partial(arr, 3) == 10);
    assert(max_int_partial(arr, 3) == 30);
}

#[test]
fn test_boolean_aggregates() {
    let all_t: [bool; 3] = [true, true, true];
    let some_t: [bool; 3] = [true, false, true];
    let all_f: [bool; 3] = [false, false, false];

    assert(all_true(all_t) == true);
    assert(all_true(some_t) == false);
    assert(all_true(all_f) == false);

    assert(any_true(all_t) == true);
    assert(any_true(some_t) == true);
    assert(any_true(all_f) == false);

    assert(count_true(all_t) == 3);
    assert(count_true(some_t) == 2);
    assert(count_true(all_f) == 0);
}

#[test]
fn test_head() {
    let arr: [i64; 3] = [10, 20, 30];
    assert(head(arr) == 10);
}

#[test]
fn test_reverse() {
    let arr: [i64; 4] = [1, 2, 3, 4];
    let reversed = reverse(arr);
    assert(reversed[0] == 4);
    assert(reversed[1] == 3);
    assert(reversed[2] == 2);
    assert(reversed[3] == 1);
}

#[test]
fn test_distinct_values() {
    let arr: [i64; 5] = [1, 2, 1, 3, 2];
    let (result, count) = distinct_values(arr);
    assert(count == 3);
    assert(result[0] == 1);
    assert(result[1] == 2);
    assert(result[2] == 3);
}
