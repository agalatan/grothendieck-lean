#!/usr/bin/env python3
"""Exact pure-stdlib verifier of the U(1)-averaged OU resolvent + Damped Level-3 cubic radius certificate.

Usage:  python3 -IB verify.py [CERT.json] [--quiet] [--generic]

Only the Python standard library is used (bisect, fractions, json, math, pathlib, re, sys, time).
Zero floating-point operations occur anywhere in this file (`float` is never called); every arithmetic
operation and comparison is performed in exact arbitrary-precision integers and Fractions, using `-O`-safe
`require(...)` checks throughout.

============================================================================================
WHAT THIS SCRIPT VERIFIES EXACTLY (Issue #720; conjecture-K/STATUS.md 3.6, 3.7, 3.21):

1. Tied 3-parameter U(1)-averaged Ornstein-Uhlenbeck resolvent bound on ALL of H_{2,1}(C^n) (chi in [0, chi_hi]):
   For unit-norm q in H_{2,1}(C^n) and F_theta = sqrt(2) Re(e^{-i*theta} q) in V_3(R^{2n}),
   Wirtinger differentiation gives U_theta := ||DF_theta||^2 - 3 = U_{2,theta} + U_{4,theta} with
     U_{2,theta} = S_2 + 2 Re(e^{-2i*theta} A_2) in V_2(R^{2n}),
     U_{4,theta} = S_4 + 2 Re(e^{-2i*theta} A_4) in V_4(R^{2n}),
   where S_2 = Pi_{1,1}(c_1+c_2-3), S_4 = Pi_{2,2}(c_1+c_2-3), A_2 = Pi_{2,0}(a(q)), A_4 = Pi_{3,1}(a(q)).
   Averaging the exact 1-step OU resolvent identity over theta in [0, 2*pi) with tied weights
   (alpha_S = alpha_A = alpha, beta_S = beta_A = 2*alpha, gamma_S, gamma_A) decouples at every
   V = |q|^2 >= 0 into a 4x4 cosine-mode matrix M_4(V) > 0 and a 2x2 sine-mode matrix M_2(V) > 0
   (certified across all V in [0, oo) via exact sum/difference kernel factorization, folded-[0, pi/4]
   quadrature, nonsingular rational congruence, and sequential 4x4 interval LDL^T pivot positivity),
   collapsing in expectation by pure Wiener-chaos orthogonality to:
     E|q| <= (sqrt(pi)/2) * ||q||_2 * (1 + (3*alpha - 1/16) * chi(q))    for ALL q in H_{2,1}(C^n).
   With (alpha, gamma_S, gamma_A) = (28241/1250000, -28811/1000000, -1443/50000), S_cplx = 3299/625000,
   this gives E|q|/||q||_2 < 91196/100000 < 114/125 = 0.912 across chi in [0, 11/2].

2. Contiguous Compactly-Supported Damped Level-3 & Level-2 Stein cover on chi in [chi_hi, 42]:
   Verifies every row in exact integer Sturm arithmetic (`L3d` at rational damping eps > 0 and `L2`),
   certifying:
     - Global cubic radius:   E|q| <= (114/125) * ||q||_2 = 0.912 * ||q||_2   for ALL q in H_{2,1}(C^n),
     - Sharp high-chi regime: E|q| <= (443/500) * ||q||_2 < (sqrt(pi)/2) * ||q||_2   on chi in [25, 42].

3. Exact downstream rational consequences (default theorem mode; skipped in `--generic` mode):
   Verifies the degree-7 1.403 and degree-5 1.402 necessary t = 0 caps and the sector-free capped
   degree-5 cutoffs in higher-degree/STATUS.md 4.18a, 4.18e (Parseval, sixth-moment, Lean mass),
   and 4.18f (joint fourth-excess + 24 Lean spectral mass witnesses through t <= 37589/100000 = 0.37589).
============================================================================================
"""
import bisect
import json
import pathlib
import re
import sys
import time
from fractions import Fraction as Fr
from math import comb, gcd, isqrt

HERE = pathlib.Path(__file__).resolve().parent
DEFAULT_CERT = HERE / 'cert_912.json'

C6 = Fr(4045313, 100000)
S_COVER = Fr(42)
S_INT = 10**15
EROW = [Fr(32), Fr(8), Fr(32), Fr(96), Fr(0)]
S0 = [Fr(8), Fr(2), Fr(8), Fr(0), Fr(8)]
H0 = [Fr(8, 3), Fr(2, 3), Fr(8, 3), Fr(24), Fr(-16, 3)]
PMAX = [Fr(1, 32), Fr(1, 8), Fr(1, 32), Fr(1, 96), Fr(3, 64)]


def require(cond, msg='verification condition failed'):
    if not cond:
        raise ValueError(msg)


def dec_ceil10(q):
    q = Fr(q)
    require(q >= 0, 'dec_ceil10 expects nonnegative Fraction')
    n = (q.numerator * 10**10 + q.denominator - 1) // q.denominator
    return '%d.%010d' % (n // 10**10, n % 10**10)


def icbrt_floor(n):
    require(isinstance(n, int) and n >= 0, 'icbrt_floor expects nonnegative int')
    if n == 0:
        return 0
    hi = 1 << ((n.bit_length() + 2) // 3)
    lo = 0
    while lo < hi:
        mid = (lo + hi + 1) // 2
        if mid * mid * mid <= n:
            lo = mid
        else:
            hi = mid - 1
    require(lo**3 <= n < (lo + 1)**3, 'icbrt_floor invariant failed')
    return lo


# ==============================================================================
# PART 1: EXACT ZERO-FLOAT U(1)-AVERAGED OU RESOLVENT VERIFIER ON V IN [0, oo)
# ==============================================================================
def verify_ou_foundations():
    """Verify exact SOS / factorization polynomial identities, exp(-42) < 10^-15, and Machin pi bounds."""
    for k in range(6):
        u = Fr(k, 5)
        lhs_s = 80 * (Fr(1, 20) - u / 16 + Fr(81, 80) * (u**5) - Fr(1, 30))
        rhs_s = ((3 * u - 1) ** 2) * (9 * (u**3) + 6 * (u**2) + 3 * u + Fr(4, 3))
        require(lhs_s == rhs_s, 'K_sum SOS polynomial identity failed')
        lhs_d = 4 + 5 * u - 9 * (u**5)
        rhs_d = (1 - u) * (4 + 9 * u + 9 * (u**2) + 9 * (u**3) + 9 * (u**4))
        require(lhs_d == rhs_d, 'K_diff polynomial factorization identity failed')

    require(149**256 > S_INT * (128**256), 'exp(-42) < 10^-15 bound failed')

    def arctan_inv_bounds(m, n_pairs):
        s_even = Fr(0)
        m2 = m * m
        mpow = m
        for j in range(n_pairs):
            t1 = Fr(1, (4 * j + 1) * mpow)
            mpow *= m2
            t2 = Fr(1, (4 * j + 3) * mpow)
            mpow *= m2
            s_even += t1 - t2
        t_next = Fr(1, (4 * n_pairs + 1) * mpow)
        require(s_even < s_even + t_next, 'arctan ordering failed')
        return s_even, s_even + t_next

    a5_lo, a5_hi = arctan_inv_bounds(5, 10)
    a239_lo, a239_hi = arctan_inv_bounds(239, 4)
    pi_lo = 16 * a5_lo - 4 * a239_hi
    pi_hi = 16 * a5_hi - 4 * a239_lo
    require(Fr(31415926535, 10**10) < pi_lo < pi_hi < Fr(31415926536, 10**10), 'Machin pi enclosure failed')
    return pi_lo, pi_hi


def exp_neg_bounds_S(z_num, z_den):
    if z_num <= 0:
        return S_INT, S_INT
    if z_num >= 42 * z_den:
        return 0, 1
    k = 0
    while (z_num << 4) > (z_den << k):
        k += 1
    d = z_den << k
    S2 = 10**20
    acc_lo = S2
    acc_hi = S2
    p_lo = S2
    p_hi = S2
    for m in range(1, 10):
        dm = d * m
        p_lo = (p_lo * z_num) // dm
        p_hi = (p_hi * z_num + dm - 1) // dm
        if m % 2 == 1:
            acc_lo -= p_hi
            if m <= 8:
                acc_hi -= p_lo
        else:
            acc_hi += p_hi
            acc_lo += p_lo
    if acc_lo < 0:
        acc_lo = 0
    for _ in range(k):
        acc_lo = (acc_lo * acc_lo) // S2
        acc_hi = (acc_hi * acc_hi + S2 - 1) // S2
    lo = (acc_lo * S_INT) // S2
    hi = min(S_INT, (acc_hi * S_INT + S2 - 1) // S2)
    require(0 <= lo <= hi <= S_INT, 'exp_neg_bounds_S ordering failed')
    return lo, hi


def make_sum_diff_tables(N_U=2000, N_V=6000):
    """Build outward rational midpoint tables for G_sum(x) > 0 and G_diff(x) > 0 on w in (0, 1) split at 1/2."""
    u_top = icbrt_floor((S_INT**3) // 2)
    v_top = isqrt((S_INT**2) // 2)
    dw1 = Fr(1, 2) - Fr(u_top, S_INT) ** 3
    dw2 = Fr(1, 2) - Fr(v_top, S_INT) ** 2
    require(Fr(0) < dw1 < Fr(1, 10**14) and Fr(0) < dw2 < Fr(1, 10**14), 'endpoint split width failed')
    gap_pad = int(4 * (dw1 + dw2) * S_INT) + 5

    u_first = Fr(u_top, N_U * S_INT)
    u_nodes = (
        [Fr(0)]
        + [u_first / (1 << k) for k in range(44, -1, -1)]
        + [Fr(j * u_top, N_U * S_INT) for j in range(2, N_U + 1)]
    )
    u_seg = []
    for ua_f, ub_f in zip(u_nodes[:-1], u_nodes[1:]):
        require(Fr(0) <= ua_f < ub_f <= Fr(u_top, S_INT), 'u_nodes monotonicity failed')
        du_f = ub_f - ua_f
        um_f = (ua_f + ub_f) / 2
        wa_f, wb_f, wm_f = ua_f**3, ub_f**3, um_f**3
        one_m_wm = 1 - wm_f
        isq_lo = Fr(isqrt(((S_INT**2) * one_m_wm.denominator) // one_m_wm.numerator), S_INT)
        isq_hi = isq_lo + Fr(1, S_INT)
        require(isq_lo * isq_lo * one_m_wm <= 1 <= isq_hi * isq_hi * one_m_wm, 'isqrt um failed')
        err_u = 10 * (du_f**3)
        ps_m = 3 * (Fr(1, 20) - um_f / 16 + Fr(81, 80) * (um_f**5))
        pd_m = Fr(3, 80) * (4 + 5 * um_f - 9 * (um_f**5))
        require(ps_m >= Fr(1, 10) and pd_m > 0, 'positive u kernels failed')
        gs_lo = int(max(Fr(0), ps_m * isq_lo * du_f - err_u) * S_INT)
        gs_hi = int((ps_m * isq_hi * du_f + err_u) * S_INT) + 1
        gd_lo = int(max(Fr(0), pd_m * isq_lo * du_f - err_u) * S_INT)
        gd_hi = int((pd_m * isq_hi * du_f + err_u) * S_INT) + 1
        ka = wa_f / (2 * (1 - wa_f))
        kb = wb_f / (2 * (1 - wb_f))
        u_seg.append((ka.numerator, ka.denominator, kb.numerator, kb.denominator, gs_lo, gs_hi, gd_lo, gd_hi))

    v_seg = []
    for j in range(N_V):
        va_f = Fr(j * v_top, N_V * S_INT)
        vb_f = Fr((j + 1) * v_top, N_V * S_INT)
        dv_f = vb_f - va_f
        vm_f = (va_f + vb_f) / 2
        w_lo_f, w_hi_f, wm_f = 1 - vb_f**2, 1 - va_f**2, 1 - vm_f**2
        m13_lo = Fr(icbrt_floor(((S_INT**3) * wm_f.denominator) // wm_f.numerator), S_INT)
        m13_hi = m13_lo + Fr(1, S_INT)
        require((m13_lo**3) * wm_f <= 1 <= (m13_hi**3) * wm_f, 'icbrt vm failed')
        m23_lo, m23_hi = m13_lo * m13_lo, m13_hi * m13_hi
        err_v = dv_f**3
        hs_lo = 2 * (m23_lo / 20 - m13_hi / 16 + Fr(81, 80) * wm_f)
        hs_hi = 2 * (m23_hi / 20 - m13_lo / 16 + Fr(81, 80) * wm_f)
        hd_lo = Fr(1, 40) * (4 * m23_lo + 5 * m13_lo - 9 * wm_f)
        hd_hi = Fr(1, 40) * (4 * m23_hi + 5 * m13_hi - 9 * wm_f)
        require(hs_lo > 0 and hd_hi > 0, 'positive v kernels failed')
        gs_lo = int(max(Fr(0), hs_lo * dv_f - err_v) * S_INT)
        gs_hi = int((hs_hi * dv_f + err_v) * S_INT) + 1
        gd_lo = int(max(Fr(0), hd_lo * dv_f - err_v) * S_INT)
        gd_hi = int((hd_hi * dv_f + err_v) * S_INT) + 1
        kb = w_lo_f / (2 * (vb_f**2))
        if va_f == 0:
            ka_n, ka_d = 1, 0
        else:
            ka = w_hi_f / (2 * (va_f**2))
            ka_n, ka_d = ka.numerator, ka.denominator
        v_seg.append((ka_n, ka_d, kb.numerator, kb.denominator, gs_lo, gs_hi, gd_lo, gd_hi))

    return u_seg, v_seg, gap_pad


def eval_sum_diff(tables, x_rat):
    u_seg, v_seg, gap_pad = tables
    xn, xd = x_rat.numerator, x_rat.denominator
    x2n, x2d = xn * xn, xd * xd
    gs_l, gs_h = 0, gap_pad
    gd_l, gd_h = 0, gap_pad
    if x2n == 0:
        for _, _, _, _, s_l, s_h, d_l, d_h in u_seg:
            gs_l += s_l
            gs_h += s_h
            gd_l += d_l
            gd_h += d_h
        for _, _, _, _, s_l, s_h, d_l, d_h in v_seg:
            gs_l += s_l
            gs_h += s_h
            gd_l += d_l
            gd_h += d_h
    else:
        for kan, kad, kbn, kbd, s_l, s_h, d_l, d_h in u_seg:
            elo = exp_neg_bounds_S(x2n * kbn, x2d * kbd)[0]
            ehi = exp_neg_bounds_S(x2n * kan, x2d * kad)[1]
            gs_l += (s_l * elo) // S_INT
            gs_h += (s_h * ehi + S_INT - 1) // S_INT
            gd_l += (d_l * elo) // S_INT
            gd_h += (d_h * ehi + S_INT - 1) // S_INT
        for kan, kad, kbn, kbd, s_l, s_h, d_l, d_h in v_seg:
            elo = 0 if kad == 0 else exp_neg_bounds_S(x2n * kan, x2d * kad)[0]
            ehi = exp_neg_bounds_S(x2n * kbn, x2d * kbd)[1]
            gs_l += (s_l * elo) // S_INT
            gs_h += (s_h * ehi + S_INT - 1) // S_INT
            gd_l += (d_l * elo) // S_INT
            gd_h += (d_h * ehi + S_INT - 1) // S_INT
    return (gs_l, gs_h, gd_l, gd_h)


def sd_quad_coeffs_18(u, v):
    u0, u1, u2, u3 = u
    v0, v1, v2, v3 = v
    s0, s1 = u0 + u2, u1 + u3
    t0, t1 = v0 + v2, v1 + v3
    return (
        s0 * t0,
        s0 * t1 + s1 * t0,
        s1 * t1,
        u2 * v2 - u0 * v0,
        (u2 * v3 + u3 * v2) - (u0 * v1 + u1 * v0),
        u3 * v3 - u1 * v1,
    )


def scalar_det(M):
    m = len(M)
    if m == 1:
        return M[0][0]
    if m == 2:
        return M[0][0] * M[1][1] - M[0][1] * M[1][0]
    acc = Fr(0)
    for col in range(m):
        val = M[0][col]
        if val:
            sub = [[M[r][c] for c in range(m) if c != col] for r in range(1, m)]
            term = val * scalar_det(sub)
            acc = acc + term if col % 2 == 0 else acc - term
    return acc


def iv_sub(a, b):
    return (a[0] - b[1], a[1] - b[0])


def iv_mul(a, b):
    ps = (a[0] * b[0], a[0] * b[1], a[1] * b[0], a[1] * b[1])
    return (min(ps), max(ps))


def iv_sq(a):
    sq_hi = max(a[0] * a[0], a[1] * a[1])
    sq_lo = Fr(0) if (a[0] <= 0 <= a[1]) else min(a[0] * a[0], a[1] * a[1])
    return (sq_lo, sq_hi)


def iv_div_pos(a, b):
    ps = (a[0] / b[0], a[0] / b[1], a[1] / b[0], a[1] / b[1])
    return (min(ps), max(ps))


def certify_ldlt(H_iv):
    """Exact sequential 1x1 interval LDL^T pivot positivity check."""
    A = [list(row) for row in H_iv]
    for k in range(4):
        dk = A[k][k]
        if dk[0] <= 0:
            return False
        for i in range(k + 1, 4):
            lik = iv_div_pos(A[i][k], dk)
            sq = iv_sq(A[i][k])
            A[i][i] = (A[i][i][0] - sq[1] / dk[0], A[i][i][1] - sq[0] / dk[1])
            for j in range(i + 1, 4):
                A[i][j] = A[j][i] = iv_sub(A[i][j], iv_mul(lik, A[k][j]))
    return True


def build_ou_evaluator(pi_lo, pi_hi, N_U=2000, N_V=6000, M_fold=2000):
    tables = make_sum_diff_tables(N_U, N_V)
    x_grid = (
        [Fr(0), Fr(1, 2000), Fr(1, 500)]
        + [Fr(k, 50) for k in range(1, 76)]
        + [Fr(3, 2) + Fr(k, 25) for k in range(1, 76)]
        + [Fr(9, 2) + Fr(3 * k, 25) for k in range(1, 51)]
        + [Fr(21, 2) + Fr(3 * k, 4) for k in range(1, 21)]
        + [Fr(26 + 4 * k) for k in range(0, 19)]
        + [Fr(100 + 30 * k) for k in range(0, 31)]
        + [Fr(1000 * (2**k)) for k in range(1, 31)]
    )
    S_Z = 10**40
    z_int = [int(xv * xv * S_Z) for xv in x_grid]
    raw_tab = [eval_sum_diff(tables, xv) for xv in x_grid]
    K_z = len(z_int) - 1
    z_max = z_int[-1]
    cell_data = []
    for i in range(K_z):
        zi, zi1 = z_int[i], z_int[i + 1]
        dz = zi1 - zi
        prev_chords = []
        for st in (1, 3, 7, 15):
            if i >= st:
                prev_chords.append((zi - z_int[i - st], (max(0, raw_tab[i - st][1] - raw_tab[i][0]),
                                                         max(0, raw_tab[i - st][3] - raw_tab[i][2]))))
        next_chords = []
        for st in (2, 4, 8, 16):
            if i + st <= K_z:
                next_chords.append((z_int[i + st] - zi1, (max(0, raw_tab[i + 1][0] - raw_tab[i + st][1]),
                                                          max(0, raw_tab[i + 1][2] - raw_tab[i + st][3]))))
        lo0s = (raw_tab[i][0], raw_tab[i][2])
        hi0s = (raw_tab[i][1], raw_tab[i][3])
        lo1s = (raw_tab[i + 1][0], raw_tab[i + 1][2])
        hi1s = (raw_tab[i + 1][1], raw_tab[i + 1][3])
        cell_data.append((zi, zi1, dz, lo0s, hi0s, lo1s, hi1s, tuple(prev_chords), tuple(next_chords)))

    def eval_SD_upper(z_val):
        if z_val <= 0:
            r0 = raw_tab[0]
            return (r0[1], r0[3])
        if z_val >= z_max:
            rl = raw_tab[-1]
            return (rl[1], rl[3])
        idx = bisect.bisect_right(z_int, z_val) - 1
        zi, _, dz, _, hi0s, _, hi1s, _, _ = cell_data[idx]
        uz = z_val - zi
        return (
            hi0s[0] - ((hi0s[0] - hi1s[0]) * uz) // dz,
            hi0s[1] - ((hi0s[1] - hi1s[1]) * uz) // dz,
        )

    def eval_SD_lower(z_val):
        if z_val is None or z_val > z_max:
            return (0, 0)
        if z_val <= 0:
            r0 = raw_tab[0]
            return (r0[0], r0[2])
        idx = bisect.bisect_left(z_int, z_val)
        if idx > 0:
            idx -= 1
        zi, zi1, _, lo0s, _, lo1s, _, prev_chords, next_chords = cell_data[idx]
        uz = z_val - zi
        vz = zi1 - z_val
        out = [lo1s[0], lo1s[1]]
        for m in (0, 1):
            lo0 = lo0s[m]
            for dz_p, dp_arr in prev_chords:
                cand = lo0 - (dp_arr[m] * uz + dz_p - 1) // dz_p
                if cand > out[m]:
                    out[m] = cand
            lo1 = lo1s[m]
            for dz_n, dn_arr in next_chords:
                cand = lo1 + (dn_arr[m] * vz) // dz_n
                if cand > out[m]:
                    out[m] = cand
        return (out[0], out[1])

    S_T = 10**11
    t_star_lo = Fr(isqrt(2 * (S_T**2)) - S_T, S_T)
    t_star_hi = Fr(isqrt(2 * (S_T**2)) + 1 - S_T, S_T)
    t_fold_nodes = (
        [Fr(0)]
        + [Fr(1, 1 << k) for k in range(60, 9, -1)]
        + [Fr(1, 1024) + (t_star_lo - Fr(1, 1024)) * Fr(k, M_fold) for k in range(1, M_fold + 1)]
    )
    inv_pi_lo = Fr(1) / pi_hi
    inv_pi_hi = Fr(1) / pi_lo
    fold_segs = []
    for ta, tb in zip(t_fold_nodes[:-1], t_fold_nodes[1:]):
        h = tb - ta
        tm = (ta + tb) / 2
        mid_q = 4 * h / (1 + tm * tm)
        err_q = (h * h * h) / 3
        dmu_lo = max(Fr(0), inv_pi_lo * (mid_q - err_q))
        dmu_hi = inv_pi_hi * (mid_q + err_q)
        ca = (1 - ta * ta) / (1 + ta * ta)
        cb_ = (1 - tb * tb) / (1 + tb * tb)
        sa = 2 * ta / (1 + ta * ta)
        sb = 2 * tb / (1 + tb * tb)
        c2_a = ca * ca - sa * sa
        c2_b = cb_ * cb_ - sb * sb
        require(c2_b >= 0, 'c2_b >= 0 failed on [0, pi/4]')
        err_tr = 4 * h * h * h
        avg_c = (c2_a + c2_b) / 2
        avg_cc = (c2_a * c2_a + c2_b * c2_b) / 2
        avg_ss = 1 - avg_cc
        wc_lo, wc_hi = max(Fr(0), dmu_lo * avg_c - err_tr), dmu_hi * avg_c + err_tr
        wcc_lo, wcc_hi = max(Fr(0), dmu_lo * avg_cc - err_tr), dmu_hi * avg_cc + err_tr
        wss_lo, wss_hi = max(Fr(0), dmu_lo * avg_ss - err_tr), dmu_hi * avg_ss + err_tr
        kc_lo = (2 * cb_ * cb_ * S_Z).__floor__()
        kc_hi = ((2 * ca * ca).numerator * S_Z + (2 * ca * ca).denominator - 1) // (2 * ca * ca).denominator
        ks_lo = (2 * sa * sa * S_Z).__floor__()
        ks_hi = ((2 * sb * sb).numerator * S_Z + (2 * sb * sb).denominator - 1) // (2 * sb * sb).denominator
        fold_segs.append((
            kc_lo, kc_hi, ks_lo, ks_hi,
            int(dmu_lo * S_INT), int(dmu_hi * S_INT) + 1,
            int(wc_lo * S_INT), int(wc_hi * S_INT) + 1,
            int(wcc_lo * S_INT), int(wcc_hi * S_INT) + 1,
            int(wss_lo * S_INT), int(wss_hi * S_INT) + 1,
        ))
    gap_mu_hi = int((inv_pi_hi * 4 * (t_star_hi - t_star_lo)) * S_INT) + 2

    def enclose_SD_moments(Va, Vb):
        Va_n, Va_d = Va.numerator, Va.denominator
        if Vb is not None:
            Vb_n, Vb_d = Vb.numerator, Vb.denominator
        acc = [[0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0]]
        for kc_l, kc_h, ks_l, ks_h, w0_l, w0_h, wc_l, wc_h, wcc_l, wcc_h, wss_l, wss_h in fold_segs:
            Gc_hi = eval_SD_upper((Va_n * kc_l) // Va_d)
            Gc_lo = eval_SD_lower(None if Vb is None else (Vb_n * kc_h + Vb_d - 1) // Vb_d)
            Gs_hi = eval_SD_upper((Va_n * ks_l) // Va_d)
            Gs_lo = eval_SD_lower(None if Vb is None else (Vb_n * ks_h + Vb_d - 1) // Vb_d)
            for m in (0, 1):
                sm_lo = Gc_lo[m] + Gs_lo[m]
                sm_hi = Gc_hi[m] + Gs_hi[m]
                df_lo = Gs_lo[m] - Gc_hi[m]
                if df_lo < 0:
                    df_lo = 0
                df_hi = Gs_hi[m] - Gc_lo[m]
                am = acc[m]
                am[0] += sm_lo * w0_l
                am[1] += sm_hi * w0_h
                am[2] += df_lo * wc_l
                am[3] += df_hi * wc_h
                am[4] += sm_lo * wcc_l
                am[5] += sm_hi * wcc_h
                am[6] += sm_lo * wss_l
                am[7] += sm_hi * wss_h
        S2 = S_INT * S_INT
        pad = 4 * gap_mu_hi * S_INT

        def iv_sum(m, j):
            return (Fr(acc[m][j], S2), Fr(acc[m][j + 1] + pad, S2))

        def iv_neg_diff(m):
            return (Fr(-acc[m][3] - pad, S2), Fr(-acc[m][2] + pad, S2))

        return (
            iv_sum(0, 0), iv_neg_diff(0), iv_sum(0, 4), iv_sum(0, 6),
            iv_sum(1, 0), iv_neg_diff(1), iv_sum(1, 4), iv_sum(1, 6),
        )

    return enclose_SD_moments


def build_rotated_H_iv(sd6, al_fr, ga_S_fr, ga_A_fr):
    M_INF = [
        [al_fr - Fr(1, 48), Fr(0), -ga_S_fr - Fr(1, 32), Fr(0)],
        [Fr(0), al_fr / 2 - Fr(1, 96), Fr(0), -ga_A_fr / 2 - Fr(1, 64)],
        [-ga_S_fr - Fr(1, 32), Fr(0), 2 * al_fr - Fr(1, 24), Fr(0)],
        [Fr(0), -ga_A_fr / 2 - Fr(1, 64), Fr(0), al_fr - Fr(1, 48)],
    ]
    km = [(iv[0] + iv[1]) / 2 for iv in sd6]
    kr = [(iv[1] - iv[0]) / 2 for iv in sd6]
    e_vecs = [[Fr(1 if i == j else 0) for i in range(4)] for j in range(4)]
    M0 = [[M_INF[i][j] + sum(c * m for c, m in zip(sd_quad_coeffs_18(e_vecs[i], e_vecs[j]), km)) / 18
           for j in range(4)] for i in range(4)]
    S_J = 10**12
    A = [[int(M0[i][j] * S_J) for j in range(4)] for i in range(4)]
    R_int = [[(S_J if i == j else 0) for j in range(4)] for i in range(4)]
    for _ in range(5):
        for p in range(4):
            for q in range(p + 1, 4):
                apq = A[p][q]
                if apq == 0:
                    continue
                diff = A[q][q] - A[p][p]
                two_a = 2 * abs(apq)
                adiff = abs(diff)
                hyp2 = adiff + isqrt(adiff * adiff + two_a * two_a)
                if hyp2 == 0:
                    c_i = isqrt((S_J * S_J) // 2)
                    s_i = c_i if apq > 0 else -c_i
                else:
                    den_cs = max(1, isqrt(hyp2 * hyp2 + two_a * two_a))
                    c_i = (hyp2 * S_J) // den_cs
                    s_i = (two_a * S_J) // den_cs
                    if (diff > 0 and apq < 0) or (diff < 0 and apq > 0) or (diff == 0 and apq < 0):
                        s_i = -s_i
                if s_i == 0:
                    continue
                for i in range(4):
                    rp, rq = R_int[i][p], R_int[i][q]
                    R_int[i][p] = (c_i * rp - s_i * rq) // S_J
                    R_int[i][q] = (s_i * rp + c_i * rq) // S_J
                for i in range(4):
                    if i != p and i != q:
                        mp, mq = A[i][p], A[i][q]
                        A[i][p] = A[p][i] = (c_i * mp - s_i * mq) // S_J
                        A[i][q] = A[q][i] = (s_i * mp + c_i * mq) // S_J
                mpp, mqq, mpq = A[p][p], A[q][q], A[p][q]
                c2 = (c_i * c_i) // S_J
                s2 = (s_i * s_i) // S_J
                cs = (c_i * s_i) // S_J
                A[p][p] = (c2 * mpp - 2 * cs * mpq + s2 * mqq) // S_J
                A[q][q] = (s2 * mpp + 2 * cs * mpq + c2 * mqq) // S_J
                A[p][q] = A[q][p] = ((c2 - s2) * mpq + cs * (mpp - mqq)) // S_J

    order = sorted(range(4), key=lambda a: A[a][a], reverse=True)
    Q_R = 10**8
    DIV_R = S_J // Q_R
    R = [[Fr(R_int[i][order[a]] // DIV_R, Q_R) for a in range(4)] for i in range(4)]
    require(scalar_det(R) != 0, 'singular congruence matrix R')
    cols = [[R[i][a] for i in range(4)] for a in range(4)]
    H_iv = [[None] * 4 for _ in range(4)]
    for a in range(4):
        for b in range(a, 4):
            va, vb = cols[a], cols[b]
            cs = sd_quad_coeffs_18(va, vb)
            h_mid = sum(va[i] * M_INF[i][j] * vb[j] for i in range(4) for j in range(4)) + sum(c * m for c, m in zip(cs, km)) / 18
            w_rad = sum(abs(c) * r for c, r in zip(cs, kr)) / 18
            H_iv[a][b] = H_iv[b][a] = (h_mid - w_rad, h_mid + w_rad)
    return H_iv


DEFAULT_V_KNOTS = (
    [Fr(k, 8) for k in range(0, 81)]
    + [Fr(10 + k) for k in range(1, 21)]
    + [Fr(30 + 5 * k) for k in range(1, 14)]
    + [Fr(100 * (2**k)) for k in range(0, 45)]
    + [None]
)


def verify_ou_resolvent(ou_dict, pi_hi, enclose_fn, v_knots=DEFAULT_V_KNOTS, max_depth=14):
    al_fr = Fr(ou_dict['alpha'])
    ga_S_fr = Fr(ou_dict['gamma_S'])
    ga_A_fr = Fr(ou_dict['gamma_A'])
    slope_claim = Fr(ou_dict['slope_claim'])
    chi_hi = Fr(ou_dict['chi_hi'])
    bound_chi_hi = Fr(ou_dict['bound_at_chi_hi'])

    require(bound_chi_hi > 0, 'bound_at_chi_hi must be positive')
    require(chi_hi > 0, 'chi_hi must be positive')
    require(al_fr > Fr(1, 48), 'alpha must exceed asymptotic floor 1/48')
    S_cplx = 3 * al_fr - Fr(1, 16)
    require(S_cplx > 0 and S_cplx <= slope_claim, 'S_cplx exceeds slope_claim')
    require((pi_hi / 4) * ((1 + chi_hi * S_cplx) ** 2) < bound_chi_hi * bound_chi_hi,
            'OU bound at chi_hi exceeds bound_at_chi_hi')

    require(len(v_knots) >= 2 and v_knots[0] == Fr(0) and v_knots[-1] is None, 'v_knots must cover [0, oo)')
    for a_, b_ in zip(v_knots[:-2], v_knots[1:-1]):
        require(isinstance(a_, Fr) and isinstance(b_, Fr) and a_ < b_, 'v_knots must be strictly increasing')
    require(isinstance(v_knots[-2], Fr) and v_knots[-2] > 0, 'penultimate V knot must be positive')

    leaves = 0
    max_d = 0

    def check_cell(Va, Vb, depth=0):
        nonlocal leaves, max_d
        gs_0, gs_c, gs_cc, gs_ss, gd_0, gd_c, gd_cc, gd_ss = enclose_fn(Va, Vb)
        n00 = al_fr / 2 - Fr(1, 96) + (gs_ss[0] - gd_ss[1]) / 18
        n11 = al_fr - Fr(1, 48) + (gs_ss[0] + gd_ss[0]) / 18
        n01_lo = -ga_A_fr / 2 - Fr(1, 64) + gs_ss[0] / 18
        n01_hi = -ga_A_fr / 2 - Fr(1, 64) + gs_ss[1] / 18
        if n00 > 0 and n11 > 0 and n00 * n11 > max(n01_lo * n01_lo, n01_hi * n01_hi):
            H_iv = build_rotated_H_iv((gs_0, gs_c, gs_cc, gd_0, gd_c, gd_cc), al_fr, ga_S_fr, ga_A_fr)
            if certify_ldlt(H_iv):
                leaves += 1
                if depth > max_d:
                    max_d = depth
                return
        require(Vb is not None and depth < max_depth, f'OU LDL^T PD check failed on [{Va}, {Vb}] at depth {depth}')
        Vm = (Va + Vb) / 2
        check_cell(Va, Vm, depth + 1)
        check_cell(Vm, Vb, depth + 1)

    for Va, Vb in zip(v_knots[:-1], v_knots[1:]):
        check_cell(Va, Vb, 0)
    return dict(S_cplx=S_cplx, chi_hi=chi_hi, bound_at_chi_hi=bound_chi_hi, leaves=leaves, max_depth=max_d)


# ==============================================================================
# PART 2: EXACT INTEGER STURM VERIFIER FOR DAMPED LEVEL-3 & LEVEL-2 STEIN ROWS
# ==============================================================================
def ptrim(a):
    a = list(a)
    while a and a[-1] == 0:
        a.pop()
    return a


def padd(a, b):
    n = max(len(a), len(b))
    return ptrim([(a[i] if i < len(a) else Fr(0)) + (b[i] if i < len(b) else Fr(0)) for i in range(n)])


def psub(a, b):
    n = max(len(a), len(b))
    return ptrim([(a[i] if i < len(a) else Fr(0)) - (b[i] if i < len(b) else Fr(0)) for i in range(n)])


def pscale(a, c):
    if c == 0 or not a:
        return []
    return ptrim([c * x for x in a])


def pmul(a, b):
    if not a or not b:
        return []
    out = [Fr(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                out[i + j] += x * y
    return ptrim(out)


def peval(a, x):
    acc = Fr(0)
    for c in reversed(a):
        acc = acc * x + c
    return acc


def pprim(p, u0, val_u0):
    q = [Fr(0)] + [c / (i + 1) for i, c in enumerate(p)]
    q[0] = val_u0 - peval(q, u0)
    return ptrim(q)


def compose_r2(pv):
    out = []
    for c in pv:
        out.extend([c, Fr(0)])
    return ptrim(out)


def div_xk(p, k):
    p = ptrim(p)
    require(all(i >= len(p) or p[i] == 0 for i in range(k)), 'polynomial not divisible by x^%d' % k)
    return p[k:] if len(p) > k else []


def to_int_poly(a):
    a = ptrim(a)
    if not a:
        return []
    den = 1
    for x in a:
        den = den * x.denominator // gcd(den, x.denominator)
    ints = [int(x * den) for x in a]
    g = 0
    for x in ints:
        g = gcd(g, abs(x))
    return [x // g for x in ints]


def ieval_sign(a, x):
    p, q = x.numerator, x.denominator
    acc = 0
    n = len(a) - 1
    for i in range(n, -1, -1):
        acc = acc * p + a[i] * (q ** (n - i))
    return (acc > 0) - (acc < 0)


def irem_neg(a, b):
    a = list(a)
    lb = b[-1]
    db = len(b) - 1
    m = abs(lb)
    sg = 1 if lb > 0 else -1
    while len(a) - 1 >= db and a:
        la = a[-1]
        k = len(a) - 1 - db
        a = [m * x for x in a]
        for i, y in enumerate(b):
            a[i + k] -= sg * la * y
        a = ptrim(a)
    return to_int_poly([-x for x in a])


def sturm_chain(p):
    p0 = to_int_poly(p)
    p1 = to_int_poly([i * p0[i] for i in range(1, len(p0))])
    chain = [p0]
    if p1:
        chain.append(p1)
    while len(chain) >= 2 and len(chain[-1]) > 1:
        r = irem_neg(chain[-2], chain[-1])
        if not r:
            break
        chain.append(r)
    return chain


def sign_changes(signs):
    nz = [x for x in signs if x != 0]
    return sum(1 for i in range(len(nz) - 1) if nz[i] != nz[i + 1])


def positive_on(p, a, b=None):
    p = ptrim(p)
    if not p:
        return False
    if len(p) == 1:
        return p[0] > 0
    ch = sturm_chain(p)
    if ieval_sign(ch[0], a) <= 0:
        return False
    va = sign_changes([ieval_sign(c, a) for c in ch])
    if b is None:
        if ch[0][-1] <= 0:
            return False
        vb = sign_changes([(c[-1] > 0) - (c[-1] < 0) for c in ch])
    else:
        if ieval_sign(ch[0], b) <= 0:
            return False
        vb = sign_changes([ieval_sign(c, b) for c in ch])
    return va == vb


def sym3_pd_on(a11, a12, a22, a13, a23, a33, u0, u1):
    if not positive_on(a11, u0, u1):
        return False
    m2 = psub(pmul(a11, a22), pmul(a12, a12))
    if not positive_on(m2, u0, u1):
        return False
    c13 = psub(pmul(a12, a23), pmul(a22, a13))
    c23 = psub(pmul(a12, a13), pmul(a11, a23))
    m3 = padd(pmul(a33, m2), padd(pmul(a13, c13), pmul(a23, c23)))
    return positive_on(m3, u0, u1)


def pdet(M):
    m = len(M)
    if m == 1:
        return M[0][0]
    if m == 2:
        return psub(pmul(M[0][0], M[1][1]), pmul(M[0][1], M[1][0]))
    acc = []
    for col in range(m):
        entry = M[0][col]
        if entry:
            sub = [[M[r][c] for c in range(m) if c != col] for r in range(1, m)]
            term = pmul(entry, pdet(sub))
            acc = padd(acc, term) if col % 2 == 0 else psub(acc, term)
    return acc


def sym5_det_and_adj(T):
    adj = [[None] * 5 for _ in range(5)]
    for b in range(5):
        for a in range(b + 1):
            sub = [[T[r][c] for c in range(5) if c != b] for r in range(5) if r != a]
            cof = pdet(sub)
            if (a + b) % 2 == 1:
                cof = pscale(cof, Fr(-1))
            adj[a][b] = adj[b][a] = cof
    det_T = []
    for b in range(5):
        det_T = padd(det_T, pmul(T[0][b], adj[0][b]))
    return det_T, adj


def cut_vector(typ, theta):
    m = [Fr(1), Fr(0), Fr(1), Fr(3), Fr(-1)]
    t3 = [Fr(0), Fr(0), Fr(0), Fr(3), Fr(-1)]
    if typ in ('n', 'h', 'b', 'y', 'z'):
        a_ = [Fr(0)] * 5
        a_['nhbyz'.index(typ)] = Fr(1)
        return a_
    if typ == 'bn':
        return [Fr(1), Fr(0), Fr(-1), Fr(0), Fr(0)]
    if typ == 'yz':
        return [Fr(0), Fr(0), Fr(0), Fr(-1), Fr(1)]
    if typ == 'h0':
        return list(H0)
    if typ == 'm':
        return m
    require(theta is not None and theta > 0, 'theta must be positive')
    if typ == 'c1':
        return [theta, Fr(1) / theta, Fr(0), Fr(0), Fr(-2)]
    if typ in ('c2+', 'c2-'):
        sg = -2 if typ == 'c2+' else 2
        return [m[i] / theta + (theta if i == 1 else Fr(0)) + sg * t3[i] for i in range(5)]
    raise ValueError('unknown cut: ' + str(typ))


def verify_row(row, quiet=False):
    e = [Fr(x) for x in row['knots']]
    K = len(e) - 1
    require(K >= 1 and e[0] == 0 and all(e[i] < e[i + 1] for i in range(K)), 'invalid knots')
    u = [x * x for x in e]
    require(isinstance(row['knot_den'], int) and row['knot_den'] > 0, 'invalid knot_den')
    kden = Fr(row['knot_den'])

    def get_arr(nm, exp_len):
        raw = row[nm]
        require(len(raw) == exp_len and all(isinstance(x, int) for x in raw), 'invalid array ' + nm)
        return [Fr(x, kden) for x in raw]

    phi1, phi2 = get_arr('phi1', K + 1), get_arr('phi2', K + 1)
    phi3, phi4 = get_arr('phi3', K + 1), get_arr('phi4', K + 1)
    psi_a = get_arr('psi_a', K + 1)
    xi2, xi1, xia = get_arr('xi2', K + 1), get_arr('xi1', K + 1), get_arr('xia', K + 1)

    require(len(row['lam']) == 3 and len(row['slope']) == 2 and len(row['l3']) == 3 and len(row['m_ker']) == 3,
            'invalid scalar tuple lengths')
    lam0, lam1, lam2 = (Fr(x) for x in row['lam'])
    slope = [Fr(x) for x in row['slope']]
    l3 = [Fr(x) for x in row['l3']]
    m00, m01, m11 = (Fr(x) for x in row['m_ker'])
    mu_a, mu_rho, mu_w, sig = Fr(row['mu_a']), Fr(row['mu_rho']), Fr(row['mu_w']), Fr(row['sigma'])

    require(all(x >= 0 for x in l3) and sum(l3) > 0, 'l3 failed')
    lam3 = sum(l3)
    require(m00 >= 0 and m11 > 0 and m00 * m11 - m01 * m01 >= 0, 'M_ker failed')
    require(mu_a >= 0 and mu_rho > 0 and mu_w > 0, 'mu signs failed')

    use_3d = ('K0' in row)
    if use_3d:
        K0 = int(row['K0'])
        require(1 <= K0 < K, 'invalid K0')
        M0 = K0 + 1
        eps = Fr(row['eps'])
        require(eps > 0, 'eps must be positive')
        inv_e = Fr(1) / eps
        inv_e2, inv_e3 = inv_e * inv_e, inv_e * inv_e * inv_e
        c_1pe, c_1p2e = 1 + eps, 1 + 2 * eps
        c_1pe2 = c_1pe * c_1pe
        h5_0 = Fr(row['h5_0'])
        phi5 = get_arr('phi5', K0) + [Fr(0)]
        phi6 = get_arr('phi6', K0) + [Fr(0)]
        phi7 = get_arr('phi7', K0) + [Fr(0)]
        dw_arr = get_arr('dw', M0)
        dal = get_arr('dal', M0)
        qs_arr = get_arr('qs', M0)
        trt1 = get_arr('trt1', M0)
        trt2 = get_arr('trt2', M0)
        a0_11 = get_arr('a0_11', M0)
        ps_11 = get_arr('ps_11', M0)
        ps_13 = get_arr('ps_13', M0)
        ps_23 = get_arr('ps_23', M0)
        a1_0, a1_1, a1_2 = get_arr('a1_0', M0), get_arr('a1_1', M0), get_arr('a1_2', M0)
        b1_0, b1_1, b1_2 = get_arr('b1_0', M0), get_arr('b1_1', M0), get_arr('b1_2', M0)
        raw_tv = row['tv']
        require(isinstance(raw_tv, list) and len(raw_tv) == 15, 'invalid tv list')
        tv_arrs = []
        for idx_t, sub_arr in enumerate(raw_tv):
            require(len(sub_arr) == M0 and all(isinstance(x, int) for x in sub_arr), 'invalid tv[%d]' % idx_t)
            tv_arrs.append([Fr(x, kden) for x in sub_arr])
    else:
        K0 = 0

    for k in range(K + 1):
        require(xi2[k] >= 0 and xi1[k] >= 0 and xia[k] ** 2 <= 4 * xi1[k] * xi2[k], 'C* failed at knot %d' % k)
        require(psi_a[k] >= 0, 'psi_a < 0 at knot %d' % k)
        if k >= K0:
            require(psi_a[k] + mu_a - phi4[k] >= 0, 'psi_a + mu_a - phi4 < 0 at knot %d' % k)
            require(m00 - phi3[k] > 0, 'D1 failed at knot %d' % k)
            require(m11 * (m00 - phi3[k]) - (m01 - Fr(1, 2) * psi_a[k]) ** 2 > 0, 'D2 failed at knot %d' % k)
    if use_3d:
        for k in range(K0 + 1):
            require(0 < dw_arr[k] <= mu_w, 'dw bounds failed at knot %d' % k)
            require(psi_a[k] + mu_a - phi4[k] - dal[k] >= 0, 'theta_rho < 0 at knot %d' % k)
            require(trt1[k] > 0 and trt2[k] > 0, 'trt <= 0 at knot %d' % k)
            require(a1_0[k] >= 0 and a1_2[k] >= 0 and a1_1[k] ** 2 <= a1_0[k] * a1_2[k], 'A1 PSD failed at knot %d' % k)
            require(b1_0[k] >= 0 and b1_2[k] >= 0 and b1_1[k] ** 2 <= b1_0[k] * b1_2[k], 'B1 PSD failed at knot %d' % k)
            Tk = [[tv_arrs[max(a, b) * (max(a, b) + 1) // 2 + min(a, b)][k] for b in range(5)] for a in range(5)]
            for m_sz in range(1, 6):
                require(scalar_det([r[:m_sz] for r in Tk[:m_sz]]) > 0, 'T(u_%d) minor %d <= 0' % (k, m_sz))

    G_val = [Fr(0)] * (7 if use_3d else 4)
    vv = [Fr(0), Fr(1)]
    vv2 = [Fr(0), Fr(0), Fr(1)]
    nfail = 0

    for k in range(K + 1):
        tail = (k == K)
        u0 = u[k]
        u1 = None if tail else u[k + 1]
        a_lo = e[k]
        b_hi = None if tail else e[k + 1]

        if tail:
            pc = lambda arr: ptrim([arr[K]])
        else:
            def pc(arr, k=k, u0=u0, u1=u1):
                sl = (arr[k + 1] - arr[k]) / (u1 - u0)
                return ptrim([arr[k] - sl * u0, sl])

        p1 = padd(pc(phi1), [Fr(0), slope[0]])
        p2 = padd(pc(phi2), [Fr(0), slope[1]])
        p3, p4 = pc(phi3), pc(phi4)
        psa = pc(psi_a)
        x2p, x1p, xap = pc(xi2), pc(xi1), pc(xia)

        g1 = pprim(p1, u0, G_val[0])
        g2 = pprim(p2, u0, G_val[1])
        g3 = pprim(p3, u0, G_val[2])
        g4 = pprim(p4, u0, G_val[3])

        vY1, vY2 = psub(pmul(vv, p1), g1), psub(pmul(vv, p2), g2)
        vY3, vY4 = psub(pmul(vv, p3), g3), psub(pmul(vv, p4), g4)
        M12 = psub([m01], pscale(psa, Fr(1, 2)))
        b2_v = pscale(psub([Fr(-2) * m01 - Fr(4) * m11], padd(pscale(p2, Fr(1, 2)), x1p)), Fr(1, 2))
        q1_base = padd([lam0 + m00 + 4 * m01 + 4 * m11, lam1, lam2, lam3], psub(padd(g1, g2), g3))

        if k >= K0:
            if use_3d and k == K0:
                require(h5_0 + G_val[4] == 0 and G_val[5] == 0 and G_val[6] == 0,
                        'exact compact support at u_{K0} violated')
            M11 = psub([m00], p3)
            M33 = psub(padd([mu_rho + mu_a], psa), p4)
            D2 = psub(pscale(M11, m11), pmul(M12, M12))
            g34 = padd(g3, g4)
            ok_s = True
            ok2 = positive_on(D2, u0, u1)
            if k == 0:
                g34_d = div_xk(g34, 1)
                tau_w_v = pmul(vv, pscale(pmul(g34_d, g34_d), Fr(1) / (4 * mu_w)))
                Y1_v, Y2_v, Y3_v, Y4_v = (div_xk(vy, 1) for vy in (vY1, vY2, vY3, vY4))
                M13_v = pscale(padd(Y3_v, Y4_v), Fr(-1, 2))
                D3_v = psub(pmul(M33, D2), pscale(pmul(M13_v, M13_v), m11))
                b1_v = pscale(psub(psub(padd(p3, g3), padd(p1, [2 * m00 + 4 * m01])), padd(tau_w_v, x2p)), Fr(1, 2))
                b3_v = pscale(psub(padd(padd([Fr(0), sig], Y3_v), g4),
                                   padd(padd(Y1_v, pscale(Y2_v, Fr(1, 2))), xap)), Fr(1, 2))
                adj11 = pscale(M33, m11)
                adj22 = psub(pmul(M11, M33), pmul(M13_v, M13_v))
                adj33 = D2
                adj12 = pscale(pmul(M12, M33), Fr(-1))
                adj13 = pscale(M13_v, -m11)
                adj23 = pmul(M12, M13_v)
                quad_v = padd(
                    padd(pmul(adj11, pmul(b1_v, b1_v)), pmul(adj22, pmul(b2_v, b2_v))),
                    padd(pmul(adj33, pmul(b3_v, b3_v)),
                         pscale(padd(pmul(adj12, pmul(b1_v, b2_v)),
                                     padd(pmul(adj13, pmul(b1_v, b3_v)), pmul(adj23, pmul(b2_v, b3_v)))), Fr(2)))
                )
                D4_r = psub(pmul(psub(compose_r2(q1_base), [Fr(0), Fr(1)]), compose_r2(D3_v)), compose_r2(quad_v))
                ok3 = positive_on(D3_v, u0, u1)
                ok4 = positive_on(D4_r, a_lo, b_hi)
            else:
                vM13 = pscale(padd(vY3, vY4), Fr(-1, 2))
                v2D3 = psub(pmul(vv2, pmul(M33, D2)), pscale(pmul(vM13, vM13), m11))
                v_tau_w = pscale(pmul(g34, g34), Fr(1) / (4 * mu_w))
                vb1 = pscale(psub(pmul(vv, psub(padd(p3, g3), padd(p1, padd([2 * m00 + 4 * m01], x2p)))), v_tau_w), Fr(1, 2))
                vb3 = pscale(psub(padd(pmul(vv, padd([Fr(0), sig], g4)), vY3),
                                  padd(padd(vY1, pscale(vY2, Fr(1, 2))), pmul(vv, xap))), Fr(1, 2))
                t11 = pmul(pscale(pmul(vv, M33), m11), pmul(vb1, vb1))
                v2_adj22 = psub(pmul(vv2, pmul(M11, M33)), pmul(vM13, vM13))
                t22 = pmul(vv, pmul(v2_adj22, pmul(b2_v, b2_v)))
                t33 = pmul(pmul(vv, D2), pmul(vb3, vb3))
                t12 = pscale(pmul(vv2, pmul(pmul(M12, M33), pmul(vb1, b2_v))), Fr(-2))
                t13 = pscale(pmul(vM13, pmul(vb1, vb3)), -2 * m11)
                t23 = pscale(pmul(vv, pmul(M12, pmul(vM13, pmul(b2_v, vb3)))), Fr(2))
                v3_quad = padd(padd(t11, t22), padd(t33, padd(t12, padd(t13, t23))))
                vq1_r = psub(compose_r2(pmul(vv, q1_base)), [Fr(0), Fr(0), Fr(0), Fr(1)])
                v3D4_r = psub(pmul(vq1_r, compose_r2(v2D3)), compose_r2(v3_quad))
                ok3 = positive_on(v2D3, u0, u1)
                ok4 = positive_on(v3D4_r, a_lo, b_hi)
            if not tail:
                G_val[:4] = [peval(g1, u1), peval(g2, u1), peval(g3, u1), peval(g4, u1)]
        else:
            p5, p6, p7 = pc(phi5), pc(phi6), pc(phi7)
            g5 = pprim(p5, u0, G_val[4])
            g6 = pprim(p6, u0, G_val[5])
            g7 = pprim(p7, u0, G_val[6])
            h5 = padd([h5_0], g5)
            Dw = pc(dw_arr)
            ok_dw = positive_on(psub([mu_w], padd(h5, Dw)), u0, u1)

            vY6, vY7 = psub(pmul(vv, p6), g6), psub(pmul(vv, p7), g7)
            dal_p, qs_p = pc(dal), pc(qs_arr)
            trt1_p, trt2_p = pc(trt1), pc(trt2)
            a0_11_p, ps_11_p, ps_13_p, ps_23_p = pc(a0_11), pc(ps_11), pc(ps_13), pc(ps_23)
            a1_0p, a1_1p, a1_2p = pc(a1_0), pc(a1_1), pc(a1_2)
            b1_0p, b1_1p, b1_2p = pc(b1_0), pc(b1_1), pc(b1_2)
            T_p = [[pc(tv_arrs[max(a, b) * (max(a, b) + 1) // 2 + min(a, b)]) for b in range(5)] for a in range(5)]

            vp5 = pmul(vv, p5)
            V0 = padd(padd(g3, g4), pscale(padd(vp5, padd(g6, g7)), inv_e))
            V1 = psub(pscale(vp5, -inv_e), padd(pmul(vv, h5), pscale(g7, c_1pe * inv_e)))
            V2 = pscale(g6, -c_1pe2 * inv_e)
            V3 = vp5
            V4 = pscale(g7, c_1pe)
            V_list = [V0, V1, V2, V3, V4]

            det_T, adj_T = sym5_det_and_adj(T_p)
            quad_T = []
            if k == 0:
                Vb = [div_xk(Vp, 1) for Vp in V_list]
                for a in range(5):
                    quad_T = padd(quad_T, pmul(adj_T[a][a], pmul(Vb[a], Vb[a])))
                    for b in range(a + 1, 5):
                        quad_T = padd(quad_T, pscale(pmul(adj_T[a][b], pmul(Vb[a], Vb[b])), Fr(2)))
                D6_p = psub(pmul(pscale(Dw, Fr(4)), det_T), pmul(vv, quad_T))
            else:
                for a in range(5):
                    quad_T = padd(quad_T, pmul(adj_T[a][a], pmul(V_list[a], V_list[a])))
                    for b in range(a + 1, 5):
                        quad_T = padd(quad_T, pscale(pmul(adj_T[a][b], pmul(V_list[a], V_list[b])), Fr(2)))
                D6_p = psub(pmul(pscale(pmul(vv, Dw), Fr(4)), det_T), quad_T)
            ok_tv = positive_on(D6_p, u0, u1)

            A0_00 = psub(dal_p, pscale(p7, inv_e))
            A0_01 = pscale(psub(psub(pscale(p7, c_1pe * inv_e), a1_0p), pscale(T_p[3][3], inv_e)), Fr(1, 2))
            A0_11 = a0_11_p
            A0_02 = pscale(padd(pscale(psub(T_p[3][3], pscale(T_p[3][4], Fr(2))), inv_e),
                                psub(a1_0p, padd(a0_11_p, pscale(a1_1p, Fr(2))))), Fr(1, 2))
            A0_12 = pscale(padd(pscale(psub(pscale(T_p[3][4], Fr(2)), T_p[4][4]), inv_e),
                                psub(pscale(a1_1p, Fr(2)), a1_2p)), Fr(1, 2))
            A0_22 = padd(pscale(T_p[4][4], inv_e), a1_2p)
            ok_a0 = sym3_pd_on(A0_00, A0_01, A0_11, A0_02, A0_12, A0_22, u0, u1)

            P_00 = psub(psub(qs_p, padd(pscale(p6, c_1pe2 * inv_e3), pscale(g6, c_1p2e * inv_e2))),
                        pscale(T_p[0][1], 2 * inv_e))
            P_01 = pscale(padd(psub(padd(pscale(p6, c_1pe2 * inv_e3), pscale(g6, c_1pe2 * inv_e2)), b1_0p),
                               pscale(psub(pscale(T_p[0][1], Fr(2)), padd(T_p[1][1], pscale(T_p[0][2], Fr(2)))), inv_e)), Fr(1, 2))
            P_11 = ps_11_p
            P_02 = pscale(padd(pscale(psub(padd(T_p[1][1], pscale(T_p[0][2], Fr(2))), pscale(T_p[1][2], Fr(2))), inv_e),
                               psub(b1_0p, padd(ps_11_p, pscale(b1_1p, Fr(2))))), Fr(1, 2))
            P_12 = pscale(padd(pscale(psub(pscale(T_p[1][2], Fr(2)), T_p[2][2]), inv_e),
                               psub(pscale(b1_1p, Fr(2)), b1_2p)), Fr(1, 2))
            P_22 = padd(pscale(T_p[2][2], inv_e), b1_2p)
            U4 = [
                psub(pscale(psub(padd(T_p[0][4], T_p[1][3]), padd(T_p[1][4], T_p[2][3])), inv_e), ps_13_p),
                psub(pscale(psub(padd(T_p[1][4], T_p[2][3]), T_p[2][4]), inv_e), ps_23_p),
                pscale(T_p[2][4], inv_e),
            ]

            if k == 0:
                Y6_v, Y7_v = div_xk(vY6, 1), div_xk(vY7, 1)
                u3_0 = padd(pscale(padd(pscale(Y6_v, c_1pe2 * inv_e2), padd(pscale(Y7_v, c_1pe * inv_e2), pscale(g7, c_1pe * inv_e))), Fr(-1, 2)),
                            pscale(psub(T_p[0][3], padd(T_p[0][4], T_p[1][3])), inv_e))
                U3 = [u3_0, ps_13_p, ps_23_p]
                mult_top = pmul(trt1_p, trt2_p)
                w_u4 = trt1_p
            else:
                vu3_0 = padd(pscale(padd(pscale(vY6, c_1pe2 * inv_e2), padd(pscale(vY7, c_1pe * inv_e2), pscale(pmul(vv, g7), c_1pe * inv_e))), Fr(-1, 2)),
                             pmul(vv, pscale(psub(T_p[0][3], padd(T_p[0][4], T_p[1][3])), inv_e)))
                U3 = [vu3_0, pmul(vv, ps_13_p), pmul(vv, ps_23_p)]
                mult_top = pmul(vv2, pmul(trt1_p, trt2_p))
                w_u4 = pmul(vv2, trt1_p)

            def schur_entry(i_, j_, P_ij):
                return psub(pmul(mult_top, P_ij), padd(pmul(trt2_p, pmul(U3[i_], U3[j_])), pmul(w_u4, pmul(U4[i_], U4[j_]))))

            ok_ps = sym3_pd_on(schur_entry(0, 0, P_00), schur_entry(0, 1, P_01), schur_entry(1, 1, P_11),
                               schur_entry(0, 2, P_02), schur_entry(1, 2, P_12), schur_entry(2, 2, P_22), u0, u1)
            ok_s = ok_dw and ok_tv and ok_a0 and ok_ps

            M11 = psub(psub([m00], p3), pscale(p6, inv_e))
            M33 = psub(psub(padd([mu_rho + mu_a], psa), p4), padd(dal_p, padd(trt1_p, trt2_p)))
            D2 = psub(pscale(M11, m11), pmul(M12, M12))
            ok2 = positive_on(D2, u0, u1)
            q1_rem = psub(q1_base, qs_p)
            b1_v = pscale(psub(psub(padd(p3, padd(g3, padd(pscale(p6, c_1p2e * inv_e2), pscale(g6, inv_e)))),
                                    padd(p1, padd([2 * m00 + 4 * m01], x2p))), T_p[0][0]), Fr(1, 2))

            if k == 0:
                Y1_v, Y2_v, Y3_v, Y4_v = (div_xk(vy, 1) for vy in (vY1, vY2, vY3, vY4))
                M13_v = pscale(padd(padd(Y3_v, Y4_v), pscale(padd(Y6_v, Y7_v), inv_e)), Fr(-1, 2))
                D3_v = psub(pmul(M33, D2), pscale(pmul(M13_v, M13_v), m11))
                ok3 = positive_on(D3_v, u0, u1)
                b3_v = pscale(psub(psub(padd([Fr(0), sig], padd(Y3_v, padd(g4, padd(pscale(Y6_v, c_1p2e * inv_e2),
                                   padd(pscale(Y7_v, c_1pe * inv_e2), pscale(g7, inv_e)))))),
                                   padd(Y1_v, padd(pscale(Y2_v, Fr(1, 2)), xap))), pscale(T_p[0][3], 2 * inv_e)), Fr(1, 2))
                adj11 = pscale(M33, m11)
                adj22 = psub(pmul(M11, M33), pmul(M13_v, M13_v))
                adj33 = D2
                adj12 = pscale(pmul(M12, M33), Fr(-1))
                adj13 = pscale(M13_v, -m11)
                adj23 = pmul(M12, M13_v)
                quad_v = padd(
                    padd(pmul(adj11, pmul(b1_v, b1_v)), pmul(adj22, pmul(b2_v, b2_v))),
                    padd(pmul(adj33, pmul(b3_v, b3_v)),
                         pscale(padd(pmul(adj12, pmul(b1_v, b2_v)),
                                     padd(pmul(adj13, pmul(b1_v, b3_v)), pmul(adj23, pmul(b2_v, b3_v)))), Fr(2)))
                )
                D4_r = psub(pmul(psub(compose_r2(q1_rem), [Fr(0), Fr(1)]), compose_r2(D3_v)), compose_r2(quad_v))
                ok4 = positive_on(D4_r, a_lo, b_hi)
            else:
                vM13 = pscale(padd(padd(vY3, vY4), pscale(padd(vY6, vY7), inv_e)), Fr(-1, 2))
                v2D3 = psub(pmul(vv2, pmul(M33, D2)), pscale(pmul(vM13, vM13), m11))
                ok3 = positive_on(v2D3, u0, u1)
                vb3 = pscale(psub(padd(pmul(vv, psub(padd([Fr(0), sig], padd(g4, pscale(g7, inv_e))),
                                                     padd(xap, pscale(T_p[0][3], 2 * inv_e)))),
                                       padd(vY3, padd(pscale(vY6, c_1p2e * inv_e2), pscale(vY7, c_1pe * inv_e2)))),
                                  padd(vY1, pscale(vY2, Fr(1, 2)))), Fr(1, 2))
                t11 = pmul(pscale(pmul(vv2, M33), m11), pmul(b1_v, b1_v))
                v2_adj22 = psub(pmul(vv2, pmul(M11, M33)), pmul(vM13, vM13))
                t22 = pmul(v2_adj22, pmul(b2_v, b2_v))
                t33 = pmul(D2, pmul(vb3, vb3))
                t12 = pscale(pmul(vv2, pmul(M12, pmul(M33, pmul(b1_v, b2_v)))), Fr(-2))
                t13 = pscale(pmul(vM13, pmul(b1_v, vb3)), -2 * m11)
                t23 = pscale(pmul(M12, pmul(vM13, pmul(b2_v, vb3))), Fr(2))
                v2_quad = padd(padd(t11, t22), padd(t33, padd(t12, padd(t13, t23))))
                D4_r = psub(pmul(psub(compose_r2(q1_rem), [Fr(0), Fr(1)]), compose_r2(v2D3)), compose_r2(v2_quad))
                ok4 = positive_on(D4_r, a_lo, b_hi)

            G_val = [peval(g1, u1), peval(g2, u1), peval(g3, u1), peval(g4, u1),
                     peval(g5, u1), peval(g6, u1), peval(g7, u1)]

        if not (ok_s and ok2 and ok3 and ok4):
            nfail += 1
            if not quiet:
                print('   (C2) FAILS on', 'tail' if tail else 'interval %d [%s, %s]' % (k, e[k], e[k + 1]),
                      'ok_s=%s ok2=%s ok3=%s ok4=%s' % (ok_s, ok2, ok3, ok4))

    dlin = [
        16 * m00 + 32 * m01 + 32 * m11,
        4 * m00 + 16 * m11,
        16 * m11 + 32 * (mu_a + mu_rho + sig),
        48 * m01 + 48 * m11 + 24 * (mu_a + mu_rho + mu_w) + 48 * sig,
        16 * m01 + 16 * m11,
    ]
    bounds = {}
    for end in ('lo', 'hi'):
        s_e = Fr(row['s_' + end])
        if s_e == 0:
            bounds[end] = lam0 + lam1 + 2 * lam2 + 6 * lam3
            continue
        pd = row['par'][end]
        al = [Fr(x) for x in pd['alpha']]
        require(len(al) == 2 and all(x > 0 for x in al), 'alpha > 0 failed')
        dJ = [l3[1] * (150 * al[0] * S0[i] + (198 + Fr(150) / al[0]) * H0[i])
              + l3[2] * (Fr(135, 2) * al[1] * S0[i] + (Fr(11781, 32) + Fr(135, 2) / al[1]) * H0[i]) for i in range(5)]
        sb = Fr(pd['sqrt_ub'])
        require(sb > 0 and sb * sb >= s_e, 'sqrt_ub failed')
        c = [dlin[i] + sb * dJ[i] for i in range(5)]
        eta = Fr(pd['eta'])
        resid = [c[i] - eta * EROW[i] for i in range(5)]
        for typ, theta, yv in pd['cuts']:
            yv = Fr(yv)
            require(yv >= 0, 'negative cut multiplier')
            a_ = cut_vector(typ, None if theta is None else Fr(theta))
            resid = [resid[i] + yv * a_[i] for i in range(5)]
        L = eta + sum(max(resid[i], Fr(0)) * PMAX[i] for i in range(5))
        bounds[end] = (lam0 + lam1 + lam2 * (2 + s_e) + l3[0] * (6 + 9 * s_e + C6 * s_e * sb)
                       + (l3[1] + l3[2]) * (6 + 9 * s_e) + s_e * L)

    return dict(ok=(nfail == 0), nfail=nfail, bound=max(bounds.values()), bounds=bounds, K=K, level=('3d' if use_3d else '2'))


# ==============================================================================
# PART 3: EXACT DOWNSTREAM CONSEQUENCES (higher-degree/STATUS.md 1.12, 4.12, 4.18*)
# ==============================================================================
def verify_downstream(ds, rho, S_cplx, pi_lo, pi_hi):
    require(isinstance(ds, dict), 'downstream must be a dict')
    # 1. Exact t = 0 caps (1.12 and 4.12):
    cap_d7 = Fr(ds['deg7_1403_cap'])
    cap_d5 = Fr(ds['deg5_1402_cap'])
    require(cap_d7 == Fr(1000, 1403) / (rho * rho) and cap_d7 == Fr(3906250, 4558347), 'deg7_1403_cap mismatch')
    require(cap_d5 == Fr(500, 701) / (rho * rho) and cap_d5 == Fr(1953125, 2277549), 'deg5_1402_cap mismatch')
    require(cap_d7 > Fr(85694, 100000) and cap_d5 > Fr(85755, 100000), 't=0 cap decimal check failed')

    e, eta, target = Fr(39, 50), Fr(779, 10000), Fr(500, 701)
    carrier = Fr(431, 500)

    # 2. 4.18a direct Gaussian-buffer 6-decimal cutoff (strict crossing bracket):
    t_418a = Fr(ds['d5_418a_cutoff'])
    require(t_418a > 0 and t_418a == Fr(51873, 200000), 'd5_418a_cutoff mismatch')
    c_hi = e * (rho**2) + (eta**2) / (pi_lo * e)
    c_lo = e * (rho**2) + (eta**2) / (pi_hi * e)
    require((1 - eta) * (t_418a**2) + c_hi < target, '4.18a upper bound fails at t_418a')
    require((1 - eta) * ((t_418a + Fr(1, 10**6)) ** 2) + c_lo > target, '4.18a next 10^-6 step does not fail')

    # 3. 4.18e elliptic Parseval & Lean-mass 8-decimal cutoffs (strict crossing brackets):
    def check_elliptic_8dec(t_val, weight, offset, label):
        require(t_val > 0, label + ' must be positive')
        intercept = offset + weight * (rho**2)
        sl = 1 - eta - weight * (carrier**2)
        require(weight > 0 and sl > 0 and target > intercept, label + ' signs failed')
        t_next = t_val + Fr(1, 10**8)
        require(intercept + sl * (t_val**2) < target < intercept + sl * (t_next**2), label + ' 10^-8 bracket failed')

    t_pars = Fr(ds['d5_418e_parseval'])
    require(t_pars == Fr(8957087, 25000000), 'd5_418e_parseval mismatch')
    check_elliptic_8dec(t_pars, e - eta, eta, '4.18e Parseval')

    mass_e = Fr(25, 31)
    mass_c = Fr(1, 2) + 2 * Fr(47, 1953)
    mass_s = Fr(3798855002922010337121170986221578569, 22939068096000000000000000000000000000)
    t_mass = Fr(ds['d5_418e_lean_mass'])
    require(t_mass == Fr(4619003, 12500000), 'd5_418e_lean_mass mismatch')
    check_elliptic_8dec(t_mass, e - eta * mass_e / mass_c, eta * (1 + mass_s / mass_c), '4.18e Lean mass')

    # 4. 4.18e sixth-moment clipping 8-decimal cutoff (Sturm positivity on [0, oo) + next-step witness):
    t_clip = Fr(ds['d5_418e_sixth_moment'])
    require(t_clip > 0 and t_clip == Fr(36598729, 100000000), 'd5_418e_sixth_moment mismatch')
    shift = Fr(21, 200)
    nu_ell = carrier * carrier
    require(e - eta - eta * (1 + 2 * shift) > 0 and 1 - eta > (e - eta + eta * shift * shift) * nu_ell,
            '4.18e clipping monotonicity failed')
    x0 = rho * rho - nu_ell * t_clip * t_clip
    z0 = ((1 + shift) ** 2) * x0
    upper0 = eta + (1 - eta) * t_clip * t_clip + (e - eta) * x0
    require(upper0 > target and 0 < x0 < 1 and 2 * z0 > 1, '4.18e clipping range failed')
    need0 = (upper0 - target) / eta + shift * shift * x0
    sc12 = 10**12
    r_up = Fr(isqrt(int(need0 * (sc12**2))) + 1, sc12)
    tang = Fr(2181, 1250)
    d0 = 2 * z0 - 1 - r_up * (2 + tang * tang) / (2 * tang)
    d1 = z0 - r_up / (2 * tang)
    require(d0 > 0 and d1 > 0, '4.18e clipping unsquared positivity failed')
    poly_clip = [d0 * d0 - 6 * r_up * r_up * z0, Fr(0), 2 * d0 * d1 - 9 * r_up * r_up * z0, -C6 * r_up * r_up * z0, d1 * d1]
    require(positive_on(poly_clip, Fr(0), None), '4.18e clipping Sturm check on [0, oo) failed')
    # Verify next 8-decimal point fails at s = 1317/1250:
    t_clip_next = t_clip + Fr(1, 10**8)
    s_w = Fr(1317, 1250)
    x1 = rho * rho - nu_ell * t_clip_next * t_clip_next
    z1 = ((1 + shift) ** 2) * x1
    gran = Fr(1, sc12)
    sq_s_up = Fr(isqrt(int(s_w * (sc12**2))) + 1, sc12)
    mlo = 6 + 9 * s_w + C6 * s_w * (sq_s_up - gran)
    den_lo = (Fr(isqrt(int(z1 * mlo * (sc12**2))), sc12)) + (Fr(isqrt(int((2 + s_w) * (sc12**2))), sc12))
    require(den_lo > 0, '4.18e clipping control den_lo <= 0')
    corr_hi = ((z1 * (2 + s_w) - 1) ** 2) / (den_lo * den_lo) - shift * shift * x1
    require(eta + (1 - eta) * t_clip_next * t_clip_next + (e - eta) * x1 - eta * corr_hi > target,
            '4.18e clipping next 10^-8 point did not fail')

    # 5. 4.18f 24-spectral-mass cutoff using (rho, S_cplx) and Grothe/Lower/MassWitnessData.lean:
    t_418f = Fr(ds['d5_418f_spectral_24'])
    require(t_418f > 0 and t_418f == Fr(37589, 100000), 'd5_418f_spectral_24 mismatch')
    repo_root = HERE.parents[3]
    lean_text = (repo_root / 'Grothe' / 'Lower' / 'MassWitnessData.lean').read_text(encoding='utf-8')
    names = re.findall(r'def (massWit\d+) : SWit :=', lean_text)
    pool_m = re.search(r'def massWitnesses : List SWit := \[(.*?)\]', lean_text, re.S)
    require(pool_m and names == re.findall(r'massWit\d+', pool_m[1]) and len(names) == 24, '24 Lean mass witnesses check failed')
    blocks = re.findall(r'def massWit\d+ : SWit :=\s*⟨(.*?⟩),', lean_text, re.S)
    pool = []
    for blk in blocks:
        terms = [Fr(int(n_), int(d_ or 1)) for n_, d_ in re.findall(r'\((-?\d+) : ℚ\)(?:\s*/\s*(\d+))?', blk)]
        require(len(terms) == 6, 'witness arity failed')
        tau, a0, a1, a2, a4, a6 = terms
        require(0 < tau < 1 and a1 == 0 and a6 >= 0, 'witness signs failed')
        pool.append((4 * tau / 3, a0 + a2 + 2 * a4 + 6 * a6, a4 + 9 * a6, C6 * a6))
    require(len(pool) == 24, 'parsed witness count != 24')

    sc10 = 10**10
    down10 = lambda x: Fr((x * sc10).__floor__(), sc10)
    up10 = lambda x: -down10(-x)
    sqrt_lo10 = lambda x: Fr(isqrt(int(x * (sc10**2))), sc10)
    sqrt_hi10 = lambda x: sqrt_lo10(x) + Fr(1, sc10)

    a_min = Fr(11, 20)
    t_init = Fr(369, 1000)
    k_m = e - eta * mass_e / mass_c
    require(eta * (1 + mass_s / mass_c) + k_m * rho * rho + (1 - eta - k_m * carrier * carrier) * t_init * t_init < target,
            '4.18f initial interval failed')
    require(eta + (1 - eta) * t_418f * t_418f + (e - eta) * a_min < target, '4.18f small energy failed')
    require(all(e > eta * mass_e * p_ / (mass_c * sqrt_lo10(a_min)) for p_, *_ in pool), '4.18f monotonicity failed')
    r_ax = 2 * (Fr(179, 200) ** 2) - 1
    cross = 2 * sqrt_hi10(3 * (1 + r_ax * r_ax))
    tail_c = 2 * (1 + r_ax * r_ax)
    mu2 = pi_hi / 4

    def quad_max_w(qa, qb, qc, lo, hi):
        vals = [(qa * lo + qb) * lo + qc, (qa * hi + qb) * hi + qc]
        if qa < 0:
            v_ = -qb / (2 * qa)
            if lo < v_ < hi:
                vals.append((qa * v_ + qb) * v_ + qc)
        return max(vals)

    boxes_f = 0

    def handle_box(t0_, t1_, y0_, y1_, depth):
        nonlocal boxes_f
        d0_, d1_ = (carrier * t0_) ** 2, (carrier * t1_) ** 2
        au = up10(rho * rho - d0_)
        for _ in range(2):
            if au < a_min:
                break
            lo_w = d0_ / (au + d0_)
            hi_w = d1_ / (a_min + d1_)
            sy = y1_ * y1_
            sm = quad_max_w(sy - cross * y1_ + tail_c, cross * y1_ - 2 * sy, sy, lo_w, hi_w)
            au = min(au, up10(mu2 * ((1 + S_cplx * sm) ** 2) - d0_))
        if au < a_min:
            boxes_f += 1
            return
        sq_au = sqrt_lo10(au)
        best_val = max(
            (2 * mass_e * p_ * sq_au - max(a_ + b_ * y0_**2 + d_ * y0_**3, a_ + b_ * y1_**2 + d_ * y1_**3)) / mass_c
            for p_, a_, b_, d_ in pool
        )
        if eta + (1 - eta) * t1_ * t1_ + e * au - eta * best_val < target:
            boxes_f += 1
            return
        require(depth < 34, f'4.18f unresolved box [{t0_}, {t1_}] x [{y0_}, {y1_}]')
        if 30 * (t1_ - t0_) > y1_ - y0_:
            tm_ = (t0_ + t1_) / 2
            handle_box(t0_, tm_, y0_, y1_, depth + 1)
            handle_box(tm_, t1_, y0_, y1_, depth + 1)
        else:
            ym_ = (y0_ + y1_) / 2
            handle_box(t0_, t1_, y0_, ym_, depth + 1)
            handle_box(t0_, t1_, ym_, y1_, depth + 1)

    handle_box(t_init, t_418f, Fr(0), Fr(13, 2), 0)
    return dict(boxes_418f=boxes_f)


def verify_certificate_dict(cert, generic=False, quiet=False, enclose_fn=None, foundations=None):
    require(isinstance(cert, dict), 'certificate must be a JSON object')
    claim = Fr(cert['claim'])
    require(claim > 0, 'claim must be strictly positive')

    if foundations is None:
        pi_lo, pi_hi = verify_ou_foundations()
    else:
        pi_lo, pi_hi = foundations
    if enclose_fn is None:
        enclose_fn = build_ou_evaluator(pi_lo, pi_hi)

    require('ou_resolvent' in cert and isinstance(cert['ou_resolvent'], dict), 'missing ou_resolvent')
    ou_dict = cert['ou_resolvent']
    chi_hi_hdr = Fr(ou_dict['chi_hi'])
    slope_hdr = Fr(ou_dict['slope_claim'])
    bound_hdr = Fr(ou_dict['bound_at_chi_hi'])
    require(chi_hi_hdr > 0 and slope_hdr > 0 and bound_hdr > 0, 'OU header fields must be strictly positive')
    require(bound_hdr < claim, 'OU bound_at_chi_hi >= claim')

    rows = cert['rows']
    require(isinstance(rows, list) and len(rows) >= 1, 'rows must be a non-empty list')
    sharp_hi_s = Fr(cert['sharp_hi_s']) if 'sharp_hi_s' in cert else None
    sh_cap = None
    if sharp_hi_s is not None or 'sharp_hi_claim' in cert:
        require(sharp_hi_s is not None and 'sharp_hi_claim' in cert, 'incomplete sharp_hi fields')
        sh_cap = Fr(cert['sharp_hi_claim'])
        require(sh_cap > 0, 'sharp_hi_claim must be strictly positive')
        require(sh_cap * sh_cap < pi_lo / 4, 'sharp_hi_claim >= sqrt(pi)/2')

    # Fast contiguity, coverage, and default-mode theorem pinning before OU & Stein cell loops:
    prev = chi_hi_hdr
    found_sharp_start = False
    for i, row in enumerate(rows):
        s_lo, s_hi = Fr(row['s_lo']), Fr(row['s_hi'])
        require(s_lo == prev and s_hi > s_lo, f'row {i} contiguity failed: expected s_lo={prev}, got {s_lo}')
        if sharp_hi_s is not None and s_lo == sharp_hi_s:
            found_sharp_start = True
        prev = s_hi
    require(prev >= S_COVER, f'Stein rows end at {prev} < 42')
    if sharp_hi_s is not None:
        require(found_sharp_start, 'sharp_hi_s does not match any row start knot')

    if not generic:
        require(claim <= Fr(114, 125), 'default theorem mode requires claim <= 114/125')
        require(slope_hdr <= Fr(3299, 625000), 'default theorem mode requires slope_claim <= 3299/625000')
        require(sharp_hi_s is not None and sharp_hi_s <= Fr(25), 'default theorem mode requires sharp_hi_s <= 25')
        require(sh_cap is not None and sh_cap <= Fr(443, 500), 'default theorem mode requires sharp_hi_claim <= 443/500')
        require('downstream' in cert, 'default theorem mode requires downstream dictionary')

    ou_res = verify_ou_resolvent(ou_dict, pi_hi, enclose_fn)
    require(ou_res['bound_at_chi_hi'] < claim, 'OU bound_at_chi_hi >= claim')
    ds_res = verify_downstream(cert['downstream'], claim, ou_res['S_cplx'], pi_lo, pi_hi) if not generic else None

    worst_stein = Fr(0)
    worst_idx = -1
    worst_hi = None

    for i, row in enumerate(rows):
        s_lo, s_hi = Fr(row['s_lo']), Fr(row['s_hi'])
        res = verify_row(row, quiet=quiet)
        require(res['ok'], f'Stein Sturm row {i} [{s_lo}, {s_hi}] failed')
        if res['bound'] > worst_stein:
            worst_stein = res['bound']
            worst_idx = i
        if sharp_hi_s is not None and s_lo >= sharp_hi_s:
            if worst_hi is None or res['bound'] > worst_hi:
                worst_hi = res['bound']
        if not quiet:
            print('row %2d [L%s]  s in [%6s, %6s]  K=%3d  PASS  bound <= %s  (lo<=%s, hi<=%s)' % (
                i, res['level'], row['s_lo'], row['s_hi'], res['K'],
                dec_ceil10(res['bound']), dec_ceil10(res['bounds']['lo']), dec_ceil10(res['bounds']['hi'])), flush=True)

    overall_worst = max(ou_res['bound_at_chi_hi'], worst_stein)
    require(overall_worst < claim, f'overall worst bound {overall_worst} >= claim {claim}')
    if sh_cap is not None:
        require(worst_hi is not None and worst_hi < sh_cap, 'high-kurtosis sharp claim failed')

    return dict(
        claim=claim,
        ou=ou_res,
        worst_stein=worst_stein,
        worst_idx=worst_idx,
        overall_worst=overall_worst,
        worst_hi=worst_hi,
        sharp_hi_s=sharp_hi_s,
        downstream=ds_res,
    )


def main(argv=None):
    args = list(sys.argv[1:] if argv is None else argv)
    quiet = '--quiet' in args
    generic = '--generic' in args
    pos_args = [a for a in args if not a.startswith('--')]
    require(len(pos_args) <= 1, 'Usage: verify.py [CERT.json] [--quiet] [--generic]')
    cert_path = pathlib.Path(pos_args[0]) if pos_args else DEFAULT_CERT

    t0 = time.monotonic_ns()
    cert = json.loads(cert_path.read_text(encoding='utf-8'))
    out = verify_certificate_dict(cert, generic=generic, quiet=quiet)
    dt_ms = (time.monotonic_ns() - t0) // 1_000_000

    print('OU resolvent [0, %s]: S_cplx = %s, LDL^T leaves = %d (max_depth = %d), bound < %s' % (
        out['ou']['chi_hi'], out['ou']['S_cplx'], out['ou']['leaves'], out['ou']['max_depth'],
        cert['ou_resolvent']['bound_at_chi_hi']))
    print('Stein Sturm [%s, 42]: all %d rows PASS, worst row = %d, max Stein bound <= %s' % (
        out['ou']['chi_hi'], len(cert['rows']), out['worst_idx'], dec_ceil10(out['worst_stein'])))
    print('GLOBAL CLAIM  E|q| <= %s ||q||_2  for every q in H_{2,1}(C^n):  VERIFIED  [%d ms, zero floats]' % (
        cert['claim'], dt_ms))
    if out['worst_hi'] is not None:
        print('SHARP HIGH-CHI CLAIM  E|q| <= %s ||q||_2 < (sqrt(pi)/2)||q||_2  on chi in [%s, 42]:  VERIFIED (max <= %s)' % (
            cert['sharp_hi_claim'], out['sharp_hi_s'], dec_ceil10(out['worst_hi'])))
    if out['downstream'] is not None:
        ds = cert['downstream']
        print('DOWNSTREAM CONSEQUENCES VERIFIED: deg7_cap=%s, deg5_cap=%s, 4.18a=%s, 4.18e=(%s, %s, %s), 4.18f=%s (%d boxes)' % (
            ds['deg7_1403_cap'], ds['deg5_1402_cap'], ds['d5_418a_cutoff'],
            ds['d5_418e_parseval'], ds['d5_418e_sixth_moment'], ds['d5_418e_lean_mass'],
            ds['d5_418f_spectral_24'], out['downstream']['boxes_418f']))


if __name__ == '__main__':
    main()
