#!/usr/bin/env python3
"""Standalone generator of cert_h32.json (dimension-free bound rho^*(H_{3,2}) <= 4999/5000 < 1).

Usage:  python3 -B make_cert_h32.py [OUT.json]

Uses numpy and clarabel for numerical conic search; rounds every generated row to exact dyadic
rationals and verifies it immediately via BOTH exact stdlib methods (Sturm + Bernstein) in verify_cert_h32.py.
"""
import json
import os
import sys
import time
from fractions import Fraction as Fr
from math import isqrt

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import clarabel
import numpy as np
import scipy.sparse as sp

import verify_cert_h32 as V32

SQ2 = np.sqrt(2.0)
C6f = float(V32.C6_H32)
K2f = float(V32.K2_H32)

DEFAULT_POINTS_H32 = [
    '0', '1/2', '1', '2', '4', '8', '16', '32', '64', '140', '230', '380', '630', '1050', '1840',
]


def knots_h32(high_s=False):
    ks = [Fr(0), Fr(1, 10), Fr(1, 5), Fr(3, 10), Fr(1, 2)]
    segs = [
        (Fr(5, 2), Fr(1, 10)),
        (Fr(5), Fr(1, 4)),
        (Fr(12), Fr(1, 2)),
        (Fr(25), Fr(1)),
        (Fr(50), Fr(5, 2)),
    ]
    for end, step in segs:
        while ks[-1] < end:
            ks.append(ks[-1] + step)
    if high_s:
        ks += [Fr(x) for x in (60, 75, 95, 120, 150, 190, 240, 300, 380, 480, 600, 750, 950, 1200, 1500, 1900, 2400)]
    else:
        ks += [Fr(x) for x in (60, 75, 95, 120, 150, 190, 240)]
    return ks


def hat_test_matrices(uk, v):
    K = len(uk)
    F = np.zeros((K, len(v)))
    G = np.zeros((K, len(v)))
    for k in range(K):
        if k > 0:
            a_, b_ = uk[k - 1], uk[k]
            x = np.clip(v, a_, b_)
            F[k] += np.where((v > a_) & (v <= b_), (v - a_) / (b_ - a_), 0.0)
            G[k] += (x - a_) ** 2 / (2.0 * (b_ - a_))
        if k < K - 1:
            a_, b_ = uk[k], uk[k + 1]
            x = np.clip(v, a_, b_)
            F[k] += np.where((v > a_) & (v <= b_), (b_ - v) / (b_ - a_), 0.0)
            G[k] += (x - a_) - (x - a_) ** 2 / (2.0 * (b_ - a_))
            if k == 0:
                F[k] += np.where(v <= a_, 1.0, 0.0)
        else:
            F[k] += np.where(v > uk[k], 1.0, 0.0)
            G[k] += np.maximum(v - uk[k], 0.0)
    Y = np.zeros_like(F)
    nz = v > 0
    Y[:, nz] = F[:, nz] - G[:, nz] / v[nz][None, :]
    return F, G, Y


class ConicBuilder:
    def __init__(self):
        self.nvars = 0
        self.rows, self.cols, self.vals, self.b_list, self.cones = [], [], [], [], []
        self.nrows = 0

    def var(self, size=1):
        idx = np.arange(self.nvars, self.nvars + size, dtype=int)
        self.nvars += size
        return idx if size > 1 else int(idx[0])

    def _append_row(self, terms, rhs):
        r = self.nrows
        self.nrows += 1
        self.b_list.append(float(rhs))
        for col, coeff in terms:
            if coeff != 0.0:
                self.rows.append(r)
                self.cols.append(int(col))
                self.vals.append(-float(coeff))

    def add_nonneg_batch(self, exprs):
        if not exprs:
            return
        for const, terms in exprs:
            self._append_row(terms, const)
        self.cones.append(clarabel.NonnegativeConeT(len(exprs)))

    def add_soc(self, exprs):
        for const, terms in exprs:
            self._append_row(terms, const)
        self.cones.append(clarabel.SecondOrderConeT(len(exprs)))

    def add_psd(self, n, upper_col_major_exprs):
        idx = 0
        for col_j in range(n):
            for row_i in range(col_j + 1):
                const, terms = upper_col_major_exprs[idx]
                idx += 1
                if row_i < col_j:
                    self._append_row([(c, SQ2 * val) for c, val in terms], SQ2 * const)
                else:
                    self._append_row(terms, const)
        self.cones.append(clarabel.PSDTriangleConeT(n))

    def solve(self, obj_col):
        q = np.zeros(self.nvars)
        q[int(obj_col)] = 1.0
        P = sp.csc_matrix((self.nvars, self.nvars))
        A = sp.csc_matrix((self.vals, (self.rows, self.cols)), shape=(self.nrows, self.nvars))
        b = np.array(self.b_list, dtype=float)
        merged = []
        for c in self.cones:
            if merged and type(c) is type(merged[-1]) and isinstance(c, clarabel.NonnegativeConeT):
                merged[-1] = clarabel.NonnegativeConeT(merged[-1].dim + c.dim)
            else:
                merged.append(c)
        settings = clarabel.DefaultSettings()
        settings.verbose = False
        settings.max_iter = 300
        return clarabel.DefaultSolver(P, q, A, b, merged, settings).solve()


def eval_schur_h32(sol, ek, r_test):
    uk = ek ** 2
    v_t = r_test ** 2
    Ft, Gt, Yt = hat_test_matrices(uk, v_t)
    sl = sol['slope']
    p1 = Ft.T @ sol['phi1'] + sl[0] * v_t
    G1 = Gt.T @ sol['phi1'] + 0.5 * sl[0] * (v_t ** 2)
    Y1 = Yt.T @ sol['phi1'] + 0.5 * sl[0] * v_t
    p2 = Ft.T @ sol['phi2'] + sl[1] * v_t
    G2 = Gt.T @ sol['phi2'] + 0.5 * sl[1] * (v_t ** 2)
    Y2 = Yt.T @ sol['phi2'] + 0.5 * sl[1] * v_t

    mb, mc2 = sol['mu_bud'], sol['mu_c2']
    psa = Ft.T @ sol['psi_a']
    M00 = mb + mc2
    M11 = mb
    M01 = mb - 0.5 * psa
    M22 = 2.0 * mb + psa
    D2 = M00 * M11 - M01 ** 2

    b0 = -5.0 * mb - 2.0 * mc2 - 0.25 * p1 - 0.5 * (Ft.T @ sol['xi2'])
    b1 = -5.0 * mb - (1.0 / 6.0) * p2 - 0.5 * (Ft.T @ sol['xi1'])
    b2 = 0.5 * (sol['sig_neg'] - sol['sig_pos']) * v_t - 0.25 * Y1 - (1.0 / 6.0) * Y2 - 0.5 * (Ft.T @ sol['xia'])
    lam0, lam1, lam2 = sol['lam']
    q1 = lam0 + 25.0 * mb + 4.0 * mc2 + lam1 * v_t + lam2 * (v_t ** 2) + sol['l3'] * (v_t ** 3) + G1 + G2 - r_test
    quad = (M11 * b0 ** 2 + M00 * b1 ** 2 - 2.0 * M01 * b0 * b1) / D2 + (b2 ** 2) / M22
    return q1 - quad, D2


def rat(x, bits):
    return Fr(int(round(float(x) * (1 << bits))), 1 << bits)


def sqrt_ub(s):
    q = 10 ** 12
    return Fr(isqrt(s.numerator * q * q // s.denominator) + 1, q)


def make_pure_moment_row_h32(s_lo, s_hi):
    """Exact closed-form 2-knot pure-moment certificate row for s_lo >= 140:
       P(r) = 1 + (1/2)(V - 1) - eps*(V - 1)^2 + (eps/L)*(V - 1)^3 + bump > r  for all r >= 0,
       where L = ceil(2 * M_3(s_hi) / (1 + s_lo)) and eps = 1 / (6 * (L + 3))."""
    sb_lo = sqrt_ub(s_lo)
    sb_hi = sqrt_ub(s_hi)
    m3_hi = 6 + 9 * s_hi + V32.C6_H32 * s_hi * sb_hi
    L_int = int((2 * m3_hi) // (1 + s_lo)) + 2
    L = Fr(L_int)
    eps = Fr(1, 6 * (L_int + 3))
    # Expand 1 + (1/2)(V - 1) - eps*(V - 1)^2 + (eps/L)*(V - 1)^3 + bump in powers 1, V, V^2, V^3:
    # Add tiny mu_bud = 2^{-46} so M(v) is strictly PD (costing 10 * 1840 * 2^{-46} ~ 2.6e-10),
    # and add +25*mu_bud + bump to constant term (note verify_row adds 25*mu_bud to lam0, and has b1=-5*mu_bud, b2=-5*mu_bud,
    # whose quad_12 / D2 = (mb*25*mb^2 + mb*25*mb^2 - 2*mb*25*mb^2)/(0)? Careful: if mu_c2 = 0 and psi_a = 0, D2 = mb^2 - mb^2 = 0!
    # Set mu_c2 = mu_bud = 2^{-46}, psi_a = [0, 0] => D2 = mb*(2*mb) - mb^2 = mb^2 > 0, and quad_12/D2 = 29*mb, ALREADY in 25*mb + 4*mb = 29*mb!!
    mb_q = Fr(1, 1 << 46)
    mc2_q = Fr(1, 1 << 46)
    bump = Fr(1, 1 << 28)  # ~ 3.7e-9, strictly positive margin at r = 1!
    c0 = Fr(1, 2) - eps - eps / L + bump
    c1_p = Fr(1, 2) + 2 * eps + 3 * eps / L
    c2_p = -eps - 3 * eps / L
    c3_p = eps / L
    kden = 1 << 16
    row = dict(
        s_lo=str(s_lo), s_hi=str(s_hi),
        knots=['0', '1'],
        knot_den=kden,
        phi1=[0, 0], phi2=[0, 0], psi_a=[0, 0],
        xi2=[0, 0], xi1=[0, 0], xia=[0, 0],
        slope=['0', '0'],
        lam=[str(c0), str(c1_p), str(c2_p)],
        l3=str(c3_p),
        mu_bud=str(mb_q), mu_c2=str(mc2_q),
        sig_pos='0', sig_neg='0',
        sqrt_ub_lo=str(sb_lo), sqrt_ub_hi=str(sb_hi),
    )
    vr = V32.verify_row(row)
    return row, vr['bound']


def make_row_h32(s_lo, s_hi, kbits=32):
    if s_lo >= 140:
        return make_pure_moment_row_h32(s_lo, s_hi)
    knots = knots_h32(high_s=(s_hi >= 60))
    ek = np.array([float(x) for x in knots])
    uk = ek ** 2
    K = len(uk)

    pts = [0.0]
    for a_, b_ in zip(ek[:-1], ek[1:]):
        nsub = 8 if b_ > 50.0 else 4
        pts.extend(list(a_ + (b_ - a_) * (np.arange(nsub) + 0.5) / nsub))
        pts.append(b_)
    pts.extend(list(np.geomspace(ek[-1] * 1.005, 4000.0, 40)))
    rr = np.unique(np.array(pts))

    rd = np.unique(np.concatenate([
        np.concatenate([a_ + (b_ - a_) * (np.arange(40) + 0.5) / 40 for a_, b_ in zip(ek[:-1], ek[1:])]),
        ek,
        np.geomspace(ek[-1] * 1.0005, 20000.0, 400),
    ]))

    m3_hi = 6.0 + 9.0 * float(s_hi) + C6f * (float(s_hi) ** 1.5)
    fl_l3 = 2e-5 / max(1.0, m3_hi * 1e-8)
    fl = 1e-8 / (1.0 + float(s_hi))
    sol = None
    for it in range(3):
        v = rr ** 2
        Fm, Gm, Ym = hat_test_matrices(uk, v)
        cb = ConicBuilder()
        c1_v = cb.var(K); c2_v = cb.var(K); sl12 = cb.var(2)
        lam0 = cb.var(); lam1 = cb.var(); lam2 = cb.var(); l3 = cb.var()
        mu_bud = cb.var(); mu_c2 = cb.var(); sig_pos = cb.var(); sig_neg = cb.var()
        xk2 = cb.var(K); xk1 = cb.var(K); xka = cb.var(K); psi_a = cb.var(K); t_obj = cb.var()

        nn = [(-fl_l3, [(l3, 1.0)]), (-fl, [(mu_bud, 1.0)]), (0.0, [(mu_c2, 1.0)]),
              (0.0, [(sig_pos, 1.0)]), (0.0, [(sig_neg, 1.0)])]
        for k in range(K):
            nn.extend([(0.0, [(psi_a[k], 1.0)]), (0.0, [(xk2[k], 1.0)]), (0.0, [(xk1[k], 1.0)])])
            cb.add_soc([(0.0, [(xk2[k], 1.0), (xk1[k], 1.0)]),
                        (0.0, [(xka[k], 1.0)]),
                        (0.0, [(xk2[k], 1.0), (xk1[k], -1.0)])])
        cb.add_nonneg_batch(nn)

        for i in range(len(v)):
            vi, ri = v[i], rr[i]
            nz_f, nz_g, nz_y = np.flatnonzero(Fm[:, i]), np.flatnonzero(Gm[:, i]), np.flatnonzero(Ym[:, i])
            si = 1.0 / (1.0 + 0.005 * vi + 1e-6 * (ri ** 3))
            si2 = si * si
            cb.add_psd(4, [
                (-fl, [(mu_bud, 1.0), (mu_c2, 1.0)]),
                (0.0, [(mu_bud, 1.0)] + [(psi_a[k], -0.5 * Fm[k, i]) for k in nz_f]),
                (-fl, [(mu_bud, 1.0)]),
                (0.0, []), (0.0, []),
                (-fl, [(mu_bud, 2.0)] + [(psi_a[k], Fm[k, i]) for k in nz_f]),
                (0.0, [(c1_v[k], -0.25 * si * Fm[k, i]) for k in nz_f] + [(sl12[0], -0.25e-2 * vi * si), (mu_bud, -5.0 * si), (mu_c2, -2.0 * si)] + [(xk2[k], -0.5 * si * Fm[k, i]) for k in nz_f]),
                (0.0, [(c2_v[k], -(1.0 / 6.0) * si * Fm[k, i]) for k in nz_f] + [(sl12[1], -(1.0 / 6.0) * 1e-2 * vi * si), (mu_bud, -5.0 * si)] + [(xk1[k], -0.5 * si * Fm[k, i]) for k in nz_f]),
                (0.0, [(c1_v[k], -0.25 * si * Ym[k, i]) for k in nz_y] + [(sl12[0], -0.125e-2 * vi * si)] + [(c2_v[k], -(1.0 / 6.0) * si * Ym[k, i]) for k in nz_y] + [(sl12[1], -(1.0 / 12.0) * 1e-2 * vi * si), (sig_neg, 0.5 * vi * si), (sig_pos, -0.5 * vi * si)] + [(xka[k], -0.5 * si * Fm[k, i]) for k in nz_f]),
                (-(2e-7 + ri) * si2, [(lam0, si2), (lam1, vi * si2), (lam2, 1e-2 * (vi ** 2) * si2), (l3, 1e-8 * (vi ** 3) * si2), (sl12[0], 0.5e-2 * (vi ** 2) * si2), (sl12[1], 0.5e-2 * (vi ** 2) * si2), (mu_bud, 25.0 * si2), (mu_c2, 4.0 * si2)] + [(c1_v[k], si2 * Gm[k, i]) for k in nz_g] + [(c2_v[k], si2 * Gm[k, i]) for k in nz_g]),
            ])

        if True:
            # Exact 4x4 asymptotic v^2 PSD condition at v = +oo for small/moderate s:
            c_rho_tail = [(sig_neg, 0.5), (sig_pos, -0.5), (sl12[0], -0.125e-2), (sl12[1], -(1.0 / 12.0) * 1e-2)]
            cb.add_psd(4, [
                (-fl, [(mu_bud, 1.0), (mu_c2, 1.0)]),
                (0.0, [(mu_bud, 1.0), (psi_a[K - 1], -0.5)]),
                (-fl, [(mu_bud, 1.0)]),
                (0.0, []), (0.0, []),
                (-fl, [(mu_bud, 2.0), (psi_a[K - 1], 1.0)]),
                (0.0, [(sl12[0], -0.25e-2)]),
                (0.0, [(sl12[1], -(1.0 / 6.0) * 1e-2)]),
                (0.0, c_rho_tail),
                (0.0, [(lam2, 1e-2), (sl12[0], 0.5e-2), (sl12[1], 0.5e-2)]),
            ])

        for s_f in sorted({float(s_lo), float(s_hi)}):
            M3 = 6.0 + 9.0 * s_f + C6f * (s_f ** 1.5)
            cb.add_nonneg_batch([(0.0, [(t_obj, 1.0), (lam0, -1.0), (lam1, -1.0), (lam2, -(2.0 + s_f) * 1e-2),
                                        (l3, -M3 * 1e-8), (mu_bud, -10.0 * s_f), (mu_c2, -K2f * s_f), (sig_pos, -2.5 * s_f)])])

        res = cb.solve(t_obj)
        x = np.array(res.x, dtype=float)
        sol = dict(
            phi1=x[c1_v], phi2=x[c2_v],
            psi_a=np.maximum(x[psi_a], 0.0),
            xi2=np.maximum(x[xk2], 0.0), xi1=np.maximum(x[xk1], 0.0), xia=x[xka],
            slope=x[sl12] * 1e-2,
            lam=[x[lam0], x[lam1], x[lam2] * 1e-2],
            l3=max(x[l3] * 1e-8, 1e-18),
            mu_bud=max(x[mu_bud], 1e-12),
            mu_c2=max(x[mu_c2], 0.0),
            sig_pos=max(x[sig_pos], 0.0),
            sig_neg=max(x[sig_neg], 0.0),
        )
        sch, d2 = eval_schur_h32(sol, ek, rd)
        if sch.min() > -5e-8 and d2.min() > 0:
            break
        edges = np.concatenate([ek, [np.inf]])
        idx_c = np.searchsorted(edges, rd, side='right') - 1
        new_pts = [rd[m[np.argmin(sch[m])]] for kc in np.unique(idx_c) for m in [np.where(idx_c == kc)[0]] if sch[m].min() < -1e-8]
        if not new_pts:
            break
        rr = np.unique(np.concatenate([rr, np.array(new_pts)]))

    kden = 1 << kbits
    mb_q = max(Fr(1, 1 << 42), rat(sol['mu_bud'], 48))
    mc2_q = max(Fr(0), rat(sol['mu_c2'], 48))
    sp_q = max(Fr(0), rat(sol['sig_pos'], 48))
    sn_q = max(Fr(0), rat(sol['sig_neg'], 48))
    l3_q = max(Fr(1, 1 << 64), rat(sol['l3'], 80) + Fr(1, 1 << 62))
    sl_q = [rat(sol['slope'][0], 52), rat(sol['slope'][1], 52)]

    def q_int(arr):
        return [int(round(float(v_) * kden)) for v_ in arr]

    phi1_i, phi2_i = q_int(sol['phi1']), q_int(sol['phi2'])
    psa_i = [max(0, v_) for v_ in q_int(sol['psi_a'])]
    # Clamp psi_a so D2(u_k) > 0 strictly!
    for k in range(K):
        while True:
            pa = Fr(psa_i[k], kden)
            if mb_q * (mb_q + mc2_q) - (mb_q - Fr(1, 2) * pa) ** 2 > 0:
                break
            psa_i[k] = max(0, psa_i[k] - 1) if pa > 2 * mb_q else psa_i[k] + 1

    lam1_q = rat(sol['lam'][1], 44) + Fr(16, kden)
    if True:
        c_rho_q = Fr(1, 2) * (sn_q - sp_q) - Fr(1, 8) * sl_q[0] - Fr(1, 12) * sl_q[1]
        pa_last_q = Fr(psa_i[K - 1], kden)
        m12_last = mb_q - Fr(1, 2) * pa_last_q
        d2_last = mb_q * (mb_q + mc2_q) - m12_last * m12_last
        s1_q, s2_q = Fr(-1, 4) * sl_q[0], Fr(-1, 6) * sl_q[1]
        quad12_v2_q = (mb_q * s1_q * s1_q + (mb_q + mc2_q) * s2_q * s2_q - 2 * m12_last * s1_q * s2_q) / d2_last
        quad_v2_q = quad12_v2_q + (c_rho_q ** 2) / (2 * mb_q + pa_last_q)
        lam2_min_q = quad_v2_q - Fr(1, 2) * (sl_q[0] + sl_q[1]) + Fr(1, 1 << 40)
        lam2_q = max(rat(sol['lam'][2], 52), lam2_min_q)
    else:
        # Match quad_v2 difference without clamping lam2 >= 0 (since lam2 < 0 is active at large s!):
        c_rho_f = 0.5 * (sol['sig_neg'] - sol['sig_pos']) - 0.125 * sol['slope'][0] - (1.0 / 12.0) * sol['slope'][1]
        pa_last_f = float(psa_i[K - 1]) / kden
        m12_f = sol['mu_bud'] - 0.5 * pa_last_f
        d2_f = sol['mu_bud'] * (sol['mu_bud'] + sol['mu_c2']) - m12_f ** 2
        s1_f, s2_f = -0.25 * sol['slope'][0], -(1.0 / 6.0) * sol['slope'][1]
        qv2_f = (sol['mu_bud'] * s1_f**2 + (sol['mu_bud'] + sol['mu_c2']) * s2_f**2 - 2.0 * m12_f * s1_f * s2_f) / d2_f + (c_rho_f**2) / (2.0 * sol['mu_bud'] + pa_last_f) - 0.5 * (sol['slope'][0] + sol['slope'][1])

        c_rho_q = Fr(1, 2) * (sn_q - sp_q) - Fr(1, 8) * sl_q[0] - Fr(1, 12) * sl_q[1]
        pa_last_q = Fr(psa_i[K - 1], kden)
        m12_last = mb_q - Fr(1, 2) * pa_last_q
        d2_last = mb_q * (mb_q + mc2_q) - m12_last * m12_last
        s1_q, s2_q = Fr(-1, 4) * sl_q[0], Fr(-1, 6) * sl_q[1]
        qv2_q = (mb_q * s1_q * s1_q + (mb_q + mc2_q) * s2_q * s2_q - 2 * m12_last * s1_q * s2_q) / d2_last + (c_rho_q ** 2) / (2 * mb_q + pa_last_q) - Fr(1, 2) * (sl_q[0] + sl_q[1])
        lam2_q = rat(sol['lam'][2], 56) + max(Fr(0), qv2_q - rat(qv2_f, 56)) + Fr(1, 1 << 46)

    xi2_i = [max(0, v_) for v_ in q_int(sol['xi2'])]
    xi1_i = [max(0, v_) for v_ in q_int(sol['xi1'])]
    xia_i = []
    for k in range(K):
        va = int(round(float(sol['xia'][k]) * kden))
        lim = isqrt(4 * xi1_i[k] * xi2_i[k])
        xia_i.append(max(-lim, min(lim, va)))

    # Evaluate exact quantized Schur complement on dense grid to pick tightest safe lam0_q!
    sol_q_f = dict(
        phi1=np.array(phi1_i, float) / kden, phi2=np.array(phi2_i, float) / kden,
        psi_a=np.array(psa_i, float) / kden,
        xi2=np.array(xi2_i, float) / kden, xi1=np.array(xi1_i, float) / kden, xia=np.array(xia_i, float) / kden,
        slope=[float(sl_q[0]), float(sl_q[1])],
        lam=[float(sol['lam'][0]), float(lam1_q), float(lam2_q)],
        l3=float(l3_q), mu_bud=float(mb_q), mu_c2=float(mc2_q), sig_pos=float(sp_q), sig_neg=float(sn_q),
    )
    sch_q, _ = eval_schur_h32(sol_q_f, ek, rd)
    bump = max(0.0, -float(sch_q.min())) + 1.5e-6
    lam0_q = rat(sol['lam'][0] + bump, 40)

    for attempt in range(8):
        row = dict(
            s_lo=str(s_lo), s_hi=str(s_hi),
            knots=[str(x) for x in knots],
            knot_den=kden,
            phi1=phi1_i, phi2=phi2_i, psi_a=psa_i,
            xi2=xi2_i, xi1=xi1_i, xia=xia_i,
            slope=[str(x) for x in sl_q],
            lam=[str(lam0_q), str(lam1_q), str(lam2_q)],
            l3=str(l3_q),
            mu_bud=str(mb_q), mu_c2=str(mc2_q),
            sig_pos=str(sp_q), sig_neg=str(sn_q),
        )
        if s_lo > 0:
            row['sqrt_ub_lo'] = str(sqrt_ub(s_lo))
        if s_hi > 0:
            row['sqrt_ub_hi'] = str(sqrt_ub(s_hi))
        try:
            vr = V32.verify_row(row)
            return row, vr['bound']
        except Exception as ex:
            if attempt == 7:
                print('   quantize error:', ex, file=sys.stderr)
            step = Fr(1, 1 << max(12, 22 - 2 * attempt))
            lam0_q += step
            lam1_q += step / 100
            lam2_q += step / (10000 * (1 + int(s_hi)))
    raise RuntimeError(f'Failed to quantize H_{{3,2}} row [{s_lo}, {s_hi}]')


def main():
    t0 = time.time()
    out_path = sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(os.path.abspath(__file__)), 'cert_h32.json')
    pts = [Fr(x) for x in DEFAULT_POINTS_H32]
    rows = []
    worst = Fr(0)
    for a, b in zip(pts[:-1], pts[1:]):
        row, bnd = make_row_h32(a, b)
        rows.append(row)
        if bnd > worst:
            worst = bnd
        print('built H_{3,2} row [%6s, %6s]: bound <= %s' % (a, b, V32.dec_ceil10(bnd)), flush=True)

    cert = dict(
        chaos='H_{3,2}(C^n)',
        claim='999999/1000000',
        s_max='1840',
        c6_bound='115400',
        k2_bound='1013/100',
        rows=rows,
    )
    with open(out_path, 'w', encoding='utf-8') as fh:
        json.dump(cert, fh, separators=(',', ':'))
    sz = os.path.getsize(out_path)
    print('wrote %s (%d bytes = %.1f KB) in %.1fs; max bound <= %s' % (
        out_path, sz, sz / 1024.0, time.time() - t0, V32.dec_ceil10(worst)))


if __name__ == '__main__':
    main()
