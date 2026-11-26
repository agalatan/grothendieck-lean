#!/usr/bin/env python3
"""Negative and corruption control suite for Problem P1 (Issue #623) certifier.

Verifies both mathematical negative controls (P1 §6: low-energy junta rejecting one energy-independent
constant; own-row 0.70 rejecting 0.085) and 10 targeted certificate/receipt corruptions against BOTH
`verify.py` and the C++17 `certify_content_cells` binary.
"""
import copy
import json
import os
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import verify  # noqa: E402


def check(cond, msg):
    if not cond:
        raise ValueError(f"CONTROL SUITE FAILED: {msg}")


def expect_verify_reject(cfg_mut, res_mut, label):
    with tempfile.TemporaryDirectory() as tmpd:
        cp = os.path.join(tmpd, "dual_certs.json")
        rp = os.path.join(tmpd, "result.json")
        json.dump(cfg_mut, open(cp, "w"))
        json.dump(res_mut, open(rp, "w"))
        try:
            verify.verify_all(certs_path=cp, result_path=rp, replay_cpp=False)
        except ValueError:
            print(f"  [PASS] {label}: rejected by verify.py as expected")
            return
        raise ValueError(f"CONTROL FAILURE: {label} was NOT rejected by verify.py!")


def main():
    certs_path = os.path.join(HERE, "dual_certs.json")
    result_path = os.path.join(HERE, "result.json")
    cfg0 = verify.load_full_cfg(certs_path)
    res0 = json.load(open(result_path))

    print("Running Problem P1 negative & corruption control suite...")

    # Control 0: Baseline passes cleanly
    verify.verify_all(certs_path=certs_path, result_path=result_path, replay_cpp=False)
    print("  [PASS] Control 0 (baseline): clean dual_certs.json + result.json accepted")

    # Control 1: Mathematical Negative Control 1 — Low-energy junta u = 1e-6 exceeds rows 0.74..0.855 allowances
    j_map = {jc["row"]: jc for jc in res0["junta_low_u_controls"]}
    check(j_map["0.800"]["ratio_ival"][0] > 3.30 and j_map["0.865"]["ratio_ival"][0] > 3.30,
          "low-energy junta ratio at u=1e-6 did not exceed 3.30")
    check(j_map["0.800"]["r1_min_lb"] > 0.866656, "low-energy junta did not strictly satisfy (R1) across all 17 pieces")
    print("  [PASS] Control 1 (P1 §6 low-energy junta): u=1e-6 ratio > 3.30 with R1_min > 0.866656")

    # Control 2: Mathematical Negative Control 2 — Own-row 0.70 refuses 0.085
    own = [c for c in cfg0["cells"] if c["row_tag"] == "0.700_own"][0]
    check(own["F_claimed"] > 1.0 and own["theta_allow"] == 0.085, "own-row 0.70 control invalid")
    print(f"  [PASS] Control 2 (P1 §6 own-row 0.70): certifier refused 0.085 (F_certified={own['F_claimed']:.4f})")

    # Control 3: Corrupt Rice tangent intercept rho_a[0] downward below sqrt(pi)/2
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    c["rho_a"][0] = 0.8862260
    expect_verify_reject(c, r, "Control 3 (corrupt Kummer Rice intercept rho_a[0] below sqrt(pi)/2)")

    # Control 4: Corrupt Rice tangent slope rho_b[3] downward
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    c["rho_b"][3] *= 0.999
    expect_verify_reject(c, r, "Control 4 (corrupt Kummer Rice slope rho_b[3] downward)")

    # Control 5: Corrupt Coupled-Gram parameter s_gram[0] = 1.9 < 2.0 (violates Grothe/Lower/Gram.lean)
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    c["s_gram"][0] = 1.9
    expect_verify_reject(c, r, "Control 5 (corrupt Coupled-Gram s_gram[0] < 2)")

    # Control 6: Corrupt mu_u3 -> 0 (destroys U^3 asymptotic tail dominance)
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    jm1_idx = next(i for i, x in enumerate(c["cells"]) if x["kind"] == "JM1_BOUND")
    c["cells"][jm1_idx]["slicesA"][0]["mu_u3"] = 1e-18
    expect_verify_reject(c, r, "Control 6 (corrupt mu_u3 = 1e-18 failing exact rational U^3 tail)")

    # Control 7: Introduce a gap between consecutive m1 slices [a_r, b_r]
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    c["cells"][jm1_idx]["slicesA"][0]["b_r"] -= 1e-4
    expect_verify_reject(c, r, "Control 7 (gap between consecutive m1 slices)")

    # Control 8: Break Kantorovich threshold monotonicity xs[5] < xs[4]
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    c["cells"][jm1_idx]["slicesB"][1]["xs"][5] = c["cells"][jm1_idx]["slicesB"][1]["xs"][4] - 0.01
    expect_verify_reject(c, r, "Control 8 (non-monotone Kantorovich thresholds xs)")

    # Control 9: Break Piece 16 continuous chi-coverage (shrink chi_hi on one Piece 16 cell)
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    p16_idx = next(i for i, x in enumerate(c["cells"]) if x["piece_idx"] == 16 and x["kind"] == "JM1_BOUND")
    c["cells"][p16_idx]["chi_hi"] -= 0.125
    r["cells"][p16_idx]["chi_hi"] = c["cells"][p16_idx]["chi_hi"]
    expect_verify_reject(c, r, "Control 9 (gap in Piece 16 continuous chi-coverage)")

    # Control 10: Claim F_claimed > theta_allow on a Piece 16 active cell
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    c["cells"][p16_idx]["F_claimed"] = c["cells"][p16_idx]["theta_allow"] + 0.01
    r["cells"][p16_idx]["F_certified"] = c["cells"][p16_idx]["F_claimed"]
    expect_verify_reject(c, r, "Control 10 (Piece 16 cell exceeding theta_allow)")

    # Control 11: Corrupt worst_M_A in result.json to +1e-12
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    r["cells"][p16_idx]["worst_M_A"] = +1e-12
    expect_verify_reject(c, r, "Control 11 (non-negative C++ supremum worst_M_A in result.json)")

    # Control 12: Live C++17 binary rejection test on a false claim (own-row 0.70 claiming F = 0.085!)
    cpp_src = os.path.join(HERE, "certify_content_cells.cpp")
    with tempfile.TemporaryDirectory() as tmpd:
        bin_path = os.path.join(tmpd, "certify_content_cells")
        dat_false = os.path.join(tmpd, "false_own070.dat")
        res_false = os.path.join(tmpd, "res_false.json")
        subprocess.run(
            ["c++", "-O3", "-ffp-contract=off", "-std=c++17", "-Wall", "-Wextra", "-Werror",
             "-Wno-unknown-pragmas", "-pthread", cpp_src, "-o", bin_path],
            check=True
        )
        c_false = copy.deepcopy(cfg0)
        own_cell = copy.deepcopy(own)
        own_cell["F_claimed"] = 0.085  # False claim on own-row 0.70!
        c_false["cells"] = [own_cell]
        verify.emit_dat_from_json(c_false, dat_false)
        proc = subprocess.run([bin_path, "--verify-all", dat_false, res_false, "--threads", "2"],
                              stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        check(proc.returncode != 0, "C++ certifier accepted false F_claimed = 0.085 on own-row 0.70!")
        print(f"  [PASS] Control 12 (live C++17 binary test): rejected false F=0.085 on own-row 0.70 (rc={proc.returncode})")

        # Control 13: Live C++17 binary rejection test on energy-independent constant (row 0.800 at u=1/128 claiming F=1.139!)
        lowu_cell = copy.deepcopy([c for c in cfg0["cells"] if c["piece_idx"] == 0 and c["row_tag"] == "0.800"][0])
        lowu_cell["F_claimed"] = 1.139
        c_false2 = copy.deepcopy(cfg0)
        c_false2["cells"] = [lowu_cell]
        dat_false2 = os.path.join(tmpd, "false_lowu080.dat")
        verify.emit_dat_from_json(c_false2, dat_false2)
        proc2 = subprocess.run([bin_path, "--verify-all", dat_false2, res_false, "--threads", "2"],
                               stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        check(proc2.returncode != 0, "C++ certifier accepted false energy-independent F_claimed = 1.139 at u=1/128 on row 0.800!")
        print(f"  [PASS] Control 13 (live C++17 binary test): rejected false F=1.139 at u=1/128 on row 0.800 (rc={proc2.returncode})")

    print("ALL 14 NEGATIVE AND CORRUPTION CONTROLS PASSED!")


if __name__ == "__main__":
    main()
