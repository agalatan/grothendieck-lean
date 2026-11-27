#!/usr/bin/env python3
"""Standalone generator of cert_912.json (U(1)-averaged OU resolvent + Damped Level-3 Stein cover).

Usage:  python3 -B make_cert.py [OUT.json]

Uses numpy, scipy, and clarabel for numerical conic search and LP polishing; every generated row is
rounded to exact dyadic rationals and verified on the spot by BOTH independent pure-stdlib zero-float
verifiers (`verify.py` via Sturm + LDL^T and `verify_bernstein.py` via Bernstein + Block2-Schur + symbolic
Q[v, c_2]).  At the end, full end-to-end verification is run and `< 300,000` bytes is enforced.
"""
import json
import math
import os
import sys
import time
from fractions import Fraction as Fr
from math import isqrt, sqrt

os.environ.setdefault('OMP_NUM_THREADS', '1')
os.environ.setdefault('OPENBLAS_NUM_THREADS', '1')

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import clarabel
import numpy as np
import scipy.sparse as sp
from scipy.optimize import linprog

import verify as VC3
import verify_bernstein as VB3

SQ2 = np.sqrt(2.0)
C6f = float(VC3.C6)
EROWf = np.array([float(x) for x in VC3.EROW])
S0f = np.array([float(x) for x in VC3.S0])
H0f = np.array([float(x) for x in VC3.H0])

THETAS = [
    Fr(1, 16), Fr(1, 12), Fr(1, 8), Fr(1, 6), Fr(1, 5), Fr(1, 4), Fr(3, 10), Fr(1, 3), Fr(2, 5), Fr(1, 2),
    Fr(3, 5), Fr(2, 3), Fr(3, 4), Fr(4, 5), Fr(9, 10), Fr(1), Fr(10, 9), Fr(5, 4), Fr(4, 3), Fr(3, 2),
    Fr(5, 3), Fr(2), Fr(5, 2), Fr(3), Fr(10, 3), Fr(4), Fr(5), Fr(6), Fr(8), Fr(12), Fr(16),
]


def require(cond, msg='generator check failed'):
    if not cond:
        raise RuntimeError(msg)


def knots_l3():
    """104-knot mesh for Damped Level-3 peak rows, ending with coprime return ramp (53, 60, 64, 68)."""
    ks = [Fr(0)]
    for end, step in [(Fr(5, 2), Fr(1, 16)), (Fr(4), Fr(1, 8)), (Fr(8), Fr(1, 4)), (Fr(16), Fr(1, 2)), (Fr(28), Fr(3, 2))]:
        while ks[-1] < end:
            ks.append(ks[-1] + step)
    ks += [Fr(x) for x in (32, 36, 42, 53, 60, 64, 68, 80, 105, 150, 220)]
    return ks


def knots_l3_hi25():
    """106-knot mesh for [25, 26] sharp high-chi row, refining [28, 53] while preserving (53, 60, 64, 68)."""
    ks = [Fr(0)]
    for end, step in [(Fr(5, 2), Fr(1, 16)), (Fr(4), Fr(1, 8)), (Fr(8), Fr(1, 4)), (Fr(16), Fr(1, 2)), (Fr(28), Fr(3, 2))]:
        while ks[-1] < end:
            ks.append(ks[-1] + step)
    ks += [Fr(x) for x in (31, 35, 39, 44, 48, 53, 60, 64, 68, 80, 105, 150, 220)]
    return ks


def knots_flank():
    """111-knot mesh for Level-2 flank rows on [8, 25] and [26, 42]."""
    ks = [Fr(0)]
    for end, step in [(Fr(3), Fr(1, 12)), (Fr(8), Fr(1, 4)), (Fr(13), Fr(1, 2)), (Fr(22), Fr(1, 3)), (Fr(30), Fr(1))]:
        while ks[-1] < end:
            ks.append(ks[-1] + step)
    ks += [Fr(x) for x in (32, 35, 40, 48, 60, 80, 115, 165, 220)]
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


def rat(x, bits):
    return Fr(int(round(float(x) * (1 << bits))), 1 << bits)


def sqrt_ub(s):
    q = 10**12
    return Fr(isqrt(s.numerator * q * q // s.denominator) + 1, q)


def all_cuts(extra_thetas=()):
    cuts = [(t, None) for t in ('n', 'h', 'b', 'y', 'z', 'bn', 'yz', 'h0', 'm')]
    ths = sorted(set(THETAS) | set(extra_thetas))
    cuts += [('c1', th) for th in ths]
    cuts += [('c2+', th) for th in ths] + [('c2-', th) for th in ths]
    return cuts


def par_lp(cvec, cuts):
    A = np.array([[float(x) for x in VC3.cut_vector(t, th)] for t, th in cuts])
    res = linprog(-np.array(cvec, float), A_ub=-A, b_ub=np.zeros(len(cuts)),
                  A_eq=np.array([EROWf], float), b_eq=[1.0], bounds=[(None, None)] * 5, method='highs')
    require(res.status == 0, 'parameter LP failed: ' + res.message)
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
            dJ = [l3[1] * (150 * al[0] * VC3.S0[i] + (198 + Fr(150) / al[0]) * VC3.H0[i])
                  + l3[2] * (Fr(135, 2) * al[1] * VC3.S0[i] + (Fr(11781, 32) + Fr(135, 2) / al[1]) * VC3.H0[i])
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
                    a2[idx] = Fr(float(np.exp(xv))).limit_denominator(10**6)
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
                al[idx] = Fr(float(np.exp(0.5 * (lo + hi)))).limit_denominator(10**4)

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


def eval_schur_dense(sol, ek, r_test):
    uk = ek**2
    v_test = r_test**2
    Ft, Gt, Yt = hat_test_matrices(uk, v_test)
    gvt = np.zeros_like(Gt)
    nzt = v_test > 0
    gvt[:, nzt] = Gt[:, nzt] / v_test[nzt]
    gvt[:, ~nzt] = Ft[:, ~nzt]

    c1v, c2v, c3v, c4v = sol['phi1'], sol['phi2'], sol['phi3'], sol['phi4']
    slv = sol['slope']
    p1t = Ft.T @ c1v + slv[0] * v_test
    G1t = Gt.T @ c1v + slv[0] * (v_test**2) / 2.0
    Y1t = Yt.T @ c1v + slv[0] * v_test / 2.0
    p2t = Ft.T @ c2v + slv[1] * v_test
    G2t = Gt.T @ c2v + slv[1] * (v_test**2) / 2.0
    Y2t = Yt.T @ c2v + slv[1] * v_test / 2.0
    p3t, G3t, Y3t, g3t = Ft.T @ c3v, Gt.T @ c3v, Yt.T @ c3v, gvt.T @ c3v
    p4t, G4t, Y4t, g4t = Ft.T @ c4v, Gt.T @ c4v, Yt.T @ c4v, gvt.T @ c4v

    m00, m01, m11 = sol['m_ker']
    mu_a, mu_rho, mu_w, sig = sol['mu_a'], sol['mu_rho'], sol['mu_w'], sol['sigma']
    lam0, lam1, lam2 = sol['lam']
    lam3 = sum(sol['l3'])

    tau_wt = v_test * ((g3t + g4t) ** 2) / (4.0 * mu_w)
    q1t = (lam0 + lam1 * v_test + lam2 * (v_test**2) + lam3 * (v_test**3)
           + G1t + G2t - G3t - r_test + (m00 + 4.0 * m01 + 4.0 * m11))
    b0t = 0.5 * (-p1t + p3t + G3t - 2.0 * m00 - 4.0 * m01 - tau_wt - Ft.T @ sol['xi2'])
    b1t = 0.5 * (-0.5 * p2t - 2.0 * m01 - 4.0 * m11 - Ft.T @ sol['xi1'])
    b2t = 0.5 * (-Y1t - 0.5 * Y2t + sig * v_test + Y3t + G4t - Ft.T @ sol['xia'])

    M00 = m00 - p3t
    M11 = m11 * np.ones_like(v_test)
    M22 = mu_rho + mu_a + Ft.T @ sol['psi_a'] - p4t
    M01 = m01 - 0.5 * (Ft.T @ sol['psi_a'])
    M02 = -0.5 * (Y3t + Y4t)

    D2 = M00 * M11 - M01**2
    D3 = M22 * D2 - M11 * (M02**2)
    adj00 = M11 * M22
    adj11 = M00 * M22 - M02**2
    adj22 = D2
    adj01 = -M01 * M22
    adj02 = -M11 * M02
    adj12 = M01 * M02
    quad = (adj00 * b0t**2 + adj11 * b1t**2 + adj22 * b2t**2
            + 2.0 * adj01 * b0t * b1t + 2.0 * adj02 * b0t * b2t + 2.0 * adj12 * b1t * b2t) / D3
    return q1t - quad, M00, D2, D3


def solve_l2_rounds(s_lo, s_hi, knots, sub=5, rounds=3, m3_floor=1.5e-5):
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

    uk = ek**2
    K = len(uk)
    sol_dict = None
    obj_val = None

    for _ in range(rounds):
        v = rr**2
        Fm, Gm, Ym = hat_test_matrices(uk, v)
        gv_mat = np.zeros_like(Gm)
        nz = v > 0
        gv_mat[:, nz] = Gm[:, nz] / v[nz]
        gv_mat[:, ~nz] = Fm[:, ~nz]
        N = len(v)

        cb = ConicBuilder()
        c1 = cb.var(K); c2 = cb.var(K); c3 = cb.var(K); c4 = cb.var(K)
        sl12 = cb.var(2); lam = cb.var(3); l3 = cb.var(3)
        m00 = cb.var(); m01 = cb.var(); m11 = cb.var()
        mu_a = cb.var(); mu_rho = cb.var(); mu_w = cb.var(); sig = cb.var()
        psi_a = cb.var(K); xk0_2 = cb.var(K); xk0_1 = cb.var(K); xk0_a = cb.var(K); t_obj = cb.var()

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
            nz_f = np.flatnonzero(Fm[:, i]); nz_g = np.flatnonzero(Gm[:, i])
            nz_y = np.flatnonzero(Ym[:, i]); nz_gv = np.flatnonzero(gv_mat[:, i])

            g34_terms = [(c3[k], ri * gv_mat[k, i]) for k in nz_gv] + [(c4[k], ri * gv_mat[k, i]) for k in nz_gv]
            cb.add_soc([(0.0, [(mu_w, 1.0), (tau_w[i], 1.0)]),
                        (0.0, g34_terms),
                        (0.0, [(mu_w, 1.0), (tau_w[i], -1.0)])])

            denom = 1.0 + 0.02 * vi + 0.0005 * (ri**3)
            si = 1.0 / denom; si2 = si * si
            si2_v = vi * si2; si2_v2 = (vi / denom) ** 2; si2_v3 = ((ri**3) / denom) ** 2

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
                    + [(m01, -si), (m11, -2.0 * si)] + [(xk0_1[k], -0.5 * si * Fm[k, i]) for k in nz_f])
            t_b2 = ([(c1[k], -0.5 * si * Ym[k, i]) for k in nz_y] + [(sl12[0], -0.25e-2 * (vi * si))]
                    + [(c2[k], -0.25 * si * Ym[k, i]) for k in nz_y] + [(sl12[1], -0.125e-2 * (vi * si))]
                    + [(sig, 0.5 * (vi * si))]
                    + [(c3[k], 0.5 * si * Ym[k, i]) for k in nz_y] + [(c4[k], 0.5 * Gm[k, i] * si) for k in nz_g]
                    + [(xk0_a[k], -0.5 * si * Fm[k, i]) for k in nz_f])

            t_q1 = ([(lam[0], si2), (lam[1], si2_v), (lam[2], 1e-2 * si2_v2),
                     (l3[0], 1e-4 * si2_v3), (l3[1], 1e-4 * si2_v3), (l3[2], 1e-4 * si2_v3),
                     (sl12[0], 0.5e-2 * si2_v2), (sl12[1], 0.5e-2 * si2_v2),
                     (m00, si2), (m01, 4.0 * si2), (m11, 4.0 * si2)]
                    + [(c1[k], si2 * Gm[k, i]) for k in nz_g]
                    + [(c2[k], si2 * Gm[k, i]) for k in nz_g]
                    + [(c3[k], -si2 * Gm[k, i]) for k in nz_g])

            cb.add_psd(4, [
                (-m3_floor, t_M00), (0.0, t_M01), (-m3_floor, t_M11),
                (0.0, t_M02), (0.0, []), (-m3_floor, t_M22),
                (0.0, t_b0), (0.0, t_b1), (0.0, t_b2), (-(2e-6 + ri) * si2, t_q1),
            ])

        for s in (float(s_lo), float(s_hi)):
            eta = cb.var(); nu = cb.var(2); om = cb.var(5); ze = cb.var(3); ch = cb.var(3); ps = cb.var(3); kap = cb.var()
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

            M3 = 6.0 + 9.0 * s + C6f * (s**1.5)
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


def make_l2_row(s_lo, s_hi, knots, kbits=25):
    t0 = time.time()
    sol, _ = solve_l2_rounds(s_lo, s_hi, knots)
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
    iphi1 = to_int_arr(sol['phi1']); iphi2 = to_int_arr(sol['phi2'])
    iphi3 = to_int_arr(sol['phi3']); iphi4 = to_int_arr(sol['phi4'])
    ipsi = [max(0, x) for x in to_int_arr(sol['psi_a'])]
    ixi2 = [max(0, x) for x in to_int_arr(sol['xi2'])]
    ixi1 = [max(0, x) for x in to_int_arr(sol['xi1'])]
    ixia = to_int_arr(sol['xia'])

    for k in range(K + 1):
        while Fr(ipsi[k], kden) + mu_a - Fr(iphi4[k], kden) < 0:
            ipsi[k] += 1
        while ixia[k] * ixia[k] > 4 * ixi1[k] * ixi2[k]:
            ixi1[k] += 1; ixi2[k] += 1
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
    scp = 1.0 / (1.0 + 0.02 * vp**2 + 7e-5 * vp**3)
    req_slack = 4e-6 * (1.0 + 5e-7 * vp**2)
    A = -np.column_stack([np.ones_like(vp), vp, vp**2 * 1e-2, vp**3 * 1e-4, np.zeros_like(vp)]) * scp[:, None]
    bvec = (base_schur - req_slack) * scp
    rows_t, rhs_t = [], []
    for name, s_e in (('lo', s_lo), ('hi', s_hi)):
        sf = float(s_e)
        const = float((l3[1] + l3[2]) * (6 + 9 * s_e)) + sf * lp_vals[name]
        rows_t.append([1.0, 1.0, (2.0 + sf) * 1e-2, (6.0 + 9.0 * sf + C6f * (sf**1.5)) * 1e-4, -1.0])
        rhs_t.append(-const)
    resp = linprog([0, 0, 0, 0, 1.0], A_ub=np.vstack([A, np.array(rows_t)]), b_ub=np.concatenate([bvec, rhs_t]),
                   bounds=[(None, None), (None, None), (None, None), (0, None), (None, None)], method='highs')
    require(resp.status == 0, 'polish LP failed: ' + resp.message)

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
        res_s = VC3.verify_row(row, quiet=True)
        if res_s['ok']:
            break
        margin *= 2.0
    require(res_s is not None and res_s['ok'], f'Sturm verification failed for L2 [{s_lo}, {s_hi}]')
    res_b = VB3.verify_row_bernstein(row)
    require(res_s['bound'] == res_b['bound'], 'Sturm vs Bernstein exact bound mismatch on L2 row!')
    sz = len(json.dumps(row, separators=(',', ':')))
    print('[L2]  [%6s, %6s]  exact bound <= %s  (Sturm & Bernstein PASS, %d B, %.1fs)' % (
        s_lo, s_hi, VC3.dec_ceil10(res_s['bound']), sz, time.time() - t0), flush=True)
    return row, res_s['bound']


def make_l3_row(s_lo, s_hi, ks, eps_fr=Fr(1, 25), sub=8, flr=1.2e-6, m3_flr=1e-5, kbits=33):
    t0 = time.time()
    eps_f = float(eps_fr)
    inv_e = 1.0 / eps_f; inv_e2 = inv_e * inv_e; inv_e3 = inv_e2 * inv_e
    c_1pe = 1.0 + eps_f; c_1pe2 = c_1pe * c_1pe; c_1p2e = 1.0 + 2.0 * eps_f
    ek = np.array([float(x) for x in ks]); uk = ek**2; K_len = len(uk); K = K_len - 1
    K0 = ks.index(Fr(68)); M0 = K0 + 1

    pts = [0.0]
    for a_, b_ in zip(ek[:-1], ek[1:]):
        pts.extend(list(a_ + (b_ - a_) * (np.arange(sub) + 0.5) / sub))
        pts.append(b_)
    pts.extend(list(np.geomspace(ek[-1] * 1.01, 1200.0, 28)))
    rr = np.unique(np.array(pts)); v = rr**2; N = len(v)
    Fm, Gm, Ym = hat_test_matrices(uk, v)
    gv_mat = np.zeros_like(Gm); nz = v > 0
    gv_mat[:, nz] = Gm[:, nz] / v[nz]; gv_mat[:, ~nz] = Fm[:, ~nz]

    cb = ConicBuilder()
    c1 = cb.var(K_len); c2 = cb.var(K_len); c3 = cb.var(K_len); c4 = cb.var(K_len)
    c5 = cb.var(K0); h5_0 = cb.var(); c6 = cb.var(K0); c7 = cb.var(K0); dw_k = cb.var(M0)
    dal_k = cb.var(M0); qs_k = cb.var(M0); trt1_k = cb.var(M0); trt2_k = cb.var(M0)
    a0_11_k = cb.var(M0); ps_11_k = cb.var(M0); ps_13_k = cb.var(M0); ps_23_k = cb.var(M0)
    a1_k = [cb.var(M0) for _ in range(3)]; b1_k = [cb.var(M0) for _ in range(3)]
    Tv_k = [cb.var(M0) for _ in range(15)]
    sl12 = cb.var(2); lam = cb.var(3); l3 = cb.var(3)
    m00 = cb.var(); m01 = cb.var(); m11 = cb.var()
    mu_a = cb.var(); mu_rho = cb.var(); mu_w = cb.var(); sig = cb.var()
    psi_a = cb.var(K_len); xk0_2 = cb.var(K_len); xk0_1 = cb.var(K_len); xk0_a = cb.var(K_len); t_obj = cb.var()

    i_K0 = int(np.where(rr == ek[K0])[0][0])
    cb.add_eq([(h5_0, 1.0)] + [(c5[k], Gm[k, i_K0]) for k in range(K0)], 0.0)
    cb.add_eq([(c6[k], Gm[k, i_K0]) for k in range(K0)], 0.0)
    cb.add_eq([(c7[k], Gm[k, i_K0]) for k in range(K0)], 0.0)

    nn = [(0.0, [(l3[0], 1.0)]), (0.0, [(l3[1], 1.0)]), (0.0, [(l3[2], 1.0)]),
          (-1e-4, [(l3[0], 1.0), (l3[1], 1.0), (l3[2], 1.0)]),
          (0.0, [(mu_a, 1.0)]), (-m3_flr, [(mu_rho, 1.0)]), (-m3_flr, [(mu_w, 1.0)])]
    for k in range(M0):
        nn.extend([(-m3_flr, [(dw_k[k], 1.0)]), (-flr, [(mu_w, 1.0), (dw_k[k], -1.0)])])
        nn.extend([(0.0, [(psi_a[k], 1.0), (mu_a, 1.0), (c4[k], -1.0), (dal_k[k], -1.0)]),
                   (-2.5e-5, [(trt1_k[k], 1.0)]), (-2.5e-5, [(trt2_k[k], 1.0)])])
        cb.add_psd(2, [(-flr, [(a1_k[0][k], 1.0)]), (0.0, [(a1_k[1][k], 1.0)]), (-flr, [(a1_k[2][k], 1.0)])])
        cb.add_psd(2, [(-flr, [(b1_k[0][k], 1.0)]), (0.0, [(b1_k[1][k], 1.0)]), (-flr, [(b1_k[2][k], 1.0)])])
        cb.add_psd(5, [((-2.5e-6 if r_ == c_ else 0.0), [(Tv_k[c_ * (c_ + 1) // 2 + r_][k], 1.0)])
                       for c_ in range(5) for r_ in range(c_ + 1)])
    for k in range(K_len):
        nn.append((0.0, [(psi_a[k], 1.0)]))
        if k >= M0:
            nn.append((0.0, [(psi_a[k], 1.0), (mu_a, 1.0), (c4[k], -1.0)]))
        nn.extend([(0.0, [(xk0_2[k], 1.0)]), (0.0, [(xk0_1[k], 1.0)])])
        cb.add_soc([(0.0, [(xk0_2[k], 1.0), (xk0_1[k], 1.0)]),
                    (0.0, [(xk0_a[k], 1.0)]),
                    (0.0, [(xk0_2[k], 1.0), (xk0_1[k], -1.0)])])
    cb.add_nonneg_batch(nn)
    cb.add_psd(2, [(0.0, [(m00, 1.0)]), (0.0, [(m01, 1.0)]), (-m3_flr, [(m11, 1.0)])])

    for i in range(N):
        vi = v[i]; ri = rr[i]
        nz_f = np.flatnonzero(Fm[:, i]); nz_g = np.flatnonzero(Gm[:, i])
        nz_y = np.flatnonzero(Ym[:, i]); nz_gv = np.flatnonzero(gv_mat[:, i])
        denom = 1.0 + 0.02 * vi + 0.0005 * (ri**3)
        si = 1.0 / denom; si2 = si * si
        si2_v = vi * si2; si2_v2 = (vi / denom) ** 2; si2_v3 = ((ri**3) / denom) ** 2
        if ri > ek[K0]:
            tau_wi = cb.var(); cb.add_nonneg_batch([(0.0, [(tau_wi, 1.0)])])
            g34_terms = [(c3[k], ri * gv_mat[k, i]) for k in nz_gv] + [(c4[k], ri * gv_mat[k, i]) for k in nz_gv]
            cb.add_soc([(0.0, [(mu_w, 1.0), (tau_wi, 1.0)]), (0.0, g34_terms), (0.0, [(mu_w, 1.0), (tau_wi, -1.0)])])
            t_M00 = [(m00, 1.0)] + [(c3[k], -Fm[k, i]) for k in nz_f]
            t_M01 = [(m01, 1.0)] + [(psi_a[k], -0.5 * Fm[k, i]) for k in nz_f]; t_M11 = [(m11, 1.0)]
            t_M02 = [(c3[k], -0.5 * Ym[k, i]) for k in nz_y] + [(c4[k], -0.5 * Ym[k, i]) for k in nz_y]
            t_M22 = [(mu_rho, 1.0), (mu_a, 1.0)] + [(psi_a[k], Fm[k, i]) for k in nz_f] + [(c4[k], -Fm[k, i]) for k in nz_f]
            t_b0 = ([(c1[k], -0.5 * si * Fm[k, i]) for k in nz_f] + [(sl12[0], -0.5e-2 * (vi * si))]
                    + [(c3[k], 0.5 * si * Fm[k, i]) for k in nz_f] + [(c3[k], 0.5 * si * Gm[k, i]) for k in nz_g]
                    + [(m00, -si), (m01, -2.0 * si), (tau_wi, -0.5 * si)]
                    + [(xk0_2[k], -0.5 * si * Fm[k, i]) for k in nz_f])
            t_b1 = ([(c2[k], -0.25 * si * Fm[k, i]) for k in nz_f] + [(sl12[1], -0.25e-2 * (vi * si))]
                    + [(m01, -si), (m11, -2.0 * si)] + [(xk0_1[k], -0.5 * si * Fm[k, i]) for k in nz_f])
            t_b2 = ([(c1[k], -0.5 * si * Ym[k, i]) for k in nz_y] + [(sl12[0], -0.25e-2 * (vi * si))]
                    + [(c2[k], -0.25 * si * Ym[k, i]) for k in nz_y] + [(sl12[1], -0.125e-2 * (vi * si))]
                    + [(sig, 0.5 * (vi * si))] + [(c3[k], 0.5 * si * Ym[k, i]) for k in nz_y]
                    + [(c4[k], 0.5 * si * Gm[k, i]) for k in nz_g] + [(xk0_a[k], -0.5 * si * Fm[k, i]) for k in nz_f])
            t_q1 = ([(lam[0], si2), (lam[1], si2_v), (lam[2], 1e-2 * si2_v2),
                     (l3[0], 1e-4 * si2_v3), (l3[1], 1e-4 * si2_v3), (l3[2], 1e-4 * si2_v3),
                     (sl12[0], 0.5e-2 * si2_v2), (sl12[1], 0.5e-2 * si2_v2),
                     (m00, si2), (m01, 4.0 * si2), (m11, 4.0 * si2)]
                    + [(c1[k], si2 * Gm[k, i]) for k in nz_g] + [(c2[k], si2 * Gm[k, i]) for k in nz_g]
                    + [(c3[k], -si2 * Gm[k, i]) for k in nz_g])
            cb.add_psd(4, [(-m3_flr, t_M00), (0.0, t_M01), (-m3_flr, t_M11), (0.0, t_M02), (0.0, []),
                           (-m3_flr, t_M22), (0.0, t_b0), (0.0, t_b1), (0.0, t_b2), (-(2e-6 + ri) * si2, t_q1)])
            continue

        nz_f0 = [k for k in nz_f if k < K0]; nz_fm = [k for k in nz_f if k < M0]
        nz_g0 = [k for k in nz_g if k < K0]; nz_y0 = [k for k in nz_y if k < K0]; nz_gv0 = [k for k in nz_gv if k < K0]
        Dw_terms = [(dw_k[k], Fm[k, i]) for k in nz_fm]
        h5_terms = [(h5_0, 1.0)] + [(c5[k], Gm[k, i]) for k in nz_g0]
        cb.add_nonneg_batch([(-flr, [(mu_w, 1.0)] + [(c, -v_) for c, v_ in h5_terms] + [(c, -v_) for c, v_ in Dw_terms])])

        def T_ij(a, b, nz_fm=nz_fm, i=i):
            if a > b:
                a, b = b, a
            idx = b * (b + 1) // 2 + a
            return [(Tv_k[idx][k], Fm[k, i]) for k in nz_fm]

        if vi > 0.0:
            l0 = ([(c3[k], ri * gv_mat[k, i]) for k in nz_gv] + [(c4[k], ri * gv_mat[k, i]) for k in nz_gv]
                  + [(c5[k], inv_e * ri * Fm[k, i]) for k in nz_f0] + [(c6[k], inv_e * ri * gv_mat[k, i]) for k in nz_gv0]
                  + [(c7[k], inv_e * ri * gv_mat[k, i]) for k in nz_gv0])
            l1 = ([(c5[k], -inv_e * ri * Fm[k, i]) for k in nz_f0] + [(h5_0, -ri)]
                  + [(c5[k], -ri * Gm[k, i]) for k in nz_g0] + [(c7[k], -(c_1pe * inv_e) * ri * gv_mat[k, i]) for k in nz_gv0])
            l2 = [(c6[k], -(c_1pe2 * inv_e) * ri * gv_mat[k, i]) for k in nz_gv0]
            r1 = [(c5[k], ri * Fm[k, i]) for k in nz_f0]
            r2 = [(c7[k], c_1pe * ri * gv_mat[k, i]) for k in nz_gv0]
            vecs5 = [l0, l1, l2, r1, r2]
            Dw4 = [(c, 4.0 * v_) for c, v_ in Dw_terms]
            psd6 = [(-2.5e-6, Dw4)]
            for cj in range(5):
                psd6.append((0.0, vecs5[cj]))
                for ri_ in range(cj + 1):
                    psd6.append(((-2.5e-6 if ri_ == cj else 0.0), T_ij(ri_, cj)))
            cb.add_psd(6, psd6)

        T33 = T_ij(3, 3); T34 = T_ij(3, 4); T44 = T_ij(4, 4)
        a1_0 = [(a1_k[0][k], Fm[k, i]) for k in nz_fm]
        a1_1 = [(a1_k[1][k], Fm[k, i]) for k in nz_fm]
        a1_2 = [(a1_k[2][k], Fm[k, i]) for k in nz_fm]
        A0_00 = [(dal_k[k], Fm[k, i]) for k in nz_fm] + [(c7[k], -inv_e * Fm[k, i]) for k in nz_f0]
        A0_01 = ([(c7[k], 0.5 * c_1pe * inv_e * Fm[k, i]) for k in nz_f0]
                 + [(c, -0.5 * inv_e * v_) for c, v_ in T33] + [(c, -0.5 * v_) for c, v_ in a1_0])
        A0_11 = [(a0_11_k[k], Fm[k, i]) for k in nz_fm]
        A0_02 = ([(c, 0.5 * inv_e * v_) for c, v_ in T33] + [(c, -inv_e * v_) for c, v_ in T34]
                 + [(a0_11_k[k], -0.5 * Fm[k, i]) for k in nz_fm] + [(c, -v_) for c, v_ in a1_1]
                 + [(c, 0.5 * v_) for c, v_ in a1_0])
        A0_12 = ([(c, inv_e * v_) for c, v_ in T34] + [(c, -0.5 * inv_e * v_) for c, v_ in T44]
                 + [(c, -0.5 * v_) for c, v_ in a1_2] + [(c, v_) for c, v_ in a1_1])
        A0_22 = [(c, inv_e * v_) for c, v_ in T44] + a1_2
        cb.add_psd(3, [(-flr, A0_00), (0.0, A0_01), (-flr, A0_11), (0.0, A0_02), (0.0, A0_12), (-flr, A0_22)])

        T00 = T_ij(0, 0); T01 = T_ij(0, 1); T02 = T_ij(0, 2); T11 = T_ij(1, 1); T12 = T_ij(1, 2); T22 = T_ij(2, 2)
        T03 = T_ij(0, 3); T04 = T_ij(0, 4); T13 = T_ij(1, 3); T14 = T_ij(1, 4); T23 = T_ij(2, 3); T24 = T_ij(2, 4)
        b1_0 = [(b1_k[0][k], Fm[k, i]) for k in nz_fm]
        b1_1 = [(b1_k[1][k], Fm[k, i]) for k in nz_fm]
        b1_2 = [(b1_k[2][k], Fm[k, i]) for k in nz_fm]
        qs_t = [(qs_k[k], Fm[k, i]) for k in nz_fm]
        trt1_t = [(trt1_k[k], Fm[k, i]) for k in nz_fm]
        trt2_t = [(trt2_k[k], Fm[k, i]) for k in nz_fm]
        Ps_00 = ([(c6[k], -c_1pe2 * inv_e3 * Fm[k, i]) for k in nz_f0]
                 + [(c6[k], -c_1p2e * inv_e2 * Gm[k, i]) for k in nz_g0]
                 + [(c, -2.0 * inv_e * v_) for c, v_ in T01] + qs_t)
        Ps_01 = ([(c6[k], 0.5 * c_1pe2 * inv_e3 * Fm[k, i]) for k in nz_f0]
                 + [(c6[k], 0.5 * c_1pe2 * inv_e2 * Gm[k, i]) for k in nz_g0]
                 + [(c, inv_e * v_) for c, v_ in T01] + [(c, -0.5 * inv_e * v_) for c, v_ in T11]
                 + [(c, -inv_e * v_) for c, v_ in T02] + [(c, -0.5 * v_) for c, v_ in b1_0])
        Ps_11 = [(ps_11_k[k], Fm[k, i]) for k in nz_fm]
        Ps_02 = ([(c, 0.5 * inv_e * v_) for c, v_ in T11] + [(c, inv_e * v_) for c, v_ in T02]
                 + [(c, -inv_e * v_) for c, v_ in T12] + [(ps_11_k[k], -0.5 * Fm[k, i]) for k in nz_fm]
                 + [(c, -v_) for c, v_ in b1_1] + [(c, 0.5 * v_) for c, v_ in b1_0])
        Ps_12 = ([(c, inv_e * v_) for c, v_ in T12] + [(c, -0.5 * inv_e * v_) for c, v_ in T22]
                 + [(c, -0.5 * v_) for c, v_ in b1_2] + [(c, v_) for c, v_ in b1_1])
        Ps_22 = [(c, inv_e * v_) for c, v_ in T22] + b1_2
        Ps_03 = ([(c6[k], -0.5 * c_1pe2 * inv_e2 * Ym[k, i]) for k in nz_y0]
                 + [(c7[k], -0.5 * c_1pe * inv_e2 * Ym[k, i]) for k in nz_y0]
                 + [(c7[k], -0.5 * c_1pe * inv_e * Gm[k, i]) for k in nz_g0]
                 + [(c, inv_e * v_) for c, v_ in T03] + [(c, -inv_e * v_) for c, v_ in T04]
                 + [(c, -inv_e * v_) for c, v_ in T13])
        Ps_13 = [(ps_13_k[k], Fm[k, i]) for k in nz_fm]
        Ps_23 = [(ps_23_k[k], Fm[k, i]) for k in nz_fm]
        Ps_33 = trt1_t
        Ps_04 = ([(c, inv_e * v_) for c, v_ in T04] + [(c, inv_e * v_) for c, v_ in T13]
                 + [(c, -inv_e * v_) for c, v_ in T14] + [(c, -inv_e * v_) for c, v_ in T23]
                 + [(ps_13_k[k], -Fm[k, i]) for k in nz_fm])
        Ps_14 = ([(c, inv_e * v_) for c, v_ in T14] + [(c, inv_e * v_) for c, v_ in T23]
                 + [(c, -inv_e * v_) for c, v_ in T24] + [(ps_23_k[k], -Fm[k, i]) for k in nz_fm])
        Ps_24 = [(c, inv_e * v_) for c, v_ in T24]; Ps_34 = []; Ps_44 = trt2_t
        cb.add_psd(5, [(-flr, Ps_00), (0.0, Ps_01), (-flr, Ps_11), (0.0, Ps_02), (0.0, Ps_12), (-flr, Ps_22),
                       (0.0, Ps_03), (0.0, Ps_13), (0.0, Ps_23), (-flr, Ps_33),
                       (0.0, Ps_04), (0.0, Ps_14), (0.0, Ps_24), (0.0, Ps_34), (-flr, Ps_44)])

        t_M00 = [(m00, 1.0)] + [(c3[k], -Fm[k, i]) for k in nz_f] + [(c6[k], -inv_e * Fm[k, i]) for k in nz_f0]
        t_M01 = [(m01, 1.0)] + [(psi_a[k], -0.5 * Fm[k, i]) for k in nz_f]; t_M11 = [(m11, 1.0)]
        t_M02 = ([(c3[k], -0.5 * Ym[k, i]) for k in nz_y] + [(c4[k], -0.5 * Ym[k, i]) for k in nz_y]
                 + [(c6[k], -0.5 * inv_e * Ym[k, i]) for k in nz_y0] + [(c7[k], -0.5 * inv_e * Ym[k, i]) for k in nz_y0])
        t_M22 = ([(mu_rho, 1.0), (mu_a, 1.0)] + [(psi_a[k], Fm[k, i]) for k in nz_f]
                 + [(c4[k], -Fm[k, i]) for k in nz_f] + [(dal_k[k], -Fm[k, i]) for k in nz_fm]
                 + [(c, -v_) for c, v_ in trt1_t] + [(c, -v_) for c, v_ in trt2_t])
        t_b0 = ([(c1[k], -0.5 * si * Fm[k, i]) for k in nz_f] + [(sl12[0], -0.5e-2 * (vi * si))]
                + [(c3[k], 0.5 * si * Fm[k, i]) for k in nz_f] + [(c3[k], 0.5 * si * Gm[k, i]) for k in nz_g]
                + [(c6[k], 0.5 * c_1p2e * inv_e2 * si * Fm[k, i]) for k in nz_f0]
                + [(c6[k], 0.5 * inv_e * si * Gm[k, i]) for k in nz_g0] + [(m00, -si), (m01, -2.0 * si)]
                + [(xk0_2[k], -0.5 * si * Fm[k, i]) for k in nz_f] + [(c, -0.5 * si * v_) for c, v_ in T00])
        t_b1 = ([(c2[k], -0.25 * si * Fm[k, i]) for k in nz_f] + [(sl12[1], -0.25e-2 * (vi * si))]
                + [(m01, -si), (m11, -2.0 * si)] + [(xk0_1[k], -0.5 * si * Fm[k, i]) for k in nz_f])
        t_b2 = ([(c1[k], -0.5 * si * Ym[k, i]) for k in nz_y] + [(sl12[0], -0.25e-2 * (vi * si))]
                + [(c2[k], -0.25 * si * Ym[k, i]) for k in nz_y] + [(sl12[1], -0.125e-2 * (vi * si))]
                + [(sig, 0.5 * (vi * si))] + [(c3[k], 0.5 * si * Ym[k, i]) for k in nz_y]
                + [(c4[k], 0.5 * si * Gm[k, i]) for k in nz_g] + [(c6[k], 0.5 * c_1p2e * inv_e2 * si * Ym[k, i]) for k in nz_y0]
                + [(c7[k], 0.5 * c_1pe * inv_e2 * si * Ym[k, i]) for k in nz_y0]
                + [(c7[k], 0.5 * inv_e * si * Gm[k, i]) for k in nz_g0]
                + [(c, -inv_e * si * v_) for c, v_ in T03] + [(xk0_a[k], -0.5 * si * Fm[k, i]) for k in nz_f])
        t_q1 = ([(lam[0], si2), (lam[1], si2_v), (lam[2], 1e-2 * si2_v2),
                 (l3[0], 1e-4 * si2_v3), (l3[1], 1e-4 * si2_v3), (l3[2], 1e-4 * si2_v3),
                 (sl12[0], 0.5e-2 * si2_v2), (sl12[1], 0.5e-2 * si2_v2),
                 (m00, si2), (m01, 4.0 * si2), (m11, 4.0 * si2)]
                + [(c, -si2 * v_) for c, v_ in qs_t] + [(c1[k], si2 * Gm[k, i]) for k in nz_g]
                + [(c2[k], si2 * Gm[k, i]) for k in nz_g] + [(c3[k], -si2 * Gm[k, i]) for k in nz_g])
        cb.add_psd(4, [(-m3_flr, t_M00), (0.0, t_M01), (-m3_flr, t_M11), (0.0, t_M02), (0.0, []),
                       (-m3_flr, t_M22), (0.0, t_b0), (0.0, t_b1), (0.0, t_b2), (-(2e-6 + ri) * si2, t_q1)])

    for s in sorted({float(s_lo), float(s_hi)}):
        eta = cb.var(); nu = cb.var(2); om = cb.var(5); ze = cb.var(3); ch = cb.var(3); ps = cb.var(3); kap = cb.var()
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
            cb.add_eq(d_base[idx] + [(l3[1], sq * 198.0e-4 * H0f[idx]),
                                     (l3[2], sq * (11781.0 / 32.0) * 1e-4 * H0f[idx]),
                                     (ps[0], S0f[idx]), (ps[1], H0f[idx]), (kap, H0f[idx])] + st_extra[idx], 0.0)
        M3 = 6.0 + 9.0 * s + C6f * (s**1.5)
        cb.add_nonneg_batch([(0.0, [(t_obj, 1.0), (lam[0], -1.0), (lam[1], -1.0), (lam[2], -(2.0 + s) * 1e-2),
                                    (l3[0], -M3 * 1e-4), (l3[1], -(6.0 + 9.0 * s) * 1e-4),
                                    (l3[2], -(6.0 + 9.0 * s) * 1e-4), (eta, -s)])])

    sol = cb.solve(t_obj)
    x = np.array(sol.x, dtype=float)
    t_solve = time.time() - t0

    kden = 1 << kbits
    u = [kv * kv for kv in ks]
    to_int = lambda arr: [int(round(float(val) * kden)) for val in arr]

    iphi1, iphi2, iphi3, iphi4 = to_int(x[c1]), to_int(x[c2]), to_int(x[c3]), to_int(x[c4])
    ipsi_base = [max(0, val) for val in to_int(x[psi_a])]
    ixi2 = [max(0, val) for val in to_int(x[xk0_2])]
    ixi1 = [max(0, val) for val in to_int(x[xk0_1])]
    ixia = to_int(x[xk0_a])
    for k in range(K + 1):
        while ixia[k] * ixia[k] > 4 * ixi1[k] * ixi2[k]:
            ixi1[k] += 1; ixi2[k] += 1

    iphi5 = to_int(x[c5])
    G5_K0 = sum(Fr(1, 2) * Fr(iphi5[k] + (iphi5[k + 1] if k + 1 < K0 else 0), kden) * (u[k + 1] - u[k]) for k in range(K0))
    h5_0_fr = -G5_K0

    def round_zero_integral(raw_arr):
        out = [0] * K0
        w_tr = [u[1] - u[0]] + [u[k + 1] - u[k - 1] for k in range(1, K0)]
        L_den = 1
        for wv in w_tr:
            L_den = (L_den * wv.denominator) // math.gcd(L_den, wv.denominator)
        iw = [int(wv * L_den) for wv in w_tr]
        g_all = 0
        for iv in iw:
            g_all = math.gcd(g_all, iv)
        iw = [iv // g_all for iv in iw]
        suf_g = [0] * (K0 + 1)
        for k in range(K0 - 1, -1, -1):
            suf_g[k] = math.gcd(iw[k], suf_g[k + 1])
        S_part = 0
        cum_err = 0.0
        for k in range(K0 - 1):
            wk = float(w_tr[k])
            desired = float(raw_arr[k]) * kden - cum_err / wk
            g_k = suf_g[k]
            m_mod = suf_g[k + 1] // g_k
            if m_mod == 1:
                q_val = int(round(desired))
            else:
                a_cop = iw[k] // g_k
                req = ((-S_part // g_k) * pow(a_cop, -1, m_mod)) % m_mod
                base_q = int(round(desired))
                diff = (req - (base_q % m_mod)) % m_mod
                if diff > m_mod // 2:
                    diff -= m_mod
                q_val = base_q + diff
            out[k] = q_val
            S_part += iw[k] * q_val
            cum_err += (q_val - float(raw_arr[k]) * kden) * wk
        require(S_part % iw[K0 - 1] == 0, 'round_zero_integral divisibility invariant failed')
        out[K0 - 1] = -S_part // iw[K0 - 1]
        require(sum(out[k] * w_tr[k] for k in range(K0)) == 0, 'round_zero_integral exact zero check failed')
        return out

    iphi6 = round_zero_integral(x[c6])
    iphi7 = round_zero_integral(x[c7])

    idw_base = to_int(x[dw_k])
    idal_base = to_int(x[dal_k]); iqs_base = to_int(x[qs_k])
    itrt1_base = [max(1, val) for val in to_int(x[trt1_k])]
    itrt2_base = [max(1, val) for val in to_int(x[trt2_k])]
    ia0_11_base = to_int(x[a0_11_k]); ips_11_base = to_int(x[ps_11_k])
    ips_13 = to_int(x[ps_13_k]); ips_23 = to_int(x[ps_23_k])
    itv_base = [to_int(x[Tv_k[idx]]) for idx in range(15)]

    def round_psd2(r0, r1, r2):
        i0 = [max(0, val) for val in to_int(r0)]
        i2 = [max(0, val) for val in to_int(r2)]
        i1 = to_int(r1)
        for k in range(M0):
            lim = isqrt(i0[k] * i2[k])
            if abs(i1[k]) > lim:
                i1[k] = lim if i1[k] >= 0 else -lim
        return i0, i1, i2

    ia1_0_b, ia1_1_b, ia1_2_b = round_psd2(x[a1_k[0]], x[a1_k[1]], x[a1_k[2]])
    ib1_0_b, ib1_1_b, ib1_2_b = round_psd2(x[b1_k[0]], x[b1_k[1]], x[b1_k[2]])

    slope_fr = [rat(x[sl12[0]] * 1e-2, 48), rat(x[sl12[1]] * 1e-2, 48)]
    l3_fr = [Fr(int(math.ceil(float(val * 1e-4) * (1 << 60))) + 1, 1 << 60) if val * 1e-4 > 1e-13 else Fr(0) for val in x[l3]]
    if sum(l3_fr) == 0:
        l3_fr[0] = Fr(1, 1 << 50)
    sig_fr = rat(x[sig], 46)

    sub_g = 48
    t_cheb = 0.5 * (1.0 - np.cos(np.pi * (np.arange(sub_g) + 0.5) / sub_g))
    r_segs, k_segs = [], []
    for k in range(K0):
        a_, b_ = float(ks[k]), float(ks[k + 1])
        pts_k = np.concatenate([[max(a_, 1e-7)], a_ + (b_ - a_) * t_cheb, [b_]])
        r_segs.append(pts_k)
        k_segs.append(np.full(len(pts_k), k, dtype=int))
    rg = np.concatenate(r_segs); vg = rg**2; kg = np.concatenate(k_segs); Ng = len(vg)
    Fg, Gg, Yg = hat_test_matrices(uk, vg)
    gvg = Gg / vg[None, :]

    r_tail = np.concatenate([
        np.concatenate([float(ks[k]) + (float(ks[k + 1]) - float(ks[k])) * (np.arange(48) + 0.5) / 48 for k in range(K0, K)]),
        np.array([float(ks[k]) for k in range(K0, K + 1)]),
        np.geomspace(float(ks[-1]) * 1.0005, 1200.0, 360),
    ])
    v_tail = r_tail**2
    Ft, Gt, Yt = hat_test_matrices(uk, v_tail)

    margin = 8.0e-7
    for attempt in range(10):
        d_tv0 = max(1, int(round(margin * 0.04 * kden)))
        d_al0 = max(2, int(round(margin * 1.5 * kden)))
        d_ps0 = max(4, int(round(margin * 2.0 * kden)))
        d_tr0 = max(1, int(round(margin * 0.5 * kden)))

        itv = [list(arr) for arr in itv_base]
        for diag_idx in (0, 2, 5, 9, 14):
            itv[diag_idx] = [val + d_tv0 for val in itv[diag_idx]]
        idal = [val + 3 * d_al0 for val in idal_base]
        ia0_11 = [val + 2 * d_al0 for val in ia0_11_base]
        ia1_0 = [val + 2 * d_al0 for val in ia1_0_b]
        ia1_1 = [val + d_al0 for val in ia1_1_b]
        ia1_2 = [val + 2 * d_al0 for val in ia1_2_b]
        iqs = [val + 3 * d_ps0 for val in iqs_base]
        ips_11 = [val + 2 * d_ps0 for val in ips_11_base]
        ib1_0 = [val + 2 * d_ps0 for val in ib1_0_b]
        ib1_1 = [val + d_ps0 for val in ib1_1_b]
        ib1_2 = [val + 2 * d_ps0 for val in ib1_2_b]
        itrt1 = [val + d_tr0 for val in itrt1_base]
        itrt2 = [val + d_tr0 for val in itrt2_base]

        m00_fr = max(Fr(0), rat(x[m00] + margin * 0.2, 46))
        m01_fr = rat(x[m01], 46)
        m11_fr = max(Fr(1, 1 << 28), rat(x[m11] + margin * 0.2, 46))
        while m00_fr * m11_fr < m01_fr * m01_fr:
            m00_fr += Fr(1, 1 << 40); m11_fr += Fr(1, 1 << 40)
        mu_a_fr = max(Fr(0), rat(x[mu_a], 46))
        mu_w_fr = max(Fr(1, 1 << 30), rat(x[mu_w] + margin * 0.5, 46))
        idw = [max(1, min(int(mu_w_fr * kden) - 2, val)) for val in idw_base]

        h5_f = float(h5_0_fr) + (Gg[:K0].T @ (np.array(iphi5, float) / kden))
        dw_f = Fg[:M0].T @ (np.array(idw, float) / kden)
        dw_def = margin - (float(mu_w_fr) - h5_f - dw_f)
        if dw_def.max() > 0:
            mu_w_fr = rat(float(mu_w_fr) + float(dw_def.max()) + margin, 46)

        p3g = Fg.T @ (np.array(iphi3, float) / kden); g3g = Gg.T @ (np.array(iphi3, float) / kden); y3g = Yg.T @ (np.array(iphi3, float) / kden); gv3 = gvg.T @ (np.array(iphi3, float) / kden)
        p4g = Fg.T @ (np.array(iphi4, float) / kden); g4g = Gg.T @ (np.array(iphi4, float) / kden); y4g = Yg.T @ (np.array(iphi4, float) / kden); gv4 = gvg.T @ (np.array(iphi4, float) / kden)
        p5g = Fg[:K0].T @ (np.array(iphi5, float) / kden)
        p6g = Fg[:K0].T @ (np.array(iphi6, float) / kden); g6g = Gg[:K0].T @ (np.array(iphi6, float) / kden); y6g = Yg[:K0].T @ (np.array(iphi6, float) / kden); gv6 = gvg[:K0].T @ (np.array(iphi6, float) / kden)
        p7g = Fg[:K0].T @ (np.array(iphi7, float) / kden); g7g = Gg[:K0].T @ (np.array(iphi7, float) / kden); y7g = Yg[:K0].T @ (np.array(iphi7, float) / kden); gv7 = gvg[:K0].T @ (np.array(iphi7, float) / kden)

        L_vecs = np.column_stack([
            rg * (gv3 + gv4 + inv_e * (p5g + gv6 + gv7)),
            rg * (-inv_e * p5g - h5_f - c_1pe * inv_e * gv7),
            rg * (-c_1pe2 * inv_e * gv6),
            rg * p5g,
            rg * (c_1pe * gv7),
        ])

        def eval_T_grid():
            Tg = np.zeros((Ng, 5, 5))
            for b_ in range(5):
                for a_ in range(b_ + 1):
                    idx_ = b_ * (b_ + 1) // 2 + a_
                    vals_ = Fg[:M0].T @ (np.array(itv[idx_], float) / kden)
                    Tg[:, a_, b_] = Tg[:, b_, a_] = vals_
            return Tg

        Tg = eval_T_grid()
        S_T = Tg - (L_vecs[:, :, None] * L_vecs[:, None, :]) / (4.0 * dw_f[:, None, None])
        eig_st = np.linalg.eigvalsh(S_T)[:, 0]
        bump_tv = [0] * M0
        for k in range(K0):
            me = float(eig_st[kg == k].min())
            if me < 2.0 * margin:
                dt = max(1, int(np.ceil((2.6 * margin - me) * kden)))
                bump_tv[k] = max(bump_tv[k], dt); bump_tv[k + 1] = max(bump_tv[k + 1], dt)
        for j in range(M0):
            if bump_tv[j] > 0:
                for diag_idx in (0, 2, 5, 9, 14):
                    itv[diag_idx][j] += bump_tv[j]
        Tg = eval_T_grid()

        dal_g = Fg[:M0].T @ (np.array(idal, float) / kden)
        a011_g = Fg[:M0].T @ (np.array(ia0_11, float) / kden)
        a10_g = Fg[:M0].T @ (np.array(ia1_0, float) / kden)
        a11_g = Fg[:M0].T @ (np.array(ia1_1, float) / kden)
        a12_g = Fg[:M0].T @ (np.array(ia1_2, float) / kden)
        A0 = np.zeros((Ng, 3, 3))
        A0[:, 0, 0] = dal_g - inv_e * p7g
        A0[:, 0, 1] = A0[:, 1, 0] = 0.5 * (c_1pe * inv_e * p7g - a10_g - inv_e * Tg[:, 3, 3])
        A0[:, 1, 1] = a011_g
        A0[:, 0, 2] = A0[:, 2, 0] = 0.5 * (inv_e * (Tg[:, 3, 3] - 2.0 * Tg[:, 3, 4]) + a10_g - a011_g - 2.0 * a11_g)
        A0[:, 1, 2] = A0[:, 2, 1] = 0.5 * (inv_e * (2.0 * Tg[:, 3, 4] - Tg[:, 4, 4]) + 2.0 * a11_g - a12_g)
        A0[:, 2, 2] = inv_e * Tg[:, 4, 4] + a12_g
        eig_a0 = np.linalg.eigvalsh(A0)[:, 0]
        bump_al = [0] * M0
        for k in range(K0):
            me = float(eig_a0[kg == k].min())
            if me < 2.2 * margin:
                da = max(2, int(np.ceil((2.8 * margin - me) / 0.98 * kden)))
                bump_al[k] = max(bump_al[k], da); bump_al[k + 1] = max(bump_al[k + 1], da)
        for j in range(M0):
            da = bump_al[j]
            if da > 0:
                idal[j] += 3 * da; ia0_11[j] += 2 * da
                ia1_0[j] += 2 * da; ia1_1[j] += da; ia1_2[j] += 2 * da
            lim = isqrt(ia1_0[j] * ia1_2[j])
            if abs(ia1_1[j]) > lim:
                ia1_1[j] = lim if ia1_1[j] >= 0 else -lim

        qsg = Fg[:M0].T @ (np.array(iqs, float) / kden)
        p11g = Fg[:M0].T @ (np.array(ips_11, float) / kden)
        b10g = Fg[:M0].T @ (np.array(ib1_0, float) / kden)
        b11g = Fg[:M0].T @ (np.array(ib1_1, float) / kden)
        b12g = Fg[:M0].T @ (np.array(ib1_2, float) / kden)
        P3 = np.zeros((Ng, 3, 3))
        P3[:, 0, 0] = qsg - c_1pe2 * inv_e3 * p6g - c_1p2e * inv_e2 * g6g - 2.0 * inv_e * Tg[:, 0, 1]
        P3[:, 0, 1] = P3[:, 1, 0] = 0.5 * (c_1pe2 * inv_e3 * p6g + c_1pe2 * inv_e2 * g6g - b10g + inv_e * (2.0 * Tg[:, 0, 1] - Tg[:, 1, 1] - 2.0 * Tg[:, 0, 2]))
        P3[:, 1, 1] = p11g
        P3[:, 0, 2] = P3[:, 2, 0] = 0.5 * (inv_e * (Tg[:, 1, 1] + 2.0 * Tg[:, 0, 2] - 2.0 * Tg[:, 1, 2]) + b10g - p11g - 2.0 * b11g)
        P3[:, 1, 2] = P3[:, 2, 1] = 0.5 * (inv_e * (2.0 * Tg[:, 1, 2] - Tg[:, 2, 2]) + 2.0 * b11g - b12g)
        P3[:, 2, 2] = inv_e * Tg[:, 2, 2] + b12g

        p13g = Fg[:M0].T @ (np.array(ips_13, float) / kden)
        p23g = Fg[:M0].T @ (np.array(ips_23, float) / kden)
        U3 = np.column_stack([
            -0.5 * (c_1pe2 * inv_e2 * y6g + c_1pe * inv_e2 * y7g + c_1pe * inv_e * g7g) + inv_e * (Tg[:, 0, 3] - Tg[:, 0, 4] - Tg[:, 1, 3]),
            p13g, p23g,
        ])
        U4 = np.column_stack([
            inv_e * (Tg[:, 0, 4] + Tg[:, 1, 3] - Tg[:, 1, 4] - Tg[:, 2, 3]) - p13g,
            inv_e * (Tg[:, 1, 4] + Tg[:, 2, 3] - Tg[:, 2, 4]) - p23g,
            inv_e * Tg[:, 2, 4],
        ])
        trt1_g = Fg[:M0].T @ (np.array(itrt1, float) / kden)
        trt2_g = Fg[:M0].T @ (np.array(itrt2, float) / kden)
        S_ps = (P3 - (U3[:, :, None] * U3[:, None, :]) / trt1_g[:, None, None]
                - (U4[:, :, None] * U4[:, None, :]) / trt2_g[:, None, None])
        eig_sps = np.linalg.eigvalsh(S_ps)[:, 0]
        bump_ps = [0] * M0
        for k in range(K0):
            me = float(eig_sps[kg == k].min())
            if me < 2.5 * margin:
                dp = max(4, int(np.ceil((3.4 * margin - me) / 0.98 * kden)))
                bump_ps[k] = max(bump_ps[k], dp); bump_ps[k + 1] = max(bump_ps[k + 1], dp)
        for j in range(M0):
            dp = bump_ps[j]
            if dp > 0:
                iqs[j] += 3 * dp; ips_11[j] += 2 * dp
                ib1_0[j] += 2 * dp; ib1_1[j] += dp; ib1_2[j] += 2 * dp
            lim = isqrt(ib1_0[j] * ib1_2[j])
            if abs(ib1_1[j]) > lim:
                ib1_1[j] = lim if ib1_1[j] >= 0 else -lim

        ipsi = list(ipsi_base)
        max_m33_drop = max((idal[j] - idal_base[j]) + (itrt1[j] - itrt1_base[j]) + (itrt2[j] - itrt2_base[j]) for j in range(M0))
        mu_rho_fr = max(Fr(1, 1 << 30), rat(x[mu_rho] + max(0, max_m33_drop) / kden + 2.0 * margin, 46))

        inv_e_fr = Fr(1) / eps_fr
        for k in range(K + 1):
            if k >= K0:
                while Fr(ipsi[k], kden) + mu_a_fr - Fr(iphi4[k], kden) < 0:
                    ipsi[k] += 1
            p6_term = inv_e_fr * Fr(iphi6[k], kden) if k < K0 else Fr(0)
            while (m00_fr - Fr(iphi3[k], kden) - p6_term <= Fr(1, 1 << 23)
                   or m11_fr * (m00_fr - Fr(iphi3[k], kden) - p6_term) - (m01_fr - Fr(ipsi[k], 2 * kden)) ** 2 <= Fr(1, 1 << 32)):
                m00_fr += Fr(1, 1 << 21)
        for k in range(M0):
            while Fr(ipsi[k], kden) + mu_a_fr - Fr(iphi4[k], kden) - Fr(idal[k], kden) < 0:
                mu_a_fr += Fr(1, 1 << 20)

        sl0, sl1 = float(slope_fr[0]), float(slope_fr[1])
        lam1_fr = rat(x[lam[1]] + margin * 0.02, 40)
        lam2_fr = Fr(int(math.ceil(float(x[lam[2]] * 1e-2 + margin * 1e-6) * (1 << 54))) + 1, 1 << 54)
        l1f, l2f, l3f = float(lam1_fr), float(lam2_fr), float(sum(l3_fr))
        m00f, m01f, m11f = float(m00_fr), float(m01_fr), float(m11_fr)
        muaf, murf, muwf, sigf = float(mu_a_fr), float(mu_rho_fr), float(mu_w_fr), float(sig_fr)

        p1g = Fg.T @ (np.array(iphi1, float) / kden) + sl0 * vg
        g1g = Gg.T @ (np.array(iphi1, float) / kden) + 0.5 * sl0 * (vg**2)
        y1g = Yg.T @ (np.array(iphi1, float) / kden) + 0.5 * sl0 * vg
        p2g = Fg.T @ (np.array(iphi2, float) / kden) + sl1 * vg
        g2g = Gg.T @ (np.array(iphi2, float) / kden) + 0.5 * sl1 * (vg**2)
        y2g = Yg.T @ (np.array(iphi2, float) / kden) + 0.5 * sl1 * vg
        psag = Fg.T @ (np.array(ipsi, float) / kden)
        xi2g = Fg.T @ (np.array(ixi2, float) / kden)
        xi1g = Fg.T @ (np.array(ixi1, float) / kden)
        xiag = Fg.T @ (np.array(ixia, float) / kden)
        qsg = Fg[:M0].T @ (np.array(iqs, float) / kden)
        dal_g = Fg[:M0].T @ (np.array(idal, float) / kden)
        trt1_g = Fg[:M0].T @ (np.array(itrt1, float) / kden)
        trt2_g = Fg[:M0].T @ (np.array(itrt2, float) / kden)

        M3_p0 = np.zeros((Ng, 3, 3))
        M3_p0[:, 0, 0] = m00f - p3g - inv_e * p6g
        M3_p0[:, 0, 1] = M3_p0[:, 1, 0] = m01f - 0.5 * psag
        M3_p0[:, 1, 1] = m11f
        M3_p0[:, 0, 2] = M3_p0[:, 2, 0] = -0.5 * (y3g + y4g + inv_e * (y6g + y7g))
        M3_p0[:, 2, 2] = murf + muaf + psag - p4g - dal_g - trt1_g - trt2_g
        if float(np.linalg.eigvalsh(M3_p0)[:, 0].min()) < 2.0 * margin:
            need_m = 3.0 * margin - float(np.linalg.eigvalsh(M3_p0)[:, 0].min())
            mu_rho_fr = rat(float(mu_rho_fr) + need_m * 2.0, 46)
            M3_p0[:, 2, 2] += float(mu_rho_fr) - murf
            murf = float(mu_rho_fr)

        b_p0 = np.column_stack([
            0.5 * (p3g + g3g + c_1p2e * inv_e2 * p6g + inv_e * g6g - p1g - 2.0 * m00f - 4.0 * m01f - xi2g - Tg[:, 0, 0]),
            0.5 * (-0.5 * p2g - 2.0 * m01f - 4.0 * m11f - xi1g),
            0.5 * (sigf * vg + y3g + g4g + c_1p2e * inv_e2 * y6g + c_1pe * inv_e2 * y7g + inv_e * g7g - y1g - 0.5 * y2g - xiag - 2.0 * inv_e * Tg[:, 0, 3]),
        ])
        quad_p0 = np.sum(b_p0 * np.linalg.solve(M3_p0, b_p0[:, :, None])[:, :, 0], axis=1)
        q1_no_lam0 = (m00f + 4.0 * m01f + 4.0 * m11f + l1f * vg + l2f * (vg**2) + l3f * (vg**3)
                      + g1g + g2g - g3g - qsg - rg)
        req_lam0_bulk = float((quad_p0 - q1_no_lam0).max()) + 3.0 * margin

        sol_tail = dict(
            phi1=np.array(iphi1, float) / kden, phi2=np.array(iphi2, float) / kden,
            phi3=np.array(iphi3, float) / kden, phi4=np.array(iphi4, float) / kden,
            psi_a=np.array(ipsi, float) / kden,
            xi2=np.array(ixi2, float) / kden, xi1=np.array(ixi1, float) / kden, xia=np.array(ixia, float) / kden,
            slope=[sl0, sl1], lam=[0.0, l1f, l2f], l3=[0.0, 0.0, l3f],
            m_ker=[m00f, m01f, m11f], mu_a=muaf, mu_rho=murf, mu_w=muwf, sigma=sigf,
        )
        sch_tail, _, _, _ = eval_schur_dense(sol_tail, ek, r_tail)
        req_lam0_tail = float((-sch_tail).max()) + 3.0 * margin
        lam0_fr = rat(max(float(x[lam[0]]), req_lam0_bulk, req_lam0_tail) + margin, 40)

        par_json, _ = par_part_3rd((m00_fr, m01_fr, m11_fr), mu_a_fr, mu_rho_fr, mu_w_fr, sig_fr, l3_fr, (s_lo, s_hi))
        row = dict(
            s_lo=str(s_lo), s_hi=str(s_hi),
            knots=[str(kv) for kv in ks], knot_den=kden,
            K0=K0, eps=str(eps_fr), h5_0=str(h5_0_fr),
            phi1=iphi1, phi2=iphi2, phi3=iphi3, phi4=iphi4,
            phi5=iphi5, phi6=iphi6, phi7=iphi7, dw=idw,
            dal=idal, qs=iqs, trt1=itrt1, trt2=itrt2,
            a0_11=ia0_11, ps_11=ips_11, ps_13=ips_13, ps_23=ips_23,
            a1_0=ia1_0, a1_1=ia1_1, a1_2=ia1_2,
            b1_0=ib1_0, b1_1=ib1_1, b1_2=ib1_2,
            tv=itv,
            psi_a=ipsi, xi2=ixi2, xi1=ixi1, xia=ixia,
            lam=[str(lam0_fr), str(lam1_fr), str(lam2_fr)], l3=[str(lv) for lv in l3_fr],
            m_ker=[str(m00_fr), str(m01_fr), str(m11_fr)],
            mu_a=str(mu_a_fr), mu_rho=str(mu_rho_fr), mu_w=str(mu_w_fr), sigma=str(sig_fr),
            slope=[str(sv) for sv in slope_fr],
            par=par_json,
        )
        res_s = VC3.verify_row(row, quiet=True)
        if res_s['ok']:
            res_b = VB3.verify_row_bernstein(row)
            require(res_b['bound'] == res_s['bound'], 'Sturm vs Bernstein exact bound mismatch on L3 row!')
            sz = len(json.dumps(row, separators=(',', ':')))
            print('[L3d eps=%5s] [%6s, %6s]  exact bound <= %s  (Clarabel %.7f in %.1fs, att=%d, Sturm & Bernstein PASS, %d B, %.1fs)' % (
                eps_fr, s_lo, s_hi, VC3.dec_ceil10(res_s['bound']), sol.obj_val, t_solve, attempt, sz, time.time() - t0), flush=True)
            return row, res_s['bound']
        margin *= 2.0
    raise RuntimeError(f'Damped L3 verification failed after 10 margin steps for [{s_lo}, {s_hi}]')


def main():
    out = sys.argv[1] if len(sys.argv) > 1 else os.path.join(HERE, 'cert_912.json')
    t_start = time.time()

    ks_l3 = knots_l3()
    ks_hi25 = knots_l3_hi25()
    ks_fl = knots_flank()

    plan = [
        ('L3', Fr(11, 2), Fr(6),     Fr(1, 6),  ks_l3,   8, 31),
        ('L3', Fr(6),     Fr(33, 5), Fr(1, 6),  ks_l3,   8, 31),
        ('L3', Fr(33, 5), Fr(15, 2), Fr(1, 6),  ks_l3,   8,  31),
        ('L3', Fr(15, 2), Fr(9),     Fr(1, 6),  ks_hi25, 12, 31),
        ('L2', Fr(9),     Fr(11),    None,      ks_fl,   5, 25),
        ('L2', Fr(11),    Fr(18),    None,      ks_fl,   5, 25),
        ('L2', Fr(18),    Fr(25),    None,      ks_fl,   5, 25),
        ('L3', Fr(25),    Fr(26),    Fr(1, 25), ks_hi25, 12, 32),
        ('L2', Fr(26),    Fr(28),    None,      ks_fl,   5, 25),
        ('L2', Fr(28),    Fr(42),    None,      ks_fl,   5, 25),
    ]

    rows = []
    worst_stein = Fr(0)
    worst_hi = Fr(0)
    sharp_hi_s = Fr(25)

    ou_block = dict(
        alpha='28241/1250000',
        gamma_S='-28811/1000000',
        gamma_A='-1443/50000',
        slope_claim='3299/625000',
        chi_hi='11/2',
        bound_at_chi_hi='91196/100000',
    )
    downstream_block = dict(
        deg7_1403_cap='3906250/4558347',
        deg5_1402_cap='1953125/2277549',
        d5_418a_cutoff='51873/200000',
        d5_418e_parseval='8957087/25000000',
        d5_418e_sixth_moment='36598729/100000000',
        d5_418e_lean_mass='4619003/12500000',
        d5_418f_spectral_24='37589/100000',
    )

    for kind, s_lo, s_hi, eps_fr, ks, sub, kbits in plan:
        if kind == 'L3':
            row, bnd = make_l3_row(s_lo, s_hi, ks, eps_fr=eps_fr, sub=sub, flr=1.5e-6, m3_flr=1e-5, kbits=kbits)
        else:
            row, bnd = make_l2_row(s_lo, s_hi, ks, kbits=kbits)
        rows.append(row)
        if bnd > worst_stein:
            worst_stein = bnd
        if s_lo >= sharp_hi_s and bnd > worst_hi:
            worst_hi = bnd

    cert = dict(
        statement=('For every n >= 1 and every q in H_{2,1}(C^n), E|q| <= (sqrt(pi)/2) * ||q||_2 * (1 + (3299/625000) * chi(q)) '
                   'and globally E|q| <= (114/125) * ||q||_2 = 0.912 * ||q||_2; moreover, for chi in [25, 42], '
                   'E|q| <= (443/500) * ||q||_2 = 0.886 * ||q||_2 < (sqrt(pi)/2) * ||q||_2.'),
        claim='114/125',
        sharp_hi_s='25',
        sharp_hi_claim='443/500',
        ou_resolvent=ou_block,
        downstream=downstream_block,
        rows=rows,
    )
    raw = json.dumps(cert, separators=(',', ':'))
    with open(out, 'w', encoding='utf-8') as fh:
        fh.write(raw)

    total_bytes = os.path.getsize(out)
    print(f'\nWrote {out}: {total_bytes} bytes (< 300,000 B check: {total_bytes < 300000}), worst Stein = {VC3.dec_ceil10(worst_stein)}, worst [25,42] = {VC3.dec_ceil10(worst_hi)}')
    require(total_bytes < 300000, f'certificate size {total_bytes} >= 300,000 bytes!')
    require(worst_stein < Fr(114, 125), f'worst Stein bound {worst_stein} >= 114/125!')
    require(worst_hi < Fr(443, 500), f'high-chi worst bound {worst_hi} >= 443/500!')

    print('\nRunning full end-to-end verification via BOTH verify.py and verify_bernstein.py...', flush=True)
    VC3.main([out])
    VB3.main([out])
    print(f'ALL DONE in {time.time() - t_start:.1f}s!')


if __name__ == '__main__':
    main()
