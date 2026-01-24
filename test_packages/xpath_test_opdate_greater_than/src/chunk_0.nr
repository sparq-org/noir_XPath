//! Test chunk 0 for op:date-greater-than
//! Contains 46 tests

use dep::xpath::stub_opdate_greater_than;

#[test]
fn op_date_greater_than2args_1() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: xs:date(\"1970-01-01Z\") gt xs:date(\"1970-01-01Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than2args_2() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: xs:date(\"1983-11-17Z\") gt xs:date(\"1970-01-01Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than2args_3() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: xs:date(\"2030-12-31Z\") gt xs:date(\"1970-01-01Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than2args_4() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: xs:date(\"1970-01-01Z\") gt xs:date(\"1983-11-17Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than2args_5() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: xs:date(\"1970-01-01Z\") gt xs:date(\"2030-12-31Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than2args_6() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: xs:date(\"1970-01-01Z\") le xs:date(\"1970-01-01Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than2args_7() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: xs:date(\"1983-11-17Z\") le xs:date(\"1970-01-01Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than2args_8() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: xs:date(\"2030-12-31Z\") le xs:date(\"1970-01-01Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than2args_9() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: xs:date(\"1970-01-01Z\") le xs:date(\"1983-11-17Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than2args_10() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: xs:date(\"1970-01-01Z\") le xs:date(\"2030-12-31Z\")
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than_1() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: (xs:date(\"2004-12-25Z\") gt xs:date(\"2004-12-25+07:00\"))
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than_2() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: (xs:date(\"2004-12-25-12:00\") gt xs:date(\"2004-12-26+12:00
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than_3() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: fn:not((xs:date(\"2005-12-26Z\") gt xs:date(\"2005-12-25Z\")
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than_4() {
    //  ******************************************************* Test: op-date-less-than
    // XPath: fn:not(xs:date(\"2005-04-02Z\") ge xs:date(\"2005-04-02Z\"))
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than_5() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: fn:not(xs:date(\"2000-11-09Z\") gt xs:date(\"2000-11-10Z\"))
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than_6() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: fn:not(xs:date(\"2005-10-23Z\") ge xs:date(\"2005-10-25Z\"))
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than_7() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: (xs:date(\"2000-01-01Z\") gt xs:date(\"2000-01-01Z\")) and (
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than_8() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: (xs:date(\"2000-01-25Z\") ge xs:date(\"2000-10-26Z\")) and (
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than_9() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: (xs:date(\"2000-10-26Z\") gt xs:date(\"2000-10-28Z\")) or (x
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than_10() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: (xs:date(\"1976-10-25Z\") ge xs:date(\"1976-10-28Z\")) or (x
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than_11() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: (xs:date(\"1980-05-18Z\") gt xs:date(\"1980-05-17Z\")) or (f
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than_12() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: (xs:date(\"2000-10-25Z\") ge xs:date(\"2000-10-26Z\")) or (f
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than_13() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: (xs:date(\"1980-01-01Z\") gt xs:date(\"1980-10-01Z\")) or (f
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn op_date_greater_than_14() {
    //  ******************************************************* Test: op-date-greater-t
    // XPath: (xs:date(\"1980-10-25Z\") ge xs:date(\"1980-10-26Z\")) or (f
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn k_dategt_1() {
    //  *******************************************************  Test: K-DateGT-1
    // XPath: xs:date(\"2004-07-13\") gt xs:date(\"2004-07-12\")
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn k_dategt_2() {
    //  *******************************************************  Test: K-DateGT-2
    // XPath: not(xs:date(\"2004-07-12\") gt xs:date(\"2004-07-12\"))
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn k_dategt_3() {
    //  *******************************************************  Test: K-DateGT-3
    // XPath: not(xs:date(\"2004-07-12\") gt xs:date(\"2004-07-13\"))
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn k_dategt_4() {
    //  *******************************************************  Test: K-DateGT-4
    // XPath: xs:date(\"2004-07-12\") ge xs:date(\"2004-07-12\")
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn k_dategt_5() {
    //  *******************************************************  Test: K-DateGT-5
    // XPath: xs:date(\"2004-07-13\") ge xs:date(\"2004-07-12\")
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn k_dategt_6() {
    //  *******************************************************  Test: K-DateGT-6
    // XPath: not(xs:date(\"2004-07-11\") ge xs:date(\"2004-07-12\"))
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_equal_001() {
    //  test comparison of date
    // XPath: declare function local:two-digit($number as xs:integer) { le
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_equal_002() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-30\") lt xs:date(\"2008-01-31+09:00\")
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_equal_003() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31+09:00\") lt xs:date(\"2008-01-30\")
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_equal_004() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31\") lt xs:date(\"2008-01-31+09:00\")
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_equal_005() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31+09:00\") lt xs:date(\"2008-01-31\")
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_equal_006() {
    //  test comparison of date
    // XPath: declare function local:two-digit($number as xs:integer) { le
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_equal_007() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-30\") ge xs:date(\"2008-01-31+09:00\")
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_equal_008() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31+09:00\") ge xs:date(\"2008-01-30\")
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_equal_009() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31\") ge xs:date(\"2008-01-31+09:00\")
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_equal_010() {
    //  test comparison of date
    // XPath: xs:date(\"2008-01-31+09:00\") ge xs:date(\"2008-01-31\")
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_than_011() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:date, $null as xs:bo
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_than_012() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:date, $null as xs:bo
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_than_013() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:date, $null as xs:bo
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_than_014() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:date, $null as xs:bo
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_than_015() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:string, $timezone as
    // Expected: false
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}

#[test]
fn cbcl_date_greater_than_016() {
    //  test comparison of date
    // XPath: declare function local:date($date as xs:string, $timezone as
    // Expected: true
    // Calls stub function - will fail until op:date-greater-than is implemented
    let _ = stub_opdate_greater_than();
}
