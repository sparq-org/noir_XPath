//! Test chunk 0 for op:time-equal
//! Contains 46 tests

use dep::xpath::stub_optime_equal;

#[test]
fn op_time_equal2args_1() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"00:00:00Z\") eq xs:time(\"00:00:00Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_2() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"08:03:35Z\") eq xs:time(\"00:00:00Z\")
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_3() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"23:59:59Z\") eq xs:time(\"00:00:00Z\")
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_4() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"00:00:00Z\") eq xs:time(\"08:03:35Z\")
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_5() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"00:00:00Z\") eq xs:time(\"23:59:59Z\")
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_6() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"00:00:00Z\") ne xs:time(\"00:00:00Z\")
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_7() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"08:03:35Z\") ne xs:time(\"00:00:00Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_8() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"23:59:59Z\") ne xs:time(\"00:00:00Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_9() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"00:00:00Z\") ne xs:time(\"08:03:35Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_10() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"00:00:00Z\") ne xs:time(\"23:59:59Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_11() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"00:00:00Z\") le xs:time(\"00:00:00Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_12() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"08:03:35Z\") le xs:time(\"00:00:00Z\")
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_13() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"23:59:59Z\") le xs:time(\"00:00:00Z\")
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_14() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"00:00:00Z\") le xs:time(\"08:03:35Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_15() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"00:00:00Z\") le xs:time(\"23:59:59Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_16() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"00:00:00Z\") ge xs:time(\"00:00:00Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_17() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"08:03:35Z\") ge xs:time(\"00:00:00Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_18() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"23:59:59Z\") ge xs:time(\"00:00:00Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_19() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"00:00:00Z\") ge xs:time(\"08:03:35Z\")
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn op_time_equal2args_20() {
    //  ******************************************************* Test: op-time-equal2arg
    // XPath: xs:time(\"00:00:00Z\") ge xs:time(\"23:59:59Z\")
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn k_timeeq_1() {
    //  *******************************************************  Test: K-TimeEQ-1
    // XPath: xs:time(\"23:01:04.12\") eq xs:time(\"23:01:04.12\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn k_timeeq_2() {
    //  *******************************************************  Test: K-TimeEQ-2
    // XPath: not(xs:time(\"23:01:04.12\") eq xs:time(\"23:01:04.13\"))
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn k_timeeq_3() {
    //  *******************************************************  Test: K-TimeEQ-3
    // XPath: xs:time(\"23:01:05.12\") ne xs:time(\"23:01:04.12\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn k_timeeq_4() {
    //  *******************************************************  Test: K-TimeEQ-4
    // XPath: not(xs:time(\"23:01:04.12\") ne xs:time(\"23:01:04.12\"))
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn k_timeeq_5() {
    //  *******************************************************  Test: K-TimeEQ-5
    // XPath: xs:time(\"16:00:12.345-00:00\") eq xs:time(\"16:00:12.345Z\"
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn k_timeeq_6() {
    //  *******************************************************  Test: K-TimeEQ-6
    // XPath: xs:time(\"16:00:12.345+00:00\") eq xs:time(\"16:00:12.345Z\"
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn k_timeeq_7() {
    //  *******************************************************  Test: K-TimeEQ-7
    // XPath: xs:time(\"16:00:12.345Z\") eq xs:time(\"16:00:12.345Z\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn k_timeeq_8() {
    //  *******************************************************  Test: K-TimeEQ-8
    // XPath: xs:time(\"16:00:12.345-00:00\") eq xs:time(\"16:00:12.345+00
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn k2_timeeq_1() {
    //  *******************************************************  Test: K2-TimeEQ-1
    // XPath: xs:time(\"01:01:01-03:00\") ne xs:time(\"01:01:01+03:00\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_001() {
    //  test comparison of time
    // XPath: declare function local:two-digit($number as xs:integer) { le
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_002() {
    //  test comparison of time
    // XPath: xs:time(\"14:00:00-12:00\") eq xs:time(\"02:00:00\")
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_003() {
    //  test comparison of time
    // XPath: xs:time(\"02:00:00\") eq xs:time(\"14:00:00-12:00\")
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_004() {
    //  test comparison of time
    // XPath: xs:time(\"00:00:01+01:00\") eq xs:time(\"00:00:00\")
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_005() {
    //  test comparison of time
    // XPath: xs:time(\"00:00:00\") eq xs:time(\"00:00:01+01:00\")
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_006() {
    //  test comparison of time
    // XPath: declare function local:two-digit($number as xs:integer) { le
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_007() {
    //  test comparison of time
    // XPath: xs:time(\"14:00:00-12:00\") ne xs:time(\"02:00:00\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_008() {
    //  test comparison of time
    // XPath: xs:time(\"02:00:00\") ne xs:time(\"14:00:00-12:00\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_009() {
    //  test comparison of time
    // XPath: xs:time(\"00:00:01+01:00\") ne xs:time(\"00:00:00\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_010() {
    //  test comparison of time
    // XPath: xs:time(\"00:00:00\") ne xs:time(\"00:00:01+01:00\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_011() {
    //  test comparison of time
    // XPath: declare function local:time($time as xs:time, $null as xs:bo
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_012() {
    //  test comparison of time
    // XPath: declare function local:time($time as xs:time, $null as xs:bo
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_013() {
    //  test comparison of time
    // XPath: declare function local:time($time as xs:time, $null as xs:bo
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_014() {
    //  test comparison of time
    // XPath: declare function local:time($time as xs:time, $null as xs:bo
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_017() {
    //  test comparison of time
    // XPath: xs:time(\"00:00:00+12:00\") eq xs:time(\"00:00:01\")
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_018() {
    //  test comparison of time
    // XPath: xs:time(\"00:00:00+12:00\") ne xs:time(\"00:00:01\")
    // Expected: true
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}

#[test]
fn cbcl_time_equal_019() {
    //  test comparison of time
    // XPath: if (implicit-timezone() eq xs:dayTimeDuration('PT1H'))
    // Expected: false
    // Calls stub function - will fail until op:time-equal is implemented
    let _ = stub_optime_equal();
}
