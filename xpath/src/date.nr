//! Date functions for XPath/SPARQL
//!
//! Implements xs:date operations.
//! Date values are stored as days since Unix epoch (1970-01-01) plus timezone offset.
//!
//! XPath functions implemented:
//! - fn:year-from-date, fn:month-from-date, fn:day-from-date
//! - fn:timezone-from-date
//! - op:date-equal, op:date-less-than, op:date-greater-than

use crate::constants::{XSD_MICROS_PER_DAY, XSD_MICROS_PER_MINUTE};
use crate::types::{XsdDate, XsdDayTimeDuration};

// ============================================================================
// Date Construction Functions
// ============================================================================

/// Create a date from year, month, day components (UTC)
pub fn date_from_components(year: i32, month: u8, day: u8) -> XsdDate {
    let epoch_days = ymd_to_epoch_days(year, month, day);
    XsdDate::new(epoch_days)
}

/// Create a date from year, month, day components with timezone.
///
/// The stored `epoch_days` is the *local-calendar* date, i.e. days since
/// 1970-01-01 ignoring the offset; the `tz_offset_minutes` field is kept
/// alongside. All four `op:date-*` comparison operators (equality and
/// ordering) follow the XPath F&O 3.1 §10.4.6 contract: cast each value
/// to xs:dateTime at 00:00:00 in its timezone and compare on the
/// resulting UTC instant. See `date_to_utc_minutes` for the ordering
/// key. For the tz-insensitive XSD 1.1 §3.3.9 calendar-equality, see
/// `date_calendar_equal`.
pub fn date_from_components_with_tz(
    year: i32,
    month: u8,
    day: u8,
    tz_offset_minutes: i16,
) -> XsdDate {
    let epoch_days = ymd_to_epoch_days(year, month, day);
    XsdDate::new_with_tz(epoch_days, tz_offset_minutes)
}

/// Create a date from epoch days (UTC)
pub fn date_from_epoch_days(days: i32) -> XsdDate {
    XsdDate::new(days)
}

/// Create a date from epoch days with timezone
pub fn date_from_epoch_days_with_tz(days: i32, tz_offset_minutes: i16) -> XsdDate {
    XsdDate::new_with_tz(days, tz_offset_minutes)
}

// ============================================================================
// Date Component Extraction
// ============================================================================

/// Extract year from date
pub fn year_from_date(date: XsdDate) -> i32 {
    let (year, _, _) = epoch_days_to_ymd(date.epoch_days);
    year
}

/// Extract month from date (1-12)
pub fn month_from_date(date: XsdDate) -> u8 {
    let (_, month, _) = epoch_days_to_ymd(date.epoch_days);
    month
}

/// Extract day from date (1-31)
pub fn day_from_date(date: XsdDate) -> u8 {
    let (_, _, day) = epoch_days_to_ymd(date.epoch_days);
    day
}

/// Extract timezone from date as a dayTimeDuration
pub fn timezone_from_date(date: XsdDate) -> XsdDayTimeDuration {
    let offset_micros: i64 = (date.tz_offset_minutes as i64) * (XSD_MICROS_PER_MINUTE as i64);
    XsdDayTimeDuration::from_signed_micros(offset_micros)
}

// ============================================================================
// Date Comparison Functions
// ============================================================================
//
// XPath F&O 3.1 §10.4.6 defines op:date-equal / op:date-less-than /
// op:date-greater-than via cast to xs:dateTime at start-of-day in the
// value's timezone followed by a UTC-normalised compare. All three
// operators therefore agree on the same UTC-instant ordering — that's
// the contract the conformance suite (`test_packages/xpath_test_opdate_*`)
// asserts and what this module implements.
//
// The underlying instant is `epoch_days * 1440 - tz_offset_minutes`,
// expressed in minutes since the Unix epoch. Minutes (not microseconds)
// are sufficient because xs:date has day granularity and
// `tz_offset_minutes` is a whole-minute count — and minutes-scale keeps
// the intermediate product safely inside `i64` for any plausible
// `epoch_days` range (`i32::MAX * 1440 ~= 3.1e12`, well below `i64::MAX`
// of ~9.2e18; in microseconds the product would be ~1.8e20 and overflow).
//
// Calendar-only equality (xs:date as a calendar value per XSD 1.1 §3.3.9,
// ignoring timezone) is exposed separately as `date_calendar_equal` for
// callers that need it; `op:date-equal` uses the F&O semantics.
//
// Absent-timezone handling: this implementation treats an XsdDate
// constructed without a timezone as UTC (`tz_offset_minutes == 0`). The
// "implicit timezone" XPath dynamic-context concept is not modelled;
// UTC is the closest sound approximation in a context-free setting.

/// Convert an XsdDate to its UTC ordering key, in minutes since the Unix
/// epoch. Used by `op:date-equal` / `op:date-less-than` /
/// `op:date-greater-than`. Minutes-scale (rather than microseconds)
/// keeps the intermediate product inside `i64` even at `i32::MAX`
/// epoch_days, while preserving full ordering precision because both
/// `epoch_days` and `tz_offset_minutes` are integral.
fn date_to_utc_minutes(d: XsdDate) -> i64 {
    let day_minutes: i64 = (d.epoch_days as i64) * 1440;
    day_minutes - (d.tz_offset_minutes as i64)
}

/// op:date-equal — two dates are equal iff they map to the same UTC
/// instant after normalising start-of-day in each value's timezone. This
/// matches XPath F&O 3.1 §10.4.6 and the W3C op:date-equal conformance
/// suite. For the tz-insensitive XSD 1.1 §3.3.9 calendar-equality, see
/// `date_calendar_equal`.
pub fn date_equal(a: XsdDate, b: XsdDate) -> bool {
    date_to_utc_minutes(a) == date_to_utc_minutes(b)
}

/// XSD 1.1 §3.3.9 calendar-equality: two dates share the same Y/M/D
/// regardless of timezone. Exposed separately because `op:date-equal`
/// (and `impl Eq for XsdDate`) follow the XPath F&O instant semantics.
pub fn date_calendar_equal(a: XsdDate, b: XsdDate) -> bool {
    a.epoch_days == b.epoch_days
}

/// op:date-less-than — compares dates as their corresponding xs:dateTime
/// values at 00:00:00 in their respective timezones, normalised to UTC.
pub fn date_less_than(a: XsdDate, b: XsdDate) -> bool {
    date_to_utc_minutes(a) < date_to_utc_minutes(b)
}

/// op:date-greater-than — mirror of `date_less_than`.
pub fn date_greater_than(a: XsdDate, b: XsdDate) -> bool {
    date_to_utc_minutes(a) > date_to_utc_minutes(b)
}

/// Convenience: `<=` under the UTC-normalised ordering.
pub fn date_le(a: XsdDate, b: XsdDate) -> bool {
    date_to_utc_minutes(a) <= date_to_utc_minutes(b)
}

/// Convenience: `>=` under the UTC-normalised ordering.
pub fn date_ge(a: XsdDate, b: XsdDate) -> bool {
    date_to_utc_minutes(a) >= date_to_utc_minutes(b)
}

// ============================================================================
// Helper Functions for Date Conversion
// ============================================================================

/// Integer floor division for positive divisors.
/// Noir division truncates toward zero; for negative numerators we need floor.
fn floor_div_i64(a: i64, b: i64) -> i64 {
    assert(b > 0, "floor_div_i64 requires positive divisor");
    let q = a / b;
    let r = a % b;
    if (a < 0) & (r != 0) {
        q - 1
    } else {
        q
    }
}

/// Closed-form conversion: civil date -> days since Unix epoch (1970-01-01).
/// Proleptic Gregorian calendar, ISO-8601 compatible (allows year 0).
///
/// Based on Howard Hinnant's `days_from_civil` (public domain).
fn days_from_civil(year: i64, month: i64, day: i64) -> i64 {
    // Shift March to be month 0.
    let y = year - if month <= 2 { 1 } else { 0 };
    let era = floor_div_i64(if y >= 0 { y } else { y - 399 }, 400);
    let yoe = y - era * 400; // [0, 399]
    let mp = month + if month > 2 { -3 } else { 9 }; // March=0,...,Feb=11
    let doy = floor_div_i64(153 * mp + 2, 5) + day - 1; // [0, 365]
    let doe = yoe * 365 + floor_div_i64(yoe, 4) - floor_div_i64(yoe, 100) + doy; // [0, 146096]
    era * 146097 + doe - 719468
}

/// Closed-form conversion: days since Unix epoch -> civil date (year, month, day).
/// Proleptic Gregorian calendar, ISO-8601 compatible (allows year 0).
///
/// Based on Howard Hinnant's `civil_from_days` (public domain).
fn civil_from_days(epoch_days: i64) -> (i64, i64, i64) {
    let z = epoch_days + 719468;
    let era = floor_div_i64(if z >= 0 { z } else { z - 146096 }, 146097);
    let doe = z - era * 146097; // [0, 146096]
    let yoe = floor_div_i64(
        doe - floor_div_i64(doe, 1460) + floor_div_i64(doe, 36524) - floor_div_i64(doe, 146096),
        365,
    ); // [0, 399]
    let mut y = yoe + era * 400;
    let doy = doe - (yoe * 365 + floor_div_i64(yoe, 4) - floor_div_i64(yoe, 100)); // [0, 365]
    let mp = floor_div_i64(5 * doy + 2, 153); // [0, 11]
    let d = doy - floor_div_i64(153 * mp + 2, 5) + 1; // [1, 31]
    let m = mp + if mp < 10 { 3 } else { -9 }; // [1, 12]
    if m <= 2 {
        y = y + 1;
    }
    (y, m, d)
}

/// Convert year, month, day to days since Unix epoch (1970-01-01)
fn ymd_to_epoch_days(year: i32, month: u8, day: u8) -> i32 {
    let y: i64 = year as i64;
    let m: i64 = month as i64;
    let d: i64 = day as i64;
    let days: i64 = days_from_civil(y, m, d);
    days as i32
}

/// Convert days since Unix epoch to year, month, day
fn epoch_days_to_ymd(epoch_days: i32) -> (i32, u8, u8) {
    let (y, m, d) = civil_from_days(epoch_days as i64);
    (y as i32, m as u8, d as u8)
}

/// Check if a year is a leap year
fn is_leap_year(year: i32) -> bool {
    // Leap year if divisible by 4, except centuries (unless divisible by 400)
    let div4 = year % 4 == 0;
    let div100 = year % 100 == 0;
    let div400 = year % 400 == 0;

    div4 & (!div100 | div400)
}

// ============================================================================
// Tests
// ============================================================================

#[test]
fn test_date_epoch_roundtrip_basic() {
    // Unix epoch
    let d0 = date_from_epoch_days(0);
    assert(year_from_date(d0) == 1970);
    assert(month_from_date(d0) == 1);
    assert(day_from_date(d0) == 1);

    // Day before epoch
    let d1 = date_from_epoch_days(-1);
    assert(year_from_date(d1) == 1969);
    assert(month_from_date(d1) == 12);
    assert(day_from_date(d1) == 31);
}

#[test]
fn test_date_roundtrip_leap_and_century_rules() {
    // 2000 is a leap year (divisible by 400)
    let d = date_from_components(2000, 2, 29);
    assert(date_from_epoch_days(d.epoch_days).epoch_days == d.epoch_days);
    assert(year_from_date(d) == 2000);
    assert(month_from_date(d) == 2);
    assert(day_from_date(d) == 29);

    // 1900 is NOT a leap year (century not divisible by 400)
    let d2 = date_from_components(1900, 3, 1);
    assert(year_from_date(d2) == 1900);
    assert(month_from_date(d2) == 3);
    assert(day_from_date(d2) == 1);

    // 2100 is NOT a leap year
    let d3 = date_from_components(2100, 3, 1);
    assert(year_from_date(d3) == 2100);
    assert(month_from_date(d3) == 3);
    assert(day_from_date(d3) == 1);
}

#[test]
fn test_date_roundtrip_various_samples() {
    let samples: [(i32, u8, u8); 6] =
        [(1970, 1, 1), (1999, 12, 31), (2000, 3, 1), (1960, 1, 15), (1600, 2, 29), (2400, 2, 29)];

    for i in 0..6 {
        let (y, m, d) = samples[i];
        let date = date_from_components(y, m, d);
        let (ry, rm, rd) = epoch_days_to_ymd(date.epoch_days);
        assert(ry == y);
        assert(rm == m);
        assert(rd == d);
    }
}

// ----------------------------------------------------------------------------
// Issue #33 — XsdDate timezone-aware comparison tests.
// XPath F&O 3.1 §10.4.6: op:date-equal / op:date-less-than /
// op:date-greater-than all normalise the (epoch_days, tz_offset_minutes)
// pair to a UTC instant before comparing. The XSD 1.1 §3.3.9 calendar-
// only equality is exposed separately as `date_calendar_equal`.
// ----------------------------------------------------------------------------

#[test]
fn test_date_equal_uses_utc_instant() {
    // Same calendar date, different timezones -> different UTC instants,
    // so op:date-equal returns false. This matches XPath F&O 3.1 §10.4.6
    // and `test_packages/xpath_test_opdate_equal::cbcl_date_equal_004`.
    let a = date_from_components_with_tz(2025, 12, 31, 0); // 2025-12-31Z
    let b = date_from_components_with_tz(2025, 12, 31, -720); // 2025-12-31-12:00
    assert(!date_equal(a, b));
}

#[test]
fn test_date_calendar_equal_ignores_tz() {
    // Same calendar date, different timezones -> calendar-equal under
    // XSD 1.1 §3.3.9. This is the helper for callers who want the
    // tz-insensitive Y/M/D comparison rather than F&O instant equality.
    let a = date_from_components_with_tz(2025, 12, 31, 0);
    let b = date_from_components_with_tz(2025, 12, 31, -720);
    assert(date_calendar_equal(a, b));
}

#[test]
fn test_date_equal_matches_calendar_equal_when_tz_aligned() {
    // Same calendar date, same timezone -> both operators agree.
    let a = date_from_components_with_tz(2025, 12, 31, 540);
    let b = date_from_components_with_tz(2025, 12, 31, 540);
    assert(date_equal(a, b));
    assert(date_calendar_equal(a, b));
}

#[test]
fn test_date_less_than_normalises_to_utc() {
    // Same calendar date, different timezones: the +00:00 instant is
    // 2025-12-31T00:00Z; the -12:00 instant is 2025-12-31T12:00Z. So
    // (2025-12-31, +00:00) < (2025-12-31, -12:00).
    let a = date_from_components_with_tz(2025, 12, 31, 0);
    let b = date_from_components_with_tz(2025, 12, 31, -720);
    assert(date_less_than(a, b));
    assert(!date_less_than(b, a));
    assert(date_greater_than(b, a));
    assert(!date_greater_than(a, b));
}

#[test]
fn test_date_le_ge_under_tz() {
    // (2025-12-31, +00:00) <= (2025-12-31, -12:00); strict, so not >=.
    let a = date_from_components_with_tz(2025, 12, 31, 0);
    let b = date_from_components_with_tz(2025, 12, 31, -720);
    assert(date_le(a, b));
    assert(!date_le(b, a));
    assert(date_ge(b, a));
    assert(!date_ge(a, b));

    // Reflexive: a <= a, a >= a.
    assert(date_le(a, a));
    assert(date_ge(a, a));
}

#[test]
fn test_date_ordering_crosses_calendar_day_via_tz() {
    // (2025-12-31, +14:00) is the UTC instant 2025-12-30T10:00Z.
    // (2025-12-31, -14:00) is the UTC instant 2025-12-31T14:00Z.
    // (2026-01-01, +00:00) is the UTC instant 2026-01-01T00:00Z.
    let a = date_from_components_with_tz(2025, 12, 31, 840); // +14:00
    let b = date_from_components_with_tz(2025, 12, 31, -840); // -14:00
    let c = date_from_components_with_tz(2026, 1, 1, 0); // UTC

    assert(date_less_than(a, b));
    assert(date_less_than(b, c));
    assert(date_less_than(a, c));
}

#[test]
fn test_date_ordering_no_tz_treated_as_utc() {
    // Constructors without tz default to offset 0 (i.e. UTC). Mixing
    // with-tz and without-tz dates should compare as if both were in UTC.
    let a = date_from_components(2025, 12, 31); // implicit UTC
    let b = date_from_components_with_tz(2025, 12, 31, -60); // -01:00
    // b's UTC instant is 2025-12-31T01:00Z; a is 2025-12-31T00:00Z.
    assert(date_less_than(a, b));
}

// ============================================================================
// Date + Duration Arithmetic
// ============================================================================

/// op:add-dayTimeDuration-to-date
/// Adds a dayTimeDuration to a date, returning a new date
pub fn date_add_duration(date: XsdDate, dur: XsdDayTimeDuration) -> XsdDate {
    let dur_micros = dur.to_signed_micros();
    // Convert microseconds to days (integer division)
    let dur_days: i32 = (dur_micros / (XSD_MICROS_PER_DAY as i64)) as i32;
    let new_days = date.epoch_days + dur_days;
    XsdDate::new_with_tz(new_days, date.tz_offset_minutes)
}

/// op:subtract-dayTimeDuration-from-date
/// Subtracts a dayTimeDuration from a date, returning a new date
pub fn date_subtract_duration(date: XsdDate, dur: XsdDayTimeDuration) -> XsdDate {
    let dur_micros = dur.to_signed_micros();
    // Convert microseconds to days (integer division)
    let dur_days: i32 = (dur_micros / (XSD_MICROS_PER_DAY as i64)) as i32;
    let new_days = date.epoch_days - dur_days;
    XsdDate::new_with_tz(new_days, date.tz_offset_minutes)
}

/// op:subtract-dates
/// Returns the dayTimeDuration between two dates (a - b)
pub fn subtract_dates(a: XsdDate, b: XsdDate) -> XsdDayTimeDuration {
    let day_diff = a.epoch_days - b.epoch_days;
    let micros: i64 = (day_diff as i64) * (XSD_MICROS_PER_DAY as i64);
    XsdDayTimeDuration::from_signed_micros(micros)
}

// ============================================================================
// Timezone Adjustment Functions
// ============================================================================

/// fn:adjust-date-to-timezone - Adjust a date to a different timezone
/// Since dates represent calendar dates (not instants), changing the timezone
/// may change the date by one day if the timezone offset crosses midnight.
pub fn adjust_date_to_timezone(date: XsdDate, new_tz_offset_minutes: i16) -> XsdDate {
    // For simplicity, we just update the timezone without adjusting the calendar date
    // This is a simplified implementation - full XPath semantics involve more complex rules
    XsdDate::new_with_tz(date.epoch_days, new_tz_offset_minutes)
}

/// fn:adjust-date-to-timezone with no argument - removes timezone
pub fn adjust_date_to_timezone_none(date: XsdDate) -> XsdDate {
    XsdDate::new(date.epoch_days)
}

// ============================================================================
// DateTime Construction from Date and Time
// ============================================================================

/// fn:dateTime - Construct a dateTime from a date and a time
/// XPath: fn:dateTime($date as xs:date, $time as xs:time) as xs:dateTime
/// Both must have the same timezone (or both have no timezone)
pub fn fn_dateTime(date: XsdDate, time: crate::types::XsdTime) -> crate::types::XsdDateTime {
    // Convert date to epoch microseconds (at midnight)
    let date_micros: i64 = (date.epoch_days as i64) * (XSD_MICROS_PER_DAY as i64);
    // Add time microseconds
    let total_micros: i64 = date_micros + time.microseconds_since_midnight as i64;
    // Convert to unsigned for Field
    let total_micros_u64: u64 = total_micros as u64;
    // Use the timezone from the date (or time if they match)
    crate::types::XsdDateTime::new_with_tz(total_micros_u64 as Field, date.tz_offset_minutes)
}
