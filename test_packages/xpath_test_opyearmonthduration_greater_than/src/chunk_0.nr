//! Test chunk 0 for op:yearMonthDuration-greater-than
//! Contains 34 tests

use dep::xpath::stub_opyearmonthduration_greater_than;

#[test]
fn op_yearmonthduration_greater_than2args_1() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P0Y0M\") gt xs:yearMonthDuration(\"P0
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than2args_2() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P1000Y6M\") gt xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than2args_3() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P2030Y12M\") gt xs:yearMonthDuration(
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than2args_4() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P0Y0M\") gt xs:yearMonthDuration(\"P1
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than2args_5() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P0Y0M\") gt xs:yearMonthDuration(\"P2
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than2args_6() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P0Y0M\") le xs:yearMonthDuration(\"P0
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than2args_7() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P1000Y6M\") le xs:yearMonthDuration(\
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than2args_8() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P2030Y12M\") le xs:yearMonthDuration(
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than2args_9() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P0Y0M\") le xs:yearMonthDuration(\"P1
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than2args_10() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: xs:yearMonthDuration(\"P0Y0M\") le xs:yearMonthDuration(\"P2
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than_3() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: fn:not((xs:yearMonthDuration(\"P20Y123M\") gt xs:yearMonthDu
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than_4() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: fn:not(xs:yearMonthDuration(\"P20Y10M\") ge xs:yearMonthDura
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than_5() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: fn:not(xs:yearMonthDuration(\"P20Y09M\") gt xs:yearMonthDura
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than_6() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: fn:not(xs:yearMonthDuration(\"P10Y07M\") ge xs:yearMonthDura
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than_7() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P10Y09M\") gt xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than_8() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P10Y09M\") ge xs:yearMonthDuration(\
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than_9() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P10Y08M\") gt xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than_10() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P10Y01M\") ge xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than_11() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P10Y02M\") gt xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than_12() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P10Y01M\") ge xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than_13() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P30Y10M\") gt xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn op_yearmonthduration_greater_than_14() {
    //  ******************************************************* Test: op-yearMonthDurat
    // XPath: (xs:yearMonthDuration(\"P10Y05M\") ge xs:yearMonthDuration(\
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn k_yearmonthdurationgt_1() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P1999Y10M\") gt xs:yearMonthDuration(
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn k_yearmonthdurationgt_2() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: not(xs:yearMonthDuration(\"P1999Y10M\") gt xs:yearMonthDurat
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn k_yearmonthdurationgt_3() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: not(xs:yearMonthDuration(\"P1999Y10M\") gt xs:yearMonthDurat
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn k_yearmonthdurationgt_4() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P1999Y11M\") ge xs:yearMonthDuration(
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn k_yearmonthdurationgt_5() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: xs:yearMonthDuration(\"P1999Y10M\") ge xs:yearMonthDuration(
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn k_yearmonthdurationgt_6() {
    //  *******************************************************  Test: K-YearMonthDurat
    // XPath: not(xs:yearMonthDuration(\"P1999Y9M\") ge xs:yearMonthDurati
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn cbcl_yearmonthduration_greater_than_001() {
    //  test comparison of xs:yearMonthDuration
    // XPath: declare function local:yearMonthDuration($years as xs:intege
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn cbcl_yearmonthduration_greater_than_002() {
    //  test comparison of xs:yearMonthDuration
    // XPath: declare function local:yearMonthDuration($years as xs:intege
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn cbcl_yearmonthduration_greater_than_003() {
    //  test comparison of xs:yearMonthDuration
    // XPath: declare function local:yearMonthDuration($yearMonthDuration
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn cbcl_yearmonthduration_greater_than_004() {
    //  test comparison of xs:yearMonthDuration
    // XPath: declare function local:yearMonthDuration($yearMonthDuration
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn cbcl_yearmonthduration_greater_than_005() {
    //  test comparison of xs:yearMonthDuration
    // XPath: declare function local:yearMonthDuration($yearMonthDuration
    // Expected: false
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}

#[test]
fn cbcl_yearmonthduration_greater_than_006() {
    //  test comparison of xs:yearMonthDuration
    // XPath: declare function local:yearMonthDuration($yearMonthDuration
    // Expected: true
    // Calls stub function - will fail until op:yearMonthDuration-greater-than is implemented
    let _ = stub_opyearmonthduration_greater_than();
}
