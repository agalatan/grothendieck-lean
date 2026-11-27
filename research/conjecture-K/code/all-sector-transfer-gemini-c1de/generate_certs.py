#!/usr/bin/env python3
"""Generate compact exact rational certificates (`all_sector_transfer_cert.json`, < 250 KB)
for Issue #728 (STATUS tag KAST).

Agent-ID: gemini-c1de
Refs: #728, #436, #177
"""
from fractions import Fraction
import json
import math
import os

HERE = os.path.dirname(os.path.abspath(__file__))

EPS0 = Fraction(1891, 2500)
P0 = Fraction(2500, 1891)
ELL0 = Fraction(1057, 1250)
BETA0 = Fraction(179, 1250)
A0_PROF = ELL0 - 2 * BETA0  # 699/1250
RHO0 = Fraction(5053, 10000)
D_RHO = 1 + RHO0 * RHO0  # 125532809/100000000
S_TILT = Fraction(3, 5)
E0 = Fraction(463, 10000)
U_TOT0 = Fraction(80051, 1000000)
GAMMA_A = Fraction(7, 25)
ETA_A = Fraction(6, 1000000)

A_212B = Fraction(886762780, 10**9)
B_212B = Fraction(432306903, 10**9)
PI_HI = Fraction(31415926535897932385, 10**19)

U0_REM = Fraction(1373953883, 10**9)
S0_LO = Fraction(13739535256614, 10**13)
S0_HI = Fraction(13739535256616, 10**13)
J0_SUPP_LO = Fraction(13739535256614828, 10**16)

GAMMA_TABLE = sorted([
    (Fraction(0), Fraction(2, 25)),
    (Fraction(1, 125), Fraction(49, 1000)),
    (Fraction(9, 1000), Fraction(251, 5000)),
    (Fraction(3, 250), Fraction(121, 2500)),
    (Fraction(3, 200), Fraction(467, 10000)),
    (Fraction(9, 500), Fraction(451, 10000)),
    (Fraction(1, 50), Fraction(83, 2000)),
    (Fraction(1, 40), Fraction(393, 10000)),
    (Fraction(3, 100), Fraction(3, 80)),
    (Fraction(7, 200), Fraction(71, 2000)),
    (Fraction(3, 80), Fraction(173, 5000)),
    (Fraction(1, 25), Fraction(17, 500)),
    (Fraction(21, 500), Fraction(331, 10000)),
    (Fraction(11, 250), Fraction(13, 400)),
], key=lambda x: x[0])


def ceil_1e10(q):
    q = Fraction(q)
    return (q.numerator * 10**10 + q.denominator - 1) // q.denominator


def rat_sqrt_hi_int(q, scale=10**8):
    if q <= 0:
        return 0
    n = (q.numerator * scale * scale + q.denominator - 1) // q.denominator
    r = math.isqrt(n)
    if r * r < n:
        r += 1
    if Fraction(r, scale) ** 2 < q:
        raise RuntimeError("rat_sqrt_hi_int bug")
    return r
def rat_sqrt_hi(q, scale=10**10):
    return Fraction(rat_sqrt_hi_int(q, scale), scale)


def rat_sqrt_lo(q, scale=10**10):
    if q <= 0:
        return Fraction(0)
    n = (q.numerator * scale * scale) // q.denominator
    r = math.isqrt(n)
    out = Fraction(r, scale)
    if out * out > q:
        raise RuntimeError("rat_sqrt_lo bug")
    return out


C_NEG_HI = rat_sqrt_hi(ETA_A, 10**10)
C_NEG_LO = rat_sqrt_lo(ETA_A, 10**10)


def best_gamma(u_lo):
    best = Fraction(2, 25)
    for e_i, g_i in GAMMA_TABLE:
        if u_lo >= e_i and g_i < best:
            best = g_i
    return best


def sigma_lo_iv(u_lo, u_hi):
    lo = Fraction(0)
    if u_hi <= Fraction(1, 100):
        lo = max(lo, Fraction(113, 100000))
    elif u_hi <= Fraction(2, 100):
        lo = max(lo, Fraction(49, 100000))
    elif u_hi <= Fraction(25, 1000):
        lo = max(lo, Fraction(27, 100000))
    elif u_hi <= Fraction(3, 100):
        lo = max(lo, Fraction(1, 10000))
    if u_lo >= Fraction(551, 100000) and u_hi <= E0:
        us_lo = Fraction(403448, 10**7)
        us_hi = Fraction(403449, 10**7)
        if u_hi <= us_lo:
            dist = us_lo - u_hi
        elif u_lo >= us_hi:
            dist = u_lo - us_hi
        else:
            dist = Fraction(0)
        lo = max(lo, Fraction(27, 25) * dist * dist)
    return lo


def rho_rem_hi(u_lo, u_hi):
    if u_hi <= Fraction(1, 100):
        return Fraction(-113, 100000)
    if u_hi <= Fraction(2, 100):
        return Fraction(-49, 100000)
    if u_hi <= Fraction(25, 1000):
        return Fraction(-27, 100000)
    if u_hi <= Fraction(3, 100):
        return Fraction(-1, 10000)
    return U0_REM - S0_LO


def max_quad_on_iv(A_c2, B_c1, C_c0, lo, hi):
    vals = [A_c2 * lo * lo + B_c1 * lo + C_c0, A_c2 * hi * hi + B_c1 * hi + C_c0]
    if A_c2 < 0:
        c_star = -B_c1 / (2 * A_c2)
        if lo < c_star < hi:
            vals.append(A_c2 * c_star * c_star + B_c1 * c_star + C_c0)
    return max(vals)


def opt_lam(a0, b0, A0, B0, dV_lo, dV_hi, c_lo, c_hi, q_coeff):
    lo_lam = max(-float(A0), -float(B0)) + 1e-8
    best_v = 1e99
    best_l = max(0.0, lo_lam + 1e-5)
    a0f, b0f, A0f, B0f = float(a0), float(b0), float(A0), float(B0)
    dv_l, dv_h = float(dV_lo), float(dV_hi)
    clo, chi, qf = float(c_lo), float(c_hi), float(q_coeff)

    def eval_l(lf):
        Af = A0f + lf
        Bf = B0f + lf
        if Af <= 1e-9 or Bf <= 1e-9:
            return 1e99
        dv = dv_h if lf >= 0 else dv_l
        c2 = 1.0 / Af - qf
        c1 = 2.0 * a0f / Af
        c0 = a0f * a0f / Af + b0f * b0f / Bf + lf * dv
        vs = [c2 * clo * clo + c1 * clo + c0, c2 * chi * chi + c1 * chi + c0]
        if c2 < -1e-15:
            cs = -c1 / (2.0 * c2)
            if clo < cs < chi:
                vs.append(c2 * cs * cs + c1 * cs + c0)
        return max(vs)

    cands = [0.0]
    for k in range(-30, 110, 2):
        cands.append(lo_lam + (1.22 ** k) * 1e-6)
    if lo_lam < 0:
        for t in range(5, 100, 5):
            cands.append(lo_lam * (t / 100.0))
        for k in range(28):
            cands.append(-1e-6 * (1.5 ** k))
    for lf in cands:
        if lf > lo_lam:
            v = eval_l(lf)
            if v < best_v:
                best_v, best_l = v, lf
    span = max(1e-4, abs(best_l) * 0.5, (best_l - lo_lam) * 0.45)
    left = max(lo_lam + 1e-9, best_l - span)
    right = best_l + span
    for _ in range(36):
        m1 = left + (right - left) * 0.38196601125
        m2 = left + (right - left) * 0.61803398875
        if eval_l(m1) < eval_l(m2):
            right = m2
        else:
            left = m1
    best_l = 0.5 * (left + right)
    # Encode lambda as an exact integer multiple of 10^-6:
    l_int = round(best_l * 10**6)
    q_lam = Fraction(l_int, 10**6)
    if A0 + q_lam <= 0 or B0 + q_lam <= 0:
        l_int = math.ceil(float(max(-A0, -B0) + Fraction(1, 10**5)) * 10**6)
        q_lam = Fraction(l_int, 10**6)
    return q_lam, l_int


def build_2d_cover(
    u_max, u_tot, x_pen=Fraction(0), y_cess=Fraction(0), nu_pen=Fraction(0),
    use_signed_1161=False, response_ellipsoid_34=None, nu_grid=32, nv_grid=18,
    fine_u=False, pure_dplus_cession=False
):
    if pure_dplus_cession and use_signed_1161:
        raise ValueError("pure_dplus_cession incompatible with use_signed_1161")
    special_u = [
        Fraction(0), Fraction(551, 100000), Fraction(1, 100), Fraction(2, 125),
        Fraction(2, 100), Fraction(25, 1000), Fraction(3, 100),
        Fraction(403448, 10**7), Fraction(403449, 10**7), u_max
    ]
    if fine_u:
        special_u.extend([
            Fraction(353, 10000), Fraction(354, 10000),
            Fraction(4047, 100000), Fraction(4049, 100000), Fraction(4051, 100000),
            Fraction(454, 10000), Fraction(455, 10000), Fraction(4625, 10000),
        ])
    u_base = [u_max * i / nu_grid for i in range(nu_grid + 1)]
    u_extra = (
        [Fraction(398 + 2 * k, 10000) for k in range(9)]
        + [Fraction(2021 + k, 50000) for k in range(18)]
        + [Fraction(450 + 2 * k, 10000) for k in range(7)]
    ) if fine_u else [Fraction(400, 10000), Fraction(407, 10000)]
    u_edges = sorted(set(u for u in (u_base + special_u + u_extra) if 0 <= u <= u_max))

    v_tiny = [
        Fraction(0), Fraction(1, 10**7), Fraction(1, 10**6), Fraction(5, 10**6),
        Fraction(12, 10**6), Fraction(2, 10**5), Fraction(32, 10**6), Fraction(5, 10**5),
        Fraction(72, 10**6), Fraction(1, 10**4), Fraction(25, 10**5), Fraction(6, 10**4),
    ] if fine_u else [Fraction(0), Fraction(1, 10**6), Fraction(5, 10**5), Fraction(4, 10**4)]
    v_edges = sorted(set([v for v in v_tiny if v <= u_tot] + [u_tot * j / nv_grid for j in range(nv_grid + 1)]))

    alpha_base = Fraction(31, 100) - Fraction(9, 25) * x_pen
    beta_base = Fraction(2, 25) - y_cess

    strips = []
    worst_all = Fraction(-10)

    for iu in range(len(u_edges) - 1):
        ul, uh = u_edges[iu], u_edges[iu + 1]
        if pure_dplus_cession:
            sig_lo = Fraction(0)
            r_rem = Fraction(0)
        else:
            sig_lo = sigma_lo_iv(ul, uh)
            r_rem = rho_rem_hi(ul, uh)
        e_int = rat_sqrt_hi_int(Fraction(49, 4000000) * uh, 10**10)
        E_cell = Fraction(e_int, 10**10)
        a_cell = RHO0 * E_cell / D_RHO
        b_cell = E_cell / D_RHO
        g_best = best_gamma(ul)
        c_cap_sq = min(Fraction(1, 2500), Fraction(19321, 10**6) * uh, 42 * g_best * uh * uh)
        c_int = min(2_000_000, rat_sqrt_hi_int(c_cap_sq, 10**8))
        C_max = Fraction(c_int, 10**8)

        v_cells = []
        worst_u = Fraction(-10)
        for iv in range(len(v_edges) - 1):
            vl, vh = v_edges[iv], v_edges[iv + 1]
            v_dom_hi = u_tot - ul
            if response_ellipsoid_34 is not None:
                v_dom_hi = min(v_dom_hi, response_ellipsoid_34 - Fraction(3, 4) * ul)
            if vl > v_dom_hi:
                continue
            vh_eff = min(vh, v_dom_hi)
            s_uv_hi = min(uh + vh_eff, u_tot)
            if response_ellipsoid_34 is not None:
                s_uv_hi = min(s_uv_hi, response_ellipsoid_34 + Fraction(1, 4) * uh)
            delta_uv = s_uv_hi - E0
            k_val = 2 * delta_uv
            A0 = alpha_base - k_val / D_RHO
            B0 = beta_base - k_val / D_RHO
            dV_lo = D_RHO * vl
            dV_hi = D_RHO * vh_eff
            nu_add = nu_pen * max(Fraction(0), u_tot - ul - vl)

            if use_signed_1161 and ul >= Fraction(2, 125):
                best_rec = None
                for k_ten in (10, 9, 8, 0):
                    kap = Fraction(k_ten, 10)
                    q_c = kap / GAMMA_A
                    lam, l_int = opt_lam(a_cell, b_cell, A0, B0, dV_lo, dV_hi, Fraction(0), C_max, q_c)
                    A = A0 + lam
                    B = B0 + lam
                    dVs = dV_hi if lam >= 0 else dV_lo
                    val = (
                        nu_add + (1 - kap) * r_rem - kap * sig_lo + kap * ETA_A / GAMMA_A
                        + max_quad_on_iv(Fraction(1) / A - q_c, 2 * a_cell / A,
                                         a_cell * a_cell / A + b_cell * b_cell / B + lam * dVs,
                                         Fraction(0), C_max)
                    )
                    if best_rec is None or val < best_rec[0]:
                        best_rec = (val, k_ten, l_int)
                cell_val, k_win, l_win = best_rec
                v_cells.append([1, k_win, l_win])
            else:
                r_pos = min(r_rem, -sig_lo)
                c_mid_hi = min(C_max, C_NEG_HI)
                lam0, l0_int = opt_lam(a_cell, b_cell, A0, B0, dV_lo, dV_hi, Fraction(0), c_mid_hi, Fraction(0))
                A = A0 + lam0
                B = B0 + lam0
                dVs = dV_hi if lam0 >= 0 else dV_lo
                quad0 = ((c_mid_hi + a_cell) ** 2) / A + (b_cell ** 2) / B + lam0 * dVs
                v_pos_low = nu_add + r_pos + quad0
                v_neg = nu_add + r_rem + quad0

                if C_max > C_NEG_LO:
                    best_ph = None
                    for k_ten in (10, 9):
                        kap = Fraction(k_ten, 10)
                        q_c = kap / GAMMA_A
                        lam1, l1_int = opt_lam(a_cell, b_cell, A0, B0, dV_lo, dV_hi, C_NEG_LO, C_max, q_c)
                        A1 = A0 + lam1
                        B1 = B0 + lam1
                        dVs1 = dV_hi if lam1 >= 0 else dV_lo
                        vh_val = (
                            nu_add + (1 - kap) * r_pos - kap * sig_lo + kap * ETA_A / GAMMA_A
                            + max_quad_on_iv(Fraction(1) / A1 - q_c, 2 * a_cell / A1,
                                             a_cell * a_cell / A1 + b_cell * b_cell / B1 + lam1 * dVs1,
                                             C_NEG_LO, C_max)
                        )
                        if best_ph is None or vh_val < best_ph[0]:
                            best_ph = (vh_val, k_ten, l1_int)
                    v_pos_high = max(v_pos_low, best_ph[0])
                    cell_val = max(v_pos_high, v_neg)
                    v_cells.append([0, l0_int, best_ph[1], best_ph[2]])
                else:
                    cell_val = max(v_pos_low, v_neg)
                    v_cells.append([0, l0_int])

            if cell_val > worst_u:
                worst_u = cell_val
            if cell_val > worst_all:
                worst_all = cell_val

        ub_int = ceil_1e10(worst_u)
        if Fraction(ub_int, 10**10) > worst_all:
            worst_all = Fraction(ub_int, 10**10)
        strips.append({
            "e": e_int,
            "c": c_int,
            "ub": ub_int,
            "cells": v_cells,
        })

    w_int = ceil_1e10(worst_all)
    return {
        "u_max": str(u_max),
        "u_tot": str(u_tot),
        "x_pen": str(x_pen),
        "y_cess": str(y_cess),
        "nu_pen": str(nu_pen),
        "use_signed_1161": use_signed_1161,
        "pure_dplus_cession": bool(pure_dplus_cession),
        "resp_ell34": None if response_ellipsoid_34 is None else str(response_ellipsoid_34),
        "u_edges": [str(u) for u in u_edges],
        "v_edges": [str(v) for v in v_edges],
        "worst_ub_1e10": w_int,
        "strips": strips,
    }


def build_scaled_peak_consumer_slabs(eps, target_cap, t_center_hint, use_signed=True):
    """Fast bisection + adaptive recursive subdivision on exact rational t-slabs [ta, tb]."""
    lam = eps / EPS0
    assert 0 < lam <= 1
    ell_s = lam * ELL0
    beta_s = lam * BETA0

    def row_quad_pt(t):
        return t * t - 2 * ell_s * t + 2 * beta_s * beta_s / eps

    def row_quad_max(ta, tb):
        return max(row_quad_pt(ta), row_quad_pt(tb))

    def u0_cap_at(ta):
        return 4 * EPS0 * EPS0 * B_212B * (A_212B - ta)

    def ell34_at(ta):
        return Fraction(3, 2) * EPS0 * EPS0 * (PI_HI / 4 - ta * ta)

    def eval_slab_exact(ta, tb, nu_g=7, nv_g=5):
        u0_c = u0_cap_at(ta)
        e34 = ell34_at(ta)
        utot_c = e34 + Fraction(1, 4) * u0_c
        if u0_c > E0 or utot_c > U_TOT0 or u0_c <= 0:
            return None
        cov = build_2d_cover(
            u_max=u0_c, u_tot=utot_c, x_pen=Fraction(0), y_cess=Fraction(0),
            use_signed_1161=use_signed, response_ellipsoid_34=e34, nu_grid=nu_g, nv_grid=nv_g, fine_u=False
        )
        tot_v = row_quad_max(ta, tb) + lam * (S0_HI + Fraction(cov["worst_ub_1e10"], 10**10))
        tot_1e10 = ceil_1e10(tot_v)
        return cov, Fraction(tot_1e10, 10**10), tot_1e10

    # Check center point first:
    tc = Fraction(round(float(t_center_hint) * 10000), 10000)
    c_mid = eval_slab_exact(tc, tc + Fraction(1, 10000), 7, 5)
    if c_mid is None or c_mid[1] >= target_cap:
        raise RuntimeError(f"Center {tc} does not pass for eps={eps}")

    # Linear scan on step 1/5000 outward from tc to find the exact connected interval around tc:
    step = Fraction(1, 5000)
    t_left = tc
    while t_left - step >= Fraction(838, 1000):
        cand = t_left - step
        res = eval_slab_exact(cand, t_left, 7, 5)
        if res is not None and res[1] <= target_cap - Fraction(2, 10**7):
            t_left = cand
        else:
            break
    fine_step = Fraction(1, 50000)
    for _ in range(10):
        cand = t_left - fine_step
        res = eval_slab_exact(cand, t_left, 7, 5)
        if res is not None and res[1] <= target_cap - Fraction(1, 10**7):
            t_left = cand
        else:
            break

    t_right = tc + Fraction(1, 10000)
    while t_right + step <= Fraction(866, 1000):
        cand = t_right + step
        res = eval_slab_exact(t_right, cand, 7, 5)
        if res is not None and res[1] <= target_cap - Fraction(2, 10**7):
            t_right = cand
        else:
            break
    for _ in range(10):
        cand = t_right + fine_step
        res = eval_slab_exact(t_right, cand, 7, 5)
        if res is not None and res[1] <= target_cap - Fraction(1, 10**7):
            t_right = cand
        else:
            break

    # Recursively certify [t_left, t_right] with as few slabs as possible!
    slabs = []

    def certify_range(ta, tb, depth=0):
        res = eval_slab_exact(ta, tb, 7, 5)
        if res is not None and res[1] <= target_cap - Fraction(1, 10**7):
            slabs.append({
                "t_lo": str(ta),
                "t_hi": str(tb),
                "cap_1e10": res[2],
                "cover": res[0],
            })
            return
        if depth >= 10:
            res_fine = eval_slab_exact(ta, tb, 14, 9)
            if res_fine is not None and res_fine[1] < target_cap:
                slabs.append({
                    "t_lo": str(ta),
                    "t_hi": str(tb),
                    "cap_1e10": res_fine[2],
                    "cover": res_fine[0],
                })
                return
            raise RuntimeError(f"Failed to close consumer sub-slab [{ta}, {tb}] at eps={eps}")
        t_mid = Fraction(int((ta + tb) * 50000), 100000)
        if t_mid <= ta or t_mid >= tb:
            t_mid = (ta + tb) / 2
        certify_range(ta, t_mid, depth + 1)
        certify_range(t_mid, tb, depth + 1)

    certify_range(t_left, t_right, 0)

    return {
        "eps": str(eps),
        "lam": str(lam),
        "target_cap": str(target_cap),
        "use_signed_1161": use_signed,
        "t_covered": [slabs[0]["t_lo"], slabs[-1]["t_hi"]],
        "max_cap_1e10": max(s["cap_1e10"] for s in slabs),
        "slabs": slabs,
    }


def main():
    print("Building Part 1 & Part 2 2D exact rational covers...")
    c_peak_dplus = build_2d_cover(
        E0, U_TOT0, Fraction(0), Fraction(0), Fraction(0),
        False, None, 26, 15, fine_u=True, pure_dplus_cession=False
    )
    c_peak_signed = build_2d_cover(
        E0, U_TOT0, Fraction(0), Fraction(0), Fraction(0),
        True, None, 26, 15, fine_u=True, pure_dplus_cession=False
    )
    c_cess_dplus = build_2d_cover(
        E0, U_TOT0, Fraction(0), Fraction(1, 100), Fraction(0),
        False, None, 26, 15, fine_u=True, pure_dplus_cession=True
    )

    print(f"  peak_dplus:    {c_peak_dplus['worst_ub_1e10']/1e4:.4f}e-6")
    print(f"  peak_signed:   {c_peak_signed['worst_ub_1e10']/1e4:.4f}e-6")
    print(f"  cess_dplus:    {c_cess_dplus['worst_ub_1e10']/1e4:.4f}e-6  (J_AB + 0.01||U||^2 - D_+)")

    print("Building Part 3 scaled profile covers (lam <= 1900/1891 => x = 9/1891)...")
    x_hi = Fraction(9, 1891)
    nu_hi = x_hi * Fraction(49, 625)
    c_scale_even_dplus = build_2d_cover(E0, U_TOT0, x_hi, Fraction(0), Fraction(0), False, None, 18, 11, False)
    c_scale_even_signed = build_2d_cover(E0, U_TOT0, x_hi, Fraction(0), Fraction(0), True, None, 18, 11, False)
    c_scale_all6_dplus = build_2d_cover(E0, U_TOT0, x_hi, Fraction(0), nu_hi, False, None, 18, 11, False)
    c_scale_all6_signed = build_2d_cover(E0, U_TOT0, x_hi, Fraction(0), nu_hi, True, None, 18, 11, False)

    print(f"  scale_even_dplus:  {c_scale_even_dplus['worst_ub_1e10']/1e4:.4f}e-6")
    print(f"  scale_even_signed: {c_scale_even_signed['worst_ub_1e10']/1e4:.4f}e-6")
    print(f"  scale_all6_dplus:  {c_scale_all6_dplus['worst_ub_1e10']/1e4:.4f}e-6")
    print(f"  scale_all6_signed: {c_scale_all6_signed['worst_ub_1e10']/1e4:.4f}e-6")

    print("Building Part 4 consumer t-slab covers (8.1, 8.13(ii), 8.13(i), 8.10)...")
    cons_peak_dplus = build_scaled_peak_consumer_slabs(
        EPS0, Fraction(500, 701), Fraction(846, 1000), use_signed=False
    )
    cons_peak_signed = build_scaled_peak_consumer_slabs(
        EPS0, Fraction(500, 701), Fraction(846, 1000), use_signed=True
    )
    cons_94_125 = build_scaled_peak_consumer_slabs(
        Fraction(94, 125), Fraction(500, 701), Fraction(843, 1000), use_signed=True
    )
    cons_3_4 = build_scaled_peak_consumer_slabs(
        Fraction(3, 4), Fraction(500, 701), Fraction(842, 1000), use_signed=True
    )
    cons_299_400 = build_scaled_peak_consumer_slabs(
        Fraction(299, 400), Fraction(713263, 1000000), Fraction(841, 1000), use_signed=True
    )

    for tag, obj in [
        ("8.1 (1891/2500, D_+)", cons_peak_dplus),
        ("8.1 (1891/2500, signed)", cons_peak_signed),
        ("8.13(ii) (94/125, signed)", cons_94_125),
        ("8.13(i) (3/4, signed)", cons_3_4),
        ("8.10 (299/400 <= 713263/10^6, signed)", cons_299_400),
    ]:
        print(f"  {tag}: covered {obj['t_covered']} ({len(obj['slabs'])} slabs), max_cap = {obj['max_cap_1e10']/1e10:.9f}")

    bundle = {
        "schema": "kast-v1",
        "covers": {
            "peak_dplus": c_peak_dplus,
            "peak_signed": c_peak_signed,
            "cession_dplus": c_cess_dplus,
            "scale_even_dplus": c_scale_even_dplus,
            "scale_even_signed": c_scale_even_signed,
            "scale_all6_dplus": c_scale_all6_dplus,
            "scale_all6_signed": c_scale_all6_signed,
        },
        "consumer_slabs": {
            "eps_1891_2500_dplus": cons_peak_dplus,
            "eps_1891_2500_signed": cons_peak_signed,
            "eps_94_125_signed": cons_94_125,
            "eps_3_4_signed": cons_3_4,
            "eps_299_400_signed": cons_299_400,
        },
    }
    out_path = os.path.join(HERE, "all_sector_transfer_cert.json")
    with open(out_path, "w") as f:
        json.dump(bundle, f, separators=(",", ":"))
    sz = os.path.getsize(out_path)
    print(f"Wrote {out_path} ({sz:,} bytes)")
    if sz >= 300_000:
        raise RuntimeError(f"Certificate {sz} B exceeds 300,000 B limit!")


if __name__ == "__main__":
    main()
