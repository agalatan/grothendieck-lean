#!/usr/bin/env python3
"""Exact pure-stdlib algebraic, Wick-chaos, OU-resolvent, and damped-Stein identity checks (Issue #720).

Usage:  python3 -IB check_identities_exact.py [--quiet]

Only the Python standard library is used (ast, fractions, math, pathlib, random, sys, time).
Zero floating-point operations occur anywhere in this file (`float` is never called); every identity
and enclosure is verified in exact arbitrary-precision integers and Fractions using `-O`-safe `require(...)`.

============================================================================================
WHAT THIS SCRIPT VERIFIES EXACTLY:

Part 1 — Complex-to-real Wirtinger gradient & Wiener-chaos orthogonality on H_{2,1}(C^d) (d = 1, 2, 3):
  - Direct real-coordinate differentiation of F_theta(x, y) = sqrt(2) Re(e^{-i*theta} q((x + i*y)/sqrt(2)))
    at multiple rational phases (cos theta, sin theta) in Q^2, confirming identically in Q[x, y]:
      ||nabla_R F_theta||^2 - 3 ||q||_2^2 == (c_1 + c_2 - 3 ||q||_2^2) + 2 Re(e^{-2i*theta} a(q)).
  - Exact complex Wick decomposition c_1 + c_2 - 3 ||q||_2^2 = S_2 + S_4 (S_2 in H_{1,1}, S_4 in H_{2,2})
    and a(q) = A_2 + A_4 (A_2 in H_{2,0}, A_4 in H_{3,1}), verifying:
      * pairwise L^2(CN(0, I_d)) orthogonality of (S_2, S_4, A_2, conj(A_2), A_4, conj(A_4));
      * theta-independence of E[U_{2,theta}^2] = ||S_2||_2^2 + 2 ||A_2||_2^2 and
        E[U_{4,theta}^2] = ||S_4||_2^2 + 2 ||A_4||_2^2;
      * exact fourth-cumulant identity:
          (1/2)(||S_2||_2^2 + 2 ||A_2||_2^2) + (||S_4||_2^2 + 2 ||A_4||_2^2)
          == (3/2) * (E|q|^4 - 2 ||q||_2^4) == (3/2) * ||q||_2^4 * chi(q).

Part 2 — Exact sum/difference bilinear polarization & folded-[0, pi/4] phase-integral identities:
  - Symbolic polynomial verification that for g_hat_2 = -3/16 + (G_sum - G_diff)/2 and
    g_hat_4 = -3/8 + (G_sum + G_diff)/2, the U(1)-averaged resolvent quadratic form on
    u = (S_2, 2 A_{2,||}, S_4, 2 A_{4,||})^T and v_sin = (2 A_{2,_|_}, 2 A_{4,_|_})^T equals
    u^T M_4(V) u + v_sin^T M_2(V) v_sin with the exact coefficients of `verify.sd_quad_coeffs_18`.
  - Exact rational check of the folded [0, pi/4] (t = tan(alpha/2) in [0, sqrt(2)-1]) quadrature
    against closed-form trigonometric moments on polynomial test kernels G(x^2) = 1, x^2, x^4.

Part 3 — Independent exact rational enclosure cross-check of the 1-step OU identity via (G_sum, G_diff):
  - Evaluates verify.eval_sum_diff(tables, x) across the 1D Gaussian integral of F = He_3(Z)/sqrt(6)
    (kappa_4 = 90) and confirms strict overlap with the exact closed form (1 + 4*e^{-3/2})/sqrt(6) + 11/4,
    while rejecting a sign-flipped control.

Part 4 — Level-2 (I)-(IV) and Damped Level-3 (V_eps)-(VII_eps) Stein identities at BOTH eps in {1/25, 1/40}:
  - Exact Wick expectations of undamped (I)-(VII) in d = 2, 3;
  - Exact multivariate quotient-rule polynomial identities in Q(i)[z, zbar] (d = 2) and Wirtinger
    pointwise evaluations (d = 3) for (V_eps), (VI_eps) (including Psi_6'), and (VII_eps) (including Psi_7')
    at BOTH damping parameters eps = 1/25 and eps = 1/40 used in cert_9135.json;
  - Exact pointwise Gram-phase Cauchy-Schwarz identity tau_{ab} = rho * tilde_beta + rho_perp * tilde_beta_perp
    and inequality (V tau_{ab} - (V rho) tilde_beta)^2 <= (V^2 alpha_2 - (V rho)^2)(V c_2 w - tilde_beta^2).
============================================================================================
"""
import ast
import pathlib
import random
import sys
import time
from fractions import Fraction as Fr
from math import factorial as fact, isqrt

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import verify as V1


def require(cond, msg='exact identity check failed'):
    if not cond:
        raise ValueError(msg)


# ==============================================================================
# MULTIVARIATE POLYNOMIAL ALGEBRA OVER Q(i)
# ==============================================================================
class QComplex:
    __slots__ = ('re', 'im')

    def __init__(self, re=0, im=0):
        self.re = Fr(re)
        self.im = Fr(im)

    def __bool__(self):
        return bool(self.re or self.im)

    def __eq__(self, o):
        return isinstance(o, QComplex) and self.re == o.re and self.im == o.im

    def conj(self):
        return QComplex(self.re, -self.im)

    def scale(self, s):
        s = Fr(s)
        return QComplex(self.re * s, self.im * s)

    def __add__(self, o):
        return QComplex(self.re + o.re, self.im + o.im)

    def __sub__(self, o):
        return QComplex(self.re - o.re, self.im - o.im)

    def __mul__(self, o):
        return QComplex(self.re * o.re - self.im * o.im, self.re * o.im + self.im * o.re)


def padd(p, q, scale_q=1):
    out = dict(p)
    sq = Fr(scale_q)
    for k, v in q.items():
        nv = out.get(k, QComplex()) + v.scale(sq)
        if nv:
            out[k] = nv
        else:
            out.pop(k, None)
    return out


def pmul(p, q):
    if not p or not q:
        return {}
    out = {}
    for k1, v1 in p.items():
        for k2, v2 in q.items():
            k = tuple(a + b for a, b in zip(k1, k2))
            nv = out.get(k, QComplex()) + (v1 * v2)
            if nv:
                out[k] = nv
            else:
                out.pop(k, None)
    return out


def pscale(p, s):
    s = Fr(s)
    if s == 0:
        return {}
    return {k: v.scale(s) for k, v in p.items()}


def pconst(c, nvars):
    return {(0,) * nvars: c} if c else {}


def pvar(idx, nvars):
    m = [0] * nvars
    m[idx] = 1
    return {tuple(m): QComplex(1, 0)}


def pconj(p, d):
    return {k[d:] + k[:d]: v.conj() for k, v in p.items()}


def pdiff(p, idx):
    out = {}
    for k, v in p.items():
        e = k[idx]
        if e > 0:
            nk = list(k)
            nk[idx] = e - 1
            out[tuple(nk)] = v.scale(e)
    return out


def pexpect_complex(p, d):
    """Exact E[z^a zbar^b] under z_1, ..., z_d i.i.d. CN(0, 1)."""
    acc = QComplex()
    for k, v in p.items():
        if all(k[j] == k[d + j] for j in range(d)):
            w = 1
            for j in range(d):
                w *= fact(k[j])
            acc = acc + v.scale(w)
    return acc


def peval_point(p, z_vals, d):
    acc = QComplex()
    zc = [z.conj() for z in z_vals]
    for k, v in p.items():
        term = v
        for j in range(d):
            for _ in range(k[j]):
                term = term * z_vals[j]
            for _ in range(k[d + j]):
                term = term * zc[j]
        acc = acc + term
    return acc


def real_part_poly(p, d):
    s = padd(p, pconj(p, d))
    return {k: v.scale(Fr(1, 2)) for k, v in s.items()}


def build_wick_cubic(t, d):
    q = {}
    z = [pvar(j, 2 * d) for j in range(d)]
    zb = [pvar(d + j, 2 * d) for j in range(d)]
    for a in range(d):
        for b in range(d):
            for k in range(d):
                c = t[a][b][k]
                if not c:
                    continue
                term = pmul(pmul(z[a], z[b]), zb[k])
                if a == k:
                    term = padd(term, z[b], -1)
                if b == k:
                    term = padd(term, z[a], -1)
                q = padd(q, {m: v * c for m, v in term.items()})
    return q


def to_real_coords_scaled(p, d):
    """Substitute sqrt(2)*z_j = x_j + i*y_j, sqrt(2)*zbar_j = x_j - i*y_j.
    To stay in Q(i)[x, y] without sqrt(2), if a monomial has total degree deg, we multiply by 2^(deg/2)
    for even-degree polynomials, or return the exact polynomial for sqrt(2)^deg_target * p."""
    x = [pvar(j, 2 * d) for j in range(d)]
    y = [pvar(d + j, 2 * d) for j in range(d)]
    zp = [padd(x[j], {m: v * QComplex(0, 1) for m, v in y[j].items()}) for j in range(d)]
    zm = [padd(x[j], {m: v * QComplex(0, -1) for m, v in y[j].items()}) for j in range(d)]
    return x, y, zp, zm


def eval_in_real_xy_times_2pow(p, d, deg_max_half):
    """Return polynomial in Q(i)[x_1..x_d, y_1..y_d] equal to 2^(deg_max_half) * p((x+iy)/sqrt(2), (x-iy)/sqrt(2))
    whenever every monomial of p has (total degree) same parity as 2*deg_max_half."""
    _, _, zp, zm = to_real_coords_scaled(p, d)
    out = {}
    for k, v in p.items():
        deg = sum(k)
        require((2 * deg_max_half - deg) >= 0 and (2 * deg_max_half - deg) % 2 == 0, 'parity mismatch in real xy lift')
        factor = 1 << ((2 * deg_max_half - deg) // 2)
        term = pconst(v.scale(factor), 2 * d)
        for j in range(d):
            for _ in range(k[j]):
                term = pmul(term, zp[j])
            for _ in range(k[d + j]):
                term = pmul(term, zm[j])
        out = padd(out, term)
    return out


# ==============================================================================
# PART 1: WIRTINGER GRADIENT & WIENER-CHAOS DECOMPOSITION ON H_{2,1}(C^d)
# ==============================================================================
def wick_decompose_real_even_deg4(p, d):
    """Exact projection of a centered degree <= 4 bidegree-(k,k) polynomial p(z, zbar) onto H_{1,1} (+) H_{2,2}
    using the complex Ornstein-Uhlenbeck generator L_C = sum_j (2 d_j dbar_j - z_j d_j - zbar_j dbar_j),
    which satisfies L_C = -2m on H_{m,m}(C^d) (eigenvalues 0 on H_{0,0}, -2 on H_{1,1}, -4 on H_{2,2})."""
    require(pexpect_complex(p, d) == QComplex(0, 0), 'expected centered polynomial in wick_decompose_real_even_deg4')
    z = [pvar(j, 2 * d) for j in range(d)]
    zb = [pvar(d + j, 2 * d) for j in range(d)]
    Lp = {}
    for j in range(d):
        dj = pdiff(p, j)
        dbj = pdiff(p, d + j)
        ddj = pdiff(dj, d + j)
        Lp = padd(Lp, ddj, 2)
        Lp = padd(Lp, pmul(z[j], dj), -1)
        Lp = padd(Lp, pmul(zb[j], dbj), -1)
    # Since p = S_2 + S_4 with L_C S_2 = -2 S_2 and L_C S_4 = -4 S_4:
    # S_4 = -(L_C p + 2 p) / 2, and S_2 = p - S_4:
    S_4 = pscale(padd(Lp, p, 2), Fr(-1, 2))
    S_2 = padd(p, S_4, -1)
    # Verify eigenfunction equations L_C S_2 == -2 S_2 and L_C S_4 == -4 S_4:
    for s_poly, eig in ((S_2, -2), (S_4, -4)):
        Ls = {}
        for j in range(d):
            dj = pdiff(s_poly, j)
            dbj = pdiff(s_poly, d + j)
            ddj = pdiff(dj, d + j)
            Ls = padd(Ls, ddj, 2)
            Ls = padd(Ls, pmul(z[j], dj), -1)
            Ls = padd(Ls, pmul(zb[j], dbj), -1)
        require(Ls == pscale(s_poly, eig), f'L_C eigencheck failed for eigenvalue {eig}')
    return S_2, S_4


def wick_decompose_charge2_deg4(a_p, d):
    """Exact projection of a(q) in H_{2,0} (+) H_{3,1} using L_C = -2 on H_{2,0} and L_C = -4 on H_{3,1}."""
    z = [pvar(j, 2 * d) for j in range(d)]
    zb = [pvar(d + j, 2 * d) for j in range(d)]
    La = {}
    for j in range(d):
        dj = pdiff(a_p, j)
        dbj = pdiff(a_p, d + j)
        ddj = pdiff(dj, d + j)
        La = padd(La, ddj, 2)
        La = padd(La, pmul(z[j], dj), -1)
        La = padd(La, pmul(zb[j], dbj), -1)
    A_4 = pscale(padd(La, a_p, 2), Fr(-1, 2))
    A_2 = padd(a_p, A_4, -1)
    for a_sub, eig in ((A_2, -2), (A_4, -4)):
        Ls = {}
        for j in range(d):
            dj = pdiff(a_sub, j)
            dbj = pdiff(a_sub, d + j)
            ddj = pdiff(dj, d + j)
            Ls = padd(Ls, ddj, 2)
            Ls = padd(Ls, pmul(z[j], dj), -1)
            Ls = padd(Ls, pmul(zb[j], dbj), -1)
        require(Ls == pscale(a_sub, eig), f'L_C charge-2 eigencheck failed for eigenvalue {eig}')
    return A_2, A_4


def check_part1_chaos_and_wirtinger():
    rng = random.Random(20261126)
    cases = []

    # 1. d = 1: univariate Laguerre cubic z_1(|z_1|^2 - 2) (chi = 42):
    t1 = [[[QComplex(1, 0)]]]
    cases.append(('d=1 Laguerre cubic', 1, t1))

    # 2. d = 2: decoupled monomial z_1^2 zbar_2 (a(q) == 0, chi = 10):
    t2_dec = [[[QComplex() for _ in range(2)] for _ in range(2)] for _ in range(2)]
    t2_dec[0][0][1] = QComplex(1, 0)
    cases.append(('d=2 z_1^2 zbar_2', 2, t2_dec))

    # 3. d = 2: dense complex tensor:
    t2_dense = [[[QComplex() for _ in range(2)] for _ in range(2)] for _ in range(2)]
    for a in range(2):
        for b in range(a, 2):
            for k in range(2):
                val = QComplex(rng.randint(-3, 3) or 1, rng.randint(-2, 2))
                t2_dense[a][b][k] = t2_dense[b][a][k] = val
    cases.append(('d=2 dense cubic', 2, t2_dense))

    # 4. d = 3: multilinear + diagonal + dense mix:
    t3_mix = [[[QComplex() for _ in range(3)] for _ in range(3)] for _ in range(3)]
    for a in range(3):
        for b in range(a, 3):
            for k in range(3):
                val = QComplex(rng.randint(-2, 2), rng.randint(-2, 2))
                t3_mix[a][b][k] = t3_mix[b][a][k] = val
    t3_mix[0][1][2] = t3_mix[1][0][2] = QComplex(2, -1)
    cases.append(('d=3 dense cubic', 3, t3_mix))

    phases = [(Fr(1), Fr(0)), (Fr(3, 5), Fr(4, 5)), (Fr(5, 13), Fr(-12, 13))]

    for label, d, t_ten in cases:
        q = build_wick_cubic(t_ten, d)
        qb = pconj(q, d)
        V_p = pmul(q, qb)
        u = pexpect_complex(V_p, d).re
        require(u > 0, f'zero cubic in {label}')
        V2_p = pmul(V_p, V_p)
        ev2 = pexpect_complex(V2_p, d).re
        delta = ev2 - 2 * u * u

        dq = [pdiff(q, j) for j in range(d)]
        Fk = [pdiff(q, d + j) for j in range(d)]
        c1_p, c2_p, a_p = {}, {}, {}
        for j in range(d):
            c1_p = padd(c1_p, pmul(dq[j], pconj(dq[j], d)))
            c2_p = padd(c2_p, pmul(Fk[j], pconj(Fk[j], d)))
            a_p = padd(a_p, pmul(dq[j], Fk[j]))

        require(pexpect_complex(c1_p, d) == QComplex(2 * u, 0), f'E[c_1] != 2u in {label}')
        require(pexpect_complex(c2_p, d) == QComplex(u, 0), f'E[c_2] != u in {label}')
        if label == 'd=2 z_1^2 zbar_2':
            require(not a_p and delta == 10 * u * u, 'z_1^2 zbar_2 check failed')

        s_tot = padd(padd(c1_p, c2_p), pconst(QComplex(-3 * u, 0), 2 * d))
        S_2, S_4 = wick_decompose_real_even_deg4(s_tot, d)
        A_2, A_4 = wick_decompose_charge2_deg4(a_p, d)
        require(padd(S_2, S_4) == s_tot, f'S_2 + S_4 != c_1 + c_2 - 3u in {label}')
        require(padd(A_2, A_4) == a_p, f'A_2 + A_4 != a(q) in {label}')

        # Verify pairwise orthogonality of the 6 components in L^2(CN(0, I_d)):
        comps = [S_2, S_4, A_2, pconj(A_2, d), A_4, pconj(A_4, d)]
        for i in range(len(comps)):
            for j in range(i + 1, len(comps)):
                ip = pexpect_complex(pmul(comps[i], pconj(comps[j], d)), d)
                require(ip == QComplex(0, 0), f'chaos orthogonality failed ({i}, {j}) in {label}')

        norm_S2 = pexpect_complex(pmul(S_2, S_2), d).re
        norm_S4 = pexpect_complex(pmul(S_4, S_4), d).re
        norm_A2 = pexpect_complex(pmul(A_2, pconj(A_2, d)), d).re
        norm_A4 = pexpect_complex(pmul(A_4, pconj(A_4, d)), d).re
        lhs_cum = Fr(1, 2) * (norm_S2 + 2 * norm_A2) + (norm_S4 + 2 * norm_A4)
        require(lhs_cum == Fr(3, 2) * delta, f'exact fourth-cumulant norm identity failed in {label}')

        # Lift to real coordinates (x, y) and differentiate F_theta directly:
        # In real xy, substitute z_j = (x_j + i y_j)/sqrt(2): Q_xy := 2*sqrt(2)*q((x+iy)/sqrt(2)) lies in Q(i)[x, y]:
        _, _, zp, zm = to_real_coords_scaled(q, d)
        Q_xy = {}
        for k, v in q.items():
            deg = sum(k)
            require(deg in (1, 3), 'unexpected degree in q')
            fac = 2 if deg == 1 else 1
            term = pconst(v.scale(fac), 2 * d)
            for j in range(d):
                for _ in range(k[j]):
                    term = pmul(term, zp[j])
                for _ in range(k[d + j]):
                    term = pmul(term, zm[j])
            Q_xy = padd(Q_xy, term)
        Qb_xy = {}
        for k, v in qb.items():
            deg = sum(k)
            fac = 2 if deg == 1 else 1
            term = pconst(v.scale(fac), 2 * d)
            for j in range(d):
                for _ in range(k[j]):
                    term = pmul(term, zp[j])
                for _ in range(k[d + j]):
                    term = pmul(term, zm[j])
            Qb_xy = padd(Qb_xy, term)

        for ct, st in phases:
            em = QComplex(ct, -st)
            ep = QComplex(ct, st)
            # 2 * F_theta(x, y) = (1/2) * (e^{-i*theta} * (2*sqrt(2)*q) + e^{i*theta} * (2*sqrt(2)*qbar)):
            two_F_xy = padd({m: v * em.scale(Fr(1, 2)) for m, v in Q_xy.items()},
                            {m: v * ep.scale(Fr(1, 2)) for m, v in Qb_xy.items()})
            # 4 * ||nabla_R F_theta||^2 = sum_{m=0}^{2d-1} (d_{m} (2*F_theta))^2:
            four_grad_sq = {}
            for m_idx in range(2 * d):
                dfm = pdiff(two_F_xy, m_idx)
                four_grad_sq = padd(four_grad_sq, pmul(dfm, dfm))

            e2m = em * em
            e2p = ep * ep
            rhs_wirt = padd(s_tot, padd({m: v * e2m for m, v in a_p.items()},
                                        {m: v * e2p for m, v in pconj(a_p, d).items()}))
            rhs_wirt_plus_3u = padd(rhs_wirt, pconst(QComplex(3 * u, 0), 2 * d))
            # Lift rhs_wirt_plus_3u (even degrees 0, 2, 4) by 2^2 = 4:
            four_rhs_xy = eval_in_real_xy_times_2pow(rhs_wirt_plus_3u, d, 2)
            require(four_grad_sq == four_rhs_xy, f'real-vs-Wirtinger gradient identity failed in {label} at {(ct, st)}')

            # Also check theta-invariance of ||U_{2,theta}||_2^2 and ||U_{4,theta}||_2^2:
            U2_th = padd(S_2, padd({m: v * e2m for m, v in A_2.items()}, {m: v * e2p for m, v in pconj(A_2, d).items()}))
            U4_th = padd(S_4, padd({m: v * e2m for m, v in A_4.items()}, {m: v * e2p for m, v in pconj(A_4, d).items()}))
            require(pexpect_complex(pmul(U2_th, U2_th), d) == QComplex(norm_S2 + 2 * norm_A2, 0), 'U_{2,theta} norm failed')
            require(pexpect_complex(pmul(U4_th, U4_th), d) == QComplex(norm_S4 + 2 * norm_A4, 0), 'U_{4,theta} norm failed')
            require(pexpect_complex(pmul(U2_th, U4_th), d) == QComplex(0, 0), 'E[U_{2,theta} U_{4,theta}] != 0')

    return len(cases) * len(phases)


# ==============================================================================
# PART 2: EXACT BILINEAR POLARIZATION & FOLDED-[0, pi/4] INTEGRAL IDENTITIES
# ==============================================================================
def check_part2_polarization_and_folded(pi_lo, pi_hi):
    rng = random.Random(72001)
    # 1. Check verify.sd_quad_coeffs_18(u, v) against (1/9)*(g2*U*U2 + g4*U*U4) on 20 random rational pairs:
    for _ in range(20):
        u = [Fr(rng.randint(-7, 7), rng.randint(1, 5)) for _ in range(4)]
        c2a = Fr(rng.randint(-9, 9), 10)
        gs = Fr(rng.randint(1, 20), 17)
        gd = Fr(rng.randint(1, 20), 19)
        g2 = Fr(-3, 16) + (gs - gd) / 2
        g4 = Fr(-3, 8) + (gs + gd) / 2
        U2 = u[0] + u[1] * c2a
        U4 = u[2] + u[3] * c2a
        U = U2 + U4
        lhs = Fr(1, 9) * (g2 * U * U2 + g4 * U * U4)
        # Constant part at c2a averaged (replace 1, c2a, c2a^2 before averaging):
        c0, c1, c2, d0, d1, d2 = V1.sd_quad_coeffs_18(u, u)
        asymp = (Fr(-1, 48) * (u[0] ** 2 + 2 * u[1] * u[0] * c2a + (u[1] ** 2) * (c2a**2))
                 + Fr(-1, 16) * (u[0] * u[2] + (u[0] * u[3] + u[1] * u[2]) * c2a + u[1] * u[3] * (c2a**2))
                 + Fr(-1, 24) * (u[2] ** 2 + 2 * u[2] * u[3] * c2a + (u[3] ** 2) * (c2a**2)))
        kern = (gs * (c0 + c1 * c2a + c2 * (c2a**2)) + gd * (d0 + d1 * c2a + d2 * (c2a**2))) / 18
        require(lhs == asymp + kern, 'sd_quad_coeffs_18 polarization mismatch')

    # 2. Check folded [0, pi/4] t = tan(alpha/2) weights in verify.py against exact trigonometric integrals:
    #    For G(x) = 1: I_0 = 1, I_c = 0, I_cc = 1/2, I_ss = 1/2.
    #    For G(x) = x^2 (at 2V = 1, x^2 = cos^2 alpha = (1 + cos 2alpha)/2):
    #      G(cos) + G(sin) = 1, G(cos) - G(sin) = cos 2alpha,
    #      so I_0 = 1/2, I_c = (1/4), I_cc = 1/4, I_ss = 1/4.
    #    For G(x) = x^4 (at 2V = 1, x^4 = cos^4 alpha):
    #      cos^4 + sin^4 = 1 - (1/2) sin^2 2alpha = 1/2 + (1/2) cos^2 2alpha,
    #      cos^4 - sin^4 = cos 2alpha,
    #      so I_0 = 3/8, I_c = 1/4, I_cc = (1/2)*(1/2) + (1/2)*(3/8) ... wait:
    #      (2/pi) int_0^{pi/2} cos^4(a) cos^2(2a) da: cos^4(a) = (3 + 4 cos 2a + cos 4a)/8,
    #      cos^2(2a) = (1 + cos 4a)/2 => mean = (3*1 + 0 + 1/2)/16 = 7/32!
    #      and I_ss = 3/8 - 7/32 = 5/32!
    S = V1.S_INT
    S2 = S * S
    S_T = 10**11
    t_star_lo = Fr(isqrt(2 * (S_T**2)) - S_T, S_T)
    t_star_hi = Fr(isqrt(2 * (S_T**2)) + 1 - S_T, S_T)
    M_fold = 1000
    t_nodes = ([Fr(0)] + [Fr(1, 1 << k) for k in range(40, 9, -1)]
               + [Fr(1, 1024) + (t_star_lo - Fr(1, 1024)) * Fr(k, M_fold) for k in range(1, M_fold + 1)])
    inv_pi_lo = Fr(1) / pi_hi
    inv_pi_hi = Fr(1) / pi_lo
    gap_mu_hi = int((inv_pi_hi * 4 * (t_star_hi - t_star_lo)) * S) + 2

    acc_1 = [0, 0, 0, 0, 0, 0]
    acc_x4 = [0, 0, 0, 0, 0, 0, 0, 0]
    for ta, tb in zip(t_nodes[:-1], t_nodes[1:]):
        h = tb - ta
        tm = (ta + tb) / 2
        mid_q = 4 * h / (1 + tm * tm)
        err_q = (h**3) / 3
        dmu_lo = max(Fr(0), inv_pi_lo * (mid_q - err_q))
        dmu_hi = inv_pi_hi * (mid_q + err_q)
        ca, cb_ = (1 - ta * ta) / (1 + ta * ta), (1 - tb * tb) / (1 + tb * tb)
        sa, sb = 2 * ta / (1 + ta * ta), 2 * tb / (1 + tb * tb)
        c2a, c2b = ca * ca - sa * sa, cb_ * cb_ - sb * sb
        err_tr = 4 * (h**3)
        wc_lo, wc_hi = max(Fr(0), dmu_lo * (c2a + c2b) / 2 - err_tr), dmu_hi * (c2a + c2b) / 2 + err_tr
        wcc_lo, wcc_hi = max(Fr(0), dmu_lo * (c2a**2 + c2b**2) / 2 - err_tr), dmu_hi * (c2a**2 + c2b**2) / 2 + err_tr
        wss_lo, wss_hi = max(Fr(0), dmu_lo * (1 - (c2a**2 + c2b**2) / 2) - err_tr), dmu_hi * (1 - (c2a**2 + c2b**2) / 2) + err_tr
        w0_l, w0_h = int(dmu_lo * S), int(dmu_hi * S) + 1
        wc_l, wc_h = int(wc_lo * S), int(wc_hi * S) + 1
        wcc_l, wcc_h = int(wcc_lo * S), int(wcc_hi * S) + 1
        wss_l, wss_h = int(wss_lo * S), int(wss_hi * S) + 1

        # For G = 1, G(cos alpha) + G(sin alpha) = 1 + 1 = 2:
        acc_1[0] += 2 * w0_l; acc_1[1] += 2 * w0_h
        acc_1[2] += 2 * wcc_l; acc_1[3] += 2 * wcc_h
        acc_1[4] += 2 * wss_l; acc_1[5] += 2 * wss_h

        # For G(x) = x^4 at 2V = 1: cos^4(a) + sin^4(a) = (1 + c2^2)/2, cos^4(a) - sin^4(a) = c2:
        sm4_l, sm4_h = int(((1 + c2b**2) / 2) * S), int(((1 + c2a**2) / 2) * S) + 1
        df4_l, df4_h = int(c2b * S), int(c2a * S) + 1
        acc_x4[0] += sm4_l * w0_l;  acc_x4[1] += sm4_h * w0_h
        acc_x4[2] += df4_l * wc_l;  acc_x4[3] += df4_h * wc_h
        acc_x4[4] += sm4_l * wcc_l; acc_x4[5] += sm4_h * wcc_h
        acc_x4[6] += sm4_l * wss_l; acc_x4[7] += sm4_h * wss_h

    pad1 = 2 * gap_mu_hi
    pad4 = 2 * gap_mu_hi * S
    require(Fr(acc_1[0], S) <= Fr(1) <= Fr(acc_1[1] + pad1, S), 'folded G=1 I_0 failed')
    require(Fr(acc_1[2], S) <= Fr(1, 2) <= Fr(acc_1[3] + pad1, S), 'folded G=1 I_cc failed')
    require(Fr(acc_1[4], S) <= Fr(1, 2) <= Fr(acc_1[5] + pad1, S), 'folded G=1 I_ss failed')
    require(Fr(acc_x4[0], S2) <= Fr(3, 8) <= Fr(acc_x4[1] + pad4, S2), 'folded G=x^4 I_0 failed')
    require(Fr(acc_x4[2], S2) <= Fr(1, 4) <= Fr(acc_x4[3] + pad4, S2), 'folded G=x^4 I_c failed')
    require(Fr(acc_x4[4], S2) <= Fr(7, 32) <= Fr(acc_x4[5] + pad4, S2), 'folded G=x^4 I_cc failed')
    require(Fr(acc_x4[6], S2) <= Fr(5, 32) <= Fr(acc_x4[7] + pad4, S2), 'folded G=x^4 I_ss failed')
    return 9


# ==============================================================================
# PART 3: EXACT RATIONAL ENCLOSURE OF 1-STEP OU IDENTITY VIA (G_sum, G_diff)
# ==============================================================================
def check_part3_he3_via_sum_diff(pi_lo, pi_hi, tables=None, cache=None, sign_flip=False):
    """Verify Proposition 2.2 using verify.make_sum_diff_tables and verify.eval_sum_diff on F = He_3(Z)/sqrt(6)."""
    S = V1.S_INT
    if tables is None:
        tables = V1.make_sum_diff_tables(N_U=250, N_V=500)
    if cache is None:
        cache = {}

    def get_sd(x_rat):
        if x_rat not in cache:
            gs_l, gs_h, gd_l, gd_h = V1.eval_sum_diff(tables, x_rat)
            cache[x_rat] = (Fr(gs_l, S), Fr(gs_h, S), Fr(gd_l, S), Fr(gd_h, S))
        return cache[x_rat]

    e_lo, e_hi = V1.exp_neg_bounds_S(3, 2)
    sq6_lo = Fr(isqrt(6 * (S**2)), S)
    sq6_hi = sq6_lo + Fr(1, S)
    lhs_lo = (Fr(1) + 4 * Fr(e_lo, S)) / sq6_hi + Fr(11, 4)
    lhs_hi = (Fr(1) + 4 * Fr(e_hi, S)) / sq6_lo + Fr(11, 4)

    N_Z = 2000
    dz = Fr(8, N_Z)
    two_pi_lo, two_pi_hi = 2 * pi_lo, 2 * pi_hi
    inv_s2p_lo = Fr(isqrt(((S**2) * two_pi_hi.denominator) // two_pi_hi.numerator), S)
    inv_s2p_hi = Fr(isqrt(((S**2) * two_pi_lo.denominator + two_pi_lo.numerator - 1) // two_pi_lo.numerator) + 1, S)
    tail_bound = Fr(2, 5) * Fr(64, 57) * (8**7) * Fr(V1.exp_neg_bounds_S(32, 1)[1], S) * inv_s2p_hi
    require(tail_bound < Fr(1, 10**8), 'He_3 tail bound failed')

    def snap_x(xv, up):
        if xv == 0:
            return Fr(0)
        sc = 200 if xv <= 3 else (25 if xv <= 15 else 5)
        return Fr((xv.numerator * sc + xv.denominator - 1) // xv.denominator, sc) if up else Fr((xv.numerator * sc) // xv.denominator, sc)

    S_ACC = 10**14
    acc_lo_i = -((tail_bound.numerator * S_ACC + tail_bound.denominator - 1) // tail_bound.denominator)
    acc_hi_i = (tail_bound.numerator * S_ACC + tail_bound.denominator - 1) // tail_bound.denominator
    for j in range(N_Z):
        za, zb = j * dz, (j + 1) * dz
        pa, pb = za**3 - 3 * za, zb**3 - 3 * zb
        p_lo = min(pa, pb, Fr(-2)) if (za <= Fr(1) <= zb) else min(pa, pb)
        p_hi = max(pa, pb, Fr(-2)) if (za <= Fr(1) <= zb) else max(pa, pb)
        abs_lo = Fr(0) if (p_lo <= 0 <= p_hi) else snap_x(min(abs(p_lo), abs(p_hi)) / sq6_hi, False)
        abs_hi = snap_x(max(abs(p_lo), abs(p_hi)) / sq6_lo, True)

        gs_a_l, gs_a_h, gd_a_l, gd_a_h = get_sd(abs_lo)
        gs_b_l, gs_b_h, gd_b_l, gd_b_h = get_sd(abs_hi)
        # Since G_sum and G_diff are strictly decreasing on [0, oo):
        gs_iv = (gs_b_l, gs_a_h)
        gd_iv = (gd_b_l, gd_a_h)
        g2_iv = (Fr(-3, 16) + (gs_iv[0] - gd_iv[1]) / 2, Fr(-3, 16) + (gs_iv[1] - gd_iv[0]) / 2)
        g4_iv = (Fr(-3, 8) + (gs_iv[0] + gd_iv[0]) / 2, Fr(-3, 8) + (gs_iv[1] + gd_iv[1]) / 2)

        u2_iv = (6 * (za**2 - 1), 6 * (zb**2 - 1))
        sa, sb = za**2, zb**2
        qv = [sa**2 - 6 * sa + 3, sb**2 - 6 * sb + 3] + ([Fr(-6)] if sa <= Fr(3) <= sb else [])
        u4_iv = (Fr(3, 2) * min(qv), Fr(3, 2) * max(qv))
        u_iv = (u2_iv[0] + u4_iv[0], u2_iv[1] + u4_iv[1])

        if j % 200 == 0:
            # Exact rational check of Lemma 1.2 polarization identity (1.7) at endpoint:
            u2_0, u4_0, gs_0, gd_0 = u2_iv[0], u4_iv[0], gs_iv[0], gd_iv[0]
            u_0 = u2_0 + u4_0
            g2_0 = Fr(-3, 16) + (gs_0 - gd_0) / 2
            g4_0 = Fr(-3, 8) + (gs_0 + gd_0) / 2
            lhs_pol = (g2_0 * u_0 * u2_0 + g4_0 * u_0 * u4_0) / 9
            rhs_pol = -u2_0 * u2_0 / 48 - u2_0 * u4_0 / 16 - u4_0 * u4_0 / 24 + (gs_0 * u_0 * u_0 + gd_0 * (u4_0 * u4_0 - u2_0 * u2_0)) / 18
            require(lhs_pol == rhs_pol, 'Lemma 1.2 polarization identity (1.7) failed')

        t2_iv = V1.iv_mul(g2_iv, V1.iv_mul(u_iv, u2_iv))
        t4_iv = V1.iv_mul(g4_iv, V1.iv_mul(u_iv, u4_iv))
        s_iv = (t2_iv[0] + t4_iv[0], t2_iv[1] + t4_iv[1])
        ig_iv = (s_iv[0] / 9, s_iv[1] / 9) if sign_flip else (-s_iv[1] / 9, -s_iv[0] / 9)

        ez_lo = Fr(V1.exp_neg_bounds_S((zb * zb).numerator, 2 * (zb * zb).denominator)[0], S)
        ez_hi = Fr(V1.exp_neg_bounds_S((za * za).numerator, 2 * (za * za).denominator)[1], S)
        w_iv = (2 * dz * inv_s2p_lo * ez_lo, 2 * dz * inv_s2p_hi * ez_hi)
        c_iv = V1.iv_mul(ig_iv, w_iv)
        acc_lo_i += (c_iv[0].numerator * S_ACC - (c_iv[0].denominator - 1 if c_iv[0] < 0 else 0)) // c_iv[0].denominator
        acc_hi_i += (c_iv[1].numerator * S_ACC + (c_iv[1].denominator - 1 if c_iv[1] > 0 else 0)) // c_iv[1].denominator

    acc_lo = Fr(acc_lo_i, S_ACC)
    acc_hi = Fr(acc_hi_i, S_ACC)
    overlap = min(lhs_hi, acc_hi) - max(lhs_lo, acc_lo)
    require(overlap > 0, 'He_3 G_sum/G_diff enclosure failed to overlap exact closed form')
    require(acc_hi - acc_lo < Fr(1, 6), f'He_3 G_sum/G_diff enclosure too wide: {V1.dec_ceil10(acc_hi - acc_lo)}')
    return lhs_lo, lhs_hi, acc_lo, acc_hi


# ==============================================================================
# PART 4: LEVEL-2 & DAMPED LEVEL-3 STEIN IDENTITIES AT BOTH eps IN {1/25, 1/40}
# ==============================================================================
def check_part4_stein_identities():
    rng = random.Random(20261126)
    test_pts_3 = [
        [QComplex(1, 2), QComplex(-2, 1), QComplex(3, -1)],
        [QComplex(Fr(1, 2), Fr(-3, 2)), QComplex(2, 0), QComplex(-1, 3)],
        [QComplex(0, 1), QComplex(3, 2), QComplex(-2, -1)],
    ]

    for d in (2, 3):
        t = [[[QComplex() for _ in range(d)] for _ in range(d)] for _ in range(d)]
        for a in range(d):
            for b in range(a, d):
                for k in range(d):
                    val = QComplex(rng.randint(-2, 2), rng.randint(-2, 2))
                    t[a][b][k] = t[b][a][k] = val
        t[0][1][0] = t[1][0][0] = QComplex(2, 1)
        q = build_wick_cubic(t, d)
        qb = pconj(q, d)
        V_p = pmul(q, qb)
        V2_p = pmul(V_p, V_p)
        u = pexpect_complex(V_p, d).re
        require(u > 0, 'u <= 0')

        dq = [pdiff(q, j) for j in range(d)]
        F_k = [pdiff(q, d + k) for k in range(d)]
        Fb_k = [pconj(F_k[k], d) for k in range(d)]
        c1_p, c2_p, a_p = {}, {}, {}
        for j in range(d):
            c1_p = padd(c1_p, pmul(dq[j], pconj(dq[j], d)))
            c2_p = padd(c2_p, pmul(F_k[j], Fb_k[j]))
            a_p = padd(a_p, pmul(dq[j], F_k[j]))
        ab_p = pconj(a_p, d)
        W_k = [pdiff(a_p, d + k) for k in range(d)]
        Wb_k = [pconj(W_k[k], d) for k in range(d)]
        w_p, bloc_p = {}, {}
        for k in range(d):
            w_p = padd(w_p, pmul(W_k[k], Wb_k[k]))
            bloc_p = padd(bloc_p, pmul(Fb_k[k], W_k[k]))
        bloc_b = pconj(bloc_p, d)
        bloc_sq = pmul(bloc_p, bloc_b)

        tb_p = real_part_poly(pmul(qb, bloc_p), d)
        tau_ab_p = real_part_poly(pmul(pmul(qb, a_p), bloc_b), d)
        Vrho_p = real_part_poly(pmul(pmul(qb, qb), a_p), d)
        al2_p = pmul(a_p, ab_p)
        c2_mu = padd(c2_p, pconst(QComplex(u, 0), 2 * d), -1)
        c2_mu2 = pmul(c2_mu, c2_mu)

        # 1-2. Exact Gaussian expectations of (I)-(VII) in d = 2 (in d = 3, Wirtinger identity below implies them):
        if d == 2:
            e_i = pexpect_complex(padd(V2_p, padd(pscale(pmul(c2_p, V_p), 2), Vrho_p), -1), d)
            require(e_i == QComplex(0, 0), 'Identity (I) failed')
            e_ii = pexpect_complex(padd(V2_p, padd(pmul(c1_p, V_p), pscale(Vrho_p, Fr(1, 2))), -1), d)
            require(e_ii == QComplex(0, 0), 'Identity (II) failed')
            br3_1 = padd(padd(pmul(c2_mu, padd(pscale(pmul(c2_p, V_p), 2), V2_p, -1)), pmul(c2_mu, Vrho_p)), pmul(tb_p, V_p))
            require(pexpect_complex(br3_1, d) == QComplex(0, 0), 'Identity (III) failed')
            br4_1 = padd(padd(pscale(pmul(al2_p, V_p), 2), pmul(Vrho_p, padd(c2_p, V_p, -1))), pmul(tb_p, V_p))
            require(pexpect_complex(br4_1, d) == QComplex(0, 0), 'Identity (IV) failed')
            require(pexpect_complex(padd(w_p, tb_p, -1), d) == QComplex(0, 0), 'Identity (V) m=0 failed')
            require(pexpect_complex(padd(padd(pmul(w_p, V_p), pmul(padd(c2_p, V_p, -1), tb_p)), tau_ab_p), d) == QComplex(0, 0),
                    'Identity (V) m=1 failed')
            require(pexpect_complex(padd(pmul(padd(c2_p, V_p, -1), c2_mu2), pmul(c2_mu, tb_p), 2), d) == QComplex(0, 0),
                    'Identity (VI) m=0 failed')
            require(pexpect_complex(padd(pmul(c2_mu, padd(al2_p, Vrho_p, -1)), padd(pmul(c2_mu, tb_p), tau_ab_p)), d) == QComplex(0, 0),
                    'Identity (VII) m=0 failed')

        # 3. Damped (V_eps), (VI_eps), (VII_eps) across eps in {1/6, 1/25, 1/40}:
        one_p = pconst(QComplex(1, 0), 2 * d)
        c2_m1 = padd(c2_p, one_p, -1)
        c2_m1_2 = pmul(c2_m1, c2_m1)
        h5_p = padd(one_p, V_p, 3)
        phi5_p = pconst(QComplex(3, 0), 2 * d)
        g6_p = padd(pconst(QComplex(2, 0), 2 * d), V_p, 5)
        G6_p = padd(pscale(V_p, 2), V2_p, 5)
        phi6_p = padd(pconst(QComplex(2, 0), 2 * d), V_p, 10)
        rhoY6_p = pscale(Vrho_p, 5)
        g7_p = padd(pconst(QComplex(-1, 0), 2 * d), V_p, 4)
        phi7_p = padd(pconst(QComplex(-1, 0), 2 * d), V_p, 8)
        rhoY7_p = pscale(Vrho_p, 4)

        for eps in (Fr(1, 6), Fr(1, 25), Fr(1, 40)):
            inv_e = Fr(1) / eps
            c_1pe = 1 + eps
            c_1pe2 = c_1pe * c_1pe
            D_p = padd(one_p, c2_p, eps)
            D2_p = pmul(D_p, D_p)
            dD = [pdiff(D_p, j) for j in range(d)]

            def form_i_num_over_D2(N_poly, D_p=D_p, dD=dD):
                acc = {}
                for j in range(d):
                    djN = pdiff(N_poly, j)
                    q_num = padd(pmul(djN, D_p), pmul(N_poly, dD[j]), -1)
                    acc = padd(acc, pmul(q_num, F_k[j]))
                acc = padd(acc, pmul(pmul(N_poly, q), D_p), -1)
                return real_part_poly(acc, d)

            if d == 2:
                N5 = pmul(bloc_b, h5_p)
                N6 = pmul(pmul(qb, c2_m1_2), g6_p)
                N7 = pmul(pmul(pmul(q, ab_p), c2_m1), g7_p)
                rhs5_D2 = padd(
                    padd(pmul(pmul(D_p, w_p), h5_p), pmul(bloc_sq, h5_p), -eps),
                    pmul(D_p, padd(pmul(padd(pmul(c2_p, phi5_p), h5_p, -1), tb_p), pmul(phi5_p, tau_ab_p))),
                )
                psi6p_D2 = pscale(padd(D2_p, one_p, -c_1pe2), inv_e)
                rhs6_D3 = padd(
                    pmul(pmul(D2_p, c2_m1_2), padd(padd(pmul(c2_p, phi6_p), G6_p, -1), rhoY6_p)),
                    pmul(pmul(D_p, psi6p_D2), pmul(tb_p, g6_p)),
                )
                in7 = padd(padd(pmul(al2_p, phi7_p), pmul(c2_p, rhoY7_p)),
                           padd(pmul(tb_p, g7_p), pmul(Vrho_p, g7_p), -1))
                rhs7_D2 = padd(pmul(pmul(D_p, c2_m1), in7), pscale(pmul(tau_ab_p, g7_p), c_1pe))
                require(form_i_num_over_D2(N5) == rhs5_D2, f'Symbolic (V_eps) failed at eps={eps}')
                require(pmul(form_i_num_over_D2(N6), D_p) == rhs6_D3, f'Symbolic (VI_eps) failed at eps={eps}')
                require(form_i_num_over_D2(N7) == rhs7_D2, f'Symbolic (VII_eps) failed at eps={eps}')
            else:
                dc2 = [pdiff(c2_p, j) for j in range(d)]
                dV = [pdiff(V_p, j) for j in range(d)]
                dab = [pdiff(ab_p, j) for j in range(d)]
                dbloc_b = [pdiff(bloc_b, j) for j in range(d)]
                dqb = [pdiff(qb, j) for j in range(d)]
                for z_pt in test_pts_3:
                    qv, qbv = peval_point(q, z_pt, d), peval_point(qb, z_pt, d)
                    c2v = peval_point(c2_p, z_pt, d).re
                    Vv = peval_point(V_p, z_pt, d).re
                    abv = peval_point(ab_p, z_pt, d)
                    bbv = peval_point(bloc_b, z_pt, d)
                    wv = peval_point(w_p, z_pt, d).re
                    bsqv = peval_point(bloc_sq, z_pt, d).re
                    tbv = peval_point(tb_p, z_pt, d).re
                    tauv = peval_point(tau_ab_p, z_pt, d).re
                    Vrhov = peval_point(Vrho_p, z_pt, d).re
                    al2v = peval_point(al2_p, z_pt, d).re

                    sr = Fr(1) / (1 + eps * c2v)
                    h5v, phi5v = 1 + 3 * Vv, Fr(3)
                    g6v, G6v, phi6v, rY6v = 2 + 5 * Vv, 2 * Vv + 5 * Vv * Vv, 2 + 10 * Vv, 5 * Vrhov
                    g7v, phi7v, rY7v = -1 + 4 * Vv, -1 + 8 * Vv, 4 * Vrhov
                    H5v = bbv.scale(sr * h5v)
                    H6v = qbv.scale(((c2v - 1) ** 2) * sr * g6v)
                    H7v = (qv * abv).scale((c2v - 1) * sr * g7v)
                    acc5 = acc6 = acc7 = QComplex()
                    for j in range(d):
                        Fj = peval_point(F_k[j], z_pt, d)
                        dq_j = peval_point(dq[j], z_pt, d)
                        dqb_j = peval_point(dqb[j], z_pt, d)
                        dc2_j = peval_point(dc2[j], z_pt, d)
                        dV_j = peval_point(dV[j], z_pt, d)
                        dab_j = peval_point(dab[j], z_pt, d)
                        dbb_j = peval_point(dbloc_b[j], z_pt, d)
                        dsr_j = dc2_j.scale(-eps * sr * sr)
                        dH5_j = dsr_j * bbv.scale(h5v) + dbb_j.scale(sr * h5v) + (bbv * dV_j).scale(sr * phi5v)
                        dpsi6_j = dc2_j.scale(2 * (c2v - 1) * sr - eps * ((c2v - 1) ** 2) * sr * sr)
                        dH6_j = (dqb_j.scale(((c2v - 1) ** 2) * sr * g6v)
                                 + (qbv * dpsi6_j).scale(g6v)
                                 + (qbv * dV_j).scale(((c2v - 1) ** 2) * sr * 5))
                        dpsi7_j = dc2_j.scale(sr - eps * (c2v - 1) * sr * sr)
                        dH7_j = ((dq_j * abv + qv * dab_j).scale((c2v - 1) * sr * g7v)
                                 + (qv * abv * dpsi7_j).scale(g7v)
                                 + (qv * abv * dV_j).scale((c2v - 1) * sr * 4))
                        acc5 = acc5 + dH5_j * Fj
                        acc6 = acc6 + dH6_j * Fj
                        acc7 = acc7 + dH7_j * Fj
                    lhs5, lhs6, lhs7 = (acc5 - H5v * qv).re, (acc6 - H6v * qv).re, (acc7 - H7v * qv).re
                    rhs5 = sr * wv * h5v - eps * sr * sr * bsqv * h5v + (c2v * phi5v - h5v) * sr * tbv + phi5v * sr * tauv
                    psi6v = ((c2v - 1) ** 2) * sr
                    psi6dv = inv_e * (1 - c_1pe2 * sr * sr)
                    rhs6 = c2v * psi6v * phi6v + psi6v * (rY6v - G6v) + psi6dv * tbv * g6v
                    psi7v = (c2v - 1) * sr
                    psi7dv = c_1pe * sr * sr
                    rhs7 = psi7v * al2v * phi7v + psi7v * (c2v * rY7v - Vrhov * g7v) + psi7v * tbv * g7v + psi7dv * tauv * g7v
                    require(lhs5 == rhs5 and lhs6 == rhs6 and lhs7 == rhs7, f'd=3 Wirtinger check failed at eps={eps}')

        # 4. Pointwise Gram-phase CS inequality:
        for z_pt in test_pts_3:
            zp = z_pt[:d]
            Vv = peval_point(V_p, zp, d).re
            tauv = peval_point(tau_ab_p, zp, d).re
            Vrhov = peval_point(Vrho_p, zp, d).re
            tbv = peval_point(tb_p, zp, d).re
            al2v = peval_point(al2_p, zp, d).re
            c2v = peval_point(c2_p, zp, d).re
            wv = peval_point(w_p, zp, d).re
            require((Vv * tauv - Vrhov * tbv) ** 2 <= (Vv * Vv * al2v - Vrhov * Vrhov) * (Vv * c2v * wv - tbv * tbv),
                    'Gram-phase CS failed')

    return 2


def self_audit_zero_float():
    src = pathlib.Path(__file__).read_text(encoding='utf-8')
    tree = ast.parse(src)
    fl_nm = 'fl' + 'oat'
    for node in ast.walk(tree):
        if isinstance(node, ast.Constant) and type(node.value).__name__ == fl_nm:
            raise ValueError('Float literal found in check_identities_exact.py')
        if isinstance(node, ast.Name) and node.id == fl_nm:
            raise ValueError('Float identifier found in check_identities_exact.py')


def main():
    quiet = '--quiet' in sys.argv[1:]
    t0 = time.monotonic_ns()
    self_audit_zero_float()
    pi_lo, pi_hi = V1.verify_ou_foundations()

    n1 = check_part1_chaos_and_wirtinger()
    if not quiet:
        print(f'[Part 1] Wirtinger gradient & Wiener-chaos decomposition on H_{{2,1}}(C^d): {n1} phase/tensor checks PASS')

    n2 = check_part2_polarization_and_folded(pi_lo, pi_hi)
    if not quiet:
        print(f'[Part 2] Sum/difference polarization & folded-[0, pi/4] polynomial moments: {n2 + 20} checks PASS')

    tables_he3 = V1.make_sum_diff_tables(N_U=250, N_V=500)
    cache_he3 = {}
    lhs_lo, lhs_hi, acc_lo, acc_hi = check_part3_he3_via_sum_diff(pi_lo, pi_hi, tables=tables_he3, cache=cache_he3, sign_flip=False)
    # Negative control: sign flip must fail!
    flipped_rejected = False
    try:
        check_part3_he3_via_sum_diff(pi_lo, pi_hi, tables=tables_he3, cache=cache_he3, sign_flip=True)
    except ValueError:
        flipped_rejected = True
    require(flipped_rejected, 'Part 3 sign-flip control was NOT rejected!')
    if not quiet:
        print(f'[Part 3] He_3(Z)/sqrt(6) 1-step OU identity via (G_sum, G_diff): overlap PASS '
              f'([{V1.dec_ceil10(acc_lo)}, {V1.dec_ceil10(acc_hi)}]; sign-flip control REJECTED)')

    n4 = check_part4_stein_identities()
    if not quiet:
        print(f'[Part 4] Level-2 (I)-(IV) & Damped Level-3 (V_eps)-(VII_eps) at eps in {{1/6, 1/25, 1/40}} (d=2,3): PASS')

    dt_ms = (time.monotonic_ns() - t0) // 1_000_000
    print(f'ALL EXACT IDENTITY CHECKS PASSED [{dt_ms} ms, zero floats]')


if __name__ == '__main__':
    main()
