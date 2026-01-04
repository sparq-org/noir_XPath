//! Test chunk 0 for op:date-equal
//! Contains 45 tests

use dep::xpath::stub_opdate_equal;

#[test]
fn op_date_equal2args_1() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1970-01-01Z\") eq xs:date(\"1970-01-01Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_2() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1983-11-17Z\") eq xs:date(\"1970-01-01Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_3() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"2030-12-31Z\") eq xs:date(\"1970-01-01Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_4() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1970-01-01Z\") eq xs:date(\"1983-11-17Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_5() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1970-01-01Z\") eq xs:date(\"2030-12-31Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_6() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1970-01-01Z\") ne xs:date(\"1970-01-01Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_7() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1983-11-17Z\") ne xs:date(\"1970-01-01Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_8() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"2030-12-31Z\") ne xs:date(\"1970-01-01Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_9() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1970-01-01Z\") ne xs:date(\"1983-11-17Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_10() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1970-01-01Z\") ne xs:date(\"2030-12-31Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_11() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1970-01-01Z\") le xs:date(\"1970-01-01Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_12() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1983-11-17Z\") le xs:date(\"1970-01-01Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_13() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"2030-12-31Z\") le xs:date(\"1970-01-01Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_14() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1970-01-01Z\") le xs:date(\"1983-11-17Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_15() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1970-01-01Z\") le xs:date(\"2030-12-31Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_16() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1970-01-01Z\") ge xs:date(\"1970-01-01Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_17() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1983-11-17Z\") ge xs:date(\"1970-01-01Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_18() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"2030-12-31Z\") ge xs:date(\"1970-01-01Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_19() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1970-01-01Z\") ge xs:date(\"1983-11-17Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn op_date_equal2args_20() {
    //  ******************************************************* Test: op-date-equal2arg
    // XPath: xs:date(\"1970-01-01Z\") ge xs:date(\"2030-12-31Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn k_dateeq_1() {
    //  *******************************************************  Test: K-DateEQ-1
    // XPath: xs:date(\"2004-08-12\") eq xs:date(\"2004-08-12\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn k_dateeq_2() {
    //  *******************************************************  Test: K-DateEQ-2
    // XPath: not(xs:date(\"2004-08-12\") eq xs:date(\"2003-08-12\"))
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn k_dateeq_3() {
    //  *******************************************************  Test: K-DateEQ-3
    // XPath: xs:date(\"2004-08-12\") ne xs:date(\"2004-07-12\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn k_dateeq_4() {
    //  *******************************************************  Test: K-DateEQ-4
    // XPath: not(xs:date(\"2004-07-12\") ne xs:date(\"2004-07-12\"))
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn k_dateeq_5() {
    //  *******************************************************  Test: K-DateEQ-5
    // XPath: xs:date(\"1999-12-04-00:00\") eq xs:date(\"1999-12-04Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn k_dateeq_6() {
    //  *******************************************************  Test: K-DateEQ-6
    // XPath: xs:date(\"1999-12-04+00:00\") eq xs:date(\"1999-12-04Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn k_dateeq_7() {
    //  *******************************************************  Test: K-DateEQ-7
    // XPath: xs:date(\"1999-12-04Z\") eq xs:date(\"1999-12-04Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn k_dateeq_8() {
    //  *******************************************************  Test: K-DateEQ-8
    // XPath: xs:date(\"1999-12-04-00:00\") eq xs:date(\"1999-12-04+00:00\
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn k2_dateeq_1() {
    //  *******************************************************  Test: K2-DateEQ-1
    // XPath: xs:time(\"01:01:01-03:00\") ne xs:time(\"01:01:01+03:00\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_001() {
    //  test comparison of date
    // XPath: declare function local:two-digit($number as xs:integer) { le
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_002() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-30\") eq xs:date(\"2008-01-31+09:00\")
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_003() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31+09:00\") eq xs:date(\"2008-01-30\")
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_004() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31\") eq xs:date(\"2008-01-31+09:00\")
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_005() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31+09:00\") eq xs:date(\"2008-01-31\")
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_006() {
    //  test comparison of date
    // XPath: declare function local:two-digit($number as xs:integer) { le
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_007() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-30\") ne xs:date(\"2008-01-31+09:00\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_008() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31+09:00\") ne xs:date(\"2008-01-30\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_009() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31\") ne xs:date(\"2008-01-31+09:00\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_010() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31+09:00\") ne xs:date(\"2008-01-31\")
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_011() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:date, $null as xs:bo
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_012() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:date, $null as xs:bo
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_013() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:date, $null as xs:bo
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_014() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:date, $null as xs:bo
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_015() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:string, $timezone as
    // Expected: true
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}

#[test]
fn cbcl_date_equal_016() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:string, $timezone as
    // Expected: false
    // Calls stub function - will fail until op:date-equal is implemented
    let _ = stub_opdate_equal();
}
