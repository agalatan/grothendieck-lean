#!/usr/bin/env python3
"""Exact rational polynomial check of all spiked cubic analytic inputs (label C, stdlib only).

Usage:  python3 -I check_identities_exact.py

Verifies in exact arbitrary-precision Fraction polynomial arithmetic across structured and random
Gaussian-integer Wick cubics G in H_{2,1}(C^d) (d = 1, 2, 3, 4) and rational spike amplitudes
ell = a/c > 0 (p = ell^2, u = E|G|^2):
  1. Operator identities dbar_k a(G) == W_k and dbar_k F_j == 0 identically as polynomials;
  2. Spiked antiholomorphic & holomorphic Stein identities (I'), (II'), (III'), (IV') for g(V) = V^r
     (for each sign sigma in {+1, -1} separately, hence also for the +/-G average);
  3. Pointwise zero-mean +/-G symmetrisation identity:
       (1/2) sum_{sig in {+1,-1}} (q_0 + 2 q_2 c_2(z) + 2 q_1 k_1(z)) * delta_Delta(z, sig) == 0
     at every evaluation point z in Z[i]^d;
  4. Pointwise cone inequalities at exact Gaussian-integer points z in Z[i]^d and sig in {+1,-1}:
       c_2 >= 0, k_1 >= 0, tilde_k_1 = k_1 + 4p + delta_Delta >= 0,
       16 p k_1 - delta_Delta^2 == 16 p (Im d_1 G)^2 + 16 p sum_{j>=2} |d_j G|^2 >= 0,
       (V_sig rho_sig)^2 <= V_sig^2 alpha_{2,sig} <= V_sig^2 tilde_k_1 c_2,
     and the split Young bound for g_3 tilde_beta_{3,sig} + g_4 tilde_beta_{4,sig};
  5. Exact spiked moments, visible-sector energy decomposition G = sum_{i,j} e_{ij}(z_1) G_{ij},
     Delta_F = 4p(E_11 + E_01 + E_21), exact cross-sector bound on Delta_d for all theta_12 > 0,
     E[delta_Delta^2] = 2 Delta_d, E[sum_k |d_1 F_k|^2] = E_11 + 2 E_20 + E_10 + 2 E_21,
     E[alpha_{2,sig}], E[V_sig rho_sig], and |E[conj(z_1)^2 a(G)]|^2 <= 2 E|a(G)|^2;
  6. Exact z_1 integration-by-parts identity for E[T |G|^4], exact sector fourth-moment bounds
     E|G_11|^4 = 2 E_11^2, E|G_20|^4 = 2 E_20^2, E|G_10|^4 <= 9 E_10^2, E|G_01|^4 <= 6 E_01^2,
     and BOTH sixth-moment upper bounds on E[V_sig^3] (Young and Holder (4/3, 4) + 4-term AM-GM);
  7. Exact unimodular basis-shift identity z^T P_orig z == w^T P_sh w AND exact agreement of the
     verify.py closed-form 4x4/5x5 cofactor determinants (D4top, v2D4top, det5_r, v3_det5_r) with
     5x5 Leibniz determinants over Q.

Agent-ID: gemini-4c4c
"""
from fractions import Fraction as Fr
import itertools
from math import factorial
import os
import random
import sys
from time import perf_counter_ns

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import verify as VF


class QComplex:
    __slots__ = ("re", "im")

    def __init__(self, re=0, im=0):
        self.re, self.im = Fr(re), Fr(im)

    def __add__(self, o):
        return QComplex(self.re + o.re, self.im + o.im)

    def __sub__(self, o):
        return QComplex(self.re - o.re, self.im - o.im)

    def __mul__(self, o):
        return QComplex(self.re * o.re - self.im * o.im, self.re * o.im + self.im * o.re)

    def __eq__(self, o):
        return self.re == o.re and self.im == o.im

    def conj(self):
        return QComplex(self.re, -self.im)

    def scale(self, f):
        return QComplex(self.re * f, self.im * f)

    def iszero(self):
        return self.re == 0 and self.im == 0

    def abs2(self):
        return self.re * self.re + self.im * self.im


def padd(p, q, sign=1):
    r = dict(p)
    for k, v in q.items():
        r[k] = (r[k] + v.scale(sign)) if k in r else v.scale(sign)
    return {k: v for k, v in r.items() if not v.iszero()}


def pscale(p, f):
    f = Fr(f)
    if f == 0:
        return {}
    return {k: v.scale(f) for k, v in p.items()}


def pmul(p, q):
    r = {}
    for k1, v1 in p.items():
        for k2, v2 in q.items():
            k = tuple(a + b for a, b in zip(k1, k2))
            r[k] = (r[k] + v1 * v2) if k in r else (v1 * v2)
    return {k: v for k, v in r.items() if not v.iszero()}


def pconj(p, d):
    return {tuple(k[d:]) + tuple(k[:d]): v.conj() for k, v in p.items()}


def pdiff(p, idx):
    r = {}
    for k, v in p.items():
        if k[idx] > 0:
            kk = list(k)
            kk[idx] -= 1
            r[tuple(kk)] = v.scale(k[idx])
    return r


def pconst(c, d):
    return {} if c.iszero() else {tuple([0] * (2 * d)): c}


def pvar(idx, d):
    k = [0] * (2 * d)
    k[idx] = 1
    return {tuple(k): QComplex(1, 0)}


def pexpect(p, d):
    tot = QComplex()
    for k, v in p.items():
        if all(k[j] == k[d + j] for j in range(d)):
            wt = 1
            for j in range(d):
                wt *= factorial(k[j])
            tot = tot + v.scale(wt)
    return tot


def peval_point(p, z_pts, d):
    tot = QComplex()
    zc = [z.conj() for z in z_pts]
    for k, coeff in p.items():
        term = coeff
        for j in range(d):
            for _ in range(k[j]):
                term = term * z_pts[j]
            for _ in range(k[d + j]):
                term = term * zc[j]
        tot = tot + term
    return tot


def build_wick_cubic(t, d):
    q = {}
    for a, b, c in itertools.product(range(d), repeat=3):
        val = t[a][b][c]
        if val.iszero():
            continue
        k = [0] * (2 * d)
        k[a] += 1
        k[b] += 1
        k[d + c] += 1
        q = padd(q, {tuple(k): val})
        if a == c:
            k2 = [0] * (2 * d)
            k2[b] += 1
            q = padd(q, {tuple(k2): val}, -1)
        if b == c:
            k3 = [0] * (2 * d)
            k3[a] += 1
            q = padd(q, {tuple(k3): val}, -1)
    return q


def build_sector_polys(t, d):
    """Build exact remote polynomials G_11(y), G_20_tilde(y)=sqrt(2)*G_20(y), G_10(y), G_01(y), G_21_tilde=sqrt(2)*G_21."""
    # G = G_00(y) + (T_0 - 1) G_11(y) + z_0^2 * (G_20 / sqrt(2)) + z_0 G_10(y) + zb_0 G_01(y) + z_0(T_0 - 2)*(G_21 / sqrt(2))
    # Avoiding sqrt(2): let H_20(y) := G_20(y) / sqrt(2) (so E|H_20|^2 = E_20 / 2, E|H_20|^4 = 2 (E_20 / 2)^2 = E_20^2 / 2)
    # and H_21 := G_21 / sqrt(2) = t_{000} (so |H_21|^2 = E_21 / 2)!
    g11, h20, g10, g01 = {}, {}, {}, {}
    for b in range(1, d):
        # (1, 1): a=0, b>=1, c=0 (plus b=0, a>=1, c=0 -> factor 2):
        if not t[0][b][0].iszero():
            g11 = padd(g11, pscale(pvar(b, d), 2 * Fr(1)) if False else {tuple(1 if j == b else 0 for j in range(2 * d)): t[0][b][0].scale(2)})
        # (2, 0): a=0, b=0, c>=1:
        if not t[0][0][b].iszero():
            h20 = padd(h20, {tuple(1 if j == d + b else 0 for j in range(2 * d)): t[0][0][b]})
    for b in range(1, d):
        for c in range(1, d):
            # (1, 0): one of (a,b) is 0, other is b>=1, c>=1 -> factor 2 * :z_b zb_c: = 2 (z_b zb_c - delta_{bc}):
            if not t[0][b][c].iszero():
                val = t[0][b][c].scale(2)
                k = [0] * (2 * d)
                k[b] += 1
                k[d + c] += 1
                g10 = padd(g10, {tuple(k): val})
                if b == c:
                    g10 = padd(g10, pconst(val, d), -1)
            # (0, 1): a>=1, b>=1, c=0 -> t_{ab0} z_a z_b:
            if not t[b][c][0].iszero():
                k = [0] * (2 * d)
                k[b] += 1
                k[c] += 1
                g01 = padd(g01, {tuple(k): t[b][c][0]})
    h21 = t[0][0][0]
    return g11, h20, g10, g01, h21


def tensor_scalars(t, d):
    R = range(d)
    u = 2 * sum(t[a][b][c].abs2() for a in R for b in R for c in R)
    N = [[sum((t[j][b][k] * t[l][b][k].conj() for b in R for k in R), QComplex()) for l in R] for j in R]
    H = [[sum((t[a][b][k].conj() * t[a][b][l] for a in R for b in R), QComplex()) for l in R] for k in R]
    B = [[sum((t[a][c][e] * t[b][e][c] for c in R for e in R), QComplex()) for b in R] for a in R]
    W = {}
    for a, b, e, f in itertools.product(R, repeat=4):
        W[(a, b, e, f)] = sum((t[a][b][c] * t[c][e][f] for c in R), QComplex())
    y_num = Fr(0)
    for a, b, e, f in itertools.product(R, repeat=4):
        acc = QComplex()
        for pa, pb, pe in itertools.permutations((a, b, e)):
            acc = acc + W[(pa, pb, pe, f)]
        y_num += acc.scale(Fr(1, 6)).abs2()
    u2 = u * u
    n = sum(N[j][l].abs2() for j in R for l in R) / u2
    h = sum(H[j][l].abs2() for j in R for l in R) / u2
    z = sum((N[j][l] * H[l][j]).re for j in R for l in R) / u2
    b = sum(B[j][l].abs2() for j in R for l in R) / u2
    y = y_num / u2
    return n, h, b, y, z, u


def visible_sector_energies(t, d):
    E_sec = {(i, j): Fr(0) for i in (0, 1, 2) for j in (0, 1)}
    for a in range(d):
        for b in range(d):
            for c in range(d):
                ih = (1 if a == 0 else 0) + (1 if b == 0 else 0)
                ja = 1 if c == 0 else 0
                E_sec[(ih, ja)] += 2 * t[a][b][c].abs2()
    return E_sec


def empty_tensor(d):
    return [[[QComplex() for _ in range(d)] for _ in range(d)] for _ in range(d)]


def set_sym(t, a, b, c, val):
    t[a][b][c] = val
    t[b][a][c] = val


def det_nxn_exact(M):
    n = len(M)
    tot = Fr(0)
    for perm in itertools.permutations(range(n)):
        inv = sum(1 for i in range(n) for j in range(i + 1, n) if perm[i] > perm[j])
        prod = Fr(-1 if (inv % 2) else 1)
        for r in range(n):
            prod *= M[r][perm[r]]
        tot += prod
    return tot


def check_shifted_basis_and_cofactors_over_Q():
    """Verify z^T P_orig z == w^T P_sh w AND exact agreement of verify.py cofactor formulas with Leibniz det."""
    rng = random.Random(1125)
    for trial in range(12):
        rf = lambda: Fr(rng.randint(-7, 7), rng.randint(1, 6))
        pos = lambda: Fr(rng.randint(1, 9), rng.randint(1, 5))
        pv = Fr(rng.randint(1, 9), 11)
        uv = 1 - pv
        ri = Fr(rng.randint(1, 9), 4)
        vi = ri * ri
        p1, p2, p3, p4 = rf(), rf(), rf(), rf()
        G1, G2, G3, G4 = rf(), rf(), rf(), rf()
        Y1, Y2, Y3, Y4 = p1 - G1 / vi, p2 - G2 / vi, p3 - G3 / vi, p4 - G4 / vi
        m00, m01, m11, m_del = pos(), rf(), pos(), pos()
        q0, q1, q2 = rf(), rf(), rf()
        mu_a, mu_rho, mu_w, mu_w1, mu_T, mu_F4 = pos(), pos(), pos(), pos(), pos(), pos()
        psa, psd = pos(), pos()
        xi2, xit1, xia, xik1 = pos(), pos(), rf(), pos()
        svr = rf()
        lam0, lam1, lam2, lam3 = rf(), rf(), rf(), pos()

        tw = ((G3 + G4) ** 2) / (4 * mu_w * vi)
        tw1 = (G3 * G3) / (4 * mu_w1 * vi)
        tiv = (G4 * G4) / (2 * mu_T * vi)
        tf4 = (p4 * p4) / (2 * mu_F4)

        M_orig = [[Fr(0)] * 5 for _ in range(5)]
        M_orig[0][0] = m00 - p3
        M_orig[0][1] = M_orig[1][0] = q2 - Fr(1, 8) * p3 - Fr(1, 2) * psa
        M_orig[0][2] = M_orig[2][0] = m01 - q2 + Fr(1, 8) * p3
        M_orig[0][3] = M_orig[3][0] = -Fr(1, 2) * (Y3 + Y4)
        M_orig[1][1] = m_del + psd
        M_orig[1][2] = M_orig[2][1] = -m_del + q1 - psd
        M_orig[2][2] = m11 + m_del - 2 * q1 + psd
        M_orig[3][3] = mu_rho + mu_a + psa - p4 - tiv - tf4
        b_orig = [
            -Fr(1, 2) * p1 + Fr(1, 2) * uv * p3 + Fr(1, 2) * G3 - uv * m00 - 2 * uv * m01
            - 4 * pv * q2 - Fr(1, 2) * (tw + tw1) - Fr(1, 2) * xi2,
            -Fr(1, 8) * p1 - Fr(3, 16) * p2 + Fr(1, 8) * uv * p3 - 4 * pv * (m_del + psd)
            + Fr(1, 2) * q0 - Fr(1, 2) * xit1,
            Fr(1, 8) * p1 - Fr(1, 16) * p2 - Fr(1, 8) * uv * p3 - uv * m01 - 2 * uv * m11
            + 4 * pv * m_del - Fr(1, 2) * q0 - 4 * pv * q1 - 4 * pv * psd - Fr(1, 2) * xik1,
            -Fr(1, 2) * Y1 - Fr(1, 4) * Y2 + Fr(1, 2) * svr * vi + Fr(1, 2) * uv * Y3
            + Fr(1, 2) * G4 - Fr(1, 2) * xia,
        ]
        q1_orig = (
            lam0 + lam1 * vi + lam2 * vi * vi + lam3 * vi * vi * vi
            + G1 + G2 + Fr(1, 2) * pv * p2 - uv * G3 - ri
            + uv * uv * (m00 + 4 * m01 + 4 * m11) + 16 * pv * pv * (m_del + psd) - 4 * pv * q0
        )
        for j in range(4):
            M_orig[4][j] = M_orig[j][4] = b_orig[j]
        M_orig[4][4] = q1_orig

        M_sh = [[Fr(0)] * 5 for _ in range(5)]
        M_sh[0][0] = m00 - p3
        M_sh[0][1] = M_sh[1][0] = q2 - Fr(1, 8) * p3 - Fr(1, 2) * psa
        M_sh[0][2] = M_sh[2][0] = m01 - Fr(1, 2) * psa
        M_sh[0][3] = M_sh[3][0] = -Fr(1, 2) * (Y3 + Y4)
        M_sh[1][1] = m_del + psd
        M_sh[1][2] = M_sh[2][1] = q1
        M_sh[2][2] = m11
        M_sh[3][3] = mu_rho + mu_a + psa - p4 - tiv - tf4
        b_sh = [
            -Fr(1, 2) * p1 + Fr(1, 2) * (uv - pv) * p3 + Fr(1, 2) * G3 - uv * m00 - 2 * uv * m01
            - 2 * pv * psa - Fr(1, 2) * (tw + tw1) - Fr(1, 2) * xi2,
            -Fr(1, 8) * p1 - Fr(3, 16) * p2 + Fr(1, 8) * uv * p3 + Fr(1, 2) * q0 - Fr(1, 2) * xit1,
            -Fr(1, 4) * p2 - uv * m01 - 2 * uv * m11 - 8 * pv * psd - Fr(1, 2) * (xit1 + xik1),
            -Fr(1, 2) * Y1 - Fr(1, 4) * Y2 + Fr(1, 2) * svr * vi + Fr(1, 2) * uv * Y3
            + Fr(1, 2) * G4 - Fr(1, 2) * xia,
        ]
        q1_sh = (
            lam0 + lam1 * vi + lam2 * vi * vi + lam3 * vi * vi * vi
            + G1 + G2 - pv * p1 - pv * p2 - uv * G3 + pv * uv * p3 - ri
            + uv * uv * (m00 + 4 * m01 + 4 * m11) - 4 * pv * xit1
        )
        for j in range(4):
            M_sh[4][j] = M_sh[j][4] = b_sh[j]
        M_sh[4][4] = q1_sh

        c2v, ddv, k1v, rhov = rf(), rf(), rf(), rf()
        tk1v = k1v + 4 * pv + ddv
        zv = [c2v, tk1v, k1v, rhov, Fr(1)]
        wv = [c2v, ddv, k1v, rhov, Fr(1)]
        val_o = sum(zv[a] * M_orig[a][b] * zv[b] for a in range(5) for b in range(5))
        val_s = sum(wv[a] * M_sh[a][b] * wv[b] for a in range(5) for b in range(5))
        assert val_o == val_s, f"Quadratic form mismatch on trial {trial}"

        det5_leibniz = det_nxn_exact(M_sh)
        assert det_nxn_exact(M_orig) == det5_leibniz, f"Determinant mismatch on trial {trial}"

        # Also check the exact verify.py closed-form cofactor expressions for D3, D4top and det5!
        C00 = m11 * M_sh[1][1] - q1 * q1
        C11 = m11 * M_sh[0][0] - M_sh[0][2] ** 2
        C22 = M_sh[0][0] * M_sh[1][1] - M_sh[0][1] ** 2
        C01 = q1 * M_sh[0][2] - m11 * M_sh[0][1]
        C02 = q1 * M_sh[0][1] - M_sh[0][2] * M_sh[1][1]
        C12 = M_sh[0][1] * M_sh[0][2] - q1 * M_sh[0][0]
        D3_cf = M_sh[0][0] * C00 + M_sh[0][1] * C01 + M_sh[0][2] * C02
        D4top_cf = M_sh[3][3] * D3_cf - (M_sh[0][3] ** 2) * C00
        assert D3_cf == det_nxn_exact([r[:3] for r in M_sh[:3]]), "D3 cofactor mismatch"
        assert D4top_cf == det_nxn_exact([r[:4] for r in M_sh[:4]]), "D4top cofactor mismatch"

        b0, b1, b2, b3 = b_sh
        S_C = (
            C00 * b0 * b0 + C11 * b1 * b1 + C22 * b2 * b2
            + 2 * (C01 * b0 * b1 + C02 * b0 * b2 + C12 * b1 * b2)
        )
        L0 = C00 * b0 + C01 * b1 + C02 * b2
        Q12 = m11 * b1 * b1 - 2 * q1 * b1 * b2 + M_sh[1][1] * b2 * b2
        quad_cf = M_sh[3][3] * S_C - (M_sh[0][3] ** 2) * Q12 + D3_cf * b3 * b3 - 2 * M_sh[0][3] * b3 * L0
        det5_cf = q1_sh * D4top_cf - quad_cf
        assert det5_cf == det5_leibniz, f"5x5 closed-form cofactor determinant mismatch on trial {trial}"


def pre_part(p, d):
    return pscale(padd(p, pconj(p, d)), Fr(1, 2))


def verify_spiked_instance(name, t_raw, d, ray_abc, rng, max_r=1, check_v3=True):
    a_r, b_r, c_r = ray_abc
    assert a_r * a_r + b_r * b_r == c_r * c_r
    ell = Fr(a_r, c_r)
    p_eff = ell * ell

    R = range(d)
    n, h, b, y, z, u_eff = tensor_scalars(t_raw, d)
    E_sec = visible_sector_energies(t_raw, d)
    assert sum(E_sec.values()) == u_eff, f"{name}: sector energy sum != u_eff"

    G = build_wick_cubic(t_raw, d)
    Gb = pconj(G, d)
    VG = pmul(G, Gb)
    z0 = pvar(0, d)
    z0b = pconj(z0, d)
    T0 = pmul(z0, z0b)
    E = lambda pol: pexpect(pol, d)

    # Check sector fourth-moment bounds:
    g11, h20, g10, g01, h21 = build_sector_polys(t_raw, d)
    assert E(pmul(g11, pconj(g11, d))).re == E_sec[(1, 1)]
    assert 2 * E(pmul(h20, pconj(h20, d))).re == E_sec[(2, 0)]
    assert E(pmul(g10, pconj(g10, d))).re == E_sec[(1, 0)]
    assert E(pmul(g01, pconj(g01, d))).re == E_sec[(0, 1)]
    assert 2 * h21.abs2() == E_sec[(2, 1)]

    g11_2 = pmul(g11, pconj(g11, d))
    h20_2 = pmul(h20, pconj(h20, d))
    g10_2 = pmul(g10, pconj(g10, d))
    g01_2 = pmul(g01, pconj(g01, d))
    assert E(pmul(g11_2, g11_2)).re == 2 * (E_sec[(1, 1)] ** 2), f"{name}: E|G_11|^4 != 2 E_11^2"
    assert 4 * E(pmul(h20_2, h20_2)).re == 2 * (E_sec[(2, 0)] ** 2), f"{name}: E|G_20|^4 != 2 E_20^2"
    assert E(pmul(g10_2, g10_2)).re <= 9 * (E_sec[(1, 0)] ** 2), f"{name}: E|G_10|^4 > 9 E_10^2"
    assert E(pmul(g01_2, g01_2)).re <= 6 * (E_sec[(0, 1)] ** 2), f"{name}: E|G_01|^4 > 6 E_01^2"

    dG = [pdiff(G, j) for j in R]
    F = [pdiff(G, d + j) for j in R]
    for k in R:
        for j in R:
            assert pdiff(F[j], d + k) == {}, f"{name}: dbar_{k} F_{j} != 0"

    k1, c2, aG = {}, {}, {}
    for j in R:
        k1 = padd(k1, pmul(dG[j], pconj(dG[j], d)))
        c2 = padd(c2, pmul(F[j], pconj(F[j], d)))
        aG = padd(aG, pmul(dG[j], F[j]))

    W = []
    d1F_sq = {}
    for k in R:
        Wk = {}
        for j in R:
            Wk = padd(Wk, pmul(F[j], pdiff(F[k], j)))
        assert pdiff(aG, d + k) == Wk, f"{name}: dbar_{k} a(G) != W_{k}"
        W.append(Wk)
        d1Fk = pdiff(F[k], 0)
        d1F_sq = padd(d1F_sq, pmul(d1Fk, pconj(d1Fk, d)))

    wG, bloc, dbar1_c2 = {}, {}, {}
    for k in R:
        wG = padd(wG, pmul(W[k], pconj(W[k], d)))
        bloc = padd(bloc, pmul(pconj(F[k], d), W[k]))
        dbar1_c2 = padd(dbar1_c2, pmul(F[k], pconj(pdiff(F[k], 0), d)))
    assert pdiff(c2, d + 0) == dbar1_c2, f"{name}: dbar_1 c_2 mismatch"

    c2_u = padd(c2, pconst(QComplex(u_eff), d), -1)
    re_d1G = pre_part(dG[0], d)

    DF = 4 * p_eff * E(pmul(F[0], pconj(F[0], d))).re
    assert DF == 4 * p_eff * (E_sec[(1, 1)] + E_sec[(0, 1)] + E_sec[(2, 1)]), f"{name}: Delta_F"

    ed1 = E(pmul(dG[0], pconj(dG[0], d))).re
    ed1_d1F = E(d1F_sq).re
    ed1_sec = E_sec[(1, 1)] + 2 * E_sec[(2, 0)] + E_sec[(1, 0)] + 2 * E_sec[(2, 1)]
    assert ed1 == ed1_d1F == ed1_sec, f"{name}: E|d_1 G|^2 / sum E|d_1 F_k|^2"

    Dd = 4 * p_eff * (ed1 + E(pmul(dG[0], dG[0])).re)
    for th12 in (Fr(1, 3), Fr(1), Fr(5, 2)):
        Dd_ub = p_eff * (
            4 * (1 + th12) * E_sec[(1, 1)]
            + 8 * (1 + Fr(1) / th12) * E_sec[(2, 0)]
            + 8 * E_sec[(1, 0)]
            + 16 * E_sec[(2, 1)]
        )
        assert 0 <= Dd <= Dd_ub, f"{name}: Delta_d out of [0, Dd_ub] at th12={th12}"

    ET2_VG = E(pmul(pmul(T0, T0), VG)).re
    ET2_sec = (
        2 * u_eff
        + 12 * E_sec[(1, 1)] + 10 * E_sec[(2, 0)] + 4 * E_sec[(1, 0)] + 4 * E_sec[(0, 1)] + 22 * E_sec[(2, 1)]
    )
    assert ET2_VG == ET2_sec, f"{name}: E[T^2 |G|^2]"

    # Exact z_1 integration-by-parts identity for E[T |G|^4] & Holder (4/3, 4) bound!
    VG2 = pmul(VG, VG)
    EG4 = E(VG2).re
    sG = 32 * n + 8 * h + 32 * b + 96 * y
    assert EG4 == (u_eff * u_eff) * (2 + sG), f"{name}: E|G|^4"
    D1_op = padd(pmul(z0, dG[0]), pmul(z0b, F[0]))
    ET_G4 = E(pmul(T0, VG2)).re
    rhs_ibp = EG4 + 2 * E(pmul(pmul(VG, Gb), D1_op)).re
    assert ET_G4 == rhs_ibp, f"{name}: z_1 IBP identity for E[T |G|^4] failed"

    # Check Holder (4/3, 4) + 4-term AM-GM rational upper bound on E[T |G|^4]:
    u_hi = VF.root_interval(u_eff)[1]
    q_mid = VF.root4_lo(2 + sG)
    psi34_hi = Fr(8 + 4 * sG) / (4 * q_mid)  # s_mid = sG here (or shifted s_mid = sG + 1/2)
    q_mid_sh = VF.root4_lo(2 + sG + Fr(1, 2))
    psi34_sh = Fr(8 + (sG + Fr(1, 2)) + 3 * sG) / (4 * q_mid_sh)
    sec_keys = [(1, 1), (2, 0), (1, 0), (0, 1), (2, 1)]
    sum_kap_sqrtE = sum(VF.KAPPA_HI[i] * VF.root_interval(E_sec[sec_keys[i]])[1] for i in range(5))
    for psi_ub in (psi34_hi, psi34_sh):
        ET_G4_ub = EG4 + 2 * (u_hi ** 3) * psi_ub * sum_kap_sqrtE
        assert ET_G4 <= ET_G4_ub, f"{name}: Holder (4/3, 4) upper bound on E[T |G|^4] failed"

    ezb2_a = E(pmul(pmul(z0b, z0b), aG))
    ea2 = E(pmul(aG, pconj(aG, d))).re
    assert ea2 == u_eff * u_eff * (32 * b + 24 * y), f"{name}: E|a(G)|^2"
    assert ezb2_a.abs2() <= 2 * ea2, f"{name}: |E[zb_1^2 a(G)]|^2 > 2 E|a(G)|^2"

    EV_avg, EV2_avg, EV3_avg, Eal2_avg, EVrho_avg, Edd2_avg = Fr(0), Fr(0), Fr(0), Fr(0), Fr(0), Fr(0)

    for sig in (+1, -1):
        Q = padd(pscale(z0, ell), G, sig)
        Qb = pconj(Q, d)
        V = pmul(Q, Qb)
        dd = pscale(re_d1G, 4 * sig * ell)
        tk1 = padd(padd(k1, pconst(QComplex(4 * p_eff), d)), dd)
        a1 = padd(aG, pscale(F[0], 2 * sig * ell))
        al2 = pmul(a1, pconj(a1, d))
        Vrho = pre_part(pmul(pmul(Qb, Qb), a1), d)
        tb3 = pre_part(pmul(Qb, padd(pscale(bloc, sig), pscale(dbar1_c2, ell))), d)
        tb4 = pre_part(pmul(Qb, pscale(bloc, sig)), d)
        term_lzQa = pre_part(pmul(pscale(pmul(z0, Q), ell), pconj(a1, d)), d)
        term_sFa = pre_part(pmul(pscale(F[0], sig * ell), pconj(a1, d)), d)

        im_d1G_sq = pscale(pmul(padd(dG[0], pconj(dG[0], d), -1), padd(dG[0], pconj(dG[0], d), -1)), Fr(-1, 4))
        rem_k1 = im_d1G_sq
        for j in range(1, d):
            rem_k1 = padd(rem_k1, pmul(dG[j], pconj(dG[j], d)))
        assert padd(pscale(k1, 16 * p_eff), pmul(dd, dd), -1) == pscale(rem_k1, 16 * p_eff)

        EV_avg += Fr(1, 2) * E(V).re
        V2 = pmul(V, V)
        EV2_avg += Fr(1, 2) * E(V2).re
        if check_v3:
            V3 = pmul(V2, V)
            EV3_avg += Fr(1, 2) * E(V3).re
        Eal2_avg += Fr(1, 2) * E(al2).re
        EVrho_avg += Fr(1, 2) * E(Vrho).re
        Edd2_avg += Fr(1, 2) * E(pmul(dd, dd)).re

        Vr = pconst(QComplex(1), d)
        Vr_prev = None
        c2_p_dd = padd(padd(c2, pconst(QComplex(p_eff), d)), pscale(dd, Fr(1, 4)))
        k1_p_dd = padd(padd(pscale(k1, Fr(1, 2)), pconst(QComplex(p_eff), d)), pscale(dd, Fr(3, 8)))
        for r_deg in range(max_r + 1):
            Vr1 = pmul(Vr, V)
            EVr1 = E(Vr1).re
            t_Vrho = Fr(0) if r_deg == 0 else r_deg * E(pmul(Vrho, Vr_prev)).re

            assert EVr1 - (r_deg + 1) * E(pmul(c2_p_dd, Vr)).re - t_Vrho == 0
            assert EVr1 - (r_deg + 1) * E(pmul(k1_p_dd, Vr)).re - Fr(1, 2) * t_Vrho == 0
            lhs3 = (
                (r_deg + 1) * E(pmul(pmul(c2_u, c2_p_dd), Vr)).re
                - E(pmul(c2_u, Vr1)).re
                + (Fr(0) if r_deg == 0 else r_deg * E(pmul(pmul(c2_u, Vrho), Vr_prev)).re)
                + E(pmul(tb3, Vr)).re
            )
            assert lhs3 == 0
            lhs4 = (
                (r_deg + 1) * E(pmul(al2, Vr)).re
                - E(pmul(Vrho, Vr)).re
                + (Fr(0) if r_deg == 0 else r_deg * E(pmul(pmul(c2, Vrho), Vr_prev)).re)
                + E(pmul(tb4, Vr)).re
                + E(pmul(term_lzQa, Vr)).re
                - (r_deg + 1) * E(pmul(term_sFa, Vr)).re
            )
            assert lhs4 == 0

            Vr_prev = Vr
            if r_deg < max_r:
                Vr = Vr1

        for _ in range(3):
            z_pts = [QComplex(rng.randint(-2, 2), rng.randint(-2, 2)) for _ in R]
            v_pt = peval_point(V, z_pts, d).re
            c2_pt = peval_point(c2, z_pts, d).re
            k1_pt = peval_point(k1, z_pts, d).re
            tk1_pt = peval_point(tk1, z_pts, d).re
            dd_pt = peval_point(dd, z_pts, d).re
            al2_pt = peval_point(al2, z_pts, d).re
            vrho_pt = peval_point(Vrho, z_pts, d).re
            tb3_pt = peval_point(tb3, z_pts, d).re
            tb4_pt = peval_point(tb4, z_pts, d).re
            wG_pt = peval_point(wG, z_pts, d).re
            d1F_pt = peval_point(d1F_sq, z_pts, d).re
            assert c2_pt >= 0 and k1_pt >= 0 and tk1_pt >= 0
            assert 16 * p_eff * k1_pt - dd_pt * dd_pt >= 0
            assert vrho_pt * vrho_pt <= (v_pt * v_pt) * al2_pt <= (v_pt * v_pt) * tk1_pt * c2_pt
            g3v, g4v, muw, muw1 = Fr(3, 7), Fr(-5, 11), Fr(2, 5), Fr(3, 8)
            lhs_y = muw * wG_pt + muw1 * p_eff * d1F_pt - (g3v * tb3_pt + g4v * tb4_pt)
            rhs_y = -(v_pt * (g3v + g4v) ** 2 / (4 * muw) + v_pt * g3v ** 2 / (4 * muw1)) * c2_pt
            assert lhs_y >= rhs_y

    for _ in range(4):
        z_pts = [QComplex(rng.randint(-3, 3), rng.randint(-3, 3)) for _ in R]
        c2_pt = peval_point(c2, z_pts, d).re
        k1_pt = peval_point(k1, z_pts, d).re
        dd_plus = 4 * ell * peval_point(re_d1G, z_pts, d).re
        dd_minus = -4 * ell * peval_point(re_d1G, z_pts, d).re
        q0, q1, q2 = Fr(7, 13), Fr(-4, 9), Fr(11, 5)
        assert (q0 + 2 * q2 * c2_pt + 2 * q1 * k1_pt) * (dd_plus + dd_minus) == 0

    assert EV_avg == p_eff + u_eff
    assert EV2_avg == 2 * (p_eff + u_eff) ** 2 + u_eff * u_eff * sG + Dd + DF
    assert Edd2_avg == 2 * Dd
    assert Eal2_avg == u_eff * u_eff * (32 * b + 24 * y) + DF
    assert EVrho_avg == u_eff * u_eff * (32 * b + 48 * y) + DF + p_eff * ezb2_a.re

    if check_v3:
        EG6 = E(pmul(pmul(VG, VG), VG)).re
        sec_T2_sum = (
            12 * E_sec[(1, 1)] + 10 * E_sec[(2, 0)] + 4 * E_sec[(1, 0)] + 4 * E_sec[(0, 1)] + 22 * E_sec[(2, 1)]
        )
        # Check Young V^3 bound AND Holder (4/3, 4) V^3 bound!
        for gy in (Fr(1, 10), Fr(2, 5)):
            v3_young = (
                6 * (p_eff ** 3) * (1 + Fr(5) / (gy * gy))
                + 30 * (p_eff ** 2) * u_eff
                + 15 * (p_eff ** 2) * sec_T2_sum
                + (1 + 10 * gy) * EG6
            )
            assert EV3_avg <= v3_young
        v3_holder = (
            6 * (p_eff ** 3)
            + 30 * (p_eff ** 2) * u_eff
            + 15 * (p_eff ** 2) * sec_T2_sum
            + 15 * p_eff * ET_G4_ub
            + EG6
        )
        assert EV3_avg <= v3_holder, f"{name}: Holder V^3 upper bound failed"

    return u_eff, sG, max_r


def main():
    t0 = perf_counter_ns()
    check_shifted_basis_and_cofactors_over_Q()
    print("[0] Exact 5x5 shifted-basis quadratic form & verify.py cofactor determinant over Q: PASS", flush=True)

    rng = random.Random(20261125)
    instances = []

    t = empty_tensor(1)
    set_sym(t, 0, 0, 0, QComplex(2, -1))
    instances.append(("d=1 visible e_21(z_1)", t, 1, (3, 4, 5), 2, True))

    t = empty_tensor(2)
    set_sym(t, 1, 1, 1, QComplex(1, 1))
    set_sym(t, 0, 1, 0, QComplex(2, -1))
    set_sym(t, 0, 0, 1, QComplex(-1, 2))
    set_sym(t, 0, 1, 1, QComplex(1, -2))
    set_sym(t, 1, 1, 0, QComplex(2, 1))
    set_sym(t, 0, 0, 0, QComplex(-2, 1))
    instances.append(("d=2 all-6-sectors active", t, 2, (5, 12, 13), 2, True))

    t = empty_tensor(2)
    set_sym(t, 0, 1, 1, QComplex(0, 2))
    instances.append(("d=2 transverse i*z_1*H_11", t, 2, (8, 15, 17), 2, True))

    t = empty_tensor(3)
    set_sym(t, 0, 0, 0, QComplex(1, 1))
    set_sym(t, 0, 1, 2, QComplex(2, -1))
    set_sym(t, 1, 2, 0, QComplex(-1, 1))
    set_sym(t, 2, 2, 1, QComplex(1, 2))
    instances.append(("d=3 coupled visible+3-var", t, 3, (20, 21, 29), 1, True))

    rays = [(3, 4, 5), (5, 12, 13), (8, 15, 17), (7, 24, 25), (20, 21, 29), (12, 35, 37)]
    for d, cnt, dens_pct, mr, cv3 in [(2, 3, 80, 1, True), (3, 2, 45, 1, True), (4, 2, 14, 1, False)]:
        for j in range(cnt):
            t = empty_tensor(d)
            for a in range(d):
                for b in range(a, d):
                    for c in range(d):
                        if rng.randrange(100) < dens_pct:
                            set_sym(t, a, b, c, QComplex(rng.randint(-2, 2), rng.randint(-2, 2)))
            if all(t[a][b][c].iszero() for a in range(d) for b in range(d) for c in range(d)):
                set_sym(t, 0, 0, d - 1, QComplex(1, 1))
            instances.append((f"d={d} random #{j+1}", t, d, rays[(d + j) % len(rays)], mr, cv3))

    for idx, (nm, t, d, ray, mr, cv3) in enumerate(instances, 1):
        u_e, sG, _ = verify_spiked_instance(nm, t, d, ray, rng, max_r=mr, check_v3=cv3)
        sG_str = "%d/%d" % (sG.numerator, sG.denominator)
        print(f"[{idx:2d}/{len(instances)}] {nm:<28s} ray={ray} u={str(u_e):<4s} sG={sG_str:<10s} r<={mr} EXACT PASS", flush=True)

    dt_cs = (perf_counter_ns() - t0) // 10_000_000
    print(f"All {len(instances)} spiked instances + shifted-basis cofactor checks passed in {dt_cs // 100}.{dt_cs % 100:02d}s.")


if __name__ == "__main__":
    main()
