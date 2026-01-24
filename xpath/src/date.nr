//! Date functions for XPath/SPARQL
//!
//! Implements xs:date operations.
//! Date values are stored as days since Unix epoch (1970-01-01) plus timezone offset.
//!
//! XPath functions implemented:
//! - fn:year-from-date, fn:month-from-date, fn:day-from-date
//! - fn:timezone-from-date
//! - op:date-equal, op:date-less-than, op:date-greater-than

use crate::types::{XsdDate, XsdDayTimeDuration};

// ============================================================================
// Date Construction Functions
// ============================================================================

/// Create a date from year, month, day components (UTC)
pub fn date_from_components(year: i32, month: u8, day: u8) -> XsdDate {
    let epoch_days = ymd_to_epoch_days(year, month, day);
    XsdDate::new(epoch_days)
}

/// Create a date from year, month, day components with timezone
///
/// Note: This function stores the date as the local calendar date (not adjusted for timezone).
/// The epoch_days represents the date in the local timezone, not normalized to UTC.
/// This design choice means dates with different timezones but the same local calendar date
/// will have the same epoch_days value. For XPath date semantics, this is intentional as
/// dates represent calendar dates, not instants in time.
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
    let offset_micros: i64 = (date.tz_offset_minutes as i64) * 60_000_000; // 60 * 1_000_000
    XsdDayTimeDuration::from_signed_micros(offset_micros)
}

// ============================================================================
// Date Comparison Functions
// ============================================================================

/// Compare two dates for equality
///
/// This compares the epoch_days directly, which means dates are equal if they have
/// the same calendar date representation (same year/month/day), regardless of timezone.
/// This follows XPath date semantics where dates represent calendar dates, not instants.
pub fn date_equal(a: XsdDate, b: XsdDate) -> bool {
    a.epoch_days == b.epoch_days
}

/// Check if first date is less than second
pub fn date_less_than(a: XsdDate, b: XsdDate) -> bool {
    a.epoch_days < b.epoch_days
}

/// Check if first date is greater than second
pub fn date_greater_than(a: XsdDate, b: XsdDate) -> bool {
    a.epoch_days > b.epoch_days
}

/// Check if first date is less than or equal to second
pub fn date_le(a: XsdDate, b: XsdDate) -> bool {
    a.epoch_days <= b.epoch_days
}

/// Check if first date is greater than or equal to second
pub fn date_ge(a: XsdDate, b: XsdDate) -> bool {
    a.epoch_days >= b.epoch_days
}

// ============================================================================
// Helper Functions for Date Conversion
// ============================================================================

/// Convert year, month, day to days since Unix epoch (1970-01-01)
/// Uses Gregorian calendar and accounts for leap years
fn ymd_to_epoch_days(year: i32, month: u8, day: u8) -> i32 {
    // Days before each month (non-leap year)
    let days_before_month = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];

    // Calculate days from year 1970 to the target year
    let mut days: i32 = 0;

    // Count full years
    let years_diff = year - 1970;
    days = years_diff * 365;

    // Add leap days
    // Leap years: divisible by 4, except centuries (unless divisible by 400)
    if year > 1970 {
        // Count leap days from 1970 to year (exclusive)
        let leap_count = count_leap_years(1970, year - 1);
        days = days + leap_count;
    } else if year < 1970 {
        // Count leap days from year to 1969 (inclusive) and subtract
        let leap_count = count_leap_years(year, 1969);
        days = days - leap_count;
    }

    // Add days for months in current year
    let month_idx = (month - 1) as u32;
    days = days + days_before_month[month_idx];

    // Add leap day if current year is leap year and month > February
    if is_leap_year(year) & (month > 2) {
        days = days + 1;
    }

    // Add days of current month
    days = days + day as i32 - 1; // -1 because day 1 is the start

    days
}

/// Convert days since Unix epoch to year, month, day
fn epoch_days_to_ymd(epoch_days: i32) -> (i32, u8, u8) {
    // Start from 1970-01-01
    let mut year: i32 = 1970;
    let mut remaining_days = epoch_days;
    let mut done = false;

    // Adjust year - use bounded loop (max 10000 years = ~3.65M days)
    if remaining_days >= 0 {
        // Forward from 1970 - max 10000 years
        for _i in 0..10000 {
            if !done {
                let days_in_year = if is_leap_year(year) { 366 } else { 365 };
                if remaining_days < days_in_year {
                    done = true;
                } else {
                    remaining_days = remaining_days - days_in_year;
                    year = year + 1;
                }
            }
        }
    } else {
        // Backward from 1970 - max 10000 years
        for _i in 0..10000 {
            if !done {
                if remaining_days >= 0 {
                    done = true;
                } else {
                    year = year - 1;
                    let days_in_year = if is_leap_year(year) { 366 } else { 365 };
                    remaining_days = remaining_days + days_in_year;
                }
            }
        }
    }

    // After the loop, remaining_days should be 0 to 365 (or 366 for leap year)
    // if the bounded loop found the correct year. If the loop exhausted all iterations
    // without converging, remaining_days may be outside this range.
    // Find month and day
    let is_leap = is_leap_year(year);
    let days_in_months = if is_leap {
        [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    } else {
        [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    };

    let mut month: u8 = 12; // Default to December
    let mut day_count = remaining_days;
    let mut found = false;

    for i in 0..12 {
        if !found {
            let days_in_month = days_in_months[i];
            if day_count < days_in_month {
                month = (i + 1) as u8;
                found = true;
            } else {
                day_count = day_count - days_in_month;
            }
        }
    }

    let day = (day_count + 1) as u8; // +1 because days are 1-indexed

    (year, month, day)
}

/// Check if a year is a leap year
fn is_leap_year(year: i32) -> bool {
    // Leap year if divisible by 4, except centuries (unless divisible by 400)
    let div4 = year % 4 == 0;
    let div100 = year % 100 == 0;
    let div400 = year % 400 == 0;

    div4 & (!div100 | div400)
}

/// Count leap years in range [start_year, end_year] inclusive
fn count_leap_years(start_year: i32, end_year: i32) -> i32 {
    let mut count: i32 = 0;

    // Handle invalid range where start > end by using conditional logic
    let valid_range = start_year <= end_year;

    if valid_range {
        // Use bounded loop - max 10000 years
        let range = end_year - start_year + 1;
        let max_iterations = if range > 10000 { 10000 } else { range };

        for i in 0..max_iterations {
            let y = start_year + i;
            if y <= end_year {
                if is_leap_year(y) {
                    count = count + 1;
                }
            }
        }
    }

    count
}

// ============================================================================
// Date + Duration Arithmetic
// ============================================================================

/// op:add-dayTimeDuration-to-date
/// Adds a dayTimeDuration to a date, returning a new date
pub fn date_add_duration(date: XsdDate, dur: XsdDayTimeDuration) -> XsdDate {
    let dur_micros = dur.to_signed_micros();
    // Convert microseconds to days (integer division)
    let dur_days: i32 = (dur_micros / 86_400_000_000) as i32;
    let new_days = date.epoch_days + dur_days;
    XsdDate::new_with_tz(new_days, date.tz_offset_minutes)
}

/// op:subtract-dayTimeDuration-from-date
/// Subtracts a dayTimeDuration from a date, returning a new date
pub fn date_subtract_duration(date: XsdDate, dur: XsdDayTimeDuration) -> XsdDate {
    let dur_micros = dur.to_signed_micros();
    // Convert microseconds to days (integer division)
    let dur_days: i32 = (dur_micros / 86_400_000_000) as i32;
    let new_days = date.epoch_days - dur_days;
    XsdDate::new_with_tz(new_days, date.tz_offset_minutes)
}

/// op:subtract-dates
/// Returns the dayTimeDuration between two dates (a - b)
pub fn subtract_dates(a: XsdDate, b: XsdDate) -> XsdDayTimeDuration {
    let day_diff = a.epoch_days - b.epoch_days;
    let micros: i64 = (day_diff as i64) * 86_400_000_000;
    XsdDayTimeDuration::from_signed_micros(micros)
}
