#!/usr/bin/env python3
"""Standalone generator for the symmetrised spiked cubic radius certificate `cert_spiked.json`.

Usage:
  python3 -B make_cert.py [OUT.json]
  python3 -B make_cert.py --test-ray 0

Uses numpy, scipy and clarabel for numerical conic optimization and LP polishing; every generated
row and ray is rounded to exact rationals and verified on the spot by the zero-float stdlib verifier
`verify.py` (exact integer Sturm chains + exact rational weak duality + exact convex slab cover).

Agent-ID: gemini-4c4c
"""
from concurrent.futures import ProcessPoolExecutor
from fractions import Fraction as Fr
import json
from math import isqrt, sqrt
import os
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import clarabel
import numpy as np
from scipy.optimize import linprog
import scipy.sparse as sp

import verify as VF

SQ2 = np.sqrt(2.0)
C6f = float(VF.C6)
EROWf = np.array([float(x) for x in VF.EROW])
S0f = np.array([float(x) for x in VF.S0])
H0f = np.array([float(x) for x in VF.H0])
KAPPAf = np.array([float(x) for x in VF.KAPPA_HI])

C_BANK_STR = ["1/10", "1/5", "7/20", "1/2", "18/25", "1", "3/2", "5/2", "4"]
C_BANK = [Fr(x) for x in C_BANK_STR]
B_ROWS = [VF.sector_B_upper(c) for c in C_BANK]

THETAS = [
    Fr(1, 16), Fr(1, 12), Fr(1, 8), Fr(1, 6), Fr(1, 5), Fr(1, 4), Fr(3, 10), Fr(1, 3), Fr(2, 5), Fr(1, 2),
    Fr(3, 5), Fr(2, 3), Fr(3, 4), Fr(4, 5), Fr(9, 10), Fr(1), Fr(10, 9), Fr(5, 4), Fr(4, 3), Fr(3, 2),
    Fr(5, 3), Fr(2), Fr(5, 2), Fr(3), Fr(10, 3), Fr(4), Fr(5), Fr(6), Fr(8), Fr(12), Fr(16),
]

# 7 interior Stein Pythagorean rays (a, b, c) with initial self-consistent rational targets R_j,
# starting at (84, 187, 205) (p = 0.16790, driving the unconditional degree-5 mid-t cutoff),
# followed by 4 active right-analytical 4.18g Pythagorean rays (all 11 rays strictly active):
STEIN_RAYS_SPEC = [
    ((84, 187, 205), Fr(9316, 10000), "low"),   # p = 0.16790
    ((28, 45, 53),   Fr(9354, 10000), "low"),   # p = 0.27910
    ((3, 4, 5),      Fr(9374, 10000), "mid"),   # p = 0.36000
    ((20, 21, 29),   Fr(9386, 10000), "mid"),   # p = 0.47562
    ((72, 65, 97),   Fr(9386, 10000), "mid"),   # p = 0.55096
    ((4, 3, 5),      Fr(9372, 10000), "high"),  # p = 0.64000
    ((56, 33, 65),   Fr(9339, 10000), "high"),  # p = 0.74225
]

ANALYTIC_RAYS_ABC = [
    (35, 12, 37),   # p = 0.89481
    (24, 7, 25),    # p = 0.92160
    (40, 9, 41),    # p = 0.95181
    (84, 13, 85),   # p = 0.97661
]

SLABS_BY_BAND = {
    "low":  [Fr(0), Fr(1),    Fr(3), Fr(9, 2), Fr(13, 2), Fr(10), Fr(17), Fr(28), Fr(42)],
    "mid":  [Fr(0), Fr(1),    Fr(5), Fr(9),    Fr(13),    Fr(17), Fr(22), Fr(31), Fr(42)],
    "high": [Fr(0), Fr(3, 2), Fr(5), Fr(10),   Fr(15),    Fr(21), Fr(28), Fr(35), Fr(42)],
}


def build_knot_sets():
    # Compact all-dyadic/integer knot meshes with 1/16 peak resolution on [1/2, 5/2]: K_peak = 72, K_flank = 36
    kp = [Fr(0)]
    for end, step in [(Fr(1, 2), Fr(1, 8)), (Fr(5, 2), Fr(1, 16)), (Fr(9, 2), Fr(1, 8)),
                      (Fr(15, 2), Fr(1, 4)), (Fr(23, 2), Fr(1, 2)), (Fr(29, 2), Fr(1))]:
        while kp[-1] < end:
            kp.append(kp[-1] + step)
    kp += [Fr(x) for x in (18, 23, 30, 40, 56, 84, 132, 210)]

    kf = [Fr(0)]
    for end, step in [(Fr(2), Fr(1, 8)), (Fr(4), Fr(1, 4)), (Fr(8), Fr(1, 2)), (Fr(12), Fr(1))]:
        while kf[-1] < end:
            kf.append(kf[-1] + step)
    kf += [Fr(x) for x in (16, 22, 30, 42, 62, 95, 150, 220)]
    return {"peak": kp, "flank": kf}


def find_exact_d_cut(R_ray, uv):
    """Largest multiple of 10^-6 in [0, min(0.49, uv - 10^-4)] with VF.envelope(d)[1] <= R_ray."""
    if VF.PI_HI / 4 > R_ray * R_ray:
        return Fr(0)
    hi_int = min(490000, int((uv - Fr(1, 10000)) * 10**6))
    if hi_int <= 0:
        return Fr(0)
    lo, hi = 0, hi_int
    while lo < hi:
        mid = (lo + hi + 1) // 2
        d_try = Fr(mid, 10**6)
        if VF.envelope(d_try)[1] <= R_ray:
            lo = mid
        else:
            hi = mid - 1
    return Fr(lo, 10**6)


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
        settings.max_iter = 350
        return clarabel.DefaultSolver(P, q, A, b, merged, settings).solve()


def eval_schur_5x5_dense(sol, pv, uv, ek, r_test):
    """Exact vectorized 5x5 Schur complement q1 - r - b^T M^{-1} b and leading minors on r_test."""
    uk = ek ** 2
    v_t = r_test ** 2
    Ft, Gt, Yt = hat_test_matrices(uk, v_t)
    gvt = np.zeros_like(Gt)
    nzt = v_t > 0
    gvt[:, nzt] = Gt[:, nzt] / v_t[nzt]
    gvt[:, ~nzt] = Ft[:, ~nzt]

    c1v, c2v, c3v, c4v = sol["phi1"], sol["phi2"], sol["phi3"], sol["phi4"]
    slv = sol["slope"]
    p1t = Ft.T @ c1v + slv[0] * v_t
    G1t = Gt.T @ c1v + 0.5 * slv[0] * (v_t ** 2)
    Y1t = Yt.T @ c1v + 0.5 * slv[0] * v_t
    p2t = Ft.T @ c2v + slv[1] * v_t
    G2t = Gt.T @ c2v + 0.5 * slv[1] * (v_t ** 2)
    Y2t = Yt.T @ c2v + 0.5 * slv[1] * v_t
    p3t, G3t, Y3t, g3t = Ft.T @ c3v, Gt.T @ c3v, Yt.T @ c3v, gvt.T @ c3v
    p4t, G4t, Y4t, g4t = Ft.T @ c4v, Gt.T @ c4v, Yt.T @ c4v, gvt.T @ c4v

    psa = Ft.T @ sol["psi_a"]
    psd = Ft.T @ sol["psi_del"]
    x2t = Ft.T @ sol["xi2"]
    xtt = Ft.T @ sol["xit1"]
    xat = Ft.T @ sol["xia"]
    xkt = Ft.T @ sol["xik1"]

    m00, m01, m11 = sol["m_ker"]
    m_del = sol["m_del"]
    q0, q1, q2 = sol["q_sym"]
    sig_vr, _, _ = sol["vr"]
    mu_a, mu_rho, mu_w, mu_w1 = sol["mu_a"], sol["mu_rho"], sol["mu_w"], sol["mu_w1"]
    mu_T, mu_F4 = sol["mu_T"], sol["mu_F4"]
    lam0, lam1, lam2 = sol["lam"]
    lam3 = sum(sol["l3"])
    u2 = uv * uv

    A4 = mu_a + psa - p4t - (p4t ** 2) / (2.0 * mu_F4) - v_t * (g4t ** 2) / (2.0 * mu_T)
    M00 = m00 - p3t
    M01 = q2 - 0.125 * p3t - 0.5 * psa
    M11 = m_del + psd
    M02 = m01 - 0.5 * psa
    M03 = -0.5 * (Y3t + Y4t)
    M33 = mu_rho + A4

    C00 = m11 * M11 - q1 * q1
    C11 = m11 * M00 - M02 ** 2
    C22 = M00 * M11 - M01 ** 2
    C01 = q1 * M02 - m11 * M01
    C02 = q1 * M01 - M02 * M11
    C12 = M01 * M02 - q1 * M00
    D3 = M00 * C00 + M01 * C01 + M02 * C02
    D4top = M33 * D3 - (M03 ** 2) * C00

    tau_sum = v_t * (((g3t + g4t) ** 2) / (4.0 * mu_w) + (g3t ** 2) / (4.0 * mu_w1))
    b0 = (-0.5 * p1t + 0.5 * (uv - pv) * p3t + 0.5 * G3t - uv * m00 - 2.0 * uv * m01
          - 2.0 * pv * psa - 0.5 * tau_sum - 0.5 * x2t)
    b1 = -0.125 * p1t - 0.1875 * p2t + 0.125 * uv * p3t + 0.5 * q0 - 0.5 * xtt
    b2 = -0.25 * p2t - uv * m01 - 2.0 * uv * m11 - 8.0 * pv * psd - 0.5 * (xtt + xkt)
    b3 = -0.5 * Y1t - 0.25 * Y2t + 0.5 * sig_vr * v_t + 0.5 * uv * Y3t + 0.5 * G4t - 0.5 * xat

    q1_val = (lam0 + lam1 * v_t + lam2 * (v_t ** 2) + lam3 * (v_t ** 3)
              + G1t + G2t - pv * p1t - pv * p2t - uv * G3t + pv * uv * p3t
              + u2 * (m00 + 4.0 * m01 + 4.0 * m11) - 4.0 * pv * xtt)

    S_C = (C00 * b0 ** 2 + C11 * b1 ** 2 + C22 * b2 ** 2
           + 2.0 * (C01 * b0 * b1 + C02 * b0 * b2 + C12 * b1 * b2))
    L0 = C00 * b0 + C01 * b1 + C02 * b2
    Q12 = m11 * b1 ** 2 - 2.0 * q1 * b1 * b2 + M11 * b2 ** 2
    quad = M33 * S_C - (M03 ** 2) * Q12 + D3 * (b3 ** 2) - 2.0 * M03 * b3 * L0
    schur = q1_val - r_test - quad / D4top
    return schur, A4, M00, C22, D3, D4top


def rat(x, bits):
    return Fr(int(round(float(x) * (1 << bits))), 1 << bits)


def inv_dyadic(x, bits=22):
    """Round x > 0 so that 1/x is a dyadic rational K / 2^bits (keeps Sturm denominators powers of 2!)."""
    k_int = max(1, int(round((1.0 / max(float(x), 1e-8)) * (1 << bits))))
    return Fr(1 << bits, k_int)


def sqrt_ub(s):
    q = 10 ** 12
    return Fr(isqrt(s.numerator * q * q // s.denominator) + 1, q)


def solve_clarabel_spiked(ray_abc, s_lo, s_hi, knots, A_sec_f, b_sec_f, sub=4, rounds=3, m_floor=None):
    if m_floor is None:
        m_floor = 4.0e-4 if s_lo == 0 else 6.0e-5
    a_r, b_r, c_r = ray_abc
    pv = float(Fr(a_r * a_r, c_r * c_r))
    uv = float(Fr(b_r * b_r, c_r * c_r))
    u2 = uv * uv
    u_32 = float(Fr(b_r, c_r) ** 3)
    M_sec = len(b_sec_f)

    mode = "holder"
    gy_fr = None
    gy_f = 0.0
    s_mid_fr = Fr(1, 2) * (s_lo + s_hi)
    q_mid_fr = VF.root4_lo(2 + s_mid_fr)

    ek = np.array([float(x) for x in knots])
    uk = ek ** 2
    K = len(uk)

    pts = [0.0]
    for a_, b_ in zip(ek[:-1], ek[1:]):
        pts.extend(list(a_ + (b_ - a_) * (np.arange(sub) + 0.5) / sub))
        pts.append(b_)
    pts.extend(list(np.geomspace(ek[-1] * 1.01, max(900.0, 4.0 * ek[-1]), 24)))
    rr = np.unique(np.array(pts))

    rd = np.unique(np.concatenate([
        np.concatenate([a_ + (b_ - a_) * (np.arange(50) + 0.5) / 50 for a_, b_ in zip(ek[:-1], ek[1:])]),
        ek,
        np.geomspace(ek[-1] * 1.0005, max(5000.0, 25.0 * ek[-1]), 500),
    ]))

    sol_dict = None
    obj_val = None
    sec_f_base = [4.0, 0.0, 0.0, 4.0, 4.0]
    sec_ed_base = [1.0, 2.0, 1.0, 0.0, 2.0]
    sec_T2 = [12.0, 10.0, 4.0, 4.0, 22.0]

    for it in range(rounds):
        v = rr ** 2
        Fm, Gm, Ym = hat_test_matrices(uk, v)
        gv_mat = np.zeros_like(Gm)
        nz_v = v > 0
        gv_mat[:, nz_v] = Gm[:, nz_v] / v[nz_v]
        gv_mat[:, ~nz_v] = Fm[:, ~nz_v]
        N = len(v)

        cb = ConicBuilder()
        c1 = cb.var(K); c2 = cb.var(K); c3 = cb.var(K); c4 = cb.var(K)
        sl12 = cb.var(2); lam = cb.var(3); l3 = cb.var(3)
        m00 = cb.var(); m01 = cb.var(); m11 = cb.var(); m_del = cb.var()
        q0_s = cb.var(); q1_s = cb.var(); q2_s = cb.var()
        sig_vr = cb.var(); mu_vr = cb.var(); tau_vr = cb.var()
        mu_a = cb.var(); mu_rho = cb.var(); mu_w = cb.var(); mu_w1 = cb.var()
        mu_T = cb.var(); mu_F4 = cb.var()
        psi_a = cb.var(K); psi_del = cb.var(K)
        xi2 = cb.var(K); xit1 = cb.var(K); xia = cb.var(K); xik1 = cb.var(K)
        tau_w = cb.var(N); tau_w1 = cb.var(N); tau_iv_grid = cb.var(N); tau_f4_knot = cb.var(K)
        t_obj = cb.var()

        # Vanishing of phi3[K-1] and phi4[K-1] on [u_K, oo) so G3, G4 are constant on tail!
        cb.add_eq([(c3[K - 1], 1.0)], 0.0)
        cb.add_eq([(c4[K - 1], 1.0)], 0.0)

        nn = [
            (0.0, [(l3[0], 1.0)]), (0.0, [(l3[1], 1.0)]), (0.0, [(l3[2], 1.0)]),
            (-2.0e-2, [(l3[0], 1.0), (l3[1], 1.0), (l3[2], 1.0)]),
            (0.0, [(mu_a, 1.0)]), (-1e-5, [(mu_rho, 1.0)]), (-1e-5, [(mu_w, 1.0)]),
            (-2e-5, [(m_del, 1.0)]), (-1e-5, [(mu_w1, 1.0)]), (-1e-5, [(mu_T, 1.0)]),
            (-1e-5, [(mu_F4, 1.0)]), (-1e-5, [(mu_vr, 1.0)]), (0.0, [(tau_vr, 1.0)]),
        ]
        for k in range(K):
            nn += [
                (0.0, [(psi_a[k], 1.0)]), (0.0, [(psi_del[k], 1.0)]),
                (0.0, [(xi2[k], 1.0)]), (0.0, [(xit1[k], 1.0)]),
                (0.0, [(xik1[k], 1.0)]), (0.0, [(tau_f4_knot[k], 1.0)]),
            ]
        for i in range(N):
            nn += [(0.0, [(tau_w[i], 1.0)]), (0.0, [(tau_w1[i], 1.0)]), (0.0, [(tau_iv_grid[i], 1.0)])]
        cb.add_nonneg_batch(nn)

        cb.add_psd(2, [(0.0, [(m00, 1.0)]), (0.0, [(m01, 1.0)]), (-2e-5, [(m11, 1.0)])])
        cb.add_soc([(0.0, [(mu_vr, 1.0), (tau_vr, 1.0)]), (0.0, [(sig_vr, 2.0)]), (0.0, [(mu_vr, 1.0), (tau_vr, -1.0)])])

        for k in range(K):
            cb.add_soc([(0.0, [(xi2[k], 1.0), (xit1[k], 1.0)]), (0.0, [(xia[k], 1.0)]), (0.0, [(xi2[k], 1.0), (xit1[k], -1.0)])])
            cb.add_soc([(0.0, [(mu_F4, 1.0), (tau_f4_knot[k], 1.0)]), (0.0, [(c4[k], SQ2)]), (0.0, [(mu_F4, 1.0), (tau_f4_knot[k], -1.0)])])

        for i in range(N):
            vi = float(v[i]); ri = float(rr[i])
            nz_f = np.flatnonzero(Fm[:, i])
            nz_g = np.flatnonzero(Gm[:, i])
            nz_y = np.flatnonzero(Ym[:, i])
            nz_gv = np.flatnonzero(gv_mat[:, i])

            cb.add_soc([
                (0.0, [(mu_w, 1.0), (tau_w[i], 1.0)]),
                (0.0, [(c3[k], ri * gv_mat[k, i]) for k in nz_gv] + [(c4[k], ri * gv_mat[k, i]) for k in nz_gv]),
                (0.0, [(mu_w, 1.0), (tau_w[i], -1.0)]),
            ])
            cb.add_soc([
                (0.0, [(mu_w1, 1.0), (tau_w1[i], 1.0)]),
                (0.0, [(c3[k], ri * gv_mat[k, i]) for k in nz_gv]),
                (0.0, [(mu_w1, 1.0), (tau_w1[i], -1.0)]),
            ])
            cb.add_soc([
                (0.0, [(mu_T, 1.0), (tau_iv_grid[i], 1.0)]),
                (0.0, [(c4[k], SQ2 * ri * gv_mat[k, i]) for k in nz_gv]),
                (0.0, [(mu_T, 1.0), (tau_iv_grid[i], -1.0)]),
            ])

            al2_c = (
                [(mu_a, 1.0)]
                + [(psi_a[k], Fm[k, i]) for k in nz_f]
                + [(c4[k], -Fm[k, i]) for k in nz_f]
                + [(tau_iv_grid[i], -1.0)]
                + [(tau_f4_knot[k], -Fm[k, i]) for k in nz_f]
            )
            cb.add_nonneg_batch([(-2.5e-5, al2_c)])

            denom = 1.0 + 0.02 * vi + 0.0005 * (ri ** 3)
            si = 1.0 / denom; si2 = si * si; si2_v = vi * si2
            si2_v2 = (vi / denom) ** 2; si2_v3 = ((ri ** 3) / denom) ** 2

            t_M00 = [(m00, 1.0)] + [(c3[k], -Fm[k, i]) for k in nz_f]
            t_M01 = [(q2_s, 1.0)] + [(c3[k], -0.125 * Fm[k, i]) for k in nz_f] + [(psi_a[k], -0.5 * Fm[k, i]) for k in nz_f]
            t_M11 = [(m_del, 1.0)] + [(psi_del[k], Fm[k, i]) for k in nz_f]
            t_M02 = [(m01, 1.0)] + [(psi_a[k], -0.5 * Fm[k, i]) for k in nz_f]
            t_M12 = [(q1_s, 1.0)]; t_M22 = [(m11, 1.0)]
            t_M03 = [(c3[k], -0.5 * Ym[k, i]) for k in nz_y] + [(c4[k], -0.5 * Ym[k, i]) for k in nz_y]
            t_M33 = [(mu_rho, 1.0)] + al2_c

            t_b0 = (
                [(c1[k], -0.5 * si * Fm[k, i]) for k in nz_f] + [(sl12[0], -0.5e-2 * (vi * si))]
                + [(c3[k], 0.5 * (uv - pv) * si * Fm[k, i]) for k in nz_f] + [(c3[k], 0.5 * si * Gm[k, i]) for k in nz_g]
                + [(m00, -uv * si), (m01, -2.0 * uv * si), (tau_w[i], -0.5 * si), (tau_w1[i], -0.5 * si)]
                + [(psi_a[k], -2.0 * pv * si * Fm[k, i]) for k in nz_f] + [(xi2[k], -0.5 * si * Fm[k, i]) for k in nz_f]
            )
            t_b1 = (
                [(c1[k], -0.125 * si * Fm[k, i]) for k in nz_f] + [(sl12[0], -0.125e-2 * (vi * si))]
                + [(c2[k], -0.1875 * si * Fm[k, i]) for k in nz_f] + [(sl12[1], -0.1875e-2 * (vi * si))]
                + [(c3[k], 0.125 * uv * si * Fm[k, i]) for k in nz_f] + [(q0_s, 0.5 * si)]
                + [(xit1[k], -0.5 * si * Fm[k, i]) for k in nz_f]
            )
            t_b2 = (
                [(c2[k], -0.25 * si * Fm[k, i]) for k in nz_f] + [(sl12[1], -0.25e-2 * (vi * si))]
                + [(m01, -uv * si), (m11, -2.0 * uv * si)] + [(psi_del[k], -8.0 * pv * si * Fm[k, i]) for k in nz_f]
                + [(xit1[k], -0.5 * si * Fm[k, i]) for k in nz_f] + [(xik1[k], -0.5 * si * Fm[k, i]) for k in nz_f]
            )
            t_b3 = (
                [(c1[k], -0.5 * si * Ym[k, i]) for k in nz_y] + [(sl12[0], -0.25e-2 * (vi * si))]
                + [(c2[k], -0.25 * si * Ym[k, i]) for k in nz_y] + [(sl12[1], -0.125e-2 * (vi * si))]
                + [(sig_vr, 0.5 * (vi * si))] + [(c3[k], 0.5 * uv * si * Ym[k, i]) for k in nz_y]
                + [(c4[k], 0.5 * si * Gm[k, i]) for k in nz_g] + [(xia[k], -0.5 * si * Fm[k, i]) for k in nz_f]
            )
            t_q1 = (
                [(lam[0], si2), (lam[1], si2_v), (lam[2], 1e-2 * si2_v2),
                 (l3[0], 1e-4 * si2_v3), (l3[1], 1e-4 * si2_v3), (l3[2], 1e-4 * si2_v3),
                 (sl12[0], (0.5 * si2_v2 - pv * si2_v) * 1e-2), (sl12[1], (0.5 * si2_v2 - pv * si2_v) * 1e-2),
                 (m00, u2 * si2), (m01, 4.0 * u2 * si2), (m11, 4.0 * u2 * si2)]
                + [(c1[k], si2 * Gm[k, i]) for k in nz_g] + [(c1[k], -pv * si2 * Fm[k, i]) for k in nz_f]
                + [(c2[k], si2 * Gm[k, i]) for k in nz_g] + [(c2[k], -pv * si2 * Fm[k, i]) for k in nz_f]
                + [(c3[k], -uv * si2 * Gm[k, i]) for k in nz_g] + [(c3[k], pv * uv * si2 * Fm[k, i]) for k in nz_f]
                + [(xit1[k], -4.0 * pv * si2 * Fm[k, i]) for k in nz_f]
            )
            cb.add_psd(5, [
                (-m_floor, t_M00),
                (0.0, t_M01), (-m_floor, t_M11),
                (0.0, t_M02), (0.0, t_M12), (-m_floor, t_M22),
                (0.0, t_M03), (0.0, []), (0.0, []), (-m_floor, t_M33),
                (0.0, t_b0), (0.0, t_b1), (0.0, t_b2), (0.0, t_b3), (-(3e-6 + ri) * si2, t_q1),
            ])

        sec_vars_end = {}
        for end_nm, s_fr in (("lo", s_lo), ("hi", s_hi)):
            sG = float(s_fr)
            y_sec = cb.var(M_sec); y_dd = cb.var(); a11_dd = cb.var(); a20_dd = cb.var()
            a_hol = cb.var(5); b_hol = cb.var(5)
            sec_vars_end[end_nm] = (y_sec, y_dd, a11_dd, a20_dd, a_hol)
            cb.add_nonneg_batch(
                [(0.0, [(y_sec[m], 1.0)]) for m in range(M_sec)]
                + [(0.0, [(y_dd, 1.0)]), (0.0, [(y_dd, 1.0), (lam[2], -1e-2 * pv), (m_del, -2.0 * pv)]),
                   (0.0, [(a11_dd, 1.0), (y_dd, -4.0)]), (0.0, [(a20_dd, 1.0), (y_dd, -8.0)])]
                + [(0.0, [(a_hol[s], 1.0)]) for s in range(5)]
                + [(0.0, [(b_hol[s], 1.0)]) for s in range(5)]
            )
            cb.add_soc([
                (0.0, [(a11_dd, 1.0), (a20_dd, 1.0), (y_dd, -12.0)]),
                (0.0, [(y_dd, sqrt(128.0))]),
                (0.0, [(a11_dd, 1.0), (a20_dd, -1.0), (y_dd, 4.0)]),
            ])
            if mode == "holder":
                psi34_f = float(Fr(8 + Fr(1, 2) * (s_lo + s_hi) + 3 * s_fr) / (4 * q_mid_fr))
                hol_pref = 30.0 * pv * u_32 * psi34_f * 1e-4
                for s in range(5):
                    c_s = hol_pref * KAPPAf[s]
                    cb.add_soc([
                        (0.0, [(a_hol[s], 1.0), (b_hol[s], 1.0)]),
                        (0.0, [(l3[0], c_s), (l3[1], c_s), (l3[2], c_s)]),
                        (0.0, [(a_hol[s], 1.0), (b_hol[s], -1.0)]),
                    ])
            else:
                for s in range(5):
                    cb.add_eq([(b_hol[s], 1.0)], 0.0)

            dual_rows = []
            for s_idx in range(5):
                df_c = pv * sec_f_base[s_idx]
                ped_c = pv * sec_ed_base[s_idx]
                v3_c = 15.0 * (pv ** 2) * sec_T2[s_idx]
                terms = [(y_sec[m], A_sec_f[m, s_idx]) for m in range(M_sec) if A_sec_f[m, s_idx] != 0.0]
                if mode == "holder":
                    terms.append((a_hol[s_idx], -1.0))
                if s_idx == 0:
                    terms.append((a11_dd, -1.0))
                elif s_idx == 1:
                    terms.append((a20_dd, -1.0))
                elif s_idx == 2:
                    terms.append((y_dd, -8.0))
                elif s_idx == 4:
                    terms.append((y_dd, -16.0))
                if df_c != 0.0:
                    terms += [(lam[2], -1e-2 * df_c), (mu_a, -df_c), (mu_rho, -df_c), (sig_vr, -df_c), (mu_F4, -0.125 * df_c)]
                if ped_c != 0.0:
                    terms.append((mu_w1, -ped_c))
                terms += [(l3[0], -1e-4 * v3_c), (l3[1], -1e-4 * v3_c), (l3[2], -1e-4 * v3_c)]
                dual_rows.append((0.0, terms))
            cb.add_nonneg_batch(dual_rows)

            if mode == "young":
                V3_p_c = 6.0 * (pv ** 3) * (1.0 + 5.0 / (gy_f ** 2)) + 30.0 * (pv ** 2) * uv
                mult_G6 = (uv ** 3) * (1.0 + 10.0 * gy_f)
            else:
                V3_p_c = 6.0 * (pv ** 3) + 30.0 * (pv ** 2) * uv + 15.0 * pv * u2 * (2.0 + sG)
                mult_G6 = uv ** 3
            V3_base = V3_p_c + mult_G6 * (6.0 + 9.0 * sG)
            extra_p = (
                [(mu_T, -0.5 * pv), (mu_vr, -0.5 * (pv ** 2))]
                + [(b_hol[s], -1.0) for s in range(5)]
                + [(y_sec[m], -b_sec_f[m]) for m in range(M_sec)]
            )
            if sG == 0.0:
                cb.add_nonneg_batch([(0.0, [
                    (t_obj, 1.0), (lam[0], -1.0), (lam[1], -1.0), (lam[2], -2e-2),
                    (l3[0], -V3_base * 1e-4), (l3[1], -V3_base * 1e-4), (l3[2], -V3_base * 1e-4),
                ] + extra_p)])
                continue

            eta = cb.var(); nu = cb.var(2); om = cb.var(5); ze = cb.var(3); ch = cb.var(3); ps = cb.var(3); kap = cb.var()
            cb.add_nonneg_batch([(0.0, [(nu[0], 1.0)]), (0.0, [(nu[1], 1.0)]), (0.0, [(kap, 1.0)])]
                                + [(0.0, [(om[j], 1.0)]) for j in range(5)])
            cb.add_soc([(0.0, [(ze[0], 1.0), (ze[1], 1.0)]), (0.0, [(ze[2], 1.0)]), (0.0, [(ze[0], 1.0), (ze[1], -1.0)])])
            cb.add_soc([(0.0, [(ch[0], 1.0), (ch[1], 1.0)]), (0.0, [(ch[2], 1.0)]), (0.0, [(ch[0], 1.0), (ch[1], -1.0)])])
            sq = sqrt(sG)
            cb.add_soc([(0.0, [(ps[0], 1.0), (ps[1], 1.0)]), (0.0, [(ps[2], 1.0)]), (0.0, [(ps[0], 1.0), (ps[1], -1.0)])])
            cb.add_eq([(l3[1], mult_G6 * 300.0e-4 * sq), (l3[2], mult_G6 * 135.0e-4 * sq), (ps[2], 1.0)], 0.0)
            d_base = [
                [(m00, 16.0 * u2), (m01, 32.0 * u2), (m11, 32.0 * u2)],
                [(m00, 4.0 * u2),  (m11, 16.0 * u2)],
                [(m11, 16.0 * u2), (mu_a, 32.0 * u2), (mu_rho, 32.0 * u2), (sig_vr, 32.0 * u2), (tau_vr, 32.0 * u2)],
                [(m01, 48.0 * u2), (m11, 48.0 * u2), (mu_a, 24.0 * u2), (mu_rho, 24.0 * u2), (mu_w, 24.0 * u2), (sig_vr, 48.0 * u2), (tau_vr, 24.0 * u2)],
                [(m01, 16.0 * u2), (m11, 16.0 * u2)],
            ]
            st_extra = [
                [(eta, -32.0), (nu[0], 1.0), (om[0], 1.0), (ze[0], 1.0), (ch[1], 1.0)],
                [(eta, -8.0),                (om[1], 1.0), (ze[1], 1.0), (ch[0], 1.0)],
                [(eta, -32.0), (nu[0], -1.0),(om[2], 1.0),               (ch[1], 1.0)],
                [(eta, -96.0), (nu[1], -1.0),(om[3], 1.0),               (ch[1], 3.0), (ch[2], 3.0)],
                [              (nu[1], 1.0), (om[4], 1.0), (ze[2], 1.0), (ch[1], -1.0),(ch[2], -1.0)],
            ]
            for idx in range(5):
                cb.add_eq(
                    d_base[idx]
                    + [(l3[1], mult_G6 * sq * 198.0e-4 * H0f[idx]),
                       (l3[2], mult_G6 * sq * (11781.0 / 32.0) * 1e-4 * H0f[idx]),
                       (ps[0], S0f[idx]), (ps[1], H0f[idx]), (kap, H0f[idx])]
                    + st_extra[idx],
                    0.0,
                )
            cb.add_nonneg_batch([(0.0, [
                (t_obj, 1.0), (lam[0], -1.0), (lam[1], -1.0), (lam[2], -(2.0 + u2 * sG) * 1e-2),
                (l3[0], -(V3_base + mult_G6 * C6f * (sG ** 1.5)) * 1e-4),
                (l3[1], -V3_base * 1e-4), (l3[2], -V3_base * 1e-4), (eta, -sG),
            ] + extra_p)])

        sol = cb.solve(t_obj)
        x = np.array(sol.x, dtype=float)
        obj_val = float(sol.obj_val)
        c3_arr = x[c3].copy(); c3_arr[-1] = 0.0
        c4_arr = x[c4].copy(); c4_arr[-1] = 0.0
        sec_hint = {}
        for end_nm, (ys_i, ydd_i, a11_i, a20_i, ah_i) in sec_vars_end.items():
            ydd_v = max(float(x[ydd_i]), 1e-12)
            th_v = max(1e-3, min(1e3, (float(x[a11_i]) / ydd_v) / 4.0 - 1.0))
            sec_hint[end_nm] = (np.maximum(x[ys_i], 0.0), th_v, np.maximum(x[ah_i], 1e-7))
        sol_dict = dict(
            phi1=x[c1], phi2=x[c2], phi3=c3_arr, phi4=c4_arr,
            psi_a=np.maximum(x[psi_a], 0.0), psi_del=np.maximum(x[psi_del], 0.0),
            xi2=np.maximum(x[xi2], 0.0), xit1=np.maximum(x[xit1], 0.0),
            xia=x[xia], xik1=np.maximum(x[xik1], 0.0),
            slope=x[sl12] * 1e-2,
            lam=np.array([x[lam[0]], x[lam[1]], x[lam[2]] * 1e-2]),
            l3=np.maximum(x[l3] * 1e-4, 0.0),
            m_ker=[max(x[m00], 1e-6), x[m01], max(x[m11], 5e-6)],
            m_del=max(x[m_del], 5e-6),
            q_sym=[x[q0_s], x[q1_s], x[q2_s]],
            vr=[x[sig_vr], max(x[mu_vr], 5e-6), max(x[tau_vr], 0.0)],
            mu_a=max(x[mu_a], 0.0), mu_rho=max(x[mu_rho], 5e-6),
            mu_w=max(x[mu_w], 5e-6), mu_w1=max(x[mu_w1], 5e-6),
            mu_T=max(x[mu_T], 5e-6), mu_F4=max(x[mu_F4], 5e-6),
            mode=mode, gy_fr=gy_fr, sec_hint=sec_hint,
        )
        sch, a4_d, _, d2_d, d3_d, d4_d = eval_schur_5x5_dense(sol_dict, pv, uv, ek, rd)
        if sch.min() > -1e-6 and a4_d.min() > 0 and d2_d.min() > 0 and d3_d.min() > 0 and d4_d.min() > 0:
            break
        edges = np.concatenate([ek, [np.inf]])
        idx_c = np.searchsorted(edges, rd, side="right") - 1
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


def all_cuts(extra_thetas=()):
    cuts = [(t, None) for t in ("n", "h", "b", "y", "z", "bn", "yz", "h0", "m")]
    ths = sorted(set(THETAS) | set(extra_thetas))
    cuts += [("c1", th) for th in ths]
    cuts += [("c2+", th) for th in ths] + [("c2-", th) for th in ths]
    return cuts


def par_lp(cvec, cuts):
    A = np.array([[float(x) for x in VF.cut_vector(t, th)] for t, th in cuts])
    res = linprog(-np.array(cvec, float), A_ub=-A, b_ub=np.zeros(len(cuts)),
                  A_eq=np.array([EROWf], float), b_eq=[1.0], bounds=[(None, None)] * 5, method="highs")
    if res.status != 0:
        raise RuntimeError("parameter LP failed: " + res.message)
    return -res.fun, res.x, -float(res.eqlin.marginals[0]), -np.array(res.ineqlin.marginals)


def build_par_duals(u2, mult_G6, m_ker, mu_a, mu_rho, mu_w, sig_vr, tau_vr, l3, s_ends):
    m00, m01, m11 = m_ker
    dlin = [
        u2 * (16 * m00 + 32 * m01 + 32 * m11),
        u2 * (4 * m00 + 16 * m11),
        u2 * (16 * m11 + 32 * (mu_a + mu_rho + sig_vr + tau_vr)),
        u2 * (48 * m01 + 48 * m11 + 24 * (mu_a + mu_rho + mu_w + tau_vr) + 48 * sig_vr),
        u2 * (16 * m01 + 16 * m11),
    ]
    cuts = all_cuts()
    par_json = {}
    for name, s_e in zip(("lo", "hi"), s_ends):
        if s_e == 0:
            continue
        sb = sqrt_ub(s_e)

        def lpval(al, cuts_=cuts):
            dJ = [
                mult_G6 * (
                    l3[1] * (150 * al[0] * VF.S0[i] + (198 + Fr(150) / al[0]) * VF.H0[i])
                    + l3[2] * (Fr(135, 2) * al[1] * VF.S0[i] + (Fr(11781, 32) + Fr(135, 2) / al[1]) * VF.H0[i])
                )
                for i in range(5)
            ]
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
                    a2[idx] = Fr(float(np.exp(xv))).limit_denominator(10 ** 5)
                    return lpval(a2)[0]

                c_, d_ = hi - gr * (hi - lo), lo + gr * (hi - lo)
                fc, fd = f(c_), f(d_)
                for _ in range(30):
                    if fc < fd:
                        hi, d_, fd = d_, c_, fc
                        c_ = hi - gr * (hi - lo)
                        fc = f(c_)
                    else:
                        lo, c_, fc = c_, d_, fd
                        d_ = lo + gr * (hi - lo)
                        fd = f(d_)
                al[idx] = Fr(float(np.exp(0.5 * (lo + hi)))).limit_denominator(10 ** 4)

        _, p, _, _ = lpval(al)
        extra = []
        if p[0] > 1e-9 and p[1] > 1e-9:
            extra.append(Fr(sqrt(p[1] / p[0])).limit_denominator(2000))
        m_ = p[0] + p[2] + 3.0 * p[3] - p[4]
        if p[1] > 1e-9 and m_ > 1e-9:
            extra.append(Fr(sqrt(m_ / p[1])).limit_denominator(2000))
        cuts2 = all_cuts(extra)
        _, _, eta, y = lpval(al, cuts2)
        keep = [
            (cuts2[i][0], None if cuts2[i][1] is None else str(cuts2[i][1]), str(rat(y[i], 48)))
            for i in range(len(cuts2)) if y[i] > 1e-12
        ]
        par_json[name] = dict(alpha=[str(x) for x in al], eta=str(rat(eta, 48)), cuts=keep, sqrt_ub=str(sb))
    return par_json


def build_sec_duals(pv, uv, u_32, mode, s_lo, s_hi, lam2, lam3, m_del, mu_a, mu_rho, sig_vr, mu_F4, mu_w1, A_sec, b_sec, sec_hint):
    """Use Clarabel's optimal (theta_12, a_hol) and polish y_sec by exact 11-var HiGHS LP."""
    A_f = np.array([[float(x) for x in r] for r in A_sec], dtype=float)
    b_f = np.array([float(x) for x in b_sec], dtype=float)
    M_sec = len(b_sec)

    c_DF = lam2 + mu_a + mu_rho + sig_vr + Fr(1, 8) * mu_F4
    c_dd = max(Fr(0), lam2 + 2 * m_del)
    sec_DF_w = [Fr(4), Fr(0), Fr(0), Fr(4), Fr(4)]
    sec_ed_w = [Fr(1), Fr(2), Fr(1), Fr(0), Fr(2)]
    sec_T2_w = [Fr(12), Fr(10), Fr(4), Fr(4), Fr(22)]

    out = {}
    for name in ("lo", "hi"):
        _, th_v, ah_v = sec_hint[name]
        th12 = Fr(float(th_v)).limit_denominator(5000)
        if th12 <= 0:
            th12 = Fr(1)
        a_hol = [max(Fr(1, 1 << 22), rat(ah_v[s], 34)) for s in range(5)]

        sec_dd_w = [4 * (1 + th12), 8 * (1 + Fr(1) / th12), Fr(8), Fr(0), Fr(16)]
        lhs = [
            float(
                c_DF * pv * sec_DF_w[s]
                + c_dd * pv * sec_dd_w[s]
                + mu_w1 * pv * sec_ed_w[s]
                + 15 * lam3 * (pv * pv) * sec_T2_w[s]
                + a_hol[s]
            )
            for s in range(5)
        ]
        c_lp = np.concatenate([b_f, np.full(5, float(uv))])
        A_ub = np.hstack([-A_f.T, -np.eye(5)])
        res_y = linprog(c_lp, A_ub=A_ub, b_ub=-np.array(lhs), bounds=[(0.0, None)] * (M_sec + 5), method="highs")
        if res_y.status != 0:
            y_sec = [Fr(0)] * M_sec
        else:
            y_sec = [max(Fr(0), rat(val, 40)) if val > 1e-12 else Fr(0) for val in res_y.x[:M_sec]]

        out[name] = dict(y_sec=[str(y) for y in y_sec], theta_12=str(th12), a_hol=[str(a) for a in a_hol])
    return out


def make_row(ray_abc, s_lo, s_hi, knot_name, knots, A_sec, b_sec, kbits=20):
    t0 = time.time()
    a_r, b_r, c_r = ray_abc
    pv = Fr(a_r * a_r, c_r * c_r)
    uv = Fr(b_r * b_r, c_r * c_r)
    u2 = uv * uv
    u3 = u2 * uv
    u_32 = Fr(b_r, c_r) ** 3

    A_sec_f = np.array([[float(x) for x in r] for r in A_sec], dtype=float)
    b_sec_f = np.array([float(x) for x in b_sec], dtype=float)
    sol, _ = solve_clarabel_spiked(ray_abc, s_lo, s_hi, knots, A_sec_f, b_sec_f)

    kden = 1 << kbits
    K = len(knots) - 1

    m00 = max(Fr(1, 1 << 20), rat(sol["m_ker"][0], 40))
    m01 = rat(sol["m_ker"][1], 40)
    m11 = max(Fr(1, 1 << 20), rat(sol["m_ker"][2], 40))
    while m00 * m11 < m01 * m01:
        m00 += Fr(1, 1 << 34)
        m11 += Fr(1, 1 << 34)
    m_del = max(Fr(1, 1 << 20), rat(sol["m_del"], 40))
    q0 = rat(sol["q_sym"][0], 40)
    q1 = rat(sol["q_sym"][1], 40)
    q2 = rat(sol["q_sym"][2], 40)
    sig_vr = rat(sol["vr"][0], 40)
    mu_vr = max(Fr(1, 1 << 22), rat(sol["vr"][1], 40))
    tau_vr = max(Fr(0), rat(sol["vr"][2], 40))
    while mu_vr * tau_vr < sig_vr * sig_vr:
        tau_vr += Fr(1, 1 << 36)
    mu_a = max(Fr(0), rat(sol["mu_a"], 38))
    mu_rho = max(Fr(1, 1 << 22), rat(sol["mu_rho"], 38))
    # Pure dyadic reciprocals 1/mu_* = K / 2^22 keep Sturm denominators powers of 2!
    mu_w = inv_dyadic(sol["mu_w"], 22)
    mu_w1 = inv_dyadic(sol["mu_w1"], 22)
    mu_T = inv_dyadic(sol["mu_T"], 22)
    mu_F4 = inv_dyadic(sol["mu_F4"], 22)
    slope = [rat(sol["slope"][0], 42), rat(sol["slope"][1], 42)]
    l3 = [rat(x, 54) if x > 1e-12 else Fr(0) for x in sol["l3"]]
    if sum(l3) == 0:
        l3[0] = Fr(1, 1 << 48)

    to_int_arr = lambda arr: [int(round(float(x) * kden)) for x in arr]
    iphi1 = to_int_arr(sol["phi1"])
    iphi2 = to_int_arr(sol["phi2"])
    iphi3 = to_int_arr(sol["phi3"]); iphi3[K] = 0
    iphi4 = to_int_arr(sol["phi4"]); iphi4[K] = 0
    ipsi_a = [max(0, x) for x in to_int_arr(sol["psi_a"])]
    ipsi_del = [max(0, x) for x in to_int_arr(sol["psi_del"])]
    ixi2 = [max(0, x) for x in to_int_arr(sol["xi2"])]
    ixit1 = [max(0, x) for x in to_int_arr(sol["xit1"])]
    ixia = to_int_arr(sol["xia"])
    ixik1 = [max(0, x) for x in to_int_arr(sol["xik1"])]

    for k in range(K + 1):
        while ixia[k] * ixia[k] > 4 * ixi2[k] * ixit1[k]:
            ixi2[k] += 1
            ixit1[k] += 1
        while m00 - Fr(iphi3[k], kden) <= Fr(1, 1 << 19):
            if k < K:
                iphi3[k] -= 1
            else:
                m00 += Fr(1, 1 << 22)
        while m11 * (m_del + Fr(ipsi_del[k], kden)) - q1 * q1 <= Fr(1, 1 << 28):
            ipsi_del[k] += 1

    ek = np.array([float(x) for x in knots])
    rp = np.unique(np.concatenate([
        np.concatenate([a_ + (b_ - a_) * (np.arange(70) + 0.5) / 70 for a_, b_ in zip(ek[:-1], ek[1:])]),
        ek,
        np.geomspace(ek[-1] * 1.0002, max(5000.0, 25.0 * ek[-1]), 550),
    ]))
    vp = rp * rp

    solr = dict(
        phi1=np.array(iphi1, float) / kden, phi2=np.array(iphi2, float) / kden,
        phi3=np.array(iphi3, float) / kden, phi4=np.array(iphi4, float) / kden,
        psi_a=np.array(ipsi_a, float) / kden, psi_del=np.array(ipsi_del, float) / kden,
        xi2=np.array(ixi2, float) / kden, xit1=np.array(ixit1, float) / kden,
        xia=np.array(ixia, float) / kden, xik1=np.array(ixik1, float) / kden,
        slope=[float(slope[0]), float(slope[1])],
        lam=[0.0, 0.0, float(rat(sol["lam"][2], 50))],
        l3=[float(x) for x in l3],
        m_ker=[float(m00), float(m01), float(m11)],
        m_del=float(m_del),
        q_sym=[float(q0), float(q1), float(q2)],
        vr=[float(sig_vr), float(mu_vr), float(tau_vr)],
        mu_a=float(mu_a), mu_rho=float(mu_rho), mu_w=float(mu_w), mu_w1=float(mu_w1),
        mu_T=float(mu_T), mu_F4=float(mu_F4),
    )

    _, a4_chk, _, d2_chk, d3_chk, d4_chk = eval_schur_5x5_dense(solr, float(pv), float(uv), ek, rp)
    if a4_chk.min() <= 8e-6:
        bump_a = rat(max(1.5e-5 - float(a4_chk.min()), 1.5e-5), 36)
        mu_a += bump_a
        solr["mu_a"] = float(mu_a)
    while d2_chk.min() <= 1e-8 or d3_chk.min() <= 1e-11 or d4_chk.min() <= 1e-14:
        m00 += Fr(1, 1 << 18)
        m_del += Fr(1, 1 << 18)
        m11 += Fr(1, 1 << 18)
        mu_rho += Fr(1, 1 << 18)
        solr["m_ker"] = [float(m00), float(m01), float(m11)]
        solr["m_del"] = float(m_del)
        solr["mu_rho"] = float(mu_rho)
        _, _, _, d2_chk, d3_chk, d4_chk = eval_schur_5x5_dense(solr, float(pv), float(uv), ek, rp)

    # Polish ONLY (d_lam0, d_l3_0 >= 0) while keeping Clarabel's optimal (lam1, lam2) fixed!
    lam0_cl = rat(sol["lam"][0], 38)
    lam1_base = rat(sol["lam"][1], 38)
    lam2_final = rat(sol["lam"][2], 50)
    solr["lam"] = [float(lam0_cl), float(lam1_base), float(lam2_final)]
    base_schur, _, _, _, _, _ = eval_schur_5x5_dense(solr, float(pv), float(uv), ek, rp)
    scp = 1.0 / (1.0 + 0.02 * (vp ** 2) + 7e-5 * (vp ** 3))
    req_slack = 5e-6 * (1.0 + 5e-7 * (vp ** 2))
    A_pol = -np.column_stack([np.ones_like(vp), (vp ** 3) * 1e-4]) * scp[:, None]
    b_pol = (base_schur - req_slack) * scp
    s_hi_f = float(s_hi)
    u3_f = float(u3)
    v3_hi_c = (
        6.0 * float(pv ** 3) + 30.0 * float((pv ** 2) * uv) + 15.0 * float(pv * u2) * (2.0 + s_hi_f)
        + u3_f * (6.0 + 9.0 * s_hi_f + C6f * (s_hi_f ** 1.5)) + 0.5
    ) * 1e-4
    resp = linprog(
        [1.0, v3_hi_c],
        A_ub=A_pol, b_ub=b_pol,
        bounds=[(0.0, None), (0.0, None)],
        method="highs",
    )
    if resp.status != 0:
        raise RuntimeError("polish LP failed: " + resp.message)

    lam0_base = rat(float(lam0_cl) + resp.x[0], 38)
    if resp.x[1] > 1e-12:
        l3[0] += Fr(int(resp.x[1] * 1e-4 * (1 << 54)) + 1, 1 << 54)
    lam3_tot = sum(l3)

    mode = sol["mode"]
    gy_fr = sol["gy_fr"]
    mult_G6 = u3 * (1 + 10 * gy_fr) if mode == "young" else u3

    par_json = build_par_duals(u2, mult_G6, (m00, m01, m11), mu_a, mu_rho, mu_w, sig_vr, tau_vr, l3, (s_lo, s_hi))
    sec_dual_json = build_sec_duals(
        pv, uv, u_32, mode, s_lo, s_hi, lam2_final, lam3_tot,
        m_del, mu_a, mu_rho, sig_vr, mu_F4, mu_w1, A_sec, b_sec, sol["sec_hint"],
    )

    row = dict(
        s_lo=str(s_lo), s_hi=str(s_hi),
        knot_set=knot_name, knot_den=kden,
        v3_mode=mode,
        phi1=iphi1, phi2=iphi2, phi3=iphi3, phi4=iphi4,
        psi_a=ipsi_a, psi_del=ipsi_del,
        xi2=ixi2, xit1=ixit1, xia=ixia, xik1=ixik1,
        lam=[str(lam0_base), str(lam1_base), str(lam2_final)],
        slope=[str(slope[0]), str(slope[1])],
        l3=[str(x) for x in l3],
        m_ker=[str(m00), str(m01), str(m11)],
        m_del=str(m_del),
        q_sym=[str(q0), str(q1), str(q2)],
        vr=[str(sig_vr), str(mu_vr), str(tau_vr)],
        mu_a=str(mu_a), mu_rho=str(mu_rho), mu_w=str(mu_w), mu_w1=str(mu_w1),
        mu_T=str(mu_T), mu_F4=str(mu_F4),
        par=par_json,
        sec_dual=sec_dual_json,
    )
    if mode == "young":
        row["g_young"] = str(gy_fr)

    knot_sets_str = {knot_name: [str(x) for x in knots]}
    margin = 2e-6
    l3_bump = Fr(0)
    res_v = None
    for attempt in range(12):
        lam0_try = rat(float(lam0_base) + margin, 38)
        l3_try = [l3[0] + l3_bump, l3[1], l3[2]]
        row["l3"] = [str(x) for x in l3_try]
        if l3_bump > 0:
            row["par"] = build_par_duals(u2, mult_G6, (m00, m01, m11), mu_a, mu_rho, mu_w, sig_vr, tau_vr, l3_try, (s_lo, s_hi))
            row["sec_dual"] = build_sec_duals(
                pv, uv, u_32, mode, s_lo, s_hi, lam2_final, sum(l3_try),
                m_del, mu_a, mu_rho, sig_vr, mu_F4, mu_w1, A_sec, b_sec, sol["sec_hint"],
            )
        row["lam"] = [str(lam0_try), str(lam1_base), str(lam2_final)]
        res_v = VF.verify_spiked_row(row, ray_abc, A_sec, b_sec, knot_sets_str, quiet=True)
        if res_v["ok"]:
            break
        margin = min(margin * 2.0, 5e-4)
        l3_bump = Fr(1, 1 << 36) if l3_bump == 0 else l3_bump * 4
        mu_a += Fr(1, 1 << 20)
        row["mu_a"] = str(mu_a)

    if not res_v["ok"]:
        VF.verify_spiked_row(row, ray_abc, A_sec, b_sec, knot_sets_str, quiet=False)
        raise RuntimeError(f"Sturm verification failed for ray={ray_abc} [{s_lo}, {s_hi}]")

    sz = len(json.dumps(row, separators=(",", ":")))
    print(
        "    [%5s, %5s] %-5s %-6s  bound <= %s  (%d B, %.1fs)"
        % (s_lo, s_hi, knot_name, mode, VF.dec_ceil10(res_v["bound"]), sz, time.time() - t0),
        flush=True,
    )
    return row, res_v["bound"]


def _row_worker(args):
    return make_row(*args)


def build_ray_entry(ray_abc, R_init, band, knot_sets, max_workers=6):
    a_r, b_r, c_r = ray_abc
    pv = Fr(a_r * a_r, c_r * c_r)
    uv = Fr(b_r * b_r, c_r * c_r)
    slabs_pts = SLABS_BY_BAND[band]
    slabs = list(zip(slabs_pts[:-1], slabs_pts[1:]))

    R_cur = R_init
    for retry in range(3):
        d_cut = find_exact_d_cut(R_cur, uv)
        A_sec, b_sec = VF.build_sector_polytope(pv, d_cut, R_cur, B_ROWS)
        print(
            "==> Solving Stein ray abc=%s (p=%.5f) with target R=%s (d_cut=%s)..."
            % (ray_abc, float(pv), R_cur, d_cut),
            flush=True,
        )
        tasks = []
        for s_lo, s_hi in slabs:
            u2_mid = float(uv * uv) * 0.5 * float(s_lo + s_hi)
            use_peak = (1.5 <= u2_mid <= 6.8)
            kname = "peak" if use_peak else "flank"
            kb = 21 if use_peak else 20
            tasks.append((ray_abc, s_lo, s_hi, kname, knot_sets[kname], A_sec, b_sec, kb))

        with ProcessPoolExecutor(max_workers=max_workers) as ex:
            results = list(ex.map(_row_worker, tasks))
        rows = [r for r, _ in results]
        worst = max(b for _, b in results)
        if worst < R_cur:
            print(
                "    Ray %s DONE: worst = %s < R = %s  (SELF-CONSISTENT PASS!)"
                % (ray_abc, VF.dec_ceil10(worst), R_cur),
                flush=True,
            )
            return dict(kind="stein", abc=list(ray_abc), R=str(R_cur), d_cut=str(d_cut), rows=rows), R_cur
        R_cur = Fr(int(float(worst) * 10000) + 2, 10000)
        print(f"    Ray {ray_abc} worst={float(worst):.6f} >= R; retrying with R={R_cur}...", flush=True)
    raise RuntimeError(f"Failed to get self-consistent R for ray {ray_abc}")


def tighten_stein_ray(ray_entry):
    """Binary-search the tightest self-consistent multiple of 1/100000 for R_j by re-polishing y_sec."""
    import copy
    abc = tuple(ray_entry["abc"])
    a_r, b_r, c_r = abc
    pv = Fr(a_r * a_r, c_r * c_r)
    uv = Fr(b_r * b_r, c_r * c_r)
    u2 = uv * uv
    u3 = u2 * uv
    u_32 = Fr(b_r, c_r) ** 3
    sec_DF_w = [Fr(4), Fr(0), Fr(0), Fr(4), Fr(4)]
    sec_ed_w = [Fr(1), Fr(2), Fr(1), Fr(0), Fr(2)]
    sec_T2_w = [Fr(12), Fr(10), Fr(4), Fr(4), Fr(22)]

    def try_R(R_try):
        d_cut = find_exact_d_cut(R_try, uv)
        A_sec, b_sec = VF.build_sector_polytope(pv, d_cut, R_try, B_ROWS)
        A_f = np.array([[float(x) for x in r] for r in A_sec], dtype=float)
        b_f = np.array([float(x) for x in b_sec], dtype=float)
        M_sec = len(b_sec)
        worst = Fr(0)
        new_rows = []
        for row in ray_entry["rows"]:
            r2 = copy.deepcopy(row)
            lam0, lam1, lam2 = (Fr(x) for x in r2["lam"])
            l3 = [Fr(x) for x in r2["l3"]]
            lam3 = sum(l3)
            m00, m01, m11 = (Fr(x) for x in r2["m_ker"])
            m_del = Fr(r2["m_del"])
            sig_vr, mu_vr, tau_vr = (Fr(x) for x in r2["vr"])
            mu_a = Fr(r2["mu_a"]); mu_rho = Fr(r2["mu_rho"]); mu_w = Fr(r2["mu_w"])
            mu_w1 = Fr(r2["mu_w1"]); mu_T = Fr(r2["mu_T"]); mu_F4 = Fr(r2["mu_F4"])
            c_DF = lam2 + mu_a + mu_rho + sig_vr + Fr(1, 8) * mu_F4
            c_dd = max(Fr(0), lam2 + 2 * m_del)
            s_lo, s_hi = Fr(r2["s_lo"]), Fr(r2["s_hi"])
            s_mid = Fr(1, 2) * (s_lo + s_hi)
            q_mid = VF.root4_lo(2 + s_mid)
            dlin = [
                u2 * (16 * m00 + 32 * m01 + 32 * m11),
                u2 * (4 * m00 + 16 * m11),
                u2 * (16 * m11 + 32 * (mu_a + mu_rho + sig_vr + tau_vr)),
                u2 * (48 * m01 + 48 * m11 + 24 * (mu_a + mu_rho + mu_w + tau_vr) + 48 * sig_vr),
                u2 * (16 * m01 + 16 * m11),
            ]
            for end, s_e in (("lo", s_lo), ("hi", s_hi)):
                sd = r2["sec_dual"][end]
                th12 = Fr(sd["theta_12"])
                a_hol = [Fr(x) for x in sd["a_hol"]]
                sec_dd_w = [4 * (1 + th12), 8 * (1 + Fr(1) / th12), Fr(8), Fr(0), Fr(16)]
                lhs = [
                    float(
                        c_DF * pv * sec_DF_w[s] + c_dd * pv * sec_dd_w[s] + mu_w1 * pv * sec_ed_w[s]
                        + 15 * lam3 * (pv * pv) * sec_T2_w[s] + a_hol[s]
                    )
                    for s in range(5)
                ]
                res_y = linprog(
                    np.concatenate([b_f, np.full(5, float(uv))]),
                    A_ub=np.hstack([-A_f.T, -np.eye(5)]),
                    b_ub=-np.array(lhs),
                    bounds=[(0.0, None)] * (M_sec + 5),
                    method="highs",
                )
                y_sec = [max(Fr(0), rat(val, 40)) if val > 1e-12 else Fr(0) for val in res_y.x[:M_sec]]
                sd["y_sec"] = [str(y) for y in y_sec]
                psi34_hi = Fr(8 + s_mid + 3 * s_e) / (4 * q_mid)
                hol_pref = 30 * lam3 * pv * u_32 * psi34_hi
                b_hol = [((hol_pref * VF.KAPPA_HI[s]) ** 2) / (4 * a_hol[s]) for s in range(5)]
                V3_p_c = 6 * (pv ** 3) + 30 * (pv ** 2) * uv + 15 * pv * u2 * (2 + s_e)
                rem_sum = Fr(0)
                for s_idx in range(5):
                    lhs_s = (
                        c_DF * pv * sec_DF_w[s_idx] + c_dd * pv * sec_dd_w[s_idx] + mu_w1 * pv * sec_ed_w[s_idx]
                        + 15 * lam3 * (pv * pv) * sec_T2_w[s_idx] + a_hol[s_idx]
                    )
                    cov_s = sum(y_sec[m] * A_sec[m][s_idx] for m in range(M_sec))
                    if lhs_s > cov_s:
                        rem_sum += lhs_s - cov_s
                B_sec = sum(y_sec[m] * b_sec[m] for m in range(M_sec)) + sum(b_hol) + uv * rem_sum
                V3_base = V3_p_c + u3 * (6 + 9 * s_e)
                const_base = lam0 + lam1 + lam2 * (2 + u2 * s_e) + Fr(1, 2) * mu_T * pv + Fr(1, 2) * mu_vr * (pv * pv)
                if s_e == 0:
                    bnd = const_base + lam3 * V3_base + B_sec
                else:
                    pd = r2["par"][end]
                    al = [Fr(x) for x in pd["alpha"]]
                    sb = Fr(pd["sqrt_ub"])
                    eta = Fr(pd["eta"])
                    dJ = [
                        u3 * (
                            l3[1] * (150 * al[0] * VF.S0[i] + (198 + Fr(150) / al[0]) * VF.H0[i])
                            + l3[2] * (Fr(135, 2) * al[1] * VF.S0[i] + (Fr(11781, 32) + Fr(135, 2) / al[1]) * VF.H0[i])
                        )
                        for i in range(5)
                    ]
                    resid = [dlin[i] + sb * dJ[i] - eta * VF.EROW[i] for i in range(5)]
                    for typ, theta, yv in pd["cuts"]:
                        a_ = VF.cut_vector(typ, None if theta is None else Fr(theta))
                        resid = [resid[i] + Fr(yv) * a_[i] for i in range(5)]
                    L_par = eta + sum(max(resid[i], Fr(0)) * VF.PMAX[i] for i in range(5))
                    bnd = (
                        const_base + l3[0] * (V3_base + u3 * VF.C6 * s_e * sb)
                        + (l3[1] + l3[2]) * V3_base + s_e * L_par + B_sec
                    )
                if bnd > worst:
                    worst = bnd
            new_rows.append(r2)
        return worst < R_try, d_cut, new_rows

    hi_i = int(Fr(ray_entry["R"]) * 100000)
    lo_i = 92500
    while lo_i < hi_i:
        mid_i = (lo_i + hi_i) // 2
        ok, _, _ = try_R(Fr(mid_i, 100000))
        if ok:
            hi_i = mid_i
        else:
            lo_i = mid_i + 1
    R_best = Fr(lo_i, 100000)
    ok, dc_best, rows_best = try_R(R_best)
    if ok:
        return dict(kind="stein", abc=list(abc), R=str(R_best), d_cut=str(dc_best), rows=rows_best)
    return ray_entry


def compute_polygon_and_midt(ray_entries):
    """Compute optimal rational t_left, t_right, t_slabs, global claim r_1, and exact degree-5 mid-t cutoffs."""
    rays_info = []
    for entry in ray_entries:
        a_r, b_r, c_r = entry["abc"]
        rays_info.append((Fr(a_r, c_r), Fr(b_r, c_r), Fr(entry["R"])))
    M = len(rays_info)

    # t_right >= sqrt(PI_HI) / 2:
    t_right = VF.root_interval(VF.PI_HI / 4)[1]

    # Intersect consecutive lines s_j(t) = (R_j - ell_j t) / m_j and s_{j+1}(t):
    # (R_j - ell_j t) / m_j = (R_{j+1} - ell_{j+1} t) / m_{j+1}
    # <=> t * (ell_{j+1}/m_{j+1} - ell_j/m_j) = R_{j+1}/m_{j+1} - R_j/m_j
    raw_crossings = []
    for j in range(M - 1):
        l0, m0, R0 = rays_info[j]
        l1, m1, R1 = rays_info[j + 1]
        t_cross = (R1 / m1 - R0 / m0) / (l1 / m1 - l0 / m0)
        raw_crossings.append(t_cross)

    # Choose t_left where 4.18e curve rho0^2 + (1 - c_ell^2) t^2 meets Phi_0(t) = t^2 + ((R_0 - l_0 t)/m_0)^2:
    l0, m0, R0 = rays_info[0]
    lo_t, hi_t = Fr(35, 100), Fr(45, 100)
    for _ in range(50):
        mid = Fr(1, 2) * (lo_t + hi_t)
        lhs_e = VF.RHO0_REV ** 2 + (1 - VF.C_ELL ** 2) * mid * mid
        rhs_0 = mid * mid + ((R0 - l0 * mid) / m0) ** 2
        if lhs_e < rhs_0:
            lo_t = mid
        else:
            hi_t = mid
    t_left = Fr(int(float(Fr(1, 2) * (lo_t + hi_t)) * 10**6), 10**6)

    taus = [t_left]
    for tc in raw_crossings:
        tc_q = Fr(int(round(float(tc) * 10**7)), 10**7)
        tc_q = min(max(tc_q, taus[-1]), t_right)
        taus.append(tc_q)
    taus.append(t_right)

    worst_sq = VF.RHO0_REV ** 2 + (1 - VF.C_ELL ** 2) * t_left * t_left
    for j in range(M):
        lj, mj, Rj = rays_info[j]
        for te in (taus[j], taus[j + 1]):
            s_ub = max(Fr(0), (Rj - lj * te) / mj)
            worst_sq = max(worst_sq, te * te + s_ub * s_ub)

    worst_r = VF.root_interval(worst_sq)[1]
    # Pick clean 3- or 4-decimal rational claim strictly above worst_r:
    claim_1000 = Fr(int(worst_r * 1000) + 1, 1000)
    if claim_1000 * claim_1000 < Fr(9, 32) * VF.PI_LO:
        claim = claim_1000
    else:
        claim = Fr(int(worst_r * 10000) + 1, 10000)

    # Compute exact 8-decimal degree-5 mid-t cutoffs for Parseval and Lean mass:
    e_g = Fr(39, 50)
    eta_g = Fr(779, 10000)
    target_g = Fr(500, 701)
    e_hat = Fr(25, 31)
    m_mass = Fr(2141, 3906)
    S_mass = Fr(3798855002922010337121170986221578569, 22939068096000000000000000000000000000)

    regimes = {
        "parseval": (Fr(34554022, 10**8), eta_g, Fr(1) - eta_g, e_g - eta_g),
        "lean_mass": (
            Fr(35859076, 10**8),
            eta_g * (1 + S_mass / m_mass),
            Fr(1) - eta_g,
            e_g - eta_g * e_hat / m_mass,
        ),
    }
    d5_out = {}
    for rname, (t_ell_end, a0, a2, b2) in regimes.items():
        def min_payoff_at(t_val):
            best_v = None
            best_j = -1
            for j, (lj, mj, Rj) in enumerate(rays_info):
                s_ub = max(Fr(0), (Rj - lj * t_val) / mj)
                vv = a0 + a2 * t_val * t_val + b2 * s_ub * s_ub
                if best_v is None or vv < best_v:
                    best_v = vv
                    best_j = j
            return best_v, best_j

        if min_payoff_at(t_ell_end)[0] >= target_g:
            continue
        lo_i = int(t_ell_end * 10**8)
        hi_i = 50000000
        while lo_i < hi_i:
            mid_i = (lo_i + hi_i + 1) // 2
            if min_payoff_at(Fr(mid_i, 10**8))[0] < target_g:
                lo_i = mid_i
            else:
                hi_i = mid_i - 1
        t_star = Fr(lo_i, 10**8)
        # Partition [t_ell_end, t_star] into segments by active ray j:
        segs = []
        cur_t = t_ell_end
        _, cur_j = min_payoff_at(cur_t)
        step = Fr(5000, 10**8)
        while cur_t < t_star:
            nxt_t = min(t_star, cur_t + step)
            _, nxt_j = min_payoff_at(nxt_t)
            if nxt_j != cur_j:
                # Binary search switch point where both cur_j and nxt_j are < target_g:
                l0, m0, R0 = rays_info[cur_j]
                l1, m1, R1 = rays_info[nxt_j]
                t_sw = (R1 / m1 - R0 / m0) / (l1 / m1 - l0 / m0)
                t_sw = min(max(Fr(int(t_sw * 10**8), 10**8), cur_t), t_star)
                segs.append({"ray_idx": cur_j, "t_hi": str(t_sw)})
                cur_j = nxt_j
                cur_t = t_sw
            else:
                cur_t = nxt_t
        segs.append({"ray_idx": cur_j, "t_hi": str(t_star)})
        d5_out[rname] = {"t_cutoff": str(t_star), "segments": segs}

    return claim, t_left, t_right, taus, d5_out


def main():
    t_start = time.time()
    knot_sets = build_knot_sets()
    knot_sets_json = {k: [str(x) for x in v] for k, v in knot_sets.items()}

    if "--test-ray" in sys.argv:
        idx = int(sys.argv[sys.argv.index("--test-ray") + 1])
        abc, R_init, band = STEIN_RAYS_SPEC[idx]
        entry, R_fin = build_ray_entry(abc, R_init, band, knot_sets)
        print("Single-ray smoke test PASSED! R =", R_fin, "bytes =", len(json.dumps(entry, separators=(",", ":"))))
        return

    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    out_path = args[0] if args else os.path.join(os.path.dirname(os.path.abspath(__file__)), "cert_spiked.json")
    cache_path = out_path + ".raycache.json"
    use_cache = "--use-cache" in sys.argv
    cache = {}
    if use_cache and os.path.exists(cache_path):
        with open(cache_path, encoding="utf-8") as fh:
            cache = json.load(fh)

    ray_entries = []
    for abc, R_init, band in STEIN_RAYS_SPEC:
        key = "%d_%d_%d" % abc
        if key in cache:
            entry = tighten_stein_ray(cache[key])
            print(f"==> Loaded & tightened cached Stein ray abc={abc} (R={entry['R']})", flush=True)
            ray_entries.append(entry)
            continue
        entry, _ = build_ray_entry(abc, R_init, band, knot_sets)
        entry = tighten_stein_ray(entry)
        print(f"    Tightened ray abc={abc} -> R={entry['R']}", flush=True)
        ray_entries.append(entry)
        if use_cache:
            cache[key] = entry
            with open(cache_path, "w", encoding="utf-8") as fh:
                json.dump(cache, fh, separators=(",", ":"))

    for abc in ANALYTIC_RAYS_ABC:
        a_r, b_r, c_r = abc
        uv = Fr(b_r * b_r, c_r * c_r)
        env_hi = VF.envelope(uv)[1]
        # Round up env_hi to 10^-6 for compact JSON string:
        R_an = Fr((env_hi.numerator * 10**6 + env_hi.denominator - 1) // env_hi.denominator, 10**6)
        assert env_hi <= R_an
        ray_entries.append(dict(kind="analytic_418g", abc=list(abc), R=str(R_an)))

    claim, t_left, t_right, taus, d5_out = compute_polygon_and_midt(ray_entries)
    cert = dict(
        statement=(
            "For every n >= 1, ell >= 0, and G in H_{2,1}(C^n), "
            "(1/2)(E|ell z_1 + G| + E|ell z_1 - G|) <= (%s) * sqrt(ell^2 + ||G||_2^2) < sqrt(9*pi/32) * sqrt(ell^2 + ||G||_2^2)."
            % claim
        ),
        claim=str(claim),
        c_bank=C_BANK_STR,
        t_left=str(t_left),
        t_right=str(t_right),
        t_slabs=[str(x) for x in taus],
        knot_sets=knot_sets_json,
        rays=ray_entries,
        degree5_midt=d5_out,
    )
    raw = json.dumps(cert, separators=(",", ":"))
    with open(out_path, "w", encoding="utf-8") as fh:
        fh.write(raw)
    sz = os.path.getsize(out_path)
    print(f"\nWrote {out_path} ({sz} bytes = {sz/1024:.1f} KB in {time.time() - t_start:.1f}s). Running full stdlib verify.py...")
    VF.verify_certificate(json.loads(raw), quiet=False)


if __name__ == "__main__":
    main()
