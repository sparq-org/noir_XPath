//! Test chunk 0 for op:add-dayTimeDuration-to-date
//! Contains 23 tests

use dep::xpath::stub_opadd_daytimeduration_to_date;

#[test]
fn op_add_daytimeduration_to_date2args_1() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: xs:date(\"1970-01-01Z\") + xs:dayTimeDuration(\"P0DT0H0M0S\"
    // Expected: 1970-01-01Z
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date2args_2() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: xs:date(\"1983-11-17Z\") + xs:dayTimeDuration(\"P0DT0H0M0S\"
    // Expected: 1983-11-17Z
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date2args_3() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: xs:date(\"2030-12-31Z\") + xs:dayTimeDuration(\"P0DT0H0M0S\"
    // Expected: 2030-12-31Z
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date2args_4() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: xs:date(\"1970-01-01Z\") + xs:dayTimeDuration(\"P15DT11H59M5
    // Expected: 1970-01-16Z
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date2args_5() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: xs:date(\"1970-01-01Z\") + xs:dayTimeDuration(\"P31DT23H59M5
    // Expected: 1970-02-01Z
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date_1() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: xs:date(\"2004-10-30Z\") + xs:dayTimeDuration(\"P2DT2H30M0S\
    // Expected: 2004-11-01Z
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_datealt_2() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:string((xs:date(\"2000-12-12Z\") + xs:dayTimeDuration(\"P
    // Expected: false
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date_3() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:string((xs:date(\"1999-10-23Z\") + xs:dayTimeDuration(\"P
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date_4() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:not(fn:string(xs:date(\"1998-09-12Z\") + xs:dayTimeDurati
    // Expected: false
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date_5() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:boolean(fn:string(xs:date(\"1962-03-12Z\") + xs:dayTimeDu
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date_6() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:number(xs:date(\"1988-01-28Z\") + xs:dayTimeDuration(\"P1
    // Expected: NaN
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date_7() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:string(xs:date(\"1989-07-05Z\") + xs:dayTimeDuration(\"P0
    // Expected: 1989-07-06Z
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date_9() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:string((xs:date(\"1993-12-09Z\") + xs:dayTimeDuration(\"P
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date_10() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:string((xs:date(\"1985-07-05Z\") + xs:dayTimeDuration(\"P
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date_12() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:string((xs:date(\"1980-03-02Z\") + xs:dayTimeDuration(\"P
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date_13() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: (xs:date(\"1980-05-05Z\") + xs:dayTimeDuration(\"P23DT11H11M
    // Expected: false
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date_14() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: (xs:date(\"1979-12-12Z\") + xs:dayTimeDuration(\"P08DT08H05M
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date_15() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: (xs:date(\"1978-12-12Z\") + xs:dayTimeDuration(\"P17DT10H02M
    // Expected: false
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn op_add_daytimeduration_to_date_16() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: (xs:date(\"1977-12-12Z\") + xs:dayTimeDuration(\"P18DT02H02M
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn k_dateadddtd_1() {
    //  *******************************************************  Test: K-DateAddDTD-1
    // XPath: xs:date(\"1999-08-12\") + xs:dayTimeDuration(\"P23DT09H32M59
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn k_dateadddtd_2() {
    //  *******************************************************  Test: K-DateAddDTD-2
    // XPath: xs:dayTimeDuration(\"P23DT09H32M59S\") + xs:date(\"1999-08-1
    // Expected: true
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn cbcl_add_daytimeduration_to_date_001() {
    //  test addition of zero duration to date
    // XPath: declare function local:two-digit($number as xs:integer) {
    // Expected: 2008-05-12
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}

#[test]
fn cbcl_add_daytimeduration_to_date_002() {
    //  test addition of zero duration to date
    // XPath: declare function local:two-digit($number as xs:integer) {
    // Expected: 2008-05-12
    // Calls stub function - will fail until op:add-dayTimeDuration-to-date is implemented
    let _ = stub_opadd_daytimeduration_to_date();
}
