//! Test chunk 0 for fn:day-from-date
//! Contains 25 tests

use dep::xpath::stub_fnday_from_date;

#[test]
fn fn_day_from_date1args_1() {
    //  Evaluates The 'day-from-date' function with the arguments set as follows: $arg
    // XPath: fn:day-from-date(xs:date(\"1970-01-01Z\"))
    // Expected: 1
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date1args_2() {
    //  Evaluates The 'day-from-date' function with the arguments set as follows: $arg
    // XPath: fn:day-from-date(xs:date(\"1983-11-17Z\"))
    // Expected: 17
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date1args_3() {
    //  Evaluates The 'day-from-date' function with the arguments set as follows: $arg
    // XPath: fn:day-from-date(xs:date(\"2030-12-31Z\"))
    // Expected: 31
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_1() {
    //  Evaluates The 'day-from-date' function As per example 1 of the F&O specs
    // XPath: fn:day-from-date(xs:date(\"1999-05-31-05:00\"))
    // Expected: 31
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_2() {
    //  Evaluates The 'day-from-date' function As per example 2 of the F&O specs
    // XPath: fn:day-from-date(xs:date(\"2000-01-01+05:00\"))
    // Expected: 1
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_3() {
    //  Evaluates The 'day-from-date' function involving a 'numeric-less-than' operatio
    // XPath: fn:day-from-date(xs:date(\"1999-12-31Z\")) lt fn:day-from-da
    // Expected: false
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_4() {
    //  Evaluates The 'day-from-date' function involving a 'numeric-less-than' operatio
    // XPath: fn:day-from-date(xs:date(\"1999-12-31Z\")) le fn:day-from-da
    // Expected: true
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_5() {
    //  Evaluates The 'day-from-date' function using the empty sequence as an argument.
    // XPath: fn:count(fn:day-from-date(()))
    // Expected: 0
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_6() {
    //  Evaluates The 'day-from-date' function that returns 31.
    // XPath: fn:day-from-date(xs:date(\"1999-05-31Z\"))
    // Expected: 31
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_7() {
    //  Evaluates The 'day-from-date' function used as arguments to an avg function .
    // XPath: fn:avg((fn:day-from-date(xs:date(\"1999-12-31Z\")),fn:day-fr
    // Expected: 30
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_8() {
    //  Evaluates The 'day-from-date' function as part of a '+' expression.
    // XPath: fn:day-from-date(xs:date(\"1970-01-01Z\")) + fn:day-from-dat
    // Expected: 2
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_9() {
    //  Evaluates The 'day-from-date' function as part of a '-' expression.
    // XPath: fn:day-from-date(xs:date(\"1970-01-01Z\")) - fn:day-from-dat
    // Expected: 0
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_10() {
    //  Evaluates The 'day-from-date' function as part of a '*' expression.
    // XPath: fn:day-from-date(xs:date(\"1970-01-03Z\")) * fn:day-from-dat
    // Expected: 3
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_11() {
    //  Evaluates The 'day-from-date' function as part of a 'div' expression.
    // XPath: fn:day-from-date(xs:date(\"1970-01-02Z\")) div fn:day-from-d
    // Expected: 2
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_12() {
    //  Evaluates The 'day-from-date' function as part of a 'idiv' expression.
    // XPath: fn:day-from-date(xs:date(\"1970-01-02Z\")) idiv fn:day-from-
    // Expected: 2
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_13() {
    //  Evaluates The 'day-from-date' function as part of a 'mod' expression.
    // XPath: fn:day-from-date(xs:date(\"1970-01-02Z\")) mod fn:day-from-d
    // Expected: 0
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_14() {
    //  Evaluates The 'day-from-date' function as part of a 'numeric-unary-plus' expres
    // XPath: +fn:day-from-date(xs:date(\"1970-01-01Z\"))
    // Expected: 1
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_15() {
    //  Evaluates The 'day-from-date' function as part of a 'numeric-unary-minus' expre
    // XPath: -fn:day-from-date(xs:date(\"1970-01-01Z\"))
    // Expected: -1
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_16() {
    //  Evaluates The 'day-from-date' function as part of a 'numeric-equal' expression
    // XPath: fn:day-from-date(xs:date(\"1970-01-02Z\")) eq fn:day-from-da
    // Expected: false
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_17() {
    //  Evaluates The 'month-from-date' function as part of a 'numeric-equal' expressio
    // XPath: fn:month-from-date(xs:date(\"1970-01-01Z\")) ne fn:month-fro
    // Expected: false
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_18() {
    //  Evaluates The 'day-from-date' function as part of a 'numeric-equal' expression
    // XPath: fn:day-from-date(xs:date(\"1970-01-01Z\")) le fn:day-from-da
    // Expected: true
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn fn_day_from_date_19() {
    //  Evaluates The 'day-from-date' function as part of a 'numeric-equal' expression
    // XPath: fn:day-from-date(xs:date(\"1970-01-03Z\")) ge fn:day-from-da
    // Expected: true
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn k_dayfromdatefunc_3() {
    //  A test whose essence is: `empty(day-from-date(()))`.
    // XPath: empty(day-from-date(()))
    // Expected: true
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn k_dayfromdatefunc_4() {
    //  A test whose essence is: `day-from-date(()) instance of xs:integer?`.
    // XPath: day-from-date(()) instance of xs:integer?
    // Expected: true
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}

#[test]
fn k_dayfromdatefunc_5() {
    //  A test whose essence is: `day-from-date(xs:date('2000-02-03')) eq 3`.
    // XPath: day-from-date(xs:date(\"2000-02-03\")) eq 3
    // Expected: true
    // Calls stub function - will fail until fn:day-from-date is implemented
    let _ = stub_fnday_from_date();
}
