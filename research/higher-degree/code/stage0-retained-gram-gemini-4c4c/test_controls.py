#!/usr/bin/env python3
"""24-check zero-float, zero-assert adversarial corruption & mathematical negative-control suite for S0RG."""

from concurrent.futures import ProcessPoolExecutor
import copy
from decimal import Decimal
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import time

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import verify as V


def expect_fail(fn, label):
    try:
        fn()
    except ValueError as exc:
        return str(exc)
    raise RuntimeError(f"CONTROL FAILED TO REJECT: {label}")


def _run_integration_control(task):
    kind, cert_doc, repo_root_str = task
    repo_root = Path(repo_root_str)
    c = copy.deepcopy(cert_doc)
    by_id = {r["id"]: r for r in c["rows"]}

    if kind == "drop_defenders_g84_80":
        by_id["g84_0.80"]["eval_mode"] = "plain_e21"
        by_id["g84_0.80"]["cap_upper"] = "7/20"
        expect_fail(
            lambda: V.verify_certificate(c, repo_root, only_row="g84_0.80", jobs=1, quiet=True, _test_hypothesis_override=True),
            "Dropping retained defenders on g84_0.80 must fail < 7/20",
        )
        return kind

    if kind == "drop_defenders_theta_g84_84":
        by_id["g84_0.84"]["eval_mode"] = "plain_e21"
        by_id["g84_0.84"]["cap_upper"] = "1"
        expect_fail(
            lambda: V.verify_certificate(c, repo_root, only_row="g84_0.84", jobs=1, quiet=True, _test_hypothesis_override=True),
            "Dropping retained defenders on g84_0.84 must fail < 1 (theta > 0)",
        )
        return kind

    if kind == "drop_cmm_gA_80":
        by_id["gA_0.80"]["eval_mode"] = "no_cmm_5sc"
        by_id["gA_0.80"]["cap_upper"] = "7/20"
        expect_fail(
            lambda: V.verify_certificate(c, repo_root, only_row="gA_0.80", jobs=1, quiet=True, _test_hypothesis_override=True),
            "Dropping C_-- >= 0 on gA_0.80 must fail < 7/20",
        )
        return kind

    if kind == "false_tight_cap_g84_80":
        by_id["g84_0.80"]["cap_upper"] = "1/5"
        expect_fail(
            lambda: V.verify_certificate(c, repo_root, only_row="g84_0.80", jobs=1, quiet=True, _test_hypothesis_override=True),
            "False tight cap 1/5 = 0.20 on g84_0.80 must fail",
        )
        return kind

    if kind == "tamper_stored_bracket_gC_80":
        by_id["gC_0.80"]["certified"]["retained_all_dim"] = [0, 1]
        expect_fail(
            lambda: V.verify_certificate(c, repo_root, only_row="gC_0.80", jobs=1, quiet=True),
            "Tampered stored certificate bracket on gC_0.80 must fail",
        )
        return kind

    raise ValueError(f"Unknown control kind: {kind}")


def main():
    t0 = time.time()
    repo_root = HERE.parents[3]
    cert_path = HERE / "cert_stage0_gram.json"
    V.check(cert_path.is_file(), f"Missing {cert_path}")
    cert_doc = json.loads(cert_path.read_text(encoding="utf-8"), parse_float=Decimal, parse_int=int)

    passed = 0

    # 1. Positive AST self-audit on verify.py, make_cert.py, test_controls.py + algebraic & Wick identities:
    V.audit_no_float_no_assert([HERE / "verify.py", HERE / "make_cert.py", HERE / "test_controls.py"])
    V.verify_gram_and_sos_identities()
    passed += 1
    print("  [1/24] Positive AST audit & Q[i] Gram/SOS/Wick-projection/Hessian identities: OK")

    # 2-4. Temporary file AST negative controls (float literal, float() call, assert statement):
    with tempfile.TemporaryDirectory() as tmpd:
        p_flit = Path(tmpd) / "bad_flit.py"
        p_flit.write_text("x = 1 / 2\ny = " + chr(48) + "." + chr(53) + "\n", encoding="utf-8")
        expect_fail(lambda: V.audit_no_float_no_assert([p_flit]), "AST float literal")
        passed += 1
        print("  [2/24] AST audit rejects float literal: OK")

        p_fcall = Path(tmpd) / "bad_fcall.py"
        p_fcall.write_text("x = " + "flo" + "at(3)\n", encoding="utf-8")
        expect_fail(lambda: V.audit_no_float_no_assert([p_fcall]), "AST float identifier")
        passed += 1
        print("  [3/24] AST audit rejects float(...) identifier: OK")

        p_ass = Path(tmpd) / "bad_assert.py"
        p_ass.write_text("ass" + "ert 1 == 1\n", encoding="utf-8")
        expect_fail(lambda: V.audit_no_float_no_assert([p_ass]), "AST assert statement")
        passed += 1
        print("  [4/24] AST audit rejects assert statement: OK")

    # 5. Dropping C_-- >= 0 admits the rational 5-scalar counterexamples (14/5 > 25/9 and 3 > 8/3):
    expect_fail(
        lambda: V.verify_gram_and_sos_identities(gram_cone_flags={"include_c_mm": False}),
        "Dropping C_-- >= 0 from 5-scalar Gram cone",
    )
    passed += 1
    print("  [5/24] Dropping C_-- >= 0 admits counterexample (9/16,1,9/16,3/4,3/4) and is rejected: OK")

    # 6. SHA-256 provenance tampering on rows_all.lines:
    c6 = copy.deepcopy(cert_doc)
    old_h = c6["provenance"]["g84"]["sha256"]
    c6["provenance"]["g84"]["sha256"] = ("0" if old_h[0] != "0" else "1") + old_h[1:]
    expect_fail(lambda: V.verify_certificate(c6, repo_root, only_row="g84_0.80", jobs=1, quiet=True), "SHA-256 tamper")
    passed += 1
    print("  [6/24] SHA-256 provenance tampering on rows_all.lines rejected: OK")

    # 7. Rationalisation tolerance > 5*10^{-11} tampering:
    c7 = copy.deepcopy(cert_doc)
    for r in c7["rows"]:
        if r["id"] == "g84_0.80":
            r["l"] = str(V.parse_frac(r["l"]) + V.parse_frac("1/1000000000"))
    expect_fail(lambda: V.verify_certificate(c7, repo_root, only_row="g84_0.80", jobs=1, quiet=True), "Rationalisation drift")
    passed += 1
    print("  [7/24] Rationalisation drift > 5*10^{-11} from rows_all.lines rejected: OK")

    # 8. Non-decimal denominator tampering:
    c8 = copy.deepcopy(cert_doc)
    for r in c8["rows"]:
        if r["id"] == "g84_0.80":
            r["sig"] = "1/3"
    expect_fail(lambda: V.verify_certificate(c8, repo_root, only_row="g84_0.80", jobs=1, quiet=True), "Denominator not dividing 10^10")
    passed += 1
    print("  [8/24] Non-decimal denominator (not dividing 10^10) rejected: OK")

    # 9-11. Shifted-polar ellipse non-singularity & game-weight guards:
    base_row = copy.deepcopy([r for r in cert_doc["rows"] if r["id"] == "g84_0.80"][0])

    r9 = copy.deepcopy(base_row)
    r9["bA"] = "-1/10"
    r9["bB"] = "-2/5"
    expect_fail(lambda: V.integrate_and_certify_row(r9), "Violating -b_A > |b_B|/sqrt(2)")
    passed += 1
    print("  [9/24] Violating ellipse positivity -b_A > |b_B|/sqrt(2) rejected: OK")

    r10 = copy.deepcopy(base_row)
    r10["bA"] = "-6/5"
    expect_fail(lambda: V.integrate_and_certify_row(r10), "Violating 1 + b_A > 0")
    passed += 1
    print("  [10/24] Violating origin positivity 1 + b_A > 0 rejected: OK")

    r11 = copy.deepcopy(base_row)
    r11["eta"] = "9/10"
    expect_fail(lambda: V.integrate_and_certify_row(r11), "Violating 0 < eta < e1 < 1")
    passed += 1
    print("  [11/24] Invalid game weights (eta >= e1) rejected: OK")

    # 12-18. Fast structural binding controls (all 4 B2 corruptions + swapped weights + Wick subtraction + Hessian 1/2):
    c_dup = copy.deepcopy(cert_doc)
    c_dup["rows"] = [copy.deepcopy(c_dup["rows"][0]) for _ in range(9)]
    expect_fail(lambda: V.verify_certificate(c_dup, repo_root, only_row="gC_0.80", jobs=1, quiet=True), "Nine copies of gC_0.80")
    passed += 1
    print("  [12/24] Nine copies of one benchmark row rejected before integration: OK")

    c_swap = copy.deepcopy(cert_doc)
    for r in c_swap["rows"]:
        if r["id"] == "g83_0.80":
            r["e1"] = "21/25"
            r["eta"] = "319/1250"
    expect_fail(lambda: V.verify_certificate(c_swap, repo_root, only_row="gC_0.80", jobs=1, quiet=True), "Swapped g83 -> g84 game weights")
    passed += 1
    print("  [13/24] Swapped g83 -> g84 game weights rejected directly against rows_all.lines: OK")

    c_loose_cap = copy.deepcopy(cert_doc)
    for r in c_loose_cap["rows"]:
        if r["id"] == "gA_0.80":
            r["cap_upper"] = "1"
    expect_fail(lambda: V.verify_certificate(c_loose_cap, repo_root, only_row="gA_0.80", jobs=1, quiet=True), "Loosened cap_upper=1 on gA_0.80")
    passed += 1
    print("  [14/24] Loosened cap_upper='1' on gA_0.80 rejected even under --only-row: OK")

    c_disable_sos = copy.deepcopy(cert_doc)
    for r in c_disable_sos["rows"]:
        if r["id"] == "gA_0.80":
            r["require_sos_pos"] = False
    expect_fail(lambda: V.verify_certificate(c_disable_sos, repo_root, only_row="gA_0.80", jobs=1, quiet=True), "require_sos_pos=False")
    passed += 1
    print("  [15/24] Certificate override require_sos_pos=False rejected even under --only-row: OK")

    c_flip_lam1 = copy.deepcopy(cert_doc)
    lam1_lo, lam1_hi = c_flip_lam1["rows"][0]["certified"]["sos_lams"][0]
    c_flip_lam1["rows"][0]["certified"]["sos_lams"][0] = [-lam1_hi, -lam1_lo]
    expect_fail(lambda: V.verify_certificate(c_flip_lam1, repo_root, only_row="gC_0.80", jobs=1, quiet=True), "Flipped lam_1 sign in certified.sos_lams")
    passed += 1
    print("  [16/24] Flipped lam_1 sign in certified.sos_lams rejected: OK")

    expect_fail(
        lambda: V.verify_gram_and_sos_identities(gram_cone_flags={"include_c_mm": True, "corrupt_wick_linear": True}),
        "Omitting Wick linear subtraction breaks H_{2,1} orthogonality & contraction identities",
    )
    passed += 1
    print("  [17/24] Corrupting Wick normal-ordering subtraction rejected by physical moment check: OK")

    expect_fail(
        lambda: V.verify_gram_and_sos_identities(gram_cone_flags={"include_c_mm": True, "corrupt_hessian_half": True}),
        "Extraneous 1/2 factor before B(dh) breaks |A_+ + dh| + |A_- + dh| Taylor & (P+-Q)/2 normalisation",
    )
    passed += 1
    print("  [18/24] Corrupting Hessian B(dh) by factor 1/2 rejected by 1-direction Taylor check: OK")

    # 19-23. Full from-scratch integration mathematical negative & corruption controls (run in parallel):
    int_tasks = [
        ("drop_defenders_g84_80", cert_doc, str(repo_root)),
        ("drop_defenders_theta_g84_84", cert_doc, str(repo_root)),
        ("drop_cmm_gA_80", cert_doc, str(repo_root)),
        ("false_tight_cap_g84_80", cert_doc, str(repo_root)),
        ("tamper_stored_bracket_gC_80", cert_doc, str(repo_root)),
    ]
    max_w = min(len(int_tasks), os.cpu_count() or 1, 5)
    with ProcessPoolExecutor(max_workers=max_w) as ex:
        done_kinds = list(ex.map(_run_integration_control, int_tasks))
    V.check(len(done_kinds) == 5, "Expected all 5 integration negative controls to complete")
    passed += 5
    print("  [19/24] Mathematical control: dropping retained defenders on g84_0.80 violates < 7/20: OK")
    print("  [20/24] Mathematical control: dropping retained defenders on g84_0.84 violates < 1 (theta > 0): OK")
    print("  [21/24] Mathematical control: dropping C_-- >= 0 on gA_0.80 violates < 7/20: OK")
    print("  [22/24] Mathematical control: false overly tight cap 1/5 = 0.20 on g84_0.80 rejected: OK")
    print("  [23/24] Certificate bracket tampering on gC_0.80 rejected: OK")

    # 24. Check outward display across zero, on-grid endpoints, and an actual benchmark CLI row.
    V.check(V.fmt_interval((-1, 1), 5) == "[-0.00001,+0.00001]", "Endpoint next to zero rounded inward")
    V.check(V.fmt_interval((-V.S, V.S), 5) == "[-1.00000,+1.00000]", "Exact endpoint changed")
    V.check(V.fmt_interval((-V.S + 1, -1), 5) == "[-1.00000,+0.00000]", "Negative interval rounded inward")
    proc = subprocess.run(
        [sys.executable, "-IB", "-O", str(HERE / "verify.py"), "--only-row", "g84_0.70", "--jobs", "1"],
        capture_output=True,
        text=True,
        check=False,
    )
    V.check(proc.returncode == 0, f"Subprocess -IB -O verify.py failed: {proc.stderr}")
    V.check("ret_all_dim=[+0.14223,+0.15596]" in proc.stdout, "Printed g84_0.70 enclosure changed")
    passed += 1
    print("  [24/24] Subprocess python3 -IB -O CLI execution passed: OK")

    elapsed_ms = int((time.time() - t0) * 1000)
    V.check(passed == 24, f"Expected 24 passed controls, got {passed}")
    print(f"ALL {passed}/24 S0RG ADVERSARIAL & MATHEMATICAL CONTROLS PASSED ({elapsed_ms} ms).")


if __name__ == "__main__":
    main()
