#!/usr/bin/env python3
"""Zero-float, zero-assert AST and corruption control suite for Issue #760 (STATUS tag KHOM).

Agent-ID: gemini-c1de
Refs: #760, #436, #177

Run under both:
  python3 -IB research/conjecture-K/code/homothety-consumers-gemini-c1de/test_controls.py
  python3 -IB -O research/conjecture-K/code/homothety-consumers-gemini-c1de/test_controls.py
"""
import ast
import copy
from fractions import Fraction as Q
import json
import os
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import verify  # noqa: E402


def check(cond, msg):
    if not cond:
        raise ValueError(f"CONTROL SUITE FAILED: {msg}")


def expect_reject(mut_fn, expected_substr, label, **kwargs):
    bundle = json.load(open(verify.DEFAULT_CERT))
    mut_fn(bundle)
    try:
        verify.verify_bundle(bundle, **kwargs)
    except ValueError as e:
        msg = str(e)
        check("exceeds 300,000 B" not in msg, f"{label} masked by file-size check: {msg}")
        check(
            expected_substr in msg,
            f"{label} rejected with unexpected message {msg!r} (expected {expected_substr!r})"
        )
        print(f"  [PASS] {label}: rejected with {expected_substr!r}")
        return
    raise ValueError(f"CONTROL FAILURE: {label} was NOT rejected!")


def audit_zero_float_zero_assert(py_path):
    src = open(py_path, "r").read()
    tree = ast.parse(src, filename=py_path)
    forbidden_name = "fl" + "oat"
    for node in ast.walk(tree):
        check(not isinstance(node, ast.Assert), f"Forbidden `assert` found in {py_path}")
        if isinstance(node, ast.Constant) and type(node.value).__name__ == forbidden_name:
            raise ValueError(f"Forbidden floating-point literal {node.value!r} in {py_path}")
        if isinstance(node, ast.Name) and node.id == forbidden_name:
            raise ValueError(f"Forbidden `{forbidden_name}` identifier in {py_path}")


def main():
    print("Running KHOM zero-float AST & negative/corruption control suite (18 controls)...")

    # Control 1: Static AST audit of BOTH verify.py and test_controls.py (zero float, zero assert)
    audit_zero_float_zero_assert(os.path.join(HERE, "verify.py"))
    audit_zero_float_zero_assert(os.path.abspath(__file__))
    print("  [PASS] Control 1 (AST audit): zero float literals, zero float(), zero assert in verify.py & test_controls.py")

    # Control 2: Baseline clean certificate accepted
    base_bundle = json.load(open(verify.DEFAULT_CERT))
    verify.verify_bundle(base_bundle, cert_path=verify.DEFAULT_CERT)
    print("  [PASS] Control 2 (baseline positive): clean homothety_consumers_cert.json accepted (< 300 KB)")

    # Control 3: >300 KB file-size limit guard
    with tempfile.NamedTemporaryFile("w", suffix=".json", delete=False) as tf:
        tf.write(" " * 300005)
        big_path = tf.name
    try:
        try:
            verify.verify_bundle(base_bundle, cert_path=big_path)
            raise ValueError("CONTROL FAILURE: >300 KB file was NOT rejected!")
        except ValueError as e:
            check("exceeds 300,000 B" in str(e), f"Unexpected >300 KB error: {e}")
            print("  [PASS] Control 3 (>300 KB guard): oversized certificate rejected")
    finally:
        os.remove(big_path)

    # Control 4: Invoking 11.61 (mode 0 or mode 1) on u_0 < 3/2000 (exempt-box ban!) -> rejected
    def mut_c4(b):
        b["peak_covers"]["peak_signed_exempt_free"]["strips"][0]["cells"][0] = [0, 0]

    expect_reject(mut_c4, "exempt-box ban", "Control 4 (invoking 11.61 below u_0 = 3/2000)")

    # Control 5: Invoking signed 11.61 (mode 1) below 2/125 in Track A (without 3.3a) -> rejected
    def mut_c5(b):
        cov = b["peak_covers"]["peak_signed_exempt_free"]
        # Find strip with 3/2000 <= u_lo < 2/125:
        u_edges = [(Q(cov["u_max"]) if x == "MAX" else Q(x)) for x in cov["u_edges"]]
        idx = next(i for i in range(len(u_edges) - 1) if Q(3, 2000) <= u_edges[i] < Q(2, 125))
        cov["strips"][idx]["cells"][0] = [1, 10, 0]

    expect_reject(mut_c5, "mode 1 not licensed", "Control 5 (signed 11.61 below 2/125 without 3.3a)")

    # Control 6: Perturbing algebraic Hermite polynomial U_7(y) downward -> rejected by exact SOS division check
    bad_u7 = [Q(1), Q(1, 2), Q(-1, 8), Q(1, 16), Q(-5, 128), Q(7, 256), Q(-21, 1024), Q(0)]
    expect_reject(lambda b: None, "not divisible by y^2 prod", "Control 6 (perturbed U_7 polynomial)", u7_override=bad_u7)

    # Control 7: Tightening Rice tangent slope below true rho'(1/10) -> rejected
    expect_reject(lambda b: None, "Rice slope", "Control 7 (false Rice tangent slope)", rice_slope_override=Q(43, 100))

    # Control 8: Using 3.5a buffered-Rice below t = sqrt(3*pi/14) ~ 0.8205 -> rejected
    b_hi_poly, _, _ = verify.build_and_verify_b_hi_poly()
    g_hi_poly = [b_hi_poly[0], b_hi_poly[1] - verify.P0] + b_hi_poly[2:]
    c8_obj = copy.deepcopy(base_bundle["track_b_35a_33a"]["c87_1891_2500"])
    c8_obj["t_covered"][0] = "4/5"
    c8_obj["slabs"][0]["t_lo"] = "4/5"
    try:
        verify.verify_consumer_slabs(
            "TrackB.c87_bad", c8_obj,
            (verify.EPS0, Q(500, 701), True, True, Q(4, 5), verify.R_HI),
            b_hi_poly, g_hi_poly,
        )
        raise ValueError("CONTROL FAILURE: Control 8 was NOT rejected!")
    except ValueError as e8:
        check("3.5a requires t_lo^2 >= (3/14)*pi" in str(e8), f"Control 8 unexpected error: {e8}")
        print("  [PASS] Control 8 (3.5a buffered-Rice below sqrt(3*pi/14)): rejected with '3.5a requires t_lo^2 >= (3/14)*pi'")

    # Control 9: Dropping odd W_0 ellipsoid bound (ell_base = None) when mu < lambda (dp < 0 => odd_rate > 0) -> rejected
    c9_cov = copy.deepcopy(base_bundle["peak_covers"]["peak_signed_exempt_free"])
    c9_cov["mu"] = "999/1000"
    c9_cov["dp"] = "-1/1000"
    c9_cov["ell_base"] = None
    try:
        verify.verify_homothety_cover("neg_dp_no_ell", c9_cov, {
            "u_max": Q(c9_cov["u_max"]), "u_tot": Q(c9_cov["u_tot"]),
            "mu": Q(999, 1000), "dp": Q(-1, 1000),
            "use_signed_1161": True, "use_33a": False, "ell_base": None,
        }, b_hi_poly, g_hi_poly)
        raise ValueError("CONTROL FAILURE: Control 9 was NOT rejected!")
    except ValueError as e9:
        check("requires ell_base W_0 bound" in str(e9), f"Control 9 unexpected error: {e9}")
        print("  [PASS] Control 9 (missing W_0 ellipsoid bound when mu < lambda): rejected with 'requires ell_base W_0 bound'")

    # Control 10: Omitting odd_add + dp_u surcharge on a dp < 0 cover -> rejected by stored strip ub check!
    c10_cov = copy.deepcopy(base_bundle["peak_covers"]["peak_signed_exempt_free"])
    c10_cov["mu"] = "99999/100000"
    c10_cov["dp"] = "-1/100000"
    c10_cov["ell_base"] = "1/10"
    try:
        verify.verify_homothety_cover("neg_dp_undercharged", c10_cov, {
            "u_max": Q(c10_cov["u_max"]), "u_tot": Q(c10_cov["u_tot"]),
            "mu": Q(99999, 100000), "dp": Q(-1, 100000),
            "use_signed_1161": True, "use_33a": False, "ell_base": Q(1, 10),
        }, b_hi_poly, g_hi_poly)
        raise ValueError("CONTROL FAILURE: Control 10 was NOT rejected!")
    except ValueError as e10:
        check("stored ub" in str(e10), f"Control 10 unexpected error: {e10}")
        print("  [PASS] Control 10 (undercharged strip ub on dp < 0 cover): rejected with 'stored ub'")

    # Control 11: Gap between consecutive t-slabs in Track A c813ii_94_125 -> rejected
    def mut_c11(b):
        slabs = b["track_a_pure_pc"]["c813ii_94_125"]["slabs"]
        check(len(slabs) >= 2, "expected >=2 slabs in c813ii_94_125")
        slabs[1]["t_lo"] = str(Q(slabs[1]["t_lo"]) + Q(1, 100000))

    expect_reject(mut_c11, "t-gap between", "Control 11 (t-gap between consecutive consumer slabs)")

    # Control 12: Truncating promised right endpoint of Track A c813ii_94_125 -> rejected
    def mut_c12(b):
        cobj = b["track_a_pure_pc"]["c813ii_94_125"]
        cobj["t_covered"][1] = "43/50"
        cobj["slabs"][-1]["t_hi"] = "43/50"

    expect_reject(mut_c12, "slab endpoints", "Control 12 (truncated promised consumer t-interval)")

    # Control 13: Corrupting an exterior row cap in 8.5's 1,773-cell cover -> rejected
    bad_ir = json.load(open(verify.INHERITED_ROWS_JSON))
    for r in bad_ir["rows"]:
        r["cap"] = "2"  # raises cap > 1.38, breaking exterior cells outside [0.8390, 0.8556]
    expect_reject(lambda b: None, "8.5 cell", "Control 13 (broken exterior cell in 1,773-cell 8.5 cover)",
                  inherited_rows_override=bad_ir)

    # Control 14: Gap in u_edges inside a 2D homothety cover -> rejected
    def mut_c14(b):
        cov = b["peak_covers"]["peak_dplus_exempt_free"]
        cov["u_edges"][2] = cov["u_edges"][3]

    expect_reject(mut_c14, "non-increasing u_edges", "Control 14 (collapsed/non-increasing u_edges)")

    # Control 15: Understated E_cell alignment cap -> rejected
    def mut_c15(b):
        b["peak_covers"]["peak_dplus_exempt_free"]["strips"][3]["e"] = 0

    expect_reject(mut_c15, "E_cell^2 <", "Control 15 (understated alignment cap E_cell)")

    # Control 16: Understated C_max content cap -> rejected
    def mut_c16(b):
        b["peak_covers"]["peak_dplus_exempt_free"]["strips"][3]["c"] = 0

    expect_reject(mut_c16, "C_max^2 <", "Control 16 (understated content cap C_max)")

    # Control 17: Out-of-range kap = 11/10 > 1 -> rejected
    def mut_c17(b):
        cov = b["peak_covers"]["peak_signed_exempt_free"]
        u_edges = [(Q(cov["u_max"]) if x == "MAX" else Q(x)) for x in cov["u_edges"]]
        idx = next(i for i in range(len(u_edges) - 1) if u_edges[i] >= Q(2, 125))
        cov["strips"][idx]["cells"][0][1] = 11

    expect_reject(mut_c17, "out of [0, 1]", "Control 17 (kap > 1 out-of-range multiplier)")

    # Control 18: Inflated slab cap_1e10 >= target_cap -> rejected
    def mut_c18(b):
        b["track_a_pure_pc"]["c87_1891_2500"]["slabs"][0]["cap_1e10"] = 7132668000  # > 500/701

    expect_reject(mut_c18, "vs target=", "Control 18 (slab cap exceeding target 500/701)")

    print("ALL 18 KHOM AST, MATHEMATICAL, AND CORRUPTION CONTROLS PASSED!")


if __name__ == "__main__":
    main()
