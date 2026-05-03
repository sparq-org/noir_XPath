//! XPath / XML Schema datatype constants.
//!
//! Single source of truth for the magic numbers that appear in XPath
//! datatype arithmetic, timezone validation, integer-bound checks and
//! QName buffer sizing. Per the noir_XPath input-prep redesign (sec 3),
//! these were previously duplicated across `duration.nr`, `datetime.nr`,
//! `time.nr`, `types.nr` and `qname.nr`; this module is the canonical
//! home so the test generator (and any future codegen) can mirror the
//! exact same names without re-deriving them.
//!
//! Conventions:
//! - `XSD_MICROS_PER_*` -- microsecond scaling ladder shared by
//!   `xs:dateTime`, `xs:date`, `xs:time` and `xs:dayTimeDuration`.
//! - `XSD_MONTHS_PER_YEAR` -- conversion factor used by
//!   `xs:yearMonthDuration` (W3C XML Schema Part 2, sec 3.2.6).
//! - `XSD_TZ_*_MINUTES` -- canonical timezone offset bounds (W3C XML
//!   Schema Part 2, sec 3.2.7.3: -14:00 to +14:00).
//! - `XSD_INTEGER_I{32,64}_{MIN,MAX}` -- integer bounds for the i32
//!   and i64 storage backings the test generator emits. XPath F&O
//!   `xs:integer` is unbounded, but Noir storage is i64 and
//!   `xs:yearMonthDuration::total_months` is i32.
//! - `XSD_QNAME_MAX_*_LEN` -- byte-buffer sizes for QName components.

// ============================================================================
// Microsecond scaling ladder (u64; cast to i64 at call sites in duration.nr)
// ============================================================================

/// Microseconds in one SI second.
pub global XSD_MICROS_PER_SECOND: u64 = 1_000_000;

/// Microseconds in one minute (60 seconds).
pub global XSD_MICROS_PER_MINUTE: u64 = 60_000_000;

/// Microseconds in one hour (60 minutes).
pub global XSD_MICROS_PER_HOUR: u64 = 3_600_000_000;

/// Microseconds in one day (24 hours).
pub global XSD_MICROS_PER_DAY: u64 = 86_400_000_000;

// ============================================================================
// Year/month conversion (W3C XML Schema Part 2 sec 3.2.6 yearMonthDuration)
// ============================================================================

/// Months in one Gregorian year (used by xs:yearMonthDuration).
pub global XSD_MONTHS_PER_YEAR: u32 = 12;

// ============================================================================
// Timezone offset bounds (W3C XML Schema Part 2 sec 3.2.7.3)
// ============================================================================

/// Minimum legal timezone offset for XML Schema dateTime / date / time
/// values (-14:00).
pub global XSD_TZ_MIN_MINUTES: i16 = -840;

/// Maximum legal timezone offset for XML Schema dateTime / date / time
/// values (+14:00).
pub global XSD_TZ_MAX_MINUTES: i16 = 840;

// ============================================================================
// Integer bounds (XPath F&O xs:integer is unbounded; Noir storage is i64)
// ============================================================================

/// Minimum value representable by Noir's signed 32-bit integer (used by
/// xs:yearMonthDuration::total_months).
pub global XSD_INTEGER_I32_MIN: i32 = -2_147_483_648;

/// Maximum value representable by Noir's signed 32-bit integer.
pub global XSD_INTEGER_I32_MAX: i32 = 2_147_483_647;

/// Minimum value representable by Noir's signed 64-bit integer (used as
/// the storage cap on xs:integer / xs:dayTimeDuration microseconds).
pub global XSD_INTEGER_I64_MIN: i64 = -9_223_372_036_854_775_808;

/// Maximum value representable by Noir's signed 64-bit integer.
pub global XSD_INTEGER_I64_MAX: i64 = 9_223_372_036_854_775_807;

// ============================================================================
// QName component buffer sizes
// ============================================================================

/// Maximum namespace URI length, in bytes, supported by the QName type.
pub global XSD_QNAME_MAX_NS_LEN: u32 = 256;

/// Maximum local-name length, in bytes, supported by the QName type.
pub global XSD_QNAME_MAX_LOCAL_LEN: u32 = 128;
