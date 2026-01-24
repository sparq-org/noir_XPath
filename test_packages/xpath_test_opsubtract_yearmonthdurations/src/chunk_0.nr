//! Test chunk 0 for op:subtract-yearMonthDurations
//! Contains 26 tests

use dep::xpath::stub_opsubtract_yearmonthdurations;

#[test]
fn op_subtract_yearmonthdurations2args_1() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: xs:yearMonthDuration(\"P0Y0M\") - xs:yearMonthDuration(\"P0Y
    // Expected: P0M
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations2args_2() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: xs:yearMonthDuration(\"P1000Y6M\") - xs:yearMonthDuration(\"
    // Expected: P1000Y6M
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations2args_3() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: xs:yearMonthDuration(\"P2030Y12M\") - xs:yearMonthDuration(\
    // Expected: P2031Y
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations2args_4() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: xs:yearMonthDuration(\"P0Y0M\") - xs:yearMonthDuration(\"P10
    // Expected: -P1000Y6M
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations2args_5() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: xs:yearMonthDuration(\"P0Y0M\") - xs:yearMonthDuration(\"P20
    // Expected: -P2031Y
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_1() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: (xs:yearMonthDuration(\"P2Y11M\") - xs:yearMonthDuration(\"P
    // Expected: -P4M
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_2() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:string(xs:yearMonthDuration(\"P10Y11M\") - xs:yearMonthDu
    // Expected: false
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_3() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:string(xs:yearMonthDuration(\"P20Y10M\") - xs:yearMonthDu
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_4() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:not(fn:string(xs:yearMonthDuration(\"P11Y04M\") - xs:year
    // Expected: false
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_5() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:boolean(fn:string(xs:yearMonthDuration(\"P05Y08M\") - xs:
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_6() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:number(xs:yearMonthDuration(\"P02Y09M\") - xs:yearMonthDu
    // Expected: NaN
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_7() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:string(xs:yearMonthDuration(\"P03Y08M\") - xs:yearMonthDu
    // Expected: P2Y6M
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_8() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: (xs:yearMonthDuration(\"P10Y01M\") - xs:yearMonthDuration(\"
    // Expected: -P1Y1M
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_9() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:string((xs:yearMonthDuration(\"P01Y01M\") - xs:yearMonthD
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_10() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:string((xs:yearMonthDuration(\"P05Y02M\") - xs:yearMonthD
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_11() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: (xs:yearMonthDuration(\"P42Y10M\") - xs:yearMonthDuration(\"
    // Expected: 11
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_12() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:string((xs:yearMonthDuration(\"P10Y11M\") - xs:yearMonthD
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_13() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: (xs:yearMonthDuration(\"P23Y11M\") - xs:yearMonthDuration(\"
    // Expected: false
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_14() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: (xs:yearMonthDuration(\"P21Y12M\") - xs:yearMonthDuration(\"
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_15() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: (xs:yearMonthDuration(\"P10Y01M\") - xs:yearMonthDuration(\"
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn op_subtract_yearmonthdurations_16() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: (xs:yearMonthDuration(\"P13Y09M\") - xs:yearMonthDuration(\"
    // Expected: false
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn k_yearmonthdurationsubtract_1() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P3Y3M\") - xs:yearMonthDuration(\"P0M
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn k_yearmonthdurationsubtract_2() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P0M\") - xs:yearMonthDuration(\"P3Y3M
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn k_yearmonthdurationsubtract_3() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P32Y43M\") - xs:yearMonthDuration(\"P
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn cbcl_subtract_yearmonthdurations_001() {
    //  test subtraction of zero duration from yearMonthDurations
    // XPath: declare function local:yearMonthDuration($years as xs:intege
    // Expected: P1Y1M
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}

#[test]
fn cbcl_subtract_yearmonthdurations_002() {
    //  test subtraction of yearMonthDurations
    // XPath: declare function local:yearMonthDuration($years as xs:intege
    // Expected: P0M
    // Calls stub function - will fail until op:subtract-yearMonthDurations is implemented
    let _ = stub_opsubtract_yearmonthdurations();
}
