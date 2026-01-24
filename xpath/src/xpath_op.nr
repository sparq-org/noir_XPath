//! XPath `op:` namespace operators
//!
//! This module provides a deterministic mapping from XPath operator names in the `op:` namespace
//! to their Noir implementations. The naming follows the pattern:
//!
//! - XPath `op:operator-name` -> `xpath_op::operator_name` (hyphens become underscores)
//!
//! This enables code generators to compose function names programmatically by:
//! 1. Taking the XPath operator name (e.g., `op:numeric-add`)
//! 2. Replacing `op:` with `xpath_op::` and `-` with `_`
//! 3. Accessing the function directly (e.g., `xpath_op::numeric_add`)
//!
//! ## Usage
//!
//! ```noir
//! use xpath::xpath_op;
//!
//! // op:numeric-add
//! let sum = xpath_op::numeric_add(5, 3);
//!
//! // op:dateTime-equal
//! let equal = xpath_op::dateTime_equal(dt1, dt2);
//! ```

// ============================================================================
// Numeric operators (integer)
// ============================================================================

// op:numeric-add
pub use crate::numeric::numeric_add_int as numeric_add;

// op:numeric-subtract
pub use crate::numeric::numeric_subtract_int as numeric_subtract;

// op:numeric-multiply
pub use crate::numeric::numeric_multiply_int as numeric_multiply;

// op:numeric-divide (integer division)
pub use crate::numeric::numeric_divide_int as numeric_divide;

// op:numeric-integer-divide
pub use crate::numeric::numeric_divide_int as numeric_integer_divide;

// op:numeric-mod
pub use crate::numeric::numeric_mod_int as numeric_mod;

// op:numeric-equal
pub use crate::numeric::numeric_equal_int as numeric_equal;

// op:numeric-less-than
pub use crate::numeric::numeric_less_than_int as numeric_less_than;

// op:numeric-greater-than
pub use crate::numeric::numeric_greater_than_int as numeric_greater_than;

// op:numeric-unary-plus
pub use crate::numeric::numeric_unary_plus_int as numeric_unary_plus;

// op:numeric-unary-minus
pub use crate::numeric::numeric_unary_minus_int as numeric_unary_minus;

// ============================================================================
// Numeric operators (float)
// ============================================================================

// op:numeric-add (float)
pub use crate::numeric_types::numeric_add_float;

// op:numeric-subtract (float)
pub use crate::numeric_types::numeric_subtract_float;

// op:numeric-multiply (float)
pub use crate::numeric_types::numeric_multiply_float;

// op:numeric-divide (float)
pub use crate::numeric_types::numeric_divide_float;

// op:numeric-equal (float)
pub use crate::numeric_types::numeric_equal_float;

// op:numeric-less-than (float)
pub use crate::numeric_types::numeric_less_than_float;

// op:numeric-greater-than (float)
pub use crate::numeric_types::numeric_greater_than_float;

// op:numeric-less-than-or-equal (float)
pub use crate::numeric_types::numeric_le_float;

// op:numeric-greater-than-or-equal (float)
pub use crate::numeric_types::numeric_ge_float;

// ============================================================================
// Numeric operators (double)
// ============================================================================

// op:numeric-add (double)
pub use crate::numeric_types::numeric_add_double;

// op:numeric-subtract (double)
pub use crate::numeric_types::numeric_subtract_double;

// op:numeric-multiply (double)
pub use crate::numeric_types::numeric_multiply_double;

// op:numeric-divide (double)
pub use crate::numeric_types::numeric_divide_double;

// op:numeric-equal (double)
pub use crate::numeric_types::numeric_equal_double;

// op:numeric-less-than (double)
pub use crate::numeric_types::numeric_less_than_double;

// op:numeric-greater-than (double)
pub use crate::numeric_types::numeric_greater_than_double;

// op:numeric-less-than-or-equal (double)
pub use crate::numeric_types::numeric_le_double;

// op:numeric-greater-than-or-equal (double)
pub use crate::numeric_types::numeric_ge_double;

// ============================================================================
// Boolean operators
// ============================================================================

// op:boolean-equal
pub use crate::boolean::boolean_equal;

// op:boolean-less-than
pub use crate::boolean::boolean_less_than;

// op:boolean-greater-than
pub use crate::boolean::boolean_greater_than;

// op:boolean-less-than-or-equal
pub use crate::boolean::boolean_le as boolean_less_than_or_equal;

// op:boolean-greater-than-or-equal
pub use crate::boolean::boolean_ge as boolean_greater_than_or_equal;

// ============================================================================
// DateTime operators
// ============================================================================

// op:dateTime-equal
pub use crate::datetime::datetime_equal as dateTime_equal;

// op:dateTime-less-than
pub use crate::datetime::datetime_less_than as dateTime_less_than;

// op:dateTime-greater-than
pub use crate::datetime::datetime_greater_than as dateTime_greater_than;

// op:dateTime-less-than-or-equal
pub use crate::datetime::datetime_le as dateTime_less_than_or_equal;

// op:dateTime-greater-than-or-equal
pub use crate::datetime::datetime_ge as dateTime_greater_than_or_equal;

// ============================================================================
// Date operators
// ============================================================================

// op:date-equal
pub use crate::date::date_equal;

// op:date-less-than
pub use crate::date::date_less_than;

// op:date-greater-than
pub use crate::date::date_greater_than;

// op:date-less-than-or-equal
pub use crate::date::date_le as date_less_than_or_equal;

// op:date-greater-than-or-equal
pub use crate::date::date_ge as date_greater_than_or_equal;

// ============================================================================
// Time operators
// ============================================================================

// op:time-equal
pub use crate::time::time_equal;

// op:time-less-than
pub use crate::time::time_less_than;

// op:time-greater-than
pub use crate::time::time_greater_than;

// op:time-less-than-or-equal
pub use crate::time::time_le as time_less_than_or_equal;

// op:time-greater-than-or-equal
pub use crate::time::time_ge as time_greater_than_or_equal;

// op:subtract-times
pub use crate::time::subtract_times;

// op:add-dayTimeDuration-to-time
pub use crate::time::time_add_duration as add_dayTimeDuration_to_time;

// op:subtract-dayTimeDuration-from-time
pub use crate::time::time_subtract_duration as subtract_dayTimeDuration_from_time;

// ============================================================================
// Duration operators
// ============================================================================

// op:add-dayTimeDurations
pub use crate::duration::duration_add as add_dayTimeDurations;

// op:subtract-dayTimeDurations
pub use crate::duration::duration_subtract as subtract_dayTimeDurations;

// op:multiply-dayTimeDuration
pub use crate::duration::duration_multiply as multiply_dayTimeDuration;

// op:divide-dayTimeDuration
pub use crate::duration::duration_divide as divide_dayTimeDuration;

// op:divide-dayTimeDuration-by-dayTimeDuration
pub use crate::duration::duration_divide_by_duration as divide_dayTimeDuration_by_dayTimeDuration;

// op:dayTimeDuration-equal
pub use crate::duration::duration_equal as dayTimeDuration_equal;

// op:dayTimeDuration-less-than
pub use crate::duration::duration_less_than as dayTimeDuration_less_than;

// op:dayTimeDuration-greater-than
pub use crate::duration::duration_greater_than as dayTimeDuration_greater_than;

// op:dayTimeDuration-less-than-or-equal
pub use crate::duration::duration_le as dayTimeDuration_less_than_or_equal;

// op:dayTimeDuration-greater-than-or-equal
pub use crate::duration::duration_ge as dayTimeDuration_greater_than_or_equal;

// ============================================================================
// DateTime + Duration operators
// ============================================================================

// op:add-dayTimeDuration-to-dateTime
pub use crate::duration::datetime_add_duration as add_dayTimeDuration_to_dateTime;

// op:subtract-dayTimeDuration-from-dateTime
pub use crate::duration::datetime_subtract_duration as subtract_dayTimeDuration_from_dateTime;

// op:subtract-dateTimes
pub use crate::duration::datetime_difference as subtract_dateTimes;

// ============================================================================
// String operators
// ============================================================================

// op:string-equal
pub use crate::string::string_equal;

// op:string-less-than
pub use crate::string::string_less_than;

// op:string-greater-than
pub use crate::string::string_greater_than;

// ============================================================================
// anyURI operators (treat as strings)
// ============================================================================

// op:anyURI-equal
pub use crate::string::anyuri_equal as anyURI_equal;

// op:anyURI-less-than
pub use crate::string::anyuri_less_than as anyURI_less_than;

// op:anyURI-greater-than
pub use crate::string::anyuri_greater_than as anyURI_greater_than;

// ============================================================================
// Date + Duration operators
// ============================================================================

// op:add-dayTimeDuration-to-date
pub use crate::date::date_add_duration as add_dayTimeDuration_to_date;

// op:subtract-dayTimeDuration-from-date
pub use crate::date::date_subtract_duration as subtract_dayTimeDuration_from_date;

// op:subtract-dates
pub use crate::date::subtract_dates;
