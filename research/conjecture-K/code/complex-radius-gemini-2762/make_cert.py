#!/usr/bin/env python3
"""Standalone generator of the third-order complex-radius certificate cert_916.json.

Usage:  python3 -B make_cert.py [OUT.json] [s_lo:s_hi,...]

Uses numpy, scipy and clarabel for numerical conic search and LP polishing; every generated row is
rounded to exact dyadic rationals and verified on the spot by BOTH independent exact stdlib verifiers
(verify_cert.py via Sturm sequences and verify_bernstein.py via 4x4 determinants + Bernstein subdivision).
"""
import json
import os
import sys
import time
from fractions import Fraction as Fr
from math import isqrt, sqrt

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import clarabel
import numpy as np
import scipy.sparse as sp
from scipy.optimize import linprog

import verify_bernstein as VB
import verify_cert as VC

SQ2 = np.sqrt(2.0)
C6f = float(VC.C6)
EROWf = np.array([float(x) for x in VC.EROW])
S0f = np.array([float(x) for x in VC.S0])
H0f = np.array([float(x) for x in VC.H0])

THETAS = [
    Fr(1, 16), Fr(1, 12), Fr(1, 8), Fr(1, 6), Fr(1, 5), Fr(1, 4), Fr(3, 10), Fr(1, 3), Fr(2, 5), Fr(1, 2),
    Fr(3, 5), Fr(2, 3), Fr(3, 4), Fr(4, 5), Fr(9, 10), Fr(1), Fr(10, 9), Fr(5, 4), Fr(4, 3), Fr(3, 2),
    Fr(5, 3), Fr(2), Fr(5, 2), Fr(3), Fr(10, 3), Fr(4), Fr(5), Fr(6), Fr(8), Fr(12), Fr(16),
]

DEFAULT_POINTS = [
    '0', '1/2', '1', '3/2', '2', '5/2', '3', '13/4', '7/2', '15/4', '4',
    '17/4', '9/2', '19/4', '5', '11/2', '6', '7', '8', '10', '14', '20', '30', '42',
]


def knots_peak():
    ks = [Fr(0)]
    segs = [
        (Fr(1, 2), Fr(1, 10)),
        (Fr(5, 2), Fr(1, 20)),
        (Fr(4), Fr(1, 10)),
        (Fr(8), Fr(1, 5)),
        (Fr(13), Fr(1, 2)),
        (Fr(21), Fr(1, 4)),
        (Fr(30), Fr(1, 2)),
    ]
    for end, step in segs:
        while ks[-1] < end:
            ks.append(ks[-1] + step)
    ks += [Fr(x) for x in (31, 32, 33, 34, 35, 36, 38, 40, 44, 50, 60, 80, 120, 200)]
    return ks


def knots_flank():
    ks = [Fr(0)]
    segs = [
        (Fr(4), Fr(1, 10)),
        (Fr(8), Fr(1, 5)),
        (Fr(13), Fr(1, 2)),
        (Fr(22), Fr(1, 4)),
        (Fr(30), Fr(1, 2)),
    ]
    for end, step in segs:
        while ks[-1] < end:
            ks.append(ks[-1] + step)
    ks += [Fr(x) for x in (31, 32, 34, 36, 40, 46, 55, 70, 100, 150, 220)]
    return ks


def hat_test_matrices(uk, v):
    """Continuous piecewise-linear hat basis in v on knots uk[0]=0 < ... < uk[K], constant beyond uk[K]."""
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
        self.rows = []
        self.cols = []
        self.vals = []
        self.b_list = []
        self.cones = []
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

    def add_eq(self, terms, rhs=0.0):
        self._append_row(terms, rhs)
        self.cones.append(clarabel.ZeroConeT(1))

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
            if merged and type(c) is type(merged[-1]) and isinstance(c, (clarabel.ZeroConeT, clarabel.NonnegativeConeT)):
                merged[-1] = type(c)(merged[-1].dim + c.dim)
            else:
                merged.append(c)
        settings = clarabel.DefaultSettings()
        settings.verbose = False
        settings.max_iter = 300
        return clarabel.DefaultSolver(P, q, A, b, merged, settings).solve()


def eval_schur_dense(sol, ek, r_test):
    uk = ek ** 2
    v_test = r_test ** 2
    Ft, Gt, Yt = hat_test_matrices(uk, v_test)
    gvt = np.zeros_like(Gt)
    nzt = v_test > 0
    gvt[:, nzt] = Gt[:, nzt] / v_test[nzt]
    gvt[:, ~nzt] = Ft[:, ~nzt]

    c1v, c2v, c3v, c4v = sol['phi1'], sol['phi2'], sol['phi3'], sol['phi4']
    slv = sol['slope']
    p1t = Ft.T @ c1v + slv[0] * v_test
    G1t = Gt.T @ c1v + slv[0] * (v_test ** 2) / 2.0
    Y1t = Yt.T @ c1v + slv[0] * v_test / 2.0
    p2t = Ft.T @ c2v + slv[1] * v_test
    G2t = Gt.T @ c2v + slv[1] * (v_test ** 2) / 2.0
    Y2t = Yt.T @ c2v + slv[1] * v_test / 2.0
    p3t, G3t, Y3t, g3t = Ft.T @ c3v, Gt.T @ c3v, Yt.T @ c3v, gvt.T @ c3v
    p4t, G4t, Y4t, g4t = Ft.T @ c4v, Gt.T @ c4v, Yt.T @ c4v, gvt.T @ c4v

    m00, m01, m11 = sol['m_ker']
    mu_a, mu_rho, mu_w, sig = sol['mu_a'], sol['mu_rho'], sol['mu_w'], sol['sigma']
    lam0, lam1, lam2 = sol['lam']
    lam3 = sum(sol['l3'])

    tau_wt = v_test * ((g3t + g4t) ** 2) / (4.0 * mu_w)
    q1t = (lam0 + lam1 * v_test + lam2 * (v_test ** 2) + lam3 * (v_test ** 3)
           + G1t + G2t - G3t - r_test + (m00 + 4.0 * m01 + 4.0 * m11))
    b0t = 0.5 * (-p1t + p3t + G3t - 2.0 * m00 - 4.0 * m01 - tau_wt - Ft.T @ sol['xi2'])
    b1t = 0.5 * (-0.5 * p2t - 2.0 * m01 - 4.0 * m11 - Ft.T @ sol['xi1'])
    b2t = 0.5 * (-Y1t - 0.5 * Y2t + sig * v_test + Y3t + G4t - Ft.T @ sol['xia'])

    M00 = m00 - p3t
    M11 = m11 * np.ones_like(v_test)
    M22 = mu_rho + mu_a + Ft.T @ sol['psi_a'] - p4t
    M01 = m01 - 0.5 * (Ft.T @ sol['psi_a'])
    M02 = -0.5 * (Y3t + Y4t)

    D2 = M00 * M11 - M01 ** 2
    D3 = M22 * D2 - M11 * (M02 ** 2)
    adj00 = M11 * M22
    adj11 = M00 * M22 - M02 ** 2
    adj22 = D2
    adj01 = -M01 * M22
    adj02 = -M11 * M02
    adj12 = M01 * M02
    quad = (adj00 * b0t ** 2 + adj11 * b1t ** 2 + adj22 * b2t ** 2
            + 2.0 * adj01 * b0t * b1t + 2.0 * adj02 * b0t * b2t + 2.0 * adj12 * b1t * b2t) / D3
    return q1t - quad, M00, D2, D3


def solve_clarabel_rounds(s_lo, s_hi, knots, sub=5, rounds=3, m3_floor=1.5e-5):
    ek = np.array([float(x) for x in knots])
    pts = [0.0]
    for a_, b_ in zip(ek[:-1], ek[1:]):
        pts.extend(list(a_ + (b_ - a_) * (np.arange(sub) + 0.5) / sub))
        pts.append(b_)
    pts.extend(list(np.geomspace(ek[-1] * 1.01, max(800.0, 4.0 * ek[-1]), 25)))
    rr = np.unique(np.array(pts))

    rd = np.unique(np.concatenate([
        np.concatenate([a_ + (b_ - a_) * (np.arange(50) + 0.5) / 50 for a_, b_ in zip(ek[:-1], ek[1:])]),
        ek,
        np.geomspace(ek[-1] * 1.0005, max(5000.0, 25.0 * ek[-1]), 500),
    ]))

    uk = ek ** 2
    K = len(uk)
    sol_dict = None
    obj_val = None

    for it in range(rounds):
        v = rr ** 2
        Fm, Gm, Ym = hat_test_matrices(uk, v)
        gv_mat = np.zeros_like(Gm)
        nz = v > 0
        gv_mat[:, nz] = Gm[:, nz] / v[nz]
        gv_mat[:, ~nz] = Fm[:, ~nz]
        N = len(v)

        cb = ConicBuilder()
        c1 = cb.var(K); c2 = cb.var(K); c3 = cb.var(K); c4 = cb.var(K)
        sl12 = cb.var(2)
        lam = cb.var(3)
        l3 = cb.var(3)
        m00 = cb.var(); m01 = cb.var(); m11 = cb.var()
        mu_a = cb.var(); mu_rho = cb.var(); mu_w = cb.var()
        sig = cb.var()
        psi_a = cb.var(K)
        xk0_2 = cb.var(K); xk0_1 = cb.var(K); xk0_a = cb.var(K)
        t_obj = cb.var()

        nn = [(0.0, [(l3[0], 1.0)]), (0.0, [(l3[1], 1.0)]), (0.0, [(l3[2], 1.0)]),
              (-1e-2, [(l3[0], 1.0), (l3[1], 1.0), (l3[2], 1.0)]),
              (0.0, [(mu_a, 1.0)]), (-1e-5, [(mu_rho, 1.0)]), (-1e-5, [(mu_w, 1.0)])]
        for k in range(K):
            nn.append((0.0, [(psi_a[k], 1.0)]))
            nn.append((0.0, [(psi_a[k], 1.0), (mu_a, 1.0), (c4[k], -1.0)]))
            nn.append((0.0, [(xk0_2[k], 1.0)]))
            nn.append((0.0, [(xk0_1[k], 1.0)]))
        cb.add_nonneg_batch(nn)
        cb.add_psd(2, [(0.0, [(m00, 1.0)]), (0.0, [(m01, 1.0)]), (-m3_floor, [(m11, 1.0)])])

        for k in range(K):
            cb.add_soc([(0.0, [(xk0_2[k], 1.0), (xk0_1[k], 1.0)]),
                        (0.0, [(xk0_a[k], 1.0)]),
                        (0.0, [(xk0_2[k], 1.0), (xk0_1[k], -1.0)])])

        tau_w = cb.var(N)
        cb.add_nonneg_batch([(0.0, [(tau_w[i], 1.0)]) for i in range(N)])

        for i in range(N):
            vi = v[i]; ri = rr[i]
            nz_f = np.flatnonzero(Fm[:, i])
            nz_g = np.flatnonzero(Gm[:, i])
            nz_y = np.flatnonzero(Ym[:, i])
            nz_gv = np.flatnonzero(gv_mat[:, i])

            g34_terms = [(c3[k], ri * gv_mat[k, i]) for k in nz_gv] + [(c4[k], ri * gv_mat[k, i]) for k in nz_gv]
            cb.add_soc([(0.0, [(mu_w, 1.0), (tau_w[i], 1.0)]),
                        (0.0, g34_terms),
                        (0.0, [(mu_w, 1.0), (tau_w[i], -1.0)])])

            denom = 1.0 + 0.02 * vi + 0.0005 * (ri ** 3)
            si = 1.0 / denom
            si2 = si * si
            si2_v = vi * si2
            si2_v2 = (vi / denom) ** 2
            si2_v3 = ((ri ** 3) / denom) ** 2

            t_M00 = [(m00, 1.0)] + [(c3[k], -Fm[k, i]) for k in nz_f]
            t_M01 = [(m01, 1.0)] + [(psi_a[k], -0.5 * Fm[k, i]) for k in nz_f]
            t_M11 = [(m11, 1.0)]
            t_M02 = [(c3[k], -0.5 * Ym[k, i]) for k in nz_y] + [(c4[k], -0.5 * Ym[k, i]) for k in nz_y]
            t_M22 = [(mu_rho, 1.0), (mu_a, 1.0)] + [(psi_a[k], Fm[k, i]) for k in nz_f] + [(c4[k], -Fm[k, i]) for k in nz_f]

            t_b0 = ([(c1[k], -0.5 * si * Fm[k, i]) for k in nz_f] + [(sl12[0], -0.5e-2 * (vi * si))]
                    + [(c3[k], 0.5 * si * Fm[k, i]) for k in nz_f] + [(c3[k], 0.5 * si * Gm[k, i]) for k in nz_g]
                    + [(m00, -si), (m01, -2.0 * si), (tau_w[i], -0.5 * si)]
                    + [(xk0_2[k], -0.5 * si * Fm[k, i]) for k in nz_f])
            t_b1 = ([(c2[k], -0.25 * si * Fm[k, i]) for k in nz_f] + [(sl12[1], -0.25e-2 * (vi * si))]
                    + [(m01, -si), (m11, -2.0 * si)]
                    + [(xk0_1[k], -0.5 * si * Fm[k, i]) for k in nz_f])
            t_b2 = ([(c1[k], -0.5 * si * Ym[k, i]) for k in nz_y] + [(sl12[0], -0.25e-2 * (vi * si))]
                    + [(c2[k], -0.25 * si * Ym[k, i]) for k in nz_y] + [(sl12[1], -0.125e-2 * (vi * si))]
                    + [(sig, 0.5 * (vi * si))]
                    + [(c3[k], 0.5 * si * Ym[k, i]) for k in nz_y] + [(c4[k], 0.5 * si * Gm[k, i]) for k in nz_g]
                    + [(xk0_a[k], -0.5 * si * Fm[k, i]) for k in nz_f])

            t_q1 = ([(lam[0], si2), (lam[1], si2_v), (lam[2], 1e-2 * si2_v2),
                     (l3[0], 1e-4 * si2_v3), (l3[1], 1e-4 * si2_v3), (l3[2], 1e-4 * si2_v3),
                     (sl12[0], 0.5e-2 * si2_v2), (sl12[1], 0.5e-2 * si2_v2),
                     (m00, si2), (m01, 4.0 * si2), (m11, 4.0 * si2)]
                    + [(c1[k], si2 * Gm[k, i]) for k in nz_g]
                    + [(c2[k], si2 * Gm[k, i]) for k in nz_g]
                    + [(c3[k], -si2 * Gm[k, i]) for k in nz_g])

            cb.add_psd(4, [
                (-m3_floor, t_M00),
                (0.0,       t_M01),
                (-m3_floor, t_M11),
                (0.0,       t_M02),
                (0.0,       []),
                (-m3_floor, t_M22),
                (0.0,       t_b0),
                (0.0,       t_b1),
                (0.0,       t_b2),
                (-(2e-6 + ri) * si2, t_q1),
            ])

        for s in (float(s_lo), float(s_hi)):
            if s == 0.0:
                cb.add_nonneg_batch([(0.0, [(t_obj, 1.0), (lam[0], -1.0), (lam[1], -1.0), (lam[2], -2e-2),
                                            (l3[0], -6e-4), (l3[1], -6e-4), (l3[2], -6e-4)])])
            else:
                eta = cb.var()
                nu = cb.var(2); om = cb.var(5); ze = cb.var(3); ch = cb.var(3); ps = cb.var(3); kap = cb.var()
                cb.add_nonneg_batch([(0.0, [(nu[0], 1.0)]), (0.0, [(nu[1], 1.0)]), (0.0, [(kap, 1.0)])]
                                    + [(0.0, [(om[j], 1.0)]) for j in range(5)])
                cb.add_soc([(0.0, [(ze[0], 1.0), (ze[1], 1.0)]), (0.0, [(ze[2], 1.0)]), (0.0, [(ze[0], 1.0), (ze[1], -1.0)])])
                cb.add_soc([(0.0, [(ch[0], 1.0), (ch[1], 1.0)]), (0.0, [(ch[2], 1.0)]), (0.0, [(ch[0], 1.0), (ch[1], -1.0)])])
                sq = np.sqrt(s)
                cb.add_soc([(0.0, [(ps[0], 1.0), (ps[1], 1.0)]), (0.0, [(ps[2], 1.0)]), (0.0, [(ps[0], 1.0), (ps[1], -1.0)])])
                cb.add_eq([(l3[1], 300.0e-4 * sq), (l3[2], 135.0e-4 * sq), (ps[2], 1.0)], 0.0)

                d_base = [
                    [(m00, 16.0), (m01, 32.0), (m11, 32.0)],
                    [(m00, 4.0),  (m11, 16.0)],
                    [(m11, 16.0), (mu_a, 32.0), (mu_rho, 32.0), (sig, 32.0)],
                    [(m01, 48.0), (m11, 48.0), (mu_a, 24.0), (mu_rho, 24.0), (mu_w, 24.0), (sig, 48.0)],
                    [(m01, 16.0), (m11, 16.0)],
                ]
                st_extra = [
                    [(eta, -32.0), (nu[0], 1.0), (om[0], 1.0), (ze[0], 1.0), (ch[1], 1.0)],
                    [(eta, -8.0),                (om[1], 1.0), (ze[1], 1.0), (ch[0], 1.0)],
                    [(eta, -32.0), (nu[0], -1.0),(om[2], 1.0),               (ch[1], 1.0)],
                    [(eta, -96.0), (nu[1], -1.0),(om[3], 1.0),               (ch[1], 3.0), (ch[2], 3.0)],
                    [              (nu[1], 1.0), (om[4], 1.0), (ze[2], 1.0), (ch[1], -1.0),(ch[2], -1.0)],
                ]
                for idx in range(5):
                    j_terms = [(l3[1], sq * 198.0e-4 * H0f[idx]), (l3[2], sq * (11781.0 / 32.0) * 1e-4 * H0f[idx]),
                               (ps[0], S0f[idx]), (ps[1], H0f[idx]), (kap, H0f[idx])]
                    cb.add_eq(d_base[idx] + j_terms + st_extra[idx], 0.0)

                M3 = 6.0 + 9.0 * s + C6f * (s ** 1.5)
                cb.add_nonneg_batch([(0.0, [(t_obj, 1.0), (lam[0], -1.0), (lam[1], -1.0), (lam[2], -(2.0 + s) * 1e-2),
                                            (l3[0], -M3 * 1e-4), (l3[1], -(6.0 + 9.0 * s) * 1e-4),
                                            (l3[2], -(6.0 + 9.0 * s) * 1e-4), (eta, -s)])])

        sol = cb.solve(t_obj)
        x = np.array(sol.x, dtype=float)
        obj_val = float(sol.obj_val)
        sol_dict = dict(
            phi1=x[c1], phi2=x[c2], phi3=x[c3], phi4=x[c4],
            psi_a=np.maximum(x[psi_a], 0.0),
            xi2=np.maximum(x[xk0_2], 0.0), xi1=np.maximum(x[xk0_1], 0.0), xia=x[xk0_a],
            slope=x[sl12] * 1e-2,
            lam=np.array([x[lam[0]], x[lam[1]], x[lam[2]] * 1e-2]),
            l3=np.maximum(x[l3] * 1e-4, 0.0),
            m_ker=[x[m00], x[m01], max(x[m11], 1e-6)],
            mu_a=max(x[mu_a], 0.0), mu_rho=max(x[mu_rho], 1e-6), mu_w=max(x[mu_w], 1e-6),
            sigma=float(x[sig]),
        )
        sch, _, _, d3 = eval_schur_dense(sol_dict, ek, rd)
        print('   [%s:%s] round %d: obj=%.7f (%s), N=%d, min_schur=%.2e at r=%.3f' % (
            s_lo, s_hi, it, obj_val, sol.status, N, sch.min(), rd[sch.argmin()]), file=sys.stderr, flush=True)
        if sch.min() > -1e-6 and d3.min() > 0:
            break
        edges = np.concatenate([ek, [np.inf]])
        idx_c = np.searchsorted(edges, rd, side='right') - 1
        new_pts = []
        for kc in np.unique(idx_c):
            m = np.where(idx_c == kc)[0]
            j = m[np.argmin(sch[m])]
            if sch[j] < -2e-7:
                new_pts.extend([rd[j]] + ([rd[j - 1]] if j > 0 else []) + ([rd[j + 1]] if j + 1 < len(rd) else []))
        rr2 = np.unique(np.concatenate([rr, np.array(new_pts)]))
        if len(rr2) == len(rr):
            break
        rr = rr2
    return sol_dict, obj_val


def rat(x, bits):
    return Fr(int(round(float(x) * (1 << bits))), 1 << bits)


def sqrt_ub(s):
    q = 10 ** 12
    return Fr(isqrt(s.numerator * q * q // s.denominator) + 1, q)


def all_cuts(extra_thetas=()):
    cuts = [(t, None) for t in ('n', 'h', 'b', 'y', 'z', 'bn', 'yz', 'h0', 'm')]
    ths = sorted(set(THETAS) | set(extra_thetas))
    cuts += [('c1', th) for th in ths]
    cuts += [('c2+', th) for th in ths] + [('c2-', th) for th in ths]
    return cuts


def par_lp(cvec, cuts):
    A = np.array([[float(x) for x in VC.cut_vector(t, th)] for t, th in cuts])
    res = linprog(-np.array(cvec, float), A_ub=-A, b_ub=np.zeros(len(cuts)),
                  A_eq=np.array([EROWf], float), b_eq=[1.0], bounds=[(None, None)] * 5, method='highs')
    if res.status != 0:
        raise RuntimeError('parameter LP failed: ' + res.message)
    return -res.fun, res.x, -float(res.eqlin.marginals[0]), -np.array(res.ineqlin.marginals)


def par_part_3rd(m_ker, mu_a, mu_rho, mu_w, sig, l3, s_ends):
    m00, m01, m11 = m_ker
    dlin = [
        16 * m00 + 32 * m01 + 32 * m11,
        4 * m00 + 16 * m11,
        16 * m11 + 32 * (mu_a + mu_rho + sig),
        48 * m01 + 48 * m11 + 24 * (mu_a + mu_rho + mu_w) + 48 * sig,
        16 * m01 + 16 * m11,
    ]
    cuts = all_cuts()
    par_json = {}
    lp_vals = {}
    for name, s_e in zip(('lo', 'hi'), s_ends):
        if s_e == 0:
            lp_vals[name] = 0.0
            continue
        sb = sqrt_ub(s_e)

        def lpval(al, cuts_=cuts):
            dJ = [l3[1] * (150 * al[0] * VC.S0[i] + (198 + Fr(150) / al[0]) * VC.H0[i])
                  + l3[2] * (Fr(135, 2) * al[1] * VC.S0[i] + (Fr(11781, 32) + Fr(135, 2) / al[1]) * VC.H0[i])
                  for i in range(5)]
            c = [float(dlin[i] + sb * dJ[i]) for i in range(5)]
            return par_lp(c, cuts_)

        al = [Fr(1, 4), Fr(1, 4)]
        for _ in range(2):
            for idx in (0, 1):
                if l3[idx + 1] == 0:
                    continue
                lo, hi = -5.0, 3.0
                gr = (sqrt(5.0) - 1.0) / 2.0

                def f(xv):
                    a2 = list(al)
                    a2[idx] = Fr(float(np.exp(xv))).limit_denominator(10 ** 6)
                    return lpval(a2)[0]

                c_, d_ = hi - gr * (hi - lo), lo + gr * (hi - lo)
                fc, fd = f(c_), f(d_)
                for _ in range(36):
                    if fc < fd:
                        hi, d_, fd = d_, c_, fc
                        c_ = hi - gr * (hi - lo)
                        fc = f(c_)
                    else:
                        lo, c_, fc = c_, d_, fd
                        d_ = lo + gr * (hi - lo)
                        fd = f(d_)
                al[idx] = Fr(float(np.exp(0.5 * (lo + hi)))).limit_denominator(10 ** 4)

        val, p, eta, y = lpval(al)
        extra = []
        if p[0] > 1e-9 and p[1] > 1e-9:
            extra.append(Fr(sqrt(p[1] / p[0])).limit_denominator(2000))
        m_ = p[0] + p[2] + 3.0 * p[3] - p[4]
        if p[1] > 1e-9 and m_ > 1e-9:
            extra.append(Fr(sqrt(m_ / p[1])).limit_denominator(2000))
        cuts2 = all_cuts(extra)
        val, p, eta, y = lpval(al, cuts2)
        keep = [(cuts2[i][0], None if cuts2[i][1] is None else str(cuts2[i][1]), str(rat(y[i], 52)))
                for i in range(len(cuts2)) if y[i] > 1e-13]
        par_json[name] = dict(alpha=[str(x) for x in al], eta=str(rat(eta, 52)), cuts=keep, sqrt_ub=str(sb))
        lp_vals[name] = val
    return par_json, lp_vals


def make_row(s_lo, s_hi, knots, kbits=26):
    t0 = time.time()
    sol, _ = solve_clarabel_rounds(s_lo, s_hi, knots)
    kden = 1 << kbits
    K = len(knots) - 1

    m00 = max(Fr(0), rat(sol['m_ker'][0], 44))
    m01 = rat(sol['m_ker'][1], 44)
    m11 = max(Fr(1, 1 << 24), rat(sol['m_ker'][2], 44))
    while m00 * m11 < m01 * m01:
        m00 += Fr(1, 1 << 38)
        m11 += Fr(1, 1 << 38)
    mu_a = max(Fr(0), rat(sol['mu_a'], 44))
    mu_rho = max(Fr(1, 1 << 28), rat(sol['mu_rho'], 44))
    mu_w = max(Fr(1, 1 << 28), rat(sol['mu_w'], 44))
    sig = rat(sol['sigma'], 44)
    slope = [rat(sol['slope'][0], 46), rat(sol['slope'][1], 46)]
    l3 = [rat(x, 58) if x > 1e-12 else Fr(0) for x in sol['l3']]

    to_int_arr = lambda arr: [int(round(float(x) * kden)) for x in arr]
    iphi1 = to_int_arr(sol['phi1'])
    iphi2 = to_int_arr(sol['phi2'])
    iphi3 = to_int_arr(sol['phi3'])
    iphi4 = to_int_arr(sol['phi4'])
    ipsi = [max(0, x) for x in to_int_arr(sol['psi_a'])]
    ixi2 = [max(0, x) for x in to_int_arr(sol['xi2'])]
    ixi1 = [max(0, x) for x in to_int_arr(sol['xi1'])]
    ixia = to_int_arr(sol['xia'])

    for k in range(K + 1):
        while Fr(ipsi[k], kden) + mu_a - Fr(iphi4[k], kden) < 0:
            ipsi[k] += 1
        while ixia[k] * ixia[k] > 4 * ixi1[k] * ixi2[k]:
            ixi1[k] += 1
            ixi2[k] += 1
        while (m00 - Fr(iphi3[k], kden) <= Fr(1, 1 << 22)
               or m11 * (m00 - Fr(iphi3[k], kden)) - (m01 - Fr(ipsi[k], 2 * kden)) ** 2 <= Fr(1, 1 << 32)):
            iphi3[k] -= 1

    par_json, lp_vals = par_part_3rd((m00, m01, m11), mu_a, mu_rho, mu_w, sig, l3, (s_lo, s_hi))

    ek = np.array([float(x) for x in knots])
    rp = np.unique(np.concatenate([
        np.concatenate([a_ + (b_ - a_) * (np.arange(80) + 0.5) / 80 for a_, b_ in zip(ek[:-1], ek[1:])]),
        ek,
        np.geomspace(ek[-1] * 1.0002, max(5000.0, 25.0 * ek[-1]), 600),
    ]))
    vp = rp * rp
    solr = dict(
        phi1=np.array(iphi1, float) / kden, phi2=np.array(iphi2, float) / kden,
        phi3=np.array(iphi3, float) / kden, phi4=np.array(iphi4, float) / kden,
        psi_a=np.array(ipsi, float) / kden,
        xi2=np.array(ixi2, float) / kden, xi1=np.array(ixi1, float) / kden, xia=np.array(ixia, float) / kden,
        slope=[float(slope[0]), float(slope[1])],
        lam=[0.0, 0.0, 0.0], l3=[0.0, float(l3[1]), float(l3[2])],
        m_ker=[float(m00), float(m01), float(m11)],
        mu_a=float(mu_a), mu_rho=float(mu_rho), mu_w=float(mu_w), sigma=float(sig),
    )
    base_schur, _, _, _ = eval_schur_dense(solr, ek, rp)
    scp = 1.0 / (1.0 + 0.02 * vp ** 2 + 7e-5 * vp ** 3)
    req_slack = 4e-6 * (1.0 + 5e-7 * vp ** 2)
    A = -np.column_stack([np.ones_like(vp), vp, vp ** 2 * 1e-2, vp ** 3 * 1e-4, np.zeros_like(vp)]) * scp[:, None]
    bvec = (base_schur - req_slack) * scp
    rows_t, rhs_t = [], []
    for name, s_e in (('lo', s_lo), ('hi', s_hi)):
        sf = float(s_e)
        const = float((l3[1] + l3[2]) * (6 + 9 * s_e)) + sf * lp_vals[name]
        rows_t.append([1.0, 1.0, (2.0 + sf) * 1e-2, (6.0 + 9.0 * sf + C6f * (sf ** 1.5)) * 1e-4, -1.0])
        rhs_t.append(-const)
    resp = linprog([0, 0, 0, 0, 1.0], A_ub=np.vstack([A, np.array(rows_t)]), b_ub=np.concatenate([bvec, rhs_t]),
                   bounds=[(None, None), (None, None), (None, None), (0, None), (None, None)], method='highs')
    if resp.status != 0:
        raise RuntimeError('polish LP failed: ' + resp.message)

    lam_base = [rat(resp.x[0], 40), rat(resp.x[1], 40), rat(resp.x[2] * 1e-2, 54)]
    l3[0] = max(Fr(0), rat(resp.x[3] * 1e-4, 70))
    if sum(l3) == 0:
        l3[0] = Fr(1, 1 << 50)

    row = dict(
        s_lo=str(s_lo), s_hi=str(s_hi),
        knots=[str(x) for x in knots], knot_den=kden,
        phi1=iphi1, phi2=iphi2, phi3=iphi3, phi4=iphi4,
        psi_a=ipsi, xi2=ixi2, xi1=ixi1, xia=ixia,
        lam=[str(x) for x in lam_base], l3=[str(x) for x in l3],
        m_ker=[str(m00), str(m01), str(m11)],
        mu_a=str(mu_a), mu_rho=str(mu_rho), mu_w=str(mu_w), sigma=str(sig),
        slope=[str(x) for x in slope],
        par=par_json,
    )

    margin = 2e-6
    res_s = None
    for _ in range(14):
        lam0 = rat(float(lam_base[0]) + margin, 40)
        lam2 = rat(float(lam_base[2]) + margin * 1e-6, 54)
        row['lam'] = [str(lam0), str(lam_base[1]), str(lam2)]
        res_s = VC.verify_row(row, quiet=True)
        if res_s['ok']:
            break
        margin *= 2.0
    if not res_s['ok']:
        raise RuntimeError(f'Sturm verification failed for [{s_lo}, {s_hi}]')
    res_b = VB.verify_row_bernstein(row)
    assert res_s['bound'] == res_b['bound'], 'Sturm vs Bernstein exact bound mismatch!'
    sz = len(json.dumps(row, separators=(',', ':')))
    print('[%6s, %6s]  exact bound <= %.10f  (Sturm & Bernstein PASS, %d B, %.1fs)' % (
        s_lo, s_hi, float(res_s['bound']), sz, time.time() - t0), flush=True)
    return row, res_s['bound']


def main():
    out = sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(os.path.abspath(__file__)), 'cert_916.json')
    if len(sys.argv) > 2:
        ivs = [tuple(Fr(x) for x in part.split(':')) for part in sys.argv[2].split(',')]
    else:
        pts = [Fr(x) for x in DEFAULT_POINTS]
        ivs = list(zip(pts[:-1], pts[1:]))

    rows = []
    worst = Fr(0)
    t_start = time.time()
    for s_lo, s_hi in ivs:
        ks = knots_peak() if (s_lo >= Fr(5, 2) and s_hi <= Fr(7)) else knots_flank()
        row, bnd = make_row(s_lo, s_hi, ks, kbits=26)
        rows.append(row)
        if bnd > worst:
            worst = bnd
        cert = dict(
            statement='For every n >= 1 and every q in H_{2,1}(C^n), E|q| <= (2289/2500) * (E|q|^2)^{1/2} = 0.9156 * (E|q|^2)^{1/2} < 0.916 * (E|q|^2)^{1/2}.',
            claim='2289/2500',
            rows=rows,
        )
        raw = json.dumps(cert, separators=(',', ':'))
        with open(out, 'w', encoding='utf-8') as fh:
            fh.write(raw)

    total_bytes = os.path.getsize(out)
    print('DONE: %d rows, max exact bound = %s (<= %.10f), size = %d bytes, %.1fs' % (
        len(rows), worst, float(worst) + 1e-12, total_bytes, time.time() - t_start), flush=True)


if __name__ == '__main__':
    main()
