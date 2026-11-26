#!/usr/bin/env python3
"""Generate compact exact-IEEE continuous-law JM1 dual certificates and (R1) infeasibility
certificates for Problem P1 (Issue #623), using the C++17 outward-rounded 2D row enclosures.

Usage:
  python3 generate_certificates.py /tmp/rows_cache.json dual_certs.json /tmp/dual_certs.dat [--smoke]
"""
import concurrent.futures
from decimal import Decimal
import json
import math
import os
import sys
import time
from fractions import Fraction
import numpy as np
from scipy.optimize import linprog, minimize
from scipy.sparse import csr_matrix, diags, hstack as sp_hstack, vstack as sp_vstack

REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), "../../../.."))

# ==================== 1. FIRST-PRINCIPLES RATIONAL KUMMER + CAUCHY-SCHWARZ RICE TANGENTS ====================
SQRT_PI_LO = Fraction(177245385090551602729816748, 10 ** 26)
SQRT_PI_HI = Fraction(177245385090551602729816749, 10 ** 26)


def exp_pos_bounds(x_frac):
    """Exact rational bounds on exp(x_frac) for 0 <= x_frac <= 100 via halving."""
    if x_frac == 0:
        return Fraction(1), Fraction(1)
    k = 0
    z = x_frac
    while z > Fraction(1, 2):
        z /= 2
        k += 1
    s = Fraction(1)
    t = Fraction(1)
    for m in range(1, 24):
        t = t * z / m
        s += t
    rem = 2 * (t * z / 24)
    lo, hi = s, s + rem
    for _ in range(k):
        lo = lo * lo
        hi = hi * hi
    return lo, hi


def kummer_rho_bounds(x_frac):
    """Return (rho_lo, rho_hi, rhop_lo, rhop_hi) at rational x_frac in [0, 80]."""
    M = max(85, int(4 * x_frac) + 45)
    exp_lo, exp_hi = exp_pos_bounds(x_frac)
    inv_exp_lo = Fraction(1) / exp_hi
    inv_exp_hi = Fraction(1) / exp_lo

    s0 = Fraction(1)
    s1 = Fraction(1)
    t0 = Fraction(1)
    for m in range(1, M):
        t0 = t0 * Fraction(2 * m + 1, 2 * m * m) * x_frac
        s0 += t0
        s1 += t0 / (m + 1)
    rem0 = Fraction(3, 2) * (t0 * Fraction(2 * M + 1, 2 * M * M) * x_frac)
    rem1 = rem0 / (M + 1)

    rho_lo = (SQRT_PI_LO / 2) * inv_exp_lo * s0
    rho_hi = (SQRT_PI_HI / 2) * inv_exp_hi * (s0 + rem0)
    rhop_lo = (SQRT_PI_LO / 4) * inv_exp_lo * s1
    rhop_hi = (SQRT_PI_HI / 4) * inv_exp_hi * (s1 + rem1)
    return rho_lo, rho_hi, rhop_lo, rhop_hi


def ceil_decimal_q(q_frac, digits=8):
    """Round rational q_frac >= 0 strictly UPWARD to a compact IEEE float."""
    scale = 10 ** digits
    num = (q_frac.numerator * scale + q_frac.denominator - 1) // q_frac.denominator
    val = num / scale
    while Fraction(val) < q_frac:
        val = math.nextafter(val, math.inf)
    return val


def r_num(val, sig=6):
    """Compact exact-IEEE rounding: exact 0 -> 0 (1 byte in JSON), else sig-digit float."""
    v = float(val)
    if v == 0.0:
        return 0
    out = float(f"{v:.{sig}g}")
    return 0 if out == 0.0 else out


def floor_binary64(q_frac):
    """Round rational q_frac strictly DOWNWARD (or exact if dyadic) to IEEE binary64."""
    val = float(q_frac)
    while Fraction(val) > q_frac:
        val = math.nextafter(val, -math.inf)
    return val


def enclose_binary64(q_frac):
    """Enclose rational q_frac in a tight 0-or-1-ULP IEEE binary64 interval [u_lo, u_hi]."""
    lo = float(q_frac)
    while Fraction(lo) > q_frac:
        lo = math.nextafter(lo, -math.inf)
    hi = float(q_frac)
    while Fraction(hi) < q_frac:
        hi = math.nextafter(hi, math.inf)
    return lo, hi


X_TANG_FRACS = [
    Fraction(0), Fraction(1, 32), Fraction(1, 10), Fraction(1, 4), Fraction(1, 2),
    Fraction(4, 5), Fraction(6, 5), Fraction(17, 10), Fraction(23, 10), Fraction(3),
    Fraction(19, 5), Fraction(24, 5), Fraction(6), Fraction(15, 2), Fraction(19, 2),
    Fraction(12), Fraction(15), Fraction(37, 2), Fraction(23), Fraction(28),
    Fraction(34), Fraction(41), Fraction(49), Fraction(58), Fraction(70)
]
# Exact Cauchy-Schwarz tangents: rho(x) <= sqrt(x + 1) <= (m^2 + 1)/(2m) + x/(2m) for all x >= 0, m > 0!
CS_M_TANG = [12, 32, 100, 250]


def build_verified_rice_polygon():
    rho_a, rho_b = [], []
    for xk in X_TANG_FRACS:
        _, rho_hi, rhop_lo, rhop_hi = kummer_rho_bounds(xk)
        ak_frac = rho_hi - rhop_lo * xk
        bk_frac = rhop_hi
        rho_a.append(ceil_decimal_q(ak_frac, 9))
        rho_b.append(ceil_decimal_q(bk_frac, 9))
    for m in CS_M_TANG:
        rho_a.append(ceil_decimal_q(Fraction(m * m + 1, 2 * m), 9))
        rho_b.append(ceil_decimal_q(Fraction(1, 2 * m), 9))
    return np.array(rho_a, dtype=float), np.array(rho_b, dtype=float)


# ==================== 2. FAST VECTORIZED EVALUATOR OF C++ ROW ENCLOSURES ====================
class CppRowEvaluator:
    def __init__(self, row_dict):
        self.tag = row_dict["tag"]
        self.w_edges = np.array(row_dict["w_edges"], dtype=float)
        self.hpA_lo = np.array(row_dict["hpA_lo"], dtype=float)
        self.hpA_hi = np.array(row_dict["hpA_hi"], dtype=float)
        self.hpB_lo = np.array(row_dict["hpB_lo"], dtype=float)
        self.hpB_hi = np.array(row_dict["hpB_hi"], dtype=float)
        self.GA_inf = tuple(row_dict["GA_inf"])
        self.GB_inf = tuple(row_dict["GB_inf"])
        self.PA_inf = tuple(row_dict["PA_inf"])
        self.PB_inf = tuple(row_dict["PB_inf"])
        self._k_cache = {}

    def _get_k_table(self, is_B, u_val):
        key = (is_B, float(u_val))
        if key in self._k_cache:
            return self._k_cache[key]
        hp_lo = self.hpB_lo if is_B else self.hpA_lo
        hp_hi = self.hpB_hi if is_B else self.hpA_hi
        p_lo, p_hi = self.PB_inf if is_B else self.PA_inf
        nw = len(hp_lo)
        dw_vec = np.diff(self.w_edges)
        r_vec = np.exp(-dw_vec / u_val)
        KP_lo = np.zeros(nw + 1, dtype=float)
        KP_hi = np.zeros(nw + 1, dtype=float)
        inv_rt_hi = 1.0 / math.sqrt(256.0 + 40.0 * u_val)
        inv_rt3_lo = inv_rt_hi ** 3
        inv_rt3_hi = 1.0 / 4096.0
        pcands = [p_lo * inv_rt3_lo, p_lo * inv_rt3_hi, p_hi * inv_rt3_lo, p_hi * inv_rt3_hi]
        KP_lo[nw] = min(pcands) - 1e-15
        KP_hi[nw] = max(pcands) + 1e-15
        for j in range(nw - 1, -1, -1):
            rj = r_vec[j]
            KP_lo[j] = (1.0 - rj) * hp_lo[j] + rj * KP_lo[j + 1]
            KP_hi[j] = (1.0 - rj) * hp_hi[j] + rj * KP_hi[j + 1]
        self._k_cache[key] = (KP_lo, KP_hi, p_lo, p_hi)
        return self._k_cache[key]

    def eval_psi_g1_bounds(self, is_B, u_val, v_arr):
        v = np.asarray(v_arr, dtype=float)
        KP_lo, KP_hi, p_lo, p_hi = self._get_k_table(is_B, u_val)
        nw = len(KP_lo) - 1
        psi_lo = np.empty_like(v)
        psi_hi = np.empty_like(v)
        g1_lo = np.empty_like(v)
        g1_hi = np.empty_like(v)

        m_in = (v <= 256.0)
        if np.any(m_in):
            vm = np.maximum(0.0, v[m_in])
            idx = np.clip(np.searchsorted(self.w_edges, vm, side="right") - 1, 0, nw - 1)
            kpl = np.minimum(KP_lo[idx], KP_lo[idx + 1])
            kph = np.maximum(KP_hi[idx], KP_hi[idx + 1])
            kpa_l = np.where((kpl <= 0.0) & (kph >= 0.0), 0.0, np.minimum(np.abs(kpl), np.abs(kph)))
            kpa_h = np.maximum(np.abs(kpl), np.abs(kph))
            psi_lo[m_in] = vm * (kpa_l ** 2)
            psi_hi[m_in] = vm * (kpa_h ** 2)
            g1_lo[m_in] = vm * kpl
            g1_hi[m_in] = vm * kph

        m_out = ~m_in
        if np.any(m_out):
            vo = v[m_out]
            pmax = max(abs(p_lo), abs(p_hi)) + 1e-12
            psi_lo[m_out] = 0.0
            psi_hi[m_out] = (pmax ** 2) / (vo ** 2)
            inv_lo = 1.0 / np.sqrt(vo + 40.0 * u_val)
            inv_hi = 1.0 / np.sqrt(vo)
            c1 = p_lo * inv_lo
            c2 = p_lo * inv_hi
            c3 = p_hi * inv_lo
            c4 = p_hi * inv_hi
            g1_lo[m_out] = np.minimum(np.minimum(c1, c2), np.minimum(c3, c4)) - 1e-14
            g1_hi[m_out] = np.maximum(np.maximum(c1, c2), np.maximum(c3, c4)) + 1e-14

        return psi_lo, psi_hi, g1_lo, g1_hi


# ==================== 3. COLUMN-SCALED DUAL LP SOLVER + CONTINUOUS REMEZ POLISH ====================
T_KNOTS = np.array(
    [0.0] + [r_num(v, 5) for v in np.concatenate([
        np.linspace(0.02, 0.5, 14, endpoint=False),
        np.geomspace(0.5, 36.0, 34)
    ])],
    dtype=float
)
EPS_K = 1e-4
C_RAT = np.array([0.25, 0.5, 1.0, 2.0, 4.0, 8.0, 16.0], dtype=float)
S_GRAM = np.array([2.0, 3.0, 4.5, 7.0, 12.0], dtype=float)
LAMS_RICE = np.array(
    [r_num(v, 5) for v in np.concatenate([
        np.linspace(0.15, 3.0, 14),
        np.geomspace(3.5, 60.0, 18)
    ])],
    dtype=float
)
C6_CONST = 4045313.0 / 100000.0
E1_CONST = 0.78


def M_lambda_chi_exact(c1, c2, u_val, chi_hi):
    a1 = max(0.0, c1)
    a2 = max(0.0, c2)
    if a1 == 0.0 and a2 == 0.0:
        return 0.0
    R = u_val * math.sqrt(chi_hi / 2.0)
    box_t = 2.0 * u_val * a1 + u_val * a2
    if chi_hi >= 10.0:
        return box_t
    nrm = math.hypot(a1, a2)
    disk_t = R * nrm
    if chi_hi <= 2.0:
        return min(box_t, disk_t)
    best = min(box_t, disk_t)
    r_u = math.sqrt(max(0.0, 0.5 * chi_hi - 1.0))
    if r_u > 0.0 and a2 > a1 / r_u:
        q2 = a1 / r_u
        p2 = a2 - q2
        best = min(best, u_val * p2 + R * math.hypot(a1, q2))
    if chi_hi > 8.0:
        r_2u = math.sqrt(max(0.0, 0.5 * chi_hi - 4.0))
        if r_2u > 0.0 and a1 > 2.0 * a2 / r_2u:
            q1 = 2.0 * a2 / r_2u
            p1 = a1 - q1
            best = min(best, 2.0 * u_val * p1 + R * math.hypot(q1, a2))
    return best


def psi_K_vec(A, B, lam_S, mu_S):
    absB = np.abs(B)
    cond = (mu_S * (lam_S - A) >= lam_S * absB)
    top = (A * A) / lam_S + (B * B) / mu_S
    pos = np.maximum(0.0, lam_S - A + absB)
    bot = 2.0 * A - lam_S + (pos * pos) / (lam_S + mu_S)
    return np.where(cond, top, bot)


def cone_K_maximizer_vec(sc, U_arr):
    """Return exact pointwise maximizer (v*(U), r*(U)) in K of -cx(U)*v - cr(U)*r - lam_S*v^2 - mu_S*r^2."""
    lam_S = sc["mu_sx_sep"] + sum(sc["eta_gram"])
    mu_S = sc["mu_sr_sep"]
    af = sum(sc["eta_gram"][j] * (S_GRAM[j] - 1.0) / 18.0 for j in range(len(S_GRAM)))
    ag = sum(sc["eta_gram"][j] * (S_GRAM[j] + 0.5 - 3.0 / S_GRAM[j]) / 18.0 for j in range(len(S_GRAM)))
    f_t = sum(sc["w_stein"][m] / (1.0 + U_arr / C_RAT[m]) for m in range(len(C_RAT)))
    fp_t = sum(-sc["w_stein"][m] / C_RAT[m] / ((1.0 + U_arr / C_RAT[m]) ** 2) for m in range(len(C_RAT)))
    phi_t = f_t + U_arr * fp_t
    Y_t = U_arr * fp_t
    yeq = sc["yeq"]
    cx = yeq[2] + phi_t + (-2.0 * yeq[3] + 2.0 * lam_S / 3.0 + 2.0 * af) * U_arr
    cr = Y_t + (-yeq[3] - sc["nu_plus"] + sc["nu_minus"] + 2.0 * mu_S / 3.0 - 2.0 * ag) * U_arr
    A = -0.5 * cx
    B = -0.5 * cr
    absB = np.abs(B)
    cond = (mu_S * (lam_S - A) >= lam_S * absB)
    v_top = -A / lam_S
    r_top = -B / mu_S
    sgnB = np.where(B >= 0.0, -1.0, 1.0)
    u_bdry = np.maximum(0.0, (lam_S - A + absB) / (lam_S + mu_S))
    v_bot = -1.0 + u_bdry
    r_bot = sgnB * u_bdry
    return np.where(cond, v_top, v_bot), np.where(cond, r_top, r_bot)


def build_lp_matrices(U_nodes, rho_a, rho_b, u_val, t_lo, chi_lo, chi_hi, extra_soc=()):
    """Build column-scaled LP matrices over U_nodes in [0, U0], with optional exact SOC cutting planes."""
    N = len(U_nodes)
    NV = 5 * N
    d_p = 1.0 / (1.0 + (U_nodes / 8.0) ** 3)
    d_x = 1.0 / (1.0 + (U_nodes / 8.0) ** 2)
    d_s = 1.0 / (1.0 + U_nodes / 8.0)
    d_col = np.concatenate([d_p, d_x, d_x, d_s, d_s])

    F_st = [1.0 / (1.0 + U_nodes / c) for c in C_RAT]
    Fp_st = [-1.0 / c / ((1.0 + U_nodes / c) ** 2) for c in C_RAT]

    A_eq = np.zeros((4 + len(C_RAT), NV))
    A_eq[0, :N] = 1.0
    A_eq[1, :N] = U_nodes
    A_eq[2, N:2 * N] = 1.0
    A_eq[3, :N] = U_nodes ** 2
    A_eq[3, N:2 * N] = -2.0 * U_nodes
    A_eq[3, 2 * N:3 * N] = -U_nodes
    for idx_s, (f, fp) in enumerate(zip(F_st, Fp_st)):
        A_eq[4 + idx_s, :N] = U_nodes * f - (f + U_nodes * fp)
        A_eq[4 + idx_s, N:2 * N] = -(f + U_nodes * fp)
        A_eq[4 + idx_s, 2 * N:3 * N] = -(U_nodes * fp)
    b_eq = np.zeros(4 + len(C_RAT))
    b_eq[0] = 1.0
    b_eq[1] = 1.0
    b_eq[3] = 2.0

    Ar = np.array([
        np.min(rho_a[:, None] + rho_b[:, None] * (l * l * u_val * U_nodes)[None, :], axis=0)
        for l in LAMS_RICE
    ])
    br = np.array([t_lo + l * u_val / E1_CONST for l in LAMS_RICE])

    A_ub = np.zeros((8 + len(S_GRAM), NV))
    A_ub[0, :N] = -(U_nodes ** 2)
    A_ub[1, :N] = +(U_nodes ** 2)
    A_ub[2, :N] = U_nodes ** 3
    A_ub[3, 2 * N:3 * N] = U_nodes
    A_ub[3, :N] = -(U_nodes ** 2) / 3.0
    A_ub[4, 2 * N:3 * N] = -U_nodes
    A_ub[5, 3 * N:4 * N] = 1.0
    A_ub[5, N:2 * N] = -(2.0 / 3.0) * U_nodes
    A_ub[6, 4 * N:5 * N] = 1.0
    A_ub[6, 2 * N:3 * N] = -(2.0 / 3.0) * U_nodes
    A_ub[7, :N] = np.sqrt(U_nodes)
    for k_s, s_val in enumerate(S_GRAM):
        A_ub[8 + k_s, 3 * N:4 * N] = 1.0
        A_ub[8 + k_s, N:2 * N] = -((s_val + 5.0) / 9.0) * U_nodes
        A_ub[8 + k_s, 2 * N:3 * N] = ((s_val + 0.5 - 3.0 / s_val) / 9.0) * U_nodes

    rows_i, cols_j, vals_v = [], [], []
    rcount = 0
    idx = np.arange(N)
    rows_i.extend([rcount + idx, rcount + idx])
    cols_j.extend([idx, N + idx])
    vals_v.extend([np.full(N, -1.0), np.full(N, -1.0)])
    rcount += N
    for sgn_r in (-1.0, 1.0):
        rows_i.extend([rcount + idx, rcount + idx, rcount + idx])
        cols_j.extend([idx, N + idx, 2 * N + idx])
        vals_v.extend([np.full(N, -1.0), np.full(N, -1.0), np.full(N, sgn_r)])
        rcount += N

    u8 = 1.0 + U_nodes / 8.0

    def add_soc_tangent(t_arr, is_r):
        nonlocal rcount
        t_hat = t_arr / u8
        sc_t = u8 / (1.0 + t_hat * t_hat)
        col_lin = (2 * N + idx) if is_r else (N + idx)
        col_sq = (4 * N + idx) if is_r else (3 * N + idx)
        rows_i.extend([rcount + idx, rcount + idx, rcount + idx])
        cols_j.extend([idx, col_lin, col_sq])
        vals_v.extend([-(t_arr * t_arr) * sc_t, (2.0 * t_arr) * sc_t, -sc_t])
        rcount += N

    for tc in (-1.0, -0.35, 0.1, 0.4, 1.0, 2.5, 5.0, 10.0, 20.0):
        add_soc_tangent(np.full(N, tc), False)
    for tc in (-10.0, -4.0, -1.5, -0.4, 0.4, 1.5, 4.0, 10.0):
        add_soc_tangent(np.full(N, tc), True)
    for alpha in (0.15, 0.45, 2.0 / 3.0, 0.90, 1.35):
        add_soc_tangent(alpha * U_nodes, False)
    for alpha in (-1.1, -2.0 / 3.0, -0.30, 0.30, 2.0 / 3.0, 1.1):
        add_soc_tangent(alpha * U_nodes, True)
    for u_ref, v_ref, r_ref in extra_soc:
        tv = np.interp(U_nodes, u_ref, v_ref)
        tr = np.interp(U_nodes, u_ref, r_ref)
        add_soc_tangent(tv, False)
        add_soc_tangent(tr, True)

    SOC_sp = csr_matrix(
        (np.concatenate(vals_v), (np.concatenate(rows_i), np.concatenate(cols_j))),
        shape=(rcount, NV)
    )
    R_mat = np.zeros((len(Ar), NV))
    R_mat[:, :N] = -Ar
    M3_hi = 6.0 + 9.0 * chi_hi + C6_CONST * (chi_hi ** 1.5)
    b_ub = np.concatenate([
        [-(2.0 + chi_lo), 2.0 + chi_hi, M3_hi, -2.0 / 3.0, 0.0, 0.0, 0.0, 2287.0 / 2500.0],
        np.zeros(len(S_GRAM)),
        np.zeros(rcount),
        -br
    ])
    D_sp = diags(d_col, format="csr")
    Aeq_s = csr_matrix(A_eq) @ D_sp
    Aub_s = sp_vstack([csr_matrix(A_ub), SOC_sp, csr_matrix(R_mat)], format="csr") @ D_sp
    bounds = [(0, None)] * N + [(None, None)] * (2 * N) + [(0, None)] * (2 * N)
    return Aeq_s, b_eq, Aub_s, b_ub, rcount, d_col, bounds


def get_kantorovich_xs(H_vals, pval):
    order = np.argsort(H_vals)
    hs = H_vals[order]
    ps = np.maximum(pval[order], 0.0)
    s_p = np.sum(ps)
    if s_p <= 0:
        return np.zeros(len(T_KNOTS) - 1)
    ps /= s_p
    cum = np.concatenate([[0.0], np.cumsum(ps)])
    qs = 1.0 - np.exp(-0.5 * (T_KNOTS[:-1] + T_KNOTS[1:]))
    xs = np.interp(qs, cum, np.concatenate([[hs[0]], hs]))
    xs_mon = np.maximum.accumulate([float(r_num(v, 6)) for v in xs])
    return xs_mon


def eval_kant_hi(H_hi_arr, xs):
    dt = np.diff(T_KNOTS)
    offsets = np.concatenate([[0.0], np.cumsum(dt * xs)])
    pl = np.max(T_KNOTS[:, None] * H_hi_arr[None, :] - offsets[:, None], axis=0)
    tail = 0.5 * EPS_K * (np.maximum(0.0, H_hi_arr - xs[-1]) ** 2)
    exp_t = np.exp(-T_KNOTS)
    c_kant = float(np.sum(xs[:-1] * (exp_t[:-2] - exp_t[1:-1])) + xs[-1] * exp_t[-2] + exp_t[-1] / EPS_K)
    return c_kant, pl + tail


def extract_dyadic_slice_cert(rs, rcount, a_r, b_r, beta, gamma, lamK, xs):
    yeq = [r_num(v, 14) for v in rs.eqlin.marginals[:4]]
    mu_ub = np.maximum(0.0, -rs.ineqlin.marginals)
    w_stein = [r_num(-v if abs(v) > 1e-13 else 0.0, 12) for v in rs.eqlin.marginals[4:]]
    mu_u2_lo = r_num(mu_ub[0] if mu_ub[0] > 1e-13 else 0.0, 14)
    mu_u2_hi = r_num(mu_ub[1] if mu_ub[1] > 1e-13 else 0.0, 14)
    mu_u3 = max(float(r_num(mu_ub[2], 10)), 1e-11)
    nu_plus = r_num(mu_ub[3] if mu_ub[3] > 1e-13 else 0.0, 14)
    nu_minus = r_num(mu_ub[4] if mu_ub[4] > 1e-13 else 0.0, 14)
    eta_gram = [r_num(v if v > 1e-12 else 0.0, 14) for v in mu_ub[8:8 + len(S_GRAM)]]
    mu_sx_sep = max(float(r_num(mu_ub[5], 14)), 1e-5)
    mu_sr_sep = max(float(r_num(mu_ub[6], 14)), 1e-5)
    mu_rad = r_num(mu_ub[7] if mu_ub[7] > 1e-11 else 0.0, 10)
    off = 8 + len(S_GRAM) + rcount
    n_rice = len(LAMS_RICE)
    mu_rice = [r_num(v if v > 1e-11 else 0.0, 10) for v in mu_ub[off:off + n_rice]]
    eta_sl_lo = r_num(mu_ub[off + n_rice] if len(mu_ub) > off + n_rice and mu_ub[off + n_rice] > 1e-11 else 0.0, 11)
    eta_sl_hi = r_num(mu_ub[off + n_rice + 1] if len(mu_ub) > off + n_rice + 1 and mu_ub[off + n_rice + 1] > 1e-11 else 0.0, 11)
    xs_clean = [r_num(v, 6) for v in np.maximum.accumulate([float(r_num(x, 6)) for x in xs])]
    return {
        "a_r": r_num(a_r, 8), "b_r": r_num(b_r, 8),
        "beta": r_num(beta, 8), "gamma": max(float(r_num(gamma, 8)), 1e-4), "lamK": r_num(lamK, 8),
        "xs": xs_clean,
        "yeq": yeq, "w_stein": w_stein,
        "mu_u2_lo": mu_u2_lo, "mu_u2_hi": mu_u2_hi, "mu_u3": mu_u3,
        "nu_plus": nu_plus, "nu_minus": nu_minus,
        "mu_sx_sep": mu_sx_sep, "mu_sr_sep": mu_sr_sep, "mu_rad": mu_rad,
        "eta_gram": eta_gram, "mu_rice": mu_rice,
        "eta_sl_lo": eta_sl_lo, "eta_sl_hi": eta_sl_hi
    }


def eval_continuous_M_on_test(sc, F_val, u_val, t_lo, chi_lo, chi_hi, rho_a, rho_b,
                              U_test, psi_lo_t, psi_hi_t, g1_lo_t, g1_hi_t, is_infeas=False, Ar_pre=None):
    if is_infeas:
        const_off = 1.0
        J_t = np.zeros_like(U_test)
    else:
        c1 = sc["beta"] ** 2 / 3.0 + sc["lamK"]
        c2 = sc["beta"] ** 2 / (4.0 * sc["gamma"]) + sc["lamK"] if sc["beta"] > 0 else sc["lamK"]
        H_hi = (1.5 + sc["gamma"]) * psi_hi_t - sc["beta"] * g1_lo_t - sc["lamK"] * (u_val * U_test)
        ck, phi_hi = eval_kant_hi(H_hi, np.array(sc["xs"], dtype=float))
        C_JM1 = c1 * u_val + M_lambda_chi_exact(c1, c2, u_val, chi_hi) + ck
        const_off = C_JM1 - F_val * (0.75 * sc["a_r"] * sc["b_r"] / u_val)
        ab = sc["a_r"] + sc["b_r"]
        g1_for_om = g1_hi_t if ab >= 0.0 else g1_lo_t
        om_lo = 1.5 * psi_lo_t - (0.75 * ab / u_val) * g1_for_om
        J_t = phi_hi - F_val * om_lo

    lam_S = sc["mu_sx_sep"] + sum(sc["eta_gram"])
    mu_S = sc["mu_sr_sep"]
    af = sum(sc["eta_gram"][j] * (S_GRAM[j] - 1.0) / 18.0 for j in range(len(S_GRAM)))
    ag = sum(sc["eta_gram"][j] * (S_GRAM[j] + 0.5 - 3.0 / S_GRAM[j]) / 18.0 for j in range(len(S_GRAM)))
    f_t = sum(sc["w_stein"][m] / (1.0 + U_test / C_RAT[m]) for m in range(len(C_RAT)))
    fp_t = sum(-sc["w_stein"][m] / C_RAT[m] / ((1.0 + U_test / C_RAT[m]) ** 2) for m in range(len(C_RAT)))
    Phi_t = U_test * f_t
    phi_t = f_t + U_test * fp_t
    Y_t = U_test * fp_t
    yeq = sc["yeq"]
    cx = yeq[2] + phi_t + (-2.0 * yeq[3] + 2.0 * lam_S / 3.0 + 2.0 * af) * U_test
    cr = Y_t + (-yeq[3] - sc["nu_plus"] + sc["nu_minus"] + 2.0 * mu_S / 3.0 - 2.0 * ag) * U_test
    psiK = psi_K_vec(-0.5 * cx, -0.5 * cr, lam_S, mu_S)

    Ar_t = Ar_pre if Ar_pre is not None else np.array([
        np.min(rho_a[:, None] + rho_b[:, None] * (l * l * u_val * U_test)[None, :], axis=0)
        for l in LAMS_RICE
    ])
    br = np.array([t_lo + l * u_val / E1_CONST for l in LAMS_RICE])
    c_g1 = sc["eta_sl_lo"] - sc["eta_sl_hi"]
    g1_term = c_g1 * (g1_hi_t if c_g1 >= 0 else g1_lo_t)
    c_U2 = yeq[3] + sc["mu_u2_lo"] - sc["mu_u2_hi"] + sc["nu_plus"] / 3.0
    coeff_p = (
        yeq[0] + yeq[1] * U_test + c_U2 * (U_test ** 2) - (Phi_t - phi_t)
        - sc["mu_u3"] * (U_test ** 3) - sc["mu_rad"] * np.sqrt(U_test)
        + (np.array(sc["mu_rice"], dtype=float) @ Ar_t) + g1_term
    )
    M3_hi = 6.0 + 9.0 * chi_hi + C6_CONST * (chi_hi ** 1.5)
    rhs = (
        yeq[0] + yeq[1] + 2.0 * yeq[3]
        + sc["mu_u2_lo"] * (2.0 + chi_lo) - sc["mu_u2_hi"] * (2.0 + chi_hi)
        - sc["mu_u3"] * M3_hi + sc["nu_plus"] * (2.0 / 3.0) - sc["mu_rad"] * (2287.0 / 2500.0)
        + float(np.array(sc["mu_rice"], dtype=float) @ br)
        + sc["eta_sl_lo"] * sc["a_r"] - sc["eta_sl_hi"] * sc["b_r"]
    )
    return const_off + J_t + coeff_p + psiK - rhs


def make_u_grids(u_val):
    U0 = max(8192.0, math.ceil(64.0 / u_val))
    u_base = np.concatenate([
        np.linspace(0.0, 4.0, 48, endpoint=False),
        np.linspace(4.0, 40.0, 40, endpoint=False),
        np.geomspace(40.0, U0, 40)
    ])
    u_test = np.concatenate([
        np.linspace(0.0, 4.0, 1400, endpoint=False),
        np.linspace(4.0, 50.0, 1200, endpoint=False),
        np.geomspace(50.0, U0, 1200)
    ])
    return U0, u_base, u_test


def check_tail_coeff_float(sc, F_val, u_val, t_lo, chi_lo, chi_hi, rho_a, rho_b, is_infeas=False):
    """Fast float check of the exact rational U >= U0 cubic-dominance inequality in verify.py / C++."""
    U0 = max(8192.0, 64.0 / u_val)
    inv_U0 = 1.0 / U0
    if is_infeas:
        const_off_hi = 1.0
        J_u3_hi = 0.0
        g1_tail_hi = 0.0
    else:
        beta, gamma, lamK = sc["beta"], sc["gamma"], sc["lamK"]
        xs = sc["xs"]
        c1 = beta * beta / 3.0 + lamK
        c2 = beta * beta / (4.0 * gamma) + lamK if beta > 0.0 else lamK
        ck, _ = eval_kant_hi(np.array([0.0]), np.array(xs, dtype=float))
        C_JM1_hi = c1 * u_val + M_lambda_chi_exact(c1, c2, u_val, chi_hi) + ck + 1e-11
        const_off_hi = C_JM1_hi - F_val * (0.75 * sc["a_r"] * sc["b_r"] / u_val)
        P_max = 2.0
        psi_tail_hi = (P_max * P_max) / 4096.0
        g1_tail_hi = P_max / 8.0
        C_H0 = (1.5 + gamma) * psi_tail_hi + beta * g1_tail_hi
        C_H1_eff = max(0.0, -lamK) * u_val
        dt_k = np.diff(T_KNOTS)
        K_offs = np.cumsum(dt_k * np.array(xs, dtype=float))
        neg_K_hi = max(0.0, float(-np.min(K_offs))) if len(K_offs) > 0 else 0.0
        tM = float(T_KNOTS[-1])
        pl_u3 = tM * (C_H0 * (inv_U0 ** 3) + C_H1_eff * (inv_U0 ** 2)) + neg_K_hi * (inv_U0 ** 3)
        d0 = max(0.0, C_H0 - xs[-1])
        s_u = d0 * inv_U0 + C_H1_eff
        q_u3 = 0.5 * EPS_K * (s_u * s_u) * inv_U0
        om_neg_u3 = F_val * (0.75 * abs(sc["a_r"] + sc["b_r"]) / u_val) * g1_tail_hi * (inv_U0 ** 3)
        J_u3_hi = pl_u3 + q_u3 + om_neg_u3

    lam_S = sc["mu_sx_sep"] + sum(sc["eta_gram"])
    mu_S = sc["mu_sr_sep"]
    af = sum(sc["eta_gram"][j] * (S_GRAM[j] - 1.0) / 18.0 for j in range(len(S_GRAM)))
    ag = sum(sc["eta_gram"][j] * (S_GRAM[j] + 0.5 - 3.0 / S_GRAM[j]) / 18.0 for j in range(len(S_GRAM)))
    sum_w = sum(abs(w) for w in sc["w_stein"])
    sum_wc = sum(abs(sc["w_stein"][m]) * C_RAT[m] for m in range(len(C_RAT)))
    yeq = sc["yeq"]
    cx_u_max = abs(-2.0 * yeq[3] + (2.0 / 3.0) * lam_S + 2.0 * af) + (abs(yeq[2]) + sum_w) * inv_U0
    cr_u_max = abs(-yeq[3] - sc["nu_plus"] + sc["nu_minus"] + (2.0 / 3.0) * mu_S - 2.0 * ag) + sum_w * inv_U0
    psiK_u3 = (0.25 * cx_u_max * cx_u_max / lam_S + 0.25 * cr_u_max * cr_u_max / mu_S) * inv_U0
    aL, bL = float(rho_a[-1]), float(rho_b[-1])
    rice_u3 = sum(
        sc["mu_rice"][k] * (aL * (inv_U0 ** 3) + bL * (LAMS_RICE[k] ** 2) * u_val * (inv_U0 ** 2))
        for k in range(len(LAMS_RICE)) if sc["mu_rice"][k] > 0.0
    )
    M3_hi = 6.0 + 9.0 * chi_hi + C6_CONST * (chi_hi ** 1.5)
    br = np.array([t_lo + l * u_val / E1_CONST for l in LAMS_RICE])
    rhs_lo = (
        yeq[0] + yeq[1] + 2.0 * yeq[3]
        + sc["mu_u2_lo"] * (2.0 + chi_lo) - sc["mu_u2_hi"] * (2.0 + chi_hi)
        - sc["mu_u3"] * M3_hi + sc["nu_plus"] * (2.0 / 3.0)
        - sc["mu_rad"] * (2287.0 / 2500.0)
        + sc["eta_sl_lo"] * sc["a_r"] - sc["eta_sl_hi"] * sc["b_r"]
        + float(np.array(sc["mu_rice"], dtype=float) @ br)
    )
    c_U2 = yeq[3] + sc["mu_u2_lo"] - sc["mu_u2_hi"] + sc["nu_plus"] / 3.0
    c_g1 = sc["eta_sl_lo"] - sc["eta_sl_hi"]
    g1_lin_u3 = abs(c_g1) * g1_tail_hi * (inv_U0 ** 3)
    const_term = max(0.0, const_off_hi - rhs_lo + yeq[0] + sum_wc) * (inv_U0 ** 3)
    lin_term = max(0.0, yeq[1]) * (inv_U0 ** 2) + max(0.0, c_U2) * inv_U0
    return const_term + lin_term + g1_lin_u3 + J_u3_hi + psiK_u3 + rice_u3 - sc["mu_u3"]


def solve_farkas_slice(U_nodes, rho_a, rho_b, u_val, t_lo, chi_lo, chi_hi,
                       a_r, b_r, g1_l_n, g1_u_n, beta, gamma, lamK, xs,
                       target_rhs=0.25, w_u3=2e-6, include_slice_rows=True, extra_soc=()):
    N = len(U_nodes)
    NV = 5 * N
    Aeq, beq, Aub, bub, rcount, d_col, _ = build_lp_matrices(
        U_nodes, rho_a, rho_b, u_val, t_lo, chi_lo, chi_hi, extra_soc=extra_soc
    )
    if include_slice_rows:
        r_sl = np.zeros((2, NV))
        r_sl[0, :N] = -g1_u_n * d_col[:N]
        r_sl[1, :N] = g1_l_n * d_col[:N]
        Aub_sl = sp_vstack([Aub, csr_matrix(r_sl)], format="csr")
        bub_sl = np.concatenate([bub, [-a_r, b_r]])
        k_rel = 2 + len(LAMS_RICE)
    else:
        Aub_sl = Aub
        bub_sl = bub
        k_rel = len(LAMS_RICE)
    col_z = np.zeros((Aub_sl.shape[0], 1))
    col_z[0, 0] = -1.0
    col_z[1, 0] = -1.0
    col_z[-k_rel:, 0] = -1.0
    Aub_ext = sp_hstack([Aub_sl, csr_matrix(col_z)], format="csr")
    Aeq_ext = sp_hstack([Aeq, csr_matrix((Aeq.shape[0], 1))], format="csr")
    bnds_ext = [(0, None)] * N + [(None, None)] * (2 * N) + [(0, None)] * (2 * N) + [(0, None)]
    M3_hi = 6.0 + 9.0 * chi_hi + C6_CONST * (chi_hi ** 1.5)
    # Step 1: Pure separation solve (w_u3 = 0) to measure true z_min without U^3 perturbation:
    c0 = np.zeros(NV + 1)
    c0[NV] = 1.0
    rs0 = linprog(c0, A_ub=Aub_ext, b_ub=bub_sl, A_eq=Aeq_ext, b_eq=beq, bounds=bnds_ext, method="highs")
    min_z = 1e-11 if include_slice_rows else 2e-6
    if not rs0.success or rs0.fun <= min_z:
        return None
    z_pure = float(rs0.fun)
    # Step 2: Enforce negative -w_u3_eff * U^3 dual decay while keeping >= 45% of z_pure:
    w_u3_eff = min(w_u3, 0.55 * z_pure / M3_hi)
    for w_sep in (min(1e-8, 0.01 * z_pure), 0.0):
        c_ext = np.zeros(NV + 1)
        c_ext[NV] = 1.0
        c_ext[3 * N:5 * N] = -w_sep * d_col[3 * N:5 * N]
        c_ext[:N] = (-w_u3_eff * (U_nodes ** 3)) * d_col[:N]
        rs = linprog(c_ext, A_ub=Aub_ext, b_ub=bub_sl, A_eq=Aeq_ext, b_eq=beq, bounds=bnds_ext, method="highs")
        if rs.success and rs.fun > 0.2 * min_z:
            scale = target_rhs / float(rs.fun)
            class ScaledRes:
                pass
            sr = ScaledRes()
            sr.eqlin = ScaledRes()
            sr.ineqlin = ScaledRes()
            sr.eqlin.marginals = rs.eqlin.marginals * scale
            sr.ineqlin.marginals = rs.ineqlin.marginals * scale
            return extract_dyadic_slice_cert(sr, rcount, a_r, b_r, beta, gamma, lamK, xs)
    return None


def certify_infeas_r1(rho_a, rho_b, u_val, t_lo, chi_lo, chi_hi):
    """Prove no admissible law exists on (u, [chi_lo, chi_hi]) by Farkas dual LP: 1 + dual <= 0!"""
    U0, U_base, U_test = make_u_grids(u_val)
    U_nodes = U_base.copy()
    w_u3 = 2e-6 * ((8192.0 / U0) ** 3)
    z0_n = np.zeros(1)
    extra_soc = []
    for _ in range(7):
        sc = solve_farkas_slice(
            U_nodes, rho_a, rho_b, u_val, t_lo, chi_lo, chi_hi,
            0.0, 0.0, z0_n, z0_n, 0.0, 1.0, 0.0, np.zeros(len(T_KNOTS) - 1),
            target_rhs=2.5, w_u3=w_u3, include_slice_rows=False, extra_soc=extra_soc
        )
        if sc is None:
            return None
        z0 = np.zeros_like(U_test)
        M_t = eval_continuous_M_on_test(
            sc, 0.0, u_val, t_lo, chi_lo, chi_hi, rho_a, rho_b, U_test, z0, z0, z0, z0, is_infeas=True
        )
        tail_c = check_tail_coeff_float(sc, 0.0, u_val, t_lo, chi_lo, chi_hi, rho_a, rho_b, is_infeas=True)
        if np.max(M_t) < -0.05 and tail_c < -1e-9:
            return sc
        if tail_c >= -1e-9:
            w_u3 *= 4.0
        vs_t, rs_t = cone_K_maximizer_vec(sc, U_test)
        extra_soc.append((U_test, vs_t, rs_t))
        top_idx = np.argsort(M_t)[-16:]
        U_nodes = np.unique(np.concatenate([U_nodes, U_test[top_idx]]))
    return None


def certify_sector_jm1(row_eval, is_B, rho_a, rho_b, u_val, t_lo, chi_lo, chi_hi, target_theta):
    """Compute rigorous continuous-U SliceCerts covering the ENTIRE global range of g1(v) on [0, inf)!"""
    U0, U_base, _ = make_u_grids(u_val)
    w_u3_base = 1e-7 * ((8192.0 / U0) ** 3)

    v_scan = np.concatenate([[0.0], 64.0 * ((np.linspace(0.0005, 1.0, 800)) ** 2), np.geomspace(64.0, 1e6, 120)])
    _, _, g1_l_all, g1_u_all = row_eval.eval_psi_g1_bounds(is_B, u_val, v_scan)
    g1_glob_lo = float(r_num(float(np.min(g1_l_all)) - 0.004, 7))
    g1_glob_hi = float(r_num(float(np.max(g1_u_all)) + 0.004, 7))

    psi_l_b, psi_u_b, g1_l_b, g1_u_b = row_eval.eval_psi_g1_bounds(is_B, u_val, u_val * U_base)
    N0 = len(U_base)
    NV0 = 5 * N0
    Aeq0, beq0, Aub0, bub0, rcount0, d_col0, bnds0 = build_lp_matrices(U_base, rho_a, rho_b, u_val, t_lo, chi_lo, chi_hi)
    c_lo = np.zeros(NV0)
    c_lo[:N0] = g1_l_b * d_col0[:N0]
    r_lo = linprog(c_lo, A_ub=Aub0, b_ub=bub0, A_eq=Aeq0, b_eq=beq0, bounds=bnds0, method="highs")
    if not r_lo.success:
        sc_inf = certify_infeas_r1(rho_a, rho_b, u_val, t_lo, chi_lo, chi_hi)
        if sc_inf is not None:
            sc_inf["a_r"] = g1_glob_lo
            sc_inf["b_r"] = g1_glob_hi
            sc_inf["gamma"] = 0.25
            sc_inf["xs"] = [0.5] * (len(T_KNOTS) - 1)
            return 0.01, [sc_inf]
    c_hi = np.zeros(NV0)
    c_hi[:N0] = -g1_u_b * d_col0[:N0]
    r_hi = linprog(c_hi, A_ub=Aub0, b_ub=bub0, A_eq=Aeq0, b_eq=beq0, bounds=bnds0, method="highs")
    m_min = float(r_lo.fun)
    m_max = float(-r_hi.fun)

    ultra_tight = (2.0 < target_theta < 5.15)
    very_tight = (2.0 < target_theta < 5.6)
    tight = (5.6 <= target_theta < 8.5)
    NSL = 24 if ultra_tight else (16 if very_tight else (5 if tight else 3))
    n_outer = 5 if ultra_tight else (4 if very_tight else 2)
    nm_maxiter = 100 if ultra_tight else (80 if very_tight else 45)
    pad_inf = 0.0020 if ultra_tight else (0.0025 if very_tight else 0.010)
    inset = 0.00025 if ultra_tight else (0.0004 if very_tight else 0.0020)

    a_int = float(r_num(m_min - pad_inf, 7)) if (m_min - g1_glob_lo > 1.6 * pad_inf) else g1_glob_lo
    b_int = float(r_num(m_max + pad_inf, 7)) if (g1_glob_hi - m_max > 1.6 * pad_inf) else g1_glob_hi
    if m_max - m_min > 3.0 * inset and NSL >= 2:
        mid_knots = [float(r_num(v, 7)) for v in np.linspace(m_min + inset, m_max - inset, NSL - 1)]
        int_edges = [a_int] + mid_knots + [b_int]
    else:
        int_edges = [a_int, b_int]

    raw_intervals = []
    if g1_glob_lo < int_edges[0]:
        raw_intervals.append((g1_glob_lo, int_edges[0], True))
    for i in range(len(int_edges) - 1):
        if int_edges[i] < int_edges[i + 1]:
            raw_intervals.append((int_edges[i], int_edges[i + 1], False))
    if int_edges[-1] < g1_glob_hi:
        raw_intervals.append((int_edges[-1], g1_glob_hi, True))

    slice_models = []
    max_F_needed = 0.05
    init_s = np.array([[0.8, 0.4, 0.2], [1.8, 0.4, 0.2], [0.8, 1.0, 0.2], [0.8, 0.4, -0.5]])

    for a_r, b_r, is_outer_inf in raw_intervals:
        if is_outer_inf:
            slice_models.append((a_r, b_r, "INFEAS", None))
            continue
        r_sl0 = np.zeros((2, NV0))
        r_sl0[0, :N0] = -g1_u_b * d_col0[:N0]
        r_sl0[1, :N0] = g1_l_b * d_col0[:N0]
        Aub_sl0 = sp_vstack([Aub0, csr_matrix(r_sl0)], format="csr")
        bub_sl0 = np.concatenate([bub0, [-a_r, b_r]])
        ab = a_r + b_r
        om_lo_b = 1.5 * psi_l_b - (0.75 * ab / u_val) * (g1_u_b if ab >= 0 else g1_l_b)
        rs0 = linprog(
            np.concatenate([-psi_u_b * d_col0[:N0], np.zeros(4 * N0)]),
            A_ub=Aub_sl0, b_ub=bub_sl0, A_eq=Aeq0, b_eq=beq0, bounds=bnds0, method="highs"
        )
        if not rs0.success:
            slice_models.append((a_r, b_r, "INFEAS", None))
            continue
        p_mix = np.maximum(rs0.x[:N0] * d_col0[:N0], 0.0)
        F_best = 999.0
        best_params = None
        for _ in range(n_outer):
            def f_bg(params):
                beta = max(0.0, params[0])
                gamma = max(2e-3, params[1])
                lamK = params[2]
                c1 = beta * beta / 3.0 + lamK
                c2 = beta * beta / (4.0 * gamma) + lamK if beta > 0 else lamK
                H_hi = (1.5 + gamma) * psi_u_b - beta * g1_l_b - lamK * (u_val * U_base)
                xs_t = get_kantorovich_xs(H_hi, p_mix)
                ck, phi_g = eval_kant_hi(H_hi, xs_t)
                C_J = c1 * u_val + M_lambda_chi_exact(c1, c2, u_val, chi_hi) + ck
                den = max(1e-6, 0.75 * a_r * b_r / u_val + float(om_lo_b @ p_mix))
                return (C_J + float(phi_g @ p_mix)) / den

            res_bg = minimize(
                f_bg, [0.8, 0.4, 0.2], method="Nelder-Mead",
                options={"initial_simplex": init_s, "maxiter": nm_maxiter}
            )
            beta = float(r_num(max(0.0, res_bg.x[0]), 7))
            gamma = max(float(r_num(max(2e-3, res_bg.x[1]), 7)), 2e-3)
            lamK = float(r_num(res_bg.x[2], 7))
            H_hi = (1.5 + gamma) * psi_u_b - beta * g1_l_b - lamK * (u_val * U_base)
            xs = get_kantorovich_xs(H_hi, p_mix)
            ck, phi_hi = eval_kant_hi(H_hi, xs)
            c1 = beta * beta / 3.0 + lamK
            c2 = beta * beta / (4.0 * gamma) + lamK if beta > 0 else lamK
            C_J = c1 * u_val + M_lambda_chi_exact(c1, c2, u_val, chi_hi) + ck
            F_try = max(0.05, float(res_bg.fun))
            p_n = p_mix
            for _ in range(2):
                c_d = np.zeros(NV0)
                c_d[:N0] = (-(phi_hi - F_try * om_lo_b) - w_u3_base * (U_base ** 3)) * d_col0[:N0]
                c_d[3 * N0:5 * N0] = -2e-5 * d_col0[3 * N0:5 * N0]
                rs_m = linprog(c_d, A_ub=Aub_sl0, b_ub=bub_sl0, A_eq=Aeq0, b_eq=beq0, bounds=bnds0, method="highs")
                if not rs_m.success:
                    break
                p_n = np.maximum(rs_m.x[:N0] * d_col0[:N0], 0.0)
                den_n = max(1e-6, 0.75 * a_r * b_r / u_val + float(om_lo_b @ p_n))
                F_try = max(0.05, (C_J + float(phi_hi @ p_n)) / den_n)
            if F_try < F_best:
                F_best = F_try
                best_params = (beta, gamma, lamK, xs)
            p_mix = 0.6 * p_mix + 0.4 * p_n
        max_F_needed = max(max_F_needed, F_best)
        slice_models.append((a_r, b_r, "FEAS", best_params))

    if target_theta > 0 and max_F_needed < target_theta - 1.5:
        F_cert = float(r_num(min(0.5 * (max_F_needed + target_theta), max_F_needed + 0.45), 6))
    elif target_theta > 0 and max_F_needed < target_theta - 0.015:
        F_cert = float(r_num(min(0.5 * (max_F_needed + target_theta), max_F_needed + 0.05), 6))
    elif target_theta > 0 and max_F_needed < target_theta - 5e-5:
        F_cert = float(r_num(0.5 * (max_F_needed + target_theta), 7))
    else:
        F_cert = float(r_num(max_F_needed + 0.35, 6))

    return F_cert, slice_models


def polish_slices_at_F(row_eval, is_B, rho_a, rho_b, u_val, t_lo, chi_lo, chi_hi,
                       F_val, slice_models, U_base, U_test, psi_l_t, psi_u_t, g1_l_t, g1_u_t):
    U0 = max(8192.0, math.ceil(64.0 / u_val))
    w_u3_init = 2e-7 * ((8192.0 / U0) ** 3)
    tail_tol = -1e-11 if U0 > 8192.0 else -1e-8
    out_slices = []
    worst_sup = -1e300
    psi_max_t = float(np.max(psi_u_t))
    X_top = float(r_num(max(0.5, 1.75 * psi_max_t + 0.25), 5))
    # Precompute U_check, (psi, g1), and Rice matrix ONCE for the entire sector (30x faster!):
    w_u = row_eval.w_edges / u_val
    w_u = w_u[(w_u > 0.0) & (w_u <= U0)]
    U_check = np.unique(np.concatenate([U_test, np.maximum(0.0, w_u - 1e-8), np.minimum(U0, w_u + 1e-8)]))
    psi_l_c, psi_u_c, g1_l_c, g1_u_c = row_eval.eval_psi_g1_bounds(is_B, u_val, u_val * U_check)
    Ar_c = np.array([
        np.min(rho_a[:, None] + rho_b[:, None] * (l * l * u_val * U_check)[None, :], axis=0)
        for l in LAMS_RICE
    ])

    for item in slice_models:
        if isinstance(item, dict):
            a_r, b_r = item["a_r"], item["b_r"]
            status = "INFEAS" if (item["beta"] == 0.0 and item["lamK"] == 0.0 and item["gamma"] == 0.25) else "FEAS"
            params = (item["beta"], item["gamma"], item["lamK"], np.array(item["xs"], dtype=float))
        else:
            a_r, b_r, status, params = item

        U_nodes = U_base.copy()
        w_u3 = w_u3_init
        if status == "INFEAS" or params is None:
            beta, gamma, lamK, xs = 0.0, 0.25, 0.0, np.full(len(T_KNOTS) - 1, X_top)
        else:
            beta, gamma, lamK, xs = params

        ck_val, _ = eval_kant_hi(np.array([0.0]), xs)
        c1_v = beta * beta / 3.0 + lamK
        c2_v = beta * beta / (4.0 * gamma) + lamK if beta > 0.0 else lamK
        const_off_v = (
            c1_v * u_val + M_lambda_chi_exact(c1_v, c2_v, u_val, chi_hi)
            + ck_val - F_val * (0.75 * a_r * b_r / u_val)
        )
        ab = a_r + b_r
        g1_for_om_t = g1_u_t if ab >= 0.0 else g1_l_t
        max_neg_om = float(np.max(np.maximum(0.0, -F_val * (1.5 * psi_l_t - (0.75 * ab / u_val) * g1_for_om_t))))
        target_rhs = max(0.0, const_off_v + max_neg_om) + 0.20

        sc = None
        sup_m = 0.0
        extra_soc = []
        for _ in range(8):
            N = len(U_nodes)
            NV = 5 * N
            psi_l_n, psi_u_n, g1_l_n, g1_u_n = row_eval.eval_psi_g1_bounds(is_B, u_val, u_val * U_nodes)
            if status == "INFEAS":
                sc = solve_farkas_slice(
                    U_nodes, rho_a, rho_b, u_val, t_lo, chi_lo, chi_hi,
                    a_r, b_r, g1_l_n, g1_u_n, beta, gamma, lamK, xs,
                    target_rhs=target_rhs, w_u3=w_u3, include_slice_rows=True, extra_soc=extra_soc
                )
            else:
                sc = None
            if sc is None:
                Aeq, beq, Aub, bub, rcount, d_col, bnds = build_lp_matrices(
                    U_nodes, rho_a, rho_b, u_val, t_lo, chi_lo, chi_hi, extra_soc=extra_soc
                )
                r_sl = np.zeros((2, NV))
                r_sl[0, :N] = -g1_u_n * d_col[:N]
                r_sl[1, :N] = g1_l_n * d_col[:N]
                Aub_sl = sp_vstack([Aub, csr_matrix(r_sl)], format="csr")
                bub_sl = np.concatenate([bub, [-a_r, b_r]])
                H_hi_n = (1.5 + gamma) * psi_u_n - beta * g1_l_n - lamK * (u_val * U_nodes)
                _, phi_hi_n = eval_kant_hi(H_hi_n, xs)
                om_lo_n = 1.5 * psi_l_n - (0.75 * ab / u_val) * (g1_u_n if ab >= 0 else g1_l_n)
                J_n = phi_hi_n - F_val * om_lo_n
                c_max = np.zeros(NV)
                c_max[:N] = (-J_n - w_u3 * (U_nodes ** 3)) * d_col[:N]
                c_max[3 * N:5 * N] = -2e-5 * d_col[3 * N:5 * N]
                rs = linprog(c_max, A_ub=Aub_sl, b_ub=bub_sl, A_eq=Aeq, b_eq=beq, bounds=bnds, method="highs")
                if not rs.success:
                    sc = solve_farkas_slice(
                        U_nodes, rho_a, rho_b, u_val, t_lo, chi_lo, chi_hi,
                        a_r, b_r, g1_l_n, g1_u_n, beta, gamma, lamK, xs,
                        target_rhs=target_rhs, w_u3=w_u3, include_slice_rows=True, extra_soc=extra_soc
                    )
                    if sc is None:
                        for pad_rel in (1e-5, 1e-4, 1e-3):
                            bub_rel = bub_sl.copy()
                            bub_rel[-2:] += pad_rel
                            rs_rel = linprog(c_max, A_ub=Aub_sl, b_ub=bub_rel, A_eq=Aeq, b_eq=beq, bounds=bnds, method="highs")
                            if rs_rel.success:
                                sc = extract_dyadic_slice_cert(rs_rel, rcount, a_r, b_r, beta, gamma, lamK, xs)
                                break
                else:
                    sc = extract_dyadic_slice_cert(rs, rcount, a_r, b_r, beta, gamma, lamK, xs)
            M_c = eval_continuous_M_on_test(
                sc, F_val, u_val, t_lo, chi_lo, chi_hi, rho_a, rho_b, U_check, psi_l_c, psi_u_c, g1_l_c, g1_u_c,
                Ar_pre=Ar_c
            )
            sup_m = float(np.max(M_c))
            tail_c = check_tail_coeff_float(sc, F_val, u_val, t_lo, chi_lo, chi_hi, rho_a, rho_b, is_infeas=False)
            if sup_m < -5.0e-4 and tail_c < tail_tol:
                break
            if tail_c >= tail_tol:
                w_u3 *= 4.0
            if status == "INFEAS" and (sup_m >= -5.0e-4 or tail_c >= tail_tol):
                target_rhs *= 1.5
            vs_c, rs_c = cone_K_maximizer_vec(sc, U_check)
            extra_soc.append((U_check, vs_c, rs_c))
            U_nodes = np.unique(np.concatenate([U_nodes, U_check[np.argsort(M_c)[-18:]]]))
        worst_sup = max(worst_sup, sup_m, 1.0 if tail_c >= tail_tol else -1.0)
        out_slices.append(sc)
    return out_slices, worst_sup


def emit_dat(cfg_json, dat_path):
    with open(dat_path, "w") as f:
        def wvec(v):
            f.write(f"{len(v)} " + " ".join(f"{float(x):.17g}" for x in v) + "\n")
        wvec(cfg_json["t_knots"])
        f.write(f"{float(cfg_json['eps_K']):.17g}\n")
        wvec(cfg_json["c_rat"])
        wvec(cfg_json["s_gram"])
        wvec(cfg_json["rho_a"])
        wvec(cfg_json["rho_b"])
        wvec(cfg_json["lams_rice"])
        cells = cfg_json["cells"]
        f.write(f"{len(cells)}\n")
        for c in cells:
            f.write(
                f"{c['piece_idx']} {c['u_idx']} {c['row_tag']} {c['kind']} "
                f"{float(c['u_lo']):.17g} {float(c['u_hi']):.17g} {float(c['t_lo']):.17g} "
                f"{float(c['chi_lo']):.17g} {float(c['chi_hi']):.17g} "
                f"{float(c['theta_allow']):.17g} {float(c['F_claimed']):.17g}\n"
            )
            for key in ("slicesA", "slicesB"):
                sls = c[key]
                f.write(f"{len(sls)}\n")
                for sc in sls:
                    f.write(
                        f"{float(sc['a_r']):.17g} {float(sc['b_r']):.17g} "
                        f"{float(sc['beta']):.17g} {float(sc['gamma']):.17g} {float(sc['lamK']):.17g}\n"
                    )
                    wvec(sc["xs"])
                    yeq = sc["yeq"]
                    f.write(f"{float(yeq[0]):.17g} {float(yeq[1]):.17g} {float(yeq[2]):.17g} {float(yeq[3]):.17g}\n")
                    wvec(sc["w_stein"])
                    f.write(f"{float(sc['mu_u2_lo']):.17g} {float(sc['mu_u2_hi']):.17g} {float(sc['mu_u3']):.17g}\n")
                    f.write(
                        f"{float(sc['nu_plus']):.17g} {float(sc['nu_minus']):.17g} "
                        f"{float(sc['mu_sx_sep']):.17g} {float(sc['mu_sr_sep']):.17g} {float(sc['mu_rad']):.17g}\n"
                    )
                    wvec(sc["eta_gram"])
                    wvec(sc["mu_rice"])
                    f.write(f"{float(sc['eta_sl_lo']):.17g} {float(sc['eta_sl_hi']):.17g}\n")


_G_ROW_EVALS = None
_G_RHO_A = None
_G_RHO_B = None


def _init_worker(rows_cache_path):
    global _G_ROW_EVALS, _G_RHO_A, _G_RHO_B
    rc = json.load(open(rows_cache_path))
    _G_ROW_EVALS = {r["tag"]: CppRowEvaluator(r) for r in rc["rows"]}
    _G_RHO_A, _G_RHO_B = build_verified_rice_polygon()


def _solve_jm1_pair(pc_idx, u_idx, rtag, u_lo, u_hi, tlo, chi_lo, chi_hi, th_allow):
    u_v = 0.5 * (u_lo + u_hi)
    reval = _G_ROW_EVALS[rtag]
    FA, slA0 = certify_sector_jm1(reval, False, _G_RHO_A, _G_RHO_B, u_v, tlo, chi_lo, chi_hi, th_allow)
    FB, slB0 = certify_sector_jm1(reval, True, _G_RHO_A, _G_RHO_B, u_v, tlo, chi_lo, chi_hi, th_allow)
    F_raw = max(FA, FB)
    if th_allow > 0 and F_raw < th_allow - 1.0:
        F_both = float(r_num(min(th_allow - 0.1, F_raw + 0.25), 6))
    elif th_allow > 0 and F_raw < th_allow - 5e-5:
        F_both = float(r_num(min(0.5 * (F_raw + th_allow), F_raw + 0.02), 7))
    else:
        F_both = float(r_num(F_raw + 0.25, 6))
    _, U_base, U_test = make_u_grids(u_lo)
    psi_l_tA, psi_u_tA, g1_l_tA, g1_u_tA = reval.eval_psi_g1_bounds(False, u_v, u_v * U_test)
    psi_l_tB, psi_u_tB, g1_l_tB, g1_u_tB = reval.eval_psi_g1_bounds(True, u_v, u_v * U_test)
    sup_tol = -1.0e-4 if (2.0 < th_allow < 5.15) else -3.0e-4
    for _bump in range(4):
        slA, supA = polish_slices_at_F(
            reval, False, _G_RHO_A, _G_RHO_B, u_v, tlo, chi_lo, chi_hi, F_both, slA0,
            U_base, U_test, psi_l_tA, psi_u_tA, g1_l_tA, g1_u_tA
        )
        slB, supB = polish_slices_at_F(
            reval, True, _G_RHO_A, _G_RHO_B, u_v, tlo, chi_lo, chi_hi, F_both, slB0,
            U_base, U_test, psi_l_tB, psi_u_tB, g1_l_tB, g1_u_tB
        )
        if max(supA, supB) < sup_tol or _bump == 3:
            break
        if th_allow > 0 and F_both < th_allow - 1.5:
            step_b = max(0.60, min(3.5, 0.25 * (th_allow - F_both)))
        elif th_allow > 0 and F_both < th_allow - 5e-5:
            step_b = 0.5 * (th_allow - F_both)
        else:
            step_b = 0.60
        F_both = float(r_num(F_both + step_b, 7))
    return {
        "piece_idx": pc_idx, "u_idx": u_idx, "row_tag": rtag, "kind": "JM1_BOUND",
        "u_lo": u_lo, "u_hi": u_hi, "t_lo": tlo, "chi_lo": chi_lo, "chi_hi": chi_hi,
        "theta_allow": th_allow, "F_claimed": F_both,
        "slicesA": slA, "slicesB": slB
    }


def _solve_cell_task(task):
    kind = task["kind"]
    if kind == "INFEAS_R1_SCAN":
        pc_idx, u_idx, rtag, u_lo, u_hi, tlo, cks = (
            task["piece_idx"], task["u_idx"], task["row_tag"],
            task["u_lo"], task["u_hi"], task["t_lo"], task["cks"]
        )
        for ck in cks:
            sc_inf = certify_infeas_r1(_G_RHO_A, _G_RHO_B, u_hi, tlo, float(ck), 42.0)
            if sc_inf is not None:
                return [{
                    "piece_idx": pc_idx, "u_idx": u_idx, "row_tag": rtag, "kind": "INFEAS_R1",
                    "u_lo": u_lo, "u_hi": u_hi, "t_lo": tlo, "chi_lo": float(ck), "chi_hi": 42.0,
                    "theta_allow": -1.0, "F_claimed": 0.0, "slicesA": [sc_inf], "slicesB": []
                }]
        return []

    if kind == "TAIL_COVER_42":
        # Seamlessly cover [prev_c, 42.0] by finding the earliest INFEAS_R1 cutoff ck_inf in cks (if any)
        # and certifying JM1_BOUND on [prev_c, ck_inf] (or [prev_c, 42.0] if feasible up to 42)!
        pc_idx, u_idx, rtag, u_lo, u_hi, tlo, prev_c, cks = (
            task["piece_idx"], task["u_idx"], task["row_tag"],
            task["u_lo"], task["u_hi"], task["t_lo"], task["prev_c"], task["cks"]
        )
        out = []
        ck_inf = None
        sc_inf_found = None
        for ck in cks:
            sc_inf = certify_infeas_r1(_G_RHO_A, _G_RHO_B, u_hi, tlo, float(ck), 42.0)
            if sc_inf is not None:
                ck_inf = float(ck)
                sc_inf_found = sc_inf
                break
        jm1_top = ck_inf if ck_inf is not None else 42.0
        if jm1_top > prev_c:
            out.append(_solve_jm1_pair(pc_idx, u_idx, rtag, u_lo, u_hi, tlo, prev_c, jm1_top, 50.0))
        if sc_inf_found is not None:
            out.append({
                "piece_idx": pc_idx, "u_idx": u_idx, "row_tag": rtag, "kind": "INFEAS_R1",
                "u_lo": u_lo, "u_hi": u_hi, "t_lo": tlo, "chi_lo": ck_inf, "chi_hi": 42.0,
                "theta_allow": -1.0, "F_claimed": 0.0, "slicesA": [sc_inf_found], "slicesB": []
            })
        return out

    return [_solve_jm1_pair(
        task["piece_idx"], task["u_idx"], task["row_tag"], task["u_lo"], task["u_hi"],
        task["t_lo"], task["chi_lo"], task["chi_hi"], task["theta_allow"]
    )]


def main():
    t0 = time.time()
    rows_cache_path = sys.argv[1]
    json_out_path = sys.argv[2]
    dat_out_path = sys.argv[3]
    smoke = "--smoke" in sys.argv[4:]

    rho_a, rho_b = build_verified_rice_polygon()
    ft = json.load(
        open(os.path.join(
            REPO, "research/higher-degree/code/degree5-design/design-2026-11-25/tables/funded/fin_table_fundFull.json"
        )),
        parse_float=Decimal
    )
    chosen_keys = {(tuple(c["piece"]), c["row_tag"]) for c in ft["chosen"]}
    pieces = sorted(
        [c for c in ft["cases"] if (tuple(c["piece"]), c["row_tag"]) in chosen_keys],
        key=lambda c: Fraction(c["piece"][0])
    )
    CHI_LIST = [1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 20, 24, 30, 36, 42]

    tasks = []
    if smoke:
        p16 = pieces[15]
        p17 = pieces[16]
        u16_lo, u16_hi = enclose_binary64(Fraction(p16["theta"][-1]["u"]))
        u17_lo, u17_hi = enclose_binary64(Fraction(p17["theta"][-1]["u"]))
        u_own_lo, u_own_hi = enclose_binary64(Fraction("0.1572"))
        tasks = [
            {"kind": "JM1_BOUND", "piece_idx": 16, "u_idx": len(p16["theta"]) - 1, "row_tag": "0.860",
             "u_lo": u16_lo, "u_hi": u16_hi, "t_lo": floor_binary64(Fraction(p16["piece"][0])),
             "chi_lo": 10.0, "chi_hi": 10.25, "theta_allow": float(p16["theta"][-1]["theta_chi"]["12"])},
            {"kind": "TAIL_COVER_42", "piece_idx": 17, "u_idx": len(p17["theta"]) - 1, "row_tag": "0.865",
             "u_lo": u17_lo, "u_hi": u17_hi, "t_lo": floor_binary64(Fraction(p17["piece"][0])),
             "prev_c": 8.0, "cks": [30, 36, 40, 41, 42]},
            {"kind": "JM1_BOUND", "piece_idx": 0, "u_idx": -1, "row_tag": "0.700_own",
             "u_lo": u_own_lo, "u_hi": u_own_hi, "t_lo": floor_binary64(Fraction("0.6949")),
             "chi_lo": 12.0, "chi_hi": 12.0, "theta_allow": 0.085},
            {"kind": "JM1_BOUND", "piece_idx": 0, "u_idx": -1, "row_tag": "0.800",
             "u_lo": 0.0078125, "u_hi": 0.0078125, "t_lo": floor_binary64(Fraction("0.785440")),
             "chi_lo": 36.0, "chi_hi": 42.0, "theta_allow": 1.139},
        ]
    else:
        # 1. Piece 17: 100% continuous [0, 42] cover across all 5 energies!
        p17 = pieces[16]
        tlo17 = floor_binary64(Fraction(p17["piece"][0]))
        rtag17 = f"{float(p17['tprime']):.3f}"
        for u_idx, te in enumerate(p17["theta"]):
            u_lo, u_hi = enclose_binary64(Fraction(te["u"]))
            prev_c = 0.0
            has_miss = False
            for ck in CHI_LIST:
                th_v = te["theta_chi"].get(str(ck), "MISSING")
                if th_v == "MISSING":
                    has_miss = True
                elif th_v is not None and float(th_v) < 49.999:
                    tasks.append({
                        "kind": "JM1_BOUND", "piece_idx": 17, "u_idx": u_idx, "row_tag": rtag17,
                        "u_lo": u_lo, "u_hi": u_hi, "t_lo": tlo17, "chi_lo": prev_c, "chi_hi": float(ck),
                        "theta_allow": floor_binary64(Fraction(th_v))
                    })
                    prev_c = float(ck)
            if has_miss:
                tasks.append({
                    "kind": "TAIL_COVER_42", "piece_idx": 17, "u_idx": u_idx, "row_tag": rtag17,
                    "u_lo": u_lo, "u_hi": u_hi, "t_lo": tlo17, "prev_c": prev_c, "cks": [24, 30, 36, 39, 40, 41, 42]
                })
            elif prev_c < 42.0:
                tasks.append({
                    "kind": "JM1_BOUND", "piece_idx": 17, "u_idx": u_idx, "row_tag": rtag17,
                    "u_lo": u_lo, "u_hi": u_hi, "t_lo": tlo17, "chi_lo": prev_c, "chi_hi": 42.0, "theta_allow": 50.0
                })

        # 2. Piece 16: 100% continuous [0, 42] cover across all 5 energies!
        p16 = pieces[15]
        tlo16 = floor_binary64(Fraction(p16["piece"][0]))
        rtag16 = f"{float(p16['tprime']):.3f}"
        for u_idx, te in enumerate(p16["theta"]):
            u_lo, u_hi = enclose_binary64(Fraction(te["u"]))
            uf = float(te["ucapfrac"])
            prev_c = 0.0
            has_miss = False
            for ck in CHI_LIST:
                th_v = te["theta_chi"].get(str(ck), "MISSING")
                if th_v == "MISSING":
                    has_miss = True
                elif th_v is not None and float(th_v) < 49.999:
                    if uf > 0.90 and 10.0 <= prev_c < 12.0:
                        sub_ed = [10.0, 10.25, 10.5, 10.75, 11.0, 11.25, 11.5, 11.625, 11.75, 11.875, 12.0]
                    else:
                        n_sub = 2 if (uf > 0.90 and 8.0 <= prev_c < 14.0) else 1
                        sub_ed = list(np.linspace(prev_c, float(ck), n_sub + 1))
                    for si_sub in range(len(sub_ed) - 1):
                        tasks.append({
                            "kind": "JM1_BOUND", "piece_idx": 16, "u_idx": u_idx, "row_tag": rtag16,
                            "u_lo": u_lo, "u_hi": u_hi, "t_lo": tlo16, "chi_lo": float(sub_ed[si_sub]),
                            "chi_hi": float(sub_ed[si_sub + 1]), "theta_allow": floor_binary64(Fraction(th_v))
                        })
                    prev_c = float(ck)
            if has_miss:
                tasks.append({
                    "kind": "TAIL_COVER_42", "piece_idx": 16, "u_idx": u_idx, "row_tag": rtag16,
                    "u_lo": u_lo, "u_hi": u_hi, "t_lo": tlo16, "prev_c": prev_c, "cks": [24, 30, 36, 39, 40, 41, 42]
                })
            elif prev_c < 42.0:
                tasks.append({
                    "kind": "JM1_BOUND", "piece_idx": 16, "u_idx": u_idx, "row_tag": rtag16,
                    "u_lo": u_lo, "u_hi": u_hi, "t_lo": tlo16, "chi_lo": prev_c, "chi_hi": 42.0, "theta_allow": 50.0
                })

        # 3. Pieces 1..15: representative closed small/moderate-chi cells (theta >= 2.45 at f=0.78),
        #    all (R1)-infeasible '-' tails, and 1 benchmark cell per piece on Pieces 1..11!
        for idx_p in range(15, 0, -1):
            p = pieces[idx_p - 1]
            tlo = floor_binary64(Fraction(p["piece"][0]))
            rtag = f"{float(p['tprime']):.3f}"
            for u_idx, te in enumerate(p["theta"]):
                u_lo, u_hi = enclose_binary64(Fraction(te["u"]))
                uf = float(te["ucapfrac"])
                miss_cks = [ck for ck in CHI_LIST if te["theta_chi"].get(str(ck), "MISSING") == "MISSING"]
                if miss_cks:
                    scan_cks = sorted(set(miss_cks + [39, 40, 41, 42]))
                    tasks.append({
                        "kind": "INFEAS_R1_SCAN", "piece_idx": idx_p, "u_idx": u_idx, "row_tag": rtag,
                        "u_lo": u_lo, "u_hi": u_hi, "t_lo": tlo, "cks": [c for c in scan_cks if c >= min(miss_cks)]
                    })
                if abs(uf - 0.78) < 0.02:
                    closed_cks = [
                        ck for ck in CHI_LIST
                        if isinstance(te["theta_chi"].get(str(ck)), (int, float, Decimal))
                        and 2.45 <= float(te["theta_chi"][str(ck)]) < 49.999
                    ]
                    picks = sorted(set([closed_cks[0], closed_cks[-1]])) if closed_cks else []
                    for ck_c in picks:
                        tasks.append({
                            "kind": "JM1_BOUND", "piece_idx": idx_p, "u_idx": u_idx, "row_tag": rtag,
                            "u_lo": u_lo, "u_hi": u_hi, "t_lo": tlo, "chi_lo": 0.0 if ck_c == 1 else float(ck_c),
                            "chi_hi": float(ck_c), "theta_allow": floor_binary64(Fraction(te["theta_chi"][str(ck_c)]))
                        })
                    if idx_p <= 11:
                        th_b = te["theta_chi"].get("2", None)
                        if th_b is not None and float(th_b) < 2.45:
                            tasks.append({
                                "kind": "JM1_BOUND", "piece_idx": idx_p, "u_idx": u_idx, "row_tag": rtag,
                                "u_lo": u_lo, "u_hi": u_hi, "t_lo": tlo, "chi_lo": 2.0, "chi_hi": 2.0,
                                "theta_allow": floor_binary64(Fraction(th_b))
                            })

        # 4. Negative Controls (piece_idx = 0):
        u_own_lo, u_own_hi = enclose_binary64(Fraction("0.1572"))
        tasks.append({
            "kind": "JM1_BOUND", "piece_idx": 0, "u_idx": -1, "row_tag": "0.700_own",
            "u_lo": u_own_lo, "u_hi": u_own_hi, "t_lo": floor_binary64(Fraction("0.6949")),
            "chi_lo": 12.0, "chi_hi": 12.0, "theta_allow": 0.085
        })
        tasks.append({
            "kind": "JM1_BOUND", "piece_idx": 0, "u_idx": -1, "row_tag": "0.800",
            "u_lo": 0.0078125, "u_hi": 0.0078125, "t_lo": floor_binary64(Fraction("0.785440")),
            "chi_lo": 36.0, "chi_hi": 42.0, "theta_allow": 1.139
        })

    print(f"Dispatching {len(tasks)} cell tasks across 4 workers...", flush=True)
    nested_results = [None] * len(tasks)
    done_cnt = 0
    with concurrent.futures.ProcessPoolExecutor(
        max_workers=min(4, os.cpu_count() or 2), initializer=_init_worker, initargs=(rows_cache_path,)
    ) as ex:
        fut_to_idx = {ex.submit(_solve_cell_task, t): idx_t for idx_t, t in enumerate(tasks)}
        for fut in concurrent.futures.as_completed(fut_to_idx):
            idx_t = fut_to_idx[fut]
            nested_results[idx_t] = fut.result()
            done_cnt += 1
            if done_cnt % 10 == 0 or done_cnt == len(tasks):
                print(f"  completed {done_cnt}/{len(tasks)} tasks ({time.time() - t0:.1f}s)", flush=True)

    cells_out = [res for sub in nested_results for res in sub if res is not None]
    for res in cells_out:
        if res["piece_idx"] in (16, 17, 0):
            print(
                f"[Pc {res['piece_idx']:2d}] {res['kind']:9s} row={res['row_tag']} u={res['u_lo']:.6f} "
                f"chi=[{res['chi_lo']},{res['chi_hi']}]: F_cert={res['F_claimed']:.4f} (theta={res['theta_allow']:.3f})",
                flush=True
            )

    cfg_full = {
        "t_knots": [r_num(v, 6) for v in T_KNOTS],
        "eps_K": r_num(EPS_K, 6),
        "c_rat": [r_num(v, 6) for v in C_RAT],
        "s_gram": [r_num(v, 6) for v in S_GRAM],
        "x_tang_num_den": [[x.numerator, x.denominator] for x in X_TANG_FRACS],
        "cs_m_tang": CS_M_TANG,
        "rho_a": [float(v) for v in rho_a],
        "rho_b": [float(v) for v in rho_b],
        "lams_rice": [r_num(v, 6) for v in LAMS_RICE],
        "cells": cells_out
    }
    emit_dat(cfg_full, dat_out_path)

    out_dir = os.path.dirname(os.path.abspath(json_out_path))
    base_stem = os.path.splitext(os.path.basename(json_out_path))[0]
    for old_fn in os.listdir(out_dir):
        if old_fn.startswith(base_stem + "_") and old_fn.endswith(".json"):
            os.remove(os.path.join(out_dir, old_fn))

    raw_blob = json.dumps(cfg_full, separators=(",", ":"))
    if len(raw_blob.encode("utf-8")) <= 220_000:
        with open(json_out_path, "w") as f:
            f.write(raw_blob)
        print(
            f"DONE: wrote {len(cells_out)} cells to {json_out_path} "
            f"({os.path.getsize(json_out_path)} B) in {time.time() - t0:.1f}s",
            flush=True
        )
    else:
        shards = []
        cur_cells = []
        cur_bytes = 16
        MAX_SHARD_BYTES = 220_000
        for cell in cells_out:
            cb = len(json.dumps(cell, separators=(",", ":")).encode("utf-8")) + 1
            if cur_cells and cur_bytes + cb > MAX_SHARD_BYTES:
                sh_name = f"{base_stem}_{len(shards) + 1}.json"
                sh_path = os.path.join(out_dir, sh_name)
                with open(sh_path, "w") as sf:
                    json.dump({"cells": cur_cells}, sf, separators=(",", ":"))
                shards.append(sh_name)
                cur_cells = []
                cur_bytes = 16
            cur_cells.append(cell)
            cur_bytes += cb
        if cur_cells:
            sh_name = f"{base_stem}_{len(shards) + 1}.json"
            sh_path = os.path.join(out_dir, sh_name)
            with open(sh_path, "w") as sf:
                json.dump({"cells": cur_cells}, sf, separators=(",", ":"))
            shards.append(sh_name)
        manifest = dict(cfg_full)
        manifest.pop("cells")
        manifest["shards"] = shards
        with open(json_out_path, "w") as f:
            json.dump(manifest, f, separators=(",", ":"))
        sh_sizes = [os.path.getsize(os.path.join(out_dir, s)) for s in shards]
        print(
            f"DONE: wrote {len(cells_out)} cells across {len(shards)} shards (<220KB each; max={max(sh_sizes)} B) "
            f"+ manifest {json_out_path} ({os.path.getsize(json_out_path)} B) in {time.time() - t0:.1f}s",
            flush=True
        )


if __name__ == "__main__":
    main()
