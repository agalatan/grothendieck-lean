#!/usr/bin/env python3
"""Adversarial negative-control & mutation test suite for KADS458 (#458):
Verifies that BOTH `verify.py` (Sturm) and `verify_bernstein.py` (Bernstein + symbolic ring)
deterministically reject every class of soundness violation across:
  - AST self-audits (forbidden float literals, complex literals, float() calls, bare assert statements);
  - Structural constants (RB_OUTER <= sqrt(2), GRAM_COEFF_V7 < 7/16, SIGMA_SQ_COEFF_V7 < 21/2, M6_REAL_V7, M6_CPLX_H43);
  - Shifted second-chaos certificate mutations (var_claim_sharp, cubic_mixed_claim, t_row coverage gaps,
    slab v_lo/v_hi gaps, unsound hole u_min, unsound u_max, unsound v_top cap, m_1 interval gaps on t=0 /
    connected / two-branch slabs, compact-support integral failure, negative lam/rpos/kap, Hankel 2x2 PSD failure,
    Gram M2/M3 interior & tail failures, vertex expectation bound failure, secant tangent failure);
  - Seventh-chaos V_7 / H_{4,3} certificate mutations (slab gaps, boundary zeros, non-PD M_mat / Mw_mat,
    negative tail_xi, sigma_1 cone failure, Gram T3 envelope failure, M3 failure, vertex bound failure,
    tail B < 2, phase transfer failure).

Agent-ID: gemini-8732
Task: #458 (tag KADS458)
Usage:
    python3 -IB -O test_controls.py
"""
import ast
import copy
from fractions import Fraction as Fr
import json
import pathlib
import sys
import time

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import check_identities_exact as CID
import verify as V1
import verify_bernstein as VB


def require(cond, msg="negative control check failed"):
    if not cond:
        raise ValueError(msg)


ALLOWED_MODULES = {"ast", "copy", "fractions", "json", "pathlib", "sys", "time",
                   "check_identities_exact", "verify", "verify_bernstein"}
FORBIDDEN_CALLS = {"fl" + "oat", "comp" + "lex"}


def self_audit_ast():
    src = pathlib.Path(__file__).read_text(encoding="utf-8")
    tree = ast.parse(src, filename=str(pathlib.Path(__file__)))
    for node in ast.walk(tree):
        if isinstance(node, ast.Assert):
            raise ValueError(f"Bare assert at line {node.lineno}")
        if isinstance(node, ast.Constant) and type(node.value).__name__ in FORBIDDEN_CALLS:
            raise ValueError(f"Float/complex literal {node.value!r} at line {node.lineno}")
        if isinstance(node, ast.Import):
            for alias in node.names:
                require(alias.name in ALLOWED_MODULES, f"Disallowed import: {alias.name}")
        if isinstance(node.func if isinstance(node, ast.Call) else None, ast.Name):
            require(node.func.id not in FORBIDDEN_CALLS, f"Forbidden call {node.func.id} at line {node.lineno}")


def must_fail_both(cert_mut, label):
    failed_v1 = False
    try:
        V1.verify_certificate_dict(cert_mut, quiet=True)
    except Exception:
        failed_v1 = True
    require(failed_v1, f"verify.py FAILED TO REJECT mutation: {label}")

    failed_vb = False
    try:
        VB.verify_certificate_dict_bernstein(cert_mut, quiet=True)
    except Exception:
        failed_vb = True
    require(failed_vb, f"verify_bernstein.py FAILED TO REJECT mutation: {label}")


def must_fail_fn(fn, label):
    ok = False
    try:
        fn()
    except Exception:
        ok = True
    require(ok, f"Expected failure NOT triggered for: {label}")


def main():
    t0 = time.monotonic_ns()
    self_audit_ast()
    V1.self_audit_ast()
    VB.self_audit_ast()
    CID.self_audit_ast()

    cert_sh = json.loads((HERE / "cert_shifted_q_458.json").read_text(encoding="utf-8"))
    cert_v7 = json.loads((HERE / "cert_v7_458.json").read_text(encoding="utf-8"))

    # Baseline positive check:
    V1.verify_certificate_dict(cert_sh, quiet=True)
    VB.verify_certificate_dict_bernstein(cert_sh, quiet=True)
    V1.verify_certificate_dict(cert_v7, quiet=True)
    VB.verify_certificate_dict_bernstein(cert_v7, quiet=True)

    n_tests = 0

    # 1. Structural constant soundness controls (8 controls):
    structural_cases = [
        (lambda: V1.verify_shifted_structural_constants(rb_outer=Fr(1414213, 1000000)), "RB_OUTER < sqrt(2)"),
        (lambda: V1.verify_hole_lower_bound(Fr(3, 2), Fr(105, 100)), "unsound hole u_min too large"),
        (lambda: V1.verify_hole_lower_bound(Fr(1), Fr(1, 100)), "positive u_min on v_lo = 1"),
        (lambda: V1.verify_vtop_cap(Fr(1), Fr(6, 5), Fr(2)), "unsound v_top cap too low"),
        (lambda: V1.verify_structural_constants_v7(gram_c=Fr(43, 100)), "GRAM_COEFF_V7 = 0.43 < 7/16"),
        (lambda: V1.verify_structural_constants_v7(sig_c=Fr(52, 5)), "SIGMA_SQ_COEFF_V7 = 10.4 < 21/2"),
        (lambda: V1.verify_structural_constants_v7(m6_r=V1.M6_REAL_V7 + 1), "M6_REAL_V7 + 1"),
        (lambda: V1.verify_structural_constants_v7(m6_c=V1.M6_CPLX_H43 + 1), "M6_CPLX_H43 + 1"),
    ]
    for fn, lbl in structural_cases:
        must_fail_fn(fn, lbl)
        n_tests += 1

    # 2. Shifted second-chaos certificate adversarial mutations (26 dual controls = 52 checks):
    sh_mutations = []

    def add_sh(label, mut_fn):
        m = copy.deepcopy(cert_sh)
        mut_fn(m)
        sh_mutations.append((m, label))

    add_sh("bad kind", lambda m: m.__setitem__("kind", "wrong"))
    add_sh("inflated var_claim_sharp", lambda m: m.__setitem__("var_claim_sharp", "9/25"))
    add_sh("inflated cubic_mixed_claim", lambda m: m.__setitem__("cubic_mixed_claim", "4/5"))
    add_sh("first t != 0", lambda m: m["t_rows"][0].__setitem__("t", "1/100"))
    add_sh("last t != 16/5", lambda m: m["t_rows"][-1].__setitem__("t", "31/10"))
    add_sh("non-increasing t_knots", lambda m: m["t_rows"][2].__setitem__("t", m["t_rows"][1]["t"]))
    add_sh("slab gap in v_lo", lambda m: m["t_rows"][1]["slabs"][1].__setitem__("v_lo", "3/5"))
    add_sh("slab top < 2", lambda m: m["t_rows"][1]["slabs"][-1].__setitem__("v_hi", "19/10"))
    add_sh("u_max^2 < v_hi", lambda m: m["t_rows"][1]["slabs"][0].__setitem__("u_max", "1/2"))
    add_sh("t=0 m_1 gap", lambda m: m["t_rows"][0]["slabs"][1]["cells"][0].__setitem__("a", "1/10"))
    add_sh("connected m_1 gap", lambda m: m["t_rows"][1]["slabs"][0]["cells"][0].__setitem__("b", "0"))
    add_sh("two-branch pos gap", lambda m: m["t_rows"][1]["slabs"][-1]["cells"][-1].__setitem__("b", "13/10"))
    add_sh("two-branch neg gap", lambda m: m["t_rows"][1]["slabs"][-1]["cells"][0].__setitem__("a", "-13/10"))
    add_sh("broken p0 compact support integral", lambda m: m["t_rows"][0]["slabs"][0]["cells"][0]["p0"].__setitem__(5, m["t_rows"][0]["slabs"][0]["cells"][0]["p0"][5] + 1))
    add_sh("broken g2 compact support integral", lambda m: m["t_rows"][0]["slabs"][0]["cells"][0]["g2"].__setitem__(10, m["t_rows"][0]["slabs"][0]["cells"][0]["g2"][10] + 1))
    add_sh("negative lam knot", lambda m: m["t_rows"][0]["slabs"][0]["cells"][0]["lam"].__setitem__(3, -1))
    add_sh("negative rpos knot", lambda m: m["t_rows"][0]["slabs"][0]["cells"][0]["rpos"].__setitem__(4, -1))
    add_sh("negative kap knot", lambda m: m["t_rows"][0]["slabs"][0]["cells"][0]["kap"].__setitem__(5, -1))
    add_sh("Hankel 2x2 PSD failure (drop alpha)", lambda m: m["t_rows"][0]["slabs"][0]["cells"][0]["alpha"].__setitem__(8, -10**8))
    add_sh("Gram M2 failure (drop g0, g0_2)", lambda m: (m["t_rows"][0]["slabs"][0]["cells"][0]["scalars"].__setitem__("g0", "0"), m["t_rows"][0]["slabs"][0]["cells"][0]["scalars"].__setitem__("g0_2", "1/1000000000")))
    add_sh("Gram M3 interior failure (drop c0)", lambda m: m["t_rows"][0]["slabs"][0]["cells"][0]["scalars"].__setitem__("c0", "0"))
    add_sh("Gram M3 tail failure (c6 = 0)", lambda m: m["t_rows"][0]["slabs"][0]["cells"][0]["scalars"].__setitem__("c6", "0"))
    add_sh("negative tail kapL", lambda m: m["t_rows"][0]["slabs"][0]["cells"][0]["scalars"].__setitem__("kapL", "-1/100"))
    add_sh("anchor u0 outside (-RB_OUTER, RB_OUTER)", lambda m: m["t_rows"][0]["slabs"][0]["cells"][0]["scalars"].__setitem__("u0", "3/2"))
    add_sh("tightened cell bound below vertex ev", lambda m: m["t_rows"][0]["slabs"][0]["cells"][0].__setitem__("bound", "1/2"))
    add_sh("unsound secant tangent A too high", lambda m: m["secants"][4].__setitem__("A", "9/10"))
    add_sh("secant endpoint violation (drop A)", lambda m: m["secants"][4].__setitem__("A", "1/10"))

    for m, lbl in sh_mutations:
        must_fail_both(m, f"shifted: {lbl}")
        n_tests += 2

    # 3. Seventh-chaos V_7 / H_{4,3} certificate adversarial mutations (16 dual controls = 32 checks):
    v7_mutations = []

    def add_v7(label, mut_fn):
        m = copy.deepcopy(cert_v7)
        mut_fn(m)
        v7_mutations.append((m, label))

    add_v7("slab gap in rows_v7", lambda m: m["rows_v7"][1].__setitem__("s_lo", "1/2"))
    add_v7("phi2[K] != 0", lambda m: m["rows_v7"][0]["phi2"].__setitem__(-1, 5))
    add_v7("psi4[0] != 0", lambda m: m["rows_v7"][0]["psi4"].__setitem__(0, 5))
    add_v7("psi4[K] != 0", lambda m: m["rows_v7"][0]["psi4"].__setitem__(-1, 5))
    add_v7("broken G2(r_K) == 0", lambda m: m["rows_v7"][0]["phi2"].__setitem__(0, m["rows_v7"][0]["phi2"][0] + 10))
    add_v7("non-PD M_mat", lambda m: m["rows_v7"][0].__setitem__("M_mat", ["1/100", "1", "1/100"]))
    add_v7("non-PD Mw_mat", lambda m: m["rows_v7"][0].__setitem__("Mw_mat", ["1/100", "1", "1/100"]))
    add_v7("negative tail_xi", lambda m: m["rows_v7"][0]["tail_xi"].__setitem__(0, "-1/1000"))
    add_v7("sigma_1 cone violation (inflate lB)", lambda m: m["rows_v7"][1]["lB"].__setitem__(10, 10**12))
    add_v7("Gram T3 violation (drop tau3)", lambda m: m["rows_v7"][1]["tau3"][5].__setitem__(0, -10**12))
    add_v7("M3 interior violation (drop lam0)", lambda m: m["rows_v7"][1]["lam"].__setitem__(0, "-10"))
    add_v7("lam3 == 0 tail failure", lambda m: m["rows_v7"][1]["lam"].__setitem__(3, "0"))
    add_v7("row bound below vertex ev", lambda m: m["rows_v7"][2].__setitem__("bound", "1/2"))
    add_v7("v7_tail_B < 2", lambda m: m.__setitem__("v7_tail_B", "1"))
    add_v7("claim_v7_global == 1", lambda m: m.__setitem__("claim_v7_global", "1"))
    add_v7("claim_h43_low too small", lambda m: m.__setitem__("claim_h43_low", "1/2"))

    for m, lbl in v7_mutations:
        must_fail_both(m, f"v7: {lbl}")
        n_tests += 2

    dt_ms = (time.monotonic_ns() - t0) // 1_000_000
    print(f"ALL {n_tests} ADVERSARIAL NEGATIVE CONTROLS REJECTED DETERMINISTICALLY IN {dt_ms} ms (0 floats, 0 asserts)!")


if __name__ == "__main__":
    main()
