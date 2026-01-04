//! Test chunk 0 for op:add-yearMonthDurations
//! Contains 27 tests

use dep::xpath::stub_opadd_yearmonthdurations;

#[test]
fn op_add_yearmonthdurations2args_1() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: xs:yearMonthDuration(\"P0Y0M\") + xs:yearMonthDuration(\"P0Y
    // Expected: P0M
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations2args_2() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: xs:yearMonthDuration(\"P1000Y6M\") + xs:yearMonthDuration(\"
    // Expected: P1000Y6M
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations2args_3() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: xs:yearMonthDuration(\"P2030Y12M\") + xs:yearMonthDuration(\
    // Expected: P2031Y
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations2args_4() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: xs:yearMonthDuration(\"P0Y0M\") + xs:yearMonthDuration(\"P10
    // Expected: P1000Y6M
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations2args_5() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: xs:yearMonthDuration(\"P0Y0M\") + xs:yearMonthDuration(\"P20
    // Expected: P2031Y
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_1() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: xs:yearMonthDuration(\"P2Y11M\") + xs:yearMonthDuration(\"P3
    // Expected: P6Y2M
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_2() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:string(xs:yearMonthDuration(\"P10Y11M\") + xs:yearMonthDu
    // Expected: false
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_3() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:string(xs:yearMonthDuration(\"P20Y10M\") + xs:yearMonthDu
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_4() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:not(fn:string(xs:yearMonthDuration(\"P11Y04M\") + xs:year
    // Expected: false
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_5() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:boolean(fn:string(xs:yearMonthDuration(\"P05Y08M\") + xs:
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_6() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:number(xs:yearMonthDuration(\"P02Y09M\") + xs:yearMonthDu
    // Expected: NaN
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_7() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:string(xs:yearMonthDuration(\"P03Y08M\") + xs:yearMonthDu
    // Expected: P4Y10M
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_8() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: (xs:yearMonthDuration(\"P10Y01M\") + xs:yearMonthDuration(\"
    // Expected: -P1Y1M
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_9() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:string((xs:yearMonthDuration(\"P01Y01M\") + xs:yearMonthD
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_10() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:string((xs:yearMonthDuration(\"P05Y02M\") + xs:yearMonthD
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_11() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: (xs:yearMonthDuration(\"P42Y10M\") + xs:yearMonthDuration(\"
    // Expected: 1
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_12() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:string((xs:yearMonthDuration(\"P10Y11M\") + xs:yearMonthD
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_13() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: (xs:yearMonthDuration(\"P23Y11M\") + xs:yearMonthDuration(\"
    // Expected: false
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_14() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: (xs:yearMonthDuration(\"P21Y12M\") + xs:yearMonthDuration(\"
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_15() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: (xs:yearMonthDuration(\"P10Y01M\") + xs:yearMonthDuration(\"
    // Expected: false
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn op_add_yearmonthdurations_16() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: (xs:yearMonthDuration(\"P13Y09M\") + xs:yearMonthDuration(\"
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn k_yearmonthdurationadd_1() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P3Y3M\") + xs:yearMonthDuration(\"P0M
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn k_yearmonthdurationadd_2() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P0M\") + xs:yearMonthDuration(\"P3Y3M
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn k_yearmonthdurationadd_3() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P32Y43M\") + xs:yearMonthDuration(\"P
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn cbcl_add_yearmonthdurations_001() {
    //  test addition of zero duration to yearMonthDuration
    // XPath: declare function local:yearMonthDuration($years as xs:intege
    // Expected: P1Y1M
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn cbcl_add_yearmonthdurations_002() {
    //  test addition of zero duration to yearMonthDuration
    // XPath: declare function local:yearMonthDuration($years as xs:intege
    // Expected: P1Y1M
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}

#[test]
fn cbcl_add_yearmonthdurations_003() {
    //  test addition of zero duration to yearMonthDuration
    // XPath: declare function local:yearMonthDuration($years as xs:intege
    // Expected: P2Y2M
    // Calls stub function - will fail until op:add-yearMonthDurations is implemented
    let _ = stub_opadd_yearmonthdurations();
}
