#!/usr/bin/env python3
"""Pure-stdlib Fraction receipt & analytic-tail auditor + C++17 replay driver for Problem P1 (Issue #623):
First-chaos content of a cubic chaos element against its fourth cumulant, per (u, chi) cell.

Default mode (`python3 -IB verify.py` and `python3 -IB -O verify.py`, zero bare `assert`s) verifies:
  1) SHA-256 cryptographic binding of `result.json` to `dual_certs.json`, all 7 certificate shards,
     the canonical serialized `dual_certs.dat` stream, and `certify_content_cells.cpp`;
  2) Exact rational Kummer + Cauchy-Schwarz Rice tangents, Wick/cluster moment identities, multiplier
     signs, Coupled-Gram hypotheses (`s_j >= 2`), Kantorovich threshold monotonicity, asymptotic
     U >= U0 cubic dominance across all 1,485 slices, and contiguous slice coverage of the exported
     `g1_range_A` / `g1_range_B` enclosures;
  3) Exact rational binding of `t_lo <= piece[0]` and `[u_lo, u_hi]` to the 5 discrete grid energies of
     `fin_table_fundFull.json`, continuous `[0, 42]` chi-coverage of Pieces 16 & 17 at those 5 energies,
     and outward-rounded junta / own-row 0.70 negative-control enclosures.
Pass `--replay-cpp` to recompile `certify_content_cells.cpp` and replay the full 2D Gaussian row
enclosures, `P_max`, `g_1` range enclosures, and compact-interval `sup_{U in [0, U0]} M(U) < 0`
checks from scratch (add `--update-result` to overwrite `result.json`).
"""
from decimal import Decimal
from fractions import Fraction
import hashlib
import io
import json
import math
import os
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(HERE, "../../../.."))


def check(cond, msg):
    if not cond:
        raise ValueError(f"VERIFICATION FAILED: {msg}")


DYADIC_S = 1 << 192


def dyadic_lo(q, S=DYADIC_S):
    """Exact rational lower bound with power-of-two denominator S: dyadic_lo(q) <= q."""
    return Fraction((q.numerator * S) // q.denominator, S)


def dyadic_hi(q, S=DYADIC_S):
    """Exact rational upper bound with power-of-two denominator S: dyadic_hi(q) >= q."""
    return Fraction((q.numerator * S + q.denominator - 1) // q.denominator, S)


# ==================== 1. EXACT RATIONAL CONSTANTS & KUMMER RICE POLYGON ====================
def atan_inv_int_bounds(q, terms=28):
    """Exact alternating-series rational bounds on arctan(1/q) for integer q >= 2."""
    q2 = q * q
    s = Fraction(0)
    pw = Fraction(1, q)
    for k in range(terms):
        term = pw / (2 * k + 1)
        if k % 2 == 0:
            s += term
        else:
            s -= term
        pw /= q2
    rem = pw / (2 * terms + 1)
    if terms % 2 == 0:
        return s, s + rem
    return s - rem, s


def verify_pi_and_sqrt_pi():
    a5_lo, a5_hi = atan_inv_int_bounds(5, 28)
    a239_lo, a239_hi = atan_inv_int_bounds(239, 12)
    pi_lo = 16 * a5_lo - 4 * a239_hi
    pi_hi = 16 * a5_hi - 4 * a239_lo
    rt_pi_lo = Fraction(177245385090551602729816748, 10 ** 26)
    rt_pi_hi = Fraction(177245385090551602729816749, 10 ** 26)
    check(rt_pi_lo * rt_pi_lo <= pi_lo, "rt_pi_lo^2 > pi_lo")
    check(rt_pi_hi * rt_pi_hi >= pi_hi, "rt_pi_hi^2 < pi_hi")
    return pi_lo, pi_hi, rt_pi_lo, rt_pi_hi


def exp_pos_rational_bounds(x_frac):
    """Exact rational bounds on exp(x_frac) for 0 <= x_frac <= 100."""
    check(Fraction(0) <= x_frac <= Fraction(100), f"x_frac out of range: {x_frac}")
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
    lo, hi = dyadic_lo(s), dyadic_hi(s + rem)
    for _ in range(k):
        lo = dyadic_lo(lo * lo)
        hi = dyadic_hi(hi * hi)
    return lo, hi


def exp_neg_rational_bounds(x_frac):
    lo_p, hi_p = exp_pos_rational_bounds(x_frac)
    return dyadic_lo(Fraction(1) / hi_p), dyadic_hi(Fraction(1) / lo_p)


def kummer_rho_bounds(x_frac, rt_pi_lo, rt_pi_hi):
    """Exact Kummer series bounds on rho(x) and rho'(x) for rational 0 <= x <= 80."""
    check(Fraction(0) <= x_frac <= Fraction(80), f"x_tang out of [0, 80]: {x_frac}")
    terms = max(85, int(4 * x_frac) + 45)
    check(Fraction(2 * terms + 1, 2 * terms * terms) * x_frac <= Fraction(1, 3), "Kummer tail ratio > 1/3")
    inv_exp_lo, inv_exp_hi = exp_neg_rational_bounds(x_frac)
    s0_lo = Fraction(1)
    s0_hi = Fraction(1)
    s1_lo = Fraction(1)
    s1_hi = Fraction(1)
    t0_lo = Fraction(1)
    t0_hi = Fraction(1)
    for m in range(1, terms):
        fac = Fraction(2 * m + 1, 2 * m * m) * x_frac
        t0_lo = dyadic_lo(t0_lo * fac)
        t0_hi = dyadic_hi(t0_hi * fac)
        s0_lo += t0_lo
        s0_hi += t0_hi
        s1_lo += dyadic_lo(t0_lo / (m + 1))
        s1_hi += dyadic_hi(t0_hi / (m + 1))
    next_t_hi = dyadic_hi(t0_hi * Fraction(2 * terms + 1, 2 * terms * terms) * x_frac)
    rem0 = dyadic_hi(Fraction(3, 2) * next_t_hi)
    rem1 = dyadic_hi(rem0 / (terms + 1))
    rho_lo = dyadic_lo((rt_pi_lo / 2) * inv_exp_lo * s0_lo)
    rho_hi = dyadic_hi((rt_pi_hi / 2) * inv_exp_hi * (s0_hi + rem0))
    rhop_lo = dyadic_lo((rt_pi_lo / 4) * inv_exp_lo * s1_lo)
    rhop_hi = dyadic_hi((rt_pi_hi / 4) * inv_exp_hi * (s1_hi + rem1))
    return rho_lo, rho_hi, rhop_lo, rhop_hi


def frac_sqrt_bounds(q):
    """For rational q >= 0, return exact rational bounds (lo, hi) enclosing sqrt(q) to 2^{-60}."""
    check(q >= 0, f"negative rational in sqrt: {q}")
    if q == 0:
        return Fraction(0), Fraction(0)
    num, den = q.numerator, q.denominator
    scale = 1 << 60
    val_lo = (num * scale * scale) // den
    val_hi = (num * scale * scale + den - 1) // den
    r_lo = math.isqrt(val_lo)
    r_hi = math.isqrt(val_hi)
    if r_hi * r_hi < val_hi:
        r_hi += 1
    lo = Fraction(r_lo, scale)
    hi = Fraction(r_hi, scale)
    check(lo * lo <= q, "frac_sqrt_bounds lo^2 > q")
    check(hi * hi >= q, "frac_sqrt_bounds hi^2 < q")
    return lo, hi


# ==================== 2. EXACT ALGEBRAIC WITNESSES & MOMENT IDENTITIES ====================
def verify_exact_algebraic_witnesses():
    """Verify exact Gaussian Wick moment identities in Fraction arithmetic:
    1) Low-energy 1D Wick junta q_u(X) = sqrt(u) X(|X|^2 - 2)/sqrt(2) -> lim_{u -> 0+} r_{h_X}(q_u) = 256/63;
    2) Own-row 0.70 Hurwitz cubic witness on C^{13} (c = 4): exact polynomial norm & fourth cumulant;
    3) K-cluster fourth-moment monotonicity E[|R_K|^4] = 2 + 6/K and Cauchy-Schwarz asymmetry lower bound (P1 §5 Q1).
    """
    fact = [math.factorial(k) for k in range(10)]
    # 1) 1D Wick cubic H(X) = X(|X|^2 - 2)/sqrt(2), p(T) = |H|^2 = (1/2) T(T - 2)^2:
    e_p = Fraction(1, 2) * (fact[3] - 4 * fact[2] + 4 * fact[1])
    check(e_p == Fraction(1), f"E[|H|^2] != 1: {e_p}")
    e_p2 = Fraction(1, 4) * (fact[6] - 8 * fact[5] + 24 * fact[4] - 32 * fact[3] + 16 * fact[2])
    check(e_p2 == Fraction(44), f"E[|H|^4] != 44: {e_p2}")
    delta_coeff = e_p2 - 2 * (e_p ** 2)
    check(delta_coeff == Fraction(42), f"delta / u^2 != 42: {delta_coeff}")
    check(fact[2] - 2 * fact[1] == 0, "Wick cubic not orthogonal to first chaos")
    # For h_X(v) = h0 + h1 v + O(v^2):
    # c_X(sqrt(u) H) = sqrt(u) * (1/sqrt(2)) E[T(T - 2) * (h0 + h1 u p(T))] + O(u^{5/2})
    #                = u^{3/2} h1 * (1/(2 sqrt(2))) E[T^2 (T - 2)^3] + O(u^{5/2})
    e_t2_tm2_3 = fact[5] - 6 * fact[4] + 12 * fact[3] - 8 * fact[2]
    check(e_t2_tm2_3 == 32, f"E[T^2(T-2)^3] != 32: {e_t2_tm2_3}")
    c_sq_over_delta = Fraction(1, 8) * (Fraction(e_t2_tm2_3) ** 2) / delta_coeff
    check(c_sq_over_delta == Fraction(64, 21), f"|c_X|^2 / (delta h1^2 u) != 64/21: {c_sq_over_delta}")
    # Since k_X(v) = h0 + h1(v + u) + O(u^2), k_X'(v) = h1 + O(u), so:
    # omega_hat(sqrt(u) H) = ((3/2) E[V] - (3/(4 u)) E[V]^2) h1^2 + O(u^2) = (3/4) u h1^2 + O(u^2)
    omega_over_u = Fraction(3, 2) * e_p - Fraction(3, 4) * (e_p ** 2)
    check(omega_over_u == Fraction(3, 4), f"omega_hat / (u h1^2) != 3/4: {omega_over_u}")
    junta_lim = c_sq_over_delta / omega_over_u
    check(junta_lim == Fraction(256, 63), f"junta limit != 256/63: {junta_lim}")

    # 2) Own-row 0.70 Hurwitz cubic witness on C^{1 + 3 c} (c = 4 -> C^{13}):
    # q(X, Z, W) = a X(|X|^2 - 2)/sqrt(2) + sum_{k=1}^c [ b_r + i b_i ] Z_k W_{k,1} bar(Y_{k,1}) + s_R Z_k W_{k,2} bar(Y_{k,2})
    # Exact fourth-cumulant formula for independent unit-norm orthogonal blocks (1D Wick H_0 of excess 42, plus c Hurwitz blocks):
    # Wait: even simpler, on 1 + c independent orthogonal blocks where block 0 is H_0(X) = X(|X|^2 - 2)/sqrt(2) (||H_0||_2^2 = 1, E|H_0|^4 = 44)
    # and blocks k = 1..c are independent bilinear-conjugate clusters G_k = Z_k W_k bar(Y_k) (||G_k||_2^2 = 1, E|G_k|^4 = 8):
    # For q = alpha_0 H_0 + sum_{k=1}^c alpha_k G_k with |alpha_0|^2 + sum |alpha_k|^2 = u:
    # By independence and zero mean / pairwise orthogonality in H_{2,1},
    # E[|q|^4] = |alpha_0|^4 E|H_0|^4 + sum_{k=1}^c |alpha_k|^4 E|G_k|^4 + 4 sum_{0 <= i < j <= c} |alpha_i|^2 |alpha_j|^2
    #          = 2 u^2 + (44 - 2) |alpha_0|^4 + (8 - 2) sum_{k=1}^c |alpha_k|^4 = 2 u^2 + 42 |alpha_0|^4 + 6 sum_{k=1}^c |alpha_k|^4!
    # Check at c = 4, |alpha_0|^2 = (1/3) u, |alpha_k|^2 = (1/6) u (k = 1..4):
    w0 = Fraction(1, 3)
    wk = Fraction(1, 6)
    check(w0 + 4 * wk == 1, "Hurwitz-Wick weights do not sum to 1")
    chi_witness = 42 * (w0 ** 2) + 4 * 6 * (wk ** 2)
    check(chi_witness == Fraction(16, 3), f"chi_witness != 16/3 <= 12: {chi_witness}")
    check(chi_witness <= 12, "chi_witness > 12")

    # 3) K-cluster fourth-moment identity (P1 §5 Question 1):
    # For R_K = sum_{k=1}^K sqrt(w_k) X_k Y_k bar(W_k) with w_k >= 0, sum w_k = 1:
    # Since E[|X_k Y_k bar(W_k)|^2] = 1 and E[|X_k Y_k bar(W_k)|^4] = (2!)(2!)(2!) = 8,
    # E[|R_K|^4] = 8 sum w_k^2 + 4 sum_{i < j} w_i w_j = 2 (sum w_k)^2 + 6 sum w_k^2 = 2 + 6 sum w_k^2!
    for K in (1, 2, 3, 4, 5):
        m4_sym = 2 + Fraction(6, K)
        if K == 3:
            check(m4_sym == Fraction(4), "3-cluster symmetric fourth moment != 4")
        if K == 4:
            check(m4_sym == Fraction(7, 2), "4-cluster symmetric fourth moment != 7/2")
    # Asymmetric (3,3,2)/8 vs symmetric (1,1,1)/3:
    w_asym = [Fraction(3, 8), Fraction(3, 8), Fraction(2, 8)]
    check(sum(w_asym) == 1, "asymmetric weights != 1")
    m4_asym = 2 + 6 * sum(w * w for w in w_asym)
    check(m4_asym == Fraction(65, 16) and m4_asym > Fraction(4), f"asymmetric (3,3,2) m4={m4_asym} not > 4")


# ==================== 3. EXACT RATIONAL AUDIT OF DUAL CERTIFICATES & RECEIPT ====================
def emit_dat_bytes(cfg):
    buf = io.StringIO()

    def wvec(v):
        buf.write(f"{len(v)} " + " ".join(f"{x:.17g}" for x in v) + "\n")

    wvec(cfg["t_knots"])
    buf.write(f"{cfg['eps_K']:.17g}\n")
    wvec(cfg["c_rat"])
    wvec(cfg["s_gram"])
    wvec(cfg["rho_a"])
    wvec(cfg["rho_b"])
    wvec(cfg["lams_rice"])
    cells = cfg["cells"]
    buf.write(f"{len(cells)}\n")
    for c in cells:
        buf.write(
            f"{c['piece_idx']} {c['u_idx']} {c['row_tag']} {c['kind']} "
            f"{c['u_lo']:.17g} {c['u_hi']:.17g} {c['t_lo']:.17g} {c['chi_lo']:.17g} {c['chi_hi']:.17g} "
            f"{c['theta_allow']:.17g} {c['F_claimed']:.17g}\n"
        )
        for key in ("slicesA", "slicesB"):
            sls = c[key]
            buf.write(f"{len(sls)}\n")
            for sc in sls:
                buf.write(
                    f"{sc['a_r']:.17g} {sc['b_r']:.17g} "
                    f"{sc['beta']:.17g} {sc['gamma']:.17g} {sc['lamK']:.17g}\n"
                )
                wvec(sc["xs"])
                yeq = sc["yeq"]
                buf.write(f"{yeq[0]:.17g} {yeq[1]:.17g} {yeq[2]:.17g} {yeq[3]:.17g}\n")
                wvec(sc["w_stein"])
                buf.write(f"{sc['mu_u2_lo']:.17g} {sc['mu_u2_hi']:.17g} {sc['mu_u3']:.17g}\n")
                buf.write(
                    f"{sc['nu_plus']:.17g} {sc['nu_minus']:.17g} "
                    f"{sc['mu_sx_sep']:.17g} {sc['mu_sr_sep']:.17g} {sc['mu_rad']:.17g}\n"
                )
                wvec(sc["eta_gram"])
                wvec(sc["mu_rice"])
                buf.write(f"{sc['eta_sl_lo']:.17g} {sc['eta_sl_hi']:.17g}\n")
    return buf.getvalue().encode("utf-8")


def emit_dat_from_json(cfg, dat_path):
    data = emit_dat_bytes(cfg)
    with open(dat_path, "wb") as f:
        f.write(data)
    return data


def M_lambda_rational_hi(c1_q, c2_q, u_q, chi_hi_q):
    """Exact rational upper bound on M_{Lambda(chi_hi)}(c1, c2) matching certify_content_cells.cpp."""
    a1 = max(Fraction(0), c1_q)
    a2 = max(Fraction(0), c2_q)
    if a1 == 0 and a2 == 0:
        return Fraction(0)
    box_top = 2 * u_q * a1 + u_q * a2
    if chi_hi_q >= 10:
        return box_top
    R2 = Fraction(1, 2) * chi_hi_q * u_q * u_q
    _, R_hi = frac_sqrt_bounds(R2)
    _, nrm_hi = frac_sqrt_bounds(a1 * a1 + a2 * a2)
    best = min(box_top, R_hi * nrm_hi)
    if chi_hi_q > 2:
        ru_lo, _ = frac_sqrt_bounds(Fraction(1, 2) * chi_hi_q - 1)
        if ru_lo > 0 and a2 * ru_lo > a1:
            q2 = a1 / ru_lo
            p2 = a2 - q2
            _, n1_hi = frac_sqrt_bounds(a1 * a1 + q2 * q2)
            best = min(best, u_q * p2 + R_hi * n1_hi)
        if chi_hi_q > 8:
            r2u_lo, _ = frac_sqrt_bounds(Fraction(1, 2) * chi_hi_q - 4)
            if r2u_lo > 0 and a1 * r2u_lo > 2 * a2:
                q1 = (2 * a2) / r2u_lo
                p1 = a1 - q1
                _, n2_hi = frac_sqrt_bounds(q1 * q1 + a2 * a2)
                best = min(best, 2 * u_q * p1 + R_hi * n2_hi)
    return best


def verify_slice_rational_tail_and_signs(sc, cell_q, cfg_q, exp_t_bounds, is_infeas):
    """Verify multiplier signs, Coupled-Gram hypotheses, Kantorovich monotonicity, and
    asymptotic U >= U0 cubic-dominance inequality in exact Fraction arithmetic!"""
    mu_u2_lo = Fraction(sc["mu_u2_lo"])
    mu_u2_hi = Fraction(sc["mu_u2_hi"])
    mu_u3 = Fraction(sc["mu_u3"])
    nu_plus = Fraction(sc["nu_plus"])
    nu_minus = Fraction(sc["nu_minus"])
    mu_sx_sep = Fraction(sc["mu_sx_sep"])
    mu_sr_sep = Fraction(sc["mu_sr_sep"])
    mu_rad = Fraction(sc["mu_rad"])
    eta_sl_lo = Fraction(sc["eta_sl_lo"])
    eta_sl_hi = Fraction(sc["eta_sl_hi"])
    eta_gram = [Fraction(v) for v in sc["eta_gram"]]
    mu_rice = [Fraction(v) for v in sc["mu_rice"]]
    w_stein = [Fraction(v) for v in sc["w_stein"]]
    yeq = [Fraction(v) for v in sc["yeq"]]

    check(mu_u2_lo >= 0 and mu_u2_hi >= 0, "negative mu_u2")
    check(mu_u3 > 0, "nonpositive mu_u3")
    check(nu_plus >= 0 and nu_minus >= 0, "negative nu_plus/minus")
    check(mu_sx_sep >= 0 and mu_sr_sep > 0, "invalid Stein quadratic multipliers")
    check(mu_rad >= 0 and eta_sl_lo >= 0 and eta_sl_hi >= 0, "negative radial/slice multipliers")
    check(len(eta_gram) == len(cfg_q["s_gram"]), "eta_gram length mismatch")
    check(all(e >= 0 for e in eta_gram), "negative eta_gram")
    check(len(mu_rice) == len(cfg_q["lams_rice"]), "mu_rice length mismatch")
    check(all(mr >= 0 for mr in mu_rice), "negative mu_rice")
    check(len(w_stein) == len(cfg_q["c_rat"]), "w_stein length mismatch")

    lam_S = mu_sx_sep + sum(eta_gram)
    check(lam_S > 0, "nonpositive lam_S")
    mu_S = mu_sr_sep

    u_lo_q = cell_q["u_lo_q"]
    u_hi_q = cell_q["u_hi_q"]
    chi_lo_q = cell_q["chi_lo_q"]
    chi_hi_q = cell_q["chi_hi_q"]
    t_lo_q = cell_q["t_lo_q"]
    F_q = cell_q["F_q"]
    a_r = Fraction(sc["a_r"])
    b_r = Fraction(sc["b_r"])
    check(a_r <= b_r, f"slice a_r > b_r: {a_r} > {b_r}")

    U0 = max(Fraction(8192), Fraction(64) / u_lo_q)
    inv_U0 = dyadic_hi(Fraction(1) / U0)
    inv_U0_2 = dyadic_hi(inv_U0 * inv_U0)
    inv_U0_3 = dyadic_hi(inv_U0_2 * inv_U0)

    if is_infeas:
        const_off_hi = Fraction(1)
        J_u3_hi = Fraction(0)
        g1_tail_hi = Fraction(0)
    else:
        beta = Fraction(sc["beta"])
        gamma = Fraction(sc["gamma"])
        lamK = Fraction(sc["lamK"])
        xs = [Fraction(v) for v in sc["xs"]]
        check(beta >= 0 and gamma > 0, "invalid JM1 (beta, gamma)")
        check(len(xs) + 1 == len(cfg_q["t_knots"]), "xs length mismatch")
        for m in range(1, len(xs)):
            check(xs[m] >= xs[m - 1], "xs not nondecreasing")
        c1_hi = dyadic_hi((beta * beta) / 3 + lamK)
        c2_hi = dyadic_hi(((beta * beta) / (4 * gamma) + lamK) if beta > 0 else lamK)
        M_lam_hi = dyadic_hi(M_lambda_rational_hi(c1_hi, c2_hi, u_hi_q, chi_hi_q))
        c_kant_hi = Fraction(0)
        for m in range(len(xs) - 1):
            wt_lo = exp_t_bounds[m][0] - exp_t_bounds[m + 1][1]
            wt_hi = exp_t_bounds[m][1] - exp_t_bounds[m + 1][0]
            c_kant_hi += dyadic_hi(xs[m] * (wt_hi if xs[m] >= 0 else wt_lo))
        xm = xs[-1]
        c_kant_hi += dyadic_hi(xm * (exp_t_bounds[-2][1] if xm >= 0 else exp_t_bounds[-2][0]))
        c_kant_hi += dyadic_hi(exp_t_bounds[-1][1] / cfg_q["eps_K"])
        c1_u_hi = dyadic_hi(c1_hi * (u_hi_q if c1_hi >= 0 else u_lo_q))
        ab_prod = a_r * b_r
        om_off_hi = dyadic_hi(-F_q * Fraction(3, 4) * ab_prod / (u_hi_q if ab_prod >= 0 else u_lo_q))
        const_off_hi = c1_u_hi + M_lam_hi + c_kant_hi + om_off_hi

        # Tail bound on U >= U0 (v = u*U >= u_lo*U0 >= 64 => |h_X'(w)| <= P_max / w^{3/2} => |k_X'(v)| <= P_max / v^{3/2}):
        P_max = cell_q["P_max_q"]
        psi_tail_hi = (P_max * P_max) / 4096
        g1_tail_hi = P_max / 8
        C_H0 = dyadic_hi((Fraction(3, 2) + gamma) * psi_tail_hi + beta * g1_tail_hi)
        C_H1_eff = dyadic_hi(max(Fraction(0), -lamK) * u_hi_q)
        K_m = Fraction(0)
        neg_K_hi = Fraction(0)
        for m in range(len(xs)):
            K_m += (cfg_q["t_knots"][m + 1] - cfg_q["t_knots"][m]) * xs[m]
            if -K_m > neg_K_hi:
                neg_K_hi = -K_m
        tM = cfg_q["t_knots"][-1]
        pl_u3 = dyadic_hi(tM * (C_H0 * inv_U0_3 + C_H1_eff * inv_U0_2) + neg_K_hi * inv_U0_3)
        d0 = max(Fraction(0), C_H0 - xs[-1])
        s_u = dyadic_hi(d0 * inv_U0 + C_H1_eff)
        q_u3 = dyadic_hi(Fraction(1, 2) * cfg_q["eps_K"] * (s_u * s_u) * inv_U0)
        om_neg_u3 = dyadic_hi(F_q * (Fraction(3, 4) * abs(a_r + b_r) / u_lo_q) * g1_tail_hi * inv_U0_3)
        J_u3_hi = pl_u3 + q_u3 + om_neg_u3

    af_lo = sum(dyadic_lo(eta_gram[j] * (cfg_q["s_gram"][j] - 1) / 18) for j in range(len(eta_gram)))
    af_hi = sum(dyadic_hi(eta_gram[j] * (cfg_q["s_gram"][j] - 1) / 18) for j in range(len(eta_gram)))
    ag_lo = sum(dyadic_lo(eta_gram[j] * (cfg_q["s_gram"][j] + Fraction(1, 2) - Fraction(3) / cfg_q["s_gram"][j]) / 18) for j in range(len(eta_gram)))
    ag_hi = sum(dyadic_hi(eta_gram[j] * (cfg_q["s_gram"][j] + Fraction(1, 2) - Fraction(3) / cfg_q["s_gram"][j]) / 18) for j in range(len(eta_gram)))
    sum_w = sum(abs(w) for w in w_stein)
    sum_wc = sum(dyadic_hi(abs(w_stein[m]) * cfg_q["c_rat"][m]) for m in range(len(w_stein)))

    cx_lead_lo = -2 * yeq[3] + dyadic_lo(Fraction(2, 3) * lam_S) + 2 * af_lo
    cx_lead_hi = -2 * yeq[3] + dyadic_hi(Fraction(2, 3) * lam_S) + 2 * af_hi
    cr_lead_lo = -yeq[3] - nu_plus + nu_minus + dyadic_lo(Fraction(2, 3) * mu_S) - 2 * ag_hi
    cr_lead_hi = -yeq[3] - nu_plus + nu_minus + dyadic_hi(Fraction(2, 3) * mu_S) - 2 * ag_lo
    cx_u_max = dyadic_hi(max(-cx_lead_lo, cx_lead_hi) + (abs(yeq[2]) + sum_w) * inv_U0)
    cr_u_max = dyadic_hi(max(-cr_lead_lo, cr_lead_hi) + sum_w * inv_U0)
    psiK_u3 = dyadic_hi((dyadic_hi(cx_u_max * cx_u_max / (4 * lam_S)) + dyadic_hi(cr_u_max * cr_u_max / (4 * mu_S))) * inv_U0)

    aL = cfg_q["rho_a"][-1]
    bL = cfg_q["rho_b"][-1]
    rice_u3 = sum(
        dyadic_hi(mu_rice[k] * (aL * inv_U0_3 + dyadic_hi(bL * (cfg_q["lams_rice"][k] ** 2) * u_hi_q) * inv_U0_2))
        for k in range(len(mu_rice)) if mu_rice[k] > 0
    )

    _, rt_chi_hi = frac_sqrt_bounds(chi_hi_q)
    M3_hi = dyadic_hi(6 + 9 * chi_hi_q + Fraction(4045313, 100000) * chi_hi_q * rt_chi_hi)
    rhs_lo = (
        yeq[0] + yeq[1] + 2 * yeq[3]
        + dyadic_lo(mu_u2_lo * (2 + chi_lo_q)) - dyadic_hi(mu_u2_hi * (2 + chi_hi_q))
        - dyadic_hi(mu_u3 * M3_hi) + dyadic_lo(nu_plus * Fraction(2, 3))
        - dyadic_hi(mu_rad * Fraction(2287, 2500))
        + eta_sl_lo * a_r - eta_sl_hi * b_r
        + sum(dyadic_lo(mu_rice[k] * (t_lo_q + cfg_q["lams_rice"][k] * u_lo_q / Fraction(39, 50)))
              for k in range(len(mu_rice)) if mu_rice[k] > 0)
    )
    c_U2_hi = yeq[3] + mu_u2_lo - mu_u2_hi + dyadic_hi(nu_plus / 3)
    c_g1 = eta_sl_lo - eta_sl_hi
    g1_lin_u3 = dyadic_hi(abs(c_g1) * g1_tail_hi * inv_U0_3)
    const_term = dyadic_hi(max(Fraction(0), const_off_hi - rhs_lo + yeq[0] + sum_wc) * inv_U0_3)
    lin_term = dyadic_hi(max(Fraction(0), yeq[1]) * inv_U0_2 + max(Fraction(0), c_U2_hi) * inv_U0)
    tail_coeff_hi = const_term + lin_term + g1_lin_u3 + J_u3_hi + psiK_u3 + rice_u3 - mu_u3
    check(tail_coeff_hi < 0, f"exact rational U^3 tail failed: tail_coeff_hi = {float(tail_coeff_hi):.3e} >= 0")


def load_full_cfg(certs_path):
    """Load dual_certs.json, transparently reassembling any <300KB cell shards."""
    check(os.path.getsize(certs_path) < 300_000, f"{certs_path} exceeds 300 KB limit")
    cfg = json.load(open(certs_path))
    if "shards" in cfg:
        base_dir = os.path.dirname(os.path.abspath(certs_path))
        cells = []
        for sh in cfg["shards"]:
            sh_path = os.path.join(base_dir, sh)
            check(os.path.getsize(sh_path) < 300_000, f"shard {sh} exceeds 300 KB limit")
            cells.extend(json.load(open(sh_path))["cells"])
        cfg = dict(cfg)
        cfg.pop("shards")
        cfg["cells"] = cells
    return cfg


def verify_all(certs_path=None, result_path=None, replay_cpp=False, update_result=False, check_hashes=True):
    default_paths = (certs_path is None and result_path is None)
    if certs_path is None:
        certs_path = os.path.join(HERE, "dual_certs.json")
    if result_path is None:
        result_path = os.path.join(HERE, "result.json")

    if default_paths:
        for fn in os.listdir(HERE):
            fp = os.path.join(HERE, fn)
            if os.path.isfile(fp) and not fn.startswith("."):
                check(os.path.getsize(fp) < 300_000, f"file {fn} exceeds 300 KB limit ({os.path.getsize(fp)} B)")

    # 1. Constants & Kummer + Cauchy-Schwarz Rice tangents
    _, _, rt_pi_lo, rt_pi_hi = verify_pi_and_sqrt_pi()
    raw_manifest = json.load(open(certs_path))
    manifest_shards = list(raw_manifest.get("shards", []))
    certs_dir = os.path.dirname(os.path.abspath(certs_path))
    cfg = load_full_cfg(certs_path)

    x_tangs = [Fraction(num, den) for num, den in cfg["x_tang_num_den"]]
    cs_ms = [Fraction(m) for m in cfg.get("cs_m_tang", [])]
    rho_a_q = [Fraction(v) for v in cfg["rho_a"]]
    rho_b_q = [Fraction(v) for v in cfg["rho_b"]]
    check(len(x_tangs) + len(cs_ms) == len(rho_a_q) == len(rho_b_q) >= 15, "invalid Rice polygon lengths")
    for k, xk in enumerate(x_tangs):
        _, rho_hi, rhop_lo, rhop_hi = kummer_rho_bounds(xk, rt_pi_lo, rt_pi_hi)
        ak_min = rho_hi - rhop_lo * xk
        check(rho_a_q[k] >= ak_min, f"Rice tangent intercept k={k} below Kummer bound")
        check(rho_b_q[k] >= rhop_hi and rhop_hi > 0, f"Rice tangent slope k={k} below Kummer bound")
    for j, m_cs in enumerate(cs_ms):
        k = len(x_tangs) + j
        check(m_cs > 0, f"nonpositive Cauchy-Schwarz parameter m={m_cs}")
        ak_cs = (m_cs * m_cs + 1) / (2 * m_cs)
        bk_cs = Fraction(1) / (2 * m_cs)
        check(rho_a_q[k] >= ak_cs, f"Cauchy-Schwarz Rice intercept k={k} below (m^2+1)/(2m)")
        check(rho_b_q[k] >= bk_cs, f"Cauchy-Schwarz Rice slope k={k} below 1/(2m)")

    # 2. Algebraic witnesses & moment identities
    verify_exact_algebraic_witnesses()

    # 3. Optional C++17 recompilation & replay
    cpp_src = os.path.join(HERE, "certify_content_cells.cpp")
    if replay_cpp:
        with tempfile.TemporaryDirectory() as tmpd:
            bin_path = os.path.join(tmpd, "certify_content_cells")
            dat_path = os.path.join(tmpd, "dual_certs.dat")
            out_res = result_path if update_result else os.path.join(tmpd, "result_replay.json")
            emit_dat_from_json(cfg, dat_path)
            subprocess.run(
                ["c++", "-O3", "-ffp-contract=off", "-std=c++17", "-Wall", "-Wextra", "-Werror",
                 "-Wno-unknown-pragmas", "-pthread", cpp_src, "-o", bin_path],
                check=True
            )
            cmd = [
                bin_path, "--verify-all", dat_path, out_res,
                "--cpp-src", cpp_src, "--manifest", os.path.abspath(certs_path),
                "--threads", str(min(8, os.cpu_count() or 2)),
            ]
            for sh in manifest_shards:
                cmd.extend(["--shard", sh, os.path.join(certs_dir, sh)])
            subprocess.run(cmd, check=True)
            if not update_result:
                r_disk = json.load(open(result_path))
                r_rep = json.load(open(out_res))
                check(r_disk == r_rep, "replayed C++ result.json differs from committed result.json")

    res = json.load(open(result_path))
    check(res.get("status") == "CERTIFIED", f"result.json status != CERTIFIED: {res.get('status')}")
    if check_hashes:
        exp_dat_sha = hashlib.sha256(emit_dat_bytes(cfg)).hexdigest()
        check(res.get("dat_sha256") == exp_dat_sha,
              f"result.json dat_sha256 mismatch against dual certificates ({res.get('dat_sha256')} != {exp_dat_sha})")
        exp_cpp_sha = hashlib.sha256(open(cpp_src, "rb").read()).hexdigest()
        check(res.get("cpp_sha256") == exp_cpp_sha,
              f"result.json cpp_sha256 mismatch against certify_content_cells.cpp ({res.get('cpp_sha256')} != {exp_cpp_sha})")
        exp_man_sha = hashlib.sha256(open(certs_path, "rb").read()).hexdigest()
        check(res.get("manifest_sha256") == exp_man_sha,
              f"result.json manifest_sha256 mismatch against {os.path.basename(certs_path)}")
        if manifest_shards:
            rec_shards = res.get("shard_sha256s")
            check(isinstance(rec_shards, dict) and list(rec_shards.keys()) == manifest_shards,
                  "result.json shard_sha256s keys do not match manifest shards")
            for sh in manifest_shards:
                sh_sha = hashlib.sha256(open(os.path.join(certs_dir, sh), "rb").read()).hexdigest()
                check(rec_shards[sh] == sh_sha,
                      f"result.json shard_sha256s[{sh!r}] mismatch against shard file on disk")
    check(res.get("rows_enclosed") == 15, f"expected 15 enclosed rows, got {res.get('rows_enclosed')}")
    check(len(res["cells"]) == len(cfg["cells"]), "cell count mismatch between dual_certs.json and result.json")
    for rs_entry in res["row_summaries"]:
        for k_inf in ("PA_inf", "PB_inf"):
            lo_p, hi_p = Fraction(rs_entry[k_inf][0]), Fraction(rs_entry[k_inf][1])
            check(abs(lo_p) <= 2 and abs(hi_p) <= 2, f"{rs_entry['tag']} {k_inf} exceeds P_max=2")
        for k_hp0 in ("hpA0", "hpB0"):
            check(k_hp0 in rs_entry, f"{rs_entry['tag']} missing {k_hp0} derivative enclosure")
            hp_lo, hp_hi = Fraction(rs_entry[k_hp0][0]), Fraction(rs_entry[k_hp0][1])
            check(hp_lo <= hp_hi and (hp_lo > 0 or hp_hi < 0),
                  f"{rs_entry['tag']} {k_hp0}=[{hp_lo}, {hp_hi}] does not strictly exclude 0")

    # 4. Global config & exact rational audit of all slices
    t_knots_q = [Fraction(v) for v in cfg["t_knots"]]
    check(t_knots_q[0] == 0 and all(t_knots_q[i + 1] > t_knots_q[i] for i in range(len(t_knots_q) - 1)),
          "t_knots must start at 0 and strictly increase")
    eps_K_q = Fraction(cfg["eps_K"])
    check(eps_K_q > 0, "eps_K <= 0")
    c_rat_q = [Fraction(v) for v in cfg["c_rat"]]
    check(all(c > 0 for c in c_rat_q), "c_rat <= 0")
    s_gram_q = [Fraction(v) for v in cfg["s_gram"]]
    check(all(s >= 2 for s in s_gram_q), "Coupled-Gram s_gram < 2 violates Grothe/Lower/Gram.lean hypothesis")
    lams_rice_q = [Fraction(v) for v in cfg["lams_rice"]]
    check(all(l > 0 for l in lams_rice_q), "lams_rice <= 0")

    exp_t_bounds = [exp_neg_rational_bounds(tk) for tk in t_knots_q]
    cfg_q = {
        "t_knots": t_knots_q,
        "eps_K": eps_K_q,
        "c_rat": c_rat_q,
        "s_gram": s_gram_q,
        "rho_a": rho_a_q,
        "rho_b": rho_b_q,
        "lams_rice": lams_rice_q,
    }

    for idx, (c_cfg, c_res) in enumerate(zip(cfg["cells"], res["cells"])):
        check(c_cfg["piece_idx"] == c_res["piece"], f"cell {idx} piece mismatch")
        check(c_cfg["u_idx"] == c_res["u_idx"], f"cell {idx} u_idx mismatch")
        check(c_cfg["row_tag"] == c_res["row"], f"cell {idx} row mismatch")
        check(c_cfg["kind"] == c_res["kind"], f"cell {idx} kind mismatch")
        check(Fraction(c_cfg["u_lo"]) == Fraction(c_res["u_lo"]), f"cell {idx} u_lo mismatch")
        check(Fraction(c_cfg["u_hi"]) == Fraction(c_res["u_hi"]), f"cell {idx} u_hi mismatch")
        check(Fraction(c_cfg["t_lo"]) == Fraction(c_res["t_lo"]), f"cell {idx} t_lo mismatch")
        check(Fraction(c_cfg["chi_lo"]) == Fraction(c_res["chi_lo"]), f"cell {idx} chi_lo mismatch")
        check(Fraction(c_cfg["chi_hi"]) == Fraction(c_res["chi_hi"]), f"cell {idx} chi_hi mismatch")
        check(Fraction(c_cfg["F_claimed"]) == Fraction(c_res["F_certified"]), f"cell {idx} F mismatch")
        check(c_res["worst_M_A"] < -1e-9 and c_res["worst_M_B"] < -1e-9,
              f"cell {idx} C++ continuous supremum not strictly negative: {c_res['worst_M_A']}, {c_res['worst_M_B']}")

        cell_q = {
            "u_lo_q": Fraction(c_cfg["u_lo"]),
            "u_hi_q": Fraction(c_cfg["u_hi"]),
            "t_lo_q": Fraction(c_cfg["t_lo"]),
            "chi_lo_q": Fraction(c_cfg["chi_lo"]),
            "chi_hi_q": Fraction(c_cfg["chi_hi"]),
            "F_q": Fraction(c_cfg["F_claimed"]),
            "P_max_q": Fraction(2),  # |P_X(s)| <= 2 for all s >= 8 on all 15 rows (checked above)
        }
        check(
            0 < cell_q["u_lo_q"] <= cell_q["u_hi_q"]
            and cell_q["chi_lo_q"] >= 0
            and cell_q["chi_hi_q"] >= cell_q["chi_lo_q"],
            f"cell {idx} invalid (u, chi) bounds"
        )

        if c_cfg["kind"] == "INFEAS_R1":
            check(len(c_cfg["slicesA"]) == 1, f"INFEAS_R1 cell {idx} must have 1 Farkas slice")
            verify_slice_rational_tail_and_signs(c_cfg["slicesA"][0], cell_q, cfg_q, exp_t_bounds, True)
        elif c_cfg["kind"] == "JM1_BOUND":
            check(cell_q["F_q"] > 0, f"JM1_BOUND cell {idx} nonpositive F_claimed")
            for key, g1_key in (("slicesA", "g1_range_A"), ("slicesB", "g1_range_B")):
                sls = c_cfg[key]
                check(len(sls) >= 1, f"empty {key} in cell {idx}")
                g1_iv = c_res.get(g1_key)
                check(
                    isinstance(g1_iv, list) and len(g1_iv) == 2
                    and all(isinstance(v, (int, float)) and not isinstance(v, bool) and math.isfinite(v) for v in g1_iv),
                    f"missing/invalid {g1_key} in result.json cell {idx}",
                )
                g1_lo_q, g1_hi_q = Fraction(g1_iv[0]), Fraction(g1_iv[1])
                check(g1_lo_q <= 0 <= g1_hi_q, f"{g1_key} in cell {idx} does not enclose g1(0)=0: {g1_iv}")
                check(Fraction(sls[0]["a_r"]) <= g1_lo_q,
                      f"first slice a_r={sls[0]['a_r']} > {g1_key}[0]={g1_iv[0]} in {key} of cell {idx}")
                check(Fraction(sls[-1]["b_r"]) >= g1_hi_q,
                      f"last slice b_r={sls[-1]['b_r']} < {g1_key}[1]={g1_iv[1]} in {key} of cell {idx}")
                for s_i in range(len(sls) - 1):
                    check(Fraction(sls[s_i]["b_r"]) >= Fraction(sls[s_i + 1]["a_r"]),
                          f"gap between slices {s_i} and {s_i+1} in {key} of cell {idx}")
                for sc in sls:
                    verify_slice_rational_tail_and_signs(sc, cell_q, cfg_q, exp_t_bounds, False)
        else:
            raise ValueError(f"unknown cell kind: {c_cfg['kind']}")

    # 5. Exact rational binding to fin_table_fundFull.json across ALL piece cells (1..17)
    #    and 100% continuous closure of Pieces 16 and 17!
    ft_path = os.path.join(
        REPO, "research/higher-degree/code/degree5-design/design-2026-11-25/tables/funded/fin_table_fundFull.json"
    )
    ft = json.load(open(ft_path), parse_float=Decimal)
    chosen_keys = {(tuple(c["piece"]), c["row_tag"]) for c in ft["chosen"]}
    pieces = sorted(
        [c for c in ft["cases"] if (tuple(c["piece"]), c["row_tag"]) in chosen_keys],
        key=lambda c: Fraction(c["piece"][0])
    )
    check(len(pieces) == 21, f"expected 21 funded pieces in fin_table_fundFull.json, got {len(pieces)}")
    chi_list = [1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 20, 24, 30, 36, 42]

    for idx, c in enumerate(cfg["cells"]):
        pc_idx = c["piece_idx"]
        if pc_idx == 0:
            check(c["u_idx"] == -1, f"control cell {idx} must have u_idx == -1")
            continue
        check(1 <= pc_idx <= 17, f"cell {idx} out-of-range piece_idx={pc_idx}")
        p = pieces[pc_idx - 1]
        rtag = f"{float(p['tprime']):.3f}"
        check(c["row_tag"] == rtag, f"cell {idx} Piece {pc_idx} row_tag mismatch: {c['row_tag']} != {rtag}")
        t_exact = Fraction(p["piece"][0])
        t_lo_q = Fraction(c["t_lo"])
        check(
            t_lo_q <= t_exact < t_lo_q + Fraction(1, 10 ** 15),
            f"cell {idx} Piece {pc_idx} t_lo={c['t_lo']!r} not downward-rounded from exact piece[0]={p['piece'][0]}"
        )
        u_idx = c["u_idx"]
        check(0 <= u_idx < len(p["theta"]), f"cell {idx} Piece {pc_idx} invalid u_idx={u_idx}")
        te = p["theta"][u_idx]
        u_exact = Fraction(te["u"])
        u_lo_q = Fraction(c["u_lo"])
        u_hi_q = Fraction(c["u_hi"])
        check(
            u_lo_q <= u_exact <= u_hi_q and (u_hi_q - u_lo_q) <= Fraction(1, 10 ** 15),
            f"cell {idx} Piece {pc_idx} [u_lo, u_hi] does not tightly enclose exact table energy node u={te['u']}"
        )
        if c["kind"] == "JM1_BOUND" and 0 < c["theta_allow"] < 49.999:
            chi_hi_q = Fraction(c["chi_hi"])
            col_cks = [ck for ck in chi_list if Fraction(ck) >= chi_hi_q]
            check(len(col_cks) >= 1, f"cell {idx} chi_hi={c['chi_hi']} > 42")
            th_dec = te["theta_chi"].get(str(col_cks[0]), "MISSING")
            check(isinstance(th_dec, (int, Decimal)), f"cell {idx} Piece {pc_idx} active cell points to non-numeric allowance")
            th_exact = Fraction(th_dec)
            th_allow_q = Fraction(c["theta_allow"])
            check(
                th_allow_q <= th_exact < th_allow_q + Fraction(1, 10 ** 12),
                f"cell {idx} Piece {pc_idx} theta_allow={c['theta_allow']} exceeds exact allowance {th_dec}"
            )
            if Fraction(c["F_claimed"]) <= th_allow_q:
                check(Fraction(c["F_claimed"]) <= th_exact, f"cell {idx} F_claimed exceeds exact allowance")

    for pc_idx in (16, 17):
        p = pieces[pc_idx - 1]
        rtag = f"{float(p['tprime']):.3f}"
        for u_idx, te in enumerate(p["theta"]):
            u_exact = Fraction(te["u"])
            prev_c = Fraction(0)
            has_miss = False
            for ck in chi_list:
                th_v = te["theta_chi"].get(str(ck), "MISSING")
                if th_v == "MISSING":
                    has_miss = True
                elif th_v is not None and Fraction(th_v) < Fraction(49999, 1000):
                    th_exact = Fraction(th_v)
                    subs = sorted(
                        [c for c in cfg["cells"]
                         if c["piece_idx"] == pc_idx and c["u_idx"] == u_idx and c["kind"] == "JM1_BOUND"
                         and Fraction(c["chi_lo"]) >= prev_c and Fraction(c["chi_hi"]) <= Fraction(ck)],
                        key=lambda c: Fraction(c["chi_lo"])
                    )
                    check(len(subs) >= 1, f"Piece {pc_idx} u={te['u']} missing JM1 cover on [{prev_c}, {ck}]")
                    check(Fraction(subs[0]["chi_lo"]) == prev_c, f"Piece {pc_idx} gap at {prev_c}")
                    check(Fraction(subs[-1]["chi_hi"]) == Fraction(ck), f"Piece {pc_idx} gap at {ck}")
                    for si in range(len(subs) - 1):
                        check(Fraction(subs[si]["chi_hi"]) == Fraction(subs[si + 1]["chi_lo"]),
                              f"Piece {pc_idx} internal chi gap")
                    for sub_c in subs:
                        check(sub_c["row_tag"] == rtag, f"Piece {pc_idx} row_tag mismatch")
                        check(Fraction(sub_c["u_lo"]) <= u_exact <= Fraction(sub_c["u_hi"]),
                              f"Piece {pc_idx} energy node enclosure mismatch")
                        check(Fraction(sub_c["F_claimed"]) <= th_exact,
                              f"Piece {pc_idx} u={te['u']} chi=[{sub_c['chi_lo']},{sub_c['chi_hi']}]: "
                              f"F_claimed={sub_c['F_claimed']} > theta={th_v}")
                    prev_c = Fraction(ck)
            # Also verify seamless tail coverage of [prev_c, 42] via JM1_BOUND (<= 50) + optional INFEAS_R1!
            if prev_c < Fraction(42):
                tail_cells = sorted(
                    [c for c in cfg["cells"]
                     if c["piece_idx"] == pc_idx and c["u_idx"] == u_idx
                     and Fraction(c["chi_lo"]) >= prev_c and Fraction(c["chi_hi"]) <= Fraction(42)],
                    key=lambda c: Fraction(c["chi_lo"])
                )
                check(len(tail_cells) >= 1, f"Piece {pc_idx} u={te['u']} missing [prev_c, 42] tail cover")
                check(Fraction(tail_cells[0]["chi_lo"]) == prev_c, f"Piece {pc_idx} u={te['u']} tail gap at {prev_c}")
                check(Fraction(tail_cells[-1]["chi_hi"]) == Fraction(42), f"Piece {pc_idx} u={te['u']} tail stops < 42")
                for si in range(len(tail_cells) - 1):
                    check(Fraction(tail_cells[si]["chi_hi"]) == Fraction(tail_cells[si + 1]["chi_lo"]),
                          f"Piece {pc_idx} u={te['u']} internal tail gap")
                for tc in tail_cells:
                    if tc["kind"] == "JM1_BOUND":
                        check(tc["row_tag"] == rtag and Fraction(tc["F_claimed"]) <= Fraction(50),
                              f"Piece {pc_idx} u={te['u']} tail JM1_BOUND exceeds 50")
                if has_miss:
                    check(any(tc["kind"] == "INFEAS_R1" for tc in tail_cells),
                          f"Piece {pc_idx} u={te['u']} missing INFEAS_R1 tail certificate")

    # 6. Verify negative controls in result.json & dual_certs.json (all 3 reported rows, ordered finite intervals,
    #    containment in published outward 6-decimal enclosures, and Rice lower bounds >= 0.883545):
    j_list = res.get("junta_low_u_controls")
    check(isinstance(j_list, list) and len(j_list) == 3,
          "junta_low_u_controls must contain all 3 advertised rows (0.700_own, 0.800, 0.865)")
    j_ctrls = {jc.get("row"): jc for jc in j_list if isinstance(jc, dict)}
    published_junta = {
        "0.700_own": (Fraction("3.711627"), Fraction("4.438574"), Fraction("0.883545")),
        "0.800": (Fraction("3.673118"), Fraction("4.483822"), Fraction("0.883545")),
        "0.865": (Fraction("3.648618"), Fraction("4.512955"), Fraction("0.883545")),
    }
    check(set(j_ctrls.keys()) == set(published_junta.keys()),
          "junta_low_u_controls row set mismatch against (0.700_own, 0.800, 0.865)")
    for r_need, (pub_lo, pub_hi, pub_r1) in published_junta.items():
        jc = j_ctrls[r_need]
        u_iv = jc.get("u_ival")
        r_iv = jc.get("ratio_ival")
        r1_raw = jc.get("r1_min_lb")
        check(
            isinstance(u_iv, list) and len(u_iv) == 2
            and all(isinstance(v, (int, float)) and not isinstance(v, bool) and math.isfinite(v) for v in u_iv),
            f"invalid u_ival on {r_need}",
        )
        check(
            isinstance(r_iv, list) and len(r_iv) == 2
            and all(isinstance(v, (int, float)) and not isinstance(v, bool) and math.isfinite(v) for v in r_iv),
            f"invalid ratio_ival on {r_need}",
        )
        check(
            isinstance(r1_raw, (int, float)) and not isinstance(r1_raw, bool) and math.isfinite(r1_raw),
            f"invalid r1_min_lb on {r_need}",
        )
        u_lo_j, u_hi_j = Fraction(u_iv[0]), Fraction(u_iv[1])
        check(u_lo_j <= Fraction(1, 1_000_000) <= u_hi_j and u_hi_j - u_lo_j <= Fraction(1, 10**18),
              f"junta u_ival on {r_need} does not tightly enclose 1/1000000")
        r_lo_q, r_hi_q = Fraction(r_iv[0]), Fraction(r_iv[1])
        r_lo_dec, r_hi_dec = Fraction(str(r_iv[0])), Fraction(str(r_iv[1]))
        check(r_lo_q <= r_hi_q and r_lo_dec <= r_hi_dec,
              f"empty/inverted junta ratio_ival on {r_need}: {r_iv}")
        check(pub_lo <= r_lo_q <= r_hi_q <= pub_hi and pub_lo <= r_lo_dec <= r_hi_dec <= pub_hi,
              f"junta ratio_ival on {r_need} outside published outward enclosure [{pub_lo}, {pub_hi}]")
        r1_q, r1_dec = Fraction(r1_raw), Fraction(str(r1_raw))
        check(r1_q >= pub_r1 and r1_dec >= pub_r1,
              f"junta r1_min_lb on {r_need} below published 0.883545")

    own_cells = [c for c in cfg["cells"] if c["row_tag"] == "0.700_own"]
    check(len(own_cells) >= 1, "missing own-row 0.700_own negative control cell")
    check(own_cells[0]["F_claimed"] > 0.5 > own_cells[0]["theta_allow"],
          "own-row 0.700_own negative control failed to exceed 0.085")

    lowu_jm1 = [c for c in cfg["cells"] if c["piece_idx"] == 0 and c["row_tag"] == "0.800"]
    check(len(lowu_jm1) >= 1, "missing low-energy JM1 negative control cell on row 0.800")
    check(lowu_jm1[0]["F_claimed"] > 2.5 > lowu_jm1[0]["theta_allow"],
          "low-energy JM1 negative control cell on row 0.800 failed to exceed 1.139")

    n_jm1 = sum(1 for c in cfg["cells"] if c["kind"] == "JM1_BOUND")
    n_inf = sum(1 for c in cfg["cells"] if c["kind"] == "INFEAS_R1")
    n_closed_active = sum(
        1 for c in cfg["cells"]
        if c["kind"] == "JM1_BOUND" and c["piece_idx"] >= 1 and 0 < c["theta_allow"] < 49.999
        and c["F_claimed"] <= c["theta_allow"]
    )
    mode_desc = (
        "recompiled C++17 2D row integrals + [0, U0] interval suprema replayed and matched receipt; "
        if replay_cpp else
        "SHA-256 receipt binding to dual_certs shards + C++ source, g1 slice covers, and rational U >= U0 tails audited (pass --replay-cpp to replay C++ [0, U0] & 2D integrals); "
    )
    print(
        f"ALL CHECKS PASSED: {mode_desc}"
        f"{len(cfg['cells'])} cells ({n_jm1} JM1 bounds, {n_inf} (R1) infeasibility certificates; "
        f"Pieces 16 & 17 100% continuously closed in chi at all 5 grid energies; {n_closed_active} closed subcells total; "
        f"junta 256/63 & own-row 0.70 negative controls verified)."
    )


def main():
    replay_cpp = "--replay-cpp" in sys.argv[1:]
    update_result = "--update-result" in sys.argv[1:]
    verify_all(replay_cpp=replay_cpp, update_result=update_result)


if __name__ == "__main__":
    main()
