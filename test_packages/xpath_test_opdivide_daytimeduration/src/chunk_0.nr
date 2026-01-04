//! Test chunk 0 for op:divide-dayTimeDuration
//! Contains 30 tests

use dep::xpath::stub_opdivide_daytimeduration;

#[test]
fn op_divide_daytimeduration2args_1() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: xs:dayTimeDuration(\"P0DT0H0M0S\") div xs:double(\"-1.797693
    // Expected: PT0S
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration2args_4() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: xs:dayTimeDuration(\"P0DT0H0M0S\") div xs:double(\"0.1\")
    // Expected: PT0S
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration2args_5() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: xs:dayTimeDuration(\"P0DT0H0M0S\") div xs:double(\"1.7976931
    // Expected: PT0S
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration_2() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: fn:string((xs:dayTimeDuration(\"P10DT10H11M\")) div 2.0) and
    // Expected: false
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration_3() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: fn:string((xs:dayTimeDuration(\"P20DT20H10M\") div 2.0)) or
    // Expected: true
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration_4() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: fn:not(fn:string(xs:dayTimeDuration(\"P11DT12H04M\") div 2.0
    // Expected: false
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration_5() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: fn:boolean(fn:string(xs:dayTimeDuration(\"P05DT09H08M\") div
    // Expected: true
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration_6() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: fn:number(xs:dayTimeDuration(\"P02DT06H09M\") div 2.0)
    // Expected: NaN
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration_7() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: fn:string(xs:dayTimeDuration(\"P03DT04H08M\") div 2.0)
    // Expected: P1DT14H4M
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration_8() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: (xs:dayTimeDuration(\"P10DT01H01M\") div -2.0)
    // Expected: -P5DT30M30S
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration_9() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: fn:string((xs:dayTimeDuration(\"P01DT02H01M\") div 2.0)) and
    // Expected: true
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration_10() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: fn:string((xs:dayTimeDuration(\"P05DT09H02M\") div 2.0)) or
    // Expected: true
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration_11() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: (xs:dayTimeDuration(\"P42DT10H10M\") div 2.0) div (xs:dayTim
    // Expected: 1
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration_12() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: fn:string((xs:dayTimeDuration(\"P10DT08H11M\") div 2.0)) and
    // Expected: true
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration_13() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: (xs:dayTimeDuration(\"P23DT11H11M\") div 2.0) eq xs:dayTimeD
    // Expected: false
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration_14() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: (xs:dayTimeDuration(\"P21DT08H12M\") div 2.0) ne xs:dayTimeD
    // Expected: true
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration_15() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: (xs:dayTimeDuration(\"P10DT10H01M\") div 2.0) le xs:dayTimeD
    // Expected: true
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn op_divide_daytimeduration_16() {
    //  ******************************************************* Test: op-divide-dayTime
    // XPath: (xs:dayTimeDuration(\"P13DT09H09M\") div 2.0) ge xs:dayTimeD
    // Expected: false
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn k_daytimedurationdivide_1() {
    //  *******************************************************  Test: K-DayTimeDuratio
    // XPath: xs:dayTimeDuration(\"P8DT4H4M4.400S\") div 4 eq xs:dayTimeDu
    // Expected: true
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn k_daytimedurationdivide_2() {
    //  *******************************************************  Test: K-DayTimeDuratio
    // XPath: xs:dayTimeDuration(\"P3D\") div xs:double(\"-INF\") eq xs:da
    // Expected: true
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn k_daytimedurationdivide_3() {
    //  *******************************************************  Test: K-DayTimeDuratio
    // XPath: xs:dayTimeDuration(\"P3D\") div xs:double(\"INF\") eq xs:day
    // Expected: true
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn cbcl_divide_daytimeduration_002() {
    //  test division of xs:dayTimeDuration by 1
    // XPath: declare function local:dayTimeDuration($days as xs:integer)
    // Expected: P2D
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn cbcl_div_001() {
    //  Test behaviour of division operator when presented with an expression with stat
    // XPath: declare function local:f($x) { if ($x) then xs:duration(\"P1
    // Expected: 12
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn cbcl_div_003() {
    //  Test behaviour of division operator when presented with an expression with stat
    // XPath: declare function local:f($x) { if ($x) then xs:duration(\"P1
    // Expected: 24
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn cbcl_div_005() {
    //  Test behaviour of division operator when presented with an expression with stat
    // XPath: declare function local:f($x) { if ($x) then xs:duration(\"P1
    // Expected: 12
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn cbcl_div_007() {
    //  Test behaviour of division operator when presented with an expression with stat
    // XPath: declare function local:f($x) { if ($x) then xs:duration(\"P1
    // Expected: 24
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn cbcl_div_009() {
    //  Test behaviour of division operator when presented with an expression with stat
    // XPath: declare function local:f($x) { if ($x) then xs:duration(\"P1
    // Expected: 1
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn cbcl_div_011() {
    //  Test behaviour of division operator when presented with an expression with stat
    // XPath: declare function local:f($x) { if ($x) then xs:duration(\"P1
    // Expected: 1
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn cbcl_div_013() {
    //  Test behaviour of division operator when presented with an expression with stat
    // XPath: declare function local:f($x) { if ($x) then xs:duration(\"P2
    // Expected: P1M
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}

#[test]
fn cbcl_div_015() {
    //  Test behaviour of division operator when presented with an expression with stat
    // XPath: declare function local:f($x) { if ($x) then xs:duration(\"P1
    // Expected: PT12H
    // Calls stub function - will fail until op:divide-dayTimeDuration is implemented
    let _ = stub_opdivide_daytimeduration();
}
