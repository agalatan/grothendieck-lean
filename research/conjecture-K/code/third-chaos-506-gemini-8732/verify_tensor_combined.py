#!/usr/bin/env python3
"""Exact zero-float pure-stdlib 4D certifier coupling signed 2-plane norms & commutator defects.

Agent-ID: gemini-8732 (Refs #506, #501, #458; STATUS.md 3.21 (e1), 3.21 (e4), 3.21 (e9)(iii)).
Usage:  python3 -I -O verify_tensor_combined.py [--quiet]

Only the Python 3 standard library is used (ast, fractions, itertools, math, pathlib, sys, time).
Zero floating-point operations occur anywhere in this file (enforced by an AST self-audit).
All real enclosures use outward-rounded integer intervals [lo / S, hi / S] at scale S = 10**24.

WHAT THIS SCRIPT PROVES AND CERTIFIES:
For every n >= 1 and every symmetric cubic tensor T in Sym^3(R^n) with ||T||_HS = 1, put
  a(T) = max_{||w||=1} |T(w,w,w)|,   M_{ij} = sum_{k,l} T_{ikl} T_{jkl},   lambda = ||M||_op,
  kappa_4(F) = 90*tr(M^2) - 18*sum_{r,s=1}^n ||[A_r, A_s]||_F^2,   F = I_3(T)/sqrt(6).

In an orthonormal basis (e_1, e_2, ..., e_n) with M e_1 = lambda e_1, T_{111} = x >= 0,
T_{112} = s >= 0, T_{11k} = 0 (k >= 3), B = T(e_1, ., .)|_{e_1^perp} (B_{22} = b, ||B||_HS^2 = P),
and C = T(e_2, ., .)|_{e_1^perp} (C_{22} = d), the entries ([A_p, A_1])_{1q} (p, q >= 2) form the
matrix D = s^2 e_2 e_2^T + B^2 - x B - s C, giving 18*sum_{r,s} ||[A_r, A_s]||_F^2 >= 72*||D||_F^2.

Coupling this full matrix Frobenius defect, M_{12} = 0, M_{22} <= lambda, symmetrized directional
caps on B, and Weyl-Karamata bounds on tr(M^2) (#519) WITH the signed rational 2-plane circle norm
inequalities
  (m^2 x + 2 m k s + k^2 b)^2 + (m^2 s + 2 m k b + k^2 d)^2 <= (m^2 + k^2)^2 a_0^2
on span(e_1, e_2) and analytic interval tightening on d = T_{222} under ||T||_HS = 1 (#520):
  1. Exact rational identity & inequality controls on explicit non-commuting tensors in R^4.
  2. Strict 4D branch-and-bound certificates across all dimensions (max_depth = 46):
     - Sharp Gaussian regime a(T) <= 349/500 = 0.698:
         lambda(T) < 27/40 = 0.675,   kappa_4(F) < 48;
     - Practical (T) regime a(T) <= 321/500 = 0.642:
         lambda(T) < 33/50 = 0.66,    kappa_4(F) < 229/5 = 45.8.
  3. Full-depth negative controls (at exact production max_depth = 46) backed by 4 explicit rational
     binary cubic witnesses whose bounds a(T) < a_0 (via exact Sturm sequences on R) and
     lambda(T) > lam_false / kappa_4(T) > k4_false are verified algebraically before testing rejection.
"""
import ast
import itertools
import math
import pathlib
import sys
import time
from fractions import Fraction as Q

S = 10**24


def require(cond, msg='verification condition failed'):
    if not cond:
        raise ValueError(msg)


def fdiv(a, b):
    return a // b


def cdiv(a, b):
    return -((-a) // b)


class Iv:
    """Outward-rounded closed interval [lo / S, hi / S]."""

    __slots__ = ('lo', 'hi')

    def __init__(self, lo, hi=None):
        if hi is None:
            hi = lo
        require(lo <= hi, f'inverted interval {lo} > {hi}')
        self.lo = lo
        self.hi = hi

    @staticmethod
    def frac(x):
        x = Q(x)
        lo = fdiv(x.numerator * S, x.denominator)
        hi = cdiv(x.numerator * S, x.denominator)
        require(lo * x.denominator <= x.numerator * S <= hi * x.denominator, 'Iv.frac rounding failed')
        return Iv(lo, hi)

    @staticmethod
    def span_frac(x0, x1):
        x0 = Q(x0)
        x1 = Q(x1)
        lo = fdiv(x0.numerator * S, x0.denominator)
        hi = cdiv(x1.numerator * S, x1.denominator)
        require(lo <= hi, 'Iv.span_frac inverted')
        return Iv(lo, hi)

    def __add__(self, o):
        return Iv(self.lo + o.lo, self.hi + o.hi)

    def __sub__(self, o):
        return Iv(self.lo - o.hi, self.hi - o.lo)

    def __neg__(self):
        return Iv(-self.hi, -self.lo)

    def __mul__(self, o):
        p1 = self.lo * o.lo
        p2 = self.lo * o.hi
        p3 = self.hi * o.lo
        p4 = self.hi * o.hi
        return Iv(fdiv(min(p1, p2, p3, p4), S), cdiv(max(p1, p2, p3, p4), S))

    def sq(self):
        if self.lo >= 0:
            return Iv(fdiv(self.lo * self.lo, S), cdiv(self.hi * self.hi, S))
        if self.hi <= 0:
            return Iv(fdiv(self.hi * self.hi, S), cdiv(self.lo * self.lo, S))
        m = max(-self.lo, self.hi)
        return Iv(0, cdiv(m * m, S))


def isqrt_lo(x_int):
    require(x_int >= 0, 'isqrt_lo negative arg')
    r = math.isqrt(x_int * S)
    require(r * r <= x_int * S, 'isqrt_lo bound failed')
    return r


def isqrt_hi(x_int):
    require(x_int >= 0, 'isqrt_hi negative arg')
    arg = x_int * S
    r = math.isqrt(arg)
    if r * r < arg:
        r += 1
    require(r * r >= arg, 'isqrt_hi bound failed')
    return r


def verify_exact_tensor_identities():
    """Verify ([A_p, A_1])_{1q} == D_{pq}, M_{12} Cauchy-Schwarz, and 72*||D||_F^2 defect on R^4."""
    test_tensors = [
        {(0, 0, 0): Q(1)},
        {(0, 0, 1): Q(1)},
        {(0, 0, 0): Q(3, 5), (0, 1, 1): Q(-2, 5), (0, 2, 2): Q(1, 3), (1, 2, 3): Q(1, 2)},
        {
            (0, 0, 0): Q(2, 3), (0, 0, 1): Q(1, 4), (0, 1, 1): Q(-1, 5),
            (0, 2, 2): Q(3, 7), (0, 2, 3): Q(-1, 6), (0, 3, 3): Q(1, 8),
            (1, 1, 1): Q(-2, 9), (1, 2, 2): Q(1, 5), (1, 2, 3): Q(3, 10),
            (2, 2, 3): Q(-2, 7), (3, 3, 3): Q(1, 4),
        },
    ]
    n = 4
    for mono in test_tensors:
        T = [[[Q(0) for _ in range(n)] for _ in range(n)] for _ in range(n)]
        for (i, j, k), w in mono.items():
            perms = set(itertools.permutations((i, j, k)))
            sh = w / len(perms)
            for a, b, c in perms:
                T[a][b][c] += sh
        require(T[0][0][2] == 0 and T[0][0][3] == 0, 'expected aligned e_2 in e_1^perp')
        norm2 = sum(T[i][j][k] ** 2 for i in range(n) for j in range(n) for k in range(n))
        M = [[sum(T[i][k][l] * T[j][k][l] for k in range(n) for l in range(n)) for j in range(n)] for i in range(n)]
        x = T[0][0][0]
        s = T[0][0][1]
        B = [[T[0][p][q] for q in range(1, n)] for p in range(1, n)]
        C = [[T[1][p][q] for q in range(1, n)] for p in range(1, n)]
        P = sum(B[p][q] ** 2 for p in range(n - 1) for q in range(n - 1))
        tp_norm2 = sum(T[i][j][k] ** 2 for i in range(1, n) for j in range(1, n) for k in range(1, n))

        require(norm2 == x * x + 3 * s * s + 3 * P + tp_norm2, 'norm2 slot identity failed')
        require(M[0][0] == x * x + 2 * s * s + P, 'M_{00} identity failed')

        B2 = [[sum(B[p][r] * B[r][q] for r in range(n - 1)) for q in range(n - 1)] for p in range(n - 1)]
        for p in range(1, n):
            for q in range(1, n):
                comm_1q = sum(T[p][0][k] * T[0][k][q] - T[0][0][k] * T[p][k][q] for k in range(n))
                d_pq = (s * s if (p == 1 and q == 1) else Q(0)) + B2[p - 1][q - 1] - x * B[p - 1][q - 1] - s * C[p - 1][q - 1]
                require(comm_1q == d_pq, '([A_p, A_1])_{1q} == D_{pq} identity failed')

        comm_tot = Q(0)
        for r in range(n):
            for sv in range(n):
                for i in range(n):
                    for j in range(n):
                        cij = sum(T[r][i][k] * T[sv][k][j] - T[sv][i][k] * T[r][k][j] for k in range(n))
                        comm_tot += cij * cij
        d_frob2 = sum(
            ((s * s if (p == 0 and q == 0) else Q(0)) + B2[p][q] - x * B[p][q] - s * C[p][q]) ** 2
            for p in range(n - 1) for q in range(n - 1)
        )
        require(18 * comm_tot >= 72 * d_frob2, '18*sum ||[A_r, A_s]||_F^2 >= 72*||D||_F^2 failed')

        d = T[1][1][1]
        c_frob2 = sum(C[p][q] ** 2 for p in range(n - 1) for q in range(n - 1))
        require(c_frob2 <= Q(1, 3) * d * d + Q(2, 3) * tp_norm2, '||C||_F^2 bound failed')
        rem_m12 = M[0][1] - (s * (x + 2 * B[0][0]) + B[0][0] * d)
        require(rem_m12 * rem_m12 <= Q(2, 3) * (P - B[0][0] ** 2) * (tp_norm2 - d * d), 'M_{12} CS failed')

    return len(test_tensors)


def _poly_strip(p):
    p = list(p)
    while len(p) > 1 and p[-1] == 0:
        p.pop()
    return p


def _poly_rem(a, b):
    a = _poly_strip(a)
    b = _poly_strip(b)
    require(b[-1] != 0, 'division by zero polynomial')
    db = len(b) - 1
    while len(a) - 1 >= db and a[-1] != 0:
        da = len(a) - 1
        fac = a[-1] / b[-1]
        shift = da - db
        for j in range(db + 1):
            a[shift + j] -= fac * b[j]
        a = _poly_strip(a)
    return a


def verify_poly_pos_all_real(coeffs):
    """Prove P(t) = sum_{k=0}^d coeffs[k] * t^k > 0 for ALL t in R via exact rational Sturm sequence."""
    p0 = _poly_strip([Q(c) for c in coeffs])
    deg = len(p0) - 1
    require(deg >= 2 and deg % 2 == 0 and p0[-1] > 0 and p0[0] > 0, 'expected even-degree poly with P(0)>0, lead>0')
    p1 = _poly_strip([k * p0[k] for k in range(1, len(p0))])
    chain = [p0, p1]
    while len(chain[-1]) > 1:
        r = _poly_rem(chain[-2], chain[-1])
        if len(r) == 1 and r[0] == 0:
            raise ValueError('polynomial is not square-free; Sturm check requires square-free P')
        chain.append([-c for c in r])
    require(len(chain[-1]) == 1 and chain[-1][0] != 0, 'expected nonzero constant Sturm remainder')

    def sign_at_inf(sgn_t):
        signs = []
        for poly in chain:
            d = len(poly) - 1
            s_lead = 1 if poly[-1] > 0 else -1
            if sgn_t < 0 and d % 2 == 1:
                s_lead = -s_lead
            signs.append(s_lead)
        return sum(1 for u, v in zip(signs[:-1], signs[1:]) if u != v)

    n_roots = sign_at_inf(-1) - sign_at_inf(+1)
    require(n_roots == 0, f'expected 0 real roots, Sturm found {n_roots}')


def verify_binary_witness_exact(x, s, b, d, a0, min_lam=None, min_k4=None):
    """Prove in exact Q-algebra that binary cubic (x, s, b, d) satisfies a(T) < a0 and violates a false cap."""
    x, s, b, d, a0 = Q(x), Q(s), Q(b), Q(d), Q(a0)
    norm2 = x * x + 3 * s * s + 3 * b * b + d * d
    require(norm2 > 0, 'witness must be nonzero')
    # 1. Check sin(theta) = +-1 (cos(theta) = 0): ||T(e_2, e_2, .)||_2^2 = b^2 + d^2 < a0^2 * norm2:
    c4_coeff = a0 * a0 * norm2 - (b * b + d * d)
    require(c4_coeff > 0, 'witness fails at theta = pi/2')
    # 2. For cos(theta) != 0, put t = tan(theta) in R:
    #    (1+t^2)^2 * (a0^2 * norm2 - ||T(w,w,.)||_2^2)
    #      == a0^2 * norm2 * (1 + 2*t^2 + t^4) - (x + 2*s*t + b*t^2)^2 - (s + 2*b*t + d*t^2)^2:
    A = a0 * a0 * norm2
    p4 = [
        A - (x * x + s * s),
        -4 * s * (x + b),
        2 * A - (4 * s * s + 2 * x * b + 4 * b * b + 2 * s * d),
        -4 * b * (s + d),
        A - (b * b + d * d),
    ]
    verify_poly_pos_all_real(p4)  # proves a(T)^2 <= sup_{w in S^1} ||T(w,w,.)||_2^2 / norm2 < a0^2!

    # 3. Exact M(T) = [[m11, m12], [m12, m22]] and exact lambda(T), kappa_4(T):
    m11 = (x * x + 2 * s * s + b * b) / norm2
    m12 = (x * s + 2 * s * b + b * d) / norm2
    m22 = (s * s + 2 * b * b + d * d) / norm2
    if min_lam is not None:
        min_lam = Q(min_lam)
        # lambda(T) = (m11 + m22 + sqrt((m11 - m22)^2 + 4*m12^2)) / 2 > min_lam:
        rhs = 2 * min_lam - (m11 + m22)
        disc = (m11 - m22) ** 2 + 4 * m12 * m12
        require(rhs < 0 or disc > rhs * rhs, 'witness failed lambda(T) > min_lam')
    if min_k4 is not None:
        min_k4 = Q(min_k4)
        trM2 = m11 * m11 + 2 * m12 * m12 + m22 * m22
        comm12 = (s * s + b * b - x * b - s * d) / norm2
        k4_exact = 90 * trM2 - 72 * comm12 * comm12
        require(k4_exact > min_k4, 'witness failed kappa_4(T) > min_k4')


def build_rational_test_grids():
    dirs = [(1, 0), (0, 1), (80, 1), (80, -1), (40, 1), (40, -1), (20, 1), (20, -1)]
    for m in (16, 11, 7):
        for k in range(-m, m + 1):
            if k != 0 and math.gcd(m, abs(k)) == 1:
                dirs.append((m, k))
    rdirs_int = []
    for m, k in dirs:
        A = m * m
        B = 2 * m * k
        C = k * k
        W2 = (m * m + k * k) ** 2
        rdirs_int.append((A, B, C, W2))

    c_rats = [Q(k, 40) for k in range(1, 40)] + [Q(79, 80), Q(159, 160)]
    c_cap_data = []
    for c in c_rats:
        inv_c_hi = Iv.frac(Q(1) / c).hi
        c2_lo = Iv.frac(c * c).lo
        c2_hi = Iv.frac(c * c).hi
        fac_hi = Iv.frac(Q(1, 3) / (1 - c * c)).hi
        c_cap_data.append((inv_c_hi, c2_lo, c2_hi, fac_hi))

    return rdirs_int, c_cap_data


def certify_4d_combined(a0_q, lam_tar_q, k4_tar_q, grids, max_depth=46):
    """Exact integer-interval 4D branch-and-bound proving a(T) <= a0_q ==> lambda < lam_tar_q and k4 < k4_tar_q."""
    rdirs_int, c_cap_data = grids
    a0_iv = Iv.frac(a0_q)
    a0_hi = a0_iv.hi
    a0_sq_hi = (a0_iv * a0_iv).hi
    lam_tar_lo = Iv.frac(lam_tar_q).lo
    k4_tar_lo = Iv.frac(k4_tar_q).lo

    todo = [(Q(0), a0_q, Q(0), a0_q, -a0_q, a0_q, Q(0), Q(1, 3), 0)]
    leaves = 0
    pruned = 0

    while todo:
        x0, x1, s0, s1, b0, b1, p0, p1, depth = todo.pop()
        X = Iv.span_frac(x0, x1)
        Sv = Iv.span_frac(s0, s1)
        Bv = Iv.span_frac(b0, b1)
        Pv = Iv.span_frac(p0, p1)
        X2 = X.sq()
        S2 = Sv.sq()
        B2 = Bv.sq()

        if X2.lo + S2.lo > a0_sq_hi or B2.lo > a0_sq_hi or B2.lo > Pv.hi:
            pruned += 1
            continue
        tp_hi = S - (X2.lo + 3 * S2.lo + 3 * Pv.lo)
        if tp_hi < 0:
            pruned += 1
            continue

        mp_hi = min(
            cdiv(max(0, cdiv(a0_hi * inv_c_hi, S) - fdiv(X.lo * c2_lo, S)) * fac_hi, S)
            if cdiv(a0_hi * inv_c_hi, S) - fdiv(X.lo * c2_lo, S) >= 0 else -1
            for inv_c_hi, c2_lo, _, fac_hi in c_cap_data
        )
        mm_hi = min(
            cdiv((cdiv(a0_hi * inv_c_hi, S) + cdiv(X.hi * c2_hi, S)) * fac_hi, S)
            for inv_c_hi, _, c2_hi, fac_hi in c_cap_data
        )
        if mp_hi < 0 or mm_hi < 0 or Bv.lo > mp_hi or -Bv.hi > mm_hi:
            pruned += 1
            continue

        pp_lo = fdiv(Bv.lo * Bv.lo, S) if Bv.lo > 0 else 0
        pm_lo = fdiv(Bv.hi * Bv.hi, S) if Bv.hi < 0 else 0
        if pp_lo + pm_lo > Pv.hi:
            pruned += 1
            continue

        u2_cap_hi = X2.hi + S2.hi + Pv.hi - 2 * B2.lo
        if u2_cap_hi < 0:
            pruned += 1
            continue
        d2_max_hi = min(a0_sq_hi - B2.lo, tp_hi, u2_cap_hi)
        if d2_max_hi < 0:
            pruned += 1
            continue
        d_lim = isqrt_hi(d2_max_hi)
        wB_hi = max(0, Pv.hi - B2.lo)

        d_lo_cur = -d_lim
        d_hi_cur = d_lim
        pruned_by_dir = False
        for A_c, B_c, C_c, W2_c in rdirs_int:
            u1_lo = A_c * X.lo + (B_c * Sv.lo if B_c >= 0 else B_c * Sv.hi) + C_c * Bv.lo
            u1_hi = A_c * X.hi + (B_c * Sv.hi if B_c >= 0 else B_c * Sv.lo) + C_c * Bv.hi
            u1_sq_lo = 0 if (u1_lo <= 0 <= u1_hi) else fdiv(min(u1_lo * u1_lo, u1_hi * u1_hi), S)
            rhs2 = W2_c * a0_sq_hi - u1_sq_lo
            if rhs2 < 0:
                pruned_by_dir = True
                break
            if C_c > 0:
                rad = isqrt_hi(rhs2)
                sh_lo = A_c * Sv.lo + (B_c * Bv.lo if B_c >= 0 else B_c * Bv.hi)
                sh_hi = A_c * Sv.hi + (B_c * Bv.hi if B_c >= 0 else B_c * Bv.lo)
                d_lo_c = fdiv(-rad - sh_hi, C_c)
                d_hi_c = cdiv(rad - sh_lo, C_c)
                if d_lo_c > d_lo_cur:
                    d_lo_cur = d_lo_c
                if d_hi_c < d_hi_cur:
                    d_hi_cur = d_hi_c
                if d_lo_cur > d_hi_cur:
                    pruned_by_dir = True
                    break
        if pruned_by_dir or d_lo_cur > d_hi_cur:
            pruned += 1
            continue

        if Bv.lo > 0 or Bv.hi < 0:
            rhs_m12 = cdiv(2 * cdiv(wB_hi * tp_hi, S), 3)
            rad_m12 = isqrt_hi(rhs_m12)
            s_x2b = Sv * (X + Iv(2 * Bv.lo, 2 * Bv.hi))
            num_lo = -rad_m12 - s_x2b.hi
            num_hi = rad_m12 - s_x2b.lo
            if Bv.lo > 0:
                dm_lo = fdiv(num_lo * S, Bv.hi) if num_lo >= 0 else fdiv(num_lo * S, Bv.lo)
                dm_hi = cdiv(num_hi * S, Bv.lo) if num_hi >= 0 else cdiv(num_hi * S, Bv.hi)
            else:
                ab_lo, ab_hi = -Bv.hi, -Bv.lo
                n2_lo, n2_hi = -num_hi, -num_lo
                dm_lo = fdiv(n2_lo * S, ab_hi) if n2_lo >= 0 else fdiv(n2_lo * S, ab_lo)
                dm_hi = cdiv(n2_hi * S, ab_lo) if n2_hi >= 0 else cdiv(n2_hi * S, ab_hi)
            if dm_lo > d_lo_cur:
                d_lo_cur = dm_lo
            if dm_hi < d_hi_cur:
                d_hi_cur = dm_hi
            if d_lo_cur > d_hi_cur:
                pruned += 1
                continue

        n_d = 8 if depth < 14 else 16
        d_span = d_hi_cur - d_lo_cur
        surv_D = []
        for kd in range(n_d):
            dl = d_lo_cur + fdiv(kd * d_span, n_d)
            dh = d_lo_cur + cdiv((kd + 1) * d_span, n_d)
            Dk = Iv(dl, dh)
            Dk2 = Dk.sq()
            if B2.lo + Dk2.lo > a0_sq_hi or Dk2.lo > tp_hi or Dk2.lo > u2_cap_hi:
                continue
            dPk_hi = max(0, tp_hi - Dk2.lo)
            m12_iv = Sv * (X + Iv(2 * Bv.lo, 2 * Bv.hi)) + Bv * Dk
            if m12_iv.sq().lo * 3 > 2 * cdiv(wB_hi * dPk_hi, S):
                continue
            ok_dir = True
            for A_c, B_c, C_c, W2_c in rdirs_int:
                u1_lo = A_c * X.lo + (B_c * Sv.lo if B_c >= 0 else B_c * Sv.hi) + C_c * Bv.lo
                u1_hi = A_c * X.hi + (B_c * Sv.hi if B_c >= 0 else B_c * Sv.lo) + C_c * Bv.hi
                u1_sq_lo = 0 if (u1_lo <= 0 <= u1_hi) else fdiv(min(u1_lo * u1_lo, u1_hi * u1_hi), S)
                u2_lo = A_c * Sv.lo + (B_c * Bv.lo if B_c >= 0 else B_c * Bv.hi) + C_c * Dk.lo
                u2_hi = A_c * Sv.hi + (B_c * Bv.hi if B_c >= 0 else B_c * Bv.lo) + C_c * Dk.hi
                u2_sq_lo = 0 if (u2_lo <= 0 <= u2_hi) else fdiv(min(u2_lo * u2_lo, u2_hi * u2_hi), S)
                if u1_sq_lo + u2_sq_lo > W2_c * a0_sq_hi:
                    ok_dir = False
                    break
            if ok_dir:
                surv_D.append((Dk, Dk2))

        if not surv_D:
            pruned += 1
            continue

        min_d2_surv = min(Dk2.lo for _, Dk2 in surv_D)
        lam_lo = X2.lo + 2 * S2.lo + Pv.lo
        lam_hi = min(X2.hi + 2 * S2.hi + Pv.hi, cdiv(S + 2 * X2.hi + 3 * S2.hi - min_d2_surv, 3))
        if lam_lo > lam_hi:
            pruned += 1
            continue

        def split_box():
            require(depth < max_depth, f'max_depth={max_depth} exceeded at x=[{x0},{x1}], s=[{s0},{s1}], b=[{b0},{b1}], p=[{p0},{p1}]')
            w_list = [
                (x1 - x0, 0),
                (s1 - s0, 1),
                (Q(4, 5) * (b1 - b0), 2),
                (Q(3, 2) * (p1 - p0), 3),
            ]
            _, ax = max(w_list, key=lambda t: t[0])
            coords = [(x0, x1), (s0, s1), (b0, b1), (p0, p1)]
            lc, hc = coords[ax]
            mc = (lc + hc) / 2
            c1 = list(coords)
            c1[ax] = (lc, mc)
            c2 = list(coords)
            c2[ax] = (mc, hc)
            todo.append((*sum(c1, ()), depth + 1))
            todo.append((*sum(c2, ()), depth + 1))

        if lam_hi >= lam_tar_lo:
            split_box()
            continue

        pp_max = Pv.hi - pm_lo
        if pp_max < pp_lo:
            pruned += 1
            continue
        n_p = 4
        gap_xp = X.lo - mp_hi
        xp_sq_lo = fdiv(gap_xp * gap_xp, S) if gap_xp > 0 else 0
        mp2_hi = cdiv(mp_hi * mp_hi, S)
        mm2_hi = cdiv(mm_hi * mm_hi, S)

        worst_k4_hi = -100 * S
        for Dk, Dk2 in surv_D:
            u_hi_1 = cdiv(wB_hi, 2)
            u_hi_2 = cdiv(max(0, u2_cap_hi - Dk2.lo), 2)
            u_hi = min(u_hi_1, u_hi_2)
            Uv = Iv(0, u_hi)

            expr22 = S2 + B2 + Uv - X * Bv - Sv * Dk
            if expr22.lo <= 0 <= expr22.hi:
                def1_lo = 0
            else:
                def1_lo = min(abs(expr22.lo), abs(expr22.hi))

            c2_num_hi = cdiv(Dk2.hi + 2 * tp_hi, 3)
            norm_C_hi = isqrt_hi(c2_num_hi)

            b2_u_xb = B2 + Uv - X * Bv
            two_s2_term_lo = (Iv(2 * S2.lo, 2 * S2.hi) * b2_u_xb + S2 * S2).lo

            dp_span = pp_max - pp_lo
            for kp in range(n_p):
                ppl = pp_lo + fdiv(kp * dp_span, n_p)
                pph = pp_lo + cdiv((kp + 1) * dp_span, n_p)
                pml = max(0, Pv.lo - pph)
                pmh = Pv.hi - ppl
                if pmh < pm_lo:
                    continue

                b2_op_hi = max(min(pph, mp2_hi), min(pmh, mm2_hi))
                L2_hi = S2.hi + 2 * b2_op_hi + tp_hi
                L_max = min(lam_hi, L2_hi)

                cands_l = [lam_lo, lam_hi]
                if L_max >= S // 20:
                    m_idx = 1
                    while True:
                        brk = S - m_idx * L_max
                        if brk < lam_lo:
                            break
                        if brk <= lam_hi:
                            cands_l.append(brk)
                        m_idx += 1

                trM2_hi = 0
                for lp in cands_l:
                    rem = S - lp
                    lp2_hi = cdiv(lp * lp, S)
                    if rem <= 0 or L_max <= 0:
                        val_tr = lp2_hi
                    elif L_max < S // 20:
                        val_tr = lp2_hi + cdiv(rem * L_max, S)
                    else:
                        qf = rem // L_max
                        rf = rem - qf * L_max
                        val_tr = lp2_hi + qf * cdiv(L_max * L_max, S) + cdiv(rf * rf, S)
                    if val_tr > trM2_hi:
                        trM2_hi = val_tr

                lb_B_lo = fdiv(pml * X2.lo, S) + fdiv(ppl * xp_sq_lo, S) + two_s2_term_lo
                norm_Bs_lo = isqrt_lo(lb_B_lo) if lb_B_lo > 0 else 0
                diff_frob = norm_Bs_lo - cdiv(Sv.hi * norm_C_hi, S)
                def2_lo = diff_frob if diff_frob > 0 else 0
                def_best = def1_lo if def1_lo >= def2_lo else def2_lo
                def_sq_lo = fdiv(def_best * def_best, S)

                k4_hi = 90 * trM2_hi - 72 * def_sq_lo
                if k4_hi > worst_k4_hi:
                    worst_k4_hi = k4_hi

        if worst_k4_hi < k4_tar_lo:
            leaves += 1
            continue

        split_box()

    return leaves, pruned


def run_negative_controls(grids):
    """Verify 4 explicit rational planar witnesses by Sturm sequences and reject false caps at FULL max_depth=46."""
    rejected = 0

    def must_fail(fn, label):
        nonlocal rejected
        failed = False
        try:
            fn()
        except ValueError:
            failed = True
        require(failed, f'Negative control {label} was NOT rejected!')
        rejected += 1

    # Witness 1 (Sharp lambda): (x, s, b, d) = (37/125, 53/100, -3/20, -4/125) has a(T) < 349/500 = 0.698
    # and lambda(T) = 0.672717... > 672/1000 = 0.672; also T_0 = (0, 1, 0, 0) has a(T_0) = lambda(T_0) = 2/3 > 0.665:
    verify_binary_witness_exact(Q(37, 125), Q(53, 100), Q(-3, 20), Q(-4, 125), Q(349, 500), min_lam=Q(672, 1000))
    verify_binary_witness_exact(Q(0), Q(1), Q(0), Q(0), Q(349, 500), min_lam=Q(665, 1000), min_k4=Q(41))
    must_fail(lambda: certify_4d_combined(Q(349, 500), Q(672, 1000), Q(48, 1), grids), 'lam < 0.672 at a0=0.698 (full depth 46)')

    # Witness 2 (Practical lambda): (x, s, b, d) = (0, 57/100, 0, -3/20) has a(T) < 321/500 = 0.642
    # and lambda(T) = 0.651625... > 13/20 = 0.650:
    verify_binary_witness_exact(Q(0), Q(57, 100), Q(0), Q(-3, 20), Q(321, 500), min_lam=Q(13, 20))
    must_fail(lambda: certify_4d_combined(Q(321, 500), Q(13, 20), Q(229, 5), grids), 'lam < 0.650 at a0=0.642 (full depth 46)')

    # Witness 3 (Sharp kappa_4): (x, s, b, d) = (1, 1/2, -1/2, 3/5) has a(T) < 349/500 = 0.698
    # and kappa_4(T) = 44.9207... > 44:
    verify_binary_witness_exact(Q(1), Q(1, 2), Q(-1, 2), Q(3, 5), Q(349, 500), min_k4=Q(44))
    must_fail(lambda: certify_4d_combined(Q(349, 500), Q(27, 40), Q(44, 1), grids), 'k4 < 44 at a0=0.698 (full depth 46)')

    # Witness 4 (Practical kappa_4): (x, s, b, d) = (1, 1/20, -3/5, -3/5) has a(T) < 321/500 = 0.642
    # and kappa_4(T) = 37.4405... > 37:
    verify_binary_witness_exact(Q(1), Q(1, 20), Q(-3, 5), Q(-3, 5), Q(321, 500), min_k4=Q(37))
    must_fail(lambda: certify_4d_combined(Q(321, 500), Q(33, 50), Q(37, 1), grids), 'k4 < 37 at a0=0.642 (full depth 46)')

    # 5. AST zero-float audit of this source file:
    src = pathlib.Path(__file__).read_text(encoding='utf-8')
    tree = ast.parse(src)
    fl_name = 'fl' + 'oat'
    for node in ast.walk(tree):
        if isinstance(node, ast.Constant) and type(node.value).__name__ == fl_name:
            raise ValueError('Float literal found in source!')
        if isinstance(node, ast.Name) and node.id == fl_name:
            raise ValueError('Identifier float found in source!')
    must_fail(lambda: require(False, 'sentinel'), 'sentinel')
    return rejected


def main():
    quiet = '--quiet' in sys.argv[1:]
    t0 = time.monotonic_ns()
    n_id = verify_exact_tensor_identities()
    grids = build_rational_test_grids()

    # 1. Sharp Gaussian regime: a(T) <= 349/500 = 0.698
    l_sh, p_sh = certify_4d_combined(Q(349, 500), Q(27, 40), Q(48, 1), grids)

    # 2. Practical (T) regime: a(T) <= 321/500 = 0.642
    l_pr, p_pr = certify_4d_combined(Q(321, 500), Q(33, 50), Q(229, 5), grids)

    n_rej = run_negative_controls(grids)
    elapsed_ms = (time.monotonic_ns() - t0) // 1000000

    if not quiet:
        print('=== Exact Combined 4D Tensor & Commutator Verifier [zero floats] ===')
        print(f'1. Exact R^4 matrix/slot/commutator controls: {n_id} non-commuting rational tensors PASS')
        print(f'2. Sharp regime  a(T) <= 349/500 = 0.698: lambda(T) < 27/40 = 0.675, kappa_4(F) < 48          (leaves={l_sh}, pruned={p_sh}) PASS')
        print(f'3. Practical (T) a(T) <= 321/500 = 0.642: lambda(T) < 33/50 = 0.660, kappa_4(F) < 229/5 = 45.8 (leaves={l_pr}, pruned={p_pr}) PASS')
        print(f'4. Sturm-verified rational witnesses & full-depth (max_depth=46) negative controls + AST audit: {n_rej} checks ALL REJECTED ({elapsed_ms} ms).')


if __name__ == '__main__':
    main()
