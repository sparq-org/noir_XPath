//! Test chunk 0 for fn:minutes-from-time
//! Contains 25 tests

use dep::xpath::stub_fnminutes_from_time;

#[test]
fn fn_minutes_from_time1args_1() {
    //  Evaluates The 'minutes-from-time' function with the arguments set as follows: $
    // XPath: fn:minutes-from-time(xs:time(\"00:00:00Z\"))
    // Expected: 0
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time1args_2() {
    //  Evaluates The 'minutes-from-time' function with the arguments set as follows: $
    // XPath: fn:minutes-from-time(xs:time(\"08:03:35Z\"))
    // Expected: 3
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time1args_3() {
    //  Evaluates The 'minutes-from-time' function with the arguments set as follows: $
    // XPath: fn:minutes-from-time(xs:time(\"23:59:59Z\"))
    // Expected: 59
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_1() {
    //  Evaluates The 'minutes-from-time' function As per example 1 of the F&O specs (f
    // XPath: fn:minutes-from-time(xs:time(\"13:00:00Z\"))
    // Expected: 0
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_2() {
    //  Evaluates The 'minutes-from-time' function used as part of a numeric less than
    // XPath: fn:minutes-from-time(xs:time(\"21:23:00Z\")) lt fn:minutes-f
    // Expected: true
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_3() {
    //  Evaluates The 'minutes-from-time' function as part of a numeric greater than op
    // XPath: fn:minutes-from-time(xs:time(\"01:23:00Z\")) gt fn:minutes-f
    // Expected: false
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_4() {
    //  Evaluates The 'minutes-from-time' function used as an argument to an avg functi
    // XPath: fn:avg((fn:minutes-from-time(xs:time(\"01:10:00Z\")), fn:min
    // Expected: 15
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_5() {
    //  Evaluates The 'minutes-from-time' function using the empty sequence as an argum
    // XPath: fn:count(fn:minutes-from-time(()))
    // Expected: 0
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_6() {
    //  Evaluates The 'hours-from-time' function that returns 59.
    // XPath: fn:hours-from-time(xs:time(\"00:59:00Z\"))
    // Expected: 0
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_7() {
    //  Evaluates The 'minutes-from-time' function used as part of an abs function.
    // XPath: fn:abs(fn:minutes-from-time(xs:time(\"23:20:00Z\")))
    // Expected: 20
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_8() {
    //  Evaluates The 'minutes-from-time' function as part of a '+' expression.
    // XPath: fn:minutes-from-time(xs:time(\"02:00:00Z\")) + fn:minutes-fr
    // Expected: 0
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_9() {
    //  Evaluates The 'minutes-from-time' function as part of a '-' expression.
    // XPath: fn:minutes-from-time(xs:time(\"10:10:00Z\")) - fn:minutes-fr
    // Expected: 8
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_10() {
    //  Evaluates The 'minutes-from-time' function as part of a '*' expression.
    // XPath: fn:minutes-from-time(xs:time(\"02:02:00Z\")) * fn:minutes-fr
    // Expected: 16
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_11() {
    //  Evaluates The 'minutes-from-time' function as part of a 'div' expression.
    // XPath: fn:minutes-from-time(xs:time(\"22:33:00Z\")) div fn:minutes-
    // Expected: 3
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_12() {
    //  Evaluates The 'minutes-from-time' function as part of a 'idiv' expression.
    // XPath: fn:minutes-from-time(xs:time(\"10:12:00Z\")) idiv fn:minutes
    // Expected: 6
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_13() {
    //  Evaluates The 'minutes-from-time' function as part of a 'mod' expression.
    // XPath: fn:minutes-from-time(xs:time(\"10:10:00Z\")) mod fn:minutes-
    // Expected: 1
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_14() {
    //  Evaluates The 'minutes-from-time' function as part of a 'numeric-unary-plus' ex
    // XPath: +fn:minutes-from-time(xs:time(\"10:00:00Z\"))
    // Expected: 0
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_15() {
    //  Evaluates The 'minutes-from-time' function as part of a 'numeric-unary-minus' e
    // XPath: -fn:minutes-from-time(xs:time(\"10:10:00Z\"))
    // Expected: -10
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_16() {
    //  Evaluates The 'minutes-from-time' function as part of a 'numeric-equal' express
    // XPath: fn:minutes-from-time(xs:time(\"10:02:00Z\")) eq fn:minutes-f
    // Expected: true
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_17() {
    //  Evaluates The 'minutes-from-time' function as part of a 'numeric-equal' express
    // XPath: fn:minutes-from-time(xs:time(\"10:00:00Z\")) ne fn:minutes-f
    // Expected: true
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_18() {
    //  Evaluates The 'minutes-from-time' function as part of a 'numeric-equal' express
    // XPath: fn:minutes-from-time(xs:time(\"10:00:00Z\")) le fn:minutes-f
    // Expected: true
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn fn_minutes_from_time_19() {
    //  Evaluates The 'minutes-from-time' function as part of a 'numeric-equal' express
    // XPath: fn:minutes-from-time(xs:time(\"10:03:00Z\")) ge fn:minutes-f
    // Expected: false
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn k_minutesfromtimefunc_3() {
    //  A test whose essence is: `empty(minutes-from-time(()))`.
    // XPath: empty(minutes-from-time(()))
    // Expected: true
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn k_minutesfromtimefunc_4() {
    //  A test whose essence is: `minutes-from-time(()) instance of xs:integer?`.
    // XPath: minutes-from-time(()) instance of xs:integer?
    // Expected: true
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}

#[test]
fn k_minutesfromtimefunc_5() {
    //  A test whose essence is: `minutes-from-time(xs:time('23:11:12.43')) eq 11`.
    // XPath: minutes-from-time(xs:time(\"23:11:12.43\")) eq 11
    // Expected: true
    // Calls stub function - will fail until fn:minutes-from-time is implemented
    let _ = stub_fnminutes_from_time();
}
