//! Numeric functions and operators for XPath/SPARQL
//!
//! Implements numeric operations for integers.
//! Float operations require the ieee754 dependency (future).
//!
//! XPath operators implemented:
//! - op:numeric-add, op:numeric-subtract, op:numeric-multiply, op:numeric-divide
//! - op:numeric-unary-plus, op:numeric-unary-minus
//! - op:numeric-equal, op:numeric-less-than, op:numeric-greater-than
//! - fn:abs

// ============================================================================
// Integer Operations (using i64)
// ============================================================================

/// op:numeric-add for integers
pub fn numeric_add_int(a: i64, b: i64) -> i64 {
    a + b
}

/// op:numeric-subtract for integers
pub fn numeric_subtract_int(a: i64, b: i64) -> i64 {
    a - b
}

/// op:numeric-multiply for integers
pub fn numeric_multiply_int(a: i64, b: i64) -> i64 {
    a * b
}

/// op:numeric-integer-divide for integers
/// Note: Division by zero will cause an assertion failure
pub fn numeric_divide_int(a: i64, b: i64) -> i64 {
    assert(b != 0, "Division by zero");
    a / b
}

/// op:numeric-unary-plus for integers
/// Returns the value unchanged (identity operation)
pub fn numeric_unary_plus_int(a: i64) -> i64 {
    a
}

/// op:numeric-unary-minus for integers
/// Returns the negation of the value
pub fn numeric_unary_minus_int(a: i64) -> i64 {
    -a
}

/// op:numeric-equal for integers
pub fn numeric_equal_int(a: i64, b: i64) -> bool {
    a == b
}

/// op:numeric-less-than for integers
pub fn numeric_less_than_int(a: i64, b: i64) -> bool {
    a < b
}

/// op:numeric-greater-than for integers
pub fn numeric_greater_than_int(a: i64, b: i64) -> bool {
    a > b
}

/// op:numeric-less-than-or-equal for integers
pub fn numeric_le_int(a: i64, b: i64) -> bool {
    a <= b
}

/// op:numeric-greater-than-or-equal for integers
pub fn numeric_ge_int(a: i64, b: i64) -> bool {
    a >= b
}

/// fn:abs for integers
/// Returns the absolute value
pub fn abs_int(a: i64) -> i64 {
    if a < 0 {
        -a
    } else {
        a
    }
}

/// op:numeric-mod for integers
/// Returns the remainder of integer division
pub fn numeric_mod_int(a: i64, b: i64) -> i64 {
    assert(b != 0, "Modulo by zero");
    a % b
}

/// fn:round for integers
/// Returns the value unchanged (identity operation for integers)
pub fn round_int(a: i64) -> i64 {
    a
}

/// fn:ceiling for integers
/// Returns the value unchanged (identity operation for integers)
pub fn ceil_int(a: i64) -> i64 {
    a
}

/// fn:floor for integers
/// Returns the value unchanged (identity operation for integers)
pub fn floor_int(a: i64) -> i64 {
    a
}

/// Minimum of two integers
pub fn min_int(a: i64, b: i64) -> i64 {
    if a < b {
        a
    } else {
        b
    }
}

/// Maximum of two integers
pub fn max_int(a: i64, b: i64) -> i64 {
    if a > b {
        a
    } else {
        b
    }
}

/// fn:round-half-to-even for integers with precision
/// Rounds to the specified number of decimal places using banker's rounding.
/// For integers, precision 0 returns the value unchanged.
/// Negative precision rounds to powers of 10 (e.g., precision -1 rounds to nearest 10).
/// Banker's rounding: if exactly halfway, round to nearest even number.
pub fn round_half_to_even_int(value: i64, precision: i32) -> i64 {
    if precision >= 0 {
        // For integers with non-negative precision, no rounding needed
        value
    } else {
        // Negative precision: round to power of 10
        // precision = -1 means round to nearest 10
        // precision = -2 means round to nearest 100, etc.
        let scale = pow10(-precision as u32);
        let half_scale = scale / 2;

        // Get the remainder
        let remainder = if value >= 0 {
            value % scale
        } else {
            // For negative numbers, we need to handle differently
            let abs_val = -value;
            let abs_rem = abs_val % scale;
            if abs_rem == 0 {
                0
            } else {
                scale - abs_rem
            }
        };

        // Calculate the rounded-down value
        let rounded_down = value - remainder;

        // Determine if we should round up
        let should_round_up = if remainder > half_scale {
            true
        } else if remainder < half_scale {
            false
        } else {
            // Exactly halfway - round to even
            // Check if rounded_down / scale is odd
            let quotient = rounded_down / scale;
            let is_odd = (quotient % 2 != 0);
            is_odd
        };

        if should_round_up {
            rounded_down + scale
        } else {
            rounded_down
        }
    }
}

/// Helper function to compute 10^n for small n
fn pow10(n: u32) -> i64 {
    let mut result: i64 = 1;
    for _i in 0..n {
        result = result * 10;
    }
    result
}
