//! Boolean functions and operators for XPath/SPARQL
//!
//! Implements:
//! - fn:not (logical NOT)
//! - Logical AND and OR
//! - Boolean comparison operators

/// XPath fn:not - Logical NOT
/// Returns true if the argument is false, and false if the argument is true.
pub fn fn_not(a: bool) -> bool {
    !a
}

/// Logical AND operation
/// Returns true if both arguments are true.
pub fn logical_and(a: bool, b: bool) -> bool {
    a & b
}

/// Logical OR operation
/// Returns true if at least one argument is true.
pub fn logical_or(a: bool, b: bool) -> bool {
    a | b
}

/// op:boolean-equal
/// Returns true if both arguments have the same boolean value.
pub fn boolean_equal(a: bool, b: bool) -> bool {
    a == b
}

/// op:boolean-less-than
/// Returns true if the first argument is less than the second.
/// In XPath boolean ordering: false < true
pub fn boolean_less_than(a: bool, b: bool) -> bool {
    // false (0) < true (1)
    // Only true when a is false and b is true
    (!a) & b
}

/// op:boolean-greater-than
/// Returns true if the first argument is greater than the second.
/// In XPath boolean ordering: true > false
pub fn boolean_greater_than(a: bool, b: bool) -> bool {
    // true (1) > false (0)
    // Only true when a is true and b is false
    a & (!b)
}

/// op:boolean-less-than-or-equal
/// Returns true if the first argument is less than or equal to the second.
/// In XPath boolean ordering: false <= true, false <= false, true <= true
pub fn boolean_le(a: bool, b: bool) -> bool {
    // a <= b is equivalent to (a < b) OR (a == b)
    // Or more simply: NOT (a > b)
    !(a & (!b))
}

/// op:boolean-greater-than-or-equal
/// Returns true if the first argument is greater than or equal to the second.
/// In XPath boolean ordering: true >= false, true >= true, false >= false
pub fn boolean_ge(a: bool, b: bool) -> bool {
    // a >= b is equivalent to (a > b) OR (a == b)
    // Or more simply: NOT (a < b)
    !((!a) & b)
}

/// fn:true - Returns the boolean value true
/// XPath: fn:true() as xs:boolean
pub fn fn_true() -> bool {
    true
}

/// fn:false - Returns the boolean value false
/// XPath: fn:false() as xs:boolean
pub fn fn_false() -> bool {
    false
}
