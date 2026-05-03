"""Hand-written Python mirrors of `xpath::constants` (Noir).

This module is the Python-side single source of truth for the magic
numbers that XPath / XML Schema datatype arithmetic touches. Each
constant mirrors a `pub global` exported by the Noir library's
`xpath/src/constants.nr` so the test generator stops re-deriving the
same `86_400_000_000` / `60_000_000` / `9_223_372_036_854_775_808`
literals that already live in the library it targets.

Mirrors `noir_ieee754_inputs.constants` (introduced by noir_IEEE754
PR #38), with XSD-type-bounds + timezone-related constants standing
in for the IEEE 754 mask + min/max constants in that repo.

Once the workspace input-prep crate (`tools/noir-xpath-inputs-py/`,
phase 1 of `docs/xpath-input-prep-redesign.md`) lands, this module
will be auto-generated from `xpath/src/constants.nr` doc-comments
and imported here as a re-export. Until then, edits to either side
must be kept in sync by hand.
"""

from __future__ import annotations

# ============================================================================
# Microsecond scaling ladder (mirrors `pub global XSD_MICROS_PER_*` in
# xpath/src/constants.nr)
# ============================================================================

XSD_MICROS_PER_SECOND: int = 1_000_000
XSD_MICROS_PER_MINUTE: int = 60_000_000
XSD_MICROS_PER_HOUR: int = 3_600_000_000
XSD_MICROS_PER_DAY: int = 86_400_000_000

# ============================================================================
# Year/month conversion (W3C XML Schema Part 2 sec 3.2.6 yearMonthDuration)
# ============================================================================

XSD_MONTHS_PER_YEAR: int = 12

# ============================================================================
# Timezone offset bounds (W3C XML Schema Part 2 sec 3.2.7.3)
# ============================================================================

XSD_TZ_MIN_MINUTES: int = -840  # -14:00
XSD_TZ_MAX_MINUTES: int = 840  # +14:00

# ============================================================================
# Integer bounds (XPath F&O xs:integer is unbounded; Noir storage is i64)
# ============================================================================

XSD_INTEGER_I32_MIN: int = -2_147_483_648
XSD_INTEGER_I32_MAX: int = 2_147_483_647
XSD_INTEGER_I64_MIN: int = -9_223_372_036_854_775_808
XSD_INTEGER_I64_MAX: int = 9_223_372_036_854_775_807

# ============================================================================
# QName component buffer sizes
# ============================================================================

XSD_QNAME_MAX_NS_LEN: int = 256
XSD_QNAME_MAX_LOCAL_LEN: int = 128


# ============================================================================
# Helper functions (small, pure-stdlib) -- the Python mirrors of common
# packing operations the Noir library does internally. Calling these
# instead of inlining the arithmetic centralises the constant references.
# ============================================================================


def fits_in_i64(val: int) -> bool:
    """Whether ``val`` fits in Noir's signed 64-bit integer."""
    return XSD_INTEGER_I64_MIN <= val <= XSD_INTEGER_I64_MAX


def fits_in_i32(val: int) -> bool:
    """Whether ``val`` fits in Noir's signed 32-bit integer."""
    return XSD_INTEGER_I32_MIN <= val <= XSD_INTEGER_I32_MAX


def tz_offset_to_micros(tz_minutes: int) -> int:
    """Convert a timezone offset (in minutes) to microseconds."""
    return tz_minutes * XSD_MICROS_PER_MINUTE


def time_components_to_micros(
    hours: int, minutes: int, seconds: int, microseconds: int = 0
) -> int:
    """Convert (hours, minutes, seconds, microseconds) to microseconds
    since midnight, using the canonical XSD scaling ladder."""
    return (
        hours * XSD_MICROS_PER_HOUR
        + minutes * XSD_MICROS_PER_MINUTE
        + seconds * XSD_MICROS_PER_SECOND
        + microseconds
    )


def years_months_to_total_months(years: int, months: int) -> int:
    """Convert (years, months) to total months."""
    return years * XSD_MONTHS_PER_YEAR + months
