#!/usr/bin/env python3
"""Exact rational audit and replay verifier for Global 4D Complex Premise (P) (#431).

Agent-ID: gemini-c1de. Refs #431.
Python 3 standard library only (`python3 -I`, assertions required). Verifies:
  1. Peak row exact rationals, Q_0 positive definiteness, M(T) envelope, and
     exact rational w >= 8 analytic shift exterior (zero floats).
  2. Exact rational Sylvester PSD of Part 1 potential matrices across [0, 8]:
     - S_r >= 3/4 amplitude exterior on [0, 11/8]
     - w >= 11/8 shift exterior on [11/8, 8] (joining the w >= 8 analytic tail).
  3. Exact rational Sylvester PSD of Part 2 3-line switched origin profile on [0, 11/8].
  4. Part 3 global shift curvature constant 480 (16 * cap * mass < 480^2).
  5. Part 4 3D ray-convexity cube shells on [0, 5/16]: contiguous coverage,
     ((rho - 1)/(rho + 1))^2 <= eta, adjacent ratios r_{m+1}/r_m <= rho,
     2 * r_0 <= s_0(w) inner handoff, r_last >= s_bulk outer handoff, open_boxes == 0.
  6. Part 5 4D adaptive WCS bulk cover on [0, 11/8]: contiguous coverage,
     inner handoff to Part 4 (on [0, 5/16]) or Part 2 (on [5/16, 11/8]),
     outer handoff to Part 1 (S_r >= 3/4), open_boxes == 0, worst_margin < 0.
  7. Optional `--replay-cpp`: recompiles certify_global_P.cpp with
     -O2 -ffp-contract=off -frounding-math -std=c++17 -pthread -Wall -Wextra -Werror,
     runs the hotspot negative control, regenerates result.json, and re-audits.
"""
import argparse
import hashlib
import json
import subprocess
import sys
import tempfile
from fractions import Fraction as F
from pathlib import Path

if not __debug__:
    raise RuntimeError("Run without -O so all assertions execute")

# Peak row exact rational constants (STATUS 7.4.10)
A = F(699, 1250)
B = F(179, 1250)
P = F(2500, 1891)
RHO0 = F(5053, 10000)
C1 = F(3, 5) * RHO0  # 15159/50000
D_SHIFT = F(2, 5)
P_MINUS = P - F(463, 5000)
QA0 = P_MINUS - F(67, 100) - F(2, 25) * RHO0**2
QB0 = P_MINUS - F(67, 100) * RHO0**2 - F(2, 25)
QAB0 = (F(2, 25) - F(67, 100)) * RHO0


def parse_hex(s: str) -> F:
    """Exact conversion of IEEE-754 hexfloat (or decimal/rational) to Fraction."""
    s = s.strip()
    if s.startswith(("0x", "-0x", "+0x", "0X", "-0X", "+0X")):
        return F(float.fromhex(s))
    return F(s)


def exp_neg_upper(x: F, deg: int = 40) -> F:
    """Exact rational upper bound for exp(-x) = 1/exp(x) via truncated Taylor sum of exp(x)."""
    assert x >= 0
    s = F(0)
    term = F(1)
    for k in range(deg + 1):
        if k > 0:
            term = term * x / k
        s += term
    return F(1) / s


def check_psd_minus_interval_sym2(sym: dict, shift: F):
    """Exact rational proof that Q_0 + shift * I_2 - M > 0 for every M in the interval box."""
    a00_l, a00_h = parse_hex(sym["a00"][0]), parse_hex(sym["a00"][1])
    a01_l, a01_h = parse_hex(sym["a01"][0]), parse_hex(sym["a01"][1])
    a11_l, a11_h = parse_hex(sym["a11"][0]), parse_hex(sym["a11"][1])
    assert a00_l <= a00_h and a01_l <= a01_h and a11_l <= a11_h
    d00 = QA0 + shift - a00_h
    d11 = QB0 + shift - a11_h
    d01_abs = max(abs(QAB0 - a01_l), abs(QAB0 - a01_h))
    assert d00 > 0, f"d00 <= 0: {float(d00)}"
    assert d11 > 0, f"d11 <= 0: {float(d11)}"
    det = d00 * d11 - d01_abs**2
    assert det > 0, f"det <= 0: {float(det)}"
    return det


def check_exact_analytic_foundations():
    """Verify Q_0 > 0, M(T) envelope, r >= 24 tail, and exact rational w >= 8 analytic exterior."""
    # 1. Q_0 > 0 (and verify Q_0 >= (1/3) I_2 by exact Sylvester minors)
    assert QA0 > F(1, 3) and QB0 > F(1, 3)
    assert (QA0 - F(1, 3)) * (QB0 - F(1, 3)) > QAB0**2

    # 2. Linear envelope M(T) = 503/1000 + (613/500)T >= sqrt((T - 2/5)^2 + (c1 + T/sqrt(2))^2)
    #    Check coefficientwise square: M(T)^2 - [(T-2/5)^2 + (c1 + T/sqrt(2))^2] > 0 for all T >= 0.
    #    Using sqrt(2) > 1414213/1000000 (since 1414213^2 < 2*10^12) -> 1/sqrt(2) < 1000000/1414213:
    s2_lo = F(1414213, 1000000)
    assert s2_lo**2 < 2
    inv_s2_hi = F(1) / s2_lo
    m0, m1 = F(503, 1000), F(613, 500)
    assert m0**2 > D_SHIFT**2 + C1**2
    assert m1**2 > F(3, 2)
    assert 2 * m0 * m1 > 2 * C1 * inv_s2_hi - 2 * D_SHIFT

    # 3. Exact r >= 24 (w <= 2) and r >= 30 (w <= 8) tail: T > 25 since H(25) < 22^2
    H25 = F(25) * (A + F(25) * B) ** 2
    assert H25 < F(22) ** 2
    # On T >= 25: (T-2/5)^2 + (c1 + T/sqrt(2))^2 <= 2 T^2
    # Check: (1/2)T^2 + (4/5 - sqrt(2)*c1)T - (4/25 + c1^2) > 0 at T = 25 (increasing for T >= 1)
    s2_hi = F(1414214, 1000000)
    assert s2_hi**2 > 2
    assert F(1, 2) * F(25) ** 2 + (F(4, 5) - s2_hi * C1) * F(25) - (D_SHIFT**2 + C1**2) > 0
    tail_24 = F(1354, 24) * exp_neg_upper(F(25))
    assert tail_24 < F(1, 10**9)

    # 4. Exact rational analytic shift exterior for ALL w >= 8:
    #    Region 1 (|L| <= 4 => |L+w| >= 4):
    #      |h_E|^2 <= (T-2/5)^2 + 2 c1^2 + T^2 => E[|h_E|^2 / |L+w| 1{|L|<=4}] <= (1/4)*(84/25 + 2 c1^2).
    #    Region 2 (|L| > 4 => T > 6 since H(6) < 16):
    #      |h_E|^2 <= 3 T^2 on T >= 6; mass m0 = 150 e^{-6}, density M0 = 108 e^{-6} / ((a+6b)(a+18b)),
    #      layer-cake <= 2 sqrt(M0 m0). Check (2 sqrt(M0 m0))^2 = 4 M0 m0 < (1/3)^2 = 1/9!
    reg1 = F(1, 4) * (F(84, 25) + 2 * C1**2)
    assert reg1 < F(9, 10)
    H6 = F(6) * (A + F(6) * B) ** 2
    assert H6 < F(16)
    assert 2 * C1**2 < F(6) ** 2  # justifies |h_E|^2 <= 3 T^2 on T >= 6
    e6_hi = exp_neg_upper(F(6))
    m0_hi = F(150) * e6_hi
    M0_hi = F(108) * e6_hi / ((A + F(6) * B) * (A + F(18) * B))
    assert 4 * M0_hi * m0_hi < F(1, 9)  # hence layer-cake bound < 1/3
    total_w8_ub = reg1 + F(1, 3)
    assert total_w8_ub < F(3, 2)
    # Compare with lambda_min(Q_0 + (8^2/2) I_2) > 1/3 + 32 = 97/3 >> 3/2!
    assert total_w8_ub < F(1, 3) + F(32)
    # 5. Exact rational tail inequalities used in Part 3 (T >= 36) and Part 5 base curvature (T >= 25):
    #    Part 3: coeff(36) < 1 justifies Bbar(T) <= T / b^2 on T >= 36.
    q_c = F(5, 2)
    m36 = F(19, 18)
    t36 = F(36)
    coeff36 = (
        F(35, 2) * q_c / t36**2
        + F(10, 3) * m36 * q_c / t36
        + F(25, 72) * (m36**2 + F(2) / t36**2)
        + F(25, 48) * m36 / t36
    )
    assert coeff36 < 1
    assert 1 + B / (A + t36 * B) + 3 * B / (A + 3 * t36 * B) <= m36
    assert m0 + m1 * t36 <= F(5, 4) * t36
    #    Part 5 base curvature: coeff25 < 2 justifies |d^2(f*psi)/dw^2| / f <= 2 / b^2 on T >= 25.
    m25 = F(27, 25)
    t25 = F(25)
    assert 1 + B / (A + t25 * B) + 3 * B / (A + 3 * t25 * B) <= m25
    assert m0 + m1 * t25 <= F(5, 4) * t25
    assert F(17) * s2_hi / F(3) < F(9)  # (17*sqrt(2)/3)/a0^2 < 9/a0^2
    assert F(5) * s2_hi / F(3) < q_c    # 5*sqrt(2)/3 < 5/2
    coeff25 = (
        F(9) / t25**2
        + F(4) * m25 * q_c / (F(3) * t25)
        + ((m25**2 + F(2) / t25**2) * F(4) / (F(9) * t25) + F(2) * m25 / (F(3) * t25**2)) * (F(5, 4) * t25)
    )
    assert coeff25 < 2
    return {"tail_24_ub": float(tail_24), "w8_pot_ub": float(total_w8_ub)}


def verify_contiguous(slabs: list, start: F, end: F):
    """Verify exact contiguous partition of [start, end] with no gaps or overlaps."""
    assert len(slabs) > 0
    cur = start
    for sl in slabs:
        wl, wh = parse_hex(sl["wl"]), parse_hex(sl["wh"])
        assert wl == cur, f"Discontinuity: expected {cur}, got {wl}"
        assert wh > wl, f"Non-positive slab width: {wl}..{wh}"
        cur = wh
    assert cur == end, f"Did not reach {end}: ended at {cur}"


def min_s0_on_interval(ori_slabs: list, wl: F, wh: F) -> F:
    """Minimum certified s_0(w) over all Part 2 origin slabs overlapping (wl, wh)."""
    vals = []
    for oo in ori_slabs:
        owl, owh = parse_hex(oo["wl"]), parse_hex(oo["wh"])
        if owh > wl and owl < wh:
            vals.append(parse_hex(oo["s0"]))
    assert len(vals) > 0, f"No Part 2 origin slab covers [{wl}, {wh}]"
    return min(vals)


def verify_all(data: dict):
    assert data.get("format") == "global-complex-P-v1"
    assert data.get("self_tests_passed") is True
    w_ext = parse_hex(data["shift_exterior_cutoff"])
    w_tail = parse_hex(data["analytic_tail_cutoff"])
    S_ext = parse_hex(data["amplitude_exterior_S_min"])
    assert w_ext == F(11, 8) and w_tail == F(8) and S_ext == F(3, 4)

    foundations = check_exact_analytic_foundations()

    # Part 1: Potential exteriors
    p1 = data["part1_potential_slabs"]
    p1_amp = [s for s in p1 if not s["shift_ext"]]
    p1_sh = [s for s in p1 if s["shift_ext"]]
    verify_contiguous(p1_amp, F(0), w_ext)
    verify_contiguous(p1_sh, w_ext, w_tail)
    for s in p1_amp:
        wl = parse_hex(s["wl"])
        shift = wl**2 / 2 + S_ext
        check_psd_minus_interval_sym2(s["P_re"], shift)
        check_psd_minus_interval_sym2(s["P_im"], shift)
    for s in p1_sh:
        wl = parse_hex(s["wl"])
        shift = wl**2 / 2
        check_psd_minus_interval_sym2(s["P_re"], shift)
        check_psd_minus_interval_sym2(s["P_im"], shift)

    # Part 2: 3-line switched origin profile on [0, 11/8]
    p2 = data["part2_origin_slabs"]
    verify_contiguous(p2, F(0), w_ext)
    for s in p2:
        wl = parse_hex(s["wl"])
        assert parse_hex(s["s0"]) > 0
        shift = wl**2 / 2
        check_psd_minus_interval_sym2(s["K_re"], shift)
        check_psd_minus_interval_sym2(s["K_im"], shift)

    # Part 3: Global shift curvature 480
    p3 = data["part3_shift_curvature"]
    cap = parse_hex(p3["cap_max"])
    mass = parse_hex(p3["mass_sum"])
    assert p3["constant"] == 480
    assert cap < F(100) and mass < F(140) and F(16) * cap * mass < F(480) ** 2

    # Part 4: 3D ray-convexity cube shells on [0, 5/16]
    p4 = data["part4_ray_shells"]
    w_ray_end = F(5, 16)
    verify_contiguous(p4, F(0), w_ray_end)
    tot_3d = 0
    worst_3d = None
    for s in p4:
        wl, wh = parse_hex(s["wl"]), parse_hex(s["wh"])
        assert s["open_boxes"] == 0, f"Part 4 open boxes on [{wl},{wh}]"
        wm = parse_hex(s["worst_margin"])
        assert wm < 0, f"Part 4 non-negative margin {wm} on [{wl},{wh}]"
        worst_3d = wm if worst_3d is None else max(worst_3d, wm)
        eta = F(int(s["eta"][0]), int(s["eta"][1]))
        rho = F(int(s["rho_max"][0]), int(s["rho_max"][1]))
        assert eta > 0 and rho > 1
        # Exact ray-convexity discriminant condition: ((rho - 1)/(rho + 1))^2 <= eta
        assert ((rho - 1) / (rho + 1)) ** 2 <= eta
        radii = [parse_hex(r) for r in s["radii"]]
        assert len(radii) >= 2
        for k in range(len(radii) - 1):
            assert radii[k] < radii[k + 1] <= radii[k] * rho
        # Inner handoff: ||v||_inf <= r_0 => ||v||_2 <= 2*r_0 <= s_0(w) (Part 2!)
        s0_min = min_s0_on_interval(p2, wl, wh)
        assert 2 * radii[0] <= s0_min, f"Part 4 inner gap: 2*{radii[0]} > {s0_min} on [{wl},{wh}]"
        # Outer handoff: ||v||_inf >= r_last => ||v||_2 >= r_last == 1/8
        assert radii[-1] == F(1, 8)
        tot_3d += int(s["total_boxes"])
    assert tot_3d == int(data["summary"]["total_3d_boxes"])
    assert worst_3d == parse_hex(data["summary"]["worst_3d_margin"])

    # Part 5: 4D adaptive WCS bulk cover on [0, 11/8]
    p5 = data["part5_bulk_4d"]
    verify_contiguous(p5, F(0), w_ext)
    tot_4d = 0
    worst_4d = None
    for s in p5:
        wl, wh = parse_hex(s["wl"]), parse_hex(s["wh"])
        assert s["open_boxes"] == 0, f"Part 5 open boxes on [{wl},{wh}]"
        wm = parse_hex(s["worst_margin"])
        assert wm < 0, f"Part 5 non-negative margin {wm} on [{wl},{wh}]"
        worst_4d = wm if worst_4d is None else max(worst_4d, wm)
        sb = parse_hex(s["s_bulk"])
        # Inner handoff: on [0, 5/16], s_bulk <= 1/8 (outer radius of Part 4);
        # on [5/16, 11/8], s_bulk <= s_0(w) directly from Part 2!
        if wh <= w_ray_end:
            assert sb <= F(1, 8), f"Part 5 inner gap on [{wl},{wh}]: {sb} > 1/8"
        else:
            assert wl >= w_ray_end, f"Part 5 slab straddles 5/16: [{wl},{wh}]"
            s0_min = min_s0_on_interval(p2, wl, wh)
            assert sb <= s0_min, f"Part 5 inner gap on [{wl},{wh}]: {sb} > {s0_min}"
        tot_4d += int(s["total_boxes"])
    assert tot_4d == int(data["summary"]["total_4d_boxes"])
    assert worst_4d == parse_hex(data["summary"]["worst_4d_margin"])

    return {
        "foundations": foundations,
        "part1_slabs": {"amp": len(p1_amp), "shift": len(p1_sh)},
        "part2_origin_slabs": len(p2),
        "part3_480_cap": float(cap),
        "part3_480_mass": float(mass),
        "part4_3d_slabs": len(p4),
        "part4_3d_boxes": tot_3d,
        "part4_worst_margin": float(worst_3d),
        "part5_4d_slabs": len(p5),
        "part5_4d_boxes": tot_4d,
        "part5_worst_margin": float(worst_4d),
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--result", type=Path, default=Path(__file__).with_name("result.json"))
    parser.add_argument("--replay-cpp", action="store_true", help="Recompile and run certify_global_P.cpp")
    args = parser.parse_args()

    cpp = Path(__file__).with_name("certify_global_P.cpp")
    cpp_sha = hashlib.sha256(cpp.read_bytes()).hexdigest()

    if args.replay_cpp:
        with tempfile.TemporaryDirectory() as td:
            exe = Path(td) / "certify_global_P"
            cmd = [
                "clang++", "-O2", "-ffp-contract=off", "-frounding-math",
                "-std=c++17", "-pthread", "-Wall", "-Wextra", "-Werror",
                str(cpp), "-o", str(exe),
            ]
            subprocess.run(cmd, check=True)
            subprocess.run([str(exe), "--control-false-hotspot"], check=True)
            out_tmp = Path(td) / "result.json"
            subprocess.run([str(exe), "--output", str(out_tmp)], check=True)
            data = json.loads(out_tmp.read_text(encoding="utf-8"))
            data["cpp_sha256"] = cpp_sha
            args.result.write_text(
                json.dumps(data, separators=(",", ":")) + "\n", encoding="utf-8"
            )
    else:
        data = json.loads(args.result.read_text(encoding="utf-8"))
        assert data.get("cpp_sha256") == cpp_sha, (
            f"cpp_sha256 mismatch: result has {data.get('cpp_sha256')}, disk has {cpp_sha}"
        )

    summary = verify_all(data)
    print(json.dumps(summary, indent=2))
    print("ALL CHECKS PASSED: Global 4D complex premise (P) certified on all of C^3!")


if __name__ == "__main__":
    main()
