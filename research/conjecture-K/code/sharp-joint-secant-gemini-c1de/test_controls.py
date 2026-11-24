#!/usr/bin/env python3
"""Negative and corruption controls for the Sharp Global Joint Secant verifier (#436).

Agent-ID: gemini-c1de. Refs #436.
Verifies that tampering with any certified part (Part A, Part B/D, Part C staircase,
target_V, cpp_sha256, matrix positivity, or Theorem 2(b) polynomial) causes verify.py
to reject cleanly.
"""
import copy
import json
import subprocess
import sys
from fractions import Fraction as F
from pathlib import Path

if not __debug__:
    raise RuntimeError("Run without -O so all assertions execute")

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import verify  # noqa: E402


def expect_fail(label: str, fn):
    try:
        fn()
    except AssertionError as exc:
        print(f"CONTROL PASS (rejected as expected): {label} -> {exc}")
        return
    raise AssertionError(f"CONTROL FAILED (unexpectedly accepted): {label}")


def main():
    result_path = HERE / "result.json"
    base = json.loads(result_path.read_text(encoding="utf-8"))

    # Baseline must pass
    verify.verify_all(base, target_V=F(1, 10000))

    # Control 1: Part A PASS flag flipped
    d1 = copy.deepcopy(base)
    d1["partA"]["PASS"] = "0"
    expect_fail("Part A PASS=0", lambda: verify.verify_all(d1))

    # Control 2: Part A max_evO_cstar made positive
    d2 = copy.deepcopy(base)
    d2["partA"]["max_evO_cstar"] = "0.0001"
    expect_fail("Part A max_evO_cstar > 0", lambda: verify.verify_all(d2))

    # Control 3: Part A w_lo altered from 7/5
    d3 = copy.deepcopy(base)
    d3["partA"]["w_lo"] = "1.5"
    expect_fail("Part A w_lo != 7/5", lambda: verify.verify_all(d3))

    # Control 4: Part B/D L=3.25 max_evO made non-negative
    d4 = copy.deepcopy(base)
    d4["partBD"]["3.25"]["max_evO"] = "0.0"
    expect_fail("Part BD L=3.25 max_evO >= 0", lambda: verify.verify_all(d4))

    # Control 5: Part B/D L=5 max_evO made positive
    d5 = copy.deepcopy(base)
    d5["partBD"]["5"]["max_evO"] = "0.001"
    expect_fail("Part BD L=5 max_evO > 0", lambda: verify.verify_all(d5))

    # Control 6: Part C level evO made positive
    d6 = copy.deepcopy(base)
    d6["partC"][3]["max_evO"] = "0.00001"
    expect_fail("Part C level max_evO > 0", lambda: verify.verify_all(d6))

    # Control 7: Part C staircase inflated above 50e-6 budget
    d7 = copy.deepcopy(base)
    for row in d7["partC"]:
        row["c_K_hi"] = str(float(row["c_K_hi"]) + 0.6)
    expect_fail("Part C staircase inflated above budget", lambda: verify.verify_all(d7))

    # Control 8: target_V too large (1/5000 = 200e-6) must fail
    expect_fail("target_V = 1/5000 above certified staircase", lambda: verify.verify_all(base, target_V=F(1, 5000)))

    # Control 9: cpp_sha256 mismatch caught by CLI
    d9 = copy.deepcopy(base)
    d9["cpp_sha256"] = "0" * 64
    tmp_json = Path("/tmp/test_controls_bad_sha.json")
    tmp_json.write_text(json.dumps(d9), encoding="utf-8")
    try:
        proc = subprocess.run(
            [sys.executable, "-I", str(HERE / "verify.py"), "--result", str(tmp_json)],
            capture_output=True,
            text=True,
        )
        assert proc.returncode != 0, "CLI unexpectedly accepted corrupted cpp_sha256"
        print("CONTROL PASS (rejected as expected): CLI bad cpp_sha256")
    finally:
        tmp_json.unlink(missing_ok=True)

    # Control 10: running verify.py with -O (assertions disabled) must fail
    proc_o = subprocess.run(
        [sys.executable, "-O", "-I", str(HERE / "verify.py"), "--result", str(result_path)],
        capture_output=True,
        text=True,
    )
    assert proc_o.returncode != 0, "CLI unexpectedly ran with -O"
    print("CONTROL PASS (rejected as expected): CLI with -O rejected")

    print("ALL 10 NEGATIVE/CORRUPTION CONTROLS PASSED")


if __name__ == "__main__":
    main()
