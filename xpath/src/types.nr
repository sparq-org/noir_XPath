//! Core type definitions for XPath datatypes
//!
//! Provides Noir representations of XML Schema datatypes used in SPARQL.

// Microsecond scaling ladder is sourced from `crate::constants` (single
// source of truth -- see `xpath/src/constants.nr`). Imported up here so
// every `impl` block below can reach the constants without having to
// re-declare the `use` line.
use crate::constants::{
    XSD_MICROS_PER_DAY, XSD_MICROS_PER_HOUR, XSD_MICROS_PER_MINUTE, XSD_MICROS_PER_SECOND,
};

/// DateTime representation with timezone support.
/// Stores microseconds since Unix epoch (1970-01-01T00:00:00Z) as UTC,
/// plus the original timezone offset for component extraction.
///
/// Using two Fields: one for UTC instant, one for timezone offset.
/// This allows comparison using UTC while extracting local components.
pub struct XsdDateTime {
    /// Microseconds since Unix epoch (UTC)
    pub epoch_microseconds: Field,
    /// Timezone offset in minutes from UTC (e.g., -300 for EST, 0 for UTC)
    /// Stored as signed value: positive = east of UTC, negative = west of UTC
    /// Range: `XSD_TZ_MIN_MINUTES` (-14:00) to `XSD_TZ_MAX_MINUTES` (+14:00).
    pub tz_offset_minutes: i16,
}

impl XsdDateTime {
    /// Create a new DateTime from epoch microseconds (assumes UTC)
    pub fn new(epoch_microseconds: Field) -> Self {
        XsdDateTime { epoch_microseconds, tz_offset_minutes: 0 }
    }

    /// Create a new DateTime with timezone offset
    /// epoch_microseconds: UTC instant
    /// tz_offset_minutes: timezone offset in minutes (e.g., -300 for -05:00)
    pub fn new_with_tz(epoch_microseconds: Field, tz_offset_minutes: i16) -> Self {
        XsdDateTime { epoch_microseconds, tz_offset_minutes }
    }

    /// Get the local microseconds (adjusted by timezone offset)
    pub fn local_microseconds(self) -> Field {
        let offset_micros: i64 = (self.tz_offset_minutes as i64) * (XSD_MICROS_PER_MINUTE as i64);
        let utc_micros: i64 = self.epoch_microseconds as i64;
        let local: i64 = utc_micros + offset_micros;
        // Safe cast: we ensure the result is non-negative in valid use cases
        let local_u64: u64 = local as u64;
        local_u64 as Field
    }

    // ---- Comparison ---------------------------------------------------------
    //
    // The epoch_microseconds field is a Field; before the typed-compare
    // optimisation a naive `<` on Field cost ~270 UltraHonk gates per
    // call, while casting to u64 first lands in the cheap plookup path
    // at ~95 gates. All four ordering methods cast once, then compare.

    /// op:dateTime-less-than -- UTC ordering.
    pub fn lt(self, other: Self) -> bool {
        let a: u64 = self.epoch_microseconds as u64;
        let b: u64 = other.epoch_microseconds as u64;
        a < b
    }

    /// op:dateTime-less-than-or-equal -- UTC ordering.
    pub fn le(self, other: Self) -> bool {
        let a: u64 = self.epoch_microseconds as u64;
        let b: u64 = other.epoch_microseconds as u64;
        a <= b
    }

    /// op:dateTime-greater-than -- UTC ordering.
    pub fn gt(self, other: Self) -> bool {
        let a: u64 = self.epoch_microseconds as u64;
        let b: u64 = other.epoch_microseconds as u64;
        a > b
    }

    /// op:dateTime-greater-than-or-equal -- UTC ordering.
    pub fn ge(self, other: Self) -> bool {
        let a: u64 = self.epoch_microseconds as u64;
        let b: u64 = other.epoch_microseconds as u64;
        a >= b
    }

    // ---- Duration arithmetic -----------------------------------------------

    /// op:add-dayTimeDuration-to-dateTime. The result must be a
    /// non-negative microsecond count from the Unix epoch; an underflow
    /// panics.
    pub fn add_day_time_duration(self, dur: XsdDayTimeDuration) -> Self {
        let dt_micros: i64 = self.epoch_microseconds as i64;
        let result = dt_micros + dur.to_signed_micros();
        assert(result >= 0, "DateTime cannot be negative");
        let result_u64: u64 = result as u64;
        XsdDateTime::new(result_u64 as Field)
    }

    /// op:subtract-dayTimeDuration-from-dateTime.
    pub fn subtract_day_time_duration(self, dur: XsdDayTimeDuration) -> Self {
        let dt_micros: i64 = self.epoch_microseconds as i64;
        let result = dt_micros - dur.to_signed_micros();
        assert(result >= 0, "DateTime cannot be negative");
        let result_u64: u64 = result as u64;
        XsdDateTime::new(result_u64 as Field)
    }

    /// op:subtract-dateTimes -- the duration `self - other`.
    pub fn difference(self, other: Self) -> XsdDayTimeDuration {
        let a_micros: i64 = self.epoch_microseconds as i64;
        let b_micros: i64 = other.epoch_microseconds as i64;
        XsdDayTimeDuration::from_signed_micros(a_micros - b_micros)
    }
}

impl Eq for XsdDateTime {
    fn eq(self, other: Self) -> bool {
        self.epoch_microseconds == other.epoch_microseconds
    }
}

/// Duration representation for timezone offsets and intervals.
///
/// Stores a single authoritative signed microsecond count (`i64`). All
/// other accessors -- absolute components (`days` / `hours` / `minutes` /
/// `seconds` / `microseconds`), sign (`is_negative`), arithmetic and
/// comparison -- are derived from it. Modelled on the IEEE 754 `Float<>`
/// pattern in `noir_IEEE754`: one canonical encoding, every observable
/// property as a method.
pub struct XsdDayTimeDuration {
    /// Total microseconds (signed; negative values encode negative durations).
    pub signed_micros: i64,
}

impl XsdDayTimeDuration {
    /// Create from signed microseconds (i64). This is the canonical
    /// constructor; `new` / `from_components` are thin shims.
    pub fn from_signed_micros(micros: i64) -> Self {
        XsdDayTimeDuration { signed_micros: micros }
    }

    /// Create a duration from an unsigned magnitude and a negative flag.
    /// Kept for back-compat with call-sites that have a `(abs, neg)` split
    /// from a parser; new code should prefer `from_signed_micros`.
    pub fn new(microseconds: Field, negative: bool) -> Self {
        let abs: i64 = microseconds as i64;
        let signed: i64 = if negative { -abs } else { abs };
        XsdDayTimeDuration { signed_micros: signed }
    }

    /// Create from `(negative, days, hours, minutes, seconds, microseconds)`.
    /// Inputs are normalised so e.g. `seconds=90` becomes `1 min 30 s`.
    pub fn from_components(
        negative: bool,
        days: u32,
        hours: u32,
        minutes: u32,
        seconds: u32,
        microseconds: u32,
    ) -> Self {
        let total: i64 = (days as i64) * (XSD_MICROS_PER_DAY as i64)
            + (hours as i64) * (XSD_MICROS_PER_HOUR as i64)
            + (minutes as i64) * (XSD_MICROS_PER_MINUTE as i64)
            + (seconds as i64) * (XSD_MICROS_PER_SECOND as i64)
            + microseconds as i64;
        let signed: i64 = if negative { -total } else { total };
        XsdDayTimeDuration { signed_micros: signed }
    }

    /// Create a zero duration.
    pub fn zero() -> Self {
        XsdDayTimeDuration { signed_micros: 0 }
    }

    /// Authoritative getter -- the value stored in the struct.
    pub fn to_signed_micros(self) -> i64 {
        self.signed_micros
    }

    // ---- Derived accessors --------------------------------------------------

    /// `true` iff the duration is strictly negative.
    pub fn is_negative(self) -> bool {
        self.signed_micros < 0
    }

    /// Absolute value as unsigned microseconds. Used internally by every
    /// component accessor; pulled out so the abs-value step is computed
    /// once per call instead of four times.
    fn abs_micros(self) -> i64 {
        if self.signed_micros < 0 {
            -self.signed_micros
        } else {
            self.signed_micros
        }
    }

    /// Days component (absolute value), e.g. for `fn:days-from-duration`.
    pub fn days(self) -> u32 {
        (self.abs_micros() / (XSD_MICROS_PER_DAY as i64)) as u32
    }

    /// Hours component within the day (0-23, absolute value).
    pub fn hours(self) -> u8 {
        let day_remainder = self.abs_micros() % (XSD_MICROS_PER_DAY as i64);
        (day_remainder / (XSD_MICROS_PER_HOUR as i64)) as u8
    }

    /// Minutes component within the hour (0-59, absolute value).
    pub fn minutes(self) -> u8 {
        let hour_remainder = self.abs_micros() % (XSD_MICROS_PER_HOUR as i64);
        (hour_remainder / (XSD_MICROS_PER_MINUTE as i64)) as u8
    }

    /// Seconds component within the minute (0-59, absolute value).
    pub fn seconds(self) -> u8 {
        let minute_remainder = self.abs_micros() % (XSD_MICROS_PER_MINUTE as i64);
        (minute_remainder / (XSD_MICROS_PER_SECOND as i64)) as u8
    }

    /// Microseconds component within the second (0-999999, absolute value).
    pub fn microseconds(self) -> u32 {
        (self.abs_micros() % (XSD_MICROS_PER_SECOND as i64)) as u32
    }

    // ---- Derived arithmetic -------------------------------------------------

    /// Negation -- flips the sign.
    pub fn negate(self) -> Self {
        XsdDayTimeDuration { signed_micros: -self.signed_micros }
    }

    /// op:add-dayTimeDurations.
    pub fn add(self, other: Self) -> Self {
        XsdDayTimeDuration { signed_micros: self.signed_micros + other.signed_micros }
    }

    /// op:subtract-dayTimeDurations.
    pub fn subtract(self, other: Self) -> Self {
        XsdDayTimeDuration { signed_micros: self.signed_micros - other.signed_micros }
    }

    /// op:multiply-dayTimeDuration by an integer scalar.
    pub fn multiply(self, factor: i64) -> Self {
        XsdDayTimeDuration { signed_micros: self.signed_micros * factor }
    }

    /// op:divide-dayTimeDuration by an integer scalar.
    /// Caller is responsible for checking `divisor != 0`.
    pub fn divide(self, divisor: i64) -> Self {
        XsdDayTimeDuration { signed_micros: self.signed_micros / divisor }
    }

    // ---- Ordering -----------------------------------------------------------
    //
    // IEEE 754-style: expose `lt` / `le` / `gt` / `ge` as inherent methods
    // rather than an `Ord` impl. Same reason as `Float::flt` -- keeps the
    // surface mirror-image with `noir_IEEE754` and avoids having to commit
    // to a total-order semantics if a future variant ever encodes
    // unrepresentable durations. Each compare lowers to a single i64
    // typed compare (cheap on UltraHonk; ~175 gates beneath `Field::lt`).

    /// op:dayTimeDuration-less-than.
    pub fn lt(self, other: Self) -> bool {
        self.signed_micros < other.signed_micros
    }

    /// op:dayTimeDuration-less-than-or-equal.
    pub fn le(self, other: Self) -> bool {
        self.signed_micros <= other.signed_micros
    }

    /// op:dayTimeDuration-greater-than.
    pub fn gt(self, other: Self) -> bool {
        self.signed_micros > other.signed_micros
    }

    /// op:dayTimeDuration-greater-than-or-equal.
    pub fn ge(self, other: Self) -> bool {
        self.signed_micros >= other.signed_micros
    }

    /// op:divide-dayTimeDuration-by-dayTimeDuration -- integer ratio of
    /// signed-micro counts. Caller must check `other` is non-zero.
    pub fn divide_by(self, other: Self) -> i64 {
        self.signed_micros / other.signed_micros
    }
}

impl Eq for XsdDayTimeDuration {
    fn eq(self, other: Self) -> bool {
        self.signed_micros == other.signed_micros
    }
}

/// Date representation with timezone support.
/// Stores days since Unix epoch (1970-01-01) as an integer,
/// plus the original timezone offset for correct component extraction.
pub struct XsdDate {
    /// Days since Unix epoch (1970-01-01), can be negative for dates before 1970
    pub epoch_days: i32,
    /// Timezone offset in minutes from UTC (e.g., -300 for EST, 0 for UTC)
    /// Range: `XSD_TZ_MIN_MINUTES` (-14:00) to `XSD_TZ_MAX_MINUTES` (+14:00).
    pub tz_offset_minutes: i16,
}

impl XsdDate {
    /// Create a new Date from epoch days (assumes UTC)
    pub fn new(epoch_days: i32) -> Self {
        XsdDate { epoch_days, tz_offset_minutes: 0 }
    }

    /// Create a new Date with timezone offset
    pub fn new_with_tz(epoch_days: i32, tz_offset_minutes: i16) -> Self {
        XsdDate { epoch_days, tz_offset_minutes }
    }

    // ---- Comparison ---------------------------------------------------------
    //
    // `epoch_days` is i32 -- typed compares are already cheap. The
    // method-form mirrors the rest of the temporal types for caller
    // ergonomics. Order is on calendar date (epoch days), not instant,
    // matching the XPath spec.

    /// op:date-less-than.
    pub fn lt(self, other: Self) -> bool {
        self.epoch_days < other.epoch_days
    }

    /// op:date-less-than-or-equal.
    pub fn le(self, other: Self) -> bool {
        self.epoch_days <= other.epoch_days
    }

    /// op:date-greater-than.
    pub fn gt(self, other: Self) -> bool {
        self.epoch_days > other.epoch_days
    }

    /// op:date-greater-than-or-equal.
    pub fn ge(self, other: Self) -> bool {
        self.epoch_days >= other.epoch_days
    }
}

impl Eq for XsdDate {
    fn eq(self, other: Self) -> bool {
        // Compare epoch_days directly, which compares calendar dates (not instants in time).
        // This follows XPath date semantics: dates with the same year/month/day are equal
        // regardless of timezone. For example, 2000-01-01+05:00 equals 2000-01-01-10:00
        // because they represent the same calendar date in different timezones.
        // Note: timezone offset is intentionally not compared here.
        self.epoch_days == other.epoch_days
    }
}

/// Time representation with timezone support.
/// Stores microseconds since midnight plus timezone offset.
pub struct XsdTime {
    /// Microseconds since midnight (0 to 86,399,999,999)
    pub microseconds_since_midnight: u64,
    /// Timezone offset in minutes from UTC
    /// Range: `XSD_TZ_MIN_MINUTES` (-14:00) to `XSD_TZ_MAX_MINUTES` (+14:00).
    pub tz_offset_minutes: i16,
}

impl XsdTime {
    /// Create a new Time from microseconds since midnight (assumes UTC)
    pub fn new(microseconds_since_midnight: u64) -> Self {
        XsdTime { microseconds_since_midnight, tz_offset_minutes: 0 }
    }

    /// Create a new Time with timezone offset
    pub fn new_with_tz(microseconds_since_midnight: u64, tz_offset_minutes: i16) -> Self {
        XsdTime { microseconds_since_midnight, tz_offset_minutes }
    }

    /// Create a Time from components
    pub fn from_components(hours: u8, minutes: u8, seconds: u8, microseconds: u32) -> Self {
        let micros = (hours as u64) * XSD_MICROS_PER_HOUR
            + (minutes as u64) * XSD_MICROS_PER_MINUTE
            + (seconds as u64) * XSD_MICROS_PER_SECOND
            + microseconds as u64;
        XsdTime::new(micros)
    }

    /// Create a Time from components with timezone
    pub fn from_components_with_tz(
        hours: u8,
        minutes: u8,
        seconds: u8,
        microseconds: u32,
        tz_offset_minutes: i16,
    ) -> Self {
        let micros = (hours as u64) * XSD_MICROS_PER_HOUR
            + (minutes as u64) * XSD_MICROS_PER_MINUTE
            + (seconds as u64) * XSD_MICROS_PER_SECOND
            + microseconds as u64;
        XsdTime::new_with_tz(micros, tz_offset_minutes)
    }

    /// Get UTC microseconds (for comparison)
    /// Normalizes to UTC by subtracting the timezone offset
    pub fn utc_microseconds(self) -> i64 {
        let local_micros = self.microseconds_since_midnight as i64;
        let offset_micros = (self.tz_offset_minutes as i64) * (XSD_MICROS_PER_MINUTE as i64);
        local_micros - offset_micros
    }

    // ---- Comparison ---------------------------------------------------------
    //
    // Compares as UTC microseconds (i64) so timezone offsets order
    // correctly. Typed i64 compares lower cheaply.

    /// op:time-less-than -- UTC ordering.
    pub fn lt(self, other: Self) -> bool {
        self.utc_microseconds() < other.utc_microseconds()
    }

    /// op:time-less-than-or-equal -- UTC ordering.
    pub fn le(self, other: Self) -> bool {
        self.utc_microseconds() <= other.utc_microseconds()
    }

    /// op:time-greater-than -- UTC ordering.
    pub fn gt(self, other: Self) -> bool {
        self.utc_microseconds() > other.utc_microseconds()
    }

    /// op:time-greater-than-or-equal -- UTC ordering.
    pub fn ge(self, other: Self) -> bool {
        self.utc_microseconds() >= other.utc_microseconds()
    }
}

impl Eq for XsdTime {
    fn eq(self, other: Self) -> bool {
        // Compare in UTC for correct equality
        self.utc_microseconds() == other.utc_microseconds()
    }
}
