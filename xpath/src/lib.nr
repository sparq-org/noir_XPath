//! XPath 2.0 Functions and Operators for SPARQL 1.1
//!
//! This library provides Noir implementations of XPath/XQuery functions
//! as defined in XQuery 1.0 and XPath 2.0 Functions and Operators
//! that are required by SPARQL 1.1 Query Language.

mod types;
mod boolean;
mod numeric;
mod numeric_types;
mod datetime;
mod duration;
mod date;
mod sequence;
mod comparison;
mod string;
mod hash;

// Re-export types
pub use types::{XsdDate, XsdDateTime, XsdDayTimeDuration};

// Re-export boolean functions
pub use boolean::{
    boolean_equal, boolean_ge, boolean_greater_than, boolean_le, boolean_less_than, fn_not,
    logical_and, logical_or,
};

// Re-export numeric functions (integer only for now)
pub use numeric::{
    abs_int, ceil_int, floor_int, max_int, min_int, numeric_add_int, numeric_divide_int,
    numeric_equal_int, numeric_ge_int, numeric_greater_than_int, numeric_le_int,
    numeric_less_than_int, numeric_mod_int, numeric_multiply_int, numeric_subtract_int,
    numeric_unary_minus_int, numeric_unary_plus_int, round_int,
};

// Re-export float/double types and operations (IEEE 754 compliant)
pub use numeric_types::{
    NumericType, XsdFloat, XsdDouble, get_common_type,
    // Float comparisons
    numeric_equal_float, numeric_less_than_float, numeric_greater_than_float, numeric_le_float,
    numeric_ge_float,
    // Double comparisons
    numeric_equal_double, numeric_less_than_double, numeric_greater_than_double, numeric_le_double,
    numeric_ge_double,
    // Float arithmetic
    numeric_add_float, numeric_subtract_float, numeric_multiply_float, numeric_divide_float,
    abs_float,
    // Double arithmetic
    numeric_add_double, numeric_subtract_double, numeric_multiply_double, numeric_divide_double,
    abs_double,
    // Float rounding functions
    round_float, ceil_float, floor_float,
    // Double rounding functions
    round_double, ceil_double, floor_double,
    // Mixed type comparisons
    compare_int_double_eq, compare_int_double_lt, compare_int_double_gt, compare_int_double_le,
    compare_int_double_ge, compare_double_int_eq, compare_double_int_lt, compare_double_int_gt,
    compare_double_int_le, compare_double_int_ge, compare_float_double_eq, compare_float_double_lt,
    compare_float_double_gt, compare_float_double_le, compare_float_double_ge,
    compare_double_float_eq, compare_double_float_lt, compare_double_float_gt,
    compare_double_float_le, compare_double_float_ge, compare_int_float_eq, compare_int_float_lt,
    compare_int_float_gt, compare_int_float_le, compare_int_float_ge, compare_float_int_eq,
    compare_float_int_lt, compare_float_int_gt, compare_float_int_le, compare_float_int_ge,
    // Type casting functions
    cast_integer_to_float, cast_integer_to_double, cast_float_to_integer, cast_double_to_integer,
    cast_double_to_float,
};

// Re-export datetime functions
pub use datetime::{
    datetime_equal, datetime_from_components, datetime_from_components_with_tz,
    datetime_from_epoch_microseconds, datetime_from_epoch_microseconds_with_tz, datetime_ge,
    datetime_greater_than, datetime_le, datetime_less_than, datetime_timezone_offset,
    datetime_to_epoch_microseconds, day_from_datetime, hours_from_datetime,
    microseconds_from_datetime, minutes_from_datetime, month_from_datetime, seconds_from_datetime,
    timezone_from_datetime, year_from_datetime,
};

// Re-export duration functions
pub use duration::{
    datetime_add_duration, datetime_difference, datetime_subtract_duration, days_from_duration,
    duration_add, duration_divide, duration_divide_by_duration, duration_equal,
    duration_from_components, duration_from_microseconds, duration_ge, duration_greater_than,
    duration_is_negative, duration_le, duration_less_than, duration_multiply, duration_negate,
    duration_subtract, duration_to_microseconds, duration_zero, hours_from_duration,
    minutes_from_duration, seconds_from_duration,
};

// Re-export date functions
pub use date::{
    date_equal, date_from_components, date_from_components_with_tz, date_from_epoch_days,
    date_from_epoch_days_with_tz, date_ge, date_greater_than, date_le, date_less_than,
    day_from_date, month_from_date, timezone_from_date, year_from_date,
};

// Re-export sequence/aggregate functions
pub use sequence::{
    all_true, any_true, avg_int, avg_int_partial, count, count_true, exists, is_empty,
    max_int_partial, max_int_seq, min_int_partial, min_int_seq, sum_int, sum_int_partial,
};

// Re-export comparison functions
pub use comparison::{value_equal, value_ge, value_greater_than, value_le, value_less_than};

// Re-export only functional string functions
// Note: Functions that return strings (substring, upper_case, lower_case, concat, etc.)
// are not exported as they cannot work correctly due to Noir's byte-to-string limitation
pub use string::{contains, ends_with, starts_with, string_length};

// Re-export hash functions
// These wrap Noir's standard library hash functions for use in XPath/SPARQL contexts.
// Note: SPARQL hash functions (MD5, SHA256, etc.) return hex strings, but in ZK circuits
// we work with raw byte/field outputs instead.
pub use hash::{
    hash_blake2s, hash_blake3, hash_equal, hash_keccak256, hash_pedersen, hash_poseidon,
    hash_poseidon2, hash_sha256,
};
