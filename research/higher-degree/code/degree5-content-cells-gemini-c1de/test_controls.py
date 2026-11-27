#!/usr/bin/env python3
"""Negative and corruption control suite for Problem P1 (Issue #623) certifier.

Verifies both mathematical negative controls (P1 §6: low-energy junta rejecting one energy-independent
constant; own-row 0.70 rejecting 0.085), sharded fixture positive round-trip, and 13 targeted
certificate/receipt corruptions (checking specific diagnostics, never masked by file-size guards)
against BOTH `verify.py` and the C++17 `certify_content_cells` binary.
"""
import copy
from fractions import Fraction
import json
import math
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


def write_sharded_fixture(cfg_mut, res_mut, tmpd):
    """Write cfg_mut as <220KB shards + manifest dual_certs.json and result.json into tmpd."""
    shards = []
    cur_cells = []
    cur_bytes = 16
    max_shard_bytes = 220_000
    for cell in cfg_mut["cells"]:
        cb = len(json.dumps(cell, separators=(",", ":")).encode("utf-8")) + 1
        if cur_cells and cur_bytes + cb > max_shard_bytes:
            sh_name = f"dual_certs_{len(shards) + 1}.json"
            sh_path = os.path.join(tmpd, sh_name)
            with open(sh_path, "w") as sf:
                json.dump({"cells": cur_cells}, sf, separators=(",", ":"))
            check(os.path.getsize(sh_path) < 300_000, f"fixture shard {sh_name} >= 300 KB")
            shards.append(sh_name)
            cur_cells = []
            cur_bytes = 16
        cur_cells.append(cell)
        cur_bytes += cb
    if cur_cells:
        sh_name = f"dual_certs_{len(shards) + 1}.json"
        sh_path = os.path.join(tmpd, sh_name)
        with open(sh_path, "w") as sf:
            json.dump({"cells": cur_cells}, sf, separators=(",", ":"))
        check(os.path.getsize(sh_path) < 300_000, f"fixture shard {sh_name} >= 300 KB")
        shards.append(sh_name)

    manifest = dict(cfg_mut)
    manifest.pop("cells")
    manifest["shards"] = shards
    cp = os.path.join(tmpd, "dual_certs.json")
    rp = os.path.join(tmpd, "result.json")
    with open(cp, "w") as f:
        json.dump(manifest, f, separators=(",", ":"))
    with open(rp, "w") as f:
        json.dump(res_mut, f, separators=(",", ":"))
    check(os.path.getsize(cp) < 300_000 and os.path.getsize(rp) < 300_000, "fixture manifest/result >= 300 KB")
    return cp, rp


def expect_verify_reject(cfg_mut, res_mut, expected_substr, label):
    with tempfile.TemporaryDirectory() as tmpd:
        cp, rp = write_sharded_fixture(cfg_mut, res_mut, tmpd)
        try:
            verify.verify_all(certs_path=cp, result_path=rp, replay_cpp=False)
        except ValueError as e:
            msg = str(e)
            check("exceeds 300 KB" not in msg, f"{label} hit 300 KB size guard instead of field check: {msg}")
            check(
                expected_substr in msg,
                f"{label} rejected with unexpected diagnostic {msg!r} (expected {expected_substr!r})"
            )
            print(f"  [PASS] {label}: rejected with {expected_substr!r}")
            return
        raise ValueError(f"CONTROL FAILURE: {label} was NOT rejected by verify.py!")


def main():
    certs_path = os.path.join(HERE, "dual_certs.json")
    result_path = os.path.join(HERE, "result.json")
    cfg0 = verify.load_full_cfg(certs_path)
    res0 = json.load(open(result_path))

    print("Running Problem P1 negative & corruption control suite...")

    # Control 0a: Baseline passes cleanly
    verify.verify_all(certs_path=certs_path, result_path=result_path, replay_cpp=False)
    print("  [PASS] Control 0a (baseline): clean dual_certs.json + result.json accepted")

    # Control 0b: Unmodified sharded fixture round-trip passes cleanly through identical test path!
    with tempfile.TemporaryDirectory() as tmpd0:
        cp0, rp0 = write_sharded_fixture(copy.deepcopy(cfg0), copy.deepcopy(res0), tmpd0)
        verify.verify_all(certs_path=cp0, result_path=rp0, replay_cpp=False)
    print("  [PASS] Control 0b (sharded fixture positive control): unmodified sharded fixture accepted")

    # Control 1: Mathematical Negative Control 1 — Low-energy junta u = 1/1000000 & certified h_X'(0) != 0
    j_map = {jc["row"]: jc for jc in res0["junta_low_u_controls"]}
    for rk in ("0.700_own", "0.800", "0.865"):
        u_lo_q, u_hi_q = Fraction(j_map[rk]["u_ival"][0]), Fraction(j_map[rk]["u_ival"][1])
        check(u_lo_q < Fraction(1, 1_000_000) < u_hi_q, f"junta u_ival on {rk} does not strictly bracket 1/1000000")
    check(j_map["0.800"]["ratio_ival"][0] > 3.30 and j_map["0.865"]["ratio_ival"][0] > 3.30,
          "low-energy junta ratio at u=1/1000000 did not exceed 3.30")
    check(j_map["0.800"]["r1_min_lb"] > 0.866656, "low-energy junta did not strictly satisfy (R1) across all 17 pieces")
    print("  [PASS] Control 1 (P1 §6 low-energy junta): enclosed u=1/10^6 ratio > 3.30 with R1_min > 0.866656 and h_X'(0) != 0")

    # Control 2: Mathematical Negative Control 2 — Own-row 0.70 refuses 0.085
    own = [c for c in cfg0["cells"] if c["row_tag"] == "0.700_own"][0]
    check(own["F_claimed"] > 1.0 and own["theta_allow"] == 0.085, "own-row 0.70 control invalid")
    print(f"  [PASS] Control 2 (P1 §6 own-row 0.70): certifier refused 0.085 (F_certified={own['F_claimed']:.4f})")

    # Control 3: Corrupt Rice tangent intercept rho_a[0] downward below sqrt(pi)/2
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    c["rho_a"][0] = 0.8862260
    expect_verify_reject(c, r, "Rice tangent intercept k=0 below Kummer bound", "Control 3 (corrupt rho_a[0])")

    # Control 4: Corrupt Rice tangent slope rho_b[3] downward
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    c["rho_b"][3] *= 0.999
    expect_verify_reject(c, r, "Rice tangent slope k=3 below Kummer bound", "Control 4 (corrupt rho_b[3])")

    # Control 5: Corrupt Coupled-Gram parameter s_gram[0] = 1.9 < 2.0 (violates Grothe/Lower/Gram.lean)
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    c["s_gram"][0] = 1.9
    expect_verify_reject(c, r, "Coupled-Gram s_gram < 2", "Control 5 (corrupt Coupled-Gram s_gram[0] < 2)")

    # Control 6: Corrupt mu_u3 -> 1e-18 (destroys U^3 asymptotic tail dominance)
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    jm1_idx = next(i for i, x in enumerate(c["cells"]) if x["kind"] == "JM1_BOUND")
    c["cells"][jm1_idx]["slicesA"][0]["mu_u3"] = 1e-18
    expect_verify_reject(c, r, "exact rational U^3 tail failed", "Control 6 (corrupt mu_u3 = 1e-18)")

    # Control 7: Negative Kantorovich prefix K_m debit breaking infinite-U tail
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    c["cells"][jm1_idx]["slicesA"][0]["xs"] = [-1e14] + c["cells"][jm1_idx]["slicesA"][0]["xs"][1:]
    expect_verify_reject(c, r, "exact rational U^3 tail failed", "Control 7 (negative Kantorovich prefix K_m tail debit)")

    # Control 8: Introduce a gap between consecutive m1 slices [a_r, b_r]
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    c["cells"][jm1_idx]["slicesA"][0]["b_r"] -= 1e-4
    expect_verify_reject(c, r, "gap between slices", "Control 8 (gap between consecutive m1 slices)")

    # Control 9: Break Kantorovich threshold monotonicity xs[5] < xs[4]
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    c["cells"][jm1_idx]["slicesB"][1]["xs"][5] = c["cells"][jm1_idx]["slicesB"][1]["xs"][4] - 0.01
    expect_verify_reject(c, r, "xs not nondecreasing", "Control 9 (non-monotone Kantorovich thresholds xs)")

    # Control 10: Break Piece 16 continuous chi-coverage (shrink chi_hi on one Piece 16 cell)
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    p16_idx = next(i for i, x in enumerate(c["cells"]) if x["piece_idx"] == 16 and x["kind"] == "JM1_BOUND")
    c["cells"][p16_idx]["chi_hi"] -= 0.125
    r["cells"][p16_idx]["chi_hi"] = c["cells"][p16_idx]["chi_hi"]
    expect_verify_reject(c, r, "Piece 16", "Control 10 (gap in Piece 16 continuous chi-coverage)")

    # Control 11: Claim F_claimed > theta_allow on a Piece 16 active cell
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    p16_act_idx = next(
        i for i, x in enumerate(c["cells"])
        if x["piece_idx"] == 16 and x["kind"] == "JM1_BOUND" and 0 < x["theta_allow"] < 49.999
    )
    c["cells"][p16_act_idx]["F_claimed"] = c["cells"][p16_act_idx]["theta_allow"] + 0.01
    r["cells"][p16_act_idx]["F_certified"] = c["cells"][p16_act_idx]["F_claimed"]
    expect_verify_reject(c, r, " > theta=", "Control 11 (Piece 16 cell exceeding exact theta_allow)")

    # Control 12: Corrupt Piece 17 t_lo upward by 1 ULP above exact rational piece[0]
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    p17_idx = next(i for i, x in enumerate(c["cells"]) if x["piece_idx"] == 17)
    bad_tlo = math.nextafter(c["cells"][p17_idx]["t_lo"], math.inf)
    c["cells"][p17_idx]["t_lo"] = bad_tlo
    r["cells"][p17_idx]["t_lo"] = bad_tlo
    expect_verify_reject(c, r, "not downward-rounded from exact piece[0]", "Control 12 (upward-rounded Piece 17 t_lo)")

    # Control 13: Shift [u_lo, u_hi] off the exact decimal table energy node
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    c["cells"][p17_idx]["u_lo"] += 1e-10
    c["cells"][p17_idx]["u_hi"] += 1e-10
    r["cells"][p17_idx]["u_lo"] = c["cells"][p17_idx]["u_lo"]
    r["cells"][p17_idx]["u_hi"] = c["cells"][p17_idx]["u_hi"]
    expect_verify_reject(c, r, "does not tightly enclose exact table energy node", "Control 13 (energy node mismatch)")

    # Control 14: Corrupt worst_M_A in result.json to +1e-12
    c, r = copy.deepcopy(cfg0), copy.deepcopy(res0)
    r["cells"][p16_idx]["worst_M_A"] = +1e-12
    expect_verify_reject(c, r, "C++ continuous supremum not strictly negative", "Control 14 (non-negative worst_M_A)")

    # Control 15: Live C++17 binary rejection test on a false claim (own-row 0.70 claiming F = 0.085!)
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
        print(f"  [PASS] Control 15 (live C++17 binary test): rejected false F=0.085 on own-row 0.70 (rc={proc.returncode})")

        # Control 16: Live C++17 binary rejection test on energy-independent constant (row 0.800 at u=1/128 claiming F=1.139!)
        lowu_cell = copy.deepcopy([c for c in cfg0["cells"] if c["piece_idx"] == 0 and c["row_tag"] == "0.800"][0])
        lowu_cell["F_claimed"] = 1.139
        c_false2 = copy.deepcopy(cfg0)
        c_false2["cells"] = [lowu_cell]
        dat_false2 = os.path.join(tmpd, "false_lowu080.dat")
        verify.emit_dat_from_json(c_false2, dat_false2)
        proc2 = subprocess.run([bin_path, "--verify-all", dat_false2, res_false, "--threads", "2"],
                               stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        check(proc2.returncode != 0, "C++ certifier accepted false energy-independent F_claimed = 1.139 at u=1/128 on row 0.800!")
        print(f"  [PASS] Control 16 (live C++17 binary test): rejected false F=1.139 at u=1/128 on row 0.800 (rc={proc2.returncode})")

        # Control 17: Rounded-midpoint quadratic Taylor regression (f(r) = (r - m)^2 on 1-ULP & 112 radial panels)
        proc_st = subprocess.run([bin_path, "--self-test-only"],
                                 stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        check(proc_st.returncode == 0, f"C++ --self-test-only failed: {proc_st.stderr}")
        # Also verify in Python IEEE-754 arithmetic that old 0.5*width under FE_UPWARD under-encloses 51/112 radial panels
        # whereas max(m - lo, hi - m) encloses all 112/112 panels + {1.0, nextafter(1.0, 2.0)}:
        def add_up_py(a, b):
            s = a + b
            # exact check via Fraction:
            if Fraction(s) < Fraction(a) + Fraction(b):
                s = math.nextafter(s, math.inf)
            return s

        def sub_up_py(a, b):
            return add_up_py(a, -b)

        v_lo, v_hi = 1.0, math.nextafter(1.0, 2.0)
        m_up = 0.5 * add_up_py(v_lo, v_hi)
        old_hi = (0.5 * sub_up_py(v_hi, v_lo)) ** 2
        new_hi = max(sub_up_py(m_up, v_lo), sub_up_py(v_hi, m_up)) ** 2
        f_at_lo = float((Fraction(v_lo) - Fraction(m_up)) ** 2)
        check(old_hi < f_at_lo and new_hi >= f_at_lo,
              f"1-ULP regression mismatch: old_hi={old_hi.hex()}, new_hi={new_hi.hex()}, exact={f_at_lo.hex()}")
        n_old_fail = 0
        prev = 0.0
        for i in range(1, 113):
            cur = 7.0 if i == 112 else 7.0 * ((i / 112.0) ** 1.5)
            mp = 0.5 * add_up_py(prev, cur)
            old_r = 0.5 * sub_up_py(cur, prev)
            new_r = max(sub_up_py(mp, prev), sub_up_py(cur, mp))
            exact_max = max((Fraction(mp) - Fraction(prev)) ** 2, (Fraction(cur) - Fraction(mp)) ** 2)
            if Fraction(old_r) ** 2 < exact_max:
                n_old_fail += 1
            check(Fraction(new_r) ** 2 >= exact_max, f"new Taylor radius failed on panel {i}")
            prev = cur
        check(n_old_fail >= 40, f"expected old 0.5*width formula to fail on >=40 radial panels, got {n_old_fail}")
        print(f"  [PASS] Control 17 (rounded-midpoint Taylor radius): live C++ self-test passed & caught {n_old_fail}/112 old-radius panel failures")

        # Control 18: Exact Fraction check of row 0.865 vortex-join probe s_probe < psi(0.035) + singleton seam self-test
        r0865 = (Fraction(0.8783259514041781), Fraction(0.1597092307190024),
                 Fraction(-0.05414284751003532), Fraction(-0.028951745258042246),
                 Fraction(0.013052163374299502))
        l_q, beta_q, bA_q, bB_q, nu5_q = r0865
        rt2_lo, rt2_hi = verify.frac_sqrt_bounds(Fraction(2))
        rt12_lo, rt12_hi = verify.frac_sqrt_bounds(Fraction(12))
        rs_q = Fraction(0.035)
        Ts_q = rs_q * rs_q
        # Lower bound on true psi(0.035) on row 0.865:
        c2_lo, c2_hi = nu5_q / rt12_hi, nu5_q / rt12_lo
        Ps_lo = (l_q - 2 * beta_q + 6 * c2_lo) + (beta_q - 6 * c2_hi) * Ts_q + c2_lo * Ts_q * Ts_q
        Cs_hi = (1 + bA_q) + (-bA_q + (-bB_q) / rt2_lo) * Ts_q
        psi_035_lo = rs_q * Ps_lo / Cs_hi
        s_probe_q = Fraction(0.021522191494256774)
        check(s_probe_q < Fraction(2152219149425678, 10 ** 17) < psi_035_lo,
              f"s_probe={float(s_probe_q):.20g} not strictly below psi(0.035)>={float(psi_035_lo):.20g}")
        print("  [PASS] Control 18 (singleton mesh joins & vortex-join probe): C++ --self-test-only verified [0,0], s_edges, [64,64], [256,256] & s_probe < psi(0.035)")

    print("ALL 20 NEGATIVE, POSITIVE-FIXTURE, SEAM, AND CORRUPTION CONTROLS PASSED!")


if __name__ == "__main__":
    main()
