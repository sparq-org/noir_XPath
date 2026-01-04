//! Test chunk 0 for fn:timezone-from-date
//! Contains 31 tests

use dep::xpath::stub_fntimezone_from_date;

#[test]
fn fn_timezone_from_date_1() {
    //  Evaluates The 'timezone-from-date' function As per example 1 of the F&O specs
    // XPath: fn:timezone-from-date(xs:date(\"1999-05-31-05:00\"))
    // Expected: -PT5H
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_2() {
    //  Evaluates The 'timezone-from-date' function As per example 2 of the F&O specs.
    // XPath: fn:timezone-from-date(xs:date(\"2000-06-12Z\"))
    // Expected: PT0S
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_3() {
    //  Evaluates The 'timezone-from-date' function involving a 'numeric-less-than' ope
    // XPath: fn:timezone-from-date(xs:date(\"1999-12-31+05:00\")) lt fn:t
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_4() {
    //  Evaluates The 'timezone-from-date' function involving a 'numeric-less-than' ope
    // XPath: fn:timezone-from-date(xs:date(\"1999-12-31+01:00\")) le fn:t
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_5() {
    //  Evaluates The 'timezone-from-date' function using the empty sequence as an argu
    // XPath: fn:count(fn:timezone-from-date(()))
    // Expected: 0
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_6() {
    //  Evaluates The 'timezone-from-date' function that returns a dayTimeDuration of 0
    // XPath: fn:timezone-from-date(xs:date(\"1999-05-31+00:00\"))
    // Expected: PT0S
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_7() {
    //  Evaluates The 'timezone-from-date' function that uses a timezone of -0.
    // XPath: fn:timezone-from-date(xs:date(\"1999-12-31-00:00\"))
    // Expected: PT0S
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_8() {
    //  Evaluates The 'timezone-from-date' function as part of a '+' expression.
    // XPath: fn:timezone-from-date(xs:date(\"1970-01-01+08:00\")) + fn:ti
    // Expected: PT11H
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_9() {
    //  Evaluates The 'timezone-from-date' function as part of a '-' expression.
    // XPath: fn:timezone-from-date(xs:date(\"1970-01-01+09:00\")) - fn:ti
    // Expected: -PT1H
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_10() {
    //  Evaluates The 'timezone-from-date' function as as an argument to the 'not' func
    // XPath: fn:not(fn:string(fn:timezone-from-date(xs:date(\"1970-01-03+
    // Expected: false
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_11() {
    //  Evaluates The 'timezone-from-date' function as part of a 'div' expression.
    // XPath: fn:timezone-from-date(xs:date(\"1970-01-02+10:00\")) div fn:
    // Expected: 2
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_12() {
    //  Evaluates The 'timezone-from-date' function as an argument to the fn:number fun
    // XPath: fn:number(fn:timezone-from-date(xs:date(\"1970-01-02+10:00\"
    // Expected: NaN
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_13() {
    //  Evaluates The 'timezone-from-date' function as an argument to the 'fn:boolean'
    // XPath: fn:boolean(fn:string(fn:timezone-from-date(xs:date(\"1970-01
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_14() {
    //  Evaluates The 'timezone-from-date' function as argument to the 'fn:string' func
    // XPath: fn:string(fn:timezone-from-date(xs:date(\"1970-01-01Z\")))
    // Expected: PT0S
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_15() {
    //  Evaluates The 'timezone-from-date' function as part of an 'and' expression. Use
    // XPath: fn:string(fn:timezone-from-date(xs:date(\"1970-01-01Z\"))) a
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_16() {
    //  Evaluates The 'timezone-from-date' function as part of a 'numeric-equal' expres
    // XPath: fn:timezone-from-date(xs:date(\"1970-01-02+10:00\")) eq fn:t
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_17() {
    //  Evaluates The 'month-from-date' function as part of a 'numeric-equal' expressio
    // XPath: fn:month-from-date(xs:date(\"1970-01-01+05:00\")) ne fn:mont
    // Expected: false
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_18() {
    //  Evaluates The 'timezone-from-date' function as part of a 'numeric-equal' expres
    // XPath: fn:timezone-from-date(xs:date(\"1970-01-01+04:00\")) le fn:t
    // Expected: false
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_19() {
    //  Evaluates The 'timezone-from-date' function as part of a 'numeric-equal' expres
    // XPath: fn:timezone-from-date(xs:date(\"1970-01-03+02:00\")) ge fn:t
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn fn_timezone_from_date_20() {
    //  Evaluates The 'timezone-from-date' function as part of an 'or' expression. Uses
    // XPath: fn:string(fn:timezone-from-date(xs:date(\"1970-01-01Z\"))) o
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn k_timezonefromdatefunc_3() {
    //  A test whose essence is: `empty(timezone-from-date(()))`.
    // XPath: empty(timezone-from-date(()))
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn k_timezonefromdatefunc_4() {
    //  A test whose essence is: `timezone-from-date(()) instance of xs:dayTimeDuration
    // XPath: timezone-from-date(()) instance of xs:dayTimeDuration?
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn k_timezonefromdatefunc_5() {
    //  A test whose essence is: `timezone-from-date(xs:date('2004-10-12Z')) eq xs:dayT
    // XPath: timezone-from-date(xs:date(\"2004-10-12Z\")) eq xs:dayTimeDu
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn k_timezonefromdatefunc_6() {
    //  A test whose essence is: `timezone-from-date(xs:date('2004-10-12-08:23')) eq xs
    // XPath: timezone-from-date(xs:date(\"2004-10-12-08:23\")) eq xs:dayT
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn k_timezonefromdatefunc_7() {
    //  A test whose essence is: `empty(timezone-from-date(xs:date('2004-10-12')))`.
    // XPath: empty(timezone-from-date(xs:date(\"2004-10-12\")))
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn cbcl_timezone_from_date_001() {
    //  test fn:timezone-from-date on fn:adjust-date-to-timezone
    // XPath: timezone-from-date(adjust-date-to-timezone(xs:date(\"1997-01
    // Expected: true
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn cbcl_timezone_from_date_003() {
    //  test fn:timezone-from-date
    // XPath: declare function local:timezone($arg as xs:integer) { if ($a
    // Expected: PT14H
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn cbcl_timezone_from_date_004() {
    //  test fn:timezone-from-date
    // XPath: declare function local:timezone($arg as xs:integer) { if ($a
    // Expected: -PT12H
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn cbcl_timezone_from_date_005() {
    //  test fn:timezone-from-date
    // XPath: declare function local:date($arg as xs:boolean) { if ($arg)
    // Expected: PT0S
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn cbcl_timezone_from_date_006() {
    //  test fn:timezone-from-date
    // XPath: declare function local:dateTime($arg as xs:boolean) { if ($a
    // Expected: PT0S
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}

#[test]
fn cbcl_timezone_from_date_007() {
    //  test fn:timezone-from-date
    // XPath: declare function local:time($arg as xs:boolean) { if ($arg)
    // Expected: PT0S
    // Calls stub function - will fail until fn:timezone-from-date is implemented
    let _ = stub_fntimezone_from_date();
}
