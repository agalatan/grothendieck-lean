#!/usr/bin/env python3
"""Standalone generator for `cert_real_501.json` (Issues #501, #506, #458).

Usage:  /usr/local/bin/python3 make_cert.py [cert_real_501.json]

Solves 21 contiguous Dual Conic SDPs across kappa_4(F) in [0, 90] with Clarabel, quantizes all
piecewise-linear splines and degree-4 interval polynomials to exact integers over `knot_den = 10**9`
(enforcing exact rational compact-support sums G_2(r_K) == 0 and G_3(r_K) == 0 via integer
gcd(2, 3) = 1 knot balancing), applies exact post-quantization rational polishing, and self-verifies
the resulting JSON dictionary with BOTH `verify.py` (Sturm) and `verify_bernstein.py` (Bernstein +
8-variable symbolic polynomial identity check) before writing `cert_real_501.json`.
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

# 41 exact rational knots in (1/20) Z covering [0, 14]:
R_KNOTS_FR = (
    [Fr(k, 20) for k in range(0, 16)]
    + [Fr(16 + 2 * k, 20) for k in range(0, 8)]
    + [Fr(17 + 2 * k, 10) for k in range(0, 6)]
    + [Fr(30, 10), Fr(34, 10), Fr(39, 10), Fr(45, 10), Fr(52, 10), Fr(60, 10),
       Fr(70, 10), Fr(82, 10), Fr(96, 10), Fr(115, 10), Fr(140, 10)]
)

SLABS = [
    (Fr(0), Fr(1, 4)),
    (Fr(1, 4), Fr(3, 4)),
    (Fr(3, 4), Fr(3, 2)),
    (Fr(3, 2), Fr(5, 2)),
    (Fr(5, 2), Fr(7, 2)),
    (Fr(7, 2), Fr(9, 2)),
    (Fr(9, 2), Fr(6)),
    (Fr(6), Fr(8)),
    (Fr(8), Fr(10)),
    (Fr(10), Fr(12)),
    (Fr(12), Fr(13)),
    (Fr(13), Fr(14)),
    (Fr(14), Fr(16)),
    (Fr(16), Fr(18)),
    (Fr(18), Fr(21)),
    (Fr(21), Fr(25)),
    (Fr(25), Fr(31)),
    (Fr(31), Fr(39)),
    (Fr(39), Fr(49)),
    (Fr(49), Fr(61)),
    (Fr(61), Fr(75)),
    (Fr(75), Fr(90)),
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
        settings.max_iter = 500
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
    sq = isqrt(num_scaled)
    if sq * sq < num_scaled:
        sq += 1
    return Fr(sq, S_SIG)


def poly_eval_np(p, xs):
    res = np.zeros_like(xs, dtype=float)
    for c in reversed(p):
        res = res * xs + float(c)
    return res


def quantize_cs_int(vals_raw, knots_fr, kden):
    """Quantize compactly supported spline values at knots 0..K-1 (with 0 at K) to pure integers
    over `kden` so that 2 * 20 * sum_{j=0}^{K-1} 0.5 * (arr[j] + arr[j+1]) * (r_{j+1} - r_j) == 0!
    Uses interior knots j = 1..14 (each with integer weight 20*(r_{j+1}-r_{j-1}) = 2) and j = 15
    (r_14=14/20, r_15=15/20, r_16=16/20 -> weight 2; j=16 has r_15=15/20, r_17=18/20 -> weight 3!)."""
    K = len(knots_fr) - 1
    ints = [int(round(float(vals_raw[j]) * kden)) for j in range(K)] + [0]
    w20 = [int(20 * (knots_fr[j + 1] - knots_fr[j])) for j in range(K)]
    # Total scaled integral S40 = sum_{j=0}^{K-1} (ints[j] + ints[j+1]) * w20[j]:
    s40 = sum((ints[j] + ints[j + 1]) * w20[j] for j in range(K))
    # Note: shifting ints[15] changes S40 by (w20[14] + w20[15]) = (1 + 1) = 2,
    # while shifting ints[16] changes S40 by (w20[15] + w20[16]) = (1 + 2) = 3!
    assert w20[15] + w20[16] == 3
    if s40 % 2 != 0:
        # Subtract 1 from ints[16] if s40 > 0 else add 1:
        step16 = 1 if s40 > 0 else -1
        ints[16] -= step16
        s40 -= 3 * step16
    assert s40 % 2 == 0
    rem2 = s40 // 2
    # Distribute rem2 evenly across j = 1..14 (each has w20[j-1] + w20[j] = 1 + 1 = 2):
    q14, r14 = divmod(rem2, 14)
    for j in range(1, 15):
        ints[j] -= q14 + (1 if (j - 1) < r14 else 0)
    chk = sum(Fr(1, 2) * (Fr(ints[j], kden) + Fr(ints[j + 1], kden)) * (knots_fr[j + 1] - knots_fr[j]) for j in range(K))
    assert chk == 0
    return ints


def build_slab_row(s_lo_fr, s_hi_fr, pad=6.0e-6, kden=10**9):
    knots_fr = R_KNOTS_FR
    knots = np.array([float(x) for x in knots_fr])
    K = len(knots) - 1

    sig_lo_fr, sig_hi_fr = s32_hi_fr(s_lo_fr), s32_hi_fr(s_hi_fr)
    s_mid_fr = (s_lo_fr + s_hi_fr) / 2
    ssq_lo_fr = 2 * s_mid_fr * s_lo_fr - s_mid_fr * s_mid_fr
    ssq_hi_fr = 2 * s_mid_fr * s_hi_fr - s_mid_fr * s_mid_fr
    if s_lo_fr <= Fr(36):
        x_lo_fr = Fr(0)
    else:
        rem = (s_lo_fr - Fr(36)) / Fr(54)
        x_lo_fr = Fr(isqrt((rem.numerator * (10**12)) // rem.denominator), 10**6)

    lob9 = 0.5 * (1.0 - np.cos(np.pi * np.arange(9) / 8.0))
    int_pts, r_all = [], []
    for k in range(K):
        pts = knots[k] + (knots[k + 1] - knots[k]) * (lob9 if k == K - 1 else lob9[:-1])
        int_pts.append(list(range(len(r_all), len(r_all) + len(pts))))
        r_all.extend(pts)
    tail_pts = np.concatenate([np.linspace(14.0, 50.0, 30), 14.0 * np.geomspace(3.7, 2500.0, 36)])
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
    cb.add_psd(2, [(-pad, [(m00, 1.0)]), (0.0, [(m01, 1.0)]), (-pad, [(m11, 1.0)])])
    mu00, mu01, mu11 = cb.var(), cb.var(), cb.var()
    cb.add_psd(2, [(-pad, [(mu00, 1.0)]), (0.0, [(mu01, 1.0)]), (-pad, [(mu11, 1.0)])])
    gam_vt, gam_ve = cb.var(), cb.var()

    c_br1 = cb.var(K + 1)
    c_br2 = cb.var(K); cb.add_eq([(c_br2[k], G_R[k]) for k in range(K)], 0.0)
    c_br3 = cb.var(K); cb.add_eq([(c_br3[k], G_R[k]) for k in range(K)], 0.0)
    c_br4 = cb.var(K - 1)
    c_br7 = cb.var(K - 1)

    lB_kn = cb.var(K + 1)
    Ae_kn = cb.var(K + 1)
    t2_kn = cb.var(K + 1)
    for k in range(K + 1):
        cb.add_nonneg(-pad, [(Ae_kn[k], 1.0)])
        cb.add_nonneg(-pad, [(t2_kn[k], 1.0)])

    tau3_c = [cb.var(5) for _ in range(K)]
    xt_tail0, xt_tail2 = cb.var(), cb.var()
    xe_tail0, xe_tail2 = cb.var(), cb.var()
    for xv in (xt_tail0, xt_tail2, xe_tail0, xe_tail2):
        cb.add_nonneg(0.0, [(xv, 1.0)])

    xi_e_kn = cb.var(K + 1)
    xi_te_kn = cb.var(K + 1)
    for k in range(K + 1):
        cb.add_nonneg(0.0, [(xi_e_kn[k], 1.0)])
        cb.add_nonneg(0.0, [(xi_te_kn[k], 1.0)])

    sc = np.sqrt(3.0) / 4.0
    for k in range(K):
        for w1 in ((0.0, 0.5, 1.0) if k == K - 1 else (0.0, 0.5)):
            w0 = 1.0 - w1
            cb.add_psd(2, [
                (-pad, [(Ae_kn[k], w0), (Ae_kn[k + 1], w1)]),
                (0.0, [(lB_kn[k], np.sqrt(1.5) * w0), (lB_kn[k + 1], np.sqrt(1.5) * w1)]),
                (-pad, [(t2_kn[k], w0), (t2_kn[k + 1], w1)]),
            ])

    def add_pt(idx_r, k_iv):
        rv = r_all[idx_r]; Vv = rv * rv; V2v = Vv * Vv; V3v = V2v * Vv
        h4_terms = [(c_br4[j - 1], -(G_R[j] - G[j, idx_r])) for j in range(1, K)]
        h7_terms = [(c_br7[j - 1], -(G_R[j] - G[j, idx_r])) for j in range(1, K)]
        L_sig = [(c_br2[j], 2.0 * G[j, idx_r]) for j in range(K)] + [(c_br4[j - 1], 2.0 * Phi[j, idx_r]) for j in range(1, K)]
        L_nu = [(c_br3[j], 2.0 * G[j, idx_r]) for j in range(K)] + [(c_br7[j - 1], 2.0 * Phi[j, idx_r]) for j in range(1, K)]

        if k_iv < K:
            w1 = (rv - knots[k_iv]) / (knots[k_iv + 1] - knots[k_iv]); w0 = 1.0 - w1
            lB_here = [(lB_kn[k_iv], w0), (lB_kn[k_iv + 1], w1)]
            lA_here = L_sig + [(col, -val) for col, val in lB_here]
            tau3_here = [(tau3_c[k_iv][m], w1 ** m) for m in range(5)]
            cb.add_psd(3, [
                (0.0, [(mu00, 1.0)]),
                (0.0, [(mu01, 1.0)]), (0.0, [(mu11, 1.0)]),
                (0.0, sc_terms(lA_here, sc)), (0.0, sc_terms(L_nu, sc)), (-pad, tau3_here),
            ])
            ae_term = [(Ae_kn[k_iv], -w0), (Ae_kn[k_iv + 1], -w1)]
            tl2_term = [(t2_kn[k_iv], -w0), (t2_kn[k_iv + 1], -w1)]
            tl3_term = [(col, -val) for col, val in tau3_here]
            xt_here = []
            xe_here = [(xi_e_kn[k_iv], w0), (xi_e_kn[k_iv + 1], w1)]
            xte_here = [(xi_te_kn[k_iv], w0), (xi_te_kn[k_iv + 1], w1)]
        else:
            ae_term, tl2_term, tl3_term = [], [], []
            xt_here = [(xt_tail0, 1.0), (xt_tail2, 1e-3 * (Vv - knots[K]**2))]
            xe_here = [(xe_tail0, 1.0), (xe_tail2, 1e-3 * (Vv - knots[K]**2))]
            xte_here = [(xi_te_kn[K], 1.0)]

        c_1 = [(lam0, 1.0), (lam1, Vv), (lam2, 1e-2 * V2v), (lam3, 1e-5 * V3v), (m00, 1.0), (m01, 2.0), (m11, 1.0), (gam_vt, -Vv), (gam_ve, -Vv)]
        c_1 += [(c_br1[j], -3.0 * rv * G[j, idx_r]) for j in range(K + 1)]
        c_1 += [(c_br2[j], +3.0 * rv * G[j, idx_r]) for j in range(K)]
        c_1 += [(c_br3[j], +3.0 * rv * G[j, idx_r]) for j in range(K)]
        c_1 += [(col, +2.0 * val) for col, val in h7_terms]

        c_tau = [(m00, -2.0), (m01, -2.0), (gam_vt, Vv)] + tl3_term + [(col, -val) for col, val in xt_here]
        c_tau += [(c_br1[j], 3.0 * Phi[j, idx_r]) for j in range(K + 1)]
        c_tau += [(c_br2[j], -3.0 * Phi[j, idx_r] - 3.0 * rv * G[j, idx_r]) for j in range(K)]
        c_tau += [(c_br3[j], -3.0 * Phi[j, idx_r]) for j in range(K)]
        c_tau += [(col, -4.0 * val) for col, val in h4_terms]

        c_eta = [(m01, -2.0), (m11, -2.0), (gam_ve, Vv)] + ae_term + [(col, -val) for col, val in xe_here]
        c_eta += [(c_br3[j], -3.0 * rv * G[j, idx_r]) for j in range(K)]
        c_eta += [(col, +4.0 * val) for col, val in h4_terms] + [(col, -2.0 * val) for col, val in h7_terms]

        c_tau2 = [(m00, 1.0)] + tl2_term + [(c_br2[j], 3.0 * Phi[j, idx_r]) for j in range(K)]
        c_te = [(m01, 2.0)] + [(col, -val) for col, val in xte_here] + [(c_br3[j], 3.0 * Phi[j, idx_r]) for j in range(K)]
        c_eta2 = [(m11, 1.0)]

        S_fac = (1.0 + 0.05 * Vv) ** 1.5
        cb.add_psd(3, [
            (-rv / (S_fac * S_fac) - 1.5 * pad, sc_terms(c_1, 1.0 / (S_fac * S_fac))),
            (0.0, sc_terms(c_tau, 0.5 / S_fac)),
            (-pad, c_tau2),
            (0.0, sc_terms(c_eta, 0.5 / S_fac)),
            (0.0, sc_terms(c_te, 0.5)),
            (-pad, c_eta2),
        ])

    for k in range(K):
        for idx_r in int_pts[k]:
            add_pt(idx_r, k)
    for k in range(K - 1):
        idx_e = int_pts[k + 1][0]
        L_sig_e = [(c_br2[j], 2.0 * G[j, idx_e]) for j in range(K)] + [(c_br4[j - 1], 2.0 * Phi[j, idx_e]) for j in range(1, K)]
        L_nu_e = [(c_br3[j], 2.0 * G[j, idx_e]) for j in range(K)] + [(c_br7[j - 1], 2.0 * Phi[j, idx_e]) for j in range(1, K)]
        lA_e = L_sig_e + [(lB_kn[k + 1], -1.0)]
        tau3_e = [(tau3_c[k][m], 1.0) for m in range(5)]
        cb.add_psd(3, [
            (0.0, [(mu00, 1.0)]),
            (0.0, [(mu01, 1.0)]), (0.0, [(mu11, 1.0)]),
            (0.0, sc_terms(lA_e, sc)), (0.0, sc_terms(L_nu_e, sc)), (-pad, tau3_e),
        ])
        cb.add_eq([(tau3_c[k][m], 1.0) for m in range(5)] + [(tau3_c[k + 1][0], -1.0)], 0.0)
    for idx_r in tail_idxs:
        add_pt(idx_r, K)

    xs_samp = np.linspace(float(x_lo_fr), 1.0, 60)
    for s_fr, sig_fr, ssq_fr in [(s_lo_fr, sig_lo_fr, ssq_lo_fr), (s_hi_fr, sig_hi_fr, ssq_hi_fr)]:
        sv, sigv, ssqv = float(s_fr), float(sig_fr), float(ssq_fr)
        for xv in xs_samp:
            qv = 36.0 + 54.0 * xv * xv
            mv = sv / qv; uv = sv * xv * xv / qv
            p6v = 216.0 * (67.5 * (xv ** 3) + 45.0 * (xv ** 2) + 150.0 * xv)
            k6_ub = sigv * p6v / (qv ** 1.5) - 4320.0 * ssqv / (qv ** 2)
            ev2 = 3.0 + sv; ev3 = 15.0 + 15.0 * sv + k6_ub
            cb.add_nonneg(0.0, [
                (t_obj, 1.0),
                (lam0, -1.0), (lam1, -1.0), (lam2, -1e-2 * ev2), (lam3, -1e-5 * ev3),
                (m00, -(8.0 * mv + 6.0 * uv)), (m01, -(8.0 * mv)), (m11, -(2.0 * mv)),
                (mu00, -(16.0 * mv + 24.0 * uv)), (mu01, -(16.0 * mv)), (mu11, -(4.0 * mv)),
                (gam_vt, -(sv / 3.0)), (gam_ve, -(6.0 * mv)),
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
    Ae_i = [max(1, q_int(x_sol[Ae_kn[j]])) for j in range(K + 1)]
    t2_i = [max(1, q_int(x_sol[t2_kn[j]])) for j in range(K + 1)]
    tau3_i = [[q_int(x_sol[tau3_c[k][m]]) for m in range(5)] for k in range(K)]
    xt0_i = max(0, q_int(x_sol[xt_tail0]))
    xt2_i = max(0, q_int(1e-3 * x_sol[xt_tail2]))
    xe0_i = max(0, q_int(x_sol[xe_tail0]))
    xe2_i = max(0, q_int(1e-3 * x_sol[xe_tail2]))
    xe_i = [max(0, q_int(x_sol[xi_e_kn[j]])) for j in range(K + 1)]
    xte_i = [max(0, q_int(x_sol[xi_te_kn[j]])) for j in range(K + 1)]

    kden_fr = Fr(kden)
    lam0_q = Fr(q_int(x_sol[lam0] + 2.0e-6), kden)
    lam1_q = Fr(q_int(x_sol[lam1]), kden)
    lam2_q = Fr(int(round(float(1e-2 * x_sol[lam2]) * (10**12))), 10**12)
    lam3_q = max(Fr(1, 10**13), Fr(int(round(float(1e-5 * x_sol[lam3]) * (10**13))), 10**13))
    m00_q, m01_q, m11_q = Fr(q_int(x_sol[m00]), kden), Fr(q_int(x_sol[m01]), kden), Fr(q_int(x_sol[m11]), kden)
    mu00_q, mu01_q, mu11_q = Fr(q_int(x_sol[mu00]), kden), Fr(q_int(x_sol[mu01]), kden), Fr(q_int(x_sol[mu11]), kden)
    gvt_q, gve_q = Fr(q_int(x_sol[gam_vt]), kden), Fr(q_int(x_sol[gam_ve]), kden)

    Dw = mu00_q * mu11_q - mu01_q * mu01_q
    phi1_q = [Fr(x, kden) for x in phi1_i]
    phi2_q = [Fr(x, kden) for x in phi2_i]
    phi3_q = [Fr(x, kden) for x in phi3_i]
    psi4_q = [Fr(x, kden) for x in psi4_i]
    psi7_q = [Fr(x, kden) for x in psi7_i]
    lB_q = [Fr(x, kden) for x in lB_i]
    Ae_q = [Fr(x, kden) for x in Ae_i]
    xe_q = [Fr(x, kden) for x in xe_i]
    xte_q = [Fr(x, kden) for x in xte_i]

    h4_0 = -sum(Fr(1, 2) * (psi4_q[j] + psi4_q[j + 1]) * (knots_fr[j + 1] - knots_fr[j]) for j in range(K))
    h7_0 = -sum(Fr(1, 2) * (psi7_q[j] + psi7_q[j + 1]) * (knots_fr[j + 1] - knots_fr[j]) for j in range(K))
    rv_p = [Fr(0), Fr(1)]

    # Pass 1: Polish t2_i and tau3_i[k][0] in integers over kden:
    G2_v, G3_v, H4_v, H7_v = Fr(0), Fr(0), h4_0, h7_0
    for k in range(K):
        a_lo, b_hi = knots_fr[k], knots_fr[k + 1]
        lin_p = lambda arr, k=k, a_lo=a_lo, b_hi=b_hi: V1.ptrim([arr[k] - ((arr[k + 1] - arr[k]) / (b_hi - a_lo)) * a_lo, (arr[k + 1] - arr[k]) / (b_hi - a_lo)])
        p2, p3, ps4, ps7 = lin_p(phi2_q), lin_p(phi3_q), lin_p(psi4_q), lin_p(psi7_q)
        g2, g3 = V1.pprim(p2, a_lo, G2_v), V1.pprim(p3, a_lo, G3_v)
        h4, h7 = V1.pprim(ps4, a_lo, H4_v), V1.pprim(ps7, a_lo, H7_v)

        lb_p, ae_p = lin_p(lB_q), lin_p(Ae_q)
        while True:
            t2_q_loc = [Fr(t2_i[k], kden), Fr(t2_i[k + 1], kden)]
            sl_t2 = (t2_q_loc[1] - t2_q_loc[0]) / (b_hi - a_lo)
            t2_p = V1.ptrim([t2_q_loc[0] - sl_t2 * a_lo, sl_t2])
            if V1.positive_on(V1.psub(V1.pmul(ae_p, t2_p), V1.pscale(V1.pmul(lb_p, lb_p), Fr(3, 2))), a_lo, b_hi):
                break
            t2_i[k] += max(1, kden // 10**6)
            t2_i[k + 1] += max(1, kden // 10**6)

        Lsig, Lnu = V1.pscale(V1.padd(g2, ps4), Fr(2)), V1.pscale(V1.padd(g3, ps7), Fr(2))
        lA_p = V1.psub(Lsig, lb_p)
        q_form = V1.padd(V1.psub(V1.pscale(V1.pmul(lA_p, lA_p), mu11_q), V1.pscale(V1.pmul(lA_p, Lnu), 2 * mu01_q)), V1.pscale(V1.pmul(Lnu, Lnu), mu00_q))
        T3_exact = V1.pscale(q_form, Fr(3) / (16 * Dw))
        p_w1 = V1.pscale([-a_lo, Fr(1)], Fr(1) / (b_hi - a_lo))

        while True:
            T3_p, pw = [], [Fr(1)]
            for m in range(5):
                T3_p = V1.padd(T3_p, V1.pscale(pw, Fr(tau3_i[k][m], kden)))
                pw = V1.pmul(pw, p_w1)
            if V1.positive_on(V1.psub(T3_p, T3_exact), a_lo, b_hi):
                break
            rs_g = np.linspace(float(a_lo), float(b_hi), 400)
            min_d = float(np.min(poly_eval_np(V1.psub(T3_p, T3_exact), rs_g)))
            tau3_i[k][0] += max(10, int(np.ceil((max(0.0, -min_d) + 3e-7) * kden)))

        G2_v, G3_v, H4_v, H7_v = V1.peval(g2, b_hi), V1.peval(g3, b_hi), V1.peval(h4, b_hi), V1.peval(h7, b_hi)

    t2_q = [Fr(x, kden) for x in t2_i]
    tau3_q = [[Fr(x, kden) for x in sub] for sub in tau3_i]

    # Pass 2: Polish M2 > 0 and M3 > 0 (using lam3_q on tail k==K, lam2_q on [6, 14], lam0_q on [0, 6])!
    for _ in range(10):
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
                ae_p, t2_p, xe_p = lin_p(Ae_q), lin_p(t2_q), lin_p(xe_q)
                g2, g3 = V1.pprim(p2, a_lo, G2_v), V1.pprim(p3, a_lo, G3_v)
                h4, h7 = V1.pprim(ps4, a_lo, H4_v), V1.pprim(ps7, a_lo, H7_v)
                p_w1 = V1.pscale([-a_lo, Fr(1)], Fr(1) / (b_hi - a_lo))
                T3_p, pw = [], [Fr(1)]
                for m in range(5):
                    T3_p = V1.padd(T3_p, V1.pscale(pw, tau3_q[k][m]))
                    pw = V1.pmul(pw, p_w1)
                xt_p = []
                G1_v, G2_v, G3_v, H4_v, H7_v = V1.peval(g1, b_hi), V1.peval(g2, b_hi), V1.peval(g3, b_hi), V1.peval(h4, b_hi), V1.peval(h7, b_hi)
            else:
                p2 = p3 = g2 = g3 = h4 = h7 = ae_p = t2_p = T3_p = []
                rK2 = knots_fr[K] ** 2
                xt_p = V1.ptrim([Fr(xt0_i, kden) - Fr(xt2_i, kden) * rK2, Fr(0), Fr(xt2_i, kden)])
                xe_p = V1.ptrim([Fr(xe0_i, kden) - Fr(xe2_i, kden) * rK2, Fr(0), Fr(xe2_i, kden)])

            P12 = V1.psub(V1.padd([m01_q], V1.pscale(p3, Fr(3, 2))), V1.pscale(xte_p, Fr(1, 2)))
            P11 = V1.psub(V1.padd([m00_q], V1.pscale(p2, Fr(3))), t2_p)
            c_eta = V1.psub(V1.padd(V1.psub([-2 * m01_q - 2 * m11_q, Fr(0), gve_q], V1.pscale(V1.pmul(rv_p, g3), Fr(3))), V1.psub(V1.pscale(h4, Fr(4)), V1.pscale(h7, Fr(2)))), V1.padd(ae_p, xe_p))
            P02 = V1.pscale(c_eta, Fr(1, 2))
            c_tau = V1.psub(V1.psub(V1.psub(V1.padd([-2 * m00_q - 2 * m01_q, Fr(0), gvt_q], V1.pscale(V1.psub(V1.psub(p1, p2), p3), Fr(3))), V1.pscale(V1.pmul(rv_p, g2), Fr(3))), V1.pscale(h4, Fr(4))), V1.padd(T3_p, xt_p))
            P01 = V1.pscale(c_tau, Fr(1, 2))
            P00 = V1.padd(V1.padd([lam0_q + m00_q + 2 * m01_q + m11_q, Fr(-1), lam1_q - gvt_q - gve_q, Fr(0), lam2_q, Fr(0), lam3_q], V1.pscale(V1.pmul(rv_p, V1.psub(V1.padd(g2, g3), g1)), Fr(3))), V1.pscale(h7, Fr(2)))

            M2 = V1.psub(V1.pscale(P11, m11_q), V1.pmul(P12, P12))
            q_off = V1.psub(V1.padd(V1.pscale(V1.pmul(P01, P01), m11_q), V1.pmul(V1.pmul(P02, P02), P11)), V1.pscale(V1.pmul(P01, V1.pmul(P02, P12)), Fr(2)))
            M3 = V1.psub(V1.pmul(P00, M2), q_off)
            if not V1.positive_on(M2, a_lo, b_hi):
                m00_q += Fr(1, 10**6)
                any_fail = True
            if not V1.positive_on(M3, a_lo, b_hi):
                any_fail = True
                rs_g = (14.0 / np.linspace(1.0, 1e-5, 4000)) if tail else np.linspace(float(a_lo), float(b_hi), 600)
                def_p00 = poly_eval_np(q_off, rs_g) / np.maximum(1e-12, poly_eval_np(M2, rs_g)) - poly_eval_np(P00, rs_g)
                if tail:
                    req_l3 = max(0.0, float(np.max(def_p00 / (rs_g ** 6))))
                    b3 = Fr(max(1, int(np.ceil((req_l3 * 1.08 + 2e-11) * (10**12)))), 10**12)
                    if b3 > b3_max:
                        b3_max = b3
                elif float(a_lo) >= 6.0:
                    req_l2 = max(0.0, float(np.max(def_p00 / (rs_g ** 4))))
                    b2 = Fr(max(1, int(np.ceil((req_l2 * 1.08 + 5e-9) * kden))), kden)
                    if b2 > b2_max:
                        b2_max = b2
                else:
                    need = max(0.0, float(np.max(def_p00)))
                    b0 = Fr(max(10, int(np.ceil((need * 1.08 + 5e-7) * kden))), kden)
                    if b0 > b0_max:
                        b0_max = b0
        if not any_fail:
            break
        lam0_q += b0_max
        lam2_q += b2_max
        lam3_q += b3_max

    C0 = lam0_q + lam1_q + 3 * lam2_q + 15 * lam3_q
    Cs = lam2_q + 15 * lam3_q + gvt_q / 3
    Cm = 8 * m00_q + 8 * m01_q + 2 * m11_q + 16 * mu00_q + 16 * mu01_q + 4 * mu11_q + 6 * gve_q
    Cu = 6 * m00_q + 24 * mu00_q
    qx = [Fr(36), Fr(0), Fr(54)]; qx2 = V1.pmul(qx, qx)
    P6x = [Fr(0), Fr(32400), Fr(9720), Fr(14580)]; P6sq_q = V1.pmul(V1.pmul(P6x, P6x), qx)
    xs_fine = np.linspace(float(x_lo_fr), 1.0, 4000)
    sup_fl = 0.0
    for s_fr, sig_fr, ssq_fr in [(s_lo_fr, sig_lo_fr, ssq_lo_fr), (s_hi_fr, sig_hi_fr, ssq_hi_fr)]:
        sv, sigv, ssqv = float(s_fr), float(sig_fr), float(ssq_fr)
        qv = 36.0 + 54.0 * xs_fine * xs_fine
        p6v = 216.0 * (67.5 * (xs_fine ** 3) + 45.0 * (xs_fine ** 2) + 150.0 * xs_fine)
        val = float(C0) + sv * (float(Cs) + (float(Cm) + float(Cu) * xs_fine * xs_fine) / qv) + float(lam3_q) * (sigv * p6v / (qv ** 1.5) - 4320.0 * ssqv / (qv ** 2))
        sup_fl = max(sup_fl, float(np.max(val)))
    B_fr = Fr(int(np.ceil((sup_fl + 1.0e-6) * 10**8)), 10**8)
    while True:
        mom_ok = True
        for s_fr, sig_fr, ssq_fr in [(s_lo_fr, sig_lo_fr, ssq_lo_fr), (s_hi_fr, sig_hi_fr, ssq_hi_fr)]:
            Nx = V1.padd(V1.psub(V1.pscale(qx2, B_fr - C0 - s_fr * Cs), V1.pmul([s_fr * Cm, Fr(0), s_fr * Cu], qx)), [4320 * lam3_q * ssq_fr])
            diff_x = V1.psub(V1.pmul(Nx, Nx), V1.pscale(P6sq_q, (lam3_q * sig_fr) ** 2))
            if not (V1.positive_on(Nx, x_lo_fr, Fr(1)) and V1.positive_on(diff_x, x_lo_fr, Fr(1))):
                mom_ok = False
        if mom_ok:
            break
        B_fr += Fr(1, 10**7)

    row_dict = {
        's_lo': str(s_lo_fr),
        's_hi': str(s_hi_fr),
        'bound': str(B_fr),
        'sig_lo': str(sig_lo_fr),
        'sig_hi': str(sig_hi_fr),
        'x_lo': str(x_lo_fr),
        'knot_den': kden,
        'knots': [str(x) for x in knots_fr],
        'lam': [str(lam0_q), str(lam1_q), str(lam2_q), str(lam3_q)],
        'm_ker': [str(m00_q), str(m01_q), str(m11_q)],
        'm_w': [str(mu00_q), str(mu01_q), str(mu11_q)],
        'gam': [str(gvt_q), str(gve_q)],
        'phi1': phi1_i,
        'phi2': phi2_i,
        'phi3': phi3_i,
        'psi4': psi4_i,
        'psi7': psi7_i,
        'lB': lB_i,
        'Ae': Ae_i,
        't2': t2_i,
        'tau3': tau3_i,
        'tail_xi': [xt0_i, xt2_i, xe0_i, xe2_i],
        'xe': xe_i,
        'xte': xte_i,
    }
    V1.verify_row(row_dict)
    VB.verify_row_bernstein(row_dict)
    return row_dict


def find_sixth_fail_s(rho, t_clip):
    e, eta, target, carrier = Fr(39, 50), Fr(779, 10000), Fr(500, 701), Fr(431, 500)
    shift = Fr(21, 200)
    sc12 = 10**12
    gran = Fr(1, sc12)
    t1 = t_clip + Fr(1, 10**8)
    x1 = rho * rho - (carrier * t1) ** 2
    z1 = ((1 + shift) ** 2) * x1
    for sw in [Fr(1, 10**8)] + [Fr(sn, 1000) for sn in range(1, 3500, 5)]:
        sq_s_up = Fr(isqrt(int(sw * (sc12 ** 2))) + 1, sc12)
        mlo = 6 + 9 * sw + V1.C6_CPLX * sw * (sq_s_up - gran)
        den_lo = Fr(isqrt(int(z1 * mlo * (sc12 ** 2))), sc12) + Fr(isqrt(int((2 + sw) * (sc12 ** 2))), sc12)
        corr_hi = ((z1 * (2 + sw) - 1) ** 2) / (den_lo * den_lo) - shift * shift * x1
        if eta + (1 - eta) * t1 * t1 + (e - eta) * x1 - eta * corr_hi > target:
            return sw
    raise RuntimeError('could not find rational s_fail for 4.18e sixth-moment next 10^-8 step')


def main():
    out_path = pathlib.Path(sys.argv[1]) if len(sys.argv) > 1 else (HERE / 'cert_real_501.json')
    t0 = time.monotonic_ns()
    rows = []
    for idx, (slo, shi) in enumerate(SLABS):
        rdict = build_slab_row(slo, shi)
        rows.append(rdict)
        print(f'[{idx:2d}/{len(SLABS)}] s in [{str(slo):>4s}, {str(shi):>4s}] -> bound = {float(Fr(rdict["bound"])):.8f}  (Sturm + Bern8 OK)', flush=True)

    rho = Fr(2221, 2500)
    t_clip = Fr(45406137, 100000000)
    s_fail = find_sixth_fail_s(rho, t_clip)

    cert = {
        'claim_real': '3999/5000',
        'sharp_hi_s': '14',
        'sharp_hi_claim_real': '3989/5000',
        'claim_complex': '2221/2500',
        'sharp_hi_chi': '28/3',
        'sharp_hi_claim_complex': '4431/5000',
        'downstream': {
            'deg7_1403_cap': str(Fr(1000, 1403) / (rho * rho)),
            'deg5_1402_cap': str(Fr(500, 701) / (rho * rho)),
            'd5_418a_cutoff': '160633/500000',
            'd5_418e_parseval': '45041147/100000000',
            'd5_418e_sixth_moment': '45406137/100000000',
            'd5_418e_sixth_tang': '7071/5000',
            'd5_418e_sixth_fail_s': str(s_fail),
            'd5_418e_lean_mass': '45016597/100000000',
            'd5_418f_spectral_24_pure': '45287/100000',
            'd5_418f_spectral_24_kng': '11331/25000',
        },
        'rows': rows,
    }

    txt = json.dumps(cert, separators=(',', ':')) + '\n'
    out_path.write_text(txt, encoding='utf-8')
    sz = out_path.stat().st_size
    print(f'\nWrote {out_path} ({sz:,} bytes < 300,000 bytes)')
    require_sz = sz < 300_000
    if not require_sz:
        raise RuntimeError(f'certificate exceeds 300 KB: {sz}')

    V1.verify_certificate_dict(cert, quiet=True)
    VB.verify_certificate_dict_bernstein(cert, quiet=True)
    dt_s = (time.monotonic_ns() - t0) / 1e9
    print(f'BOTH STURM AND BERNSTEIN + SYMBOLIC VERIFIERS PASSED END-TO-END ({dt_s:.1f} s)')


if __name__ == '__main__':
    main()
