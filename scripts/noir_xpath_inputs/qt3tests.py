"""W3C qt3tests catalogue / test-set XML parser.

This module owns the file-format logic for the qt3tests test suite
(<https://github.com/w3c/qt3tests>) so the test generator stays focused
on Noir-test emission.

A reusable upstream parser exists in
`sissaschool/elementpath`'s `tests/run_w3c_tests.py` (MIT, the same
project ``elementpath`` we already depend on -- see the noir_XPath
input-prep redesign sec 2). However, that file is not shipped in the
installed ``elementpath`` package and ships as a stand-alone test
runner with elementpath-conformance allow-lists baked in. Per the
redesign doc the eventual fork-and-extract is a workspace-level lift
(``tools/noir-test-vectors/qt3tests.py``); this module is the
intermediate per-repo extraction that keeps the noir_XPath generator
script clean while we wait for the workspace lift to land.

Coverage matches the previous in-line implementation: ``test-case``
elements, ``description`` (with asterisk decoration stripped),
``dependency`` collection, the ``test`` expression body and the
common single-child result assertions (``assert-eq`` /
``assert-string-value`` / ``assert-true`` / ``assert-false`` /
``error``). Composite ``all-of`` / ``any-of`` results are flagged but
not expanded -- the generator skips those.
"""

from __future__ import annotations

import re
import subprocess
import xml.etree.ElementTree as ET
from dataclasses import dataclass, field
from pathlib import Path

# XML namespace for the QT3 test-suite catalogue and per-test-set files.
QT3_NS = "{http://www.w3.org/2010/09/qt-fots-catalog}"


@dataclass
class TestCase:
    """A single ``<test-case>`` extracted from a qt3tests XML file.

    Mirrors the historical in-line shape used by ``generate_tests.py``;
    in particular ``result_type`` is the assertion tag's local name
    (``assert-eq`` / ``assert-true`` / ``assert-false`` / ``error`` /
    ``complex``) and ``expected_result`` is the assertion's text
    content (or, for ``error``, the ``code`` attribute).
    """

    name: str
    description: str
    test_expr: str
    expected_result: str
    # 'assert-eq', 'assert-true', 'assert-false', 'error', 'complex' or 'unknown'
    result_type: str
    dependencies: list = field(default_factory=list)


def parse_test_file(xml_path: Path) -> list[TestCase]:
    """Parse a qt3tests XML file and extract its test cases.

    Returns an empty list (with a stderr warning) if the path does not
    exist; a missing file is the qt3tests-not-cloned-yet path that
    ``clone_or_update_qt3tests`` resolves separately.
    """
    if not xml_path.exists():
        print(f"Warning: Test file not found: {xml_path}")
        return []

    tree = ET.parse(xml_path)
    root = tree.getroot()

    tests: list[TestCase] = []
    for test_case in root.findall(f".//{QT3_NS}test-case"):
        name = test_case.get("name", "unknown")

        # Get dependencies (caller decides which ones to skip).
        deps: list[str] = []
        for dep in test_case.findall(f".//{QT3_NS}dependency"):
            dep_type = dep.get("type", "")
            dep_value = dep.get("value", "")
            deps.append(f"{dep_type}:{dep_value}")

        # Get description (qt3tests sometimes wraps it in asterisks).
        desc_elem = test_case.find(f"{QT3_NS}description")
        description = (
            desc_elem.text if desc_elem is not None and desc_elem.text else ""
        )
        description = re.sub(r"\*+", "", description).strip()

        # Get test expression
        test_elem = test_case.find(f"{QT3_NS}test")
        if test_elem is None or test_elem.text is None:
            continue
        test_expr = test_elem.text.strip()

        # Get expected result
        result_elem = test_case.find(f"{QT3_NS}result")
        if result_elem is None:
            continue

        # Handle different result types.
        result_type = "unknown"
        expected_result = ""

        for child in result_elem:
            tag = child.tag.replace(QT3_NS, "")
            if tag == "assert-eq":
                result_type = "assert-eq"
                expected_result = child.text.strip() if child.text else ""
            elif tag == "assert-string-value":
                result_type = "assert-eq"  # treat as assert-eq downstream
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
            tests.append(
                TestCase(
                    name=name,
                    description=description,
                    test_expr=test_expr,
                    expected_result=expected_result,
                    result_type=result_type,
                    dependencies=deps,
                )
            )

    return tests


def discover_all_test_files(
    qt3_dir: Path, *, include_prod: bool = False
) -> dict[str, str]:
    """Discover test files in a local qt3tests checkout.

    Returns a dict mapping function names (e.g. ``fn:abs``,
    ``op:numeric-add``) to their test file paths relative to
    ``qt3_dir``. With ``include_prod=True`` the dict also includes
    XPath / XQuery production fixtures under ``prod/`` keyed as
    ``prod:<stem>``.
    """
    all_functions: dict[str, str] = {}

    fn_dir = qt3_dir / "fn"
    if fn_dir.exists():
        for xml_file in fn_dir.glob("*.xml"):
            func_name = xml_file.stem
            all_functions[f"fn:{func_name}"] = f"fn/{xml_file.name}"

    op_dir = qt3_dir / "op"
    if op_dir.exists():
        for xml_file in op_dir.glob("*.xml"):
            func_name = xml_file.stem
            all_functions[f"op:{func_name}"] = f"op/{xml_file.name}"

    if include_prod:
        prod_dir = qt3_dir / "prod"
        if prod_dir.exists():
            for xml_file in prod_dir.glob("*.xml"):
                func_name = xml_file.stem
                all_functions[f"prod:{func_name}"] = f"prod/{xml_file.name}"

    return all_functions


def discover_available_functions(qt3_dir: Path) -> set[str]:
    """Return the set of qt3tests function/operator names with XML
    fixtures under ``qt3_dir``.

    Empty if the directory does not exist (qt3tests not yet cloned).
    """
    if not qt3_dir.exists():
        return set()
    return set(discover_all_test_files(qt3_dir).keys())


def clone_or_update_qt3tests(qt3_dir: Path) -> None:
    """Clone (shallow) or ``git pull`` an existing qt3tests checkout."""
    if qt3_dir.exists():
        print(f"qt3tests exists at {qt3_dir}, pulling latest...")
        subprocess.run(["git", "pull"], cwd=qt3_dir, check=True)
    else:
        print(f"Cloning qt3tests to {qt3_dir}...")
        subprocess.run(
            [
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/w3c/qt3tests.git",
                str(qt3_dir),
            ],
            check=True,
        )
