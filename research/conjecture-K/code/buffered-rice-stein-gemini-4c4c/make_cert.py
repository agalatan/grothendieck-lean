#!/usr/bin/env python3
"""Offline generator for cert_buffered_rice.json (Issue #784; Agent-ID: gemini-4c4c).

Uses Clarabel + SciPy HiGHS (`/usr/local/bin/python3`) to generate candidate rational Level-2 Matrix Stein
models and 5-scalar Gram LP duals, then calls the pure-stdlib zero-float verifier `verify.py` to certify
every polynomial and rational inequality from first principles.
"""
import bisect
from fractions import Fraction as Fr
import json
from math import isqrt, sqrt
import pathlib
import sys
import time
import clarabel
import numpy as np
from scipy.optimize import linprog
import scipy.sparse as sp

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import verify as VF

OUT_PATH = HERE / "cert_buffered_rice.json"
SQ2 = sqrt(2.0)
C6f = float(VF.C6)
EROWf = [float(x) for x in VF.EROW]
S0f = [float(x) for x in VF.S0_VEC]
H0f = [float(x) for x in VF.H0_VEC]

THETAS = [
    Fr(1, 16), Fr(1, 8), Fr(3, 16), Fr(1, 4), Fr(3, 8), Fr(1, 2), Fr(5, 8), Fr(3, 4),
    Fr(1), Fr(5, 4), Fr(3, 2), Fr(2), Fr(5, 2), Fr(3), Fr(4), Fr(6), Fr(8), Fr(12), Fr(16),
]


class ConicBuilder:
    def __init__(self):
        self.nvars = 0
        self.rows = []
        self.cols = []
        self.vals = []
        self.b_list = []
        self.cones = []
        self.nrows = 0

    def var(self, k=1):
        idx = np.arange(self.nvars, self.nvars + k, dtype=int)
        self.nvars += k
        return idx if k > 1 else int(idx[0])

    def _append_row(self, terms, const):
        r = self.nrows
        self.nrows += 1
        self.b_list.append(float(const))
        for col, coef in terms:
            if coef != 0.0:
                self.rows.append(r)
                self.cols.append(int(col))
                self.vals.append(-float(coef))

    def add_eq(self, terms, rhs=0.0):
        self._append_row(terms, -rhs)
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

    def add_psd(self, n, tri_exprs):
        idx = 0
        for j in range(n):
            for i in range(j + 1):
                const, terms = tri_exprs[idx]
                idx += 1
                if i < j:
                    self._append_row([(c, SQ2 * val) for c, val in terms], SQ2 * const)
                else:
                    self._append_row(terms, const)
        self.cones.append(clarabel.PSDTriangleConeT(n))

    def solve(self, obj_col, extra_q=()):
        q = np.zeros(self.nvars)
        q[int(obj_col)] = 1.0
        for c_idx, c_val in extra_q:
            q[int(c_idx)] += float(c_val)
        P = sp.csc_matrix((self.nvars, self.nvars))
        A = sp.csc_matrix((self.vals, (self.rows, self.cols)), shape=(self.nrows, self.nvars))
        b = np.array(self.b_list, dtype=float)
        merged = []
        for c in self.cones:
            if merged and type(c) is type(merged[-1]) and isinstance(c, (clarabel.ZeroConeT, clarabel.NonnegativeConeT)):
                merged[-1] = type(c)(merged[-1].dim + c.dim)
            else:
                merged.append(c)
        st = clarabel.DefaultSettings()
        st.verbose = False
        st.max_iter = 300
        return clarabel.DefaultSolver(P, q, A, b, merged, st).solve()


def rat(x, bits):
    return Fr(int(round(float(x) * (1 << bits))), 1 << bits)


def sqrt_ub_12(s):
    s = Fr(s)
    if s == 0:
        return Fr(0)
    q = 10**12
    m = isqrt((s.numerator * q * q + s.denominator - 1) // s.denominator)
    if m * m * s.denominator < s.numerator * q * q:
        m += 1
    return Fr(m, q)


def hat_test_matrices(uk, v):
    v = np.asarray(v, dtype=float)
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


def eval_rice_cap_vec(s0_f, v_vec, cap_starts_f, cap_coeffs_f):
    x = s0_f * v_vec
    out = np.empty_like(x)
    idx = np.searchsorted(cap_starts_f, x, side="right") - 1
    idx = np.clip(idx, 0, len(cap_coeffs_f) - 1)
    for k_c in np.unique(idx):
        m = idx == k_c
        xm = x[m]
        cs = cap_coeffs_f[k_c]
        if cs is None:
            out[m] = np.sqrt(xm) + (1.0 / 16.0) + 1e-14 * np.sqrt(xm)
        else:
            acc = np.zeros_like(xm)
            for cj in reversed(cs):
                acc = acc * xm + cj
            out[m] = acc
    return out


def eval_schur_dense(sol, uk, v_test, prof_test):
    Ft, Gt, Yt = hat_test_matrices(uk, v_test)
    gvt = np.zeros_like(Gt)
    nzt = v_test > 0
    gvt[:, nzt] = Gt[:, nzt] / v_test[nzt]
    gvt[:, ~nzt] = Ft[:, ~nzt]

    c1v, c2v, c3v, c4v = sol["phi1"], sol["phi2"], sol["phi3"], sol["phi4"]
    slv = sol["slope"]
    p1t = Ft.T @ c1v + slv[0] * v_test
    G1t = Gt.T @ c1v + slv[0] * (v_test**2) / 2.0
    Y1t = Yt.T @ c1v + slv[0] * v_test / 2.0
    p2t = Ft.T @ c2v + slv[1] * v_test
    G2t = Gt.T @ c2v + slv[1] * (v_test**2) / 2.0
    Y2t = Yt.T @ c2v + slv[1] * v_test / 2.0
    p3t, G3t, Y3t, g3t = Ft.T @ c3v, Gt.T @ c3v, Yt.T @ c3v, gvt.T @ c3v
    p4t, G4t, Y4t, g4t = Ft.T @ c4v, Gt.T @ c4v, Yt.T @ c4v, gvt.T @ c4v

    m00, m01, m11 = sol["m_ker"]
    mu_a, mu_rho, mu_w, sig = sol["mu_a"], sol["mu_rho"], sol["mu_w"], sol["sigma"]
    lam0, lam1, lam2 = sol["lam"]
    lam3 = sum(sol["l3"])

    tau_wt = v_test * ((g3t + g4t) ** 2) / (4.0 * mu_w)
    q1t = (lam0 + lam1 * v_test + lam2 * (v_test**2) + lam3 * (v_test**3)
           + G1t + G2t - G3t - prof_test + (m00 + 4.0 * m01 + 4.0 * m11))
    b0t = 0.5 * (-p1t + p3t + G3t - 2.0 * m00 - 4.0 * m01 - tau_wt - (Ft.T @ sol["xi2"] + slv[2] * v_test))
    b1t = 0.5 * (-0.5 * p2t - 2.0 * m01 - 4.0 * m11 - Ft.T @ sol["xi1"])
    b2t = 0.5 * (-Y1t - 0.5 * Y2t + sig * v_test + Y3t + G4t - Ft.T @ sol["xia"])

    M00 = m00 - p3t
    M11 = m11 * np.ones_like(v_test)
    M22 = mu_rho + mu_a + Ft.T @ sol["psi_a"] - p4t
    M01 = m01 - 0.5 * (Ft.T @ sol["psi_a"])
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
    VF.require(res.status == 0, "parameter LP failed: " + res.message)
    return -res.fun, res.x, -float(res.eqlin.marginals[0]), -np.array(res.ineqlin.marginals)


def build_par_cert_for_chi_hi(parsed_or_raw_dlin, l3, chi_hi):
    dlin = list(parsed_or_raw_dlin)
    sb = sqrt_ub_12(chi_hi)
    cuts = all_cuts()

    def lpval(al, cuts_=cuts):
        dJ = [l3[1] * (150 * al[0] * VF.S0_VEC[i] + (198 + Fr(150) / al[0]) * VF.H0_VEC[i])
              + l3[2] * (Fr(135, 2) * al[1] * VF.S0_VEC[i] + (Fr(11781, 32) + Fr(135, 2) / al[1]) * VF.H0_VEC[i])
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
                a2[idx] = Fr(float(np.exp(xv))).limit_denominator(10**5)
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
    keep = [(cuts2[i][0], None if cuts2[i][1] is None else str(cuts2[i][1]), str(rat(y[i], 38)))
            for i in range(len(cuts2)) if y[i] > 1e-12]
    return dict(alpha=[str(x) for x in al], eta=str(rat(eta, 38)), cuts=keep, sqrt_ub=str(sb)), val


def solve_and_certify_model(s0, chi_lo, chi_hi, u_knots, rice_caps, cap_starts_f, cap_coeffs_f, kbits=24, slack_target=4e-7):
    s0 = Fr(s0)
    s0_f = float(s0)
    uk = np.array([float(x) for x in u_knots], dtype=float)
    K = len(uk)

    # Collocation points in r = sqrt(v) including scaled Rice cap starts:
    ek = np.sqrt(uk)
    cap_r = np.sqrt(cap_starts_f / s0_f)
    pts = [0.0]
    for a_, b_ in zip(ek[:-1], ek[1:]):
        pts.extend(list(a_ + (b_ - a_) * (np.arange(4) + 0.5) / 4.0))
        pts.append(b_)
    pts.extend(list(cap_r[cap_r <= max(20.0, ek[-1] * 1.5)]))
    pts.extend(list(np.linspace(ek[-1], ek[-1] + 1.5, 25)[1:]))
    pts.extend(list(np.geomspace(ek[-1] + 1.5, max(800.0, 6.0 * ek[-1]), 32)))
    rr = np.unique(np.array(pts))

    rd = np.unique(np.concatenate([
        np.concatenate([a_ + (b_ - a_) * (np.arange(35) + 0.5) / 35.0 for a_, b_ in zip(ek[:-1], ek[1:])]),
        ek,
        cap_r,
        np.linspace(ek[-1], ek[-1] + 2.0, 120),
        np.geomspace(ek[-1] + 2.0, max(850.0, 7.0 * ek[-1]), 350),
    ]))
    vd = rd * rd
    prof_d = eval_rice_cap_vec(s0_f, vd, cap_starts_f, cap_coeffs_f)

    m3_floor = 2e-7 if float(chi_hi) <= 0.1 else 5e-6
    sol_dict = None

    for _ in range(3):
        v = rr**2
        prof = eval_rice_cap_vec(s0_f, v, cap_starts_f, cap_coeffs_f)
        Fm, Gm, Ym = hat_test_matrices(uk, v)
        gv_mat = np.zeros_like(Gm)
        nz = v > 0
        gv_mat[:, nz] = Gm[:, nz] / v[nz]
        gv_mat[:, ~nz] = Fm[:, ~nz]
        N = len(v)

        cb = ConicBuilder()
        c1 = cb.var(K); c2 = cb.var(K); c3 = cb.var(K); c4 = cb.var(K)
        sl12 = cb.var(3); lam = cb.var(3); l3 = cb.var(3)
        m00 = cb.var(); m01 = cb.var(); m11 = cb.var()
        mu_a = cb.var(); mu_rho = cb.var(); mu_w = cb.var(); sig = cb.var()
        psi_a = cb.var(K); xk0_2 = cb.var(K); xk0_1 = cb.var(K); xk0_a = cb.var(K); t_obj = cb.var()

        nn = [(0.0, [(l3[0], 1.0)]), (0.0, [(l3[1], 1.0)]), (0.0, [(l3[2], 1.0)]),
              (-1e-6, [(l3[0], 1.0), (l3[1], 1.0), (l3[2], 1.0)]),
              (0.0, [(sl12[2], 1.0)]),
              (0.0, [(mu_a, 1.0)]), (-1e-7, [(mu_rho, 1.0)]), (-1e-7, [(mu_w, 1.0)])]
        for k in range(K):
            nn.extend([
                (0.0, [(psi_a[k], 1.0)]),
                (0.0, [(psi_a[k], 1.0), (mu_a, 1.0), (c4[k], -1.0)]),
                (0.0, [(xk0_2[k], 1.0)]),
                (0.0, [(xk0_1[k], 1.0)]),
            ])
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
                    + [(xk0_2[k], -0.5 * si * Fm[k, i]) for k in nz_f] + [(sl12[2], -0.5e-2 * (vi * si))])
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
                (0.0, t_b0), (0.0, t_b1), (0.0, t_b2), (-(slack_target + prof[i]) * si2, t_q1),
            ])

        for ch_v in (float(chi_lo), float(chi_hi)):
            eta = cb.var(); nu = cb.var(2); om = cb.var(5); ze = cb.var(3); ch = cb.var(3); ps = cb.var(3); kap = cb.var()
            cb.add_nonneg_batch([(0.0, [(nu[0], 1.0)]), (0.0, [(nu[1], 1.0)]), (0.0, [(kap, 1.0)])]
                                + [(0.0, [(om[j], 1.0)]) for j in range(5)])
            cb.add_soc([(0.0, [(ze[0], 1.0), (ze[1], 1.0)]), (0.0, [(ze[2], 1.0)]), (0.0, [(ze[0], 1.0), (ze[1], -1.0)])])
            cb.add_soc([(0.0, [(ch[0], 1.0), (ch[1], 1.0)]), (0.0, [(ch[2], 1.0)]), (0.0, [(ch[0], 1.0), (ch[1], -1.0)])])
            sq = np.sqrt(ch_v)
            cb.add_soc([(0.0, [(ps[0], 1.0), (ps[1], 1.0)]), (0.0, [(ps[2], 1.0)]), (0.0, [(ps[0], 1.0), (ps[1], -1.0)])])
            cb.add_eq([(l3[1], 300.0e-4 * sq), (l3[2], 135.0e-4 * sq), (ps[2], 1.0)], 0.0)
            d_base = [
                [(m00, 16.0), (m01, 32.0), (m11, 32.0)],
                [(m00, 4.0), (m11, 16.0)],
                [(m11, 16.0), (mu_a, 32.0), (mu_rho, 32.0), (sig, 32.0)],
                [(m01, 48.0), (m11, 48.0), (mu_a, 24.0), (mu_rho, 24.0), (mu_w, 24.0), (sig, 48.0)],
                [(m01, 16.0), (m11, 16.0)],
            ]
            st_extra = [
                [(eta, -32.0), (nu[0], 1.0), (om[0], 1.0), (ze[0], 1.0), (ch[1], 1.0)],
                [(eta, -8.0), (om[1], 1.0), (ze[1], 1.0), (ch[0], 1.0)],
                [(eta, -32.0), (nu[0], -1.0), (om[2], 1.0), (ch[1], 1.0)],
                [(eta, -96.0), (nu[1], -1.0), (om[3], 1.0), (ch[1], 3.0), (ch[2], 3.0)],
                [(nu[1], 1.0), (om[4], 1.0), (ze[2], 1.0), (ch[1], -1.0), (ch[2], -1.0)],
            ]
            for idx in range(5):
                j_terms = [(l3[1], sq * 198.0e-4 * H0f[idx]), (l3[2], sq * (11781.0 / 32.0) * 1e-4 * H0f[idx]),
                           (ps[0], S0f[idx]), (ps[1], H0f[idx]), (kap, H0f[idx])]
                cb.add_eq(d_base[idx] + j_terms + st_extra[idx], 0.0)
            M3 = 6.0 + 9.0 * ch_v + C6f * (ch_v**1.5)
            cb.add_nonneg_batch([(0.0, [(t_obj, 1.0), (lam[0], -1.0), (lam[1], -1.0), (lam[2], -(2.0 + ch_v) * 1e-2),
                                        (l3[0], -M3 * 1e-4), (l3[1], -(6.0 + 9.0 * ch_v) * 1e-4),
                                        (l3[2], -(6.0 + 9.0 * ch_v) * 1e-4), (eta, -ch_v)])])

        tau_pen = 1e-5 if float(chi_hi) <= 0.15 else 5e-7
        sol = cb.solve(t_obj, extra_q=[(tau_w[i], tau_pen) for i in range(N)])
        x = np.array(sol.x, dtype=float)
        sol_dict = dict(
            phi1=x[c1], phi2=x[c2], phi3=x[c3], phi4=x[c4],
            psi_a=np.maximum(x[psi_a], 0.0),
            xi2=np.maximum(x[xk0_2], 0.0), xi1=np.maximum(x[xk0_1], 0.0), xia=x[xk0_a],
            slope=np.array([x[sl12[0]], x[sl12[1]], max(x[sl12[2]], 0.0)]) * 1e-2,
            lam=np.array([x[lam[0]], x[lam[1]], x[lam[2]] * 1e-2]),
            l3=np.maximum(x[l3] * 1e-4, 0.0),
            m_ker=[x[m00], x[m01], max(x[m11], m3_floor)],
            mu_a=max(x[mu_a], 0.0), mu_rho=max(x[mu_rho], 1e-7), mu_w=max(x[mu_w], 1e-7),
            sigma=float(x[sig]),
        )
        sch, _, _, d3 = eval_schur_dense(sol_dict, uk, vd, prof_d)
        if sch.min() > -1e-7 and d3.min() > 0:
            break
        edges = np.concatenate([ek, [np.inf]])
        idx_c = np.searchsorted(edges, rd, side="right") - 1
        new_pts = []
        for kc in np.unique(idx_c):
            m = np.where(idx_c == kc)[0]
            j = m[np.argmin(sch[m])]
            if sch[j] < -5e-8:
                new_pts.extend([rd[j]] + ([rd[j - 1]] if j > 0 else []) + ([rd[j + 1]] if j + 1 < len(rd) else []))
        rr2 = np.unique(np.concatenate([rr, np.array(new_pts)]))
        if len(rr2) == len(rr):
            break
        rr = rr2

    # Rationalize & run HiGHS polish LP:
    kden = 1 << kbits
    m00_q = max(Fr(0), rat(sol_dict["m_ker"][0], 42))
    m01_q = rat(sol_dict["m_ker"][1], 42)
    m11_q = max(Fr(1, 1 << 24), rat(sol_dict["m_ker"][2], 42))
    while m00_q * m11_q < m01_q * m01_q:
        m00_q += Fr(1, 1 << 36)
        m11_q += Fr(1, 1 << 36)
    mu_a_q = max(Fr(0), rat(sol_dict["mu_a"], 42))
    mu_rho_q = max(Fr(1, 1 << 26), rat(sol_dict["mu_rho"], 42))
    mu_w_q = max(Fr(1, 1 << 26), rat(sol_dict["mu_w"], 42))
    sig_q = rat(sol_dict["sigma"], 42)
    slope_q = [rat(sol_dict["slope"][0], 44), rat(sol_dict["slope"][1], 44), max(Fr(0), rat(sol_dict["slope"][2], 44))]
    l3_q = [rat(x, 56) if x > 1e-12 else Fr(0) for x in sol_dict["l3"]]

    to_int_arr = lambda arr: [int(round(float(x) * kden)) for x in arr]
    iphi1 = to_int_arr(sol_dict["phi1"]); iphi2 = to_int_arr(sol_dict["phi2"])
    iphi3 = to_int_arr(sol_dict["phi3"]); iphi4 = to_int_arr(sol_dict["phi4"])
    ipsi = [max(0, x) for x in to_int_arr(sol_dict["psi_a"])]
    ixi2 = [max(0, x) for x in to_int_arr(sol_dict["xi2"])]
    ixi1 = [max(0, x) for x in to_int_arr(sol_dict["xi1"])]
    ixia = to_int_arr(sol_dict["xia"])

    for k in range(K):
        while Fr(ipsi[k], kden) + mu_a_q - Fr(iphi4[k], kden) < 0:
            ipsi[k] += 1
        while ixia[k] * ixia[k] > 4 * ixi1[k] * ixi2[k]:
            ixi1[k] += 1; ixi2[k] += 1
        while (m00_q - Fr(iphi3[k], kden) <= 0
               or m11_q * (m00_q - Fr(iphi3[k], kden)) - (m01_q - Fr(ipsi[k], 2 * kden)) ** 2 <= 0):
            iphi3[k] -= 1

    dlin_q = [
        16 * m00_q + 32 * m01_q + 32 * m11_q,
        4 * m00_q + 16 * m11_q,
        16 * m11_q + 32 * (mu_a_q + mu_rho_q + sig_q),
        48 * m01_q + 48 * m11_q + 24 * (mu_a_q + mu_rho_q + mu_w_q) + 48 * sig_q,
        16 * m01_q + 16 * m11_q,
    ]
    _, lp_lo = build_par_cert_for_chi_hi(dlin_q, l3_q, chi_lo if chi_lo > 0 else Fr(1, 10000))
    _, lp_hi = build_par_cert_for_chi_hi(dlin_q, l3_q, chi_hi)

    rp = np.unique(np.concatenate([
        np.concatenate([a_ + (b_ - a_) * (np.arange(70) + 0.5) / 70.0 for a_, b_ in zip(ek[:-1], ek[1:])]),
        ek,
        cap_r,
        np.linspace(ek[-1], ek[-1] + 2.0, 160),
        np.geomspace(ek[-1] + 2.0, max(1500.0, 12.0 * ek[-1]), 550),
    ]))
    vp = rp * rp
    prof_p = eval_rice_cap_vec(s0_f, vp, cap_starts_f, cap_coeffs_f)
    solr = dict(
        phi1=np.array(iphi1, float) / kden, phi2=np.array(iphi2, float) / kden,
        phi3=np.array(iphi3, float) / kden, phi4=np.array(iphi4, float) / kden,
        psi_a=np.array(ipsi, float) / kden,
        xi2=np.array(ixi2, float) / kden, xi1=np.array(ixi1, float) / kden, xia=np.array(ixia, float) / kden,
        slope=[float(slope_q[0]), float(slope_q[1]), float(slope_q[2])],
        lam=[0.0, 0.0, 0.0], l3=[0.0, float(l3_q[1]), float(l3_q[2])],
        m_ker=[float(m00_q), float(m01_q), float(m11_q)],
        mu_a=float(mu_a_q), mu_rho=float(mu_rho_q), mu_w=float(mu_w_q), sigma=float(sig_q),
    )
    base_schur, _, _, _ = eval_schur_dense(solr, uk, vp, prof_p)
    scp = 1.0 / (1.0 + 1e-4 * vp + 1e-10 * vp**2 + 1e-16 * vp**3)
    req_slack = (2e-7 if float(chi_hi) <= 0.1 else 2e-6) * (1.0 + 1e-9 * vp**2 + 1e-15 * vp**3)
    A = -np.column_stack([np.ones_like(vp), vp, vp**2 * 1e-2, vp**3 * 1e-4, np.zeros_like(vp)]) * scp[:, None]
    bvec = (base_schur - req_slack) * scp
    rows_t, rhs_t = [], []
    for ch_e, lp_v in ((chi_lo, lp_lo), (chi_hi, lp_hi)):
        sf = float(ch_e)
        const = float((l3_q[1] + l3_q[2]) * (6 + 9 * ch_e)) + sf * lp_v
        rows_t.append([1.0, 1.0, (2.0 + sf) * 1e-2, (6.0 + 9.0 * sf + C6f * (sf**1.5)) * 1e-4, -1.0])
        rhs_t.append(-const)
    resp = linprog([0, 0, 0, 0, 1.0], A_ub=np.vstack([A, np.array(rows_t)]), b_ub=np.concatenate([bvec, rhs_t]),
                   bounds=[(None, None), (None, None), (None, None), (0, None), (None, None)], method="highs")
    VF.require(resp.status == 0, "polish LP failed: " + resp.message)

    lam_q = [rat(resp.x[0], 40), rat(resp.x[1], 40), rat(resp.x[2] * 1e-2, 52)]
    l3_q[0] = max(Fr(0), rat(resp.x[3] * 1e-4, 68))
    if sum(l3_q) == 0:
        l3_q[0] = Fr(1, 1 << 50)

    # Verify exact half-line Sturm positivity immediately (with tiny KOUL3 lam0 + lam2 + l3[0] escalation if needed):
    last_err = None
    margin = 0.0
    for step_i in range(16):
        lam0_t = rat(float(lam_q[0]) + margin, 40)
        lam1_t = rat(float(lam_q[1]) + margin * 1e-3, 42)
        lam2_t = rat(float(lam_q[2]) + margin * 2e-5, 54)
        l3_0_t = l3_q[0] + (rat(margin * 1e-6, 70) if step_i >= 1 else Fr(0))
        mdata = dict(
            s=str(s0),
            u_knots=[str(x) for x in u_knots],
            knot_den=kden,
            phi1=iphi1, phi2=iphi2, phi3=iphi3, phi4=iphi4,
            psi_a=ipsi, xi2=ixi2, xi1=ixi1, xia=ixia,
            slope=[str(slope_q[0]), str(slope_q[1]), str(slope_q[2])],
            lam=[str(lam0_t), str(lam1_t), str(lam2_t)],
            l3=[str(l3_0_t), str(l3_q[1]), str(l3_q[2])],
            m_ker=[str(m00_q), str(m01_q), str(m11_q)],
            mu_a=str(mu_a_q), mu_rho=str(mu_rho_q), mu_w=str(mu_w_q), sigma=str(sig_q),
        )
        try:
            parsed = VF.verify_l2_model_halfline(mdata, rice_caps)
            return mdata, parsed
        except ValueError as err:
            last_err = err
            margin = 1e-7 if margin == 0.0 else margin * 2.0
    raise RuntimeError(f"Failed halfline Sturm verification at s={s0}, chi=[{chi_lo}, {chi_hi}]: {last_err}")


def main():
    t0 = time.monotonic()
    pi_lo, pi_hi, R0_lo, R0_hi = VF.verify_pi_and_r0()
    upper_table, l_u4 = VF.verify_ou_envelopes_and_table()
    th_knots, w_table = VF.build_ou_theta_table()
    rice_caps = VF.build_rice_cap_bank(R0_lo, R0_hi)
    cap_starts_f = np.array([float(c[0]) for c in rice_caps], dtype=float)
    cap_coeffs_f = [(None if c[2] is None else [float(cj) for cj in c[2]]) for c in rice_caps]

    def b0_lb(s_val):
        return R0_lo * VF.sqrt_bounds(1 + s_val)[0]

    # 1. Certify OU slabs on [1/6, 5/8] and determine exact chi_ou per slab:
    s_ou_edges = [
        Fr(1, 6), Fr(5, 24), Fr(1, 4), Fr(7, 24), Fr(1, 3), Fr(3, 8), Fr(5, 12), Fr(11, 24), Fr(1, 2),
        Fr(17, 32), Fr(9, 16), Fr(19, 32), Fr(39, 64), Fr(5, 8),
    ]
    ou_slabs = []
    print("=== Step 1: Certifying OU near-Gaussian slabs on [1/6, 5/8] ===", flush=True)
    for sa, sb in zip(s_ou_edges[:-1], s_ou_edges[1:]):
        lo_k, hi_k = 10, 80
        while lo_k < hi_k:
            mid_k = (lo_k + hi_k + 1) // 2
            try:
                VF.certify_ou_slab(sa, sb, Fr(mid_k, 2000), R0_lo, R0_hi, upper_table, l_u4, th_knots, w_table)
                lo_k = mid_k
            except ValueError:
                hi_k = mid_k - 1
        best_chi = Fr(lo_k, 2000)
        _, marg = VF.certify_ou_slab(sa, sb, best_chi, R0_lo, R0_hi, upper_table, l_u4, th_knots, w_table)
        ou_slabs.append(dict(s_lo=str(sa), s_hi=str(sb), chi_hi=str(best_chi)))
        print(f"  OU [{sa}, {sb}]: chi_hi = {best_chi} ({float(best_chi):.4f}), margin = {float(marg):.3e}", flush=True)

    # Knot sets in u = r^2:
    u_knots_low = (
        [Fr(0), Fr(1, 25), Fr(1, 10), Fr(1, 5)]
        + [Fr(k, 6) for k in range(2, 25)]
        + [Fr(9, 2), Fr(11, 2), Fr(13, 2), Fr(8), Fr(10), Fr(13), Fr(18), Fr(26), Fr(40), Fr(72), Fr(144)]
    )  # 38 exact rational knots dense near 0 and across Exp(1) support [0, 13] + tail

    u_knots_bulk = (
        [Fr(0), Fr(1, 25), Fr(1, 10), Fr(1, 5), Fr(7, 20), Fr(1, 2), Fr(7, 10), Fr(19, 20), Fr(5, 4), Fr(8, 5), Fr(2), Fr(5, 2), Fr(31, 10), Fr(39, 10), Fr(24, 5), Fr(6), Fr(15, 2), Fr(19, 2), Fr(12), Fr(16), Fr(22), Fr(30), Fr(42), Fr(64), Fr(100), Fr(169), Fr(256)]
    )  # 27 exact rational knots covering bulk + high kurtosis

    models = {}
    parsed_models = {}
    pars = {}
    par_cache = {}
    next_id = 0
    next_pid = 0

    cache_path = None
    disk_cache = {}
    if "--cache" in sys.argv:
        c_idx = sys.argv.index("--cache")
        if c_idx + 1 < len(sys.argv):
            cache_path = pathlib.Path(sys.argv[c_idx + 1])
            if cache_path.exists():
                disk_cache = json.loads(cache_path.read_text(encoding="utf-8"))

    def add_model(s0, cl, ch, uk, kbits=23, slack_target=2e-7):
        nonlocal next_id
        mid = str(next_id)
        next_id += 1
        ckey = f"{Fr(s0)}|{Fr(cl)}|{Fr(ch)}|{len(uk)}|{kbits}"
        if ckey in disk_cache:
            mdata = disk_cache[ckey]
            parsed = VF.verify_l2_model_halfline(mdata, rice_caps)
        else:
            mdata, parsed = solve_and_certify_model(s0, cl, ch, uk, rice_caps, cap_starts_f, cap_coeffs_f, kbits=kbits, slack_target=slack_target)
            if cache_path is not None:
                disk_cache[ckey] = mdata
                cache_path.write_text(json.dumps(disk_cache, separators=(",", ":")), encoding="utf-8")
        models[mid] = mdata
        parsed_models[mid] = parsed
        return mid

    def get_or_add_par(mid, ch):
        nonlocal next_pid
        key = (mid, Fr(ch))
        if key not in par_cache:
            par_c, _ = build_par_cert_for_chi_hi(parsed_models[mid]["dlin"], parsed_models[mid]["l3"], Fr(ch))
            pid = str(next_pid)
            next_pid += 1
            pars[pid] = par_c
            par_cache[key] = pid
        return par_cache[key]

    # 2. Build multi-resolution narrow chi-bands & adaptive tiles for [1/6, 5/8]:
    print("\n=== Step 2: Building Level-2 Matrix Stein models & 2D tiles on [1/6, 5/8] ===", flush=True)
    sharp_tiles = []

    def cover_band(s_nodes, chi_a_fn, chi_b, uk, band_name, kbits=23, slack_target=2e-7, use_ou_floor=False):
        node_mids = {}

        def ensure_node(sn):
            sn = Fr(sn)
            if sn not in node_mids:
                ca_n = chi_a_fn(sn)
                mid = add_model(sn, ca_n, chi_b, uk, kbits=kbits, slack_target=slack_target)
                node_mids[sn] = mid
                print(f"  [{band_name}] certified half-line model {mid} at s={sn} on [{ca_n}, {chi_b}]", flush=True)
            return node_mids[sn]

        for sn in s_nodes:
            ensure_node(sn)

        for sa_0, sb_0 in zip(s_nodes[:-1], s_nodes[1:]):
            if use_ou_floor:
                ca_0 = min(Fr(r["chi_hi"]) for r in ou_slabs if not (Fr(r["s_hi"]) <= sa_0 or Fr(r["s_lo"]) >= sb_0))
                ca_0 = max(ca_0, chi_a_fn(sa_0), chi_a_fn(sb_0))
            else:
                ca_0 = max(chi_a_fn(sa_0), chi_a_fn(sb_0))
            if ca_0 >= chi_b:
                continue
            stack = [(sa_0, sb_0, ca_0, chi_b, 0, 0)]
            slab_tiles = 0
            while stack:
                sa, sb, cl, ch, dep, s_dep = stack.pop()
                m_l, m_r = ensure_node(sa), ensure_node(sb)
                pid_l = get_or_add_par(m_l, ch)
                pid_r = get_or_add_par(m_r, ch)
                ub_l = VF.eval_model_on_chi_interval(parsed_models[m_l], cl, ch, pars[pid_l])
                ub_r = VF.eval_model_on_chi_interval(parsed_models[m_r], cl, ch, pars[pid_r])
                dl, dr = b0_lb(sa) - ub_l, b0_lb(sb) - ub_r
                chord = min(((sb - s_e) * dl + (s_e - sa) * dr) / (sb - sa) for s_e in (sa, sb))
                z_pk = (sa + sb) / 2
                loss = Fr(1, 2) * VF.tile_curv_kh(sa, sb, ch, pi_lo, R0_lo, R0_hi) * (z_pk - sa) * (sb - z_pk)
                if chord - loss > 0:
                    sharp_tiles.append(dict(
                        s_lo=str(sa), s_hi=str(sb), chi_lo=str(cl), chi_hi=str(ch),
                        model_left=m_l, model_right=m_r, par_left=pid_l, par_right=pid_r,
                    ))
                    slab_tiles += 1
                elif dep >= 4 and chord <= loss * Fr(6, 5) and s_dep < 3:
                    sm = (sa + sb) / 2
                    stack.extend([(sa, sm, cl, ch, 0, s_dep + 1), (sm, sb, cl, ch, 0, s_dep + 1)])
                else:
                    VF.require(dep < 14, f"Tile [{band_name}] subdivision exhausted on [{sa},{sb}]x[{cl},{ch}] (dl={float(dl):.2e}, dr={float(dr):.2e}, loss={float(loss):.2e})")
                    cm = (cl + ch) / 2
                    stack.extend([(sa, sb, cl, cm, dep + 1, s_dep), (sa, sb, cm, ch, dep + 1, s_dep)])
            print(f"    [{band_name}] covered [{sa_0}, {sb_0}] x [{ca_0}, {chi_b}] in {slab_tiles} tiles", flush=True)

    # Note: OU slabs already cover:
    #   [1/6, 5/24] up to 3/80 = 0.0375 > 3/100;
    #   [5/24, 5/12] up to >= 1/100 = 0.0100;
    #   [5/12, 5/8] up to >= 11/2000 = 0.0055!
    s_low0 = [
        Fr(5, 12), Fr(7, 16), Fr(11, 24), Fr(23, 48), Fr(1, 2),
        Fr(33, 64), Fr(17, 32), Fr(35, 64), Fr(9, 16),
        Fr(37, 64), Fr(19, 32), Fr(39, 64), Fr(5, 8),
    ]
    def low0_start(sn):
        if sn <= Fr(11, 24): return Fr(7, 1000)
        if sn <= Fr(17, 32): return Fr(3, 500)
        return Fr(11, 2000)

    def low2_start(sn):
        return Fr(3, 80) if sn < Fr(5, 24) else Fr(3, 100)

    cover_band(s_low0, low0_start, Fr(1, 100), u_knots_low, "LOW0", kbits=24, slack_target=2e-7, use_ou_floor=True)
    cover_band([Fr(5, 24), Fr(1, 4), Fr(7, 24), Fr(1, 3), Fr(3, 8), Fr(5, 12), Fr(15, 32), Fr(1, 2), Fr(17, 32), Fr(9, 16), Fr(19, 32), Fr(5, 8)],
               lambda _: Fr(1, 100), Fr(3, 100), u_knots_low, "LOW1", kbits=24, slack_target=2e-7, use_ou_floor=True)
    cover_band([Fr(1, 6), Fr(3, 16), Fr(5, 24), Fr(1, 4), Fr(5, 16), Fr(3, 8), Fr(7, 16), Fr(1, 2), Fr(17, 32), Fr(9, 16), Fr(19, 32), Fr(5, 8)],
               low2_start, Fr(3, 25), u_knots_low, "LOW2", kbits=23, slack_target=3e-7, use_ou_floor=True)
    cover_band([Fr(1, 6), Fr(1, 4), Fr(1, 3), Fr(5, 12), Fr(15, 32), Fr(1, 2), Fr(9, 16), Fr(19, 32), Fr(5, 8)],
               lambda _: Fr(3, 25), Fr(1, 2), u_knots_low, "MED1", kbits=23, slack_target=6e-7)
    cover_band([Fr(1, 6), Fr(1, 4), Fr(1, 3), Fr(5, 12), Fr(1, 2), Fr(9, 16), Fr(19, 32), Fr(5, 8)],
               lambda _: Fr(1, 2), Fr(5, 2), u_knots_bulk, "MED2", kbits=22, slack_target=1.5e-6)
    cover_band([Fr(1, 6), Fr(1, 4), Fr(1, 3), Fr(5, 12), Fr(1, 2), Fr(9, 16), Fr(5, 8)],
               lambda _: Fr(5, 2), Fr(10), u_knots_bulk, "HI1", kbits=22, slack_target=2.5e-6)
    cover_band([Fr(1, 6), Fr(1, 4), Fr(3, 8), Fr(1, 2), Fr(9, 16), Fr(5, 8)],
               lambda _: Fr(10), Fr(42), u_knots_bulk, "HI2", kbits=22, slack_target=3e-6)

    # 3. Build Theorem 2 mid-t buffered Rice curve R_buf(s_j) at s_j in {1, 17/16, 5/4, 3/2, 2, 3, 9/2}:
    print("\n=== Step 3: Building mid-t R_buf(s_j) models & P3 [0, 61/100] closure ===", flush=True)
    midt_s_list = [Fr(1), Fr(17, 16), Fr(5, 4), Fr(3, 2), Fr(2), Fr(3), Fr(9, 2)]
    midt_nodes = []
    rbuf_certified = {Fr(5, 8): VF.ceil_dec(R0_hi * VF.sqrt_bounds(1 + Fr(5, 8))[1], 10**10)}

    for sj in midt_s_list:
        chi_ou_j = Fr(1, 10000)
        for c_try in [Fr(4, 1000), Fr(3, 1000), Fr(2, 1000), Fr(15, 10000), Fr(1, 1000), Fr(5, 10000)]:
            try:
                VF.certify_ou_slab(sj, sj, c_try, R0_lo, R0_hi, upper_table, l_u4, th_knots, w_table)
                chi_ou_j = c_try
                break
            except ValueError:
                continue

        if sj <= Fr(3, 2):
            band_specs = [
                (chi_ou_j, Fr(1, 5), u_knots_low, 23, 8e-7),
                (Fr(1, 5), Fr(3, 5), u_knots_low, 22, 6e-7),
                (Fr(3, 5), Fr(6, 5), u_knots_low, 22, 6e-7),
                (Fr(6, 5), Fr(5, 2), u_knots_low, 22, 8e-7),
                (Fr(5, 2), Fr(8), u_knots_bulk, 21, 1.5e-6),
                (Fr(8), Fr(42), u_knots_bulk, 21, 2.5e-6),
            ]
            chi_sub = [chi_ou_j, Fr(1, 100), Fr(1, 20), Fr(1, 5), Fr(2, 5), Fr(3, 5), Fr(9, 10), Fr(6, 5), Fr(9, 5), Fr(5, 2), Fr(5), Fr(8), Fr(20), Fr(42)]
        else:
            band_specs = [
                (chi_ou_j, Fr(1, 5), u_knots_low, 23, 8e-7),
                (Fr(1, 5), Fr(3), u_knots_bulk, 22, 2e-6),
                (Fr(3), Fr(42), u_knots_bulk, 22, 3e-6),
            ]
            chi_sub = [chi_ou_j, Fr(1, 100), Fr(1, 20), Fr(1, 5), Fr(3, 5), Fr(3, 2), Fr(3), Fr(10), Fr(24), Fr(42)]

        band_models = [(ba, bb, add_model(sj, ba, bb, uk_b, kbits=kb_b, slack_target=sl_b)) for ba, bb, uk_b, kb_b, sl_b in band_specs]
        chi_grid_j = sorted(set(x for x in chi_sub if x >= chi_ou_j))
        strips_j = []
        worst_ub = R0_hi * VF.sqrt_bounds(1 + sj)[1]
        for cl, ch in zip(chi_grid_j[:-1], chi_grid_j[1:]):
            mid_use = next(m_id for ba, bb, m_id in band_models if ba <= cl and ch <= bb)
            pid_c = get_or_add_par(mid_use, ch)
            ub_v = VF.eval_model_on_chi_interval(parsed_models[mid_use], cl, ch, pars[pid_c])
            worst_ub = max(worst_ub, ub_v)
            strips_j.append(dict(chi_lo=str(cl), chi_hi=str(ch), model=mid_use, par=pid_c))

        rcap_j = VF.ceil_dec(worst_ub + Fr(1, 10**7), 10**6)
        rbuf_certified[sj] = rcap_j
        midt_nodes.append(dict(s=str(sj), r_buf=str(rcap_j), chi_ou=str(chi_ou_j), strips=strips_j))
        print(f"  s = {sj}: R_buf = {rcap_j} ({float(rcap_j):.6f}, vs Gauss {float(R0_hi * VF.sqrt_bounds(1+sj)[1]):.6f}), chi_ou = {chi_ou_j}", flush=True)

    # Prune any unused pars (from rejected parent subdivisions before child splits):
    used_pids = ({t["par_left"] for t in sharp_tiles} | {t["par_right"] for t in sharp_tiles}
                 | {st["par"] for nd in midt_nodes for st in nd["strips"]})
    pars = {pid: pv for pid, pv in pars.items() if pid in used_pids}

    # Build P3 remote segments covering [0, 61/100]:
    eps_d5, eta_d5, tau_d5 = Fr(39, 50), Fr(779, 10000), Fr(500, 701)
    p3_segments = [dict(t_lo="0", t_hi="1/5", mode="unbuffered_2287_2500")]
    t_grid = [Fr(k, 200) for k in range(40, 122)] + [Fr(61, 100)]
    t_grid = sorted(set(t_grid))
    for ta, tb in zip(t_grid[:-1], t_grid[1:]):
        best_s = None
        best_v = None
        for sj, rb in rbuf_certified.items():
            if tb >= rb:
                continue
            va = (1 - eta_d5) * (ta**2) + eta_d5 + ((eps_d5 - eta_d5) / sj) * ((rb - ta) ** 2)
            vb = (1 - eta_d5) * (tb**2) + eta_d5 + ((eps_d5 - eta_d5) / sj) * ((rb - tb) ** 2)
            vm = max(va, vb)
            if best_v is None or vm < best_v:
                best_v = vm
                best_s = sj
        VF.require(best_v is not None and best_v < tau_d5, f"P3 segment [{ta}, {tb}] failed: best_v={float(best_v):.6f}")
        if p3_segments[-1].get("mode") == "buffered_rice" and p3_segments[-1].get("s") == str(best_s):
            p3_segments[-1]["t_hi"] = str(tb)
        else:
            p3_segments.append(dict(t_lo=str(ta), t_hi=str(tb), mode="buffered_rice", s=str(best_s)))

    cert = dict(
        schema="buffered-rice-stein-v1",
        agent="gemini-4c4c",
        issue=784,
        s_sharp_max="5/8",
        t_frontier_ub="139043/200000",
        ou_slabs=ou_slabs,
        models=models,
        pars=pars,
        sharp_tiles=sharp_tiles,
        midt_nodes=midt_nodes,
        p3_remote_closure=dict(t_max="61/100", segments=p3_segments),
    )

    OUT_PATH.write_text(json.dumps(cert, separators=(",", ":")) + "\n", encoding="utf-8")
    sz = OUT_PATH.stat().st_size
    print(f"\nWrote {OUT_PATH.name}: {sz:,} bytes (< 300,000 limit: {sz < 300000}) in {time.monotonic() - t0:.1f}s!", flush=True)
    VF.require(sz < 300000, f"Certificate size {sz} exceeds 300,000 bytes!")

    print("\n=== Running full zero-float stdlib verify_certificate(cert) ===", flush=True)
    VF.verify_certificate(json.loads(OUT_PATH.read_text(encoding="utf-8")), quiet=False)


if __name__ == "__main__":
    main()
