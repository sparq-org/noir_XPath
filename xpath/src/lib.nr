//! XPath 2.0 Functions and Operators for SPARQL 1.1
//!
//! This library provides Noir implementations of XPath/XQuery functions
//! as defined in XQuery 1.0 and XPath 2.0 Functions and Operators
//! that are required by SPARQL 1.1 Query Language.
//!
//! ## Deterministic XPath Name Mapping
//!
//! This library provides a deterministic mapping between XPath names and Noir function names
//! through dedicated namespace modules:
//!
//! - `xpath_fn` module: XPath `fn:*` functions (e.g., `fn:abs` -> `xpath::xpath_fn::abs`)
//! - `xpath_op` module: XPath `op:*` operators (e.g., `op:numeric-add` -> `xpath::xpath_op::numeric_add`)
//! - `xpath_xs` module: XPath `xs:*` type casts (e.g., `xs:float(int)` -> `xpath::xpath_xs::float_from_integer`)
//!
//! The naming convention transforms XPath names as follows:
//! - Replace `fn:` with `xpath_fn::`, `op:` with `xpath_op::`, `xs:` with `xpath_xs::`
//! - Replace `-` with `_`
//!
//! This enables code generators (like SPARQL-to-Noir compilers) to programmatically
//! construct function references from XPath expressions.
//!
//! ### Example
//!
//! ```noir
//! use xpath::xpath_fn;
//! use xpath::xpath_op;
//!
//! // fn:abs(-5) in XPath
//! let result = xpath_fn::abs(-5);
//!
//! // op:numeric-add(2, 3) in XPath
//! let sum = xpath_op::numeric_add(2, 3);
//! ```

// Internal implementation modules
mod types;
mod boolean;
mod numeric;
mod numeric_types;
mod datetime;
mod duration;
mod date;
mod time;
mod sequence;
mod comparison;
mod string;
mod stubs;

// XPath namespace modules for deterministic name mapping
// Use `xpath_fn` for fn:* functions, `xpath_op` for op:* operators, `xpath_xs` for xs:* type casts
pub mod xpath_fn;
pub mod xpath_op;
pub mod xpath_xs;

// Re-export types
pub use types::{XsdDate, XsdDateTime, XsdDayTimeDuration, XsdTime};

// Re-export boolean functions
pub use boolean::{
    boolean_equal, boolean_ge, boolean_greater_than, boolean_le, boolean_less_than, fn_false,
    fn_not, fn_true, logical_and, logical_or,
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

// Re-export time functions
pub use time::{
    hours_from_time, microseconds_from_time, minutes_from_time, seconds_from_time, subtract_times,
    time_add_duration, time_equal, time_from_components, time_from_components_with_tz,
    time_from_microseconds, time_from_microseconds_with_tz, time_ge, time_greater_than, time_le,
    time_less_than, time_subtract_duration, timezone_from_time,
};

// Re-export sequence/aggregate functions
pub use sequence::{
    all_true, any_true, avg_int, avg_int_partial, count, count_true, distinct_values, exactly_one,
    exists, head, index_of, is_empty, max_int_partial, max_int_seq, min_int_partial, min_int_seq,
    one_or_more, reverse, subsequence, sum_int, sum_int_partial, tail, zero_or_one,
};

// Re-export comparison functions
pub use comparison::{value_equal, value_ge, value_greater_than, value_le, value_less_than};

// Re-export only functional string functions
// Note: Functions that return strings (substring, upper_case, lower_case, concat, etc.)
// are not exported as they cannot work correctly due to Noir's byte-to-string limitation
pub use string::{
    codepoint_equal, compare, contains, ends_with, starts_with, string_equal, string_ge,
    string_greater_than, string_le, string_length, string_less_than,
};

// Re-export stub functions for unimplemented XPath functions
pub use stubs::{
    stub_fnadjust_date_to_timezone, stub_fnadjust_datetime_to_timezone,
    stub_fnadjust_time_to_timezone, stub_fnanalyze_string, stub_fnapply,
    stub_fnavailable_environment_variables, stub_fnavg, stub_fnbase_uri, stub_fnboolean,
    stub_fncodepoint_equal, stub_fncodepoints_to_string, stub_fncollation_key, stub_fncollection,
    stub_fncompare, stub_fnconcat, stub_fncontains_token, stub_fncount, stub_fncurrent_date,
    stub_fncurrent_datetime, stub_fncurrent_time, stub_fndata, stub_fndatetime,
    stub_fnday_from_date, stub_fndeep_equal, stub_fndefault_collation, stub_fndefault_language,
    stub_fndistinct_values, stub_fndoc, stub_fndoc_available, stub_fndocument_uri,
    stub_fnelement_with_id, stub_fnempty, stub_fnencode_for_uri, stub_fnenvironment_variable,
    stub_fnerror, stub_fnescape_html_uri, stub_fnexactly_one, stub_fnexists, stub_fnfalse,
    stub_fnfilter, stub_fnfold_left, stub_fnfold_right, stub_fnfor_each, stub_fnfor_each_pair,
    stub_fnformat_date, stub_fnformat_datetime, stub_fnformat_integer, stub_fnformat_number,
    stub_fnformat_time, stub_fnfunction_arity, stub_fnfunction_lookup, stub_fnfunction_name,
    stub_fngenerate_id, stub_fnhas_children, stub_fnhead, stub_fnhours_from_time, stub_fnid,
    stub_fnidref, stub_fnimplicit_timezone, stub_fnin_scope_prefixes, stub_fnindex_of,
    stub_fninnermost, stub_fninsert_before, stub_fniri_to_uri, stub_fnjson_doc, stub_fnjson_to_xml,
    stub_fnlang, stub_fnlast, stub_fnload_xquery_module, stub_fnlocal_name,
    stub_fnlocal_name_from_qname, stub_fnlower_case, stub_fnmatches, stub_fnmatches_re, stub_fnmax,
    stub_fnmin, stub_fnminutes_from_time, stub_fnmonth_from_date, stub_fnmonths_from_duration,
    stub_fnname, stub_fnnamespace_uri, stub_fnnamespace_uri_for_prefix,
    stub_fnnamespace_uri_from_qname, stub_fnnilled, stub_fnnode_name, stub_fnnormalize_space,
    stub_fnnormalize_unicode, stub_fnnumber, stub_fnone_or_more, stub_fnoutermost,
    stub_fnparse_ietf_date, stub_fnparse_json, stub_fnparse_xml, stub_fnparse_xml_fragment,
    stub_fnpath, stub_fnposition, stub_fnprefix_from_qname, stub_fnqname,
    stub_fnrandom_number_generator, stub_fnremove, stub_fnreplace, stub_fnresolve_qname,
    stub_fnresolve_uri, stub_fnreverse, stub_fnroot, stub_fnround_half_to_even,
    stub_fnseconds_from_time, stub_fnserialize, stub_fnsort, stub_fnstatic_base_uri, stub_fnstring,
    stub_fnstring_join, stub_fnstring_to_codepoints, stub_fnsubsequence, stub_fnsubstring,
    stub_fnsubstring_after, stub_fnsubstring_before, stub_fnsum, stub_fntail,
    stub_fntimezone_from_date, stub_fntimezone_from_time, stub_fntokenize, stub_fntrace,
    stub_fntransform, stub_fntranslate, stub_fntrue, stub_fnunordered, stub_fnunparsed_text,
    stub_fnunparsed_text_available, stub_fnunparsed_text_lines, stub_fnupper_case,
    stub_fnxml_to_json, stub_fnyear_from_date, stub_fnyears_from_duration, stub_fnzero_or_one,
    stub_opadd_daytimeduration_to_date, stub_opadd_daytimeduration_to_time,
    stub_opadd_yearmonthduration_to_date, stub_opadd_yearmonthduration_to_datetime,
    stub_opadd_yearmonthdurations, stub_opanyuri_equal, stub_opanyuri_greater_than,
    stub_opanyuri_less_than, stub_opbang, stub_opbase64binary_equal,
    stub_opbase64binary_greater_than, stub_opbase64binary_less_than, stub_opconcat,
    stub_opconcatenate, stub_opdate_equal, stub_opdate_greater_than, stub_opdate_less_than,
    stub_opdivide_daytimeduration, stub_opdivide_daytimeduration_by_daytimeduration,
    stub_opdivide_yearmonthduration, stub_opdivide_yearmonthduration_by_yearmonthduration,
    stub_opduration_equal, stub_opexcept, stub_opgday_equal, stub_opgmonth_equal,
    stub_opgmonthday_equal, stub_opgyear_equal, stub_opgyearmonth_equal, stub_ophexbinary_equal,
    stub_ophexbinary_greater_than, stub_ophexbinary_less_than, stub_opintersect,
    stub_opis_same_node, stub_opmultiply_daytimeduration, stub_opmultiply_yearmonthduration,
    stub_opnode_after, stub_opnode_before, stub_opqname_equal, stub_opsame_key, stub_opstring_equal,
    stub_opstring_greater_than, stub_opstring_less_than, stub_opsubtract_dates,
    stub_opsubtract_daytimeduration_from_date, stub_opsubtract_daytimeduration_from_time,
    stub_opsubtract_times, stub_opsubtract_yearmonthduration_from_date,
    stub_opsubtract_yearmonthduration_from_datetime, stub_opsubtract_yearmonthdurations,
    stub_optime_equal, stub_optime_greater_than, stub_optime_less_than, stub_opto, stub_opunion,
    stub_opyearmonthduration_greater_than, stub_opyearmonthduration_less_than, stub_prodannotation,
    stub_prodarraytest, stub_prodarrowpostfix, stub_prodaxisstep, stub_prodaxisstep_abbr,
    stub_prodaxisstep_ancestor, stub_prodaxisstep_ancestor_or_self, stub_prodaxisstep_following,
    stub_prodaxisstep_following_sibling, stub_prodaxisstep_preceding,
    stub_prodaxisstep_preceding_sibling, stub_prodaxisstep_unabbr, stub_prodbaseuridecl,
    stub_prodboundaryspacedecl, stub_prodcastableexpr, stub_prodcastexpr, stub_prodcastexpr_derived,
    stub_prodcastexpr_schema, stub_prodcomment, stub_prodcompattrconstructor,
    stub_prodcompcommentconstructor, stub_prodcompdocconstructor, stub_prodcompelemconstructor,
    stub_prodcompnamespaceconstructor, stub_prodcomppiconstructor, stub_prodcomptextconstructor,
    stub_prodconstructiondecl, stub_prodconstructiondecl_schema, stub_prodcontextitemdecl,
    stub_prodcontextitemexpr, stub_prodcopynamespacesdecl, stub_prodcountclause,
    stub_prodcurlyarrayconstructor, stub_proddecimalformatdecl, stub_proddefaultcollationdecl,
    stub_proddefaultnamespacedecl, stub_proddirattributelist, stub_proddirectconstructor,
    stub_proddirelemconstructor, stub_proddirelemcontent, stub_proddirelemcontent_namespace,
    stub_proddirelemcontent_whitespace, stub_prodemptyorderdecl, stub_prodeqname,
    stub_prodextensionexpr, stub_prodflworexpr, stub_prodforclause, stub_prodfunctioncall,
    stub_prodfunctiondecl, stub_prodgeneralcomp_eq, stub_prodgeneralcomp_ge,
    stub_prodgeneralcomp_gt, stub_prodgeneralcomp_le, stub_prodgeneralcomp_lt,
    stub_prodgeneralcomp_ne, stub_prodgroupbyclause, stub_prodifexpr, stub_prodinlinefunctionexpr,
    stub_prodinstanceofexpr, stub_prodletclause, stub_prodliteral, stub_prodlookup,
    stub_prodmapconstructor, stub_prodmaptest, stub_prodmoduleimport, stub_prodnamedfunctionref,
    stub_prodnamespacedecl, stub_prodnametest, stub_prodnodetest, stub_prodoptiondecl,
    stub_prodoptiondecl_serialization, stub_prodorderbyclause, stub_prodorderingmodedecl,
    stub_prodorexpr, stub_prodparenthesizedexpr, stub_prodpathexpr, stub_prodpositionalvar,
    stub_prodpredicate, stub_prodquantifiedexpr, stub_prodreturnclause, stub_prodschemaimport,
    stub_prodsequencetype, stub_prodstepexpr, stub_prodstringconstructor, stub_prodswitchexpr,
    stub_prodtreatexpr, stub_prodtrycatchexpr, stub_prodtypeswitchexpr, stub_produnarylookup,
    stub_produnorderedexpr, stub_prodvalidateexpr, stub_prodvaluecomp, stub_prodvardecl,
    stub_prodvardecl_external, stub_prodvardefaultvalue, stub_prodversiondecl, stub_prodwhereclause,
    stub_prodwindowclause,
};
