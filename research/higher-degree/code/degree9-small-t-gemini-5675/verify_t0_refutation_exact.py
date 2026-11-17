#!/usr/bin/env python3
"""
Exact rational & outward-interval verification for Task 1b (Full 5-Weight N_9^0 at t = 0)
and Task 3 (Degree-7 Local Stability):

Run: `python3 -I verify_t0_refutation_exact.py` (Python 3 stdlib only; zero external dependencies).

Certifies (C):
  Part 1 — Exact Rational Series & Universal Perturbation Formulas (pure `fractions.Fraction`):
    (1a) Exact Taylor series through a^8 of M_{p_W, q_W}(a) = E_{W~CN(0,1)}[ph(W + a) conj(H_{p_W, q_W}(W))].
    (1b) Universal tau^4 formulas along f_tau(z, W_3) = ph(W_3 + tau B(z)), g = -f_tau (||B||_2 = 1 in H_{2,1}):
         - Two-Chaos: ((7c-8)/384) A_0 + ((13c-8)/768) A_1 + ((13c-8)/192) C_1 + ((25c-8)/384) C_2 < 0
           for all 0 <= c < 8/25 = 0.32 (covering 0 <= c <= 0.3 and c_9 = 5867/23400).
         - Degree 7 (HD 1.4): strictly negative on every nonzero B in H_{2,1}(C^d) since a_1 > 3 a_3.
         - Degree 9 (HD 1.6): -(508433/19200000) A_0 + (66677/19200000) A_1 - (3271/48000) C_1 + (314687/9600000) C_2,
           which equals +248589/3200000 > 0 at B(z_1) = H_{2,1}(z_1).
    (1c) Exact 1-spike + bath tau^8 series on H_{2,1}(z_1):
           (V_9(tau) - V_9(0)) / pi = +(248589/3200000) tau^4 - (667197/5120) tau^6
                                      + (219348680259/12800000) tau^8 + O(tau^{10}).
    (1d) Exact parameter-free C^ell i.i.d. cubic sum 1/ell^2 asymptotic series for
         f_ell(z) = ph(sum_{j=1}^ell H_{2,1}(z_j)), g_ell = -f_ell:
           V_9(f_ell, -f_ell) / pi = 181333/800000 + (248589/3200000)/ell - (4371711867/25600000)/ell^2 + O(ell^{-3}).

  Part 2 — Concrete Finite-Parameter Outward Interval Certificates (rigorous integer intervals):
    (2a) At ell = 1, tau = 1/50 = 0.02, h = H_{2,1}(z_1):
           V_9(f_{1, 1/50}, -f_{1, 1/50}) - V_9(W_3/|W_3|, -W_3/|W_3|) in [+1.399512e-8, +1.431863e-8] > 0,
         refuting remote-only attainment of N_9^0 at finite amplitude.
    (2b) At ell = 1600, tau = 1/20 = 0.05, h(z_j) = H_{2,1}(z_j) + (3/250) H_{3,2}(z_j):
           V_9(f_{1600, 1/20}, -f_{1600, 1/20}) in [0.712140692470, 0.712141619442] > 0.71211 = N_9 + 10^{-5},
         proving N(lambda_9) >= N_9^0 > 0.71214069 (1 / N(lambda_9) <= 1 / N_9^0 < 1.404218).
"""

from collections import Counter
from fractions import Fraction
import math
import sys
import time


def check(cond: bool, msg: str) -> None:
    if not cond:
        sys.stderr.write(f"CHECK FAILED: {msg}\n")
        sys.exit(1)


# ==============================================================================
# PART 1: EXACT RATIONAL FORMAL SERIES (pure fractions.Fraction)
# ==============================================================================

def poly_add_q(A, B, max_deg=None):
    n = max(len(A), len(B))
    if max_deg is not None:
        n = min(n, max_deg + 1)
    out = [Fraction(0)] * n
    for i in range(min(len(A), n)):
        out[i] += A[i]
    for i in range(min(len(B), n)):
        out[i] += B[i]
    return out


def poly_mul_q(A, B, max_deg=None):
    if not A or not B:
        return [Fraction(0)]
    n = len(A) + len(B) - 1
    if max_deg is not None:
        n = min(n, max_deg + 1)
    out = [Fraction(0)] * n
    for i, a in enumerate(A):
        if a == 0 or i >= n:
            continue
        for j, b in enumerate(B):
            if i + j >= n:
                break
            if b != 0:
                out[i + j] += a * b
    return out


def compute_M_series_exact(max_deg: int = 8):
    """
    Exact Taylor series through a^{max_deg} of
      M_{pW, qW}(a) / sqrt(pi / (pW! qW!))
    where M_{pW, qW}(a) = E_{W~CN(0,1)}[ ph(W + a) conj(H_{pW, qW}(W)) ] for real a > 0.
    Shift W -> W - a:
      E[ (W/|W|) conj(H_{pW, qW}(W - a)) e^{-a^2 + 2 a Re(W)} ].
    Put W = r u (|u|=1). Each term is a Laurent polynomial in u times r^m; extracting u^0
    and using int_0^inf 2r e^{-r^2} r^{2d+1} dr = Gamma(d + 3/2) = ((2d+1)! / (4^d d!)) (sqrt(pi)/2)
    gives exact rational coefficients (before multiplying by sqrt(pi / (pW! qW!))).
    """
    def gamma_half_ratio(two_d_plus_1: int) -> Fraction:
        # int_0^inf 2 r e^{-r^2} r^{2d+1} dr / sqrt(pi) = (2d+1)! / (2^{2d+1} d!)
        check(two_d_plus_1 % 2 == 1 and two_d_plus_1 >= -1, "gamma_half_ratio parity/domain")
        if two_d_plus_1 == -1:
            return Fraction(1)  # int_0^inf 2 e^{-r^2} dr = sqrt(pi)
        d = (two_d_plus_1 - 1) // 2
        return Fraction(math.factorial(2 * d + 1), (1 << (2 * d + 1)) * math.factorial(d))

    # Represent bivariate polynomials in (a, u, r) where a_deg <= max_deg, u_pow in Z, r_pow >= 0:
    # Dict {(a_deg, u_pow, r_pow): Fraction}
    def bmul(D1, D2):
        out = {}
        for (a1, u1, r1), v1 in D1.items():
            for (a2, u2, r2), v2 in D2.items():
                ad = a1 + a2
                if ad <= max_deg:
                    key = (ad, u1 + u2, r1 + r2)
                    nv = out.get(key, Fraction(0)) + v1 * v2
                    if nv == 0:
                        out.pop(key, None)
                    else:
                        out[key] = nv
        return out

    # Build e^{-a^2 + a r (u + u^{-1})} up to a^{max_deg}:
    # First X = -a^2 + a r u + a r u^{-1}
    X = {(2, 0, 0): Fraction(-1), (1, 1, 1): Fraction(1), (1, -1, 1): Fraction(1)}
    exp_X = {(0, 0, 0): Fraction(1)}
    X_pow = {(0, 0, 0): Fraction(1)}
    fact = 1
    for k in range(1, max_deg + 1):
        fact *= k
        X_pow = bmul(X_pow, X)
        for key, val in X_pow.items():
            exp_X[key] = exp_X.get(key, Fraction(0)) + val / fact

    # Multiply by W/|W| = u:
    exp_X_u = {(ad, up + 1, rp): v for (ad, up, rp), v in exp_X.items()}

    # Precompute powers of (wb - a) = r u^{-1} - a and (w - a) = r u - a:
    wb_minus_a = {(0, -1, 1): Fraction(1), (1, 0, 0): Fraction(-1)}
    w_minus_a = {(0, 1, 1): Fraction(1), (1, 0, 0): Fraction(-1)}
    pows_wb = [{(0, 0, 0): Fraction(1)}]
    pows_w = [{(0, 0, 0): Fraction(1)}]
    for _ in range(6):
        pows_wb.append(bmul(pows_wb[-1], wb_minus_a))
        pows_w.append(bmul(pows_w[-1], w_minus_a))

    M_rat = {}  # (pW, qW) -> list of Fraction of length max_deg+1 for M_{pW,qW}(a) * sqrt(pW! qW! / pi)
    for pW in range(6):
        for qW in range(6):
            if 2 * pW + qW > 5 or pW + 2 * qW > 4:
                continue
            # sqrt(pW! qW!) * conj(H_{pW,qW}(W - a)) = sum_{m=0}^{min} (-1)^m m! C(pW,m) C(qW,m) (wb-a)^{pW-m} (w-a)^{qW-m}
            H_dict = {}
            for m in range(min(pW, qW) + 1):
                c = Fraction(((-1) ** m) * math.factorial(m) * math.comb(pW, m) * math.comb(qW, m))
                term_d = bmul(pows_wb[pW - m], pows_w[qW - m])
                for key, val in term_d.items():
                    H_dict[key] = H_dict.get(key, Fraction(0)) + c * val
            prod_d = bmul(H_dict, exp_X_u)
            series_a = [Fraction(0)] * (max_deg + 1)
            for (ad, up, rp), val in prod_d.items():
                if up == 0:
                    series_a[ad] += val * gamma_half_ratio(rp)
            M_rat[(pW, qW)] = series_a
    return M_rat


def verify_part1_exact_series():
    print("=== Part 1: Exact Rational Series & Universal Perturbation Identities ===")
    M_rat = compute_M_series_exact(max_deg=8)

    # M_rat[(pW, qW)] represents M_{pW, qW}(a) * sqrt(pW! qW! / pi):
    #   M_{1,0}(0) = (1/2) * sqrt(pi), M_{2,1}(0) = (-1/4) * sqrt(pi / 2) = -sqrt(2*pi)/8.
    check(M_rat[(1, 0)][0] == Fraction(1, 2), "M_{1,0}(0)")
    check(M_rat[(2, 1)][0] == Fraction(-1, 4), "M_{2,1}(0)")

    # (1b) Verify universal tau^4 coefficient of ||P_{5,4} ph(W_3 + tau B)||_2^2 / pi from M_rat:
    # Channels contributing through O(tau^4):
    #   (2,1) [pW!qW!=2, rem (0,0)]: M_rat = -1/4 + (3/8) tau^2 |B|^2 - (15/64) tau^4 |B|^4
    #   (1,1) [pW!qW!=1, rem (2,1)]: M_rat = -(1/4) tau B + (3/16) tau^3 B|B|^2
    #   (2,0) [pW!qW!=2, rem (1,2)]: M_rat = -(1/4) tau Bbar + (3/16) tau^3 Bbar|B|^2
    #   (0,1) [pW!qW!=1, rem (4,2)]: M_rat = -(1/8) tau^2 B^2 -> ||P_{4,2}(B^2)||^2 = A_2 = 2 + chi - A_0 - A_1
    #   (1,0) [pW!qW!=1, rem (3,3)]: M_rat = 1/2 - (1/4) tau^2 |B|^2 -> ||P_{3,3}(|B|^2)||^2 = C_3 = 1 + chi - C_1 - C_2
    check(M_rat[(2, 1)][:5] == [Fraction(-1, 4), Fraction(0), Fraction(3, 8), Fraction(0), Fraction(-15, 64)], "M_{2,1} Taylor")
    check(M_rat[(1, 1)][:4] == [Fraction(0), Fraction(-1, 4), Fraction(0), Fraction(3, 16)], "M_{1,1} Taylor")
    check(M_rat[(2, 0)][:4] == [Fraction(0), Fraction(-1, 4), Fraction(0), Fraction(3, 16)], "M_{2,0} Taylor")
    check(M_rat[(0, 1)][:3] == [Fraction(0), Fraction(0), Fraction(-1, 8)], "M_{0,1} Taylor")
    check(M_rat[(1, 0)][:3] == [Fraction(1, 2), Fraction(0), Fraction(-1, 4)], "M_{1,0} Taylor")

    # Express universal k=4 tau^4 coeff in (A0, A1, C1, C2) using chi = (2/3)A0 + (1/3)A1 + (4/3)C1 + (2/3)C2:
    chi_w = (Fraction(2, 3), Fraction(1, 3), Fraction(4, 3), Fraction(2, 3))  # (A0, A1, C1, C2)
    # From M_rat above, c4_raw = -chi/256 - A0/64 - A1/64 - C1/16 - C2/16:
    c4_invs = [
        -Fraction(1, 256) * chi_w[0] - Fraction(1, 64),
        -Fraction(1, 256) * chi_w[1] - Fraction(1, 64),
        -Fraction(1, 256) * chi_w[2] - Fraction(1, 16),
        -Fraction(1, 256) * chi_w[3] - Fraction(1, 16),
    ]
    check(c4_invs == [Fraction(-7, 384), Fraction(-13, 768), Fraction(-13, 192), Fraction(-25, 384)], "P_{5,4} tau^4 coeffs")

    # Two-chaos tau^4 coefficients at c = 0, c = 3/10 = 0.3, and c_9 = 5867/23400, plus junta formula (21/128)(17c - 8):
    for c_test in [Fraction(0), Fraction(3, 10), Fraction(5867, 23400), Fraction(1)]:
        tc_coeffs = [-chi_w[i] / 32 - c_test * c4_invs[i] for i in range(4)]
        if c_test < Fraction(8, 25):
            check(all(x < 0 for x in tc_coeffs), f"two-chaos tau^4 < 0 at c={c_test}")
        tc_junta = 8 * tc_coeffs[0] + 24 * tc_coeffs[1] + 9 * tc_coeffs[2] + 25 * tc_coeffs[3]
        check(tc_junta == Fraction(21, 128) * (17 * c_test - 8), f"two-chaos junta formula at c={c_test}")
    print("[PASS] (1b.i) Universal two-chaos tau^4 variation strictly negative for all 0 <= c <= 0.3 and all B in H_{2,1}.")

    # Degree-7 universal tau^4 coefficients:
    a1_7, a2_7, a3_7 = Fraction(906596, 1000000), Fraction(541570, 1000000), Fraction(242531, 1000000)
    d7_coeffs = [
        -a1_7 * chi_w[0] / 32 - a2_7 * Fraction(1, 64),
        -a1_7 * chi_w[1] / 32 + a3_7 * Fraction(1, 64),
        -a1_7 * chi_w[2] / 32 - a2_7 * Fraction(1, 16),
        -a1_7 * chi_w[3] / 32 + a3_7 * Fraction(1, 16),
    ]
    check(
        d7_coeffs == [
            Fraction(-2625547, 96000000),
            Fraction(-1085599, 192000000),
            Fraction(-1718951, 24000000),
            Fraction(-179003, 48000000),
        ],
        f"Degree-7 exact tau^4 fractions: {d7_coeffs}",
    )
    check(all(x < 0 for x in d7_coeffs), "Degree-7 tau^4 coeffs < 0")
    print(f"[PASS] (1b.ii) Degree-7 universal tau^4 coeffs strictly negative: {[str(x) for x in d7_coeffs]}.")

    # Degree-9 universal tau^4 coefficients and per-chaos balance at B(z_1) = H_{2,1}(z_1):
    a1_9, a2_9, a3_9, a4_9 = Fraction(936, 1000), Fraction(72057, 100000), Fraction(59202, 100000), Fraction(23468, 100000)
    d9_coeffs = [
        -a1_9 * chi_w[0] / 32 - a2_9 * Fraction(1, 64) - a4_9 * c4_invs[0],
        -a1_9 * chi_w[1] / 32 + a3_9 * Fraction(1, 64) - a4_9 * c4_invs[1],
        -a1_9 * chi_w[2] / 32 - a2_9 * Fraction(1, 16) - a4_9 * c4_invs[2],
        -a1_9 * chi_w[3] / 32 + a3_9 * Fraction(1, 16) - a4_9 * c4_invs[3],
    ]
    check(
        d9_coeffs == [
            Fraction(-508433, 19200000),
            Fraction(66677, 19200000),
            Fraction(-3271, 48000),
            Fraction(314687, 9600000),
        ],
        "Degree-9 universal tau^4 coeffs",
    )
    junta_invs = (8, 24, 9, 25)  # (A_0, A_1, C_1, C_2) at H_{2,1}(z_1)
    p21_junta = -sum(chi_w[i] * junta_invs[i] for i in range(4)) / 32
    p32_junta = Fraction(8, 64) + Fraction(9, 16)
    p43_junta = Fraction(24, 64) + Fraction(25, 16)
    p54_junta = sum(c4_invs[i] * junta_invs[i] for i in range(4))
    check(
        (p21_junta, p32_junta, p43_junta, p54_junta)
        == (Fraction(-21, 16), Fraction(11, 16), Fraction(31, 16), Fraction(-357, 128)),
        "Per-chaos tau^4 coefficients at H_{2,1}(z_1)",
    )
    v9_tau4_junta = sum(junta_invs[i] * d9_coeffs[i] for i in range(4))
    check(
        v9_tau4_junta == a1_9 * p21_junta - a2_9 * p32_junta + a3_9 * p43_junta - a4_9 * p54_junta == Fraction(248589, 3200000),
        "Degree-9 junta tau^4 balance",
    )
    print("[PASS] (1b.iii) Degree-9 universal tau^4 formula verified; at H_{2,1}(z_1) gives +248589/3200000 > 0.")

    # (1c) Full 1-spike + bath tau^8 series on B(z_1) = H_{2,1}(z_1) across all 18 ambient basis elements:
    # For fixed z_1 = r e^{i th}, tau H_{2,1}(z_1) = [tau r(r^2-2)/sqrt(2)] e^{i th}, spin m_W = 1 - pW + qW.
    # Angular integration over th enforces p1 - q1 == 1 - pW + qW. Since d_a == |m_W| (mod 2),
    # sgn(r^2-2)^{m_W} |r^2-2|^{d_a} = (r^2-2)^{d_a} for all r >= 0, so each projection is an exact
    # polynomial in tau^2 evaluated via Exponential(1) moments int_0^inf u^d e^{-u} du = d!.
    ek_series = [[Fraction(0)] * 5 for _ in range(5)]  # powers of tau^2: tau^0, tau^2, tau^4, tau^6, tau^8
    for k in range(5):
        for pW in range(6):
            for qW in range(6):
                p1 = (k + 1) - 2 * pW - qW
                q1 = k - pW - 2 * qW
                if p1 < 0 or q1 < 0:
                    continue
                ms = M_rat[(pW, qW)]
                m1 = abs(p1 - q1)
                rad_u = [Fraction(0)] * (min(p1, q1) + 1)
                for j in range(min(p1, q1) + 1):
                    rad_u[min(p1, q1) - j] = Fraction(((-1) ** j) * math.factorial(j) * math.comb(p1, j) * math.comb(q1, j))
                u_minus_2 = [Fraction(-2), Fraction(1)]
                um2_pows = [[Fraction(1)]]
                for _ in range(8):
                    um2_pows.append(poly_mul_q(um2_pows[-1], u_minus_2))

                # Each nonzero ms[d_a] has d_a >= m1 and d_a == m1 (mod 2). Factoring out (1/sqrt(2))^{m1}
                # leaves rational (1/2)^{(d_a - m1)/2}, and squaring divides by 2^{m1} p1! q1! pW! qW!.
                c_tau = [Fraction(0)] * 9
                for d_a in range(9):
                    if ms[d_a] == 0:
                        continue
                    check((d_a - m1) % 2 == 0 and d_a >= m1, "d_a parity and lower bound")
                    half_pow = (d_a - m1) // 2
                    poly_u = poly_mul_q(rad_u, um2_pows[d_a])
                    u_base = (m1 + d_a) // 2
                    mom = sum(cf * math.factorial(u_base + deg_u) for deg_u, cf in enumerate(poly_u))
                    c_tau[d_a] = ms[d_a] * mom / (1 << half_pow)

                c_sq_tau = poly_mul_q(c_tau, c_tau, max_deg=8)
                denom_norm = (1 << m1) * math.factorial(p1) * math.factorial(q1) * math.factorial(pW) * math.factorial(qW)
                for p2 in range(5):
                    ek_series[k][p2] += c_sq_tau[2 * p2] / denom_norm

    neg_lam9 = [Fraction(-1), Fraction(936, 1000), Fraction(-72057, 100000), Fraction(59202, 100000), Fraction(-23468, 100000)]
    v9_series = [sum(neg_lam9[k] * ek_series[k][p2] for k in range(5)) for p2 in range(5)]
    check(
        v9_series == [
            Fraction(181333, 800000),
            Fraction(0),
            Fraction(248589, 3200000),
            Fraction(-667197, 5120),
            Fraction(219348680259, 12800000),
        ],
        "1-spike + bath tau^8 series",
    )
    print(
        "[PASS] (1c) Exact 1-spike+bath series verified:\n"
        f"       (V_9(tau) - V_9(0))/pi = +{v9_series[2]} tau^4 {v9_series[3]} tau^6 +{v9_series[4]} tau^8 + O(tau^10)."
    )

    # (1d) Exact 1/ell and 1/ell^2 asymptotic series on C^ell for f_ell(z) = ph(sum_{j=1}^ell H_{2,1}(z_j)):
    # In the rescaled Hankel variable u = kappa * sqrt(ell) with y = 1/ell, expand F_{0,0}(u sqrt(y))^{ell - s}
    # and each factor F_{p,q}(u sqrt(y)) in powers of y through y^2.
    u_minus_2 = [Fraction(-2), Fraction(1)]
    um2_pows = [[Fraction(1)]]
    for _ in range(10):
        um2_pows.append(poly_mul_q(um2_pows[-1], u_minus_2))

    def Eh_rad_moment(p: int, q: int, n_bess: int) -> Fraction:
        # int_0^inf 2r e^{-r^2} [sqrt(p!q!) R_{p,q}(r)] * [r (r^2-2)]^{2*n_bess + m} dr (m = |p-q|)
        m = abs(p - q)
        L = 2 * n_bess + m
        rad_u = [Fraction(0)] * (min(p, q) + 1)
        for j in range(min(p, q) + 1):
            rad_u[min(p, q) - j] = Fraction(((-1) ** j) * math.factorial(j) * math.comb(p, j) * math.comb(q, j))
        poly_u = poly_mul_q(rad_u, um2_pows[L])
        u_base = (m + L) // 2
        return sum(cf * math.factorial(u_base + deg_u) for deg_u, cf in enumerate(poly_u))

    # F_{0,0}(s) = 1 - s^2/4 + a4 s^4 + a6 s^6 + O(s^8), so
    # log F_{0,0}(s) = -s^2/4 + (a4 - 1/32) s^4 + (a6 + a4/4 - 1/192) s^6 + O(s^8).
    a2_f0 = Eh_rad_moment(0, 0, 1) / (1 * 1 * (1 << 2) * 2)
    a4_f0 = Eh_rad_moment(0, 0, 2) / (4 * (1 << 4) * 4)
    a6_f0 = -Eh_rad_moment(0, 0, 3) / (36 * (1 << 6) * 8)
    check(a2_f0 == Fraction(1, 4), "F_{0,0} quadratic coeff == 1/4")
    L2 = Fraction(-1, 4)
    L4 = a4_f0 - Fraction(1, 32)
    L6 = a6_f0 + a4_f0 * Fraction(1, 4) - Fraction(1, 192)

    # For given s_len and y = 1/ell:
    #   (ell - s_len) log F_{0,0}(u sqrt(y)) + u^2 / 4 = E1(u^2) y + E2(u^2) y^2 + O(y^3),
    #   exp(...) = 1 + E1 y + (E2 + (1/2) E1^2) y^2 + O(y^3).
    def gen_pure_types(P: int, Q: int):
        cand = [(p, q) for p in range(P + 1) for q in range(Q + 1) if (p, q) != (0, 0)]
        out = []

        def rec(idx, rp, rq, cur):
            if rp == 0 and rq == 0:
                out.append(tuple(cur))
                return
            for i in range(idx, len(cand)):
                p, q = cand[i]
                if p <= rp and q <= rq:
                    cur.append((p, q))
                    rec(i, rp - p, rq - q, cur)
                    cur.pop()

        rec(0, P, Q, [])
        return out

    # Polynomials in w = u^2 integrated via int_0^inf u^{2d} e^{-u^2/4} du / sqrt(pi) = (2d)! / d!.
    def u_even_gauss_int(d: int) -> Fraction:
        return Fraction(math.factorial(2 * d), math.factorial(d))

    # For each nonzero (p, q) with m = |p - q|,
    #   F_{p,q}(u sqrt(y)) * sqrt(p! q! 2^m) / (u^m y^{m/2})
    #     = sum_{n>=0} [(-1)^n Eh_rad_moment(p, q, n) / (n! (n+m)! 2^{3n + m})] * (w y)^n.
    # When m == 0 and (p, q) != (0, 0), the n = 0 term vanishes (<H_{p,p}, 1> = 0), so F_{p,p}(u sqrt(y))
    # starts at order y^1 and c^2 starts at order y^2 per m == 0 factor; combined with ell^{s_len},
    # every multiset has nonnegative net y-order eff_y_pow_c2 - s_len >= 0.
    F_series_y = {}
    all_pure_pq = set()
    pure_by_k = {k: gen_pure_types(k + 1, k) for k in range(5)}
    for k in range(5):
        for tup in pure_by_k[k]:
            all_pure_pq.update(tup)

    for (p, q) in sorted(all_pure_pq):
        m = abs(p - q)
        y_coeffs = []
        for n in range(3):
            c_val = ((-1) ** n) * Eh_rad_moment(p, q, n) / (math.factorial(n) * math.factorial(n + m) * (1 << (3 * n + m)))
            w_poly = [Fraction(0)] * n + [c_val]
            y_coeffs.append(w_poly)
        F_series_y[(p, q)] = (m, y_coeffs)

    def series_y_mul(S1, S2, max_y=2):
        out = [[Fraction(0)] for _ in range(max_y + 1)]
        for i, p1 in enumerate(S1):
            if i > max_y:
                break
            for j, p2 in enumerate(S2):
                if i + j > max_y:
                    break
                out[i + j] = poly_add_q(out[i + j], poly_mul_q(p1, p2))
        return out

    ek_pure_y = [[Fraction(0)] * 3 for _ in range(5)]  # y^0, y^1, y^2 (divided by pi)
    for k in range(5):
        for tup in pure_by_k[k]:
            s_len = len(tup)
            m_sum = sum(abs(p - q) for p, q in tup)
            eff_y_pow_c2 = 0
            fac_series_list = []
            for (p, q) in tup:
                m = abs(p - q)
                if m >= 1:
                    eff_y_pow_c2 += m
                    fac_series_list.append(F_series_y[(p, q)][1])
                else:
                    # m == 0 with (p, q) != (0, 0): n = 0 term is 0, so factor out y^1 from F_{p,p}.
                    check(F_series_y[(p, q)][1][0] == [Fraction(0)], "F_{p,p} leading term vanishes")
                    eff_y_pow_c2 += 2
                    y_c_m0 = []
                    for n in range(1, 4):
                        c_val = ((-1) ** n) * Eh_rad_moment(p, q, n) / (math.factorial(n) * math.factorial(n) * (1 << (3 * n)))
                        y_c_m0.append([Fraction(0)] * n + [c_val])
                    fac_series_list.append(y_c_m0)

            net_y_shift = eff_y_pow_c2 - s_len
            check(net_y_shift >= 0, "net y order >= 0")
            if net_y_shift > 2:
                continue
            rem_y = 2 - net_y_shift

            E1_w = [Fraction(0), -s_len * L2, L4]
            E2_w = [Fraction(0), Fraction(0), -s_len * L4, L6]
            exp_y = [
                [Fraction(1)],
                E1_w,
                poly_add_q(E2_w, [c / 2 for c in poly_mul_q(E1_w, E1_w)]),
            ]
            prod_S = exp_y
            for fs in fac_series_list:
                prod_S = series_y_mul(prod_S, fs, max_y=rem_y)

            # Charge 1 implies m_sum == 1 (mod 2), so m_sum - 1 = 2 * d0 is even.
            check((m_sum - 1) % 2 == 0, "m_sum odd parity")
            d0 = (m_sum - 1) // 2
            c_y = [Fraction(0)] * (rem_y + 1)
            for r_y in range(rem_y + 1):
                c_y[r_y] = sum(cf * u_even_gauss_int(d0 + deg_w) for deg_w, cf in enumerate(prod_S[r_y]))

            c2_y = poly_mul_q(c_y, c_y, max_deg=rem_y)
            denom_tup = 1
            for p, q in tup:
                denom_tup *= math.factorial(p) * math.factorial(q) * (1 << abs(p - q))
            for v in Counter(tup).values():
                denom_tup *= math.factorial(v)
            fall_y = [Fraction(1)]
            for i_f in range(s_len):
                fall_y = poly_mul_q(fall_y, [Fraction(1), Fraction(-i_f)], max_deg=rem_y)
            contrib_y = poly_mul_q(fall_y, c2_y, max_deg=rem_y)
            for r_y in range(rem_y + 1):
                ek_pure_y[k][net_y_shift + r_y] += contrib_y[r_y] / denom_tup

    v9_pure_y = [sum(neg_lam9[k] * ek_pure_y[k][r_y] for k in range(5)) for r_y in range(3)]
    check(
        v9_pure_y == [
            Fraction(181333, 800000),
            Fraction(248589, 3200000),
            Fraction(-4371711867, 25600000),
        ],
        "Pure C^ell 1/ell^2 series",
    )
    print(
        "[PASS] (1d) Exact pure C^ell i.i.d. cubic sum series verified:\n"
        f"       V_9(f_ell, -f_ell)/pi = {v9_pure_y[0]} + ({v9_pure_y[1]})/ell + ({v9_pure_y[2]})/ell^2 + O(ell^-3)."
    )


# ==============================================================================
# PART 2: CONCRETE FINITE-PARAMETER OUTWARD INTERVAL CERTIFICATES (stdlib ints)
# ==============================================================================

SCALE = 10 ** 40
SCALE_BUILD = 10 ** 360
BUILD_SHIFT = SCALE_BUILD // SCALE
BINOM4 = [[math.comb(i, j) for j in range(i + 1)] for i in range(5)]


def iv_rat(num: int, den: int = 1):
    return ((num * SCALE) // den, -((-num * SCALE) // den))


def iv_frac(f: Fraction):
    return iv_rat(f.numerator, f.denominator)


def iv_add(a, b):
    return (a[0] + b[0], a[1] + b[1])


def iv_sub(a, b):
    return (a[0] - b[1], a[1] - b[0])


def iv_neg(a):
    return (-a[1], -a[0])


def iv_abs_hi(a):
    return max(abs(a[0]), abs(a[1]))


def iv_mul(a, b):
    p1 = a[0] * b[0]
    p2 = a[0] * b[1]
    p3 = a[1] * b[0]
    p4 = a[1] * b[1]
    return (min(p1, p2, p3, p4) // SCALE, -((-max(p1, p2, p3, p4)) // SCALE))


def iv_sq(a):
    if a[0] >= 0:
        return ((a[0] * a[0]) // SCALE, -((-(a[1] * a[1])) // SCALE))
    if a[1] <= 0:
        return ((a[1] * a[1]) // SCALE, -((-(a[0] * a[0])) // SCALE))
    m = max(-a[0], a[1])
    return (0, -((-(m * m)) // SCALE))


def iv_pow(a, n: int):
    if n == 0:
        return (SCALE, SCALE)
    res = (SCALE, SCALE)
    base = a
    e = n
    while e > 0:
        if e & 1:
            res = iv_mul(res, base)
        e >>= 1
        if e:
            base = iv_mul(base, base)
    return res


def iv_sqrt_int(num: int, den: int = 1):
    t_num = num * SCALE * SCALE
    s = math.isqrt(t_num // den)
    while (s + 1) * (s + 1) * den <= t_num:
        s += 1
    while s * s * den > t_num:
        s -= 1
    return (s, s if s * s * den == t_num else s + 1)


def compute_exp_neg_1():
    s = Fraction(0)
    f = 1
    for j in range(56):
        if j > 0:
            f *= j
        s = s + Fraction(1, f) if (j % 2 == 0) else s - Fraction(1, f)
    rem = Fraction(1, f * 56)
    return (iv_frac(s)[0], iv_frac(s + rem)[1])


EXP_NEG_1 = compute_exp_neg_1()


def exp_neg_iv_point(x_scaled: int):
    m_int = x_scaled // SCALE
    r_val = x_scaled - m_int * SCALE
    r_iv = (r_val, r_val)
    acc = (SCALE, SCALE)
    p = (SCALE, SCALE)
    fact = 1
    for j in range(1, 52):
        fact *= j
        p = iv_mul(p, r_iv)
        term = (p[0] // fact, -((-p[1]) // fact))
        acc = iv_sub(acc, term) if (j % 2 == 1) else iv_add(acc, term)
    rem_hi = -((-SCALE) // (fact * 52)) + 1
    exp_neg_r = (acc[0], acc[1] + rem_hi)
    return exp_neg_r if m_int == 0 else iv_mul(exp_neg_r, iv_pow(EXP_NEG_1, m_int))


def iv_exp_neg(x_iv):
    return (exp_neg_iv_point(x_iv[1])[0], exp_neg_iv_point(x_iv[0])[1])


def b_mul(a, b):
    p1 = a[0] * b[0]
    p2 = a[0] * b[1]
    p3 = a[1] * b[0]
    p4 = a[1] * b[1]
    return (min(p1, p2, p3, p4) // SCALE_BUILD, -((-max(p1, p2, p3, p4)) // SCALE_BUILD))


def b_add(a, b):
    return (a[0] + b[0], a[1] + b[1])


def b_poly_mul(A, B):
    out = [(0, 0)] * (len(A) + len(B) - 1)
    for i, a in enumerate(A):
        for j, b in enumerate(B):
            out[i + j] = b_add(out[i + j], b_mul(a, b))
    return out


def b_sqrt_int(num: int, den: int = 1):
    t_num = num * SCALE_BUILD * SCALE_BUILD
    s = math.isqrt(t_num // den)
    while (s + 1) * (s + 1) * den <= t_num:
        s += 1
    while s * s * den > t_num:
        s -= 1
    return (s, s if s * s * den == t_num else s + 1)


def b_exp_neg_int(u_int: int):
    s = Fraction(0)
    f = 1
    for j in range(300):
        if j > 0:
            f *= j
        s = s + Fraction(1, f) if (j % 2 == 0) else s - Fraction(1, f)
    rem = Fraction(1, f * 300)
    lo = ((s ** u_int).numerator * SCALE_BUILD) // (s ** u_int).denominator
    hi_f = (s + rem) ** u_int
    return (lo, -((-hi_f.numerator * SCALE_BUILD) // hi_f.denominator))


def poly_mul_iv(A, B):
    out = [(0, 0)] * (len(A) + len(B) - 1)
    for i, a in enumerate(A):
        for j, b in enumerate(B):
            out[i + j] = iv_add(out[i + j], iv_mul(a, b))
    return out


def jet4_mul(A, B):
    out = []
    for d in range(5):
        s_iv = (0, 0)
        row = BINOM4[d]
        for i in range(d + 1):
            pr = iv_mul(A[i], B[d - i])
            c = row[i]
            if c > 1:
                pr = (c * pr[0], c * pr[1])
            s_iv = iv_add(s_iv, pr)
        out.append(s_iv)
    return tuple(out)


def jet4_scale_k(J_s, tau_pows):
    return tuple(iv_mul(J_s[l], tau_pows[l]) for l in range(5))


def jet4_pow(J, n: int):
    res = ((SCALE, SCALE), (0, 0), (0, 0), (0, 0), (0, 0))
    base = J
    e = n
    while e > 0:
        if e & 1:
            res = jet4_mul(res, base)
        e >>= 1
        if e:
            base = jet4_mul(base, base)
    return res


def exp_quarter_jet4(k_iv):
    k2 = iv_sq(k_iv)
    k3 = iv_mul(k2, k_iv)
    k4 = iv_sq(k2)
    E = iv_exp_neg(iv_mul(k2, iv_rat(1, 4)))
    d1 = iv_mul(iv_mul(iv_neg(k_iv), iv_rat(1, 2)), E)
    d2 = iv_mul(iv_sub(iv_mul(k2, iv_rat(1, 4)), iv_rat(1, 2)), E)
    d3 = iv_mul(iv_add(iv_mul(iv_neg(k3), iv_rat(1, 8)), iv_mul(k_iv, iv_rat(3, 4))), E)
    d4 = iv_mul(iv_add(iv_sub(iv_mul(k4, iv_rat(1, 16)), iv_mul(k2, iv_rat(3, 4))), iv_rat(3, 4)), E)
    return (E, d1, d2, d3, d4)


def enclose_bath_spikes_v9(ell: int, tau: Fraction, alpha_32: Fraction, r_cut_sq: int, k_max: Fraction, n_bessel: int, n_k: int):
    """
    Rigorous outward interval enclosure of V_9(f, -f) for
      f(z, W_3) = ph(W_3 + tau * sum_{j=1}^{ell} [H_{2,1}(z_j) + alpha_32 H_{3,2}(z_j)]).
    """
    def gen_partitions_bideg(P, Q):
        if P == 0 and Q == 0:
            return [()]
        cand = [(p, q) for p in range(P + 1) for q in range(Q + 1) if (p, q) != (0, 0)]
        out = []

        def rec(idx, rp, rq, cur):
            if rp == 0 and rq == 0:
                out.append(tuple(cur))
                return
            for i in range(idx, len(cand)):
                p, q = cand[i]
                if p <= rp and q <= rq:
                    cur.append((p, q))
                    rec(i, rp - p, rq - q, cur)
                    cur.pop()

        rec(0, P, Q, [])
        return out

    bath_types = {k: [] for k in range(5)}
    all_pq = set([(0, 0)])
    for k in range(5):
        for pW in range(6):
            for qW in range(6):
                rp, rq = (k + 1) - 2 * pW - qW, k - pW - 2 * qW
                if rp < 0 or rq < 0:
                    continue
                for tup in gen_partitions_bideg(rp, rq):
                    if len(tup) <= ell:
                        bath_types[k].append((pW, qW, tup))
                        all_pq.update(tup)

    SQRT2 = iv_sqrt_int(2)
    SQRT3 = iv_sqrt_int(3)
    INV_SQRT2 = iv_mul(SQRT2, iv_rat(1, 2))
    # alpha_32 / sqrt(12) = (alpha_32 / 6) * sqrt(3):
    a32_div6 = alpha_32 / 6
    C_32 = iv_mul(SQRT3, iv_frac(a32_div6))
    Qh = [
        iv_add(iv_mul(iv_rat(-2), INV_SQRT2), iv_mul(iv_rat(6), C_32)),
        iv_add(INV_SQRT2, iv_mul(iv_rat(-6), C_32)),
        C_32,
    ]
    if alpha_32 == 0:
        Qh = Qh[:2]

    SQRT2_B = b_sqrt_int(2)
    SQRT3_B = b_sqrt_int(3)
    INV_SQRT2_B = (SQRT2_B[0] // 2, -((-SQRT2_B[1]) // 2))
    C_32_B = (
        (SQRT3_B[0] * a32_div6.numerator) // a32_div6.denominator,
        -((-(SQRT3_B[1] * a32_div6.numerator)) // a32_div6.denominator),
    )
    Qh_B = [
        b_add((-2 * INV_SQRT2_B[1], -2 * INV_SQRT2_B[0]), (6 * C_32_B[0], 6 * C_32_B[1])),
        b_add(INV_SQRT2_B, (-6 * C_32_B[1], -6 * C_32_B[0])),
        C_32_B,
    ]
    if alpha_32 == 0:
        Qh_B = Qh_B[:2]

    s_max = tau * k_max
    max_L = 2 * n_bessel + 6
    Qh_pows_B = [[(SCALE_BUILD, SCALE_BUILD)]]
    for _ in range(1, max_L + 1):
        Qh_pows_B.append(b_poly_mul(Qh_pows_B[-1], Qh_B))

    exp_neg_u_B = b_exp_neg_int(r_cut_sq)
    exp_neg_u = (exp_neg_u_B[0] // BUILD_SHIFT, -((-exp_neg_u_B[1]) // BUILD_SHIFT))
    deg_qh = len(Qh) - 1
    max_d = (deg_qh + 1) * max_L + 14
    M_inc_B = []
    M_tail = []
    powU = [1]
    fact_list = [1]
    for j in range(1, max_d + 140):
        powU.append(powU[-1] * r_cut_sq)
        fact_list.append(fact_list[-1] * j)

    K_GAM = 120
    for d in range(max_d + 1):
        s_lo = 0
        s_hi = 0
        prod_den = d + 1
        for kg in range(K_GAM + 1):
            uk = powU[kg]
            s_lo += (uk * SCALE_BUILD) // prod_den
            s_hi += -((-uk * SCALE_BUILD) // prod_den)
            prod_den *= d + 2 + kg
        check(r_cut_sq * 3 < d + 2 + K_GAM, "incomplete Gamma geometric tail condition")
        rem_gam = 2 * (-((-powU[K_GAM + 1] * SCALE_BUILD) // prod_den) + 1)
        u_d1_exp = (exp_neg_u_B[0] * powU[d + 1], exp_neg_u_B[1] * powU[d + 1])
        M_inc_B.append(b_mul(u_d1_exp, (s_lo, s_hi + rem_gam)))
        if d <= 45:
            df = fact_list[d]
            tail_int = sum((df // fact_list[j]) * powU[j] for j in range(d + 1))
            M_tail.append((exp_neg_u[0] * tail_int, exp_neg_u[1] * tail_int))

    r_cut_ceil_num = iv_sqrt_int(r_cut_sq, 1)[1]
    qh_u_max = sum(iv_abs_hi(Qh[dg]) * (r_cut_sq ** dg) for dg in range(len(Qh)))
    h_max = -((-r_cut_ceil_num * qh_u_max) // SCALE) + 1
    Qh_abs = [(0, iv_abs_hi(c)) for c in Qh]
    h_half = (0, -((-h_max) // 2))
    sh_half = iv_mul(iv_frac(s_max), h_half)

    F_poly = {}
    F_tail_err = {}
    M5_bound = {}
    G_div_s_data = {}

    for (p, q) in sorted(all_pq):
        m = abs(p - q)
        inv_norm = iv_sqrt_int(1, math.factorial(p) * math.factorial(q))
        inv_norm_B = b_sqrt_int(1, math.factorial(p) * math.factorial(q))
        rad_poly_u_B = [(0, 0)] * (min(p, q) + 1)
        rad_abs_iv = [(0, 0)] * (min(p, q) + 1)
        for j in range(min(p, q) + 1):
            deg_u = min(p, q) - j
            c_int = ((-1) ** j) * math.factorial(j) * math.comb(p, j) * math.comb(q, j)
            rad_poly_u_B[deg_u] = (c_int * inv_norm_B[0], c_int * inv_norm_B[1]) if c_int >= 0 else (c_int * inv_norm_B[1], c_int * inv_norm_B[0])
            rad_abs_iv[deg_u] = (0, abs(c_int) * inv_norm[1])

        coeffs_n = []
        for n in range(n_bessel + 1):
            L = 2 * n + m
            prod_u_B = b_poly_mul(rad_poly_u_B, Qh_pows_B[L])
            integral_B = (0, 0)
            for deg_u, cf_B in enumerate(prod_u_B):
                integral_B = b_add(integral_B, b_mul(cf_B, M_inc_B[n + m + deg_u]))
            denom_full = fact_list[n] * fact_list[n + m] * (1 << L) * BUILD_SHIFT
            if n % 2 == 1:
                integral_B = (-integral_B[1], -integral_B[0])
            coeffs_n.append((integral_B[0] // denom_full, -((-integral_B[1]) // denom_full)))

        # Verify strict alternating decrease of Bessel tail for l <= 5 at n >= n_bessel + 1:
        n1 = n_bessel + 1
        L1 = 2 * n1 + m
        check(
            (L1 + 2) * (L1 + 1) * (iv_sq(sh_half)[1]) < (L1 - 3) * (L1 - 4) * (n1 + 1) * (n1 + 1 + m) * SCALE,
            "Bessel tail alternating decrease condition",
        )

        den_bess = fact_list[n1] * fact_list[n1 + m]
        errs = []
        p_abs = rad_abs_iv
        for l_pow in range(7):
            if l_pow > 0:
                p_abs = poly_mul_iv(p_abs, Qh_abs)
            if l_pow <= 5:
                u_shift = (m + l_pow + 1) // 2
                t_r = sum((cf_iv[1] * M_tail[u_shift + deg_u][1]) // SCALE + 1 for deg_u, cf_iv in enumerate(p_abs))
                fall = 1
                for r_i in range(l_pow):
                    fall *= L1 - r_i
                b_err = -((-(fall * iv_mul(iv_pow(sh_half, max(0, L1 - l_pow)), iv_pow(h_half, l_pow))[1])) // den_bess) + 1
                errs.append(t_r + b_err)
                if l_pow == 5:
                    u_hi5 = (m + 6) // 2
                    M5_bound[(p, q)] = sum(cf_iv[1] * (fact_list[deg_u] + fact_list[deg_u + u_hi5]) for deg_u, cf_iv in enumerate(p_abs))
            else:
                if m >= 1:
                    u_hi6 = (m + 7) // 2
                    m6_val = sum(cf_iv[1] * (fact_list[deg_u] + fact_list[deg_u + u_hi6]) for deg_u, cf_iv in enumerate(p_abs))
                    G_div_s_data[(p, q)] = (m - 1, coeffs_n, (errs[1], errs[2], errs[3], errs[4], errs[5]), m6_val)

        F_poly[(p, q)] = (m, coeffs_n)
        F_tail_err[(p, q)] = tuple(errs[:5])

    def eval_poly_jet4_at_point(m_deg: int, cfs, errs5, m_top: int, s_pt_iv, half_ds_hi: int):
        s2 = iv_sq(s_pt_iv)
        s_pows = [(SCALE, SCALE)]
        for _ in range(1, m_deg + 5):
            s_pows.append(iv_mul(s_pows[-1], s_pt_iv))
        out_pt = []
        for l_ord in range(5):
            n0 = max(0, (l_ord - m_deg + 1) // 2)
            rem_pow = 2 * n0 + m_deg - l_ord
            acc = (0, 0)
            for n in range(n_bessel, n0 - 1, -1):
                deg = 2 * n + m_deg
                fall = 1
                for r_i in range(l_ord):
                    fall *= deg - r_i
                cn = cfs[n]
                acc = iv_add(iv_mul(acc, s2), (cn[0] * fall, cn[1] * fall))
            if rem_pow > 0:
                acc = iv_mul(acc, s_pows[rem_pow])
            e_l = errs5[l_ord]
            out_pt.append((acc[0] - e_l, acc[1] + e_l))
        pan = [None] * 5
        r4 = -((-m_top * half_ds_hi) // SCALE) + 1
        pan[4] = (out_pt[4][0] - r4, out_pt[4][1] + r4)
        for l_ord in range(3, -1, -1):
            rl = -((-iv_abs_hi(pan[l_ord + 1]) * half_ds_hi) // SCALE) + 1
            pan[l_ord] = (out_pt[l_ord][0] - rl, out_pt[l_ord][1] + rl)
        return tuple(pan)

    def eval_val_at_point(m_deg: int, cfs, e0: int, s_pt_iv):
        s2 = iv_sq(s_pt_iv)
        acc = (0, 0)
        for n in range(n_bessel, -1, -1):
            acc = iv_add(iv_mul(acc, s2), cfs[n])
        if m_deg > 0:
            acc = iv_mul(acc, iv_pow(s_pt_iv, m_deg))
        return (acc[0] - e0, acc[1] + e0)

    hk = k_max / n_k
    hk_half_iv = iv_frac(hk / 2)
    INV_SQRT3 = iv_mul(SQRT3, iv_rat(1, 3))
    gl_off_k = iv_mul(hk_half_iv, INV_SQRT3)
    hk5_4320 = iv_frac((hk ** 5) / 4320)

    tau_pows = [(SCALE, SCALE)]
    for _ in range(1, 6):
        tau_pows.append(iv_mul(tau_pows[-1], iv_frac(tau)))
    half_ds_hi = iv_frac(tau * hk / 2)[1]

    F_gl = {pq: [] for pq in all_pq}
    F_jet4 = {pq: [] for pq in all_pq}
    G_gl = {pq: [] for pq in G_div_s_data}
    G_jet4 = {pq: [] for pq in G_div_s_data}

    for j in range(n_k):
        k_mid_iv = iv_frac((2 * j + 1) * hk / 2)
        k_m = iv_sub(k_mid_iv, gl_off_k)
        k_p = iv_add(k_mid_iv, gl_off_k)
        s_mid_iv = iv_mul(tau_pows[1], k_mid_iv)
        s_m = iv_mul(tau_pows[1], k_m)
        s_p = iv_mul(tau_pows[1], k_p)
        for pq in all_pq:
            m_pq, cfs = F_poly[pq]
            pan_s = eval_poly_jet4_at_point(m_pq, cfs, F_tail_err[pq], M5_bound[pq], s_mid_iv, half_ds_hi)
            if pq == (0, 0) and pan_s[0][1] > SCALE:
                pan_s = ((pan_s[0][0], SCALE), pan_s[1], pan_s[2], pan_s[3], pan_s[4])
            F_jet4[pq].append(jet4_scale_k(pan_s, tau_pows))
            e0 = F_tail_err[pq][0]
            F_gl[pq].append((eval_val_at_point(m_pq, cfs, e0, s_m), eval_val_at_point(m_pq, cfs, e0, s_p)))
        for pq, (m1, cfs_g, errs_g, m6_v) in G_div_s_data.items():
            pan_gs = eval_poly_jet4_at_point(m1, cfs_g, errs_g, m6_v, s_mid_iv, half_ds_hi)
            jg_k = jet4_scale_k(pan_gs, tau_pows)
            G_jet4[pq].append(tuple(iv_mul(tau_pows[1], c_iv) for c_iv in jg_k))
            gm = iv_mul(tau_pows[1], eval_val_at_point(m1, cfs_g, errs_g[0], s_m))
            gp = iv_mul(tau_pows[1], eval_val_at_point(m1, cfs_g, errs_g[0], s_p))
            G_gl[pq].append((gm, gp))

    s_lens = sorted(set(len(tup) for k in range(5) for (_, _, tup) in bath_types[k]))
    F0_pow_gl = {sl: [(iv_pow(F_gl[(0, 0)][j][0], ell - sl), iv_pow(F_gl[(0, 0)][j][1], ell - sl)) for j in range(n_k)] for sl in s_lens}
    F0_pow_jet4 = {sl: [jet4_pow(F_jet4[(0, 0)][j], ell - sl) for j in range(n_k)] for sl in s_lens}

    W_gl = {mw: [] for mw in range(6)}
    W_jet4 = {mw: [] for mw in range(6)}
    for j in range(n_k):
        k_lo = j * hk
        k_hi = (j + 1) * hk
        k_mid_iv = iv_frac((2 * j + 1) * hk / 2)
        k_m = iv_sub(k_mid_iv, gl_off_k)
        k_p = iv_add(k_mid_iv, gl_off_k)
        kp_iv = (iv_frac(k_lo)[0], iv_frac(k_hi)[1])
        Em = iv_exp_neg(iv_mul(iv_sq(k_m), iv_rat(1, 4)))
        Ep = iv_exp_neg(iv_mul(iv_sq(k_p), iv_rat(1, 4)))
        EJ = exp_quarter_jet4(kp_iv)
        W_gl[0].append((Em, Ep))
        W_jet4[0].append(EJ)
        for mw in range(1, 6):
            c_2 = iv_rat(1, 1 << mw)
            p_deg = mw - 1
            W_gl[mw].append((iv_mul(c_2, iv_mul(iv_pow(k_m, p_deg), Em)), iv_mul(c_2, iv_mul(iv_pow(k_p, p_deg), Ep))))
            kj = []
            for l_ord in range(5):
                if l_ord > p_deg:
                    kj.append((0, 0))
                else:
                    fall = 1
                    for r_i in range(l_ord):
                        fall *= p_deg - r_i
                    pw = iv_pow(kp_iv, p_deg - l_ord)
                    kj.append((fall * pw[0], fall * pw[1]))
            prodJ = jet4_mul(tuple(kj), EJ)
            W_jet4[mw].append(tuple(iv_mul(c_2, x) for x in prodJ))

    check(k_max > 2, "k_max > 2 for Gaussian tail bound")
    U_K = k_max * k_max / 4
    exp_UK = iv_exp_neg(iv_frac(U_K))[1]
    uk_hi = iv_frac(U_K)[1]
    poly_uk = iv_add(iv_rat(2), iv_add((2 * uk_hi, 2 * uk_hi), iv_sq((uk_hi, uk_hi))))[1]
    k_tail_bound = -((-iv_mul((0, exp_UK), (0, poly_uk))[1] * k_max.denominator) // k_max.numerator) + 1

    def mcount_int(tup) -> int:
        s = len(tup)
        if s == 0:
            return 1
        num = 1
        for i in range(s):
            num *= ell - i
        for v in Counter(tup).values():
            num //= math.factorial(v)
        return num

    tup_gl_cache = {(): [((SCALE, SCALE), (SCALE, SCALE))] * n_k}
    tup_jet4_cache = {(): [((SCALE, SCALE), (0, 0), (0, 0), (0, 0), (0, 0))] * n_k}

    def get_tup_gl_jet4(tup):
        if tup not in tup_gl_cache:
            pgl, pj = get_tup_gl_jet4(tup[:-1])
            pq = tup[-1]
            fgl = F_gl[pq]
            fj = F_jet4[pq]
            tup_gl_cache[tup] = [(iv_mul(pgl[j][0], fgl[j][0]), iv_mul(pgl[j][1], fgl[j][1])) for j in range(n_k)]
            tup_jet4_cache[tup] = [jet4_mul(pj[j], fj[j]) for j in range(n_k)]
        return tup_gl_cache[tup], tup_jet4_cache[tup]

    ek_iv = []
    for k in range(5):
        sum_k = (0, 0)
        for pW, qW, tup in bath_types[k]:
            s_len = len(tup)
            mw = pW + qW
            inv_w_fact = iv_sqrt_int(1, math.factorial(pW) * math.factorial(qW))
            acc_c = (0, 0)
            w_gl = W_gl[mw]
            w_j4 = W_jet4[mw]
            f0_gl = F0_pow_gl[s_len]
            f0_j4 = F0_pow_jet4[s_len]

            if mw >= 1:
                tgl, tj4 = get_tup_gl_jet4(tup)
                for j in range(n_k):
                    vm = iv_mul(iv_mul(w_gl[j][0], f0_gl[j][0]), tgl[j][0])
                    vp = iv_mul(iv_mul(w_gl[j][1], f0_gl[j][1]), tgl[j][1])
                    J_pan = jet4_mul(jet4_mul(w_j4[j], f0_j4[j]), tj4[j])
                    acc_c = iv_add(acc_c, iv_add(iv_mul(hk_half_iv, iv_add(vm, vp)), iv_mul(hk5_4320, J_pan[4])))
            else:
                idx0 = next(i for i, pq in enumerate(tup) if pq[0] != pq[1])
                pq0 = tup[idx0]
                rem_tup = tup[:idx0] + tup[idx0 + 1 :]
                rgl, rj4 = get_tup_gl_jet4(rem_tup)
                ggl = G_gl[pq0]
                gj4 = G_jet4[pq0]
                for j in range(n_k):
                    t_m = iv_mul(ggl[j][0], rgl[j][0])
                    t_p = iv_mul(ggl[j][1], rgl[j][1])
                    vm = iv_mul(iv_mul(w_gl[j][0], f0_gl[j][0]), t_m)
                    vp = iv_mul(iv_mul(w_gl[j][1], f0_gl[j][1]), t_p)
                    J_pan = jet4_mul(jet4_mul(w_j4[j], f0_j4[j]), jet4_mul(gj4[j], rj4[j]))
                    acc_c = iv_add(acc_c, iv_add(iv_mul(hk_half_iv, iv_add(vm, vp)), iv_mul(hk5_4320, J_pan[4])))

            acc_c = iv_mul(acc_c, inv_w_fact)
            acc_c = (acc_c[0] - k_tail_bound, acc_c[1] + k_tail_bound)
            c_sq = iv_sq(acc_c)
            mc = mcount_int(tup)
            sum_k = iv_add(sum_k, (mc * c_sq[0], mc * c_sq[1]))
        ek_iv.append(sum_k)

    w_neg_lam = [
        iv_frac(Fraction(-1)),
        iv_frac(Fraction(936, 1000)),
        iv_frac(Fraction(-72057, 100000)),
        iv_frac(Fraction(59202, 100000)),
        iv_frac(Fraction(-23468, 100000)),
    ]
    v9_iv = (0, 0)
    for c_w, e_iv in zip(w_neg_lam, ek_iv):
        v9_iv = iv_add(v9_iv, iv_mul(c_w, e_iv))
    return v9_iv, ek_iv


def pi_scaled_iv():
    def atan_inv(inv_x: int, terms: int = 34):
        s = Fraction(0)
        x2 = inv_x * inv_x
        p = Fraction(1, inv_x)
        for k in range(terms):
            t = p / (2 * k + 1)
            s = s + t if (k % 2 == 0) else s - t
            p /= x2
        rem = p / (2 * terms + 1)
        return (s, s + rem) if (terms % 2 == 0) else (s - rem, s)

    a5 = atan_inv(5)
    a239 = atan_inv(239)
    p_lo = 16 * a5[0] - 4 * a239[1]
    p_hi = 16 * a5[1] - 4 * a239[0]
    return (iv_frac(p_lo)[0], iv_frac(p_hi)[1])


def verify_part2_finite_enclosures():
    print("\n=== Part 2: Outward Interval Enclosures at Concrete Finite Parameters ===")
    piv = pi_scaled_iv()
    v9_remote_iv = iv_mul(iv_frac(Fraction(181333, 800000)), piv)

    # (2a) 1-spike + bath at ell = 1, tau = 1/50 = 0.02, alpha_32 = 0
    # (r_cut_sq = 26, k_max = 11, n_bessel = 42, n_k = 990):
    t0 = time.time()
    v9_1sp, _ = enclose_bath_spikes_v9(
        ell=1, tau=Fraction(1, 50), alpha_32=Fraction(0),
        r_cut_sq=26, k_max=Fraction(11, 1), n_bessel=42, n_k=990
    )
    diff_1sp = iv_sub(v9_1sp, v9_remote_iv)
    check(diff_1sp[0] > 0, f"1-spike enclosure not tight enough: [{diff_1sp[0]/SCALE}, {diff_1sp[1]/SCALE}]")
    print(
        f"[PASS] (2a) Concrete 1-spike+bath (ell=1, tau=1/50) certified in {time.time()-t0:.2f}s:\n"
        f"       V_9(1/50) - V_9(0) in [+{diff_1sp[0]/SCALE:.6e}, +{diff_1sp[1]/SCALE:.6e}] > 0\n"
        f"       => N_9^0 is strictly NOT attained by the diffuse remote-only pair."
    )

    # (2b) 1600-spike + bath at ell = 1600, tau = 1/20 = 0.05, alpha_32 = 3/250
    # (r_cut_sq = 26, k_max = 27/2 = 13.5, n_bessel = 115, n_k = 180):
    t1 = time.time()
    v9_1600, _ = enclose_bath_spikes_v9(
        ell=1600, tau=Fraction(1, 20), alpha_32=Fraction(3, 250),
        r_cut_sq=26, k_max=Fraction(27, 2), n_bessel=115, n_k=180
    )
    target_71211 = iv_frac(Fraction(71211, 100000))
    check(v9_1600[0] > target_71211[1], f"Failed > 0.71211: {v9_1600[0]/SCALE}")
    margin_vs_remote = (v9_1600[0] - v9_remote_iv[1]) / SCALE
    margin_vs_71211 = (v9_1600[0] - target_71211[1]) / SCALE
    print(
        f"[PASS] (2b) Concrete 1600-spike+bath (ell=1600, tau=1/20, alpha_32=3/250) certified in {time.time()-t1:.2f}s:\n"
        f"       V_9 in [{v9_1600[0]/SCALE:.12f}, {v9_1600[1]/SCALE:.12f}] (width {(v9_1600[1]-v9_1600[0])/SCALE:.3e})\n"
        f"       excess over W_3/|W_3| >= +{margin_vs_remote:.6e}; excess over 0.71211 (N_9 + 10^-5) >= +{margin_vs_71211:.6e}."
    )


def main():
    t_all = time.time()
    verify_part1_exact_series()
    verify_part2_finite_enclosures()
    print(f"\nALL CHECKS IN verify_t0_refutation_exact.py PASSED in {time.time()-t_all:.2f}s.")


if __name__ == "__main__":
    main()
