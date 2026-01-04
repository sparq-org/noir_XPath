//! Test chunk 0 for op:yearMonthDuration-less-than
//! Contains 34 tests

use dep::xpath::stub_opyearmonthduration_less_than;

#[test]
fn op_yearmonthduration_less_than2args_1() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P0Y0M\") lt xs:yearMonthDuration(\"P0
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than2args_2() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P1000Y6M\") lt xs:yearMonthDuration(\
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than2args_3() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P2030Y12M\") lt xs:yearMonthDuration(
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than2args_4() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P0Y0M\") lt xs:yearMonthDuration(\"P1
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than2args_5() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P0Y0M\") lt xs:yearMonthDuration(\"P2
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than2args_6() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P0Y0M\") ge xs:yearMonthDuration(\"P0
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than2argsnew_7() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P1000Y6M\") ge xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than2args_8() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P2030Y12M\") ge xs:yearMonthDuration(
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than2args_9() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P0Y0M\") ge xs:yearMonthDuration(\"P1
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than2args_10() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P0Y0M\") ge xs:yearMonthDuration(\"P2
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than_3() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: fn:not((xs:yearMonthDuration(\"P20Y10M\") lt xs:yearMonthDur
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than_4() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: fn:not(xs:yearMonthDuration(\"P20Y10M\") le xs:yearMonthDura
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than_5() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: fn:not(xs:yearMonthDuration(\"P20Y10M\") lt xs:yearMonthDura
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than_6() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: fn:not(xs:yearMonthDuration(\"P10Y09M\") le xs:yearMonthDura
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_thannew_7() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P10Y09M\") lt xs:yearMonthDuration(\
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than_8() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P10Y09M\") le xs:yearMonthDuration(\
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than_9() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P10Y08M\") lt xs:yearMonthDuration(\
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than_10() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P10Y01M\") le xs:yearMonthDuration(\
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than_11() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P10Y02M\") lt xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than_12() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P10Y01M\") le xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than_13() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P30Y10M\") lt xs:yearMonthDuration(\
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn op_yearmonthduration_less_than_14() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P10Y05M\") le xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn k_yearmonthdurationlt_1() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P1999Y9M\") lt xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn k_yearmonthdurationlt_2() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: not(xs:yearMonthDuration(\"P1999Y10M\") lt xs:yearMonthDurat
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn k_yearmonthdurationlt_3() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: not(xs:yearMonthDuration(\"P1999Y10M\") lt xs:yearMonthDurat
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn k_yearmonthdurationlt_4() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P1999Y10M\") le xs:yearMonthDuration(
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn k_yearmonthdurationlt_5() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P1999Y9M\") le xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn k_yearmonthdurationlt_6() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: not(xs:yearMonthDuration(\"P1999Y10M\") le xs:yearMonthDurat
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn cbcl_yearmonthduration_less_than_001() {
    //  test comparison of xs:yearMonthDuration
    // XPath: declare function local:yearMonthDuration($years as xs:intege
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn cbcl_yearmonthduration_less_than_002() {
    //  test comparison of xs:yearMonthDuration
    // XPath: declare function local:yearMonthDuration($years as xs:intege
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn cbcl_yearmonthduration_less_than_003() {
    //  test comparison of xs:yearMonthDuration
    // XPath: declare function local:yearMonthDuration($yearMonthDuration
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn cbcl_yearmonthduration_less_than_004() {
    //  test comparison of xs:yearMonthDuration
    // XPath: declare function local:yearMonthDuration($yearMonthDuration
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn cbcl_yearmonthduration_less_than_005() {
    //  test comparison of xs:yearMonthDuration
    // XPath: declare function local:yearMonthDuration($yearMonthDuration
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}

#[test]
fn cbcl_yearmonthduration_less_than_006() {
    //  test comparison of xs:yearMonthDuration
    // XPath: declare function local:yearMonthDuration($yearMonthDuration
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-less-than is implemented
    let _ = stub_opyearmonthduration_less_than();
}
