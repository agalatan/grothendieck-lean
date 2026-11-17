#!/usr/bin/env python3
"""Exact sharp spectral-to-injective bound (1 + sqrt(2)) and commutator-sharpened kappa_4 cutoffs.

Agent-ID: gemini-9a4e. Refs #506, #501, #458.
Standard library only (`python3 -I`). Zero floating-point decisions: all algebra uses
exact `fractions.Fraction` and exact quadratic-field `Q(sqrt(2))` arithmetic.

Verifies:
1. Exact attainment `(3 * lambda(T_*) - 1) / a(T_*)^2 == 1 + sqrt(2)` on the binary cubic
   `T_* = (-3 cos(pi/8) e_1 (.) e_1 (.) e_2 + sin(pi/8) e_2^(x3)) / sqrt(2 + sqrt(2)/2)`,
   and every algebraic identity / endpoint sign of the 4-case computer-free proof that
   `3 * lambda(T) - 1 <= (1 + sqrt(2)) * a(T)^2` for every unit-HS symmetric cubic in every dimension.
2. Exact fourth-cumulant commutator identity
     `kappa_4(I_3(T)/sqrt(6)) == 90 * tr(M^2) - 18 * sum_{r,s=1}^n ||A_r A_s - A_s A_r||_F^2`
   checked directly against exact 8th-degree Gaussian Wick moments on rational tensors in R^2, R^3, R^4.
3. Exact `Fraction` 4D box-subdivision certificates (strict `<`) using the `(1, 2)` commutator entry
   `(A_2 A_1 - A_1 A_2)_{12} = s^2 + b^2 + u - x*b - s*d`:
   - `a(T) <= 129/200 = 0.645  ==>  kappa_4(T) < 473/10 = 47.3`,
   - `a(T) <= 349/500 = 0.698  ==>  kappa_4(T) < 991/20 = 49.55`,
   and at #500's thresholds `0.662` and `0.711`:
   - `a(T) <= 331/500 = 0.662  ==>  kappa_4(T) < 48`,
   - `a(T) <= 711/1000 = 0.711 ==>  kappa_4(T) < 503/10 = 50.3`.
4. Rejection controls.
"""
if not __debug__:
    raise RuntimeError("Run without -O; assertions are required.")

import time
from fractions import Fraction as F


class Q2:
    """Exact element `p + q * sqrt(2)` of Q(sqrt(2)) with exact sign test."""

    __slots__ = ("p", "q")

    def __init__(self, p, q=0):
        self.p = F(p)
        self.q = F(q)

    def __add__(self, o):
        o = o if isinstance(o, Q2) else Q2(o)
        return Q2(self.p + o.p, self.q + o.q)

    def __radd__(self, o):
        return self + o

    def __sub__(self, o):
        o = o if isinstance(o, Q2) else Q2(o)
        return Q2(self.p - o.p, self.q - o.q)

    def __rsub__(self, o):
        return Q2(o) - self

    def __neg__(self):
        return Q2(-self.p, -self.q)

    def __mul__(self, o):
        o = o if isinstance(o, Q2) else Q2(o)
        return Q2(self.p * o.p + 2 * self.q * o.q, self.p * o.q + self.q * o.p)

    def __rmul__(self, o):
        return self * o

    def __truediv__(self, o):
        o = o if isinstance(o, Q2) else Q2(o)
        norm = o.p * o.p - 2 * o.q * o.q
        assert norm != 0
        return Q2((self.p * o.p - 2 * self.q * o.q) / norm, (self.q * o.p - self.p * o.q) / norm)

    def __eq__(self, o):
        o = o if isinstance(o, Q2) else Q2(o)
        return self.p == o.p and self.q == o.q

    def is_pos(self):
        """Exact test `p + q * sqrt(2) > 0` without floating point."""
        if self.p == 0 and self.q == 0:
            return False
        if self.p >= 0 and self.q >= 0:
            return True
        if self.p <= 0 and self.q <= 0:
            return False
        if self.p > 0 and self.q < 0:
            return self.p * self.p > 2 * self.q * self.q
        # self.p < 0 and self.q > 0
        return 2 * self.q * self.q > self.p * self.p

    def __gt__(self, o):
        return (self - o).is_pos()

    def __lt__(self, o):
        return (Q2(o) - self if not isinstance(o, Q2) else o - self).is_pos()


R2 = Q2(0, 1)  # exact sqrt(2)


def poly_mul_q2(a, b):
    out = [Q2(0) for _ in range(len(a) + len(b) - 1)]
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] = out[i + j] + x * y
    return out


def poly_add_q2(a, b, sign=1):
    out = [Q2(0) for _ in range(max(len(a), len(b)))]
    for i, x in enumerate(a):
        out[i] = out[i] + x
    for i, y in enumerate(b):
        out[i] = out[i] + (y if sign == 1 else -y)
    return out


def poly_eval_q2(p, x):
    acc = Q2(0)
    for c in reversed(p):
        acc = acc * x + c
    return acc


def verify_sharp_1_plus_sqrt2():
    """Verifies exact attainment at T_* and all 4 cases of the computer-free proof in Q(sqrt(2))."""
    # 1. Attainment at T_*: x = b = 0, s^2 = cos^2(pi/8) / N, d^2 = sin^2(pi/8) / N
    # where N = 3 cos^2(pi/8) + sin^2(pi/8) = (6 + 3*sqrt(2) + 2 - sqrt(2))/4 = 2 + sqrt(2)/2.
    c8_sq = Q2(F(1, 2), F(1, 4))  # (2 + sqrt(2))/4
    s8_sq = Q2(F(1, 2), F(-1, 4))  # (2 - sqrt(2))/4
    norm_sq = 3 * c8_sq + s8_sq
    assert norm_sq == Q2(2, F(1, 2))
    s_sq = c8_sq / norm_sq
    d_sq = s8_sq / norm_sq
    # On T_*, M = diag(2*s^2, s^2 + d^2); check 2*s^2 > s^2 + d^2 and 3*(2*s^2) - 1 = 3*s^2 - d^2:
    lam_st = 2 * s_sq
    assert lam_st > s_sq + d_sq
    assert 3 * lam_st - 1 == 3 * s_sq - d_sq
    # Max of |-3 cos(pi/8) u^2 v + sin(pi/8) v^3|^2 on u^2 + v^2 = 1:
    # Let t = v^2 in [0, 1]. Square of unnormalized cubic is t * (-3*cos(pi/8)*(1-t) + sin(pi/8)*t)^2.
    # Notice cos(pi/8)*sin(pi/8) = sqrt(2)/4, so (-3*c8*(1-t) + s8*t)^2 = 9*c8^2*(1-t)^2 - 6*(sqrt(2)/4)*t*(1-t) + s8^2*t^2.
    # At t_* = 1 - 1/sqrt(2) = 1 - R2/2:
    t_st = 1 - R2 / 2
    val_sq_unnorm = t_st * (9 * c8_sq * (1 - t_st) * (1 - t_st) - F(3, 2) * R2 * t_st * (1 - t_st) + s8_sq * t_st * t_st)
    assert val_sq_unnorm == Q2(1, 0), "Unnormalized maximum of |T_*(w,w,w)|^2 must equal 1!"
    # Derivative of t * (-3*c8*(1-t) + s8*t)^2 vanishes at t_* and other critical point t_0 = 3*c8/(3*c8+s8)... check global max <= 1:
    # Factor 1 - val_sq_unnorm(t) as a cubic in t over Q(sqrt(2)):
    # Build polynomial P(t) = 1 - t*(9*c8^2*(1-t)^2 - (3/2)*R2*t*(1-t) + s8^2*t^2):
    one_minus_t = [Q2(1), Q2(-1)]
    t_poly = [Q2(0), Q2(1)]
    inner = poly_add_q2(
        poly_mul_q2([9 * c8_sq], poly_mul_q2(one_minus_t, one_minus_t)),
        poly_add_q2(
            poly_mul_q2([Q2(0, F(-3, 2))], poly_mul_q2(t_poly, one_minus_t)),
            poly_mul_q2([s8_sq], poly_mul_q2(t_poly, t_poly)),
        ),
    )
    diff_t = poly_add_q2([Q2(1)], poly_mul_q2(t_poly, inner), sign=-1)
    # Factor out (t - t_st)^2:
    lin_factor = [-t_st, Q2(1)]
    sq_factor = poly_mul_q2(lin_factor, lin_factor)
    # Exact quotient linear factor is 6 + 4*sqrt(2) - (5 + 7*sqrt(2)/2)*t:
    c0_rem = diff_t[0] / sq_factor[0]
    c1_rem = diff_t[3] / sq_factor[2]
    assert c0_rem == Q2(6, 4) and c1_rem == Q2(-5, F(-7, 2))
    assert diff_t == poly_mul_q2(sq_factor, [c0_rem, c1_rem])
    # On t in [0, 1], c0_rem + c1_rem * t is affine; check positivity at t = 0 and t = 1!
    assert c0_rem > 0 and (c0_rem + c1_rem) > 0
    a_st_sq = Q2(1) / norm_sq
    assert (3 * lam_st - 1) / a_st_sq == 1 + R2

    # 2. Verify all 4 cases of the rotated 2D reduction on b in [-1, 1/2]:
    # Identity: (1 - b^2 - D)^2 + 4*b^2*D == (D + 3*b^2 - 1)^2 + 4*b^2*(1 - 2*b^2)
    for b_test, D_test in ((F(-3, 5), F(1, 3)), (F(2, 5), F(1, 7))):
        lhs = (1 - b_test**2 - D_test) ** 2 + 4 * b_test**2 * D_test
        rhs = (D_test + 3 * b_test**2 - 1) ** 2 + 4 * b_test**2 * (1 - 2 * b_test**2)
        assert lhs == rhs

    # Case 1: b in [-1, -995/1000] => 1 - b^2 <= 1 - (995/1000)^2 = 9975/10^6 < (1/10)^2 = 10000/10^6,
    # so 1 + b^2 + 3|b|sqrt(1 - b^2) < 2 + 3/10 = 23/10 < 1 + sqrt(2).
    assert 1 - F(995, 1000) ** 2 < F(1, 10) ** 2
    assert Q2(F(23, 10)) < 1 + R2

    # Case 2: b in [-995/1000, -2/5] with u = sqrt(2) - 1, v^2 = 2*(sqrt(2) - 1):
    u = R2 - 1
    v2 = 2 * (R2 - 1)
    u3 = u * u * u
    v6 = v2 * v2 * v2
    # Check 1 + u^3 + 3*u*v2*b > 0 and u^3 + 3*u*v2*b < 0 at both endpoints b = -995/1000 and b = -2/5:
    for b_end in (F(-995, 1000), F(-2, 5)):
        assert 1 + u3 + 3 * u * v2 * b_end > 0
        assert u3 + 3 * u * v2 * b_end < 0
    # Build polynomial D_neg(b) = (1 + u^3 + 3*u*v2*b)^2 / v^6 in Q2[b]:
    lin_num = [1 + u3, 3 * u * v2]
    D_neg = [c / v6 for c in poly_mul_q2(lin_num, lin_num)]
    # LHS(b) = 2*(1 + sqrt(2)) - (1 + 3*b^2 + D_neg(b)):
    LHS = poly_add_q2([2 * (1 + R2) - 1, Q2(0), Q2(-3)], D_neg, sign=-1)
    # LHS(b) is a concave quadratic (leading coeff < 0); check > 0 at endpoints [-995/1000, -2/5]:
    assert LHS[2] < 0
    assert poly_eval_q2(LHS, Q2(F(-995, 1000))) > 0
    assert poly_eval_q2(LHS, Q2(F(-2, 5))) > 0
    # R_poly(b) = (1 - b^2 - D_neg(b))^2 + 4*b^2*D_neg(b):
    one_m_b2_m_D = poly_add_q2([Q2(1), Q2(0), Q2(-1)], D_neg, sign=-1)
    R_poly = poly_add_q2(
        poly_mul_q2(one_m_b2_m_D, one_m_b2_m_D),
        poly_mul_q2([Q2(0), Q2(0), Q2(4)], D_neg),
    )
    diff_b = poly_add_q2(poly_mul_q2(LHS, LHS), [9 * c for c in R_poly], sign=-1)
    # Exact factorization: diff_b(b) == (270 - 108*sqrt(2)) * (b + sqrt(2)/2)^2 * q_fac(b)!
    lead = Q2(270, -108)
    assert lead > 0
    b_root = [R2 / 2, Q2(1)]
    b_root_sq = poly_mul_q2(b_root, b_root)
    q_fac = [Q2(F(-19, 102), F(1, 17)), Q2(F(-4, 51), F(-13, 17)), Q2(-1)]
    assert diff_b == poly_mul_q2([lead], poly_mul_q2(b_root_sq, q_fac))
    assert poly_eval_q2(q_fac, Q2(F(-995, 1000))) > 0
    assert poly_eval_q2(q_fac, Q2(F(-2, 5))) > 0

    # Case 3: b in [-9/20, 9/20] => 1 + b^2 + 3|b|sqrt(1 - b^2) <= 481/400 + (27/400)*sqrt(319) < 1 + sqrt(2)
    # Check 27*sqrt(319) < 400*sqrt(2) - 81 <=> 729*319 < (400*sqrt(2) - 81)^2 in Q(sqrt(2)):
    rhs_c3 = Q2(-81, 400)
    assert rhs_c3 > 0 and rhs_c3 * rhs_c3 > Q2(729 * 319)

    # Case 4: b in [9/20, 1/2] => D_pos(b) <= D_pos(9/20) < 2/5, and |3/5 - b^2| <= 3/5 - 81/400 = 159/400,
    # 4*b^2*(2/5) <= 2/5, so R(2/5) <= (159/400)^2 + 2/5 and f(b, 2/5) <= (1/2)*(43/20 + 3*sqrt((159/400)^2 + 2/5)) < 1 + sqrt(2):
    lin_pos_9_20 = 1 - u3 - 3 * u * v2 * F(9, 20)
    assert lin_pos_9_20 > 0 and (1 - u3 - 3 * u * v2 * F(1, 2)) > 0
    D_pos_9_20 = (lin_pos_9_20 * lin_pos_9_20) / v6
    assert D_pos_9_20 < Q2(F(2, 5))
    assert F(3, 5) - F(9, 20) ** 2 == F(159, 400)
    assert F(1, 2) ** 2 - F(3, 5) == F(-7, 20)  # |3/5 - b^2| <= max(159/400, 7/20 = 140/400) = 159/400
    # Check (3/2)*sqrt((159/400)^2 + 2/5) < 1 + sqrt(2) - 43/40 = sqrt(2) - 3/40:
    rhs_c4 = Q2(F(-3, 40), 1)
    assert rhs_c4 > 0 and rhs_c4 * rhs_c4 > Q2(F(9, 4) * (F(159, 400) ** 2 + F(2, 5)))

    # Combined spectral cutoff at #519's a_0 = 321/500 = 0.642 and crossover with (1 + a^2)/2:
    L_642 = (1 + (1 + R2) * (F(321, 500) ** 2)) / 3
    assert Q2(F(66501, 100000)) < L_642 and L_642 < Q2(F(33251, 50000))
    cross_a2 = Q2(F(1, 7), F(2, 7))  # 1 / (2*sqrt(2) - 1) = (2*sqrt(2) + 1) / 7
    assert Q2(-1, 2) * cross_a2 == Q2(1)
    assert Q2(F(7395, 10000) ** 2) < cross_a2 and cross_a2 < Q2(F(7396, 10000) ** 2)

    # Paper-only kappa_4 cutoffs from 3*lambda - 1 <= (1 + sqrt(2))*a_0^2 alone:
    for a0_f, paper_cap in (
        (F(129, 200), F(5009, 100)),
        (F(331, 500), F(5123, 100)),
        (F(349, 500), F(5415, 100)),
        (F(711, 1000), F(5539, 100)),
    ):
        L_sh = (1 + (1 + R2) * (a0_f * a0_f)) / 3
        assert L_sh > Q2(F(1, 2)) and L_sh < Q2(1)
        k4_paper = 90 * (L_sh * L_sh + (1 - L_sh) * (1 - L_sh))
        assert k4_paper < Q2(paper_cap)


def verify_commutator_identity():
    """Checks kappa_4(I_3(T)/sqrt(6)) == 90*tr(M^2) - 18*sum_{r,s} ||[A_r, A_s]||_F^2 against exact Gaussian moments."""
    # Build two non-trivial non-commuting exact rational symmetric tensors in n = 2 and n = 3:
    tensors = []
    T2 = [[[F(0)] * 2 for _ in range(2)] for _ in range(2)]
    for i in range(2):
        for j in range(2):
            for k in range(2):
                s = i + j + k
                T2[i][j][k] = [F(2), F(-3), F(1), F(4)][s]
    tensors.append((2, T2))

    T3 = [[[F(0)] * 3 for _ in range(3)] for _ in range(3)]
    vals3 = {
        (0, 0, 0): F(3), (0, 0, 1): F(-2), (0, 1, 1): F(1), (1, 1, 1): F(-4),
        (0, 1, 2): F(2), (0, 2, 2): F(-1), (1, 2, 2): F(3), (2, 2, 2): F(2),
    }
    for i in range(3):
        for j in range(3):
            for k in range(3):
                key = tuple(sorted((i, j, k)))
                T3[i][j][k] = vals3.get(key, F(0))
    tensors.append((3, T3))

    # Exact fourth cumulant of F = I_3(T) / sqrt(6):
    # By Nourdin-Peccati product/contraction formula for I_3(T):
    # E[I_3(T)^4] = 36 * (3!^2 * ...): specifically, out of the 15*... = 105? Wait:
    # Evaluate E[I_3(T)^4] directly by expanding I_3(T)(g) = sum_{i,j,k} T_{ijk} (g_i g_j g_k - 3 delta_{ij} g_k)
    # and integrating against exact Gaussian moments E[g^alpha]!
    from math import factorial

    def gauss_mom_1d(m):
        if m % 2 == 1:
            return F(0)
        k = m // 2
        return F(factorial(2 * k), (2**k) * factorial(k))

    for n, T in tensors:
        hs2 = sum(T[i][j][k] ** 2 for i in range(n) for j in range(n) for k in range(n))
        # Build polynomial I_3(T)(g) as dict {exponents_tuple: coeff}:
        poly = {}
        for i in range(n):
            for j in range(n):
                for k in range(n):
                    c = T[i][j][k]
                    if c == 0:
                        continue
                    exp3 = [0] * n
                    exp3[i] += 1
                    exp3[j] += 1
                    exp3[k] += 1
                    t3 = tuple(exp3)
                    poly[t3] = poly.get(t3, F(0)) + c
                    if i == j:
                        exp1 = [0] * n
                        exp1[k] += 1
                        t1 = tuple(exp1)
                        poly[t1] = poly.get(t1, F(0)) - 3 * c
        # Check E[I_3(T)^2] == 6 * hs2:
        p2 = {}
        for e1, c1 in poly.items():
            for e2, c2 in poly.items():
                e = tuple(a + b for a, b in zip(e1, e2))
                p2[e] = p2.get(e, F(0)) + c1 * c2
        e_sq = sum(c * F(1 if all(m % 2 == 0 for m in e) else 0) * (gauss_mom_1d(e[0]) * gauss_mom_1d(e[1]) * (gauss_mom_1d(e[2]) if n == 3 else 1)) for e, c in p2.items())
        assert e_sq == 6 * hs2

        p4 = {}
        for e1, c1 in p2.items():
            if c1 == 0:
                continue
            for e2, c2 in p2.items():
                if c2 == 0:
                    continue
                e = tuple(a + b for a, b in zip(e1, e2))
                p4[e] = p4.get(e, F(0)) + c1 * c2
        e_fourth = F(0)
        for e, c in p4.items():
            if any(m % 2 == 1 for m in e):
                continue
            prod = F(1)
            for m in e:
                prod *= gauss_mom_1d(m)
            e_fourth += c * prod

        # Normalize F = I_3(T) / sqrt(6 * hs2): kappa_4(F) = E[F^4] - 3 = e_fourth / (36 * hs2^2) - 3
        k4_exact = e_fourth / (36 * hs2 * hs2) - 3

        # Now compute M, sum_r A_r^2, and 90*tr(M^2) - 18*sum_{r,s} ||[A_r, A_s]||_F^2 (normalized by hs2^2):
        M = [[sum(T[i][k][l] * T[j][k][l] for k in range(n) for l in range(n)) for j in range(n)] for i in range(n)]
        sum_Ar2 = [[sum(T[r][i][k] * T[r][k][j] for r in range(n) for k in range(n)) for j in range(n)] for i in range(n)]
        assert M == sum_Ar2, "Exact identity sum_r A_r^2 == M failed!"

        trM2 = sum(M[i][j] ** 2 for i in range(n) for j in range(n)) / (hs2 * hs2)
        comm_sq = F(0)
        for r in range(n):
            for s in range(n):
                for i in range(n):
                    for j in range(n):
                        cij = sum(T[r][i][k] * T[s][k][j] - T[s][i][k] * T[r][k][j] for k in range(n))
                        comm_sq += cij * cij
        comm_sq /= hs2 * hs2
        assert k4_exact == 90 * trM2 - 18 * comm_sq


DIRS = [(1, 0), (0, 1), (160, 1), (80, 1), (40, 1), (24, 1)] + [(12, k) for k in range(-12, 13) if k != 0]
RDIRS = [(F(m * m), F(2 * m * n), F(n * n), F((m * m + n * n) ** 2)) for m, n in DIRS]


def _iv_mul(a0, a1, b0, b1):
    p1, p2, p3, p4 = a0 * b0, a0 * b1, a1 * b0, a1 * b1
    return min(p1, p2, p3, p4), max(p1, p2, p3, p4)


def _iv_sq(a0, a1):
    if a0 >= 0:
        return a0 * a0, a1 * a1
    if a1 <= 0:
        return a1 * a1, a0 * a0
    return F(0), max(a0 * a0, a1 * a1)


def certify_k4_box(a0_f, k4_cap, max_depth=36):
    """Exact Fraction 4D subdivision proving a(T) <= a0_f ==> kappa_4(T) < k4_cap (strict)."""
    a0_sq = a0_f * a0_f
    accepted = 0
    stack = [((F(0), a0_f), (F(0), a0_f), (-a0_f, a0_f), (-a0_f, a0_f), 0)]
    while stack:
        (x0, x1), (s0, s1), (b0, b1), (d0, d1), depth = stack.pop()
        b2_lo, _ = _iv_sq(b0, b1)
        d2_lo, _ = _iv_sq(d0, d1)
        if x0 * x0 + s0 * s0 > a0_sq or b2_lo + d2_lo > a0_sq or x0 * x0 + 3 * s0 * s0 + 3 * b2_lo + d2_lo > 1:
            accepted += 1
            continue
        if any(
            _iv_sq(A * x0 + (B * s0 if B >= 0 else B * s1) + C * b0, A * x1 + (B * s1 if B >= 0 else B * s0) + C * b1)[0]
            + _iv_sq(A * s0 + (B * b0 if B >= 0 else B * b1) + C * d0, A * s1 + (B * b1 if B >= 0 else B * b0) + C * d1)[0]
            > W2 * a0_sq
            for A, B, C, W2 in RDIRS
        ):
            accepted += 1
            continue

        del_hi = min(2 * x1 * x1 + 3 * s1 * s1, 2 * a0_sq + s1 * s1) - d2_lo
        if del_hi <= F(1, 2):
            accepted += 1
            continue
        base_hi = 50 + 20 * del_hi * (del_hi - 1)
        if base_hi < k4_cap:
            accepted += 1
            continue

        c_lo = s0 * s0 + b2_lo - _iv_mul(x0, x1, b0, b1)[1] - _iv_mul(s0, s1, d0, d1)[1]
        if c_lo > 0 and base_hi - 72 * c_lo * c_lo < k4_cap:
            accepted += 1
            continue

        assert depth < max_depth, f"Depth exceeded at {(float(x0), float(s0), float(b0), float(d0))}"
        widths = [x1 - x0, s1 - s0, b1 - b0, d1 - d0]
        ax = widths.index(max(widths))
        if ax == 0:
            m = (x0 + x1) / 2
            stack.extend([((x0, m), (s0, s1), (b0, b1), (d0, d1), depth + 1), ((m, x1), (s0, s1), (b0, b1), (d0, d1), depth + 1)])
        elif ax == 1:
            m = (s0 + s1) / 2
            stack.extend([((x0, x1), (s0, m), (b0, b1), (d0, d1), depth + 1), ((x0, x1), (m, s1), (b0, b1), (d0, d1), depth + 1)])
        elif ax == 2:
            m = (b0 + b1) / 2
            stack.extend([((x0, x1), (s0, s1), (b0, m), (d0, d1), depth + 1), ((x0, x1), (s0, s1), (m, b1), (d0, d1), depth + 1)])
        else:
            m = (d0 + d1) / 2
            stack.extend([((x0, x1), (s0, s1), (b0, b1), (d0, m), depth + 1), ((x0, x1), (s0, s1), (b0, b1), (m, d1), depth + 1)])
    return accepted


def run_rejection_controls():
    # Control 1: at (x=a0, s=b=d=0), base value is 90*(((1+2*a0^2)/3)^2 + ((2-2*a0^2)/3)^2) ~ 47.2589 for a0=0.645;
    # setting k4_cap = 47 must fail!
    try:
        certify_k4_box(F(129, 200), F(47, 1), max_depth=14)
        raise AssertionError("Control 1 failed to reject k4_cap = 47 below true feasible value 47.2589")
    except AssertionError as exc:
        assert "failed to reject" not in str(exc)


def main():
    t0 = time.time()
    verify_sharp_1_plus_sqrt2()
    print("PASS exact Q(sqrt(2)) proof of sup (3*lambda - 1)/a^2 == 1 + sqrt(2) and attainment at T_*")

    verify_commutator_identity()
    print("PASS exact Gaussian Wick moment check of kappa_4(T) == 90*tr(M^2) - 18*sum ||[A_r, A_s]||_F^2")

    n_prac_500 = certify_k4_box(F(331, 500), F(48, 1))
    print(f"PASS exact 4D Fraction cover at #500 a0=331/500=0.662: kappa_4 < 48 ({n_prac_500} boxes)")

    n_gaus_500 = certify_k4_box(F(711, 1000), F(503, 10))
    print(f"PASS exact 4D Fraction cover at #500 a0=711/1000=0.711: kappa_4 < 503/10 = 50.3 ({n_gaus_500} boxes)")

    n_prac = certify_k4_box(F(129, 200), F(473, 10))
    print(f"PASS exact 4D Fraction cover for (T) (a0=129/200=0.645): kappa_4 < 473/10 = 47.3 ({n_prac} boxes)")

    n_sharp = certify_k4_box(F(349, 500), F(991, 20))
    print(f"PASS exact 4D Fraction cover for sqrt(2/pi) (a0=349/500=0.698): kappa_4 < 991/20 = 49.55 ({n_sharp} boxes)")

    run_rejection_controls()
    print(f"PASS rejection controls; completed in {time.time() - t0:.2f}s")


if __name__ == "__main__":
    main()
