//! Test chunk 0 for op:subtract-times
//! Contains 27 tests

use dep::xpath::stub_opsubtract_times;

#[test]
fn op_subtract_times2args_1() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: xs:time(\"00:00:00Z\") - xs:time(\"00:00:00Z\")
    // Expected: PT0S
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times2args_2() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: xs:time(\"08:03:35Z\") - xs:time(\"00:00:00Z\")
    // Expected: PT8H3M35S
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times2args_3() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: xs:time(\"23:59:59Z\") - xs:time(\"00:00:00Z\")
    // Expected: PT23H59M59S
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times2args_4() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: xs:time(\"00:00:00Z\") - xs:time(\"08:03:35Z\")
    // Expected: -PT8H3M35S
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times2args_5() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: xs:time(\"00:00:00Z\") - xs:time(\"23:59:59Z\")
    // Expected: -PT23H59M59S
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_1() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: xs:time(\"11:12:00Z\") - xs:time(\"04:00:00Z\")
    // Expected: PT7H12M
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_2() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: xs:time(\"11:00:00-05:00\") - xs:time(\"21:30:00+05:30\")
    // Expected: PT0S
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_3() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: xs:time(\"17:00:00-06:00\") - xs:time(\"08:00:00+09:00\")
    // Expected: P1D
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_4() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: fn:not(fn:string(xs:time(\"13:00:00Z\") - xs:time(\"14:00:00
    // Expected: false
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_5() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: fn:boolean(fn:string(xs:time(\"13:00:00Z\") - xs:time(\"10:0
    // Expected: true
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_6() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: fn:number(xs:time(\"13:00:00Z\") - xs:time(\"12:00:00Z\"))
    // Expected: NaN
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_7() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: fn:string(xs:time(\"13:00:00Z\") - xs:time(\"17:00:00Z\"))
    // Expected: -PT4H
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_8() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: (xs:time(\"13:00:00Z\") - xs:time(\"17:00:00Z\"))
    // Expected: -PT4H
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_9() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: fn:string((xs:time(\"13:00:00Z\") - xs:time(\"12:00:00Z\")))
    // Expected: true
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_10() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: fn:string((xs:time(\"13:00:00Z\") - xs:time(\"17:00:00Z\")))
    // Expected: true
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_11() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: (xs:time(\"23:00:00Z\") - xs:time(\"17:00:00Z\")) div (xs:ti
    // Expected: 2
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_12() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: fn:string((xs:time(\"17:00:00Z\") - xs:time(\"13:00:00Z\")))
    // Expected: true
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_13() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: (xs:time(\"13:00:00Z\") - xs:time(\"17:00:00Z\")) eq xs:dayT
    // Expected: false
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_14() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: (xs:time(\"13:00:00Z\") - xs:time(\"17:00:00Z\")) ne xs:dayT
    // Expected: true
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_15() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: (xs:time(\"13:00:00Z\") - xs:time(\"17:00:00Z\")) le xs:dayT
    // Expected: true
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn op_subtract_times_16() {
    //  ******************************************************* Test: op-subtract-times
    // XPath: (xs:time(\"13:00:00Z\") - xs:time(\"17:00:00Z\")) ge xs:dayT
    // Expected: false
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn k_timesubtract_1() {
    //  *******************************************************  Test: K-TimeSubtract-1
    // XPath: xs:time(\"08:12:32\") - xs:time(\"18:12:32\") eq xs:dayTimeD
    // Expected: true
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn k_timesubtract_2() {
    //  *******************************************************  Test: K-TimeSubtract-2
    // XPath: xs:time(\"08:12:32\") - xs:time(\"08:12:32\") eq xs:dayTimeD
    // Expected: true
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn cbcl_subtract_times_001() {
    //  test subtraction of times
    // XPath: xs:time(\"12:00:00+01:00\") - xs:time(\"12:00:00\") - implic
    // Expected: -PT1H
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn cbcl_subtract_times_002() {
    //  test subtraction of times
    // XPath: xs:time(\"12:00:00\") - xs:time(\"12:00:00+01:00\") + implic
    // Expected: PT1H
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn cbcl_subtract_times_003() {
    //  test subtraction of times
    // XPath: fn:adjust-time-to-timezone(xs:time(\"12:00:00\")) - fn:adjus
    // Expected: PT9H
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}

#[test]
fn cbcl_subtract_times_004() {
    //  test subtraction of times
    // XPath: fn:adjust-time-to-timezone(xs:time(\"08:00:00+05:00\"), xs:d
    // Expected: -PT9H
    // Calls stub function - will fail until op:subtract-times is implemented
    let _ = stub_opsubtract_times();
}
