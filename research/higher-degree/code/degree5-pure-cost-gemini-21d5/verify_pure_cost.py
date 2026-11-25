#!/usr/bin/env python3
"""Pure Python 3 standard-library verifier and negative-control suite for
Problem P6 (#627): Certified pure-cost constants for the odd and quintic
sectors of the 19 degree-5 rows.

Compatible with both `python3 -I verify_pure_cost.py` and
`python3 -I -O verify_pure_cost.py` (uses explicit `require(...)` checks,
never bare `assert`). Zero third-party dependencies.

Verifies:
  R1. Exact denominator-10^6 rounding of all 19 degree-5 rows against the
      repository source files `rows5.lines` and `band_row_0.70.json`.
  R2. Exact rational positivity and root-uniqueness premises on all 19 rows
      (strict convexity/monotonicity of g(T), unique negative real root
      z_*(s) = -r_*(s) of A_+(z; s), strict monotonicity of s = psi(r_*),
      and large-s tail premises at R_* = 9, R_1 = 5).
  R3. Pure-rational zero-float interval verification of Z on the boundary
      rows 0.80 (proving Z > 1) and 0.81 (proving Z < 1).
  R4. Exact Fraction Sturm-chain verification of all 280 rational elliptic
      secant ladder rungs (beta, U_k, alpha_k) used in Deliverable (c), plus
      rejection of an over-stepped rung.
  R5. Tamper-evident SHA-256 provenance of `certify_pure_cost.cpp`, exact
      dyadic hexfloat-to-Fraction parsing of `result.json`, and all four
      deliverables (a)-(d) across all 19 rows, with outward-rounded Decimal
      reporting.
  R6. 11 adversarial negative/corruption controls (including all three
      controls specified in P6 §5) and optional full C++17 recompilation +
      bit-exact replay (`--replay-cpp`).

Agent-ID: gemini-21d5
"""

from __future__ import annotations

import argparse
import copy
import hashlib
import json
import math
import subprocess
import tempfile
from decimal import Decimal, ROUND_CEILING, ROUND_FLOOR, ROUND_HALF_EVEN, localcontext
from fractions import Fraction
from pathlib import Path
from typing import Any, Dict, List, Tuple


def require(cond: bool, msg: str) -> None:
    if not cond:
        raise AssertionError(f"VERIFICATION FAILED: {msg}")


EPS1 = Fraction(39, 50)
ETA = Fraction(779, 10000)
P1 = Fraction(50, 39)
P2 = Fraction(10000, 779)
DENOM = 1_000_000

# Rational enclosures of sqrt(2), sqrt(3), sqrt(10), pi verified from first principles:
SQRT2_LO = Fraction(665857, 470832) - Fraction(1, 10**11)
SQRT2_HI = Fraction(665857, 470832)
SQRT3_LO = Fraction(708158977, 408855776) - Fraction(1, 10**15)
SQRT3_HI = Fraction(708158977, 408855776)
SQRT10_HI = Fraction(721, 228)  # 721^2 - 10 * 228^2 = 1 > 0

SECANT_LADDERS: List[Tuple[Fraction, List[Tuple[int, int]]]] = [
    (Fraction(10002, 10000), [(14,0),(165,1),(242,2),(307,3),(369,4),(429,5),(489,6),(551,7),(614,8),(680,9),
                              (749,10),(821,11),(899,12),(981,13),(1069,14),(1164,15),(1267,16),(1378,17),(1500,18),(1634,19)]),
    (Fraction(10005, 10000), [(22,0),(167,1),(243,2),(308,3),(370,4),(430,5),(490,6),(551,7),(615,8),(680,9),
                              (749,10),(822,11),(899,12),(981,13),(1069,14),(1164,15),(1267,16),(1378,17),(1500,18),(1634,19)]),
    (Fraction(1001, 1000),   [(31,0),(170,1),(245,2),(310,3),(372,4),(431,5),(491,6),(553,7),(616,8),(681,9),
                              (750,10),(823,11),(900,12),(982,13),(1070,14),(1165,15),(1267,16),(1379,17),(1500,18),(1634,19)]),
    (Fraction(1002, 1000),   [(44,0),(176,1),(250,2),(314,3),(375,4),(434,5),(494,6),(555,7),(618,8),(684,9),
                              (752,10),(825,11),(902,12),(984,13),(1071,14),(1166,15),(1268,16),(1379,17),(1500,18),(1634,19)]),
    (Fraction(1004, 1000),   [(63,0),(186,1),(258,2),(321,3),(381,4),(440,5),(500,6),(560,7),(623,8),(688,9),
                              (756,10),(828,11),(905,12),(987,13),(1074,14),(1168,15),(1270,16),(1380,17),(1501,18),(1634,19)]),
    (Fraction(1007, 1000),   [(83,0),(201,1),(270,2),(331,3),(390,4),(449,5),(507,6),(567,7),(630,8),(694,9),
                              (762,10),(834,11),(910,12),(991,13),(1078,14),(1171,15),(1272,16),(1382,17),(1502,18),(1634,19)]),
    (Fraction(101, 100), [(99,0),(213,1),(281,2),(341,3),(399,4),(457,5),(515,6),(574,7),(636,8),(700,9),
                          (768,10),(839,11),(915,12),(995,13),(1082,14),(1175,15),(1275,16),(1384,17),(1503,18),(1634,19)]),
    (Fraction(51, 50),   [(140,0),(248,1),(312,2),(370,3),(426,4),(481,5),(538,6),(596,7),(657,8),(720,9),
                          (786,10),(856,11),(930,12),(1009,13),(1094,14),(1185,15),(1283,16),(1389,17),(1505,18),(1634,19)]),
    (Fraction(21, 20),   [(218,0),(323,1),(382,2),(437,3),(489,4),(542,5),(596,6),(652,7),(709,8),(769,9),
                          (832,10),(899,11),(969,12),(1044,13),(1124,14),(1210,15),(1303,16),(1403,17),(1511,18),(1634,19)]),
    (Fraction(11, 10),   [(301,0),(406,1),(464,2),(516,3),(567,4),(617,5),(669,6),(721,7),(776,8),(832,9),
                          (892,10),(954,11),(1020,12),(1090,13),(1164,14),(1243,15),(1328,16),(1419,17),(1517,18),(1634,19)]),
    (Fraction(23, 20),   [(361,0),(466,1),(524,2),(575,3),(625,4),(674,5),(723,6),(774,7),(826,8),(881,9),
                          (937,10),(996,11),(1058,12),(1124,13),(1193,14),(1267,15),(1345,16),(1429,17),(1519,18),(1634,19)]),
    (Fraction(6, 5),     [(408,0),(514,1),(571,2),(622,3),(670,4),(718,5),(767,6),(816,7),(866,8),(919,9),
                          (973,10),(1029,11),(1088,12),(1150,13),(1216,14),(1285,15),(1358,16),(1436,17),(1519,18),(1634,19)]),
    (Fraction(5, 4),     [(447,0),(553,1),(610,2),(660,3),(708,4),(755,5),(802,6),(850,7),(899,8),(949,9),
                          (1001,10),(1056,11),(1112,12),(1171,13),(1233,14),(1298,15),(1366,16),(1439,17),(1519,18),(1634,19)]),
    (Fraction(13, 10),   [(480,0),(587,1),(643,2),(693,3),(740,4),(786,5),(832,6),(879,7),(926,8),(975,9),
                          (1025,10),(1077,11),(1131,12),(1187,13),(1246,14),(1308,15),(1373,16),(1441,17),(1519,18),(1634,19)]),
]


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
        ctx.prec = 100
        val = Decimal(q.numerator) / Decimal(q.denominator)
        res = val.quantize(Decimal(f"1e-{places}"), rounding=mode)
        require(
            Fraction(res) <= q if mode == ROUND_FLOOR else Fraction(res) >= q,
            "outward fixed rounding check",
        )
        return f"{res:.{places}f}"


def fmt_sci_ceil(q: Fraction, frac_digits: int) -> str:
    if q == 0:
        return "0.00e+00"
    require(q > 0, "positive value expected for fmt_sci_ceil")
    with localcontext() as ctx:
        ctx.prec = 100
        val = Decimal(q.numerator) / Decimal(q.denominator)
        exp = val.adjusted()
        unit = Decimal(f"1e{exp - frac_digits}")
        res = val.quantize(unit, rounding=ROUND_CEILING)
        require(Fraction(res) >= q, "outward sci ceil rounding check")
        return f"{res:.{frac_digits}e}"


def verify_radicals() -> None:
    require(SQRT2_LO > 0 and SQRT2_LO * SQRT2_LO < 2 < SQRT2_HI * SQRT2_HI, "sqrt(2) bracket")
    require(SQRT3_LO > 0 and SQRT3_LO * SQRT3_LO < 3 < SQRT3_HI * SQRT3_HI, "sqrt(3) bracket")
    require(SQRT10_HI > 0 and SQRT10_HI * SQRT10_HI > 10, "sqrt(10) upper")


def verify_source_rows_and_premises(here: Path, rows_json: List[Dict[str, Any]]) -> None:
    content_dir = here.parent / "degree5-content"
    rows5_path = content_dir / "rows5.lines"
    band70_path = content_dir / "profiles_low" / "band_row_0.70.json"
    require(rows5_path.is_file(), f"missing {rows5_path}")
    require(band70_path.is_file(), f"missing {band70_path}")

    raw_rows = [json.loads(line) for line in rows5_path.read_text(encoding="utf-8").splitlines() if line.strip()]
    r79 = json.loads(band70_path.read_text(encoding="utf-8"))["row"]
    all_raw = sorted(raw_rows + [r79], key=lambda r: r["t"])
    require(len(all_raw) == 19 and len(rows_json) == 19, "expected exactly 19 rows")

    for raw, rj in zip(all_raw, rows_json):
        t_str = f"{raw['t']:.3f}".rstrip("0").rstrip(".")
        if t_str in ("0.7", "0.8"):
            t_str += "0"
        require(rj["label"] == t_str, f"row label mismatch: {rj['label']} vs {t_str}")
        r1e6 = rj["rational_1e6"]
        for k in ("l", "beta", "bA", "bB", "nu5"):
            d_raw = Decimal(str(raw[k]))
            rounded = int((d_raw * Decimal(DENOM)).to_integral_value(rounding=ROUND_HALF_EVEN))
            require(r1e6[k] == rounded, f"row {t_str} key {k}: {r1e6[k]} != {rounded}")
            require(abs(Decimal(rounded) / Decimal(DENOM) - d_raw) <= Decimal("5e-7"), "rounding <= 5e-7")

        # Exact rational algebraic positivity & large-s tail premises:
        l = Fraction(r1e6["l"], DENOM)
        b = Fraction(r1e6["beta"], DENOM)
        bA = Fraction(r1e6["bA"], DENOM)
        bB = Fraction(r1e6["bB"], DENOM)
        nu = Fraction(r1e6["nu5"], DENOM)
        require(l > 0 and b > 0 and bA < 0 and bB < 0 and nu > 0, f"row {t_str} signs")

        alp = -bA
        gamB_lo = (-bB) / SQRT2_HI
        gamB_hi = (-bB) / SQRT2_LO
        a0 = 1 - alp
        a2_lo, a2_hi = alp + gamB_lo, alp + gamB_hi
        d2_lo, d2_hi = alp - gamB_hi, alp - gamB_lo
        c0_lo = l - 2 * b + SQRT3_LO * nu
        c0_hi = l - 2 * b + SQRT3_HI * nu
        c1_lo = b - SQRT3_HI * nu
        c1_hi = b - SQRT3_LO * nu
        c2_lo = nu / (2 * SQRT3_HI)
        c2_hi = nu / (2 * SQRT3_LO)

        require(a0 > Fraction(9, 10), f"row {t_str}: a0 > 9/10")
        require(d2_lo > Fraction(3, 200), f"row {t_str}: d2 > 3/200")
        require(c0_lo > Fraction(9, 20) and c1_lo > Fraction(3, 50) and c2_lo > 0, f"row {t_str}: g coeffs > 0")
        require(3 * a0 * c1_lo - a2_hi * c0_hi > Fraction(3, 20), f"row {t_str}: psi_lin > 3/20")

        # Large-s premises at R_* = 9 (T_* = 81), R_1 = 5 (T_1 = 25):
        g81_lo = c0_lo + 81 * c1_lo + 81 * 81 * c2_lo
        g25_lo = c0_lo + 25 * c1_lo + 25 * 25 * c2_lo
        g25_hi = c0_hi + 25 * c1_hi + 25 * 25 * c2_hi
        smax_lo = (9 * g81_lo) / (a0 + 81 * a2_hi)
        psit5_hi = (5 * g25_hi) / (a0 + 25 * d2_lo)
        require(psit5_hi < Fraction(3, 4) * smax_lo, f"row {t_str}: psit(5) < 3/4 psi(9)")
        M_in_lo = a0 * (smax_lo - psit5_hi)
        require(M_in_lo > 10, f"row {t_str}: M_in > 10")
        kx_lo = -Fraction(5, 3) * c0_hi + Fraction(2, 15) * 25 * c1_lo + Fraction(29, 15) * 625 * c2_lo
        ky_lo = g25_lo * (1 - (8 * gamB_hi) / (3 * a2_lo))
        require(kx_lo > Fraction(1, 2) and ky_lo > Fraction(1, 2), f"row {t_str}: kx, ky > 1/2")


def poly_sturm_nonneg_on_ray(alpha: Fraction, beta: Fraction, U: Fraction) -> bool:
    require(beta >= 1 and Fraction(0) <= alpha < Fraction(1, 2) and U > 0, "secant params domain")
    if U > 1:
        if alpha == 0 or U > 2 or (alpha * U * U - 2 * U + 2) <= 0:
            return False
    if alpha == 0:
        return beta * (1 - U * U) >= 1

    S_lo = max(Fraction(1), U)
    A4 = beta
    A3 = Fraction(-2)
    A2 = Fraction(2) - beta - (beta - alpha) * U * U
    A1 = Fraction(0)
    A0 = beta * U * U

    def evalP(x: Fraction) -> Fraction:
        return (((A4 * x + A3) * x + A2) * x + A1) * x + A0

    c0 = evalP(S_lo)
    c1 = ((4 * A4 * S_lo + 3 * A3) * S_lo + 2 * A2) * S_lo + A1
    c2 = (6 * A4 * S_lo + 3 * A3) * S_lo + A2
    c3 = 4 * A4 * S_lo + A3
    c4 = A4
    if c0 <= 0:
        return False

    def poly_rem(p: List[Fraction], q: List[Fraction]) -> List[Fraction]:
        p = list(p)
        while len(p) >= len(q) and any(p):
            if p[0] != 0:
                fac = p[0] / q[0]
                for idx in range(len(q)):
                    p[idx] -= fac * q[idx]
            p.pop(0)
        while len(p) > 1 and p[0] == 0:
            p.pop(0)
        return p

    chain: List[List[Fraction]] = [[c4, c3, c2, c1, c0], [4 * c4, 3 * c3, 2 * c2, c1]]
    while len(chain[-1]) > 1:
        r = poly_rem(chain[-2], chain[-1])
        if all(x == 0 for x in r):
            return False
        chain.append([-x for x in r])

    def sign_changes(vals: List[Fraction]) -> int:
        nz = [1 if v > 0 else -1 for v in vals if v != 0]
        return sum(1 for idx in range(len(nz) - 1) if nz[idx] != nz[idx + 1])

    return sign_changes([p[-1] for p in chain]) == sign_changes([p[0] for p in chain])


def verify_all_secant_ladders() -> int:
    total = 0
    for beta, rungs in SECANT_LADDERS:
        prev_u = -1
        for u_milli, a40 in rungs:
            require(u_milli > prev_u, "ladder U_milli strictly increasing")
            prev_u = u_milli
            ok = poly_sturm_nonneg_on_ray(Fraction(a40, 40), beta, Fraction(u_milli, 1000))
            require(ok, f"Sturm check failed on beta={beta}, U={u_milli}/1000, alpha={a40}/40")
            total += 1
    # Negative control NC11: over-stepping U_milli by +20 on (beta=21/20, alpha=5/40) must fail Sturm!
    require(
        not poly_sturm_nonneg_on_ray(Fraction(5, 40), Fraction(21, 20), Fraction(561, 1000)),
        "NC11: over-stepped Sturm rung must be rejected",
    )
    return total


def expneg_rat_bounds(x: Fraction) -> Tuple[Fraction, Fraction]:
    """Pure Fraction enclosure of exp(-x) for rational x >= 0 (zero floats)."""
    require(x >= 0, "expneg_rat_bounds x >= 0")
    if x == 0:
        return Fraction(1), Fraction(1)
    k = 0
    y = x
    while y > Fraction(1, 8):
        y /= 2
        k += 1
    # Alternating Taylor series on y in (0, 1/8]:
    s_even = Fraction(1)
    term = Fraction(1)
    for n in range(1, 9):
        term = term * y / n
        if n % 2 == 1:
            s_even -= term
        else:
            s_even += term
    # n=8 is even, so s_even >= exp(-y), and s_even - y^9/9! <= exp(-y):
    rem9 = term * y / 9
    lo = max(Fraction(0), s_even - rem9)
    hi = s_even
    # Square k times (truncate denominator bit-length safely via monotone floor/ceil with D=10^12):
    D = 10**12
    for _ in range(k):
        lo = Fraction((lo.numerator * lo.numerator * D) // (lo.denominator * lo.denominator), D)
        hi = Fraction((hi.numerator * hi.numerator * D + hi.denominator * hi.denominator - 1) // (hi.denominator * hi.denominator), D)
    return lo, hi


def verify_Z_pure_rational_boundary(rows_json: List[Dict[str, Any]]) -> None:
    """Zero-float pure Fraction verification that Z(0.80) > 1 and Z(0.81) < 1."""
    by_lbl = {r["label"]: r for r in rows_json}
    for lbl, want_lt_1 in (("0.80", False), ("0.81", True)):
        rj = by_lbl[lbl]
        r1e6 = rj["rational_1e6"]
        l = Fraction(r1e6["l"], DENOM)
        b = Fraction(r1e6["beta"], DENOM)
        nu = Fraction(r1e6["nu5"], DENOM)
        c0_lo = l - 2 * b + SQRT3_LO * nu
        c0_hi = l - 2 * b + SQRT3_HI * nu
        c1_lo = b - SQRT3_HI * nu
        c1_hi = b - SQRT3_LO * nu
        c2_lo = nu / (2 * SQRT3_HI)
        c2_hi = nu / (2 * SQRT3_LO)

        # Monotone r-panels on [0, 6] (N = 3000, h = 1/500):
        # Z = 2 * EPS1 * int_0^inf r^2 e^{-r^2} / g(r^2) dr
        N = 3000
        h = Fraction(1, 500)
        acc_lo = Fraction(0)
        acc_hi = Fraction(0)
        for i in range(N):
            r0 = i * h
            r1 = (i + 1) * h
            t0, t1 = r0 * r0, r1 * r1
            _, e0_hi = expneg_rat_bounds(t0)
            e1_lo, _ = expneg_rat_bounds(t1)
            g0_lo = c0_lo + c1_lo * t0 + c2_lo * t0 * t0
            g1_hi = c0_hi + c1_hi * t1 + c2_hi * t1 * t1
            # On [r0, r1], r^2 in [t0, t1], e^{-r^2} in [e1_lo, e0_hi], g(r^2) in [g0_lo, g1_hi]:
            acc_lo += h * (t0 * e1_lo) / g1_hi
            acc_hi += h * (t1 * e0_hi) / g0_lo
        # Tail r >= 6 (T >= 36): int_{36}^inf sqrt(T) e^{-T} dT / g(36) <= 37 e^{-36} / g(36)
        _, e36_hi = expneg_rat_bounds(Fraction(36))
        g36_lo = c0_lo + 36 * c1_lo + 1296 * c2_lo
        tail_hi = EPS1 * 37 * e36_hi / g36_lo

        Z_rat_lo = 2 * EPS1 * acc_lo
        Z_rat_hi = 2 * EPS1 * acc_hi + tail_hi
        z_cpp_lo, z_cpp_hi = parse_iv_exact(rj["Z"], f"Z[{lbl}]")
        require(Z_rat_lo <= z_cpp_hi and z_cpp_lo <= Z_rat_hi, f"rational vs C++ Z overlap on {lbl}")
        if want_lt_1:
            require(Z_rat_hi < 1, f"pure-rational Z(0.81) < 1 failed: hi={float(Z_rat_hi):.6f}")
        else:
            require(Z_rat_lo > 1, f"pure-rational Z(0.80) > 1 failed: lo={float(Z_rat_lo):.6f}")


def verify_receipt(data: Dict[str, Any], expected_cpp_sha: str) -> None:
    require(data.get("agent_id") == "gemini-21d5", "agent_id mismatch")
    require(data.get("issue") == 627, "issue mismatch")
    require(data.get("cpp_sha256") == expected_cpp_sha, "cpp_sha256 mismatch")

    consts = data.get("constants", {})
    require(consts.get("eps1") == "39/50", "eps1 != 39/50")
    require(consts.get("eta") == "779/10000", "eta != 779/10000")
    require(consts.get("p1") == "50/39", "p1 != 50/39")
    require(consts.get("p2") == "10000/779", "p2 != 10000/779")
    require(consts.get("row_denominator") == DENOM, "row_denominator != 10^6")
    require(consts.get("NE1_cap_ratio") == "1/4", "NE1_cap_ratio != 1/4")
    require(consts.get("NE_cap_ratio") == "1/2", "NE_cap_ratio != 1/2")

    rows = data.get("rows", [])
    require(isinstance(rows, list) and len(rows) == 19, "expected 19 rows")

    for r in rows:
        lbl = r["label"]
        ge_081 = r["ge_081"]
        require(ge_081 == (Decimal(lbl) >= Decimal("0.81")), f"{lbl}: ge_081 flag mismatch")

        z_lo, z_hi = parse_iv_exact(r["Z"], f"{lbl}.Z")
        if ge_081:
            require(z_hi < 1, f"{lbl}: Deliverable (a) Z < 1 failed ({z_hi})")
        else:
            require(z_lo > 1, f"{lbl}: expected Z > 1 on row <= 0.80")
            require(z_hi - z_lo <= Fraction(1, 10000), f"{lbl}: Z width > 10^-4")

        # Deliverable (b): collar + body
        col = r["Modd_collar"]
        r0 = Fraction(str(col["r0"]))
        require(r0 == Fraction(1, 16), f"{lbl}: collar r0 != 1/16")
        mu1_lo, _ = parse_iv_exact(col["mu1"], f"{lbl}.mu1")
        mu2_lo, _ = parse_iv_exact(col["mu2"], f"{lbl}.mu2")
        _, k12_hi = parse_iv_exact(col["K12"], f"{lbl}.K12")
        det_lo, _ = parse_iv_exact(col["det_coeff"], f"{lbl}.det_coeff")
        pos_hi = hex_to_frac(col["pos_block_ratio_hi_hex"])
        require(mu1_lo > 0 and mu2_lo > 0 and det_lo > 0, f"{lbl}: collar positivity failed")
        require(mu1_lo * mu2_lo - r0 * r0 * k12_hi * k12_hi >= det_lo, f"{lbl}: collar det consistency")
        require(pos_hi < 1, f"{lbl}: collar pos_block_ratio >= 1")

        body_hi = hex_to_frac(r["Modd_body_over_p1_hi_hex"])
        modd_sup_hi = hex_to_frac(r["Modd_sup_over_p1_hi_hex"])
        require(body_hi < z_lo, f"{lbl}: Modd body ({body_hi}) not < Z_lo ({z_lo})")
        require(modd_sup_hi == z_hi, f"{lbl}: Modd_sup_over_p1_hi != Z_hi")
        if ge_081:
            require(modd_sup_hi < 1, f"{lbl}: Deliverable (b) Modd/p1 < 1 failed")

        # Deliverable (c): kappa_odd < 1 on >= 0.81, E_max(s) profile on 0.79 and 0.80
        qt_lo, qt_hi = parse_iv_exact(r["qtilde_sup_over_p1"], f"{lbl}.qtilde")
        kap_hi = hex_to_frac(r["kappa_odd_hi_hex"])
        if ge_081:
            require(kap_hi < 1, f"{lbl}: Deliverable (c) kappa_odd < 1 failed ({kap_hi})")
            require(kap_hi <= qt_hi, f"{lbl}: kappa_odd > qtilde_hi")

        if lbl in ("0.79", "0.80"):
            prof = r.get("emax_profile", [])
            require(len(prof) >= 2, f"{lbl}: missing emax_profile")
            require(hex_to_frac(prof[0]["s_lo_hex"]) == 0, f"{lbl}: emax_profile must start at s=0")
            for idx in range(len(prof) - 1):
                cur_hi = hex_to_frac(prof[idx]["s_hi_hex"])
                nxt_lo = hex_to_frac(prof[idx + 1]["s_lo_hex"])
                require(nxt_lo <= cur_hi, f"{lbl}: gap in emax_profile at slab {idx}")
                em = hex_to_frac(prof[idx]["emax_hi_hex"])
                require(0 <= em < Fraction(1, 100), f"{lbl}: unreasonable emax_hi")
            require(prof[-1]["s_hi_hex"] == "inf", f"{lbl}: emax_profile must end at inf")
            require(hex_to_frac(prof[-1]["emax_hi_hex"]) == 0, f"{lbl}: terminal emax_hi must be 0")

        # Deliverable (d): NE1/p2 < 1/4 and NE/p2 < 1/2 on all 19 rows
        ne1_lo, ne1_hi = parse_iv_exact(r["NE1_sup_over_p2"], f"{lbl}.NE1")
        ne_lo, ne_hi = parse_iv_exact(r["NE_sup_over_p2"], f"{lbl}.NE")
        require(0 < ne1_lo <= ne1_hi < Fraction(1, 4), f"{lbl}: Deliverable (d) NE1/p2 < 1/4 failed")
        require(0 < ne_lo <= ne_hi < Fraction(1, 2), f"{lbl}: Deliverable (d) NE/p2 < 1/2 failed")

        # Large-s tails consistency:
        tl = r["large_s_tail"]
        require(hex_to_frac(tl["s_max_lo_hex"]) > 20, f"{lbl}: s_max_lo > 20")
        require(hex_to_frac(tl["Modd_hi_hex"]) <= body_hi, f"{lbl}: tail Modd <= body_hi")
        require(hex_to_frac(tl["NE1_hi_hex"]) <= ne1_hi, f"{lbl}: tail NE1 <= ne1_hi")
        require(hex_to_frac(tl["NE_hi_hex"]) <= ne_hi, f"{lbl}: tail NE <= ne_hi")


def run_negative_controls(committed: Dict[str, Any], cpp_sha: str) -> int:
    # NC1 (P6 §5): Claiming Z < 1 on row 0.80 must be rejected (certified Z_lo > 1):
    r80 = [r for r in committed["rows"] if r["label"] == "0.80"][0]
    z80_lo, _ = parse_iv_exact(r80["Z"], "NC1.Z80")
    require(not (z80_lo < 1), "NC1 failed: row 0.80 did not reject Z < 1")

    # NC2 (P6 §5): Replacing 1/4 by 1/5 on N_{E1}/p2 for row 0.70 must be rejected:
    r70 = [r for r in committed["rows"] if r["label"] == "0.70"][0]
    ne1_70_lo, _ = parse_iv_exact(r70["NE1_sup_over_p2"], "NC2.NE1_70")
    require(not (ne1_70_lo <= Fraction(1, 5)), "NC2 failed: row 0.70 did not reject 1/5 cap")

    # NC3 (P6 §5): Replacing p1*Z by 0.9*p1*Z in (b) must be rejected on every row >= 0.81:
    for r in committed["rows"]:
        if r["ge_081"]:
            z_lo, z_hi = parse_iv_exact(r["Z"], f"NC3.{r['label']}")
            require(not (z_lo <= Fraction(9, 10) * z_hi), f"NC3 failed on {r['label']}")

    # Receipt mutation controls NC4..NC10:
    mutations = []

    m4 = copy.deepcopy(committed)
    m4["cpp_sha256"] = "0" * 64
    mutations.append(("NC4: tampered cpp_sha256", m4))

    m5 = copy.deepcopy(committed)
    m5["rows"][6]["Z"]["hi_hex"] = (1.0).hex()  # row 0.81 Z_hi = 1.0
    mutations.append(("NC5: row 0.81 Z_hi = 1.0", m5))

    m6 = copy.deepcopy(committed)
    m6["rows"][6]["Modd_body_over_p1_hi_hex"] = m6["rows"][6]["Z"]["lo_hex"]
    mutations.append(("NC6: row 0.81 Modd_body >= Z_lo", m6))

    m7 = copy.deepcopy(committed)
    m7["rows"][6]["Modd_collar"]["det_coeff"]["lo_hex"] = (0.0).hex()
    mutations.append(("NC7: collar det_coeff = 0", m7))

    m8 = copy.deepcopy(committed)
    m8["rows"][6]["kappa_odd_hi_hex"] = (1.0).hex()
    mutations.append(("NC8: row 0.81 kappa_odd = 1.0", m8))

    m9 = copy.deepcopy(committed)
    m9["rows"][0]["NE_sup_over_p2"]["hi_hex"] = (0.5).hex()
    mutations.append(("NC9: row 0.70 NE/p2 = 1/2", m9))

    m10 = copy.deepcopy(committed)
    m10["rows"][5]["emax_profile"][-1]["emax_hi_hex"] = (1e-6).hex()
    mutations.append(("NC10: row 0.80 nonzero terminal emax", m10))

    for desc, mut in mutations:
        rejected = False
        try:
            verify_receipt(mut, cpp_sha)
        except AssertionError:
            rejected = True
        require(rejected, f"negative control {desc!r} was NOT rejected!")

    return 3 + len(mutations) + 1  # NC1..NC3 + NC4..NC10 + NC11 (in verify_all_secant_ladders)


def replay_cpp(here: Path, committed: Dict[str, Any], cpp_sha: str) -> None:
    cpp_file = here / "certify_pure_cost.cpp"
    with tempfile.TemporaryDirectory() as tmp:
        bin_path = Path(tmp) / "certify_pure_cost"
        out_path = Path(tmp) / "replayed.json"
        subprocess.run(
            [
                "c++", "-std=c++17", "-O2", "-ffp-contract=off", "-pthread",
                "-Wall", "-Wextra", "-Werror",
                str(cpp_file), "-o", str(bin_path),
            ],
            check=True,
        )
        subprocess.run([str(bin_path), "--cpp", str(cpp_file), "--out", str(out_path)], check=True)
        replayed = json.loads(out_path.read_text(encoding="utf-8"))
        verify_receipt(replayed, cpp_sha)
        require(replayed == committed, "replayed result.json differs from committed result.json")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--no-self-test", action="store_true", help="skip negative controls")
    parser.add_argument("--replay-cpp", action="store_true", help="recompile and replay C++17 certifier")
    args = parser.parse_args()

    here = Path(__file__).resolve().parent
    cpp_path = here / "certify_pure_cost.cpp"
    json_path = here / "result.json"
    require(cpp_path.is_file(), f"missing {cpp_path}")
    require(json_path.is_file(), f"missing {json_path}")

    verify_radicals()
    n_rungs = verify_all_secant_ladders()

    cpp_sha = hashlib.sha256(cpp_path.read_bytes()).hexdigest()
    committed = json.loads(json_path.read_text(encoding="utf-8"))
    verify_source_rows_and_premises(here, committed["rows"])
    verify_receipt(committed, cpp_sha)
    verify_Z_pure_rational_boundary(committed["rows"])

    n_neg = 0
    if not args.no_self_test:
        n_neg = run_negative_controls(committed, cpp_sha)

    if args.replay_cpp:
        replay_cpp(here, committed, cpp_sha)

    print("[verify_pure_cost] PASS:")
    print(f"  cpp_sha256          = {cpp_sha}")
    print(f"  sturm_secant_rungs  = {n_rungs} exact rational rungs verified")
    print("  row   | Z enclosure              | Modd/p1 <= | qtilde/p1 <= | kap_odd <= | NE1/p2 <=  | NE/p2 <=")
    for r in committed["rows"]:
        lbl = r["label"]
        z_lo, z_hi = parse_iv_exact(r["Z"], lbl)
        modd_hi = hex_to_frac(r["Modd_sup_over_p1_hi_hex"])
        _, qt_hi = parse_iv_exact(r["qtilde_sup_over_p1"], lbl)
        kap_hi = hex_to_frac(r["kappa_odd_hi_hex"])
        _, ne1_hi = parse_iv_exact(r["NE1_sup_over_p2"], lbl)
        _, ne_hi = parse_iv_exact(r["NE_sup_over_p2"], lbl)
        kap_s = fmt_fixed_outward(kap_hi, 6, ROUND_CEILING) if r["ge_081"] else "E_max(s)" if lbl in ("0.79", "0.80") else "   n/a  "
        print(
            f"  {lbl:5s} | [{fmt_fixed_outward(z_lo, 8, ROUND_FLOOR)}, {fmt_fixed_outward(z_hi, 8, ROUND_CEILING)}] "
            f"| {fmt_fixed_outward(modd_hi, 6, ROUND_CEILING):10s} "
            f"| {fmt_fixed_outward(qt_hi, 6, ROUND_CEILING):12s} "
            f"| {kap_s:10s} "
            f"| {fmt_fixed_outward(ne1_hi, 6, ROUND_CEILING):10s} "
            f"| {fmt_fixed_outward(ne_hi, 6, ROUND_CEILING)}"
        )
        if lbl in ("0.79", "0.80"):
            prof = r["emax_profile"]
            max_em = max(hex_to_frac(p["emax_hi_hex"]) for p in prof)
            zero_from = None
            for p in reversed(prof):
                if hex_to_frac(p["emax_hi_hex"]) == 0:
                    zero_from = hex_to_frac(p["s_lo_hex"])
                else:
                    break
            zf_s = fmt_fixed_outward(zero_from, 4, ROUND_CEILING) if zero_from is not None else "n/a"
            print(f"        -> E_max(s) <= {fmt_sci_ceil(max_em, 3)} for all s >= 0, and E_max(s) = 0 for all s >= {zf_s}")
    print(f"  negative_controls   = {n_neg} passed; replay_cpp = {args.replay_cpp}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
