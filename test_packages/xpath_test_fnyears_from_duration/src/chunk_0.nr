//! Test chunk 0 for fn:years-from-duration
//! Contains 29 tests

use dep::xpath::stub_fnyears_from_duration;

#[test]
fn fn_years_from_duration1args_1() {
    //  Evaluates The 'years-from-duration' function with the arguments set as follows:
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P0Y0M\"))
    // Expected: 0
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration1args_2() {
    //  Evaluates The 'years-from-duration' function with the arguments set as follows:
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P1000Y6M\"))
    // Expected: 1000
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration1args_3() {
    //  Evaluates The 'years-from-duration' function with the arguments set as follows:
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P2030Y12M\"))
    // Expected: 2031
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_1() {
    //  Evaluates The 'years-from-duration' function As per example 1 (for this functio
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P20Y15M\"))
    // Expected: 21
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_2() {
    //  Evaluates The 'years-from-duration' function As per example 2 (for this functio
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"-P15M\"))
    // Expected: -1
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_3() {
    //  Evaluates The 'years-from-duration' function involving a 'numeric-less-than' op
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P20Y3M\")) lt
    // Expected: true
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_4() {
    //  Evaluates The 'years-from-duration' function involving a 'numeric-less-than' op
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P21Y10M\")) le
    // Expected: true
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_5() {
    //  Evaluates The 'years-from-duration' function using the empty sequence as an arg
    // XPath: fn:count(fn:years-from-duration(()))
    // Expected: 0
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_6() {
    //  Evaluates The 'years-from-duration' function that returns 1.
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P01Y10M\"))
    // Expected: 1
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_7() {
    //  Evaluates The 'years-from-duration' function used as arguments to an avg functi
    // XPath: fn:avg((fn:years-from-duration(xs:yearMonthDuration(\"P23Y10
    // Expected: 22
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_8() {
    //  Evaluates The 'years-from-duration' function as part of a '+' expression.
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P21Y10M\")) +
    // Expected: 43
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_9() {
    //  Evaluates The 'years-from-duration' function as part of a '-' expression.
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P30Y10M\")) -
    // Expected: 20
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_10() {
    //  Evaluates The 'years-from-duration' function as part of a '*' expression.
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P20Y10M\")) *
    // Expected: 40
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_11() {
    //  Evaluates The 'years-from-duration' function as part of a 'div' expression.
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P20Y10M\")) di
    // Expected: 4
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_12() {
    //  Evaluates The 'years-from-duration' function as part of a 'idiv' expression.
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P25Y10M\")) id
    // Expected: 5
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_13() {
    //  Evaluates The 'years-from-duration' function as part of a 'mod' expression.
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P10Y10M\")) mo
    // Expected: 1
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_14() {
    //  Evaluates The 'years-from-duration' function as part of a 'numeric-unary-plus'
    // XPath: +fn:years-from-duration(xs:yearMonthDuration(\"P21Y10M\"))
    // Expected: 21
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_15() {
    //  Evaluates The 'years-from-duration' function as part of a 'numeric-unary-minus'
    // XPath: -fn:years-from-duration(xs:yearMonthDuration(\"P25Y10M\"))
    // Expected: -25
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_16() {
    //  Evaluates The 'years-from-duration' function as part of a 'numeric-equal' expre
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P22Y10M\")) eq
    // Expected: true
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_17() {
    //  Evaluates The 'years-from-duration' function as part of a 'numeric-equal' expre
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P22Y10M\")) ne
    // Expected: true
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_18() {
    //  Evaluates The 'years-from-duration' function as part of a 'numeric-equal' expre
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P21Y01M\")) le
    // Expected: true
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_19() {
    //  Evaluates The 'years-from-duration' function as part of a 'numeric-equal' expre
    // XPath: fn:years-from-duration(xs:yearMonthDuration(\"P20Y10M\")) ge
    // Expected: true
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn fn_years_from_duration_20() {
    //  Evaluates The 'years-from-duration' function with wrong argument type.
    // XPath: fn:years-from-duration(xs:duration(\"P1Y2M3DT10H30M\"))
    // Expected: 1
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn k_yearsfromdurationfunc_3() {
    //  A test whose essence is: `empty(years-from-duration(()))`.
    // XPath: empty(years-from-duration(()))
    // Expected: true
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn k_yearsfromdurationfunc_4() {
    //  A test whose essence is: `years-from-duration(()) instance of xs:integer?`.
    // XPath: years-from-duration(()) instance of xs:integer?
    // Expected: true
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn k_yearsfromdurationfunc_5() {
    //  A test whose essence is: `years-from-duration(xs:yearMonthDuration('P0003Y2M'))
    // XPath: years-from-duration(xs:yearMonthDuration(\"P0003Y2M\")) eq 3
    // Expected: true
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn k_yearsfromdurationfunc_6() {
    //  Simple test invoking years-from-duration() on a negative duration.
    // XPath: years-from-duration(xs:yearMonthDuration(\"-P0003Y2M\")) eq
    // Expected: true
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn k_yearsfromdurationfunc_7() {
    //  Simple test invoking years-from-duration() on an negative xs:duration.
    // XPath: years-from-duration(xs:duration(\"-P3Y4M4DT1H23M2.34S\")) eq
    // Expected: true
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}

#[test]
fn cbcl_years_from_duration_001() {
    //  test fn:years-from-duration on xs:dayTimeDuration
    // XPath: fn:years-from-duration(xs:dayTimeDuration('P1D'))
    // Expected: 0
    // Calls stub function - will fail until fn:years-from-duration is implemented
    let _ = stub_fnyears_from_duration();
}
