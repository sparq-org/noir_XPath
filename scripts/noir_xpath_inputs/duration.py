"""Independent-extraction routes for xs:dayTimeDuration / xs:yearMonthDuration.

Per Concern 4 of `docs/xpath-input-prep-redesign.md` (sec 5), the test
generator's hand-rolled regex parsers for ISO 8601 durations are
shared-bug-invisible: if both the Noir library and the Python test
vectors derive their micro-second / total-month encoding from the
same regex ladder, a parser bug would not be caught.

This module routes parsing through ``elementpath.datatypes`` -- which
``noir_XPath`` already depends on transitively -- so the test
generator's reference path runs through CPython + an unrelated XPath
library rather than through code that resembles the Noir library
under test.

Mirrors the noir_IEEE754 PR #38 phase-2c pattern (commit 2d957fe:
``refactor(tests): independent bit extraction via float.fromhex +
struct``) where bit extraction was rerouted through ``float.fromhex``
+ ``struct.pack`` instead of a hand-rolled significand ladder.
"""

from __future__ import annotations

import re
from decimal import Decimal
from typing import Optional

from elementpath.datatypes import DayTimeDuration, YearMonthDuration

from .constants import XSD_MICROS_PER_SECOND, fits_in_i32, fits_in_i64

# Strip an optional ``xs:dayTimeDuration("...")`` / ``xs:yearMonthDuration("...")``
# wrapper before handing the literal to elementpath.
_DAYTIME_WRAPPER_RE = re.compile(r"xs:dayTimeDuration\s*\(['\"]([^'\"]+)['\"]\)")
_YEARMONTH_WRAPPER_RE = re.compile(r"xs:yearMonthDuration\s*\(['\"]([^'\"]+)['\"]\)")


def _strip_wrapper(value: str, pattern: re.Pattern[str]) -> str:
    """Strip an optional XPath constructor wrapper from a literal."""
    match = pattern.match(value.strip())
    if match is not None:
        return match.group(1)
    return value.strip()


def parse_day_time_duration_micros(value: str) -> Optional[int]:
    """Parse an XPath ``xs:dayTimeDuration`` literal into signed
    microseconds, via ``elementpath.datatypes.DayTimeDuration``.

    ``elementpath`` ships its own ISO 8601 duration validator; on a
    parse error we return ``None`` to match the historical regex
    parser's contract.

    Returns ``None`` for empty input, an unparseable literal, or a
    duration whose microsecond representation overflows i64 (the
    caller decides whether to skip the test).
    """
    if value is None:
        return None
    raw = _strip_wrapper(value, _DAYTIME_WRAPPER_RE)
    if not raw:
        return None
    try:
        dur = DayTimeDuration.fromstring(raw)
    except (ValueError, TypeError, OverflowError):
        return None

    # ``DayTimeDuration.seconds`` is a Decimal -- exact for the lexical
    # forms qt3tests uses (no float-rounding loss). Multiplying by
    # XSD_MICROS_PER_SECOND keeps the conversion in Decimal arithmetic.
    seconds: Decimal = dur.seconds
    total_micros = int(seconds * Decimal(XSD_MICROS_PER_SECOND))
    # Match ``parse_year_month_duration_months`` -- the Noir storage is
    # i64, and downstream emitters can't represent values outside that
    # range; return ``None`` so the caller skips the test rather than
    # carry an arbitrary-precision Python int through to a packing site.
    if not fits_in_i64(total_micros):
        return None
    return total_micros


def parse_year_month_duration_months(value: str) -> Optional[int]:
    """Parse an XPath ``xs:yearMonthDuration`` literal into signed
    total months (i32), via ``elementpath.datatypes.YearMonthDuration``.

    Returns ``None`` for empty input, unparseable literals, or values
    whose total-month count exceeds i32.
    """
    if value is None:
        return None
    raw = _strip_wrapper(value, _YEARMONTH_WRAPPER_RE)
    if not raw:
        return None
    try:
        dur = YearMonthDuration.fromstring(raw)
    except (ValueError, TypeError, OverflowError):
        return None
    months: int = int(dur.months)
    if not fits_in_i32(months):
        return None
    return months
