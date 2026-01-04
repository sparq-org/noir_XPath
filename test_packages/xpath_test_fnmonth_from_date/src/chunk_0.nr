//! Test chunk 0 for fn:month-from-date
//! Contains 25 tests

use dep::xpath::stub_fnmonth_from_date;

#[test]
fn fn_month_from_date1args_1() {
    //  Evaluates The 'month-from-date' function with the arguments set as follows: $ar
    // XPath: fn:month-from-date(xs:date(\"1970-01-01Z\"))
    // Expected: 1
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date1args_2() {
    //  Evaluates The 'month-from-date' function with the arguments set as follows: $ar
    // XPath: fn:month-from-date(xs:date(\"1983-11-17Z\"))
    // Expected: 11
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date1args_3() {
    //  Evaluates The 'month-from-date' function with the arguments set as follows: $ar
    // XPath: fn:month-from-date(xs:date(\"2030-12-31Z\"))
    // Expected: 12
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_1() {
    //  Evaluates The 'month-from-date' function As per example 1 of the F&O specs
    // XPath: fn:month-from-date(xs:date(\"1999-05-31-05:00\"))
    // Expected: 5
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_2() {
    //  Evaluates The 'month-from-date' function As per example 2 of the F&O specs
    // XPath: fn:month-from-date(xs:date(\"2000-01-01+05:00\"))
    // Expected: 1
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_3() {
    //  Evaluates The 'month-from-date' function involving a 'numeric-less-than' operat
    // XPath: fn:month-from-date(xs:date(\"1999-12-31Z\")) lt fn:month-fro
    // Expected: false
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_4() {
    //  Evaluates The 'month-from-date' function involving a 'numeric-less-than' operat
    // XPath: fn:month-from-date(xs:date(\"1999-12-31Z\")) le fn:month-fro
    // Expected: true
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_5() {
    //  Evaluates The 'month-from-date' function using the empty sequence as an argumen
    // XPath: fn:count(fn:month-from-date(()))
    // Expected: 0
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_6() {
    //  Evaluates The 'month-from-date' function that returns 1.
    // XPath: fn:month-from-date(xs:date(\"1970-01-31Z\"))
    // Expected: 1
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_7() {
    //  Evaluates The 'month-from-date' function that returns 12.
    // XPath: fn:month-from-date(xs:date(\"1999-12-31Z\"))
    // Expected: 12
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_8() {
    //  Evaluates The 'month-from-date' function as part of a '+' expression.
    // XPath: fn:month-from-date(xs:date(\"1970-01-01Z\")) + fn:month-from
    // Expected: 2
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_9() {
    //  Evaluates The 'month-from-date' function as part of a '-' expression.
    // XPath: fn:month-from-date(xs:date(\"1970-01-01Z\")) - fn:month-from
    // Expected: 0
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_10() {
    //  Evaluates The 'month-from-date' function as part of a '*' expression.
    // XPath: fn:month-from-date(xs:date(\"1970-01-01Z\")) * fn:month-from
    // Expected: 1
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_11() {
    //  Evaluates The 'month-from-date' function as part of a 'div' expression.
    // XPath: fn:month-from-date(xs:date(\"1970-01-01Z\")) div fn:month-fr
    // Expected: 1
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_12() {
    //  Evaluates The 'month-from-date' function as part of a 'idiv' expression.
    // XPath: fn:month-from-date(xs:date(\"1970-01-01Z\")) idiv fn:month-f
    // Expected: 1
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_13() {
    //  Evaluates The 'month-from-date' function as part of a 'mod' expression.
    // XPath: fn:month-from-date(xs:date(\"1970-01-01Z\")) mod fn:month-fr
    // Expected: 0
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_14() {
    //  Evaluates The 'month-from-date' function as part of a 'numeric-unary-plus' expr
    // XPath: +fn:month-from-date(xs:date(\"1970-01-01Z\"))
    // Expected: 1
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_15() {
    //  Evaluates The 'month-from-date' function as part of a 'numeric-unary-minus' exp
    // XPath: -fn:month-from-date(xs:date(\"1970-01-01Z\"))
    // Expected: -1
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_16() {
    //  Evaluates The 'month-from-date' function as part of a 'numeric-equal' expressio
    // XPath: fn:month-from-date(xs:date(\"1970-01-01Z\")) eq fn:month-fro
    // Expected: true
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_17() {
    //  Evaluates The 'month-from-date' function as part of a 'numeric-equal' expressio
    // XPath: fn:month-from-date(xs:date(\"1970-01-01Z\")) ne fn:month-fro
    // Expected: false
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_18() {
    //  Evaluates The 'month-from-date' function as part of a 'numeric-equal' expressio
    // XPath: fn:month-from-date(xs:date(\"1970-01-01Z\")) le fn:month-fro
    // Expected: true
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn fn_month_from_date_19() {
    //  Evaluates The 'month-from-date' function as part of a 'numeric-equal' expressio
    // XPath: fn:month-from-date(xs:date(\"1970-01-01Z\")) ge fn:month-fro
    // Expected: true
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn k_monthfromdatefunc_3() {
    //  A test whose essence is: `empty(month-from-date(()))`.
    // XPath: empty(month-from-date(()))
    // Expected: true
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn k_monthfromdatefunc_4() {
    //  A test whose essence is: `month-from-date(()) instance of xs:integer?`.
    // XPath: month-from-date(()) instance of xs:integer?
    // Expected: true
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}

#[test]
fn k_monthfromdatefunc_5() {
    //  A test whose essence is: `month-from-date(xs:date('2000-02-03')) eq 2`.
    // XPath: month-from-date(xs:date(\"2000-02-03\")) eq 2
    // Expected: true
    // Calls stub function - will fail until fn:month-from-date is implemented
    let _ = stub_fnmonth_from_date();
}
