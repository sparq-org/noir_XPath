//! Test chunk 0 for fn:hours-from-time
//! Contains 25 tests

use dep::xpath::stub_fnhours_from_time;

#[test]
fn fn_hours_from_time1args_1() {
    //  Evaluates The 'hours-from-time' function with the arguments set as follows: $ar
    // XPath: fn:hours-from-time(xs:time(\"00:00:00Z\"))
    // Expected: 0
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time1args_2() {
    //  Evaluates The 'hours-from-time' function with the arguments set as follows: $ar
    // XPath: fn:hours-from-time(xs:time(\"08:03:35Z\"))
    // Expected: 8
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time1args_3() {
    //  Evaluates The 'hours-from-time' function with the arguments set as follows: $ar
    // XPath: fn:hours-from-time(xs:time(\"23:59:59Z\"))
    // Expected: 23
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_1() {
    //  Evaluates The 'hours-from-time' function As per example 1 of the F&O specs
    // XPath: fn:hours-from-time(xs:time(\"11:23:00Z\"))
    // Expected: 11
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_2() {
    //  Evaluates The 'hours-from-time' function As per example 2 of the F&O specs
    // XPath: fn:hours-from-time(xs:time(\"21:23:00Z\"))
    // Expected: 21
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_3() {
    //  Evaluates The 'hours-from-time' function As per example 3 of the F&O specs
    // XPath: fn:hours-from-time(xs:time(\"01:23:00+05:00\"))
    // Expected: 1
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_4() {
    //  Evaluates The 'hours-from-time' function As per example 4 of the F&O specs
    // XPath: fn:hours-from-time(fn:adjust-time-to-timezone(xs:time(\"01:2
    // Expected: 20
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_5() {
    //  Evaluates The 'hours-from-time' function using the empty sequence as an argumen
    // XPath: fn:count(fn:hours-from-time(()))
    // Expected: 0
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_6() {
    //  Evaluates The 'hours-from-time' function that returns 0.
    // XPath: fn:hours-from-time(xs:time(\"00:20:00Z\"))
    // Expected: 0
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_7() {
    //  Evaluates The 'hours-from-time' function that returns 23.
    // XPath: fn:hours-from-time(xs:time(\"23:20:00Z\"))
    // Expected: 23
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_8() {
    //  Evaluates The 'hours-from-time' function as part of a '+' expression.
    // XPath: fn:hours-from-time(xs:time(\"02:00:00Z\")) + fn:hours-from-t
    // Expected: 12
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_9() {
    //  Evaluates The 'hours-from-time' function as part of a '-' expression.
    // XPath: fn:hours-from-time(xs:time(\"10:00:00Z\")) - fn:hours-from-t
    // Expected: 1
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_10() {
    //  Evaluates The 'hours-from-time' function as part of a '*' expression.
    // XPath: fn:hours-from-time(xs:time(\"02:00:00Z\")) * fn:hours-from-t
    // Expected: 20
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_11() {
    //  Evaluates The 'hours-from-time' function as part of a 'div' expression.
    // XPath: fn:hours-from-time(xs:time(\"22:00:00Z\")) div fn:hours-from
    // Expected: 11
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_12() {
    //  Evaluates The 'hours-from-time' function as part of a 'idiv' expression.
    // XPath: fn:hours-from-time(xs:time(\"10:00:00Z\")) idiv fn:hours-fro
    // Expected: 5
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_13() {
    //  Evaluates The 'hours-from-time' function as part of a 'mod' expression.
    // XPath: fn:hours-from-time(xs:time(\"10:00:00Z\")) mod fn:hours-from
    // Expected: 1
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_14() {
    //  Evaluates The 'hours-from-time' function as part of a 'numeric-unary-plus' expr
    // XPath: +fn:hours-from-time(xs:time(\"10:00:00Z\"))
    // Expected: 10
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_15() {
    //  Evaluates The 'hours-from-time' function as part of a 'numeric-unary-minus' exp
    // XPath: -fn:hours-from-time(xs:time(\"10:00:00Z\"))
    // Expected: -10
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_16() {
    //  Evaluates The 'hours-from-time' function as part of a 'numeric-equal' expressio
    // XPath: fn:hours-from-time(xs:time(\"10:00:00Z\")) eq fn:hours-from-
    // Expected: true
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_17() {
    //  Evaluates The 'hours-from-time' function as part of a 'numeric-equal' expressio
    // XPath: fn:hours-from-time(xs:time(\"10:00:00Z\")) ne fn:hours-from-
    // Expected: true
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_18() {
    //  Evaluates The 'hours-from-time' function as part of a 'numeric-equal' expressio
    // XPath: fn:hours-from-time(xs:time(\"10:00:00Z\")) le fn:hours-from-
    // Expected: true
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn fn_hours_from_time_19() {
    //  Evaluates The 'hours-from-time' function as part of a 'numeric-equal' expressio
    // XPath: fn:hours-from-time(xs:time(\"10:00:00Z\")) ge fn:hours-from-
    // Expected: true
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn k_hoursfromtimefunc_3() {
    //  A test whose essence is: `empty(hours-from-time(()))`.
    // XPath: empty(hours-from-time(()))
    // Expected: true
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn k_hoursfromtimefunc_4() {
    //  A test whose essence is: `hours-from-time(()) instance of xs:integer?`.
    // XPath: hours-from-time(()) instance of xs:integer?
    // Expected: true
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}

#[test]
fn k_hoursfromtimefunc_5() {
    //  A test whose essence is: `hours-from-time(xs:time('23:11:12.43')) eq 23`.
    // XPath: hours-from-time(xs:time(\"23:11:12.43\")) eq 23
    // Expected: true
    // Calls stub function - will fail until fn:hours-from-time is implemented
    let _ = stub_fnhours_from_time();
}
