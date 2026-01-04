//! Test chunk 0 for op:subtract-dates
//! Contains 24 tests

use dep::xpath::stub_opsubtract_dates;

#[test]
fn op_subtract_dates_yielding_dtd_1() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: xs:date(\"2000-10-30\") - xs:date(\"1999-11-28\")
    // Expected: P337D
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_2() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: xs:date(\"2000-10-30+05:00\") - xs:date(\"1999-11-28Z\")
    // Expected: P336DT19H
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_3() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: xs:date(\"2000-10-15-05:00\") - xs:date(\"2000-10-10+02:00\"
    // Expected: P5DT7H
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_4() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: fn:not(fn:string(xs:date(\"1998-09-12Z\") - xs:date(\"1998-0
    // Expected: false
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_5() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: fn:boolean(fn:string(xs:date(\"1962-03-12Z\") - xs:date(\"19
    // Expected: true
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_6() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: fn:number(xs:date(\"1988-01-28Z\") - xs:date(\"2001-03-02\")
    // Expected: NaN
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_7() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: fn:string(xs:date(\"1989-07-05Z\") - xs:date(\"1962-09-04Z\"
    // Expected: P9801D
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_8() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: xs:date(\"0001-01-01Z\") - xs:date(\"2005-07-06Z\")
    // Expected: -P732132D
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_9() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: fn:string((xs:date(\"1993-12-09Z\") - xs:date(\"1992-10-02Z\
    // Expected: true
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_10() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: fn:string((xs:date(\"1985-07-05Z\") - xs:date(\"1977-12-02Z\
    // Expected: true
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_11() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: (xs:date(\"1978-12-12Z\") - xs:date(\"1978-12-12Z\")) div xs
    // Expected: 0
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_12() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: fn:string((xs:date(\"1980-03-02Z\") - xs:date(\"2001-09-11Z\
    // Expected: true
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_13() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: fn:string((xs:date(\"1980-05-05Z\") - xs:date(\"1981-12-03Z\
    // Expected: false
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_14() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: fn:string((xs:date(\"1979-12-12Z\") - xs:date(\"1979-11-11Z\
    // Expected: true
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_15() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: fn:string((xs:date(\"1978-12-12Z\") - xs:date(\"1977-03-12Z\
    // Expected: false
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_16() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: fn:string((xs:date(\"1977-12-12Z\") - xs:date(\"1976-12-12Z\
    // Expected: true
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_17() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: fn:string(xs:date(\"2000-12-12Z\") - xs:date(\"2000-11-11Z\"
    // Expected: false
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_18() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: fn:string((xs:date(\"1999-10-23Z\") - xs:date(\"1998-09-09Z\
    // Expected: true
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_19() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: (xs:date(\"1999-10-23Z\") - xs:date(\"1998-09-09Z\")) * xs:d
    // Expected: P818D
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn op_subtract_dates_yielding_dtd_20() {
    //  ******************************************************* Test: op-subtract-dates
    // XPath: (xs:date(\"1999-10-23Z\") - xs:date(\"1998-09-09Z\")) + xs:d
    // Expected: P426DT10H2M
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn k_datessubtract_1() {
    //  *******************************************************  Test: K-DatesSubtract-
    // XPath: xs:date(\"1999-07-19\") - xs:date(\"1969-11-30\") eq xs:dayT
    // Expected: true
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn k_datessubtract_2() {
    //  *******************************************************  Test: K-DatesSubtract-
    // XPath: xs:date(\"1999-07-19\") - xs:date(\"1999-07-19\") eq xs:dayT
    // Expected: true
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn cbcl_subtract_dates_003() {
    //  test subtraction of large dates
    // XPath: xs:date(\"2008-12-31\") - xs:date(\"2002-12-31+01:00\") + im
    // Expected: P2192DT1H
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}

#[test]
fn cbcl_subtract_dates_004() {
    //  test subtraction of large dates
    // XPath: xs:date(\"2002-12-31+01:00\") - xs:date(\"2008-12-31\") - im
    // Expected: -P2192DT1H
    // Calls stub function - will fail until op:subtract-dates is implemented
    let _ = stub_opsubtract_dates();
}
