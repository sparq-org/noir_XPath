//! YearMonthDuration functions for XPath/SPARQL
//!
//! Implements xsd:yearMonthDuration operations.
//! Duration values are stored as total months (signed integer).
//!
//! XPath operators implemented:
//! - op:add-yearMonthDurations, op:subtract-yearMonthDurations
//! - op:multiply-yearMonthDuration, op:divide-yearMonthDuration
//! - op:divide-yearMonthDuration-by-yearMonthDuration
//! - op:add-yearMonthDuration-to-dateTime, op:subtract-yearMonthDuration-from-dateTime
//! - op:add-yearMonthDuration-to-date, op:subtract-yearMonthDuration-from-date
//! - op:yearMonthDuration-equal, op:yearMonthDuration-less-than, op:yearMonthDuration-greater-than
//! XPath functions implemented:
//! - fn:years-from-duration, fn:months-from-duration (for yearMonthDuration)

use crate::types::{XsdDate, XsdDateTime};
use crate::date::{date_from_components_with_tz, year_from_date, month_from_date, day_from_date};
use crate::datetime::{datetime_from_components_with_tz, year_from_datetime, month_from_datetime, day_from_datetime, hours_from_datetime, minutes_from_datetime, seconds_from_datetime, microseconds_from_datetime};

// ============================================================================
// YearMonthDuration Type
// ============================================================================

/// XSD yearMonthDuration representation
/// Stores duration as total months (positive or negative)
pub struct XsdYearMonthDuration {
    /// Total months (can be negative)
    pub total_months: i32,
}

impl XsdYearMonthDuration {
    /// Create a new YearMonthDuration from total months
    pub fn new(total_months: i32) -> Self {
        XsdYearMonthDuration { total_months }
    }

    /// Create from years and months components
    pub fn from_components(negative: bool, years: u32, months: u32) -> Self {
        let total = (years as i32) * 12 + (months as i32);
        let signed_total = if negative { -total } else { total };
        XsdYearMonthDuration { total_months: signed_total }
    }

    /// Create a zero duration
    pub fn zero() -> Self {
        XsdYearMonthDuration { total_months: 0 }
    }

    /// Check if the duration is negative
    pub fn is_negative(self) -> bool {
        self.total_months < 0
    }

    /// Get absolute value of total months
    pub fn abs_months(self) -> u32 {
        if self.total_months < 0 {
            (-self.total_months) as u32
        } else {
            self.total_months as u32
        }
    }
}

impl Eq for XsdYearMonthDuration {
    fn eq(self, other: Self) -> bool {
        self.total_months == other.total_months
    }
}

// ============================================================================
// Component Extraction Functions
// ============================================================================

/// fn:years-from-duration (for yearMonthDuration)
/// Returns the years component (signed)
pub fn years_from_duration(dur: XsdYearMonthDuration) -> i32 {
    dur.total_months / 12
}

/// fn:months-from-duration (for yearMonthDuration)
/// Returns the months component (0-11, signed based on duration sign)
pub fn months_from_duration(dur: XsdYearMonthDuration) -> i32 {
    dur.total_months % 12
}

// ============================================================================
// YearMonthDuration Arithmetic
// ============================================================================

/// op:add-yearMonthDurations
/// Adds two yearMonthDurations
pub fn ym_duration_add(a: XsdYearMonthDuration, b: XsdYearMonthDuration) -> XsdYearMonthDuration {
    XsdYearMonthDuration::new(a.total_months + b.total_months)
}

/// op:subtract-yearMonthDurations
/// Subtracts second yearMonthDuration from first
pub fn ym_duration_subtract(a: XsdYearMonthDuration, b: XsdYearMonthDuration) -> XsdYearMonthDuration {
    XsdYearMonthDuration::new(a.total_months - b.total_months)
}

/// op:multiply-yearMonthDuration
/// Multiplies a yearMonthDuration by an integer
pub fn ym_duration_multiply(dur: XsdYearMonthDuration, factor: i32) -> XsdYearMonthDuration {
    XsdYearMonthDuration::new(dur.total_months * factor)
}

/// op:divide-yearMonthDuration
/// Divides a yearMonthDuration by an integer
pub fn ym_duration_divide(dur: XsdYearMonthDuration, divisor: i32) -> XsdYearMonthDuration {
    assert(divisor != 0, "Division by zero");
    XsdYearMonthDuration::new(dur.total_months / divisor)
}

/// op:divide-yearMonthDuration-by-yearMonthDuration
/// Divides two yearMonthDurations, returning a ratio
pub fn ym_duration_divide_by_duration(a: XsdYearMonthDuration, b: XsdYearMonthDuration) -> i32 {
    assert(b.total_months != 0, "Division by zero duration");
    a.total_months / b.total_months
}

/// Negates a yearMonthDuration
pub fn ym_duration_negate(dur: XsdYearMonthDuration) -> XsdYearMonthDuration {
    XsdYearMonthDuration::new(-dur.total_months)
}

// ============================================================================
// YearMonthDuration Comparison
// ============================================================================

/// op:yearMonthDuration-equal
pub fn ym_duration_equal(a: XsdYearMonthDuration, b: XsdYearMonthDuration) -> bool {
    a.total_months == b.total_months
}

/// op:yearMonthDuration-less-than
pub fn ym_duration_less_than(a: XsdYearMonthDuration, b: XsdYearMonthDuration) -> bool {
    a.total_months < b.total_months
}

/// op:yearMonthDuration-greater-than
pub fn ym_duration_greater_than(a: XsdYearMonthDuration, b: XsdYearMonthDuration) -> bool {
    a.total_months > b.total_months
}

/// op:yearMonthDuration-less-than-or-equal
pub fn ym_duration_le(a: XsdYearMonthDuration, b: XsdYearMonthDuration) -> bool {
    a.total_months <= b.total_months
}

/// op:yearMonthDuration-greater-than-or-equal
pub fn ym_duration_ge(a: XsdYearMonthDuration, b: XsdYearMonthDuration) -> bool {
    a.total_months >= b.total_months
}

// ============================================================================
// DateTime + YearMonthDuration Arithmetic
// ============================================================================

/// Helper: Get days in month for a given year and month (1-based)
fn days_in_month(year: i32, month: u8) -> u8 {
    // Determine if leap year
    let is_leap = ((year % 4 == 0) & (year % 100 != 0)) | (year % 400 == 0);

    if month == 2 {
        if is_leap { 29 } else { 28 }
    } else if (month == 4) | (month == 6) | (month == 9) | (month == 11) {
        30
    } else {
        31
    }
}

/// Helper: Clamp day to valid range for the month
fn clamp_day(year: i32, month: u8, day: u8) -> u8 {
    let max_day = days_in_month(year, month);
    if day > max_day { max_day } else { day }
}

/// op:add-yearMonthDuration-to-dateTime
/// Adds a yearMonthDuration to a dateTime
pub fn datetime_add_ym_duration(dt: XsdDateTime, dur: XsdYearMonthDuration) -> XsdDateTime {
    // Extract components
    let year = year_from_datetime(dt);
    let month = month_from_datetime(dt);
    let day = day_from_datetime(dt);
    let hours = hours_from_datetime(dt);
    let minutes = minutes_from_datetime(dt);
    let seconds = seconds_from_datetime(dt);
    let microseconds = microseconds_from_datetime(dt);
    let tz = dt.tz_offset_minutes; // Use raw field for tz offset

    // Calculate new year and month
    let total_months = (year as i32) * 12 + ((month as i32) - 1) + dur.total_months;

    // Handle negative month calculations
    let new_year: i32 = if total_months >= 0 {
        total_months / 12
    } else {
        // For negative, we need floor division
        (total_months - 11) / 12
    };

    let month_rem = total_months - (new_year * 12);
    let new_month = (month_rem + 1) as u8;

    // Clamp day to valid range for new month
    let new_day = clamp_day(new_year, new_month, day);

    datetime_from_components_with_tz(
        new_year,
        new_month,
        new_day,
        hours,
        minutes,
        seconds,
        microseconds,
        tz,
    )
}

/// op:subtract-yearMonthDuration-from-dateTime
/// Subtracts a yearMonthDuration from a dateTime
pub fn datetime_subtract_ym_duration(dt: XsdDateTime, dur: XsdYearMonthDuration) -> XsdDateTime {
    datetime_add_ym_duration(dt, ym_duration_negate(dur))
}

/// op:add-yearMonthDuration-to-date
/// Adds a yearMonthDuration to a date
pub fn date_add_ym_duration(d: XsdDate, dur: XsdYearMonthDuration) -> XsdDate {
    // Extract components
    let year = year_from_date(d);
    let month = month_from_date(d);
    let day = day_from_date(d);
    let tz = d.tz_offset_minutes; // Use raw field for tz offset

    // Calculate new year and month
    let total_months = (year as i32) * 12 + ((month as i32) - 1) + dur.total_months;

    // Handle negative month calculations
    let new_year: i32 = if total_months >= 0 {
        total_months / 12
    } else {
        // For negative, we need floor division
        (total_months - 11) / 12
    };

    let month_rem = total_months - (new_year * 12);
    let new_month = (month_rem + 1) as u8;

    // Clamp day to valid range for new month
    let new_day = clamp_day(new_year, new_month, day);

    date_from_components_with_tz(new_year, new_month, new_day, tz)
}

/// op:subtract-yearMonthDuration-from-date
/// Subtracts a yearMonthDuration from a date
pub fn date_subtract_ym_duration(d: XsdDate, dur: XsdYearMonthDuration) -> XsdDate {
    date_add_ym_duration(d, ym_duration_negate(dur))
}

// ============================================================================
// Tests
// ============================================================================

#[test]
fn test_ym_duration_creation() {
    // 2 years, 3 months = 27 months
    let dur = XsdYearMonthDuration::from_components(false, 2, 3);
    assert(dur.total_months == 27);

    // Negative: -1 year, 6 months = -18 months
    let dur_neg = XsdYearMonthDuration::from_components(true, 1, 6);
    assert(dur_neg.total_months == -18);
    assert(dur_neg.is_negative() == true);
}

#[test]
fn test_ym_duration_components() {
    // 27 months = 2 years, 3 months
    let dur = XsdYearMonthDuration::new(27);
    assert(years_from_duration(dur) == 2);
    assert(months_from_duration(dur) == 3);

    // -18 months = -1 year, -6 months
    let dur_neg = XsdYearMonthDuration::new(-18);
    assert(years_from_duration(dur_neg) == -1);
    assert(months_from_duration(dur_neg) == -6);
}

#[test]
fn test_ym_duration_arithmetic() {
    let d1 = XsdYearMonthDuration::from_components(false, 1, 0); // 12 months
    let d2 = XsdYearMonthDuration::from_components(false, 0, 6); // 6 months

    // Add: 12 + 6 = 18 months
    let sum = ym_duration_add(d1, d2);
    assert(sum.total_months == 18);

    // Subtract: 12 - 6 = 6 months
    let diff = ym_duration_subtract(d1, d2);
    assert(diff.total_months == 6);

    // Multiply: 6 * 3 = 18 months
    let product = ym_duration_multiply(d2, 3);
    assert(product.total_months == 18);

    // Divide: 12 / 4 = 3 months
    let quotient = ym_duration_divide(d1, 4);
    assert(quotient.total_months == 3);
}

#[test]
fn test_ym_duration_comparison() {
    let d1 = XsdYearMonthDuration::new(12);
    let d2 = XsdYearMonthDuration::new(18);
    let d3 = XsdYearMonthDuration::new(12);

    assert(ym_duration_equal(d1, d3) == true);
    assert(ym_duration_equal(d1, d2) == false);

    assert(ym_duration_less_than(d1, d2) == true);
    assert(ym_duration_less_than(d2, d1) == false);

    assert(ym_duration_greater_than(d2, d1) == true);
    assert(ym_duration_greater_than(d1, d2) == false);

    assert(ym_duration_le(d1, d2) == true);
    assert(ym_duration_le(d1, d3) == true);

    assert(ym_duration_ge(d2, d1) == true);
    assert(ym_duration_ge(d1, d3) == true);
}

#[test]
fn test_date_ym_duration_arithmetic() {
    // January 31, 2000
    let d = date_from_components_with_tz(2000, 1, 31, 0);

    // Add 1 month - should clamp to Feb 29 (2000 is leap year)
    let d_plus_1m = date_add_ym_duration(d, XsdYearMonthDuration::new(1));
    assert(year_from_date(d_plus_1m) == 2000);
    assert(month_from_date(d_plus_1m) == 2);
    assert(day_from_date(d_plus_1m) == 29);

    // Add 1 year - should stay Jan 31, 2001
    let d_plus_1y = date_add_ym_duration(d, XsdYearMonthDuration::new(12));
    assert(year_from_date(d_plus_1y) == 2001);
    assert(month_from_date(d_plus_1y) == 1);
    assert(day_from_date(d_plus_1y) == 31);

    // Subtract 13 months from Jan 31, 2000 -> Dec 31, 1998
    let d_minus = date_subtract_ym_duration(d, XsdYearMonthDuration::new(13));
    assert(year_from_date(d_minus) == 1998);
    assert(month_from_date(d_minus) == 12);
    assert(day_from_date(d_minus) == 31);
}
