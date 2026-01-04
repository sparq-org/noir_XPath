//! Test chunk 0 for fn:year-from-date
//! Contains 24 tests

use dep::xpath::stub_fnyear_from_date;

#[test]
fn fn_year_from_date1args_1() {
    //  Evaluates The 'year-from-date' function with the arguments set as follows: $arg
    // XPath: fn:year-from-date(xs:date(\"1970-01-01Z\"))
    // Expected: 1970
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date1args_2() {
    //  Evaluates The 'year-from-date' function with the arguments set as follows: $arg
    // XPath: fn:year-from-date(xs:date(\"1983-11-17Z\"))
    // Expected: 1983
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date1args_3() {
    //  Evaluates The 'year-from-date' function with the arguments set as follows: $arg
    // XPath: fn:year-from-date(xs:date(\"2030-12-31Z\"))
    // Expected: 2030
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_1() {
    //  Evaluates The 'year-from-date' function As per example 1 of the F&O specs
    // XPath: fn:year-from-date(xs:date(\"1999-05-31Z\"))
    // Expected: 1999
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_2() {
    //  Evaluates The 'year-from-date' function As per example 2 of the F&O specs
    // XPath: fn:year-from-date(xs:date(\"2000-01-01Z\"))
    // Expected: 2000
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_3() {
    //  Evaluates The 'year-from-date' function involving a 'numeric-less-than' operati
    // XPath: fn:year-from-date(xs:date(\"1999-12-31Z\")) lt fn:year-from-
    // Expected: false
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_4() {
    //  Evaluates The 'year-from-date' function involving a 'numeric-less-than' operati
    // XPath: fn:year-from-date(xs:date(\"1999-12-31Z\")) le fn:year-from-
    // Expected: true
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_5() {
    //  Evaluates The 'year-from-date' function using the empty sequence as an argument
    // XPath: fn:count(fn:year-from-date(()))
    // Expected: 0
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_6() {
    //  Evaluates The 'year-from-date' function that returns 1.
    // XPath: fn:year-from-date(xs:date(\"0001-05-31Z\"))
    // Expected: 1
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_8() {
    //  Evaluates The 'year-from-date' function as part of a '+' expression.
    // XPath: fn:year-from-date(xs:date(\"1970-01-01Z\")) + fn:year-from-d
    // Expected: 3940
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_9() {
    //  Evaluates The 'year-from-date' function as part of a '-' expression.
    // XPath: fn:year-from-date(xs:date(\"1970-01-01Z\")) - fn:year-from-d
    // Expected: 0
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_10() {
    //  Evaluates The 'year-from-date' function as part of a '*' expression.
    // XPath: fn:year-from-date(xs:date(\"1970-01-01Z\")) * fn:year-from-d
    // Expected: 3940
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_11() {
    //  Evaluates The 'year-from-date' function as part of a 'div' expression.
    // XPath: fn:year-from-date(xs:date(\"1970-01-01Z\")) div fn:year-from
    // Expected: 1
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_12() {
    //  Evaluates The 'year-from-date' function as part of a 'idiv' expression.
    // XPath: fn:year-from-date(xs:date(\"1970-01-01Z\")) idiv fn:year-fro
    // Expected: 1
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_13() {
    //  Evaluates The 'year-from-date' function as part of a 'mod' expression.
    // XPath: fn:year-from-date(xs:date(\"1970-01-01Z\")) mod fn:year-from
    // Expected: 0
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_14() {
    //  Evaluates The 'year-from-date' function as part of a 'numeric-unary-plus' expre
    // XPath: +fn:year-from-date(xs:date(\"1970-01-01Z\"))
    // Expected: 1970
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_15() {
    //  Evaluates The 'year-from-date' function as part of a 'numeric-unary-minus' expr
    // XPath: -fn:year-from-date(xs:date(\"1970-01-01Z\"))
    // Expected: -1970
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_16() {
    //  Evaluates The 'year-from-date' function as part of a 'numeric-equal' expression
    // XPath: fn:year-from-date(xs:date(\"1970-01-01Z\")) eq fn:year-from-
    // Expected: true
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_17() {
    //  Evaluates The 'year-from-date' function as part of a 'numeric-equal' expression
    // XPath: fn:year-from-date(xs:date(\"1970-01-01Z\")) ne fn:year-from-
    // Expected: false
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_18() {
    //  Evaluates The 'year-from-date' function as part of a 'numeric-equal' expression
    // XPath: fn:year-from-date(xs:date(\"1970-01-01Z\")) le fn:year-from-
    // Expected: true
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn fn_year_from_date_19() {
    //  Evaluates The 'year-from-date' function as part of a 'numeric-equal' expression
    // XPath: fn:year-from-date(xs:date(\"1970-01-01Z\")) ge fn:year-from-
    // Expected: true
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn k_yearfromdatefunc_3() {
    //  A test whose essence is: `empty(year-from-date(()))`.
    // XPath: empty(year-from-date(()))
    // Expected: true
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn k_yearfromdatefunc_4() {
    //  A test whose essence is: `year-from-date(()) instance of xs:integer?`.
    // XPath: year-from-date(()) instance of xs:integer?
    // Expected: true
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}

#[test]
fn k_yearfromdatefunc_5() {
    //  A test whose essence is: `year-from-date(xs:date('2000-02-03')) eq 2000`.
    // XPath: year-from-date(xs:date(\"2000-02-03\")) eq 2000
    // Expected: true
    // Calls stub function - will fail until fn:year-from-date is implemented
    let _ = stub_fnyear_from_date();
}
