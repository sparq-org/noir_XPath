#!/usr/bin/env python3
"""
Generate Noir test code from W3C qt3tests test suite.

This script parses the qt3tests XML test files and generates Noir test packages
for the XPath functions implemented in noir_XPath.

Usage:
    python generate_tests.py [--output-dir PATH] [--functions FUNC1,FUNC2,...]

Requirements:
    - Python 3.8+
    - elementpath (for XPath 2.0 parsing and evaluation)
    - qt3tests repository (will be cloned if not present)
"""

import argparse
import os
import re
import shutil
import subprocess
import xml.etree.ElementTree as ET
from dataclasses import dataclass, field
from datetime import datetime, timezone, timedelta
from decimal import Decimal
from pathlib import Path
from typing import Optional, Tuple, Any

# Import elementpath for XPath 2.0 parsing
from elementpath import XPath2Parser
from elementpath.datatypes import DateTime10

# XML namespace for qt3tests
QT3_NS = "{http://www.w3.org/2010/09/qt-fots-catalog}"

# Map XPath functions to their test file locations in qt3tests
FUNCTION_TEST_FILES = {
    # Numeric functions
    "fn:abs": "fn/abs.xml",
    "fn:ceiling": "fn/ceiling.xml",
    "fn:floor": "fn/floor.xml",
    "fn:round": "fn/round.xml",
    # Numeric functions (float)
    "fn:round-float": "fn/round.xml",
    "fn:ceiling-float": "fn/ceiling.xml",
    "fn:floor-float": "fn/floor.xml",
    # Numeric functions (double)
    "fn:round-double": "fn/round.xml",
    "fn:ceiling-double": "fn/ceiling.xml",
    "fn:floor-double": "fn/floor.xml",
    # Numeric operators (integer)
    "op:numeric-add": "op/numeric-add.xml",
    "op:numeric-subtract": "op/numeric-subtract.xml",
    "op:numeric-multiply": "op/numeric-multiply.xml",
    "op:numeric-divide": "op/numeric-divide.xml",
    "op:numeric-integer-divide": "op/numeric-integer-divide.xml",
    "op:numeric-mod": "op/numeric-mod.xml",
    "op:numeric-equal": "op/numeric-equal.xml",
    "op:numeric-less-than": "op/numeric-less-than.xml",
    "op:numeric-greater-than": "op/numeric-greater-than.xml",
    # Numeric operators (float)
    "op:numeric-add-float": "op/numeric-add.xml",
    "op:numeric-subtract-float": "op/numeric-subtract.xml",
    "op:numeric-multiply-float": "op/numeric-multiply.xml",
    "op:numeric-divide-float": "op/numeric-divide.xml",
    "op:numeric-equal-float": "op/numeric-equal.xml",
    "op:numeric-less-than-float": "op/numeric-less-than.xml",
    "op:numeric-greater-than-float": "op/numeric-greater-than.xml",
    # Numeric operators (double)
    "op:numeric-add-double": "op/numeric-add.xml",
    "op:numeric-subtract-double": "op/numeric-subtract.xml",
    "op:numeric-multiply-double": "op/numeric-multiply.xml",
    "op:numeric-divide-double": "op/numeric-divide.xml",
    "op:numeric-equal-double": "op/numeric-equal.xml",
    "op:numeric-less-than-double": "op/numeric-less-than.xml",
    "op:numeric-greater-than-double": "op/numeric-greater-than.xml",
    # Type casting
    "xs:float-from-int": "prod/CastExpr.xml",
    "xs:double-from-int": "prod/CastExpr.xml",
    "xs:integer-from-float": "prod/CastExpr.xml",
    "xs:integer-from-double": "prod/CastExpr.xml",
    "xs:float-from-double": "prod/CastExpr.xml",
    # DateTime functions
    "fn:year-from-dateTime": "fn/year-from-dateTime.xml",
    "fn:month-from-dateTime": "fn/month-from-dateTime.xml",
    "fn:day-from-dateTime": "fn/day-from-dateTime.xml",
    "fn:hours-from-dateTime": "fn/hours-from-dateTime.xml",
    "fn:minutes-from-dateTime": "fn/minutes-from-dateTime.xml",
    "fn:seconds-from-dateTime": "fn/seconds-from-dateTime.xml",
    "fn:timezone-from-dateTime": "fn/timezone-from-dateTime.xml",
    # DateTime operators
    "op:dateTime-equal": "op/dateTime-equal.xml",
    "op:dateTime-less-than": "op/dateTime-less-than.xml",
    "op:dateTime-greater-than": "op/dateTime-greater-than.xml",
    # Boolean
    "fn:not": "fn/not.xml",
    "op:boolean-equal": "op/boolean-equal.xml",
    "op:boolean-less-than": "op/boolean-less-than.xml",
    "op:boolean-greater-than": "op/boolean-greater-than.xml",
    # Duration functions (Stream A)
    "fn:days-from-duration": "fn/days-from-duration.xml",
    "fn:hours-from-duration": "fn/hours-from-duration.xml",
    "fn:minutes-from-duration": "fn/minutes-from-duration.xml",
    "fn:seconds-from-duration": "fn/seconds-from-duration.xml",
    # Duration arithmetic and comparisons (Stream B)
    "op:add-dayTimeDuration-to-dateTime": "op/add-dayTimeDuration-to-dateTime.xml",
    "op:subtract-dayTimeDuration-from-dateTime": "op/subtract-dayTimeDuration-from-dateTime.xml",
    "op:subtract-dateTimes": "op/subtract-dateTimes.xml",
    "op:add-dayTimeDurations": "op/add-dayTimeDurations.xml",
    "op:subtract-dayTimeDurations": "op/subtract-dayTimeDurations.xml",
    "op:dayTimeDuration-equal": "op/duration-equal.xml",
    "op:dayTimeDuration-less-than": "op/dayTimeDuration-less-than.xml",
    "op:dayTimeDuration-greater-than": "op/dayTimeDuration-greater-than.xml",
    # Numeric unary operators (Stream E)
    "op:numeric-unary-plus": "op/numeric-unary-plus.xml",
    "op:numeric-unary-minus": "op/numeric-unary-minus.xml",
    # String functions
    "fn:string-length": "fn/string-length.xml",
    "fn:starts-with": "fn/starts-with.xml",
    "fn:ends-with": "fn/ends-with.xml",
    "fn:contains": "fn/contains.xml",
}

# Map XPath functions to Noir function names
FUNCTION_MAP = {
    # Numeric (integer)
    "fn:abs": "abs_int",
    "fn:ceiling": "ceil_int",
    "fn:floor": "floor_int",
    "fn:round": "round_int",
    # Numeric (float)
    "fn:round-float": "round_float",
    "fn:ceiling-float": "ceil_float",
    "fn:floor-float": "floor_float",
    # Numeric (double)
    "fn:round-double": "round_double",
    "fn:ceiling-double": "ceil_double",
    "fn:floor-double": "floor_double",
    "op:numeric-add": "numeric_add_int",
    "op:numeric-subtract": "numeric_subtract_int",
    "op:numeric-multiply": "numeric_multiply_int",
    "op:numeric-divide": "numeric_divide_int",
    "op:numeric-integer-divide": "numeric_divide_int",
    "op:numeric-mod": "numeric_mod_int",
    "op:numeric-equal": "numeric_equal_int",
    "op:numeric-less-than": "numeric_less_than_int",
    "op:numeric-greater-than": "numeric_greater_than_int",
    # Numeric (float)
    "op:numeric-add-float": "numeric_add_float",
    "op:numeric-subtract-float": "numeric_subtract_float",
    "op:numeric-multiply-float": "numeric_multiply_float",
    "op:numeric-divide-float": "numeric_divide_float",
    "op:numeric-equal-float": "numeric_equal_float",
    "op:numeric-less-than-float": "numeric_less_than_float",
    "op:numeric-greater-than-float": "numeric_greater_than_float",
    # Numeric (double)
    "op:numeric-add-double": "numeric_add_double",
    "op:numeric-subtract-double": "numeric_subtract_double",
    "op:numeric-multiply-double": "numeric_multiply_double",
    "op:numeric-divide-double": "numeric_divide_double",
    "op:numeric-equal-double": "numeric_equal_double",
    "op:numeric-less-than-double": "numeric_less_than_double",
    "op:numeric-greater-than-double": "numeric_greater_than_double",
    # Type casting
    "xs:float-from-int": "cast_integer_to_float",
    "xs:double-from-int": "cast_integer_to_double",
    "xs:integer-from-float": "cast_float_to_integer",
    "xs:integer-from-double": "cast_double_to_integer",
    "xs:float-from-double": "cast_double_to_float",
    # DateTime
    "fn:year-from-dateTime": "year_from_datetime",
    "fn:month-from-dateTime": "month_from_datetime",
    "fn:day-from-dateTime": "day_from_datetime",
    "fn:hours-from-dateTime": "hours_from_datetime",
    "fn:minutes-from-dateTime": "minutes_from_datetime",
    "fn:seconds-from-dateTime": "seconds_from_datetime",
    "fn:timezone-from-dateTime": "timezone_from_datetime",
    "op:dateTime-equal": "datetime_equal",
    "op:dateTime-less-than": "datetime_less_than",
    "op:dateTime-greater-than": "datetime_greater_than",
    # Boolean
    "fn:not": "fn_not",
    "op:boolean-equal": "boolean_equal",
    "op:boolean-less-than": "boolean_less_than",
    "op:boolean-greater-than": "boolean_greater_than",
    # Duration functions (Stream A)
    "fn:days-from-duration": "days_from_duration",
    "fn:hours-from-duration": "hours_from_duration",
    "fn:minutes-from-duration": "minutes_from_duration",
    "fn:seconds-from-duration": "seconds_from_duration",
    # Duration arithmetic and comparisons (Stream B)
    "op:add-dayTimeDuration-to-dateTime": "datetime_add_duration",
    "op:subtract-dayTimeDuration-from-dateTime": "datetime_subtract_duration",
    "op:subtract-dateTimes": "datetime_difference",
    "op:add-dayTimeDurations": "duration_add",
    "op:subtract-dayTimeDurations": "duration_subtract",
    "op:dayTimeDuration-equal": "duration_equal",
    "op:dayTimeDuration-less-than": "duration_less_than",
    "op:dayTimeDuration-greater-than": "duration_greater_than",
    # Numeric unary operators (Stream E)
    "op:numeric-unary-plus": "numeric_unary_plus_int",
    "op:numeric-unary-minus": "numeric_unary_minus_int",
    # String functions
    "fn:string-length": "string_length",
    "fn:starts-with": "starts_with",
    "fn:ends-with": "ends_with",
    "fn:contains": "contains",
}

# Float type filter - which function variants accept which types
FLOAT_FUNCTION_TYPES = {
    "op:numeric-add-float": "float",
    "op:numeric-subtract-float": "float",
    "op:numeric-multiply-float": "float",
    "op:numeric-divide-float": "float",
    "op:numeric-equal-float": "float",
    "op:numeric-less-than-float": "float",
    "op:numeric-greater-than-float": "float",
    "fn:round-float": "float",
    "fn:ceiling-float": "float",
    "fn:floor-float": "float",
    "op:numeric-add-double": "double",
    "op:numeric-subtract-double": "double",
    "op:numeric-multiply-double": "double",
    "op:numeric-divide-double": "double",
    "op:numeric-equal-double": "double",
    "op:numeric-less-than-double": "double",
    "op:numeric-greater-than-double": "double",
    "fn:round-double": "double",
    "fn:ceiling-double": "double",
    "fn:floor-double": "double",
}

# Cast expression patterns - which casts from what types
CAST_FUNCTION_PATTERNS = {
    # Pattern: (source_type, target_type)
    "xs:float-from-int": ("int", "float"),       # xs:float(integer_expr)
    "xs:double-from-int": ("int", "double"),     # xs:double(integer_expr)
    "xs:integer-from-float": ("float", "int"),   # xs:integer(xs:float(...))
    "xs:integer-from-double": ("double", "int"), # xs:integer(xs:double(...))
    "xs:float-from-double": ("double", "float"), # xs:float(xs:double(...))
}

# Functions currently implemented (those with a mapping in FUNCTION_MAP)
IMPLEMENTED_FUNCTIONS = list(FUNCTION_MAP.keys())


def discover_all_test_files(qt3_dir: Path) -> dict[str, str]:
    """Discover all test files in qt3tests fn/ and op/ directories.
    
    Returns a dict mapping function names (e.g., 'fn:abs', 'op:numeric-add') 
    to their test file paths relative to qt3_dir.
    """
    all_functions = {}
    
    # Discover fn/ test files
    fn_dir = qt3_dir / "fn"
    if fn_dir.exists():
        for xml_file in fn_dir.glob("*.xml"):
            # Extract function name from filename
            # e.g., abs.xml -> fn:abs, string-length.xml -> fn:string-length
            func_name = xml_file.stem
            all_functions[f"fn:{func_name}"] = f"fn/{xml_file.name}"
    
    # Discover op/ test files
    op_dir = qt3_dir / "op"
    if op_dir.exists():
        for xml_file in op_dir.glob("*.xml"):
            # e.g., numeric-add.xml -> op:numeric-add
            func_name = xml_file.stem
            all_functions[f"op:{func_name}"] = f"op/{xml_file.name}"
    
    # Discover prod/ test files (for type casting etc.)
    prod_dir = qt3_dir / "prod"
    if prod_dir.exists():
        for xml_file in prod_dir.glob("*.xml"):
            func_name = xml_file.stem
            all_functions[f"prod:{func_name}"] = f"prod/{xml_file.name}"
    
    return all_functions


def is_function_implemented(function_name: str) -> bool:
    """Check if a function is implemented (has a mapping in FUNCTION_MAP)."""
    return function_name in FUNCTION_MAP


@dataclass
class TestCase:
    """Represents a single test case from qt3tests."""
    name: str
    description: str
    test_expr: str
    expected_result: str
    result_type: str  # 'assert-eq', 'assert-true', 'assert-false', 'error', etc.
    dependencies: list = field(default_factory=list)


def clone_or_update_qt3tests(qt3_dir: Path) -> None:
    """Clone or update the qt3tests repository."""
    if qt3_dir.exists():
        print(f"qt3tests exists at {qt3_dir}, pulling latest...")
        subprocess.run(["git", "pull"], cwd=qt3_dir, check=True)
    else:
        print(f"Cloning qt3tests to {qt3_dir}...")
        subprocess.run(
            ["git", "clone", "--depth", "1",
             "https://github.com/w3c/qt3tests.git", str(qt3_dir)],
            check=True
        )


def parse_test_file(xml_path: Path) -> list[TestCase]:
    """Parse a qt3tests XML file and extract test cases."""
    if not xml_path.exists():
        print(f"Warning: Test file not found: {xml_path}")
        return []

    tree = ET.parse(xml_path)
    root = tree.getroot()

    tests = []
    for test_case in root.findall(f".//{QT3_NS}test-case"):
        name = test_case.get("name", "unknown")

        # Get dependencies (skip tests with unsupported features)
        deps = []
        for dep in test_case.findall(f".//{QT3_NS}dependency"):
            dep_type = dep.get("type", "")
            dep_value = dep.get("value", "")
            deps.append(f"{dep_type}:{dep_value}")

        # Get description
        desc_elem = test_case.find(f"{QT3_NS}description")
        description = desc_elem.text if desc_elem is not None and desc_elem.text else ""

        # Get test expression
        test_elem = test_case.find(f"{QT3_NS}test")
        if test_elem is None or test_elem.text is None:
            continue
        test_expr = test_elem.text.strip()

        # Get expected result
        result_elem = test_case.find(f"{QT3_NS}result")
        if result_elem is None:
            continue

        # Handle different result types
        result_type = "unknown"
        expected_result = ""

        for child in result_elem:
            tag = child.tag.replace(QT3_NS, "")
            if tag == "assert-eq":
                result_type = "assert-eq"
                expected_result = child.text.strip() if child.text else ""
            elif tag == "assert-string-value":
                result_type = "assert-eq"  # Treat same as assert-eq
                expected_result = child.text.strip() if child.text else ""
            elif tag == "assert-true":
                result_type = "assert-true"
                expected_result = "true"
            elif tag == "assert-false":
                result_type = "assert-false"
                expected_result = "false"
            elif tag == "error":
                result_type = "error"
                expected_result = child.get("code", "")
            elif tag in ("all-of", "any-of"):
                result_type = "complex"
            break

        if result_type not in ("unknown", "complex", "error"):
            tests.append(TestCase(
                name=name,
                description=description,
                test_expr=test_expr,
                expected_result=expected_result,
                result_type=result_type,
                dependencies=deps,
            ))

    return tests


def sanitize_test_name(name: str) -> str:
    """Convert test name to valid Noir identifier."""
    name = re.sub(r"[-.]", "_", name)
    name = re.sub(r"[^a-zA-Z0-9_]", "", name)
    if name and name[0].isdigit():
        name = "test_" + name
    return name.lower()


def sanitize_to_ascii(text: str) -> str:
    """Remove non-ASCII characters and control characters from text for use in Noir comments."""
    # Replace newlines with space, then filter to printable ASCII only
    text = text.replace('\n', ' ').replace('\r', ' ').replace('\t', ' ')
    return ''.join(c if 32 <= ord(c) < 127 else '?' for c in text)


def generate_stub_test(test: 'TestCase', function_name: str) -> Optional[str]:
    """Generate a stub test for an unimplemented function.
    
    The stub test always asserts false, so it will fail until the function
    is correctly implemented.
    """
    test_name = sanitize_test_name(test.name)
    
    # Skip tests with unsupported dependencies
    unsupported_deps = ["schemaValidation", "schemaImport", "staticTyping"]
    for dep in test.dependencies:
        for unsup in unsupported_deps:
            if unsup in dep:
                return None
    
    # Skip tests with error expected results (we can't test errors without implementation)
    if test.result_type in ("unknown", "complex", "error"):
        return None
    
    # Generate a stub test that always fails
    # Sanitize to ASCII for Noir comment compatibility
    desc = sanitize_to_ascii(test.description.replace("\n", " ").replace('"', "'")[:80]) if test.description else ""
    expr_escaped = sanitize_to_ascii(test.test_expr.replace("\n", " ").replace('"', '\\"')[:60])
    expected_escaped = sanitize_to_ascii(str(test.expected_result)[:40])
    
    lines = [
        f"#[test]",
        f"fn {test_name}() {{",
    ]
    if desc:
        lines.append(f"    // {desc}")
    lines.append(f"    // XPath: {expr_escaped}")
    lines.append(f"    // Expected: {expected_escaped}")
    lines.append(f"    // TODO: Implement {function_name}")
    lines.append(f"    assert(false); // Stub test - will fail until function is implemented")
    lines.append("}")
    
    return "\n".join(lines)


def parse_integer(value: str) -> Optional[int]:
    """Parse an XPath integer literal."""
    value = value.strip()
    # Remove type suffix like 'xs:integer(...)'
    match = re.match(r"xs:integer\s*\(\s*['\"]?(-?\d+)['\"]?\s*\)", value)
    if match:
        return int(match.group(1))
    # Plain integer
    if re.match(r"^-?\d+$", value):
        return int(value)
    return None


def parse_boolean(value: str) -> Optional[bool]:
    """Parse an XPath boolean literal."""
    value = value.strip().lower()
    if value in ("true", "true()", "fn:true()"):
        return True
    if value in ("false", "false()", "fn:false()"):
        return False
    match = re.match(r"xs:boolean\s*\(['\"]?(true|false)['\"]?\)", value)
    if match:
        return match.group(1) == "true"
    return None


import struct

def float_to_bits(f: float) -> int:
    """Convert a Python float to IEEE 754 single precision bits."""
    packed = struct.pack('>f', f)
    return struct.unpack('>I', packed)[0]


def double_to_bits(f: float) -> int:
    """Convert a Python float to IEEE 754 double precision bits."""
    packed = struct.pack('>d', f)
    return struct.unpack('>Q', packed)[0]


def parse_float(value: str) -> Optional[Tuple[float, str]]:
    """Parse an XPath float or double literal.
    
    Returns (float_value, type) where type is 'float' or 'double', or None if parsing fails.
    """
    value = value.strip()
    
    # Check for xs:float(...) or xs:double(...)
    float_match = re.match(r"xs:float\s*\(\s*['\"]?([^'\")\s]+)['\"]?\s*\)", value)
    double_match = re.match(r"xs:double\s*\(\s*['\"]?([^'\")\s]+)['\"]?\s*\)", value)
    
    if float_match:
        try:
            val = float(float_match.group(1))
            return (val, 'float')
        except ValueError:
            # Handle special values
            inner = float_match.group(1).upper()
            if inner == 'NAN':
                return (float('nan'), 'float')
            elif inner == 'INF':
                return (float('inf'), 'float')
            elif inner == '-INF':
                return (float('-inf'), 'float')
            return None
    
    if double_match:
        try:
            val = float(double_match.group(1))
            return (val, 'double')
        except ValueError:
            inner = double_match.group(1).upper()
            if inner == 'NAN':
                return (float('nan'), 'double')
            elif inner == 'INF':
                return (float('inf'), 'double')
            elif inner == '-INF':
                return (float('-inf'), 'double')
            return None
    
    # Try plain float/double literals (with E notation)
    if re.match(r'^-?\d+\.?\d*[eE][+-]?\d+$', value) or re.match(r'^-?\d+\.\d+$', value):
        try:
            return (float(value), 'double')  # Default to double for plain literals
        except ValueError:
            return None
    
    return None


def detect_operand_type(expr: str) -> Optional[str]:
    """Detect the numeric type from an XPath expression.
    
    Returns 'int', 'float', 'double', or None if cannot determine.
    """
    expr = expr.strip()
    
    # Check for explicit type casts
    if 'xs:float' in expr:
        return 'float'
    if 'xs:double' in expr:
        return 'double'
    if 'xs:decimal' in expr or 'xs:integer' in expr or 'xs:int' in expr or 'xs:long' in expr:
        return 'int'
    
    # Check for floating point literals
    if re.search(r'\d+[eE][+-]?\d+', expr) or re.search(r'\d+\.\d+', expr):
        return 'double'
    
    return 'int'  # Default to int


def parse_datetime(value: str) -> Optional[Tuple[int, int]]:
    """Parse an XPath dateTime literal using elementpath.
    
    Returns (UTC microseconds, tz_offset_minutes) or None if parsing fails.
    """
    value = value.strip()
    
    # Ensure it's wrapped in xs:dateTime() if not already
    if not value.startswith("xs:dateTime"):
        value = f"xs:dateTime('{value}')"
    
    try:
        parser = XPath2Parser()
        token = parser.parse(value)
        dt = token.evaluate()
        
        if not isinstance(dt, DateTime10):
            return None
        
        # Get timezone offset in minutes
        tz_offset_minutes = 0
        if dt.tzinfo is not None:
            offset = dt.tzinfo.offset
            tz_offset_minutes = int(offset.total_seconds() / 60)
        
        # Build a Python datetime from the components and convert to epoch
        # dt contains local time components with timezone info
        py_tz = timezone(timedelta(minutes=tz_offset_minutes))
        py_dt = datetime(
            dt.year, dt.month, dt.day,
            dt.hour, dt.minute, int(dt.second),
            dt.microsecond,
            tzinfo=py_tz
        )
        
        # Convert to UTC epoch microseconds
        epoch = datetime(1970, 1, 1, tzinfo=timezone.utc)
        utc_dt = py_dt.astimezone(timezone.utc)
        delta = utc_dt - epoch
        utc_micros = int(delta.total_seconds() * 1_000_000)
        
        return (utc_micros, tz_offset_minutes)
    except Exception:
        return None


def parse_duration(value: str) -> Optional[int]:
    """Parse an XPath xs:dayTimeDuration literal.
    
    Returns duration in microseconds (signed integer) or None if parsing fails.
    Format: P[nD][T[nH][nM][n.nS]]
    Examples: "P3DT10H30M", "PT2H30M", "-P2DT4H"
    """
    value = value.strip()
    
    # Handle xs:dayTimeDuration() wrapper
    match = re.match(r"xs:dayTimeDuration\s*\(['\"]([^'\"]+)['\"]\)", value)
    if match:
        value = match.group(1)
    
    # Check for negative sign
    negative = value.startswith('-')
    if negative:
        value = value[1:]
    
    # Duration must start with P
    if not value.startswith('P'):
        return None
    
    value = value[1:]  # Remove 'P'
    
    # Split on 'T' to get date and time parts
    if 'T' in value:
        date_part, time_part = value.split('T', 1)
    else:
        date_part = value
        time_part = ''
    
    total_micros = 0
    
    # Parse date part (days)
    if date_part:
        day_match = re.search(r'(\d+(?:\.\d+)?)D', date_part)
        if day_match:
            days = float(day_match.group(1))
            total_micros += int(days * 86_400_000_000)  # 24*60*60*1_000_000
    
    # Parse time part (hours, minutes, seconds)
    if time_part:
        hour_match = re.search(r'(\d+(?:\.\d+)?)H', time_part)
        if hour_match:
            hours = float(hour_match.group(1))
            total_micros += int(hours * 3_600_000_000)  # 60*60*1_000_000
        
        min_match = re.search(r'(\d+(?:\.\d+)?)M', time_part)
        if min_match:
            minutes = float(min_match.group(1))
            total_micros += int(minutes * 60_000_000)  # 60*1_000_000
        
        sec_match = re.search(r'(\d+(?:\.\d+)?)S', time_part)
        if sec_match:
            seconds = float(sec_match.group(1))
            total_micros += int(seconds * 1_000_000)
    
    if negative:
        total_micros = -total_micros
    
    return total_micros


# i64 bounds
I64_MIN = -9223372036854775808
I64_MAX = 9223372036854775807


def _fits_in_i64(val: int) -> bool:
    """Check if an integer fits in Noir's i64 range."""
    return I64_MIN <= val <= I64_MAX


def _get_function_name(token) -> Optional[str]:
    """Extract the function name from an elementpath token, handling namespace prefixes."""
    symbol = token.symbol
    
    # If there's a namespace prefix (symbol is ':'), get the actual function name
    if symbol == ':' and len(token) >= 2:
        # The function name is in the second child
        return token[1].symbol
    
    # Otherwise the symbol is the function name
    return symbol


def _get_function_args(token) -> list:
    """Get the function arguments from a token, handling namespace prefixes."""
    # If there's a namespace prefix (symbol is ':'), get args from the function token
    if token.symbol == ':' and len(token) >= 2:
        return list(token[1])
    # Otherwise args are direct children
    return list(token)


def convert_xpath_expr(expr: str, function_name: str) -> Optional[Tuple[str, str, Optional[str]]]:
    """Convert an XPath expression to Noir code using elementpath for parsing.
    
    Returns tuple of (setup_code, test_expression, embedded_expected) or None if cannot convert.
    The embedded_expected is set when the XPath expression contains a comparison (e.g., `x eq 5`)
    and the expected value is extracted from the expression itself.
    """
    expr = expr.strip()
    noir_func = FUNCTION_MAP.get(function_name)
    if not noir_func:
        return None
    
    # Check if this is a cast function - skip type filtering for casts
    is_cast_function = function_name in CAST_FUNCTION_PATTERNS
    
    # Check if this is a float/double variant
    expected_type = FLOAT_FUNCTION_TYPES.get(function_name)
    detected_type = detect_operand_type(expr)
    
    # Skip type filtering for cast functions (they handle their own type checking)
    if not is_cast_function:
        # For float/double variants, filter to only matching type tests
        if expected_type is not None:
            if expected_type != detected_type:
                return None
        # For integer variants, skip float/double tests
        elif detected_type in ('float', 'double'):
            return None
    
    parser = XPath2Parser()
    
    # Try to parse and evaluate the expression with elementpath
    try:
        token = parser.parse(expr)
    except Exception:
        return None
    
    # Get the effective function/operator name (handling namespace prefixes)
    symbol = _get_function_name(token)
    if symbol is None:
        return None
    
    # Map XPath function names to Noir functions
    xpath_to_noir_dt_funcs = {
        "year-from-dateTime": "year_from_datetime",
        "month-from-dateTime": "month_from_datetime",
        "day-from-dateTime": "day_from_datetime",
        "hours-from-dateTime": "hours_from_datetime",
        "minutes-from-dateTime": "minutes_from_datetime",
        "seconds-from-dateTime": "seconds_from_datetime",
    }
    
    # Handle datetime component extraction functions
    if symbol in xpath_to_noir_dt_funcs:
        expected_noir_fn = xpath_to_noir_dt_funcs[symbol]
        if expected_noir_fn != noir_func:
            return None
        
        # Get function arguments (handling namespace prefix)
        args = _get_function_args(token)
        
        # The argument should be a dateTime - try to extract it
        if len(args) >= 1:
            arg = args[0]
            # Try to evaluate the datetime argument
            try:
                dt_val = arg.evaluate()
                if isinstance(dt_val, DateTime10):
                    result = _datetime_to_epoch(dt_val)
                    if result is None:
                        return None
                    utc_micros, tz_offset = result
                    # Skip dates before 1970 (negative epoch) - not supported
                    if utc_micros < 0:
                        return None
                    setup = f"let dt = datetime_from_epoch_microseconds_with_tz({utc_micros}, {tz_offset});"
                    return (setup, f"{noir_func}(dt)", None)
            except Exception:
                pass
        return None
    
    # Handle duration component extraction functions (Stream A)
    xpath_to_noir_dur_funcs = {
        "days-from-duration": "days_from_duration",
        "hours-from-duration": "hours_from_duration",
        "minutes-from-duration": "minutes_from_duration",
        "seconds-from-duration": "seconds_from_duration",
    }
    
    if symbol in xpath_to_noir_dur_funcs:
        expected_noir_fn = xpath_to_noir_dur_funcs[symbol]
        if expected_noir_fn != noir_func:
            return None
        
        # Get function arguments
        args = _get_function_args(token)
        
        # The argument should be a duration - try to parse it
        if len(args) >= 1:
            arg = args[0]
            # Try to get the duration string from the token
            try:
                # Check if it's a duration constructor
                arg_symbol = _get_function_name(arg)
                if arg_symbol == "dayTimeDuration":
                    # Get the inner string value
                    inner_args = _get_function_args(arg)
                    if len(inner_args) >= 1:
                        duration_str = inner_args[0].evaluate()
                        if isinstance(duration_str, str):
                            micros = parse_duration(duration_str)
                            if micros is not None and _fits_in_i64(micros):
                                setup = f"let dur = duration_from_microseconds({micros});"
                                return (setup, f"{noir_func}(dur)", None)
            except Exception:
                # If parsing the duration constructor fails, we cannot generate
                # the specialized setup; fall back to returning None to skip this test
                pass
        return None
    
    # Handle duration comparison operators (Stream B)
    if symbol in ("eq", "lt", "gt", "=", "<", ">"):
        duration_cmp_map = {
            "eq": "duration_equal", "=": "duration_equal",
            "lt": "duration_less_than", "<": "duration_less_than",
            "gt": "duration_greater_than", ">": "duration_greater_than",
        }
        expected_noir_fn = duration_cmp_map.get(symbol)
        
        if expected_noir_fn == noir_func and len(token) >= 2:
            # Both operands should be durations
            try:
                # Try to parse both as duration strings
                arg1_symbol = _get_function_name(token[0])
                arg2_symbol = _get_function_name(token[1])
                
                if arg1_symbol == "dayTimeDuration" and arg2_symbol == "dayTimeDuration":
                    inner_args1 = _get_function_args(token[0])
                    inner_args2 = _get_function_args(token[1])
                    
                    if len(inner_args1) >= 1 and len(inner_args2) >= 1:
                        duration_str1 = inner_args1[0].evaluate()
                        duration_str2 = inner_args2[0].evaluate()
                        
                        if isinstance(duration_str1, str) and isinstance(duration_str2, str):
                            micros1 = parse_duration(duration_str1)
                            micros2 = parse_duration(duration_str2)
                            
                            if micros1 is not None and micros2 is not None:
                                if _fits_in_i64(micros1) and _fits_in_i64(micros2):
                                    setup = f"let dur1 = duration_from_microseconds({micros1});\n    let dur2 = duration_from_microseconds({micros2});"
                                    return (setup, f"{noir_func}(dur1, dur2)", None)
            except Exception:
                # This is a best-effort optimization for duration comparisons; if parsing
                # fails for any reason, fall back to the generic handling below
                pass
    
    # Handle duration arithmetic operators (Stream B)
    if symbol in ("+", "-"):
        # Try to detect if this is duration + duration or datetime + duration
        if len(token) >= 2:
            try:
                # Check the types of operands
                arg1_symbol = _get_function_name(token[0])
                arg2_symbol = _get_function_name(token[1])
                
                # Duration + Duration or Duration - Duration
                if arg1_symbol == "dayTimeDuration" and arg2_symbol == "dayTimeDuration":
                    if symbol == "+" and noir_func == "duration_add":
                        inner_args1 = _get_function_args(token[0])
                        inner_args2 = _get_function_args(token[1])
                        
                        if len(inner_args1) >= 1 and len(inner_args2) >= 1:
                            duration_str1 = inner_args1[0].evaluate()
                            duration_str2 = inner_args2[0].evaluate()
                            
                            if isinstance(duration_str1, str) and isinstance(duration_str2, str):
                                micros1 = parse_duration(duration_str1)
                                micros2 = parse_duration(duration_str2)
                                
                                if micros1 is not None and micros2 is not None:
                                    if _fits_in_i64(micros1) and _fits_in_i64(micros2):
                                        setup = f"let dur1 = duration_from_microseconds({micros1});\n    let dur2 = duration_from_microseconds({micros2});"
                                        return (setup, f"{noir_func}(dur1, dur2)", None)
                    elif symbol == "-" and noir_func == "duration_subtract":
                        inner_args1 = _get_function_args(token[0])
                        inner_args2 = _get_function_args(token[1])
                        
                        if len(inner_args1) >= 1 and len(inner_args2) >= 1:
                            duration_str1 = inner_args1[0].evaluate()
                            duration_str2 = inner_args2[0].evaluate()
                            
                            if isinstance(duration_str1, str) and isinstance(duration_str2, str):
                                micros1 = parse_duration(duration_str1)
                                micros2 = parse_duration(duration_str2)
                                
                                if micros1 is not None and micros2 is not None:
                                    if _fits_in_i64(micros1) and _fits_in_i64(micros2):
                                        setup = f"let dur1 = duration_from_microseconds({micros1});\n    let dur2 = duration_from_microseconds({micros2});"
                                        return (setup, f"{noir_func}(dur1, dur2)", None)
                
                # DateTime + Duration
                elif arg1_symbol == "dateTime" and arg2_symbol == "dayTimeDuration":
                    if symbol == "+" and noir_func == "datetime_add_duration":
                        dt_val = token[0].evaluate()
                        inner_args2 = _get_function_args(token[1])
                        
                        if isinstance(dt_val, DateTime10) and len(inner_args2) >= 1:
                            duration_str = inner_args2[0].evaluate()
                            
                            if isinstance(duration_str, str):
                                result = _datetime_to_epoch(dt_val)
                                micros_dur = parse_duration(duration_str)
                                
                                if result is not None and micros_dur is not None:
                                    utc_micros, tz_offset = result
                                    if utc_micros >= 0 and _fits_in_i64(micros_dur):
                                        setup = f"let dt = datetime_from_epoch_microseconds_with_tz({utc_micros}, {tz_offset});\n    let dur = duration_from_microseconds({micros_dur});"
                                        return (setup, f"{noir_func}(dt, dur)", None)
                
                # DateTime - Duration
                elif arg1_symbol == "dateTime" and arg2_symbol == "dayTimeDuration":
                    if symbol == "-" and noir_func == "datetime_subtract_duration":
                        dt_val = token[0].evaluate()
                        inner_args2 = _get_function_args(token[1])
                        
                        if isinstance(dt_val, DateTime10) and len(inner_args2) >= 1:
                            duration_str = inner_args2[0].evaluate()
                            
                            if isinstance(duration_str, str):
                                result = _datetime_to_epoch(dt_val)
                                micros_dur = parse_duration(duration_str)
                                
                                if result is not None and micros_dur is not None:
                                    utc_micros, tz_offset = result
                                    if utc_micros >= 0 and _fits_in_i64(micros_dur):
                                        setup = f"let dt = datetime_from_epoch_microseconds_with_tz({utc_micros}, {tz_offset});\n    let dur = duration_from_microseconds({micros_dur});"
                                        return (setup, f"{noir_func}(dt, dur)", None)
                
                # DateTime - DateTime (returns duration)
                elif arg1_symbol == "dateTime" and arg2_symbol == "dateTime":
                    if symbol == "-" and noir_func == "datetime_difference":
                        dt1 = token[0].evaluate()
                        dt2 = token[1].evaluate()
                        
                        if isinstance(dt1, DateTime10) and isinstance(dt2, DateTime10):
                            result1 = _datetime_to_epoch(dt1)
                            result2 = _datetime_to_epoch(dt2)
                            
                            if result1 is not None and result2 is not None:
                                utc_micros1, tz_offset1 = result1
                                utc_micros2, tz_offset2 = result2
                                
                                if utc_micros1 >= 0 and utc_micros2 >= 0:
                                    setup = f"let dt1 = datetime_from_epoch_microseconds_with_tz({utc_micros1}, {tz_offset1});\n    let dt2 = datetime_from_epoch_microseconds_with_tz({utc_micros2}, {tz_offset2});"
                                    return (setup, f"{noir_func}(dt1, dt2)", None)
            except Exception:
                # Skip tests that cannot be evaluated (e.g., complex expressions)
                pass
    
    # Handle datetime comparison operators (eq, lt, gt)
    if symbol in ("eq", "lt", "gt", "=", "<", ">"):
        op_map = {
            "eq": "datetime_equal", "=": "datetime_equal",
            "lt": "datetime_less_than", "<": "datetime_less_than",
            "gt": "datetime_greater_than", ">": "datetime_greater_than",
        }
        expected_noir_fn = op_map.get(symbol)
        
        if expected_noir_fn == noir_func and len(token) >= 2:
            # Both operands should be dateTimes
            try:
                dt1 = token[0].evaluate()
                dt2 = token[1].evaluate()
                
                if isinstance(dt1, DateTime10) and isinstance(dt2, DateTime10):
                    result1 = _datetime_to_epoch(dt1)
                    result2 = _datetime_to_epoch(dt2)
                    
                    if result1 is not None and result2 is not None:
                        utc_micros1, tz_offset1 = result1
                        utc_micros2, tz_offset2 = result2
                        # Skip dates before 1970
                        if utc_micros1 < 0 or utc_micros2 < 0:
                            return None
                        setup = f"let dt1 = datetime_from_epoch_microseconds_with_tz({utc_micros1}, {tz_offset1});\n    let dt2 = datetime_from_epoch_microseconds_with_tz({utc_micros2}, {tz_offset2});"
                        return (setup, f"{noir_func}(dt1, dt2)", None)
            except Exception:
                pass
    
    # Handle fn:not
    if symbol == "not" and noir_func == "fn_not":
        args = _get_function_args(token)
        if len(args) >= 1:
            try:
                arg_val = args[0].evaluate()
                if isinstance(arg_val, bool):
                    return ("", f"fn_not({str(arg_val).lower()})", None)
            except Exception:
                pass
        return None
    
    # Handle numeric mod operator (integer only)
    if symbol == "mod" and noir_func == "numeric_mod_int":
        if len(token) >= 2:
            try:
                a = token[0].evaluate()
                b = token[1].evaluate()
                if isinstance(a, (int, float, Decimal)) and isinstance(b, (int, float, Decimal)):
                    a_int, b_int = int(a), int(b)
                    if not _fits_in_i64(a_int) or not _fits_in_i64(b_int):
                        return None
                    return ("", f"numeric_mod_int({a_int}, {b_int})", None)
            except Exception:
                pass
        return None
    
    # Handle float arithmetic operators
    float_ops = {
        "+": ("numeric_add_float", "numeric_add_double"),
        "-": ("numeric_subtract_float", "numeric_subtract_double"),
        "*": ("numeric_multiply_float", "numeric_multiply_double"),
        "div": ("numeric_divide_float", "numeric_divide_double"),
    }
    
    if symbol in float_ops and noir_func in float_ops[symbol]:
        if len(token) >= 2:
            try:
                a = token[0].evaluate()
                b = token[1].evaluate()
                if isinstance(a, (int, float, Decimal)) and isinstance(b, (int, float, Decimal)):
                    a_float, b_float = float(a), float(b)
                    
                    # Determine if we're generating float32 or float64 code
                    is_float32 = noir_func.endswith('_float')
                    
                    if is_float32:
                        a_bits = float_to_bits(a_float)
                        b_bits = float_to_bits(b_float)
                        setup = f"let a = XsdFloat::from_bits({a_bits});\n    let b = XsdFloat::from_bits({b_bits});"
                        return (setup, f"{noir_func}(a, b)", None)
                    else:
                        a_bits = double_to_bits(a_float)
                        b_bits = double_to_bits(b_float)
                        setup = f"let a = XsdDouble::from_bits({a_bits});\n    let b = XsdDouble::from_bits({b_bits});"
                        return (setup, f"{noir_func}(a, b)", None)
            except Exception:
                pass
        return None
    
    # Handle float comparison operators (eq, lt, gt)
    float_cmp_ops = {
        "eq": ("numeric_equal_float", "numeric_equal_double"),
        "lt": ("numeric_less_than_float", "numeric_less_than_double"),
        "gt": ("numeric_greater_than_float", "numeric_greater_than_double"),
        "=": ("numeric_equal_float", "numeric_equal_double"),
        "<": ("numeric_less_than_float", "numeric_less_than_double"),
        ">": ("numeric_greater_than_float", "numeric_greater_than_double"),
    }
    
    if symbol in float_cmp_ops and noir_func in float_cmp_ops[symbol]:
        if len(token) >= 2:
            try:
                a = token[0].evaluate()
                b = token[1].evaluate()
                if isinstance(a, (int, float, Decimal)) and isinstance(b, (int, float, Decimal)):
                    a_float, b_float = float(a), float(b)
                    
                    is_float32 = noir_func.endswith('_float')
                    
                    if is_float32:
                        a_bits = float_to_bits(a_float)
                        b_bits = float_to_bits(b_float)
                        setup = f"let a = XsdFloat::from_bits({a_bits});\n    let b = XsdFloat::from_bits({b_bits});"
                        return (setup, f"{noir_func}(a, b)", None)
                    else:
                        a_bits = double_to_bits(a_float)
                        b_bits = double_to_bits(b_float)
                        setup = f"let a = XsdDouble::from_bits({a_bits});\n    let b = XsdDouble::from_bits({b_bits});"
                        return (setup, f"{noir_func}(a, b)", None)
            except Exception:
                pass
        return None
    
    # Handle integer numeric operators
    numeric_ops = {
        "+": "numeric_add_int",
        "-": "numeric_subtract_int",
        "*": "numeric_multiply_int",
        "div": "numeric_divide_int",
        "idiv": "numeric_divide_int",
    }
    
    if symbol in numeric_ops and numeric_ops[symbol] == noir_func:
        if len(token) >= 2:
            try:
                a = token[0].evaluate()
                b = token[1].evaluate()
                if isinstance(a, (int, float, Decimal)) and isinstance(b, (int, float, Decimal)):
                    a_int, b_int = int(a), int(b)
                    # Skip values outside i64 range
                    if not _fits_in_i64(a_int) or not _fits_in_i64(b_int):
                        return None
                    return ("", f"{noir_func}({a_int}, {b_int})", None)
            except Exception:
                pass
        return None
    
    # Handle fn:abs
    if symbol == "abs" and noir_func == "abs_int":
        args = _get_function_args(token)
        if len(args) >= 1:
            try:
                arg_val = args[0].evaluate()
                if isinstance(arg_val, (int, float, Decimal)):
                    val_int = int(arg_val)
                    if not _fits_in_i64(val_int):
                        return None
                    return ("", f"abs_int({val_int})", None)
            except Exception:
                pass
        return None
    
    # Handle fn:ceiling
    if symbol == "ceiling" and noir_func == "ceil_int":
        args = _get_function_args(token)
        if len(args) >= 1:
            try:
                arg_val = args[0].evaluate()
                if isinstance(arg_val, (int, float, Decimal)):
                    val_int = int(arg_val)
                    if not _fits_in_i64(val_int):
                        return None
                    return ("", f"ceil_int({val_int})", None)
            except Exception:
                # Skip tests that cannot be evaluated (e.g., complex expressions)
                pass
        return None
    
    # Handle fn:floor
    if symbol == "floor" and noir_func == "floor_int":
        args = _get_function_args(token)
        if len(args) >= 1:
            try:
                arg_val = args[0].evaluate()
                if isinstance(arg_val, (int, float, Decimal)):
                    val_int = int(arg_val)
                    if not _fits_in_i64(val_int):
                        return None
                    return ("", f"floor_int({val_int})", None)
            except Exception:
                # Skip tests that cannot be evaluated (e.g., complex expressions)
                pass
        return None
    
    # Handle fn:round
    if symbol == "round" and noir_func == "round_int":
        args = _get_function_args(token)
        if len(args) >= 1:
            try:
                arg_val = args[0].evaluate()
                if isinstance(arg_val, (int, float, Decimal)):
                    val_int = int(arg_val)
                    if not _fits_in_i64(val_int):
                        return None
                    return ("", f"round_int({val_int})", None)
            except Exception:
                # Skip tests that cannot be evaluated (e.g., complex expressions)
                pass
        return None
    
    # Handle fn:round (float/double)
    if symbol == "round" and noir_func in ("round_float", "round_double"):
        args = _get_function_args(token)
        if len(args) >= 1:
            try:
                arg_val = args[0].evaluate()
                if isinstance(arg_val, (int, float, Decimal)):
                    val_float = float(arg_val)
                    
                    is_float32 = noir_func == "round_float"
                    
                    if is_float32:
                        val_bits = float_to_bits(val_float)
                        setup = f"let val = XsdFloat::from_bits({val_bits});"
                        return (setup, f"{noir_func}(val)", None)
                    else:
                        val_bits = double_to_bits(val_float)
                        setup = f"let val = XsdDouble::from_bits({val_bits});"
                        return (setup, f"{noir_func}(val)", None)
            except Exception:
                pass
        return None
    
    # Handle fn:ceiling (float/double)
    if symbol == "ceiling" and noir_func in ("ceil_float", "ceil_double"):
        args = _get_function_args(token)
        if len(args) >= 1:
            try:
                arg_val = args[0].evaluate()
                if isinstance(arg_val, (int, float, Decimal)):
                    val_float = float(arg_val)
                    
                    is_float32 = noir_func == "ceil_float"
                    
                    if is_float32:
                        val_bits = float_to_bits(val_float)
                        setup = f"let val = XsdFloat::from_bits({val_bits});"
                        return (setup, f"{noir_func}(val)", None)
                    else:
                        val_bits = double_to_bits(val_float)
                        setup = f"let val = XsdDouble::from_bits({val_bits});"
                        return (setup, f"{noir_func}(val)", None)
            except Exception:
                pass
        return None
    
    # Handle fn:floor (float/double)
    if symbol == "floor" and noir_func in ("floor_float", "floor_double"):
        args = _get_function_args(token)
        if len(args) >= 1:
            try:
                arg_val = args[0].evaluate()
                if isinstance(arg_val, (int, float, Decimal)):
                    val_float = float(arg_val)
                    
                    is_float32 = noir_func == "floor_float"
                    
                    if is_float32:
                        val_bits = float_to_bits(val_float)
                        setup = f"let val = XsdFloat::from_bits({val_bits});"
                        return (setup, f"{noir_func}(val)", None)
                    else:
                        val_bits = double_to_bits(val_float)
                        setup = f"let val = XsdDouble::from_bits({val_bits});"
                        return (setup, f"{noir_func}(val)", None)
            except Exception:
                pass
        return None
    
    # Handle numeric unary operators (Stream E)
    if symbol == "+" and noir_func == "numeric_unary_plus_int":
        # Unary plus: +$value
        if len(token) >= 1:
            try:
                arg_val = token[0].evaluate()
                if isinstance(arg_val, (int, float, Decimal)):
                    val_int = int(arg_val)
                    if not _fits_in_i64(val_int):
                        return None
                    return ("", f"numeric_unary_plus_int({val_int})", None)
            except Exception:
                # Skip tests that cannot be evaluated (e.g., complex expressions)
                pass
        return None
    
    if symbol == "-" and noir_func == "numeric_unary_minus_int":
        # Check if this is unary minus (single operand) vs binary subtract (two operands)
        if len(token) == 1:
            # Unary minus: -$value
            try:
                arg_val = token[0].evaluate()
                if isinstance(arg_val, (int, float, Decimal)):
                    val_int = int(arg_val)
                    if not _fits_in_i64(val_int):
                        return None
                    return ("", f"numeric_unary_minus_int({val_int})", None)
            except Exception:
                # Skip tests that cannot be evaluated (e.g., complex expressions)
                pass
        return None
    
    # Handle integer numeric comparison operators (eq, lt, gt)
    int_cmp_ops = {
        "eq": "numeric_equal_int",
        "lt": "numeric_less_than_int",
        "gt": "numeric_greater_than_int",
        "=": "numeric_equal_int",
        "<": "numeric_less_than_int",
        ">": "numeric_greater_than_int",
    }
    
    if symbol in int_cmp_ops and int_cmp_ops[symbol] == noir_func:
        if len(token) >= 2:
            try:
                a = token[0].evaluate()
                b = token[1].evaluate()
                if isinstance(a, (int, float, Decimal)) and isinstance(b, (int, float, Decimal)):
                    a_int, b_int = int(a), int(b)
                    # Skip values outside i64 range
                    if not _fits_in_i64(a_int) or not _fits_in_i64(b_int):
                        return None
                    return ("", f"{noir_func}({a_int}, {b_int})", None)
            except Exception:
                # Skip tests that cannot be evaluated (e.g., complex expressions)
                pass
        return None
    
    # Handle op:boolean-equal
    if symbol in ("eq", "=") and noir_func == "boolean_equal":
        if len(token) >= 2:
            try:
                a = token[0].evaluate()
                b = token[1].evaluate()
                if isinstance(a, bool) and isinstance(b, bool):
                    return ("", f"boolean_equal({str(a).lower()}, {str(b).lower()})", None)
            except Exception:
                # Skip tests that cannot be evaluated (e.g., complex expressions)
                pass
        return None
    
    # Handle op:boolean-less-than and op:boolean-greater-than (Stream F)
    bool_cmp_ops = {
        "lt": "boolean_less_than",
        "<": "boolean_less_than",
        "gt": "boolean_greater_than",
        ">": "boolean_greater_than",
    }
    
    if symbol in bool_cmp_ops and bool_cmp_ops[symbol] == noir_func:
        if len(token) >= 2:
            try:
                a = token[0].evaluate()
                b = token[1].evaluate()
                if isinstance(a, bool) and isinstance(b, bool):
                    return ("", f"{noir_func}({str(a).lower()}, {str(b).lower()})", None)
            except Exception:
                # Skip tests that cannot be evaluated (e.g., complex expressions)
                pass
        return None
    
    # Handle fn:timezone-from-dateTime
    if symbol == "timezone-from-dateTime" and noir_func == "timezone_from_datetime":
        args = _get_function_args(token)
        if len(args) >= 1:
            try:
                dt_val = args[0].evaluate()
                if isinstance(dt_val, DateTime10):
                    result = _datetime_to_epoch(dt_val)
                    if result is None:
                        return None
                    utc_micros, tz_offset = result
                    # Skip dates before 1970 (negative epoch) - not supported
                    if utc_micros < 0:
                        return None
                    setup = f"let dt = datetime_from_epoch_microseconds_with_tz({utc_micros}, {tz_offset});"
                    return (setup, f"{noir_func}(dt)", None)
            except Exception:
                # Skip tests that cannot be evaluated (e.g., complex expressions)
                pass
        return None
    
    # Handle type casting expressions using "cast as" syntax
    # e.g., xs:integer("-100") cast as xs:float, xs:double("1.5") cast as xs:integer
    cast_pattern = CAST_FUNCTION_PATTERNS.get(function_name)
    if cast_pattern is not None:
        source_type, target_type = cast_pattern
        
        # Map target types to expected xs: type names
        target_type_names = {
            'float': 'float',
            'double': 'double',
            'int': 'integer',
        }
        expected_target = target_type_names.get(target_type)
        
        # Map source types to expected xs: type names  
        source_type_names = {
            'int': 'integer',
            'float': 'float',
            'double': 'double',
        }
        expected_source = source_type_names.get(source_type)
        
        # Handle "cast as" syntax: expr cast as xs:type
        if symbol == 'cast' and len(token) >= 2:
            source_token = token[0]  # The value being cast
            target_token = token[1]  # The target type (xs:float, xs:double, xs:integer)
            
            # Get target type name from the second part of xs:type
            if target_token.symbol == ':' and len(target_token) >= 2:
                actual_target = target_token[1].value if hasattr(target_token[1], 'value') else target_token[1].symbol
                
                # Check if target matches what we're looking for
                if actual_target != expected_target:
                    return None
                
                # Get the source value's type
                source_symbol = _get_function_name(source_token)
                
                try:
                    # Evaluate the source value
                    source_val = source_token.evaluate()
                    
                    # For xs:float-from-int or xs:double-from-int: expect integer source
                    if source_type == 'int':
                        # Source should be xs:integer(...) or plain int, NOT xs:decimal
                        # xs:decimal should be skipped as we don't support decimal-to-float conversion yet
                        if source_symbol == 'decimal':
                            return None  # Skip xs:decimal sources
                        if source_symbol == 'integer' or isinstance(source_val, int):
                            val_int = int(source_val)
                            # Only accept i8 range (-128 to 127) for casts to float/double
                            if val_int < -128 or val_int > 127:
                                return None
                            return ("", f"{noir_func}({val_int})", None)
                    
                    # For xs:integer-from-float: expect xs:float source
                    elif source_type == 'float':
                        if source_symbol == 'float':
                            float_val = float(source_val)
                            bits = float_to_bits(float_val)
                            setup = f"let f = XsdFloat::from_bits({bits});"
                            return (setup, f"{noir_func}(f)", None)
                    
                    # For xs:integer-from-double or xs:float-from-double: expect xs:double source
                    elif source_type == 'double':
                        if source_symbol == 'double':
                            double_val = float(source_val)
                            bits = double_to_bits(double_val)
                            setup = f"let d = XsdDouble::from_bits({bits});"
                            return (setup, f"{noir_func}(d)", None)
                            
                except Exception:
                    pass
            return None
        
        # Also handle constructor syntax: xs:float(integer_expr), xs:double(integer_expr), etc.
        # The symbol should be 'float', 'double', or 'integer' (depending on target type)
        if symbol == expected_target:
            args = _get_function_args(token)
            if len(args) >= 1:
                try:
                    # First check if the argument has the right source type
                    arg_token = args[0]
                    arg_symbol = _get_function_name(arg_token)
                    
                    # For xs:float-from-int: expect integer input (plain number or xs:integer())
                    if source_type == 'int':
                        # Try to evaluate as integer
                        arg_val = arg_token.evaluate()
                        if isinstance(arg_val, (int, Decimal)):
                            val_int = int(arg_val)
                            # Only accept i8 range (-128 to 127) for casts to float/double
                            if val_int < -128 or val_int > 127:
                                return None
                            return ("", f"{noir_func}({val_int})", None)
                        elif isinstance(arg_val, float):
                            # Float literal being cast - skip for int source
                            return None
                    
                    # For xs:integer-from-float: expect xs:float() input
                    elif source_type == 'float':
                        if arg_symbol == 'float':
                            # Get the inner value
                            inner_args = _get_function_args(arg_token)
                            if len(inner_args) >= 1:
                                inner_val = inner_args[0].evaluate()
                                if isinstance(inner_val, (int, float, Decimal)):
                                    float_val = float(inner_val)
                                    bits = float_to_bits(float_val)
                                    setup = f"let f = XsdFloat::from_bits({bits});"
                                    return (setup, f"{noir_func}(f)", None)
                        return None
                    
                    # For xs:integer-from-double or xs:float-from-double: expect xs:double() input
                    elif source_type == 'double':
                        if arg_symbol == 'double':
                            inner_args = _get_function_args(arg_token)
                            if len(inner_args) >= 1:
                                inner_val = inner_args[0].evaluate()
                                if isinstance(inner_val, (int, float, Decimal)):
                                    double_val = float(inner_val)
                                    bits = double_to_bits(double_val)
                                    setup = f"let d = XsdDouble::from_bits({bits});"
                                    return (setup, f"{noir_func}(d)", None)
                        return None
                    
                except Exception:
                    pass
        return None
    
    return None


def _datetime_to_epoch(dt: DateTime10) -> Optional[Tuple[int, int]]:
    """Convert elementpath DateTime10 to (UTC microseconds, tz_offset_minutes)."""
    try:
        # Get timezone offset in minutes
        tz_offset_minutes = 0
        if dt.tzinfo is not None:
            offset = dt.tzinfo.offset
            tz_offset_minutes = int(offset.total_seconds() / 60)
        
        # Build a Python datetime and convert to epoch
        py_tz = timezone(timedelta(minutes=tz_offset_minutes))
        py_dt = datetime(
            dt.year, dt.month, dt.day,
            dt.hour, dt.minute, int(dt.second),
            dt.microsecond,
            tzinfo=py_tz
        )
        
        epoch = datetime(1970, 1, 1, tzinfo=timezone.utc)
        utc_dt = py_dt.astimezone(timezone.utc)
        delta = utc_dt - epoch
        utc_micros = int(delta.total_seconds() * 1_000_000)
        
        return (utc_micros, tz_offset_minutes)
    except Exception:
        return None


def generate_noir_test(test: TestCase, function_name: str) -> Optional[str]:
    """Generate Noir test code for a test case.
    
    Returns None if the test cannot be converted to Noir.
    """
    test_name = sanitize_test_name(test.name)
    
    # Skip tests with unsupported dependencies
    unsupported_deps = ["schemaValidation", "schemaImport", "staticTyping"]
    for dep in test.dependencies:
        for unsup in unsupported_deps:
            if unsup in dep:
                return None
    
    # Try to convert the expression
    conversion = convert_xpath_expr(test.test_expr, function_name)
    if conversion is None:
        # Generate placeholder
        desc = test.description.replace("\n", " ").replace('"', "'")[:80]
        return f"""// SKIP: {test_name}
// Cannot auto-convert: {test.test_expr}
// Expected: {test.expected_result}
"""
    
    setup_code, test_expr, embedded_expected = conversion
    
    # Determine what functions return boolean values
    boolean_returning_functions = [
        "fn_not", "boolean_equal", "boolean_less_than", "boolean_greater_than",
        "datetime_equal", "datetime_less_than", "datetime_greater_than",
        "duration_equal", "duration_less_than", "duration_greater_than",
        "numeric_equal_int", "numeric_less_than_int", "numeric_greater_than_int",
        "numeric_equal_float", "numeric_less_than_float", "numeric_greater_than_float",
        "numeric_equal_double", "numeric_less_than_double", "numeric_greater_than_double",
    ]
    
    # Functions that return float/double types
    float_returning_functions = [
        "numeric_add_float", "numeric_subtract_float", 
        "numeric_multiply_float", "numeric_divide_float",
        "round_float", "ceil_float", "floor_float",
        "cast_integer_to_float",  # xs:float(integer)
        "cast_double_to_float",   # xs:float(double)
    ]
    double_returning_functions = [
        "numeric_add_double", "numeric_subtract_double",
        "numeric_multiply_double", "numeric_divide_double",
        "round_double", "ceil_double", "floor_double",
        "cast_integer_to_double", # xs:double(integer)
    ]
    
    # Functions that return Option<i64>
    option_int_returning_functions = [
        "cast_float_to_integer",  # xs:integer(float)
        "cast_double_to_integer", # xs:integer(double)
    ]
    
    noir_func = FUNCTION_MAP.get(function_name)
    func_returns_bool = noir_func in boolean_returning_functions
    func_returns_float = noir_func in float_returning_functions
    func_returns_double = noir_func in double_returning_functions
    func_returns_option_int = noir_func in option_int_returning_functions
    
    # Generate assertion based on result type
    # If embedded_expected is set, it means the XPath expression contained a comparison
    # and we extracted the expected value from it
    if embedded_expected is not None:
        # The expression contains a comparison, use the embedded expected value
        int_val = parse_integer(embedded_expected)
        if int_val is not None:
            assertion = f"assert({test_expr} == {int_val});"
        else:
            # Try as float (for seconds)
            try:
                float_val = float(embedded_expected)
                int_part = int(float_val)
                assertion = f"assert({test_expr} == {int_part});"
            except ValueError:
                return f"""// SKIP: {test_name}
// Cannot parse embedded expected: {embedded_expected}
"""
    elif test.result_type in ("assert-true", "assert-false"):
        # Only allow assert-true/assert-false for functions that return boolean
        if not func_returns_bool:
            return f"""// SKIP: {test_name}
// Result type {test.result_type} incompatible with non-boolean function {noir_func}
// Expression: {test.test_expr}
"""
        bool_val = test.result_type == "assert-true"
        assertion = f"assert({test_expr} == {str(bool_val).lower()});"
    elif test.result_type == "assert-eq":
        # Parse expected value
        expected = test.expected_result
        int_val = parse_integer(expected)
        bool_val = parse_boolean(expected)
        float_val = parse_float(expected)
        
        # For Option<i64> returning functions (cast to integer)
        if func_returns_option_int:
            if int_val is not None:
                assertion = f"assert({test_expr}.is_some());\n    assert({test_expr}.unwrap() == {int_val});"
            elif float_val is not None:
                # Truncate float to integer
                val, _ = float_val
                int_part = int(val)
                assertion = f"assert({test_expr}.is_some());\n    assert({test_expr}.unwrap() == {int_part});"
            else:
                return f"""// SKIP: {test_name}
// Cannot parse expected for cast-to-integer function: {expected}
"""
        # For float/double returning functions, we need to convert the expected value to bits
        elif func_returns_float or func_returns_double:
            # Try to parse as float first
            if float_val is not None:
                val, ftype = float_val
                if func_returns_float:
                    # For zero comparisons, use equality (handles +0 vs -0)
                    if val == 0.0:
                        assertion = f"assert({test_expr} == XsdFloat::zero());"
                    else:
                        expected_bits = float_to_bits(val)
                        assertion = f"assert({test_expr}.to_bits() == {expected_bits});"
                else:
                    if val == 0.0:
                        assertion = f"assert({test_expr} == XsdDouble::zero());"
                    else:
                        expected_bits = double_to_bits(val)
                        assertion = f"assert({test_expr}.to_bits() == {expected_bits});"
            elif int_val is not None:
                # Integer value for float function - convert to float bits
                if func_returns_float:
                    if int_val == 0:
                        assertion = f"assert({test_expr} == XsdFloat::zero());"
                    else:
                        expected_bits = float_to_bits(float(int_val))
                        assertion = f"assert({test_expr}.to_bits() == {expected_bits});"
                else:
                    if int_val == 0:
                        assertion = f"assert({test_expr} == XsdDouble::zero());"
                    else:
                        expected_bits = double_to_bits(float(int_val))
                        assertion = f"assert({test_expr}.to_bits() == {expected_bits});"
            else:
                # Cannot parse expected value for float function
                return f"""// SKIP: {test_name}
// Cannot parse expected for float function: {expected}
"""
        elif int_val is not None:
            # Skip negative values for functions that return unsigned types
            unsigned_return_functions = [
                "month_from_datetime", "day_from_datetime",
                "hours_from_datetime", "minutes_from_datetime", "seconds_from_datetime",
                "days_from_duration", "hours_from_duration", 
                "minutes_from_duration", "seconds_from_duration",
            ]
            if int_val < 0 and noir_func in unsigned_return_functions:
                return f"""// SKIP: {test_name}
// Negative expected value {int_val} incompatible with unsigned return type
"""
            assertion = f"assert({test_expr} == {int_val});"
        elif bool_val is not None:
            assertion = f"assert({test_expr} == {str(bool_val).lower()});"
        elif float_val is not None:
            # Float value but function doesn't return float - type mismatch
            return f"""// SKIP: {test_name}
// Float expected value incompatible with function {noir_func}
"""
        else:
            # Cannot parse expected value
            return f"""// SKIP: {test_name}
// Cannot parse expected: {expected}
"""
    else:
        return None
    
    # Build test function
    # Truncate description to max 80 chars, but avoid cutting words mid-way
    if test.description:
        desc = test.description.replace("\n", " ").replace('"', "'")
        if len(desc) > 80:
            # Try to truncate at a word boundary
            desc = desc[:80]
            last_space = desc.rfind(' ')
            if last_space > 60:  # Only truncate at space if it's not too short
                desc = desc[:last_space]
    else:
        desc = ""
    lines = [f"#[test]", f"fn {test_name}() {{"]
    if desc:
        lines.append(f"    // {desc}")
    if setup_code:
        for line in setup_code.split("\n"):
            lines.append(f"    {line}")
    lines.append(f"    {assertion}")
    lines.append("}")
    
    return "\n".join(lines)


def generate_test_package(
    function_name: str,
    tests: list[TestCase],
    output_dir: Path,
    chunk_size: int = 50,
    generate_stubs: bool = False,
) -> int:
    """Generate a Noir test package for a function. Returns count of generated tests.
    
    Args:
        function_name: The XPath function name (e.g., 'fn:abs', 'op:numeric-add')
        tests: List of test cases from qt3tests
        output_dir: Directory to write test packages
        chunk_size: Number of tests per chunk file
        generate_stubs: If True, generate stub tests for unimplemented functions
    """
    pkg_name = f"xpath_test_{sanitize_test_name(function_name)}"
    
    # Check if function is implemented
    func_implemented = is_function_implemented(function_name)
    
    # Convert tests first to see if we have any
    converted_tests = []
    skipped = 0
    for test in tests:
        if func_implemented:
            # For implemented functions, use normal test generation
            noir_test = generate_noir_test(test, function_name)
        elif generate_stubs:
            # For unimplemented functions, generate stub tests
            noir_test = generate_stub_test(test, function_name)
        else:
            # Skip unimplemented functions if stubs not requested
            noir_test = None
        
        if noir_test and not noir_test.startswith("// SKIP"):
            converted_tests.append(noir_test)
        else:
            skipped += 1

    if not converted_tests:
        status = "(stub)" if generate_stubs and not func_implemented else ""
        print(f"  No tests converted for {function_name} {status}(skipped {skipped})")
        # Clean up any existing empty package directory
        pkg_dir = output_dir / pkg_name
        if pkg_dir.exists():
            shutil.rmtree(pkg_dir)
        return 0

    # Create package directory only if we have tests
    pkg_dir = output_dir / pkg_name
    src_dir = pkg_dir / "src"
    src_dir.mkdir(parents=True, exist_ok=True)

    # Generate Nargo.toml
    nargo_toml = f"""[package]
name = "{pkg_name}"
type = "lib"
authors = ["auto-generated"]

[dependencies]
xpath = {{ path = "../../xpath" }}
"""
    (pkg_dir / "Nargo.toml").write_text(nargo_toml)

    # Split tests into chunks
    chunks = [converted_tests[i:i + chunk_size] for i in range(0, len(converted_tests), chunk_size)]

    # Determine required imports (only for implemented functions)
    imports = []
    if func_implemented:
        imports = ["use dep::xpath::{"]
        noir_func = FUNCTION_MAP.get(function_name)
        if noir_func:
            imports.append(f"    {noir_func},")
        
        # Add datetime imports if needed
        if "datetime" in function_name.lower():
            imports.append("    datetime_from_epoch_microseconds_with_tz,")
        
        # Add duration imports if needed
        if "duration" in function_name.lower():
            imports.append("    duration_from_microseconds,")
        
        # Add float/double type imports if needed
        # Check both function_name and noir_func for float/double
        func_lower = function_name.lower()
        noir_func_lower = noir_func.lower() if noir_func else ""
        
        if "float" in func_lower or "float" in noir_func_lower:
            imports.append("    XsdFloat,")
        if "double" in func_lower or "double" in noir_func_lower:
            imports.append("    XsdDouble,")
        
        imports.append("};")

    # Generate lib.nr
    stub_marker = " (STUB - not yet implemented)" if not func_implemented else ""
    lib_lines = [
        f"//! Auto-generated tests for {function_name}{stub_marker}",
        f"//! Source: https://github.com/w3c/qt3tests",
        "",
    ]
    for i in range(len(chunks)):
        lib_lines.append(f"mod chunk_{i};")

    (src_dir / "lib.nr").write_text("\n".join(lib_lines))

    # Generate chunk files
    for i, chunk in enumerate(chunks):
        chunk_lines = [
            f"//! Test chunk {i} for {function_name}",
            f"//! Contains {len(chunk)} tests",
            "",
        ]
        
        if imports:
            chunk_lines.extend(imports)
            chunk_lines.append("")

        for test_code in chunk:
            chunk_lines.append(test_code)
            chunk_lines.append("")

        (src_dir / f"chunk_{i}.nr").write_text("\n".join(chunk_lines))

    status = "(stub)" if not func_implemented else ""
    print(f"  Generated: {pkg_name} ({len(converted_tests)} tests{status}, {skipped} skipped)")
    return len(converted_tests)


def update_workspace_toml(workspace_dir: Path) -> None:
    """Update the workspace Nargo.toml to include generated test packages.
    
    This function reads the existing Nargo.toml, preserves any manually added
    members (those not in test_packages/), and adds/updates test package entries.
    """
    nargo_path = workspace_dir / "Nargo.toml"
    if not nargo_path.exists():
        return

    test_packages_dir = workspace_dir / "test_packages"
    if not test_packages_dir.exists():
        return

    # Find all generated packages in test_packages directory
    new_test_packages = set()
    for pkg_dir in sorted(test_packages_dir.iterdir()):
        if pkg_dir.is_dir() and (pkg_dir / "Nargo.toml").exists():
            new_test_packages.add(f"test_packages/{pkg_dir.name}")

    # Read existing Nargo.toml to preserve manually added members
    existing_content = nargo_path.read_text()
    existing_members = []
    
    # Parse existing members from the TOML file
    # Look for members = [ ... ] pattern
    members_match = re.search(r'members\s*=\s*\[(.*?)\]', existing_content, re.DOTALL)
    if members_match:
        members_str = members_match.group(1)
        # Extract quoted strings
        existing_members = re.findall(r'"([^"]+)"', members_str)
    
    # Separate existing members into:
    # 1. Non-test-package members (manually added, preserve these)
    # 2. Test package members (will be replaced with current test packages)
    preserved_members = []
    for member in existing_members:
        if not member.startswith("test_packages/"):
            preserved_members.append(member)
    
    # Build the complete members list:
    # - Preserved non-test-package members first (in original order)
    # - Then all current test packages (sorted)
    all_members = preserved_members + sorted(new_test_packages)
    
    # Generate new Nargo.toml content
    members_list = ",\n    ".join(f'"{m}"' for m in all_members)
    new_content = f"""[workspace]
members = [
    {members_list},
]
"""
    
    # Only write if content changed
    if new_content != existing_content:
        nargo_path.write_text(new_content)
        added_count = len(new_test_packages - set(m for m in existing_members if m.startswith("test_packages/")))
        removed_count = len(set(m for m in existing_members if m.startswith("test_packages/")) - new_test_packages)
        print(f"\nUpdated workspace Nargo.toml: {len(new_test_packages)} test packages")
        if added_count > 0:
            print(f"  Added {added_count} new test package(s)")
        if removed_count > 0:
            print(f"  Removed {removed_count} obsolete test package(s)")
    else:
        print(f"\nWorkspace Nargo.toml is already up to date ({len(new_test_packages)} test packages)")


def main():
    parser = argparse.ArgumentParser(description="Generate Noir tests from qt3tests")
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=Path(__file__).parent.parent / "test_packages",
        help="Output directory for generated test packages",
    )
    parser.add_argument(
        "--qt3-dir",
        type=Path,
        default=Path(__file__).parent / "qt3tests",
        help="Directory for qt3tests repository",
    )
    parser.add_argument(
        "--functions",
        type=str,
        default=None,
        help="Comma-separated list of functions to generate tests for",
    )
    parser.add_argument(
        "--skip-clone",
        action="store_true",
        help="Skip cloning/updating qt3tests",
    )
    parser.add_argument(
        "--list-functions",
        action="store_true",
        help="List available functions and exit",
    )
    parser.add_argument(
        "--generate-stubs",
        action="store_true",
        help="Generate stub tests for unimplemented functions (tests assert false)",
    )
    parser.add_argument(
        "--all",
        action="store_true",
        help="Process all test files found in qt3tests (not just implemented functions)",
    )
    parser.add_argument(
        "--list-all",
        action="store_true",
        help="List all discoverable functions (implemented and unimplemented) and exit",
    )
    args = parser.parse_args()

    if args.list_functions:
        print("Implemented functions:")
        for func in sorted(IMPLEMENTED_FUNCTIONS):
            print(f"  {func}")
        return

    # Clone/update qt3tests (needed for list-all)
    if not args.skip_clone:
        clone_or_update_qt3tests(args.qt3_dir)

    if args.list_all:
        all_test_files = discover_all_test_files(args.qt3_dir)
        all_functions = {**all_test_files, **FUNCTION_TEST_FILES}
        print("All discoverable functions:")
        print(f"  (✓ = implemented, ✗ = not implemented)\n")
        for func in sorted(all_functions.keys()):
            status = "✓" if is_function_implemented(func) else "✗"
            print(f"  [{status}] {func}")
        print(f"\nTotal: {len(all_functions)} ({len(IMPLEMENTED_FUNCTIONS)} implemented)")
        return

    # Determine which functions to process
    if args.functions:
        # Use explicitly specified functions
        functions_to_process = [f.strip() for f in args.functions.split(",")]
        # Build the test file mapping for specified functions
        all_test_files = discover_all_test_files(args.qt3_dir)
        # Combine with FUNCTION_TEST_FILES for implemented functions
        function_test_files = {**all_test_files, **FUNCTION_TEST_FILES}
    elif args.all:
        # Discover ALL test files from qt3tests
        all_test_files = discover_all_test_files(args.qt3_dir)
        # Combine with FUNCTION_TEST_FILES (which may have specialized mappings)
        function_test_files = {**all_test_files, **FUNCTION_TEST_FILES}
        functions_to_process = list(function_test_files.keys())
    else:
        # Default: only process implemented functions
        functions_to_process = IMPLEMENTED_FUNCTIONS
        function_test_files = FUNCTION_TEST_FILES

    # Process each function
    total_tests_identified = 0
    total_tests_generated = 0
    total_stub_tests = 0
    implemented_count = 0
    unimplemented_count = 0
    
    print("\nGenerating tests...")
    for func in sorted(functions_to_process):
        if func not in function_test_files:
            print(f"  Warning: No test file mapping for {func}")
            continue

        test_file = args.qt3_dir / function_test_files[func]
        tests = parse_test_file(test_file)
        total_tests_identified += len(tests)

        if tests:
            is_impl = is_function_implemented(func)
            if is_impl:
                implemented_count += 1
            else:
                unimplemented_count += 1
            
            count = generate_test_package(
                func, tests, args.output_dir,
                generate_stubs=args.generate_stubs
            )
            total_tests_generated += count
            if not is_impl and count > 0:
                total_stub_tests += count
        else:
            print(f"  No tests found for {func}")

    # Clean up old packages that shouldn't exist anymore
    # This handles the case where we previously generated stub packages
    # but are now running without --generate-stubs
    generated_pkg_names = set()
    for func in functions_to_process:
        pkg_name = f"xpath_test_{sanitize_test_name(func)}"
        # Only include if function is implemented OR we're generating stubs
        if is_function_implemented(func) or args.generate_stubs:
            generated_pkg_names.add(pkg_name)
    
    # Remove packages that exist but shouldn't
    existing_packages = set(p.name for p in args.output_dir.iterdir() if p.is_dir())
    packages_to_remove = existing_packages - generated_pkg_names
    if packages_to_remove:
        print(f"\nCleaning up {len(packages_to_remove)} obsolete test packages...")
        for pkg_name in sorted(packages_to_remove):
            pkg_dir = args.output_dir / pkg_name
            shutil.rmtree(pkg_dir)
            print(f"  Removed: {pkg_name}")

    # Update workspace Nargo.toml
    update_workspace_toml(args.output_dir.parent)

    print(f"\nTest generation complete!")
    print(f"Functions processed: {implemented_count + unimplemented_count} ({implemented_count} implemented, {unimplemented_count} unimplemented)")
    print(f"Total tests identified in qt3tests: {total_tests_identified}")
    print(f"Total tests generated: {total_tests_generated}")
    if total_stub_tests > 0:
        print(f"  - Stub tests (will fail until implemented): {total_stub_tests}")


if __name__ == "__main__":
    main()
