//! Test chunk 0 for op:multiply-yearMonthDuration
//! Contains 32 tests

use dep::xpath::stub_opmultiply_yearmonthduration;

#[test]
fn op_multiply_yearmonthduration2args_1() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: xs:yearMonthDuration(\"P0Y0M\") * xs:double(\"-1.79769313486
    // Expected: P0M
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration2args_2() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: xs:yearMonthDuration(\"P1000Y6M\") * xs:double(\"-0\")
    // Expected: P0M
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration2args_3() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: xs:yearMonthDuration(\"P2030Y12M\") * xs:double(\"-0\")
    // Expected: P0M
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration2args_4() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: xs:yearMonthDuration(\"P0Y0M\") * xs:double(\"0\")
    // Expected: P0M
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration2args_5() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: xs:yearMonthDuration(\"P0Y0M\") * xs:double(\"1.797693134862
    // Expected: P0M
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_1() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: xs:yearMonthDuration(\"P2Y11M\") * 2.3
    // Expected: P6Y9M
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_2() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: fn:string((xs:yearMonthDuration(\"P10Y11M\")) * 2.0) and fn:
    // Expected: false
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_3() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: fn:string((xs:yearMonthDuration(\"P20Y10M\") * 2.0)) or fn:f
    // Expected: true
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_4() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: fn:not(fn:string(xs:yearMonthDuration(\"P11Y04M\") * 2.0))
    // Expected: false
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_5() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: fn:boolean(fn:string(xs:yearMonthDuration(\"P05Y08M\") * 2.0
    // Expected: true
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_6() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: fn:number(xs:yearMonthDuration(\"P02Y09M\") * 2.0)
    // Expected: NaN
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_7() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: fn:string(xs:yearMonthDuration(\"P03Y08M\") * 2.0)
    // Expected: P7Y4M
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_8() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: (xs:yearMonthDuration(\"P10Y01M\") * -2.0)
    // Expected: -P20Y2M
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_9() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: fn:string((xs:yearMonthDuration(\"P01Y01M\") * 2.0)) and fn:
    // Expected: true
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_10() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: fn:string((xs:yearMonthDuration(\"P05Y02M\") * 2.0)) or fn:s
    // Expected: true
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_11() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: (xs:yearMonthDuration(\"P20Y11M\") * 2.0) div (xs:yearMonthD
    // Expected: 1
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_12() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: fn:string((xs:yearMonthDuration(\"P10Y11M\") * 2.0)) and (fn
    // Expected: true
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_13() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: (xs:yearMonthDuration(\"P23Y11M\") * 2.0) eq xs:yearMonthDur
    // Expected: false
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_14() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: (xs:yearMonthDuration(\"P21Y12M\") * 2.0) ne xs:yearMonthDur
    // Expected: true
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_15() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: (xs:yearMonthDuration(\"P10Y01M\") * 2.0) le xs:yearMonthDur
    // Expected: false
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_16() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: (xs:yearMonthDuration(\"P13Y09M\") - xs:yearMonthDuration(\"
    // Expected: false
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_17() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: fn:count((xs:yearMonthDuration(\"P13Y09M\") *+0))
    // Expected: 1
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_18() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: fn:count((xs:yearMonthDuration(\"P13Y09M\") *-0))
    // Expected: 1
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn op_multiply_yearmonthduration_20() {
    //  ******************************************************* Test: op-multiply-yearM
    // XPath: for $i in (-3.9, -3.5, -3.1, -0.9, -0.5, -0.1, +0.1, +0.5, +
    // Expected: -P4M -P3M -P3M -P1M P0M P0M P0M P1M P1M
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn k_yearmonthdurationmultiply_1() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P3Y36M\") * 3 eq xs:yearMonthDuration
    // Expected: true
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn k_yearmonthdurationmultiply_2() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: 3 * xs:yearMonthDuration(\"P3Y36M\") eq xs:yearMonthDuration
    // Expected: true
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn k_yearmonthdurationmultiply_3() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: 0 * xs:yearMonthDuration(\"P3Y36M\") eq xs:yearMonthDuration
    // Expected: true
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn k_yearmonthdurationmultiply_4() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P3Y36M\") * 0 eq xs:yearMonthDuration
    // Expected: true
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn cbcl_multiply_yearmonthduration_001() {
    //  test multiplication of xs:yearMonthDuration by 0
    // XPath: declare function local:yearMonthDuration($years as xs:intege
    // Expected: P0M
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn cbcl_multiply_yearmonthduration_002() {
    //  test multiplication of xs:yearMonthDuration by 1
    // XPath: declare function local:yearMonthDuration($years as xs:intege
    // Expected: P2Y
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn cbcl_multiply_yearmonthduration_004() {
    //  test multiplication of xs:yearMonthDuration by 0
    // XPath: declare function local:yearMonthDuration($years as xs:intege
    // Expected: P0M
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}

#[test]
fn cbcl_multiply_yearmonthduration_005() {
    //  test multiplication of xs:yearMonthDuration by 1
    // XPath: declare function local:yearMonthDuration($years as xs:intege
    // Expected: P2Y
    // Calls stub function - will fail until op:multiply-yearMonthDuration is implemented
    let _ = stub_opmultiply_yearmonthduration();
}
