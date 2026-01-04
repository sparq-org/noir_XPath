//! Test chunk 0 for op:add-dayTimeDuration-to-time
//! Contains 25 tests

use dep::xpath::stub_opadd_daytimeduration_to_time;

#[test]
fn op_add_daytimeduration_to_time2args_1() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: xs:time(\"00:00:00Z\") + xs:dayTimeDuration(\"P0DT0H0M0S\")
    // Expected: 00:00:00Z
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time2args_2() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: xs:time(\"08:03:35Z\") + xs:dayTimeDuration(\"P0DT0H0M0S\")
    // Expected: 08:03:35Z
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time2args_3() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: xs:time(\"23:59:59Z\") + xs:dayTimeDuration(\"P0DT0H0M0S\")
    // Expected: 23:59:59Z
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time2args_4() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: xs:time(\"00:00:00Z\") + xs:dayTimeDuration(\"P15DT11H59M59S
    // Expected: 11:59:59Z
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time2args_5() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: xs:time(\"00:00:00Z\") + xs:dayTimeDuration(\"P31DT23H59M59S
    // Expected: 23:59:59Z
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time_1() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: xs:time(\"11:12:00\") + xs:dayTimeDuration(\"P3DT1H15M\")
    // Expected: 12:27:00
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time_2() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: xs:time(\"23:12:00+03:00\") + xs:dayTimeDuration(\"P1DT3H15M
    // Expected: 02:27:00+03:00
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time_3() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:string((xs:time(\"12:12:01Z\") + xs:dayTimeDuration(\"P19
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time_4() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:not(fn:string(xs:time(\"13:12:00Z\") + xs:dayTimeDuration
    // Expected: false
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time_5() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:boolean(fn:string(xs:time(\"02:02:02Z\") + xs:dayTimeDura
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time_6() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:number(xs:time(\"01:01:01Z\") + xs:dayTimeDuration(\"P10D
    // Expected: NaN
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time_7() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:string(xs:time(\"10:02:03Z\") + xs:dayTimeDuration(\"P01D
    // Expected: 19:04:03Z
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time_8() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: (xs:time(\"08:02:06\") + xs:dayTimeDuration(\"-P11DT02H02M\"
    // Expected: 06:00:06
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time_9() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:string((xs:time(\"10:10:10Z\") + xs:dayTimeDuration(\"P02
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time_10() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:string((xs:time(\"02:03:01Z\") + xs:dayTimeDuration(\"P03
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_timealt_12() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:string((xs:time(\"02:02:02Z\") + xs:dayTimeDuration(\"P05
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time_13() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: (xs:time(\"01:03:03Z\") + xs:dayTimeDuration(\"P23DT11H11M\"
    // Expected: false
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time_14() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: (xs:time(\"04:04:05Z\") + xs:dayTimeDuration(\"P08DT08H05M\"
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time_15() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: (xs:time(\"08:09:09Z\") + xs:dayTimeDuration(\"P17DT10H02M\"
    // Expected: false
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time_16() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: (xs:time(\"09:06:07Z\") + xs:dayTimeDuration(\"P18DT02H02M\"
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn op_add_daytimeduration_to_time_17() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:string(xs:time(\"12:07:08Z\") + xs:dayTimeDuration(\"P12D
    // Expected: false
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn k_timeadddtd_1() {
    //  *******************************************************  Test: K-TimeAddDTD-1
    // XPath: xs:time(\"08:12:32\") + xs:dayTimeDuration(\"P23DT09H32M59S\
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn k_timeadddtd_2() {
    //  *******************************************************  Test: K-TimeAddDTD-2
    // XPath: xs:dayTimeDuration(\"P23DT09H32M59S\") + xs:time(\"08:12:32\
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn cbcl_add_daytimeduration_to_time_001() {
    //  test addition of zero duration to time
    // XPath: declare function local:two-digit($number as xs:integer) { le
    // Expected: 12:59:00
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}

#[test]
fn cbcl_add_daytimeduration_to_time_002() {
    //  test addition of zero duration to time
    // XPath: declare function local:two-digit($number as xs:integer) { le
    // Expected: 12:59:00
    // Calls stub function - will fail until op:add-dayTimeDuration-to-time is implemented
    let _ = stub_opadd_daytimeduration_to_time();
}
