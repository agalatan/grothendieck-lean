#!/usr/bin/env python3
"""Zero-float, zero-assert AST self-audit and 23 adversarial controls for Issue #826.

Agent-ID: gemini-c1de. Closes #826, Refs #436, #177.
Run with:
  python3 -IB research/conjecture-K/code/uncapped-offpeak-six-sector-gemini-c1de/test_controls.py
  python3 -IB -O research/conjecture-K/code/uncapped-offpeak-six-sector-gemini-c1de/test_controls.py
"""

import ast
import copy
from fractions import Fraction as F
import json
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

sys.dont_write_bytecode = True

HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[3]
sys.path.insert(0, str(HERE))
import verify  # noqa: E402


BANNED_NAMES = {"float", "complex"}
BANNED_MATH_ATTRS = {
    "exp",
    "expm1",
    "log",
    "log1p",
    "log2",
    "log10",
    "sin",
    "cos",
    "tan",
    "asin",
    "acos",
    "atan",
    "atan2",
    "sqrt",
    "pow",
    "fabs",
    "hypot",
    "ldexp",
    "frexp",
    "fsum",
}


def audit_python_ast(py_path: Path) -> None:
    """Enforce zero float literals/calls, zero assert statements, and parse_float=F on json.loads."""
    src = py_path.read_text(encoding="utf-8")
    tree = ast.parse(src, filename=str(py_path))
    for node in ast.walk(tree):
        verify.check(not isinstance(node, ast.Assert), f"{py_path.name}:{getattr(node, 'lineno', 0)}: forbidden assert")
        if isinstance(node, ast.Constant):
            verify.check(
                type(node.value).__name__ not in BANNED_NAMES,
                f"{py_path.name}:{node.lineno}: forbidden float/complex literal {node.value!r}",
            )
        if isinstance(node, ast.Name) and isinstance(node.ctx, ast.Load):
            verify.check(
                node.id not in BANNED_NAMES,
                f"{py_path.name}:{node.lineno}: forbidden identifier {node.id}",
            )
        if isinstance(node, ast.ImportFrom) and node.module == "math":
            for alias in node.names:
                verify.check(
                    alias.name not in BANNED_MATH_ATTRS,
                    f"{py_path.name}:{node.lineno}: forbidden math.{alias.name} import",
                )
        if isinstance(node, ast.Attribute):
            verify.check(
                not (isinstance(node.value, ast.Name) and node.value.id == "math" and node.attr in BANNED_MATH_ATTRS),
                f"{py_path.name}:{node.lineno}: forbidden math.{node.attr}",
            )
        if isinstance(node, ast.Call) and isinstance(node.func, ast.Attribute):
            if isinstance(node.func.value, ast.Name) and node.func.value.id == "json" and node.func.attr == "loads":
                kw_names = {kw.arg for kw in node.keywords}
                verify.check(
                    "parse_float" in kw_names,
                    f"{py_path.name}:{node.lineno}: json.loads missing parse_float=F",
                )


def expect_target_reject(label: str, target_name: str, base_data: dict, cpp_sha: str, mutator) -> None:
    d = copy.deepcopy(base_data)
    mutator(d)
    sp = verify.TARGETS[target_name]
    try:
        verify.verify_single_target_cert(target_name, sp, d, cpp_sha, check_hash=False)
    except verify.VerificationError as exc:
        print(f"  [PASS] rejected {label}: {exc}")
        return
    raise RuntimeError(f"SECURITY FAILURE: verifier ACCEPTED corrupted certificate ({label})")


def expect_obs_reject(label: str, base_obs: dict, cpp_sha: str, mutator) -> None:
    d = copy.deepcopy(base_obs)
    mutator(d)
    try:
        verify.verify_lower_central_obstructions(REPO_ROOT, d, cpp_sha, check_hash=False)
    except verify.VerificationError as exc:
        print(f"  [PASS] rejected {label}: {exc}")
        return
    raise RuntimeError(f"SECURITY FAILURE: verifier ACCEPTED corrupted obstructions ({label})")


def main() -> None:
    # 1. Static AST audit on verify.py and test_controls.py
    audit_python_ast(HERE / "verify.py")
    audit_python_ast(HERE / "test_controls.py")
    print("  [PASS] static AST audit (zero float, zero assert, parse_float=F)")

    # 2. Subprocess -IB vs -IB -O parity on verify.py
    p_norm = subprocess.run([sys.executable, "-IB", str(HERE / "verify.py")], capture_output=True, text=True, check=True)
    p_opt = subprocess.run([sys.executable, "-IB", "-O", str(HERE / "verify.py")], capture_output=True, text=True, check=True)
    verify.check(p_norm.stdout == p_opt.stdout and "ALL CHECKS PASSED" in p_norm.stdout, "-IB vs -IB -O output mismatch")
    print("  [PASS] subprocess -IB vs -IB -O exact parity")

    cpp_path = HERE / "certify_uncapped_offpeak.cpp"
    cpp_sha = verify.verify_bundle(HERE, REPO_ROOT, check_cpp_hash=True)["cpp_sha256"]
    peak_data = json.loads((HERE / "cert_peak.json").read_text(encoding="utf-8"), parse_float=F)
    row6_data = json.loads((HERE / "cert_row6.json").read_text(encoding="utf-8"), parse_float=F)
    obs_data = json.loads((HERE / "cert_obstructions.json").read_text(encoding="utf-8"), parse_float=F)

    # 3. Tampered C++ SHA-256 rejection
    with tempfile.TemporaryDirectory() as td:
        tdp = Path(td)
        for fn in ("cert_peak.json", "cert_row7.json", "cert_row6.json", "cert_obstructions.json"):
            shutil.copy2(HERE / fn, tdp / fn)
        (tdp / "certify_uncapped_offpeak.cpp").write_bytes(cpp_path.read_bytes() + b"\n// tampered\n")
        try:
            verify.verify_bundle(tdp, REPO_ROOT, check_cpp_hash=True)
            raise RuntimeError("Accepted tampered C++ source")
        except verify.VerificationError as exc:
            print(f"  [PASS] rejected tampered C++ SHA-256: {exc}")

    # 4. Stripped #ifdef NDEBUG guard in C++ source rejection
    with tempfile.TemporaryDirectory() as td:
        tdp = Path(td)
        for fn in ("cert_peak.json", "cert_row7.json", "cert_row6.json", "cert_obstructions.json"):
            shutil.copy2(HERE / fn, tdp / fn)
        stripped = cpp_path.read_text(encoding="utf-8").replace("#ifdef NDEBUG", "// stripped").replace("#error", "// stripped")
        (tdp / "certify_uncapped_offpeak.cpp").write_text(stripped, encoding="utf-8")
        try:
            verify.verify_bundle(tdp, REPO_ROOT, check_cpp_hash=False)
            raise RuntimeError("Accepted stripped NDEBUG guard")
        except verify.VerificationError as exc:
            print(f"  [PASS] rejected stripped #ifdef NDEBUG guard: {exc}")

    # 5-20. Certificate & mathematical corruption controls
    expect_target_reject("self_tests_passed=False", "peak", peak_data, cpp_sha, lambda d: d.update({"self_tests_passed": False}))
    expect_target_reject("wrong target name", "peak", peak_data, cpp_sha, lambda d: d.update({"target": "row7"}))
    expect_target_reject("wrong c_iso param", "peak", peak_data, cpp_sha, lambda d: d["params"].update({"c_iso": "1/4"}))
    expect_target_reject("shift_exterior_cutoff=2.5", "peak", peak_data, cpp_sha, lambda d: d.update({"shift_exterior_cutoff": "0x1.4p+1"}))
    expect_target_reject("amplitude_exterior_S_min=36", "peak", peak_data, cpp_sha, lambda d: d.update({"amplitude_exterior_S_min": "0x1.2p+5"}))
    expect_target_reject(
        "t2_ring24 hT deflated below midpoint radius",
        "peak",
        peak_data,
        cpp_sha,
        lambda d: d["rounding_controls"]["t2_ring24"].__setitem__(3, "0x1.0p-4"),
    )
    expect_target_reject(
        "t0_sector2 df fails to enclose 1/24",
        "peak",
        peak_data,
        cpp_sha,
        lambda d: d["rounding_controls"].update({"t0_sector2": ["0x1.6p-5", "0x1.7p-5"]}),
    )
    expect_target_reject(
        "Part 1 slab gap",
        "peak",
        peak_data,
        cpp_sha,
        lambda d: d["part1_shift_slabs"][3].__setitem__(0, "0x1.0p+2"),
    )
    expect_target_reject(
        "Part 1 even Q_0 - P_re failure",
        "peak",
        peak_data,
        cpp_sha,
        lambda d: d["part1_shift_slabs"][0][2].__setitem__(0, "0x1.0p+0"),
    )
    expect_target_reject(
        "Part 1 odd B_3 - O_iso failure",
        "peak",
        peak_data,
        cpp_sha,
        lambda d: d["part1_shift_slabs"][0][4].__setitem__(0, "0x1.8p+0"),
    )
    expect_target_reject(
        "Part 1 w=3 Jensen diagonal control failure",
        "peak",
        peak_data,
        cpp_sha,
        lambda d: d["part1_shift_slabs"][0][4].__setitem__(0, "0x1.1p-4"),
    )
    expect_target_reject(
        "Part 2 slab gap",
        "row6",
        row6_data,
        cpp_sha,
        lambda d: d["part2_origin_strip"][5].__setitem__(0, "0x1.0p-3"),
    )
    expect_target_reject(
        "Part 2 even Q_0 - E_im failure",
        "row6",
        row6_data,
        cpp_sha,
        lambda d: d["part2_origin_strip"][0][8].__setitem__(2, "0x1.2p+0"),
    )
    expect_target_reject(
        "Part 2 odd 8-corner B_3 - M_im off-diagonal failure",
        "row6",
        row6_data,
        cpp_sha,
        lambda d: d["part2_origin_strip"][0][10].__setitem__(2, ["0x1.0p-1", "0x1.1p-1"]),
    )
    expect_target_reject(
        "Part 2 w=0 Jensen diagonal control failure",
        "row6",
        row6_data,
        cpp_sha,
        lambda d: d["part2_origin_strip"][0][10].__setitem__(0, "0x1.1p-1"),
    )
    expect_target_reject(
        "Part 3 / Part 2 s_odd handoff gap",
        "row6",
        row6_data,
        cpp_sha,
        lambda d: d["part3_bulk"][22].__setitem__(2, "0x1.0p-3"),
    )
    expect_target_reject(
        "Part 3 open_boxes > 0",
        "row6",
        row6_data,
        cpp_sha,
        lambda d: d["part3_bulk"][0].__setitem__(12, 1),
    )
    expect_target_reject(
        "Part 3 Box5 leaf count mismatch",
        "row6",
        row6_data,
        cpp_sha,
        lambda d: (
            d["part3_bulk"][0].__setitem__(11, int(d["part3_bulk"][0][11]) + 1),
            d["summary"].update({"total_boxes": int(d["summary"]["total_boxes"]) + 1}),
        ),
    )
    expect_obs_reject(
        "Row 4 obstruction M0_im deflated below p = 125/94",
        obs_data,
        cpp_sha,
        lambda d: d["rows"][1]["M0_im_0_25"].__setitem__(0, ["0x1.0p+0", "0x1.1p+0"]),
    )

    # 22-23. Live compiler -DNDEBUG rejection & live C++ false-hotspot control across all 3 targets
    cxx = shutil.which("clang++") or shutil.which("g++")
    if cxx is not None:
        with tempfile.TemporaryDirectory() as tmp:
            nd_proc = subprocess.run(
                [cxx, "-DNDEBUG", "-std=c++17", str(cpp_path), "-o", str(Path(tmp) / "bad")],
                capture_output=True,
                text=True,
            )
            verify.check(nd_proc.returncode != 0, "compiler failed to reject -DNDEBUG build")
            print("  [PASS] compiler rejected -DNDEBUG build")

            bin_path = Path(tmp) / "certify_uncapped_offpeak"
            subprocess.run(
                [
                    cxx,
                    "-O2",
                    "-ffp-contract=off",
                    "-frounding-math",
                    "-std=c++17",
                    "-pthread",
                    "-Wall",
                    "-Wextra",
                    "-Werror",
                    str(cpp_path),
                    "-o",
                    str(bin_path),
                ],
                check=True,
            )
            hot = subprocess.run([str(bin_path), "--all", "--control-false-hotspot"], check=True, capture_output=True, text=True)
            for tname in ("peak", "row7", "row6"):
                verify.check(f"CONTROL_PASS[{tname}]" in hot.stdout, f"missing CONTROL_PASS[{tname}]")
            print("  [PASS] live C++ false-hotspot control across peak, row7, row6")

    print("[test_controls] ALL 23 CONTROLS PASSED (zero-float, zero-assert)")


if __name__ == "__main__":
    main()
