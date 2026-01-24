//! Test chunk 0 for op:divide-yearMonthDuration
//! Contains 26 tests

use dep::xpath::stub_opdivide_yearmonthduration;

#[test]
fn op_divide_yearmonthduration2args_1() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: xs:yearMonthDuration(\"P0Y0M\") div xs:double(\"-1.797693134
    // Expected: P0M
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration2args_2() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: xs:yearMonthDuration(\"P1000Y6M\") div xs:double(\"-1.797693
    // Expected: P0M
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration2args_3() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: xs:yearMonthDuration(\"P2030Y12M\") div xs:double(\"-1.79769
    // Expected: P0M
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration2args_4() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: xs:yearMonthDuration(\"P0Y0M\") div xs:double(\"0.1\")
    // Expected: P0M
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration2args_5() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: xs:yearMonthDuration(\"P0Y0M\") div xs:double(\"1.7976931348
    // Expected: P0M
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_1() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: (xs:yearMonthDuration(\"P2Y11M\") div 1.5)
    // Expected: P1Y11M
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_2() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: fn:string((xs:yearMonthDuration(\"P10Y11M\") div 2.0)) and f
    // Expected: false
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_3() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: fn:string((xs:yearMonthDuration(\"P20Y10M\") div 2.0)) or fn
    // Expected: true
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_4() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: fn:not(fn:string(xs:yearMonthDuration(\"P11Y04M\") div 2.0))
    // Expected: false
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_5() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: fn:boolean(fn:string(xs:yearMonthDuration(\"P05Y08M\") div 2
    // Expected: true
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_6() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: fn:number(xs:yearMonthDuration(\"P02Y09M\") div 2.0)
    // Expected: NaN
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_7() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: fn:string(xs:yearMonthDuration(\"P03Y08M\") div 2.0)
    // Expected: P1Y10M
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_8() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: (xs:yearMonthDuration(\"P10Y01M\") div -2.0)
    // Expected: -P5Y
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_9() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: fn:string((xs:yearMonthDuration(\"P01Y01M\") div 2.0)) and f
    // Expected: true
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_10() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: fn:string((xs:yearMonthDuration(\"P05Y02M\") div 2.0)) or fn
    // Expected: true
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_11() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: (xs:yearMonthDuration(\"P20Y11M\") div 2.0) div (xs:yearMont
    // Expected: 1
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_12() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: fn:string((xs:yearMonthDuration(\"P10Y11M\") div 2.0)) and (
    // Expected: true
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_13() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: (xs:yearMonthDuration(\"P23Y11M\") div 2.0) eq xs:yearMonthD
    // Expected: false
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_14() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: (xs:yearMonthDuration(\"P21Y12M\") div 2.0) ne xs:yearMonthD
    // Expected: true
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_15() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: (xs:yearMonthDuration(\"P10Y01M\") div 2.0) le xs:yearMonthD
    // Expected: true
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_16() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: (xs:yearMonthDuration(\"P13Y09M\") div 2.0) ge xs:yearMonthD
    // Expected: false
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn op_divide_yearmonthduration_17() {
    //  ******************************************************* Test: op-divide-yearMon
    // XPath: for $i in (-2, -4, -10, -50, +50, +10, +4, +2) return (xs:ye
    // Expected: -P2M -P1M P0M P0M P0M P1M P1M P3M
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn k_yearmonthdurationdivide_1() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P3Y36M\") div 3 eq xs:yearMonthDurati
    // Expected: true
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn k_yearmonthdurationdivide_2() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P3Y36M\") div xs:double(\"-INF\") eq
    // Expected: true
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn k_yearmonthdurationdivide_3() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P3Y36M\") div xs:double(\"INF\") eq x
    // Expected: true
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}

#[test]
fn cbcl_divide_yearmonthduration_002() {
    //  test division of xs:yearMonthDuration by 1
    // XPath: declare function local:yearMonthDuration($years as xs:intege
    // Expected: P2Y
    // Calls stub function - will fail until op:divide-yearMonthDuration is implemented
    let _ = stub_opdivide_yearmonthduration();
}
