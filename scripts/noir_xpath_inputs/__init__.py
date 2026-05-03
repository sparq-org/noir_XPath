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
    "clone_or_update_qt3tests",
    "discover_all_test_files",
    "discover_available_functions",
    "parse_test_file",
]
