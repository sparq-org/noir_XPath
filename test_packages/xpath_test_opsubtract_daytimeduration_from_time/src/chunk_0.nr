//! Test chunk 0 for op:subtract-dayTimeDuration-from-time
//! Contains 23 tests

use dep::xpath::stub_opsubtract_daytimeduration_from_time;

#[test]
fn op_subtract_daytimeduration_from_time2args_1() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: xs:time(\"00:00:00Z\") - xs:dayTimeDuration(\"P0DT0H0M0S\")
    // Expected: 00:00:00Z
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time2args_2() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: xs:time(\"08:03:35Z\") - xs:dayTimeDuration(\"P0DT0H0M0S\")
    // Expected: 08:03:35Z
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time2args_3() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: xs:time(\"23:59:59Z\") - xs:dayTimeDuration(\"P0DT0H0M0S\")
    // Expected: 23:59:59Z
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time2args_4() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: xs:time(\"00:00:00Z\") - xs:dayTimeDuration(\"P15DT11H59M59S
    // Expected: 12:00:01Z
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time2args_5() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: xs:time(\"00:00:00Z\") - xs:dayTimeDuration(\"P31DT23H59M59S
    // Expected: 00:00:01Z
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_1() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: xs:time(\"11:12:00\") - xs:dayTimeDuration(\"P3DT1H15M\")
    // Expected: 09:57:00
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_2() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: xs:time(\"08:20:00-05:00\") - xs:dayTimeDuration(\"P23DT10H1
    // Expected: 22:10:00-05:00
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_3() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:string((xs:time(\"12:12:01Z\") - xs:dayTimeDuration(\"P19
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_4() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:not(fn:string(xs:time(\"20:50:50Z\") - xs:dayTimeDuration
    // Expected: false
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_5() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:boolean(fn:string(xs:time(\"23:55:55Z\") - xs:dayTimeDura
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_6() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:number(xs:time(\"10:11:45Z\") - xs:dayTimeDuration(\"P10D
    // Expected: NaN
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_7() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:string(xs:time(\"19:45:55Z\") - xs:dayTimeDuration(\"P01D
    // Expected: 10:43:55Z
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_8() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: (xs:time(\"01:01:01\") - xs:dayTimeDuration(\"-P11DT02H02M\"
    // Expected: 03:03:01
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_9() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:string((xs:time(\"10:10:10Z\") - xs:dayTimeDuration(\"P02
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_10() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:string((xs:time(\"23:45:50Z\") - xs:dayTimeDuration(\"P03
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_12() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:string((xs:time(\"02:02:02Z\") - xs:dayTimeDuration(\"P05
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_13() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: (xs:time(\"01:03:03Z\") - xs:dayTimeDuration(\"P23DT11H11M\"
    // Expected: false
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_14() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: (xs:time(\"04:04:05Z\") - xs:dayTimeDuration(\"P08DT08H05M\"
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_15() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:string((xs:time(\"08:09:09Z\") - xs:dayTimeDuration(\"P17
    // Expected: false
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_16() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:string((xs:time(\"09:06:07Z\") - xs:dayTimeDuration(\"P18
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn op_subtract_daytimeduration_from_time_17() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:string(xs:time(\"12:07:08Z\") - xs:dayTimeDuration(\"P12D
    // Expected: false
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn k_timesubtractdtd_1() {
    //  *******************************************************  Test: K-TimeSubtractDT
    // XPath: xs:time(\"08:12:32\") - xs:dayTimeDuration(\"P23DT09H32M59S\
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}

#[test]
fn cbcl_subtract_daytimeduration_from_time_001() {
    //  test subtraction of zero duration from time
    // XPath: declare function local:two-digit($number as xs:integer) { le
    // Expected: 12:59:00
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-time is implemented
    let _ = stub_opsubtract_daytimeduration_from_time();
}
