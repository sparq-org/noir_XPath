//! Test chunk 0 for fn:adjust-dateTime-to-timezone
//! Contains 38 tests

use dep::xpath::stub_fnadjust_datetime_to_timezone;

#[test]
fn fn_adjust_datetime_to_timezone1args_1() {
    //  Evaluates The 'adjust-dateTime-to-timezone' function with the arguments set as
    // XPath: fn:adjust-dateTime-to-timezone(xs:dateTime(\"1970-01-01T00:0
    // Expected: 1969-12-31T14:00:00-10:00
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone1args_2() {
    //  Evaluates The 'adjust-dateTime-to-timezone' function with the arguments set as
    // XPath: fn:adjust-dateTime-to-timezone(xs:dateTime(\"1996-04-07T01:4
    // Expected: 1996-04-06T15:40:52-10:00
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone1args_3() {
    //  Evaluates The 'adjust-dateTime-to-timezone' function with the arguments set as
    // XPath: fn:adjust-dateTime-to-timezone(xs:dateTime(\"2030-12-31T23:5
    // Expected: 2030-12-31T13:59:59-10:00
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_1() {
    // Test Description: Evaluates The 'adjust-dateTime-to-timezone' function as per ex
    // XPath: fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:0
    // Expected: 2002-03-07T10:00:00-05:00
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_2() {
    // Test Description: Evaluates The 'adjust-dateTime-to-timezone' function as per ex
    // XPath: fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:0
    // Expected: 2002-03-07T12:00:00-05:00
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_3() {
    // Test Description: Evaluates The 'adjust-dateTime-to-timezone' function as per ex
    // XPath: let $tz := xs:dayTimeDuration(\"-PT10H\") return fn:adjust-d
    // Expected: 2002-03-07T10:00:00-10:00
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_4() {
    // Test Description: Evaluates The 'adjust-dateTime-to-timezone' function as per ex
    // XPath: let $tz := xs:dayTimeDuration(\"-PT10H\") return fn:adjust-d
    // Expected: 2002-03-07T07:00:00-10:00
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_5() {
    // Test Description: Evaluates The 'adjust-dateTime-to-timezone' function as per ex
    // XPath: fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:0
    // Expected: 2002-03-08T03:00:00+10:00
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_6() {
    // Test Description: Evaluates The 'adjust-dateTime-to-timezone' function as per ex
    // XPath: fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T00:0
    // Expected: 2002-03-06T15:00:00-08:00
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_7() {
    // Test Description: Evaluates The 'adjust-dateTime-to-timezone' function as per ex
    // XPath: fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:0
    // Expected: 2002-03-07T10:00:00
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_8() {
    // Test Description: Evaluates The 'adjust-dateTime-to-timezone' function as per ex
    // XPath: fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:0
    // Expected: 2002-03-07T10:00:00
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_9() {
    // Test Description: Evaluates The 'adjust-dateTime-to-timezone' function as part o
    // XPath: fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:0
    // Expected: -P1461D
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_10() {
    // Test Description: Evaluates The 'adjust-dateTime-to-timezone' function as part o
    // XPath: fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:0
    // Expected: PT0S
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_11() {
    // Test Description: Evaluates The 'adjust-dateTime-to-timezone' function as an arg
    // XPath: fn:string(fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-
    // Expected: 2002-03-07T10:00:00
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_12() {
    // Test Description: Evaluates string value The 'adjust-dateTime-to-timezone' funct
    // XPath: fn:boolean(fn:string(fn:adjust-dateTime-to-timezone(xs:dateT
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_13() {
    // Test Description: Evaluates The string value of 'adjust-dateTime-to-timezone' fu
    // XPath: fn:not(fn:string(fn:adjust-dateTime-to-timezone(xs:dateTime(
    // Expected: false
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_14() {
    // Test Description: Evaluates The string value 'adjust-dateTime-to-timezone' funct
    // XPath: fn:string(fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_15() {
    // Test Description: Evaluates The string value 'adjust-dateTime-to-timezone' funct
    // XPath: fn:string(fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_16() {
    // Test Description: Evaluates string value The 'adjust-dateTime-to-timezone' funct
    // XPath: fn:string(fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_17() {
    // Test Description: Evaluates The string value of 'adjust-dateTime-to-timezone' fu
    // XPath: fn:string(fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-
    // Expected: false
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_18() {
    // Test Description: Evaluates The 'adjust-dateTime-to-timezone' function as part o
    // XPath: fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:0
    // Expected: -P1461DT1H
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_19() {
    // Test Description: Evaluates The 'adjust-dateTime-to-timezone' function where an
    // XPath: fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:0
    // Expected: P364DT23H
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_20() {
    // Test Description: Evaluates The 'adjust-dateTime-to-timezone' function as part o
    // XPath: fn:adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:0
    // Expected: false
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn fn_adjust_datetime_to_timezone_21() {
    // Test Description: Evaluates The 'adjust-dateTime-to-timezone' function using the
    // XPath: fn:count(fn:adjust-dateTime-to-timezone(()))
    // Expected: 0
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn k_adjdatetimetotimezonefunc_3() {
    //  A test whose essence is: `empty(adjust-dateTime-to-timezone(()))`.
    // XPath: empty(adjust-dateTime-to-timezone(()))
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn k_adjdatetimetotimezonefunc_4() {
    //  A test whose essence is: `empty(adjust-dateTime-to-timezone((), ()))`.
    // XPath: empty(adjust-dateTime-to-timezone((), ()))
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn k_adjdatetimetotimezonefunc_5() {
    //  A test whose essence is: `adjust-dateTime-to-timezone(()) instance of xs:dateTi
    // XPath: adjust-dateTime-to-timezone(()) instance of xs:dateTime?
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn k_adjdatetimetotimezonefunc_6() {
    //  Test that the implicit timezone in the dynamic context is used if $timezone is
    // XPath: timezone-from-dateTime(adjust-dateTime-to-timezone(xs:dateTi
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn k_adjdatetimetotimezonefunc_10() {
    //  Example from F&O.
    // XPath: adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:00:0
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn k_adjdatetimetotimezonefunc_11() {
    //  Example from F&O.
    // XPath: adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:00:0
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn k_adjdatetimetotimezonefunc_12() {
    //  Example from F&O.
    // XPath: adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:00:0
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn k_adjdatetimetotimezonefunc_13() {
    //  Example from F&O.
    // XPath: adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:00:0
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn k_adjdatetimetotimezonefunc_14() {
    //  Example from F&O.
    // XPath: adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:00:0
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn k_adjdatetimetotimezonefunc_15() {
    //  Example from F&O.
    // XPath: adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T00:00:0
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn k_adjdatetimetotimezonefunc_16() {
    //  Example from F&O.
    // XPath: adjust-dateTime-to-timezone(xs:dateTime(\"2002-03-07T10:00:0
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn k2_adjdatetimetotimezonefunc_1() {
    //  Ensure dateTime values are properly normalized.
    // XPath: fn:adjust-dateTime-to-timezone(xs:dateTime(\"1999-12-31T24:0
    // Expected: 2000-01-01T00:00:00
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn cbcl_adjust_datetime_to_timezone_001() {
    // Check optimization codepath in adjust-dateTime-to-timezone
    // XPath: adjust-dateTime-to-timezone(current-dateTime(), implicit-tim
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}

#[test]
fn cbcl_adjust_datetime_to_timezone_004() {
    // Check optimization codepath in adjust-dateTime-to-timezone
    // XPath: adjust-dateTime-to-timezone(current-dateTime(), xs:dayTimeDu
    // Expected: true
    // Calls stub function - will fail until fn:adjust-dateTime-to-timezone is implemented
    let _ = stub_fnadjust_datetime_to_timezone();
}
