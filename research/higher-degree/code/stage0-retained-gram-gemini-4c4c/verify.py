#!/usr/bin/env python3
"""Zero-float, zero-assert Python 3 stdlib verifier for S0RG (#849, refs #751):
antisymmetric slice-Gram inequality C_-- >= 0, retained-defender dual rows, and
c -> 0+ quadratic/local diffuse-spike saddle bounds at 9 Stage 0 sample rows.

Verifies from scratch:
  1. Source-code AST self-audit (zero float literals/calls, zero assert statements) and < 300 KB file caps.
  2. Exact symbolic, concrete Q[i]-tensor, and physical Gaussian Wick polynomial verification of Theorem 1:
       - 4-channel Pythagorean slice-Gram decomposition of ctC in Grothe/LowerAnalytic/GramTensor.lean,
         including the antisymmetric involution inequality 4 ||C_--||_HS^2 = n + b - (3y - z) >= 0;
       - All three sharp dimension-free spectral chaos bounds (25 u_2 >= 9 u_4, 8 u_2 >= 3 v_4, 14 u_2 >= 3 chi),
         equality at unit e_{2,1}(y_1), and exact rational 5-scalar counterexamples showing C_-- >= 0 is strictly
         stronger than the 5-scalar Gram.lean cone.
  3. Exact symbolic verification of Theorem 2 & Theorem 3:
       - Bargmann-Laguerre expectation identities and vanishing O(c^2) visible quintic scalar shift gradient;
       - Dependency-free 4-term SOS polynomial identity reducing the c -> 0+ quadratic/local saddle to e_{2,1}.
  4. SHA-256 provenance binding to research/higher-degree/code/degree5-stage0/results/b/*/rows_all.lines,
     exact pinning of all 9 (id, game, t_key, e1, eta, cap_upper) benchmarks and mode flags, and <= 5*10^{-11}
     rationalisation check.
  5. Full from-scratch zero-float outward-rounded Jet2 interval re-integration of all 9 sample rows at sigma = sigma_*,
     certifying strict complex Hessian concavity (all 14 real & imaginary margins > 0), strictly positive stored & fresh
     SOS multipliers lam_1..lam_4 > 0, 5-invariant interval SOS balance, and c -> 0+ saddle caps.
     (Finite gate points c in {0.1, 0.3, 0.6, 1} and off-peak sigma != sigma_* are not evaluated; the Stage 0 stop rule is not yet discharged.)
"""

import argparse
import ast
from concurrent.futures import ProcessPoolExecutor
from decimal import Decimal
from fractions import Fraction
import hashlib
import json
from math import comb, factorial, isqrt
import os
from pathlib import Path
import sys
import time


S = 10 ** 15
S2 = S * S
STEP_EXP = 10 ** 12
MAX_K_EXP = 36000


def check(cond, msg):
    if not cond:
        raise ValueError(f"VERIFICATION FAILED: {msg}")


def isqrt_ceil(n):
    if n <= 0:
        return 0
    r = isqrt(n)
    return r if r * r == n else r + 1


def compute_pi_bracket():
    def atan_inv(m, terms):
        m2 = m * m
        p = m
        acc = Fraction(0, 1)
        for k in range(terms):
            term = Fraction(1, (2 * k + 1) * p)
            acc = acc + term if k % 2 == 0 else acc - term
            p *= m2
        rem = Fraction(1, (2 * terms + 1) * p)
        return acc - rem, acc + rem

    a5_lo, a5_hi = atan_inv(5, 22)
    a239_lo, a239_hi = atan_inv(239, 10)
    pi_lo_f = 16 * a5_lo - 4 * a239_hi
    pi_hi_f = 16 * a5_hi - 4 * a239_lo
    return (
        (pi_lo_f.numerator * S) // pi_lo_f.denominator,
        (pi_hi_f.numerator * S + pi_hi_f.denominator - 1) // pi_hi_f.denominator,
    )


PI_LO, PI_HI = compute_pi_bracket()
SQRT2_IV = (isqrt(2 * S2), isqrt_ceil(2 * S2))
SQRT3_IV = (isqrt(3 * S2), isqrt_ceil(3 * S2))
SQRT6_IV = (isqrt(6 * S2), isqrt_ceil(6 * S2))
SQRTPI_IV = (isqrt(PI_LO * S), isqrt_ceil(PI_HI * S))

EXP_LUT_LO = [0] * (MAX_K_EXP + 2)
EXP_LUT_HI = [0] * (MAX_K_EXP + 2)


def _init_exp_lut():
    sh = 10 ** 8
    sb = S * sh
    u0_den = 1000
    acc_lo = sb
    acc_hi = sb
    p_den = 1
    for j in range(1, 10):
        p_den *= u0_den * j
        t_floor = sb // p_den
        t_ceil = (sb + p_den - 1) // p_den
        if j % 2 == 1:
            acc_lo -= t_ceil
            acc_hi -= t_floor
        else:
            acc_lo += t_floor
            acc_hi += t_ceil
    EXP_LUT_LO[0] = S
    EXP_LUT_HI[0] = S
    cur_lo = sb
    cur_hi = sb
    for k in range(1, MAX_K_EXP + 2):
        cur_lo = (cur_lo * acc_lo) // sb
        cur_hi = (cur_hi * acc_hi + sb - 1) // sb
        EXP_LUT_LO[k] = cur_lo // sh
        EXP_LUT_HI[k] = (cur_hi + sh - 1) // sh


_init_exp_lut()


def to_iv(q):
    q = Fraction(q)
    n, d = q.numerator, q.denominator
    if n >= 0:
        return ((n * S) // d, (n * S + d - 1) // d)
    m = -n
    return (-((m * S + d - 1) // d), -((m * S) // d))


def iv_to_frac_pair(iv):
    return (Fraction(iv[0], S), Fraction(iv[1], S))


def parse_frac(s):
    if "/" in s:
        a, b = s.split("/", 1)
        return Fraction(int(a), int(b))
    return Fraction(int(s), 1)


def fmt_bound(value, digits, *, upper=False):
    """Round an endpoint outward from its integer value in units of 1/S."""
    scale = 10 ** digits
    numerator = value * scale
    rounded = -(-numerator // S) if upper else numerator // S
    whole, frac = divmod(abs(rounded), scale)
    sign = "-" if rounded < 0 else "+"
    return f"{sign}{whole}.{frac:0{digits}d}"


def fmt_interval(bounds, digits):
    lower, upper = bounds
    return f"[{fmt_bound(lower, digits)},{fmt_bound(upper, digits, upper=True)}]"


def iv_add(a, b):
    return (a[0] + b[0], a[1] + b[1])


def iv_sub(a, b):
    return (a[0] - b[1], a[1] - b[0])


def iv_neg(a):
    return (-a[1], -a[0])


def iv_scale_int(a, c):
    return (a[0] * c, a[1] * c) if c >= 0 else (a[1] * c, a[0] * c)


def iv_div_int(a, d):
    lo = a[0] // d if a[0] >= 0 else -(((-a[0]) + d - 1) // d)
    hi = (a[1] + d - 1) // d if a[1] >= 0 else -((-a[1]) // d)
    return (lo, hi)


def iv_mul(a, b):
    alo, ahi = a
    blo, bhi = b
    if alo >= 0 and blo >= 0:
        return ((alo * blo) // S, (ahi * bhi + S - 1) // S)
    p1 = alo * blo
    p2 = alo * bhi
    p3 = ahi * blo
    p4 = ahi * bhi
    mn = min(p1, p2, p3, p4)
    mx = max(p1, p2, p3, p4)
    lo = mn // S if mn >= 0 else -(((-mn) + S - 1) // S)
    hi = (mx + S - 1) // S if mx >= 0 else -((-mx) // S)
    return (lo, hi)


def iv_sqr(a):
    alo, ahi = a
    if alo >= 0:
        return ((alo * alo) // S, (ahi * ahi + S - 1) // S)
    if ahi <= 0:
        return ((ahi * ahi) // S, (alo * alo + S - 1) // S)
    mx = max(-alo, ahi)
    return (0, (mx * mx + S - 1) // S)


def iv_inv_pos(b):
    blo, bhi = b
    check(blo > 0, f"iv_inv_pos requires strictly positive interval, got lo={blo}")
    return (S2 // bhi, (S2 + blo - 1) // blo)


def iv_div_pos(a, b):
    return iv_mul(a, iv_inv_pos(b))


def iv_sqrt_pos(a):
    check(a[0] >= 0, f"iv_sqrt_pos requires nonnegative interval, got lo={a[0]}")
    return (isqrt(a[0] * S), isqrt_ceil(a[1] * S))


def exp_neg_series_lo_hi(x):
    if x <= 0:
        return S, S
    if x >= 36 * S:
        return 0, 1
    k = 0
    m_lo = x
    m_hi = x
    while m_hi > S // 4:
        m_lo //= 2
        m_hi = (m_hi + 1) // 2
        k += 1
    sh = 10 ** 5
    sb = S * sh
    u_hi = m_hi * sh
    term = sb
    acc_lo = sb
    for j in range(1, 12):
        if j % 2 == 1:
            term = (term * u_hi + sb * j - 1) // (sb * j)
            acc_lo -= term
        else:
            term = (term * u_hi) // (sb * j)
            acc_lo += term
    u_lo = m_lo * sh
    term = sb
    acc_hi = sb
    for j in range(1, 13):
        if j % 2 == 1:
            term = (term * u_lo) // (sb * j)
            acc_hi -= term
        else:
            term = (term * u_lo + sb * j - 1) // (sb * j)
            acc_hi += term
    for _ in range(k):
        acc_lo = (acc_lo * acc_lo) // sb
        acc_hi = (acc_hi * acc_hi + sb - 1) // sb
    return max(acc_lo // sh, 0), (acc_hi + sh - 1) // sh


def iv_exp_neg(a):
    alo, ahi = a
    if alo <= 0:
        hi = S
    elif alo >= 36 * S:
        hi = 1
    else:
        k0, r0 = divmod(alo, STEP_EXP)
        r2 = (r0 * r0 + S - 1) // S
        r3 = (r0 * r0 * r0) // S2
        r4 = (r2 * r2 + S - 1) // S
        poly_hi = S - r0 + (r2 + 1) // 2 - r3 // 6 + (r4 + 23) // 24
        hi = (EXP_LUT_HI[k0] * poly_hi + S - 1) // S
    if ahi <= 0:
        lo = S
    elif ahi >= 36 * S:
        lo = 0
    else:
        k1, r1 = divmod(ahi, STEP_EXP)
        r2 = (r1 * r1) // S
        r3 = (r1 * r1 * r1 + S2 - 1) // S2
        poly_lo = S - r1 + r2 // 2 - (r3 + 5) // 6
        lo = (EXP_LUT_LO[k1] * poly_lo) // S
    return (lo, hi)


ZERO_IV = (0, 0)
ONE_IV = (S, S)
INV_2SQ3 = iv_div_pos(ONE_IV, iv_scale_int(SQRT3_IV, 2))
INV_SQ2 = iv_div_pos(ONE_IV, SQRT2_IV)
INV_SQ6 = iv_div_pos(ONE_IV, SQRT6_IV)
FOUR_OVER_SQRTPI = iv_div_pos(iv_scale_int(SQRTPI_IV, 4), (PI_LO, PI_HI))


def j_const(c_iv):
    return (c_iv, ZERO_IV, ZERO_IV)


def j_var(x_iv):
    return (x_iv, ONE_IV, ZERO_IV)


def j_add(u, v):
    return (iv_add(u[0], v[0]), iv_add(u[1], v[1]), iv_add(u[2], v[2]))


def j_sub(u, v):
    return (iv_sub(u[0], v[0]), iv_sub(u[1], v[1]), iv_sub(u[2], v[2]))


def j_neg(u):
    return (iv_neg(u[0]), iv_neg(u[1]), iv_neg(u[2]))


def j_scale_iv(u, c_iv):
    return (iv_mul(u[0], c_iv), iv_mul(u[1], c_iv), iv_mul(u[2], c_iv))


def j_scale_int(u, c):
    return (iv_scale_int(u[0], c), iv_scale_int(u[1], c), iv_scale_int(u[2], c))


def j_div_int(u, d):
    return (iv_div_int(u[0], d), iv_div_int(u[1], d), iv_div_int(u[2], d))


def j_mul(u, v):
    f0 = iv_mul(u[0], v[0])
    f1 = iv_add(iv_mul(u[1], v[0]), iv_mul(u[0], v[1]))
    t_mid = iv_scale_int(iv_mul(u[1], v[1]), 2)
    f2 = iv_add(iv_add(iv_mul(u[2], v[0]), t_mid), iv_mul(u[0], v[2]))
    return (f0, f1, f2)


def j_sqr(u):
    f0 = iv_sqr(u[0])
    f1 = iv_scale_int(iv_mul(u[0], u[1]), 2)
    f2 = iv_scale_int(iv_add(iv_sqr(u[1]), iv_mul(u[0], u[2])), 2)
    return (f0, f1, f2)


def j_inv_pos(v):
    inv_v = iv_inv_pos(v[0])
    inv_v2 = iv_sqr(inv_v)
    f1 = iv_neg(iv_mul(v[1], inv_v2))
    num = iv_sub(iv_scale_int(iv_mul(iv_sqr(v[1]), inv_v), 2), v[2])
    f2 = iv_mul(num, inv_v2)
    return (inv_v, f1, f2)


def j_sqrt_pos(v):
    g0 = iv_sqrt_pos(v[0])
    inv_2g0 = iv_inv_pos(iv_scale_int(g0, 2))
    f1 = iv_mul(v[1], inv_2g0)
    f2 = iv_mul(iv_sub(v[2], iv_scale_int(iv_sqr(f1), 2)), inv_2g0)
    return (g0, f1, f2)


def j_exp_neg(v):
    g0 = iv_exp_neg(v[0])
    f1 = iv_neg(iv_mul(v[1], g0))
    f2 = iv_mul(iv_sub(iv_sqr(v[1]), v[2]), g0)
    return (g0, f1, f2)


# ============================================================================
# Layer 1 & 2: Exact Symbolic & Q[i] Tensor Verification of Theorems 1, 2, 3
# ============================================================================

def qi_add(z, w):
    return (z[0] + w[0], z[1] + w[1])


def qi_sub(z, w):
    return (z[0] - w[0], z[1] - w[1])


def qi_mul(z, w):
    return (z[0] * w[0] - z[1] * w[1], z[0] * w[1] + z[1] * w[0])


def qi_conj(z):
    return (z[0], -z[1])


def qi_norm_sq(z):
    return z[0] * z[0] + z[1] * z[1]


def verify_gram_and_sos_identities(gram_cone_flags=None):
    """Exact verification over Q[n, h, b, y, z] and concrete Q[i] 3-tensors."""
    if gram_cone_flags is None:
        gram_cone_flags = {"include_c_mm": True}

    # Represent linear forms in (n, h, b, y, z) as 5-tuples over Fraction:
    n_v = (Fraction(1), Fraction(0), Fraction(0), Fraction(0), Fraction(0))
    h_v = (Fraction(0), Fraction(1), Fraction(0), Fraction(0), Fraction(0))
    b_v = (Fraction(0), Fraction(0), Fraction(1), Fraction(0), Fraction(0))
    y_v = (Fraction(0), Fraction(0), Fraction(0), Fraction(1), Fraction(0))
    z_v = (Fraction(0), Fraction(0), Fraction(0), Fraction(0), Fraction(1))

    def lc(terms):
        out = [Fraction(0)] * 5
        for coef, vec in terms:
            c = Fraction(coef)
            for idx in range(5):
                out[idx] += c * vec[idx]
        return tuple(out)

    # GramBudget.lean / GramTensor.lean spectral chaos definitions:
    u2 = lc([(16, n_v), (4, h_v), (16, z_v)])
    u4 = lc([(16, n_v), (4, h_v), (16, b_v), (96, y_v), (-32, z_v)])
    v2 = lc([(32, b_v)])
    v4 = lc([(96, y_v)])
    chi = lc([(32, n_v), (8, h_v), (32, b_v), (96, y_v)])

    # Orthogonal slice-Gram channels of ctC:
    t0_2 = lc([(3, y_v), (-1, z_v)])  # 2 * T = 3y - z
    cpp_4 = lc([(1, n_v), (1, b_v), (1, t0_2)])
    cmm_4 = lc([(1, n_v), (1, b_v), (-1, t0_2)])
    cpm_4 = lc([(1, n_v), (-1, b_v)])
    cmp_4 = lc([(1, n_v), (-1, b_v)])

    # 1) 4-channel Pythagorean identity: ||C_++||^2 + ||C_--||^2 + ||C_+-||^2 + ||C_-+||^2 == n
    pyth = lc([(Fraction(1, 4), cpp_4), (Fraction(1, 4), cmm_4), (Fraction(1, 4), cpm_4), (Fraction(1, 4), cmp_4)])
    check(pyth == n_v, "Pythagorean 4-channel slice-Gram decomposition of ctC failed")

    # 2) Three sharp universal chaos inequalities (Theorem 1(b)):
    n_minus_b = lc([(1, n_v), (-1, b_v)])
    z_minus_y = lc([(1, z_v), (-1, y_v)])
    nh_diff_sq = lc([(1, n_v), (1, h_v), (-2, z_v)])  # ||N - H^T||_HS^2 >= 0

    lhs_u4 = lc([(25, u2), (-9, u4)])
    rhs_u4 = lc([(24, cmm_4), (168, n_minus_b), (792, z_minus_y), (64, nh_diff_sq)])
    check(lhs_u4 == rhs_u4, "Identity 25*u_2 - 9*u_4 SOS decomposition failed")

    lhs_v4 = lc([(8, u2), (-3, v4)])
    rhs_v4 = lc([(48, cmm_4), (48, n_minus_b), (144, z_minus_y), (32, nh_diff_sq)])
    check(lhs_v4 == rhs_v4, "Identity 8*u_2 - 3*v_4 SOS decomposition failed")

    lhs_chi = lc([(14, u2), (-3, chi)])
    rhs_chi = lc([(96, n_minus_b), (288, z_minus_y), (32, nh_diff_sq)])
    check(lhs_chi == rhs_chi, "Identity 14*u_2 - 3*chi SOS decomposition failed")

    # 3) Exact rational 5-scalar counterexamples when C_-- >= 0 is omitted:
    def eval_5sc(pt, form):
        return sum(pt[idx] * form[idx] for idx in range(5))

    def satisfies_old_gram_cone(pt):
        n0, h0, b0, y0, z0 = pt
        s0 = 3 * y0 - z0
        ok_old = (
            n0 >= 0 and h0 >= 0 and b0 >= 0 and y0 >= 0 and z0 >= 0
            and b0 <= n0 and y0 <= z0 and z0 * z0 <= n0 * h0
            and n0 + b0 + s0 >= 0 and s0 * s0 <= h0 * (n0 + b0 + s0)
        )
        if gram_cone_flags.get("include_c_mm", True):
            return ok_old and (n0 + b0 - s0 >= 0)
        return ok_old

    # Counterexample 1: (n, h, b, y, z) = (9/16, 1, 9/16, 3/4, 3/4) gives u_4/u_2 = 14/5 > 25/9!
    ce1 = (Fraction(9, 16), Fraction(1, 1), Fraction(9, 16), Fraction(3, 4), Fraction(3, 4))
    check(
        Fraction(9, 16) + Fraction(9, 16) - (3 * Fraction(3, 4) - Fraction(3, 4)) == Fraction(-3, 8),
        "Counterexample 1 C_-- value mismatch",
    )
    check(
        eval_5sc(ce1, u4) / eval_5sc(ce1, u2) == Fraction(14, 5) > Fraction(25, 9),
        "Counterexample 1 ratio u_4/u_2 != 14/5",
    )
    check(not satisfies_old_gram_cone(ce1), "Full cone with C_-- >= 0 must exclude Counterexample 1")

    # Counterexample 2: (n, h, b, y, z) = (1/4, 1, 1/4, 1/2, 1/2) gives v_4/u_2 = 3 > 8/3!
    ce2 = (Fraction(1, 4), Fraction(1, 1), Fraction(1, 4), Fraction(1, 2), Fraction(1, 2))
    check(
        Fraction(1, 4) + Fraction(1, 4) - (3 * Fraction(1, 2) - Fraction(1, 2)) == Fraction(-1, 2),
        "Counterexample 2 C_-- value mismatch",
    )
    check(
        eval_5sc(ce2, v4) / eval_5sc(ce2, u2) == Fraction(3, 1) > Fraction(8, 3),
        "Counterexample 2 ratio v_4/u_2 != 3",
    )
    check(not satisfies_old_gram_cone(ce2), "Full cone with C_-- >= 0 must exclude Counterexample 2")

    # 4) Explicit complex Q[i] tensor verification on 4 concrete tensors t_{ijk} = t_{jik} in C^3:
    zero_qi = (Fraction(0), Fraction(0))
    one_qi = (Fraction(1), Fraction(0))

    def make_sym_tensor(entries, dim=3):
        t = [[[zero_qi for _ in range(dim)] for _ in range(dim)] for _ in range(dim)]
        for (i, j, k), val in entries.items():
            if i == j:
                t[i][i][k] = val
            else:
                half_v = (val[0] / 2, val[1] / 2)
                t[i][j][k] = half_v
                t[j][i][k] = half_v
        return t

    # Independent polynomial Gaussian Wick moment & chaos-projection helpers on C^3:
    def p_add_term(poly, exp6, val):
        if val[0] == 0 and val[1] == 0:
            return
        prev = poly.get(exp6)
        if prev is None:
            poly[exp6] = val
        else:
            nv = (prev[0] + val[0], prev[1] + val[1])
            if nv[0] == 0 and nv[1] == 0:
                del poly[exp6]
            else:
                poly[exp6] = nv

    def p_mul(p1, p2):
        out = {}
        for e1_k, v1 in p1.items():
            a0, a1, a2, b0, b1, b2 = e1_k
            for e2_k, v2_k in p2.items():
                p_add_term(
                    out,
                    (a0 + e2_k[0], a1 + e2_k[1], a2 + e2_k[2], b0 + e2_k[3], b1 + e2_k[4], b2 + e2_k[5]),
                    qi_mul(v1, v2_k),
                )
        return out

    def p_conj(poly):
        return {(e[3], e[4], e[5], e[0], e[1], e[2]): qi_conj(v) for e, v in poly.items()}

    def gauss_expect(poly):
        sr = Fraction(0)
        si = Fraction(0)
        for (a0, a1, a2, b0, b1, b2), (vr, vi) in poly.items():
            if a0 == b0 and a1 == b1 and a2 == b2:
                wt = factorial(a0) * factorial(a1) * factorial(a2)
                sr += vr * wt
                si += vi * wt
        return (sr, si)

    def herm_1d(a, b):
        return [
            ((a - k, b - k), ((-1) ** k) * factorial(k) * comb(a, k) * comb(b, k))
            for k in range(min(a, b) + 1)
        ]

    def multi_indices_3(deg):
        return [
            (a0, a1, deg - a0 - a1)
            for a0 in range(deg + 1)
            for a1 in range(deg - a0 + 1)
        ]

    def proj_norm_sq(f_poly, p_deg, q_deg):
        total = Fraction(0)
        for (a0, a1, a2) in multi_indices_3(p_deg):
            h0_list = herm_1d(a0, 0)
            for (b0, b1, b2) in multi_indices_3(q_deg):
                # H_{alpha, beta}(y) = prod_m H_{a_m, b_m}(y_m), norm^2 = prod_m (a_m! b_m!)
                t0 = herm_1d(a0, b0)
                t1 = herm_1d(a1, b1)
                t2 = herm_1d(a2, b2)
                h_conj = {}
                for (u0, v0), c0 in t0:
                    for (u1, v1), c1 in t1:
                        for (u2_i, v2_i), c2 in t2:
                            # conj(y^u ybar^v) = y^v ybar^u
                            p_add_term(h_conj, (v0, v1, v2_i, u0, u1, u2_i), (Fraction(c0 * c1 * c2), Fraction(0)))
                ip_r = Fraction(0)
                ip_i = Fraction(0)
                for (ha0, ha1, ha2, hb0, hb1, hb2), (hc_r, _) in h_conj.items():
                    for (fa0, fa1, fa2, fb0, fb1, fb2), (fr, fi) in f_poly.items():
                        if fa0 + ha0 == fb0 + hb0 and fa1 + ha1 == fb1 + hb1 and fa2 + ha2 == fb2 + hb2:
                            wt = factorial(fa0 + ha0) * factorial(fa1 + ha1) * factorial(fa2 + ha2) * hc_r
                            ip_r += fr * wt
                            ip_i += fi * wt
                den = factorial(a0) * factorial(a1) * factorial(a2) * factorial(b0) * factorial(b1) * factorial(b2)
                total += (ip_r * ip_r + ip_i * ip_i) / den
        del h0_list
        return total

    wick_lin_scale = Fraction(0) if gram_cone_flags.get("corrupt_wick_linear", False) else Fraction(1)

    tensors = [
        # (a) One-spike e_{2,1}(y_1): t_{000} = 1/sqrt(2) -> scaled by sqrt(2): t_{000} = 1 => (n,h,b,y,z) = (1,1,1,1,1)
        ("e21", make_sym_tensor({(0, 0, 0): one_qi}), True),
        # (b) Multilinear y_1 y_2 conj(y_3): t_{012} = t_{102} = 1/2
        ("multilinear", make_sym_tensor({(0, 1, 2): one_qi}), False),
        # (c) Asymmetric y_1^2 conj(y_2): t_{001} = 1
        ("y1sq_ybar2", make_sym_tensor({(0, 0, 1): one_qi}), False),
        # (d) Generic coupled Q[i] tensor in C^3 hitting all 5 invariants non-degenerately:
        (
            "generic_qi",
            make_sym_tensor({
                (0, 0, 0): (Fraction(1), Fraction(1, 2)),
                (0, 1, 1): (Fraction(2, 3), Fraction(-1, 3)),
                (1, 1, 2): (Fraction(-1, 2), Fraction(3, 4)),
                (0, 2, 1): (Fraction(1, 3), Fraction(1, 5)),
                (2, 2, 0): (Fraction(1, 4), Fraction(-2, 5)),
            }),
            False,
        ),
    ]

    for name, t, is_e21 in tensors:
        dim = len(t)
        # Compute ctN, ctH, ctB, ctW, ctC directly from GramTensor.lean definitions:
        ct_n = [[zero_qi for _ in range(dim)] for _ in range(dim)]
        ct_h = [[zero_qi for _ in range(dim)] for _ in range(dim)]
        ct_b = [[zero_qi for _ in range(dim)] for _ in range(dim)]
        for a in range(dim):
            for b_i in range(dim):
                sn = zero_qi
                sh = zero_qi
                sb = zero_qi
                for i in range(dim):
                    for j in range(dim):
                        sn = qi_add(sn, qi_mul(t[i][a][j], qi_conj(t[i][b_i][j])))
                        sh = qi_add(sh, qi_mul(t[i][j][a], qi_conj(t[i][j][b_i])))
                        sb = qi_add(sb, qi_mul(t[i][a][j], t[j][b_i][i]))
                ct_n[a][b_i] = sn
                ct_h[a][b_i] = sh
                ct_b[a][b_i] = sb

        gn = sum(qi_norm_sq(ct_n[a][b_i]) for a in range(dim) for b_i in range(dim))
        gh = sum(qi_norm_sq(ct_h[a][b_i]) for a in range(dim) for b_i in range(dim))
        gb = sum(qi_norm_sq(ct_b[a][b_i]) for a in range(dim) for b_i in range(dim))
        gz = sum(qi_mul(ct_n[a][b_i], ct_h[a][b_i])[0] for a in range(dim) for b_i in range(dim))

        ct_w = [[[[zero_qi for _ in range(dim)] for _ in range(dim)] for _ in range(dim)] for _ in range(dim)]
        ct_c = [[[[zero_qi for _ in range(dim)] for _ in range(dim)] for _ in range(dim)] for _ in range(dim)]
        for i in range(dim):
            for j in range(dim):
                for k in range(dim):
                    for l in range(dim):
                        sw = zero_qi
                        sc = zero_qi
                        for a in range(dim):
                            sw = qi_add(sw, qi_mul(t[i][j][a], t[a][k][l]))
                            sc = qi_add(sc, qi_mul(t[i][a][k], qi_conj(t[l][a][j])))
                        ct_w[i][j][k][l] = sw
                        ct_c[i][j][k][l] = sc

        gt0 = sum(
            qi_mul(ct_w[i][k][j][l], qi_conj(ct_w[i][j][k][l]))[0]
            for i in range(dim) for j in range(dim) for k in range(dim) for l in range(dim)
        )
        gy = (gz + 2 * gt0) / 3

        c_mm_norm2 = Fraction(0)
        c_pp_norm2 = Fraction(0)
        for i in range(dim):
            for j in range(dim):
                for k in range(dim):
                    for l in range(dim):
                        v_mm = qi_add(
                            qi_sub(ct_c[i][j][k][l], ct_c[j][i][k][l]),
                            qi_sub(ct_c[j][i][l][k], ct_c[i][j][l][k]),
                        )
                        v_pp = qi_add(
                            qi_add(ct_c[i][j][k][l], ct_c[j][i][k][l]),
                            qi_add(ct_c[i][j][l][k], ct_c[j][i][l][k]),
                        )
                        c_mm_norm2 += qi_norm_sq(v_mm) / 16
                        c_pp_norm2 += qi_norm_sq(v_pp) / 16

        check(4 * c_mm_norm2 == gn + gb - (3 * gy - gz), f"4||C_--||^2 identity failed on {name}")
        check(4 * c_pp_norm2 == gn + gb + (3 * gy - gz), f"4||C_++||^2 identity failed on {name}")
        check(c_mm_norm2 >= 0, f"||C_--||^2 < 0 on {name}")
        pt_t = (gn, gh, gb, gy, gz)
        check(25 * eval_5sc(pt_t, u2) >= 9 * eval_5sc(pt_t, u4), f"25 u_2 >= 9 u_4 failed on {name}")
        check(8 * eval_5sc(pt_t, u2) >= 3 * eval_5sc(pt_t, v4), f"8 u_2 >= 3 v_4 failed on {name}")
        check(14 * eval_5sc(pt_t, u2) >= 3 * eval_5sc(pt_t, chi), f"14 u_2 >= 3 chi failed on {name}")
        if is_e21:
            check(25 * eval_5sc(pt_t, u2) == 9 * eval_5sc(pt_t, u4), "Sharpness 25 u_2 == 9 u_4 at e21 failed")
            check(8 * eval_5sc(pt_t, u2) == 3 * eval_5sc(pt_t, v4), "Sharpness 8 u_2 == 3 v_4 at e21 failed")
            check(14 * eval_5sc(pt_t, u2) == 3 * eval_5sc(pt_t, chi), "Sharpness 14 u_2 == 3 chi at e21 failed")

        # Independent Gaussian Wick polynomial check of CircularFourth.lean & GramSpectral.lean:
        # B(y) = sum_{i,j,k} t_{ijk} (y_i y_j ybar_k - delta_{ik} y_j - delta_{jk} y_i)
        b_poly = {}
        st_norm2 = Fraction(0)
        for i in range(dim):
            for j in range(dim):
                for k in range(dim):
                    t_val = t[i][j][k]
                    st_norm2 += qi_norm_sq(t_val)
                    if t_val[0] == 0 and t_val[1] == 0:
                        continue
                    a_exp = [0, 0, 0]
                    b_exp = [0, 0, 0]
                    a_exp[i] += 1
                    a_exp[j] += 1
                    b_exp[k] += 1
                    p_add_term(b_poly, (a_exp[0], a_exp[1], a_exp[2], b_exp[0], b_exp[1], b_exp[2]), t_val)
                    if wick_lin_scale != 0:
                        neg_t = (-wick_lin_scale * t_val[0], -wick_lin_scale * t_val[1])
                        if i == k:
                            l_exp = [0, 0, 0]
                            l_exp[j] += 1
                            p_add_term(b_poly, (l_exp[0], l_exp[1], l_exp[2], 0, 0, 0), neg_t)
                        if j == k:
                            l_exp = [0, 0, 0]
                            l_exp[i] += 1
                            p_add_term(b_poly, (l_exp[0], l_exp[1], l_exp[2], 0, 0, 0), neg_t)

        check(gauss_expect(b_poly) == zero_qi, f"E[B] != 0 on {name}")
        check(proj_norm_sq(b_poly, 1, 0) == 0 and proj_norm_sq(b_poly, 0, 1) == 0, f"B leaked into H_1 on {name}")
        mod_b2 = p_mul(b_poly, p_conj(b_poly))
        sq_b = p_mul(b_poly, b_poly)
        eb2_qi = gauss_expect(mod_b2)
        check(eb2_qi[1] == 0 and eb2_qi[0] == 2 * st_norm2, f"E|B|^2 != 2*sum|t|^2 on {name}")
        eb2 = eb2_qi[0]
        check(proj_norm_sq(b_poly, 2, 1) == eb2, f"||P_{{2,1}}(B)||^2 != E|B|^2 on {name}")
        eb4_qi = gauss_expect(p_mul(mod_b2, mod_b2))
        check(eb4_qi[1] == 0, f"Im E|B|^4 != 0 on {name}")
        eb4 = eb4_qi[0]
        u2_w = proj_norm_sq(mod_b2, 1, 1)
        u4_w = proj_norm_sq(mod_b2, 2, 2)
        u6_w = proj_norm_sq(mod_b2, 3, 3)
        v2_w = proj_norm_sq(sq_b, 2, 0)
        v4_w = proj_norm_sq(sq_b, 3, 1)
        check(eb4 - 2 * eb2 * eb2 == eval_5sc(pt_t, chi), f"CircularFourth chi mismatch on {name}")
        check(u2_w == eval_5sc(pt_t, u2), f"GramSpectral u_2 mismatch on {name}")
        check(u4_w == eval_5sc(pt_t, u4), f"GramSpectral u_4 mismatch on {name}")
        check(u6_w == eb2 * eb2 + 16 * gb + 16 * gz, f"u_6 = ||B||^4 + 16b + 16z mismatch on {name}")
        check(eb2 * eb2 + u2_w + u4_w + u6_w == eb4, f"Parseval on |B|^2 failed on {name}")
        check(v2_w == eval_5sc(pt_t, v2), f"GramSpectral v_2 mismatch on {name}")
        check(v4_w == eval_5sc(pt_t, v4), f"GramSpectral v_4 mismatch on {name}")
        if is_e21:
            # Unit spike e_{2,1}(y_0) has sum|t|^2 = 1/2 (eb2 = 1), scaling quartic expectations by 1/eb2^2 = 1/4:
            q_scale = eb2 * eb2
            check(
                (gn / q_scale, gh / q_scale, gb / q_scale, gy / q_scale, gz / q_scale)
                == (Fraction(1, 4), Fraction(1, 4), Fraction(1, 4), Fraction(1, 4), Fraction(1, 4)),
                "Unit e_{2,1} Lean contractions != (1/4, 1/4, 1/4, 1/4, 1/4)",
            )
            check(
                (u2_w / q_scale, u4_w / q_scale, u6_w / q_scale, v2_w / q_scale, v4_w / q_scale, (eb4 - 2 * q_scale) / q_scale)
                == (Fraction(9), Fraction(25), Fraction(9), Fraction(8), Fraction(24), Fraction(42)),
                "Unit e_{2,1} physical projections != (9, 25, 9, 8, 24, 42)",
            )

    # 5) Verify Theorem 3 exact 4-term SOS polynomial identity on all 4 basis vectors (C22, C11, C31, C20):
    for idx_c in range(4):
        c_vec = [Fraction(1 if k == idx_c else 0) for k in range(4)]
        c22, c11, c31, c20 = c_vec
        n_tot = 25 * c22 + 9 * c11 + 24 * c31 + 8 * c20
        lam1 = 112 * c22 + 672 * c31 - 448 * c20
        lam2 = -16 * c22 - 288 * c11 - 96 * c31 + 640 * c20
        lam3 = 1296 * c22 - 864 * c11 - 288 * c31 + 576 * c20
        lam4 = 32 * c22 - 96 * c11 + 192 * c31 + 64 * c20
        lhs_sos = lc([(n_tot, chi), (-42 * c22, u4), (-42 * c11, u2), (-42 * c31, v4), (-42 * c20, v2)])
        rhs_sos = lc([(lam1, cmm_4), (lam2, n_minus_b), (lam3, z_minus_y), (lam4, nh_diff_sq)])
        check(lhs_sos == rhs_sos, f"Theorem 3 4-term SOS identity failed on basis index {idx_c}")

    # 6) Common-normalisation one-direction Taylor / Fenchel-Young / Hessian check (§3 Q^{ret} definition):
    #    Verify that Re<dh, f0 + g0> + B(dh) - ||dh_adv||^2/eta + ||xi_def||^2/e1 (with NO extra 1/2 before B)
    #    matches both the exact second-order expansion of |A_+ + dh| + |A_- + dh| - |A_+| - |A_-| and the
    #    (P +- Q)/2 block formulas M22_re = 1/eta - (P00 - Q00)/2, M22_im = 1/eta - (P00 + Q00)/2,
    #    K11_dd = 1/e1 + (P00 - Q00)/2, and sup_x {g*x - M22_re*x^2} = g^2 / (4*M22_re).
    hess_scale = Fraction(1, 2) if gram_cone_flags.get("corrupt_hessian_half", False) else Fraction(1)
    # (6a) Canonical unit-phase test A_+ = A_- = a0 > 0, dh = x + i*t:
    #      |a0 + x + i*t| + |a0 + x + i*t| - 2*a0 = 2*sqrt((a0 + x)^2 + t^2) - 2*a0 = 2*x + t^2/a0 + O(|(x,t)|^3).
    for a0 in (Fraction(1), Fraction(3, 2)):
        for x_t, y_t in ((Fraction(0), Fraction(1)), (Fraction(2, 7), Fraction(-3, 5))):
            # Polynomial Taylor identity: (2*a0 + 2*x + t^2/a0)^2 - 4*((a0 + x)^2 + t^2) == 4*x*t^2/a0 + t^4/a0^2 (pure deg >= 3)
            approx_mod = 2 * a0 + 2 * x_t + (y_t * y_t) / a0
            exact_sq4 = 4 * ((a0 + x_t) * (a0 + x_t) + y_t * y_t)
            rem_deg34 = (4 * x_t * y_t * y_t) / a0 + (y_t ** 4) / (a0 * a0)
            check(approx_mod * approx_mod - exact_sq4 == rem_deg34, "Unit-phase modulus Taylor polynomial identity failed")
            quad_mod = (y_t * y_t) / a0
            b_val = hess_scale * ((y_t * y_t) / (2 * a0) + (y_t * y_t) / (2 * a0))
            p00_1d = Fraction(1, 2) / a0 + Fraction(1, 2) / a0
            q00_1d = Fraction(1, 2) / a0 + Fraction(1, 2) / a0
            pq_quad = ((p00_1d - q00_1d) / 2) * (x_t * x_t) + ((p00_1d + q00_1d) / 2) * (y_t * y_t)
            check(b_val == quad_mod == pq_quad, f"Hessian normalisation mismatch at a0={a0}: B={b_val}, Taylor={quad_mod}, PQ={pq_quad}")

    # (6b) Non-trivial conjugate-symmetric Pythagorean 2-point law A_+ in {3+4i, 3-4i} (|A_+|=5),
    #      A_- in {5-12i, 5+12i} (|A_-|=13), testing non-zero (P00 - Q00)/2, (P00 + Q00)/2, Fenchel-Young & saddle:
    pyth_states = (
        ((Fraction(3), Fraction(4)), Fraction(5), (Fraction(5), Fraction(-12)), Fraction(13)),
        ((Fraction(3), Fraction(-4)), Fraction(5), (Fraction(5), Fraction(12)), Fraction(13)),
    )
    p00_py = Fraction(0)
    q00_py = Fraction(0)
    g0_re = Fraction(0)
    for ap, rap, am, ram in pyth_states:
        check(qi_norm_sq(ap) == rap * rap and qi_norm_sq(am) == ram * ram, "Invalid Pythagorean state")
        ph_p = (ap[0] / rap, ap[1] / rap)
        ph_m = (am[0] / ram, am[1] / ram)
        g0_re += Fraction(1, 2) * (ph_p[0] + ph_m[0])
        p00_py += Fraction(1, 2) * (Fraction(1) / (2 * rap) + Fraction(1) / (2 * ram))
        ph_p_c2 = qi_mul(qi_conj(ph_p), qi_conj(ph_p))
        ph_m_c2 = qi_mul(qi_conj(ph_m), qi_conj(ph_m))
        q00_py += Fraction(1, 2) * (ph_p_c2[0] / (2 * rap) + ph_m_c2[0] / (2 * ram))

    eta_t = Fraction(1, 4)
    e1_t = Fraction(4, 5)
    dh_test = (Fraction(3, 7), Fraction(-2, 11))
    quad_taylor = Fraction(0)
    b_py = Fraction(0)
    for ap, rap, am, ram in pyth_states:
        for a_vec, ra in ((ap, rap), (am, ram)):
            ph_a = (a_vec[0] / ra, a_vec[1] / ra)
            prod = qi_mul(qi_conj(ph_a), dh_test)  # u + i*v = conj(ph A) * dh
            # sqrt(|A|^2 + 2*|A|*u + |dh|^2) - |A| = u + (|dh|^2 - u^2)/(2*|A|) + O(|dh|^3)
            quad_taylor += Fraction(1, 2) * ((qi_norm_sq(dh_test) - prod[0] * prod[0]) / (2 * ra))
            b_py += Fraction(1, 2) * ((prod[1] * prod[1]) / (2 * ra))

    pq_py = ((p00_py - q00_py) / 2) * (dh_test[0] ** 2) + ((p00_py + q00_py) / 2) * (dh_test[1] ** 2)
    check(hess_scale * b_py == quad_taylor == pq_py, "2-state Pythagorean Taylor / B(dh) / (P+-Q)/2 mismatch")
    # Fenchel-Young cost consistency for h = (f + g)/2: sup_{dh} {Re<dh, f+g> - ||dh||^2/eta} == eta * ||(f+g)/2||^2:
    h_re = g0_re / 2
    opt_dh_fy = eta_t * h_re
    check(opt_dh_fy * g0_re - (opt_dh_fy * opt_dh_fy) / eta_t == eta_t * (h_re * h_re), "Fenchel-Young 1/eta cost check failed")
    m22_re_py = Fraction(1) / eta_t - (p00_py - q00_py) / 2
    k11_dd_py = Fraction(1) / e1_t + (p00_py - q00_py) / 2
    opt_x = g0_re / (2 * m22_re_py)
    check(g0_re * opt_x - m22_re_py * (opt_x * opt_x) == (g0_re * g0_re) / (4 * m22_re_py), "Block 1 g^2/(4*M22_re) saddle check failed")
    check(k11_dd_py > Fraction(1) / e1_t, "Defender curvature K11_dd sign check failed")


# ============================================================================
# Layer 3: Zero-Float Outward-Rounded Jet2 Shifted-Polar Integrator
# ============================================================================

def build_r_data(r_j, params, is_jet=True):
    l_iv, beta_iv, bA_iv, bB_sq2, nu5_q, sig_iv = params
    if not is_jet:
        r2 = iv_sqr(r_j)
        r3 = iv_mul(r2, r_j)
        er2 = iv_exp_neg(r2)
        dens_r = iv_mul(FOUR_OVER_SQRTPI, iv_mul(r_j, er2))
        rm2 = iv_sub(r2, (2 * S, 2 * S))
        rm3 = iv_sub(r2, (3 * S, 3 * S))
        poly5 = iv_sub(iv_sqr(rm3), (3 * S, 3 * S))
        mu = iv_mul(r_j, iv_add(iv_add(l_iv, iv_mul(beta_iv, rm2)), iv_mul(nu5_q, poly5)))
        c0 = iv_add(ONE_IV, bA_iv)
        c_ax2 = iv_sub(iv_neg(bA_iv), bB_sq2)
        c_ay2 = iv_add(iv_neg(bA_iv), bB_sq2)
        ax = iv_mul(sig_iv, iv_add(c0, iv_mul(c_ax2, r2)))
        ay = iv_mul(sig_iv, iv_add(c0, iv_mul(c_ay2, r2)))
        et0 = r_j
        et1 = iv_mul(iv_mul(r_j, INV_SQ2), rm2)
        et2 = iv_mul(r3, INV_SQ6)
        etp = [r2, iv_mul(et0, et1), iv_sqr(et1), iv_sqr(et2), iv_mul(et0, et2), iv_mul(et1, et2)]
        pref = iv_mul(dens_r, iv_inv_pos(iv_mul(ax, ay)))
        return (mu, ax, ay, iv_sqr(ax), iv_sqr(ay), et0, et1, et2, etp, pref)
    r2 = j_sqr(r_j)
    r3 = j_mul(r2, r_j)
    er2 = j_exp_neg(r2)
    dens_r = j_scale_iv(j_mul(r_j, er2), FOUR_OVER_SQRTPI)
    rm2 = j_sub(r2, j_const((2 * S, 2 * S)))
    rm3 = j_sub(r2, j_const((3 * S, 3 * S)))
    poly5 = j_sub(j_sqr(rm3), j_const((3 * S, 3 * S)))
    mu = j_mul(r_j, j_add(j_add(j_const(l_iv), j_scale_iv(rm2, beta_iv)), j_scale_iv(poly5, nu5_q)))
    c0 = j_const(iv_add(ONE_IV, bA_iv))
    c_ax2 = iv_sub(iv_neg(bA_iv), bB_sq2)
    c_ay2 = iv_add(iv_neg(bA_iv), bB_sq2)
    ax = j_scale_iv(j_add(c0, j_scale_iv(r2, c_ax2)), sig_iv)
    ay = j_scale_iv(j_add(c0, j_scale_iv(r2, c_ay2)), sig_iv)
    et0 = r_j
    et1 = j_mul(j_scale_iv(r_j, INV_SQ2), rm2)
    et2 = j_scale_iv(r3, INV_SQ6)
    etp = [r2, j_mul(et0, et1), j_sqr(et1), j_sqr(et2), j_mul(et0, et2), j_mul(et1, et2)]
    pref = j_mul(dens_r, j_inv_pos(j_mul(ax, ay)))
    return (mu, ax, ay, j_sqr(ax), j_sqr(ay), et0, et1, et2, etp, pref)


def build_w_data(w_j, is_jet=True):
    if not is_jet:
        w2 = iv_sqr(w_j)
        inv_1pw2 = iv_inv_pos(iv_add(ONE_IV, w2))
        cp = iv_mul(iv_sub(ONE_IV, w2), inv_1pw2)
        sp = iv_scale_int(iv_mul(w_j, inv_1pw2), 2)
        cp2 = iv_sqr(cp)
        sp2 = iv_sqr(sp)
        c2p = iv_sub(cp2, sp2)
        jac_w = iv_scale_int(inv_1pw2, 2)
        return (cp, sp, cp2, sp2, c2p, jac_w)
    w2 = j_sqr(w_j)
    inv_1pw2 = j_inv_pos(j_add(j_const(ONE_IV), w2))
    cp = j_mul(j_sub(j_const(ONE_IV), w2), inv_1pw2)
    sp = j_scale_int(j_mul(w_j, inv_1pw2), 2)
    cp2 = j_sqr(cp)
    sp2 = j_sqr(sp)
    c2p = j_sub(cp2, sp2)
    jac_w = j_scale_int(inv_1pw2, 2)
    return (cp, sp, cp2, sp2, c2p, jac_w)


def eval_18(rd, wd, mode):
    if mode == "sc":
        add, sub, mul, sqr, inv_p, sqrt_p, exp_n, sc_int, dv_int = (
            iv_add, iv_sub, iv_mul, iv_sqr, iv_inv_pos, iv_sqrt_pos, iv_exp_neg, iv_scale_int, iv_div_int
        )
        c_half = (S // 2, S // 2)
        c_32 = ((3 * S) // 2, (3 * S) // 2)
        c_14 = (S // 4, S // 4)
        mu, ax, ay, ax2, ay2, et0, et1, et2, etp, pref = rd
        cp, sp, cp2, sp2, c2p, jac_w = wd
    else:
        add, sub, mul, sqr, inv_p, sqrt_p, exp_n, sc_int, dv_int = (
            j_add, j_sub, j_mul, j_sqr, j_inv_pos, j_sqrt_pos, j_exp_neg, j_scale_int, j_div_int
        )
        c_half = j_const((S // 2, S // 2))
        c_32 = j_const(((3 * S) // 2, (3 * S) // 2))
        c_14 = j_const((S // 4, S // 4))
        if mode == "jr":
            mu, ax, ay, ax2, ay2, et0, et1, et2, etp, pref = rd
            cp, sp, cp2, sp2, c2p, jac_w = [j_const(x) for x in wd]
        else:
            mu, ax, ay, ax2, ay2, et0, et1, et2, etp, pref = [
                [j_const(x) for x in rd[8]] if idx == 8 else j_const(rd[idx]) for idx in range(10)
            ]
            cp, sp, cp2, sp2, c2p, jac_w = wd

    inv_ax2 = inv_p(ax2)
    inv_ay2 = inv_p(ay2)
    A = add(mul(cp2, inv_ax2), mul(sp2, inv_ay2))
    inv_A = inv_p(A)
    sA = sqrt_p(A)
    inv_sA = inv_p(sA)
    mu2 = sqr(mu)
    D0 = mul(mul(mu2, sp2), mul(mul(inv_ax2, inv_ay2), inv_A))
    eD0 = exp_n(D0)
    wt = mul(mul(pref, jac_w), eD0)

    s = mul(mul(mu, cp), mul(inv_ax2, inv_sA))
    s2 = sqr(s)

    D0_m_half = sub(D0, c_half)
    ev_Q = sub(sqr(sub(D0, c_32)), c_32)
    ev_v2Q = sub(dv_int(sqr(D0_m_half), 2), c_14)
    tot_Q = add(ev_v2Q, mul(s2, ev_Q))
    kd = dv_int(mul(wt, mul(tot_Q, mul(inv_A, inv_sA))), 2)
    kd = (-kd[1], -kd[0]) if mode == "sc" else j_neg(kd)

    g1_core = sc_int(mul(wt, mul(mul(s, cp), mul(D0_m_half, inv_A))), 2)
    g1_0 = mul(g1_core, et0)
    g1_1 = mul(g1_core, et1)

    inv_ax = inv_p(ax)
    inv_ay = inv_p(ay)
    a_wx = mul(cp, mul(inv_ax, inv_sA))
    b_wx_pos = mul(mul(mu, sp2), mul(mul(inv_ax, inv_ay2), inv_A))
    b_wx = (-b_wx_pos[1], -b_wx_pos[0]) if mode == "sc" else j_neg(b_wx_pos)
    a_wy = mul(sp, mul(inv_ay, inv_sA))
    b_wy = mul(mul(s, sp), mul(inv_ay, inv_sA))

    p2 = sub(sqr(a_wx), sqr(a_wy))
    p1 = sc_int(sub(mul(a_wx, b_wx), mul(a_wy, b_wy)), 2)
    p0 = sub(sqr(b_wx), sqr(b_wy))
    int_wxwy = mul(add(dv_int(p1, 2), mul(s, add(dv_int(p2, 2), p0))), inv_A)

    q2w = sc_int(mul(a_wx, a_wy), 2)
    q1w = sc_int(add(mul(a_wx, b_wy), mul(a_wy, b_wx)), 2)
    q0w = sc_int(mul(b_wx, b_wy), 2)
    int_2wxwy = mul(add(dv_int(q1w, 2), mul(s, add(dv_int(q2w, 2), q0w))), inv_A)

    tcp = mul(cp, int_wxwy)
    tsp = mul(sp, int_2wxwy)
    re_p2 = mul(wt, add(tcp, tsp))
    re_m2 = mul(wt, sub(tcp, tsp))
    m2_0 = mul(et0, re_p2)
    m2_1 = mul(et1, re_p2)
    m2_2 = mul(et2, re_m2)

    wt_invsA = mul(wt, inv_sA)
    wt_Q = mul(wt_invsA, c2p)
    Pp = [mul(wt_invsA, ep) for ep in etp]
    Qp = [mul(wt_Q, ep) for ep in etp]

    out = [kd, g1_0, g1_1, m2_0, m2_1, m2_2] + Pp + Qp
    if mode == "sc":
        return out
    return [x[2] for x in out]


def eval_5_gm_sc(rd, wd):
    mu, ax, ay, ax2, ay2, et0, et1, et2, _, pref = rd
    cp, sp, cp2, sp2, _, jac_w = wd
    inv_ax2 = iv_inv_pos(ax2)
    inv_ay2 = iv_inv_pos(ay2)
    A = iv_add(iv_mul(cp2, inv_ax2), iv_mul(sp2, inv_ay2))
    inv_A = iv_inv_pos(A)
    sA = iv_sqrt_pos(A)
    inv_sA = iv_inv_pos(sA)
    D0 = iv_mul(iv_mul(iv_sqr(mu), sp2), iv_mul(iv_mul(inv_ax2, inv_ay2), inv_A))
    wt = iv_mul(iv_mul(pref, jac_w), iv_exp_neg(D0))
    s = iv_mul(iv_mul(mu, cp), iv_mul(inv_ax2, inv_sA))

    D0_m_half = iv_sub(D0, (S // 2, S // 2))
    g1_core = iv_scale_int(iv_mul(wt, iv_mul(iv_mul(s, cp), iv_mul(D0_m_half, inv_A))), 2)
    g1_0 = iv_mul(g1_core, et0)
    g1_1 = iv_mul(g1_core, et1)

    inv_ax = iv_inv_pos(ax)
    inv_ay = iv_inv_pos(ay)
    a_wx = iv_mul(cp, iv_mul(inv_ax, inv_sA))
    b_wx_pos = iv_mul(iv_mul(mu, sp2), iv_mul(iv_mul(inv_ax, inv_ay2), inv_A))
    b_wx = (-b_wx_pos[1], -b_wx_pos[0])
    a_wy = iv_mul(sp, iv_mul(inv_ay, inv_sA))
    b_wy = iv_mul(iv_mul(s, sp), iv_mul(inv_ay, inv_sA))

    p2 = iv_sub(iv_sqr(a_wx), iv_sqr(a_wy))
    p1 = iv_scale_int(iv_sub(iv_mul(a_wx, b_wx), iv_mul(a_wy, b_wy)), 2)
    p0 = iv_sub(iv_sqr(b_wx), iv_sqr(b_wy))
    int_wxwy = iv_mul(iv_add(iv_div_int(p1, 2), iv_mul(s, iv_add(iv_div_int(p2, 2), p0))), inv_A)

    q2w = iv_scale_int(iv_mul(a_wx, a_wy), 2)
    q1w = iv_scale_int(iv_add(iv_mul(a_wx, b_wy), iv_mul(a_wy, b_wx)), 2)
    q0w = iv_scale_int(iv_mul(b_wx, b_wy), 2)
    int_2wxwy = iv_mul(iv_add(iv_div_int(q1w, 2), iv_mul(s, iv_add(iv_div_int(q2w, 2), q0w))), inv_A)

    tcp = iv_mul(cp, int_wxwy)
    tsp = iv_mul(sp, int_2wxwy)
    re_p2 = iv_mul(wt, iv_add(tcp, tsp))
    re_m2 = iv_mul(wt, iv_sub(tcp, tsp))
    return (g1_0, g1_1, iv_mul(et0, re_p2), iv_mul(et1, re_p2), iv_mul(et2, re_m2))


def eval_5_gm_jw(rd, wd_j):
    mu = j_const(rd[0])
    inv_ax = j_const(iv_inv_pos(rd[1]))
    inv_ay = j_const(iv_inv_pos(rd[2]))
    inv_ax2 = j_const(iv_inv_pos(rd[3]))
    inv_ay2 = j_const(iv_inv_pos(rd[4]))
    et0 = j_const(rd[5])
    et1 = j_const(rd[6])
    et2 = j_const(rd[7])
    pref = j_const(rd[9])
    cp, sp, cp2, sp2, _, jac_w = wd_j

    A = j_add(j_mul(cp2, inv_ax2), j_mul(sp2, inv_ay2))
    inv_A = j_inv_pos(A)
    sA = j_sqrt_pos(A)
    inv_sA = j_inv_pos(sA)
    D0 = j_mul(j_mul(j_sqr(mu), sp2), j_mul(j_mul(inv_ax2, inv_ay2), inv_A))
    wt = j_mul(j_mul(pref, jac_w), j_exp_neg(D0))
    s = j_mul(j_mul(mu, cp), j_mul(inv_ax2, inv_sA))

    D0_m_half = j_sub(D0, j_const((S // 2, S // 2)))
    g1_core = j_scale_int(j_mul(wt, j_mul(j_mul(s, cp), j_mul(D0_m_half, inv_A))), 2)
    g1_0 = j_mul(g1_core, et0)
    g1_1 = j_mul(g1_core, et1)

    a_wx = j_mul(cp, j_mul(inv_ax, inv_sA))
    b_wx = j_neg(j_mul(j_mul(mu, sp2), j_mul(j_mul(inv_ax, inv_ay2), inv_A)))
    a_wy = j_mul(sp, j_mul(inv_ay, inv_sA))
    b_wy = j_mul(j_mul(s, sp), j_mul(inv_ay, inv_sA))

    p2 = j_sub(j_sqr(a_wx), j_sqr(a_wy))
    p1 = j_scale_int(j_sub(j_mul(a_wx, b_wx), j_mul(a_wy, b_wy)), 2)
    p0 = j_sub(j_sqr(b_wx), j_sqr(b_wy))
    int_wxwy = j_mul(j_add(j_div_int(p1, 2), j_mul(s, j_add(j_div_int(p2, 2), p0))), inv_A)

    q2w = j_scale_int(j_mul(a_wx, a_wy), 2)
    q1w = j_scale_int(j_add(j_mul(a_wx, b_wy), j_mul(a_wy, b_wx)), 2)
    q0w = j_scale_int(j_mul(b_wx, b_wy), 2)
    int_2wxwy = j_mul(j_add(j_div_int(q1w, 2), j_mul(s, j_add(j_div_int(q2w, 2), q0w))), inv_A)

    tcp = j_mul(cp, int_wxwy)
    tsp = j_mul(sp, int_2wxwy)
    re_p2 = j_mul(wt, j_add(tcp, tsp))
    re_m2 = j_mul(wt, j_sub(tcp, tsp))
    out = (g1_0, g1_1, j_mul(et0, re_p2), j_mul(et1, re_p2), j_mul(et2, re_m2))
    return tuple(x[2] for x in out)


def eval_18_tail_box(rsc, wlo_f, whi_f):
    mu, ax, ay, ax2, ay2, et0, et1, et2, etp, pref = rsc

    def cot_f(wf):
        return (1 - wf * wf) / (2 * wf)

    cot_iv = (to_iv(cot_f(whi_f))[0], to_iv(cot_f(wlo_f))[1])
    cot2 = iv_sqr(cot_iv)
    denom_D0 = iv_add(ax2, iv_mul(ay2, cot2))
    D0 = iv_div_pos(iv_sqr(mu), denom_D0)
    check(D0[0] >= 3 * S, "eval_18_tail_box requires D0_lo >= 3")

    def cp_f(wf):
        return (1 - wf * wf) / (1 + wf * wf)

    def sp_f(wf):
        return (2 * wf) / (1 + wf * wf)

    def jac_f(wf):
        return 2 / (1 + wf * wf)

    cp = (to_iv(cp_f(whi_f))[0], to_iv(cp_f(wlo_f))[1])
    sp = (to_iv(sp_f(wlo_f))[0], to_iv(sp_f(whi_f))[1])
    cp2 = iv_sqr(cp)
    sp2 = iv_sqr(sp)
    c2p = iv_sub(cp2, sp2)
    jac_w = (to_iv(jac_f(whi_f))[0], to_iv(jac_f(wlo_f))[1])

    inv_ax2 = iv_inv_pos(ax2)
    inv_ay2 = iv_inv_pos(ay2)
    # Exact convex-combination range since cos^2(phi) + sin^2(phi) == 1 identically:
    A = (min(inv_ax2[0], inv_ay2[0]), max(inv_ax2[1], inv_ay2[1]))
    inv_A = iv_inv_pos(A)
    sA = iv_sqrt_pos(A)
    inv_sA = iv_inv_pos(sA)

    eD0_hi = iv_exp_neg((D0[0], D0[0]))[1]
    wt_hi = (((pref[1] * jac_w[1] + S - 1) // S) * eD0_hi + S - 1) // S
    wt = (0, wt_hi)
    s = iv_mul(iv_mul(mu, cp), iv_mul(inv_ax2, inv_sA))
    s2_hi = iv_sqr(s)[1]

    # Monotone bounds for D0 >= D0_lo >= 3: D0^2 e^{-D0} <= D0_lo^2 e^{-D0_lo} and D0 e^{-D0} <= D0_lo e^{-D0_lo}
    D0_lo_sq = iv_sqr((D0[0], D0[0]))[1]
    fac_kd_hi = ((S // 2 + s2_hi) * D0_lo_sq + S - 1) // S
    inva32_hi = (inv_A[1] * inv_sA[1] + S - 1) // S
    kd_mag_hi = ((((wt_hi * fac_kd_hi + S - 1) // S) * inva32_hi + S - 1) // S + 1) // 2
    kd = (-kd_mag_hi, 0)

    s_abs_hi = max(abs(s[0]), abs(s[1]))
    g1_mag = 2 * (((((wt_hi * s_abs_hi + S - 1) // S) * cp[1] + S - 1) // S) * ((D0[0] * inv_A[1] + S - 1) // S) + S - 1) // S
    g1_core = (-g1_mag, g1_mag)
    g1_0 = iv_mul(g1_core, et0)
    g1_1 = iv_mul(g1_core, et1)

    inv_ax = iv_inv_pos(ax)
    inv_ay = iv_inv_pos(ay)
    a_wx = iv_mul(cp, iv_mul(inv_ax, inv_sA))
    b_wx_pos = iv_mul(iv_mul(mu, sp2), iv_mul(iv_mul(inv_ax, inv_ay2), inv_A))
    b_wx = (-b_wx_pos[1], -b_wx_pos[0])
    a_wy = iv_mul(sp, iv_mul(inv_ay, inv_sA))
    b_wy = iv_mul(iv_mul(s, sp), iv_mul(inv_ay, inv_sA))

    p2 = iv_sub(iv_sqr(a_wx), iv_sqr(a_wy))
    p1 = iv_scale_int(iv_sub(iv_mul(a_wx, b_wx), iv_mul(a_wy, b_wy)), 2)
    p0 = iv_sub(iv_sqr(b_wx), iv_sqr(b_wy))
    int_wxwy = iv_mul(iv_add(iv_div_int(p1, 2), iv_mul(s, iv_add(iv_div_int(p2, 2), p0))), inv_A)

    q2w = iv_scale_int(iv_mul(a_wx, a_wy), 2)
    q1w = iv_scale_int(iv_add(iv_mul(a_wx, b_wy), iv_mul(a_wy, b_wx)), 2)
    q0w = iv_scale_int(iv_mul(b_wx, b_wy), 2)
    int_2wxwy = iv_mul(iv_add(iv_div_int(q1w, 2), iv_mul(s, iv_add(iv_div_int(q2w, 2), q0w))), inv_A)

    tcp = iv_mul(cp, int_wxwy)
    tsp = iv_mul(sp, int_2wxwy)
    re_p2 = iv_mul(wt, iv_add(tcp, tsp))
    re_m2 = iv_mul(wt, iv_sub(tcp, tsp))
    m2_0 = iv_mul(et0, re_p2)
    m2_1 = iv_mul(et1, re_p2)
    m2_2 = iv_mul(et2, re_m2)

    wt_invsA = iv_mul(wt, inv_sA)
    wt_Q = iv_mul(wt_invsA, c2p)
    Pp = [iv_mul(wt_invsA, ep) for ep in etp]
    Qp = [iv_mul(wt_Q, ep) for ep in etp]
    return [kd, g1_0, g1_1, m2_0, m2_1, m2_2] + Pp + Qp


def eval_kd_sc_fast(rd, wd):
    mu, inv_ax2, inv_ay2, pref = rd
    cp, cp2, sp2, jac_w = wd
    t1_lo = (cp2[0] * inv_ax2[0]) // S
    t1_hi = (cp2[1] * inv_ax2[1] + S - 1) // S
    t2_lo = (sp2[0] * inv_ay2[0]) // S
    t2_hi = (sp2[1] * inv_ay2[1] + S - 1) // S
    A_lo = t1_lo + t2_lo
    A_hi = t1_hi + t2_hi
    invA_lo = S2 // A_hi
    invA_hi = (S2 + A_lo - 1) // A_lo
    sA_lo = isqrt(A_lo * S)
    sA_hi = isqrt_ceil(A_hi * S)
    invsA_lo = S2 // sA_hi
    invsA_hi = (S2 + sA_lo - 1) // sA_lo

    mu2 = iv_sqr(mu)
    iaxy_lo = (inv_ax2[0] * inv_ay2[0]) // S
    iaxy_hi = (inv_ax2[1] * inv_ay2[1] + S - 1) // S
    ms_lo = (mu2[0] * sp2[0]) // S
    ms_hi = (mu2[1] * sp2[1] + S - 1) // S
    ia_lo = (iaxy_lo * invA_lo) // S
    ia_hi = (iaxy_hi * invA_hi + S - 1) // S
    D0 = ((ms_lo * ia_lo) // S, (ms_hi * ia_hi + S - 1) // S)

    eD0 = iv_exp_neg(D0)
    pj_lo = (pref[0] * jac_w[0]) // S
    pj_hi = (pref[1] * jac_w[1] + S - 1) // S
    wt = ((pj_lo * eD0[0]) // S, (pj_hi * eD0[1] + S - 1) // S)

    inv_ax4_lo = (inv_ax2[0] * inv_ax2[0]) // S
    inv_ax4_hi = (inv_ax2[1] * inv_ax2[1] + S - 1) // S
    mc_lo = (mu2[0] * cp2[0]) // S
    mc_hi = (mu2[1] * cp2[1] + S - 1) // S
    s2 = (((mc_lo * inv_ax4_lo) // S * invA_lo) // S, (((mc_hi * inv_ax4_hi + S - 1) // S) * invA_hi + S - 1) // S)

    c_half = S // 2
    c_32 = (3 * S) // 2
    c_14 = S // 4
    sq_32 = iv_sqr((D0[0] - c_32, D0[1] - c_32))
    ev_Q = (sq_32[0] - c_32, sq_32[1] - c_32)
    sq_12 = iv_sqr((D0[0] - c_half, D0[1] - c_half))
    ev_v2Q = (sq_12[0] // 2 - c_14, (sq_12[1] + 1) // 2 - c_14)

    tot_Q = iv_add(ev_v2Q, iv_mul(s2, ev_Q))
    inva32 = ((invA_lo * invsA_lo) // S, (invA_hi * invsA_hi + S - 1) // S)
    prod = iv_mul(wt, iv_mul(tot_Q, inva32))
    kd_pos = iv_div_int(prod, 2)
    return (-kd_pos[1], -kd_pos[0])


def eval_kd_jet_only(rd, wd, mode):
    c_half = j_const((S // 2, S // 2))
    c_32 = j_const(((3 * S) // 2, (3 * S) // 2))
    c_14 = j_const((S // 4, S // 4))
    if mode == "jr":
        mu, inv_ax2, inv_ay2, pref = rd
        cp, cp2, sp2, jac_w = [j_const(x) for x in wd]
    else:
        mu, inv_ax2, inv_ay2, pref = [j_const(x) for x in rd]
        cp, cp2, sp2, jac_w = wd
    A = j_add(j_mul(cp2, inv_ax2), j_mul(sp2, inv_ay2))
    inv_A = j_inv_pos(A)
    sA = j_sqrt_pos(A)
    inv_sA = j_inv_pos(sA)
    mu2 = j_sqr(mu)
    D0 = j_mul(j_mul(mu2, sp2), j_mul(j_mul(inv_ax2, inv_ay2), inv_A))
    wt = j_mul(j_mul(pref, jac_w), j_exp_neg(D0))
    s2 = j_mul(j_mul(mu2, cp2), j_mul(j_sqr(inv_ax2), inv_A))
    ev_Q = j_sub(j_sqr(j_sub(D0, c_32)), c_32)
    ev_v2Q = j_sub(j_div_int(j_sqr(j_sub(D0, c_half)), 2), c_14)
    tot_Q = j_add(ev_v2Q, j_mul(s2, ev_Q))
    kd = j_div_int(j_mul(wt, j_mul(tot_Q, j_mul(inv_A, inv_sA))), 2)
    return (-kd[2][1], -kd[2][0])


def build_kd_r_only(r_j, params, is_jet):
    l_iv, beta_iv, bA_iv, bB_sq2, nu5_q, sig_iv = params
    if not is_jet:
        r2 = iv_sqr(r_j)
        dens_r = iv_mul(FOUR_OVER_SQRTPI, iv_mul(r_j, iv_exp_neg(r2)))
        rm2 = iv_sub(r2, (2 * S, 2 * S))
        rm3 = iv_sub(r2, (3 * S, 3 * S))
        poly5 = iv_sub(iv_sqr(rm3), (3 * S, 3 * S))
        mu = iv_mul(r_j, iv_add(iv_add(l_iv, iv_mul(beta_iv, rm2)), iv_mul(nu5_q, poly5)))
        c0 = iv_add(ONE_IV, bA_iv)
        c_ax2 = iv_sub(iv_neg(bA_iv), bB_sq2)
        c_ay2 = iv_add(iv_neg(bA_iv), bB_sq2)
        ax = iv_mul(sig_iv, iv_add(c0, iv_mul(c_ax2, r2)))
        ay = iv_mul(sig_iv, iv_add(c0, iv_mul(c_ay2, r2)))
        return (mu, iv_inv_pos(iv_sqr(ax)), iv_inv_pos(iv_sqr(ay)), iv_mul(dens_r, iv_inv_pos(iv_mul(ax, ay))))
    r2 = j_sqr(r_j)
    dens_r = j_scale_iv(j_mul(r_j, j_exp_neg(r2)), FOUR_OVER_SQRTPI)
    rm2 = j_sub(r2, j_const((2 * S, 2 * S)))
    rm3 = j_sub(r2, j_const((3 * S, 3 * S)))
    poly5 = j_sub(j_sqr(rm3), j_const((3 * S, 3 * S)))
    mu = j_mul(r_j, j_add(j_add(j_const(l_iv), j_scale_iv(rm2, beta_iv)), j_scale_iv(poly5, nu5_q)))
    c0 = j_const(iv_add(ONE_IV, bA_iv))
    c_ax2 = iv_sub(iv_neg(bA_iv), bB_sq2)
    c_ay2 = iv_add(iv_neg(bA_iv), bB_sq2)
    ax = j_scale_iv(j_add(c0, j_scale_iv(r2, c_ax2)), sig_iv)
    ay = j_scale_iv(j_add(c0, j_scale_iv(r2, c_ay2)), sig_iv)
    return (mu, j_inv_pos(j_sqr(ax)), j_inv_pos(j_sqr(ay)), j_mul(dens_r, j_inv_pos(j_mul(ax, ay))))


def build_kd_w_only(w_j, is_jet):
    if not is_jet:
        w2 = iv_sqr(w_j)
        inv_1pw2 = iv_inv_pos(iv_add(ONE_IV, w2))
        cp = iv_mul(iv_sub(ONE_IV, w2), inv_1pw2)
        sp = iv_scale_int(iv_mul(w_j, inv_1pw2), 2)
        return (cp, iv_sqr(cp), iv_sqr(sp), iv_scale_int(inv_1pw2, 2))
    w2 = j_sqr(w_j)
    inv_1pw2 = j_inv_pos(j_add(j_const(ONE_IV), w2))
    cp = j_mul(j_sub(j_const(ONE_IV), w2), inv_1pw2)
    sp = j_scale_int(j_mul(w_j, inv_1pw2), 2)
    return (cp, j_sqr(cp), j_sqr(sp), j_scale_int(inv_1pw2, 2))


def find_w_top(rsc, w_edges):
    r2_lo = rsc[8][0][0]
    mu2_lo = iv_sqr(rsc[0])[0]
    ax2_hi = rsc[3][1]
    ay2_hi = rsc[4][1]
    if mu2_lo <= 0:
        return Fraction(1, 1)
    for wc in w_edges[1:-1]:
        cot_hi = to_iv((1 - wc * wc) / (2 * wc))[1]
        cot2_hi = (cot_hi * cot_hi + S - 1) // S
        den_hi = ax2_hi + (ay2_hi * cot2_hi + S - 1) // S
        D0_lo_wc = (mu2_lo * S) // den_hi
        if r2_lo + D0_lo_wc >= 28 * S:
            return wc
    return Fraction(1, 1)


def integrate_and_certify_row(row_spec):
    t0 = time.time()
    e1_f = parse_frac(row_spec["e1"])
    eta_f = parse_frac(row_spec["eta"])
    l_f = parse_frac(row_spec["l"])
    beta_f = parse_frac(row_spec["beta"])
    bA_f = parse_frac(row_spec["bA"])
    bB_f = parse_frac(row_spec["bB"])
    nu5_f = parse_frac(row_spec["nu5"])
    sig_f = parse_frac(row_spec["sig"])

    # Mandatory domain positivity checks for shifted-polar non-singularity on r in [0, +inf):
    # alpha_x(r)/sig = (1 + b_A) + (-b_A - b_B/sqrt(2)) r^2 >= 1 + b_A > 0,
    # alpha_y(r)/sig = (1 + b_A) + (-b_A + b_B/sqrt(2)) r^2 >= 1 + b_A > 0!
    check(sig_f > 0, f"{row_spec['id']}: sig <= 0")
    check(1 + bA_f > 0, f"{row_spec['id']}: 1 + b_A <= 0")
    check(bA_f < 0 and 2 * (bA_f * bA_f) > bB_f * bB_f, f"{row_spec['id']}: -b_A <= |b_B|/sqrt(2)")
    check(0 < eta_f < e1_f < 1, f"{row_spec['id']}: invalid game weights (e1, eta)")
    # Explicit parameter bounds used in the analytic r >= 5 tail proof (PROOF.md §4.2):
    check(
        abs(l_f) <= 1 and abs(beta_f) <= Fraction(1, 5) and abs(nu5_f) <= Fraction(1, 20)
        and sig_f <= Fraction(1, 2) and abs(bA_f) <= Fraction(1, 5) and abs(bB_f) <= Fraction(1, 5),
        f"{row_spec['id']}: row parameters outside analytic r >= 5 tail box",
    )

    bB_sq2 = iv_mul(to_iv(bB_f), INV_SQ2)
    bA_iv = to_iv(bA_f)
    check(iv_sub(iv_neg(bA_iv), bB_sq2)[0] > 0, f"{row_spec['id']}: interval c_ax2 <= 0")
    check(iv_add(iv_neg(bA_iv), bB_sq2)[0] > 0, f"{row_spec['id']}: interval c_ay2 <= 0")

    params = (
        to_iv(l_f),
        to_iv(beta_f),
        bA_iv,
        bB_sq2,
        iv_mul(to_iv(nu5_f), INV_2SQ3),
        to_iv(sig_f),
    )

    mesh = row_spec["mesh"]
    nr_kd1, nr_kd2 = mesh["nr_kd1"], mesh["nr_kd2"]
    nw_kd1, nw_kd2 = mesh["nw_kd1"], mesh["nw_kd2"]
    Kr_kd, Kw_kd = mesh["Kr_kd"], mesh["Kw_kd"]
    nr_g1, nr_g2 = mesh["nr_g1"], mesh["nr_g2"]
    nw_g1, nw_g2 = mesh["nw_g1"], mesh["nw_g2"]
    Kr_g, Kw_g = mesh["Kr_g"], mesh["Kw_g"]

    r_ed_kd = [Fraction(3 * i, nr_kd1) for i in range(nr_kd1)] + [Fraction(3, 1) + Fraction(2 * i, nr_kd2) for i in range(nr_kd2 + 1)]
    w_ed_kd = [Fraction(j, 2 * nw_kd1) for j in range(nw_kd1)] + [Fraction(1, 2) + Fraction(j, 2 * nw_kd2) for j in range(nw_kd2 + 1)]

    wp_kd = []
    for j in range(len(w_ed_kd) - 1):
        wlo, whi = w_ed_kd[j], w_ed_kd[j + 1]
        dw = whi - wlo
        hw = dw / (2 * Kw_kd)
        wiv = (to_iv(wlo)[0], to_iv(whi)[1])
        wj = build_kd_w_only(j_var(wiv), True)
        wsc = build_kd_w_only(wiv, False)
        wms = [build_kd_w_only(to_iv(wlo + (2 * b + 1) * hw), False) for b in range(Kw_kd)]
        wp_kd.append((wlo, whi, dw, to_iv((hw * hw) / 3)[1], wj, wsc, wms))

    kd = [0, 0]
    w_cand_kd = [Fraction(0, 1)] + w_ed_kd[4:-1:4] + [Fraction(1, 1)]
    for i in range(len(r_ed_kd) - 1):
        rlo, rhi = r_ed_kd[i], r_ed_kd[i + 1]
        dr = rhi - rlo
        hr = dr / (2 * Kr_kd)
        riv = (to_iv(rlo)[0], to_iv(rhi)[1])
        rsc_full = build_r_data(riv, params, False)
        w_top = find_w_top(rsc_full, w_cand_kd)
        if w_top < 1:
            t_area = to_iv(dr * (1 - w_top))
            t_kd = eval_18_tail_box(rsc_full, w_top, Fraction(1, 1))[0]
            mp_t = iv_mul(t_area, t_kd)
            kd[0] += mp_t[0]
            kd[1] += mp_t[1]

        rj = build_kd_r_only(j_var(riv), params, True)
        rms = [build_kd_r_only(to_iv(rlo + (2 * a + 1) * hr), params, False) for a in range(Kr_kd)]
        hr2 = to_iv((hr * hr) / 3)[1]

        for wlo, _, dw, hw2, wj, wsc, wms in wp_kd:
            if wlo >= w_top:
                break
            p_area_hi = to_iv(dr * dw)[1]
            s_area = to_iv((dr * dw) / (Kr_kd * Kw_kd))
            d2r = eval_kd_jet_only(rj, wsc, "jr")
            mr = max(abs(d2r[0]), abs(d2r[1]))
            mw_max = 0
            sm_lo = 0
            sm_hi = 0
            for rm_d in rms:
                d2w = eval_kd_jet_only(rm_d, wj, "jw")
                mw = max(abs(d2w[0]), abs(d2w[1]))
                if mw > mw_max:
                    mw_max = mw
                for wm_d in wms:
                    v = eval_kd_sc_fast(rm_d, wm_d)
                    sm_lo += v[0]
                    sm_hi += v[1]
            err_u = (hr2 * mr + S - 1) // S + (hw2 * mw_max + S - 1) // S
            err_t = (p_area_hi * err_u + S - 1) // S
            mp = iv_mul(s_area, (sm_lo, sm_hi))
            kd[0] += mp[0] - err_t
            kd[1] += mp[1] + err_t

    r_ed_g = [Fraction(3 * i, nr_g1) for i in range(nr_g1)] + [Fraction(3, 1) + Fraction(2 * i, nr_g2) for i in range(nr_g2 + 1)]
    w_ed_g = [Fraction(j, 2 * nw_g1) for j in range(nw_g1)] + [Fraction(1, 2) + Fraction(j, 2 * nw_g2) for j in range(nw_g2 + 1)]
    wp_g = []
    for j in range(len(w_ed_g) - 1):
        wlo, whi = w_ed_g[j], w_ed_g[j + 1]
        dw = whi - wlo
        hw_pan = dw / 2
        hw_sub = dw / (2 * Kw_g)
        wiv = (to_iv(wlo)[0], to_iv(whi)[1])
        wj = build_w_data(j_var(wiv), True)
        wsc = build_w_data(wiv, False)
        wm_cen = build_w_data(to_iv((wlo + whi) / 2), False)
        wms = [build_w_data(to_iv(wlo + (2 * b + 1) * hw_sub), False) for b in range(Kw_g)]
        wp_g.append((wlo, whi, dw, to_iv((hw_pan * hw_pan) / 3)[1], to_iv((hw_sub * hw_sub) / 3)[1], wj, wsc, wm_cen, wms))

    totals = [[0, 0] for _ in range(18)]
    totals[0] = kd
    w_cand_g = [Fraction(0, 1)] + w_ed_g[2:-1:2] + [Fraction(1, 1)]
    for i in range(len(r_ed_g) - 1):
        rlo, rhi = r_ed_g[i], r_ed_g[i + 1]
        dr = rhi - rlo
        hr_pan = dr / 2
        hr_sub = dr / (2 * Kr_g)
        hr_pan2 = to_iv((hr_pan * hr_pan) / 3)[1]
        hr_sub2 = to_iv((hr_sub * hr_sub) / 3)[1]
        riv = (to_iv(rlo)[0], to_iv(rhi)[1])
        rsc = build_r_data(riv, params, False)
        w_top = find_w_top(rsc, w_cand_g)
        if w_top < 1:
            t_area = to_iv(dr * (1 - w_top))
            t_vals = eval_18_tail_box(rsc, w_top, Fraction(1, 1))
            for k in range(1, 18):
                mp_t = iv_mul(t_area, t_vals[k])
                totals[k][0] += mp_t[0]
                totals[k][1] += mp_t[1]

        rj = build_r_data(j_var(riv), params, True)
        rm_cen = build_r_data(to_iv((rlo + rhi) / 2), params, False)
        rms = [build_r_data(to_iv(rlo + (2 * a + 1) * hr_sub), params, False) for a in range(Kr_g)]

        for wlo, _, dw, hw_pan2, hw_sub2, wj, wsc, wm_cen, wms in wp_g:
            if wlo >= w_top:
                break
            p_area = to_iv(dr * dw)
            s_area = to_iv((dr * dw) / (Kr_g * Kw_g))
            d2r = eval_18(rj, wsc, "jr")
            fm = eval_18(rm_cen, wm_cen, "sc")
            d2w_cen = eval_18(rm_cen, wj, "jw")

            for k in range(6, 18):
                mr = max(abs(d2r[k][0]), abs(d2r[k][1]))
                mw = max(abs(d2w_cen[k][0]), abs(d2w_cen[k][1]))
                err_u = (hr_pan2 * mr + S - 1) // S + (hw_pan2 * mw + S - 1) // S
                err_t = (p_area[1] * err_u + S - 1) // S
                mp = iv_mul(p_area, fm[k])
                totals[k][0] += mp[0] - err_t
                totals[k][1] += mp[1] + err_t

            mw_max_g = [0] * 5
            sm_lo_g = [0] * 5
            sm_hi_g = [0] * 5
            for rm_d in rms:
                d2w_5 = eval_5_gm_jw(rm_d, wj)
                for idx_5 in range(5):
                    mw = max(abs(d2w_5[idx_5][0]), abs(d2w_5[idx_5][1]))
                    if mw > mw_max_g[idx_5]:
                        mw_max_g[idx_5] = mw
                for wm_d in wms:
                    v5 = eval_5_gm_sc(rm_d, wm_d)
                    for idx_5 in range(5):
                        sm_lo_g[idx_5] += v5[idx_5][0]
                        sm_hi_g[idx_5] += v5[idx_5][1]
            for idx_5 in range(5):
                k = idx_5 + 1
                mr = max(abs(d2r[k][0]), abs(d2r[k][1]))
                err_u = (hr_sub2 * mr + S - 1) // S + (hw_sub2 * mw_max_g[idx_5] + S - 1) // S
                err_t = (p_area[1] * err_u + S - 1) // S
                mp = iv_mul(s_area, (sm_lo_g[idx_5], sm_hi_g[idx_5]))
                totals[k][0] += mp[0] - err_t
                totals[k][1] += mp[1] + err_t

    # Rigorous analytic r >= 5 tails (PROOF.md §4.2):
    # int_25^oo (1, v, v^2, v^3) e^{-v} dv = (1, 26, 677, 17656) e^{-25};
    # for P, Q, |E_j E_k| <= v^3 / 2 gives (17656 / 2) * sqrt(pi) / amin = 8828 * sqrt(pi) / amin <= 17631 * sqrt(pi) / amin.
    e25_hi = exp_neg_series_lo_hi(25 * S)[1]
    amin_lo = (to_iv(sig_f)[0] * (S + bA_iv[0])) // S
    check(amin_lo > 0, f"{row_spec['id']}: amin_lo <= 0")
    tail_kd = 35314 * e25_hi + 10
    tail_gm = 4000 * e25_hi + 10
    tail_pq = (SQRTPI_IV[1] * 17631 * e25_hi) // amin_lo + 10
    totals[0][0] -= tail_kd
    totals[0][1] += tail_kd
    for k in range(1, 6):
        totals[k][0] -= tail_gm
        totals[k][1] += tail_gm
    for k in range(6, 18):
        totals[k][0] -= tail_pq
        totals[k][1] += tail_pq

    kd = (totals[0][0], totals[0][1])
    check(kd[0] > 0, f"{row_spec['id']}: certified kappa_D lower bound <= 0 ({kd})")

    g1_0, g1_1 = totals[1], totals[2]
    m2_0, m2_1, m2_2 = totals[3], totals[4], totals[5]
    P00, P01, P11, P22, P02, P12 = totals[6:12]
    Q00, Q01, Q11, Q22, Q02, Q12 = totals[12:18]

    inv_eta = iv_inv_pos(to_iv(eta_f))
    inv_e1 = iv_inv_pos(to_iv(e1_f))

    M22_re = iv_sub(inv_eta, iv_div_int(iv_sub(P00, Q00), 2))
    M22_im = iv_sub(inv_eta, iv_div_int(iv_add(P00, Q00), 2))
    inv_M22 = iv_inv_pos(M22_re)

    K11_aa_neg = iv_sub(inv_eta, iv_div_int(iv_sub(P11, Q11), 2))
    M11_im = iv_sub(inv_eta, iv_div_int(iv_add(P11, Q11), 2))
    K11_dd = iv_add(inv_e1, iv_div_int(iv_sub(P00, Q00), 2))
    inv_K11_dd = iv_inv_pos(K11_dd)
    K11_ad = iv_div_int(iv_sub(P01, Q01), 2)
    M11_schur = iv_add(K11_aa_neg, iv_mul(iv_sqr(K11_ad), inv_K11_dd))
    inv_M11_schur = iv_inv_pos(M11_schur)
    la11_eff = iv_sub(g1_1, iv_mul(K11_ad, iv_mul(g1_0, inv_K11_dd)))

    M31 = iv_sub(inv_eta, iv_div_int(P00, 2))
    inv_M31 = iv_inv_pos(M31)

    A00 = iv_sub(inv_eta, iv_div_int(P11, 2))
    A11 = iv_sub(inv_eta, iv_div_int(P22, 2))
    A01 = iv_div_int(Q12, 2)
    D22 = iv_add(inv_e1, iv_div_int(P00, 2))
    inv_D22 = iv_inv_pos(D22)
    B0 = iv_div_int(P01, 2)
    B1 = iv_neg(iv_div_int(Q02, 2))

    detA = iv_sub(iv_mul(A00, A11), iv_sqr(A01))
    num_pl = iv_sub(
        iv_add(iv_mul(A11, iv_sqr(m2_1)), iv_mul(A00, iv_sqr(m2_2))),
        iv_scale_int(iv_mul(A01, iv_mul(m2_1, m2_2)), 2),
    )

    M00 = iv_add(A00, iv_mul(iv_sqr(B0), inv_D22))
    M11_2 = iv_add(A11, iv_mul(iv_sqr(B1), inv_D22))
    M01 = iv_add(A01, iv_mul(iv_mul(B0, B1), inv_D22))
    detM = iv_sub(iv_mul(M00, M11_2), iv_sqr(M01))
    inv_detM = iv_inv_pos(detM)
    l0 = iv_sub(m2_1, iv_mul(B0, iv_mul(m2_0, inv_D22)))
    l1 = iv_sub(m2_2, iv_mul(B1, iv_mul(m2_0, inv_D22)))
    num_rt = iv_sub(
        iv_add(iv_mul(M11_2, iv_sqr(l0)), iv_mul(M00, iv_sqr(l1))),
        iv_scale_int(iv_mul(M01, iv_mul(l0, l1)), 2),
    )

    concav_named = [
        ("M22_re", M22_re), ("M22_im", M22_im),
        ("K11_aa_neg", K11_aa_neg), ("M11_im", M11_im), ("K11_dd", K11_dd), ("M11_schur", M11_schur),
        ("M31", M31),
        ("A00", A00), ("A11", A11), ("detA", detA),
        ("D22", D22), ("M00", M00), ("M11_2", M11_2), ("detM", detM),
    ]
    for cname, civ in concav_named:
        check(civ[0] > 0, f"{row_spec['id']}: complex concavity margin {cname} <= 0 ({civ})")
    min_concav_lo = min(civ[0] for _, civ in concav_named)

    sq_g10 = iv_sqr(g1_0)
    sq_la11 = iv_sqr(la11_eff)
    sq_m20 = iv_sqr(m2_0)

    def lin_comb_ret(a22, b11, c31, d20):
        cf_g10 = iv_sub(iv_scale_int(inv_M22, a22), iv_scale_int(inv_K11_dd, b11))
        cf_la11 = iv_scale_int(inv_M11_schur, b11)
        cf_m20 = iv_sub(iv_scale_int(inv_M31, c31), iv_scale_int(inv_D22, d20))
        cf_qm = iv_scale_int(inv_detM, d20)
        s_ch0 = iv_add(iv_mul(cf_g10, sq_g10), iv_mul(cf_la11, sq_la11))
        s_ch2 = iv_add(iv_mul(cf_m20, sq_m20), iv_mul(cf_qm, num_rt))
        return iv_div_int(iv_add(s_ch0, s_ch2), 4)

    C22 = iv_div_int(iv_mul(sq_g10, inv_M22), 4)
    C11_plain = iv_div_int(iv_div_pos(iv_sqr(g1_1), K11_aa_neg), 4)
    C31 = iv_div_int(iv_mul(sq_m20, inv_M31), 4)
    C20_plain = iv_div_int(iv_div_pos(num_pl, detA), 4)

    den42 = iv_scale_int(kd, 42)
    num_e21_pl = iv_add(
        iv_add(iv_scale_int(C22, 25), iv_scale_int(C11_plain, 9)),
        iv_add(iv_scale_int(C31, 24), iv_scale_int(C20_plain, 8)),
    )
    num_e21_rt = lin_comb_ret(25, 9, 24, 8)
    num_fake_cone = lin_comb_ret(70, 25, 72, 18)

    rat_pl = iv_div_pos(num_e21_pl, den42)
    rat_rt = iv_div_pos(num_e21_rt, den42)
    rat_no_cmm = iv_div_pos(num_fake_cone, iv_scale_int(kd, 116))

    lams = (
        lin_comb_ret(112, 0, 672, -448),
        lin_comb_ret(-16, -288, -96, 640),
        lin_comb_ret(1296, -864, -288, 576),
        lin_comb_ret(32, -96, 192, 64),
    )
    # Verify interval 5-invariant SOS polynomial balance on (n, h, b, y, z) directly for the integrated row:
    # LHS_inv = N_tot * chi_inv - 42 * (C22 * u4_inv + C11_ret * u2_inv + C31 * v4_inv + C20_ret * v2_inv)
    # RHS_inv = lam_1 * c_mm_inv + lam_2 * nb_inv + lam_3 * zy_inv + lam_4 * nh2z_inv
    C11_ret = lin_comb_ret(0, 1, 0, 0)
    C20_ret = lin_comb_ret(0, 0, 0, 1)
    inv_vecs = (
        ("n", 32, 16, 16, 0, 0, 1, 1, 0, 1),
        ("h", 8, 4, 4, 0, 0, 0, 0, 0, 1),
        ("b", 32, 16, 0, 0, 32, 1, -1, 0, 0),
        ("y", 96, 96, 0, 96, 0, -3, 0, -1, 0),
        ("z", 0, -32, 16, 0, 0, 1, 0, 1, -2),
    )
    for iname, c_chi, c_u4, c_u2, c_v4, c_v2, d1, d2, d3, d4 in inv_vecs:
        lhs_i = iv_sub(
            iv_scale_int(num_e21_rt, c_chi),
            iv_scale_int(
                iv_add(
                    iv_add(iv_scale_int(C22, c_u4), iv_scale_int(C11_ret, c_u2)),
                    iv_add(iv_scale_int(C31, c_v4), iv_scale_int(C20_ret, c_v2)),
                ),
                42,
            ),
        )
        rhs_i = iv_add(
            iv_add(iv_scale_int(lams[0], d1), iv_scale_int(lams[1], d2)),
            iv_add(iv_scale_int(lams[2], d3), iv_scale_int(lams[3], d4)),
        )
        check(
            lhs_i[0] <= rhs_i[1] and rhs_i[0] <= lhs_i[1],
            f"{row_spec['id']}: SOS balance interval mismatch on invariant {iname}: {lhs_i} vs {rhs_i}",
        )

    return {
        "id": row_spec["id"],
        "elapsed_ms": int((time.time() - t0) * 1000),
        "kappa_D": kd,
        "plain_e21": rat_pl,
        "no_cmm_5sc": rat_no_cmm,
        "retained_all_dim": rat_rt,
        "sos_lams": lams,
        "min_concav_lo": min_concav_lo,
    }


# ============================================================================
# Layer 4: AST Self-Audit, Provenance Binding & Full Certificate Verification
# ============================================================================

def audit_no_float_no_assert(py_paths):
    fl_name = "fl" + "oat"
    for p in py_paths:
        src = Path(p).read_text(encoding="utf-8")
        tree = ast.parse(src, filename=str(p))
        for node in ast.walk(tree):
            check(not isinstance(node, ast.Assert), f"Forbidden assert statement in {p}:{getattr(node, 'lineno', '?')}")
            if isinstance(node, ast.Constant) and type(node.value).__name__ == fl_name:
                raise ValueError(f"VERIFICATION FAILED: Forbidden float literal in {p}:{node.lineno}")
            if isinstance(node, ast.Name) and node.id == fl_name:
                raise ValueError(f"VERIFICATION FAILED: Forbidden float identifier in {p}:{node.lineno}")


EXPECTED_BENCHMARKS = (
    ("gC_0.80", "gC", "0.800", Fraction(39, 50), Fraction(779, 10000), Fraction(0, 1), Fraction(1, 10), None),
    ("g83_0.80", "g83", "0.800", Fraction(83, 100), Fraction(2241, 10000), Fraction(7, 20), Fraction(7, 20), None),
    ("g83_0.85", "g83", "0.850", Fraction(83, 100), Fraction(2241, 10000), Fraction(7, 20), Fraction(7, 20), None),
    ("g84_0.70", "g84", "0.700", Fraction(21, 25), Fraction(319, 1250), Fraction(7, 20), Fraction(7, 20), None),
    ("g84_0.80", "g84", "0.800", Fraction(21, 25), Fraction(319, 1250), Fraction(7, 20), Fraction(7, 20), None),
    ("g84_0.84", "g84", "0.840", Fraction(21, 25), Fraction(319, 1250), Fraction(7, 20), Fraction(1, 1), None),
    ("g84_0.85", "g84", "0.850", Fraction(21, 25), Fraction(319, 1250), Fraction(7, 20), Fraction(1, 1), None),
    ("gA_0.80", "gA", "0.800", Fraction(8493, 10000), Fraction(2827, 10000), Fraction(7, 20), Fraction(1, 1), Fraction(7, 20)),
    ("gA_0.85", "gA", "0.850", Fraction(8493, 10000), Fraction(2827, 10000), Fraction(7, 10), Fraction(1, 1), None),
)
EXPECTED_BY_ID = {b[0]: b for b in EXPECTED_BENCHMARKS}


def verify_certificate(cert_data, repo_root, only_row=None, jobs=0, quiet=False, _test_hypothesis_override=False):
    # 1) Algebraic & tensor verification of Theorems 1, 2, 3 (including Gaussian Wick moments & projections):
    verify_gram_and_sos_identities()

    # 2) Verify SHA-256 provenance of all Stage 0 rows_all.lines files and exact <= 5e-11 rationalisation:
    prov = cert_data["provenance"]
    check(isinstance(prov, dict) and len(prov) == 4, "Expected 4 games in provenance")
    raw_rows_by_game = {}
    for gname in ("gC", "g83", "g84", "gA"):
        check(gname in prov, f"Missing provenance entry for {gname}")
        rel_path = prov[gname]["rel_path"]
        full_p = Path(repo_root) / rel_path
        check(full_p.is_file(), f"Missing Stage 0 source file: {full_p}")
        raw_bytes = full_p.read_bytes()
        digest = hashlib.sha256(raw_bytes).hexdigest()
        check(digest == prov[gname]["sha256"], f"SHA-256 mismatch on {rel_path}: {digest} != {prov[gname]['sha256']}")
        by_t = {}
        for line in raw_bytes.decode("utf-8").splitlines():
            line = line.strip()
            if not line:
                continue
            obj = json.loads(line, parse_float=Decimal, parse_int=int)
            t_dec = Decimal(obj["t"])
            t_key = str(t_dec.quantize(Decimal("0.001")))
            by_t[t_key] = obj
        raw_rows_by_game[gname] = by_t

    all_rows = cert_data["rows"]
    check(isinstance(all_rows, list) and len(all_rows) == 9, f"Expected 9 benchmark rows, got {len(all_rows) if isinstance(all_rows, list) else 'non-list'}")
    seen_triples = [(r.get("id"), r.get("game"), r.get("t_key")) for r in all_rows]
    expected_triples = [(b[0], b[1], b[2]) for b in EXPECTED_BENCHMARKS]
    check(len(set(seen_triples)) == 9, "Duplicate (id, game, t_key) benchmark row in certificate")
    check(seen_triples == expected_triples, f"Benchmark row list {seen_triples} != expected {expected_triples}")

    # Pin ALL 9 rows structurally (weights, caps, mode flags, rationalisation, and stored SOS/concavity signs)
    # BEFORE filtering to only_row, so certificate tampering is rejected immediately even under --only-row!
    half_ulp10 = Fraction(1, 2 * 10 ** 10)
    for rspec in all_rows:
        rid = rspec["id"]
        _, exp_game, exp_tkey, exp_e1, exp_eta, exp_cap, exp_pl, exp_nc = EXPECTED_BY_ID[rid]
        gname = rspec["game"]
        t_key = rspec["t_key"]
        check(gname == exp_game and t_key == exp_tkey, f"{rid}: (game, t_key) mismatch")
        check(gname in raw_rows_by_game and t_key in raw_rows_by_game[gname], f"Row {rid} missing from {gname} rows_all.lines")
        src_obj = raw_rows_by_game[gname][t_key]
        src_e1 = Fraction(Decimal(src_obj["e1"]))
        src_eta = Fraction(Decimal(src_obj["eta"]))
        cert_e1 = parse_frac(rspec["e1"])
        cert_eta = parse_frac(rspec["eta"])
        check(cert_e1 == src_e1 == exp_e1, f"{rid}: e1={cert_e1} does not match source {src_e1} / expected {exp_e1}")
        check(cert_eta == src_eta == exp_eta, f"{rid}: eta={cert_eta} does not match source {src_eta} / expected {exp_eta}")

        if not _test_hypothesis_override:
            check(rspec.get("eval_mode", "retained_all_dim") == "retained_all_dim", f"{rid}: eval_mode must be 'retained_all_dim' (got {rspec.get('eval_mode')!r})")
            check(rspec.get("require_sos_pos", True) is True, f"{rid}: require_sos_pos must be True (got {rspec.get('require_sos_pos')!r})")
            check(parse_frac(rspec["cap_upper"]) <= exp_cap, f"{rid}: cap_upper {rspec['cap_upper']} weaker than pinned {exp_cap}")
            check("plain_lower_exceeds" in rspec and parse_frac(rspec["plain_lower_exceeds"]) >= exp_pl, f"{rid}: missing/weakened plain_lower_exceeds")
            if exp_nc is not None:
                check("no_cmm_lower_exceeds" in rspec and parse_frac(rspec["no_cmm_lower_exceeds"]) >= exp_nc, f"{rid}: missing/weakened no_cmm_lower_exceeds")

        cert_blk = rspec.get("certified", {})
        check(isinstance(cert_blk, dict), f"{rid}: missing certified block")
        for field in ("kappa_D", "plain_e21", "no_cmm_5sc", "retained_all_dim"):
            st = cert_blk.get(field)
            check(isinstance(st, list) and len(st) == 2 and all(isinstance(x, int) for x in st) and st[0] <= st[1], f"{rid}.{field}: invalid stored interval {st!r}")
        check(cert_blk["kappa_D"][0] > 0, f"{rid}: stored kappa_D lower bound <= 0")
        st_mc = cert_blk.get("min_concav_lo")
        check(isinstance(st_mc, int) and st_mc > 0, f"{rid}: stored min_concav_lo <= 0 ({st_mc!r})")
        st_lams = cert_blk.get("sos_lams")
        check(isinstance(st_lams, list) and len(st_lams) == 4, f"{rid}: stored sos_lams must have 4 intervals")
        for idx_l, sl in enumerate(st_lams, start=1):
            check(isinstance(sl, list) and len(sl) == 2 and all(isinstance(x, int) for x in sl) and sl[0] <= sl[1], f"{rid}: invalid stored sos_lams[{idx_l}]={sl!r}")
            if not _test_hypothesis_override:
                check(sl[0] > 0, f"{rid}: stored SOS multiplier lam_{idx_l} lower bound <= 0 ({sl})")

        for k in ("t", "l", "beta", "bA", "bB", "nu5", "sig"):
            dec_exact = Fraction(Decimal(src_obj[k]))
            rat_val = parse_frac(rspec[k])
            check(rat_val.denominator <= 10 ** 10 and (10 ** 10) % rat_val.denominator == 0, f"{rid}.{k}: denominator does not divide 10^10")
            check(abs(dec_exact - rat_val) <= half_ulp10, f"{rid}.{k}: rationalisation > 5e-11 from rows_all.lines")

    rows = all_rows
    if only_row is not None:
        rows = [r for r in all_rows if r["id"] == only_row]
        check(len(rows) == 1, f"Row id {only_row!r} not found in certificate")

    # 3) Re-integrate rows from scratch in zero-float outward interval arithmetic:
    max_w = jobs if jobs > 0 else min(len(rows), os.cpu_count() or 1, 9)
    if max_w <= 1 or len(rows) == 1:
        results = [integrate_and_certify_row(r) for r in rows]
    else:
        with ProcessPoolExecutor(max_workers=max_w) as ex:
            results = list(ex.map(integrate_and_certify_row, rows))

    # 4) Verify certified bounds, SOS multipliers, concavity margins, and Stage 0 sample-row thresholds:
    for rspec, res in zip(rows, results):
        rid = rspec["id"]
        for field in ("kappa_D", "plain_e21", "no_cmm_5sc", "retained_all_dim"):
            stored = tuple(rspec["certified"][field])
            fresh = res[field]
            check(fresh[0] >= stored[0] and fresh[1] <= stored[1], f"{rid}.{field}: fresh {fresh} outside stored {stored}")

        check(res["min_concav_lo"] >= rspec["certified"]["min_concav_lo"] > 0, f"{rid}: fresh min_concav_lo {res['min_concav_lo']} < stored {rspec['certified']['min_concav_lo']}")

        stored_lams = rspec["certified"]["sos_lams"]
        for idx_l, (st_l, fr_l) in enumerate(zip(stored_lams, res["sos_lams"]), start=1):
            check(fr_l[0] >= st_l[0] and fr_l[1] <= st_l[1], f"{rid}.sos_lams[{idx_l}]: fresh {fr_l} outside stored {st_l}")

        if rspec.get("require_sos_pos", True):
            for idx_l, lam_iv in enumerate(res["sos_lams"], start=1):
                check(lam_iv[0] > 0, f"{rid}: SOS multiplier lam_{idx_l} lower bound <= 0 ({lam_iv})")

        use_mode = rspec.get("eval_mode", "retained_all_dim")
        check(use_mode in ("retained_all_dim", "plain_e21", "no_cmm_5sc"), f"{rid}: unknown eval_mode {use_mode}")
        active_iv = res[use_mode]

        cap_f = parse_frac(rspec["cap_upper"])
        # Strict upper cap active_iv[1] / S < cap_f  <=>  active_iv[1] * cap_f.denominator < cap_f.numerator * S!
        check(
            active_iv[1] * cap_f.denominator < cap_f.numerator * S,
            f"{rid} ({use_mode}): certified upper bound {Fraction(active_iv[1], S)} >= cap {cap_f}",
        )

        # Verify plain_e21 exceeds threshold (proving retained defenders are necessary):
        if "plain_lower_exceeds" in rspec:
            pl_f = parse_frac(rspec["plain_lower_exceeds"])
            check(
                res["plain_e21"][0] * pl_f.denominator > pl_f.numerator * S,
                f"{rid}: plain_e21 lower bound did not exceed {pl_f}",
            )

        # Verify 5-scalar cone without C_-- >= 0 exceeds 7/20 = 0.35 where claimed (proving C_-- >= 0 is necessary):
        if "no_cmm_lower_exceeds" in rspec:
            nc_f = parse_frac(rspec["no_cmm_lower_exceeds"])
            check(
                res["no_cmm_5sc"][0] * nc_f.denominator > nc_f.numerator * S,
                f"{rid}: no_cmm_5sc lower bound did not exceed {nc_f}",
            )

        if not quiet:
            min_lam_lo = min(l[0] for l in res["sos_lams"])
            print(
                f"  [OK] {rid:10s} ({res['elapsed_ms']:5d} ms) | "
                f"kd={fmt_interval(res['kappa_D'], 6)} | "
                f"plain={fmt_interval(res['plain_e21'], 4)} | "
                f"no_cmm={fmt_interval(res['no_cmm_5sc'], 4)} | "
                f"ret_all_dim={fmt_interval(res['retained_all_dim'], 5)} | cap={rspec['cap_upper']} | "
                f"min_lam>={fmt_bound(min_lam_lo, 5)} | min_conc>={fmt_bound(res['min_concav_lo'], 4)}"
            )

    return results


def main():
    parser = argparse.ArgumentParser(description="Zero-float verifier for Stage 0 (#751/#849) sector resolution (S0RG)")
    parser.add_argument("--only-row", default=None, help="Verify only one row id (e.g. g84_0.80)")
    parser.add_argument("--jobs", type=int, default=0, help="Worker processes (0 = auto, 1 = sequential)")
    parser.add_argument("--quiet", action="store_true", help="Suppress per-row table output")
    args = parser.parse_args()

    here = Path(__file__).resolve().parent
    repo_root = here.parents[3]
    cert_path = here / "cert_stage0_gram.json"
    controls_path = here / "test_controls.py"

    # 1) AST self-audit & < 300,000 byte size check on package files:
    audit_targets = [here / "verify.py"]
    if controls_path.is_file():
        audit_targets.append(controls_path)
    audit_no_float_no_assert(audit_targets)

    pkg_files = list(here.iterdir())
    proof_dir = repo_root / "research" / "higher-degree" / "sources" / "stage0-retained-gram-gemini-4c4c"
    if proof_dir.is_dir():
        pkg_files.extend(proof_dir.iterdir())
    for fp in pkg_files:
        if fp.is_file():
            sz = fp.stat().st_size
            check(sz < 300000, f"Package file {fp} size {sz} >= 300,000 bytes")

    check(cert_path.is_file(), f"Missing certificate file: {cert_path}")
    cert_data = json.loads(cert_path.read_text(encoding="utf-8"), parse_float=Decimal, parse_int=int)

    t_start = time.time()
    if not args.quiet:
        print("S0RG zero-float verifier: AST audit + Q[i] Gram/SOS algebra + Jet2 shifted-polar re-integration")
    verify_certificate(cert_data, repo_root, only_row=args.only_row, jobs=args.jobs, quiet=args.quiet)
    elapsed_ms = int((time.time() - t_start) * 1000)
    if not args.quiet:
        print(f"ALL S0RG CHECKS PASSED ({elapsed_ms} ms).")


if __name__ == "__main__":
    main()
