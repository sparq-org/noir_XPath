//! Test chunk 0 for fn:seconds-from-time
//! Contains 25 tests

use dep::xpath::stub_fnseconds_from_time;

#[test]
fn fn_seconds_from_time1args_1() {
    //  Evaluates The 'seconds-from-time' function with the arguments set as follows: $
    // XPath: fn:seconds-from-time(xs:time(\"00:00:00Z\"))
    // Expected: 0
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time1args_2() {
    //  Evaluates The 'seconds-from-time' function with the arguments set as follows: $
    // XPath: fn:seconds-from-time(xs:time(\"08:03:35Z\"))
    // Expected: 35
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time1args_3() {
    //  Evaluates The 'seconds-from-time' function with the arguments set as follows: $
    // XPath: fn:seconds-from-time(xs:time(\"23:59:59Z\"))
    // Expected: 59
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_1() {
    //  Evaluates The 'seconds-from-time' function As per example 1 of the F&O specs (f
    // XPath: fn:seconds-from-time(xs:time(\"13:20:10.5\"))
    // Expected: 10.5
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_2() {
    //  Evaluates The 'seconds-from-time' function used as part of a numeric less than
    // XPath: fn:seconds-from-time(xs:time(\"21:23:04Z\")) lt fn:seconds-f
    // Expected: false
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_3() {
    //  Evaluates The 'seconds-from-time' function as part of a numeric greater than op
    // XPath: fn:seconds-from-time(xs:time(\"01:23:02Z\")) gt fn:seconds-f
    // Expected: false
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_4() {
    //  Evaluates The 'seconds-from-time' function used as an argument to an avg functi
    // XPath: fn:avg((fn:seconds-from-time(xs:time(\"01:10:20Z\")), fn:sec
    // Expected: 25
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_5() {
    //  Evaluates The 'seconds-from-time' function using the empty sequence as an argum
    // XPath: fn:count(fn:seconds-from-time(()))
    // Expected: 0
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_6() {
    //  Evaluates The 'seconds-from-time' function that returns 0.
    // XPath: fn:hours-from-time(xs:time(\"00:59:00Z\"))
    // Expected: 0
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_7() {
    //  Evaluates The 'seconds-from-time' function with the argument set to return 59.
    // XPath: fn:seconds-from-time(xs:time(\"23:20:59Z\"))
    // Expected: 59
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_8() {
    //  Evaluates The 'seconds-from-time' function as part of a '+' expression.
    // XPath: fn:seconds-from-time(xs:time(\"02:00:00Z\")) + fn:seconds-fr
    // Expected: 10
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_9() {
    //  Evaluates The 'seconds-from-time' function as part of a '-' expression.
    // XPath: fn:seconds-from-time(xs:time(\"10:10:10Z\")) - fn:seconds-fr
    // Expected: 3
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_10() {
    //  Evaluates The 'seconds-from-time' function as part of a '*' expression.
    // XPath: fn:seconds-from-time(xs:time(\"02:02:03Z\")) * fn:seconds-fr
    // Expected: 27
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_11() {
    //  Evaluates The 'seconds-from-time' function as part of a 'div' expression.
    // XPath: fn:seconds-from-time(xs:time(\"22:33:10Z\")) div fn:seconds-
    // Expected: 5
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_12() {
    //  Evaluates The 'seconds-from-time' function as part of a 'idiv' expression.
    // XPath: fn:seconds-from-time(xs:time(\"10:12:15Z\")) idiv fn:seconds
    // Expected: 5
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_13() {
    //  Evaluates The 'seconds-from-time' function as part of a 'mod' expression.
    // XPath: fn:seconds-from-time(xs:time(\"10:10:20Z\")) mod fn:seconds-
    // Expected: 0
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_14() {
    //  Evaluates The 'seconds-from-time' function as part of a 'numeric-unary-plus' ex
    // XPath: +fn:seconds-from-time(xs:time(\"10:00:01Z\"))
    // Expected: 1
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_15() {
    //  Evaluates The 'seconds-from-time' function as part of a 'numeric-unary-minus' e
    // XPath: -fn:seconds-from-time(xs:time(\"10:10:01Z\"))
    // Expected: -1
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_16() {
    //  Evaluates The 'seconds-from-time' function as part of a 'numeric-equal' express
    // XPath: fn:seconds-from-time(xs:time(\"10:02:01Z\")) eq fn:seconds-f
    // Expected: false
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_17() {
    //  Evaluates The 'seconds-from-time' function as part of a 'numeric-equal' express
    // XPath: fn:seconds-from-time(xs:time(\"10:00:01Z\")) ne fn:seconds-f
    // Expected: true
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_18() {
    //  Evaluates The 'seconds-from-time' function as part of a 'numeric-equal' express
    // XPath: fn:seconds-from-time(xs:time(\"10:00:00Z\")) le fn:seconds-f
    // Expected: true
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn fn_seconds_from_time_19() {
    //  Evaluates The 'seconds-from-time' function as part of a 'numeric-equal' express
    // XPath: fn:seconds-from-time(xs:time(\"10:03:01Z\")) ge fn:seconds-f
    // Expected: false
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn k_secondsfromtimefunc_3() {
    //  A test whose essence is: `empty(seconds-from-time(()))`.
    // XPath: empty(seconds-from-time(()))
    // Expected: true
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn k_secondsfromtimefunc_4() {
    //  A test whose essence is: `seconds-from-time(()) instance of xs:decimal?`.
    // XPath: seconds-from-time(()) instance of xs:decimal?
    // Expected: true
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}

#[test]
fn k_secondsfromtimefunc_5() {
    //  Simple test invoking seconds-from-time().
    // XPath: seconds-from-time(xs:time(\"23:11:12.43\")) eq 12.43
    // Expected: true
    // Calls stub function - will fail until fn:seconds-from-time is implemented
    let _ = stub_fnseconds_from_time();
}
