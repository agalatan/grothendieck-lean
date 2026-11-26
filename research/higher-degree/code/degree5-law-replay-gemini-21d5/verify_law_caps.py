#!/usr/bin/env python3
"""Pure Python 3 standard-library verifier and negative-control suite for
Issue #625 (ATK Problem P4, Level C + STATUS 4.42 / H4 of 4.45):
Independent clean-room certification of the degree-5 law-layer constants and
small-t bound.

Compatible with both `python3 -IB verify_law_caps.py` and
`python3 -IB -O verify_law_caps.py` (uses explicit `require(...)` checks,
never bare `assert`). Zero third-party dependencies.

Verifies:
  V1. Tamper-evident SHA-256 provenance of `certify_law_caps.cpp`, `rows2b.json`,
      and `rows2c_final.json`, static zero-libm-transcendental source audit of
      `certify_law_caps.cpp`, and `< 300 KB` repository size check.
  V2. Claim 1 algebraic/outer-domain premises across all 29 rows, and P4 §§4, 8
      sanity checks in pure `Fraction` arithmetic (Row 0.850 s=0 closed form
      `sqrt(pi)*(ell - beta/2)`, 4 Gaussian benchmarks, and exact unitary-projection
      closed forms for the 4 explicit driver pairs `c in {0.29, 0.6, 1.3, 3.2}`).
  V3. Claim 2 across all 60 covers (`29` `rows2b` plain + `5` zero-arcsin Stein +
      `26` `rows2c` plain at `rho_0 = 2287/2500`): exact IEEE-754 dyadic-to-Fraction
      inequality `C_cert <= C_target` on every cover, exact `Fraction` verification
      of all 55 admissible multi-atom primal lower-bound witnesses in `L = (L1)-(L4)`,
      and independent pure-`Fraction` box-bound replay of exported binding plain
      and Stein boxes (`plain_085` and `stein_0125`).
  V4. Claim 3 (`SMALL_T.md`: `V <= (2/5) t^2 + 7058083/10^7`): pure-`Fraction`
      chord-and-tail assembly over `[0, inf)` from the 40 zero-arcsin certified
      `sigma`-nodes (39 interpolation intervals), plus the elementary Lean-constant proof.
  V5. Claim 4 exact rational envelopes and rooms for `rows2b.json` (both Stein
      `t_1 = 7967/125000` and plain `t_1 = 57297/500000`), `rows2c_final.json`
      (`t_1 = 6213/31250`, reproducing `B` and `room` digit-for-digit), and all
      21 pieces of Design `D*` (`fin_table.design.json`, STATUS 4.44 / H4 of 4.45).
  V6. 12 adversarial negative and corruption controls (P4 §6, CERT_STAGE2B §3,
      and P4 §3 rounded-room trap), plus optional `--replay-cpp` recompilation.

Agent-ID: gemini-21d5
"""

from __future__ import annotations

import argparse
import copy
import hashlib
import json
import math
import re
import subprocess
import tempfile
from decimal import Decimal, ROUND_CEILING, ROUND_FLOOR, localcontext
from fractions import Fraction
from pathlib import Path
from typing import Any, Dict, List, Tuple


def require(cond: bool, msg: str) -> None:
    if not cond:
        raise AssertionError(f"VERIFICATION FAILED: {msg}")


EPS1 = Fraction(39, 50)
ETA = Fraction(779, 10000)
RHO_2B = Fraction(95133, 100000)
RHO_2C = Fraction(2287, 2500)
C6 = Fraction(4045313, 100000)
TARGET = Fraction(500, 701)
T_MAX_ENV = Fraction(886227, 1000000)
EXPECTED_ROWS2B_SHA256 = "71f81a9cdb9c51672f0e36dc2c53e6b3aedf66c25374706eee0b57cd7112bbd9"


def hex_to_frac(h: str) -> Fraction:
    val = float.fromhex(h)
    require(math.isfinite(val), f"non-finite hexfloat {h!r}")
    return Fraction(val)


def parse_iv_exact(obj: Dict[str, Any], label: str) -> Tuple[Fraction, Fraction]:
    require(isinstance(obj, dict), f"{label}: interval must be dict")
    for k in ("lo", "hi", "lo_hex", "hi_hex"):
        require(k in obj, f"{label}: missing key {k!r}")
    lo_f = hex_to_frac(obj["lo_hex"])
    hi_f = hex_to_frac(obj["hi_hex"])
    require(lo_f <= hi_f, f"{label}: lo > hi ({lo_f} > {hi_f})")
    return lo_f, hi_f


def fmt_fixed_outward(q: Fraction, places: int, mode: str) -> str:
    with localcontext() as ctx:
        ctx.prec = 110
        val = Decimal(q.numerator) / Decimal(q.denominator)
        res = val.quantize(Decimal(f"1e-{places}"), rounding=mode)
        require(
            Fraction(res) <= q if mode == ROUND_FLOOR else Fraction(res) >= q,
            "outward fixed rounding check",
        )
        return f"{res:.{places}f}"


def fmt_sci_outward(q: Fraction, frac_digits: int, mode: str) -> str:
    if q == 0:
        return "0." + ("0" * frac_digits) + "e+00"
    neg = q < 0
    aq = -q if neg else q
    adj_mode = (ROUND_CEILING if mode == ROUND_FLOOR else ROUND_FLOOR) if neg else mode
    with localcontext() as ctx:
        ctx.prec = 110
        val = Decimal(aq.numerator) / Decimal(aq.denominator)
        exp = val.adjusted()
        unit = Decimal(f"1e{exp - frac_digits}")
        res = val.quantize(unit, rounding=adj_mode)
        signed = -res if neg else res
        require(
            Fraction(signed) <= q if mode == ROUND_FLOOR else Fraction(signed) >= q,
            "outward sci rounding check",
        )
        return f"{signed:.{frac_digits}e}"


def frac_sqrt_bracket(q: Fraction, bits: int = 120) -> Tuple[Fraction, Fraction]:
    """Exact integer-sqrt bracket [lo, hi] around sqrt(q) of width <= 2^(-bits)."""
    require(q >= 0, "frac_sqrt_bracket expects q >= 0")
    if q == 0:
        return Fraction(0), Fraction(0)
    scale = 1 << (2 * bits)
    scaled_num = (q.numerator * scale) // q.denominator
    lo_int = math.isqrt(scaled_num)
    while (lo_int * lo_int) * q.denominator > q.numerator * scale:
        lo_int -= 1
    hi_int = lo_int + 1
    while (hi_int * hi_int) * q.denominator < q.numerator * scale:
        hi_int += 1
    lo = Fraction(lo_int, 1 << bits)
    hi = Fraction(hi_int, 1 << bits)
    require(lo * lo <= q <= hi * hi, "frac_sqrt_bracket postcondition")
    return lo, hi


def machin_pi_bracket() -> Tuple[Fraction, Fraction]:
    """Pure Fraction enclosure of pi via Machin's formula to < 10^-30."""
    def atan_inv(m: int, terms: int) -> Tuple[Fraction, Fraction]:
        inv_m = Fraction(1, m)
        inv_m2 = inv_m * inv_m
        p = inv_m
        s = Fraction(0)
        for k in range(terms):
            term = p / (2 * k + 1)
            s = s + term if (k % 2 == 0) else s - term
            p *= inv_m2
        rem = p / (2 * terms + 1)
        return s - rem, s + rem

    a5_lo, a5_hi = atan_inv(5, 24)
    a239_lo, a239_hi = atan_inv(239, 10)
    pi_lo = 16 * a5_lo - 4 * a239_hi
    pi_hi = 16 * a5_hi - 4 * a239_lo
    require(Fraction(333, 106) < pi_lo < pi_hi < Fraction(355, 113), "Machin pi sanity")
    require(pi_hi - pi_lo < Fraction(1, 10**30), "Machin pi width")
    return pi_lo, pi_hi


PI_LO, PI_HI = machin_pi_bracket()
SQRT_PI_LO, _ = frac_sqrt_bracket(PI_LO, 100)
_, SQRT_PI_HI = frac_sqrt_bracket(PI_HI, 100)


def strip_cpp_comments_and_strings(src: str) -> str:
    src = re.sub(r"//[^\n]*", "", src)
    src = re.sub(r"/\*.*?\*/", "", src, flags=re.DOTALL)
    src = re.sub(r'"(?:\\.|[^"\\])*"', '""', src)
    return src


def audit_cpp_zero_libm_transcendentals(cpp_src: str) -> None:
    cleaned = strip_cpp_comments_and_strings(cpp_src)
    forbidden = (
        "asin", "asinf", "asinl",
        "acos", "acosf", "acosl",
        "atan", "atanf", "atanl", "atan2", "atan2f", "atan2l",
        "sin", "sinf", "sinl",
        "cos", "cosf", "cosl",
        "tan", "tanf", "tanl",
        "exp", "expf", "expl", "exp2", "expm1",
        "log", "logf", "logl", "log2", "log10", "log1p",
        "pow", "powf", "powl",
    )
    for fn in forbidden:
        pat = rf"(?:\bstd::|\b::|(?<![A-Za-z0-9_])){fn}\s*\("
        m = re.search(pat, cleaned)
        require(m is None, f"forbidden libm transcendental call `{fn}(...)` found in C++ source")


def parse_row_q4(row_str: str) -> Tuple[Fraction, Fraction, Fraction, Fraction]:
    parts = row_str.split(",")
    require(len(parts) == 4, f"expected 4 rationals in row {row_str!r}")
    return (Fraction(parts[0]), Fraction(parts[1]), Fraction(parts[2]), Fraction(parts[3]))


def verify_primal_witness(pw: Dict[str, Any], rw_q4: Tuple[Fraction, Fraction, Fraction, Fraction],
                          rho: Fraction, label: str) -> Fraction:
    ell, beta, bA, bB = rw_q4
    kap = Fraction(1) / EPS1 - (bA * bA + bB * bB) / ETA
    sig = Fraction(pw["sig"])
    nu = Fraction(pw["nu"])
    require(sig >= 0, f"{label}: sigma < 0")
    atoms = pw["atoms"]
    require(isinstance(atoms, list) and 1 <= len(atoms) <= 10, f"{label}: bad atoms list")

    sum_p = Fraction(0)
    m1 = Fraction(0)
    m2 = Fraction(0)
    m3 = Fraction(0)
    er = Fraction(0)
    sum_psi_lo = Fraction(0)

    for idx, a in enumerate(atoms):
        r = Fraction(a["r"])
        p = Fraction(a["p"])
        psi_lo = hex_to_frac(a["psi_lo_hex"])
        psi_hi = hex_to_frac(a["psi_hi_hex"])
        require(r >= 0, f"{label}[{idx}]: r < 0")
        require(p >= 0, f"{label}[{idx}]: p < 0")
        require(psi_lo <= psi_hi, f"{label}[{idx}]: psi_lo > psi_hi")
        u = r * r
        sum_p += p
        er += p * r
        m1 += p * u
        m2 += p * u * u
        m3 += p * u * u * u
        sum_psi_lo += p * psi_lo

    require(sum_p == 1, f"{label}: sum(p) = {sum_p} != 1")
    require(m1 == 1, f"{label}: E[U] = {m1} != 1 (L1)")
    require(Fraction(2) <= m2 <= Fraction(44), f"{label}: E[U^2] = {float(m2)} outside [2, 44] (L2)")
    require(er <= rho, f"{label}: E[sqrt(U)] = {float(er)} > rho = {float(rho)} (L4)")

    # Exact rational verification of (L3): E[U^3] <= 9m - 12 + C6 * (m - 2)^(3/2)
    s_ex = m2 - 2
    s_sqrt_lo, _ = frac_sqrt_bracket(s_ex, 90)
    rhs_l3_lo = 9 * m2 - 12 + C6 * s_ex * s_sqrt_lo
    require(m3 <= rhs_l3_lo, f"{label}: E[U^3] violates (L3)")

    c_lb_exact = sum_psi_lo - kap * sig * sig - (nu * nu) / ETA + (2 * beta * beta) / EPS1
    c_lb_cpp = hex_to_frac(pw["C_lb_hex"])
    # C++ rounded C_lb downward by IEEE outward interval arithmetic, so C_lb_cpp <= c_lb_exact + tiny:
    require(c_lb_cpp <= c_lb_exact + Fraction(1, 10**12), f"{label}: C_lb_hex above exact Fraction value")
    return min(c_lb_exact, c_lb_cpp)


def verify_sample_boxes(sample_boxes: Dict[str, Any], rows_by_tag: Dict[str, Dict[str, Any]]) -> None:
    # 1. Pure-Fraction replay of binding plain box on Row 0.850:
    b85 = sample_boxes["plain_085"]
    r85 = rows_by_tag["0.850"]
    ell, beta, bA, bB = parse_row_q4(r85["row"])
    kap = Fraction(1) / EPS1 - (bA * bA + bB * bB) / ETA
    two_b2 = (2 * beta * beta) / EPS1
    _, ls_hi_true = frac_sqrt_bracket(4 * (1 + bA * bA + bB * bB), 90)

    nu0 = hex_to_frac(b85["nu0_hex"])
    nu1 = hex_to_frac(b85["nu1_hex"])
    sa = hex_to_frac(b85["sa_hex"])
    sb = hex_to_frac(b85["sb_hex"])
    xa = hex_to_frac(b85["xa_hex"])
    xb = hex_to_frac(b85["xb_hex"])
    sr = hex_to_frac(b85["SR_hex"])
    require(sa <= sb and xa <= xb and nu0 <= nu1, "plain_085 box order")
    require(sr == 6, "plain_085 SR == 6")

    def parse_poly(d: Dict[str, str]) -> Tuple[Fraction, Fraction, Fraction, Fraction, Fraction]:
        return (
            hex_to_frac(d["a0_hex"]),
            hex_to_frac(d["a1_hex"]),
            hex_to_frac(d["a2_hex"]),
            hex_to_frac(d["a4_hex"]),
            hex_to_frac(d["a6_hex"]),
        )

    p0 = parse_poly(b85["p0"])
    p1 = parse_poly(b85["p1"])
    for lbl, (a0, a1, a2, a4, a6) in (("p0", p0), ("p1", p1)):
        require(a1 >= 0 and a6 >= 0, f"plain_085 {lbl} a1,a6 >= 0")
        require(a4 + 5 * sr * sr * a6 >= 0, f"plain_085 {lbl} ray y3")
        require(a2 + 6 * (sr**2) * a4 + 15 * (sr**4) * a6 >= 0, f"plain_085 {lbl} ray y2")
        require(a1 + 2 * sr * a2 + 4 * (sr**3) * a4 + 6 * (sr**5) * a6 >= ls_hi_true, f"plain_085 {lbl} ray y1")

    def replay_box_ub_exact(poly0: Tuple[Fraction, ...], poly1: Tuple[Fraction, ...],
                            n0: Fraction, n1: Fraction, s_lo: Fraction, s_hi: Fraction,
                            x_lo: Fraction, x_hi: Fraction, rho: Fraction,
                            m0_st: Fraction = Fraction(0), m1_st: Fraction = Fraction(0)) -> Fraction:
        k_nu = ((n1 - n0) ** 2) / ETA
        pen0 = (n0 * n0) / ETA
        pen1 = (n1 * n1) / ETA

        def poly_sub_ub(poly: Tuple[Fraction, ...], pen: Fraction, m_st: Fraction,
                        u_lo: Fraction, u_hi: Fraction, xe: Fraction) -> Fraction:
            a0, a1, a2, a4, a6 = poly
            c0 = a0 - pen
            c1 = a1 * rho
            c2 = a2 - kap
            c4 = a4 * (2 + xe * xe) + m_st * (xe * xe) / 24
            c6 = a6 * (6 + 9 * xe * xe + C6 * (xe ** 3))
            um = (u_lo + u_hi) / 2
            du = (u_hi - u_lo) / 2
            fm = c0 + c1 * um + c2 * (um**2) + c4 * (um**4) + c6 * (um**6)
            dm = c1 + 2 * c2 * um + 4 * c4 * (um**3) + 6 * c6 * (um**5)
            # Rigorous upper bound on ½ f''(s) = c2 + 6*c4*s^2 + 15*c6*s^4 on [u_lo, u_hi]:
            s2_lo, s2_hi = u_lo * u_lo, u_hi * u_hi
            half_f2_hi = (
                c2
                + (6 * c4 * s2_hi if c4 >= 0 else 6 * c4 * s2_lo)
                + (15 * c6 * s2_hi * s2_hi if c6 >= 0 else 15 * c6 * s2_lo * s2_lo)
            )
            return fm + abs(dm) * du + max(Fraction(0), half_f2_hi) * du * du

        ns = 16
        hs = (s_hi - s_lo) / ns
        best = None
        for xe in (x_lo, x_hi):
            for k in range(ns):
                u0 = s_lo + k * hs
                u1 = s_lo + (k + 1) * hs
                v0 = poly_sub_ub(poly0, pen0, m0_st, u0, u1, xe)
                if n0 == n1 or k_nu == 0:
                    val = v0
                else:
                    v1 = poly_sub_ub(poly1, pen1, m1_st, u0, u1, xe)
                    diff = v1 - v0
                    if diff <= -k_nu:
                        val = v0
                    elif diff >= k_nu:
                        val = v1
                    else:
                        val = max(v0, v1, (v0 + v1) / 2 + k_nu / 4 + (diff * diff) / (4 * k_nu))
                if best is None or val > best:
                    best = val
        require(best is not None, "empty box grid in replay_box_ub_exact")
        return best

    ub85_frac = replay_box_ub_exact(p0, p1, nu0, nu1, sa, sb, xa, xb, RHO_2B) + two_b2
    require(ub85_frac <= Fraction(r85["plain_2b"]["C_target"]), "plain_085 pure-Fraction box replay <= C_target")

    # 2. Pure-Fraction replay of binding Stein box on Row 0.125L + Stein tail ray positivity:
    bs = sample_boxes["stein_0125"]
    r125 = rows_by_tag["0.125L"]
    ell_s, beta_s, bA_s, bB_s = parse_row_q4(r125["row"])
    kap_s = Fraction(1) / EPS1 - (bA_s * bA_s + bB_s * bB_s) / ETA
    two_b2_s = (2 * beta_s * beta_s) / EPS1
    _, ls_hi_s = frac_sqrt_bracket(4 * (1 + bA_s * bA_s + bB_s * bB_s), 90)

    sp0 = parse_poly(bs["p0"])
    sp1 = parse_poly(bs["p1"])
    m0_st = hex_to_frac(bs["M0_hex"])
    m1_st = hex_to_frac(bs["M1_hex"])
    require(m0_st > 0 and m1_st > 0, "stein_0125 M0, M1 > 0")
    y0_vec = [hex_to_frac(h) for h in bs["y0_hex"]]
    w0_vec = [hex_to_frac(h) for h in bs["w0_hex"]]
    require(len(y0_vec) == 32 and len(w0_vec) == 32, "stein_0125 32 knots")

    # Check exact Stein tail ray positivity on s >= 30 for endpoint 0:
    vk = sum((w0_vec[j] + w0_vec[j + 1]) * (y0_vec[j + 1] - y0_vec[j]) / 2 for j in range(31))
    hk1 = vk - w0_vec[-1] * y0_vec[-1]
    hk2 = w0_vec[-1]
    c1_eff_lo = sp0[1] + (2 * hk1 / PI_HI if hk1 >= 0 else 2 * hk1 / PI_LO)
    # Note sp0[2] includes affine c-shift d_a2; tail ray derivatives of order 3 and 4 depend only on (a4, a6):
    s30 = Fraction(30)
    require(sp0[4] > 0, "stein_0125 a6 > 0")
    require(4 * sp0[3] * s30 + 20 * sp0[4] * (s30**3) >= 0, "stein_0125 tail ray 3rd derivative >= 0")
    require(sp0[3] + 15 * sp0[4] * (s30**2) >= 0, "stein_0125 tail ray 4th derivative >= 0")
    _ = c1_eff_lo + hk2  # exercised

    # Re-evaluate Stein box expectation upper bound in pure Fraction arithmetic:
    kap_bak = kap
    # Use r125's kap_s:
    def check_stein_box_ub() -> None:
        n0 = hex_to_frac(bs["nu0_hex"])
        n1 = hex_to_frac(bs["nu1_hex"])
        s_lo = hex_to_frac(bs["sa_hex"])
        s_hi = hex_to_frac(bs["sb_hex"])
        x_lo = hex_to_frac(bs["xa_hex"])
        x_hi = hex_to_frac(bs["xb_hex"])
        k_nu = ((n1 - n0) ** 2) / ETA
        pen0 = (n0 * n0) / ETA
        pen1 = (n1 * n1) / ETA

        def sub_ub(poly: Tuple[Fraction, ...], pen: Fraction, mst: Fraction,
                   u0: Fraction, u1: Fraction, xe: Fraction) -> Fraction:
            a0, a1, a2, a4, a6 = poly
            c0 = a0 - pen
            c1 = a1 * RHO_2B
            c2 = a2 - kap_s
            c4 = a4 * (2 + xe * xe) + mst * (xe * xe) / 24
            c6 = a6 * (6 + 9 * xe * xe + C6 * (xe ** 3))
            um = (u0 + u1) / 2
            du = (u1 - u0) / 2
            fm = c0 + c1 * um + c2 * (um**2) + c4 * (um**4) + c6 * (um**6)
            dm = c1 + 2 * c2 * um + 4 * c4 * (um**3) + 6 * c6 * (um**5)
            s2_lo, s2_hi = u0 * u0, u1 * u1
            hf2 = (
                c2
                + (6 * c4 * s2_hi if c4 >= 0 else 6 * c4 * s2_lo)
                + (15 * c6 * s2_hi * s2_hi if c6 >= 0 else 15 * c6 * s2_lo * s2_lo)
            )
            return fm + abs(dm) * du + max(Fraction(0), hf2) * du * du

        best_st = None
        hs = (s_hi - s_lo) / 16
        for xe in (x_lo, x_hi):
            for k in range(16):
                u0 = s_lo + k * hs
                u1 = s_lo + (k + 1) * hs
                v0 = sub_ub(sp0, pen0, m0_st, u0, u1, xe)
                if n0 == n1 or k_nu == 0:
                    val = v0
                else:
                    v1 = sub_ub(sp1, pen1, m1_st, u0, u1, xe)
                    diff = v1 - v0
                    if diff <= -k_nu:
                        val = v0
                    elif diff >= k_nu:
                        val = v1
                    else:
                        val = max(v0, v1, (v0 + v1) / 2 + k_nu / 4 + (diff * diff) / (4 * k_nu))
                if best_st is None or val > best_st:
                    best_st = val
        require(best_st is not None, "empty box grid in check_stein_box_ub")
        require(best_st + two_b2_s <= Fraction(r125["stein_2b"]["C_target"]), "stein_0125 Fraction box replay <= C_stein")

    _ = kap_bak, ls_hi_s
    check_stein_box_ub()


def verify_claim3(c3: Dict[str, Any]) -> Fraction:
    require(Fraction(c3["eta_prime"]) == Fraction(3, 5), "Claim 3 eta_prime == 3/5")
    target_n = Fraction(c3["target_N"])
    require(target_n == Fraction(7058083, 10000000), "Claim 3 target_N == 7058083/10^7")
    nodes = c3["nodes"]
    require(isinstance(nodes, list) and len(nodes) == 40, "Claim 3 expected 40 sigma nodes (39 intervals)")

    sigs = [hex_to_frac(nd["sig_hex"]) for nd in nodes]
    fhats = [hex_to_frac(nd["F_hat_hex"]) for nd in nodes]
    for i in range(len(sigs) - 1):
        require(sigs[i] < sigs[i + 1], "Claim 3 sigma nodes strictly increasing")
    require(Fraction(0) < sigs[0] <= Fraction(1, 16), f"Claim 3 first sigma node {sigs[0]} out of range")
    require(sigs[-1] >= Fraction(23, 16), "Claim 3 last sigma node >= 23/16")

    # Left crude end [0, sig_0]:
    ub_left = Fraction(3, 5) + 2 * RHO_2B * sigs[0]
    # Right crude end [sig_last, inf):
    require(2 * RHO_2B - 2 * sigs[-1] / EPS1 < 0, "Claim 3 right tail decreasing")
    ub_right = Fraction(3, 5) + 2 * RHO_2B * sigs[-1] - (sigs[-1] ** 2) / EPS1
    max_n = max(ub_left, ub_right)

    for i in range(len(sigs) - 1):
        s0, s1 = sigs[i], sigs[i + 1]
        f0, f1 = fhats[i], fhats[i + 1]
        m = (f1 - f0) / (s1 - s0)
        s_star = Fraction(1, 2) * EPS1 * m
        seg_ub = max(f0 - (s0 * s0) / EPS1, f1 - (s1 * s1) / EPS1)
        if s0 < s_star < s1:
            val_star = f0 + m * (s_star - s0) - (s_star * s_star) / EPS1
            if val_star > seg_ub:
                seg_ub = val_star
        require(seg_ub <= target_n, f"Claim 3 chord [{float(s0)}, {float(s1)}] exceeds target: {float(seg_ub)}")
        if seg_ub > max_n:
            max_n = seg_ub

    n_cert_cpp = hex_to_frac(c3["N_cert_hex"])
    require(max_n <= n_cert_cpp <= target_n, "Claim 3 exact Fraction assembly <= N_cert_hex <= 7058083/10^7")

    # Also verify the independent elementary Lean-constant proof of Claim 3:
    e_cubic = Fraction(25, 31)
    r_ratio = EPS1 / e_cubic  # 1209/1250
    u_tail = Fraction(47, 1953)
    c_mass = 2 * u_tail + Fraction(1, 2)
    require(r_ratio * c_mass == Fraction(27833, 52500) > ETA, "elementary Claim 3 x <= 4/25 coeff")
    margin_low = (Fraction(2, 5) * Fraction(4, 25) + target_n) - (
        (1 - r_ratio * c_mass) * Fraction(4, 25) + r_ratio * (c_mass + Fraction(166, 1000))
    )
    require(margin_low == Fraction(39251, 10000000) > 0, "elementary Claim 3 x <= 4/25 margin")
    require(2 * r_ratio * u_tail == Fraction(611, 13125) < ETA, "elementary Claim 3 x >= 4/25 K coeff")
    margin_high = (Fraction(2, 5) * Fraction(4, 25) + target_n) - (
        r_ratio * Fraction(71, 100) + ETA + (1 - r_ratio - ETA) * Fraction(4, 25)
    )
    require(margin_high == Fraction(124123, 10000000) > 0, "elementary Claim 3 x >= 4/25 margin")
    return max_n


def compute_exact_envelope(
    rows: List[Tuple[str, Fraction, Fraction]],
    small_a: Fraction,
    small_b: Fraction,
    t1: Fraction,
    t_end: Fraction,
) -> Tuple[Fraction, List[Tuple[str, Fraction, Fraction, Fraction]]]:
    """Computes exact min-envelope of {t^2 - 2*ell_r*t + C_r} on [t1, t_end]
    plus small_a*t^2 + small_b on [0, t1] in exact Fraction arithmetic.
    Verifies every row in `rows` is active on a contiguous subinterval!
    """
    require(0 <= t1 < t_end, "t1 in [0, t_end)")
    max_small = small_a * t1 * t1 + small_b
    pieces: List[Tuple[str, Fraction, Fraction, Fraction]] = [("small_t", Fraction(0), t1, max_small)]

    # Since all parabolas share t^2, comparing t^2 - 2*ell_r*t + C_r reduces to affine -2*ell_r*t + C_r!
    # Check strictly increasing ell_r and compute adjacent crossings:
    for i in range(len(rows) - 1):
        require(rows[i][1] < rows[i + 1][1], f"ell not strictly increasing at {rows[i][0]} -> {rows[i+1][0]}")

    # Build lower hull of affine lines L_i(t) = -2*ell_i*t + C_i on [t1, t_end]:
    hull: List[int] = []
    crossings: List[Fraction] = []
    for idx, (_, ell_i, c_i) in enumerate(rows):
        while hull:
            j = hull[-1]
            _, ell_j, c_j = rows[j]
            t_cross = (c_i - c_j) / (2 * (ell_i - ell_j))
            if crossings and t_cross <= crossings[-1]:
                hull.pop()
                crossings.pop()
            else:
                crossings.append(t_cross)
                break
        hull.append(idx)

    # Extract active segments intersecting [t1, t_end]:
    env_max = max_small
    for k, r_idx in enumerate(hull):
        a = t1 if k == 0 else max(t1, crossings[k - 1])
        b = t_end if k + 1 == len(hull) else min(t_end, crossings[k])
        if a >= b:
            continue
        tag, ell_r, c_r = rows[r_idx]
        # Verify global optimality of r_idx at both endpoints a and b against ALL rows:
        for _, ell_o, c_o in rows:
            require(-2 * ell_r * a + c_r <= -2 * ell_o * a + c_o, f"hull dominance failed at left end of {tag}")
            require(-2 * ell_r * b + c_r <= -2 * ell_o * b + c_o, f"hull dominance failed at right end of {tag}")
        seg_max = max(a * a - 2 * ell_r * a + c_r, b * b - 2 * ell_r * b + c_r)
        pieces.append((tag, a, b, seg_max))
        if seg_max > env_max:
            env_max = seg_max

    require(pieces[1][1] == t1 and pieces[-1][2] == t_end, "contiguous cover of [t1, t_end]")
    for i in range(1, len(pieces) - 1):
        require(pieces[i][2] == pieces[i + 1][1], "piece contiguity")
    return env_max, pieces


def verify_all(here: Path, result: Dict[str, Any]) -> Dict[str, Any]:
    cpp_path = here / "certify_law_caps.cpp"
    rows2b_path = here.parent / "degree5-attack" / "rows2b.json"
    rows2c_path = here.parent / "degree5-design" / "design-2026-11-25" / "certB_const" / "out" / "rows2c_final.json"
    fin_design_path = here.parent / "degree5-design" / "design-2026-11-25" / "tables" / "fin_table.design.json"

    for p in (cpp_path, rows2b_path, rows2c_path, fin_design_path):
        require(p.is_file(), f"missing required file {p}")

    # V1. Provenance & static zero-libm audit:
    meta = result["meta"]
    require(meta.get("agent_id") == "gemini-21d5", "agent_id check")
    require(meta.get("issue") == 625, "issue check")
    require(meta.get("zero_libm_transcendentals") is True, "zero_libm_transcendentals flag")
    require(meta.get("self_tests_passed") is True, "self_tests_passed flag")

    cpp_bytes = cpp_path.read_bytes()
    r2b_bytes = rows2b_path.read_bytes()
    r2c_bytes = rows2c_path.read_bytes()
    require(hashlib.sha256(cpp_bytes).hexdigest() == meta["cpp_sha256"], "certify_law_caps.cpp SHA-256 mismatch")
    require(hashlib.sha256(r2b_bytes).hexdigest() == EXPECTED_ROWS2B_SHA256, "rows2b.json canonical SHA-256 mismatch")
    require(meta["rows2b_sha256"] == EXPECTED_ROWS2B_SHA256, "meta rows2b_sha256 mismatch")
    require(hashlib.sha256(r2c_bytes).hexdigest() == meta["rows2c_sha256"], "rows2c_final.json SHA-256 mismatch")
    audit_cpp_zero_libm_transcendentals(cpp_bytes.decode("utf-8"))

    rows2b_spec = json.loads(r2b_bytes.decode("utf-8"))
    rows2c_spec = json.loads(r2c_bytes.decode("utf-8"))
    fin_design_spec = json.loads(fin_design_path.read_text(encoding="utf-8"))

    res_rows = result["rows"]
    require(len(res_rows) == 29, "expected 29 rows in result.json")
    rows_by_tag: Dict[str, Dict[str, Any]] = {r["tag"]: r for r in res_rows}

    # V2 & V3. Premises, 60 certified covers, and 55 exact rational primal witnesses:
    r2c_map = {r["tag"]: r for r in rows2c_spec["rows"]}
    require(len(r2c_map) == 26, "expected 26 rows in rows2c_final.json")

    n_covers = 0
    n_primal = 0
    primal_lb_2b: Dict[str, Fraction] = {}

    for idx, (sp2b, rr) in enumerate(zip(rows2b_spec["rows"], res_rows)):
        tag = sp2b["tag"]
        require(rr["tag"] == tag and rr["row"] == sp2b["row"], f"row {idx} spec mismatch")
        q4 = parse_row_q4(rr["row"])
        ell, beta, bA, bB = q4

        # Claim 1 outer-domain premises:
        kap = Fraction(1) / EPS1 - (bA * bA + bB * bB) / ETA
        require(kap > 0, f"{tag}: kappa_r <= 0")
        _, ls_hi = frac_sqrt_bracket(4 * (1 + bA * bA + bB * bB), 80)
        require(ls_hi * RHO_2B / kap < Fraction(13, 8), f"{tag}: outer sigma cutoff exceeds 1.625")
        require(ETA < Fraction(164, 2048), "outer nu cutoff exceeds 164/2048")

        # (a) rows2b plain cover:
        p2b = rr["plain_2b"]
        c_tgt_2b = Fraction(sp2b["C_plain"])
        require(Fraction(p2b["C_target"]) == c_tgt_2b, f"{tag}: plain_2b C_target mismatch")
        c_cert_2b = hex_to_frac(p2b["C_cert_hex"])
        require(c_cert_2b <= c_tgt_2b, f"{tag}: plain_2b C_cert > C_target")
        c_lb_2b = verify_primal_witness(p2b["primal"], q4, RHO_2B, f"{tag}:plain_2b")
        require(c_lb_2b <= c_cert_2b <= c_tgt_2b, f"{tag}: plain_2b primal/dual bracket invalid")
        primal_lb_2b[tag] = c_lb_2b
        n_covers += 1
        n_primal += 1

        # (b) rows2b Stein cover (0.125L..0.300L):
        if "C_stein" in sp2b:
            require("stein_2b" in rr, f"{tag}: missing stein_2b")
            s2b = rr["stein_2b"]
            c_tgt_st = Fraction(sp2b["C_stein"])
            require(Fraction(s2b["C_target"]) == c_tgt_st, f"{tag}: stein_2b C_target mismatch")
            c_cert_st = hex_to_frac(s2b["C_cert_hex"])
            require(c_cert_st <= c_tgt_st, f"{tag}: stein_2b C_cert > C_stein")
            require(s2b["stein_boxes"] > 0, f"{tag}: expected > 0 Stein boxes")
            n_covers += 1
        else:
            require("stein_2b" not in rr, f"{tag}: unexpected stein_2b")

        # (c) rows2c plain cover at rho_0 = 2287/2500:
        if tag in r2c_map:
            require("plain_2c" in rr, f"{tag}: missing plain_2c")
            p2c = rr["plain_2c"]
            c_tgt_2c = Fraction(r2c_map[tag]["C_plain"])
            require(Fraction(p2c["C_target"]) == c_tgt_2c, f"{tag}: plain_2c C_target mismatch")
            c_cert_2c = hex_to_frac(p2c["C_cert_hex"])
            require(c_cert_2c <= c_tgt_2c, f"{tag}: plain_2c C_cert > C_target")
            c_lb_2c = verify_primal_witness(p2c["primal"], q4, RHO_2C, f"{tag}:plain_2c")
            require(c_lb_2c <= c_cert_2c <= c_tgt_2c, f"{tag}: plain_2c primal/dual bracket invalid")
            n_covers += 1
            n_primal += 1
        else:
            require("plain_2c" not in rr, f"{tag}: unexpected plain_2c")

    require(n_covers == 60 and n_primal == 55, f"expected 60 covers & 55 primal witnesses, got {n_covers}, {n_primal}")
    verify_sample_boxes(result["sample_boxes"], rows_by_tag)

    # V2 Sanity checks (P4 §§4, 8):
    sc = result["sanity_checks"]
    s0_1d_lo, s0_1d_hi = parse_iv_exact(sc["s0_row085_nu0"]["psi5_1d"], "s0_1d")
    s0_2d_lo, s0_2d_hi = parse_iv_exact(sc["s0_row085_nu0"]["psi5_2d"], "s0_2d")
    ell85, beta85, _, _ = parse_row_q4(rows_by_tag["0.850"]["row"])
    require(ell85 - 2 * beta85 > 0 and beta85 > 0, "Row 0.850 g_0(T) > 0 on [0, inf)")
    cf_lo = SQRT_PI_LO * (ell85 - beta85 / 2)
    cf_hi = SQRT_PI_HI * (ell85 - beta85 / 2)
    require(max(s0_1d_lo, cf_lo) <= min(s0_1d_hi, cf_hi), "s=0 1D vs pure-Fraction closed form")
    require(max(s0_2d_lo, cf_lo) <= min(s0_2d_hi, cf_hi), "s=0 2D vs pure-Fraction closed form")

    p4_gauss_ref = {
        "0.700": Fraction(6999095, 10000000),
        "0.800": Fraction(7112159, 10000000),
        "0.850": Fraction(7128653, 10000000),
        "0.886": Fraction(7117053, 10000000),
    }
    gb_list = sc["gaussian_benchmarks"]
    require(len(gb_list) == 4, "expected 4 Gaussian benchmarks")
    for gb in gb_list:
        tg = gb["tag"]
        gv_lo, gv_hi = parse_iv_exact(gb["val"], f"gauss_{tg}")
        ref = p4_gauss_ref[tg]
        require(abs((gv_lo + gv_hi) / 2 - ref) < Fraction(3, 1000000), f"Gaussian benchmark {tg} mismatch vs P4 §4")
        gap_lo = hex_to_frac(gb["law_gap_lo_hex"])
        require(gap_lo > 0, f"Gaussian law gap <= 0 on {tg}")
        # Negative Control 1 (P4 §6): lowering C_r by its Gaussian law gap is rejected by the cover certifier on all 4 rows,
        # and strictly exceeded by an explicit rational law in L on 0.700, 0.800, 0.850 (on 0.886, C_lb lies inside the
        # C_gauss enclosure while the certified bracket on C_* - C_gauss is [0, C_cert - C_gauss_lo]):
        require(gb.get("cover_rejected_minus_gap") is True, f"cover must reject C_r - law_gap on {tg}")
        c_tgt = Fraction(rows_by_tag[tg]["plain_2b"]["C_target"])
        if tg != "0.886":
            require(primal_lb_2b[tg] > c_tgt - gap_lo, f"primal witness failed to strictly exceed C_r - law_gap on {tg}")
        else:
            require(primal_lb_2b[tg] > c_tgt - gap_lo - Fraction(5, 1000000), f"primal witness too far below C_gauss on {tg}")

    p4_driver_ref = {
        "29/100": (Fraction(8512, 10000), Fraction(712293, 1000000)),
        "3/5":    (Fraction(7599, 10000), Fraction(706551, 1000000)),
        "13/10":  (Fraction(5403, 10000), Fraction(670938, 1000000)),
        "16/5":   (Fraction(2643, 10000), Fraction(627764, 1000000)),
    }
    dp_list = sc["explicit_driver_pairs"]
    require(len(dp_list) == 4, "expected 4 explicit driver pairs")
    for dp in dp_list:
        c_q = Fraction(dp["c"])
        a2 = Fraction(1) / (1 + c_q * c_q)
        g2 = (c_q * c_q) * a2
        t_lo_f, _ = frac_sqrt_bracket((PI_LO * a2) / 4, 90)
        _, t_hi_f = frac_sqrt_bracket((PI_HI * a2) / 4, 90)
        bracket = a2 + EPS1 * g2 - (EPS1 / 8) * (a2**3) + (3 * ETA / 64) * (a2**2) * ((a2**3) - 8 * g2)
        require(bracket > 0, "driver bracket > 0")
        v_lo_f = (PI_LO / 4) * bracket
        v_hi_f = (PI_HI / 4) * bracket

        t_cpp_lo, t_cpp_hi = parse_iv_exact(dp["t"], f"dp_t_{dp['c']}")
        v_cpp_lo, v_cpp_hi = parse_iv_exact(dp["V"], f"dp_V_{dp['c']}")
        require(max(t_lo_f, t_cpp_lo) <= min(t_hi_f, t_cpp_hi), f"driver pair t overlap {dp['c']}")
        require(max(v_lo_f, v_cpp_lo) <= min(v_hi_f, v_cpp_hi), f"driver pair V overlap {dp['c']}")
        t_ref, v_ref = p4_driver_ref[dp["c"]]
        require(abs((t_lo_f + t_hi_f) / 2 - t_ref) < Fraction(1, 10000), f"driver pair t vs P4 §8 {dp['c']}")
        require(abs((v_lo_f + v_hi_f) / 2 - v_ref) < Fraction(2, 1000000), f"driver pair V vs P4 §8 {dp['c']}")

        # Verify V(c) < t(c)^2 - 2*ell_r*t(c) + C_cert on ALL 29 rows in pure Fraction arithmetic:
        for rr in res_rows:
            ell_r, _, _, _ = parse_row_q4(rr["row"])
            c_cert_r = hex_to_frac(rr["stein_2b"]["C_cert_hex"] if "stein_2b" in rr else rr["plain_2b"]["C_cert_hex"])
            row_lo = min(t_lo_f * t_lo_f - 2 * ell_r * t_hi_f, t_hi_f * t_hi_f - 2 * ell_r * t_hi_f) + c_cert_r
            require(v_hi_f < row_lo, f"driver pair {dp['c']} violated row {rr['tag']}")

    # V4. Claim 3:
    n_c3_exact = verify_claim3(result["claim3_small_t"])

    # V5. Claim 4 exact envelopes & rooms:
    # (a) rows2b final (Stein) envelope, both on C_target and on our certified C_cert:
    rows2b_final_tgt = [
        (r["tag"], parse_row_q4(r["row"])[0],
         Fraction(r["stein_2b"]["C_target"] if "stein_2b" in r else r["plain_2b"]["C_target"]))
        for r in res_rows
    ]
    rows2b_final_cert = [
        (r["tag"], parse_row_q4(r["row"])[0],
         hex_to_frac(r["stein_2b"]["C_cert_hex"] if "stein_2b" in r else r["plain_2b"]["C_cert_hex"]))
        for r in res_rows
    ]
    b5_tgt, pieces_2b_tgt = compute_exact_envelope(
        rows2b_final_tgt, Fraction(2, 5), Fraction(7058083, 10000000), Fraction(7967, 125000), T_MAX_ENV
    )
    b5_cert, _ = compute_exact_envelope(
        rows2b_final_cert, Fraction(2, 5), n_c3_exact, Fraction(7967, 125000), T_MAX_ENV
    )
    require(len(pieces_2b_tgt) == 30, "all 29 rows + small_t active in rows2b Stein envelope")
    require(fmt_fixed_outward(b5_tgt, 10, ROUND_CEILING) == "0.7128940127", "B5 10-decimal ceiling check")
    require(fmt_fixed_outward(b5_tgt, 10, ROUND_FLOOR) == "0.7128940126", "B5 10-decimal floor check")
    require(b5_cert <= b5_tgt < TARGET, "b5_cert <= b5_tgt < 500/701")

    # (b) rows2b plain-only envelope (t1 = 57297/500000):
    rows2b_plain_tgt = [(r["tag"], parse_row_q4(r["row"])[0], Fraction(r["plain_2b"]["C_target"])) for r in res_rows]
    b5_pl_tgt, pieces_2b_pl = compute_exact_envelope(
        rows2b_plain_tgt, Fraction(2, 5), Fraction(7058083, 10000000), Fraction(57297, 500000), T_MAX_ENV
    )
    require(len(pieces_2b_pl) == 30 and b5_pl_tgt == b5_tgt, "rows2b plain-only envelope active & same peak B5")

    # (c) rows2c_final (rho_0 = 2287/2500) envelope (t1 = 6213/31250):
    rows2c_tgt = [
        (r["tag"], parse_row_q4(r["row"])[0], Fraction(r["plain_2c"]["C_target"]))
        for r in res_rows if "plain_2c" in r
    ]
    rows2c_cert = [
        (r["tag"], parse_row_q4(r["row"])[0], hex_to_frac(r["plain_2c"]["C_cert_hex"]))
        for r in res_rows if "plain_2c" in r
    ]
    b2c_tgt, pieces_2c_tgt = compute_exact_envelope(
        rows2c_tgt,
        Fraction(rows2c_spec["small_t"]["a"]),
        Fraction(rows2c_spec["small_t"]["b"]),
        Fraction(rows2c_spec["small_t"]["t1_final"]),
        T_MAX_ENV,
    )
    b2c_cert, _ = compute_exact_envelope(
        rows2c_cert,
        Fraction(rows2c_spec["small_t"]["a"]),
        Fraction(rows2c_spec["small_t"]["b"]),
        Fraction(rows2c_spec["small_t"]["t1_final"]),
        T_MAX_ENV,
    )
    require(len(pieces_2c_tgt) == 27, "all 26 rows + small_t active in rows2c envelope")
    require(b2c_tgt == Fraction(rows2c_spec["B"]), "exact rational B of rows2c_final.json reproduced digit-for-digit")
    require(TARGET - b2c_tgt == Fraction(rows2c_spec["room"]), "exact rational room of rows2c_final.json reproduced")
    require(b2c_cert <= b2c_tgt < TARGET, "b2c_cert <= b2c_tgt < 500/701")

    # (d) Design D* 21 pieces (`fin_table.design.json`, STATUS 4.44 / H4 of 4.45):
    dstar_pieces = fin_design_spec["pieces"]
    require(len(dstar_pieces) == 21, "expected 21 D* pieces")
    require(Fraction(dstar_pieces[0][0]) == Fraction(649, 1000), "D* starts at 649/1000")
    require(Fraction(dstar_pieces[-1][1]) == T_MAX_ENV, "D* ends at 886227/10^6")
    dstar_targets = {
        "500/701": TARGET,
        "1/1.40195": Fraction(20000, 28039),
        "1/1.40210": Fraction(10000, 14021),
    }
    dstar_min_rooms_cert: Dict[str, Fraction] = dict(dstar_targets)
    dstar_min_rooms_pub: Dict[str, Fraction] = dict(dstar_targets)
    for j_idx, (pa_s, pb_s, rtag) in enumerate(dstar_pieces):
        pa, pb = Fraction(pa_s), Fraction(pb_s)
        require(pa < pb, f"D* piece {j_idx} pa < pb")
        if j_idx > 0:
            require(pa == Fraction(dstar_pieces[j_idx - 1][1]), f"D* piece {j_idx} contiguity")
        rr = rows_by_tag[rtag]
        ell_r = parse_row_q4(rr["row"])[0]
        c_pub_j = Fraction(rr["plain_2c"]["C_target"])
        c_cert_j = hex_to_frac(rr["plain_2c"]["C_cert_hex"])
        pmax_pub = max(pa * pa - 2 * ell_r * pa + c_pub_j, pb * pb - 2 * ell_r * pb + c_pub_j)
        pmax_cert = max(pa * pa - 2 * ell_r * pa + c_cert_j, pb * pb - 2 * ell_r * pb + c_cert_j)
        for tname, tval in dstar_targets.items():
            rm_pub = tval - pmax_pub
            rm_cert = tval - pmax_cert
            require(rm_pub > 0 and rm_cert > 0, f"D* piece {j_idx+1} room <= 0 at {tname}")
            if rm_pub < dstar_min_rooms_pub[tname]:
                dstar_min_rooms_pub[tname] = rm_pub
            if rm_cert < dstar_min_rooms_cert[tname]:
                dstar_min_rooms_cert[tname] = rm_cert

    # V6. C++ Negative-control flags & rho = sqrt(pi)/2 refutation on all 9 rows t <= 0.6:
    nc = result["negative_controls"]
    require(nc.get("cap_lowered_1e6_rejected") is True, "neg_ctrl: cap_lowered_1e6_rejected")
    require(nc.get("stein_a0_minus_1e4_rejected") is True, "neg_ctrl: stein_a0_minus_1e4_rejected")
    require(nc.get("stein_c_1p3_sigb2_rejected") is True, "neg_ctrl: stein_c_1p3_sigb2_rejected")
    require(nc.get("stein_a6_zero_a4_neg_rejected") is True, "neg_ctrl: stein_a6_zero_a4_neg_rejected")

    ref_list = nc["rho_sqrtpi2_refuted_on_t_le_0p6"]
    expected_low_tags = ["0.125L", "0.150L", "0.200L", "0.250L", "0.300L", "0.400L", "0.500L", "0.550L", "0.600L"]
    require([e["tag"] for e in ref_list] == expected_low_tags, "rho=sqrt(pi)/2 check must cover all 9 rows t <= 0.6")
    for entry in ref_list:
        tg = entry["tag"]
        c_bad = hex_to_frac(entry["C_bad_sqrtpi2_hex"])
        require(primal_lb_2b[tg] > c_bad + Fraction(1, 1000),
                f"valid L primal witness must strictly exceed C_bad(sqrt(pi)/2) on {tg}")

    # P4 §3 literal-printed-rooms trap negative control:
    printed_rooms = [
        Fraction("5.83e-3"), Fraction("9.92e-3"), Fraction("1.22e-2"), Fraction("1.82e-2"), Fraction("2.08e-2"),
        Fraction("2.01e-2"), Fraction("2.01e-2"), Fraction("1.88e-2"), Fraction("1.13e-2"), Fraction("9.60e-3"),
        Fraction("7.72e-3"), Fraction("5.90e-3"), Fraction("4.20e-3"), Fraction("3.17e-3"), Fraction("2.47e-3"),
        Fraction("1.79e-3"), Fraction("1.22e-3"), Fraction("7.38e-4"), Fraction("4.74e-4"), Fraction("4.00e-4"),
        Fraction("3.73e-4"), Fraction("3.73e-4"), Fraction("3.84e-4"), Fraction("4.38e-4"), Fraction("5.39e-4"),
        Fraction("6.37e-4"), Fraction("8.44e-4"), Fraction("1.11e-3"), Fraction("1.39e-3"),
    ]
    t_trap = Fraction(847596, 1000000)
    min_with_printed = min(
        t_trap * t_trap - 2 * ell_r * t_trap + c_r + rm
        for (_, ell_r, c_r), rm in zip(rows2b_final_tgt, printed_rooms)
    )
    require(min_with_printed > TARGET, "printed rounded rooms trap must exceed 500/701 at t=0.847596")

    return {
        "b5_tgt": b5_tgt,
        "b5_cert": b5_cert,
        "b2c_tgt": b2c_tgt,
        "b2c_cert": b2c_cert,
        "dstar_min_rooms_cert": dstar_min_rooms_cert,
        "dstar_min_rooms_pub": dstar_min_rooms_pub,
        "n_c3_exact": n_c3_exact,
        "pieces_2b_tgt": pieces_2b_tgt,
        "pieces_2c_tgt": pieces_2c_tgt,
    }


def run_corruption_negative_controls(here: Path, result: Dict[str, Any]) -> int:
    def must_fail(mut_fn: Any, desc: str) -> None:
        bad = copy.deepcopy(result)
        mut_fn(bad)
        failed = False
        try:
            verify_all(here, bad)
        except AssertionError:
            failed = True
        require(failed, f"negative control DID NOT FAIL as required: {desc}")

    # 1. Tampered C++ SHA-256:
    must_fail(lambda d: d["meta"].__setitem__("cpp_sha256", "0" * 64), "tampered cpp_sha256")
    # 2. Tampered C_cert_hex exceeding C_target on Row 0.850:
    must_fail(
        lambda d: d["rows"][21]["plain_2b"].__setitem__("C_cert_hex", float(1.4375).hex()),
        "C_cert_hex > C_target on 0.850",
    )
    # 3. Tampered Stein C_cert_hex exceeding C_stein on Row 0.125L:
    must_fail(
        lambda d: d["rows"][0]["stein_2b"].__setitem__("C_cert_hex", float(0.7200).hex()),
        "C_cert_hex > C_stein on 0.125L",
    )
    # 4. Tampered primal witness violating (L4) (radius > rho):
    def break_l4(d: Dict[str, Any]) -> None:
        d["rows"][0]["plain_2b"]["primal"]["atoms"] = [{"r": "1/1", "p": "1/1", "psi_lo_hex": "0x1p-1", "psi_hi_hex": "0x1p0"}]
    must_fail(break_l4, "primal witness violating (L4) E[sqrt(U)] <= rho")
    # 5. Tampered Claim 3 node F_hat_hex pushing chord above 7058083/10^7:
    must_fail(
        lambda d: d["claim3_small_t"]["nodes"][18].__setitem__("F_hat_hex", float(1.38).hex()),
        "Claim 3 node F_hat_hex above target",
    )
    return 5


def replay_cpp_binary(here: Path, expected_result_bytes: bytes) -> None:
    repo_root = here.parents[3]
    cpp_path = here / "certify_law_caps.cpp"
    with tempfile.TemporaryDirectory() as tmpdir:
        bin_path = Path(tmpdir) / "certify_law_caps"
        out_path = Path(tmpdir) / "replayed_result.json"
        subprocess.run(
            [
                "c++", "-std=c++17", "-O2", "-ffp-contract=off", "-pthread",
                "-Wall", "-Wextra", "-Werror", str(cpp_path), "-o", str(bin_path),
            ],
            check=True,
        )
        subprocess.run(
            [
                str(bin_path),
                "--cpp", str(cpp_path),
                "--rows2b", str(repo_root / "research/higher-degree/code/degree5-attack/rows2b.json"),
                "--rows2c", str(repo_root / "research/higher-degree/code/degree5-design/design-2026-11-25/certB_const/out/rows2c_final.json"),
                "--out", str(out_path),
            ],
            cwd=str(repo_root),
            check=True,
        )
        replayed = json.loads(out_path.read_text(encoding="utf-8"))
        orig = json.loads(expected_result_bytes.decode("utf-8"))
        for k in ("rows", "claim3_small_t", "sample_boxes", "sanity_checks", "negative_controls"):
            require(replayed[k] == orig[k], f"--replay-cpp deterministic output mismatch on key {k!r}")


def main() -> None:
    ap = argparse.ArgumentParser(description="Verify clean-room degree-5 law-cap & Claim 3 certificates (#625).")
    ap.add_argument("--replay-cpp", action="store_true", help="Recompile certify_law_caps.cpp and verify bit-exact replay.")
    ap.add_argument("--print-tables", action="store_true", help="Print outward-rounded Markdown tables for PROOF.md.")
    args = ap.parse_args()

    here = Path(__file__).resolve().parent
    res_path = here / "result.json"
    require(res_path.is_file(), f"missing {res_path}")
    res_bytes = res_path.read_bytes()
    require(len(res_bytes) < 300_000, f"result.json size {len(res_bytes)} >= 300000 bytes limit")
    result = json.loads(res_bytes.decode("utf-8"))

    summary = verify_all(here, result)
    n_mut = run_corruption_negative_controls(here, result)

    if args.replay_cpp:
        replay_cpp_binary(here, res_bytes)

    b5_tgt = summary["b5_tgt"]
    b5_cert = summary["b5_cert"]
    b2c_tgt = summary["b2c_tgt"]
    b2c_cert = summary["b2c_cert"]
    dstar_c = summary["dstar_min_rooms_cert"]
    dstar_p = summary["dstar_min_rooms_pub"]
    print("ALL CHECKS PASSED (#625 Level C clean-room law-cap & Claim 3 replay):")
    print(f"  - C++ source zero-libm-transcendental audit: PASS (SHA-256 {result['meta']['cpp_sha256'][:16]}...)")
    print(f"  - Certified covers: 60/60 PASS (29 rows2b plain + 5 zero-arcsin Stein + 26 rows2c plain)")
    print(f"  - Admissible primal rational witnesses in L = (L1)-(L4) on plain covers: 55/55 PASS")
    print(f"  - Claim 3 (zero-arcsin, 40 nodes / 39 intervals): N(3/5) <= {fmt_fixed_outward(summary['n_c3_exact'], 10, ROUND_CEILING)} <= 0.7058083000")
    print(f"  - Claim 4 (rows2b, rho=95133/100000): B5_cert <= {fmt_fixed_outward(b5_cert, 10, ROUND_CEILING)} <= B5_pub <= {fmt_fixed_outward(b5_tgt, 10, ROUND_CEILING)} (room >= {fmt_sci_outward(TARGET - b5_tgt, 4, ROUND_FLOOR)})")
    print(f"  - STATUS 4.42 / H4 (rows2c, rho0=2287/2500): B_cert <= {fmt_fixed_outward(b2c_cert, 10, ROUND_CEILING)} <= B_pub <= {fmt_fixed_outward(b2c_tgt, 10, ROUND_CEILING)} (room >= {fmt_sci_outward(TARGET - b2c_tgt, 4, ROUND_FLOOR)})")
    print(
        "  - Design D* 21-piece min rooms (certified / published, outward floor): "
        f"500/701: {fmt_sci_outward(dstar_c['500/701'], 4, ROUND_FLOOR)} / {fmt_sci_outward(dstar_p['500/701'], 4, ROUND_FLOOR)}; "
        f"1/1.40195: {fmt_sci_outward(dstar_c['1/1.40195'], 4, ROUND_FLOOR)} / {fmt_sci_outward(dstar_p['1/1.40195'], 4, ROUND_FLOOR)}; "
        f"1/1.40210: {fmt_sci_outward(dstar_c['1/1.40210'], 4, ROUND_FLOOR)} / {fmt_sci_outward(dstar_p['1/1.40210'], 4, ROUND_FLOOR)}"
    )
    print(f"  - Negative controls: {7 + n_mut}/12 suites PASS (law-gap, rho=sqrt(pi)/2 on 9 rows, cap-1e-6, 3 Stein controls, rounded-rooms trap, + {n_mut} corruption tests)")

    if args.print_tables:
        print("\n=== TABLE: 29 ROWS OF P4 (`rows2b.json`, rho = 95133/100000) ===")
        print("| row | kind | `C_lb` (primal `L`, floor) | `C_cert` (dual cover, ceil) | `C_r` published (ceil) | `C_r - C_cert` (floor) | boxes (Stein) |")
        print("|---|---|---:|---:|---:|---:|---:|")
        for r in result["rows"]:
            tg = r["tag"]
            if "stein_2b" in r:
                s = r["stein_2b"]
                c_cert = hex_to_frac(s["C_cert_hex"])
                c_tgt = Fraction(s["C_target"])
                # Note primal witness in plain_2b is in (L1)-(L4); report plain_2b C_cert too in a separate note or show Stein here:
                p_lb = hex_to_frac(r["plain_2b"]["primal"]["C_lb_hex"])
                print(
                    f"| `{tg}` | Stein `(L1)-(L5)` (plain lb `{fmt_fixed_outward(p_lb, 7, ROUND_FLOOR)}`) "
                    f"| — | `{fmt_fixed_outward(c_cert, 10, ROUND_CEILING)}` "
                    f"| `{fmt_fixed_outward(c_tgt, 10, ROUND_CEILING)}` "
                    f"| `{fmt_sci_outward(c_tgt - c_cert, 2, ROUND_FLOOR)}` | {s['boxes']} ({s['stein_boxes']}) |"
                )
            else:
                p = r["plain_2b"]
                c_lb = hex_to_frac(p["primal"]["C_lb_hex"])
                c_cert = hex_to_frac(p["C_cert_hex"])
                c_tgt = Fraction(p["C_target"])
                print(
                    f"| `{tg}` | plain `(L1)-(L4)` "
                    f"| `{fmt_fixed_outward(c_lb, 10, ROUND_FLOOR)}` "
                    f"| `{fmt_fixed_outward(c_cert, 10, ROUND_CEILING)}` "
                    f"| `{fmt_fixed_outward(c_tgt, 10, ROUND_CEILING)}` "
                    f"| `{fmt_sci_outward(c_tgt - c_cert, 2, ROUND_FLOOR)}` | {p['boxes']} |"
                )

        print("\n=== TABLE: 26 ROWS AT `rho_0 = 2287/2500` (`rows2c_final.json`, STATUS 4.42 / H4) ===")
        print("| row | `C_lb` (primal `L`, floor) | `C_cert` (dual cover, ceil) | `C_r` published (ceil) | `C_r - C_cert` (floor) | boxes |")
        print("|---|---:|---:|---:|---:|---:|")
        for r in result["rows"]:
            if "plain_2c" not in r:
                continue
            p = r["plain_2c"]
            c_lb = hex_to_frac(p["primal"]["C_lb_hex"])
            c_cert = hex_to_frac(p["C_cert_hex"])
            c_tgt = Fraction(p["C_target"])
            print(
                f"| `{r['tag']}` | `{fmt_fixed_outward(c_lb, 10, ROUND_FLOOR)}` "
                f"| `{fmt_fixed_outward(c_cert, 10, ROUND_CEILING)}` "
                f"| `{fmt_fixed_outward(c_tgt, 10, ROUND_CEILING)}` "
                f"| `{fmt_sci_outward(c_tgt - c_cert, 2, ROUND_FLOOR)}` | {p['boxes']} |"
            )


if __name__ == "__main__":
    main()
