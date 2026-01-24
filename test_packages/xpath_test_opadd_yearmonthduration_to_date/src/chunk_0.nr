//! Test chunk 0 for op:add-yearMonthDuration-to-date
//! Contains 23 tests

use dep::xpath::stub_opadd_yearmonthduration_to_date;

#[test]
fn op_add_yearmonthduration_to_date2args_1() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: xs:date(\"1970-01-01Z\") + xs:yearMonthDuration(\"P0Y0M\")
    // Expected: 1970-01-01Z
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date2args_2() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: xs:date(\"1983-11-17Z\") + xs:yearMonthDuration(\"P0Y0M\")
    // Expected: 1983-11-17Z
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date2args_3() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: xs:date(\"2030-12-31Z\") + xs:yearMonthDuration(\"P0Y0M\")
    // Expected: 2030-12-31Z
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date2args_4() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: xs:date(\"1970-01-01Z\") + xs:yearMonthDuration(\"P1000Y6M\"
    // Expected: 2970-07-01Z
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date2args_5() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: xs:date(\"1970-01-01Z\") + xs:yearMonthDuration(\"P2030Y12M\
    // Expected: 4001-01-01Z
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date_1() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: xs:date(\"2000-10-30\") + xs:yearMonthDuration(\"P1Y2M\")
    // Expected: 2001-12-30
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date_2() {
    //  ******************************************************* Test: op-add-dayTimeDur
    // XPath: fn:string(xs:date(\"2000-12-12Z\") + xs:dayTimeDuration(\"P1
    // Expected: false
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date_3() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:string((xs:date(\"1999-10-23Z\") + xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date_4() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:not(fn:string(xs:date(\"1998-09-12Z\") + xs:yearMonthDura
    // Expected: false
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date_5() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:boolean(fn:string(xs:date(\"1962-03-12Z\") + xs:yearMonth
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date_6() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:number(xs:date(\"1988-01-28Z\") + xs:yearMonthDuration(\"
    // Expected: NaN
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date_7() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:string(xs:date(\"1989-07-05Z\") + xs:yearMonthDuration(\"
    // Expected: 1997-11-05Z
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date_9() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:string((xs:date(\"1993-12-09Z\") + xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date_10() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:string((xs:date(\"1985-07-05Z\") + xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date_12() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: fn:string((xs:date(\"1980-03-02Z\") + xs:yearMonthDuration(\
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date_13() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: (xs:date(\"1980-05-05Z\") + xs:yearMonthDuration(\"P23Y11M\"
    // Expected: false
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date_14() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: (xs:date(\"1979-12-12Z\") + xs:yearMonthDuration(\"P08Y08M\"
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date_15() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: (xs:date(\"1978-12-12Z\") + xs:yearMonthDuration(\"P17Y12M\"
    // Expected: false
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn op_add_yearmonthduration_to_date_16() {
    //  ******************************************************* Test: op-add-yearMonthD
    // XPath: (xs:date(\"1977-12-12Z\") + xs:yearMonthDuration(\"P18Y02M\"
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn k_dateaddymd_1() {
    //  *******************************************************  Test: K-DateAddYMD-1
    // XPath: xs:date(\"1999-08-12\") + xs:yearMonthDuration(\"P3Y7M\") eq
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn k_dateaddymd_2() {
    //  *******************************************************  Test: K-DateAddYMD-2
    // XPath: xs:yearMonthDuration(\"P3Y7M\") + xs:date(\"1999-08-12\") eq
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn cbcl_add_yearmonthduration_to_date_001() {
    //  test addition of zero duration to date
    // XPath: declare function local:two-digit($number as xs:integer) { le
    // Expected: 2008-05-12
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}

#[test]
fn cbcl_add_yearmonthduration_to_date_002() {
    //  test addition of zero duration to date
    // XPath: declare function local:two-digit($number as xs:integer) { le
    // Expected: 2008-05-12
    // Calls stub function - will fail until op:add-yearMonthDuration-to-date is implemented
    let _ = stub_opadd_yearmonthduration_to_date();
}
