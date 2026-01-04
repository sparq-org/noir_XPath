//! Test chunk 0 for fn:timezone-from-time
//! Contains 25 tests

use dep::xpath::stub_fntimezone_from_time;

#[test]
fn fn_timezone_from_time_1() {
    //  Evaluates The 'timezone-from-time' function As per example 1 of the F&O specs (
    // XPath: fn:timezone-from-time(xs:time(\"13:20:00-05:00\"))
    // Expected: -PT5H
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_2() {
    //  Evaluates The 'timezone-from-time' function as per example 2 (for this function
    // XPath: fn:count(fn:timezone-from-time(xs:time(\"13:20:00\")))
    // Expected: 0
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_3() {
    //  Evaluates The 'timezone-from-time' function as part of a numeric greater than o
    // XPath: fn:timezone-from-time(xs:time(\"01:23:02Z\")) gt fn:timezone
    // Expected: false
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_4() {
    //  Evaluates The 'timezone-from-time' function as part of a numeric-less-than expr
    // XPath: fn:timezone-from-time(xs:time(\"01:10:20Z\")) le fn:timezone
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_5() {
    //  Evaluates The 'timezone-from-time' function using the empty sequence as an argu
    // XPath: fn:count(fn:timezone-from-time(()))
    // Expected: 0
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_6() {
    //  Evaluates The 'timezone-from-time' function that returns a dayTimeDuration of 0
    // XPath: fn:timezone-from-time(xs:time(\"00:59:00+00:00\"))
    // Expected: PT0S
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_7() {
    //  Evaluates The 'timezone-from-time' function with a timezone component of '-00:0
    // XPath: fn:timezone-from-time(xs:time(\"23:20:59-00:00\"))
    // Expected: PT0S
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_8() {
    //  Evaluates The 'timezone-from-time' function as part of a '+' expression.
    // XPath: fn:timezone-from-time(xs:time(\"02:00:00Z\")) + fn:timezone-
    // Expected: PT0S
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_9() {
    //  Evaluates The 'timezone-from-time' function as part of a '-' expression.
    // XPath: fn:timezone-from-time(xs:time(\"10:10:10Z\")) - fn:timezone-
    // Expected: PT0S
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_10() {
    //  Evaluates The 'timezone-from-time' function as an argument to the 'fn:not' func
    // XPath: fn:not(fn:string(fn:timezone-from-time(xs:time(\"02:02:03Z\"
    // Expected: false
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_11() {
    //  Evaluates The 'timezone-from-time' function as part of a 'div' expression.
    // XPath: fn:timezone-from-time(xs:time(\"22:33:10+10:00\")) div fn:ti
    // Expected: 2
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_12() {
    //  Evaluates The 'timezone-from-time' function as an argument to the 'fn:number' f
    // XPath: fn:number(fn:timezone-from-time(xs:time(\"10:12:15Z\")))
    // Expected: NaN
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_13() {
    //  Evaluates The 'timezone-from-time' function as an argument to the 'fn:boolean'
    // XPath: fn:boolean(fn:string(fn:timezone-from-time(xs:time(\"10:10:2
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_14() {
    //  Evaluates The 'timezone-from-time' function as an argument to the 'fn:string' f
    // XPath: fn:string(fn:timezone-from-time(xs:time(\"10:00:01Z\")))
    // Expected: PT0S
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_15() {
    //  Evaluates The 'timezone-from-time' function as part of an 'and' expression. Use
    // XPath: fn:string(fn:timezone-from-time(xs:time(\"10:10:01Z\"))) and
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_16() {
    //  Evaluates The 'timezone-from-time' function as part of a 'numeric-equal' expres
    // XPath: fn:timezone-from-time(xs:time(\"10:02:01Z\")) eq fn:timezone
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_17() {
    //  Evaluates The 'timezone-from-time' function as part of a 'numeric-equal' expres
    // XPath: fn:timezone-from-time(xs:time(\"10:00:01Z\")) ne fn:timezone
    // Expected: false
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_18() {
    //  Evaluates The 'timezone-from-time' function as part of a 'numeric-equal' expres
    // XPath: fn:timezone-from-time(xs:time(\"10:00:00Z\")) le fn:timezone
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_19() {
    //  Evaluates The 'timezone-from-time' function as part of a 'numeric-equal' expres
    // XPath: fn:timezone-from-time(xs:time(\"10:03:01Z\")) ge fn:timezone
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn fn_timezone_from_time_20() {
    //  Evaluates The 'timezone-from-time' function as part of an 'or' expression. Uses
    // XPath: fn:string(fn:timezone-from-time(xs:time(\"10:03:01Z\"))) or
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn k_timezonefromtimefunc_3() {
    //  A test whose essence is: `empty(timezone-from-time(()))`.
    // XPath: empty(timezone-from-time(()))
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn k_timezonefromtimefunc_4() {
    //  A test whose essence is: `timezone-from-time(()) instance of xs:dayTimeDuration
    // XPath: timezone-from-time(()) instance of xs:dayTimeDuration?
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn k_timezonefromtimefunc_5() {
    //  A test whose essence is: `timezone-from-time(xs:time('23:43:12.765Z')) eq xs:da
    // XPath: timezone-from-time(xs:time(\"23:43:12.765Z\")) eq xs:dayTime
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn k_timezonefromtimefunc_6() {
    //  A test whose essence is: `timezone-from-time(xs:time('23:43:12.765-08:23')) eq
    // XPath: timezone-from-time(xs:time(\"23:43:12.765-08:23\")) eq xs:da
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}

#[test]
fn k_timezonefromtimefunc_7() {
    //  A test whose essence is: `empty(timezone-from-time(xs:time('23:43:12.765')))`.
    // XPath: empty(timezone-from-time(xs:time(\"23:43:12.765\")))
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-time is implemented
    let _ = stub_fntimezone_from_time();
}
