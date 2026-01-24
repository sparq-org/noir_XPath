//! Test chunk 0 for fn:adjust-date-to-timezone
//! Contains 33 tests

use dep::xpath::stub_fnadjust_date_to_timezone;

#[test]
fn fn_adjust_date_to_timezone1args_1() {
    //  Evaluates The 'adjust-date-to-timezone' function with the arguments set as foll
    // XPath: fn:adjust-date-to-timezone(xs:date(\"1970-01-01Z\"),xs:dayTi
    // Expected: 1969-12-31-10:00
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone1args_2() {
    //  Evaluates The 'adjust-date-to-timezone' function with the arguments set as foll
    // XPath: fn:adjust-date-to-timezone(xs:date(\"1983-11-17Z\"),xs:dayTi
    // Expected: 1983-11-16-10:00
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone1args_3() {
    //  Evaluates The 'adjust-date-to-timezone' function with the arguments set as foll
    // XPath: fn:adjust-date-to-timezone(xs:date(\"2030-12-31Z\"),xs:dayTi
    // Expected: 2030-12-30-10:00
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_1() {
    // Test Description: Evaluates The 'adjust-date-to-timezone' function as per exampl
    // XPath: fn:adjust-date-to-timezone(xs:date(\"2002-03-07-05:00\"),xs:
    // Expected: 2002-03-07-05:00
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_2() {
    // Test Description: Evaluates The 'adjust-date-to-timezone' function as per exampl
    // XPath: fn:adjust-date-to-timezone(xs:date(\"2002-03-07-07:00\"),xs:
    // Expected: 2002-03-07-05:00
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_3() {
    // Test Description: Evaluates The 'adjust-date-to-timezone' function as per exampl
    // XPath: let $tz := xs:dayTimeDuration(\"-PT10H\")           return f
    // Expected: 2002-03-07-10:00
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_4() {
    // Test Description: Evaluates The 'adjust-date-to-timezone' function as per exampl
    // XPath: let $tz := xs:dayTimeDuration(\"-PT10H\")           return f
    // Expected: 2002-03-06-10:00
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_5() {
    // Test Description: Evaluates The 'adjust-date-to-timezone' function as per exampl
    // XPath: fn:adjust-date-to-timezone(xs:date(\"2002-03-07\"), ())
    // Expected: 2002-03-07
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_6() {
    // Test Description: Evaluates The 'adjust-date-to-timezone' function as per exampl
    // XPath: fn:adjust-date-to-timezone(xs:date(\"2002-03-07-07:00\"), ()
    // Expected: 2002-03-07
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_7() {
    // Test Description: Evaluates The 'adjust-date-to-timezone' function using the emp
    // XPath: fn:count(fn:adjust-date-to-timezone(()))
    // Expected: 0
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_9() {
    // Test Description: Evaluates The 'adjust-date-to-timezone' function as part of a
    // XPath: fn:adjust-date-to-timezone(xs:date(\"2002-03-07-07:00\")) -
    // Expected: -P1461D
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_10() {
    // Test Description: Evaluates The 'adjust-date-to-timezone' function as part of an
    // XPath: fn:adjust-date-to-timezone(xs:date(\"2002-03-07-07:00\")) -
    // Expected: PT0S
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_11() {
    // Test Description: Evaluates The 'adjust-date-to-timezone' function as an argumen
    // XPath: fn:string(fn:adjust-date-to-timezone(xs:date(\"2002-03-07-04
    // Expected: 2002-03-07
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_12() {
    // Test Description: Evaluates the string value The 'adjust-date-to-timezone' funct
    // XPath: fn:boolean(fn:string(fn:adjust-date-to-timezone(xs:date(\"20
    // Expected: true
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_13() {
    // Test Description: Evaluates The string value of 'adjust-date-to-timezone' functi
    // XPath: fn:not(fn:string(fn:adjust-date-to-timezone(xs:date(\"2002-0
    // Expected: false
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_14() {
    // Test Description: Evaluates The string value of 'adjust-date-to-timezone' functi
    // XPath: fn:string(fn:adjust-date-to-timezone(xs:date(\"2002-03-07-04
    // Expected: true
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_15() {
    // Test Description: Evaluates The string value of 'adjust-date-to-timezone' functi
    // XPath: fn:string(fn:adjust-date-to-timezone(xs:date(\"2002-03-07-04
    // Expected: true
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_16() {
    // Test Description: Evaluates The string value of 'adjust-date-to-timezone' functi
    // XPath: fn:string(fn:adjust-date-to-timezone(xs:date(\"2002-03-07-04
    // Expected: true
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_17() {
    // Test Description: Evaluates The string value of 'adjust-date-to-timezone' functi
    // XPath: fn:string(fn:adjust-date-to-timezone(xs:date(\"2002-03-07-04
    // Expected: false
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_18() {
    // Test Description: Evaluates The 'adjust-date-to-timezone' function as part of a
    // XPath: let $tz := xs:dayTimeDuration(\"PT10H\")           return fn
    // Expected: -P1461DT10H
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_19() {
    // Test Description: Evaluates The 'adjust-date-to-timezone' function where an xs:d
    // XPath: let $tz := xs:dayTimeDuration(\"PT10H\")           return fn
    // Expected: P1095DT14H
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn fn_adjust_date_to_timezone_20() {
    // Test Description: Evaluates The 'adjust-date-to-timezone' function as part of a
    // XPath: fn:adjust-date-to-timezone(xs:date(\"2002-03-07-04:00\")) ge
    // Expected: false
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn k_adjdatetotimezonefunc_3() {
    //  A test whose essence is: `empty(adjust-date-to-timezone(()))`.
    // XPath: empty(adjust-date-to-timezone(()))
    // Expected: true
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn k_adjdatetotimezonefunc_4() {
    //  A test whose essence is: `empty(adjust-date-to-timezone((), ()))`.
    // XPath: empty(adjust-date-to-timezone((), ()))
    // Expected: true
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn k_adjdatetotimezonefunc_5() {
    //  A test whose essence is: `adjust-date-to-timezone(()) instance of xs:date?`.
    // XPath: adjust-date-to-timezone(()) instance of xs:date?
    // Expected: true
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn k_adjdatetotimezonefunc_9() {
    //  Example from F&O.
    // XPath: adjust-date-to-timezone(xs:date(\"2002-03-07\"), xs:dayTimeD
    // Expected: true
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn k_adjdatetotimezonefunc_10() {
    //  Example from F&O.
    // XPath: adjust-date-to-timezone(xs:date(\"2002-03-07-07:00\"), xs:da
    // Expected: true
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn k_adjdatetotimezonefunc_11() {
    //  Example from F&O.
    // XPath: adjust-date-to-timezone(xs:date(\"2002-03-07\"), xs:dayTimeD
    // Expected: true
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn k_adjdatetotimezonefunc_12() {
    //  Example from F&O.
    // XPath: adjust-date-to-timezone(xs:date(\"2002-03-07-07:00\"), xs:da
    // Expected: true
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn k_adjdatetotimezonefunc_13() {
    //  Example from F&O.
    // XPath: adjust-date-to-timezone(xs:date(\"2002-03-07\"), ()) eq xs:d
    // Expected: true
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn k_adjdatetotimezonefunc_14() {
    //  Example from F&O.
    // XPath: adjust-date-to-timezone(xs:date(\"2002-03-07-07:00\"), ()) e
    // Expected: true
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn cbcl_adjust_date_to_timezone_001() {
    // Check optimization codepath in adjust-date-to-timezone
    // XPath: adjust-date-to-timezone(current-date(), implicit-timezone())
    // Expected: true
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}

#[test]
fn cbcl_adjust_date_to_timezone_004() {
    // Check optimization codepath in adjust-date-to-timezone
    // XPath: adjust-date-to-timezone(current-date(), xs:dayTimeDuration(\
    // Expected: true
    // Calls stub function - will fail until fn:adjust-date-to-timezone is implemented
    let _ = stub_fnadjust_date_to_timezone();
}
