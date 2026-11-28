#!/usr/bin/env python3
"""Standalone generator for both KCS458 certificates (`cert_v3_458.json` and `cert_v5_458.json`).

Usage:
    /usr/local/bin/python3 make_certs.py
"""
from fractions import Fraction as Fr
import json
from math import isqrt
import pathlib
import sys
import time

import clarabel
import numpy as np
import scipy.sparse as sp

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import verify as V1
import verify_bernstein as VB

SQ2 = np.sqrt(2.0)

# 40 intervals (41 exact rational knots in (1/20) Z covering [0, 14]) for V_3(R^n):
R_KNOTS_V3 = (
    [Fr(k, 20) for k in range(0, 16)]
    + [Fr(16 + 2 * k, 20) for k in range(0, 8)]
    + [Fr(17 + 2 * k, 10) for k in range(0, 6)]
    + [Fr(30, 10), Fr(34, 10), Fr(39, 10), Fr(45, 10), Fr(52, 10), Fr(60, 10),
       Fr(70, 10), Fr(82, 10), Fr(96, 10), Fr(115, 10), Fr(140, 10)]
)

SLABS_V3 = [
    (Fr(0), Fr(2, 5)),
    (Fr(2, 5), Fr(9, 10)),
    (Fr(9, 10), Fr(3, 2)),
    (Fr(3, 2), Fr(11, 5)),
    (Fr(11, 5), Fr(3)),
    (Fr(3), Fr(4)),
    (Fr(4), Fr(5)),
    (Fr(5), Fr(11, 2)),
    (Fr(11, 2), Fr(6)),
    (Fr(6), Fr(15, 2)),
    (Fr(15, 2), Fr(19, 2)),
    (Fr(19, 2), Fr(12)),
    (Fr(12), Fr(15)),
    (Fr(15), Fr(19)),
    (Fr(19), Fr(24)),
    (Fr(24), Fr(31)),
    (Fr(31), Fr(39)),
    (Fr(39), Fr(49)),
    (Fr(49), Fr(61)),
    (Fr(61), Fr(75)),
    (Fr(75), Fr(90)),
]

# 52 intervals (53 exact rational knots in (1/100) Z covering [0, 30]) for V_5(R^n):
R_KNOTS_V5 = (
    [Fr(k, 100) for k in range(0, 20)]        # 0.00 .. 0.19 (step 1/100)
    + [Fr(21, 100), Fr(24, 100), Fr(28, 100), Fr(33, 100), Fr(39, 100),
       Fr(46, 100), Fr(54, 100), Fr(64, 100), Fr(76, 100), Fr(90, 100),
       Fr(106, 100), Fr(125, 100), Fr(147, 100), Fr(172, 100), Fr(200, 100),
       Fr(232, 100), Fr(268, 100), Fr(310, 100), Fr(360, 100), Fr(420, 100),
       Fr(490, 100), Fr(570, 100), Fr(660, 100), Fr(770, 100), Fr(900, 100),
       Fr(1060, 100), Fr(1250, 100), Fr(1500, 100), Fr(1800, 100), Fr(2150, 100),
       Fr(2550, 100), Fr(3000, 100)]
)

SLABS_V5 = [
    (Fr(0), Fr(1, 2)),
    (Fr(1, 2), Fr(2)),
    (Fr(2), Fr(6)),
    (Fr(6), Fr(15)),
    (Fr(15), Fr(39)),
    (Fr(39), Fr(120)),
    (Fr(120), Fr(360)),
    (Fr(360), Fr(900)),
    (Fr(900), Fr(1800)),
    (Fr(1800), Fr(3000)),
    (Fr(3000), Fr(4650)),
]

SLABS_H32_SLICE = [
    (Fr(0), Fr(1, 2)),
    (Fr(1, 2), Fr(2)),
    (Fr(2), Fr(6)),
    (Fr(6), Fr(15)),
    (Fr(15), Fr(39)),
]


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

    def add_eq(self, terms, rhs=0.0):
        self._append_row(terms, rhs)
        self.cones.append(clarabel.ZeroConeT(1))

    def add_nonneg(self, const, terms):
        self._append_row(terms, const)
        self.cones.append(clarabel.NonnegativeConeT(1))

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

    def solve(self, obj_terms):
        q = np.zeros(self.nvars)
        for col, val in obj_terms:
            q[int(col)] += float(val)
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
        settings.max_iter = 600
        return clarabel.DefaultSolver(P, q, A, b, merged, settings).solve()


def build_hat_basis_r(knots, r_pts):
    K_len = len(knots)
    Phi = np.zeros((K_len, len(r_pts)))
    G = np.zeros((K_len, len(r_pts)))
    for k in range(K_len):
        if k > 0:
            a, b = knots[k - 1], knots[k]
            x = np.clip(r_pts, a, b)
            Phi[k] += np.where((r_pts > a) & (r_pts <= b), (r_pts - a) / (b - a), 0.0)
            G[k] += (x - a) ** 2 / (2.0 * (b - a))
        if k < K_len - 1:
            a, b = knots[k], knots[k + 1]
            x = np.clip(r_pts, a, b)
            Phi[k] += np.where((r_pts > a) & (r_pts <= b), (b - r_pts) / (b - a), 0.0)
            G[k] += (x - a) - (x - a) ** 2 / (2.0 * (b - a))
            if k == 0:
                Phi[k] += np.where(r_pts <= a, 1.0, 0.0)
        else:
            Phi[k] += np.where(r_pts > knots[k], 1.0, 0.0)
            G[k] += np.maximum(r_pts - knots[k], 0.0)
    return Phi, G


def sc_terms(terms, sc):
    return [(c, sc * v) for c, v in terms]


def s32_hi_fr(s_fr, S_SIG=10**9):
    if s_fr == 0:
        return Fr(0)
    n3, d3 = s_fr.numerator ** 3, s_fr.denominator ** 3
    num_scaled = (n3 * (S_SIG ** 2) + d3 - 1) // d3
    sq = isqrt(num_scaled - 1) + 1 if num_scaled > 0 else 0
    return Fr(sq, S_SIG)


def sqrt_ub_fr(q_fr, prec=10**8):
    if q_fr == 0:
        return Fr(0)
    ns = (q_fr.numerator * prec * prec + q_fr.denominator - 1) // q_fr.denominator
    sq = isqrt(ns - 1) + 1 if ns > 0 else 0
    return Fr(sq, prec)


def poly_eval_np(p, xs):
    res = np.zeros_like(xs, dtype=float)
    for c in reversed(p):
        res = res * xs + float(c)
    return res


def quantize_cs_int(vals_raw, knots_fr, kden):
    """Exact integer compact-support balancing for either (1/20)Z V_3 knots or (1/100)Z V_5 knots."""
    K = len(knots_fr) - 1
    ints = [int(round(float(vals_raw[j]) * kden)) for j in range(K)] + [0]
    if knots_fr[1] == Fr(1, 20):
        w20 = [int(20 * (knots_fr[j + 1] - knots_fr[j])) for j in range(K)]
        s40 = sum((ints[j] + ints[j + 1]) * w20[j] for j in range(K))
        assert w20[15] + w20[16] == 3
        if s40 % 2 != 0:
            step16 = 1 if s40 > 0 else -1
            ints[16] -= step16
            s40 -= 3 * step16
        rem2 = s40 // 2
        q14, r14 = divmod(rem2, 14)
        for j in range(1, 15):
            ints[j] -= q14 + (1 if (j - 1) < r14 else 0)
    else:
        w100 = [int(100 * (knots_fr[j + 1] - knots_fr[j])) for j in range(K)]
        s200 = sum((ints[j] + ints[j + 1]) * w100[j] for j in range(K))
        assert w100[18] + w100[19] == 3
        if s200 % 2 != 0:
            step19 = 1 if s200 > 0 else -1
            ints[19] -= step19
            s200 -= 3 * step19
        rem2 = s200 // 2
        q18, r18 = divmod(rem2, 18)
        for j in range(1, 19):
            ints[j] -= q18 + (1 if (j - 1) < r18 else 0)
    chk = sum(Fr(1, 2) * (Fr(ints[j], kden) + Fr(ints[j + 1], kden)) * (knots_fr[j + 1] - knots_fr[j]) for j in range(K))
    assert chk == 0
    return ints


# ==============================================================================
# GENERATOR 1: ENHANCED V_3(R^n) SLAB ROW (`cert_v3_458.json`)
# ==============================================================================
def build_v3_row(s_lo_fr, s_hi_fr, pad=5.0e-6, kden=10**9):
    knots_fr = R_KNOTS_V3
    knots = np.array([float(x) for x in knots_fr])
    K = len(knots) - 1

    sig_lo_fr, sig_hi_fr = s32_hi_fr(s_lo_fr), s32_hi_fr(s_hi_fr)
    sqrt_m_ub_fr = sqrt_ub_fr(s_hi_fr / Fr(36), prec=10**8)
    s_mid_fr = (s_lo_fr + s_hi_fr) / 2
    r_anch_fr = Fr(isqrt((s_mid_fr.numerator * (10**12)) // s_mid_fr.denominator), 10**6)
    if r_anch_fr * r_anch_fr < s_lo_fr:
        r_anch_fr = sqrt_ub_fr(s_lo_fr, prec=10**6)
    assert s_lo_fr <= r_anch_fr * r_anch_fr <= s_hi_fr

    x_lo_fr = Fr(0) if s_lo_fr <= Fr(36) else Fr(isqrt((((s_lo_fr - Fr(36)) / Fr(54)).numerator * 10**12) // ((s_lo_fr - Fr(36)) / Fr(54)).denominator), 10**6)

    lob11 = 0.5 * (1.0 - np.cos(np.pi * np.arange(11) / 10.0))
    int_pts, r_all = [], []
    for k in range(K):
        pts = knots[k] + (knots[k + 1] - knots[k]) * lob11
        int_pts.append(list(range(len(r_all), len(r_all) + len(pts))))
        r_all.extend(pts)
    tail_pts = np.concatenate([np.linspace(14.0, 50.0, 28), 14.0 * np.geomspace(3.7, 2500.0, 32)])
    tail_idxs = list(range(len(r_all), len(r_all) + len(tail_pts)))
    r_all.extend(tail_pts)
    r_all = np.array(r_all)
    Phi, G = build_hat_basis_r(knots, r_all)
    G_R = build_hat_basis_r(knots, np.array([knots[K]]))[1][:, 0]

    cb = ConicBuilder()
    t_obj = cb.var()
    lam0, lam1, lam2, lam3 = cb.var(), cb.var(), cb.var(), cb.var()
    cb.add_nonneg(-2.0e-8 * 1e5, [(lam3, 1.0)])
    m00, m01, m11 = cb.var(), cb.var(), cb.var()
    mu00, mu01, mu11 = cb.var(), cb.var(), cb.var()
    cb.add_psd(2, [(-pad, [(mu00, 1.0)]), (0.0, [(mu01, 1.0)]), (-pad, [(mu11, 1.0)])])
    gam_vt, gam_ve = cb.var(), cb.var()

    lam_nu2 = cb.var()
    cb.add_nonneg(-1.0e-6, [(lam_nu2, 1.0)])
    lam_e3, lam_e4, delta_m11 = cb.var(), cb.var(), cb.var()
    cb.add_nonneg(0.0, [(lam_e3, -1.0)])
    cb.add_nonneg(-1.0e-6, [(lam_e4, 1.0)])
    cb.add_psd(2, [(-1.0e-7, [(lam_e4, 1.0)]), (0.0, [(lam_e3, 0.5)]), (-1.0e-7, [(delta_m11, 1.0)])])
    # Require m11 - delta_m11 >= pad and [[m00, m01], [m01, m11 - delta_m11]] > 0:
    cb.add_psd(2, [(-pad, [(m00, 1.0)]), (0.0, [(m01, 1.0)]), (-pad, [(m11, 1.0), (delta_m11, -1.0)])])

    c_br1 = cb.var(K + 1)
    c_br2 = cb.var(K); cb.add_eq([(c_br2[k], G_R[k]) for k in range(K)], 0.0)
    c_br3 = cb.var(K); cb.add_eq([(c_br3[k], G_R[k]) for k in range(K)], 0.0)
    c_br4 = cb.var(K - 1)
    c_br7 = cb.var(K - 1)

    lB_kn = cb.var(K + 1)
    Ae_kn = cb.var(K + 1)
    t2_kn = cb.var(K + 1)
    lnu0_kn = cb.var(K + 1)
    lnu_op_kn = cb.var(K + 1)
    alpha_kn = cb.var(K + 1)
    for k in range(K + 1):
        cb.add_nonneg(-pad, [(Ae_kn[k], 1.0)])
        cb.add_nonneg(-pad, [(t2_kn[k], 1.0)])
        cb.add_nonneg(-pad, [(alpha_kn[k], 1.0)])

    tau3_c = [cb.var(5) for _ in range(K)]
    nu0_sq_c = [cb.var(3) for _ in range(K)]
    op_c = [cb.var(3) for _ in range(K)]
    xt_tail0, xt_tail2, xe_tail0, xe_tail2 = cb.var(), cb.var(), cb.var(), cb.var()
    for xv in (xt_tail0, xt_tail2, xe_tail0, xe_tail2):
        cb.add_nonneg(0.0, [(xv, 1.0)])
    xi_e_kn = cb.var(K + 1); xi_te_kn = cb.var(K + 1)
    for k in range(K + 1):
        cb.add_nonneg(0.0, [(xi_e_kn[k], 1.0)])
        cb.add_nonneg(0.0, [(xi_te_kn[k], 1.0)])

    sc = np.sqrt(3.0) / 4.0
    sqrt_m_fl = float(sqrt_m_ub_fr)
    for k in range(K):
        for w1 in (0.0, 0.5, 1.0):
            w0 = 1.0 - w1
            cb.add_psd(2, [
                (-pad, [(Ae_kn[k], w0), (Ae_kn[k + 1], w1)]),
                (0.0, [(lB_kn[k], np.sqrt(1.5) * w0), (lB_kn[k + 1], np.sqrt(1.5) * w1)]),
                (-pad, [(t2_kn[k], w0), (t2_kn[k + 1], w1)]),
            ])

    for k in range(K):
        for idx_r in int_pts[k]:
            rv = r_all[idx_r]; Vv = rv * rv; V2v = Vv * Vv; V3v = V2v * Vv
            w1 = (rv - knots[k]) / (knots[k + 1] - knots[k]); w0 = 1.0 - w1
            h4_terms = [(c_br4[j - 1], -(G_R[j] - G[j, idx_r])) for j in range(1, K)]
            h7_terms = [(c_br7[j - 1], -(G_R[j] - G[j, idx_r])) for j in range(1, K)]
            L_sig = [(c_br2[j], 2.0 * G[j, idx_r]) for j in range(K)] + [(c_br4[j - 1], 2.0 * Phi[j, idx_r]) for j in range(1, K)]
            L_nu = [(c_br3[j], 2.0 * G[j, idx_r]) for j in range(K)] + [(c_br7[j - 1], 2.0 * Phi[j, idx_r]) for j in range(1, K)]
            lB_here = [(lB_kn[k], w0), (lB_kn[k + 1], w1)]
            lnu0_here = [(lnu0_kn[k], w0), (lnu0_kn[k + 1], w1)]
            lnu_op_here = [(lnu_op_kn[k], w0), (lnu_op_kn[k + 1], w1)]
            alpha_here = [(alpha_kn[k], w0), (alpha_kn[k + 1], w1)]
            lA_here = L_sig + [(col, -val) for col, val in lB_here]
            Lnu_rem = L_nu + [(col, -val) for col, val in lnu0_here] + [(col, -val) for col, val in lnu_op_here]
            tau3_here = [(tau3_c[k][m], w1 ** m) for m in range(5)]
            nu0_sq_here = [(nu0_sq_c[k][m], w1 ** m) for m in range(3)]
            op_c_here = [(op_c[k][m], w1 ** m) for m in range(3)]

            cb.add_psd(3, [
                (0.0, [(mu00, 1.0)]), (0.0, [(mu01, 1.0)]), (0.0, [(mu11, 1.0)]),
                (0.0, sc_terms(lA_here, sc)), (0.0, sc_terms(Lnu_rem, sc)), (-pad, tau3_here),
            ])
            cb.add_psd(2, [(0.0, [(lam_nu2, 1.0)]), (0.0, sc_terms(lnu0_here, 0.5)), (-pad, nu0_sq_here)])
            cb.add_psd(2, [(0.0, alpha_here), (0.0, sc_terms(lnu_op_here, 0.5)), (-pad, op_c_here)])

            ae_term = [(Ae_kn[k], -w0), (Ae_kn[k + 1], -w1)]
            tl2_term = [(t2_kn[k], -w0), (t2_kn[k + 1], -w1)]
            tl3_term = [(col, -val) for col, val in tau3_here]
            xe_here = [(xi_e_kn[k], w0), (xi_e_kn[k + 1], w1)]
            xte_here = [(xi_te_kn[k], w0), (xi_te_kn[k + 1], w1)]

            c_1 = [(lam0, 1.0), (lam1, Vv), (lam2, 1e-2 * V2v), (lam3, 1e-5 * V3v),
                   (m00, 1.0), (m01, 2.0), (m11, 1.0), (delta_m11, -1.0), (gam_vt, -Vv), (gam_ve, -Vv)]
            c_1 += [(col, -val) for col, val in nu0_sq_here] + [(col, -val) for col, val in op_c_here]
            c_1 += [(c_br1[j], -3.0 * rv * G[j, idx_r]) for j in range(K + 1)]
            c_1 += [(c_br2[j], +3.0 * rv * G[j, idx_r]) for j in range(K)]
            c_1 += [(c_br3[j], +3.0 * rv * G[j, idx_r]) for j in range(K)]
            c_1 += [(col, +2.0 * val) for col, val in h7_terms]

            c_tau = [(m00, -2.0), (m01, -2.0), (gam_vt, Vv)] + tl3_term
            c_tau += [(c_br1[j], 3.0 * Phi[j, idx_r]) for j in range(K + 1)]
            c_tau += [(c_br2[j], -3.0 * Phi[j, idx_r] - 3.0 * rv * G[j, idx_r]) for j in range(K)]
            c_tau += [(c_br3[j], -3.0 * Phi[j, idx_r]) for j in range(K)]
            c_tau += [(col, -4.0 * val) for col, val in h4_terms]

            c_eta = [(m01, -2.0), (m11, -2.0), (delta_m11, 2.0), (gam_ve, Vv)] + ae_term + [(col, -val) for col, val in xe_here]
            c_eta += [(c_br3[j], -3.0 * rv * G[j, idx_r]) for j in range(K)]
            c_eta += [(col, +4.0 * val) for col, val in h4_terms] + [(col, -2.0 * val) for col, val in h7_terms]

            c_tau2 = [(m00, 1.0)] + tl2_term + [(c_br2[j], 3.0 * Phi[j, idx_r]) for j in range(K)]
            c_te = [(m01, 2.0)] + [(col, -val) for col, val in xte_here] + sc_terms(alpha_here, -3.0 * sqrt_m_fl) + [(c_br3[j], 3.0 * Phi[j, idx_r]) for j in range(K)]
            c_eta2 = [(m11, 1.0), (delta_m11, -1.0)]

            S_fac = (1.0 + 0.05 * Vv) ** 1.5
            cb.add_psd(3, [
                (-rv / (S_fac * S_fac) - 1.5 * pad, sc_terms(c_1, 1.0 / (S_fac * S_fac))),
                (0.0, sc_terms(c_tau, 0.5 / S_fac)), (-pad, c_tau2),
                (0.0, sc_terms(c_eta, 0.5 / S_fac)), (0.0, sc_terms(c_te, 0.5)), (-pad, c_eta2),
            ])

    for idx_r in tail_idxs:
        rv = r_all[idx_r]; Vv = rv * rv; V2v = Vv * Vv; V3v = V2v * Vv
        xt_here = [(xt_tail0, 1.0), (xt_tail2, 1e-3 * (Vv - knots[K]**2))]
        xe_here = [(xe_tail0, 1.0), (xe_tail2, 1e-3 * (Vv - knots[K]**2))]
        xte_here = [(xi_te_kn[K], 1.0)]
        c_1 = [(lam0, 1.0), (lam1, Vv), (lam2, 1e-2 * V2v), (lam3, 1e-5 * V3v),
               (m00, 1.0), (m01, 2.0), (m11, 1.0), (delta_m11, -1.0), (gam_vt, -Vv), (gam_ve, -Vv)]
        c_1 += [(c_br1[j], -3.0 * rv * G[j, idx_r]) for j in range(K + 1)]
        c_tau = [(m00, -2.0), (m01, -2.0), (gam_vt, Vv), (c_br1[K], 3.0)] + [(col, -val) for col, val in xt_here]
        c_eta = [(m01, -2.0), (m11, -2.0), (delta_m11, 2.0), (gam_ve, Vv)] + [(col, -val) for col, val in xe_here]
        c_tau2 = [(m00, 1.0)]; c_te = [(m01, 2.0)] + [(col, -val) for col, val in xte_here]; c_eta2 = [(m11, 1.0), (delta_m11, -1.0)]
        S_fac = (1.0 + 0.05 * Vv) ** 1.5
        cb.add_psd(3, [
            (-rv / (S_fac * S_fac) - 1.5 * pad, sc_terms(c_1, 1.0 / (S_fac * S_fac))),
            (0.0, sc_terms(c_tau, 0.5 / S_fac)), (-pad, c_tau2),
            (0.0, sc_terms(c_eta, 0.5 / S_fac)), (0.0, sc_terms(c_te, 0.5)), (-pad, c_eta2),
        ])

    xs_samp = np.linspace(float(x_lo_fr), 1.0, 60)
    r_anch_fl = float(r_anch_fr)
    s_mid_fl = float(s_mid_fr)
    for s_fr, sig_fr in ((s_lo_fr, sig_lo_fr), (s_hi_fr, sig_hi_fr)):
        sv, sig_sec_v = float(s_fr), float(sig_fr)
        sig_tan_v = 1.5 * r_anch_fl * sv - 0.5 * (r_anch_fl ** 3)
        ssq_sec_v = float(s_lo_fr + s_hi_fr) * sv - float(s_lo_fr * s_hi_fr)
        ssq_tan_v = 2.0 * s_mid_fl * sv - s_mid_fl * s_mid_fl
        s52_sec_v = sv * sig_sec_v
        for xv in xs_samp:
            qv = 36.0 + 54.0 * xv * xv
            mv, uv = sv / qv, sv * xv * xv / qv
            p6v = 216.0 * (67.5 * xv**3 + 45.0 * xv**2 + 150.0 * xv)
            for theta in (0.0, 1.0):
                t3_pos = (1.0 - theta) * (ssq_sec_v / (qv**2)) + theta * (sig_sec_v / (qv**1.5))
                t3_neg = (1.0 - theta) * (ssq_tan_v / (qv**2)) + theta * (sig_tan_v / (qv**1.5))
                e4_ub = (12.0 + 48.0 * theta) * (ssq_sec_v / (qv**2)) + 48.0 * (1.0 - theta) * (s52_sec_v / (qv**2.5))
                cb.add_nonneg(0.0, [
                    (t_obj, 1.0),
                    (lam0, -1.0), (lam1, -1.0), (lam2, -1e-2 * (3.0 + sv)),
                    (lam3, -1e-5 * (15.0 + 15.0 * sv + sig_sec_v * p6v / (qv**1.5) - 4320.0 * t3_neg)),
                    (gam_vt, -(sv / 3.0)), (gam_ve, -(6.0 * mv)),
                    (m00, -(8.0 * mv + 6.0 * uv)), (m01, -(8.0 * mv)), (m11, -(2.0 * mv)),
                    (mu00, -(16.0 * mv + 24.0 * uv)), (mu01, -(16.0 * mv)), (mu11, -(4.0 * mv)),
                    (lam_nu2, -(9.0 * t3_pos + 6.0 * (sig_sec_v / (qv**1.5)))),
                    (lam_e3, -(8.0 * t3_neg)),
                    (lam_e4, -e4_ub),
                ])

    sol = cb.solve([(t_obj, 1.0)])
    x_sol = np.array(sol.x, dtype=float)
    q_int = lambda v: int(round(float(v) * kden))

    phi1_i = [q_int(x_sol[c_br1[j]]) for j in range(K + 1)]
    phi2_i = quantize_cs_int([x_sol[c_br2[j]] for j in range(K)], knots_fr, kden)
    phi3_i = quantize_cs_int([x_sol[c_br3[j]] for j in range(K)], knots_fr, kden)
    psi4_i = [0] + [q_int(x_sol[c_br4[j]]) for j in range(K - 1)] + [0]
    psi7_i = [0] + [q_int(x_sol[c_br7[j]]) for j in range(K - 1)] + [0]
    lB_i = [q_int(x_sol[lB_kn[j]]) for j in range(K + 1)]
    Ae_i = [max(10, q_int(x_sol[Ae_kn[j]])) for j in range(K + 1)]
    t2_i = [max(10, q_int(x_sol[t2_kn[j]])) for j in range(K + 1)]
    lnu0_i = [q_int(x_sol[lnu0_kn[j]]) for j in range(K + 1)]
    lnu_op_i = [q_int(x_sol[lnu_op_kn[j]]) for j in range(K + 1)]
    alpha_i = [max(10, q_int(x_sol[alpha_kn[j]])) for j in range(K + 1)]

    tau3_i = [[q_int(x_sol[tau3_c[k][m]]) for m in range(5)] for k in range(K)]
    nu0_sq_i = [[q_int(x_sol[nu0_sq_c[k][m]]) for m in range(3)] for k in range(K)]
    op_c_i = [[q_int(x_sol[op_c[k][m]]) for m in range(3)] for k in range(K)]
    xt0_q = max(Fr(0), Fr(int(round(float(x_sol[xt_tail0]) * 10**12)), 10**12))
    xt2_q = max(Fr(0), Fr(int(round(float(1e-3 * x_sol[xt_tail2]) * 10**14)), 10**14))
    xe0_q = max(Fr(0), Fr(int(round(float(x_sol[xe_tail0]) * 10**12)), 10**12))
    xe2_q = max(Fr(0), Fr(int(round(float(1e-3 * x_sol[xe_tail2]) * 10**14)), 10**14))
    xe_i = [max(0, q_int(x_sol[xi_e_kn[j]])) for j in range(K + 1)]
    xte_i = [max(0, q_int(x_sol[xi_te_kn[j]])) for j in range(K + 1)]

    lam0_q = Fr(q_int(x_sol[lam0] + 1.0e-6), kden)
    lam1_q = Fr(q_int(x_sol[lam1]), kden)
    lam2_q = Fr(int(round(float(1e-2 * x_sol[lam2]) * 10**12)), 10**12)
    lam3_q = max(Fr(1, 10**13), Fr(int(round(float(1e-5 * x_sol[lam3]) * 10**13)), 10**13))
    m00_q, m01_q, m11_q = Fr(q_int(x_sol[m00]), kden), Fr(q_int(x_sol[m01]), kden), Fr(q_int(x_sol[m11]), kden)
    mu00_q, mu01_q, mu11_q = Fr(q_int(x_sol[mu00]), kden), Fr(q_int(x_sol[mu01]), kden), Fr(q_int(x_sol[mu11]), kden)
    gvt_q, gve_q = Fr(q_int(x_sol[gam_vt]), kden), Fr(q_int(x_sol[gam_ve]), kden)

    lam_nu2_q = max(Fr(1, 10**9), Fr(q_int(x_sol[lam_nu2]), kden))
    lam_e4_q = max(Fr(1, 10**9), Fr(q_int(x_sol[lam_e4]), kden))
    lam_e3_q = min(Fr(0), Fr(q_int(x_sol[lam_e3]), kden))
    # Exact minimal rational delta_m11_q >= lam_e3_q^2 / (4 * lam_e4_q):
    dm11_exact = (lam_e3_q * lam_e3_q) / (4 * lam_e4_q)
    delta_m11_q = Fr((dm11_exact.numerator * kden + dm11_exact.denominator - 1) // dm11_exact.denominator, kden)
    if m11_q - delta_m11_q <= Fr(1, 10**6):
        m11_q = delta_m11_q + Fr(1, 10**5)
    while m00_q * (m11_q - delta_m11_q) - m01_q * m01_q <= 0:
        m00_q += Fr(1, 10**5)

    Dw = mu00_q * mu11_q - mu01_q * mu01_q
    phi1_q, phi2_q, phi3_q = ([Fr(x, kden) for x in arr] for arr in (phi1_i, phi2_i, phi3_i))
    psi4_q, psi7_q = ([Fr(x, kden) for x in arr] for arr in (psi4_i, psi7_i))
    lB_q, Ae_q = [Fr(x, kden) for x in lB_i], [Fr(x, kden) for x in Ae_i]
    lnu0_q, lnu_op_q, alpha_q = ([Fr(x, kden) for x in arr] for arr in (lnu0_i, lnu_op_i, alpha_i))
    xe_q, xte_q = [Fr(x, kden) for x in xe_i], [Fr(x, kden) for x in xte_i]

    h4_0 = -sum(Fr(1, 2) * (psi4_q[j] + psi4_q[j + 1]) * (knots_fr[j + 1] - knots_fr[j]) for j in range(K))
    h7_0 = -sum(Fr(1, 2) * (psi7_q[j] + psi7_q[j + 1]) * (knots_fr[j + 1] - knots_fr[j]) for j in range(K))
    rv_p = [Fr(0), Fr(1)]

    # Pass 1: Polish t2_i, nu0_sq_i[k][0], op_c_i[k][0], and tau3_i[k][0]:
    G2_v, G3_v, H4_v, H7_v = Fr(0), Fr(0), h4_0, h7_0
    for k in range(K):
        a_lo, b_hi = knots_fr[k], knots_fr[k + 1]
        lin_p = lambda arr, k=k, a_lo=a_lo, b_hi=b_hi: V1.ptrim([arr[k] - ((arr[k + 1] - arr[k]) / (b_hi - a_lo)) * a_lo, (arr[k + 1] - arr[k]) / (b_hi - a_lo)])
        p2, p3, ps4, ps7 = lin_p(phi2_q), lin_p(phi3_q), lin_p(psi4_q), lin_p(psi7_q)
        g2, g3 = V1.pprim(p2, a_lo, G2_v), V1.pprim(p3, a_lo, G3_v)
        h4, h7 = V1.pprim(ps4, a_lo, H4_v), V1.pprim(ps7, a_lo, H7_v)
        lb_p, ae_p = lin_p(lB_q), lin_p(Ae_q)
        lnu0_p, lnu_op_p, alpha_p = lin_p(lnu0_q), lin_p(lnu_op_q), lin_p(alpha_q)
        p_w1 = V1.pscale([-a_lo, Fr(1)], Fr(1) / (b_hi - a_lo))

        while True:
            t2_q_loc = [Fr(t2_i[k], kden), Fr(t2_i[k + 1], kden)]
            sl_t2 = (t2_q_loc[1] - t2_q_loc[0]) / (b_hi - a_lo)
            t2_p = V1.ptrim([t2_q_loc[0] - sl_t2 * a_lo, sl_t2])
            if V1.positive_on(V1.psub(V1.pmul(ae_p, t2_p), V1.pscale(V1.pmul(lb_p, lb_p), Fr(3, 2))), a_lo, b_hi):
                break
            t2_i[k] += max(1, kden // 10**6)
            t2_i[k + 1] += max(1, kden // 10**6)

        while True:
            nu0_p = V1.padd([Fr(nu0_sq_i[k][0], kden)], V1.padd(V1.pscale(p_w1, Fr(nu0_sq_i[k][1], kden)), V1.pscale(V1.pmul(p_w1, p_w1), Fr(nu0_sq_i[k][2], kden))))
            if V1.positive_on(V1.psub(V1.pscale(nu0_p, 4 * lam_nu2_q), V1.pmul(lnu0_p, lnu0_p)), a_lo, b_hi):
                break
            rs_g = np.linspace(float(a_lo), float(b_hi), 200)
            req = float(np.max(poly_eval_np(V1.pmul(lnu0_p, lnu0_p), rs_g) / (4.0 * float(lam_nu2_q)) - poly_eval_np(nu0_p, rs_g)))
            nu0_sq_i[k][0] += max(5, int(np.ceil((max(0.0, req) + 2e-7) * kden)))

        while True:
            opc_p = V1.padd([Fr(op_c_i[k][0], kden)], V1.padd(V1.pscale(p_w1, Fr(op_c_i[k][1], kden)), V1.pscale(V1.pmul(p_w1, p_w1), Fr(op_c_i[k][2], kden))))
            if V1.positive_on(V1.psub(V1.pscale(V1.pmul(alpha_p, opc_p), Fr(4)), V1.pmul(lnu_op_p, lnu_op_p)), a_lo, b_hi):
                break
            rs_g = np.linspace(float(a_lo), float(b_hi), 200)
            req = float(np.max(poly_eval_np(V1.pmul(lnu_op_p, lnu_op_p), rs_g) / np.maximum(1e-12, 4.0 * poly_eval_np(alpha_p, rs_g)) - poly_eval_np(opc_p, rs_g)))
            op_c_i[k][0] += max(5, int(np.ceil((max(0.0, req) + 2e-7) * kden)))

        Lsig, Lnu = V1.pscale(V1.padd(g2, ps4), Fr(2)), V1.pscale(V1.padd(g3, ps7), Fr(2))
        Lnu_rem = V1.psub(V1.psub(Lnu, lnu0_p), lnu_op_p)
        lA_p = V1.psub(Lsig, lb_p)
        q_form = V1.padd(V1.psub(V1.pscale(V1.pmul(lA_p, lA_p), mu11_q), V1.pscale(V1.pmul(lA_p, Lnu_rem), 2 * mu01_q)), V1.pscale(V1.pmul(Lnu_rem, Lnu_rem), mu00_q))
        T3_exact = V1.pscale(q_form, Fr(3) / (16 * Dw))

        while True:
            T3_p, pw = [], [Fr(1)]
            for m in range(5):
                T3_p = V1.padd(T3_p, V1.pscale(pw, Fr(tau3_i[k][m], kden)))
                pw = V1.pmul(pw, p_w1)
            if V1.positive_on(V1.psub(T3_p, T3_exact), a_lo, b_hi):
                break
            rs_g = np.linspace(float(a_lo), float(b_hi), 300)
            min_d = float(np.min(poly_eval_np(V1.psub(T3_p, T3_exact), rs_g)))
            tau3_i[k][0] += max(10, int(np.ceil((max(0.0, -min_d) + 3e-7) * kden)))

        G2_v, G3_v, H4_v, H7_v = V1.peval(g2, b_hi), V1.peval(g3, b_hi), V1.peval(h4, b_hi), V1.peval(h7, b_hi)

    t2_q = [Fr(x, kden) for x in t2_i]
    tau3_q = [[Fr(x, kden) for x in sub] for sub in tau3_i]
    nu0_sq_q = [[Fr(x, kden) for x in sub] for sub in nu0_sq_i]
    op_c_q = [[Fr(x, kden) for x in sub] for sub in op_c_i]

    # Pass 2: Polish M2 > 0 and M3 > 0:
    for _ in range(12):
        m11_eff = m11_q - delta_m11_q
        G1_v, G2_v, G3_v, H4_v, H7_v = Fr(0), Fr(0), Fr(0), h4_0, h7_0
        any_fail = False
        b0_max, b2_max, b3_max = Fr(0), Fr(0), Fr(0)
        for k in range(K + 1):
            tail = (k == K)
            a_lo = knots_fr[k]
            b_hi = None if tail else knots_fr[k + 1]
            lin_p = (lambda arr: V1.ptrim([arr[K]])) if tail else (lambda arr, k=k, a_lo=a_lo, b_hi=b_hi: V1.ptrim([arr[k] - ((arr[k + 1] - arr[k]) / (b_hi - a_lo)) * a_lo, (arr[k + 1] - arr[k]) / (b_hi - a_lo)]))
            p1, xte_p = lin_p(phi1_q), lin_p(xte_q)
            g1 = V1.pprim(p1, a_lo, G1_v)
            if not tail:
                p2, p3, ps4, ps7 = lin_p(phi2_q), lin_p(phi3_q), lin_p(psi4_q), lin_p(psi7_q)
                ae_p, t2_p, xe_p, alpha_p = lin_p(Ae_q), lin_p(t2_q), lin_p(xe_q), lin_p(alpha_q)
                g2, g3 = V1.pprim(p2, a_lo, G2_v), V1.pprim(p3, a_lo, G3_v)
                h4, h7 = V1.pprim(ps4, a_lo, H4_v), V1.pprim(ps7, a_lo, H7_v)
                p_w1 = V1.pscale([-a_lo, Fr(1)], Fr(1) / (b_hi - a_lo))
                w1_eval = lambda cfs: (lambda acc=[], pw=[Fr(1)]: [acc := V1.padd(acc, V1.pscale(pw, c_)) for c_ in cfs if (pw_old := pw, pw := V1.pmul(pw, p_w1))][-1])()
                T3_p, pw = [], [Fr(1)]
                for m in range(5):
                    T3_p = V1.padd(T3_p, V1.pscale(pw, tau3_q[k][m])); pw = V1.pmul(pw, p_w1)
                nu0_p, pw = [], [Fr(1)]
                for m in range(3):
                    nu0_p = V1.padd(nu0_p, V1.pscale(pw, nu0_sq_q[k][m])); pw = V1.pmul(pw, p_w1)
                opc_p, pw = [], [Fr(1)]
                for m in range(3):
                    opc_p = V1.padd(opc_p, V1.pscale(pw, op_c_q[k][m])); pw = V1.pmul(pw, p_w1)
                xt_p = []
                G1_v, G2_v, G3_v, H4_v, H7_v = V1.peval(g1, b_hi), V1.peval(g2, b_hi), V1.peval(g3, b_hi), V1.peval(h4, b_hi), V1.peval(h7, b_hi)
            else:
                p2 = p3 = g2 = g3 = h4 = h7 = ae_p = t2_p = T3_p = nu0_p = opc_p = alpha_p = []
                rK2 = knots_fr[K] ** 2
                xt_p = V1.ptrim([xt0_q - xt2_q * rK2, Fr(0), xt2_q])
                xe_p = V1.ptrim([xe0_q - xe2_q * rK2, Fr(0), xe2_q])

            P12 = V1.psub(V1.psub(V1.padd([m01_q], V1.pscale(p3, Fr(3, 2))), V1.pscale(xte_p, Fr(1, 2))), V1.pscale(alpha_p, Fr(3, 2) * sqrt_m_ub_fr))
            P11 = V1.psub(V1.padd([m00_q], V1.pscale(p2, Fr(3))), t2_p)
            c_eta = V1.psub(V1.padd(V1.psub([-2 * m01_q - 2 * m11_eff, Fr(0), gve_q], V1.pscale(V1.pmul(rv_p, g3), Fr(3))), V1.psub(V1.pscale(h4, Fr(4)), V1.pscale(h7, Fr(2)))), V1.padd(ae_p, xe_p))
            P02 = V1.pscale(c_eta, Fr(1, 2))
            c_tau = V1.psub(V1.psub(V1.psub(V1.padd([-2 * m00_q - 2 * m01_q, Fr(0), gvt_q], V1.pscale(V1.psub(V1.psub(p1, p2), p3), Fr(3))), V1.pscale(V1.pmul(rv_p, g2), Fr(3))), V1.pscale(h4, Fr(4))), V1.padd(T3_p, xt_p))
            P01 = V1.pscale(c_tau, Fr(1, 2))
            P00 = V1.psub(V1.padd(V1.padd([lam0_q + m00_q + 2 * m01_q + m11_eff, Fr(-1), lam1_q - gvt_q - gve_q, Fr(0), lam2_q, Fr(0), lam3_q], V1.pscale(V1.pmul(rv_p, V1.psub(V1.padd(g2, g3), g1)), Fr(3))), V1.pscale(h7, Fr(2))), V1.padd(nu0_p, opc_p))

            M2 = V1.psub(V1.pscale(P11, m11_eff), V1.pmul(P12, P12))
            q_off = V1.psub(V1.padd(V1.pscale(V1.pmul(P01, P01), m11_eff), V1.pmul(V1.pmul(P02, P02), P11)), V1.pscale(V1.pmul(P01, V1.pmul(P02, P12)), Fr(2)))
            M3 = V1.psub(V1.pmul(P00, M2), q_off)
            if not V1.positive_on(M2, a_lo, b_hi):
                m00_q += Fr(1, 10**6); m11_q += Fr(1, 10**6); any_fail = True
            if not V1.positive_on(M3, a_lo, b_hi):
                any_fail = True
                rs_g = (14.0 / np.linspace(1.0, 1e-5, 4000)) if tail else np.linspace(float(a_lo), float(b_hi), 600)
                def_p00 = poly_eval_np(q_off, rs_g) / np.maximum(1e-12, poly_eval_np(M2, rs_g)) - poly_eval_np(P00, rs_g)
                if tail:
                    req_l3 = max(0.0, float(np.max(def_p00 / (rs_g ** 6))))
                    b3_max = max(b3_max, Fr(max(1, int(np.ceil((req_l3 * 1.1 + 2e-11) * 10**12))), 10**12))
                elif float(a_lo) >= 6.0:
                    req_l2 = max(0.0, float(np.max(def_p00 / (rs_g ** 4))))
                    b2_max = max(b2_max, Fr(max(1, int(np.ceil((req_l2 * 1.1 + 5e-9) * kden))), kden))
                else:
                    need = max(0.0, float(np.max(def_p00)))
                    b0_max = max(b0_max, Fr(max(10, int(np.ceil((need * 1.1 + 5e-7) * kden))), kden))
        if not any_fail:
            break
        lam0_q += b0_max; lam2_q += b2_max; lam3_q += b3_max

    # Compute exact minimal B_fr passing all 4 corners (s_ep, theta):
    C0 = lam0_q + lam1_q + 3 * lam2_q + 15 * lam3_q
    Cs = lam2_q + 15 * lam3_q + gvt_q / 3
    Cm = 8 * m00_q + 8 * m01_q + 2 * m11_q + 16 * mu00_q + 16 * mu01_q + 4 * mu11_q + 6 * gve_q
    Cu = 6 * m00_q + 24 * mu00_q
    qx = [Fr(36), Fr(0), Fr(54)]; qx2 = V1.pmul(qx, qx); qx3 = V1.pmul(qx2, qx)
    P6x = [Fr(0), Fr(32400), Fr(9720), Fr(14580)]

    xs_fine = np.linspace(float(x_lo_fr), 1.0, 4000)
    qv_f = 36.0 + 54.0 * xs_fine * xs_fine
    p6_f = 216.0 * (67.5 * xs_fine**3 + 45.0 * xs_fine**2 + 150.0 * xs_fine)
    sup_fl = 0.0
    for s_ep, sig_sec in ((s_lo_fr, sig_lo_fr), (s_hi_fr, sig_hi_fr)):
        sig_tan = Fr(3, 2) * r_anch_fr * s_ep - Fr(1, 2) * (r_anch_fr ** 3)
        ssq_sec = (s_lo_fr + s_hi_fr) * s_ep - s_lo_fr * s_hi_fr
        ssq_tan = 2 * s_mid_fr * s_ep - s_mid_fr * s_mid_fr
        s52_sec = s_ep * sig_sec
        for theta in (0, 1):
            c_q1_pos = float((1 - theta) * (4320 * lam3_q - 8 * lam_e3_q) * ssq_tan)
            c_q1_neg = float(((1 - theta) * 9 * lam_nu2_q + (12 + theta * 48) * lam_e4_q) * ssq_sec)
            rx_v = (float(lam3_q * sig_sec) * p6_f + float(lam_nu2_q * (6 + 9 * theta) * sig_sec - theta * (4320 * lam3_q - 8 * lam_e3_q) * sig_tan)) * qv_f + float((1 - theta) * 48 * lam_e4_q * s52_sec)
            val_x = float(C0 + s_ep * Cs) + (float(s_ep) * (float(Cm) + float(Cu) * xs_fine**2)) / qv_f + (c_q1_neg - c_q1_pos) / (qv_f**2) + np.abs(rx_v) / (qv_f**2.5)
            sup_fl = max(sup_fl, float(np.max(val_x)))

    B_fr = Fr(int(np.ceil((sup_fl + 1.0e-6) * 10**8)), 10**8)
    while True:
        all_ok = True
        for s_ep, sig_sec in ((s_lo_fr, sig_lo_fr), (s_hi_fr, sig_hi_fr)):
            sig_tan = Fr(3, 2) * r_anch_fr * s_ep - Fr(1, 2) * (r_anch_fr ** 3)
            ssq_sec = (s_lo_fr + s_hi_fr) * s_ep - s_lo_fr * s_hi_fr
            ssq_tan = 2 * s_mid_fr * s_ep - s_mid_fr * s_mid_fr
            s52_sec = s_ep * sig_sec
            for theta in (0, 1):
                c_q1_pos = (1 - theta) * (4320 * lam3_q - 8 * lam_e3_q) * ssq_tan
                c_q1_neg = ((1 - theta) * 9 * lam_nu2_q + (12 + theta * 48) * lam_e4_q) * ssq_sec
                Nx = V1.padd(V1.psub(V1.pscale(qx3, B_fr - C0 - s_ep * Cs), V1.pmul([s_ep * Cm, Fr(0), s_ep * Cu], qx2)), V1.pscale(qx, c_q1_pos - c_q1_neg))
                r_q1 = V1.padd(V1.pscale(P6x, lam3_q * sig_sec), [lam_nu2_q * (6 + 9 * theta) * sig_sec - theta * (4320 * lam3_q - 8 * lam_e3_q) * sig_tan])
                Rx = V1.padd(V1.pmul(r_q1, qx), [(1 - theta) * 48 * lam_e4_q * s52_sec])
                if not (V1.positive_on(Nx, x_lo_fr, Fr(1)) and V1.positive_on(V1.psub(V1.pmul(Nx, Nx), V1.pmul(V1.pmul(Rx, Rx), qx)), x_lo_fr, Fr(1))):
                    all_ok = False
        if all_ok:
            break
        B_fr += Fr(1, 10**7)

    row_dict = {
        "s_lo": str(s_lo_fr),
        "s_hi": str(s_hi_fr),
        "bound": str(B_fr),
        "sig_lo": str(sig_lo_fr),
        "sig_hi": str(sig_hi_fr),
        "r_anch": str(r_anch_fr),
        "sqrt_m_ub": str(sqrt_m_ub_fr),
        "x_lo": str(x_lo_fr),
        "knot_den": kden,
        "knots": [str(x) for x in knots_fr],
        "lam": [str(lam0_q), str(lam1_q), str(lam2_q), str(lam3_q)],
        "m_ker": [str(m00_q), str(m01_q), str(m11_q)],
        "m_w": [str(mu00_q), str(mu01_q), str(mu11_q)],
        "gam": [str(gvt_q), str(gve_q)],
        "lam_nu2": str(lam_nu2_q),
        "eta_high": [str(lam_e3_q), str(lam_e4_q), str(delta_m11_q)],
        "phi1": phi1_i,
        "phi2": phi2_i,
        "phi3": phi3_i,
        "psi4": psi4_i,
        "psi7": psi7_i,
        "lB": lB_i,
        "Ae": Ae_i,
        "t2": t2_i,
        "lnu0": lnu0_i,
        "lnu_op": lnu_op_i,
        "alpha_op": alpha_i,
        "tau3": tau3_i,
        "nu0_sq": nu0_sq_i,
        "op_c": op_c_i,
        "tail_xi": [str(xt0_q), str(xt2_q), str(xe0_q), str(xe2_q)],
        "xe": xe_i,
        "xte": xte_i,
    }
    V1.verify_v3_row(row_dict)
    VB.verify_v3_row_bernstein(row_dict)
    return row_dict


# ==============================================================================
# GENERATOR 2: REAL FIFTH CHAOS V_5(R^n) & H_{3,2}(C^n) SLAB ROW (`cert_v5_458.json`)
# ==============================================================================
def build_v5_row(s_lo_fr, s_hi_fr, m6_cap_fr, pad=None, kden=10**9):
    if pad is None:
        pad = 3.0e-7 if s_hi_fr >= Fr(360) else 1.5e-6
    knots_fr = R_KNOTS_V5
    knots = np.array([float(x) for x in knots_fr])
    K = len(knots) - 1
    rK_fl = knots[K]

    lob9 = 0.5 * (1.0 - np.cos(np.pi * np.arange(9) / 8.0))
    int_pts, r_all = [], []
    for k in range(K):
        pts = knots[k] + (knots[k + 1] - knots[k]) * lob9
        int_pts.append(list(range(len(r_all), len(r_all) + len(pts))))
        r_all.extend(pts)
    tail_pts = np.concatenate([np.linspace(rK_fl, rK_fl * 4.0, 28), rK_fl * np.geomspace(4.2, 6000.0, 36)])
    tail_idxs = list(range(len(r_all), len(r_all) + len(tail_pts)))
    r_all.extend(tail_pts)
    r_all = np.array(r_all)
    Phi, G = build_hat_basis_r(knots, r_all)
    G_R = build_hat_basis_r(knots, np.array([knots[K]]))[1][:, 0]

    cb = ConicBuilder()
    t_obj = cb.var()
    lam0, lam1, lam2, lam3 = cb.var(), cb.var(), cb.var(), cb.var()
    cb.add_nonneg(-1.0e-15 * 1e9, [(lam3, 1.0)])
    m00, m01, m11 = cb.var(), cb.var(), cb.var()
    cb.add_psd(2, [(-pad, [(m00, 1.0)]), (0.0, [(m01, 1.0)]), (-pad, [(m11, 1.0)])])
    mu00, mu01, mu11 = cb.var(), cb.var(), cb.var()
    cb.add_psd(2, [(-pad, [(mu00, 1.0)]), (0.0, [(mu01, 1.0)]), (-pad, [(mu11, 1.0)])])
    gam_vt1, gam_vt2 = cb.var(), cb.var()

    c_br1 = cb.var(K + 1)
    c_br2 = cb.var(K); cb.add_eq([(c_br2[k], G_R[k]) for k in range(K)], 0.0)
    c_br3 = cb.var(K); cb.add_eq([(c_br3[k], G_R[k]) for k in range(K)], 0.0)
    c_br4 = cb.var(K - 1)

    lB_kn, Ae_kn, t2_kn = cb.var(K + 1), cb.var(K + 1), cb.var(K + 1)
    for k in range(K + 1):
        cb.add_nonneg(-pad, [(Ae_kn[k], 1.0)])
        cb.add_nonneg(-pad, [(t2_kn[k], 1.0)])

    tau3_c = [cb.var(5) for _ in range(K)]
    xt_tail0, xt_tail2, xe_tail0, xe_tail2 = cb.var(), cb.var(), cb.var(), cb.var()
    for xv in (xt_tail0, xt_tail2, xe_tail0, xe_tail2):
        cb.add_nonneg(0.0, [(xv, 1.0)])
    xi_e_kn, xi_te_kn = cb.var(K + 1), cb.var(K + 1)
    for k in range(K + 1):
        cb.add_nonneg(0.0, [(xi_e_kn[k], 1.0)])
        cb.add_nonneg(0.0, [(xi_te_kn[k], 1.0)])

    sc = np.sqrt(5.0) / 4.0
    sc_lB = np.sqrt(5.0)
    for k in range(K):
        for w1 in (0.0, 0.5, 1.0):
            w0 = 1.0 - w1
            cb.add_psd(2, [
                (-pad, [(Ae_kn[k], w0), (Ae_kn[k + 1], w1)]),
                (0.0, [(lB_kn[k], sc_lB * w0), (lB_kn[k + 1], sc_lB * w1)]),
                (-pad, [(t2_kn[k], w0), (t2_kn[k + 1], w1)]),
            ])

    for k in range(K):
        for idx_r in int_pts[k]:
            rv = r_all[idx_r]; Vv = rv * rv; V2v = Vv * Vv; V3v = V2v * Vv
            w1 = (rv - knots[k]) / (knots[k + 1] - knots[k]); w0 = 1.0 - w1
            h4_terms = [(c_br4[j - 1], -(G_R[j] - G[j, idx_r])) for j in range(1, K)]
            L_sig = [(c_br2[j], 2.0 * G[j, idx_r]) for j in range(K)] + [(c_br4[j - 1], 2.0 * Phi[j, idx_r]) for j in range(1, K)]
            L_nu = [(c_br3[j], 2.0 * G[j, idx_r]) for j in range(K)]
            lB_here = [(lB_kn[k], w0), (lB_kn[k + 1], w1)]
            lA_here = L_sig + [(col, -val) for col, val in lB_here]
            tau3_here = [(tau3_c[k][m], w1 ** m) for m in range(5)]
            cb.add_psd(3, [
                (0.0, [(mu00, 1.0)]), (0.0, [(mu01, 1.0)]), (0.0, [(mu11, 1.0)]),
                (0.0, sc_terms(lA_here, sc)), (0.0, sc_terms(L_nu, sc)), (-pad, tau3_here),
            ])
            ae_term = [(Ae_kn[k], -w0), (Ae_kn[k + 1], -w1)]
            tl2_term = [(t2_kn[k], -w0), (t2_kn[k + 1], -w1)]
            tl3_term = [(col, -val) for col, val in tau3_here]
            xe_here = [(xi_e_kn[k], w0), (xi_e_kn[k + 1], w1)]
            xte_here = [(xi_te_kn[k], w0), (xi_te_kn[k + 1], w1)]

            c_1 = [(lam0, 1.0), (lam1, Vv), (lam2, 1e-4 * V2v), (lam3, 1e-9 * V3v),
                   (m00, 1.0), (m01, 2.0), (m11, 1.0), (gam_vt1, -Vv), (gam_vt2, -Vv)]
            c_1 += [(c_br1[j], -5.0 * rv * G[j, idx_r]) for j in range(K + 1)]
            c_1 += [(c_br2[j], +5.0 * rv * G[j, idx_r]) for j in range(K)]
            c_1 += [(c_br3[j], +5.0 * rv * G[j, idx_r]) for j in range(K)]

            c_tau = [(m00, -2.0), (m01, -2.0), (gam_vt1, Vv)] + tl3_term
            c_tau += [(c_br1[j], 5.0 * Phi[j, idx_r]) for j in range(K + 1)]
            c_tau += [(c_br2[j], -5.0 * Phi[j, idx_r] - 5.0 * rv * G[j, idx_r]) for j in range(K)]
            c_tau += [(c_br3[j], -5.0 * Phi[j, idx_r]) for j in range(K)]
            c_tau += [(col, -8.0 * val) for col, val in h4_terms]

            c_eta = [(m01, -2.0), (m11, -2.0), (gam_vt2, Vv)] + ae_term + [(col, -val) for col, val in xe_here]
            c_eta += [(c_br3[j], -5.0 * rv * G[j, idx_r]) for j in range(K)]
            c_eta += [(col, +8.0 * val) for col, val in h4_terms]

            c_tau2 = [(m00, 1.0)] + tl2_term + [(c_br2[j], 5.0 * Phi[j, idx_r]) for j in range(K)]
            c_te = [(m01, 2.0)] + [(col, -val) for col, val in xte_here] + [(c_br3[j], 5.0 * Phi[j, idx_r]) for j in range(K)]
            c_eta2 = [(m11, 1.0)]

            S_fac = (1.0 + 0.02 * Vv) ** 1.5
            cb.add_psd(3, [
                (-rv / (S_fac * S_fac) - 1.5 * pad, sc_terms(c_1, 1.0 / (S_fac * S_fac))),
                (0.0, sc_terms(c_tau, 0.5 / S_fac)), (-pad, c_tau2),
                (0.0, sc_terms(c_eta, 0.5 / S_fac)), (0.0, sc_terms(c_te, 0.5)), (-pad, c_eta2),
            ])

    for idx_r in tail_idxs:
        rv = r_all[idx_r]; Vv = rv * rv; V2v = Vv * Vv; V3v = V2v * Vv
        xt_here = [(xt_tail0, 1.0), (xt_tail2, 1e-4 * (Vv - rK_fl**2))]
        xe_here = [(xe_tail0, 1.0), (xe_tail2, 1e-4 * (Vv - rK_fl**2))]
        xte_here = [(xi_te_kn[K], 1.0)]
        c_1 = [(lam0, 1.0), (lam1, Vv), (lam2, 1e-4 * V2v), (lam3, 1e-9 * V3v),
               (m00, 1.0), (m01, 2.0), (m11, 1.0), (gam_vt1, -Vv), (gam_vt2, -Vv)]
        c_1 += [(c_br1[j], -5.0 * rv * G[j, idx_r]) for j in range(K + 1)]
        c_tau = [(m00, -2.0), (m01, -2.0), (gam_vt1, Vv), (c_br1[K], 5.0)] + [(col, -val) for col, val in xt_here]
        c_eta = [(m01, -2.0), (m11, -2.0), (gam_vt2, Vv)] + [(col, -val) for col, val in xe_here]
        c_tau2 = [(m00, 1.0)]; c_te = [(m01, 2.0)] + [(col, -val) for col, val in xte_here]; c_eta2 = [(m11, 1.0)]
        S_fac = (1.0 + 0.02 * Vv) ** 1.5
        cb.add_psd(3, [
            (-rv / (S_fac * S_fac) - 1.5 * pad, sc_terms(c_1, 1.0 / (S_fac * S_fac))),
            (0.0, sc_terms(c_tau, 0.5 / S_fac)), (-pad, c_tau2),
            (0.0, sc_terms(c_eta, 0.5 / S_fac)), (0.0, sc_terms(c_te, 0.5)), (-pad, c_eta2),
        ])

    m6_fl = float(m6_cap_fr)
    for s_fr in (s_lo_fr, s_hi_fr):
        sv = float(s_fr)
        for kc in (1, 2, 3, 4):
            ak = 5.0 * sv / (3.0 * (5.0 - kc))
            c1k, c2k = (5.0 - kc) / 5.0, (5.0 - kc) * (4.0 - kc) / 20.0
            cb.add_nonneg(0.0, [
                (t_obj, 1.0),
                (lam0, -1.0), (lam1, -1.0), (lam2, -1e-4 * (3.0 + sv)), (lam3, -1e-9 * m6_fl),
                (gam_vt1, -(c1k * ak)), (gam_vt2, -(c2k * ak)),
                (m00, -(c1k * c1k * ak)), (m01, -(2.0 * c1k * c2k * ak)), (m11, -(c2k * c2k * ak)),
                (mu00, -((2.0 * kc) * c1k * c1k * ak)),
                (mu01, -(2.0 * (2.0 * kc) * c1k * c2k * ak)),
                (mu11, -((2.0 * kc) * c2k * c2k * ak)),
            ])

    sol = cb.solve([(t_obj, 1.0)])
    x_sol = np.array(sol.x, dtype=float)
    q_int = lambda v: int(round(float(v) * kden))

    phi1_i = [q_int(x_sol[c_br1[j]]) for j in range(K + 1)]
    phi2_i = quantize_cs_int([x_sol[c_br2[j]] for j in range(K)], knots_fr, kden)
    phi3_i = quantize_cs_int([x_sol[c_br3[j]] for j in range(K)], knots_fr, kden)
    psi4_i = [0] + [q_int(x_sol[c_br4[j]]) for j in range(K - 1)] + [0]
    lB_i = [q_int(x_sol[lB_kn[j]]) for j in range(K + 1)]
    Ae_i = [max(10, q_int(x_sol[Ae_kn[j]])) for j in range(K + 1)]
    t2_i = [max(10, q_int(x_sol[t2_kn[j]])) for j in range(K + 1)]
    tau3_i = [[q_int(x_sol[tau3_c[k][m]]) for m in range(5)] for k in range(K)]
    xt0_q = max(Fr(0), Fr(int(round(float(x_sol[xt_tail0]) * 10**12)), 10**12))
    xt2_q = max(Fr(0), Fr(int(round(float(1e-4 * x_sol[xt_tail2]) * 10**16)), 10**16))
    xe0_q = max(Fr(0), Fr(int(round(float(x_sol[xe_tail0]) * 10**12)), 10**12))
    xe2_q = max(Fr(0), Fr(int(round(float(1e-4 * x_sol[xe_tail2]) * 10**16)), 10**16))
    xe_i = [max(0, q_int(x_sol[xi_e_kn[j]])) for j in range(K + 1)]
    xte_i = [max(0, q_int(x_sol[xi_te_kn[j]])) for j in range(K + 1)]

    lam0_q = Fr(q_int(x_sol[lam0] + 1.0e-6), kden)
    lam1_q = Fr(q_int(x_sol[lam1]), kden)
    lam2_q = Fr(int(round(float(1e-4 * x_sol[lam2]) * 10**15)), 10**15)
    lam3_q = max(Fr(1, 10**18), Fr(int(round(float(1e-9 * x_sol[lam3]) * 10**18)), 10**18))
    m00_q, m01_q, m11_q = Fr(q_int(x_sol[m00]), kden), Fr(q_int(x_sol[m01]), kden), Fr(q_int(x_sol[m11]), kden)
    mu00_q, mu01_q, mu11_q = Fr(q_int(x_sol[mu00]), kden), Fr(q_int(x_sol[mu01]), kden), Fr(q_int(x_sol[mu11]), kden)
    gvt1_q, gvt2_q = Fr(q_int(x_sol[gam_vt1]), kden), Fr(q_int(x_sol[gam_vt2]), kden)

    Dw = mu00_q * mu11_q - mu01_q * mu01_q
    phi1_q, phi2_q, phi3_q, psi4_q = ([Fr(x, kden) for x in arr] for arr in (phi1_i, phi2_i, phi3_i, psi4_i))
    lB_q, Ae_q, xe_q, xte_q = ([Fr(x, kden) for x in arr] for arr in (lB_i, Ae_i, xe_i, xte_i))
    h4_0 = -sum(Fr(1, 2) * (psi4_q[j] + psi4_q[j + 1]) * (knots_fr[j + 1] - knots_fr[j]) for j in range(K))
    rv_p = [Fr(0), Fr(1)]

    # Pass 1: Polish t2_i and tau3_i[k][0]:
    G2_v, G3_v, H4_v = Fr(0), Fr(0), h4_0
    for k in range(K):
        a_lo, b_hi = knots_fr[k], knots_fr[k + 1]
        lin_p = lambda arr, k=k, a_lo=a_lo, b_hi=b_hi: V1.ptrim([arr[k] - ((arr[k + 1] - arr[k]) / (b_hi - a_lo)) * a_lo, (arr[k + 1] - arr[k]) / (b_hi - a_lo)])
        p2, p3, ps4 = lin_p(phi2_q), lin_p(phi3_q), lin_p(psi4_q)
        g2, g3, h4 = V1.pprim(p2, a_lo, G2_v), V1.pprim(p3, a_lo, G3_v), V1.pprim(ps4, a_lo, H4_v)
        lb_p, ae_p = lin_p(lB_q), lin_p(Ae_q)
        while True:
            t2_q_loc = [Fr(t2_i[k], kden), Fr(t2_i[k + 1], kden)]
            sl_t2 = (t2_q_loc[1] - t2_q_loc[0]) / (b_hi - a_lo)
            t2_p = V1.ptrim([t2_q_loc[0] - sl_t2 * a_lo, sl_t2])
            if V1.positive_on(V1.psub(V1.pmul(ae_p, t2_p), V1.pscale(V1.pmul(lb_p, lb_p), Fr(5))), a_lo, b_hi):
                break
            t2_i[k] += max(1, kden // 10**6); t2_i[k + 1] += max(1, kden // 10**6)

        Lsig, Lnu = V1.pscale(V1.padd(g2, ps4), Fr(2)), V1.pscale(g3, Fr(2))
        lA_p = V1.psub(Lsig, lb_p)
        q_form = V1.padd(V1.psub(V1.pscale(V1.pmul(lA_p, lA_p), mu11_q), V1.pscale(V1.pmul(lA_p, Lnu), 2 * mu01_q)), V1.pscale(V1.pmul(Lnu, Lnu), mu00_q))
        T3_exact = V1.pscale(q_form, Fr(5) / (16 * Dw))
        p_w1 = V1.pscale([-a_lo, Fr(1)], Fr(1) / (b_hi - a_lo))
        while True:
            T3_p, pw = [], [Fr(1)]
            for m in range(5):
                T3_p = V1.padd(T3_p, V1.pscale(pw, Fr(tau3_i[k][m], kden))); pw = V1.pmul(pw, p_w1)
            if V1.positive_on(V1.psub(T3_p, T3_exact), a_lo, b_hi):
                break
            rs_g = np.linspace(float(a_lo), float(b_hi), 300)
            min_d = float(np.min(poly_eval_np(V1.psub(T3_p, T3_exact), rs_g)))
            tau3_i[k][0] += max(10, int(np.ceil((max(0.0, -min_d) + 3e-7) * kden)))
        G2_v, G3_v, H4_v = V1.peval(g2, b_hi), V1.peval(g3, b_hi), V1.peval(h4, b_hi)

    t2_q = [Fr(x, kden) for x in t2_i]
    tau3_q = [[Fr(x, kden) for x in sub] for sub in tau3_i]

    # Pass 2: Polish M2 > 0 and M3 > 0:
    for _ in range(12):
        G1_v, G2_v, G3_v, H4_v = Fr(0), Fr(0), Fr(0), h4_0
        any_fail = False
        b0_max, b2_max, b3_max = Fr(0), Fr(0), Fr(0)
        for k in range(K + 1):
            tail = (k == K)
            a_lo = knots_fr[k]
            b_hi = None if tail else knots_fr[k + 1]
            lin_p = (lambda arr: V1.ptrim([arr[K]])) if tail else (lambda arr, k=k, a_lo=a_lo, b_hi=b_hi: V1.ptrim([arr[k] - ((arr[k + 1] - arr[k]) / (b_hi - a_lo)) * a_lo, (arr[k + 1] - arr[k]) / (b_hi - a_lo)]))
            p1, xte_p = lin_p(phi1_q), lin_p(xte_q)
            g1 = V1.pprim(p1, a_lo, G1_v)
            if not tail:
                p2, p3, ps4 = lin_p(phi2_q), lin_p(phi3_q), lin_p(psi4_q)
                ae_p, t2_p, xe_p = lin_p(Ae_q), lin_p(t2_q), lin_p(xe_q)
                g2, g3, h4 = V1.pprim(p2, a_lo, G2_v), V1.pprim(p3, a_lo, G3_v), V1.pprim(ps4, a_lo, H4_v)
                p_w1 = V1.pscale([-a_lo, Fr(1)], Fr(1) / (b_hi - a_lo))
                T3_p, pw = [], [Fr(1)]
                for m in range(5):
                    T3_p = V1.padd(T3_p, V1.pscale(pw, tau3_q[k][m])); pw = V1.pmul(pw, p_w1)
                xt_p = []
                G1_v, G2_v, G3_v, H4_v = V1.peval(g1, b_hi), V1.peval(g2, b_hi), V1.peval(g3, b_hi), V1.peval(h4, b_hi)
            else:
                p2 = p3 = g2 = g3 = h4 = ae_p = t2_p = T3_p = []
                rK2 = knots_fr[K] ** 2
                xt_p = V1.ptrim([xt0_q - xt2_q * rK2, Fr(0), xt2_q])
                xe_p = V1.ptrim([xe0_q - xe2_q * rK2, Fr(0), xe2_q])

            P12 = V1.psub(V1.padd([m01_q], V1.pscale(p3, Fr(5, 2))), V1.pscale(xte_p, Fr(1, 2)))
            P11 = V1.psub(V1.padd([m00_q], V1.pscale(p2, Fr(5))), t2_p)
            c_eta = V1.psub(V1.padd(V1.psub([-2 * m01_q - 2 * m11_q, Fr(0), gvt2_q], V1.pscale(V1.pmul(rv_p, g3), Fr(5))), V1.pscale(h4, Fr(8))), V1.padd(ae_p, xe_p))
            P02 = V1.pscale(c_eta, Fr(1, 2))
            c_tau = V1.psub(V1.psub(V1.psub(V1.padd([-2 * m00_q - 2 * m01_q, Fr(0), gvt1_q], V1.pscale(V1.psub(V1.psub(p1, p2), p3), Fr(5))), V1.pscale(V1.pmul(rv_p, g2), Fr(5))), V1.pscale(h4, Fr(8))), V1.padd(T3_p, xt_p))
            P01 = V1.pscale(c_tau, Fr(1, 2))
            P00 = V1.padd([lam0_q + m00_q + 2 * m01_q + m11_q, Fr(-1), lam1_q - gvt1_q - gvt2_q, Fr(0), lam2_q, Fr(0), lam3_q], V1.pscale(V1.pmul(rv_p, V1.psub(V1.padd(g2, g3), g1)), Fr(5)))

            M2 = V1.psub(V1.pscale(P11, m11_q), V1.pmul(P12, P12))
            q_off = V1.psub(V1.padd(V1.pscale(V1.pmul(P01, P01), m11_q), V1.pmul(V1.pmul(P02, P02), P11)), V1.pscale(V1.pmul(P01, V1.pmul(P02, P12)), Fr(2)))
            M3 = V1.psub(V1.pmul(P00, M2), q_off)
            if not V1.positive_on(M2, a_lo, b_hi):
                m00_q += Fr(1, 10**6); m11_q += Fr(1, 10**6); any_fail = True
            if not V1.positive_on(M3, a_lo, b_hi):
                any_fail = True
                rs_g = (rK_fl / np.linspace(1.0, 1e-5, 4000)) if tail else np.linspace(float(a_lo), float(b_hi), 600)
                def_p00 = poly_eval_np(q_off, rs_g) / np.maximum(1e-12, poly_eval_np(M2, rs_g)) - poly_eval_np(P00, rs_g)
                if tail:
                    req_l3 = max(0.0, float(np.max(def_p00 / (rs_g ** 6))))
                    b3_max = max(b3_max, Fr(max(1, int(np.ceil((req_l3 * 1.1 + 1e-17) * 10**18))), 10**18))
                elif float(a_lo) >= 8.0:
                    req_l2 = max(0.0, float(np.max(def_p00 / (rs_g ** 4))))
                    b2_max = max(b2_max, Fr(max(1, int(np.ceil((req_l2 * 1.1 + 1e-13) * 10**15))), 10**15))
                else:
                    need = max(0.0, float(np.max(def_p00)))
                    b0_max = max(b0_max, Fr(max(10, int(np.ceil((need * 1.1 + 5e-7) * kden))), kden))
        if not any_fail:
            break
        lam0_q += b0_max; lam2_q += b2_max; lam3_q += b3_max

    max_ev = Fr(0)
    for s_ep in (s_lo_fr, s_hi_fr):
        for kc in (1, 2, 3, 4):
            ak = Fr(5) * s_ep / (3 * (5 - kc))
            c1_k, c2_k = Fr(5 - kc, 5), Fr((5 - kc) * (4 - kc), 20)
            ev_tot = (
                lam0_q + lam1_q + lam2_q * (3 + s_ep) + lam3_q * m6_cap_fr
                + gvt1_q * (c1_k * ak) + gvt2_q * (c2_k * ak)
                + m00_q * (c1_k * c1_k * ak) + 2 * m01_q * (c1_k * c2_k * ak) + m11_q * (c2_k * c2_k * ak)
                + (2 * kc) * (mu00_q * (c1_k * c1_k * ak) + 2 * mu01_q * (c1_k * c2_k * ak) + mu11_q * (c2_k * c2_k * ak))
            )
            if ev_tot > max_ev:
                max_ev = ev_tot
    B_fr = Fr((max_ev.numerator * 10**8) // max_ev.denominator + 2, 10**8)

    row_dict = {
        "s_lo": str(s_lo_fr),
        "s_hi": str(s_hi_fr),
        "m6_cap": str(m6_cap_fr),
        "bound": str(B_fr),
        "knot_den": kden,
        "knots": [str(x) for x in knots_fr],
        "lam": [str(lam0_q), str(lam1_q), str(lam2_q), str(lam3_q)],
        "m_ker": [str(m00_q), str(m01_q), str(m11_q)],
        "m_w": [str(mu00_q), str(mu01_q), str(mu11_q)],
        "gam": [str(gvt1_q), str(gvt2_q)],
        "phi1": phi1_i,
        "phi2": phi2_i,
        "phi3": phi3_i,
        "psi4": psi4_i,
        "lB": lB_i,
        "Ae": Ae_i,
        "t2": t2_i,
        "tau3": tau3_i,
        "tail_xi": [str(xt0_q), str(xt2_q), str(xe0_q), str(xe2_q)],
        "xe": xe_i,
        "xte": xte_i,
    }
    V1.verify_v5_row(row_dict)
    VB.verify_v5_row_bernstein(row_dict)
    return row_dict


# ==============================================================================
# EXACT DOWNSTREAM CUTOFF SOLVER FOR ANY NEW COMPLEX CUBIC RADIUS `rho`
# ==============================================================================
def compute_downstream_dict(rho, pi_lo, pi_hi):
    e, eta, target, carrier = Fr(39, 50), Fr(779, 10000), Fr(500, 701), Fr(431, 500)
    # 1. 4.18a exact 6-decimal cutoff:
    c_hi = e * (rho ** 2) + (eta ** 2) / (pi_lo * e)
    t2_max = (target - c_hi) / (1 - eta)
    t_418a = Fr(isqrt((t2_max.numerator * 10**12) // t2_max.denominator), 10**6)
    while (1 - eta) * (t_418a ** 2) + c_hi >= target:
        t_418a -= Fr(1, 10**6)

    # 2. 4.18e Parseval & Lean-mass exact 8-decimal cutoffs:
    def solve_ell8(weight, offset):
        intercept = offset + weight * (rho ** 2)
        sl = 1 - eta - weight * (carrier ** 2)
        t2_m = (target - intercept) / sl
        tv = Fr(isqrt((t2_m.numerator * 10**16) // t2_m.denominator), 10**8)
        while intercept + sl * (tv ** 2) >= target:
            tv -= Fr(1, 10**8)
        return tv

    t_pars = solve_ell8(e - eta, eta)
    mass_e, mass_c = Fr(25, 31), Fr(1, 2) + 2 * Fr(47, 1953)
    mass_s = Fr(3798855002922010337121170986221578569, 22939068096000000000000000000000000000)
    t_mass = solve_ell8(e - eta * mass_e / mass_c, eta * (1 + mass_s / mass_c))

    # 3. 4.18e sixth-moment clipping exact 8-decimal cutoff:
    shift, tang, sc12 = Fr(21, 200), Fr(7071, 5000), 10**12
    nu_ell = carrier * carrier

    def clip_passes(tv):
        x0 = rho * rho - nu_ell * tv * tv
        z0 = ((1 + shift) ** 2) * x0
        upper0 = eta + (1 - eta) * tv * tv + (e - eta) * x0
        if upper0 <= target:
            return True
        need0 = (upper0 - target) / eta + shift * shift * x0
        r_up = Fr(isqrt(int(need0 * (sc12 ** 2))) + 1, sc12)
        d0 = 2 * z0 - 1 - r_up * (2 + tang * tang) / (2 * tang)
        d1 = z0 - r_up / (2 * tang)
        if d0 <= 0 or d1 <= 0:
            return False
        p_clip = [d0 * d0 - 6 * r_up * r_up * z0, Fr(0), 2 * d0 * d1 - 9 * r_up * r_up * z0, -V1.C6_CPLX * r_up * r_up * z0, d1 * d1]
        return V1.positive_on(p_clip, Fr(0), None)

    lo_i, hi_i = int(Fr(45406137, 100000000) * 10**8), int(Fr(47000000, 100000000) * 10**8)
    while lo_i < hi_i:
        mid_i = (lo_i + hi_i + 1) // 2
        if clip_passes(Fr(mid_i, 10**8)):
            lo_i = mid_i
        else:
            hi_i = mid_i - 1
    t_clip = Fr(lo_i, 10**8)

    # Find exact s_fail at t_clip + 10^-8:
    t1 = t_clip + Fr(1, 10**8)
    x1 = rho * rho - nu_ell * t1 * t1
    z1 = ((1 + shift) ** 2) * x1
    gran = Fr(1, sc12)
    s_fail = None
    for sw in [Fr(1, 10**8)] + [Fr(sn, 1000) for sn in range(1, 8000, 1)]:
        sq_s_up = Fr(isqrt(int(sw * (sc12 ** 2))) + 1, sc12)
        mlo = 6 + 9 * sw + V1.C6_CPLX * sw * (sq_s_up - gran)
        den_lo = Fr(isqrt(int(z1 * mlo * (sc12 ** 2))), sc12) + Fr(isqrt(int((2 + sw) * (sc12 ** 2))), sc12)
        corr_hi = ((z1 * (2 + sw) - 1) ** 2) / (den_lo * den_lo) - shift * shift * x1
        if eta + (1 - eta) * t1 * t1 + (e - eta) * x1 - eta * corr_hi > target:
            s_fail = sw
            break
    assert s_fail is not None

    # 4. 4.18f 24-witness binary search (5-decimal pure & kng):
    def try_418f(t_pure_cand, t_kng_cand):
        ds_tmp = {
            "deg7_1403_cap": str(Fr(1000, 1403) / (rho * rho)),
            "deg5_1402_cap": str(Fr(500, 701) / (rho * rho)),
            "d5_418a_cutoff": str(t_418a),
            "d5_418e_parseval": str(t_pars),
            "d5_418e_sixth_moment": str(t_clip),
            "d5_418e_sixth_tang": str(tang),
            "d5_418e_sixth_fail_s": str(s_fail),
            "d5_418e_lean_mass": str(t_mass),
            "d5_418f_spectral_24_pure": str(t_pure_cand),
            "d5_418f_spectral_24_kng": str(t_kng_cand),
        }
        try:
            V1.verify_downstream(ds_tmp, rho, pi_lo, pi_hi)
            return True, ds_tmp
        except Exception:
            return False, None

    lo_p, hi_p = 45288, 47000
    while lo_p < hi_p:
        mid_p = (lo_p + hi_p + 1) // 2
        ok, _ = try_418f(Fr(mid_p, 100000), Fr(11331, 25000))
        if ok:
            lo_p = mid_p
        else:
            hi_p = mid_p - 1

    lo_k, hi_k = 45324, 47000
    while lo_k < hi_k:
        mid_k = (lo_k + hi_k + 1) // 2
        ok, _ = try_418f(Fr(lo_p, 100000), Fr(mid_k, 100000))
        if ok:
            lo_k = mid_k
        else:
            hi_k = mid_k - 1

    ok_final, ds_final = try_418f(Fr(lo_p, 100000), Fr(lo_k, 100000))
    assert ok_final
    return ds_final


def main():
    t0 = time.monotonic_ns()
    pi_lo, pi_hi = V1.verify_pi_bounds()

    print(f"=== GENERATING PART II: `cert_v3_458.json` ({len(SLABS_V3)} slabs on V_3(R^n), kappa_4 in [0, 90]) ===")
    rows_v3 = []
    for idx, (slo, shi) in enumerate(SLABS_V3):
        rdict = build_v3_row(slo, shi)
        rows_v3.append(rdict)
        print(f"[V_3 {idx:2d}/{len(SLABS_V3)}] s in [{str(slo):>5s}, {str(shi):>5s}] -> bound = {float(Fr(rdict['bound'])):.8f}  (Sturm + Bern OK)", flush=True)

    max_v3 = max(Fr(r["bound"]) for r in rows_v3)
    # Determine sharpest threshold s_sharp in {5, 11/2} where max <= 19946/25000 < sqrt(2/pi):
    max_at_5 = max(Fr(r["bound"]) for r in rows_v3 if Fr(r["s_lo"]) >= Fr(5))
    max_at_55 = max(Fr(r["bound"]) for r in rows_v3 if Fr(r["s_lo"]) >= Fr(11, 2))
    if max_at_5 <= Fr(19946, 25000):
        sharp_s_str, sharp_chi_str, sharp_real_str, max_v3_sharp = "5", "10/3", "19946/25000", max_at_5
    else:
        sharp_s_str, sharp_chi_str, sharp_real_str, max_v3_sharp = "11/2", "11/3", "3989/5000", max_at_55
    print(f"Max V_3 global = {float(max_v3):.8f}, sharp_hi_s = {sharp_s_str} (max = {float(max_v3_sharp):.8f})")

    # Pick tightest clean rational claims:
    for cand_r in (Fr(3993, 5000), Fr(7987, 10000), Fr(1997, 2500), Fr(7989, 10000), Fr(3995, 5000)):
        if max_v3 <= cand_r:
            claim_real_v3 = cand_r
            break
    for cand_cplx in (Fr(2218, 2500), Fr(8873, 10000), Fr(4437, 5000), Fr(8875, 10000)):
        if (pi_hi ** 2) * (claim_real_v3 ** 2) < 8 * (cand_cplx ** 2):
            claim_cplx_v3 = cand_cplx
            break

    ds_dict = compute_downstream_dict(claim_cplx_v3, pi_lo, pi_hi)
    cert_v3 = {
        "kind": "v3_enhanced",
        "claim_real": str(claim_real_v3),
        "sharp_hi_s": sharp_s_str,
        "sharp_hi_claim_real": sharp_real_str,
        "claim_complex": str(claim_cplx_v3),
        "sharp_hi_chi": sharp_chi_str,
        "sharp_hi_claim_complex": "4431/5000",
        "downstream": ds_dict,
        "rows": rows_v3,
    }
    p_v3 = HERE / "cert_v3_458.json"
    p_v3.write_text(json.dumps(cert_v3, separators=(",", ":")) + "\n", encoding="utf-8")
    sz_v3 = p_v3.stat().st_size
    print(f"Wrote {p_v3} ({sz_v3:,} bytes < 300,000 bytes)")
    assert sz_v3 < 300_000
    V1.verify_certificate_dict(cert_v3, quiet=True)
    VB.verify_certificate_dict_bernstein(cert_v3, quiet=True)

    print("\n=== GENERATING PART III: `cert_v5_458.json` (V_5(R^n) [0, 4650] + H_{3,2}(C^n) [0, 1840]) ===")
    rows_v5 = []
    for idx, (slo, shi) in enumerate(SLABS_V5):
        rdict = build_v5_row(slo, shi, V1.M6_REAL_V5)
        rows_v5.append(rdict)
        print(f"[V_5 {idx:2d}/{len(SLABS_V5)}] s in [{str(slo):>5s}, {str(shi):>5s}] -> bound = {float(Fr(rdict['bound'])):.8f}  (Sturm + Bern OK)", flush=True)

    rows_h32 = []
    m6_slice = Fr(5, 2) * V1.M6_CPLX_H32
    for idx, (slo, shi) in enumerate(SLABS_H32_SLICE):
        rdict = build_v5_row(slo, shi, m6_slice)
        rows_h32.append(rdict)
        print(f"[H32 {idx:2d}/{len(SLABS_H32_SLICE)}] s in [{str(slo):>5s}, {str(shi):>5s}] -> slice_real = {float(Fr(rdict['bound'])):.8f}", flush=True)

    max_v5 = max(Fr(r["bound"]) for r in rows_v5)
    for cand_v5 in (Fr(49, 50), Fr(981, 1000), Fr(983, 1000)):
        if max_v5 <= cand_v5:
            claim_v5 = cand_v5
            break

    # Optimize B_poly on H_{3,2} tail chi >= 26:
    best_tail, best_B = Fr(1), Fr(2100)
    for b_cand in range(1000, 5000, 20):
        Bp = Fr(b_cand)
        eps_p = Fr(1) / (2 * ((Bp + 1) ** 2))
        eta_p = eps_p * ((Bp * Bp - 1) ** 2) / (Bp ** 6)
        val = Fr(1) - 27 * eps_p + eta_p * V1.M6_CPLX_H32
        if val < best_tail:
            best_tail, best_B = val, Bp
    print(f"Optimal H_{{3,2}} tail B = {best_B}, 1 - tail = {float(1 - best_tail):.4e}")

    cert_v5 = {
        "kind": "v5_tower",
        "claim_real_v5": str(claim_v5),
        "h32_chi_cut": "26",
        "claim_h32_low": "97/100",
        "h32_tail_B": str(best_B),
        "claim_h32_global": "999999/1000000",
        "rows_v5": rows_v5,
        "rows_h32_slice": rows_h32,
    }
    p_v5 = HERE / "cert_v5_458.json"
    p_v5.write_text(json.dumps(cert_v5, separators=(",", ":")) + "\n", encoding="utf-8")
    sz_v5 = p_v5.stat().st_size
    print(f"Wrote {p_v5} ({sz_v5:,} bytes < 300,000 bytes)")
    assert sz_v5 < 300_000
    V1.verify_certificate_dict(cert_v5, quiet=True)
    VB.verify_certificate_dict_bernstein(cert_v5, quiet=True)

    dt_s = (time.monotonic_ns() - t0) / 1e9
    print(f"\nALL CERTIFICATES GENERATED AND DUAL-VERIFIED END-TO-END IN {dt_s:.1f} s!")


if __name__ == "__main__":
    main()
