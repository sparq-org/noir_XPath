"""Helpers for translating XPath qt3tests vectors into noir_XPath inputs.

This package factors out the file-format and bit-pattern logic that
previously lived inline in ``scripts/generate_tests.py`` so that the
generator stays focused on Noir-test emission. Mirrors the
``noir_ieee754_inputs`` package introduced in noir_IEEE754 PR #38.

The submodule layout is:

- :mod:`qt3tests` -- W3C qt3tests catalogue / test-set XML parser
  (``parse_test_file``, ``discover_all_test_files``,
  ``clone_or_update_qt3tests``, plus the ``TestCase`` dataclass and
  the ``QT3_NS`` namespace constant).
"""

from .constants import (
    XSD_INTEGER_I32_MAX,
    XSD_INTEGER_I32_MIN,
    XSD_INTEGER_I64_MAX,
    XSD_INTEGER_I64_MIN,
    XSD_MICROS_PER_DAY,
    XSD_MICROS_PER_HOUR,
    XSD_MICROS_PER_MINUTE,
    XSD_MICROS_PER_SECOND,
    XSD_MONTHS_PER_YEAR,
    XSD_QNAME_MAX_LOCAL_LEN,
    XSD_QNAME_MAX_NS_LEN,
    XSD_TZ_MAX_MINUTES,
    XSD_TZ_MIN_MINUTES,
    fits_in_i32,
    fits_in_i64,
    time_components_to_micros,
    tz_offset_to_micros,
    years_months_to_total_months,
)
from .qt3tests import (
    QT3_NS,
    TestCase,
    clone_or_update_qt3tests,
    discover_all_test_files,
    discover_available_functions,
    parse_test_file,
)

__all__ = [
    "QT3_NS",
    "TestCase",
    "XSD_INTEGER_I32_MAX",
    "XSD_INTEGER_I32_MIN",
    "XSD_INTEGER_I64_MAX",
    "XSD_INTEGER_I64_MIN",
    "XSD_MICROS_PER_DAY",
    "XSD_MICROS_PER_HOUR",
    "XSD_MICROS_PER_MINUTE",
    "XSD_MICROS_PER_SECOND",
    "XSD_MONTHS_PER_YEAR",
    "XSD_QNAME_MAX_LOCAL_LEN",
    "XSD_QNAME_MAX_NS_LEN",
    "XSD_TZ_MAX_MINUTES",
    "XSD_TZ_MIN_MINUTES",
    "clone_or_update_qt3tests",
    "discover_all_test_files",
    "discover_available_functions",
    "fits_in_i32",
    "fits_in_i64",
    "parse_test_file",
    "time_components_to_micros",
    "tz_offset_to_micros",
    "years_months_to_total_months",
]
