//! Test chunk 0 for fn:adjust-time-to-timezone
//! Contains 36 tests

use dep::xpath::stub_fnadjust_time_to_timezone;

#[test]
fn fn_adjust_time_to_timezone1args_1() {
    //  Evaluates The 'adjust-time-to-timezone' function with the arguments set as foll
    // XPath: fn:adjust-time-to-timezone(xs:time(\"00:00:00Z\"),xs:dayTime
    // Expected: 14:00:00-10:00
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone1args_2() {
    //  Evaluates The 'adjust-time-to-timezone' function with the arguments set as foll
    // XPath: fn:adjust-time-to-timezone(xs:time(\"08:03:35Z\"),xs:dayTime
    // Expected: 22:03:35-10:00
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone1args_3() {
    //  Evaluates The 'adjust-time-to-timezone' function with the arguments set as foll
    // XPath: fn:adjust-time-to-timezone(xs:time(\"23:59:59Z\"),xs:dayTime
    // Expected: 13:59:59-10:00
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_1() {
    // Test Description: Evaluates The 'adjust-time-to-timezone' function as per exampl
    // XPath: fn:adjust-time-to-timezone(xs:time(\"10:00:00-05:00\"),xs:da
    // Expected: 10:00:00-05:00
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_2() {
    // Test Description: Evaluates The 'adjust-time-to-timezone' function as per exampl
    // XPath: fn:adjust-time-to-timezone(xs:time(\"10:00:00-07:00\"),xs:da
    // Expected: 12:00:00-05:00
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_3() {
    // Test Description: Evaluates The 'adjust-time-to-timezone' function as per exampl
    // XPath: let $tz := xs:dayTimeDuration(\"-PT10H\")           return f
    // Expected: 10:00:00-10:00
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_4() {
    // Test Description: Evaluates The 'adjust-time-to-timezone' function as per exampl
    // XPath: let $tz := xs:dayTimeDuration(\"-PT10H\")           return f
    // Expected: 07:00:00-10:00
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_5() {
    // Test Description: Evaluates The 'adjust-time-to-timezone' function as per exampl
    // XPath: fn:adjust-time-to-timezone(xs:time(\"10:00:00-05:00\"),())
    // Expected: 10:00:00
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_6() {
    // Test Description: Evaluates The 'adjust-time-to-timezone' function as per exampl
    // XPath: fn:adjust-time-to-timezone(xs:time(\"10:00:00-07:00\"), ())
    // Expected: 10:00:00
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_7() {
    // Test Description: Evaluates The 'adjust-time-to-timezone' function as per exampl
    // XPath: fn:adjust-time-to-timezone(xs:time(\"10:00:00-07:00\"), xs:d
    // Expected: 03:00:00+10:00
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_8() {
    // Test Description: Evaluates The 'adjust-time-to-timezone' function using the emp
    // XPath: fn:count(fn:adjust-time-to-timezone((),()))
    // Expected: 0
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_9() {
    // Test Description: Evaluates The 'adjust-time-to-timezone' function as part of a
    // XPath: fn:adjust-time-to-timezone(xs:time(\"09:00:00Z\"),()) - fn:a
    // Expected: -PT1H
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_10() {
    // Test Description: Evaluates The 'adjust-time-to-timezone' function as part of an
    // XPath: fn:adjust-time-to-timezone(xs:time(\"10:00:00Z\"),()) - fn:a
    // Expected: PT0S
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_11() {
    // Test Description: Evaluates The 'adjust-time-to-timezone' function as an argumen
    // XPath: fn:string(fn:adjust-time-to-timezone(xs:time(\"10:00:00Z\"),
    // Expected: 10:00:00
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_12() {
    // Test Description: Evaluates The string value 'adjust-time-to-timezone' function
    // XPath: fn:boolean(fn:string(fn:adjust-time-to-timezone(xs:time(\"10
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_13() {
    // Test Description: Evaluates The string value of 'adjust-time-to-timezone' functi
    // XPath: fn:not(fn:string(fn:adjust-time-to-timezone(xs:time(\"10:00:
    // Expected: false
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_14() {
    // Test Description: Evaluates The string value of 'adjust-time-to-timezone' functi
    // XPath: fn:string(fn:adjust-time-to-timezone(xs:time(\"10:00:00Z\"),
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_15() {
    // Test Description: Evaluates The string value of 'adjust-time-to-timezone' functi
    // XPath: fn:string(fn:adjust-time-to-timezone(xs:time(\"10:00:00Z\"),
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_16() {
    // Test Description: Evaluates The string value of 'adjust-time-to-timezone' functi
    // XPath: fn:string(fn:adjust-time-to-timezone(xs:time(\"10:00:00Z\"),
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_17() {
    // Test Description: Evaluates The string value of 'adjust-time-to-timezone' functi
    // XPath: fn:string(fn:adjust-time-to-timezone(xs:time(\"10:00:00Z\"),
    // Expected: false
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_18() {
    // Test Description: Evaluates The 'adjust-time-to-timezone' function as part of a
    // XPath: let $tz := xs:dayTimeDuration(\"PT10H\")           return fn
    // Expected: -PT9H
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_19() {
    // Test Description: Evaluates The 'adjust-time-to-timezone' function where an xs:t
    // XPath: let $tz := xs:dayTimeDuration(\"PT10H\")           return fn
    // Expected: PT1H
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn fn_adjust_time_to_timezone_20() {
    // Test Description: Evaluates The 'adjust-time-to-timezone' function as part of a
    // XPath: fn:adjust-time-to-timezone(xs:time(\"10:00:00Z\"),()) ge fn:
    // Expected: false
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn k_adjtimetotimezonefunc_3() {
    //  A test whose essence is: `empty(adjust-time-to-timezone(()))`.
    // XPath: empty(adjust-time-to-timezone(()))
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn k_adjtimetotimezonefunc_4() {
    //  A test whose essence is: `empty(adjust-time-to-timezone((), ()))`.
    // XPath: empty(adjust-time-to-timezone((), ()))
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn k_adjtimetotimezonefunc_5() {
    //  A test whose essence is: `adjust-time-to-timezone(()) instance of xs:time?`.
    // XPath: adjust-time-to-timezone(()) instance of xs:time?
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn k_adjtimetotimezonefunc_9() {
    //  Test that the implicit timezone in the dynamic context is used if $timezone is
    // XPath: timezone-from-time(adjust-time-to-timezone(xs:time(\"00:00:0
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn k_adjtimetotimezonefunc_10() {
    //  Example from F&O.
    // XPath: adjust-time-to-timezone(xs:time(\"10:00:00\"), xs:dayTimeDur
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn k_adjtimetotimezonefunc_11() {
    //  Example from F&O.
    // XPath: adjust-time-to-timezone(xs:time(\"10:00:00-07:00\"), xs:dayT
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn k_adjtimetotimezonefunc_12() {
    //  Example from F&O.
    // XPath: adjust-time-to-timezone(xs:time(\"10:00:00\"), xs:dayTimeDur
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn k_adjtimetotimezonefunc_13() {
    //  Example from F&O.
    // XPath: adjust-time-to-timezone(xs:time(\"10:00:00-07:00\"), xs:dayT
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn k_adjtimetotimezonefunc_14() {
    //  Example from F&O.
    // XPath: adjust-time-to-timezone(xs:time(\"10:00:00\"), ()) eq xs:tim
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn k_adjtimetotimezonefunc_15() {
    //  Example from F&O.
    // XPath: adjust-time-to-timezone(xs:time(\"10:00:00-07:00\"), ()) eq
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn k_adjtimetotimezonefunc_16() {
    //  Example from F&O.
    // XPath: adjust-time-to-timezone(xs:time(\"10:00:00-07:00\"), xs:dayT
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn cbcl_adjust_time_to_timezone_001() {
    // Check optimization codepath in adjust-time-to-timezone
    // XPath: adjust-time-to-timezone(current-time(), implicit-timezone())
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}

#[test]
fn cbcl_adjust_time_to_timezone_002() {
    // Trigger EvaluateToItem in adjust-time-to-timezone
    // XPath: adjust-time-to-timezone(xs:time(\"12:00:00Z\")) eq adjust-ti
    // Expected: true
    // Calls stub function - will fail until fn:adjust-time-to-timezone is implemented
    let _ = stub_fnadjust_time_to_timezone();
}
