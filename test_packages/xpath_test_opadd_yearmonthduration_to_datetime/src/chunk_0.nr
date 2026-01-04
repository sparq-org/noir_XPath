//! Test chunk 0 for op:add-yearMonthDuration-to-dateTime
//! Contains 23 tests

use dep::xpath::stub_opadd_yearmonthduration_to_datetime;

#[test]
fn op_add_yearmonthduration_to_datetime2args_1() {
    //  Evaluates The 'op:add-yearMonthDuration-to-dateTime' operator with the argument
    // XPath: xs:dateTime(\"1970-01-01T00:00:00Z\") + xs:yearMonthDuration
    // Expected: 1970-01-01T00:00:00Z
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime2args_2() {
    //  Evaluates The 'op:add-yearMonthDuration-to-dateTime' operator with the argument
    // XPath: xs:dateTime(\"1996-04-07T01:40:52Z\") + xs:yearMonthDuration
    // Expected: 1996-04-07T01:40:52Z
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime2args_3() {
    //  Evaluates The 'op:add-yearMonthDuration-to-dateTime' operator with the argument
    // XPath: xs:dateTime(\"2030-12-31T23:59:59Z\") + xs:yearMonthDuration
    // Expected: 2030-12-31T23:59:59Z
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime2args_4() {
    //  Evaluates The 'op:add-yearMonthDuration-to-dateTime' operator with the argument
    // XPath: xs:dateTime(\"1970-01-01T00:00:00Z\") + xs:yearMonthDuration
    // Expected: 2970-07-01T00:00:00Z
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime2args_5() {
    //  Evaluates The 'op:add-yearMonthDuration-to-dateTime' operator with the argument
    // XPath: xs:dateTime(\"1970-01-01T00:00:00Z\") + xs:yearMonthDuration
    // Expected: 4001-01-01T00:00:00Z
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime_1() {
    // date: July 5, 2005  Evaluates The 'add-yearMonthDuration-to-dateTime' operator A
    // XPath: xs:dateTime(\"2000-10-30T11:12:00\") + xs:yearMonthDuration(
    // Expected: 2001-12-30T11:12:00
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime_2() {
    // date: July 5, 2005  Evaluates The string value of 'add-dayTimeDuration-to-dateTi
    // XPath: fn:string(xs:dateTime(\"2000-12-12T12:12:12Z\") + xs:dayTime
    // Expected: false
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime_3() {
    // date: July 5, 2005  Evaluates The string value of 'add-yearMonthDuration-to-date
    // XPath: fn:string((xs:dateTime(\"1999-10-23T13:45:45Z\") + xs:yearMo
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime_4() {
    // date: July 5, 2005  Evaluates The string value of the 'add-yearMonthDuration-to-
    // XPath: fn:not(fn:string(xs:dateTime(\"1998-09-12T13:56:12Z\") + xs:
    // Expected: false
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetimealt_5() {
    // date: July 5, 2005  Evaluates The string value of the 'add-yearMonthDuration-to-
    // XPath: fn:boolean(fn:string(xs:dateTime(\"1962-03-12T10:12:34Z\") +
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime_6() {
    // date: July 5, 2005  Evaluates The 'add-yearMonthDuration-to-dateTime' operator t
    // XPath: fn:number(xs:dateTime(\"1988-01-28T13:45:23Z\") + xs:yearMon
    // Expected: NaN
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime_7() {
    // date: July 5, 2005  Evaluates The 'add-yearMonthDuration-to-dateTime' operator u
    // XPath: fn:string(xs:dateTime(\"1989-07-05T14:34:36Z\") + xs:yearMon
    // Expected: 1997-11-05T14:34:36Z
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime_9() {
    // date: July 5, 2005  Evaluates The string value of the 'add-yearMonthDuration-to-
    // XPath: fn:string((xs:dateTime(\"1993-12-09T10:10:10Z\") + xs:yearMo
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime_10() {
    // date: July 5, 2005  Evaluates The string value of the 'add-yearMonthDuration-to-
    // XPath: fn:string((xs:dateTime(\"1985-07-05T09:09:09Z\") + xs:yearMo
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime_12() {
    // date: July 5, 2005  Evaluates The string value of the 'add-yearMonthDuration-to-
    // XPath: fn:string((xs:dateTime(\"1980-03-02T02:02:02Z\") + xs:yearMo
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime_13() {
    // date: July 5, 2005  Evaluates The 'add-yearMonthDuration-to-dateTime' operator u
    // XPath: (xs:dateTime(\"1980-05-05T05:05:05Z\") + xs:yearMonthDuratio
    // Expected: false
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime_14() {
    // date: July 5, 2005  Evaluates The 'add-yearMonthDuration-to-dateTime' operator u
    // XPath: (xs:dateTime(\"1979-12-12T09:09:09Z\") + xs:yearMonthDuratio
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime_15() {
    // date: July 5, 2005  Evaluates The 'add-yearMonthDuration-to-dateTime' operator u
    // XPath: (xs:dateTime(\"1978-12-12T07:07:07Z\") + xs:yearMonthDuratio
    // Expected: false
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn op_add_yearmonthduration_to_datetime_16() {
    // date: July 5, 2005  Evaluates The 'add-yearMonthDuration-to-dateTime' operator u
    // XPath: (xs:dateTime(\"1977-12-12T03:03:03Z\") + xs:yearMonthDuratio
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn k_yearmonthdurationadddt_1() {
    //  Simple testing involving operator '+' between xs:dateTime and xs:yearMonthDurat
    // XPath: xs:dateTime(\"1999-07-19T08:23:01.765\") + xs:yearMonthDurat
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn k_yearmonthdurationadddt_2() {
    //  Simple testing involving operator '+' between xs:yearMonthDuration and xs:dateT
    // XPath: xs:yearMonthDuration(\"P3Y35M\") + xs:dateTime(\"1999-07-19T
    // Expected: true
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn cbcl_add_yearmonthduration_to_datetime_001() {
    //  test addition of zero duration to dateTime
    // XPath: declare function local:two-digit($number as xs:integer) {
    // Expected: 2008-05-12T12:59:00
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}

#[test]
fn cbcl_add_yearmonthduration_to_datetime_002() {
    //  test addition of zero duration to dateTime
    // XPath: declare function local:two-digit($number as xs:integer) {
    // Expected: 2008-05-12T12:59:00
    // Calls stub function - will fail until op:add-yearMonthDuration-to-dateTime is implemented
    let _ = stub_opadd_yearmonthduration_to_datetime();
}
