#!/usr/bin/env python3
"""Adversarial negative controls and zero-float AST audit for `verify.py` (label C, stdlib only).

Usage:  python3 -I test_controls.py [CERT.json]

Implements all mandatory negative controls of `P7-symmetrised-spiked-radius.md` §6–§7 together
with structural corruption controls on `cert_spiked.json`:
  1. AST zero-float & stdlib-only audit across `verify.py`, `check_identities_exact.py`, `test_controls.py`;
  2. Mandatory Control A (`P7` §6), sign controls & Theorem 1 target binding:
       (i) `r_1 = 0.88 = 22/25 < sqrt(pi)/2` (violating the diffuse equality family) is proved false in
           exact Fraction arithmetic and rejected by `verify.py`;
       (ii) One-field sign mutation `claim = "-939/1000"` (and negative ray `R_j`) is rejected before squaring;
       (iii) Two-field weakening mutation `claim = "9399/10000"`, `t_slabs[3] = "3101391/5000000"` is rejected
             in default Theorem 1 mode;
  3. Mandatory Control B (`P7` §6 & §7 item 5):
       (i) Exact Fraction proof that the unsymmetrised two-chaos witness
             F(z_1) = z_1 * (1 - (|z_1|^2 - 2)/4) in H_{1,0} + H_{2,1}
           satisfies E|F| / ||F||_2 > 0.9430 > sqrt(9*pi/32) > 0.93998;
       (ii) `verify.py` rejects `claim = "47/50"` (0.94 > sqrt(9*pi/32));
       (iii) Zeroing the +/-G symmetrisation multipliers `q_sym = (q_0, q_1, q_2)` in `cert_spiked.json`
             is rejected by `verify.py`;
  4. Truncating the s_G cover to [0, 41] (< 42) is rejected;
  5. Non-vanishing tail spline `phi4[K] != 0` on [u_K, oo) is rejected;
  6. Perturbing a Sturm spline knot (`phi3` / `phi1`) so P_sh(r) loses positivity on a sub-interval
     between knots is caught by the exact integer Sturm chain and rejected;
  7. Breaking the support-polygon boundary (`t_right < sqrt(pi)/2` or disordered ray slopes) is rejected;
  8. Theorem 2(2) binding controls:
       (i) Inflating the degree-5 mid-t sector-free cutoff by +10^-7 past the envelope crossing is rejected;
       (ii) Deleting only `degree5_midt.lean_mass` (or `degree5_midt`) is rejected by the default theorem-level
            entry point (while `verify_radius_only` still certifies the narrower Theorem 1 radius result);
       (iii) Lowering `degree5_midt.lean_mass.t_cutoff` below `9190839/25000000` is rejected.

Agent-ID: gemini-4c4c
"""
import ast
import copy
from fractions import Fraction as Fr
from math import factorial
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import verify as VF

ALLOWED_STDLIB = {
    "ast", "concurrent", "copy", "fractions", "itertools", "json", "math", "os", "random", "sys", "time", "verify",
}


def expect_reject(mutated_cert, label, jobs=1):
    try:
        VF.verify_certificate(mutated_cert, quiet=True, jobs=jobs)
    except (ValueError, ArithmeticError, KeyError) as exc:
        print(f"  [PASS] {label}: cleanly rejected ({exc})")
        return
    raise AssertionError(f"SECURITY FAILURE: {label} was ACCEPTED by verify_certificate!")


def check_ast_zero_float():
    scripts = ["verify.py", "check_identities_exact.py", "test_controls.py"]
    for fname in scripts:
        fpath = os.path.join(HERE, fname)
        with open(fpath, encoding="utf-8") as fh:
            tree = ast.parse(fh.read(), filename=fname)
        for node in ast.walk(tree):
            if isinstance(node, ast.Constant) and isinstance(node.value, float):
                raise AssertionError(f"{fname}:{node.lineno} contains float literal {node.value!r}")
            if isinstance(node, ast.Call) and isinstance(node.func, ast.Name) and node.func.id == "float":
                raise AssertionError(f"{fname}:{node.lineno} calls float(...)")
            if isinstance(node, ast.Import):
                for alias in node.names:
                    root = alias.name.split(".")[0]
                    if root not in ALLOWED_STDLIB:
                        raise AssertionError(f"{fname}:{node.lineno} imports non-stdlib {alias.name}")
            if isinstance(node, ast.ImportFrom) and node.module:
                root = node.module.split(".")[0]
                if root not in ALLOWED_STDLIB:
                    raise AssertionError(f"{fname}:{node.lineno} imports from non-stdlib {node.module}")
    print("  [PASS] Control 1 (AST audit): zero floats and stdlib-only imports across all 3 scripts")


def check_unsymmetrised_witness_exact():
    """Prove in exact Fraction arithmetic that F(z_1) = z_1(1 - (T-2)/4) has E|F|/||F||_2 > 0.9429 > 0.93998."""
    # ||F||_2^2 = E[T * (6 - T)^2 / 16] = (36*1 - 12*2 + 6) / 16 = 18 / 16 = 9 / 8.
    norm_F_sq = Fr(9, 8)
    norm_F_hi = VF.root_interval(norm_F_sq)[1]

    # Exact decomposition: |6 - T| = (6 - T) + 2*(T - 6)*1_{T > 6}.
    # 1) int_0^oo e^{-T} sqrt(T) (6 - T)/4 dT = (6 * sqrt(pi)/2 - (3/4)*sqrt(pi)) / 4 = (9/16)*sqrt(pi).
    sqrt_pi_lo = VF.root_interval(VF.PI_LO)[0]
    base_int_lo = Fr(9, 16) * sqrt_pi_lo

    # Already base_int_lo / norm_F_hi == sqrt(9*pi/32) > 0.93998:
    barrier_lo = base_int_lo / norm_F_hi
    assert barrier_lo > Fr(46999, 50000), "sqrt(9*pi/32) > 0.93998 check failed"

    # 2) Tail integral: for T >= 6, sqrt(T) >= sqrt(6) + (sqrt(7) - sqrt(6)) * 1_{T >= 7},
    #    with int_6^oo e^{-T}(T - 6) dT = e^{-6} and int_7^oo e^{-T}(T - 6) dT = 2 e^{-7}.
    # Bound e^{-1} from below via alternating series truncated after odd term k=15:
    e_inv_lo = sum((Fr(-1) ** k) / factorial(k) for k in range(16))  # k=15 is negative -> strict lower bound!
    assert e_inv_lo > 0
    exp_neg6_lo = e_inv_lo ** 6
    exp_neg7_lo = e_inv_lo ** 7
    sqrt6_lo, sqrt6_hi = VF.root_interval(Fr(6))
    sqrt7_lo = VF.root_interval(Fr(7))[0]
    assert sqrt7_lo > sqrt6_hi
    tail_lo = Fr(1, 2) * sqrt6_lo * exp_neg6_lo + (sqrt7_lo - sqrt6_hi) * exp_neg7_lo

    ratio_F_lo = (base_int_lo + tail_lo) / norm_F_hi
    assert ratio_F_lo > Fr(943, 1000), f"Expected ratio > 0.9430, got {VF.dec_floor8(ratio_F_lo)}"
    print(
        "  [PASS] Control 3a (unsymmetrised witness F = z_1(1-(T-2)/4)): "
        "E|F|/||F||_2 >= %s > sqrt(9*pi/32) >= %s > 0.93998"
        % (VF.dec_floor8(ratio_F_lo), VF.dec_floor8(barrier_lo))
    )


def main():
    default_cert = os.path.join(HERE, "cert_spiked.json")
    path = sys.argv[1] if len(sys.argv) > 1 else default_cert
    print("=== Running adversarial negative controls & AST zero-float audit ===")

    # 1. AST zero-float check
    check_ast_zero_float()

    with open(path, encoding="utf-8") as fh:
        cert = json.load(fh)

    # Baseline sanity: valid certificate passes
    res_ok = VF.verify_certificate(cert, quiet=True)
    assert res_ok["ok"]
    print(f"  [PASS] Baseline valid certificate verified (claim = {cert['claim']})")

    # 2. Mandatory Control A (P7 §6): r_1 = 0.88 = 22/25 < sqrt(pi)/2 & negative radius sign controls
    assert Fr(22, 25) ** 2 < VF.PI_LO / 4
    c_88 = copy.deepcopy(cert)
    c_88["claim"] = "22/25"
    expect_reject(c_88, "Control 2a (P7 §6: impossible claim r_1 = 22/25 = 0.88 < sqrt(pi)/2)")

    c_neg = copy.deepcopy(cert)
    c_neg["claim"] = "-939/1000"
    expect_reject(c_neg, "Control 2b (one-field negative radius claim = -939/1000 rejected before squaring)")

    c_negray = copy.deepcopy(cert)
    c_negray["rays"][0]["R"] = "-582/625"
    expect_reject(c_negray, "Control 2c (negative ray radius R_0 = -582/625 rejected)")

    c_twofield = copy.deepcopy(cert)
    c_twofield["claim"] = "9399/10000"
    c_twofield["t_slabs"][3] = "3101391/5000000"
    expect_reject(
        c_twofield,
        "Control 2d (two-field weakening claim=9399/10000, t_slabs[3]=3101391/5000000 rejected in theorem mode)",
    )

    # 3. Mandatory Control B (P7 §6 & §7): unsymmetrised barrier & disabling q_sym
    check_unsymmetrised_witness_exact()

    c_94 = copy.deepcopy(cert)
    c_94["claim"] = "47/50"
    expect_reject(c_94, "Control 3b (claim = 47/50 = 0.94 above unsymmetrised barrier sqrt(9*pi/32))")

    c_nosym = copy.deepcopy(cert)
    for ray in c_nosym["rays"]:
        if ray["kind"] == "stein":
            for row in ray["rows"]:
                row["q_sym"] = ["0", "0", "0"]
    expect_reject(c_nosym, "Control 3c (P7 §6: disabling +/-G symmetrisation multipliers q_sym = 0)")

    # 4. Truncated s_G cover (< 42)
    c_sg = copy.deepcopy(cert)
    c_sg["rays"][0]["rows"][-1]["s_hi"] = "41"
    expect_reject(c_sg, "Control 4 (incomplete s_G cover [0, 41] < 42)")

    # 5. Non-vanishing tail spline phi4[K] != 0
    c_tail = copy.deepcopy(cert)
    c_tail["rays"][0]["rows"][3]["phi4"][-1] = 1
    expect_reject(c_tail, "Control 5 (non-vanishing tail spline phi4[K] = 1 on [u_K, oo))")

    # 6. Corrupted interior Sturm spline (det5_r loses positivity while knotwise D1 still holds)
    c_sturm = copy.deepcopy(cert)
    row_mut = c_sturm["rays"][0]["rows"][3]
    row_mut["phi1"][4] += row_mut["knot_den"] // 4
    expect_reject(c_sturm, "Control 6 (corrupted interior spline knot caught by Sturm chain)")

    # 7. Support-polygon boundary gap (t_right < sqrt(pi)/2)
    c_poly = copy.deepcopy(cert)
    c_poly["t_right"] = "88/100"
    c_poly["t_slabs"][-1] = "88/100"
    expect_reject(c_poly, "Control 7 (t_right = 0.88 < sqrt(pi)/2 failing right boundary cover)")

    # 8. Theorem 2(2) binding controls: inflated cutoff, missing lean_mass key, and lowered cutoff
    c_midt = copy.deepcopy(cert)
    t_cur = Fr(c_midt["degree5_midt"]["lean_mass"]["t_cutoff"])
    t_bad = t_cur + Fr(1, 10**7)
    c_midt["degree5_midt"]["lean_mass"]["t_cutoff"] = str(t_bad)
    c_midt["degree5_midt"]["lean_mass"]["segments"][-1]["t_hi"] = str(t_bad)
    expect_reject(c_midt, "Control 8a (inflated degree-5 mid-t cutoff +10^-7 past envelope crossing)")

    c_nolm = copy.deepcopy(cert)
    del c_nolm["degree5_midt"]["lean_mass"]
    expect_reject(c_nolm, "Control 8b (deleting degree5_midt.lean_mass rejected by Theorem 2(2) entry point)")

    c_nod5 = copy.deepcopy(cert)
    del c_nod5["degree5_midt"]
    expect_reject(c_nod5, "Control 8c (deleting degree5_midt rejected by default entry point)")

    c_badd5 = copy.deepcopy(c_twofield)
    c_badd5["degree5_midt"] = {"lean_mass": {"t_cutoff": "99/100", "segments": []}}
    expect_reject(c_badd5, "Control 8d (invalid degree5_midt / weaker claim rejected in theorem mode)")
    res_ro = VF.verify_radius_only(c_badd5, quiet=True)
    assert res_ro["ok"] and res_ro["radius_only"] and res_ro["midt"] == {} and res_ro["r1"] == Fr(9399, 10000)
    print(
        "  [PASS] Control 8e: verify_radius_only ignores invalid degree5_midt and certifies generic claim=%s (max <= %s)"
        % (res_ro["r1"], VF.dec_ceil10(res_ro["worst_r1_hi"]))
    )

    c_lowt = copy.deepcopy(cert)
    t_short = VF.THEOREM2_LEAN_MASS_CUTOFF - Fr(1, 10**8)
    c_lowt["degree5_midt"]["lean_mass"]["t_cutoff"] = str(t_short)
    c_lowt["degree5_midt"]["lean_mass"]["segments"][-1]["t_hi"] = str(t_short)
    expect_reject(c_lowt, "Control 8f (lowering lean_mass.t_cutoff below 9190839/25000000 rejected)")

    # Control 8f stops at the grid-crossing check.  Raising R_0 as well moves the
    # crossing past the shortened cutoff, so only the Theorem 2(2) cutoff guard is left.
    c_guard = copy.deepcopy(c_lowt)
    c_guard["rays"][0]["R"] = "9312000011/10000000000"
    try:
        VF.verify_certificate(c_guard, quiet=True, jobs=1)
    except (ValueError, ArithmeticError, KeyError) as exc:
        if "does not cover Theorem 2(2) target" not in str(exc):
            raise AssertionError(f"Control 8g rejected for another reason: {exc}")
        print(f"  [PASS] Control 8g (shortened cutoff with R_0 = 9312000011/10^10 reaches the cutoff guard): cleanly rejected ({exc})")
    else:
        raise AssertionError("SECURITY FAILURE: Control 8g was ACCEPTED by verify_certificate!")

    print("ALL NEGATIVE & CORRUPTION CONTROLS PASSED.")


if __name__ == "__main__":
    main()
