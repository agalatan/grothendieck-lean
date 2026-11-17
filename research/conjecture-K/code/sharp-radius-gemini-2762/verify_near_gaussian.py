#!/usr/bin/env python3
"""Exact pure-stdlib verifier of the explicit near-Gaussian cone on H_{2,1}(C^n) and real H_3(R^n).

Usage:  python3 -I verify_near_gaussian.py [--quiet]

Only the Python standard library is used (fractions, math, sys).  Zero floating-point operations
occur anywhere in this file (`float` is never called); every root, power, integral cell, polynomial
discriminant, and interval maximum is certified in exact arbitrary-precision integers and Fractions,
using `-O`-safe `require(...)` checks throughout.

============================================================================================
WHAT THIS SCRIPT CERTIFIES (Theorem 1 of sharp-radius-2026-11-17-gemini-2762/PROOF.md;
makes STATUS.md rows 3.18 and 3.21 (e1) unconditionally explicit):

1. Hermite-Gaussian kernel bounds on [0, oo):
   For h_4(s) = (s^2 - 6s + 3) exp(-s/2) and h_4'(s) = -(1/2)(s^2 - 10s + 15) exp(-s/2),
   using exp(s/2) >= sum_{j=0}^m (s/2)^j / j! on s >= 0:
     3*(1 + s/2 + s^2/8 + s^3/48) - (s^2 - 6s + 3) = s*(s^2/16 - 5s/8 + 15/2) >= 0   (disc = -95/64 < 0)
     3*(1 + s/2 + s^2/8)          + (s^2 - 6s + 3) = 11s^2/8 - 9s/2 + 6       >  0   (disc = -51/4  < 0)
     15*(1 + s/2 + s^2/8)         - (s^2 - 10s+15) = s*(7s/8 + 35/2)          >= 0
     15*(1)                       + (s^2 - 10s+15) = (s - 5)^2 + 5            >  0.
   Hence |h_4(s)| <= 3 and |h_4'(s)| <= 15/2 for all s >= 0, so for all s >= 0:
     |h_4(s) - 3| <= min(6, (15/2) s) <= sqrt(6 * (15/2) * s) = 3*sqrt(5)*sqrt(s).

2. Exact Gaussian scale-mixture envelopes |g_{k,l}(x)| <= A_{k,l} + B_{k,l} |x| on all of R:
   In the reviewed two-step third-chaos cumulant-remainder identity (edgeworth-codex-a7c4/PROOF.md
   eq. (9); cumulant-remainder-codex-a7c4/PROOF.md & verify.py), for h(x) = |x| (c = sqrt(2/pi)),
   the normal Stein derivative admits the elementary identity
     phi'_{|x|}(x) = -(c/2) int_0^1 (1 - w)^{-1/2} exp(-w x^2 / (2(1 - w))) dw,
   which collapses every two-step function g_{k,l}(x) = (A_{l/3} A_{k/3} psi)(x)
   (k in {2, 4}, l in {0, 2, 4, 6, 8}) to the single monotone-kernel integral on theta in (0, 1):
     g_{k,l}(x) = -(c/2) int_0^1 W_{k/3, l/3}(theta) theta^2 [ (1-theta)^{-5/2} h_4(theta x^2/(1-theta)) - 3 ] d(theta),
   where W_{a,b}(theta) = ((theta^{-(b+4)/2}-1)/(b+4) - (theta^{-(a+2)/2}-1)/(a+2)) / (b+2-a) > 0
   is strictly decreasing on (0, 1).
   Splitting (0, 1) into (0, theta_eps], exact rational Riemann cells [theta_i, theta_{i+1}], and
   [1 - t_eps, 1) yields exact rational upper bounds A_{k,l}, B_{k,l} (with B_{k,l} = 0 for l <= 4).

3. Exact whole-interval Bernstein certification of R_* <= 86/25 = 3.44:
   Plugging A_{k,l}, B_{k,l} into the reviewed contraction table of cumulant-remainder-codex-a7c4/verify.py
   on kappa_4(F) <= 1/100 (where ||F||_4 <= (3 + 1/100)^{1/4} <= 33/25 and y = C/A in [0, sqrt(3/4)] subset [0, 7/8],
   with sqrt(1 + y^2) <= 1 + y^2/2) bounds |R_{|x|}(F)| <= P_5(y) / (27 * (1/2 + y^2)^{3/2}) * kappa_4(F)^{3/2}.
   Clearing the positive square root reduces P_5(y) / (27 * (1/2 + y^2)^{3/2}) < R_cap to positivity of the
   degree-10 rational polynomial Q_{10}(y) := (27 * R_cap)^2 * (1/2 + y^2)^3 - P_5(y)^2 > 0 on y in [0, 7/8],
   certified unconditionally by exact integer Bernstein coefficients.

4. Unconditional rational thresholds:
   - Real third chaos H_3(R^n) (STATUS.md 3.21 (e1)):
       kappa_0 = 1/49000 :  0 < kappa_4(F) <= kappa_0  ==>  E|F| <= sqrt(2/pi) * ||F||_2 * (1 - kappa_4(F)/48)
       kappa_1 = 1/12250 :  0 < kappa_4(F) <= kappa_1  ==>  E|F| <  sqrt(2/pi) * ||F||_2.
   - Complex cubic chaos H_{2,1}(C^n) (STATUS.md 3.18):
       chi_0   = 1/72000 :  0 < chi(q) <= chi_0        ==>  E|q| <= (sqrt(pi)/2) * ||q||_2 * (1 - chi(q)/32)
                            (hence buffered PVD and exact remote K at every profile, price, and amplitude)
       chi_1   = 1/18000 :  0 < chi(q) <= chi_1        ==>  E|q| <  (sqrt(pi)/2) * ||q||_2.
============================================================================================
"""
import sys
from fractions import Fraction as Fr
from math import comb, gcd


def require(cond, msg='verification condition failed'):
    if not cond:
        raise ValueError(msg)


def dec_ceil10(q):
    q = Fr(q)
    require(q >= 0, 'dec_ceil10 expects nonnegative Fraction')
    n = (q.numerator * 10**10 + q.denominator - 1) // q.denominator
    return '%d.%010d' % (n // 10**10, n % 10**10)


def dec_floor10(q):
    q = Fr(q)
    require(q >= 0, 'dec_floor10 expects nonnegative Fraction')
    n = (q.numerator * 10**10) // q.denominator
    return '%d.%010d' % (n // 10**10, n % 10**10)


D_CELL = 10**9


def ceil_rat(q, D=D_CELL):
    m = (q.numerator * D + q.denominator - 1) // q.denominator
    ub = Fr(m, D)
    require(ub >= q, 'ceil_rat failed')
    return ub


def floor_rat(q, D=D_CELL):
    m = (q.numerator * D) // q.denominator
    lb = Fr(m, D)
    require(lb <= q, 'floor_rat failed')
    return lb


def int_nth_root_floor(n, d):
    """Exact largest integer m >= 0 with m^d <= n (pure integer binary search, zero floats)."""
    require(isinstance(n, int) and isinstance(d, int) and d >= 1, 'bad root args')
    if n <= 0:
        return 0
    hi = 1 << ((n.bit_length() + d - 1) // d)
    lo = 0
    while lo < hi:
        mid = (lo + hi + 1) // 2
        if mid ** d <= n:
            lo = mid
        else:
            hi = mid - 1
    require(lo ** d <= n < (lo + 1) ** d, 'int_nth_root_floor invariant failed')
    return lo


def rat_pow_ub(q, p_num, p_den, prec=10**8):
    """Exact outward upper bound ub >= q^(p_num / p_den) for q >= 0."""
    require(q >= 0 and p_num >= 0 and p_den >= 1, 'bad rat_pow_ub args')
    if p_num == 0:
        return Fr(1)
    if q == 0:
        return Fr(0)
    num_int = (q.numerator ** p_num) * (prec ** p_den)
    den_pow = q.denominator ** p_num
    q_ceil = (num_int + den_pow - 1) // den_pow
    m = int_nth_root_floor(q_ceil - 1, p_den) + 1 if q_ceil > 0 else 1
    ub = Fr(m, prec)
    require((ub ** p_den) >= (q ** p_num), 'rat_pow_ub verification failed')
    return ub


def rat_pow_lb(q, p_num, p_den, prec=10**8):
    """Exact inward lower bound 0 <= lb <= q^(p_num / p_den) for q >= 0."""
    require(q >= 0 and p_num >= 0 and p_den >= 1, 'bad rat_pow_lb args')
    if p_num == 0:
        return Fr(1)
    if q == 0:
        return Fr(0)
    num_int = (q.numerator ** p_num) * (prec ** p_den)
    den_pow = q.denominator ** p_num
    m = int_nth_root_floor(num_int // den_pow, p_den)
    lb = Fr(m, prec)
    require(lb >= 0 and (lb ** p_den) <= (q ** p_num), 'rat_pow_lb verification failed')
    return lb


# ------------------------------------------------------------------ polynomial arithmetic & exact Bernstein check
def padd(a, b):
    n = max(len(a), len(b))
    out = [(a[i] if i < len(a) else Fr(0)) + (b[i] if i < len(b) else Fr(0)) for i in range(n)]
    while out and out[-1] == 0:
        out.pop()
    return out


def psub(a, b):
    return padd(a, [-x for x in b])


def pmul(a, b):
    if not a or not b:
        return []
    out = [Fr(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                out[i + j] += x * y
    while out and out[-1] == 0:
        out.pop()
    return out


def pshift_scale(p, a, w):
    """p(y) -> p(a + w * t)."""
    res = []
    lin = [Fr(a), Fr(w)]
    for c in reversed(p):
        res = padd(pmul(res, lin), [c])
    return res


def bernstein_positive_on_segment(p, a, b, max_depth=32):
    """Exact integer Bernstein + de Casteljau check that p(y) > 0 for all y in [a, b]."""
    q = pshift_scale(p, a, b - a)
    require(bool(q), 'zero polynomial in bernstein check')
    n = len(q) - 1
    den = 1
    for x in q:
        den = den * x.denominator // gcd(den, x.denominator)
    A = [int(x * den) for x in q]
    M = 1
    for j in range(n + 1):
        M = M * comb(n, j) // gcd(M, comb(n, j))
    bern = [sum(comb(i, j) * (M // comb(n, j)) * A[j] for j in range(i + 1)) for i in range(n + 1)]
    stack = [(bern, 0)]
    leaves = 0
    while stack:
        bv, depth = stack.pop()
        if min(bv) > 0:
            leaves += 1
            continue
        if bv[0] <= 0 or bv[-1] <= 0 or depth >= max_depth:
            return False, leaves
        tri = [bv]
        for _ in range(n):
            prev = tri[-1]
            tri.append([prev[i] + prev[i + 1] for i in range(len(prev) - 1)])
        left = [tri[k][0] << (n - k) for k in range(n + 1)]
        right = [tri[n - j][j] << j for j in range(n + 1)]
        stack.append((left, depth + 1))
        stack.append((right, depth + 1))
    return True, leaves


def verify_all(quiet=False):
    # --- Step 1: Exact polynomial proofs of |h_4(s)| <= 3 and |h_4'(s)| <= 15/2 on [0, oo) ---
    # 1a) 3*(1 + s/2 + s^2/8 + s^3/48) - (s^2 - 6s + 3) == s * (15/2 - 5s/8 + s^2/16)
    e3 = [Fr(1), Fr(1, 2), Fr(1, 8), Fr(1, 48)]
    e2 = [Fr(1), Fr(1, 2), Fr(1, 8)]
    h4_poly = [Fr(3), Fr(-6), Fr(1)]
    h4d_poly = [Fr(15), Fr(-10), Fr(1)]  # s^2 - 10s + 15, since h_4'(s) = -(1/2)*h4d_poly(s)*exp(-s/2)

    rem_hi = psub([3 * c for c in e3], h4_poly)
    require(rem_hi == [Fr(0), Fr(15, 2), Fr(-5, 8), Fr(1, 16)], 'h4 upper polynomial mismatch')
    disc_hi = Fr(-5, 8) ** 2 - 4 * Fr(1, 16) * Fr(15, 2)
    require(disc_hi == Fr(-95, 64) and disc_hi < 0, 'h4 upper discriminant failed')

    rem_lo = padd([3 * c for c in e2], h4_poly)
    require(rem_lo == [Fr(6), Fr(-9, 2), Fr(11, 8)], 'h4 lower polynomial mismatch')
    disc_lo = Fr(-9, 2) ** 2 - 4 * Fr(11, 8) * Fr(6)
    require(disc_lo == Fr(-51, 4) and disc_lo < 0, 'h4 lower discriminant failed')

    rem_d_lo = psub([15 * c for c in e2], h4d_poly)
    require(rem_d_lo == [Fr(0), Fr(35, 2), Fr(7, 8)], 'h4 deriv lower polynomial mismatch')
    rem_d_hi = padd([Fr(15)], h4d_poly)
    require(rem_d_hi == [Fr(30), Fr(-10), Fr(1)], 'h4 deriv upper polynomial mismatch')
    disc_d_hi = Fr(-10) ** 2 - 4 * Fr(1) * Fr(30)
    require(disc_d_hi == Fr(-20) and disc_d_hi < 0, 'h4 deriv upper discriminant failed')

    # Verify 6 * (15/2) == 45 == (3 * sqrt(5))^2
    require(Fr(6) * Fr(15, 2) == Fr(45) and Fr(9) * Fr(5) == Fr(45), 'geometric mean constant mismatch')

    # --- Step 2: Machin rational interval for pi and c = sqrt(2/pi) ---
    def atan_bounds(x):
        require(Fr(0) < x < Fr(1), 'atan_bounds domain')
        lo = sum(Fr((-1) ** j) * (x ** (2 * j + 1)) / (2 * j + 1) for j in range(12))
        hi = lo + (x ** 25) / 25
        require(lo < hi, 'atan_bounds order')
        return lo, hi

    lo5, hi5 = atan_bounds(Fr(1, 5))
    lo239, hi239 = atan_bounds(Fr(1, 239))
    pi_lo = floor_rat(16 * lo5 - 4 * hi239, 10**10)
    pi_hi = ceil_rat(16 * hi5 - 4 * lo239, 10**10)
    require(Fr(3141592653, 10**9) < pi_lo < pi_hi < Fr(3141592654, 10**9), 'pi enclosure sanity check')

    c_lo = rat_pow_lb(Fr(2) / pi_hi, 1, 2, prec=10**9)
    c_hi = rat_pow_ub(Fr(2) / pi_lo, 1, 2, prec=10**9)
    sqrt5_hi = rat_pow_ub(Fr(5), 1, 2, prec=10**9)
    require(c_lo < c_hi, 'c enclosure order')

    # --- Step 3: Exact rational cell bounds A_{k,l}, B_{k,l} for all 10 (k, l) ---
    def W_ub_at(th, k, l):
        al, be = Fr(k, 3), Fr(l, 3)
        d = be + 2 - al
        require(d > 0, 'beta + 2 - alpha must be positive')
        inv_th = Fr(1) / th
        term_be = (rat_pow_ub(inv_th, l + 12, 6) - 1) / (be + 4)
        term_al = (rat_pow_lb(inv_th, k + 6, 6) - 1) / (al + 2)
        val = (term_be - term_al) / d
        require(val > 0, 'W_ub_at must be positive')
        return ceil_rat(val)

    knots = [Fr(1, 65536)]
    while knots[-1] < Fr(1, 16):
        step = knots[-1] / 4
        target_oct = knots[-1] * 2
        while knots[-1] < target_oct:
            knots.append(knots[-1] + step)
    while knots[-1] < Fr(255, 256):
        knots.append(min(Fr(255, 256), knots[-1] + Fr(1, 128)))
    require(all(knots[i] < knots[i + 1] for i in range(len(knots) - 1)), 'theta knots must increase')

    th0 = Fr(1, 64)
    th_eps = knots[0]
    th_lo = knots[-1]
    t_eps = Fr(1) - th_lo
    inv_1meps_52 = rat_pow_ub(Fr(1) / (1 - th_eps), 5, 2)
    slope_eps = ceil_rat(3 * (inv_1meps_52 - 1) / th_eps)
    inv_1meps_3 = ceil_rat((Fr(1) / (1 - th_eps)) ** 3)
    t_eps_half = rat_pow_ub(t_eps, 1, 2)

    A_ub = {}
    B_ub = {}
    for k in (2, 4):
        for l in (0, 2, 4, 6, 8):
            al, be = Fr(k, 3), Fr(l, 3)
            d = be + 2 - al
            # Left tail (0, th_eps]
            if l in (0, 2, 4):
                a_acc = ceil_rat(
                    Fr(1, 2) * c_hi / (d * (be + 4))
                    * (3 * inv_1meps_52 + 3)
                    * rat_pow_ub(th_eps, 6 - l, 6) / Fr(6 - l, 6)
                )
                b_acc = Fr(0)
            else:
                a_acc = ceil_rat(
                    Fr(1, 2) * c_hi / (d * (be + 4))
                    * slope_eps
                    * rat_pow_ub(th_eps, 12 - l, 6) / Fr(12 - l, 6)
                )
                b_acc = ceil_rat(
                    Fr(1, 2) * c_hi / (d * (be + 4))
                    * 3 * sqrt5_hi * inv_1meps_3
                    * rat_pow_ub(th_eps, 9 - l, 6) / Fr(9 - l, 6)
                )

            # Interior monotone Riemann cells [tha, thb]
            for tha, thb in zip(knots[:-1], knots[1:]):
                dth = thb - tha
                w_hi = W_ub_at(tha, k, l)
                th2_hi = thb * thb
                inv_1mb_52 = rat_pow_ub(Fr(1) / (1 - thb), 5, 2)
                if l in (0, 2, 4) or tha >= th0:
                    a_acc += ceil_rat(Fr(1, 2) * c_hi * w_hi * th2_hi * (3 * inv_1mb_52 + 3) * dth)
                else:
                    a_acc += ceil_rat(Fr(1, 2) * c_hi * w_hi * th2_hi * 3 * (inv_1mb_52 - 1) * dth)
                    th_half_hi = rat_pow_ub(thb, 1, 2)
                    inv_1mb_3 = ceil_rat((Fr(1) / (1 - thb)) ** 3)
                    b_acc += ceil_rat(
                        Fr(1, 2) * c_hi * w_hi * th2_hi * 3 * sqrt5_hi * th_half_hi * inv_1mb_3 * dth
                    )

            # Right tail [1 - t_eps, 1): W(1-t) <= (t^2 / 8) * (1-t)^{-(beta+6)/2},
            # so W(1-t)*(1-t)^2 <= (t^2 / 8) * (1 - t_eps)^{-(l+6)/6}
            th_lo_pow = rat_pow_ub(Fr(1) / th_lo, l + 6, 6)
            a_acc += ceil_rat(Fr(1, 16) * c_hi * th_lo_pow * (6 * t_eps_half + (t_eps ** 3)))

            A_ub[(k, l)] = a_acc
            B_ub[(k, l)] = b_acc

    # --- Step 4: Whole-interval Bernstein certificate for R_* <= R_cap on y in [0, 7/8] ---
    # Check (7/8)^2 = 49/64 > 3/4 = 48/64 (so [0, sqrt(3/4)] subset [0, 7/8]),
    # and on kappa_4(F) <= 1/100, E[F^4] = 3 + kappa_4(F) <= 301/100 <= (33/25)^4:
    require(Fr(7, 8) ** 2 > Fr(3, 4), 'y_max check failed')
    beta = Fr(33, 25)
    require(beta ** 4 >= Fr(301, 100), 'beta fourth-moment cap failed')

    # Reviewed contraction upper-bound table from cumulant-remainder-codex-a7c4/verify.py:
    upper = {
        (2, 2): [Fr(1), Fr(283, 100), Fr(245, 100), Fr(0), Fr(0)],
        (2, 4): [Fr(0), Fr(245, 100), Fr(566, 100), Fr(388, 100), Fr(0)],
        (4, 4): [Fr(1), Fr(566, 100), Fr(147, 10), Fr(179, 10), Fr(837, 100)],
    }

    # Build P_5(y) = sum_{k,l} [ A_{k,l}*(1 + y^2/2) + B_{k,l}*beta*(197/100 + 503/100 * y) ] * W_{k,l}(y)
    # where sqrt(1 + y^2) <= 1 + y^2/2 for all real y (since (1 + y^2/2)^2 - (1 + y^2) = y^4/4 >= 0).
    u2_poly = [Fr(1), Fr(0), Fr(1, 2)]
    u4_poly = [Fr(197, 100), Fr(503, 100)]
    y_fac = {2: [Fr(1)], 4: [Fr(0), Fr(1)]}
    P5 = []
    for k in (2, 4):
        for l in (0, 2, 4, 6, 8):
            w_poly = []
            for j in (2, 4):
                c_jkl = upper[tuple(sorted((j, k)))][l // 2]
                if c_jkl != 0:
                    w_poly = padd(w_poly, [c_jkl * x for x in pmul(y_fac[j], y_fac[k])])
            env_kl = padd([A_ub[(k, l)] * x for x in u2_poly],
                          [B_ub[(k, l)] * beta * x for x in u4_poly])
            P5 = padd(P5, pmul(env_kl, w_poly))

    # Certify Q_10(y) = (27 * R_cap)^2 * (1/2 + y^2)^3 - P_5(y)^2 > 0 on ALL y in [0, 7/8]
    R_cap = Fr(86, 25)  # 3.44
    denom_cubed = pmul(pmul([Fr(1, 2), Fr(0), Fr(1)], [Fr(1, 2), Fr(0), Fr(1)]), [Fr(1, 2), Fr(0), Fr(1)])
    Q10 = psub([((27 * R_cap) ** 2) * x for x in denom_cubed], pmul(P5, P5))
    ok_R, leaves_R = bernstein_positive_on_segment(Q10, Fr(0), Fr(7, 8))
    require(ok_R, 'Bernstein positivity of Q_10 on [0, 7/8] failed')

    # --- Step 5: Exact rational thresholds on H_3(R^n) and H_{2,1}(C^n) ---
    # 5a) Real H_3(R^n):
    #     E|F| <= c * (1 - k4/24 + (67/240) k4^{3/2}) + R_cap * k4^{3/2}
    #     Coeff of k4^{3/2} is C_{3/2, real} := (67/240) * c_hi + R_cap.
    #     For E|F| <= c * (1 - k4/48), need C_{3/2, real} * sqrt(k4) <= c_lo / 48  <=>  k4 <= ((c_lo / 48) / C_{3/2, real})^2.
    #     For strict E|F| < c, need C_{3/2, real} * sqrt(k4) < c_lo / 24           <=>  k4 <  ((c_lo / 24) / C_{3/2, real})^2.
    C32_real = Fr(67, 240) * c_hi + R_cap
    kap0_exact = ((c_lo / 48) / C32_real) ** 2
    kap1_exact = ((c_lo / 24) / C32_real) ** 2
    KAPPA_0 = Fr(1, 49000)
    KAPPA_1 = Fr(1, 12250)
    require(KAPPA_0 < kap0_exact and KAPPA_0 <= Fr(1, 100), 'KAPPA_0 threshold check failed')
    require(KAPPA_1 < kap1_exact and KAPPA_1 <= Fr(1, 100), 'KAPPA_1 threshold check failed')

    # 5b) Complex H_{2,1}(C^n) via U(1) phase-averaging F_theta(z) = sqrt(2) Re(e^{-i theta} q(z)) in H_3(R^{2n}):
    #     Because q in H_{2,1} has bidegree (2, 1) and z ~ CN(0, I_n) is U(1)-invariant,
    #     q(e^{-i theta} z) = e^{-i theta} q(z), so F_theta =_d F_0 = sqrt(2) Re q for every theta.
    #     At u = E|q|^2 = 1, E[F_0^2] = 1, E|q| / (sqrt(pi)/2) = E|F_0| / c, and by U(1) invariance
    #     E[F_0^4] = (1/4) * 6 E|q|^4 = (3/2)(2 + chi(q)), giving kappa_4(F_0) = (3/2) * chi(q) identically.
    #     Thus:
    #     (i)  U(1) phase-averaging transfers kap0_exact, kap1_exact directly via chi <= (2/3) * kap;
    #     (ii) Direct complex C_{6,cplx} = 4045313/100000 (NEAR_GAUSSIAN_REMOTE formula) also certifies chi_0 = 1/72000:
    C6_cplx = Fr(4045313, 100000)
    three_halves_32 = rat_pow_ub(Fr(3, 2), 3, 2, prec=10**9)  # >= (3/2)^{3/2}
    C32_cplx_direct = Fr(5, 2) * C6_cplx / 240 + (R_cap / c_lo) * three_halves_32
    chi0_via_u1 = Fr(2, 3) * kap0_exact
    chi1_via_u1 = Fr(2, 3) * kap1_exact
    chi0_via_c6 = (Fr(1, 32) / C32_cplx_direct) ** 2
    chi1_via_c6 = (Fr(1, 16) / C32_cplx_direct) ** 2

    # Note chi0_via_u1 > chi0_via_c6 because 67/240 * (3/2)^{3/2} = 0.5129 > 2.5*40.453/240 = 0.4214 is slightly larger
    # ONLY in the 67/240 term (actually 0.5129 vs 0.4214 makes chi0_via_c6 EVEN LARGER: 1/71154 vs 1/72724!).
    # Both are > 1/73000; let's check which is larger and verify BOTH!
    CHI_0_U1 = Fr(1, 73500)
    CHI_1_U1 = Fr(1, 18375)
    CHI_0_C6 = Fr(1, 72000)
    CHI_1_C6 = Fr(1, 18000)
    require(CHI_0_U1 < chi0_via_u1 and CHI_1_U1 < chi1_via_u1, 'U(1) chi threshold check failed')
    require(CHI_0_C6 < chi0_via_c6 and CHI_1_C6 < chi1_via_c6, 'C6 chi threshold check failed')
    require((Fr(3, 2) * CHI_1_C6) <= Fr(1, 100), 'kappa_4(F_theta) <= 1/100 domain check failed')

    if not quiet:
        print('=== Exact Near-Gaussian Verification (pure stdlib, zero floats) ===')
        print('1. Hermite-Gaussian SOS / discriminant checks: PASS (disc_hi=-95/64, disc_lo=-51/4, disc_d=-20)')
        print('2. Machin pi enclosure: pi in [%s, %s]' % (dec_floor10(pi_lo), dec_ceil10(pi_hi)))
        print('   c = sqrt(2/pi) in    [%s, %s]' % (dec_floor10(c_lo), dec_ceil10(c_hi)))
        print('3. Exact rational cell envelopes |g_{k,l}(x)| <= A_{k,l} + B_{k,l}|x| (%d cells, th0=%s):' % (
            len(knots) - 1, th0))
        for k in (2, 4):
            for l in (0, 2, 4, 6, 8):
                print('   (k=%d, l=%d): A_ub = %s,  B_ub = %s' % (
                    k, l, dec_ceil10(A_ub[(k, l)]), dec_ceil10(B_ub[(k, l)])))
        print('4. Whole-interval Bernstein certificate on y in [0, 7/8]:')
        print('   R_* <= %s = %s  (PASS, %d Bernstein leaves)' % (R_cap, dec_ceil10(R_cap), leaves_R))
        print('5. Certified explicit thresholds:')
        print('   Real H_3(R^n) [STATUS.md 3.21 (e1)]:')
        print('     C_{3/2,real} <= %s' % dec_ceil10(C32_real))
        print('     kappa_0 = %s = %s < %s  (E|F| <= c*(1 - kappa_4/48))' % (
            KAPPA_0, dec_floor10(KAPPA_0), dec_floor10(kap0_exact)))
        print('     kappa_1 = %s = %s < %s  (strict E|F| < c*||F||_2)' % (
            KAPPA_1, dec_floor10(KAPPA_1), dec_floor10(kap1_exact)))
        print('   Complex H_{2,1}(C^n) [STATUS.md 3.18]:')
        print('     Via U(1) invariance (real 67/240): chi_0 = %s < %s,  chi_1 = %s < %s' % (
            CHI_0_U1, dec_floor10(chi0_via_u1), CHI_1_U1, dec_floor10(chi1_via_u1)))
        print('     Via complex C_6 = 4045313/100000:  C_{3/2,cplx} <= %s' % dec_ceil10(C32_cplx_direct))
        print('     chi_0 = %s = %s < %s  (E|q| <= (sqrt(pi)/2)*||q||_2*(1 - chi/32), buffered PVD, remote K)' % (
            CHI_0_C6, dec_floor10(CHI_0_C6), dec_floor10(chi0_via_c6)))
        print('     chi_1 = %s = %s < %s  (strict E|q| < (sqrt(pi)/2)*||q||_2)' % (
            CHI_1_C6, dec_floor10(CHI_1_C6), dec_floor10(chi1_via_c6)))
        print('VERIFIED EXACTLY: near-Gaussian explicit cone PASS.')

    return {
        'R_cap': R_cap,
        'KAPPA_0': KAPPA_0,
        'KAPPA_1': KAPPA_1,
        'CHI_0': CHI_0_C6,
        'CHI_1': CHI_1_C6,
        'CHI_0_U1': CHI_0_U1,
    }


if __name__ == '__main__':
    verify_all(quiet=('--quiet' in sys.argv))
