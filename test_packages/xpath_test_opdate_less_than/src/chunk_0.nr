//! Test chunk 0 for op:date-less-than
//! Contains 46 tests

use dep::xpath::stub_opdate_less_than;

#[test]
fn op_date_less_than2args_1() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: xs:date(\"1970-01-01Z\") lt xs:date(\"1970-01-01Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than2args_2() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: xs:date(\"1983-11-17Z\") lt xs:date(\"1970-01-01Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than2args_3() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: xs:date(\"2030-12-31Z\") lt xs:date(\"1970-01-01Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than2args_4() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: xs:date(\"1970-01-01Z\") lt xs:date(\"1983-11-17Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than2args_5() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: xs:date(\"1970-01-01Z\") lt xs:date(\"2030-12-31Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than2args_6() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: xs:date(\"1970-01-01Z\") ge xs:date(\"1970-01-01Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than2args_7() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: xs:date(\"1983-11-17Z\") ge xs:date(\"1970-01-01Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than2args_8() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: xs:date(\"2030-12-31Z\") ge xs:date(\"1970-01-01Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than2args_9() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: xs:date(\"1970-01-01Z\") ge xs:date(\"1983-11-17Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than2args_10() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: xs:date(\"1970-01-01Z\") ge xs:date(\"2030-12-31Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than_1() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: (xs:date(\"2004-12-25Z\") lt xs:date(\"2004-12-25-05:00\"))
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than_2() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: (xs:date(\"2004-12-25-12:00\") le xs:date(\"2004-12-26+12:00
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than_3() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: fn:not((xs:date(\"2005-12-25Z\") lt xs:date(\"2005-12-26Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than_4() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: fn:not(xs:date(\"2005-04-02Z\") le xs:date(\"2005-04-02Z\"))
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than_5() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: fn:not(xs:date(\"2000-12-25Z\") lt xs:date(\"2000-11-25Z\"))
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than_6() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: fn:not(xs:date(\"2005-10-25Z\") le xs:date(\"2005-10-23Z\"))
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than_7() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: (xs:date(\"2000-01-01Z\") lt xs:date(\"2000-01-01Z\")) and (
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than_8() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: (xs:date(\"2000-01-25Z\") le xs:date(\"2000-10-26Z\")) and (
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than_9() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: (xs:date(\"2000-10-26Z\") lt xs:date(\"2000-10-28Z\")) or (x
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than_10() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: (xs:date(\"1976-10-25Z\") le xs:date(\"1976-10-28Z\")) or (x
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than_11() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: (xs:date(\"1980-05-18Z\") lt xs:date(\"1980-05-17Z\")) or (f
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than_12() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: (xs:date(\"2000-10-25Z\") le xs:date(\"2000-10-26Z\")) or (f
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than_13() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: (xs:date(\"1980-01-01Z\") lt xs:date(\"1980-10-01Z\")) or (f
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn op_date_less_than_14() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: (xs:date(\"1980-10-25Z\") le xs:date(\"1980-10-26Z\")) or (f
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn k_datelt_1() {
    //  *******************************************************  Test: K-DateLT-1
    // XPath: xs:date(\"2004-07-12\") lt xs:date(\"2004-07-13\")
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn k_datelt_2() {
    //  *******************************************************  Test: K-DateLT-2
    // XPath: not(xs:date(\"2004-07-13\") lt xs:date(\"2004-07-12\"))
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn k_datelt_3() {
    //  *******************************************************  Test: K-DateLT-3
    // XPath: not(xs:date(\"2004-07-13\") lt xs:date(\"2004-07-13\"))
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn k_datelt_4() {
    //  *******************************************************  Test: K-DateLT-4
    // XPath: xs:date(\"2004-07-12\") le xs:date(\"2004-07-12\")
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn k_datelt_5() {
    //  *******************************************************  Test: K-DateLT-5
    // XPath: xs:date(\"2004-07-12\") le xs:date(\"2004-07-12\")
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn k_datelt_6() {
    //  *******************************************************  Test: K-DateLT-6
    // XPath: not(xs:date(\"2004-07-13\") le xs:date(\"2004-07-12\"))
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_001() {
    //  test comparison of date
    // XPath: declare function local:two-digit($number as xs:integer) {
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_002() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-30\") lt xs:date(\"2008-01-31+09:00\")
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_003() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31+09:00\") lt xs:date(\"2008-01-30\")
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_004() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31\") lt xs:date(\"2008-01-31+09:00\")
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_005() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31+09:00\") lt xs:date(\"2008-01-31\")
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_006() {
    //  test comparison of date
    // XPath: declare function local:two-digit($number as xs:integer) { le
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_007() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-30\") le xs:date(\"2008-01-31+09:00\")
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_008() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31+09:00\") le xs:date(\"2008-01-30\")
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_009() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31\") le xs:date(\"2008-01-31+09:00\")
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_010() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31+09:00\") le xs:date(\"2008-01-31\")
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_011() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:date, $null as xs:bo
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_012() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:date, $null as xs:bo
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_013() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:date, $null as xs:bo
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_014() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:date, $null as xs:bo
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_015() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:string, $timezone as
    // Expected: false
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}

#[test]
fn cbcl_date_less_than_016() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:string, $timezone as
    // Expected: true
    // Calls stub function - will fail until op:date-less-than is implemented
    let _ = stub_opdate_less_than();
}
