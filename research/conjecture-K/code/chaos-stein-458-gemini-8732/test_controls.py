#!/usr/bin/env python3
"""Adversarial negative, corruption, structural-constant, and AST zero-float/zero-assert
controls for `chaos-stein-458-gemini-8732` (Issue #458, tag KCS458).

Agent-ID: gemini-8732
Usage:
    python3 -IB test_controls.py

Arithmetic discipline:
  - 100% Python 3 standard library (`ast`, `copy`, `fractions`, `json`, `pathlib`, `subprocess`, `sys`, `time`).
  - Zero floating-point operations or literals anywhere in this file (`audit_zero_floats_and_asserts()`).
  - Zero `assert` statements (`-O`-safe `require(...)` throughout).
"""
import ast
import copy
from fractions import Fraction as Fr
import json
import pathlib
import subprocess
import sys
import time

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import check_identities_exact as CIE
import verify as V1
import verify_bernstein as VB
import verify_ibp_cone as VIC


def require(cond, msg="control suite check failed"):
    if not cond:
        raise ValueError(msg)


def expect_reject(fn, desc):
    try:
        res = fn()
    except (ValueError, VB.VerificationError, KeyError):
        return
    if isinstance(res, dict) and ("ok" in res) and (not res["ok"]):
        return
    if res is False:
        return
    raise ValueError("NEGATIVE CONTROL FAILED (accepted invalid input): " + desc)


def audit_zero_floats_and_asserts():
    fl_nm = "fl" + "oat"
    cx_nm = "comp" + "lex"
    scripts = (
        "verify_ibp_cone.py",
        "verify.py",
        "verify_bernstein.py",
        "check_identities_exact.py",
        "test_controls.py",
    )
    for nm in scripts:
        src = (HERE / nm).read_text(encoding="utf-8")
        tree = ast.parse(src)
        for node in ast.walk(tree):
            if isinstance(node, ast.Assert):
                raise ValueError(f"assert statement found in {nm} (must use -O-safe require(...))")
            if isinstance(node, ast.Constant) and type(node.value).__name__ in (fl_nm, cx_nm):
                raise ValueError(f"Float/complex literal found in {nm}")
            if isinstance(node, ast.Name) and node.id in (fl_nm, cx_nm):
                raise ValueError(f"Identifier {node.id} found in {nm}")
            if (
                isinstance(node, ast.Attribute)
                and isinstance(node.value, ast.Name)
                and node.value.id == "time"
                and node.attr in ("time", "perf_counter", "process_time")
            ):
                raise ValueError(f"Float clock call time.{node.attr} found in {nm}")
    return len(scripts)


def main():
    t0 = time.monotonic_ns()

    # 1. Static AST audit across all 5 stdlib scripts:
    n_ast = audit_zero_floats_and_asserts()
    print(f"[1] Zero-float & zero-assert AST audit across {n_ast} stdlib scripts: PASS")

    # 2. Part I (`verify_ibp_cone.py`) positive & negative controls:
    res_ibp = VIC.verify_all(quiet=True)
    require(res_ibp["R_cap"] == Fr(21, 20), "unexpected R_cap")
    require(res_ibp["KAPPA_0"] == Fr(1, 5900) and res_ibp["KAPPA_1"] == Fr(1, 1475), "unexpected KAPPA_0/1")
    require(res_ibp["CHI_0"] == Fr(1, 8300) and res_ibp["CHI_1"] == Fr(1, 2075), "unexpected CHI_0/1")
    # Negative control on Bernstein positivity: P_13(t) shifted down by -1 fails on [0, 25/16]:
    ok_bad_bern, _ = VIC.bernstein_positive_on_segment([Fr(-1), Fr(1)], Fr(0), Fr(2))
    require(not ok_bad_bern, "Bernstein segment checker accepted negative polynomial")
    n_ibp = 2
    print(f"[2] Part I oscillation-preserving OU cone controls ({n_ibp} checks): PASS")

    # 3. Part II (`cert_v3_458.json`) row-level, structural-constant, cover, & downstream controls:
    cert_v3 = json.loads((HERE / "cert_v3_458.json").read_text(encoding="utf-8"))
    rows_v3 = cert_v3["rows"]
    low_v3 = rows_v3[3]
    high_v3 = rows_v3[-1]
    n_v3_ctrl = 0

    def check_both_v3_rows(base_row, mut_fn, desc):
        nonlocal n_v3_ctrl
        r1 = copy.deepcopy(base_row)
        mut_fn(r1)
        expect_reject(lambda: V1.verify_v3_row(r1), "Sturm V_3: " + desc)
        r2 = copy.deepcopy(base_row)
        mut_fn(r2)
        expect_reject(lambda: VB.verify_v3_row_bernstein(r2), "Bernstein V_3: " + desc)
        n_v3_ctrl += 2

    check_both_v3_rows(low_v3, lambda r: r["lam"].__setitem__(3, "0"), "lam3 == 0")
    check_both_v3_rows(low_v3, lambda r: r.__setitem__("lam_nu2", "0"), "lam_nu2 == 0")
    check_both_v3_rows(low_v3, lambda r: r.__setitem__("m_ker", ["1", "2", "1"]), "M_ker not PD")
    check_both_v3_rows(low_v3, lambda r: r.__setitem__("m_w", ["1", "2", "1"]), "M_w not PD")
    check_both_v3_rows(low_v3, lambda r: r.__setitem__("eta_high", ["1/1000", "1/100", "1/10"]), "positive lam_e3 > 0")
    check_both_v3_rows(low_v3, lambda r: r.__setitem__("eta_high", ["-1", "1/100", "1/100"]), "4*lam_e4*delta_m11 < lam_e3^2")
    check_both_v3_rows(low_v3, lambda r: r.__setitem__("sqrt_m_ub", "1/1000"), "36*sqrt_m_ub^2 < s_hi")
    check_both_v3_rows(high_v3, lambda r: r.__setitem__("r_anch", "1"), "r_anch^2 < s_lo")
    check_both_v3_rows(low_v3, lambda r: r["phi2"].__setitem__(0, r["phi2"][0] + 1), "broken G_2(r_K)")
    check_both_v3_rows(low_v3, lambda r: r["phi3"].__setitem__(0, r["phi3"][0] + 1), "broken G_3(r_K)")
    check_both_v3_rows(low_v3, lambda r: r["phi2"].__setitem__(-1, 1), "nonzero phi2(r_K)")
    check_both_v3_rows(low_v3, lambda r: r["psi4"].__setitem__(0, 1), "nonzero psi4(0)")
    check_both_v3_rows(low_v3, lambda r: r["psi7"].__setitem__(0, 1), "nonzero psi7(0)")
    check_both_v3_rows(low_v3, lambda r: r["Ae"].__setitem__(5, 0), "Ae[5] == 0")
    check_both_v3_rows(low_v3, lambda r: r["t2"].__setitem__(5, 0), "t2[5] == 0")
    check_both_v3_rows(low_v3, lambda r: r["alpha_op"].__setitem__(5, 0), "alpha_op[5] == 0")
    check_both_v3_rows(low_v3, lambda r: r["xe"].__setitem__(5, -1), "xe[5] < 0")
    check_both_v3_rows(low_v3, lambda r: r["xte"].__setitem__(5, -1), "xte[5] < 0")
    check_both_v3_rows(low_v3, lambda r: r["tail_xi"].__setitem__(0, "-1"), "tail_xi[0] < 0")
    check_both_v3_rows(low_v3, lambda r: (r["t2"].__setitem__(5, 1), r["lB"].__setitem__(5, r["knot_den"])), "D_B dip")
    check_both_v3_rows(low_v3, lambda r: r["nu0_sq"][5].__setitem__(0, -r["knot_den"]), "D_nu0 dip")
    check_both_v3_rows(low_v3, lambda r: r["op_c"][5].__setitem__(0, -r["knot_den"]), "D_op dip")
    check_both_v3_rows(low_v3, lambda r: r["tau3"][5].__setitem__(0, r["tau3"][5][0] - r["knot_den"]), "tau3 dip")
    check_both_v3_rows(low_v3, lambda r: r["m_ker"].__setitem__(0, "1/1000000000"), "M_2 dip")
    check_both_v3_rows(low_v3, lambda r: r["lam"].__setitem__(0, str(Fr(r["lam"][0]) - Fr(1, 10))), "interior M_3 dip")
    check_both_v3_rows(low_v3, lambda r: r["lam"].__setitem__(2, str(Fr(r["lam"][2]) - Fr(1))), "tail M_3 dip")
    check_both_v3_rows(low_v3, lambda r: r.__setitem__("sig_hi", "1/100"), "sig_hi^2 < s_hi^3")
    check_both_v3_rows(high_v3, lambda r: r.__setitem__("sig_lo", "1"), "sig_lo^2 < s_lo^3")
    check_both_v3_rows(low_v3, lambda r: r.__setitem__("x_lo", "1/10"), "nonzero x_lo when s_lo <= 36")
    check_both_v3_rows(high_v3, lambda r: r.__setitem__("x_lo", "999/1000"), "36 + 54 x_lo^2 > s_lo")
    check_both_v3_rows(low_v3, lambda r: r.__setitem__("bound", str(Fr(r["bound"]) - Fr(1, 100))), "overclaimed V_3 bound")

    for attr, bad_val, desc in [
        ("GRAM_COEFF_V3", Fr(3, 20), "GRAM_COEFF_V3 < 3/16"),
        ("SIGMA_SQ_COEFF_V3", Fr(1), "SIGMA_SQ_COEFF_V3 < 3/2"),
        ("OP_COEFF_V3", Fr(2), "OP_COEFF_V3 < 3"),
        ("WICK6_NEG_COEFF_V3", 5000, "WICK6_NEG_COEFF_V3 > 4320"),
        ("NU2_T3_COEFF_V3", 8, "NU2_T3_COEFF_V3 < 9"),
        ("ETA3_COEFF_V3", 7, "ETA3_COEFF_V3 != 8"),
        ("ETA4_M2_COEFF_V3", 10, "ETA4_M2_COEFF_V3 < 12"),
    ]:
        orig = getattr(V1, attr)
        try:
            setattr(V1, attr, bad_val)
            expect_reject(lambda: V1.verify_v3_row(low_v3), "Sturm V_3 const: " + desc)
            expect_reject(lambda: VB.verify_v3_row_bernstein(low_v3), "Bern V_3 const: " + desc)
            n_v3_ctrl += 2
        finally:
            setattr(V1, attr, orig)

    def check_both_v3_certs(mut_fn, desc, generic=True):
        nonlocal n_v3_ctrl
        c1 = copy.deepcopy(cert_v3)
        mut_fn(c1)
        expect_reject(lambda: V1.verify_certificate_dict(c1, generic=generic, quiet=True), "Sturm V_3 cert: " + desc)
        c2 = copy.deepcopy(cert_v3)
        mut_fn(c2)
        expect_reject(lambda: VB.verify_certificate_dict_bernstein(c2, generic=generic, quiet=True), "Bern V_3 cert: " + desc)
        n_v3_ctrl += 2

    check_both_v3_certs(lambda c: c["rows"][3].__setitem__("s_lo", "2"), "V_3 slab gap")
    check_both_v3_certs(lambda c: c["rows"][-1].__setitem__("s_hi", "89"), "incomplete [0, 90] cover")
    check_both_v3_certs(lambda c: c.__setitem__("sharp_hi_s", "17/3"), "sharp_hi_s not at row boundary")
    check_both_v3_certs(lambda c: c.__setitem__("claim_real", "79/100"), "claim_real below worst bound")
    check_both_v3_certs(lambda c: c.__setitem__("sharp_hi_claim_real", "4/5"), "sharp_hi_claim_real >= sqrt(2/pi)")
    check_both_v3_certs(lambda c: c.__setitem__("claim_complex", "88/100"), "claim_complex too small")
    check_both_v3_certs(lambda c: c.__setitem__("sharp_hi_claim_complex", "89/100"), "sharp_hi_claim_complex >= sqrt(pi)/2")
    check_both_v3_certs(lambda c: c.__setitem__("claim_real", "4/5"), "default mode rejects 4/5 > 1997/2500", generic=False)

    # Downstream +1 ulp overclaims:
    pi_lo, pi_hi = V1.verify_pi_bounds()
    ds_base = cert_v3["downstream"]
    rho0 = Fr(cert_v3["claim_complex"])
    for field, step_up, desc in [
        ("deg7_1403_cap", Fr(1, 10**10), "perturbed deg7_1403_cap"),
        ("deg5_1402_cap", Fr(1, 10**10), "perturbed deg5_1402_cap"),
        ("d5_418a_cutoff", Fr(1, 10**6), "+10^-6 overclaim on 4.18a"),
        ("d5_418e_parseval", Fr(1, 10**8), "+10^-8 overclaim on 4.18e Parseval"),
        ("d5_418e_sixth_moment", Fr(1, 10**8), "+10^-8 overclaim on 4.18e sixth-moment"),
        ("d5_418e_lean_mass", Fr(1, 10**8), "+10^-8 overclaim on 4.18e Lean mass"),
        ("d5_418f_spectral_24_pure", Fr(1, 10**5), "+10^-5 overclaim on 4.18f pure"),
        ("d5_418f_spectral_24_kng", Fr(1, 10**5), "+10^-5 overclaim on 4.18f kng"),
    ]:
        ds_mut = copy.deepcopy(ds_base)
        ds_mut[field] = str(Fr(ds_base[field]) + step_up)
        expect_reject(lambda d=ds_mut: V1.verify_downstream(d, rho0, pi_lo, pi_hi), desc)
        n_v3_ctrl += 1

    print(f"[3] Part II enhanced V_3 & downstream controls (Sturm + Bernstein + 8-var): {n_v3_ctrl} checks ALL REJECTED")

    # 4. Part III (`cert_v5_458.json`) row-level, structural-constant, & top-level controls:
    cert_v5 = json.loads((HERE / "cert_v5_458.json").read_text(encoding="utf-8"))
    row_v5 = cert_v5["rows_v5"][2]
    n_v5_ctrl = 0

    def check_both_v5_rows(base_row, mut_fn, desc):
        nonlocal n_v5_ctrl
        r1 = copy.deepcopy(base_row)
        mut_fn(r1)
        expect_reject(lambda: V1.verify_v5_row(r1), "Sturm V_5: " + desc)
        r2 = copy.deepcopy(base_row)
        mut_fn(r2)
        expect_reject(lambda: VB.verify_v5_row_bernstein(r2), "Bernstein V_5: " + desc)
        n_v5_ctrl += 2

    check_both_v5_rows(row_v5, lambda r: r["lam"].__setitem__(3, "0"), "V_5 lam3 == 0")
    check_both_v5_rows(row_v5, lambda r: r.__setitem__("m_ker", ["1", "2", "1"]), "V_5 M_ker not PD")
    check_both_v5_rows(row_v5, lambda r: r.__setitem__("m_w", ["1", "2", "1"]), "V_5 M_w not PD")
    check_both_v5_rows(row_v5, lambda r: r["phi2"].__setitem__(0, r["phi2"][0] + 1), "V_5 broken G_2(r_K)")
    check_both_v5_rows(row_v5, lambda r: r["psi4"].__setitem__(0, 1), "V_5 nonzero psi4(0)")
    check_both_v5_rows(row_v5, lambda r: (r["t2"].__setitem__(5, 1), r["lB"].__setitem__(5, r["knot_den"])), "V_5 D_B dip")
    check_both_v5_rows(row_v5, lambda r: r["tau3"][5].__setitem__(0, r["tau3"][5][0] - r["knot_den"]), "V_5 tau3 dip")
    check_both_v5_rows(row_v5, lambda r: r["m_ker"].__setitem__(0, "1/1000000000"), "V_5 M_2 dip")
    check_both_v5_rows(row_v5, lambda r: r["lam"].__setitem__(0, str(Fr(r["lam"][0]) - Fr(1, 10))), "V_5 M_3 dip")
    check_both_v5_rows(row_v5, lambda r: r.__setitem__("bound", str(Fr(r["bound"]) - Fr(1, 50))), "overclaimed V_5 bound")

    for attr, bad_val, desc in [
        ("GRAM_COEFF_V5", Fr(5, 20), "GRAM_COEFF_V5 < 5/16"),
        ("SIGMA_SQ_COEFF_V5", Fr(4), "SIGMA_SQ_COEFF_V5 < 5"),
        ("M6_REAL_V5", Fr(404895764), "M6_REAL_V5 < 404895765"),
        ("M6_CPLX_H32", Fr(59735933), "M6_CPLX_H32 < 59735934"),
    ]:
        orig = getattr(V1, attr)
        try:
            setattr(V1, attr, bad_val)
            expect_reject(lambda: V1.verify_v5_row(row_v5), "Sturm V_5 const: " + desc)
            expect_reject(lambda: VB.verify_v5_row_bernstein(row_v5), "Bern V_5 const: " + desc)
            n_v5_ctrl += 2
        finally:
            setattr(V1, attr, orig)

    def check_both_v5_certs(mut_fn, desc, generic=True):
        nonlocal n_v5_ctrl
        c1 = copy.deepcopy(cert_v5)
        mut_fn(c1)
        expect_reject(lambda: V1.verify_certificate_dict(c1, generic=generic, quiet=True), "Sturm V_5 cert: " + desc)
        c2 = copy.deepcopy(cert_v5)
        mut_fn(c2)
        expect_reject(lambda: VB.verify_certificate_dict_bernstein(c2, generic=generic, quiet=True), "Bern V_5 cert: " + desc)
        n_v5_ctrl += 2

    check_both_v5_certs(lambda c: c["rows_v5"][2].__setitem__("s_lo", "3"), "V_5 slab gap")
    check_both_v5_certs(lambda c: c["rows_v5"][-1].__setitem__("s_hi", "4649"), "incomplete [0, 4650] cover")
    check_both_v5_certs(lambda c: c["rows_v5"][0].__setitem__("m6_cap", "400000000"), "understated V_5 m6_cap")
    check_both_v5_certs(lambda c: c["rows_h32_slice"][-1].__setitem__("s_hi", "38"), "incomplete H_{3,2} slice cover")
    check_both_v5_certs(lambda c: c["rows_h32_slice"][0].__setitem__("m6_cap", "100000000"), "understated H_{3,2} m6_cap")
    check_both_v5_certs(lambda c: c.__setitem__("claim_real_v5", "4/5"), "overclaimed claim_real_v5")
    check_both_v5_certs(lambda c: c.__setitem__("claim_h32_low", "4/5"), "overclaimed claim_h32_low")
    check_both_v5_certs(lambda c: c.__setitem__("claim_h32_global", "999/1000"), "overclaimed claim_h32_global")
    check_both_v5_certs(lambda c: c.__setitem__("claim_real_v5", "99/100"), "default rejects 99/100 > 983/1000", generic=False)

    print(f"[4] Part III V_5 & H_{{3,2}} controls (Sturm + Bernstein + 8-var): {n_v5_ctrl} checks ALL REJECTED")

    # 5. Full exact identity & nodal suite + isolated `-IB -O` CLI subprocess parity across all 4 verifiers:
    CIE.main(["--quiet"])
    for scr in ("verify_ibp_cone.py", "verify.py", "verify_bernstein.py", "check_identities_exact.py"):
        cp = subprocess.run(
            [sys.executable, "-IB", "-O", str(HERE / scr), "--quiet"],
            capture_output=True,
            text=True,
            check=False,
        )
        require(cp.returncode == 0, f"-IB -O subprocess failed on {scr}: {cp.stderr}")
    print("[5] Isolated `python3 -IB -O` CLI parity across all 4 verifiers: PASS")

    tot = n_ast + n_ibp + n_v3_ctrl + n_v5_ctrl + 4
    dt_ms = (time.monotonic_ns() - t0) // 1_000_000
    print(f"ALL {tot} ADVERSARIAL, AST & -O PARITY CONTROLS PASSED  [{dt_ms} ms, zero floats, zero asserts]")


if __name__ == "__main__":
    main()
