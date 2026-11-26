#!/usr/bin/env python3
"""Positive-fixture, mathematical negative-control, and field-corruption suite for Issue #728 (KAST).

Agent-ID: gemini-c1de
Refs: #728, #436, #177

Run under both:
  python3 -IB research/conjecture-K/code/all-sector-transfer-gemini-c1de/test_controls.py
  python3 -IB -O research/conjecture-K/code/all-sector-transfer-gemini-c1de/test_controls.py
"""
import copy
from fractions import Fraction as Q
import json
import os
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
if HERE not in sys.path:
    sys.path.insert(0, HERE)
import verify

CERT_PATH = os.path.join(HERE, "all_sector_transfer_cert.json")


def check(cond, msg):
    if not cond:
        raise RuntimeError(msg)


def expect_reject(label, fn, substr):
    try:
        fn()
    except ValueError as exc:
        msg = str(exc)
        check(substr in msg, f"{label}: expected {substr!r} in error {msg!r}")
        print(f"  [PASS] {label}: rejected with {msg!r}")
        return
    raise RuntimeError(f"{label}: unexpectedly ACCEPTED!")


def main():
    print("Running KAST (#728) positive-fixture & corruption control suite...")
    with open(CERT_PATH, "r") as f:
        base = json.load(f)

    # Control 0a: baseline acceptance in-process
    verify.verify_bundle(base, cert_path=CERT_PATH)
    print("  [PASS] Control 0a (baseline): clean all_sector_transfer_cert.json accepted")

    # Control 0b: standalone subprocess acceptance on temporary fixture under current -O flag
    with tempfile.TemporaryDirectory() as tmpd:
        tmp_cert = os.path.join(tmpd, "fixture_cert.json")
        with open(tmp_cert, "w") as f:
            json.dump(base, f, separators=(",", ":"))
        cmd = [sys.executable, "-IB"]
        if not __debug__:
            cmd.append("-O")
        cmd.extend([os.path.join(HERE, "verify.py"), tmp_cert])
        proc = subprocess.run(cmd, capture_output=True, text=True, check=False)
        check(proc.returncode == 0, f"Control 0b subprocess failed: {proc.stderr}")
    print("  [PASS] Control 0b (temp fixture): standalone subprocess verify.py accepted")

    # Control 1: >= 300 KB file size cap rejection
    with tempfile.TemporaryDirectory() as tmpd:
        big_cert = os.path.join(tmpd, "oversized.json")
        with open(big_cert, "w") as f:
            f.write(" " * 300_005)
        expect_reject(
            "Control 1 (>= 300 KB size cap)",
            lambda: verify.verify_bundle(base, cert_path=big_cert),
            "300,000 B cap",
        )

    # Control 2: non-monotone / gapped u_edges rejection
    def c2():
        b = copy.deepcopy(base)
        b["covers"]["peak_dplus"]["u_edges"][5] = b["covers"]["peak_dplus"]["u_edges"][6]
        verify.verify_bundle(b)
    expect_reject("Control 2 (u-grid collapse/gap)", c2, "u-grid not strictly increasing")

    # Control 3: dropped active V-cell rejection
    def c3():
        b = copy.deepcopy(base)
        b["covers"]["peak_signed"]["strips"][10]["cells"].pop()
        verify.verify_bundle(b)
    expect_reject("Control 3 (missing active V-cell)", c3, "cell count")

    # Control 4: underestimated alignment error E_cell (violating 7.1.6)
    def c4():
        b = copy.deepcopy(base)
        b["covers"]["peak_dplus"]["strips"][20]["e"] = 0
        verify.verify_bundle(b)
    expect_reject("Control 4 (underestimated 7.1.6 E_cell)", c4, "7.1.6 violation")

    # Control 5: underestimated tilted content cap C_max (violating 11.30/11.49/11.62)
    def c5():
        b = copy.deepcopy(base)
        b["covers"]["peak_dplus"]["strips"][20]["c"] = 10_000
        verify.verify_bundle(b)
    expect_reject("Control 5 (underestimated content cap C_max)", c5, "C_max underestimates")

    # Control 6: invalid S-lemma multiplier making A = A0 + lam <= 0
    def c6():
        b = copy.deepcopy(base)
        b["covers"]["peak_signed"]["strips"][-1]["cells"][0][2] = -10_000_000
        verify.verify_bundle(b)
    expect_reject("Control 6 (non-positive quadratic cost A <= 0)", c6, "non-positive quadratic cost")

    # Control 7: out-of-range convex weight kappa > 1
    def c7():
        b = copy.deepcopy(base)
        b["covers"]["peak_signed"]["strips"][-1]["cells"][0][1] = 11
        verify.verify_bundle(b)
    expect_reject("Control 7 (kappa > 1)", c7, "outside [0, 1]")

    # Control 8: mathematical negative control — using signed 11.61 below u = 2/125 (where 3 exempt boxes sit!)
    def c8():
        b = copy.deepcopy(base)
        b["covers"]["peak_signed"]["strips"][0]["cells"][0] = [1, 10, 0]
        verify.verify_bundle(b)
    expect_reject("Control 8 (signed 11.61 below u = 2/125)", c8, "signed 11.61 forbidden below u = 2/125")

    # Control 9: mathematical negative control — omitting (lambda - 1)*(49/625)*|nu|^2 on six-sector lambda > 1 cover
    def c9():
        b = copy.deepcopy(base)
        b["covers"]["scale_all6_signed"]["nu_pen"] = "0"
        verify.verify_bundle(b)
    expect_reject("Control 9 (missing (lambda-1) visible-trial nu_pen on scale_all6)", c9, "missing (lambda-1)*(49/625) nu_pen")

    # Control 10: understated strip_ub / worst_ub rejection
    def c10():
        b = copy.deepcopy(base)
        b["covers"]["peak_dplus"]["worst_ub_1e10"] = 10_000
        verify.verify_bundle(b)
    expect_reject("Control 10 (understated worst_ub)", c10, "stored worst_ub")

    # Control 11: gap between consecutive consumer t-slabs
    def c11():
        b = copy.deepcopy(base)
        slabs = b["consumer_slabs"]["eps_1891_2500_signed"]["slabs"]
        check(len(slabs) >= 2, "expected >= 2 slabs")
        slabs[1]["t_lo"] = str(Q(slabs[1]["t_lo"]) + Q(1, 100000))
        verify.verify_bundle(b)
    expect_reject("Control 11 (consumer t-slab gap)", c11, "t-gap between")

    # Control 12: consumer slab cap exceeding target_cap
    def c12():
        b = copy.deepcopy(base)
        b["consumer_slabs"]["eps_299_400_signed"]["slabs"][0]["cap_1e10"] = 7_132_630_000
        verify.verify_bundle(b)
    expect_reject("Control 12 (consumer cap >= target_cap)", c12, "vs target=")

    # Control 13: corrupt Row 8 benchmark in 8.13(ii) violating exact allowance identity
    def c13():
        with open(verify.CENTRAL_94_125_JSON, "r") as f:
            r8 = copy.deepcopy(json.load(f)["eps_94_125"]["rows"][7])
        r8["S_upper_accepted"] = str(Q(r8["S_upper_accepted"]) + Q(1, 10000))
        verify.verify_bundle(base, row8_override=r8)
    expect_reject("Control 13 (corrupt Row 8 8.13(ii) benchmark)", c13, "Row 8 exact allowance recomputation mismatch")

    # Control 14: corrupt Rice tangent slope in 2.12a foundation check
    expect_reject(
        "Control 14 (tightened invalid Rice slope)",
        lambda: verify.verify_bundle(base, rice_slope_override="432300000/1000000000"),
        "Rice slope upper bound",
    )

    # Control 15: zero-float & zero-assert static hygiene audit of verify.py
    with open(os.path.join(HERE, "verify.py"), "r") as f:
        src = f.read()
    for bad_tok in ("float(", "assert "):
        check(bad_tok not in src, f"Forbidden token {bad_tok!r} found in verify.py")
    print("  [PASS] Control 15 (static hygiene): verify.py has zero float() and zero assert statements")

    print("ALL 17 KAST POSITIVE-FIXTURE, MATHEMATICAL, AND CORRUPTION CONTROLS PASSED!")


if __name__ == "__main__":
    main()
