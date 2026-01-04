//! Test chunk 0 for op:time-greater-than
//! Contains 44 tests

use dep::xpath::stub_optime_greater_than;

#[test]
fn op_time_greater_than2args_1() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: xs:time(\"00:00:00Z\") gt xs:time(\"00:00:00Z\")
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than2args_2() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: xs:time(\"08:03:35Z\") gt xs:time(\"00:00:00Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than2args_3() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: xs:time(\"23:59:59Z\") gt xs:time(\"00:00:00Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than2args_4() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: xs:time(\"00:00:00Z\") gt xs:time(\"08:03:35Z\")
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than2args_5() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: xs:time(\"00:00:00Z\") gt xs:time(\"23:59:59Z\")
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than2args_6() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: xs:time(\"00:00:00Z\") le xs:time(\"00:00:00Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than2args_7() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: xs:time(\"08:03:35Z\") le xs:time(\"00:00:00Z\")
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than2args_8() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: xs:time(\"23:59:59Z\") le xs:time(\"00:00:00Z\")
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than2args_9() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: xs:time(\"00:00:00Z\") le xs:time(\"08:03:35Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than2args_10() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: xs:time(\"00:00:00Z\") le xs:time(\"23:59:59Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than_1() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: (xs:time(\"08:00:00+09:00\") gt xs:time(\"17:00:00-06:00\"))
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than_2() {
    //  ******************************************************* Test:  op-time-greater-
    // XPath: (xs:time(\"08:00:00+09:00\") ge xs:time(\"17:00:00-06:00\"))
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than_3() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: fn:not((xs:time(\"14:00:00Z\") gt xs:time(\"13:00:00Z\")))
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than_4() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: fn:not(xs:time(\"13:00:00Z\") ge xs:time(\"10:00:00Z\"))
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than_5() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: fn:not(xs:time(\"13:00:00Z\") gt xs:time(\"14:00:00Z\"))
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than_6() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: fn:not(xs:time(\"13:00:00Z\") ge xs:time(\"17:00:00Z\"))
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than_7() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: (xs:time(\"13:00:00Z\") gt xs:time(\"17:00:00Z\")) and (xs:t
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than_8() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: (xs:time(\"13:00:00Z\") ge xs:time(\"17:00:00Z\")) and (xs:t
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than_9() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: (xs:time(\"13:00:00Z\") gt xs:time(\"17:00:00Z\")) or (xs:ti
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than_10() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: (xs:time(\"13:00:00Z\") ge xs:time(\"17:00:00Z\")) or (xs:ti
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than_11() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: (xs:time(\"13:00:00Z\") gt xs:time(\"17:00:00Z\")) or (fn:tr
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than_12() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: (xs:time(\"13:00:00Z\") ge xs:time(\"17:00:00Z\")) or (fn:tr
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than_13() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: (xs:time(\"13:00:00Z\") gt xs:time(\"17:00:00Z\")) or (fn:fa
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn op_time_greater_than_14() {
    //  ******************************************************* Test: op-time-greater-t
    // XPath: (xs:time(\"13:00:00Z\") ge xs:time(\"17:00:00Z\")) or (fn:fa
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn k_timegt_1() {
    //  *******************************************************  Test: K-TimeGT-1
    // XPath: xs:time(\"23:01:03.12\") lt xs:time(\"23:01:04.12\")
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn k_timegt_2() {
    //  *******************************************************  Test: K-TimeGT-2
    // XPath: not(xs:time(\"23:01:04.12\") lt xs:time(\"23:01:04.12\"))
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn k_timegt_3() {
    //  *******************************************************  Test: K-TimeGT-3
    // XPath: not(xs:time(\"23:01:05.12\") lt xs:time(\"23:01:04.12\"))
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn k_timegt_4() {
    //  *******************************************************  Test: K-TimeGT-4
    // XPath: xs:time(\"23:01:04.12\") le xs:time(\"23:01:04.12\")
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn k_timegt_5() {
    //  *******************************************************  Test: K-TimeGT-5
    // XPath: xs:time(\"23:01:03.12\") le xs:time(\"23:01:04.12\")
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn k_timegt_6() {
    //  *******************************************************  Test: K-TimeGT-6
    // XPath: not(xs:time(\"23:01:05.12\") le xs:time(\"23:01:04.12\"))
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn cbcl_time_greater_than_001() {
    //  test comparison of time
    // XPath: declare function local:two-digit($number as xs:integer) { le
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn cbcl_time_greater_than_002() {
    //  test comparison of time
    // XPath: xs:time(\"14:00:00-12:00\") gt xs:time(\"02:00:00\")
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn cbcl_time_greater_than_003() {
    //  test comparison of time
    // XPath: xs:time(\"02:00:00\") gt xs:time(\"14:00:00-12:00\")
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn cbcl_time_greater_than_004() {
    //  test comparison of time
    // XPath: if (implicit-timezone() gt xs:dayTimeDuration('PT1H'))
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn cbcl_time_greater_than_005() {
    //  test comparison of time
    // XPath: if (implicit-timezone() gt xs:dayTimeDuration('PT1H'))
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn cbcl_time_greater_than_006() {
    //  test comparison of time
    // XPath: declare function local:two-digit($number as xs:integer) { le
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn cbcl_time_greater_than_007() {
    //  test comparison of time
    // XPath: xs:time(\"14:00:00-12:00\") le xs:time(\"02:00:00\")
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn cbcl_time_greater_than_008() {
    //  test comparison of time
    // XPath: xs:time(\"02:00:00\") le xs:time(\"14:00:00-12:00\")
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn cbcl_time_greater_than_009() {
    //  test comparison of time
    // XPath: if (implicit-timezone() gt xs:dayTimeDuration('PT1H'))
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn cbcl_time_greater_than_010() {
    //  test comparison of time
    // XPath: if (implicit-timezone() gt xs:dayTimeDuration('PT1H'))
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn cbcl_time_greater_than_011() {
    //  test comparison of time
    // XPath: declare function local:time($time as xs:time, $null as xs:bo
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn cbcl_time_greater_than_012() {
    //  test comparison of time
    // XPath: declare function local:time($time as xs:time, $null as xs:bo
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn cbcl_time_greater_than_013() {
    //  test comparison of time
    // XPath: declare function local:time($time as xs:time, $null as xs:bo
    // Expected: false
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}

#[test]
fn cbcl_time_greater_than_014() {
    //  test comparison of time
    // XPath: declare function local:time($time as xs:time, $null as xs:bo
    // Expected: true
    // Calls stub function - will fail until op:time-greater-than is implemented
    let _ = stub_optime_greater_than();
}
