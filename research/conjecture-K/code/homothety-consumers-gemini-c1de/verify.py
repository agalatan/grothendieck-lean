#!/usr/bin/env python3
"""Zero-float, zero-assert exact rational verifier for Issue #760 (STATUS tag KHOM).

Agent-ID: gemini-c1de
Refs: #760, #436, #177

Run under both:
  python3 -IB research/conjecture-K/code/homothety-consumers-gemini-c1de/verify.py
  python3 -IB -O research/conjecture-K/code/homothety-consumers-gemini-c1de/verify.py

Uses Python 3 standard library only (`fractions.Fraction`, `hashlib`, `json`,
`math.{comb,factorial,isqrt}`, `os`, `sys`), with zero floating-point operations,
zero float literals, and zero `assert` statements so every check executes identically
under `python3 -IB` and `python3 -IB -O`.
"""
from fractions import Fraction as Q
import hashlib
import json
from math import comb, factorial, isqrt
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
DEFAULT_CERT = os.path.join(HERE, "homothety_consumers_cert.json")
INHERITED_ROWS_JSON = os.path.join(HERE, "..", "exterior-codex-4d8a", "inherited_rows.json")
CENTRAL_7475_JSON = os.path.join(HERE, "..", "exterior-codex-4d8a", "central_7475_certificate.json")
CENTRAL_94_125_JSON = os.path.join(
    HERE, "..", "exterior-94-125-gemini-9a4e", "central_94_125_certificate.json"
)

INHERITED_ROWS_SHA256 = "9503bc50a3335eb611d46e858c9f26e46ee94b4fd15f27458a44b236b7ab3118"
CENTRAL_7475_SHA256 = "ea637b4aec78a0a76d9eaa5444f655f46a43b17c04d692fa10472d3dda711c9b"
CENTRAL_94_125_SHA256 = "444cc60ae60049aa9fa24fc24a20ee108988982ccc7e3cbc1eeb19bc9abdd3c8"

# Peak-row and sector parameters (STATUS §0, 7.1.6, 7.4.10, 7.4.16, 7.5.13, 11.61):
EPS0 = Q(1891, 2500)
P0 = Q(2500, 1891)
ELL0 = Q(1057, 1250)
BETA0 = Q(179, 1250)
A0_PROF = ELL0 - Q(2) * BETA0  # 699/1250
RHO0 = Q(5053, 10000)
D_RHO = Q(1) + RHO0 * RHO0  # 125532809/100000000
S_TILT = Q(3, 5)
E0 = Q(463, 10000)
U_TOT0 = Q(80051, 1000000)
U_NO_1161 = Q(3, 2000)  # [0, 3/2000] covers 11.61's [1/1000, 3/2000] exempt box; 11.61 is banned below 3/2000
GAMMA_A = Q(7, 25)
ETA_A = Q(6, 1000000)

# 2.12a-b Rice tangent at u = 1/10 (re-proved from scratch below) and pi upper bounds:
A_212B = Q(886762780, 10**9)
B_212B = Q(432306903, 10**9)
PI_HI = Q(31415926535897932385, 10**19)
SQRT_PI_HI = Q(1772453850905517, 10**15)
R_HI = SQRT_PI_HI / Q(2)

# 3.3 & 3.14 reviewed peak remote & Gaussian benchmark enclosures:
U0_REM = Q(1373953883, 10**9)
S0_LO = Q(13739535256614, 10**13)
S0_HI = Q(13739535256616, 10**13)

# 11.30, 11.49, 11.62 energy-dependent tilted content coefficients (P + C):
GAMMA_TABLE = (
    (Q(0), Q(2, 25)),
    (Q(1, 125), Q(49, 1000)),
    (Q(9, 1000), Q(251, 5000)),
    (Q(3, 250), Q(121, 2500)),
    (Q(3, 200), Q(467, 10000)),
    (Q(9, 500), Q(451, 10000)),
    (Q(1, 50), Q(83, 2000)),
    (Q(1, 40), Q(393, 10000)),
    (Q(3, 100), Q(3, 80)),
    (Q(7, 200), Q(71, 2000)),
    (Q(3, 80), Q(173, 5000)),
    (Q(1, 25), Q(17, 500)),
    (Q(21, 500), Q(331, 10000)),
    (Q(11, 250), Q(13, 400)),
)

BITS = 220
SCALE = 1 << BITS


def check(cond, msg):
    if not cond:
        raise ValueError(msg)


def fmt_dec(q, digits=9):
    """Exact integer-only decimal formatting (zero floating-point operations)."""
    q = Q(q)
    sign = "-" if q < 0 else ""
    aq = -q if q < 0 else q
    scale = 10 ** digits
    scaled = (aq.numerator * scale) // aq.denominator
    whole = scaled // scale
    frac = scaled % scale
    return f"{sign}{whole}.{frac:0{digits}d}"


def fmt_micro_ceil(q, digits=4):
    """Outward ceiling in units of 10^-6 using integer arithmetic only."""
    q = Q(q)
    scale = 10 ** (6 + digits)
    ten_d = 10 ** digits
    if q >= 0:
        num = (q.numerator * scale + q.denominator - 1) // q.denominator
        whole = num // ten_d
        frac = num % ten_d
        return f"{whole}.{frac:0{digits}d}e-6"
    aq = -q
    num = (aq.numerator * scale) // aq.denominator
    whole = num // ten_d
    frac = num % ten_d
    return f"-{whole}.{frac:0{digits}d}e-6"


def rat_sqrt_lo(q, scale=10**10):
    check(q >= 0, "rat_sqrt_lo negative input")
    if q == 0:
        return Q(0)
    n = (q.numerator * scale * scale) // q.denominator
    r = isqrt(n)
    out = Q(r, scale)
    check(out * out <= q, "rat_sqrt_lo enclosure failure")
    return out


def rat_sqrt_hi_int(q, scale=10**8):
    check(q >= 0, "rat_sqrt_hi_int negative input")
    if q == 0:
        return 0
    n = (q.numerator * scale * scale + q.denominator - 1) // q.denominator
    r = isqrt(n)
    if r * r < n:
        r += 1
    out = Q(r, scale)
    check(out * out >= q, "rat_sqrt_hi_int enclosure failure")
    return r


def rat_sqrt_hi(q, scale=10**10):
    return Q(rat_sqrt_hi_int(q, scale), scale)


C_NEG_LO = rat_sqrt_lo(ETA_A, 10**10)
C_NEG_HI = rat_sqrt_hi(ETA_A, 10**10)


class RatIval:
    """Outward-rounded 220-bit dyadic-rational interval arithmetic (zero float)."""
    __slots__ = ("lo", "hi")

    def __init__(self, lo, hi=None):
        lq = Q(lo)
        hq = Q(lq if hi is None else hi)
        check(lq <= hq, f"Inverted RatIval: {lq} > {hq}")
        self.lo = Q((lq.numerator * SCALE) // lq.denominator, SCALE)
        self.hi = Q((hq.numerator * SCALE + hq.denominator - 1) // hq.denominator, SCALE)

    @staticmethod
    def lift(x):
        return x if isinstance(x, RatIval) else RatIval(x)

    def __add__(self, x):
        x = self.lift(x)
        return RatIval(self.lo + x.lo, self.hi + x.hi)

    __radd__ = __add__

    def __neg__(self):
        return RatIval(-self.hi, -self.lo)

    def __sub__(self, x):
        return self + (-self.lift(x))

    def __rsub__(self, x):
        return self.lift(x) + (-self)

    def __mul__(self, x):
        x = self.lift(x)
        ends = (self.lo * x.lo, self.lo * x.hi, self.hi * x.lo, self.hi * x.hi)
        return RatIval(min(ends), max(ends))

    __rmul__ = __mul__

    def __truediv__(self, x):
        x = self.lift(x)
        check(not (x.lo <= 0 <= x.hi), "RatIval division by zero interval")
        return self * RatIval(Q(1) / x.hi, Q(1) / x.lo)

    def __rtruediv__(self, x):
        return self.lift(x) / self

    def sqrt(self):
        check(self.lo >= 0, "RatIval negative sqrt")
        low = isqrt((self.lo.numerator * SCALE * SCALE) // self.lo.denominator)
        high_n = (self.hi.numerator * SCALE * SCALE + self.hi.denominator - 1) // self.hi.denominator
        high = isqrt(high_n)
        if high * high < high_n:
            high += 1
        out = RatIval(Q(low, SCALE), Q(high, SCALE))
        check(out.lo * out.lo <= self.lo and self.hi <= out.hi * out.hi, "RatIval sqrt enclosure failed")
        return out


def poly_add(a, b):
    n = max(len(a), len(b))
    out = [Q(0)] * n
    for i, v in enumerate(a):
        out[i] += v
    for i, v in enumerate(b):
        out[i] += v
    return out


def poly_mul(a, b):
    out = [Q(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def poly_pow(p, e):
    res = [Q(1)]
    for _ in range(e):
        res = poly_mul(res, p)
    return res


def poly_divmod_exact(a, b):
    check(len(b) >= 1 and b[-1] != 0, "poly_divmod_exact zero leading divisor")
    a = list(a)
    if len(a) < len(b):
        return [Q(0)], a
    q = [Q(0)] * (len(a) - len(b) + 1)
    for i in range(len(q) - 1, -1, -1):
        c = a[i + len(b) - 1] / b[-1]
        q[i] = c
        for j, bv in enumerate(b):
            a[i + j] -= c * bv
    rem = a[: len(b) - 1]
    return q, rem


def build_and_verify_b_hi_poly(u7_override=None, b_hi_override=None, return_details=False):
    """Self-contained 220-bit rational construction + algebraic verification of B_hi(u) >= B_0(u)."""
    def atan_rec(n, terms=160):
        q = Q(1, n)
        tot = sum(Q((-1) ** k, 2 * k + 1) * (q ** (2 * k + 1)) for k in range(terms))
        nxt = (q ** (2 * terms + 1)) / Q(2 * terms + 1)
        return RatIval(tot - nxt, tot + nxt)

    pi_iv = Q(16) * atan_rec(5) - Q(4) * atan_rec(239)
    sp_iv = pi_iv.sqrt()
    check(Q(3) < pi_iv.lo < pi_iv.hi <= PI_HI, "Machin pi enclosure failed against PI_HI")
    check(pi_iv.hi <= SQRT_PI_HI * SQRT_PI_HI, "SQRT_PI_HI^2 < pi_hi")
    check(PI_HI < SQRT_PI_HI * SQRT_PI_HI, "SQRT_PI_HI^2 <= PI_HI")
    check(PI_HI / Q(4) < R_HI * R_HI < Q(1773, 2000) ** 2, "R_HI or 1773/2000 enclosure failed")

    def exp_pos(r, terms=180):
        r = Q(r)
        check(Q(0) < r < Q(terms + 1), "exp_pos invalid r")
        tot = sum((r ** k) / Q(factorial(k)) for k in range(terms))
        first = (r ** terms) / Q(factorial(terms))
        return RatIval(tot, tot + first / (Q(1) - r / Q(terms + 1)))

    def single_pole(a, b, n=24):
        r = a / b
        terms = 180
        check(Q(0) < r < Q(terms + 1), "single_pole invalid r")
        tot = sum(((-r) ** k) / Q(factorial(k) * (2 * k + 1)) for k in range(terms))
        nxt = (r ** terms) / Q(factorial(terms) * (2 * terms + 1))
        erf_s = RatIval(tot - nxt, tot + nxt)
        j0 = exp_pos(r) * (pi_iv / (b * RatIval(r).sqrt()) - Q(2) * sp_iv * erf_s / b)
        out = [sp_iv / Q(2), j0 / Q(2)]
        for k in range(1, n):
            out.append(((Q(2 * k - 1) - Q(2) * a / b) * out[k] + Q(2) * out[k - 1] / b) / (Q(2 * k) * a))
        return out

    checked_pf = set()
    lin_a = [A0_PROF, BETA0]
    lin_b = [A0_PROF, Q(3) * BETA0]

    def mixed_int(p, q, a, ia, ib):
        if q == 0:
            return ia[p]
        if p == 0:
            return ib[q]
        ca = {
            i: Q((-1) ** q) * Q(comb(q + p - i - 1, p - i)) * (Q(3) ** (p - i)) / ((Q(2) * a) ** (q + p - i))
            for i in range(1, p + 1)
        }
        cb = {
            j: Q((3 ** p) * ((-1) ** (q - j))) * Q(comb(p + q - j - 1, q - j)) / ((Q(2) * a) ** (p + q - j))
            for j in range(1, q + 1)
        }
        if (p, q) not in checked_pf:
            # Algebraic partial-fraction verification in Q[T]:
            # sum_i ca[i] A(T)^(p-i) B(T)^q + sum_j cb[j] A(T)^p B(T)^(q-j) == 1 identically!
            lhs = [Q(0)]
            bq_poly = poly_pow(lin_b, q)
            ap_poly = poly_pow(lin_a, p)
            for i, ci in ca.items():
                term = poly_mul(poly_pow(lin_a, p - i), bq_poly)
                lhs = poly_add(lhs, [ci * v for v in term])
            for j, cj in cb.items():
                term = poly_mul(ap_poly, poly_pow(lin_b, q - j))
                lhs = poly_add(lhs, [cj * v for v in term])
            check(lhs[0] == Q(1) and all(v == Q(0) for v in lhs[1:]),
                  f"Partial-fraction identity failed at (p, q)=({p}, {q}): {lhs}")
            checked_pf.add((p, q))
        return sum((c * ia[i] for i, c in ca.items()), RatIval(0)) + sum(
            (c * ib[j] for j, c in cb.items()), RatIval(0)
        )

    ia = single_pole(A0_PROF, BETA0, n=24)
    ib = single_pole(A0_PROF, Q(3) * BETA0, n=24)
    td = {(1, 1): Q(1)}
    v_derivs = [Q(387, 500) * sp_iv]
    for m in range(7):
        w_int = RatIval(0)
        for (p, q), c in td.items():
            part = (Q(3) * ia[p - 1] - Q(2) * A0_PROF * ia[p]) if q == 0 else mixed_int(p, q - 1, A0_PROF, ia, ib)
            w_int = w_int + c * part
        ang = Q(comb(2 * m, m), 4 ** m)
        v_derivs.append(Q((-1) ** m, m + 1) * ang * w_int)
        nxt_td = {}
        for (p, q), v in td.items():
            for key, cf in (
                ((p + 1, q + 1), v),
                ((p + 2, q + 1), v * p * BETA0),
                ((p + 1, q + 2), v * 3 * q * BETA0),
            ):
                nxt_td[key] = nxt_td.get(key, Q(0)) + cf
        td = nxt_td

    binom_half = [Q(1)]
    for k in range(1, 8):
        binom_half.append(binom_half[-1] * (Q(1, 2) - Q(k - 1)) / Q(k))
    md = [v_derivs[k] / binom_half[k] for k in range(8)]
    for k in range(8):
        check(md[k].lo > Q(0), f"Peak deficit Laplace moment M_D[{k}] not strictly positive: {md[k].lo}")

    ratios = [Q(17, 16), Q(5, 4), Q(13, 8)]
    nodes = [r * r - Q(1) for r in ratios]
    if u7_override is not None:
        u7 = [Q(x) for x in u7_override]
    else:
        z = [Q(0), Q(0)]
        rts = [Q(1), Q(1)]
        for r, y in zip(ratios, nodes):
            z.extend([y, y])
            rts.extend([r, r])
        n7 = len(z)
        tab = [[Q(0)] * n7 for _ in range(n7)]
        for i in range(n7):
            tab[i][0] = rts[i]
        for j in range(1, n7):
            for i in range(n7 - j):
                if z[i + j] == z[i]:
                    tab[i][j] = Q(1) / (Q(2) * rts[i])
                else:
                    tab[i][j] = (tab[i + 1][j - 1] - tab[i][j - 1]) / (z[i + j] - z[i])
        u7 = [Q(0)] * n7
        basis = [Q(1)]
        for j in range(n7):
            for k, bc in enumerate(basis):
                u7[k] += tab[0][j] * bc
            if j < n7 - 1:
                nb = [Q(0)] * (len(basis) + 1)
                for k, bc in enumerate(basis):
                    nb[k] -= z[j] * bc
                    nb[k + 1] += bc
                basis = nb

    check(len(u7) == 8 and u7[0] == Q(1) and u7[1] == Q(1, 2), "U_7(y) failed order-1 tangency at y=0")

    # Algebraic proof of U_7(y) >= sqrt(1 + y) for all y >= 0:
    # P_14(y) := U_7(y)^2 - (1 + y) = y^2 * prod_{j=1}^3 (y - y_j)^2 * Q_6(y),
    # and Q_6(y) is an explicit sum of three squares plus c_rem * y^4 > 0!
    p14 = poly_mul(u7, u7)
    p14[0] -= Q(1)
    p14[1] -= Q(1)
    sq_fac = [Q(0), Q(0), Q(1)]
    for y0 in nodes:
        sq_fac = poly_mul(sq_fac, poly_pow([-y0, Q(1)], 2))
    q6, rem = poly_divmod_exact(p14, sq_fac)
    check(all(r == Q(0) for r in rem) and len(q6) == 7,
          "U_7(y)^2 - (1 + y) not divisible by y^2 prod (y - y_j)^2")
    check(q6[0] > Q(0) and q6[6] > Q(0), "Q_6 endpoint coefficients not positive")
    q2_rem = q6[2] - (q6[1] * q6[1]) / (Q(4) * q6[0])
    check(q2_rem > Q(0), "Q_6 Cholesky SOS step 1 failed")
    q4_after_12 = q6[4] - (q6[3] * q6[3]) / (Q(4) * q2_rem)
    q4_rem = q4_after_12 - (q6[5] * q6[5]) / (Q(4) * q6[6])
    check(q4_rem > Q(0), "Q_6 Cholesky SOS step 2/3 failed")
    # Reconstruct exact SOS polynomial to double-check identity:
    sos = [Q(0)] * 7
    s1 = [q6[0], q6[1], (q6[1] * q6[1]) / (Q(4) * q6[0])]
    s2 = [Q(0), Q(0), q2_rem, q6[3], (q6[3] * q6[3]) / (Q(4) * q2_rem)]
    s3 = [Q(0), Q(0), Q(0), Q(0), (q6[5] * q6[5]) / (Q(4) * q6[6]), q6[5], q6[6]]
    for poly_s in (s1, s2, s3):
        sos = poly_add(sos, poly_s)
    sos[4] += q4_rem
    check(sos == q6, "Q_6 explicit SOS reconstruction mismatch")

    b_hi_prod = [u7[k] * md[k] for k in range(8)]
    for k in (2, 4, 6):
        check(u7[k] < Q(0) and md[k].lo < md[k].hi and b_hi_prod[k].lo < b_hi_prod[k].hi,
              f"Expected negative u7[{k}] with positive-width interval product")
    b_hi = [b_hi_prod[k].hi for k in range(8)] if b_hi_override is None else [Q(x) for x in b_hi_override]
    check(len(b_hi) == 8, "b_hi must have length 8")
    for k in range(8):
        exact_iv_hi = u7[k] * (md[k].hi if u7[k] >= Q(0) else md[k].lo)
        check(b_hi_prod[k].hi >= exact_iv_hi,
              f"RatIval upper endpoint (u7[{k}]*md[{k}]).hi below exact rational product upper bound")
        check(b_hi[k] >= b_hi_prod[k].hi,
              f"b_hi[{k}] failed outward upper enclosure (u7[{k}]*md[{k}]).hi")

    # Verify B_hi(u_*) - p_0 u_* >= S0_LO (soundness against 3.14):
    u_star = Q(403448, 10**7)
    g_star = sum(b_hi[k] * (u_star ** k) for k in range(8)) - P0 * u_star
    check(S0_LO < g_star < S0_HI + Q(2, 10**7),
          f"B_hi(u_*) - p_0 u_* = {fmt_dec(g_star, 10)} outside expected bracket above S_0")

    if return_details:
        return b_hi, pi_iv, sp_iv, u7, md, b_hi_prod
    return b_hi, pi_iv, sp_iv


def verify_rice_tangent(sp_iv, rice_slope_override=None):
    """Re-prove 2.12a-b Rice tangent rho(u) <= A_212B + B_212B * u at u_0 = 1/10 (x = 1/20)."""
    x = Q(1, 20)

    def exp_neg_bounds(xv, terms=24):
        term = Q(1)
        tot = term
        for k in range(1, terms):
            term = term * (-xv) / Q(k)
            tot += term
        nxt = term * (-xv) / Q(terms)
        return min(tot, tot + nxt), max(tot, tot + nxt)

    def bessel_i_bounds(order, xv, terms=20):
        term = Q(1) if order == 0 else xv / Q(2)
        tot = term
        for k in range(1, terms):
            term = term * xv * xv / Q(4 * k * (k + order))
            tot += term
        nxt = term * xv * xv / Q(4 * terms * (terms + order))
        ratio = xv * xv / Q(4 * (terms + 1) * (terms + 1 + order))
        check(ratio < Q(1), "bessel_i ratio >= 1")
        return tot, tot + nxt / (Q(1) - ratio)

    _, i0_hi = bessel_i_bounds(0, x, 20)
    _, i1_hi = bessel_i_bounds(1, x, 20)
    _, ex_hi = exp_neg_bounds(x, 24)
    common_hi = (sp_iv.hi / Q(2)) * ex_hi
    tan_a_hi = common_hi * ((Q(1) + x) * i0_hi + x * i1_hi)
    tan_b_hi = (common_hi / Q(2)) * (i0_hi + i1_hi)
    b_target = B_212B if rice_slope_override is None else Q(rice_slope_override)
    check(tan_a_hi < A_212B, f"Rice intercept {tan_a_hi} >= A_212B")
    check(tan_b_hi < b_target, f"Rice slope {tan_b_hi} >= {b_target}")
    check(S0_LO < S0_HI < U0_REM, "Benchmark ordering S0_LO < S0_HI < U0_REM failed")
    check(C_NEG_LO >= 0 and C_NEG_LO * C_NEG_LO <= ETA_A <= C_NEG_HI * C_NEG_HI, "C_NEG enclosure failed")


def bernstein_1d(c, lo, hi):
    n = len(c) - 1
    d = hi - lo
    aff = [
        sum(c[i] * comb(i, j) * (lo ** (i - j)) * (d ** j) for i in range(j, n + 1))
        for j in range(n + 1)
    ]
    return [sum(aff[j] * Q(comb(i, j), comb(n, j)) for j in range(i + 1)) for i in range(n + 1)]


def best_gamma(u_lo):
    best = Q(2, 25)
    for e_i, g_i in GAMMA_TABLE:
        if u_lo >= e_i and g_i < best:
            best = g_i
    return best


def sigma_lo_iv(u_lo, u_hi, g_hi_poly):
    lo = max(Q(0), S0_LO - max(bernstein_1d(g_hi_poly, u_lo, u_hi)))
    if u_hi <= Q(1, 100):
        lo = max(lo, Q(113, 100000))
    elif u_hi <= Q(2, 100):
        lo = max(lo, Q(49, 100000))
    elif u_hi <= Q(25, 1000):
        lo = max(lo, Q(27, 100000))
    elif u_hi <= Q(3, 100):
        lo = max(lo, Q(1, 10000))
    if u_lo >= Q(551, 100000) and u_hi <= E0:
        us_lo, us_hi = Q(403448, 10**7), Q(403449, 10**7)
        dist = (us_lo - u_hi) if u_hi <= us_lo else ((u_lo - us_hi) if u_lo >= us_hi else Q(0))
        lo = max(lo, Q(27, 25) * dist * dist)
    return lo


def rho_rem_hi(u_lo, u_hi, b_hi_poly, use_33a, g_hi_poly):
    if use_33a:
        return -sigma_lo_iv(u_lo, u_hi, g_hi_poly)
    # Track A (pure P + C): 2.7 Jensen concavity of 2 E_Z|L_0 + sqrt(z)| + 7.2.11 + 3.3:
    jensen = max(
        b_hi_poly[0] + (b_hi_poly[1] - P0) * u_lo,
        b_hi_poly[0] + (b_hi_poly[1] - P0) * u_hi,
    ) - S0_LO
    if u_hi <= Q(1, 100):
        r7211 = Q(-113, 100000)
    elif u_hi <= Q(2, 100):
        r7211 = Q(-49, 100000)
    elif u_hi <= Q(25, 1000):
        r7211 = Q(-27, 100000)
    elif u_hi <= Q(3, 100):
        r7211 = Q(-1, 10000)
    else:
        r7211 = U0_REM - S0_LO
    return min(jensen, r7211)


def max_quad_on_iv(a_c2, b_c1, c_c0, lo, hi):
    check(lo <= hi, "max_quad_on_iv inverted interval")
    vals = [a_c2 * lo * lo + b_c1 * lo + c_c0, a_c2 * hi * hi + b_c1 * hi + c_c0]
    if a_c2 < 0:
        c_star = -b_c1 / (Q(2) * a_c2)
        if lo < c_star < hi:
            vals.append(a_c2 * c_star * c_star + b_c1 * c_star + c_c0)
    return max(vals)


def verify_homothety_cover(name, cov, expected, b_hi_poly, g_hi_poly):
    """Verify one 2D (u_0, V_0) free-homothety cover in exact Fraction arithmetic."""
    u_max = Q(cov["u_max"])
    u_tot = Q(cov["u_tot"])
    mu = Q(cov["mu"])
    dp = Q(cov["dp"])
    use_signed_1161 = bool(cov["use_signed_1161"])
    use_33a = bool(cov["use_33a"])
    ell_base = None if cov["ell_base"] is None else Q(cov["ell_base"])

    check(u_max == expected["u_max"] and Q(0) < u_max <= E0, f"{name}: u_max={u_max} invalid")
    check(u_tot == expected["u_tot"] and Q(0) < u_tot <= U_TOT0, f"{name}: u_tot={u_tot} invalid")
    check(mu == expected["mu"] and mu > Q(0), f"{name}: mu={mu} invalid")
    check(dp == expected["dp"], f"{name}: dp={dp} mismatch")
    check(use_signed_1161 == expected["use_signed_1161"], f"{name}: use_signed_1161 mismatch")
    check(use_33a == expected["use_33a"], f"{name}: use_33a mismatch")
    check(ell_base == expected["ell_base"], f"{name}: ell_base mismatch")

    raw_u = cov["u_edges"]
    raw_v = cov["v_edges"]
    u_edges = [(u_max if (idx == len(raw_u) - 1 and x == "MAX") else Q(x)) for idx, x in enumerate(raw_u)]
    v_edges = [(u_tot if (idx == len(raw_v) - 1 and x == "MAX") else Q(x)) for idx, x in enumerate(raw_v)]
    check(len(u_edges) >= 2 and u_edges[0] == Q(0) and u_edges[-1] == u_max,
          f"{name}: u_edges failed [0, {u_max}] boundary check")
    for i in range(len(u_edges) - 1):
        check(u_edges[i] < u_edges[i + 1], f"{name}: non-increasing u_edges at {i}")

    check(len(v_edges) >= 2 and v_edges[0] == Q(0) and v_edges[-1] == u_tot,
          f"{name}: v_edges failed [0, {u_tot}] boundary check")
    for j in range(len(v_edges) - 1):
        check(v_edges[j] < v_edges[j + 1], f"{name}: non-increasing v_edges at {j}")

    resp_ell34 = None if ell_base is None else Q(3, 2) * ell_base
    odd_rate = max(Q(0), Q(49, 625) * (mu - Q(1)) - dp, -dp)
    if odd_rate > Q(0):
        check(ell_base is not None, f"{name}: positive odd_rate={odd_rate} requires ell_base W_0 bound")

    alpha_base = Q(31, 100) - Q(9, 25) * (mu - Q(1)) + dp / D_RHO
    beta_base = Q(2, 25) + dp / D_RHO

    strips = cov["strips"]
    check(len(strips) == len(u_edges) - 1, f"{name}: strip count mismatch")

    worst_all = None
    strip_ubs = []

    for iu, st in enumerate(strips):
        ul, uh = u_edges[iu], u_edges[iu + 1]
        sig_lo = sigma_lo_iv(ul, uh, g_hi_poly)
        r_rem = rho_rem_hi(ul, uh, b_hi_poly, use_33a, g_hi_poly)
        dp_u = -dp * (ul if dp >= Q(0) else uh)

        check(isinstance(st["e"], int) and st["e"] >= 0, f"{name} strip {iu}: invalid e")
        E_cell = Q(st["e"], 10**10)
        check(E_cell * E_cell >= Q(49, 4000000) * uh, f"{name} strip {iu}: E_cell^2 < (49/4000000)*u_hi")
        a_cell = RHO0 * E_cell / D_RHO
        b_cell = E_cell / D_RHO

        g_best = best_gamma(ul)
        c_cap_sq = min(Q(1, 2500), Q(19321, 10**6) * uh, Q(42) * g_best * uh * uh)
        check(isinstance(st["c"], int) and st["c"] >= 0, f"{name} strip {iu}: invalid c")
        C_max = Q(st["c"], 10**8)
        check(C_max * C_max >= c_cap_sq, f"{name} strip {iu}: C_max^2 < min content cap")

        v_dom_hi = u_tot - ul
        if resp_ell34 is not None:
            v_dom_hi = min(v_dom_hi, resp_ell34 - Q(3, 4) * ul)
        check(v_dom_hi >= Q(0), f"{name} strip {iu}: negative v_dom_hi")

        active_v = []
        for iv in range(len(v_edges) - 1):
            vl, vh = v_edges[iv], v_edges[iv + 1]
            if vl > v_dom_hi:
                continue
            active_v.append((vl, min(vh, v_dom_hi)))
        check(len(active_v) >= 1 and active_v[0][0] == Q(0) and active_v[-1][1] == v_dom_hi,
              f"{name} strip {iu}: active V-cells do not cover [0, v_dom_hi]")
        for k in range(len(active_v) - 1):
            check(active_v[k][1] == active_v[k + 1][0], f"{name} strip {iu}: V-cell gap at {k}")

        cells = st["cells"]
        check(len(cells) == len(active_v), f"{name} strip {iu}: cell count mismatch")

        worst_strip = None
        for ic, ((vl, vh_eff), rec) in enumerate(zip(active_v, cells)):
            s_uv_hi = min(uh + vh_eff, u_tot)
            if resp_ell34 is not None:
                s_uv_hi = min(s_uv_hi, resp_ell34 + Q(1, 4) * uh)
            k_val = Q(2) * (s_uv_hi - E0)
            A0 = alpha_base - k_val / D_RHO
            B0 = beta_base - k_val / D_RHO
            dV_lo, dV_hi = D_RHO * vl, D_RHO * vh_eff

            if odd_rate == Q(0):
                odd_add = Q(0)
            else:
                w0_hi = max(Q(0), ell_base - Q(1, 2) * ul - Q(2, 3) * vl)
                odd_add = odd_rate * w0_hi

            check(isinstance(rec, list) and len(rec) >= 2 and all(isinstance(x, int) for x in rec),
                  f"{name} strip {iu} cell {ic}: malformed record")
            mode = rec[0]

            # STRICT EXEMPT-BOX PROHIBITION: on u_0 < 3/2000, ONLY mode == 2 (pure 11.30, kap = 0) is allowed!
            if ul < U_NO_1161:
                check(mode == 2,
                      f"{name} strip {iu} cell {ic}: mode {mode} forbidden on u_lo={ul} < 3/2000 (exempt-box ban)")

            if mode == 2:
                check(len(rec) == 2, f"{name} strip {iu} cell {ic}: mode 2 length != 2")
                lam = Q(rec[1], 10**4)
                A, B = A0 + lam, B0 + lam
                check(A > Q(0) and B > Q(0), f"{name} strip {iu} cell {ic}: non-positive A or B in mode 2")
                dVs = dV_hi if lam >= Q(0) else dV_lo
                cell_val = (
                    odd_add + dp_u + r_rem
                    + ((C_max + a_cell) ** 2) / A + (b_cell ** 2) / B + lam * dVs
                )
            elif mode == 1:
                check(ul >= U_NO_1161, f"{name} strip {iu} cell {ic}: mode 1 below 3/2000")
                check((use_signed_1161 and ul >= Q(2, 125)) or use_33a,
                      f"{name} strip {iu} cell {ic}: mode 1 not licensed on u_lo={ul}")
                check(len(rec) == 3, f"{name} strip {iu} cell {ic}: mode 1 length != 3")
                k_ten, l_int = rec[1], rec[2]
                check(0 <= k_ten <= 10, f"{name} strip {iu} cell {ic}: kap={k_ten}/10 out of [0, 1]")
                kap = Q(k_ten, 10)
                q_c = kap / GAMMA_A
                lam = Q(l_int, 10**4)
                A, B = A0 + lam, B0 + lam
                check(A > Q(0) and B > Q(0), f"{name} strip {iu} cell {ic}: non-positive A or B in mode 1")
                dVs = dV_hi if lam >= Q(0) else dV_lo
                cell_val = (
                    odd_add + dp_u + (Q(1) - kap) * r_rem - kap * sig_lo + kap * ETA_A / GAMMA_A
                    + max_quad_on_iv(
                        Q(1) / A - q_c, Q(2) * a_cell / A,
                        a_cell * a_cell / A + b_cell * b_cell / B + lam * dVs,
                        Q(0), C_max,
                    )
                )
            elif mode == 0:
                check(ul >= U_NO_1161, f"{name} strip {iu} cell {ic}: mode 0 below 3/2000")
                r_pos = min(r_rem, -sig_lo)
                c_mid_hi = min(C_max, C_NEG_HI)
                lam0 = Q(rec[1], 10**4)
                A_l, B_l = A0 + lam0, B0 + lam0
                check(A_l > Q(0) and B_l > Q(0), f"{name} strip {iu} cell {ic}: non-positive A_l or B_l in mode 0")
                dVs0 = dV_hi if lam0 >= Q(0) else dV_lo
                quad0 = ((c_mid_hi + a_cell) ** 2) / A_l + (b_cell ** 2) / B_l + lam0 * dVs0
                v_pos_low = odd_add + dp_u + r_pos + quad0
                v_neg = odd_add + dp_u + r_rem + quad0

                if C_max > C_NEG_LO:
                    check(len(rec) == 4, f"{name} strip {iu} cell {ic}: mode 0 needs 4 ints when C_max > C_NEG_LO")
                    k_ten, l1_int = rec[2], rec[3]
                    check(0 <= k_ten <= 10, f"{name} strip {iu} cell {ic}: kap={k_ten}/10 out of [0, 1]")
                    kap = Q(k_ten, 10)
                    q_c = kap / GAMMA_A
                    lam1 = Q(l1_int, 10**4)
                    A1, B1 = A0 + lam1, B0 + lam1
                    check(A1 > Q(0) and B1 > Q(0), f"{name} strip {iu} cell {ic}: non-positive A1 or B1")
                    dVs1 = dV_hi if lam1 >= Q(0) else dV_lo
                    v_pos_high = (
                        odd_add + dp_u + (Q(1) - kap) * r_pos - kap * sig_lo + kap * ETA_A / GAMMA_A
                        + max_quad_on_iv(
                            Q(1) / A1 - q_c, Q(2) * a_cell / A1,
                            a_cell * a_cell / A1 + b_cell * b_cell / B1 + lam1 * dVs1,
                            C_NEG_LO, C_max,
                        )
                    )
                    cell_val = max(v_pos_low, v_pos_high, v_neg)
                else:
                    check(len(rec) == 2, f"{name} strip {iu} cell {ic}: mode 0 length != 2 when C_max <= C_NEG_LO")
                    cell_val = max(v_pos_low, v_neg)
            else:
                raise ValueError(f"{name} strip {iu} cell {ic}: unknown mode {mode}")

            if worst_strip is None or cell_val > worst_strip:
                worst_strip = cell_val

        check(isinstance(st["ub"], int), f"{name} strip {iu}: ub must be int")
        ub_stored = Q(st["ub"], 10**10)
        check(worst_strip <= ub_stored, f"{name} strip {iu}: computed {worst_strip} > stored ub {ub_stored}")
        strip_ubs.append(ub_stored)
        if worst_all is None or ub_stored > worst_all:
            worst_all = ub_stored

    check(isinstance(cov["worst_ub_1e10"], int), f"{name}: worst_ub_1e10 must be int")
    worst_stored = Q(cov["worst_ub_1e10"], 10**10)
    check(worst_all <= worst_stored, f"{name}: worst strip {worst_all} > worst_ub_1e10 {worst_stored}")
    return worst_stored, u_edges, strip_ubs


def verify_consumer_slabs(cname, cobj, spec, b_hi_poly, g_hi_poly):
    ceps, ctarget, exp_35a, exp_33a, exp_t_lo, exp_t_hi = spec
    check(Q(cobj["eps"]) == ceps, f"{cname}: eps mismatch")
    check(Q(cobj["target_cap"]) == ctarget, f"{cname}: target_cap mismatch")
    check(bool(cobj["use_35a"]) == exp_35a, f"{cname}: use_35a mismatch")
    check(bool(cobj["use_33a"]) == exp_33a, f"{cname}: use_33a mismatch")

    slabs = cobj["slabs"]
    check(len(slabs) >= 1, f"{cname}: empty slabs")
    check(Q(slabs[0]["t_lo"]) == exp_t_lo and Q(slabs[-1]["t_hi"]) == exp_t_hi,
          f"{cname}: slab endpoints [{slabs[0]['t_lo']}, {slabs[-1]['t_hi']}] != [{exp_t_lo}, {exp_t_hi}]")

    worst_cap = None
    for idx, sl in enumerate(slabs):
        ta, tb = Q(sl["t_lo"]), Q(sl["t_hi"])
        mu = Q(sl["mu"])
        check(Q(0) < ta < tb <= R_HI < A_212B, f"{cname} slab {idx}: invalid [{ta}, {tb}]")
        check(ta * ta < PI_HI / Q(4), f"{cname} slab {idx}: ta^2 >= PI_HI/4")
        check(mu > Q(0), f"{cname} slab {idx}: non-positive mu={mu}")
        if idx > 0:
            prev_tb = Q(slabs[idx - 1]["t_hi"])
            check(ta == prev_tb, f"{cname} slab {idx}: t-gap between {prev_tb} and {ta}")

        if exp_35a:
            check(ta * ta >= Q(3, 14) * PI_HI,
                  f"{cname} slab {idx}: 3.5a requires t_lo^2 >= (3/14)*pi, failed at t_lo={ta}")
            u_cap = ceps * ceps * (PI_HI / Q(4) - ta * ta)
        else:
            u_cap = Q(4) * ceps * ceps * B_212B * (A_212B - ta)

        u0_c = u_cap / (mu * mu)
        ell_base = ((ceps / mu) ** 2) * (PI_HI / Q(4) - ta * ta)
        utot_c = Q(3, 2) * ell_base + Q(1, 4) * u0_c
        check(Q(0) < u0_c <= E0 and Q(0) < utot_c <= U_TOT0,
              f"{cname} slab {idx}: homothety-rescaled energies ({u0_c}, {utot_c}) outside peak box")

        dp = mu / ceps - P0
        slab_ub, _, _ = verify_homothety_cover(f"{cname}[{idx}]", sl["cover"], {
            "u_max": u0_c, "u_tot": utot_c, "mu": mu, "dp": dp,
            "use_signed_1161": True, "use_33a": exp_33a, "ell_base": ell_base,
        }, b_hi_poly, g_hi_poly)

        ell_m, beta_m = mu * ELL0, mu * BETA0
        qa = ta * ta - Q(2) * ell_m * ta + Q(2) * beta_m * beta_m / ceps
        qb = tb * tb - Q(2) * ell_m * tb + Q(2) * beta_m * beta_m / ceps
        tot_v = max(qa, qb) + mu * (S0_HI + slab_ub)

        check(isinstance(sl["cap_1e10"], int), f"{cname} slab {idx}: cap_1e10 must be int")
        cap_stored = Q(sl["cap_1e10"], 10**10)
        check(tot_v <= cap_stored < ctarget,
              f"{cname} slab {idx}: tot_v={tot_v} vs stored={cap_stored} vs target={ctarget}")
        if worst_cap is None or cap_stored > worst_cap:
            worst_cap = cap_stored

    t_cov = [Q(cobj["t_covered"][0]), Q(cobj["t_covered"][1])]
    check(t_cov == [exp_t_lo, exp_t_hi], f"{cname}: t_covered mismatch")
    check(isinstance(cobj["max_cap_1e10"], int), f"{cname}: max_cap_1e10 must be int")
    max_cap_stored = Q(cobj["max_cap_1e10"], 10**10)
    check(worst_cap <= max_cap_stored < ctarget, f"{cname}: max_cap_1e10 >= target_cap")
    return (exp_t_lo, exp_t_hi, len(slabs), max_cap_stored, ctarget - max_cap_stored)


def verify_85_full_range_consumer(c85_summary, inherited_rows_override=None):
    """Verify complete 1,773-cell end-to-end closure of STATUS 8.5 (eps=149/200, K_G^C > 1.40171)
    across ALL t in [0, sqrt(pi)/2] from 100% P + C / Lean inputs."""
    eps = Q(149, 200)
    target = Q(100000, 140171)
    pad = Q(1, 10**11)
    rho_lean_93 = Q(93, 100)  # Lean SharpRadius.first_moment_le_93 (even sharper than 973612157/10^9!)

    if inherited_rows_override is not None:
        ir_data = inherited_rows_override
    else:
        raw = open(INHERITED_ROWS_JSON, "rb").read()
        check(hashlib.sha256(raw).hexdigest() == INHERITED_ROWS_SHA256,
              "inherited_rows.json SHA-256 mismatch")
        ir_data = json.loads(raw.decode("utf-8"))

    rows = [(r["name"], Q(r["ell"]), Q(r["beta"]), Q(r["cap"])) for r in ir_data["rows"]]
    check(len(rows) == 19, "inherited_rows.json must contain 19 scalar rows")

    hom_lo, hom_hi, _, hom_max_cap, _ = c85_summary
    check(hom_lo <= Q(21, 25) and hom_hi >= Q(1711, 2000),
          "c85_149_200 does not enclose [21/25, 1711/2000]")

    check(Q(1773, 2000) > R_HI, "1,773 cells [j/2000, (j+1)/2000] do not cover [0, sqrt(pi)/2]")
    ext_max_cap = Q(0)
    hom_used_cells = 0
    for j in range(1773):
        lo = Q(j, 2000)
        hi = Q(j + 1, 2000)
        best_ext = hi * hi + eps * rho_lean_93 * rho_lean_93  # crude row with Lean's 93/100 radius
        for _, ell, beta, cap in rows:
            c_lo = lo * lo - Q(2) * ell * lo + Q(2) * beta * beta / eps + cap + pad
            c_hi = hi * hi - Q(2) * ell * hi + Q(2) * beta * beta / eps + cap + pad
            v = max(c_lo, c_hi)
            if v < best_ext:
                best_ext = v

        if best_ext < target:
            if best_ext > ext_max_cap:
                ext_max_cap = best_ext
        else:
            check(hom_lo <= lo and hi <= hom_hi,
                  f"8.5 cell [{lo}, {hi}] failed exterior ({best_ext} >= {target}) and lies outside [{hom_lo}, {hom_hi}]")
            hom_used_cells += 1

    check(hom_used_cells == 31, f"Expected 31 central cells [21/25, 1711/2000], got {hom_used_cells}")
    overall_max = max(ext_max_cap, hom_max_cap)
    check(overall_max < target, "8.5 overall witness norm cap failed < 100000/140171")
    return overall_max, target - overall_max, hom_used_cells


def verify_bundle(bundle, cert_path=None, u7_override=None, b_hi_override=None,
                  rice_slope_override=None, inherited_rows_override=None):
    if cert_path is not None:
        sz = os.path.getsize(cert_path)
        check(sz < 300000, f"Certificate {cert_path} ({sz} B) exceeds 300,000 B repository limit")

    check(isinstance(bundle, dict) and bundle.get("schema") == "khom-v1", "Invalid schema != 'khom-v1'")

    b_hi_poly, _, sp_iv = build_and_verify_b_hi_poly(u7_override=u7_override, b_hi_override=b_hi_override)
    verify_rice_tangent(sp_iv, rice_slope_override=rice_slope_override)
    g_hi_poly = [b_hi_poly[0], b_hi_poly[1] - P0] + b_hi_poly[2:]

    # 1. Exempt-box-free Peak Retained covers (mu = 1, dp = 0, mode == 2 enforced on u_0 < 3/2000):
    pk = bundle["peak_covers"]
    pk_dp, u_dp, strips_dp = verify_homothety_cover("peak_dplus_exempt_free", pk["peak_dplus_exempt_free"], {
        "u_max": E0, "u_tot": U_TOT0, "mu": Q(1), "dp": Q(0),
        "use_signed_1161": False, "use_33a": False, "ell_base": None,
    }, b_hi_poly, g_hi_poly)
    pk_sg, u_sg, strips_sg = verify_homothety_cover("peak_signed_exempt_free", pk["peak_signed_exempt_free"], {
        "u_max": E0, "u_tot": U_TOT0, "mu": Q(1), "dp": Q(0),
        "use_signed_1161": True, "use_33a": False, "ell_base": None,
    }, b_hi_poly, g_hi_poly)
    pk_33a, _, _ = verify_homothety_cover("peak_33a_exempt_free", pk["peak_33a_exempt_free"], {
        "u_max": E0, "u_tot": U_TOT0, "mu": Q(1), "dp": Q(0),
        "use_signed_1161": True, "use_33a": True, "ell_base": None,
    }, b_hi_poly, g_hi_poly)

    check(pk_dp < Q(2936, 10**8), f"peak_dplus_exempt_free {pk_dp} >= 29.36e-6")
    check(pk_sg < Q(27, 10**6), f"peak_signed_exempt_free {pk_sg} >= 27.00e-6")
    check(pk_33a < Q(27, 10**6), f"peak_33a_exempt_free {pk_33a} >= 27.00e-6")

    # Verify strict exact retained K (< 0) sub-bands survive exempt-box-free mode:
    check(Q(3, 100) in u_dp, "u = 3/100 missing from peak_dplus_exempt_free")
    for i, sub in enumerate(strips_dp):
        if u_dp[i + 1] <= Q(3, 100):
            check(sub < Q(0), f"peak_dplus_exempt_free strip [{u_dp[i]}, {u_dp[i+1]}] not < 0")
    for edge in (Q(177, 5000), Q(57, 1250)):
        check(edge in u_sg, f"edge {edge} missing from peak_signed_exempt_free")
    for i, sub in enumerate(strips_sg):
        if u_sg[i + 1] <= Q(177, 5000) or u_sg[i] >= Q(57, 1250):
            check(sub < Q(0), f"peak_signed_exempt_free strip [{u_sg[i]}, {u_sg[i+1]}] not < 0")

    # 2. Track A (Pure P + C, exempt-box-free, zero 3.5a/3.3a):
    ta_specs = {
        "c85_149_200": (Q(149, 200), Q(100000, 140171), False, False, Q(839, 1000), Q(8556, 10000)),
        "c87_1891_2500": (EPS0, Q(500, 701), False, False, Q(21, 25), R_HI),
        "c813ii_94_125": (Q(94, 125), Q(500, 701), False, False, Q(21, 25), Q(8645, 10000)),
        "c813i_3_4": (Q(3, 4), Q(500, 701), False, False, Q(21, 25), Q(429, 500)),
        "c810_299_400": (Q(299, 400), Q(713263, 1000000), False, False, Q(21, 25), Q(8498, 10000)),
    }
    ta_map = bundle["track_a_pure_pc"]
    check(set(ta_map.keys()) == set(ta_specs.keys()), "track_a_pure_pc keys mismatch")
    ta_res = {
        k: verify_consumer_slabs(f"TrackA.{k}", ta_map[k], spec, b_hi_poly, g_hi_poly)
        for k, spec in ta_specs.items()
    }

    # 3. Complete 1,773-cell end-to-end verification of 8.5 (eps = 149/200 -> K_G^C > 1.40171):
    full_85 = verify_85_full_range_consumer(ta_res["c85_149_200"], inherited_rows_override=inherited_rows_override)

    # 4. Track B (Adding 3.5a buffered-Rice + 3.3a peak remote deficit):
    tb_specs = {
        "c87_1891_2500": (EPS0, Q(500, 701), True, True, Q(1679, 2000), R_HI),
        "c813ii_94_125": (Q(94, 125), Q(500, 701), True, True, Q(1679, 2000), R_HI),
        "c813i_3_4": (Q(3, 4), Q(500, 701), True, True, Q(1679, 2000), R_HI),
        "c810_299_400_lo": (Q(299, 400), Q(713263, 1000000), True, True, Q(1679, 2000), Q(8499, 10000)),
        "c810_299_400_hi": (Q(299, 400), Q(713263, 1000000), True, True, Q(1731, 2000), R_HI),
    }
    tb_map = bundle["track_b_35a_33a"]
    check(set(tb_map.keys()) == set(tb_specs.keys()), "track_b_35a_33a keys mismatch")
    tb_res = {
        k: verify_consumer_slabs(f"TrackB.{k}", tb_map[k], spec, b_hi_poly, g_hi_poly)
        for k, spec in tb_specs.items()
    }

    # 5. Cross-check row-coverage claims against SHA-256-pinned central_94_125_certificate.json
    # and central_7475_certificate.json:
    raw94 = open(CENTRAL_94_125_JSON, "rb").read()
    check(hashlib.sha256(raw94).hexdigest() == CENTRAL_94_125_SHA256,
          "central_94_125_certificate.json SHA-256 mismatch")
    c94 = json.loads(raw94.decode("utf-8"))

    rows94 = c94["eps_94_125"]["rows"]
    check(len(rows94) == 13 and Q(rows94[7]["lo"]) == Q(21, 25) and Q(rows94[12]["hi"]) == Q(863, 1000),
          "8.13(ii) Rows 8-13 boundary mismatch")
    check(ta_res["c813ii_94_125"][0] <= Q(rows94[7]["lo"]) and ta_res["c813ii_94_125"][1] >= Q(rows94[12]["hi"]),
          "Track A c813ii_94_125 failed to enclose all of Rows 8-13 [21/25, 863/1000]")

    rows34 = c94["eps_3_4"]["rows"]
    check(len(rows34) == 9 and Q(rows34[4]["lo"]) == Q(421, 500) and Q(rows34[8]["hi"]) == Q(108, 125),
          "8.13(i) Rows 5-9 boundary mismatch")
    check(ta_res["c813i_3_4"][0] <= Q(rows34[4]["lo"]) and ta_res["c813i_3_4"][1] >= Q(rows34[6]["hi"]),
          "Track A c813i_3_4 failed to enclose Rows 5-7 [421/500, 107/125]")
    check(tb_res["c813i_3_4"][0] <= Q(rows34[4]["lo"]) and tb_res["c813i_3_4"][1] >= Q(rows34[8]["hi"]),
          "Track B c813i_3_4 failed to enclose all of Rows 5-9 [421/500, 108/125] and [108/125, R_HI]")

    raw7475 = open(CENTRAL_7475_JSON, "rb").read()
    check(hashlib.sha256(raw7475).hexdigest() == CENTRAL_7475_SHA256,
          "central_7475_certificate.json SHA-256 mismatch")
    c7475 = json.loads(raw7475.decode("utf-8"))
    check(len(c7475) == 10 and Q(c7475[5]["lo"]) == Q(1683, 2000) and Q(c7475[9]["hi"]) == Q(433, 500),
          "8.10 Row 6 / Row 10 boundary mismatch")
    check(ta_res["c810_299_400"][0] <= Q(c7475[5]["lo"]) and ta_res["c810_299_400"][1] >= Q(c7475[5]["hi"]),
          "Track A c810_299_400 failed to enclose Row 6 [1683/2000, 1693/2000]")
    check(tb_res["c810_299_400_hi"][0] < Q(c7475[9]["hi"]) < tb_res["c810_299_400_hi"][1],
          "Track B c810_299_400_hi failed to overlap Row 10 upper endpoint 433/500")

    return {
        "peak_dplus": pk_dp,
        "peak_signed": pk_sg,
        "peak_33a": pk_33a,
        "track_a": ta_res,
        "track_b": tb_res,
        "full_85": full_85,
    }


def main():
    cert_path = DEFAULT_CERT if len(sys.argv) == 1 else sys.argv[1]
    with open(cert_path, "r") as f:
        bundle = json.load(f)
    res = verify_bundle(bundle, cert_path=cert_path)

    print("ALL KHOM ZERO-FLOAT EXACT RATIONAL CHECKS PASSED!")
    print("  1. Exempt-box-free Peak Retained covers (kap=0 enforced on u_0 < 3/2000):")
    print(f"     D_+ 11.61 (>=3/2000):    < {fmt_micro_ceil(res['peak_dplus'])}  (strict < 0 on [0, 3/100])")
    print(f"     Signed 11.61 (>=2/125):  < {fmt_micro_ceil(res['peak_signed'])}  (strict < 0 on [0, 177/5000] U [57/1250, 463/10000])")
    print(f"     With 3.3a (>=3/2000):    < {fmt_micro_ceil(res['peak_33a'])}")
    print("  2. End-to-end 1,773-cell full-range [0, sqrt(pi)/2] closure of 8.5 (eps=149/200, Pure P + C):")
    f_max, f_rsv, f_cells = res["full_85"]
    print(f"     All 1,773 cells < 100000/140171 (max_cap={fmt_dec(f_max, 9)}, reserve={fmt_micro_ceil(f_rsv)}, {f_cells} central cells closed)")
    print("  3. Track A (Pure P + C, exempt-box-free, zero 3.5a/3.3a) free-homothety consumer covers:")
    for k, (ta, tb, nsl, wcap, rsv) in res["track_a"].items():
        print(f"     {k:18s}: [{ta} ({fmt_dec(ta, 6)}), {tb} ({fmt_dec(tb, 6)})] "
              f"({nsl} slabs, max_cap={fmt_dec(wcap, 9)}, reserve={fmt_micro_ceil(rsv)})")
    print("  4. Track B (Adding 3.5a buffered-Rice + 3.3a peak deficit) free-homothety consumer covers:")
    for k, (ta, tb, nsl, wcap, rsv) in res["track_b"].items():
        print(f"     {k:18s}: [{ta} ({fmt_dec(ta, 6)}), {tb} ({fmt_dec(tb, 6)})] "
              f"({nsl} slabs, max_cap={fmt_dec(wcap, 9)}, reserve={fmt_micro_ceil(rsv)})")


if __name__ == "__main__":
    main()
