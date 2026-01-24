//! Test chunk 0 for fn:months-from-duration
//! Contains 29 tests

use dep::xpath::stub_fnmonths_from_duration;

#[test]
fn fn_months_from_duration1args_1() {
    //  Evaluates The 'months-from-duration' function with the arguments set as follows
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P0Y0M\"))
    // Expected: 0
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration1args_2() {
    //  Evaluates The 'months-from-duration' function with the arguments set as follows
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P1000Y6M\"))
    // Expected: 6
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration1args_3() {
    //  Evaluates The 'months-from-duration' function with the arguments set as follows
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P2030Y12M\"))
    // Expected: 0
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_1() {
    //  Evaluates The 'months-from-duration' function As per example 1 (for this functi
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P20Y15M\"))
    // Expected: 3
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_2() {
    //  Evaluates The 'months-from-duration' function As per example 2 (for this functi
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"-P20Y18M\"))
    // Expected: -6
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_3() {
    //  Evaluates The 'months-from-duration' function involving a 'numeric-less-than' o
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P20Y3M\")) lt
    // Expected: false
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_4() {
    //  Evaluates The 'months-from-duration' function involving a 'numeric-less-than' o
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P21Y10M\")) l
    // Expected: true
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_5() {
    //  Evaluates The 'months-from-duration' function using the empty sequence as an ar
    // XPath: fn:count(fn:months-from-duration(()))
    // Expected: 0
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_6() {
    //  Evaluates The 'months-from-duration' function that returns 1.
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P01Y01M\"))
    // Expected: 1
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_7() {
    //  Evaluates The 'months-from-duration' function used as arguments to an avg funct
    // XPath: fn:avg((fn:months-from-duration(xs:yearMonthDuration(\"P23Y1
    // Expected: 10
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_8() {
    //  Evaluates The 'months-from-duration' function as part of a '+' expression.
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P21Y10M\")) +
    // Expected: 21
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_9() {
    //  Evaluates The 'months-from-duration' function as part of a '-' expression.
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P30Y10M\")) -
    // Expected: 1
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_10() {
    //  Evaluates The 'months-from-duration' function as part of a '*' expression.
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P20Y09M\")) *
    // Expected: 90
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_11() {
    //  Evaluates The 'months-from-duration' function as part of a 'div' expression.
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P20Y10M\")) d
    // Expected: 2
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_12() {
    //  Evaluates The 'months-from-duration' function as part of a 'idiv' expression.
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P25Y10M\")) i
    // Expected: 5
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_13() {
    //  Evaluates The 'months-from-duration' function as part of a 'mod' expression.
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P10Y10M\")) m
    // Expected: 1
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_14() {
    //  Evaluates The 'months-from-duration' function as part of a 'numeric-unary-plus'
    // XPath: +fn:months-from-duration(xs:yearMonthDuration(\"P21Y10M\"))
    // Expected: 10
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_15() {
    //  Evaluates The 'months-from-duration' function as part of a 'numeric-unary-minus
    // XPath: -fn:months-from-duration(xs:yearMonthDuration(\"P25Y03M\"))
    // Expected: -3
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_16() {
    //  Evaluates The 'months-from-duration' function as part of a 'numeric-equal' expr
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P22Y10M\")) e
    // Expected: false
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_17() {
    //  Evaluates The 'months-from-duration' function as part of a 'numeric-equal' expr
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P22Y10M\")) n
    // Expected: false
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_18() {
    //  Evaluates The 'months-from-duration' function as part of a 'numeric-equal' expr
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P21Y01M\")) l
    // Expected: true
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_19() {
    //  Evaluates The 'months-from-duration' function as part of a 'numeric-equal' expr
    // XPath: fn:months-from-duration(xs:yearMonthDuration(\"P20Y09M\")) g
    // Expected: true
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn fn_months_from_duration_20() {
    //  Evaluates The 'months-from-duration' function with wrong argument type.
    // XPath: fn:months-from-duration(xs:duration(\"P1Y2M3DT10H30M\"))
    // Expected: 2
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn k_monthsfromdurationfunc_3() {
    //  A test whose essence is: `empty(months-from-duration(()))`.
    // XPath: empty(months-from-duration(()))
    // Expected: true
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn k_monthsfromdurationfunc_4() {
    //  A test whose essence is: `months-from-duration(()) instance of xs:integer?`.
    // XPath: months-from-duration(()) instance of xs:integer?
    // Expected: true
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn k_monthsfromdurationfunc_5() {
    //  A test whose essence is: `months-from-duration(xs:yearMonthDuration('P0003Y2M')
    // XPath: months-from-duration(xs:yearMonthDuration(\"P0003Y2M\")) eq
    // Expected: true
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn k_monthsfromdurationfunc_6() {
    //  Simple test invoking months-from-duration() on a negative duration.
    // XPath: months-from-duration(xs:yearMonthDuration(\"-P0003Y2M\")) eq
    // Expected: true
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn k_monthsfromdurationfunc_7() {
    //  Simple test invoking months-from-duration() on an negative xs:duration.
    // XPath: months-from-duration(xs:duration(\"-P3Y4M4DT1H23M2.34S\")) e
    // Expected: true
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}

#[test]
fn cbcl_months_from_duration_001() {
    //  test fn:months-from-duration on xs:dayTimeDuration
    // XPath: fn:months-from-duration(xs:dayTimeDuration('P1D'))
    // Expected: 0
    // Calls stub function - will fail until fn:months-from-duration is implemented
    let _ = stub_fnmonths_from_duration();
}
