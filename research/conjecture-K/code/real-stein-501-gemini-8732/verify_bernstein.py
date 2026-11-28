#!/usr/bin/env python3
"""Second independent exact pure-stdlib verifier (Bernstein subdivision + Laplace det_mat + symbolic 8-var check).

Usage:  python3 -IB verify_bernstein.py [CERT.json] [--quiet] [--generic]

Only the Python standard library is used (fractions, json, math, pathlib, sys, time).
Zero floating-point operations occur anywhere in this file (`float` is never called) and zero `assert`
statements are used (`-O`-safe `require(...)` throughout).

Independent of `verify.py` on all polynomial positivity tests, matrix determinant formulas, primitive
evaluations, and algebraic reductions:
  1. Univariate polynomial positivity on finite segments [a, b] and infinite rays [a, oo) is certified
     by exact integer Bernstein control points and de Casteljau subdivision (no Sturm sequences).
  2. Knot primitives G_1, G_2, G_3, H_4, H_7 are computed independently by the exact trapezoid rule and
     cross-checked at both endpoints of every piece primitive.
  3. Both 2x2 and 3x3 matrix positive-definiteness checks (M_ker, M_w, P_k(r)) use generic recursive
     Laplace cofactor expansion `det_mat()` on `Poly` objects rather than hand-expanded formulas.
  4. On EVERY interval k = 0 .. K (including the infinite ray [r_K, oo)) of EVERY row, expands
       RHS_raw(r, tau, eta, sigma_r, nu_r, w_tau, w_teta, w_eta) - r
     directly from the 5 raw Stein brackets Br_1, Br_2, Br_3, Br_4, Br_7 + raw moment polynomials in
     Q[r][tau, eta, sigma_r, nu_r, w_tau, w_teta, w_eta] and verifies coefficient-by-coefficient that
     it equals the exact sum of the 5 certified nonnegative cones:
       C_1 (3x3 Gram completion) + C_2 (tau excess) + C_3 (sigma_r^2 <= 6 tau^2 eta completion)
       + C_4 (orthant slacks) + C_5 ((1, tau, eta) P_k(r) (1, tau, eta)^T).
  5. Also certifies the `4.18e` sixth-moment polynomial on [0, oo) via `pos_on_ray` Bernstein subdivision.
"""
from fractions import Fraction as Fr
import json
from math import comb, gcd, isqrt
import pathlib
import sys
import time

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import verify as V1

DEFAULT_CERT = HERE / 'cert_real_501.json'
MAX_SUBDIV_DEPTH = 64


class VerificationError(Exception):
    pass


def require(cond, msg='verification condition failed'):
    if not cond:
        raise VerificationError(msg)


def dec_ceil10(q):
    q = Fr(q)
    require(q >= 0, 'dec_ceil10 expects nonnegative Fraction')
    n = (q.numerator * 10**10 + q.denominator - 1) // q.denominator
    return '%d.%010d' % (n // 10**10, n % 10**10)


# ==============================================================================
# UNIVARIATE POLYNOMIAL CLASS & BERNSTEIN SUBDIVISION ENGINE
# ==============================================================================
class Poly:
    __slots__ = ('c',)

    def __init__(self, coeffs=()):
        c = [Fr(x) for x in coeffs]
        while c and c[-1] == 0:
            c.pop()
        self.c = c

    @staticmethod
    def wrap(x):
        return x if isinstance(x, Poly) else Poly([x])

    def __bool__(self):
        return bool(self.c)

    def __eq__(self, other):
        return self.c == Poly.wrap(other).c

    def __add__(self, other):
        o = Poly.wrap(other)
        m = max(len(self.c), len(o.c))
        return Poly([(self.c[i] if i < len(self.c) else Fr(0)) + (o.c[i] if i < len(o.c) else Fr(0)) for i in range(m)])
    __radd__ = __add__

    def __neg__(self):
        return Poly([-x for x in self.c])

    def __sub__(self, other):
        return self + (-Poly.wrap(other))

    def __rsub__(self, other):
        return Poly.wrap(other) + (-self)

    def __mul__(self, other):
        o = Poly.wrap(other)
        if not self.c or not o.c:
            return Poly()
        out = [Fr(0)] * (len(self.c) + len(o.c) - 1)
        for i, a in enumerate(self.c):
            if a:
                for j, b in enumerate(o.c):
                    out[i + j] += a * b
        return Poly(out)
    __rmul__ = __mul__

    def __call__(self, x):
        acc = Fr(0)
        for coef in reversed(self.c):
            acc = acc * x + coef
        return acc

    def integral_from(self, r0, val_r0):
        q = Poly([Fr(0)] + [coef / (i + 1) for i, coef in enumerate(self.c)])
        return q + (val_r0 - q(r0))

    def shift_scale(self, a, w):
        res = Poly()
        lin = Poly([a, w])
        for coef in reversed(self.c):
            res = res * lin + coef
        return res


R_VAR = Poly([Fr(0), Fr(1)])


def det_mat(M):
    m = len(M)
    if m == 1:
        return Poly.wrap(M[0][0])
    if m == 2:
        return Poly.wrap(M[0][0]) * Poly.wrap(M[1][1]) - Poly.wrap(M[0][1]) * Poly.wrap(M[1][0])
    acc = Poly()
    for col in range(m):
        entry = Poly.wrap(M[0][col])
        if not entry.c:
            continue
        minor = [[M[r][c] for c in range(m) if c != col] for r in range(1, m)]
        term = entry * det_mat(minor)
        acc = acc + term if col % 2 == 0 else acc - term
    return acc


def _clear_denoms(fracs):
    den = 1
    for x in fracs:
        den = den * x.denominator // gcd(den, x.denominator)
    return [int(x * den) for x in fracs]


def _bernstein_all_pos(bern, stats):
    n = len(bern) - 1
    stack = [(bern, 0)]
    while stack:
        b, depth = stack.pop()
        if min(b) > 0:
            stats['leaves'] += 1
            if depth > stats['max_depth']:
                stats['max_depth'] = depth
            continue
        if b[0] <= 0 or b[-1] <= 0 or depth >= MAX_SUBDIV_DEPTH:
            return False
        tri = [b]
        for _ in range(n):
            prev = tri[-1]
            tri.append([prev[i] + prev[i + 1] for i in range(len(prev) - 1)])
        left = [tri[k][0] << (n - k) for k in range(n + 1)]
        right = [tri[n - j][j] << j for j in range(n + 1)]
        stack.append((left, depth + 1))
        stack.append((right, depth + 1))
    return True


def pos_on_segment(p, a, b, stats):
    q = p.shift_scale(a, b - a).c
    if not q:
        return False
    n = len(q) - 1
    A = _clear_denoms(q)
    M = 1
    for j in range(n + 1):
        M = M * comb(n, j) // gcd(M, comb(n, j))
    bern = [sum(comb(i, j) * (M // comb(n, j)) * A[j] for j in range(i + 1)) for i in range(n + 1)]
    return _bernstein_all_pos(bern, stats)


def pos_on_ray(p, a, stats):
    q = p.shift_scale(a, Fr(1)).c
    if not q:
        return False
    n = len(q) - 1
    A = _clear_denoms(q)
    M = 1
    for j in range(n + 1):
        M = M * comb(n, j) // gcd(M, comb(n, j))
    bern = [A[i] * (M // comb(n, i)) for i in range(n + 1)]
    return _bernstein_all_pos(bern, stats)


def check_pos(p, lo, hi, stats):
    return pos_on_ray(p, lo, stats) if hi is None else pos_on_segment(p, lo, hi, stats)


# ==============================================================================
# MULTIVARIATE POLYNOMIAL RING Q[r][tau, eta, sigma_r, nu_r, w_tau, w_teta, w_eta]
# ==============================================================================
def mv_add(A, B):
    out = dict(A)
    for k, v in B.items():
        nv = out.get(k, Poly()) + v
        if nv:
            out[k] = nv
        else:
            out.pop(k, None)
    return out


def mv_sub(A, B):
    out = dict(A)
    for k, v in B.items():
        nv = out.get(k, Poly()) - v
        if nv:
            out[k] = nv
        else:
            out.pop(k, None)
    return out


def mv_mul(A, B):
    if not A or not B:
        return {}
    out = {}
    for k1, v1 in A.items():
        for k2, v2 in B.items():
            ek = tuple(a + b for a, b in zip(k1, k2))
            nv = out.get(ek, Poly()) + (v1 * v2)
            if nv:
                out[ek] = nv
            else:
                out.pop(ek, None)
    return out


def mv_poly(p):
    p = Poly.wrap(p)
    return {(0, 0, 0, 0, 0, 0, 0): p} if p else {}


def mv_var(idx):
    e = [0] * 7
    e[idx] = 1
    return {tuple(e): Poly([Fr(1)])}


MV_ONE = mv_poly(Fr(1))
MV_TAU, MV_ETA, MV_SIG, MV_NU, MV_WT, MV_WTE, MV_WE = (mv_var(i) for i in range(7))


# ==============================================================================
# INDEPENDENT BERNSTEIN + SYMBOLIC MULTIVARIATE ROW VERIFIER
# ==============================================================================
def verify_row_bernstein(row):
    stats = {'leaves': 0, 'max_depth': 0}
    s_lo, s_hi = Fr(row['s_lo']), Fr(row['s_hi'])
    require(0 <= s_lo < s_hi <= V1.S_REAL_COVER, f'invalid slab [{s_lo}, {s_hi}]')
    B_bound = Fr(row['bound'])
    require(B_bound > 0, 'row bound must be positive')

    knots = [Fr(x) for x in row['knots']]
    K = len(knots) - 1
    require(K >= 2 and knots[0] == 0 and all(knots[i] < knots[i + 1] for i in range(K)), 'invalid knots')

    kden_int = row['knot_den']
    require(isinstance(kden_int, int) and kden_int > 0, 'invalid knot_den')
    kden = Fr(kden_int)

    def get_int_arr(nm, exp_len):
        raw = row[nm]
        require(isinstance(raw, list) and len(raw) == exp_len and all(isinstance(x, int) for x in raw),
                f'invalid integer array {nm}')
        return [Fr(x, kden) for x in raw]

    phi1 = get_int_arr('phi1', K + 1)
    phi2 = get_int_arr('phi2', K + 1)
    phi3 = get_int_arr('phi3', K + 1)
    psi4 = get_int_arr('psi4', K + 1)
    psi7 = get_int_arr('psi7', K + 1)
    lB = get_int_arr('lB', K + 1)
    Ae = get_int_arr('Ae', K + 1)
    t2 = get_int_arr('t2', K + 1)
    xe = get_int_arr('xe', K + 1)
    xte = get_int_arr('xte', K + 1)

    raw_tau3 = row['tau3']
    require(isinstance(raw_tau3, list) and len(raw_tau3) == K, 'invalid tau3 outer length')
    tau3 = []
    for k, sub in enumerate(raw_tau3):
        require(isinstance(sub, list) and len(sub) == 5 and all(isinstance(x, int) for x in sub), f'invalid tau3[{k}]')
        tau3.append([Fr(x, kden) for x in sub])

    require(len(row['tail_xi']) == 4, 'invalid tail_xi length')
    xt0_tail, xt2_tail, xe0_tail, xe2_tail = (Fr(x, kden) for x in row['tail_xi'])
    require(xt0_tail >= 0 and xt2_tail >= 0 and xe0_tail >= 0 and xe2_tail >= 0, 'negative tail_xi')

    require(len(row['lam']) == 4 and len(row['m_ker']) == 3 and len(row['m_w']) == 3 and len(row['gam']) == 2,
            'invalid scalar tuple lengths')
    lam0, lam1, lam2, lam3 = (Fr(x) for x in row['lam'])
    m00, m01, m11 = (Fr(x) for x in row['m_ker'])
    mu00, mu01, mu11 = (Fr(x) for x in row['m_w'])
    gvt, gve = (Fr(x) for x in row['gam'])

    require(lam3 > 0, 'lam3 must be positive')
    M_ker_mat = [[Poly([m00]), Poly([m01])], [Poly([m01]), Poly([m11])]]
    M_w_mat = [[Poly([mu00]), Poly([mu01])], [Poly([mu01]), Poly([mu11])]]
    require(m00 > 0 and det_mat(M_ker_mat)(Fr(0)) > 0, 'M_ker not PD')
    Dw = det_mat(M_w_mat)(Fr(0))
    require(mu00 > 0 and Dw > 0, 'M_w not PD')

    require(phi2[K] == 0 and phi3[K] == 0, 'phi2(r_K) or phi3(r_K) nonzero')
    require(psi4[0] == 0 and psi4[K] == 0, 'psi4 boundary failed')
    require(psi7[0] == 0 and psi7[K] == 0, 'psi7 boundary failed')
    for k in range(K + 1):
        require(Ae[k] > 0 and t2[k] > 0 and xe[k] >= 0 and xte[k] >= 0, f'knot sign failed at {k}')

    # Independent trapezoid primitive tables at all knots 0 .. K:
    def trap_forward(arr):
        out = [Fr(0)]
        for j in range(K):
            out.append(out[-1] + Fr(1, 2) * (arr[j] + arr[j + 1]) * (knots[j + 1] - knots[j]))
        return out

    G1_kn = trap_forward(phi1)
    G2_kn = trap_forward(phi2)
    G3_kn = trap_forward(phi3)
    require(G2_kn[K] == 0 and G3_kn[K] == 0, 'compact-support sum != 0')

    psi4_int = trap_forward(psi4)
    psi7_int = trap_forward(psi7)
    H4_kn = [psi4_int[j] - psi4_int[K] for j in range(K + 1)]
    H7_kn = [psi7_int[j] - psi7_int[K] for j in range(K + 1)]

    V_POLY = R_VAR * R_VAR
    MV_DT = mv_sub(MV_TAU, MV_ONE)
    MV_DE = mv_sub(MV_ETA, MV_ONE)

    # Constant raw moment part in Q[r][tau, eta, ...]:
    raw_moments = mv_poly(lam0 + lam1 * V_POLY + lam2 * (V_POLY * V_POLY) + lam3 * (V_POLY * V_POLY * V_POLY))
    raw_moments = mv_add(raw_moments, mv_mul(mv_poly(m00), mv_mul(MV_DT, MV_DT)))
    raw_moments = mv_add(raw_moments, mv_mul(mv_poly(2 * m01), mv_mul(MV_DT, MV_DE)))
    raw_moments = mv_add(raw_moments, mv_mul(mv_poly(m11), mv_mul(MV_DE, MV_DE)))
    raw_moments = mv_add(raw_moments, mv_add(mv_mul(mv_poly(mu00), MV_WT),
                                             mv_add(mv_mul(mv_poly(2 * mu01), MV_WTE), mv_mul(mv_poly(mu11), MV_WE))))
    raw_moments = mv_add(raw_moments, mv_add(mv_mul(mv_poly(gvt * V_POLY), MV_DT), mv_mul(mv_poly(gve * V_POLY), MV_DE)))

    for k in range(K + 1):
        tail = (k == K)
        a_lo = knots[k]
        b_hi = None if tail else knots[k + 1]

        def lin_poly(arr, k=k, tail=tail, a_lo=a_lo, b_hi=b_hi):
            if tail:
                return Poly([arr[K]])
            sl = (arr[k + 1] - arr[k]) / (b_hi - a_lo)
            return Poly([arr[k] - sl * a_lo, sl])

        p1 = lin_poly(phi1)
        xte_p = lin_poly(xte)
        g1 = p1.integral_from(a_lo, G1_kn[k])
        if not tail:
            require(g1(b_hi) == G1_kn[k + 1], f'G1 endpoint mismatch on interval {k}')

        if not tail:
            p2, p3, ps4, ps7 = lin_poly(phi2), lin_poly(phi3), lin_poly(psi4), lin_poly(psi7)
            lb_p, ae_p, t2_p, xe_p = lin_poly(lB), lin_poly(Ae), lin_poly(t2), lin_poly(xe)
            g2 = p2.integral_from(a_lo, G2_kn[k])
            g3 = p3.integral_from(a_lo, G3_kn[k])
            h4 = ps4.integral_from(a_lo, H4_kn[k])
            h7 = ps7.integral_from(a_lo, H7_kn[k])
            require(g2(b_hi) == G2_kn[k + 1] and g3(b_hi) == G3_kn[k + 1], f'G2/G3 mismatch at {k}')
            require(h4(b_hi) == H4_kn[k + 1] and h7(b_hi) == H7_kn[k + 1], f'H4/H7 mismatch at {k}')

            # Cone 3: 2x2 determinant via det_mat:
            B_mat = [[ae_p, lb_p], [Fr(3, 2) * lb_p, t2_p]]
            require(check_pos(det_mat(B_mat), a_lo, b_hi, stats), f'Bernstein D_B failed at {k}')

            Lsig = 2 * (g2 + ps4)
            Lnu = 2 * (g3 + ps7)
            lA_p = Lsig - lb_p
            T3_exact = Fr(3) / (16 * Dw) * (mu11 * lA_p * lA_p - 2 * mu01 * lA_p * Lnu + mu00 * Lnu * Lnu)

            p_w1 = Poly([-a_lo, Fr(1)]) * (Fr(1) / (b_hi - a_lo))
            T3_p = Poly()
            pw = Poly([Fr(1)])
            for m in range(5):
                T3_p = T3_p + tau3[k][m] * pw
                pw = pw * p_w1
            require(check_pos(T3_p - T3_exact, a_lo, b_hi, stats), f'Bernstein tau3 - T3_exact failed at {k}')
            xt_p = Poly()
        else:
            p2 = p3 = ps4 = ps7 = g2 = g3 = h4 = h7 = lb_p = ae_p = t2_p = lA_p = Lnu = T3_exact = T3_p = Poly()
            rK2 = knots[K] * knots[K]
            xt_p = Poly([xt0_tail - xt2_tail * rK2, Fr(0), xt2_tail])
            xe_p = Poly([xe0_tail - xe2_tail * rK2, Fr(0), xe2_tail])

        P12 = Poly([m01]) + Fr(3, 2) * p3 - Fr(1, 2) * xte_p
        P11 = Poly([m00]) + 3 * p2 - t2_p
        P02 = Fr(1, 2) * (Poly([-2 * m01 - 2 * m11, Fr(0), gve]) - 3 * R_VAR * g3 + 4 * h4 - 2 * h7 - ae_p - xe_p)
        P01 = Fr(1, 2) * (Poly([-2 * m00 - 2 * m01, Fr(0), gvt]) + 3 * (p1 - p2 - p3) - 3 * R_VAR * g2 - 4 * h4 - T3_p - xt_p)
        P00 = Poly([lam0 + m00 + 2 * m01 + m11, Fr(-1), lam1 - gvt - gve, Fr(0), lam2, Fr(0), lam3]) + 3 * R_VAR * (g2 + g3 - g1) + 2 * h7

        # Ordered basis (eta, tau, 1): generic Laplace det_mat on 1x1, 2x2, 3x3 leading blocks!
        P_ord = [
            [Poly([m11]), P12, P02],
            [P12, P11, P01],
            [P02, P01, P00],
        ]
        require(det_mat([[P_ord[0][0]]])(Fr(0)) > 0, f'm11 <= 0 at {k}')
        require(check_pos(det_mat([r[:2] for r in P_ord[:2]]), a_lo, b_hi, stats), f'Bernstein M2 failed at {k}')
        require(check_pos(det_mat(P_ord), a_lo, b_hi, stats), f'Bernstein M3 failed at {k}')

        # --- EXACT 8-VARIABLE SYMBOLIC IDENTITY CHECK OF RAW RHS - r ---
        Br1 = mv_sub(mv_mul(mv_poly(3 * p1), MV_TAU), mv_poly(3 * R_VAR * g1))
        Br2 = mv_add(
            mv_sub(mv_mul(mv_poly(3 * p2), mv_mul(MV_TAU, MV_DT)), mv_mul(mv_poly(3 * R_VAR * g2), MV_DT)),
            mv_mul(mv_poly(2 * g2), MV_SIG),
        )
        Br3 = mv_add(
            mv_sub(mv_mul(mv_poly(3 * p3), mv_mul(MV_TAU, MV_DE)), mv_mul(mv_poly(3 * R_VAR * g3), MV_DE)),
            mv_mul(mv_poly(2 * g3), MV_NU),
        )
        Br4 = mv_sub(mv_mul(mv_poly(2 * ps4), MV_SIG), mv_mul(mv_poly(4 * h4), mv_sub(MV_TAU, MV_ETA)))
        Br7 = mv_sub(mv_mul(mv_poly(2 * ps7), MV_NU), mv_mul(mv_poly(2 * h7), MV_DE))

        rhs_minus_r = mv_sub(
            mv_add(raw_moments, mv_add(Br1, mv_add(Br2, mv_add(Br3, mv_add(Br4, Br7))))),
            mv_poly(R_VAR),
        )

        # Sum of the 5 certified nonnegative cones:
        C1 = mv_add(
            mv_add(mv_mul(mv_poly(mu00), MV_WT), mv_add(mv_mul(mv_poly(2 * mu01), MV_WTE), mv_mul(mv_poly(mu11), MV_WE))),
            mv_add(mv_mul(mv_poly(lA_p), MV_SIG), mv_add(mv_mul(mv_poly(Lnu), MV_NU), mv_mul(mv_poly(T3_exact), MV_TAU))),
        )
        C2 = mv_mul(mv_poly((T3_p - T3_exact) + xt_p), MV_TAU)
        C3 = mv_add(mv_mul(mv_poly(ae_p), MV_ETA), mv_add(mv_mul(mv_poly(lb_p), MV_SIG), mv_mul(mv_poly(t2_p), mv_mul(MV_TAU, MV_TAU))))
        C4 = mv_add(mv_mul(mv_poly(xe_p), MV_ETA), mv_mul(mv_poly(xte_p), mv_mul(MV_TAU, MV_ETA)))

        vecs = (MV_ONE, MV_TAU, MV_ETA)
        P_1te = [[P00, P01, P02], [P01, P11, P12], [P02, P12, Poly([m11])]]
        C5 = {}
        for ia in range(3):
            for ib in range(3):
                C5 = mv_add(C5, mv_mul(mv_poly(P_1te[ia][ib]), mv_mul(vecs[ia], vecs[ib])))

        cone_sum = mv_add(C1, mv_add(C2, mv_add(C3, mv_add(C4, C5))))
        require(mv_sub(rhs_minus_r, cone_sum) == {}, f'8-variable symbolic RHS identity failed on interval {k}')

    # --- Bernstein Verification of Moment Polynomials on x in [x_lo, 1] ---
    sig_lo, sig_hi, x_lo = Fr(row['sig_lo']), Fr(row['sig_hi']), Fr(row['x_lo'])
    require(sig_lo >= 0 and sig_lo * sig_lo >= s_lo ** 3, 'sig_lo^2 < s_lo^3')
    require(sig_hi > 0 and sig_hi * sig_hi >= s_hi ** 3, 'sig_hi^2 < s_hi^3')
    require(0 <= x_lo < 1, 'invalid x_lo')
    if s_lo <= 36:
        require(x_lo == 0, 'x_lo != 0')
    else:
        require(36 + 54 * x_lo * x_lo <= s_lo, '36 + 54 x_lo^2 > s_lo')

    s_mid = (s_lo + s_hi) / 2
    ssq_lo = 2 * s_mid * s_lo - s_mid * s_mid
    ssq_hi = 2 * s_mid * s_hi - s_mid * s_mid

    C0 = lam0 + lam1 + 3 * lam2 + 15 * lam3
    Cs = lam2 + 15 * lam3 + gvt / 3
    Cm = 8 * m00 + 8 * m01 + 2 * m11 + 16 * mu00 + 16 * mu01 + 4 * mu11 + 6 * gve
    Cu = 6 * m00 + 24 * mu00
    qx = Poly([Fr(36), Fr(0), Fr(54)])
    qx2 = qx * qx
    P6x = Poly([Fr(0), Fr(32400), Fr(9720), Fr(14580)])
    P6sq_q = P6x * P6x * qx

    for tag, s_ep, sig_ep, ssq_ep in (('lo', s_lo, sig_lo, ssq_lo), ('hi', s_hi, sig_hi, ssq_hi)):
        Nx = (B_bound - C0 - s_ep * Cs) * qx2 - Poly([s_ep * Cm, Fr(0), s_ep * Cu]) * qx + (4320 * lam3 * ssq_ep)
        require(pos_on_segment(Nx, x_lo, Fr(1), stats), f'Bernstein N_{tag} failed')
        diff_x = Nx * Nx - ((lam3 * sig_ep) ** 2) * P6sq_q
        require(pos_on_segment(diff_x, x_lo, Fr(1), stats), f'Bernstein diff_x {tag} failed')

    return dict(ok=True, K=K, bound=B_bound, s_lo=s_lo, s_hi=s_hi,
                leaves=stats['leaves'], max_depth=stats['max_depth'])


def verify_sixth_clipping_bernstein(ds, rho):
    e, eta, target, carrier = Fr(39, 50), Fr(779, 10000), Fr(500, 701), Fr(431, 500)
    t_clip = Fr(ds['d5_418e_sixth_moment'])
    tang = Fr(ds['d5_418e_sixth_tang'])
    shift = Fr(21, 200)
    x0 = rho * rho - (carrier * t_clip) ** 2
    z0 = ((1 + shift) ** 2) * x0
    upper0 = eta + (1 - eta) * t_clip * t_clip + (e - eta) * x0
    need0 = (upper0 - target) / eta + shift * shift * x0
    sc12 = 10**12
    r_up = Fr(isqrt(int(need0 * (sc12 ** 2))) + 1, sc12)
    d0 = 2 * z0 - 1 - r_up * (2 + tang * tang) / (2 * tang)
    d1 = z0 - r_up / (2 * tang)
    require(d0 > 0 and d1 > 0, '4.18e unsquared positivity failed')
    poly_clip = Poly([d0 * d0 - 6 * r_up * r_up * z0, Fr(0), 2 * d0 * d1 - 9 * r_up * r_up * z0, -V1.C6_CPLX * r_up * r_up * z0, d1 * d1])
    st = {'leaves': 0, 'max_depth': 0}
    require(pos_on_ray(poly_clip, Fr(0), st), '4.18e Bernstein ray check failed')
    return st['leaves']


def verify_certificate_dict_bernstein(cert, generic=False, quiet=False):
    require(isinstance(cert, dict), 'certificate must be a JSON object')
    pi_lo, pi_hi = V1.verify_pi_bounds()

    claim_real = Fr(cert['claim_real'])
    claim_cplx = Fr(cert['claim_complex'])
    sharp_s = Fr(cert['sharp_hi_s']) if 'sharp_hi_s' in cert else None
    sharp_real = Fr(cert['sharp_hi_claim_real']) if 'sharp_hi_claim_real' in cert else None
    sharp_chi = Fr(cert['sharp_hi_chi']) if 'sharp_hi_chi' in cert else None
    sharp_cplx = Fr(cert['sharp_hi_claim_complex']) if 'sharp_hi_claim_complex' in cert else None

    if (sharp_s is not None) or (sharp_real is not None) or (sharp_chi is not None) or (sharp_cplx is not None):
        require(all(x is not None for x in (sharp_s, sharp_real, sharp_chi, sharp_cplx)), 'incomplete sharp_hi fields')

    try:
        V1.verify_complex_transfer(claim_real, sharp_s, sharp_real, claim_cplx, sharp_chi, sharp_cplx, pi_lo, pi_hi)
    except ValueError as exc:
        raise VerificationError(str(exc)) from exc

    rows = cert['rows']
    require(isinstance(rows, list) and len(rows) >= 1, 'rows must be a non-empty list')
    prev = Fr(0)
    found_sharp_start = False
    for i, row in enumerate(rows):
        s_lo, s_hi = Fr(row['s_lo']), Fr(row['s_hi'])
        require(s_lo == prev and s_hi > s_lo, f'row {i} contiguity failed')
        if sharp_s is not None and s_lo == sharp_s:
            found_sharp_start = True
        prev = s_hi
    require(prev >= V1.S_REAL_COVER, f'rows end at {prev} < 90')
    if sharp_s is not None:
        require(found_sharp_start, 'sharp_hi_s does not match any row start knot')

    if not generic:
        require(claim_real <= Fr(3999, 5000), 'default claim_real > 3999/5000')
        require(claim_cplx <= Fr(2221, 2500), 'default claim_complex > 2221/2500')
        require(sharp_s is not None and sharp_s <= Fr(14), 'default sharp_hi_s > 14')
        require(sharp_real <= Fr(3989, 5000), 'default sharp_hi_claim_real > 3989/5000')
        require(sharp_chi <= Fr(28, 3), 'default sharp_hi_chi > 28/3')
        require(sharp_cplx <= Fr(4431, 5000), 'default sharp_hi_claim_complex > 4431/5000')
        require('downstream' in cert, 'missing downstream')

    ds_res = None
    clip_leaves = 0
    if not generic:
        try:
            ds_res = V1.verify_downstream(cert['downstream'], claim_cplx, pi_lo, pi_hi)
        except ValueError as exc:
            raise VerificationError(str(exc)) from exc
        clip_leaves = verify_sixth_clipping_bernstein(cert['downstream'], claim_cplx)

    worst_real = Fr(0)
    worst_idx = -1
    worst_hi = None
    tot_leaves = 0
    max_depth = 0

    for i, row in enumerate(rows):
        res = verify_row_bernstein(row)
        b_i = res['bound']
        tot_leaves += res['leaves']
        if res['max_depth'] > max_depth:
            max_depth = res['max_depth']
        if b_i > worst_real:
            worst_real = b_i
            worst_idx = i
        if sharp_s is not None and res['s_lo'] >= sharp_s:
            if worst_hi is None or b_i > worst_hi:
                worst_hi = b_i
        if not quiet:
            print('row %2d [Bernstein+Sym8]  s in [%6s, %6s]  leaves=%4d (d<=%2d)  PASS  bound <= %s' % (
                i, row['s_lo'], row['s_hi'], res['leaves'], res['max_depth'], dec_ceil10(b_i)), flush=True)

    require(worst_real <= claim_real, 'worst_real > claim_real')
    if sharp_real is not None:
        require(worst_hi is not None and worst_hi <= sharp_real, 'worst_hi > sharp_real')

    return dict(
        worst_real=worst_real,
        worst_idx=worst_idx,
        worst_hi=worst_hi,
        tot_leaves=tot_leaves,
        max_depth=max_depth,
        clip_leaves=clip_leaves,
        downstream=ds_res,
    )


def main(argv=None):
    args = list(sys.argv[1:] if argv is None else argv)
    quiet = '--quiet' in args
    generic = '--generic' in args
    pos_args = [a for a in args if not a.startswith('--')]
    require(len(pos_args) <= 1, 'Usage: verify_bernstein.py [CERT.json] [--quiet] [--generic]')
    cert_path = pathlib.Path(pos_args[0]) if pos_args else DEFAULT_CERT

    t0 = time.monotonic_ns()
    cert = json.loads(cert_path.read_text(encoding='utf-8'))
    out = verify_certificate_dict_bernstein(cert, generic=generic, quiet=quiet)
    dt_ms = (time.monotonic_ns() - t0) // 1_000_000

    print('Bernstein + 8-Var Symbolic [0, 90]: all %d rows PASS (%d leaves, max_depth=%d, 4.18e_leaves=%d), max <= %s' % (
        len(cert['rows']), out['tot_leaves'], out['max_depth'], out['clip_leaves'], dec_ceil10(out['worst_real'])))
    print('INDEPENDENT BERNSTEIN + SYMBOLIC VERIFICATION COMPLETE  [%d ms, zero floats]' % dt_ms)


if __name__ == '__main__':
    main()
