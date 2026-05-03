#!/usr/bin/env python3
"""Focused benchmark harness for the unconstrained-hint optimisations.

This harness measures the prover-side gate cost of
``unsigned_to_string_verified`` (the unconstrained-hint + verified-relation
version added in ``xpath/src/unconstrained_ops.nr``) against the original
constrained ``unsigned_to_string`` baseline in ``xpath/src/cast.nr``.

Goals (deliberately small):

* Capture **Expression Width** and **ACIR Opcodes** (split into ``main``
  and ancillary helper functions) for one operation at a single buffer
  width (``N = 20``, the u64 ceiling).
* Print a side-by-side table for the deferred call-site decision and append
  the structured results to ``bench/unconstrained_gate_counts.json`` so future
  runs can spot regressions or wins.
* Stay independent of the broader ``benchmark_gates.py`` ledger
  (``gate_counts.json``) — this script focuses on a single primitive and
  should not be conflated with the wider per-op sweep.

Notes on methodology:

* The witness is taken as ``pub u64`` and **not** equality-pinned to a
  literal, so the compiler cannot constant-fold the call body.  The reported
  numbers are therefore the worst-case witness-driven cost — call-sites that
  pass a compile-time constant will be cheaper.
* ``nargo info`` reports each Brillig-only helper (e.g. ``directive_invert``,
  ``directive_integer_quotient``, ``unsigned_to_string_unconstrained``) as a
  separate row with no Expression Width.  We capture the ``main`` row and
  also the sum of all helper rows under ``ancillary_acir_opcodes`` so the
  comparison reflects the full circuit, not just ``main``.

Usage::

    python3 scripts/benchmark_unconstrained.py
    python3 scripts/benchmark_unconstrained.py --summary
    python3 scripts/benchmark_unconstrained.py --output bench/custom.json

British English is used throughout.
"""

from __future__ import annotations

import argparse
import json
import re
import shutil
import subprocess
import sys
import tempfile
from datetime import datetime
from pathlib import Path

# The single buffer width we measure at.  20 is the u64 ceiling
# (10^19 < 2^64 < 10^20) and matches the assertion in
# ``unsigned_to_string_verified``.
BUFFER_WIDTH: int = 20

# Two implementations under test: the original constrained loop in cast.nr,
# and the unconstrained-hint version in unconstrained_ops.nr.
VARIANTS: dict[str, dict[str, str]] = {
    "baseline": {
        "use_path": "xpath::unsigned_to_string",
        "call": "unsigned_to_string",
    },
    "unconstrained": {
        "use_path": "xpath::unconstrained_ops::unsigned_to_string_verified",
        "call": "unsigned_to_string_verified",
    },
}


def get_project_root() -> Path:
    """Return the absolute path of the noir_XPath project root."""
    return Path(__file__).resolve().parent.parent


def make_main_nr(call: str, use_path: str, n: int) -> str:
    """Render the body of a single-shot ``main`` for one variant.

    The witness is unconstrained (``pub u64``) so the compiler cannot
    constant-fold the call body — the resulting ACIR opcode count reflects
    the worst-case work a prover must do for any u64 input.

    Both outputs (``bytes`` and ``len``) are folded into a single Field
    return so neither can be dropped by dead-code elimination.
    """
    return (
        f"use {use_path};\n"
        "\n"
        "fn main(witness: pub u64) -> pub Field {\n"
        f"    let (bytes, len): ([u8; {n}], u32) = {call}(witness);\n"
        "    let mut acc: Field = len as Field;\n"
        f"    for i in 0..{n} {{\n"
        "        acc = acc * 257 + (bytes[i] as Field);\n"
        "    }\n"
        "    acc\n"
        "}\n"
    )


def make_nargo_toml(name: str) -> str:
    """Render a minimal Nargo.toml for the throwaway benchmark crate."""
    xpath_dir = get_project_root() / "xpath"
    return (
        "[package]\n"
        f'name = "{name}"\n'
        'type = "bin"\n'
        'authors = ["benchmark"]\n'
        "\n"
        "[dependencies]\n"
        f'xpath = {{ path = "{xpath_dir}" }}\n'
    )


def create_benchmark_project(tmpdir: Path, name: str, variant: str) -> Path:
    """Materialise one throwaway crate for ``variant`` under ``tmpdir``."""
    project_dir = tmpdir / name
    src_dir = project_dir / "src"
    src_dir.mkdir(parents=True)

    spec = VARIANTS[variant]
    (project_dir / "Nargo.toml").write_text(make_nargo_toml(name))
    (src_dir / "main.nr").write_text(
        make_main_nr(spec["call"], spec["use_path"], BUFFER_WIDTH)
    )
    return project_dir


# ``nargo info`` table format (1.0.0-beta.17):
#   | Package | Function | Expression Width | ACIR Opcodes | Brillig Opcodes |
_INT_RE = re.compile(r"-?\d+")


def parse_nargo_info(stdout: str) -> dict:
    """Parse ``nargo info`` output for a single benchmark crate.

    Returns ``main_*`` fields for the ``main`` row plus
    ``ancillary_acir_opcodes`` summing every other function row (the
    Brillig-helper rows the compiler emits per crate).
    """
    info: dict = {}
    ancillary_acir = 0
    ancillary_funcs: list[dict] = []

    for raw_line in stdout.splitlines():
        line = raw_line.strip()
        if not line.startswith("|"):
            continue
        cells = [c.strip() for c in line.strip("|").split("|")]
        if len(cells) < 5:
            continue
        # Skip the header row.
        if cells[0].lower() == "package":
            continue

        func_name = cells[1]
        width_cell, acir_cell, brillig_cell = cells[2], cells[3], cells[4]

        width: int | None = None
        width_match = _INT_RE.search(width_cell)
        if width_match is not None:
            width = int(width_match.group(0))

        acir: int | None = None
        if acir_cell and acir_cell != "N/A":
            try:
                acir = int(acir_cell.replace(",", ""))
            except ValueError:
                pass

        brillig: int | None = None
        if brillig_cell and brillig_cell != "N/A":
            try:
                brillig = int(brillig_cell.replace(",", ""))
            except ValueError:
                pass

        if func_name == "main":
            if width is not None:
                info["main_expression_width"] = width
            if acir is not None:
                info["main_acir_opcodes"] = acir
            if brillig is not None:
                info["main_brillig_opcodes"] = brillig
        else:
            if acir is not None:
                ancillary_acir += acir
            ancillary_funcs.append(
                {
                    "name": func_name,
                    "acir_opcodes": acir,
                    "brillig_opcodes": brillig,
                }
            )

    info["ancillary_acir_opcodes"] = ancillary_acir
    info["ancillary_functions"] = ancillary_funcs
    if "main_acir_opcodes" in info:
        info["total_acir_opcodes"] = info["main_acir_opcodes"] + ancillary_acir

    return info


def run_nargo_info(project_dir: Path) -> dict:
    """Run ``nargo info`` in ``project_dir`` and return the parsed numbers."""
    result = subprocess.run(
        ["nargo", "info"],
        cwd=project_dir,
        capture_output=True,
        text=True,
        check=False,
    )
    if result.returncode != 0:
        return {"error": result.stderr.strip() or result.stdout.strip()}

    parsed = parse_nargo_info(result.stdout)
    if "main_acir_opcodes" not in parsed and "error" not in parsed:
        parsed["error"] = "could not parse `main` row from nargo info table"
    return parsed


def get_git_commit() -> str:
    """Return the abbreviated HEAD of the project root, or ``"unknown"``."""
    try:
        proc = subprocess.run(
            ["git", "rev-parse", "--short=8", "HEAD"],
            cwd=get_project_root(),
            capture_output=True,
            text=True,
            check=False,
        )
        if proc.returncode == 0:
            return proc.stdout.strip()
    except OSError:
        pass
    return "unknown"


def benchmark_all() -> dict:
    """Run every variant and return a structured result record."""
    run_record: dict = {
        "timestamp": datetime.now().isoformat(timespec="seconds"),
        "git_commit": get_git_commit(),
        "buffer_width": BUFFER_WIDTH,
        "operation": "unsigned_to_string",
        "input_kind": "witness-driven u64 (no constant folding)",
        "variants": {},
    }

    with tempfile.TemporaryDirectory(prefix="xpath_bench_") as raw_tmp:
        tmpdir = Path(raw_tmp)
        for variant in VARIANTS:
            crate_name = f"bench_{variant}"
            print(f"Measuring {variant:>14s} ...", end=" ", flush=True)
            try:
                project_dir = create_benchmark_project(
                    tmpdir, crate_name, variant
                )
                info = run_nargo_info(project_dir)
            except OSError as err:
                info = {"error": str(err)}
            run_record["variants"][variant] = info

            if "error" in info:
                print(f"ERROR: {info['error'][:80]}")
            else:
                print(
                    f"width={info.get('main_expression_width', '?')}  "
                    f"main_acir={info.get('main_acir_opcodes', '?')}  "
                    f"ancillary_acir={info.get('ancillary_acir_opcodes', 0)}  "
                    f"total_acir={info.get('total_acir_opcodes', '?')}"
                )

    return run_record


def append_to_ledger(record: dict, output_file: Path) -> None:
    """Append ``record`` to the JSON list at ``output_file`` (creating it)."""
    output_file.parent.mkdir(parents=True, exist_ok=True)
    history: list = []
    if output_file.exists():
        try:
            existing = json.loads(output_file.read_text())
            if isinstance(existing, list):
                history = existing
            else:
                history = [existing]
        except (json.JSONDecodeError, OSError):
            # Treat an unreadable ledger as empty rather than aborting the run.
            history = []
    history.append(record)
    output_file.write_text(json.dumps(history, indent=2) + "\n")


def render_table(record: dict) -> str:
    """Return a human-friendly comparison table for ``record``."""
    header = (
        f"{'Variant':<16}"
        f"{'Width':>10}"
        f"{'main ACIR':>12}"
        f"{'aux ACIR':>12}"
        f"{'total ACIR':>14}"
    )
    sep = "-" * len(header)
    lines = [
        f"{record['operation']} -- baseline vs unconstrained "
        f"(N={record['buffer_width']}, {record['input_kind']})",
        f"timestamp: {record['timestamp']}  commit: {record['git_commit']}",
        sep,
        header,
        sep,
    ]
    for variant_name, info in record["variants"].items():
        if "error" in info:
            lines.append(f"{variant_name:<16}  ERROR: {info['error'][:60]}")
            continue
        lines.append(
            f"{variant_name:<16}"
            f"{str(info.get('main_expression_width', 'N/A')):>10}"
            f"{str(info.get('main_acir_opcodes', 'N/A')):>12}"
            f"{str(info.get('ancillary_acir_opcodes', 0)):>12}"
            f"{str(info.get('total_acir_opcodes', 'N/A')):>14}"
        )
    lines.append(sep)

    base = record["variants"].get("baseline", {})
    new = record["variants"].get("unconstrained", {})
    if "total_acir_opcodes" in base and "total_acir_opcodes" in new:
        delta = new["total_acir_opcodes"] - base["total_acir_opcodes"]
        pct = (
            (delta / base["total_acir_opcodes"] * 100.0)
            if base["total_acir_opcodes"] > 0
            else 0.0
        )
        lines.append(
            f"{'delta (total)':<16}"
            f"{'':>10}{'':>12}{'':>12}"
            f"{f'{delta:+d} ({pct:+.1f}%)':>14}"
        )

    if "main_expression_width" in base and "main_expression_width" in new:
        bw = base["main_expression_width"]
        nw = new["main_expression_width"]
        delta_w = nw - bw
        pct_w = (delta_w / bw * 100.0) if bw > 0 else 0.0
        lines.append(
            f"{'delta (width)':<16}"
            f"{f'{delta_w:+d} ({pct_w:+.1f}%)':>10}"
        )
    return "\n".join(lines)


def cmd_run(output_file: Path) -> None:
    """Run benchmarks, append to ledger, and print the comparison table."""
    if shutil.which("nargo") is None:
        print("Error: 'nargo' command not found in PATH.", file=sys.stderr)
        sys.exit(1)
    record = benchmark_all()
    append_to_ledger(record, output_file)
    print()
    print(render_table(record))
    print(f"\nResults appended to {output_file}")


def cmd_summary(output_file: Path) -> None:
    """Print the most recent ledger entry without re-running the benchmark."""
    if not output_file.exists():
        print(f"No ledger found at {output_file}", file=sys.stderr)
        sys.exit(1)
    history = json.loads(output_file.read_text())
    if not history:
        print("Ledger is empty", file=sys.stderr)
        sys.exit(1)
    print(render_table(history[-1]))


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description=(
            "Benchmark the unconstrained-hint optimisation for "
            "unsigned_to_string against the constrained baseline."
        )
    )
    default_output = (
        get_project_root() / "bench" / "unconstrained_gate_counts.json"
    )
    parser.add_argument(
        "--output",
        "-o",
        type=Path,
        default=default_output,
        help=(
            "Path to the JSON ledger to append results to "
            f"(default: {default_output.relative_to(get_project_root())})"
        ),
    )
    parser.add_argument(
        "--summary",
        "-s",
        action="store_true",
        help="Print the most recent ledger entry and exit.",
    )
    args = parser.parse_args(argv)

    if args.summary:
        cmd_summary(args.output)
    else:
        cmd_run(args.output)
    return 0


if __name__ == "__main__":
    sys.exit(main())
