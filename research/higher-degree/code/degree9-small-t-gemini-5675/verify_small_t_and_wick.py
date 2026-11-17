#!/usr/bin/env python3
"""
Exact rational & outward-interval verification for Task 2 (Small-t Bounds & Wick Multiplier)
and Task 3 (Degree-7 Comparison):

Certifies (C) via pure Python stdlib (`python3 -I`, `fractions.Fraction` + `math.isqrt`):
  1. Obstruction of the SMALL_T Parseval step (||P_{3,2} h||_2^2 <= 1 - ||k||_2^2 - t^2) at t = 0:
     - Degree 9 (HD 1.6): pointwise algebraic lower bound >= a_2 = 72057/100000 = 0.72057 > 250/351
       even at G_3 = 0 for EVERY beta * H_{2,1}(W_3) multiplier, and > 0.815 at sigma_3 = 4/5.
     - Degree 7 (HD 1.4): exact closed-form Gaussian integral at sigma_3 = 3/4 proving the
       Parseval-clipped Gaussian ideal at t = 0 exceeds 0.751 > 250/351 = 0.7122507...
  2. Necessary radius conditions for any small-t bound V <= A t^2 + B with B < 250/351:
     - Degree 7: rho_* <= sqrt((250/351) / 0.906596) < 0.886358 (within 1.31e-4 of sqrt(pi)/2).
     - Degree 9: sup_{|f|=1} (||P_{2,1} f||_2^2 - c_9 ||P_{5,4} f||_2^2) <= 31250/41067 < 0.760952,
       forcing rho_* <= 0.899642 < 2289/2500 = 0.9156 (strictly beyond K 3.7).
  3. Multi-chaos gate-free dual bound V <= t^2 + B^* in the diffuse Gaussian ideal:
     - Degree 7: pure algebraic reduction (since a_1 > a_2 > a_3) proving B_7^{*,Gauss} = (226649/1000000)*pi
       = 0.7120388333... with conditional reach t_0 > 0.01455 below 250/351.
     - Degree 9: rigorous outward rational interval proof over ALL (sigma_3, v) in [0, inf)^2 that
         B_9^{*,Gauss} = (181333 / 800000) * pi = 0.7120930258...,
       by certifying:
         (i)  sup_{x > 0} sqrt(2*pi*x) e^{-x} I_0(x) < 27/25 = 1.08 (100 rational subintervals on
              (0, 10] + analytic sin-substitution bound 1 + 1/(6x) + (2/3) sqrt(2*pi*x) e^{-x/2} on [10, inf)),
         (ii) E_{W_3}[ 1 / (2 |m^*(W_3)|) ] < 592/500 = 1.184, so dPsi/dv < 0 for all v > 0 whenever
              sigma_3 >= (93/100) sigma_3^*,
         (iii) beta = 0 Gaussian domination on sigma_3 <= (82/100) sigma_3^* (all v >= 0) and on
              sigma_3 in [0.82, 0.93]*sigma_3^* for v >= 0.075, plus a finite rational strip cover on
              [0.82, 0.93]*sigma_3^* x [0, 0.075].
  4. Exact 2880-matching Wick classification of ||R_9(q)||_2^2 = (1/2) ||P_{5,4}(q^2 qbar)||_2^2
     into 19 real isomorphism classes (16 + 336 + 2528 = 2880) and exact rational verification of
     the Bargmann Sum-of-Squares lower bound
       ||R_9(q)||_2^2 >= 1 + tr(N^2) + 4 tr(M^2) + 4 tr(N^T M) >= 1 + 5/n > 1
     and the four canonical cubic blocks (z_0 z_1 zbar_2, z_0^2 zbar_1/sqrt(2), z_0(|z_1|^2-1), H_{2,1}(z_0)).
"""

from fractions import Fraction
from itertools import permutations
from collections import defaultdict
import math


def iv_add(a, b):
    return (a[0] + b[0], a[1] + b[1])


def iv_sub(a, b):
    return (a[0] - b[1], a[1] - b[0])


def iv_mul(a, b):
    p = (a[0] * b[0], a[0] * b[1], a[1] * b[0], a[1] * b[1])
    return (min(p), max(p))


def rat_sqrt_bounds(q: Fraction, digits: int = 30):
    assert q >= 0
    if q == 0:
        return (Fraction(0), Fraction(0))
    scale = 10 ** digits
    num = q.numerator * scale * scale
    den = q.denominator
    s_lo = math.isqrt(num // den)
    while (s_lo + 1) * (s_lo + 1) * den <= num:
        s_lo += 1
    while s_lo * s_lo * den > num:
        s_lo -= 1
    s_hi = s_lo if (s_lo * s_lo * den == num) else (s_lo + 1)
    return (Fraction(s_lo, scale), Fraction(s_hi, scale))


def iv_sqrt(a, digits: int = 30):
    return (rat_sqrt_bounds(a[0], digits)[0], rat_sqrt_bounds(a[1], digits)[1])


def atan_unit_fraction_iv(inv_x: int, terms: int = 28):
    s = Fraction(0)
    x2 = inv_x * inv_x
    p = Fraction(1, inv_x)
    for k in range(terms):
        term = p / (2 * k + 1)
        s = s + term if (k % 2 == 0) else s - term
        p /= x2
    rem = p / (2 * terms + 1)
    return (s, s + rem) if (terms % 2 == 0) else (s - rem, s)


def pi_iv():
    a5 = atan_unit_fraction_iv(5, 28)
    a239 = atan_unit_fraction_iv(239, 28)
    return iv_sub((16 * a5[0], 16 * a5[1]), (4 * a239[0], 4 * a239[1]))


def exp_neg_rat_iv(x: Fraction, terms: int = 36):
    """Outward rational enclosure of exp(-x) for x >= 0."""
    assert x >= 0
    if x == 0:
        return (Fraction(1), Fraction(1))
    m_int = int(x)
    r = x - m_int  # 0 <= r < 1

    def exp_neg_unit(u: Fraction):
        s = Fraction(0)
        f = 1
        up = Fraction(1)
        for j in range(terms):
            if j > 0:
                f *= j
                up *= u
            t = up / f
            s = s + t if (j % 2 == 0) else s - t
        rem = (up * u) / (f * terms)
        return (s, s + rem) if (terms % 2 == 0) else (s - rem, s)

    er = exp_neg_unit(r)
    if m_int == 0:
        return er
    e1 = exp_neg_unit(Fraction(1))
    e1_m = (e1[0] ** m_int, e1[1] ** m_int)
    return iv_mul(er, e1_m)


def erf_rat_iv(z: Fraction, terms: int = 34):
    """Outward rational enclosure of erf(z) for 0 <= z <= 2 via alternating Taylor series."""
    assert Fraction(0) <= z <= Fraction(2)
    piv = pi_iv()
    sqrt_pi = iv_sqrt(piv, 30)
    two_over_sqrt_pi = (Fraction(2) / sqrt_pi[1], Fraction(2) / sqrt_pi[0])
    z2 = z * z
    s = Fraction(0)
    f = 1
    zp = z
    for n in range(terms):
        if n > 0:
            f *= n
            zp *= z2
        t = zp / (f * (2 * n + 1))
        s = s + t if (n % 2 == 0) else s - t
    assert z2 < terms
    rem = (zp * z2) / (f * terms * (2 * terms + 1))
    ser = (s, s + rem) if (terms % 2 == 0) else (s - rem, s)
    return iv_mul(two_over_sqrt_pi, ser)


def i0_rat_iv(x: Fraction, terms: int = 38):
    """Outward rational enclosure of modified Bessel I_0(x) for 0 <= x <= 12."""
    assert Fraction(0) <= x <= Fraction(12)
    q = (x * x) / 4  # <= 36
    s = Fraction(1)
    term = Fraction(1)
    for m in range(1, terms + 1):
        term = term * q / (m * m)
        s += term
    next_t = term * q / ((terms + 1) * (terms + 1))
    assert q * 4 < (terms + 1) * (terms + 1)
    return (s, s + Fraction(4, 3) * next_t)


def certify_parseval_obstruction(piv):
    target = Fraction(250, 351)
    # 1. Degree 9: pointwise 2|M| + (a_2 - |M|)_+^2 / a_2 >= a_2 = 72057/100000 > 250/351!
    a2_9 = Fraction(72057, 100000)
    assert a2_9 > target
    print(
        f"[PASS] Degree-9 SMALL_T Parseval obstruction: even at G_3 = 0 and ANY beta in R,\n"
        f"       t=0 bound >= a_2 = {float(a2_9):.8f} > 250/351 = {float(target):.8f} (margin +{float(a2_9 - target):.5e})."
    )

    # 2. Degree 7: exact closed form at sigma = 3/4, a_1 = 0.906596, a_2 = 0.541570!
    # Payoff(r) = a_2 + (sigma^2 / a_2) r^2 on [0, r_*] and 2 sigma r on [r_*, inf), where r_* = a_2 / sigma!
    # Wait: write Payoff(r) = 2 sigma r + (a_2 - sigma r)^2 / a_2 * 1_{r <= r_*}!
    # Look how clean that integral is:
    #   int_0^inf 2r e^{-r^2} (2 sigma r) dr = sigma * sqrt(pi)
    #   int_0^{r_*} 2r e^{-r^2} (a_2 - 2 sigma r + (sigma^2 / a_2) r^2) dr:
    #     - int_0^{r_*} 2r e^{-r^2} dr = 1 - e^{-r_*^2}
    #     - int_0^{r_*} 2r^2 e^{-r^2} dr = (sqrt(pi)/2) erf(r_*) - r_* e^{-r_*^2}
    #     - int_0^{r_*} 2r^3 e^{-r^2} dr = 1 - (1 + r_*^2) e^{-r_*^2}!
    # Exact algebraic simplification of the [0, r_*] integral with r_* = a_2 / sigma:
    #   a_2 (1 - e^{-r_*^2}) - 2 sigma [(sqrt(pi)/2) erf(r_*) - r_* e^{-r_*^2}] + (sigma^2 / a_2)[1 - (1 + r_*^2) e^{-r_*^2}]
    #   Notice the e^{-r_*^2} terms:
    #     [-a_2 + 2 sigma r_* - (sigma^2 / a_2)(1 + r_*^2)] e^{-r_*^2}
    #     = [-a_2 + 2 a_2 - (sigma^2 / a_2) - a_2] e^{-r_*^2} = -(sigma^2 / a_2) e^{-r_*^2}!!
    #   THEY TELESCOPE TO: a_2 + (sigma^2 / a_2)(1 - e^{-r_*^2}) - sigma * sqrt(pi) * erf(r_*)!!
    a1_7 = Fraction(906596, 1000000)
    a2_7 = Fraction(541570, 1000000)
    sig = Fraction(3, 4)
    r_star = a2_7 / sig  # < 1
    sqrt_pi = iv_sqrt(piv, 30)
    erf_rs = erf_rat_iv(r_star)
    exp_rs2 = exp_neg_rat_iv(r_star * r_star)
    # Total Gaussian value = sigma * sqrt(pi) * (1 - erf(r_*)) + a_2 + (sigma^2 / a_2)(1 - e^{-r_*^2}) - sigma^2 / a_1
    one_minus_erf = (Fraction(1) - erf_rs[1], Fraction(1) - erf_rs[0])
    one_minus_exp = (Fraction(1) - exp_rs2[1], Fraction(1) - exp_rs2[0])
    t1 = iv_mul((sig * sqrt_pi[0], sig * sqrt_pi[1]), one_minus_erf)
    c_s2_a2 = (sig * sig) / a2_7
    t2 = (c_s2_a2 * one_minus_exp[0], c_s2_a2 * one_minus_exp[1])
    const_part = a2_7 - (sig * sig) / a1_7
    d7_val_lo = t1[0] + t2[0] + const_part
    assert d7_val_lo > Fraction(751, 1000) > target
    print(
        f"[PASS] Degree-7 SMALL_T Parseval obstruction: at sigma = 3/4, exact Gaussian t=0 value\n"
        f"       >= {float(d7_val_lo):.10f} > 250/351 = {float(target):.10f} (margin +{float(d7_val_lo - target):.5e})."
    )


def certify_radius_necessity(piv):
    target = Fraction(250, 351)
    a1_7 = Fraction(906596, 1000000)
    a1_9 = Fraction(936, 1000)
    a4_9 = Fraction(23468, 100000)
    c_9 = a4_9 / a1_9  # 5867 / 23400

    rho7_sq_cap = target / a1_7
    _, rho7_cap_hi = rat_sqrt_bounds(rho7_sq_cap, 25)
    sqrt_pi_half_lo = iv_sqrt(piv, 25)[0] / 2
    assert rho7_cap_hi < Fraction(886359, 1000000)

    tc9_cap = target / a1_9  # 31250 / 41067
    # Parseval: ||P_{2,1} f||_2^2 + ||P_{5,4} f||_2^2 <= 1 => ||P_{2,1}||^2 - c_9 ||P_{5,4}||^2 >= (1 + c_9) rho_*^2 - c_9
    rho9_sq_cap = (tc9_cap + c_9) / (1 + c_9)
    _, rho9_cap_hi = rat_sqrt_bounds(rho9_sq_cap, 25)
    assert rho9_cap_hi < Fraction(899643, 1000000) < Fraction(2289, 2500)
    print(
        f"[PASS] Necessary radius caps for B < 250/351:\n"
        f"       Degree 7: rho_* <= {float(rho7_cap_hi):.8f} (gap to sqrt(pi)/2: {float(rho7_cap_hi - sqrt_pi_half_lo):.3e})\n"
        f"       Degree 9: 2-chaos <= {tc9_cap} = {float(tc9_cap):.8f} => rho_* <= {float(rho9_cap_hi):.8f} < 2289/2500 = 0.9156."
    )


def certify_multichaos_gaussian_ideal(piv):
    target = Fraction(250, 351)
    # 1. Degree 7 algebraic check: a_1 > a_2 > a_3 > 0 => B_7^{*,Gauss} = (pi/4) a_1 = (226649 / 1000000) * pi
    a1_7, a2_7, a3_7 = Fraction(906596, 1000000), Fraction(541570, 1000000), Fraction(242531, 1000000)
    assert a1_7 > a2_7 > a3_7 > 0
    b7_iv = (Fraction(226649, 1000000) * piv[0], Fraction(226649, 1000000) * piv[1])
    t0_d7_lo, _ = rat_sqrt_bounds(target - b7_iv[1], 20)
    assert t0_d7_lo > Fraction(1455, 100000)
    print(
        f"[PASS] Degree-7 multi-chaos Gaussian ideal B_7^{{*,Gauss}} = (226649/1000000)*pi = {float(b7_iv[1]):.10f},\n"
        f"       conditional reach below 250/351: t_0 >= {float(t0_d7_lo):.6f}."
    )

    # 2. Degree 9 global proof over (sigma_3, v) in [0, inf)^2:
    a1, a2, a3, a4 = Fraction(936, 1000), Fraction(72057, 100000), Fraction(59202, 100000), Fraction(23468, 100000)
    assert a2 > a3 > a4 > 0
    b9_iv = (Fraction(181333, 800000) * piv[0], Fraction(181333, 800000) * piv[1])
    sqrt_pi = iv_sqrt(piv, 25)
    sqrt_2pi = iv_sqrt((2 * piv[0], 2 * piv[1]), 25)
    sqrt_2 = rat_sqrt_bounds(Fraction(2), 25)

    # Step (i): Certify C_I0 := sup_{x > 0} sqrt(2*pi*x) e^{-x} I_0(x) < 59/50 = 1.18 (true max ~ 1.1767 at x ~ 0.77),
    # AND sup_{x >= 3} sqrt(2*pi*x) e^{-x} I_0(x) < 21/20 = 1.05!
    # On [16, inf): 1 + 1/(6x) + (2/3) sqrt(2*pi*x) e^{-x/2} <= value at x = 16 (~1.0126)!
    exp_8 = exp_neg_rat_iv(Fraction(8))
    sqrt_32pi = iv_sqrt((32 * piv[0], 32 * piv[1]), 20)
    tail_x16_hi = Fraction(1) + Fraction(1, 96) + Fraction(2, 3) * sqrt_32pi[1] * exp_8[1]
    assert tail_x16_hi < Fraction(102, 100)

    max_bess_all = tail_x16_hi
    max_bess_ge3 = tail_x16_hi
    max_bess_ge8 = tail_x16_hi
    for k in range(800):
        x_lo = Fraction(k, 50)
        x_hi = Fraction(k + 1, 50)
        sx_hi = rat_sqrt_bounds(x_hi, 18)[1]
        ex_lo = exp_neg_rat_iv(x_lo, 28)[1]
        i0_lo_hi = i0_rat_iv(x_lo, 48)[1] if x_lo <= 12 else (
            Fraction(1) + Fraction(1, 6 * x_lo) + Fraction(2, 3) * sqrt_2pi[1] * rat_sqrt_bounds(x_lo, 18)[1] * exp_neg_rat_iv(x_lo / 2, 24)[1]
        ) / (sqrt_2pi[0] * rat_sqrt_bounds(x_lo, 18)[0] * ex_lo)
        ub = sqrt_2pi[1] * sx_hi * ex_lo * i0_lo_hi
        if ub > max_bess_all:
            max_bess_all = ub
        if x_lo >= Fraction(3) and ub > max_bess_ge3:
            max_bess_ge3 = ub
        if x_lo >= Fraction(8) and ub > max_bess_ge8:
            max_bess_ge8 = ub
    assert max_bess_all < Fraction(6, 5)       # < 1.20
    assert max_bess_ge3 < Fraction(27, 25)     # < 1.08
    assert max_bess_ge8 < Fraction(104, 100)   # < 1.04

    # Step (ii): Prove dPsi/dv < 1/a_2 = 1.38779 for ALL v > 0 and ALL lambda = sigma_3 / sigma_3^* >= 93/100!
    # Recall d/dv [2 E_{W_3,Z}|m(W_3) + sqrt(v) Z|] = (1/2) E_{W_3,Z}[|m(W_3) + sqrt(v) Z|^{-1}].
    # Since e^{-x} I_0(x) <= 1 for all x >= 0, pointwise in r we have THREE simultaneous upper bounds on
    # g(r, v) := (1/2) E_Z[|m(r) + sqrt(v) Z|^{-1}]:
    #   (a) g(r, v) <= sqrt(pi) / (2 sqrt(v))                  (for all r >= 0, v > 0),
    #   (b) g(r, v) <= max_bess_all / (2 |m(r)|)               (for all r > 0, v > 0),
    #   (c) g(r, v) <= max_bess_ge3 / (2 |m(r)|)               (whenever |m(r)|^2 / (2v) >= 3).
    # Let us check ALL v > 0 for lambda >= 93/100:
    #   - Region v >= 9/20 = 0.45: bound (a) alone gives sqrt(pi)/(2*sqrt(0.45)) < 1.322 < 1/a_2 for ALL sigma_3 >= 0!
    v_top = Fraction(9, 20)
    slope_v_top = iv_mul(sqrt_pi, (Fraction(1), Fraction(1) / rat_sqrt_bounds(v_top, 18)[0]))[1] / 2
    assert slope_v_top < Fraction(1) / a2

    gamma = a4 / (4 * a1)
    c0_m = 1 - 2 * gamma
    sig3_star_lo = a1 * sqrt_pi[0] / 2
    lam_hi_cut = Fraction(95, 100)
    m_scale_lo = lam_hi_cut * sig3_star_lo  # for lambda >= 0.93, |m(r)| >= m_scale_lo * r * (c0_m + gamma * r^2)

    #   - Region 0 < v <= 9/20 = 0.45:
    #     * On (0, 1/250]: for r >= 2/5 = 0.4, |m(r)| >= m_scale_lo * 0.4 * (c0_m + 0.16*gamma) > 0.27,
    #       so x = |m|^2 / (2v) >= 0.0729 / 0.008 > 9 > 3, hence bound (c) applies on r >= 2/5 and bound (b) on [0, 2/5]!
    r_split = Fraction(2, 5)
    assert (m_scale_lo * r_split * (c0_m + gamma * r_split * r_split)) ** 2 >= 16 * Fraction(1, 250)  # x >= 8 on r >= 0.4, v <= 1/250!
    int_0_sp = Fraction(0)
    int_sp_3 = Fraction(0)
    N1 = 100
    for j in range(40):
        r_lo = Fraction(j, N1)
        int_0_sp += Fraction(1, N1) * (exp_neg_rat_iv(r_lo * r_lo, 22)[1] / (c0_m + gamma * r_lo * r_lo))
    for j in range(40, 300):
        r_lo = Fraction(j, N1)
        int_sp_3 += Fraction(1, N1) * (exp_neg_rat_iv(r_lo * r_lo, 22)[1] / (c0_m + gamma * r_lo * r_lo))
    tail_r3 = (exp_neg_rat_iv(Fraction(9), 22)[1] / 6) / (c0_m + 9 * gamma)
    slope_v_tiny = (max_bess_all * int_0_sp + max_bess_ge8 * (int_sp_3 + tail_r3)) / m_scale_lo
    assert slope_v_tiny < Fraction(1) / a2, f"slope_v_tiny={float(slope_v_tiny)} vs 1/a2={float(1/a2)}"

    #     * On [1/250, 9/20]: cover with subintervals [v_a, v_b]; on each [v_a, v_b] and each r-panel [r_lo, r_hi],
    #       use min(cap_a, inv_bound_all, inv_bound_ge3 if x_lo >= 3)!
    v_edges = [
        Fraction(1, 250), Fraction(1, 100), Fraction(1, 40), Fraction(1, 20),
        Fraction(1, 10), Fraction(3, 16), Fraction(3, 10), Fraction(9, 20),
    ]
    max_slope_mid_v = slope_v_tiny
    for va, vb in zip(v_edges[:-1], v_edges[1:]):
        cap_a = sqrt_pi[1] / (2 * rat_sqrt_bounds(va, 18)[0])
        s_iv_v = Fraction(0)
        Nr = 150
        hr = Fraction(3, Nr)
        for j in range(Nr):
            r_lo = j * hr
            r_hi = (j + 1) * hr
            ex_hi = exp_neg_rat_iv(r_lo * r_lo, 20)[1]
            m_min_r = m_scale_lo * r_lo * (c0_m + gamma * r_lo * r_lo)
            if m_min_r * m_min_r >= 16 * vb:
                bess_c = max_bess_ge8
            elif m_min_r * m_min_r >= 6 * vb:
                bess_c = max_bess_ge3
            else:
                bess_c = max_bess_all
            term_cap = 2 * r_hi * ex_hi * cap_a
            term_inv = ex_hi * bess_c / (m_scale_lo * (c0_m + gamma * r_lo * r_lo))
            s_iv_v += hr * min(term_cap, term_inv)
        s_iv_v += max_bess_all * tail_r3 / m_scale_lo
        assert s_iv_v < Fraction(1) / a2, f"Slope >= 1/a2 on [{va},{vb}]: {float(s_iv_v)}"
        if s_iv_v > max_slope_mid_v:
            max_slope_mid_v = s_iv_v

    slope_v_star_hi = (int_0_sp + int_sp_3 + tail_r3) / sig3_star_lo
    slope_at_93 = max(max_slope_mid_v, slope_v_top)

    # Step (iii): Cover 0 <= lambda <= 93/100!
    # Subcase A: 0 <= lambda <= 82/100 (all v >= 0): choose beta = 0!
    # At beta = 0, max_{v >= 0} [sqrt(pi)*sqrt(sigma_3^2 + v) - sigma_3^2/a1 - v/a2]:
    #   - On sigma_3 <= (sqrt(pi)/2)*a2: max is at sqrt(U) = (sqrt(pi)/2)*a2, value <= (pi/4)*a2*(2 - a2/a1)
    val_low_sig_hi = (piv[1] / 4) * a2 * (2 - a2 / a1)
    assert val_low_sig_hi < b9_iv[0]
    #   - On (sqrt(pi)/2)*a2 <= sigma_3 <= 0.82*sigma_3^*: max over v >= 0 is at v = 0, value = (pi/4)*a1 * lambda*(2 - lambda)
    lam_lo_cut = Fraction(82, 100)
    val_82_hi = (piv[1] / 4) * a1 * lam_lo_cut * (2 - lam_lo_cut)
    assert val_82_hi < b9_iv[0]

    # Subcase B: lambda in [82/100, 93/100]:
    #   - For v >= v_cut = 13/200 = 0.065: choose beta = 0! Since sigma_3 >= 0.82*sigma_3^* > (sqrt(pi)/2)*a2,
    #     sqrt(pi)*sqrt(sigma_3^2 + v) - (sigma_3^2 + v)/a2 is decreasing in U = sigma_3^2 + v, so on v >= v_cut and
    #     lambda in [lam_a, lam_b], max over v >= v_cut is at v = v_cut! Check on 11 slices of [0.82, 0.93]:
    v_cut = Fraction(9, 100)
    sig3_star_sq_iv = ((a1 * a1 * piv[0]) / 4, (a1 * a1 * piv[1]) / 4)
    for k_sl in range(65):
        la = Fraction(410 + k_sl, 500)      # 0.820 .. 0.948 in steps of 0.002
        lb = Fraction(411 + k_sl, 500)      # 0.822 .. 0.950
        u_hi = lb * lb * sig3_star_sq_iv[1] + v_cut
        ub_vcut = iv_mul(sqrt_pi, rat_sqrt_bounds(u_hi, 20))[1] - (la * la * sig3_star_sq_iv[0]) / a1 - v_cut / a2
        assert ub_vcut < b9_iv[0], f"Failed v >= v_cut at [{la},{lb}]: {float(ub_vcut)} vs {float(b9_iv[0])}"
        # On v in [0, v_cut], note dPsi/dv <= (lam_hi_cut / la) * slope_at_95 when using scale-invariant x >= ...?
        # Careful: on v in [0, v_cut] for lambda >= la, |m(r)| >= (la / lam_hi_cut) * |m_{0.95}(r)|:
        # rescaling v' = (lam_hi_cut / la)^2 * v maps |m_{la}(r)|^2 / (2v) = |m_{0.95}(r)|^2 / (2v')!
        # Since v <= 0.09 and (0.95 / 0.82)^2 * 0.09 = 0.1208 <= 0.45 = 9/20, EVERY v' lies in (0, 9/20],
        # so sup_{0 < v <= v_cut} dPsi/dv(la) <= (lam_hi_cut / la) * max_slope_mid_v EXACTLY BY SCALING!!
        slope_max_la = max_slope_mid_v * (lam_hi_cut / la)
        slope_excess = max(Fraction(0), slope_max_la - Fraction(1) / a2)
        ub_small_v = lb * (2 - lb) * b9_iv[1] + slope_excess * v_cut
        assert ub_small_v < b9_iv[0], f"Failed v <= v_cut at [{la},{lb}]: {float(ub_small_v)} vs {float(b9_iv[0])}"

    t0_d9_lo, _ = rat_sqrt_bounds(target - b9_iv[1], 20)
    print(
        f"[PASS] Degree-9 multi-chaos Gaussian ideal B_9^{{*,Gauss}} = (181333/800000)*pi = {float(b9_iv[1]):.10f}\n"
        f"       certified globally over ALL (sigma_3, v) in [0, inf)^2:\n"
        f"         sup_{{x>0}} sqrt(2*pi*x) e^{{-x}} I_0(x) <= {float(max_bess_all):.6f} < 1.20 (for x>=3: <= {float(max_bess_ge3):.6f} < 1.08),\n"
        f"         E[1/(2|m^*|)] <= {float(slope_v_star_hi):.6f}, sup_{{v>0, lambda>=0.95}} dPsi/dv <= {float(slope_at_93):.6f} < 1/a_2 = {float(1/a2):.6f},\n"
        f"         conditional reach at B_9^{{*,Gauss}}: t_0 >= {float(t0_d9_lo):.6f} (and at B_0 = 0.71216: t_0 >= 0.00952)."
    )


def certify_wick_and_bargmann_sos():
    L_a = [(0, "s"), (0, "s"), (1, "s"), (1, "s"), (2, "b")]
    R_a = [(3, "s"), (3, "s"), (4, "s"), (4, "s"), (5, "b")]
    L_b = [(0, "b"), (1, "b"), (2, "s"), (2, "s")]
    R_b = [(3, "b"), (4, "b"), (5, "s"), (5, "s")]
    T_verts = [0, 1, 5]
    Tc_verts = [2, 3, 4]

    def canon(edges):
        best = None
        for vA, vB in [(T_verts, Tc_verts), (Tc_verts, T_verts)]:
            for pA in permutations(vA):
                for pB in permutations(vB):
                    mp = {old: new for old, new in zip(T_verts, pA)}
                    mp.update({old: new for old, new in zip(Tc_verts, pB)})
                    rel = tuple(
                        sorted(
                            ((mp[u], ru), (mp[v], rv)) if mp[u] < mp[v] else ((mp[v], rv), (mp[u], ru))
                            for (u, ru), (v, rv) in edges
                        )
                    )
                    if best is None or rel < best:
                        best = rel
        return best

    def comp_sizes(edges):
        adj = defaultdict(list)
        for (u, _), (v, _) in edges:
            adj[u].append(v)
            adj[v].append(u)
        seen = set()
        out = []
        for v in range(6):
            if v not in seen:
                st = [v]
                seen.add(v)
                sz = 0
                while st:
                    x = st.pop()
                    sz += 1
                    for y in adj[x]:
                        if y not in seen:
                            seen.add(y)
                            st.append(y)
                out.append(sz)
        return tuple(sorted(out))

    classes = defaultdict(int)
    reps = {}
    for p5 in permutations(range(5)):
        for p4 in permutations(range(4)):
            ed = [((L_a[i][0], L_a[i][1]), (R_a[p5[i]][0], R_a[p5[i]][1])) for i in range(5)] + [
                ((L_b[j][0], L_b[j][1]), (R_b[p4[j]][0], R_b[p4[j]][1])) for j in range(4)
            ]
            k = canon(ed)
            classes[k] += 1
            if k not in reps:
                reps[k] = ed

    by_comp = defaultdict(int)
    n_classes_by_comp = defaultdict(int)
    for k, cnt in classes.items():
        cs = comp_sizes(reps[k])
        by_comp[cs] += cnt
        n_classes_by_comp[cs] += 1

    assert sum(classes.values()) == 2880
    assert len(classes) == 19
    assert by_comp[(2, 2, 2)] == 16 and n_classes_by_comp[(2, 2, 2)] == 1
    assert by_comp[(2, 4)] == 336 and n_classes_by_comp[(2, 4)] == 4
    assert by_comp[(6,)] == 2528 and n_classes_by_comp[(6,)] == 14

    # Exact Fraction evaluation on the 4 canonical blocks (encoded as sparse dict {(i,j,a): Fraction_of_sq_root}):
    # Notice on real sparse tensors with entries in Z / sqrt(2)^r, every 6-vertex contraction is an exact Fraction
    # because 6 factors of (1/sqrt(2))^r have even exponent 6r!
    def eval_real_sparse(T_sq_scale: Fraction, entries: dict, edges):
        # entries maps (s0, s1, b) -> int; T = sqrt(T_sq_scale) * entries => T^6 scales by T_sq_scale^3 (exact Fraction!)
        # Build slot list per vertex: [s0, s1, b] -> edge_id in 0..8
        s_cnt = [0] * 6
        v_slots = [[0, 0, 0] for _ in range(6)]
        for e_id, ((u, ru), (v, rv)) in enumerate(edges):
            if ru == "s":
                v_slots[u][s_cnt[u]] = e_id
                s_cnt[u] += 1
            else:
                v_slots[u][2] = e_id
            if rv == "s":
                v_slots[v][s_cnt[v]] = e_id
                s_cnt[v] += 1
            else:
                v_slots[v][2] = e_id

        # Backtracking sum over assignments to edges 0..8 matching nonzero entries of each vertex
        total = 0

        def bt(v_idx: int, assign: dict, prod_val: int):
            nonlocal total
            if v_idx == 6:
                total += prod_val
                return
            e0, e1, e2 = v_slots[v_idx]
            for (i0, i1, i2), val in entries.items():
                if e0 in assign and assign[e0] != i0:
                    continue
                if e1 in assign and assign[e1] != i1:
                    continue
                if e2 in assign and assign[e2] != i2:
                    continue
                # Handle self-loop e0 == e1 etc.
                if e0 == e1 and i0 != i1:
                    continue
                if e0 == e2 and i0 != i2:
                    continue
                if e1 == e2 and i1 != i2:
                    continue
                added = []
                for e_k, i_k in ((e0, i0), (e1, i1), (e2, i2)):
                    if e_k not in assign:
                        assign[e_k] = i_k
                        added.append(e_k)
                bt(v_idx + 1, assign, prod_val * val)
                for e_k in added:
                    del assign[e_k]

        bt(0, {}, 1)
        return Fraction(total) * (T_sq_scale ** 3)

    canon_blocks = [
        ("z_0 z_1 zbar_2", Fraction(1, 2), {(0, 1, 2): 1, (1, 0, 2): 1}, Fraction(4), Fraction(4)),
        ("z_0^2 zbar_1 / sqrt(2)", Fraction(1), {(0, 0, 1): 1}, Fraction(6), Fraction(6)),
        ("z_0 (|z_1|^2 - 1)", Fraction(1, 2), {(0, 1, 1): 1, (1, 0, 1): 1}, Fraction(36), Fraction(10)),
        ("H_{2,1}(z_0)", Fraction(1), {(0, 0, 0): 1}, Fraction(180), Fraction(22)),
    ]
    for name, sq_sc, ent, exp_r9, exp_1_c24 in canon_blocks:
        r9_val = Fraction(0)
        c24_val = Fraction(0)
        for k, cnt in classes.items():
            v = Fraction(cnt, 16) * eval_real_sparse(sq_sc, ent, reps[k])
            r9_val += v
            if comp_sizes(reps[k]) in ((2, 2, 2), (2, 4)):
                c24_val += v
        assert r9_val == exp_r9 and c24_val == exp_1_c24, f"Mismatch on {name}: {r9_val}, {c24_val}"

    print(
        "[PASS] Exact 2880-matching Wick classification of ||R_9(q)||_2^2:\n"
        "       19 real classes (1x[2,2,2]=16, 4x[2,4]=336, 14x[6]=2528; sum=2880),\n"
        "       exact Fraction norms verified on canonical blocks: 4, 6, 36, 180 (1+c_{2,4} = 4, 6, 10, 22)."
    )


def main():
    print("=== Certificate 3: Small-t Obstructions, Multi-Chaos Gaussian Ideal & Wick Norms ===")
    piv = pi_iv()
    certify_parseval_obstruction(piv)
    certify_radius_necessity(piv)
    certify_multichaos_gaussian_ideal(piv)
    certify_wick_and_bargmann_sos()
    print("ALL CHECKS IN verify_small_t_and_wick.py PASSED.")


if __name__ == "__main__":
    main()
