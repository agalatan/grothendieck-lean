#!/usr/bin/env python3
"""Standalone generator for both KADS458 certificates:
  1. `cert_shifted_q_458.json` — Shifted first-plus-second chaos variance bound Var|t + Q| >= (17/50) S^2 > (1/3) S^2
     across all t in R and all Q = sum_i lam_i (G_i^2 - 1) + sig Z, plus mixed cubic <= (4091/5000)||F||_2;
  2. `cert_v7_458.json` — Seventh Wiener chaos V_7(R^n) & complex heptic chaos H_{4,3}(C^n) Level-2 OU tower + tail.

Usage:
    /usr/local/bin/python3 make_certs.py
"""
from fractions import Fraction as Fr
import json
import math
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

    def add_psd_dict(self, n, entries):
        sq2 = math.sqrt(2.0)
        for j in range(n):
            for i in range(j + 1):
                c, terms = entries.get((i, j), (0.0, []))
                s = 1.0 if i == j else sq2
                self._append_row([(col, val * s) for col, val in terms], c * s)
        self.cones.append(clarabel.PSDTriangleConeT(n))

    def add_psd_list(self, n, entries):
        sq2 = math.sqrt(2.0)
        ptr = 0
        for j in range(n):
            for i in range(j + 1):
                c, terms = entries[ptr]
                ptr += 1
                s = 1.0 if i == j else sq2
                self._append_row([(col, val * s) for col, val in terms], c * s)
        self.cones.append(clarabel.PSDTriangleConeT(n))

    def solve(self, obj_terms, reg=0.0):
        q = np.zeros(self.nvars)
        obj_cols = set()
        for col, w in obj_terms:
            q[int(col)] += float(w)
            obj_cols.add(int(col))
        if reg > 0.0:
            p_diag = np.full(self.nvars, float(reg), dtype=float)
            for col in obj_cols:
                p_diag[col] = 0.0
            P = sp.diags(p_diag, format="csc")
        else:
            P = sp.csc_matrix((self.nvars, self.nvars))
        A = sp.csc_matrix((self.vals, (self.rows, self.cols)), shape=(self.nrows, self.nvars))
        b = np.array(self.b_list, dtype=float)
        settings = clarabel.DefaultSettings()
        settings.verbose = False
        settings.tol_gap_abs = 1e-11
        settings.tol_gap_rel = 1e-11
        settings.tol_feas = 1e-11
        solver = clarabel.DefaultSolver(P, q, A, b, self.cones, settings)
        return solver.solve()


def poly_eval_np(p_cfs, xs):
    if not p_cfs:
        return np.zeros_like(xs, dtype=float)
    acc = np.zeros_like(xs, dtype=float)
    for c in reversed(p_cfs):
        acc = acc * xs + float(c)
    return acc


# ==============================================================================
# PART 1: GENERATOR FOR `cert_shifted_q_458.json`
# ==============================================================================
def exact_hole_umin(v_lo: Fr) -> Fr:
    if v_lo <= Fr(1):
        return Fr(0)
    s_fl = V1.rat_sqrt_floor(v_lo - Fr(1))
    q_A = (Fr(1) + s_fl) / 2
    alpha_lo = V1.rat_sqrt_floor(q_A ** 3)
    beta_hi = V1.rat_sqrt_ceil((Fr(1) - q_A) ** 3)
    # Largest clean rational in (1/10000) Z <= sqrt(2) * (alpha_lo - beta_hi):
    sq_bound = Fr(2) * ((alpha_lo - beta_hi) ** 2)
    u_fl = V1.rat_sqrt_floor(sq_bound, scale=10000)
    V1.verify_hole_lower_bound(v_lo, u_fl)
    return u_fl


def exact_vtop_for_babs(b_abs: Fr, v_lo: Fr, v_hi: Fr) -> Fr:
    if v_hi <= Fr(1):
        return v_hi
    # Binary search smallest rational multiple of 1/10000 in [max(1, v_lo), v_hi] that passes verify_vtop_cap:
    lo_i = int(math.ceil(float(max(Fr(10001, 10000), v_lo)) * 10000))
    hi_i = int(math.ceil(float(v_hi) * 10000))
    if lo_i >= hi_i:
        return v_hi
    best = v_hi
    # Check if even hi_i - 1 works:
    try:
        V1.verify_vtop_cap(b_abs, Fr(lo_i, 10000), v_hi)
        return max(v_lo, Fr(lo_i, 10000))
    except ValueError:
        pass
    l_idx, r_idx = lo_i, hi_i
    while l_idx <= r_idx:
        mid = (l_idx + r_idx) // 2
        cand = Fr(mid, 10000)
        if cand >= v_hi:
            r_idx = mid - 1
            continue
        try:
            V1.verify_vtop_cap(b_abs, cand, v_hi)
            best = cand
            r_idx = mid - 1
        except ValueError:
            l_idx = mid + 1
    return max(v_lo, best)


def build_hat_and_prim_np(knots: np.ndarray, x_eval: np.ndarray):
    K = len(knots) - 1
    N = len(x_eval)
    Phi = np.zeros((K - 1, N))
    Psi = np.zeros((K - 1, N))
    areas = np.zeros(K - 1)
    for idx_j in range(K - 1):
        j = idx_j + 1
        xL, xM, xR = knots[j - 1], knots[j], knots[j + 1]
        areas[idx_j] = 0.5 * (xR - xL)
        for i, x in enumerate(x_eval):
            if x <= xL:
                pass
            elif x <= xM:
                h = xM - xL
                Phi[idx_j, i] = (x - xL) / h
                Psi[idx_j, i] = 0.5 * ((x - xL) ** 2) / h
            elif x <= xR:
                h = xR - xM
                Phi[idx_j, i] = (xR - x) / h
                Psi[idx_j, i] = 0.5 * (xM - xL) + (x - xM) - 0.5 * ((x - xM) ** 2) / h
            else:
                Psi[idx_j, i] = areas[idx_j]
    return Phi, Psi, areas


def quantize_shifted_spline(c_fl, knots_fr, kden):
    """Quantize M = 21 interior knot values to integers so sum_j c_int[j] * (knots_fr[j+2] - knots_fr[j]) == 0!
    Uses wide outer knots j in {0, 4, 5, 6, 14, 15, 16, 20} (weights 240, 85, 60, 43; note 2*43 - 85 == 1)
    so the max integer adjustment at any knot is <= 3 (perturbation < 2e-6 at kden = 2*10^6).
    """
    M = len(c_fl)
    area_100 = [int((knots_fr[j + 2] - knots_fr[j]) * 100) for j in range(M)]
    assert area_100[0] == 240 and area_100[4] == 85 and area_100[5] == 60 and area_100[6] == 43
    assert area_100[20] == 240 and area_100[16] == 85 and area_100[15] == 60 and area_100[14] == 43
    c_int = [int(round(float(v) * kden)) for v in c_fl]
    res = sum(c_int[j] * area_100[j] for j in range(M))
    q240 = int(round(res / 240.0))
    q240_a = q240 // 2
    c_int[0] -= q240_a
    c_int[20] -= (q240 - q240_a)
    rem = res - 240 * q240  # |rem| <= 120
    q85 = int(round(rem / 85.0))
    q85_a = q85 // 2
    c_int[4] -= q85_a
    c_int[16] -= (q85 - q85_a)
    rem2 = rem - 85 * q85   # |rem2| <= 42
    best_abc = None
    for A in range(-6, 7):
        for B in range(-6, 7):
            rem_c = -rem2 - 85 * A - 60 * B
            if rem_c % 43 == 0:
                C = rem_c // 43
                if abs(C) <= 6:
                    cand = (A * A + B * B + C * C, A, B, C)
                    if best_abc is None or cand < best_abc:
                        best_abc = cand
    assert best_abc is not None
    _, A, B, C = best_abc
    c_int[4] += A // 2; c_int[16] += A - (A // 2)
    c_int[5] += B // 2; c_int[15] += B - (B // 2)
    c_int[6] += C // 2; c_int[14] += C - (C // 2)
    assert sum(c_int[j] * area_100[j] for j in range(M)) == 0
    return c_int


def build_shifted_cell(t_fr: Fr, a_fr: Fr, b_fr: Fr, v_lo_fr: Fr, v_top_fr: Fr, kden: int = 10**6):
    verts = V1.exact_polygon_vertices(a_fr, b_fr, v_lo_fr, v_top_fr)
    t_val = float(t_fr)
    knots_fr = [-t_fr + off for off in V1.OFFSETS_SHIFTED]
    knots = np.array([float(x) for x in knots_fr])
    K = len(knots) - 1  # 22
    M = K - 1           # 21

    lob15 = 0.5 * (1.0 - np.cos(np.pi * np.arange(15) / 14.0))
    int_pts, xs_int = [], []
    for k in range(K):
        pts = knots[k] + (knots[k + 1] - knots[k]) * lob15
        int_pts.append((k, list(range(len(xs_int), len(xs_int) + len(pts))), lob15))
        xs_int.extend(pts)
    xs_int = np.array(xs_int)
    Phi, Psi, areas = build_hat_and_prim_np(knots, xs_int)

    pad = 8.0e-6
    cb = ConicBuilder()

    def make_cs_spline():
        cs = cb.var(M)
        cb.add_eq([(cs[j], float(areas[j])) for j in range(M)], 0.0)
        return cs

    c_p0 = make_cs_spline()
    c_p1 = make_cs_spline()
    c_p2 = make_cs_spline()
    c_g2 = make_cs_spline()

    alpha_kn = cb.var(K + 1)
    beta_kn = cb.var(K + 1)
    lam_kn = cb.var(K + 1)
    rpos_kn = cb.var(K + 1)
    kap_kn = cb.var(K + 1)
    for k in range(K + 1):
        cb.add_nonneg(0.0, [(lam_kn[k], 1.0)])
        cb.add_nonneg(0.0, [(rpos_kn[k], 1.0)])
        cb.add_nonneg(0.0, [(kap_kn[k], 1.0)])

    r_tail_L0, r_tail_L2, r_tail_R0, r_tail_R2, kap_tail_L, kap_tail_R = [cb.var() for _ in range(6)]
    for v in (r_tail_L0, r_tail_L2, r_tail_R0, r_tail_R2, kap_tail_L, kap_tail_R):
        cb.add_nonneg(0.0, [(v, 1.0)])

    c0, c1, c2, c3, c4, c6 = [cb.var() for _ in range(6)]
    g0, g0_2, g1, g2_s = [cb.var() for _ in range(4)]
    h0, h1 = cb.var(), cb.var()
    gc_pos, gc_neg = cb.var(), cb.var()
    cb.add_nonneg(-1e-7, [(c6, 1.0)])
    cb.add_nonneg(-pad, [(g0, 1.0)])
    cb.add_nonneg(-1e-6, [(g0_2, 1.0)])
    cb.add_nonneg(-pad, [(h0, 1.0)])
    cb.add_nonneg(0.0, [(gc_pos, 1.0)])
    cb.add_nonneg(0.0, [(gc_neg, 1.0)])

    u0_fr = sum(v[0] for v in verts) / len(verts)
    v0_fr = sum(v[1] for v in verts) / len(verts)
    # Round anchor to clean 10^-6 Fraction inside (-RB_OUTER, RB_OUTER):
    u0_fr = Fr(int(round(float(u0_fr) * 10**6)), 10**6)
    v0_fr = Fr(int(round(float(v0_fr) * 10**6)), 10**6)
    rb = V1.RB_OUTER
    qp_fr = (rb * u0_fr - v0_fr) / (rb - u0_fr)
    qm_fr = (rb * u0_fr + v0_fr) / (rb + u0_fr)

    for k in range(K):
        for w1 in (0.0, 0.5, 1.0):
            w0 = 1.0 - w1
            d2_k = [(c_p2[k - 1], w0)] if 1 <= k <= M else []
            d2_kp1 = [(c_p2[k], w1)] if 1 <= k + 1 <= M else []
            cb.add_psd_dict(2, {
                (0, 0): (-pad, [(alpha_kn[k], w0), (alpha_kn[k + 1], w1), (lam_kn[k], -2.0 * w0), (lam_kn[k + 1], -2.0 * w1)]),
                (0, 1): (0.0, [(beta_kn[k], 0.5 * w0), (beta_kn[k + 1], 0.5 * w1)]),
                (1, 1): (-pad, d2_k + d2_kp1 + [(lam_kn[k], w0), (lam_kn[k + 1], w1)]),
            })

    m1_ends_fl = [float(a_fr)] if a_fr == b_fr else [float(a_fr), float(b_fr)]
    for k, idxs, us in int_pts:
        for loc_i, i in enumerate(idxs):
            w1 = float(us[loc_i]); w0 = 1.0 - w1
            x = float(xs_int[i])
            v0_h = [(c_p0[j], float(Psi[j, i])) for j in range(M) if Psi[j, i] != 0.0]
            d0 = [(c_p0[j], float(Phi[j, i])) for j in range(M) if Phi[j, i] != 0.0]
            v1_h = [(c_p1[j], float(Psi[j, i])) for j in range(M) if Psi[j, i] != 0.0]
            d1 = [(c_p1[j], float(Phi[j, i])) for j in range(M) if Phi[j, i] != 0.0]
            v2_h = [(c_p2[j], float(Psi[j, i])) for j in range(M) if Psi[j, i] != 0.0]
            vg2 = [(c_g2[j], float(Psi[j, i])) for j in range(M) if Psi[j, i] != 0.0]
            dg2 = [(c_g2[j], float(Phi[j, i])) for j in range(M) if Phi[j, i] != 0.0]

            p01_terms = (
                [(g0, -1.0), (g0_2, -x**2), (g1, 0.5 * x), (g2_s, 0.5 * x**2),
                 (alpha_kn[k], -0.5 * w0), (alpha_kn[k + 1], -0.5 * w1),
                 (rpos_kn[k], -0.5 * w0), (rpos_kn[k + 1], -0.5 * w1)]
                + [(col, 0.5 * w) for col, w in d0]
                + [(col, -0.5 * w) for col, w in v1_h]
                + [(col, 0.5 * w) for col, w in dg2]
                + [(col, 0.5 * x * w) for col, w in vg2]
            )
            p02_terms = (
                [(h1, 0.5 * x), (beta_kn[k], -0.5 * w0), (beta_kn[k + 1], -0.5 * w1)]
                + [(col, 0.5 * w) for col, w in d1]
                + [(col, -0.5 * w) for col, w in v2_h]
                + [(col, -0.5 * w) for col, w in vg2]
            )
            p11_terms = [(g0, 1.0), (g0_2, x**2), (kap_kn[k], -2.0 * w0), (kap_kn[k + 1], -2.0 * w1)] + [(col, -w) for col, w in dg2]
            p12_terms = [(gc_pos, 0.5), (gc_neg, -0.5)]
            p22_terms = [(h0, 1.0), (kap_kn[k], w0), (kap_kn[k + 1], w1)]

            S_int = (1.0 + 0.05 * x * x) ** 1.5
            for m1_e in m1_ends_fl:
                const_terms = (
                    [(c0, 1.0), (c1, x), (c2, x**2), (c3, x**3), (c4, x**4), (c6, x**6),
                     (g0, 1.0), (g0_2, x**2), (g1, -x), (g2_s, -x**2)]
                    + [(col, -x * w) for col, w in v0_h]
                    + [(col, w) for col, w in v1_h]
                    + [(col, -x * w) for col, w in vg2]
                    + [(col, m1_e * w) for col, w in v2_h]
                )
                cb.add_psd_dict(3, {
                    (0, 0): ((-abs(t_val + x) - 1.5 * pad) / (S_int * S_int), [(c_, v_ / (S_int * S_int)) for c_, v_ in const_terms]),
                    (0, 1): (0.0, [(c_, v_ / S_int) for c_, v_ in p01_terms]),
                    (1, 1): (-pad, p11_terms),
                    (0, 2): (0.0, [(c_, v_ / S_int) for c_, v_ in p02_terms]),
                    (1, 2): (0.0, p12_terms),
                    (2, 2): (-pad, p22_terms),
                })

    for x_end, r0_v, r2_v, kt_v, xs_t in [
        (knots[0], r_tail_L0, r_tail_L2, kap_tail_L, knots[0] - np.concatenate([np.linspace(0.0, 8.0, 22), np.geomspace(8.5, 450.0, 22)])),
        (knots[K], r_tail_R0, r_tail_R2, kap_tail_R, knots[K] + np.concatenate([np.linspace(0.0, 8.0, 22), np.geomspace(8.5, 450.0, 22)])),
    ]:
        for x in xs_t:
            x = float(x)
            dx2 = (x - x_end) ** 2
            S_fac = (1.0 + 0.05 * x * x) ** 1.5
            const_terms = [(c0, 1.0), (c1, x), (c2, x**2), (c3, x**3), (c4, x**4), (c6, x**6), (g0, 1.0), (g0_2, x**2), (g1, -x), (g2_s, -x**2)]
            p01_terms = [(g0, -1.0), (g0_2, -x**2), (g1, 0.5 * x), (g2_s, 0.5 * x**2), (r0_v, -0.5), (r2_v, -0.5 * dx2)]
            p02_terms = [(h1, 0.5 * x)]
            cb.add_psd_dict(3, {
                (0, 0): ((-abs(t_val + x) - 1.5 * pad) / (S_fac * S_fac), [(c_, v_ / (S_fac * S_fac)) for c_, v_ in const_terms]),
                (0, 1): (0.0, [(c_, v_ / S_fac) for c_, v_ in p01_terms]),
                (1, 1): (-pad, [(g0, 1.0), (g0_2, x**2), (kt_v, -2.0)]),
                (0, 2): (0.0, [(c_, v_ / S_fac) for c_, v_ in p02_terms]),
                (1, 2): (0.0, [(gc_pos, 0.5), (gc_neg, -0.5)]),
                (2, 2): (-pad, [(h0, 1.0), (kt_v, 1.0)]),
            })

    U = cb.var()
    for m1_c, m2_c in verts:
        m4_ub = V1.rat_sqrt_ceil(Fr(2) * (m2_c ** 3))
        q6_ub = float(Fr(15) + 90 * m2_c + 40 * m1_c * m1_c + 120 * m4_ub)
        q2_m0sq_ub = float(m2_c + 2 * m1_c * m1_c + 6 * m4_ub)
        m3_ub = float(rb * m2_c - 2 * qp_fr * (rb * m1_c - m2_c) + (qp_fr * qp_fr) * (rb - m1_c))
        m3_lb = float(-rb * m2_c + 2 * qm_fr * (rb * m1_c + m2_c) - (qm_fr * qm_fr) * (rb + m1_c))
        m1_fl, m2_fl, m4_fl = float(m1_c), float(m2_c), float(m4_ub)
        cb.add_nonneg(0.0, [
            (U, 1.0), (c0, -1.0), (c2, -1.0),
            (c3, -2.0 * m1_fl), (c4, -(3.0 + 6.0 * m2_fl)), (c6, -q6_ub),
            (g0, -m2_fl), (g0_2, -q2_m0sq_ub), (g1, -m1_fl), (g2_s, -2.0 * m2_fl),
            (h1, -m2_fl), (h0, -(m1_fl * m1_fl + m4_fl)),
            (gc_pos, -(m1_fl + m3_ub)), (gc_neg, (m1_fl + m3_lb)),
        ])

    sol = cb.solve([(U, 1.0)], reg=1e-11)
    xs = np.array(sol.x, dtype=float)
    q_int = lambda v: int(round(float(v) * kden))

    p0_i = quantize_shifted_spline([xs[c_p0[j]] for j in range(M)], knots_fr, kden)
    p1_i = quantize_shifted_spline([xs[c_p1[j]] for j in range(M)], knots_fr, kden)
    p2_i = quantize_shifted_spline([xs[c_p2[j]] for j in range(M)], knots_fr, kden)
    g2_i = quantize_shifted_spline([xs[c_g2[j]] for j in range(M)], knots_fr, kden)

    alpha_i = [q_int(xs[alpha_kn[k]]) for k in range(K + 1)]
    beta_i = [q_int(xs[beta_kn[k]]) for k in range(K + 1)]
    lam_i = [max(0, q_int(xs[lam_kn[k]])) for k in range(K + 1)]
    rpos_i = [max(0, q_int(xs[rpos_kn[k]])) for k in range(K + 1)]
    kap_i = [max(0, q_int(xs[kap_kn[k]])) for k in range(K + 1)]

    q_s = lambda v, sc_d=10**8: Fr(int(round(float(v) * sc_d)), sc_d)
    c0_q = q_s(xs[c0] + 5e-6)
    c1_q = q_s(xs[c1])
    c2_q = q_s(xs[c2])
    c3_q = q_s(xs[c3])
    c4_q = q_s(xs[c4])
    c6_q = max(Fr(1, 10**9), q_s(xs[c6], 10**10))
    g0_q = max(Fr(1, 10**6), q_s(xs[g0]))
    g0_2_q = max(Fr(1, 10**7), q_s(xs[g0_2], 10**9))
    g1_q = q_s(xs[g1])
    g2_s_q = q_s(xs[g2_s])
    h0_q = max(Fr(1, 10**6), q_s(xs[h0]))
    h1_q = q_s(xs[h1])
    gcp_q = max(Fr(0), q_s(xs[gc_pos]))
    gcn_q = max(Fr(0), q_s(xs[gc_neg]))
    rL0_q, rL2_q = max(Fr(0), q_s(xs[r_tail_L0])), max(Fr(0), q_s(xs[r_tail_L2], 10**10))
    rR0_q, rR2_q = max(Fr(0), q_s(xs[r_tail_R0])), max(Fr(0), q_s(xs[r_tail_R2], 10**10))
    kapL_q, kapR_q = max(Fr(0), q_s(xs[kap_tail_L])), max(Fr(0), q_s(xs[kap_tail_R]))

    p0_v, p0_d = V1.build_cs_splines_exact(knots_fr, p0_i, kden)
    p1_v, p1_d = V1.build_cs_splines_exact(knots_fr, p1_i, kden)
    p2_v, p2_d = V1.build_cs_splines_exact(knots_fr, p2_i, kden)
    g2_v, g2_d = V1.build_cs_splines_exact(knots_fr, g2_i, kden)

    # Pass 1: Polish 2x2 Hankel PSD (lam_i and alpha_i) on every interval k = 0 .. K-1:
    for k in range(K):
        xL, xR = knots_fr[k], knots_fr[k + 1]
        while True:
            la_p = V1.ptrim([Fr(lam_i[k], kden) - ((Fr(lam_i[k + 1] - lam_i[k], kden)) / (xR - xL)) * xL,
                             Fr(lam_i[k + 1] - lam_i[k], kden) / (xR - xL)])
            H11 = V1.padd(p2_d[k], la_p)
            if V1.positive_on(H11, xL, xR):
                break
            lam_i[k] += max(2, kden // 10**5)
            lam_i[k + 1] += max(2, kden // 10**5)
        while True:
            al_p = V1.ptrim([Fr(alpha_i[k], kden) - ((Fr(alpha_i[k + 1] - alpha_i[k], kden)) / (xR - xL)) * xL,
                             Fr(alpha_i[k + 1] - alpha_i[k], kden) / (xR - xL)])
            be_p = V1.ptrim([Fr(beta_i[k], kden) - ((Fr(beta_i[k + 1] - beta_i[k], kden)) / (xR - xL)) * xL,
                             Fr(beta_i[k + 1] - beta_i[k], kden) / (xR - xL)])
            la_p = V1.ptrim([Fr(lam_i[k], kden) - ((Fr(lam_i[k + 1] - lam_i[k], kden)) / (xR - xL)) * xL,
                             Fr(lam_i[k + 1] - lam_i[k], kden) / (xR - xL)])
            H00 = V1.psub(al_p, V1.pscale(la_p, Fr(2)))
            H11 = V1.padd(p2_d[k], la_p)
            H01 = V1.pscale(be_p, Fr(1, 2))
            if V1.positive_on(V1.psub(V1.pmul(H00, H11), V1.pmul(H01, H01)), xL, xR):
                break
            alpha_i[k] += max(2, kden // 10**5)
            alpha_i[k + 1] += max(2, kden // 10**5)

    # Pass 2: Polish M2 and M3 on all intervals and both tails:
    p_x = [Fr(0), Fr(1)]
    m1_ends = [a_fr] if a_fr == b_fr else [a_fr, b_fr]
    for _ in range(16):
        any_fail = False
        b0_need, b4_need, b6_need = Fr(0), Fr(0), Fr(0)
        p12_const = (gcp_q - gcn_q) / 2
        alpha_q = [Fr(v, kden) for v in alpha_i]
        beta_q = [Fr(v, kden) for v in beta_i]
        rpos_q = [Fr(v, kden) for v in rpos_i]
        kap_q = [Fr(v, kden) for v in kap_i]

        for k in range(K):
            xL, xR = knots_fr[k], knots_fr[k + 1]
            lin_kn = lambda arr, k=k, xL=xL, xR=xR: V1.ptrim([arr[k] - ((arr[k + 1] - arr[k]) / (xR - xL)) * xL, (arr[k + 1] - arr[k]) / (xR - xL)])
            al_p, be_p, rp_p, ka_p = lin_kn(alpha_q), lin_kn(beta_q), lin_kn(rpos_q), lin_kn(kap_q)
            P22 = V1.padd([h0_q], ka_p)
            P11 = V1.psub(V1.psub([g0_q, Fr(0), g0_2_q], V1.pscale(ka_p, Fr(2))), g2_d[k])
            M2 = V1.psub(V1.pmul(P11, P22), [p12_const * p12_const])
            if not (V1.positive_on(P22, xL, xR) and V1.positive_on(M2, xL, xR)):
                g0_q += Fr(1, 10**5); h0_q += Fr(1, 10**5); any_fail = True
                continue
            P01 = V1.padd(
                V1.psub([-g0_q, g1_q / 2, -g0_2_q + g2_s_q / 2], V1.pscale(V1.padd(al_p, rp_p), Fr(1, 2))),
                V1.pscale(V1.padd(V1.psub(p0_d[k], p1_v[k]), V1.padd(g2_d[k], V1.pmul(p_x, g2_v[k]))), Fr(1, 2)),
            )
            P02 = V1.padd(
                V1.psub([Fr(0), h1_q / 2], V1.pscale(be_p, Fr(1, 2))),
                V1.pscale(V1.psub(V1.psub(p1_d[k], p2_v[k]), g2_v[k]), Fr(1, 2)),
            )
            abs_tx = [-t_fr, Fr(-1)] if k < 11 else [t_fr, Fr(1)]
            P00_base = V1.psub(
                V1.padd([c0_q + g0_q, c1_q - g1_q, c2_q + g0_2_q - g2_s_q, c3_q, c4_q, Fr(0), c6_q],
                        V1.psub(p1_v[k], V1.pmul(p_x, V1.padd(p0_v[k], g2_v[k])))),
                abs_tx,
            )
            q_off = V1.psub(V1.padd(V1.pmul(V1.pmul(P01, P01), P22), V1.pmul(V1.pmul(P02, P02), P11)), V1.pscale(V1.pmul(P01, P02), 2 * p12_const))
            for m1_e in m1_ends:
                P00 = V1.padd(P00_base, V1.pscale(p2_v[k], m1_e))
                M3 = V1.psub(V1.pmul(P00, M2), q_off)
                if not V1.positive_on(M3, xL, xR):
                    any_fail = True
                    xs_g = np.linspace(float(xL), float(xR), 400)
                    def_p00 = poly_eval_np(q_off, xs_g) / np.maximum(1e-12, poly_eval_np(M2, xs_g)) - poly_eval_np(P00, xs_g)
                    need = max(0.0, float(np.max(def_p00)))
                    b0_need = max(b0_need, Fr(max(5, int(math.ceil((need * 1.15 + 2e-6) * 10**8))), 10**8))

        for side, x_end, sgn_dir, abs_tx, r0_t, r2_t, kt_t in (
            ("L", knots_fr[0], Fr(-1), [-t_fr, Fr(-1)], rL0_q, rL2_q, kapL_q),
            ("R", knots_fr[K], Fr(1), [t_fr, Fr(1)], rR0_q, rR2_q, kapR_q),
        ):
            P22_v = h0_q + kt_t
            P11_x = [g0_q - 2 * kt_t, Fr(0), g0_2_q]
            M2_x = V1.psub(V1.pscale(P11_x, P22_v), [p12_const * p12_const])
            if not V1.positive_on(V1.pcompose_lin(M2_x, x_end, sgn_dir), Fr(0), None):
                g0_q += Fr(1, 10**5); h0_q += Fr(1, 10**5); any_fail = True
                continue
            dx_sq = V1.pmul([-x_end, Fr(1)], [-x_end, Fr(1)])
            r_tail_x = V1.padd([r0_t], V1.pscale(dx_sq, r2_t))
            P01_x = V1.psub([-g0_q, g1_q / 2, -g0_2_q + g2_s_q / 2], V1.pscale(r_tail_x, Fr(1, 2)))
            P02_x = [Fr(0), h1_q / 2]
            P00_x = V1.psub([c0_q + g0_q, c1_q - g1_q, c2_q + g0_2_q - g2_s_q, c3_q, c4_q, Fr(0), c6_q], abs_tx)
            q_off_x = V1.psub(V1.padd(V1.pscale(V1.pmul(P01_x, P01_x), P22_v), V1.pmul(V1.pmul(P02_x, P02_x), P11_x)),
                              V1.pscale(V1.pmul(P01_x, P02_x), 2 * p12_const))
            M3_x = V1.psub(V1.pmul(P00_x, M2_x), q_off_x)
            if not V1.positive_on(V1.pcompose_lin(M3_x, x_end, sgn_dir), Fr(0), None):
                any_fail = True
                us_g = np.concatenate([np.linspace(0.0, 10.0, 400), np.geomspace(10.1, 2000.0, 400)])
                xs_g = float(x_end) + float(sgn_dir) * us_g
                def_p00 = poly_eval_np(q_off_x, xs_g) / np.maximum(1e-12, poly_eval_np(M2_x, xs_g)) - poly_eval_np(P00_x, xs_g)
                req_c6 = max(0.0, float(np.max(def_p00 / np.maximum(1.0, xs_g ** 6))))
                b6_need = max(b6_need, Fr(max(2, int(math.ceil((req_c6 * 1.2 + 5e-10) * 10**10))), 10**10))
                b0_need = max(b0_need, Fr(1, 10**5))

        if not any_fail:
            break
        c0_q += b0_need
        c4_q += b4_need
        c6_q += b6_need

    max_ev = Fr(0)
    for m1_c, m2_c in verts:
        m4_ub = V1.rat_sqrt_ceil(Fr(2) * (m2_c ** 3))
        q6_ub = Fr(15) + 90 * m2_c + 40 * m1_c * m1_c + 120 * m4_ub
        q2_m0sq_ub = m2_c + 2 * m1_c * m1_c + 6 * m4_ub
        m3_ub = rb * m2_c - 2 * qp_fr * (rb * m1_c - m2_c) + (qp_fr * qp_fr) * (rb - m1_c)
        m3_lb = -rb * m2_c + 2 * qm_fr * (rb * m1_c + m2_c) - (qm_fr * qm_fr) * (rb + m1_c)
        ev_ub = (
            c0_q + c2_q + 2 * m1_c * c3_q + (3 + 6 * m2_c) * c4_q + q6_ub * c6_q
            + m2_c * g0_q + q2_m0sq_ub * g0_2_q + m1_c * g1_q + 2 * m2_c * g2_s_q
            + m2_c * h1_q + (m1_c * m1_c + m4_ub) * h0_q
            + (m1_c + m3_ub) * gcp_q - (m1_c + m3_lb) * gcn_q
        )
        if ev_ub > max_ev:
            max_ev = ev_ub

    bnd_fr = Fr((max_ev.numerator * 10**7) // max_ev.denominator + 2, 10**7)
    cell_dict = {
        "a": str(a_fr),
        "b": str(b_fr),
        "v_lo": str(v_lo_fr),
        "v_top": str(v_top_fr),
        "bound": str(bnd_fr),
        "kden": kden,
        "p0": p0_i,
        "p1": p1_i,
        "p2": p2_i,
        "g2": g2_i,
        "alpha": alpha_i,
        "beta": beta_i,
        "lam": lam_i,
        "rpos": rpos_i,
        "kap": kap_i,
        "scalars": {
            "c0": str(c0_q), "c1": str(c1_q), "c2": str(c2_q), "c3": str(c3_q), "c4": str(c4_q), "c6": str(c6_q),
            "g0": str(g0_q), "g0_2": str(g0_2_q), "g1": str(g1_q), "g2": str(g2_s_q),
            "h0": str(h0_q), "h1": str(h1_q), "gc_pos": str(gcp_q), "gc_neg": str(gcn_q),
            "u0": str(u0_fr), "v0": str(v0_fr),
            "rL0": str(rL0_q), "rL2": str(rL2_q), "rR0": str(rR0_q), "rR2": str(rR2_q),
            "kapL": str(kapL_q), "kapR": str(kapR_q),
        },
    }
    V1.verify_shifted_cell(t_fr, cell_dict)
    VB.verify_shifted_cell_bernstein(t_fr, cell_dict, {"leaves": 0, "max_depth": 0})
    return cell_dict


def generate_shifted_cert():
    spec9 = [(Fr(0), Fr(1, 2), 1), (Fr(1, 2), Fr(6, 5), 2), (Fr(6, 5), Fr(2), 2)]
    spec13 = [(Fr(0), Fr(7, 20), 1), (Fr(7, 20), Fr(17, 20), 2), (Fr(17, 20), Fr(7, 5), 2), (Fr(7, 5), Fr(2), 2)]
    spec17 = [(Fr(0), Fr(7, 20), 1), (Fr(7, 20), Fr(17, 20), 2), (Fr(17, 20), Fr(7, 5), 3), (Fr(7, 5), Fr(2), 3)]
    spec5 = [(Fr(0), Fr(4, 5), 1), (Fr(4, 5), Fr(2), 2)]
    t_configs = [
        (Fr(0), [(Fr(0), Fr(7, 20), 1), (Fr(7, 20), Fr(17, 20), 2), (Fr(17, 20), Fr(7, 5), 2), (Fr(7, 5), Fr(2), 2)]),
        (Fr(3, 25), spec9),
        (Fr(1, 4), spec9),
        (Fr(7, 20), spec9),
        (Fr(9, 20), spec9),
        (Fr(3, 5), spec13),
        (Fr(18, 25), spec13),
        (Fr(21, 25), spec17),
        (Fr(24, 25), spec13),
        (Fr(11, 10), spec9),
        (Fr(32, 25), spec5),
        (Fr(3, 2), spec5),
        (Fr(9, 5), [(Fr(0), Fr(1), 1), (Fr(1), Fr(2), 1)]),
        (Fr(11, 5), [(Fr(0), Fr(1), 1), (Fr(1), Fr(2), 1)]),
        (Fr(27, 10), [(Fr(0), Fr(2), 1)]),
        (Fr(16, 5), [(Fr(0), Fr(2), 1)]),
    ]
    kden_sh = 10**6
    t_rows = []
    tot_cells = 0
    for t_fr, slab_specs in t_configs:
        slabs_out = []
        row_max = Fr(0)
        for v_lo, v_hi, n_sub in slab_specs:
            u_min = exact_hole_umin(v_lo)
            u_max = V1.rat_sqrt_ceil(v_hi, scale=10000)
            cells_out = []
            if t_fr == Fr(0):
                edges = [u_min + Fr(j, n_sub) * (u_max - u_min) for j in range(n_sub + 1)]
                for j in range(n_sub):
                    a_c, b_c = edges[j], edges[j + 1]
                    vt = exact_vtop_for_babs(max(abs(a_c), abs(b_c)), v_lo, v_hi)
                    cd = build_shifted_cell(t_fr, a_c, b_c, v_lo, vt, kden=kden_sh)
                    cells_out.append(cd)
                    row_max = max(row_max, Fr(cd["bound"]))
            elif u_min == Fr(0) and n_sub == 1:
                cd = build_shifted_cell(t_fr, -u_max, u_max, v_lo, v_hi, kden=kden_sh)
                cells_out.append(cd)
                row_max = max(row_max, Fr(cd["bound"]))
            else:
                edges = [u_min + Fr(j, n_sub) * (u_max - u_min) for j in range(n_sub + 1)]
                neg_list, pos_list = [], []
                for j in range(n_sub):
                    a_c, b_c = edges[j], edges[j + 1]
                    vt = exact_vtop_for_babs(b_c, v_lo, v_hi)
                    neg_list.insert(0, (-b_c, -a_c, vt))
                    pos_list.append((a_c, b_c, vt))
                for a_c, b_c, vt in neg_list + pos_list:
                    cd = build_shifted_cell(t_fr, a_c, b_c, v_lo, vt, kden=kden_sh)
                    cells_out.append(cd)
                    row_max = max(row_max, Fr(cd["bound"]))
            tot_cells += len(cells_out)
            slabs_out.append({"v_lo": str(v_lo), "v_hi": str(v_hi), "u_min": str(u_min), "u_max": str(u_max), "cells": cells_out})
        t_rows.append({"t": str(t_fr), "bound": str(row_max), "slabs": slabs_out})
        var_lb = (t_fr * t_fr + Fr(1)) - row_max * row_max
        print(f"  [Shifted t={float(t_fr):4.2f}] ({sum(len(s['cells']) for s in slabs_out):2d} cells) -> UB = {float(row_max):.7f}, Var_LB = {float(var_lb):.7f} (Sturm + Bern OK)", flush=True)

    # Build exact rational supporting tangents (Ak, Bk) on each segment [t_k, t_{k+1}]:
    secants = []
    c_sh = V1.C_CLAIM_SHARP  # 33/50
    for k in range(len(t_rows) - 1):
        tL, tR = Fr(t_rows[k]["t"]), Fr(t_rows[k + 1]["t"])
        uL, uR = Fr(t_rows[k]["bound"]), Fr(t_rows[k + 1]["bound"])
        slope = (uR - uL) / (tR - tL)
        Bk = Fr(int(round(float(slope) * 10**9)), 10**9)
        Ak = V1.rat_sqrt_floor(c_sh * (Fr(1) - Bk * Bk), scale=10**10)
        assert Ak >= 0 and Ak * Ak + c_sh * Bk * Bk <= c_sh
        assert uL <= Ak + Bk * tL and uR <= Ak + Bk * tR, f"Secant failed on [{tL}, {tR}]: {float(uL)} vs {float(Ak + Bk * tL)}, {float(uR)} vs {float(Ak + Bk * tR)}"
        secants.append({"A": str(Ak), "B": str(Bk)})

    cert_sh = {
        "kind": "shifted_q_458",
        "var_claim_sharp": str(V1.VAR_CLAIM_SHARP),
        "var_claim_target": str(V1.VAR_CLAIM_TARGET),
        "cubic_mixed_claim": str(V1.CUBIC_MIXED_CLAIM),
        "t_rows": t_rows,
        "secants": secants,
    }
    p_sh = HERE / "cert_shifted_q_458.json"
    p_sh.write_text(json.dumps(cert_sh, separators=(",", ":")) + "\n", encoding="utf-8")
    sz_sh = p_sh.stat().st_size
    print(f"Wrote {p_sh} ({sz_sh:,} bytes < 300,000 bytes, {tot_cells} total cells)")
    assert sz_sh < 300_000
    V1.verify_certificate_dict(cert_sh, quiet=False)
    VB.verify_certificate_dict_bernstein(cert_sh, quiet=False)


# ==============================================================================
# PART 2: GENERATOR FOR `cert_v7_458.json`
# ==============================================================================
def build_hat_basis_r(knots, r_eval):
    K = len(knots) - 1
    N = len(r_eval)
    Phi = np.zeros((K + 1, N))
    G = np.zeros((K + 1, N))
    for j in range(K + 1):
        for idx, r in enumerate(r_eval):
            if j == K and r >= knots[K]:
                Phi[j, idx] = 1.0
            elif j > 0 and knots[j - 1] <= r <= knots[j]:
                Phi[j, idx] = (r - knots[j - 1]) / (knots[j] - knots[j - 1])
            elif j < K and knots[j] <= r <= knots[j + 1]:
                Phi[j, idx] = (knots[j + 1] - r) / (knots[j + 1] - knots[j])
        for idx, r in enumerate(r_eval):
            val = 0.0
            if j > 0 and r > knots[j - 1]:
                hi = min(r, knots[j]); h = knots[j] - knots[j - 1]
                val += 0.5 * ((hi - knots[j - 1]) ** 2) / h
            if j < K and r > knots[j]:
                hi = min(r, knots[j + 1]); h = knots[j + 1] - knots[j]
                val += (hi - knots[j]) - 0.5 * ((hi - knots[j]) ** 2) / h
            if j == K and r > knots[K]:
                val += r - knots[K]
            G[j, idx] = val
    return Phi, G


def quantize_cs_v7(vals_fl, knots_fr, kden):
    """Quantize K values (with phi[K] = 0) so integral_0^{r_K} phi(r) dr == 0!
    Recall R_KNOTS_V7[0..3] = 0, 1/100, 2/100, 3/100:
    200 * G_R[0] = 1, 200 * G_R[1] = 2! Since 200 * G_R[0] == 1, adjusting c_int[0] cancels ANY integer residual!
    """
    K = len(vals_fl)
    w_200 = []
    for j in range(K):
        area2 = (knots_fr[j + 1] - knots_fr[j]) + ((knots_fr[j] - knots_fr[j - 1]) if j > 0 else Fr(0))
        w = area2 * 100
        assert w.denominator == 1
        w_200.append(int(w))
    assert w_200[0] == 1
    c_int = [int(round(float(v) * kden)) for v in vals_fl]
    res = sum(c_int[j] * w_200[j] for j in range(K))
    c_int[0] -= res
    assert sum(c_int[j] * w_200[j] for j in range(K)) == 0
    return c_int + [0]


def build_v7_row(s_lo_fr: Fr, s_hi_fr: Fr, m6_cap_fr: Fr, kden: int = 10**9):
    pad = 2.0e-7 if s_lo_fr < Fr(1, 4) else 1.5e-6
    knots_fr = V1.R_KNOTS_V7
    knots = np.array([float(x) for x in knots_fr])
    K = len(knots) - 1
    rK_fl = knots[K]

    lob11 = 0.5 * (1.0 - np.cos(np.pi * np.arange(11) / 10.0))
    int_pts, r_all = [], []
    for k in range(K):
        pts = knots[k] + (knots[k + 1] - knots[k]) * lob11
        int_pts.append(list(range(len(r_all), len(r_all) + len(pts))))
        r_all.extend(pts)
    tail_pts = np.concatenate([np.linspace(rK_fl, rK_fl * 4.0, 32), rK_fl * np.geomspace(4.2, 800.0, 36)])
    tail_idxs = list(range(len(r_all), len(r_all) + len(tail_pts)))
    r_all.extend(tail_pts)
    r_all = np.array(r_all)
    Phi, G = build_hat_basis_r(knots, r_all)
    G_R = build_hat_basis_r(knots, np.array([knots[K]]))[1][:, 0]
    sc_terms = lambda terms, fac: [(c, v * fac) for c, v in terms]

    cb = ConicBuilder()
    t_obj = cb.var()
    lam0, lam1, lam2, lam3 = cb.var(), cb.var(), cb.var(), cb.var()
    cb.add_nonneg(-1e-8, [(lam3, 1.0)])
    m00, m01, m11 = cb.var(), cb.var(), cb.var()
    cb.add_psd_list(2, [(-pad, [(m00, 1.0)]), (0.0, [(m01, 1.0)]), (-pad, [(m11, 1.0)])])
    mu00, mu01, mu11 = cb.var(), cb.var(), cb.var()
    cb.add_psd_list(2, [(-pad, [(mu00, 1.0)]), (0.0, [(mu01, 1.0)]), (-pad, [(mu11, 1.0)])])
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
    if s_hi_fr <= Fr(1, 4):
        # Pure Level-1 specialization on near-Gaussian slab s <= 1/4 (avoids kc=6 c2k=0 degeneracy):
        for j in range(K):
            cb.add_eq([(c_br2[j], 1.0)], 0.0)
            cb.add_eq([(c_br3[j], 1.0)], 0.0)
        for j in range(K - 1):
            cb.add_eq([(c_br4[j], 1.0)], 0.0)
        for k in range(K + 1):
            cb.add_eq([(lB_kn[k], 1.0)], 0.0)
        for k in range(K):
            for m in range(1, 5):
                cb.add_eq([(tau3_c[k][m], 1.0)], 0.0)
        cb.add_eq([(m01, 1.0)], 0.0)
        cb.add_eq([(mu01, 1.0)], 0.0)
        cb.add_eq([(gam_vt1, 1.0)], 0.0)
        cb.add_eq([(gam_vt2, 1.0)], 0.0)
    xt_tail0, xt_tail2, xe_tail0, xe_tail2 = cb.var(), cb.var(), cb.var(), cb.var()
    for xv in (xt_tail0, xt_tail2, xe_tail0, xe_tail2):
        cb.add_nonneg(0.0, [(xv, 1.0)])
    xi_e_kn, xi_te_kn = cb.var(K + 1), cb.var(K + 1)
    for k in range(K + 1):
        cb.add_nonneg(0.0, [(xi_e_kn[k], 1.0)])
        cb.add_nonneg(0.0, [(xi_te_kn[k], 1.0)])

    sc = math.sqrt(7.0) / 4.0
    sc_lB = math.sqrt(10.5)
    for k in range(K):
        for w1 in (0.0, 0.5, 1.0):
            w0 = 1.0 - w1
            cb.add_psd_list(2, [
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
            cb.add_psd_list(3, [
                (0.0, [(mu00, 1.0)]), (0.0, [(mu01, 1.0)]), (0.0, [(mu11, 1.0)]),
                (0.0, sc_terms(lA_here, sc)), (0.0, sc_terms(L_nu, sc)), (-pad, tau3_here),
            ])
            ae_term = [(Ae_kn[k], -w0), (Ae_kn[k + 1], -w1)]
            tl2_term = [(t2_kn[k], -w0), (t2_kn[k + 1], -w1)]
            tl3_term = [(col, -val) for col, val in tau3_here]
            xe_here = [(xi_e_kn[k], w0), (xi_e_kn[k + 1], w1)]
            xte_here = [(xi_te_kn[k], w0), (xi_te_kn[k + 1], w1)]

            c_1 = [(lam0, 1.0), (lam1, Vv), (lam2, 1e-4 * V2v), (lam3, 1e-12 * V3v),
                   (m00, 1.0), (m01, 2.0), (m11, 1.0), (gam_vt1, -Vv), (gam_vt2, -Vv)]
            c_1 += [(c_br1[j], -7.0 * rv * G[j, idx_r]) for j in range(K + 1)]
            c_1 += [(c_br2[j], +7.0 * rv * G[j, idx_r]) for j in range(K)]
            c_1 += [(c_br3[j], +7.0 * rv * G[j, idx_r]) for j in range(K)]

            c_tau = [(m00, -2.0), (m01, -2.0), (gam_vt1, Vv)] + tl3_term
            c_tau += [(c_br1[j], 7.0 * Phi[j, idx_r]) for j in range(K + 1)]
            c_tau += [(c_br2[j], -7.0 * Phi[j, idx_r] - 7.0 * rv * G[j, idx_r]) for j in range(K)]
            c_tau += [(c_br3[j], -7.0 * Phi[j, idx_r]) for j in range(K)]
            c_tau += [(col, -12.0 * val) for col, val in h4_terms]

            c_eta = [(m01, -2.0), (m11, -2.0), (gam_vt2, Vv)] + ae_term + [(col, -val) for col, val in xe_here]
            c_eta += [(c_br3[j], -7.0 * rv * G[j, idx_r]) for j in range(K)]
            c_eta += [(col, +12.0 * val) for col, val in h4_terms]

            c_tau2 = [(m00, 1.0)] + tl2_term + [(c_br2[j], 7.0 * Phi[j, idx_r]) for j in range(K)]
            c_te = [(m01, 2.0)] + [(col, -val) for col, val in xte_here] + [(c_br3[j], 7.0 * Phi[j, idx_r]) for j in range(K)]
            c_eta2 = [(m11, 1.0)]

            S_fac = (1.0 + 0.01 * Vv) ** 1.5
            cb.add_psd_list(3, [
                (-rv / (S_fac * S_fac) - 1.5 * pad, sc_terms(c_1, 1.0 / (S_fac * S_fac))),
                (0.0, sc_terms(c_tau, 0.5 / S_fac)), (-pad, c_tau2),
                (0.0, sc_terms(c_eta, 0.5 / S_fac)), (0.0, sc_terms(c_te, 0.5)), (-pad, c_eta2),
            ])

    for idx_r in tail_idxs:
        rv = r_all[idx_r]; Vv = rv * rv; V2v = Vv * Vv; V3v = V2v * Vv
        xt_here = [(xt_tail0, 1.0), (xt_tail2, 1e-4 * (Vv - rK_fl**2))]
        xe_here = [(xe_tail0, 1.0), (xe_tail2, 1e-4 * (Vv - rK_fl**2))]
        xte_here = [(xi_te_kn[K], 1.0)]
        c_1 = [(lam0, 1.0), (lam1, Vv), (lam2, 1e-4 * V2v), (lam3, 1e-12 * V3v),
               (m00, 1.0), (m01, 2.0), (m11, 1.0), (gam_vt1, -Vv), (gam_vt2, -Vv)]
        c_1 += [(c_br1[j], -7.0 * rv * G[j, idx_r]) for j in range(K + 1)]
        c_tau = [(m00, -2.0), (m01, -2.0), (gam_vt1, Vv), (c_br1[K], 7.0)] + [(col, -val) for col, val in xt_here]
        c_eta = [(m01, -2.0), (m11, -2.0), (gam_vt2, Vv)] + [(col, -val) for col, val in xe_here]
        c_tau2 = [(m00, 1.0)]; c_te = [(m01, 2.0)] + [(col, -val) for col, val in xte_here]; c_eta2 = [(m11, 1.0)]
        S_fac = (1.0 + 0.01 * Vv) ** 1.5
        cb.add_psd_list(3, [
            (-rv / (S_fac * S_fac) - 1.5 * pad, sc_terms(c_1, 1.0 / (S_fac * S_fac))),
            (0.0, sc_terms(c_tau, 0.5 / S_fac)), (-pad, c_tau2),
            (0.0, sc_terms(c_eta, 0.5 / S_fac)), (0.0, sc_terms(c_te, 0.5)), (-pad, c_eta2),
        ])

    m6_fl = float(m6_cap_fr)
    for s_fr in (s_lo_fr, s_hi_fr):
        sv = float(s_fr)
        for kc in (1, 2, 3, 4, 5, 6):
            ak = 7.0 * sv / (3.0 * (7.0 - kc))
            c1k, c2k = (7.0 - kc) / 7.0, (7.0 - kc) * (6.0 - kc) / 42.0
            cb.add_nonneg(0.0, [
                (t_obj, 1.0),
                (lam0, -1.0), (lam1, -1.0), (lam2, -1e-4 * (3.0 + sv)), (lam3, -1e-12 * m6_fl),
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
    phi2_i = quantize_cs_v7([x_sol[c_br2[j]] for j in range(K)], knots_fr, kden)
    phi3_i = quantize_cs_v7([x_sol[c_br3[j]] for j in range(K)], knots_fr, kden)
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

    q_s14 = lambda v: Fr(int(round(float(v) * 10**14)), 10**14)
    lam0_q = q_s14(x_sol[lam0] + 2e-6)
    lam1_q = q_s14(x_sol[lam1])
    lam2_q = Fr(int(round(float(1e-4 * x_sol[lam2]) * 10**16)), 10**16)
    lam3_q = max(Fr(1, 10**22), Fr(int(round(float(1e-12 * x_sol[lam3]) * 10**22)), 10**22))
    m00_q, m01_q, m11_q = q_s14(x_sol[m00]), q_s14(x_sol[m01]), q_s14(x_sol[m11])
    mu00_q, mu01_q, mu11_q = q_s14(x_sol[mu00]), q_s14(x_sol[mu01]), q_s14(x_sol[mu11])
    gvt1_q, gvt2_q = q_s14(x_sol[gam_vt1]), q_s14(x_sol[gam_vt2])

    Dw = mu00_q * mu11_q - mu01_q * mu01_q
    phi1_q, phi2_q, phi3_q, psi4_q = ([Fr(x, kden) for x in arr] for arr in (phi1_i, phi2_i, phi3_i, psi4_i))
    lB_q, Ae_q, xe_q, xte_q = ([Fr(x, kden) for x in arr] for arr in (lB_i, Ae_i, xe_i, xte_i))
    h4_0 = -sum(Fr(1, 2) * (psi4_q[j] + psi4_q[j + 1]) * (knots_fr[j + 1] - knots_fr[j]) for j in range(K))
    rv_p = [Fr(0), Fr(1)]

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
            if V1.positive_on(V1.psub(V1.pmul(ae_p, t2_p), V1.pscale(V1.pmul(lb_p, lb_p), V1.SIGMA_SQ_COEFF_V7)), a_lo, b_hi):
                break
            t2_i[k] += max(1, kden // 10**6); t2_i[k + 1] += max(1, kden // 10**6)
        Lsig, Lnu = V1.pscale(V1.padd(g2, ps4), Fr(2)), V1.pscale(g3, Fr(2))
        lA_p = V1.psub(Lsig, lb_p)
        q_form = V1.padd(V1.psub(V1.pscale(V1.pmul(lA_p, lA_p), mu11_q), V1.pscale(V1.pmul(lA_p, Lnu), 2 * mu01_q)), V1.pscale(V1.pmul(Lnu, Lnu), mu00_q))
        T3_exact = V1.pscale(q_form, V1.GRAM_COEFF_V7 / Dw)
        p_w1 = V1.pscale([-a_lo, Fr(1)], Fr(1) / (b_hi - a_lo))
        while True:
            T3_p, pw = [], [Fr(1)]
            for m in range(5):
                T3_p = V1.padd(T3_p, V1.pscale(pw, Fr(tau3_i[k][m], kden))); pw = V1.pmul(pw, p_w1)
            if V1.positive_on(V1.psub(T3_p, T3_exact), a_lo, b_hi):
                break
            rs_g = np.linspace(float(a_lo), float(b_hi), 300)
            min_d = float(np.min(poly_eval_np(V1.psub(T3_p, T3_exact), rs_g)))
            tau3_i[k][0] += max(10, int(math.ceil((max(0.0, -min_d) + 3e-7) * kden)))
        G2_v, G3_v, H4_v = V1.peval(g2, b_hi), V1.peval(g3, b_hi), V1.peval(h4, b_hi)

    t2_q = [Fr(x, kden) for x in t2_i]
    tau3_q = [[Fr(x, kden) for x in sub] for sub in tau3_i]

    for _ in range(14):
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

            P12 = V1.psub(V1.padd([m01_q], V1.pscale(p3, Fr(7, 2))), V1.pscale(xte_p, Fr(1, 2)))
            P11 = V1.psub(V1.padd([m00_q], V1.pscale(p2, Fr(7))), t2_p)
            c_eta = V1.psub(V1.padd(V1.psub([-2 * m01_q - 2 * m11_q, Fr(0), gvt2_q], V1.pscale(V1.pmul(rv_p, g3), Fr(7))), V1.pscale(h4, Fr(12))), V1.padd(ae_p, xe_p))
            P02 = V1.pscale(c_eta, Fr(1, 2))
            c_tau = V1.psub(V1.psub(V1.psub(V1.padd([-2 * m00_q - 2 * m01_q, Fr(0), gvt1_q], V1.pscale(V1.psub(V1.psub(p1, p2), p3), Fr(7))), V1.pscale(V1.pmul(rv_p, g2), Fr(7))), V1.pscale(h4, Fr(12))), V1.padd(T3_p, xt_p))
            P01 = V1.pscale(c_tau, Fr(1, 2))
            P00 = V1.padd([lam0_q + m00_q + 2 * m01_q + m11_q, Fr(-1), lam1_q - gvt1_q - gvt2_q, Fr(0), lam2_q, Fr(0), lam3_q], V1.pscale(V1.pmul(rv_p, V1.psub(V1.padd(g2, g3), g1)), Fr(7)))

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
                    rs_near = np.linspace(rK_fl, 600.0, 2000)
                    def_near = poly_eval_np(q_off, rs_near) / np.maximum(1e-12, poly_eval_np(M2, rs_near)) - poly_eval_np(P00, rs_near)
                    need_near = max(0.0, float(np.max(def_near)))
                    if need_near > 0.0:
                        b0_max = max(b0_max, Fr(max(10, int(math.ceil((need_near * 1.15 + 1e-6) * kden))), kden))
                    rs_far = np.geomspace(600.0, 1e6, 2000)
                    def_far = poly_eval_np(q_off, rs_far) / np.maximum(1e-12, poly_eval_np(M2, rs_far)) - (poly_eval_np(P00, rs_far) + float(b0_max))
                    req_l3 = max(0.0, float(np.max(def_far / (rs_far ** 6))))
                    if req_l3 > 0.0:
                        b3_max = max(b3_max, Fr(max(1, int(math.ceil((req_l3 * 1.15 + 1e-21) * 10**21))), 10**21))
                elif float(a_lo) >= 8.0:
                    req_l2 = max(0.0, float(np.max(def_p00 / (rs_g ** 4))))
                    b2_max = max(b2_max, Fr(max(1, int(math.ceil((req_l2 * 1.15 + 1e-13) * 10**15))), 10**15))
                else:
                    need = max(0.0, float(np.max(def_p00)))
                    b0_max = max(b0_max, Fr(max(10, int(math.ceil((need * 1.15 + 5e-7) * kden))), kden))
        if not any_fail:
            break
        lam0_q += b0_max; lam2_q += b2_max; lam3_q += b3_max

    max_ev = Fr(0)
    for s_ep in (s_lo_fr, s_hi_fr):
        for kc in (1, 2, 3, 4, 5, 6):
            ak = Fr(7) * s_ep / (3 * (7 - kc))
            c1_k, c2_k = Fr(7 - kc, 7), Fr((7 - kc) * (6 - kc), 42)
            ev_tot = (
                lam0_q + lam1_q + lam2_q * (3 + s_ep) + lam3_q * m6_cap_fr
                + gvt1_q * (c1_k * ak) + gvt2_q * (c2_k * ak)
                + m00_q * (c1_k * c1_k * ak) + 2 * m01_q * (c1_k * c2_k * ak) + m11_q * (c2_k * c2_k * ak)
                + (2 * kc) * (mu00_q * (c1_k * c1_k * ak) + 2 * mu01_q * (c1_k * c2_k * ak) + mu11_q * (c2_k * c2_k * ak))
            )
            if ev_tot > max_ev:
                max_ev = ev_tot
    B_fr = Fr((max_ev.numerator * 10**7) // max_ev.denominator + 2, 10**7)
    row_dict = {
        "s_lo": str(s_lo_fr), "s_hi": str(s_hi_fr), "bound": str(B_fr), "kden": kden,
        "lam": [str(lam0_q), str(lam1_q), str(lam2_q), str(lam3_q)],
        "M_mat": [str(m00_q), str(m01_q), str(m11_q)],
        "Mw_mat": [str(mu00_q), str(mu01_q), str(mu11_q)],
        "gam_v": [str(gvt1_q), str(gvt2_q)],
        "phi1": phi1_i, "phi2": phi2_i, "phi3": phi3_i, "psi4": psi4_i,
        "lB": lB_i, "Ae": Ae_i, "t2": t2_i, "tau3": tau3_i,
        "tail_xi": [str(xt0_q), str(xt2_q), str(xe0_q), str(xe2_q)],
        "xe": xe_i, "xte": xte_i,
    }
    V1.verify_v7_row(row_dict, m6_cap=m6_cap_fr)
    VB.verify_v7_row_bernstein(row_dict, m6_cap_fr, {"leaves": 0, "max_depth": 0})
    return row_dict


def generate_v7_cert():
    _, pi_hi = V1.verify_pi_bounds()
    slabs_v7 = [(Fr(0), Fr(1, 4)), (Fr(1, 4), Fr(3, 4)), (Fr(3, 4), Fr(2))]
    rows_v7 = []
    for slo, shi in slabs_v7:
        r = build_v7_row(slo, shi, V1.M6_REAL_V7)
        rows_v7.append(r)
        print(f"  [V_7 {str(slo):>4s}..{str(shi):<4s}] -> bound = {float(Fr(r['bound'])):.8f} (Sturm + Bern OK)", flush=True)

    slabs_h43 = [(Fr(0), Fr(1, 4)), (Fr(1, 4), Fr(1, 2)), (Fr(1, 2), Fr(3, 2))]  # chi in [0, 1] => s in [0, 3/2]!
    rows_h43 = []
    for slo, shi in slabs_h43:
        r = build_v7_row(slo, shi, Fr(5, 2) * V1.M6_CPLX_H43)
        rows_h43.append(r)
        print(f"  [H43 {str(slo):>4s}..{str(shi):<4s}] -> slice_real = {float(Fr(r['bound'])):.8f} (Sturm + Bern OK)", flush=True)

    max_v7_low = max(Fr(r["bound"]) for r in rows_v7)
    for cand in (Fr(87, 100), Fr(88, 100), Fr(9, 10), Fr(903, 1000)):
        if max_v7_low <= cand:
            claim_v7_low = cand
            break

    max_h43_sl = max(Fr(r["bound"]) for r in rows_h43)
    for cand in (Fr(24, 25), Fr(97, 100), Fr(99, 100)):
        if (pi_hi ** 2) * (max_h43_sl ** 2) <= 8 * (cand ** 2):
            claim_h43_low = cand
            break

    # Optimize tail B for V_7 (s >= 2, E[(F^2 - 1)^2] >= 4) and H_{4,3} (chi >= 1, E[(|q|^2 - 1)^2] >= 2):
    Bv7 = Fr(math.isqrt(int(V1.M6_REAL_V7) // 2) + 1000)
    best_v7, best_Bv7 = Fr(1), Bv7
    for b_cand in range(1300000, 2600000, 20000):
        Bp = Fr(b_cand)
        ep = Fr(1, 2) / ((Bp + 1) ** 2)
        et = ep * ((Bp * Bp - 1) ** 2) / (Bp ** 6)
        v = Fr(1) - 4 * ep + V1.M6_REAL_V7 * et
        if v < best_v7:
            best_v7, best_Bv7 = v, Bp

    best_h43, best_Bh = Fr(1), Fr(900000)
    for b_cand in range(600000, 1400000, 10000):
        Bp = Fr(b_cand)
        ep = Fr(1, 2) / ((Bp + 1) ** 2)
        et = ep * ((Bp * Bp - 1) ** 2) / (Bp ** 6)
        v = Fr(1) - 2 * ep + V1.M6_CPLX_H43 * et
        if v < best_h43:
            best_h43, best_Bh = v, Bp

    # Clean global `< 1` rationals:
    # Margin on V_7 tail ~ 5e-13 => 1 - 1/10^12 or 1 - 3/10^13:
    for den_pow in (10**12, 2 * 10**12, 5 * 10**12, 10**13):
        cand_v7_g = Fr(den_pow - 1, den_pow)
        if best_v7 <= cand_v7_g and claim_v7_low <= cand_v7_g:
            claim_v7_glob = cand_v7_g
            break
    for den_pow in (10**12, 2 * 10**12, 5 * 10**12, 10**13):
        cand_h_g = Fr(den_pow - 1, den_pow)
        if best_h43 <= cand_h_g and claim_h43_low <= cand_h_g:
            claim_h43_glob = cand_h_g
            break

    cert_v7 = {
        "kind": "v7_tower",
        "v7_s_cut": "2",
        "claim_v7_low": str(claim_v7_low),
        "v7_tail_B": str(best_Bv7),
        "claim_v7_global": str(claim_v7_glob),
        "h43_chi_cut": "1",
        "claim_h43_low": str(claim_h43_low),
        "h43_tail_B": str(best_Bh),
        "claim_h43_global": str(claim_h43_glob),
        "rows_v7": rows_v7,
        "rows_h43_slice": rows_h43,
    }
    p_v7 = HERE / "cert_v7_458.json"
    p_v7.write_text(json.dumps(cert_v7, separators=(",", ":")) + "\n", encoding="utf-8")
    sz_v7 = p_v7.stat().st_size
    print(f"Wrote {p_v7} ({sz_v7:,} bytes < 300,000 bytes)")
    assert sz_v7 < 300_000
    V1.verify_certificate_dict(cert_v7, quiet=False)
    VB.verify_certificate_dict_bernstein(cert_v7, quiet=False)


def main():
    t0 = time.monotonic_ns()
    if "--only-v7" not in sys.argv:
        print("=== GENERATING PART I: `cert_shifted_q_458.json` ===")
        generate_shifted_cert()
    print("\n=== GENERATING PART III: `cert_v7_458.json` ===")
    generate_v7_cert()
    dt = (time.monotonic_ns() - t0) / 1e9
    print(f"\nALL KADS458 CERTIFICATES GENERATED AND DUAL-VERIFIED IN {dt:.1f} s!")


if __name__ == "__main__":
    main()
