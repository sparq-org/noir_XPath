//! Test chunk 0 for op:multiply-dayTimeDuration
//! Contains 38 tests

use dep::xpath::stub_opmultiply_daytimeduration;

#[test]
fn op_multiply_daytimeduration2args_1() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: xs:dayTimeDuration(\"P0DT0H0M0S\") * xs:double(\"-1.79769313
    // Expected: PT0S
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration2args_2() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: xs:dayTimeDuration(\"P15DT11H59M59S\") * xs:double(\"0\")
    // Expected: PT0S
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration2args_3() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: xs:dayTimeDuration(\"P31DT23H59M59S\") * xs:double(\"0\")
    // Expected: PT0S
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration2args_4() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: xs:dayTimeDuration(\"P0DT0H0M0S\") * xs:double(\"0\")
    // Expected: PT0S
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration2args_5() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: xs:dayTimeDuration(\"P0DT0H0M0S\") * xs:double(\"1.797693134
    // Expected: PT0S
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_1() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: xs:dayTimeDuration(\"PT2H10M\") * 2.1
    // Expected: PT4H33M
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_2() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: fn:string((xs:dayTimeDuration(\"P10DT10H11M\")) * 2.0) and f
    // Expected: false
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_3() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: fn:string((xs:dayTimeDuration(\"P20DT20H10M\") * 2.0)) or fn
    // Expected: true
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_4() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: fn:not(fn:string(xs:dayTimeDuration(\"P11DT12H04M\") * 2.0))
    // Expected: false
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_5() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: fn:boolean(fn:string(xs:dayTimeDuration(\"P05DT09H08M\") *2.
    // Expected: true
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_6() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: fn:number(xs:dayTimeDuration(\"P02DT06H09M\") *2.0)
    // Expected: NaN
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_7() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: fn:string(xs:dayTimeDuration(\"P03DT04H08M\") * 2.0)
    // Expected: P6DT8H16M
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_8() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: (xs:dayTimeDuration(\"P10DT01H01M\") * -2.0)
    // Expected: -P20DT2H2M
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_9() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: fn:string((xs:dayTimeDuration(\"P01DT02H01M\") * 2.0)) and f
    // Expected: true
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_10() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: fn:string((xs:dayTimeDuration(\"P05DT09H02M\") * 2.0)) or fn
    // Expected: true
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_11() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: (xs:dayTimeDuration(\"P42DT10H10M\") * 2.0) div (xs:dayTimeD
    // Expected: 1
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_12() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: fn:string((xs:dayTimeDuration(\"P10DT08H11M\") * 2.0)) and (
    // Expected: true
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_13() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: (xs:dayTimeDuration(\"P23DT11H11M\") * 2.0) eq xs:dayTimeDur
    // Expected: false
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_14() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: (xs:dayTimeDuration(\"P21DT08H12M\") * 2.0) ne xs:dayTimeDur
    // Expected: true
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_15() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: (xs:dayTimeDuration(\"P10DT10H01M\") * 2.0) le xs:dayTimeDur
    // Expected: false
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_16() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: (xs:dayTimeDuration(\"P13DT09H09M\") * 2.0) ge xs:dayTimeDur
    // Expected: true
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_17() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: fn:count(xs:dayTimeDuration(\"P13DT09H09M\") * -0)
    // Expected: 1
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn op_multiply_daytimeduration_18() {
    //  ******************************************************* Test: op-multiply-dayTi
    // XPath: fn:count(xs:dayTimeDuration(\"P13DT09H09M\") * +0)
    // Expected: 1
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn k_daytimedurationmultiply_1() {
    //  *******************************************************  Test: K-DayTimeDuratio
    // XPath: xs:dayTimeDuration(\"P3DT4H3M3.100S\") * 3 eq xs:dayTimeDura
    // Expected: true
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn k_daytimedurationmultiply_2() {
    //  *******************************************************  Test: K-DayTimeDuratio
    // XPath: 3 * xs:dayTimeDuration(\"P3DT4H3M3.100S\") eq xs:dayTimeDura
    // Expected: true
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn k_daytimedurationmultiply_3() {
    //  *******************************************************  Test: K-DayTimeDuratio
    // XPath: xs:dayTimeDuration(\"P3DT4H3M3.100S\") * 0 eq xs:dayTimeDura
    // Expected: true
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn k_daytimedurationmultiply_4() {
    //  *******************************************************  Test: K-DayTimeDuratio
    // XPath: 0 * xs:dayTimeDuration(\"P3DT4H3M3.100S\") eq xs:dayTimeDura
    // Expected: true
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn k_daytimedurationmultiply_5() {
    //  *******************************************************  Test: K-DayTimeDuratio
    // XPath: xs:dayTimeDuration(\"P3DT4H3M3.100S\") * xs:double(\"-0\") e
    // Expected: true
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn k_daytimedurationmultiply_6() {
    //  *******************************************************  Test: K-DayTimeDuratio
    // XPath: xs:double(\"-0\") * xs:dayTimeDuration(\"P3DT4H3M3.100S\") e
    // Expected: true
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn k_daytimedurationmultiply_10() {
    // Potential overflow: Saxon bug 5461
    // XPath: xs:dayTimeDuration('PT0.001S') * 60000 * 60
    // Expected: PT1H
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn cbcl_multiply_daytimeduration_001() {
    //  test multiplication of xs:dayTimeDuration by 0
    // XPath: declare function local:dayTimeDuration($days as xs:integer)
    // Expected: PT0S
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn cbcl_multiply_daytimeduration_002() {
    //  test multiplication of xs:dayTimeDuration by 1
    // XPath: declare function local:dayTimeDuration($days as xs:integer)
    // Expected: P2D
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn cbcl_multiply_daytimeduration_004() {
    //  test multiplication of xs:dayTimeDuration by 0
    // XPath: declare function local:dayTimeDuration($days as xs:integer)
    // Expected: PT0S
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn cbcl_multiply_daytimeduration_005() {
    //  test multiplication of xs:dayTimeDuration by 1
    // XPath: declare function local:dayTimeDuration($days as xs:integer)
    // Expected: P2D
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn cbcl_times_001() {
    //  Test behaviour of times operator when presented with an expression with static
    // XPath: declare function local:f($x) { if ($x) then xs:duration(\"P1
    // Expected: P2M
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn cbcl_times_003() {
    //  Test behaviour of times operator when presented with an expression with static
    // XPath: declare function local:f($x) { if ($x) then xs:duration(\"P1
    // Expected: P2D
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn cbcl_times_005() {
    //  Test behaviour of times operator when presented with an expression with static
    // XPath: declare function local:f($x) { if ($x) then xs:duration(\"P1
    // Expected: P2M
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}

#[test]
fn cbcl_times_007() {
    //  Test behaviour of times operator when presented with an expression with static
    // XPath: declare function local:f($x) { if ($x) then xs:duration(\"P1
    // Expected: P2D
    // Calls stub function - will fail until op:multiply-dayTimeDuration is implemented
    let _ = stub_opmultiply_daytimeduration();
}
