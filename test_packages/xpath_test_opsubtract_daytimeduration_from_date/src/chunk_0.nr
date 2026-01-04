//! Test chunk 0 for op:subtract-dayTimeDuration-from-date
//! Contains 21 tests

use dep::xpath::stub_opsubtract_daytimeduration_from_date;

#[test]
fn op_subtract_daytimeduration_from_date2args_1() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: xs:date(\"1970-01-01Z\") - xs:dayTimeDuration(\"P0DT0H0M0S\"
    // Expected: 1970-01-01Z
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date2args_2() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: xs:date(\"1983-11-17Z\") - xs:dayTimeDuration(\"P0DT0H0M0S\"
    // Expected: 1983-11-17Z
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date2args_3() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: xs:date(\"2030-12-31Z\") - xs:dayTimeDuration(\"P0DT0H0M0S\"
    // Expected: 2030-12-31Z
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date2args_4() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: xs:date(\"1970-01-01Z\") - xs:dayTimeDuration(\"P15DT11H59M5
    // Expected: 1969-12-16Z
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date2args_5() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: xs:date(\"1970-01-01Z\") - xs:dayTimeDuration(\"P31DT23H59M5
    // Expected: 1969-11-30Z
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date_1() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: xs:date(\"2000-10-30\") - xs:dayTimeDuration(\"P3DT1H15M\")
    // Expected: 2000-10-26
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date_2() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:string(xs:date(\"2000-12-12Z\") - xs:dayTimeDuration(\"P1
    // Expected: false
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date_3() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:string((xs:date(\"1999-10-23Z\") - xs:dayTimeDuration(\"P
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date_4() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:not(fn:string(xs:date(\"1998-09-12Z\") - xs:dayTimeDurati
    // Expected: false
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date_5() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:boolean(fn:string(xs:date(\"1962-03-12Z\") - xs:dayTimeDu
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date_6() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:number(xs:date(\"1988-01-28Z\") - xs:dayTimeDuration(\"P1
    // Expected: NaN
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date_7() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:string(xs:date(\"1989-07-05Z\") - xs:dayTimeDuration(\"P0
    // Expected: 1989-07-03Z
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date_9() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:string((xs:date(\"1993-12-09Z\") - xs:dayTimeDuration(\"P
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date_10() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:string((xs:date(\"1985-07-05Z\") - xs:dayTimeDuration(\"P
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date_12() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: fn:string((xs:date(\"1980-03-02Z\") - xs:dayTimeDuration(\"P
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date_13() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: (xs:date(\"1980-05-05Z\") - xs:dayTimeDuration(\"P23DT11H11M
    // Expected: false
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date_14() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: (xs:date(\"1979-12-12Z\") - xs:dayTimeDuration(\"P08DT08H05M
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date_15() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: (xs:date(\"1978-12-12Z\") - xs:dayTimeDuration(\"P17DT10H02M
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn op_subtract_daytimeduration_from_date_16() {
    //  ******************************************************* Test: op-subtract-dayTi
    // XPath: (xs:date(\"1977-12-12Z\") - xs:dayTimeDuration(\"P18DT02H02M
    // Expected: false
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn k_datesubtractdtd_1() {
    //  *******************************************************  Test: K-DateSubtractDT
    // XPath: xs:date(\"1999-08-12\") - xs:dayTimeDuration(\"P23DT09H32M59
    // Expected: true
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}

#[test]
fn cbcl_subtract_daytimeduration_from_date_001() {
    //  test subtraction of zero duration from date
    // XPath: declare function local:two-digit($number as xs:integer) { le
    // Expected: 2008-05-12
    // Calls stub function - will fail until op:subtract-dayTimeDuration-from-date is implemented
    let _ = stub_opsubtract_daytimeduration_from_date();
}
