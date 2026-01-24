//! Test chunk 0 for op:subtract-yearMonthDuration-from-date
//! Contains 23 tests

use dep::xpath::stub_opsubtract_yearmonthduration_from_date;

#[test]
fn op_subtract_yearmonthduration_from_date2args_1() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: xs:date(\"1970-01-01Z\") - xs:yearMonthDuration(\"P0Y0M\")
    // Expected: 1970-01-01Z
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date2args_2() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: xs:date(\"1983-11-17Z\") - xs:yearMonthDuration(\"P0Y0M\")
    // Expected: 1983-11-17Z
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date2args_3() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: xs:date(\"2030-12-31Z\") - xs:yearMonthDuration(\"P0Y0M\")
    // Expected: 2030-12-31Z
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date2args_4() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: xs:date(\"1970-01-01Z\") - xs:yearMonthDuration(\"P1000Y6M\"
    // Expected: 0969-07-01Z
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_1() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: xs:date(\"2000-10-30\") - xs:yearMonthDuration(\"P1Y2M\")
    // Expected: 1999-08-30
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_2() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: xs:date(\"2000-02-29Z\") - xs:yearMonthDuration(\"P1Y\")
    // Expected: 1999-02-28Z
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_3() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: xs:date(\"2000-10-31-05:00\") - xs:yearMonthDuration(\"P1Y1M
    // Expected: 1999-09-30-05:00
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_4() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:not(fn:string(xs:date(\"1998-09-12Z\") - xs:yearMonthDura
    // Expected: false
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_5() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:boolean(fn:string(xs:date(\"1962-03-12Z\") - xs:yearMonth
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_6() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:number(xs:date(\"1988-01-28Z\") - xs:yearMonthDuration(\"
    // Expected: NaN
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_7() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:string(xs:date(\"1989-07-05Z\") - xs:yearMonthDuration(\"
    // Expected: 1981-03-05Z
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_8() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: (xs:date(\"0001-01-01Z\") - xs:yearMonthDuration(\"-P20Y07M\
    // Expected: 0021-08-01Z
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_9() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:string((xs:date(\"1993-12-09Z\") - xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_10() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:string((xs:date(\"1985-07-05Z\") - xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_12() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:string((xs:date(\"1980-03-02Z\") - xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_13() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: (xs:date(\"1980-05-05Z\") - xs:yearMonthDuration(\"P23Y11M\"
    // Expected: false
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_14() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: (xs:date(\"1979-12-12Z\") - xs:yearMonthDuration(\"P08Y08M\"
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_15() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: (xs:date(\"1978-12-12Z\") - xs:yearMonthDuration(\"P17Y12M\"
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_16() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: (xs:date(\"1977-12-12Z\") - xs:yearMonthDuration(\"P18Y02M\"
    // Expected: false
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_17() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:string(xs:date(\"2000-12-12Z\") - xs:yearMonthDuration(\"
    // Expected: false
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn op_subtract_yearmonthduration_from_date_18() {
    //  ******************************************************* Test: op-subtract-yearM
    // XPath: fn:string((xs:date(\"1999-10-23Z\") - xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn k_datesubtractymd_1() {
    //  *******************************************************  Test: K-DateSubtractYM
    // XPath: xs:date(\"1999-08-12\") - xs:yearMonthDuration(\"P3Y7M\") eq
    // Expected: true
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}

#[test]
fn cbcl_subtract_yearmonthduration_from_date_001() {
    //  test subtraction of zero duration to date
    // XPath: declare function local:two-digit($number as xs:integer) {
    // Expected: 2008-05-12
    // Calls stub function - will fail until op:subtract-yearMonthDuration-from-date is implemented
    let _ = stub_opsubtract_yearmonthduration_from_date();
}
