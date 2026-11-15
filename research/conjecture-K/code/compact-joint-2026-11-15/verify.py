#!/usr/bin/env python3
"""Agent-ID: codex-a7c4. Refs #431. Fresh replay of partial interior proofs.

No claim of a complete (P) cover. Requires clang++ and python-flint.
Run python3 -I verify.py --deps /path/to/python-flint --output receipt.json.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys
import tempfile

if not __debug__:
    raise RuntimeError("Assertions must be enabled")

HERE = Path(__file__).resolve().parent
CODE = HERE.parent
REPO = HERE.parents[3]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--deps", type=Path)
parser.add_argument("--output", type=Path, required=True)
args = parser.parse_args()
output = args.output.resolve()
deps = ["--deps", str(args.deps.resolve())] if args.deps else []
records = {}


def run(name, command, cwd, accept=True):
    result = subprocess.run(command, cwd=cwd, text=True, capture_output=True)
    if accept and result.returncode:
        raise RuntimeError(f"{name}: {result.stdout}\n{result.stderr}")
    if not accept and result.returncode == 0:
        raise RuntimeError(f"Negative control unexpectedly accepted: {name}")
    records[name] = {
        "returncode": result.returncode,
        "stdout": result.stdout if accept else "rejected as required",
    }
    print(name, "PASS" if accept else "REJECTED", flush=True)
    return result.stdout


# The temporary include is generated from the repository source, not a saved
# copied library. Only the include paths and unused main's name change.
scratch = REPO / "handoff"
scratch.mkdir(exist_ok=True)
with tempfile.TemporaryDirectory(prefix="codex-a7c4-compact-", dir=scratch) as td:
    temp = Path(td)
    inherited = CODE / "tilted-sector-2026-11-15"
    text = (inherited / "secant_verify.cpp").read_text()
    assert text.count("int main(") == 1
    text = text.replace("int main(", "int inherited_secant_main(")
    for filename in ("theta_verify.cpp", "localization_circle.hpp"):
        old = f'#include "{filename}"'
        assert text.count(old) == 1
        text = text.replace(old, f'#include "{inherited / filename}"')
    (temp / "inherited_secant.hpp").write_text(text)
    flags = ["clang++", "-O2", "-std=c++17", "-frounding-math",
             "-ffp-contract=off", "-fno-fast-math", "-I", str(temp)]
    for stem in ("joint_integral", "hessian_integral", "potential_integral"):
        run(f"compile_{stem}", flags + [str(HERE / f"{stem}.cpp"),
                                        "-o", str(temp / stem)], temp)
    run("reject_ndebug", flags + ["-DNDEBUG", "-fsyntax-only",
                                   str(HERE / "hessian_integral.cpp")], temp, False)
    for name in ("verify.py", "strip_check.py", "origin_check.py", "profile_points.py"):
        for optimization in ("-O", "-OO"):
            run(f"reject_{name}_{optimization}",
                [sys.executable, "-I", optimization, str(HERE / name)], temp, False)
    for name, script in (
        ("inherited_density", CODE / "progress-2026-11-15-codex-a7c4/joint_target_tail.py"),
        ("origin", HERE / "origin_check.py"),
        ("strip_constants", HERE / "strip_check.py"),
    ):
        run(name, [sys.executable, "-I", str(script)], temp)
    run("fresh_profile", [sys.executable, "-I", str(HERE / "profile_points.py"),
                          *deps, "--output", str(temp / "profile.txt")], temp)
    run("critical_box", [str(temp / "joint_integral"), "--critical-box",
                         str(temp / "profile.txt")], temp)
    corrupted = []
    for line in (temp / "profile.txt").read_text().splitlines():
        wn, wd, lo, hi, scale = map(int, line.split())
        corrupted.append(f"{wn} {wd} {lo-scale} {hi-scale} {scale}\n")
    (temp / "corrupt.txt").write_text("".join(corrupted))
    run("reject_corrupted_profile", [str(temp / "joint_integral"), "--critical-box",
                                     str(temp / "corrupt.txt")], temp, False)
    # Exact coverage audits are independent of each verifier's tree traversal.
    from fractions import Fraction
    def cover(name, executable, flag, kind, left, right, marker):
        log = run(name, [str(temp / executable), flag], temp)
        intervals = [tuple(map(Fraction, pair)) for pair in
                     re.findall(rf"^PASS {kind} w=\[([^,]+),([^\]]+)\]", log, re.M)]
        intervals.sort()
        assert intervals and intervals[0][0] == left and intervals[-1][1] == right
        assert all(l < h for l, h in intervals)
        assert all(intervals[i][1] == intervals[i+1][0] for i in range(len(intervals)-1))
        assert marker in log
        records[name + "_cover"] = {
            "interval_count": len(intervals),
            "intervals": [[str(l), str(h)] for l, h in intervals],
        }
    cover("full_shift_hessian", "hessian_integral", "--cover-w", "HESSIAN", 0, 2,
          "PASS ALL SHIFTS [0,2]")
    cover("amplitude_exterior", "potential_integral", "--cover-w", "POTENTIAL", 0, 2,
          "PASS AMPLITUDE EXTERIOR S >= 3/4")
    cover("shift_exterior", "potential_integral", "--cover-shift", "POTENTIAL",
          Fraction(11,8), 2, "PASS SHIFT EXTERIOR [11/8,2]")

files = list(HERE.glob("*.py")) + list(HERE.glob("*.cpp"))
files += [inherited / f for f in ("secant_verify.cpp", "theta_verify.cpp",
                                 "localization_circle.hpp", "content_next_bound.py")]
result = {
    "agent_id": "codex-a7c4",
    "status": "PASS partial interior certificates; complete (P) remains open",
    "complete_interior": False,
    "checks": records,
    "sha256": {str(p.relative_to(REPO)): hashlib.sha256(p.read_bytes()).hexdigest()
               for p in sorted(files)},
}
output.write_text(json.dumps(result, indent=2) + "\n")
print(result["status"])
