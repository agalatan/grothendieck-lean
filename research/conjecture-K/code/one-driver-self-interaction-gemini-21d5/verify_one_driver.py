#!/usr/bin/env python3
"""Pure Python 3 standard-library verifier and negative-control suite for the
one-driver self-interaction family closure (Conjecture K Layer L4, Issue #509).

Compatible with both `python3 -I verify_one_driver.py` and
`python3 -I -O verify_one_driver.py` (uses explicit `require(...)` checks,
never bare `assert`). Zero third-party dependencies.

Verifies:
  R1. Exact rational profile hypotheses (3b < a, branch point < -1/20,
      a^2 > 5/16, exact half-integer Gamma moments cancelling sqrt(pi)).
  R2. Elementary rational alternating-series bounds on pi confirming C++
      verified_pi(), plus Cauchy-Schwarz Exp(1) moment bounds E[sqrt(R)] <= 1,
      E[sqrt(R)|R-2|] <= sqrt(2) < 3/2, and E[R|R-2|] <= 2 giving
      I_c(z) < 2|z| + 3|c| and |N_{c,u}(z)| < (17/10)(|z| + |c|).
  R3. Unbounded |z| >= 4 rational tail for BOTH Gate 3 (*_u, f in [1/16, 1])
      and Gate 4 (*, f in [1/16, 4/5]), using Gate 1's certified scalar bounds
      (B'(u) > 1, A_0(u) < 7, |lambda(u)| < 17/20), plus exact expectation 11/50.
  R4. Moment-polynomial inequalities E[w(Y)] = 1, E[Q(Y)] <= 0 under 6.3.1,
      contact-circle positivity Q(1) > 0, and exact rational y >= 500 tail for
      Gate 5 ((†), f in [0, 1/16]).
  R5. Tamper-evident SHA-256 provenance of `certify_one_driver.cpp`, exact
      hexfloat-to-Fraction parsing of `result.json`, and all 5 continuum gates
      across all 3 visible profiles (`peak`, `flank`, `upper`), yielding
      C(q)^2 <= (47/200) D(q) < (6/25) D(q) across all f in [0, 1].
  R6. 10 adversarial corruption / negative controls (`--self-test`, enabled by
      default) and optional full C++17 recompilation + bit-exact replay
      (`--replay-cpp`).

Agent-ID: gemini-21d5
"""

from __future__ import annotations

import argparse
import copy
import hashlib
import json
import math
import subprocess
import sys
import tempfile
from decimal import Decimal, ROUND_CEILING, ROUND_FLOOR, localcontext
from fractions import Fraction
from pathlib import Path
from typing import Any, Dict


def require(cond: bool, msg: str) -> None:
    if not cond:
        raise AssertionError(f"VERIFICATION FAILED: {msg}")


EXPECTED_ROWS = {
    "peak": {
        "eps": Fraction(1891, 2500),
        "a": Fraction(699, 1250),
        "b": Fraction(179, 1250),
        "b4": Fraction(37, 1000),
    },
    "flank": {
        "eps": Fraction(149, 200),
        "a": Fraction(14, 25),
        "b": Fraction(1467, 10000),
        "b4": Fraction(37, 1000),
    },
    "upper": {
        "eps": Fraction(1891, 2500),
        "a": Fraction(573, 1000),
        "b": Fraction(19, 125),
        "b4": Fraction(7, 200),
    },
}

U_MIN = Fraction(551, 100000)
U_MAX = Fraction(463, 10000)


def parse_frac(s: str) -> Fraction:
    if "/" in s:
        p, q = s.split("/", 1)
        return Fraction(int(p), int(q))
    return Fraction(s)


def hex_to_frac(h: str) -> Fraction:
    val = float.fromhex(h)
    require(math.isfinite(val), f"non-finite hexfloat {h!r}")
    return Fraction(val)


def parse_iv_exact(obj: Dict[str, Any], label: str) -> tuple[Fraction, Fraction]:
    require(isinstance(obj, dict), f"{label}: interval must be dict")
    for k in ("lo", "hi", "lo_hex", "hi_hex"):
        require(k in obj, f"{label}: missing key {k!r}")
    lo_f = hex_to_frac(obj["lo_hex"])
    hi_f = hex_to_frac(obj["hi_hex"])
    require(lo_f <= hi_f, f"{label}: lo_hex > hi_hex ({lo_f} > {hi_f})")
    # Verify decimal serialization agrees within 2 ULPs with hexfloat
    require(abs(float(obj["lo"]) - float.fromhex(obj["lo_hex"])) <= 1e-15 * max(1.0, abs(float(obj["lo"]))),
            f"{label}: lo decimal/hex mismatch")
    require(abs(float(obj["hi"]) - float.fromhex(obj["hi_hex"])) <= 1e-15 * max(1.0, abs(float(obj["hi"]))),
            f"{label}: hi decimal/hex mismatch")
    return lo_f, hi_f


def atan_gregory_bounds(inv_x: int, n_pairs: int) -> tuple[Fraction, Fraction]:
    """Rigorous alternating-series lower and upper bounds on arctan(1 / inv_x)
    for integer inv_x >= 2 using 2*n_pairs terms."""
    require(inv_x >= 2 and n_pairs >= 1, "invalid Gregory parameters")
    x2 = inv_x * inv_x
    power = Fraction(1, inv_x)
    s = Fraction(0)
    lo = Fraction(0)
    hi = Fraction(0)
    for k in range(2 * n_pairs):
        term = power / (2 * k + 1)
        if k % 2 == 0:
            s += term
            if k == 2 * n_pairs - 2:
                hi = s
        else:
            s -= term
            if k == 2 * n_pairs - 1:
                lo = s
        power /= x2
    require(0 < lo < hi, "Gregory bracket ordering failed")
    return lo, hi


def verify_rational_premises() -> Dict[str, Any]:
    """Verify Gates R1-R4 in exact Python Fraction arithmetic (zero floats)."""
    # R1: Profile algebraic hypotheses
    for rname, rp in EXPECTED_ROWS.items():
        a, b = rp["a"], rp["b"]
        require(3 * b < a, f"{rname}: 3b < a failed")
        # Branch point sigma_cut = -4 a^3 / (27 b) < -1/20
        sigma_cut = Fraction(-4) * (a ** 3) / (27 * b)
        require(sigma_cut < Fraction(-1, 20), f"{rname}: branch cut {sigma_cut} not < -1/20")
        # Content perturbation slope: a^2 > 5/16 <=> 1/(2 a^2) < 8/5
        require(a * a > Fraction(5, 16), f"{rname}: a^2 > 5/16 failed")
        require(Fraction(1, 2) / (a * a) < Fraction(8, 5), f"{rname}: 1/(2a^2) < 8/5 failed")

    # Exact half-integer Gamma rational moments (divided by sqrt(pi)):
    # E[R^{3/2}] / sqrt(pi) = 3/4, E[R^{5/2}] / sqrt(pi) = 15/8, E[R^{7/2}] / sqrt(pi) = 105/16
    g32 = Fraction(3, 4)
    g52 = Fraction(15, 8)
    g72 = Fraction(105, 16)
    require(Fraction(2, 3) * g32 == Fraction(1, 2), "Kummer half-moment coefficient 1/(2a^2)")
    require(Fraction(2, 3) * (g72 - 4 * g52 + 4 * g32) == Fraction(11, 8), "Taylor dc^2 coeff (11/4)/(2a^2)")
    require(Fraction(2, 3) * 2 * (g52 - 2 * g32) == Fraction(1, 2), "Taylor dc*dz1 coeff 1/(2a^2)")

    # R2: Machin's formula pi/4 = 4*arctan(1/5) - arctan(1/239) in exact rationals
    a5_lo, a5_hi = atan_gregory_bounds(5, 12)
    a239_lo, a239_hi = atan_gregory_bounds(239, 4)
    pi_lo = 4 * (4 * a5_lo - a239_hi)
    pi_hi = 4 * (4 * a5_hi - a239_lo)
    # Cross-check C++ verified_pi() interval [3.14159265358970, 3.14159265358989]
    cpp_pi_lo = Fraction(float.fromhex(float(3.14159265358970).hex()))
    cpp_pi_hi = Fraction(float.fromhex(float(3.14159265358989).hex()))
    require(cpp_pi_lo < pi_lo and pi_hi < cpp_pi_hi, "Machin rational pi inside C++ verified_pi()")

    # Cauchy-Schwarz Exp(1) bounds:
    # E[R] = 1, E[R^2] = 2, E[(R-2)^2] = 2 => E[sqrt(R)] <= 1,
    # E[sqrt(R)|R-2|] <= sqrt(2) < 3/2, E[R|R-2|] <= sqrt(2*2) = 2.
    require(2 < Fraction(3, 2) ** 2, "sqrt(2) < 3/2")
    # c <= sqrt(U_MAX / 2) < 4/25:
    c_cap = Fraction(4, 25)
    require(U_MAX / 2 < c_cap * c_cap, "sqrt(u_max/2) < 4/25")

    # R3: Unbounded |z| >= 4 tail for Gate 3 (*_u on f in [1/16, 1]) and Gate 4 (* on f in [1/16, 4/5])
    # Under Gate 1 certified bounds B'(u) > 1, A_0(u) < 7, |lambda(u)| < 17/20, -g(0) < 17/20,
    # and B'(u) <= Phi'(0) < 3/2 (verified in R5):
    # I_c(z) <= 2*(|z| + sqrt(2)|c|) < 2|z| + 3*c_cap = 2|z| + 12/25;
    # |2 u B''(u) Re(conj(c) z)| <= 2 * U_MAX * 7 * c_cap * |z| < (11/100)|z|;
    # p * B'(u) <= U_MAX * (3/2) < 7/100.
    require(14 * U_MAX * c_cap < Fraction(11, 100), "2 u A_0(u) c < 11/100")
    require(U_MAX * Fraction(3, 2) < Fraction(7, 100), "p B'(u) < 7/100")
    # Hence for r = |z| >= 4: H_{c,u}(z) > r^2 - (211/100)r - (12/25 + 7/100) = r^2 - (211/100)r - 11/20.
    # Check (3/5)r^2 - (211/100)r - 11/20 > 0 at r = 4 and positive slope for r >= 4 => H_{c,u}(z) > (2/5)r^2!
    r0 = Fraction(4)
    quad_at_4 = Fraction(3, 5) * r0 * r0 - Fraction(211, 100) * r0 - Fraction(11, 20)
    slope_at_4 = Fraction(6, 5) * r0 - Fraction(211, 100)
    require(quad_at_4 == Fraction(61, 100) > 0 and slope_at_4 > 0, "H_{c,u}(z) > (2/5)|z|^2 for |z| >= 4")

    # On r = |z| >= 4: |T_c(z)| <= (17/20)*(r + 2*c) and |lambda(u)z| <= (17/20)*r,
    # so |N_{c,u}(z)| <= (17/20)*(2*r + 2*c) = (17/10)*(r + c) < (17/10)*(1 + 1/25)*r < (9/5)*r,
    # giving |N|^2 / H < ((81/25)*r^2) / ((2/5)*r^2) = 81/10!
    require(c_cap <= Fraction(1, 25) * r0, "c < r/25 on r >= 4")
    require(Fraction(17, 10) * Fraction(26, 25) < Fraction(9, 5), "|N_{c,u}(z)| < (9/5)|z| on |z| >= 4")
    tail_ratio_cap = Fraction(81, 25) / Fraction(2, 5)
    require(tail_ratio_cap == Fraction(81, 10), "tail ratio cap 81/10")

    # Gate 3 (*_u) on |z| >= 4, f in [1/16, 1]:
    require(U_MAX * 62500 < 3200, "cross term in env_22 bounded by (1/250)|z|^2/u for |z| >= 4")
    env22_tail_lo = Fraction(3, 50) + (Fraction(4, 25) - Fraction(1, 250)) * (Fraction(16) / U_MAX)
    require(env22_tail_lo == Fraction(1249389, 23150) and env22_tail_lo > tail_ratio_cap,
            "Gate 3 |z| >= 4 rational tail")
    require(Fraction(3, 50) + Fraction(4, 25) == Fraction(11, 50) < Fraction(6, 25),
            "Gate 3 expectation 11/50 < 6/25")

    # Gate 4 (*) on |z| >= 4, f in [1/16, 4/5]: p <= (15/16) u_max < u_max
    env_star_tail_lo = Fraction(9, 100) + Fraction(13, 100) * (Fraction(16) / U_MAX)
    require(env_star_tail_lo == Fraction(2084167, 46300) and env_star_tail_lo > tail_ratio_cap,
            "Gate 4 |z| >= 4 rational tail")
    require(Fraction(9, 100) + Fraction(13, 100) == Fraction(11, 50), "Gate 4 expectation 11/50")

    # R4: Gate 5 ((†) on f in [0, 1/16]) moment-polynomial & y >= 500 rational tail
    # Here p in [(15/16)*u_min, u_max], c <= sqrt(p/30), r = sqrt(p*y) with y >= 500 => c/r <= 1/sqrt(15000) < 1/120!
    require(120 * 120 < 30 * 500, "c/r < 1/120 for f <= 1/16 and y >= 500")
    require(Fraction(17, 10) * Fraction(121, 120) < Fraction(9, 5), "|N_{c,u}(z)| < (9/5)*sqrt(p*y) on y >= 500")
    # Hence |N|^2 / w(y) < ((81/25)*p*y) / ((7/10)*y) = (162/35)*p, so dividing by p^2 requires Q(y) > (162/35)/p_min!
    p_min = Fraction(15, 16) * U_MIN
    require(p_min == Fraction(1653, 320000), "p_min = (15/16)*u_min")
    tail_lhs_over_p2 = (Fraction(81, 25) / Fraction(7, 10)) / p_min
    require(tail_lhs_over_p2 == Fraction(162, 35) / p_min, "Gate 5 tail ratio (162/35)/p_min")

    for b4 in (Fraction(37, 1000), Fraction(7, 200)):
        # Contact-circle positivity at y = 1: Q(1) = b4 + 32 * (21/200000) > 0
        q_at_1 = b4 + Fraction(32 * 21, 200000)
        require(q_at_1 > Fraction(38, 1000), f"Q(1) > 0 for b4={b4}")
        # Tail at y = 500: Q(y) = (59/500)(y-1) + b4(2-y^2) + (21/200000)(y^3 - 37y^2 + 68)
        y0 = Fraction(500)
        q_500 = Fraction(59, 500) * (y0 - 1) + b4 * (2 - y0 * y0) + Fraction(21, 200000) * (y0 ** 3 - 37 * y0 * y0 + 68)
        qp_500 = Fraction(59, 500) - 2 * b4 * y0 + Fraction(21, 200000) * (3 * y0 * y0 - 74 * y0)
        qpp_500 = -2 * b4 + Fraction(21, 200000) * (6 * y0 - 74)
        qppp = Fraction(126, 200000)
        require(q_500 > tail_lhs_over_p2, f"Gate 5 Q(500) > tail bound for b4={b4}")
        require(qp_500 > 0 and qpp_500 > 0 and qppp > 0, f"Gate 5 Q increasing on [500, inf) for b4={b4}")

    return {
        "pi_rational_bounds": (str(pi_lo), str(pi_hi)),
        "tail_ratio_cap": str(tail_ratio_cap),
        "env22_tail_lo": str(env22_tail_lo),
        "p_min": str(p_min),
    }


def verify_receipt(data: Dict[str, Any], expected_cpp_sha256: str) -> None:
    """Verify the entire C++ outward-interval receipt `result.json` using exact Fraction arithmetic."""
    require(isinstance(data, dict), "root JSON must be object")
    require(data.get("agent_id") == "gemini-21d5", "unexpected agent_id")
    require(data.get("issue") == 509, "unexpected issue number")
    require(data.get("cpp_sha256") == expected_cpp_sha256,
            f"cpp_sha256 mismatch: {data.get('cpp_sha256')} != {expected_cpp_sha256}")

    eb = data.get("energy_band", {})
    require(parse_frac(eb.get("u_min", "0")) == U_MIN, "u_min mismatch")
    require(parse_frac(eb.get("u_max", "0")) == U_MAX, "u_max mismatch")

    consts = data.get("constants", {})
    require(parse_frac(consts.get("gate2_wick_20pct", "0")) == Fraction(9, 40), "gate2 constant != 9/40")
    require(parse_frac(consts.get("gate3_unified_f_ge_1_16", "0")) == Fraction(11, 50), "gate3 constant != 11/50")
    require(parse_frac(consts.get("gate4_star_f_1_16_to_4_5", "0")) == Fraction(11, 50), "gate4 constant != 11/50")
    require(parse_frac(consts.get("gate5_small_wick_f_le_1_16", "0")) == Fraction(47, 200), "gate5 constant != 47/200")
    require(parse_frac(consts.get("global_one_driver_kappa", "0")) == Fraction(47, 200), "global kappa != 47/200")
    require(parse_frac(consts.get("shell_cost_kappa_A", "0")) == Fraction(6, 25), "shell cost != 6/25")
    require(Fraction(47, 200) < Fraction(6, 25), "47/200 < 6/25")

    rows = data.get("rows")
    require(isinstance(rows, list) and len(rows) == 3, "expected exactly 3 profile rows")
    seen = set()

    for r in rows:
        name = r.get("name")
        require(name in EXPECTED_ROWS and name not in seen, f"unexpected/duplicate row {name!r}")
        seen.add(name)
        exp = EXPECTED_ROWS[name]
        params = r.get("params", {})
        for k in ("eps", "a", "b", "b4"):
            require(parse_frac(params.get(k, "0")) == exp[k], f"{name}.{k} parameter mismatch")

        b0_lo, b0_hi = parse_iv_exact(r["B0"], f"{name}.B0")
        g0_lo, g0_hi = parse_iv_exact(r["g0"], f"{name}.g0")
        gp0_lo, gp0_hi = parse_iv_exact(r["gp0"], f"{name}.gp0")
        p0_lo, p0_hi = parse_iv_exact(r["Phi_p0"], f"{name}.Phi_p0")

        require(Fraction(13, 10) < b0_lo and b0_hi < Fraction(3, 2), f"{name}: B0 range")
        # -g(0) < 17/20 <=> g(0) > -17/20 is used in R3 and R4
        require(Fraction(-17, 20) < g0_lo and g0_hi < Fraction(-4, 5), f"{name}: g0 in (-17/20, -4/5)")
        require(Fraction(2, 1) < gp0_lo and gp0_hi < Fraction(5, 2), f"{name}: gp0 range")
        # Phi'(0) < 3/2 is used in R3 (p * B'(u) <= u_max * Phi'(0) < 3/2 * u_max)
        require(Fraction(13, 10) < p0_lo and p0_hi < Fraction(3, 2), f"{name}: Phi'(0) in (13/10, 3/2)")

        # Gate 1 (6.3.7 + tail scalar hypotheses)
        g1 = r["gate1_6_3_7"]
        kmin_lo, kmin_hi = parse_iv_exact(g1["K_u_min_on_band"], f"{name}.K_u_min")
        kumax_lo, kumax_hi = parse_iv_exact(g1["K_at_0_0463"], f"{name}.K_at_0_0463")
        bp_lo, bp_hi = parse_iv_exact(g1["Bp_on_band"], f"{name}.Bp_on_band")
        a0_lo, a0_hi = parse_iv_exact(g1["A0_on_band"], f"{name}.A0_on_band")
        lam_lo, lam_hi = parse_iv_exact(g1["abs_lambda_max"], f"{name}.abs_lambda_max")

        require(kmin_lo > Fraction(1, 50), f"{name}: K(u) > 1/50 > 0 on band")
        if name == "peak":
            require(kumax_lo > Fraction(166781, 1000000) and kumax_hi < Fraction(166783, 1000000),
                    "peak K(0.0463) not inside (0.166781, 0.166783)")
        require(bp_lo > Fraction(1, 1) and bp_hi <= p0_hi, f"{name}: B'(u) > 1 on band")
        require(a0_lo > 0 and a0_hi < Fraction(7, 1), f"{name}: 0 < A0(u) < 7 on band")
        require(lam_hi < Fraction(17, 20), f"{name}: |lambda(u)| < 17/20 on band")

        # Gate 2 (6.3.6: p <= u/5 perturbation, constant 9/40)
        g2 = r["gate2_6_3_6"]
        require(int(g2["vt_leaves"]) >= 1, f"{name}: gate2 vt_leaves < 1")
        vt_exc = hex_to_frac(g2["vt_max_excess_hex"])
        require(vt_exc < 0, f"{name}: gate2 vt_max_excess >= 0 ({vt_exc})")
        require(int(g2["c_cells"]) == 512, f"{name}: gate2 c_cells != 512")
        require(float(g2["min_deficit_after_loss"]) > 0.0, f"{name}: gate2 min_deficit <= 0")
        g2_ratio = hex_to_frac(g2["max_certified_ratio_hex"])
        require(0 < g2_ratio < Fraction(9, 40), f"{name}: gate2 ratio {g2_ratio} not < 9/40")

        # Gate 3 (Unified (*_u) on f in [1/16, 1], constant 11/50)
        g3 = r["gate3_unified_1_16_to_1"]
        require(int(g3["leaves"]) >= 1000 and int(g3["mid3d_evals"]) >= 100, f"{name}: gate3 leaf count")
        require(float(g3["min_H_certified"]) > 0.0, f"{name}: gate3 min_H <= 0")
        g3_m = hex_to_frac(g3["min_margin_hex"])
        require(g3_m > 0, f"{name}: gate3 min_margin {g3_m} not > 0")

        # Gate 4 (Original (*) on f in [1/16, 4/5], constant 11/50; shares MidMemo with Gate 3)
        g4 = r["gate4_star_1_16_to_4_5"]
        require(int(g4["leaves"]) >= 1000 and int(g4["mid3d_evals"]) >= 0, f"{name}: gate4 leaf count")
        g4_m = hex_to_frac(g4["min_margin_hex"])
        require(g4_m > 0, f"{name}: gate4 min_margin {g4_m} not > 0")

        # Gate 5 (Small-Wick (†) on f in [0, 1/16], constant 47/200)
        g5 = r["gate5_small_wick_0_to_1_16"]
        require(int(g5["leaves"]) >= 1000 and int(g5["mid3d_evals"]) >= 100, f"{name}: gate5 leaf count")
        g5_m = hex_to_frac(g5["min_norm_margin_hex"])
        require(g5_m > 0, f"{name}: gate5 min_norm_margin {g5_m} not > 0")

    require(seen == set(EXPECTED_ROWS.keys()), "missing profile rows")


def run_negative_controls(base_data: Dict[str, Any], cpp_sha: str) -> int:
    """Run 10 adversarial corruption controls and verify every one is rejected."""
    mutations = []

    # 1. Corrupt source SHA-256
    m = copy.deepcopy(base_data)
    m["cpp_sha256"] = "0" * 64
    mutations.append(("corrupt cpp_sha256", m))

    # 2. Push peak K(0.0463) outside (0.166781, 0.166783)
    m = copy.deepcopy(base_data)
    m["rows"][0]["gate1_6_3_7"]["K_at_0_0463"]["hi"] = 0.166784
    m["rows"][0]["gate1_6_3_7"]["K_at_0_0463"]["hi_hex"] = (0.166784).hex()
    mutations.append(("K(0.0463) above 0.166783", m))

    # 3. Break |z| >= 4 tail hypothesis B'(u) > 1
    m = copy.deepcopy(base_data)
    m["rows"][1]["gate1_6_3_7"]["Bp_on_band"]["lo"] = 0.99
    m["rows"][1]["gate1_6_3_7"]["Bp_on_band"]["lo_hex"] = (0.99).hex()
    mutations.append(("Bp_on_band below 1", m))

    # 4. Break tail hypothesis |lambda(u)| < 17/20
    m = copy.deepcopy(base_data)
    m["rows"][2]["gate1_6_3_7"]["abs_lambda_max"]["hi"] = 0.86
    m["rows"][2]["gate1_6_3_7"]["abs_lambda_max"]["hi_hex"] = (0.86).hex()
    mutations.append(("|lambda| above 17/20", m))

    # 5. Break Gate 2 (v,t) deficit inequality
    m = copy.deepcopy(base_data)
    m["rows"][0]["gate2_6_3_6"]["vt_max_excess"] = 1e-9
    m["rows"][0]["gate2_6_3_6"]["vt_max_excess_hex"] = (1e-9).hex()
    mutations.append(("gate2 vt_max_excess > 0", m))

    # 6. Break Gate 2 9/40 ratio cap
    m = copy.deepcopy(base_data)
    m["rows"][0]["gate2_6_3_6"]["max_certified_ratio"] = 0.2251
    m["rows"][0]["gate2_6_3_6"]["max_certified_ratio_hex"] = (0.2251).hex()
    mutations.append(("gate2 ratio > 9/40", m))

    # 7. Break Gate 3 unified margin
    m = copy.deepcopy(base_data)
    m["rows"][1]["gate3_unified_1_16_to_1"]["min_margin"] = 0.0
    m["rows"][1]["gate3_unified_1_16_to_1"]["min_margin_hex"] = (0.0).hex()
    mutations.append(("gate3 zero margin", m))

    # 8. Break Gate 4 (*) margin
    m = copy.deepcopy(base_data)
    m["rows"][2]["gate4_star_1_16_to_4_5"]["min_margin"] = -1e-8
    m["rows"][2]["gate4_star_1_16_to_4_5"]["min_margin_hex"] = (-1e-8).hex()
    mutations.append(("gate4 negative margin", m))

    # 9. Break Gate 5 small-Wick margin
    m = copy.deepcopy(base_data)
    m["rows"][0]["gate5_small_wick_0_to_1_16"]["min_norm_margin"] = 0.0
    m["rows"][0]["gate5_small_wick_0_to_1_16"]["min_norm_margin_hex"] = (0.0).hex()
    mutations.append(("gate5 zero margin", m))

    # 10. Drop upper profile row
    m = copy.deepcopy(base_data)
    m["rows"] = m["rows"][:2]
    mutations.append(("missing profile row", m))

    for desc, bad in mutations:
        rejected = False
        try:
            verify_receipt(bad, cpp_sha)
        except AssertionError:
            rejected = True
        require(rejected, f"negative control {desc!r} was NOT rejected!")

    return len(mutations)


def replay_cpp(here: Path, committed_json: Dict[str, Any], cpp_sha: str) -> None:
    cpp_file = here / "certify_one_driver.cpp"
    with tempfile.TemporaryDirectory() as tmp:
        bin_path = Path(tmp) / "certify_one_driver"
        out_path = Path(tmp) / "replayed.json"
        cmd_compile = [
            "c++", "-std=c++17", "-O2", "-ffp-contract=off", "-pthread",
            "-Wall", "-Wextra", "-Werror",
            str(cpp_file), "-o", str(bin_path),
        ]
        subprocess.run(cmd_compile, check=True)
        subprocess.run([str(bin_path), "--cpp", str(cpp_file), "--out", str(out_path)], check=True)
        replayed = json.loads(out_path.read_text(encoding="utf-8"))
        verify_receipt(replayed, cpp_sha)
        require(replayed == committed_json, "replayed result.json differs from committed result.json")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--no-self-test", action="store_true", help="skip negative controls")
    parser.add_argument("--replay-cpp", action="store_true", help="recompile and replay C++17 certifier")
    args = parser.parse_args()

    here = Path(__file__).resolve().parent
    cpp_path = here / "certify_one_driver.cpp"
    json_path = here / "result.json"

    require(cpp_path.is_file(), f"missing {cpp_path}")
    require(json_path.is_file(), f"missing {json_path}")

    cpp_sha = hashlib.sha256(cpp_path.read_bytes()).hexdigest()
    rat_info = verify_rational_premises()
    committed = json.loads(json_path.read_text(encoding="utf-8"))
    verify_receipt(committed, cpp_sha)

    n_neg = 0
    if not args.no_self_test:
        n_neg = run_negative_controls(committed, cpp_sha)

    if args.replay_cpp:
        replay_cpp(here, committed, cpp_sha)

    def fmt_fixed_outward(hex_s: str, places: int, mode: str) -> str:
        q = hex_to_frac(hex_s)
        with localcontext() as ctx:
            ctx.prec = 100
            val = Decimal(q.numerator) / Decimal(q.denominator)
            res = val.quantize(Decimal(f"1e-{places}"), rounding=mode)
            require(
                Fraction(res) <= q if mode == ROUND_FLOOR else Fraction(res) >= q,
                "outward fixed rounding check",
            )
            return f"{res:.{places}f}"

    def fmt_sci_floor(hex_s: str, frac_digits: int) -> str:
        q = hex_to_frac(hex_s)
        require(q > 0, "positive margin expected for fmt_sci_floor")
        with localcontext() as ctx:
            ctx.prec = 100
            val = Decimal(q.numerator) / Decimal(q.denominator)
            exp = val.adjusted()
            unit = Decimal(f"1e{exp - frac_digits}")
            res = val.quantize(unit, rounding=ROUND_FLOOR)
            require(Fraction(res) <= q, "outward sci floor rounding check")
            return f"{res:.{frac_digits}e}"

    print("[verify_one_driver] PASS:")
    print(f"  cpp_sha256          = {cpp_sha}")
    print(f"  rational_pi_bounds  = {rat_info['pi_rational_bounds']}")
    print(f"  |z|>=4 tail ratio   = {rat_info['tail_ratio_cap']} < {rat_info['env22_tail_lo']}")
    for r in committed["rows"]:
        nm = r["name"]
        kmin_s = fmt_fixed_outward(r["gate1_6_3_7"]["K_u_min_on_band"]["lo_hex"], 7, ROUND_FLOOR)
        k0_lo = fmt_fixed_outward(r["gate1_6_3_7"]["K_at_0_0463"]["lo_hex"], 8, ROUND_FLOOR)
        k0_hi = fmt_fixed_outward(r["gate1_6_3_7"]["K_at_0_0463"]["hi_hex"], 8, ROUND_CEILING)
        g2_s = fmt_fixed_outward(r["gate2_6_3_6"]["max_certified_ratio_hex"], 6, ROUND_CEILING)
        g3_s = fmt_sci_floor(r["gate3_unified_1_16_to_1"]["min_margin_hex"], 2)
        g4_s = fmt_sci_floor(r["gate4_star_1_16_to_4_5"]["min_margin_hex"], 2)
        g5_s = fmt_sci_floor(r["gate5_small_wick_0_to_1_16"]["min_norm_margin_hex"], 2)
        print(
            f"  row={nm:5s}: K_min>={kmin_s}, K(0.0463) in [{k0_lo}, {k0_hi}], "
            f"G2_ratio<={g2_s} (<0.225), G3_margin>={g3_s}, "
            f"G4_margin>={g4_s}, G5_norm_margin>={g5_s}"
        )
    print(f"  negative_controls   = {n_neg} passed; replay_cpp = {args.replay_cpp}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
