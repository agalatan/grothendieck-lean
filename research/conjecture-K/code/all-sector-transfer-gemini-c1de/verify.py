#!/usr/bin/env python3
"""Zero-float exact rational verifier for Issue #728 (STATUS tag KAST).

Agent-ID: gemini-c1de
Refs: #728, #436, #177

Run under both:
  python3 -IB research/conjecture-K/code/all-sector-transfer-gemini-c1de/verify.py
  python3 -IB -O research/conjecture-K/code/all-sector-transfer-gemini-c1de/verify.py

Uses Python 3 standard library only (`fractions.Fraction`, `math.isqrt`, `json`, `os`, `sys`),
with zero floating-point operations and zero `assert` statements so every check executes
identically under `-O`.
"""
from fractions import Fraction as Q
from math import isqrt
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
DEFAULT_CERT = os.path.join(HERE, "all_sector_transfer_cert.json")
CENTRAL_94_125_JSON = os.path.join(
    HERE, "..", "exterior-94-125-gemini-9a4e", "central_94_125_certificate.json"
)
CENTRAL_7475_JSON = os.path.join(
    HERE, "..", "exterior-codex-4d8a", "central_7475_certificate.json"
)

# Exact peak-row and profile parameters (STATUS §0, 7.1.6, 7.4.10, 7.5.13, 11.61):
EPS0 = Q(1891, 2500)
P0 = Q(2500, 1891)
ELL0 = Q(1057, 1250)
BETA0 = Q(179, 1250)
A0_PROF = ELL0 - Q(2) * BETA0  # 699/1250
RHO0 = Q(5053, 10000)
D_RHO = Q(1) + RHO0 * RHO0  # 125532809/100000000
S_TILT = Q(3, 5)
E0 = Q(463, 10000)
U_TOT0 = Q(80051, 1000000)
GAMMA_A = Q(7, 25)
ETA_A = Q(6, 1000000)

# 2.12a-b Rice tangent at u = 1/10 (re-proved from scratch below) and pi upper bound:
A_212B = Q(886762780, 10**9)
B_212B = Q(432306903, 10**9)
PI_HI = Q(31415926535897932385, 10**19)
SQRT_PI_HI = Q(1772453850905517, 10**15)

# 3.3 & 3.14 reviewed peak remote & Gaussian benchmark enclosures:
U0_REM = Q(1373953883, 10**9)
S0_LO = Q(13739535256614, 10**13)
S0_HI = Q(13739535256616, 10**13)
J0_SUPP_LO = Q(13739535256614828, 10**16)
GA_SUPP = Q(1689944147450845, 10**15)
GB_SUPP = Q(2622896929056071, 10**15)

# 11.30, 11.49, 11.62 energy-dependent tilted content coefficients (P + C):
GAMMA_TABLE = (
    (Q(0), Q(2, 25)),
    (Q(1, 125), Q(49, 1000)),
    (Q(9, 1000), Q(251, 5000)),
    (Q(3, 250), Q(121, 2500)),
    (Q(3, 200), Q(467, 10000)),
    (Q(9, 500), Q(451, 10000)),
    (Q(1, 50), Q(83, 2000)),
    (Q(1, 40), Q(393, 10000)),
    (Q(3, 100), Q(3, 80)),
    (Q(7, 200), Q(71, 2000)),
    (Q(3, 80), Q(173, 5000)),
    (Q(1, 25), Q(17, 500)),
    (Q(21, 500), Q(331, 10000)),
    (Q(11, 250), Q(13, 400)),
)


def check(cond, msg):
    if not cond:
        raise ValueError(msg)


def fmt_dec(q, digits=9):
    """Exact integer-only decimal formatting (zero floating-point operations)."""
    q = Q(q)
    sign = "-" if q < 0 else ""
    aq = -q if q < 0 else q
    scaled = (aq.numerator * (10 ** digits)) // aq.denominator
    whole = scaled // (10 ** digits)
    frac = scaled % (10 ** digits)
    return f"{sign}{whole}.{frac:0{digits}d}"


def fmt_micro_ceil(q, digits=4):
    """Outward ceiling in units of 10^-6 using integer arithmetic only."""
    q = Q(q)
    scale = 10 ** (6 + digits)
    if q >= 0:
        num = (q.numerator * scale + q.denominator - 1) // q.denominator
        whole = num // (10 ** digits)
        frac = num % (10 ** digits)
        return f"{whole}.{frac:0{digits}d}e-6"
    aq = -q
    num = (aq.numerator * scale) // aq.denominator
    whole = num // (10 ** digits)
    frac = num % (10 ** digits)
    return f"-{whole}.{frac:0{digits}d}e-6"


def rat_sqrt_lo(q, scale=10**10):
    check(q >= 0, "rat_sqrt_lo negative input")
    if q == 0:
        return Q(0)
    n = (q.numerator * scale * scale) // q.denominator
    r = isqrt(n)
    out = Q(r, scale)
    check(out * out <= q, "rat_sqrt_lo enclosure failure")
    return out


def rat_sqrt_hi(q, scale=10**10):
    check(q >= 0, "rat_sqrt_hi negative input")
    if q == 0:
        return Q(0)
    n = (q.numerator * scale * scale + q.denominator - 1) // q.denominator
    r = isqrt(n)
    if r * r < n:
        r += 1
    out = Q(r, scale)
    check(out * out >= q, "rat_sqrt_hi enclosure failure")
    return out


C_NEG_LO = rat_sqrt_lo(ETA_A, 10**10)
C_NEG_HI = rat_sqrt_hi(ETA_A, 10**10)


def atan_inv_bounds(inv_x, terms):
    check(inv_x >= 2 and terms >= 2, "invalid atan_inv_bounds args")
    s = Q(0)
    for k in range(terms):
        term = Q((-1) ** k, (2 * k + 1) * (inv_x ** (2 * k + 1)))
        s += term
    nxt = Q((-1) ** terms, (2 * terms + 1) * (inv_x ** (2 * terms + 1)))
    return min(s, s + nxt), max(s, s + nxt)


def exp_neg_bounds(x, terms=24):
    check(Q(0) < x < Q(1) and terms >= 4, "invalid exp_neg_bounds args")
    term = Q(1)
    total = term
    for k in range(1, terms):
        term = term * (-x) / Q(k)
        total += term
    nxt = term * (-x) / Q(terms)
    return min(total, total + nxt), max(total, total + nxt)


def bessel_i_bounds(order, x, terms=20):
    check(order in (0, 1) and Q(0) < x < Q(1), "invalid bessel_i_bounds args")
    term = Q(1) if order == 0 else x / Q(2)
    total = term
    for k in range(1, terms):
        term = term * x * x / Q(4 * k * (k + order))
        total += term
    nxt = term * x * x / Q(4 * terms * (terms + order))
    ratio = x * x / Q(4 * (terms + 1) * (terms + 1 + order))
    check(ratio < Q(1), "bessel_i ratio >= 1")
    return total, total + nxt / (Q(1) - ratio)


def verify_elementary_foundations(rice_slope_override=None):
    """Re-prove Machin pi, sqrt(pi), 2.12a-b Rice tangent, and STATUS item 87 countermodel."""
    a_lo, a_hi = atan_inv_bounds(5, 36)
    b_lo, b_hi = atan_inv_bounds(239, 12)
    pi_lo = Q(16) * a_lo - Q(4) * b_hi
    pi_hi = Q(16) * a_hi - Q(4) * b_lo
    check(Q(3) < pi_lo < pi_hi <= PI_HI, "Machin pi enclosure failed against PI_HI")
    check(PI_HI < SQRT_PI_HI * SQRT_PI_HI, "SQRT_PI_HI^2 <= PI_HI")

    sp_lo = rat_sqrt_lo(pi_lo, 10**30)
    sp_hi = rat_sqrt_hi(pi_hi, 10**30)
    check(sp_lo * sp_lo <= pi_lo and pi_hi <= sp_hi * sp_hi <= SQRT_PI_HI * SQRT_PI_HI,
          "sqrt(pi) enclosure failed")

    # Rice tangent rho(u) <= [rho(u_0) - u_0 rho'(u_0)] + u rho'(u_0) at u_0 = 1/10 (x = 1/20):
    # Here tan_a_hi bounds the tangent intercept rho(u_0) - u_0 rho'(u_0), and tan_b_hi bounds rho'(u_0).
    x = Q(1, 20)
    i0_lo, i0_hi = bessel_i_bounds(0, x, 20)
    i1_lo, i1_hi = bessel_i_bounds(1, x, 20)
    ex_lo, ex_hi = exp_neg_bounds(x, 24)
    r_hi = sp_hi / Q(2)
    common_hi = r_hi * ex_hi
    tan_a_hi = common_hi * ((Q(1) + x) * i0_hi + x * i1_hi)
    tan_b_hi = (common_hi / Q(2)) * (i0_hi + i1_hi)
    b_target = B_212B if rice_slope_override is None else Q(rice_slope_override)
    check(tan_a_hi < A_212B, f"Rice intercept upper bound {tan_a_hi} >= A_212B")
    check(tan_b_hi < b_target, f"Rice slope upper bound {tan_b_hi} >= {b_target}")

    # Verify benchmark ordering (3.3, 3.14) and C_NEG bounds:
    check(S0_LO < J0_SUPP_LO < S0_HI < U0_REM,
          "Benchmark ordering S0_LO < J0_SUPP_LO < S0_HI < U0_REM failed")
    check(C_NEG_LO >= 0 and C_NEG_LO * C_NEG_LO <= ETA_A <= C_NEG_HI * C_NEG_HI,
          "C_NEG enclosure failed")

    # Verify STATUS item 87 scalar countermodel: D_+ bound does NOT attenuate negative-deficit remote error.
    k_cost = P0 - S_TILT * S_TILT - Q(13, 20)
    check(k_cost == Q(59009, 189100), "Peak tilted A-cost mismatch")
    kap_a = GAMMA_A / k_cost  # 52948/59009
    eta_a_cost = ETA_A / k_cost  # 5673/295045000
    check(kap_a == Q(52948, 59009) < Q(1), "Peak kappa mismatch")
    rem_err = Q(9, 25000000)
    d_abs = -rem_err
    gain_abs = eta_a_cost
    check(gain_abs <= kap_a * max(d_abs, Q(0)) + eta_a_cost, "Scalar countermodel hypothesis failed")
    check(rem_err + gain_abs > (Q(1) - kap_a) * rem_err + eta_a_cost,
          "Scalar countermodel non-attenuation check failed")

    # Verify (P_Psi) cession scalar control (codex-a7c4): u = 463/10000, D = 0, C = 2449/1000000,
    # ||e|| = 3/4000, R = 888/100000, U = 855/100000 give J_AB + 0.01||U||^2 - D_+ > 29.539e-6 > 27.55e-6
    # before subtracting sigma(u), showing (P_Psi) cession cannot spend sigma(u) a second time:
    u_sc = E0
    c_sc = Q(2449, 1000000)
    e_sc = Q(3, 4000)
    r_sc = Q(888, 100000)
    uo_sc = Q(855, 100000)
    v_sc = (r_sc * r_sc + uo_sc * uo_sc) / D_RHO
    check(c_sc * c_sc <= ETA_A and e_sc * e_sc <= Q(49, 4000000) * u_sc and u_sc + v_sc <= U_TOT0,
          "(P_Psi) scalar control violated domain/content/alignment hypotheses")
    jab_plus_cess_sc = (
        Q(2) * r_sc * (c_sc + (RHO0 / D_RHO) * e_sc)
        + Q(2) * uo_sc * (e_sc / D_RHO)
        - Q(31, 100) * r_sc * r_sc
        - Q(7, 100) * uo_sc * uo_sc
        + Q(2) * (u_sc + v_sc - E0) * v_sc
    )
    check(jab_plus_cess_sc > Q(29539, 10**9),
          f"(P_Psi) scalar control {jab_plus_cess_sc} did not exceed 29.539e-6")

    return {
        "pi_lo": pi_lo, "pi_hi": pi_hi, "tan_a_hi": tan_a_hi, "tan_b_hi": tan_b_hi,
        "ppsi_scalar_control": jab_plus_cess_sc,
    }


def best_gamma(u_lo):
    best = Q(2, 25)
    for e_i, g_i in GAMMA_TABLE:
        if u_lo >= e_i and g_i < best:
            best = g_i
    return best


def sigma_lo_iv(u_lo, u_hi):
    """Certified lower bound on sigma(u) = S - (B(u) - p u) >= 0 on [u_lo, u_hi] subseteq [0, 0.0463]
    from STATUS 7.2.11 (P + C) and STATUS 2.7c (P + C)."""
    check(Q(0) <= u_lo < u_hi <= E0, f"Invalid u-interval [{u_lo}, {u_hi}]")
    lo = Q(0)
    if u_hi <= Q(1, 100):
        lo = max(lo, Q(113, 100000))
    elif u_hi <= Q(2, 100):
        lo = max(lo, Q(49, 100000))
    elif u_hi <= Q(25, 1000):
        lo = max(lo, Q(27, 100000))
    elif u_hi <= Q(3, 100):
        lo = max(lo, Q(1, 10000))
    if u_lo >= Q(551, 100000) and u_hi <= E0:
        us_lo = Q(403448, 10**7)
        us_hi = Q(403449, 10**7)
        if u_hi <= us_lo:
            dist = us_lo - u_hi
        elif u_lo >= us_hi:
            dist = u_lo - us_hi
        else:
            dist = Q(0)
        lo = max(lo, Q(27, 25) * dist * dist)
    return lo


def rho_rem_hi(u_lo, u_hi):
    """Certified upper bound on Lambda(q) - S on [u_lo, u_hi] from STATUS 3.3, 3.14, and 7.2.11 (P + C):
    In 7.2.11 (`KGAP` `ENERGY_SLACK.md` §3), the 20 Hermite moment leaves certify BOTH F(u) < S - ell
    AND Lambda(q) < S - ell across all genuine remote cubics with u <= 0.01, 0.02, 0.025, 0.03."""
    check(Q(0) <= u_lo < u_hi <= E0, f"Invalid u-interval [{u_lo}, {u_hi}]")
    if u_hi <= Q(1, 100):
        return Q(-113, 100000)
    if u_hi <= Q(2, 100):
        return Q(-49, 100000)
    if u_hi <= Q(25, 1000):
        return Q(-27, 100000)
    if u_hi <= Q(3, 100):
        return Q(-1, 10000)
    return U0_REM - S0_LO


def max_quad_on_iv(A_c2, B_c1, C_c0, lo, hi):
    check(lo <= hi, f"max_quad_on_iv invalid interval [{lo}, {hi}]")
    vals = [A_c2 * lo * lo + B_c1 * lo + C_c0, A_c2 * hi * hi + B_c1 * hi + C_c0]
    if A_c2 < 0:
        c_star = -B_c1 / (Q(2) * A_c2)
        if lo < c_star < hi:
            vals.append(A_c2 * c_star * c_star + B_c1 * c_star + C_c0)
    return max(vals)


def verify_2d_cover(name, cov, expected):
    """Verify a 2D (u, V) rational cover cell-by-cell with zero floats."""
    u_max = Q(cov["u_max"])
    u_tot = Q(cov["u_tot"])
    x_pen = Q(cov["x_pen"])
    y_cess = Q(cov["y_cess"])
    nu_pen = Q(cov["nu_pen"])
    use_signed = bool(cov["use_signed_1161"])
    pure_cess = bool(cov.get("pure_dplus_cession", False))
    resp_ell34 = None if cov["resp_ell34"] is None else Q(cov["resp_ell34"])

    check(u_max == expected["u_max"], f"{name}: u_max mismatch ({u_max} != {expected['u_max']})")
    check(u_tot == expected["u_tot"], f"{name}: u_tot mismatch ({u_tot} != {expected['u_tot']})")
    check(x_pen == expected["x_pen"], f"{name}: x_pen mismatch")
    check(y_cess == expected["y_cess"], f"{name}: y_cess mismatch")
    check(use_signed == expected["use_signed_1161"], f"{name}: use_signed_1161 mismatch")
    check(pure_cess == bool(expected.get("pure_dplus_cession", False)),
          f"{name}: pure_dplus_cession mismatch")
    if y_cess > 0:
        check(pure_cess and not use_signed,
              f"{name}: y_cess > 0 under (P_Psi) requires pure_dplus_cession=True and use_signed=False")
    check(resp_ell34 == expected["resp_ell34"], f"{name}: resp_ell34 mismatch")
    if expected.get("require_all6_nu_pen", False) and x_pen > 0:
        check(nu_pen >= x_pen * Q(49, 625),
              f"{name}: six-sector cover with x_pen > 0 missing (lambda-1)*(49/625) nu_pen")
    check(nu_pen == expected["nu_pen"], f"{name}: nu_pen mismatch")

    check(Q(0) < u_max <= E0, f"{name}: u_max out of (0, E0]")
    check(Q(0) < u_tot <= U_TOT0, f"{name}: u_tot out of (0, U_TOT0]")
    check(x_pen >= 0 and y_cess >= 0 and nu_pen >= 0, f"{name}: negative penalty parameter")

    u_edges = [Q(s) for s in cov["u_edges"]]
    v_edges = [Q(s) for s in cov["v_edges"]]
    strips = cov["strips"]
    check(len(u_edges) >= 2 and u_edges[0] == 0 and u_edges[-1] == u_max,
          f"{name}: u_edges must start at 0 and end at u_max")
    for i in range(len(u_edges) - 1):
        check(u_edges[i] < u_edges[i + 1], f"{name}: u-grid not strictly increasing at {i}")
    check(len(strips) == len(u_edges) - 1, f"{name}: strip count mismatch against u_edges")

    check(len(v_edges) >= 2 and v_edges[0] == 0 and v_edges[-1] == u_tot,
          f"{name}: v_edges must start at 0 and end at u_tot")
    for j in range(len(v_edges) - 1):
        check(v_edges[j] < v_edges[j + 1], f"{name}: V-grid not strictly increasing at {j}")

    alpha_base = Q(31, 100) - Q(9, 25) * x_pen
    beta_base = Q(2, 25) - y_cess

    worst_all = None
    for iu, strip in enumerate(strips):
        ul, uh = u_edges[iu], u_edges[iu + 1]
        if pure_cess:
            # Under (P_Psi) of 7.5.3, Lambda(q) - S + sigma(u) - D_-(q) = -D_+(q) already spent sigma(u)
            # and remote slack, so J_AB + y_cess ||U||^2 - D_+(q) must evaluate with sig_lo = r_rem = 0.
            sig_lo = Q(0)
            r_rem = Q(0)
        else:
            sig_lo = sigma_lo_iv(ul, uh)
            r_rem = rho_rem_hi(ul, uh)

        check(isinstance(strip["e"], int) and isinstance(strip["c"], int) and isinstance(strip["ub"], int),
              f"{name} strip {iu}: strip header fields must be integers")
        E_cell = Q(strip["e"], 10**10)
        C_max = Q(strip["c"], 10**8)
        check(E_cell >= 0 and E_cell * E_cell >= Q(49, 4000000) * uh,
              f"{name} strip {iu}: E_cell^2 < (7/2000)^2 u_hi (7.1.6 violation)")
        g_best = best_gamma(ul)
        c_cap_sq = min(Q(1, 2500), Q(19321, 10**6) * uh, Q(42) * g_best * uh * uh)
        check(C_max >= 0 and (C_max >= Q(1, 50) or C_max * C_max >= c_cap_sq),
              f"{name} strip {iu}: C_max underestimates certified content cap")

        a_cell = RHO0 * E_cell / D_RHO
        b_cell = E_cell / D_RHO

        v_dom_hi = u_tot - ul
        if resp_ell34 is not None:
            v_dom_hi = min(v_dom_hi, resp_ell34 - Q(3, 4) * ul)

        active_v = []
        for j in range(len(v_edges) - 1):
            vl, vh = v_edges[j], v_edges[j + 1]
            if vl > v_dom_hi:
                continue
            vh_eff = min(vh, v_dom_hi)
            active_v.append((vl, vh_eff))
        # Verify contiguous V-coverage from 0 up to max(0, v_dom_hi):
        if v_dom_hi > 0:
            check(len(active_v) >= 1 and active_v[0][0] == 0,
                  f"{name} strip {iu}: V-cover does not start at 0")
            for k in range(len(active_v) - 1):
                check(active_v[k][1] == active_v[k + 1][0],
                      f"{name} strip {iu}: V-cover gap at cell {k}")
            check(active_v[-1][1] == v_dom_hi,
                  f"{name} strip {iu}: V-cover stops at {active_v[-1][1]} < {v_dom_hi}")

        cells = strip["cells"]
        check(len(cells) == len(active_v),
              f"{name} strip {iu}: cell count {len(cells)} != active V-intervals {len(active_v)}")

        worst_u = None
        for ic, ((vl, vh_eff), cell) in enumerate(zip(active_v, cells)):
            s_uv_hi = min(uh + vh_eff, u_tot)
            if resp_ell34 is not None:
                s_uv_hi = min(s_uv_hi, resp_ell34 + Q(1, 4) * uh)
            delta_uv = s_uv_hi - E0
            k_val = Q(2) * delta_uv
            A0 = alpha_base - k_val / D_RHO
            B0 = beta_base - k_val / D_RHO
            dV_lo = D_RHO * vl
            dV_hi = D_RHO * vh_eff
            nu_add = nu_pen * max(Q(0), u_tot - ul - vl)

            check(isinstance(cell, list) and len(cell) >= 2 and all(isinstance(v, int) for v in cell),
                  f"{name} ({iu},{ic}): cell must be a compact integer list")
            mode = cell[0]
            if mode == 1:
                check(len(cell) == 3, f"{name} ({iu},{ic}): signed cell must have 3 integer elements")
                check(use_signed, f"{name} ({iu},{ic}): signed cell in non-signed cover")
                check(ul >= Q(2, 125),
                      f"{name} ({iu},{ic}): signed 11.61 forbidden below u = 2/125 (3 exempt boxes)")
                kap = Q(cell[1], 10)
                lam = Q(cell[2], 10**6)
                check(Q(0) <= kap <= Q(1), f"{name} ({iu},{ic}): kappa={kap} outside [0, 1]")
                A = A0 + lam
                B = B0 + lam
                check(A > 0 and B > 0, f"{name} ({iu},{ic}): non-positive quadratic cost (A={A}, B={B})")
                dVs = dV_hi if lam >= 0 else dV_lo
                q_c = kap / GAMMA_A
                cell_val = (
                    nu_add + (Q(1) - kap) * r_rem - kap * sig_lo + kap * ETA_A / GAMMA_A
                    + max_quad_on_iv(
                        Q(1) / A - q_c,
                        Q(2) * a_cell / A,
                        a_cell * a_cell / A + b_cell * b_cell / B + lam * dVs,
                        Q(0),
                        C_max,
                    )
                )
            elif mode == 0:
                lam0 = Q(cell[1], 10**6)
                A = A0 + lam0
                B = B0 + lam0
                check(A > 0 and B > 0, f"{name} ({iu},{ic}): non-positive quadratic cost in D_+ cell")

                r_pos = min(r_rem, -sig_lo)
                c_mid_hi = min(C_max, C_NEG_HI)
                dVs0 = dV_hi if lam0 >= 0 else dV_lo
                quad0 = ((c_mid_hi + a_cell) ** 2) / A + (b_cell ** 2) / B + lam0 * dVs0
                v_pos_low = nu_add + r_pos + quad0
                v_neg = nu_add + r_rem + quad0

                if C_max > C_NEG_LO:
                    check(len(cell) == 4, f"{name} ({iu},{ic}): high-C D_+ cell must have 4 elements")
                    kap1 = Q(cell[2], 10)
                    lam1 = Q(cell[3], 10**6)
                    check(Q(0) <= kap1 <= Q(1), f"{name} ({iu},{ic}): k1={kap1} outside [0, 1]")
                    A1 = A0 + lam1
                    B1 = B0 + lam1
                    check(A1 > 0 and B1 > 0,
                          f"{name} ({iu},{ic}): non-positive quadratic cost in D_+ high branch")
                    dVs1 = dV_hi if lam1 >= 0 else dV_lo
                    q_c1 = kap1 / GAMMA_A
                    vh_val = (
                        nu_add + (Q(1) - kap1) * r_pos - kap1 * sig_lo + kap1 * ETA_A / GAMMA_A
                        + max_quad_on_iv(
                            Q(1) / A1 - q_c1,
                            Q(2) * a_cell / A1,
                            a_cell * a_cell / A1 + b_cell * b_cell / B1 + lam1 * dVs1,
                            C_NEG_LO,
                            C_max,
                        )
                    )
                    v_pos_high = max(v_pos_low, vh_val)
                else:
                    check(len(cell) in (2, 4), f"{name} ({iu},{ic}): invalid D_+ cell length")
                    v_pos_high = v_pos_low

                cell_val = max(v_pos_high, v_neg)
            else:
                raise ValueError(f"{name} ({iu},{ic}): unknown cell mode {mode!r}")

            if worst_u is None or cell_val > worst_u:
                worst_u = cell_val
            if worst_all is None or cell_val > worst_all:
                worst_all = cell_val

        check(worst_u is not None, f"{name} strip {iu}: empty strip")
        strip_ub = Q(strip["ub"], 10**10)
        check(worst_u <= strip_ub, f"{name} strip {iu}: computed {worst_u} > stored strip_ub {strip_ub}")

    check(isinstance(cov["worst_ub_1e10"], int), f"{name}: worst_ub_1e10 must be int")
    cov_ub = Q(cov["worst_ub_1e10"], 10**10)
    check(worst_all is not None and worst_all <= cov_ub,
          f"{name}: computed worst {worst_all} > stored worst_ub {cov_ub}")
    return cov_ub, u_edges, [Q(s["ub"], 10**10) for s in strips]


def verify_bundle(bundle, cert_path=None, row8_override=None, rice_slope_override=None):
    if cert_path is not None:
        sz = os.path.getsize(cert_path)
        check(sz < 300_000, f"Certificate {cert_path} size {sz} B >= 300,000 B cap")

    check(isinstance(bundle, dict) and bundle.get("schema") == "kast-v1",
          "Invalid certificate schema (expected 'kast-v1')")

    found = verify_elementary_foundations(rice_slope_override=rice_slope_override)
    covers = bundle["covers"]

    expected_cover_keys = {
        "peak_dplus", "peak_signed", "cession_dplus",
        "scale_even_dplus", "scale_even_signed", "scale_all6_dplus", "scale_all6_signed",
    }
    check(set(covers.keys()) == expected_cover_keys, "covers keys mismatch")

    # 1. Part 1 & Part 2 covers on the peak abstract domain u <= 0.0463, u + V <= 0.080051:
    x_hi = Q(9, 1891)
    nu_hi = x_hi * Q(49, 625)

    peak_dp_ub, u_dp, strips_dp = verify_2d_cover("peak_dplus", covers["peak_dplus"], {
        "u_max": E0, "u_tot": U_TOT0, "x_pen": Q(0), "y_cess": Q(0), "nu_pen": Q(0),
        "use_signed_1161": False, "pure_dplus_cession": False, "resp_ell34": None,
    })
    peak_sg_ub, u_sg, strips_sg = verify_2d_cover("peak_signed", covers["peak_signed"], {
        "u_max": E0, "u_tot": U_TOT0, "x_pen": Q(0), "y_cess": Q(0), "nu_pen": Q(0),
        "use_signed_1161": True, "pure_dplus_cession": False, "resp_ell34": None,
    })
    cess_dp_ub, _, _ = verify_2d_cover("cession_dplus", covers["cession_dplus"], {
        "u_max": E0, "u_tot": U_TOT0, "x_pen": Q(0), "y_cess": Q(1, 100), "nu_pen": Q(0),
        "use_signed_1161": False, "pure_dplus_cession": True, "resp_ell34": None,
    })
    cess_total_dp = cess_dp_ub + Q(50, 10**6)

    # Pin exact published headline thresholds:
    check(peak_dp_ub < Q(2936, 10**8), f"peak_dplus {peak_dp_ub} >= 29.36e-6")
    check(peak_sg_ub < Q(27, 10**6), f"peak_signed {peak_sg_ub} >= 27.00e-6")
    check(cess_dp_ub < Q(2971, 10**8), f"cession_dplus {cess_dp_ub} >= 29.71e-6")
    check(cess_total_dp < Q(7971, 10**8), f"cession_total_dp {cess_total_dp} >= 79.71e-6")
    check(found["ppsi_scalar_control"] < cess_dp_ub,
          "cession_dplus upper bound below (P_Psi) scalar control witness")

    # Verify strict exact retained K (< 0) sub-bands at the peak row:
    saw_dp_zero = False
    for i, sub in enumerate(strips_dp):
        if u_dp[i + 1] <= Q(3, 100):
            saw_dp_zero = True
            check(sub < 0, f"peak_dplus strip [{u_dp[i]}, {u_dp[i+1]}] not strictly < 0")
    check(saw_dp_zero and Q(3, 100) in u_dp, "u = 3/100 missing from peak_dplus u_edges")

    for edge in (Q(177, 5000), Q(57, 1250)):
        check(edge in u_sg, f"edge {edge} missing from peak_signed u_edges")
    for i, sub in enumerate(strips_sg):
        if u_sg[i + 1] <= Q(177, 5000) or u_sg[i] >= Q(57, 1250):
            check(sub < 0, f"peak_signed strip [{u_sg[i]}, {u_sg[i+1]}] not strictly < 0")

    # 2. Part 3 scaled profile covers (lambda in [1850/1891, 1900/1891]):
    se_dp_ub, _, _ = verify_2d_cover("scale_even_dplus", covers["scale_even_dplus"], {
        "u_max": E0, "u_tot": U_TOT0, "x_pen": x_hi, "y_cess": Q(0), "nu_pen": Q(0),
        "use_signed_1161": False, "resp_ell34": None,
    })
    se_sg_ub, _, _ = verify_2d_cover("scale_even_signed", covers["scale_even_signed"], {
        "u_max": E0, "u_tot": U_TOT0, "x_pen": x_hi, "y_cess": Q(0), "nu_pen": Q(0),
        "use_signed_1161": True, "resp_ell34": None,
    })
    sa_dp_ub, _, _ = verify_2d_cover("scale_all6_dplus", covers["scale_all6_dplus"], {
        "u_max": E0, "u_tot": U_TOT0, "x_pen": x_hi, "y_cess": Q(0), "nu_pen": nu_hi,
        "use_signed_1161": False, "resp_ell34": None, "require_all6_nu_pen": True,
    })
    sa_sg_ub, _, _ = verify_2d_cover("scale_all6_signed", covers["scale_all6_signed"], {
        "u_max": E0, "u_tot": U_TOT0, "x_pen": x_hi, "y_cess": Q(0), "nu_pen": nu_hi,
        "use_signed_1161": True, "resp_ell34": None, "require_all6_nu_pen": True,
    })

    ca = SQRT_PI_HI - GA_SUPP
    cb = Q(3, 2) * SQRT_PI_HI - GB_SUPP
    check(ca > 0 and cb > 0, "One-sided profile loss slopes must be positive")
    da_max, db_max = Q(1, 2500), Q(1, 800)
    lam_lo, lam_hi = Q(37, 50) / EPS0, Q(19, 25) / EPS0
    check(lam_lo == Q(1850, 1891) and lam_hi == Q(1900, 1891), "Profile lambda range mismatch")
    bench_gap = S0_HI - J0_SUPP_LO  # upper bound on S_0 - J_0(v_*)

    rect_even_dp = lam_hi * (se_dp_ub + bench_gap + ca * da_max + cb * db_max)
    rect_even_sg = lam_hi * (se_sg_ub + bench_gap + ca * da_max + cb * db_max)
    rect_all6_le1_dp = Q(1) * (peak_dp_ub + bench_gap + ca * da_max + cb * db_max)
    rect_all6_le1_sg = Q(1) * (peak_sg_ub + bench_gap + ca * da_max + cb * db_max)
    rect_all6_dp = lam_hi * (sa_dp_ub + bench_gap + ca * da_max + cb * db_max)
    rect_all6_sg = lam_hi * (sa_sg_ub + bench_gap + ca * da_max + cb * db_max)

    # Pin exact published rectangle thresholds:
    check(rect_even_dp < Q(1078, 10**7), f"rect_even_dp {rect_even_dp} >= 1.078e-4")
    check(rect_even_sg < Q(1070, 10**7), f"rect_even_sg {rect_even_sg} >= 1.070e-4")
    check(rect_all6_le1_dp < Q(1072, 10**7), f"rect_all6_le1_dp {rect_all6_le1_dp} >= 1.072e-4")
    check(rect_all6_le1_sg < Q(1048, 10**7), f"rect_all6_le1_sg {rect_all6_le1_sg} >= 1.048e-4")
    check(rect_all6_dp < Q(1220, 10**7), f"rect_all6_dp {rect_all6_dp} >= 1.220e-4")
    check(rect_all6_sg < Q(1214, 10**7), f"rect_all6_sg {rect_all6_sg} >= 1.214e-4")

    # Sub-rectangles with total error strictly < 10^-4:
    rect_even_sub_dp = lam_hi * (se_dp_ub + bench_gap + ca * da_max + cb * Q(1, 1000))
    rect_even_sub_sg = lam_hi * (se_sg_ub + bench_gap + ca * da_max + cb * Q(1, 970))
    rect_all6_le1_sub_sg = Q(1) * (peak_sg_ub + bench_gap + ca * da_max + cb * Q(1, 950))
    check(rect_even_sub_dp < Q(1, 10000), "even D_+ sub-rectangle db <= 1/1000 failed < 1e-4")
    check(rect_even_sub_sg < Q(1, 10000), "even signed sub-rectangle db <= 1/970 failed < 1e-4")
    check(rect_all6_le1_sub_sg < Q(1, 10000), "all-6 lambda <= 1 sub-rectangle db <= 1/950 failed < 1e-4")

    # Verify flank and upper lie outside 11.53 profile rectangle:
    for pname, (peps, paa, pbb) in {
        "flank": (Q(149, 200), Q(14, 25), Q(1467, 10000)),
        "upper": (EPS0, Q(573, 1000), Q(19, 125)),
    }.items():
        pscale = peps / EPS0
        d0, d1 = paa / pscale - A0_PROF, pbb / pscale - BETA0
        check(not (Q(0) <= d0 <= da_max and Q(0) <= d1 <= db_max),
              f"Named profile {pname} unexpectedly inside 11.53 rectangle")

    # 3. Direct closure of Row 8 ([21/25, 847/1000]) of 8.13(ii) (eps = 94/125):
    if row8_override is not None:
        r8 = row8_override
    else:
        with open(CENTRAL_94_125_JSON, "r") as f:
            c94_data = json.load(f)
        rows94 = c94_data["eps_94_125"]["rows"]
        r8 = rows94[7]  # 0-indexed index 7 is Row 8 ([21/25, 847/1000])

    eps_8 = Q(r8["epsilon"])
    t8_lo, t8_hi = Q(r8["lo"]), Q(r8["hi"])
    ell_8, beta_8 = Q(r8["ell"]), Q(r8["beta"])
    S8_up = Q(r8["S_upper_accepted"])
    eta8_max = Q(r8["eta_max_exact"])
    check(eps_8 == Q(94, 125) and t8_lo == Q(21, 25) and t8_hi == Q(847, 1000),
          "Row 8 identity mismatch in central_94_125_certificate.json")
    q8_lo = t8_lo * t8_lo - Q(2) * ell_8 * t8_lo + Q(2) * beta_8 * beta_8 / eps_8
    q8_hi = t8_hi * t8_hi - Q(2) * ell_8 * t8_hi + Q(2) * beta_8 * beta_8 / eps_8
    check(Q(500, 701) - (max(q8_lo, q8_hi) + S8_up) == eta8_max,
          "Row 8 exact allowance recomputation mismatch")
    check(eta8_max > Q(1, 10000), "Row 8 eta_max not above 10^-4")

    lam_8 = eps_8 / EPS0  # 1880/1891 < 1
    check(lam_8 == Q(1880, 1891) < Q(1), "Row 8 lambda != 1880/1891")
    a_8 = ell_8 - Q(2) * beta_8
    da_8 = a_8 / lam_8 - A0_PROF
    db_8 = beta_8 / lam_8 - BETA0
    check(Q(0) < da_8 < da_max and Q(0) < db_8 < db_max,
          "Row 8 scaled profile outside 11.53 rectangle")
    u0_r8 = Q(4) * EPS0 * EPS0 * B_212B * (A_212B - t8_lo)
    utot_r8 = EPS0 * EPS0 * (Q(3, 2) * (PI_HI / Q(4) - t8_lo * t8_lo) + B_212B * (A_212B - t8_lo))
    check(u0_r8 < E0 and utot_r8 < U_TOT0, "Row 8 scaled response energies exceed peak domain")

    # Since lam_8 < 1, (lam_8 - 1) <= 0 => x_pen = 0, nu_pen = 0 (unbounded W >= 0):
    err_r8_dp = lam_8 * (peak_dp_ub + bench_gap + ca * da_8 + cb * db_8)
    err_r8_sg = lam_8 * (peak_sg_ub + bench_gap + ca * da_8 + cb * db_8)
    check(err_r8_dp < Q(635, 10**7) < Q(1, 10000) < eta8_max,
          f"Row 8 D_+ error {err_r8_dp} failed < 6.35e-5 < 10^-4 < eta8_max")
    check(err_r8_sg < Q(611, 10**7) < Q(1, 10000) < eta8_max,
          f"Row 8 signed error {err_r8_sg} failed < 6.11e-5 < 10^-4 < eta8_max")

    # 4. Part 4 consumer subdivided t-slab covers via scaled peak row (lam * ell_0, lam * beta_0),
    # pinning the exact promised [t_lo, t_hi] endpoints for each named consumer:
    cons_specs = {
        "eps_1891_2500_dplus": (EPS0, Q(500, 701), False, Q(21, 25), Q(21399, 25000)),
        "eps_1891_2500_signed": (EPS0, Q(500, 701), True, Q(21, 25), Q(8661, 10000)),
        "eps_94_125_signed": (Q(94, 125), Q(500, 701), True, Q(21, 25), Q(8547, 10000)),
        "eps_3_4_signed": (Q(3, 4), Q(500, 701), True, Q(21, 25), Q(5323, 6250)),
        "eps_299_400_signed": (Q(299, 400), Q(713263, 1000000), True, Q(21, 25), Q(21237, 25000)),
    }
    cons_map = bundle["consumer_slabs"]
    check(set(cons_map.keys()) == set(cons_specs.keys()), "consumer_slabs keys mismatch")

    cons_summary = {}
    for cname, (ceps, ctarget, csigned, exp_t_lo, exp_t_hi) in cons_specs.items():
        cobj = cons_map[cname]
        check(Q(cobj["eps"]) == ceps, f"{cname}: eps mismatch")
        clam = Q(cobj["lam"])
        check(clam == ceps / EPS0 and Q(0) < clam <= Q(1), f"{cname}: invalid lambda={clam}")
        check(Q(cobj["target_cap"]) == ctarget, f"{cname}: target_cap mismatch")
        check(bool(cobj["use_signed_1161"]) == csigned, f"{cname}: use_signed_1161 mismatch")

        slabs = cobj["slabs"]
        check(len(slabs) >= 1, f"{cname}: empty slabs")
        check(Q(slabs[0]["t_lo"]) == exp_t_lo and Q(slabs[-1]["t_hi"]) == exp_t_hi,
              f"{cname}: slab cover [{slabs[0]['t_lo']}, {slabs[-1]['t_hi']}] != promised t-interval [{exp_t_lo}, {exp_t_hi}]")
        ell_s = clam * ELL0
        beta_s = clam * BETA0

        worst_cap = None
        for idx, sl in enumerate(slabs):
            ta, tb = Q(sl["t_lo"]), Q(sl["t_hi"])
            check(Q(0) < ta < tb < A_212B and tb * tb < PI_HI / Q(4),
                  f"{cname} slab {idx}: invalid t-interval [{ta}, {tb}]")
            if idx > 0:
                prev_tb = Q(slabs[idx - 1]["t_hi"])
                check(ta == prev_tb, f"{cname} slab {idx}: t-gap between {prev_tb} and {ta}")

            u0_c = Q(4) * EPS0 * EPS0 * B_212B * (A_212B - ta)
            e34 = Q(3, 2) * EPS0 * EPS0 * (PI_HI / Q(4) - ta * ta)
            utot_c = e34 + Q(1, 4) * u0_c
            check(Q(0) < u0_c <= E0 and Q(0) < utot_c <= U_TOT0,
                  f"{cname} slab {idx}: scaled response energies out of peak box")

            slab_ub, _, _ = verify_2d_cover(f"{cname}[{idx}]", sl["cover"], {
                "u_max": u0_c, "u_tot": utot_c, "x_pen": Q(0), "y_cess": Q(0),
                "nu_pen": Q(0), "use_signed_1161": csigned, "pure_dplus_cession": False,
                "resp_ell34": e34,
            })
            qa = ta * ta - Q(2) * ell_s * ta + Q(2) * beta_s * beta_s / ceps
            qb = tb * tb - Q(2) * ell_s * tb + Q(2) * beta_s * beta_s / ceps
            tot_v = max(qa, qb) + clam * (S0_HI + slab_ub)
            check(isinstance(sl["cap_1e10"], int), f"{cname} slab {idx}: cap_1e10 must be int")
            cap_stored = Q(sl["cap_1e10"], 10**10)
            check(tot_v <= cap_stored < ctarget,
                  f"{cname} slab {idx}: tot_v={tot_v} vs stored={cap_stored} vs target={ctarget}")
            if worst_cap is None or cap_stored > worst_cap:
                worst_cap = cap_stored

        t_cov = [Q(cobj["t_covered"][0]), Q(cobj["t_covered"][1])]
        check(t_cov == [exp_t_lo, exp_t_hi],
              f"{cname}: t_covered {t_cov} != promised t-interval [{exp_t_lo}, {exp_t_hi}]")
        check(isinstance(cobj["max_cap_1e10"], int), f"{cname}: max_cap_1e10 must be int")
        max_cap_stored = Q(cobj["max_cap_1e10"], 10**10)
        check(worst_cap <= max_cap_stored < ctarget, f"{cname}: max_cap_1e10 >= target_cap")
        cons_summary[cname] = (t_cov[0], t_cov[1], len(slabs), max_cap_stored, ctarget - max_cap_stored)

    # Cross-check against central_7475_certificate.json target cap (713263/1000000):
    with open(CENTRAL_7475_JSON, "r") as f:
        c7475 = json.load(f)
    check(len(c7475) == 10 and Q(c7475[7]["lo"]) == Q(1703, 2000),
          "central_7475_certificate.json structure check failed")

    return {
        "foundations": found,
        "peak_dplus": peak_dp_ub,
        "peak_signed": peak_sg_ub,
        "cession_dplus": cess_dp_ub,
        "cession_total_dp": cess_total_dp,
        "rect_even_dp": rect_even_dp,
        "rect_even_sg": rect_even_sg,
        "rect_all6_le1_dp": rect_all6_le1_dp,
        "rect_all6_le1_sg": rect_all6_le1_sg,
        "rect_all6_dp": rect_all6_dp,
        "rect_all6_sg": rect_all6_sg,
        "row8_dp": err_r8_dp,
        "row8_sg": err_r8_sg,
        "row8_eta_max": eta8_max,
        "consumers": cons_summary,
    }


def main():
    cert_path = DEFAULT_CERT if len(sys.argv) == 1 else sys.argv[1]
    with open(cert_path, "r") as f:
        bundle = json.load(f)
    res = verify_bundle(bundle, cert_path=cert_path)

    print("ALL KAST ZERO-FLOAT EXACT RATIONAL CHECKS PASSED!")
    print(f"  Part 1 (Peak A+B 7.4.16 & all-6 7.5.13 [author-only]):")
    print(f"    D_+ 11.61 only:    < {fmt_micro_ceil(res['peak_dplus'])}  (strict < 0 on u in [0, 3/100])")
    print(f"    Signed 11.61:      < {fmt_micro_ceil(res['peak_signed'])}  (strict < 0 on [0, 177/5000] U [57/1250, 463/10000])")
    print(f"  Part 2 (7.5.3 (P_Psi) J_AB + 0.01||U||^2 - D_+ cession):")
    print(f"    D_+ 11.61 only:    < {fmt_micro_ceil(res['cession_dplus'])}  (total 7.5.3 < {fmt_micro_ceil(res['cession_total_dp'])}; scalar control = {fmt_dec(res['foundations']['ppsi_scalar_control'] * 10**6, 5)}e-6)")
    print(f"  Part 3 (11.53 profile rectangle eps in [37/50, 19/25]):")
    print(f"    Even A+B:          < {fmt_micro_ceil(res['rect_even_dp'])} (D_+), < {fmt_micro_ceil(res['rect_even_sg'])} (signed)")
    print(f"    All-6 (lam <= 1):  < {fmt_micro_ceil(res['rect_all6_le1_dp'])} (D_+), < {fmt_micro_ceil(res['rect_all6_le1_sg'])} (signed)")
    print(f"    All-6 (lam > 1):   < {fmt_micro_ceil(res['rect_all6_dp'])} (D_+), < {fmt_micro_ceil(res['rect_all6_sg'])} (signed)")
    print(f"  Part 4a (8.13(ii) Row 8 [21/25, 847/1000] direct closure vs eta_max = {fmt_micro_ceil(res['row8_eta_max'])}):")
    print(f"    Row 8 error:       < {fmt_micro_ceil(res['row8_dp'])} (D_+), < {fmt_micro_ceil(res['row8_sg'])} (signed) < 100e-6")
    print(f"  Part 4b (Subdivided central consumer slabs via scaled peak row):")
    for cname, (ta, tb, nsl, wcap, rsv) in res["consumers"].items():
        print(f"    {cname:22s}: [{ta} ({fmt_dec(ta, 6)}), {tb} ({fmt_dec(tb, 6)})] "
              f"({nsl} slabs, max_cap={fmt_dec(wcap, 9)}, min_reserve={fmt_micro_ceil(rsv)})")


if __name__ == "__main__":
    main()
