#!/usr/bin/env python3
"""Zero-float pure-stdlib verifier for buffered PVD (3.5), sharp complex radius (3.6),
all-profile exact remote K (3.25), and step-by-step CLT & doubling monotonicity (3.20)
on multi-driver complex Wick sums and independent Gaussian scale mixtures.

Agent-ID: gemini-21d5
Task: #730 (Refs #177, part of #34)

Modes:
  python3 -IB verify.py
      Default (~30 s) zero-float audit: AST self-check (zero floats, zero asserts),
      from-scratch 1088-bit recomputation of Schlaefli-Watson constant C_{1/4},
      analytic crossing at zeta = 19/2, small-u / small-M / small-z analytic bounds,
      m >= 13 asymptotic CLT monotonicity bound, real He_3/sqrt(6) doubling failure
      enclosure, live m = 1 Wick doubling recomputation, coarse outward consistency
      enclosures on every m = 2..12, spot verification of saved continuum slab bounds
      in result.json, plus 22 built-in adversarial controls.
  python3 -IB -O verify.py --recompute [--write-result]
      Full (~7 min) zero-float 1088-bit continuum recomputation from scratch of:
      (1) |psi_Wick(zeta)| <= (1 + (19/5)*zeta)^{-1/5} on [0, inf) (< 1 for zeta > 0),
      (2) quantitative buffered PVD gap >= (1/20) * sum(u_j^2) / (u + v)^{3/2}
          across all m >= 1, (c_1, ..., c_m) != 0, and v >= 0 (plus single Wick
          monomial radius enclosure E|H(X)|),
      (3) strict log-slope increase g'(zeta) > 0 on (0, 6/5] (g'(zeta) >= 3/2 on
          (0, 1/12]) and step-by-step CLT monotonicity E|q_{m+1}| > E|q_m| for all m >= 1,
      (4) diffuse unequal-weight doubling monotonicity E|(q_0 + q_0')/sqrt(2)| - E|q_0|
          >= (1/40) * sum(u_j^2) / u^{3/2} for all max_j u_j <= (1/7) u.
"""

import ast
import copy
import json
import math
import sys
import time
from fractions import Fraction as Q
from pathlib import Path

P = 1088
ONE = 1 << P

HERE = Path(__file__).resolve().parent
RESULT_JSON = HERE / "result.json"

ALPHA_ENV = Q(1, 5)
C1_ENV = Q(19, 5)
ZETA_CROSS = Q(19, 2)


def require(cond: bool, msg: str) -> None:
    if not cond:
        raise RuntimeError(f"CERTIFICATION FAILURE: {msg}")


def q_str(q: Q) -> str:
    return f"{q.numerator}/{q.denominator}" if q.denominator != 1 else str(q.numerator)


def fmt_dec_floor(q: Q, digits: int = 7) -> str:
    scale = 10 ** digits
    if q >= 0:
        n = (q.numerator * scale) // q.denominator
        return f"{n // scale}.{n % scale:0{digits}d}"
    aq = -q
    m = -(((-aq.numerator) * scale) // aq.denominator)
    return f"-{m // scale}.{m % scale:0{digits}d}"


def fmt_dec_ceil(q: Q, digits: int = 7) -> str:
    scale = 10 ** digits
    if q >= 0:
        n = -(((-q.numerator) * scale) // q.denominator)
        return f"{n // scale}.{n % scale:0{digits}d}"
    aq = -q
    m = (aq.numerator * scale) // aq.denominator
    return f"-{m // scale}.{m % scale:0{digits}d}" if m > 0 else f"0.{'0' * digits}"


# ---------------------------------------------------------------------------
# 1. AST self-audit: zero float literals/calls and zero assert statements
# ---------------------------------------------------------------------------

def audit_ast_source(src: str, label: str = "verify.py") -> None:
    tree = ast.parse(src, filename=label)
    for node in ast.walk(tree):
        if isinstance(node, ast.Assert):
            raise RuntimeError(f"CERTIFICATION FAILURE: bare assert forbidden in {label} (line {node.lineno})")
        if isinstance(node, ast.Constant) and type(node.value).__name__ == "float":
            raise RuntimeError(f"CERTIFICATION FAILURE: float literal forbidden in {label} (line {node.lineno})")
        if isinstance(node, ast.Call) and isinstance(node.func, ast.Name) and node.func.id == "float":
            raise RuntimeError(f"CERTIFICATION FAILURE: float() call forbidden in {label} (line {node.lineno})")


# ---------------------------------------------------------------------------
# 2. Outward-rounded 1088-bit fixed-point integer interval arithmetic
# ---------------------------------------------------------------------------

def q_to_iv(q: Q):
    num, den = q.numerator, q.denominator
    return ((num << P) // den, -(((-num) << P) // den))


def iv_add(x, y):
    return (x[0] + y[0], x[1] + y[1])


def iv_sub(x, y):
    return (x[0] - y[1], x[1] - y[0])


def iv_mul(x, y):
    p1 = x[0] * y[0]
    p2 = x[0] * y[1]
    p3 = x[1] * y[0]
    p4 = x[1] * y[1]
    return (min(p1, p2, p3, p4) >> P, -((-max(p1, p2, p3, p4)) >> P))


def _int_pow_pos(v: int, m: int):
    require(v >= 0 and m >= 0, "_int_pow_pos domain")
    lo = hi = ONE
    blo = bhi = v
    e = m
    while e > 0:
        if e & 1:
            lo = (lo * blo) >> P
            hi = -((-(hi * bhi)) >> P)
        e >>= 1
        if e > 0:
            blo = (blo * blo) >> P
            bhi = -((-(bhi * bhi)) >> P)
    return (lo, hi)


def iv_pow_int(x, m: int):
    require(m >= 0, "iv_pow_int expects m >= 0")
    if m == 0:
        return (ONE, ONE)
    if m == 1:
        return x
    a, b = x
    if m % 2 == 1:
        lo = _int_pow_pos(a, m)[0] if a >= 0 else -_int_pow_pos(-a, m)[1]
        hi = _int_pow_pos(b, m)[1] if b >= 0 else -_int_pow_pos(-b, m)[0]
        return (lo, hi)
    # Even m >= 2: u -> u^m is convex and >= 0, decreasing on (-inf, 0] and increasing on [0, inf):
    if a >= 0:
        return (_int_pow_pos(a, m)[0], _int_pow_pos(b, m)[1])
    if b <= 0:
        return (_int_pow_pos(-b, m)[0], _int_pow_pos(-a, m)[1])
    return (0, max(_int_pow_pos(-a, m)[1], _int_pow_pos(b, m)[1]))


def iv_div_int(x, d: int):
    require(d > 0, "iv_div_int expects d > 0")
    return (x[0] // d, -((-x[1]) // d))


def iv_div_pos(x, y):
    require(y[0] > 0, "iv_div_pos expects strictly positive denominator interval")
    lo = min((n << P) // d for n in x for d in y)
    hi = max(-(((-n) << P) // d) for n in x for d in y)
    return (lo, hi)


def int_nth_root_floor(n_val: int, k: int) -> int:
    require(n_val >= 0 and k >= 2, "int_nth_root_floor domain")
    if n_val == 0:
        return 0
    if k == 2:
        return math.isqrt(n_val)
    if k == 4:
        return math.isqrt(math.isqrt(n_val))
    bit_est = max(1, (n_val.bit_length() + k - 1) // k)
    x = 1 << bit_est
    while True:
        nx = ((k - 1) * x + n_val // (x ** (k - 1))) // k
        if nx >= x:
            break
        x = nx
    while (x + 1) ** k <= n_val:
        x += 1
    while x ** k > n_val:
        x -= 1
    return x


def iv_nth_root_pos(x, k: int):
    require(x[0] >= 0 and k >= 2, "iv_nth_root_pos expects non-negative interval")
    shift = (k - 1) * P
    n_lo = x[0] << shift
    lo = int_nth_root_floor(n_lo, k)
    n_hi = x[1] << shift
    hi = int_nth_root_floor(n_hi, k)
    if hi ** k < n_hi:
        hi += 1
    require(lo ** k <= n_lo and hi ** k >= n_hi, "iv_nth_root_pos exactness")
    return (lo, hi)


def iv_sqrt_pos(x):
    return iv_nth_root_pos(x, 2)


def atan_recip_iv(m: int, n_last: int = 244):
    """Outward interval for arctan(1/m) via alternating series sum_{k=0}^{n_last} (-1)^k / ((2k+1) m^{2k+1}).
    Requires even n_last >= 2 so the last included term (+1/((2*n_last+1) m^{2*n_last+1})) is positive
    and the first omitted term (-1/((2*n_last+3) m^{2*n_last+3})) is negative, enclosing arctan(1/m)
    in [acc_lo - rem_hi, acc_hi].
    """
    require(m >= 5 and n_last >= 2 and (n_last % 2 == 0), "atan_recip_iv domain/parity")
    m2 = m * m
    term = iv_div_int((ONE, ONE), m)
    acc = term
    for k in range(1, n_last + 1):
        term = iv_div_int(term, m2)
        t_div = iv_div_int(term, 2 * k + 1)
        acc = iv_sub(acc, t_div) if (k & 1) else iv_add(acc, t_div)
    rem = iv_div_int(iv_div_int(term, m2), 2 * n_last + 3)
    return (acc[0] - rem[1], acc[1])


def compute_pi_iv():
    a5 = atan_recip_iv(5)
    a239 = atan_recip_iv(239)
    p4 = iv_sub((4 * a5[0], 4 * a5[1]), a239)
    return (4 * p4[0], 4 * p4[1])


def compute_ln2_iv():
    """ln 2 = 2 * atanh(1/3) = 2 * sum_{k>=0} 1 / ((2k+1) * 3^{2k+1})."""
    term = iv_div_int((2 * ONE, 2 * ONE), 3)
    acc = term
    for k in range(1, 360):
        term = iv_div_int(term, 9)
        acc = iv_add(acc, iv_div_int(term, 2 * k + 1))
    # Remainder <= (term / 9) / (2*360 + 1) * (1 / (1 - 1/9)) = term / (8 * 721):
    rem = iv_div_int(term, 8 * 721)[1]
    return (acc[0], acc[1] + rem)


LN2_IV = compute_ln2_iv()


def exp_neg_iv_from_iv(y_iv, n_terms: int = 166):
    """Outward interval for exp(-y) given y_iv = (y_lo, y_hi) with y_lo >= 0.
    For an alternating series sum_{k>=0} (-1)^k t_k stopped at k = n_terms - 1 with even n_terms >= 20,
    the last included term (k = n_terms - 1) is negative and the first omitted term (k = n_terms) is positive,
    so the truncation remainder lies in [0, t_{n_terms}]."""
    require(y_iv[0] >= 0 and n_terms >= 20 and (n_terms % 2 == 0), "exp_neg_iv_from_iv domain/parity")

    def eval_pt(y_int: int):
        if y_int == 0:
            return (ONE, ONE)
        m = 0
        yt_lo = yt_hi = y_int
        half = ONE >> 1
        while yt_hi > half:
            yt_lo >>= 1
            yt_hi = (yt_hi + 1) >> 1
            m += 1
        t_lo = t_hi = acc_lo = acc_hi = ONE
        for k in range(1, n_terms):
            p_lo = (t_lo * yt_lo) >> P
            p_hi = -((-(t_hi * yt_hi)) >> P)
            t_lo = p_lo // k
            t_hi = -((-p_hi) // k)
            if k & 1:
                acc_lo -= t_hi
                acc_hi -= t_lo
            else:
                acc_lo += t_lo
                acc_hi += t_hi
        rem_hi = -((-(-((-(t_hi * yt_hi)) >> P))) // n_terms)
        r_lo, r_hi = max(0, acc_lo), acc_hi + rem_hi
        for _ in range(m):
            r_lo = (r_lo * r_lo) >> P
            r_hi = -((-(r_hi * r_hi)) >> P)
        return (r_lo, r_hi)

    e_hi = eval_pt(y_iv[0])[1]
    e_lo = eval_pt(y_iv[1])[0]
    return (max(0, e_lo), e_hi)


def exp_neg_iv(y: Q, n_terms: int = 166):
    require(y >= 0, "exp_neg_iv expects y >= 0")
    return exp_neg_iv_from_iv(q_to_iv(y), n_terms=n_terms)


def exp_pos_iv(y: Q):
    return iv_div_pos((ONE, ONE), exp_neg_iv(y))


def iv_ln_pos(x_iv):
    """Outward interval for ln(x) given strictly positive fixed-point interval x_iv = (x_lo, x_hi)."""
    require(x_iv[0] > 0 and x_iv[0] <= x_iv[1], "iv_ln_pos expects 0 < x_lo <= x_hi")

    def ln_pt(x_int: int):
        k = x_int.bit_length() - 1 - P
        if k >= 0:
            y_lo = x_int >> k
            y_hi = -((-x_int) >> k)
        else:
            y_lo = y_hi = x_int << (-k)
        # Adjust k by +/-1 if needed so y in [3/4, 3/2]:
        if y_hi > (3 * ONE) // 2:
            k += 1
            y_lo >>= 1
            y_hi = (y_hi + 1) >> 1
        elif y_lo < (3 * ONE) // 4:
            k -= 1
            y_lo <<= 1
            y_hi <<= 1
        y_iv = (y_lo, y_hi)
        # u = (y - 1) / (y + 1) in [-1/5, 1/5]:
        u_iv = iv_div_pos(iv_sub(y_iv, (ONE, ONE)), iv_add(y_iv, (ONE, ONE)))
        require(5 * max(abs(u_iv[0]), abs(u_iv[1])) <= ONE + 8, "iv_ln_pos range reduction |u| <= 1/5")
        u2 = iv_mul(u_iv, u_iv)
        term = (2 * u_iv[0], 2 * u_iv[1])
        acc = term
        for j in range(1, 250):
            term = iv_mul(term, u2)
            acc = iv_add(acc, iv_div_int(term, 2 * j + 1))
        # Geometric tail <= |term| * (1/23) / 501:
        t_abs = max(abs(term[0]), abs(term[1]))
        rem = -((-t_abs) // (23 * 501))
        k_ln2 = (k * LN2_IV[0], k * LN2_IV[1]) if k >= 0 else (k * LN2_IV[1], k * LN2_IV[0])
        return (acc[0] - rem + k_ln2[0], acc[1] + rem + k_ln2[1])

    return (ln_pt(x_iv[0])[0], ln_pt(x_iv[1])[1])


# Self-check ln and exp consistency at module load:
for _tq in [Q(1, 7), Q(3, 5), Q(1), Q(19, 5), Q(81, 5)]:
    _tiv = q_to_iv(_tq)
    _ln = iv_ln_pos(_tiv)
    if _tq >= 1:
        _rec = iv_div_pos((ONE, ONE), exp_neg_iv_from_iv(_ln))
    else:
        _rec = exp_neg_iv_from_iv((-_ln[1], -_ln[0]))
    require(_rec[0] <= _tiv[0] and _tiv[1] <= _rec[1], f"ln/exp roundtrip self-check failed at {_tq}")


# ---------------------------------------------------------------------------
# 3. Schlaefli-Watson constant C_{1/4}, real He_3 failure, & Bessel context
# ---------------------------------------------------------------------------

def compute_schlaefli_watson_and_real_he3():
    """Computes:
    (1) C_{1/4} = (2^{1/4} / sqrt(pi)) * int_0^inf R^{-1/4} |R - 2|^{-1/2} e^{-R} dR,
        and verifies C_{1/4}^5 * (zeta_0^{-5/4} + (19/5) * zeta_0^{-1/4}) < 1 at zeta_0 = 19/2;
    (2) Real third-chaos doubling failure E|(h_3(G_1) + h_3(G_2))/sqrt(2)| - E|h_3(G)| < -1/80 < 0.
    """
    pi_iv = compute_pi_iv()
    sqpi_iv = iv_sqrt_pos(pi_iv)
    two_q14 = iv_nth_root_pos((2 * ONE, 2 * ONE), 4)
    pref = iv_div_pos(two_q14, sqpi_iv)

    # Piece 1: [0, 1] via R = t^4, int_0^1 4 t^2 (2 - t^4)^{-1/2} e^{-t^4} dt:
    n1 = 1500
    dt1 = Q(1, n1)
    dt1_iv = q_to_iv(dt1)
    i1_lo = i1_hi = 0
    for k in range(n1):
        tk = k * dt1
        tk1 = (k + 1) * dt1
        # t^2 (2 - t^4)^{-1/2} is strictly increasing; e^{-t^4} is strictly decreasing:
        inc_lo = iv_div_pos(q_to_iv(4 * tk * tk), iv_sqrt_pos(q_to_iv(2 - tk ** 4)))[0]
        inc_hi = iv_div_pos(q_to_iv(4 * tk1 * tk1), iv_sqrt_pos(q_to_iv(2 - tk1 ** 4)))[1]
        i1_lo += iv_mul((inc_lo, inc_lo), iv_mul(exp_neg_iv(tk1 ** 4, 28), dt1_iv))[0]
        i1_hi += iv_mul((inc_hi, inc_hi), iv_mul(exp_neg_iv(tk ** 4, 28), dt1_iv))[1]

    # Piece 2: [1, 2] via 2 - R = t^2, int_0^1 2 (2 - t^2)^{-1/4} e^{-(2 - t^2)} dt (strictly increasing in t):
    n2 = 1000
    dt2 = Q(1, n2)
    dt2_iv = q_to_iv(dt2)
    i2_lo = i2_hi = 0
    for k in range(n2):
        tk = k * dt2
        tk1 = (k + 1) * dt2
        f_tk_lo = iv_mul(iv_div_pos((2 * ONE, 2 * ONE), iv_nth_root_pos(q_to_iv(2 - tk * tk), 4)), exp_neg_iv(2 - tk * tk, 28))[0]
        f_tk1_hi = iv_mul(iv_div_pos((2 * ONE, 2 * ONE), iv_nth_root_pos(q_to_iv(2 - tk1 * tk1), 4)), exp_neg_iv(2 - tk1 * tk1, 28))[1]
        i2_lo += iv_mul((f_tk_lo, f_tk_lo), dt2_iv)[0]
        i2_hi += iv_mul((f_tk1_hi, f_tk1_hi), dt2_iv)[1]

    # Piece 3: [2, 3] via R - 2 = t^2, int_0^1 2 (2 + t^2)^{-1/4} e^{-(2 + t^2)} dt (strictly decreasing in t):
    n3 = 800
    dt3 = Q(1, n3)
    dt3_iv = q_to_iv(dt3)
    i3_lo = i3_hi = 0
    for k in range(n3):
        tk = k * dt3
        tk1 = (k + 1) * dt3
        f_tk_hi = iv_mul(iv_div_pos((2 * ONE, 2 * ONE), iv_nth_root_pos(q_to_iv(2 + tk * tk), 4)), exp_neg_iv(2 + tk * tk, 28))[1]
        f_tk1_lo = iv_mul(iv_div_pos((2 * ONE, 2 * ONE), iv_nth_root_pos(q_to_iv(2 + tk1 * tk1), 4)), exp_neg_iv(2 + tk1 * tk1, 28))[0]
        i3_lo += iv_mul((f_tk1_lo, f_tk1_lo), dt3_iv)[0]
        i3_hi += iv_mul((f_tk_hi, f_tk_hi), dt3_iv)[1]

    # Piece 4: [3, 9] (strictly decreasing R^{-1/4} (R - 2)^{-1/2} e^{-R}) + [9, inf) <= 9^{-1/4} 7^{-1/2} e^{-9}:
    n4 = 600
    dr4 = Q(6, n4)
    dr4_iv = q_to_iv(dr4)
    i4_lo = i4_hi = 0
    for k in range(n4):
        rk = Q(3) + k * dr4
        rk1 = Q(3) + (k + 1) * dr4
        den_k = iv_mul(iv_nth_root_pos(q_to_iv(rk), 4), iv_sqrt_pos(q_to_iv(rk - 2)))
        den_k1 = iv_mul(iv_nth_root_pos(q_to_iv(rk1), 4), iv_sqrt_pos(q_to_iv(rk1 - 2)))
        fk_hi = iv_div_pos(exp_neg_iv(rk, 28), den_k)[1]
        fk1_lo = iv_div_pos(exp_neg_iv(rk1, 28), den_k1)[0]
        i4_lo += iv_mul((fk1_lo, fk1_lo), dr4_iv)[0]
        i4_hi += iv_mul((fk_hi, fk_hi), dr4_iv)[1]
    tail9_hi = iv_div_pos(exp_neg_iv(Q(9)), iv_mul(iv_nth_root_pos(q_to_iv(Q(9)), 4), iv_sqrt_pos(q_to_iv(Q(7)))))[1]

    tot_iv = (i1_lo + i2_lo + i3_lo + i4_lo, i1_hi + i2_hi + i3_hi + i4_hi + tail9_hi)
    c14_iv = iv_mul(pref, tot_iv)

    SCALE7 = 10 ** 7
    c14_lo_q = Q((c14_iv[0] * SCALE7) >> P, SCALE7)
    c14_hi_q = Q(-(((-c14_iv[1]) * SCALE7) >> P), SCALE7)
    require(Q(84, 100) < c14_lo_q < c14_hi_q < Q(17, 20), "C_{1/4} enclosure in (0.84, 0.85)")

    # Verify crossing at ZETA_CROSS = 19/2: C_{1/4}^5 * (zeta_0^{-5/4} + (19/5) * zeta_0^{-1/4}) < 1:
    z0_q14 = iv_nth_root_pos(q_to_iv(ZETA_CROSS), 4)
    inv_z0_14 = iv_div_pos((ONE, ONE), z0_q14)
    inv_z0_54 = iv_div_pos(inv_z0_14, q_to_iv(ZETA_CROSS))
    cross_fac = iv_add(inv_z0_54, iv_mul(q_to_iv(C1_ENV), inv_z0_14))
    cross_prod = iv_mul(iv_pow_int(c14_iv, 5), cross_fac)
    cross_hi_q = Q(-(((-cross_prod[1]) * SCALE7) >> P), SCALE7)
    require(cross_prod[1] < ONE and cross_hi_q < 1, "Schlaefli-Watson crossing at zeta = 19/2 failed")

    # Real third-chaos doubling failure:
    # h_3(G) = (G^3 - 3G)/sqrt(6) => E|h_3(G)| = (1 + 4 e^{-3/2}) / sqrt(3 pi).
    # Rotating to U = (G_1 + G_2)/sqrt(2), V = (G_1 - G_2)/sqrt(2) ~ N(0,1) iid gives
    # (h_3(G_1) + h_3(G_2))/sqrt(2) = U(U^2 + 3V^2 - 6) / (2*sqrt(6)).
    # Integrating u >= 0 first via w = u^2/2 and then v >= 0 against (2/pi) e^{-(u^2+v^2)/2} yields
    # E|(h_3(G_1) + h_3(G_2))/sqrt(2)| = (1/(pi*sqrt(6))) * (6*sqrt(2)*e^{-1} + 2*sqrt(2)*int_0^1 e^{-t^2} dt
    #   + 4*e^{-3}*int_0^{sqrt(2)} e^{v^2} dv - sqrt(pi/2)).
    sq3pi = iv_sqrt_pos(iv_mul((3 * ONE, 3 * ONE), pi_iv))
    e_neg_32 = exp_neg_iv(Q(3, 2))
    eh3_1 = iv_div_pos((ONE + 4 * e_neg_32[0], ONE + 4 * e_neg_32[1]), sq3pi)

    # Exact closed form for E|(h_3(G_1) + h_3(G_2))/sqrt(2)|:
    # Inner integral over u >= 0 (w = u^2/2): 3v^2 - 4 for v >= sqrt(2), and 4 - 3v^2 + 4 e^{-3 + 3v^2/2} for 0 <= v < sqrt(2).
    # Outer integral over v >= 0 against (1 / (pi * sqrt(6))) * e^{-v^2/2} dv:
    #   int_0^inf (3v^2 - 4) e^{-v^2/2} dv = -sqrt(pi/2),
    #   2 int_0^{sqrt(2)} (4 - 3v^2) e^{-v^2/2} dv = 6*sqrt(2)*e^{-1} + 2*sqrt(2)*int_0^1 e^{-t^2} dt,
    #   4 e^{-3} int_0^{sqrt(2)} e^{v^2} dv = 4*sqrt(2)*e^{-3}*sum_{k>=0} 2^k / (k!*(2k+1)).
    sq2 = iv_sqrt_pos((2 * ONE, 2 * ONE))
    erf1_acc = (0, 0)
    daw_acc = (0, 0)
    pow2 = 1
    fact = 1
    for k in range(160):
        if k > 0:
            pow2 <<= 1
            fact *= k
        t_erf = q_to_iv(Q(1, fact * (2 * k + 1)))
        erf1_acc = iv_sub(erf1_acc, t_erf) if (k & 1) else iv_add(erf1_acc, t_erf)
        daw_acc = iv_add(daw_acc, q_to_iv(Q(pow2, fact * (2 * k + 1))))
    rem_erf1 = q_to_iv(Q(1, fact * 160 * 321))[1]
    rem_daw = q_to_iv(Q(1 << 161, fact * 160 * 321))[1]
    int_em_t2 = (erf1_acc[0], erf1_acc[1] + rem_erf1)
    int_ev2 = iv_mul(sq2, (daw_acc[0], daw_acc[1] + rem_daw))
    term_em = iv_mul((6 * ONE, 6 * ONE), iv_mul(sq2, exp_neg_iv(Q(1))))
    term_erf = iv_mul((2 * ONE, 2 * ONE), iv_mul(sq2, int_em_t2))
    term_daw = iv_mul((4 * exp_neg_iv(Q(3))[0], 4 * exp_neg_iv(Q(3))[1]), int_ev2)
    sq_pi_half = iv_sqrt_pos(iv_div_int(pi_iv, 2))
    bracket = iv_sub(iv_add(iv_add(term_em, term_erf), term_daw), sq_pi_half)
    denom_2 = iv_mul(pi_iv, iv_sqrt_pos((6 * ONE, 6 * ONE)))
    eh3_2 = iv_div_pos(bracket, denom_2)
    require(q_to_iv(Q(61646, 100000))[1] < eh3_1[0] <= eh3_1[1] < q_to_iv(Q(61647, 100000))[0], "E|h_3(G)| enclosure check")
    require(q_to_iv(Q(60381, 100000))[1] < eh3_2[0] <= eh3_2[1] < q_to_iv(Q(60382, 100000))[0], "E|(h_3(G_1)+h_3(G_2))/sqrt(2)| enclosure check")
    diff_real = iv_sub(eh3_2, eh3_1)

    r_lo_q = Q((diff_real[0] * SCALE7) >> P, SCALE7)
    r_hi_q = Q(-(((-diff_real[1]) * SCALE7) >> P), SCALE7)
    require(r_hi_q < -Q(1, 80) < 0, f"real He_3 doubling must fail (< -1/80), got [{r_lo_q}, {r_hi_q}]")

    return c14_iv, {
        "C_quarter_enclosure": [q_str(c14_lo_q), q_str(c14_hi_q)],
        "zeta_cross_19_2_power5_product_upper": q_str(cross_hi_q),
        "real_he3_single_enclosure": [
            q_str(Q((eh3_1[0] * SCALE7) >> P, SCALE7)),
            q_str(Q(-(((-eh3_1[1]) * SCALE7) >> P), SCALE7)),
        ],
        "real_he3_doubled_enclosure": [
            q_str(Q((eh3_2[0] * SCALE7) >> P, SCALE7)),
            q_str(Q(-(((-eh3_2[1]) * SCALE7) >> P), SCALE7)),
        ],
        "real_he3_doubling_gain_enclosure": [q_str(r_lo_q), q_str(r_hi_q)],
    }


def inc_gamma_table(S_trunc: int, max_n: int):
    e_neg_S = exp_neg_iv(Q(S_trunc))
    n_top = max(max_n, 6 * S_trunc)
    require(2 * S_trunc <= n_top + 2, "2S <= N + 2")
    s_pow_top = S_trunc ** (n_top + 1)
    term = iv_div_int((s_pow_top * e_neg_S[0], s_pow_top * e_neg_S[1]), n_top + 1)
    acc = term
    for m in range(1, 450):
        term = iv_div_int((S_trunc * term[0], S_trunc * term[1]), n_top + 1 + m)
        acc = iv_add(acc, term)
    tail_hi = iv_div_int((2 * S_trunc * term[1], 2 * S_trunc * term[1]), n_top + 1 + 450)[1]
    cur = (acc[0], acc[1] + tail_hi)
    table = [None] * (n_top + 1)
    table[n_top] = cur
    sn = S_trunc ** n_top
    for n in range(n_top, 0, -1):
        cur = iv_div_int(iv_add(cur, (sn * e_neg_S[0], sn * e_neg_S[1])), n)
        table[n - 1] = cur
        sn //= S_trunc
    return table[: max_n + 1], e_neg_S


def upper_gamma_int(S_trunc: int, k: int, e_neg_S):
    fk = math.factorial(k)
    poly = sum((fk // math.factorial(j)) * (S_trunc ** j) for j in range(k + 1))
    return (poly * e_neg_S[0], poly * e_neg_S[1])


def choose_k(x_q: Q, k_cap: int) -> int:
    if x_q == 0:
        return 2
    sq = math.isqrt(int(x_q) + 1) + 1
    return min(k_cap, max(32, 3 * sq + 45))


class WickEngine:
    """1088-bit Bessel-moment evaluator for psi_Wick(zeta) and Delta_Wick(zeta) up to zeta = 15."""

    def __init__(self, full_range: bool = True):
        s0 = 14
        i_tab_s0, _ = inc_gamma_table(s0, 12)
        w2_s0 = (0, 0)
        for j in range(5):
            c = math.comb(4, j) * ((-2) ** (4 - j))
            iv = i_tab_s0[2 + j]
            w2_s0 = iv_add(w2_s0, (c * iv[0], c * iv[1]) if c >= 0 else (c * iv[1], c * iv[0]))
        w3_s0 = (0, 0)
        for j in range(7):
            c = math.comb(6, j) * ((-2) ** (6 - j))
            iv = i_tab_s0[3 + j]
            w3_s0 = iv_add(w3_s0, (c * iv[0], c * iv[1]) if c >= 0 else (c * iv[1], c * iv[0]))
        self.c2_small_lo = w2_s0[0] // 16 - (ONE >> 1)
        self.c3_small_hi = -((-w3_s0[1]) // 288)
        self.pos_small_z2_coef = self.c2_small_lo - iv_div_int((self.c3_small_hi,) * 2, 50)[1]
        require(100 * self.pos_small_z2_coef > 505 * ONE, "positivity > 505/100 on (0, 1/50]")

        self.S = 23
        self.z_cap = Q(15) if full_range else Q(10)
        self.max_k = 920 if full_range else 745
        self.I_tab, self.eS = inc_gamma_table(self.S, 3 * self.max_k + 6)
        self.FACT = [math.factorial(k) for k in range(self.max_k + 3)]

        self.K_W = 905 if full_range else 730
        poly_r2 = [1]
        self.w_wick = []
        i_tab = self.I_tab
        for m_deg in range(2 * self.K_W + 2):
            if m_deg % 2 == 0:
                s_lo = s_hi = 0
                k = m_deg // 2
                for j, c in enumerate(poly_r2):
                    lo_j, hi_j = i_tab[k + j]
                    if c >= 0:
                        s_lo += c * lo_j
                        s_hi += c * hi_j
                    else:
                        s_lo += c * hi_j
                        s_hi += c * lo_j
                require(s_lo >= 0, f"negative w_wick[{k}] lower bound")
                self.w_wick.append((s_lo, s_hi))
            nxt = [0] * (len(poly_r2) + 1)
            for j, c in enumerate(poly_r2):
                nxt[j] -= 2 * c
                nxt[j + 1] += c
            poly_r2 = nxt

        self.sw_max = self.S * ((self.S - 2) ** 2)  # 23 * 441 = 10143
        self.ug3_S = upper_gamma_int(self.S, 3, self.eS)[1]

    def eval_psi_and_delta_jet1(self, z_q: Q):
        """Returns (psi_iv, dpsi_iv, delta_iv, ddelta_iv) at exact rational z_q in [0, z_cap]."""
        require(0 <= z_q <= self.z_cap, f"z_q={z_q} out of [0, {self.z_cap}]")
        x_q = (z_q / 2) * self.sw_max
        k_use = choose_k(x_q, self.K_W - 2)
        require(x_q < k_use * k_use, "eval_psi_and_delta_jet1 series convergence")
        zh_lo, zh_hi = q_to_iv(z_q / 2)
        pz_lo = pz_hi = ONE
        ap_lo = ap_hi = adp_lo = adp_hi = 0
        w_arr = self.w_wick
        f_arr = self.FACT
        for k in range(k_use):
            if k > 0:
                pz_lo = (pz_lo * zh_lo) >> P
                pz_hi = -((-(pz_hi * zh_hi)) >> P)
            fk = f_arr[k]
            fk2 = fk * fk
            fk2_1 = fk2 * (k + 1)
            wk_lo, wk_hi = w_arr[k]
            wk1_lo, wk1_hi = w_arr[k + 1]
            tp_lo = ((pz_lo * wk_lo) >> P) // fk2
            tp_hi = -((-(-((-(pz_hi * wk_hi)) >> P))) // fk2)
            tdp_lo = ((pz_lo * wk1_lo) >> P) // fk2_1
            tdp_hi = -((-(-((-(pz_hi * wk1_hi)) >> P))) // fk2_1)
            if k & 1:
                ap_lo -= tp_hi
                ap_hi -= tp_lo
                adp_lo -= tdp_hi
                adp_hi -= tdp_lo
            else:
                ap_lo += tp_lo
                ap_hi += tp_hi
                adp_lo += tdp_lo
                adp_hi += tdp_hi
        acc_p = (ap_lo, ap_hi)
        acc_dp = (adp_lo, adp_hi)
        pow_k = ((pz_lo * zh_lo) >> P, -((-(pz_hi * zh_hi)) >> P))
        sw_pow = q_to_iv(Q(self.sw_max ** k_use))
        trunc_p = iv_div_int(iv_mul(pow_k, sw_pow), self.FACT[k_use] ** 2)
        err_p = self.eS[1] + trunc_p[1]
        psi_iv = (acc_p[0] - err_p, acc_p[1] + err_p)

        trunc_dp = iv_div_int(iv_mul(pow_k, sw_pow), self.FACT[k_use] * self.FACT[k_use + 1])
        err_dp = (self.ug3_S + trunc_dp[1] * self.sw_max + 1) // 2
        dpsi_iv = (-((acc_dp[1] + 1) // 2) - err_dp, -(acc_dp[0] // 2) + err_dp)

        ez = exp_neg_iv(z_q)
        delta_iv = iv_sub(psi_iv, ez)
        ddelta_iv = iv_add(dpsi_iv, ez)
        return psi_iv, dpsi_iv, delta_iv, ddelta_iv


def taylor_curv_psi(z0: Q, za: Q, zb: Q, m2_override=None) -> Q:
    """Decreasing upper bound min(22, 1/zeta) on |psi_Wick''(zeta)| over hull({z0}, [za, zb])."""
    require(z0 >= 0 and 0 <= za <= zb, "invalid Taylor segment endpoints for psi_Wick")
    z_seg_lo = min(z0, za)
    req = min(Q(22), Q(1) / z_seg_lo) if z_seg_lo > 0 else Q(22)
    if m2_override is not None:
        require(m2_override >= req, f"psi_Wick curvature {m2_override} < {req} on [{z_seg_lo}, {max(z0, zb)}]")
        return m2_override
    return req


def taylor_curv_delta(z0: Q, za: Q, zb: Q, m2_override=None) -> Q:
    """Decreasing upper bound min(23, 1/zeta + 1) on |Delta_Wick''(zeta)| over hull({z0}, [za, zb])."""
    require(z0 >= 0 and 0 <= za <= zb, "invalid Taylor segment endpoints for Delta_Wick")
    z_seg_lo = min(z0, za)
    req = min(Q(23), Q(1) / z_seg_lo + 1) if z_seg_lo > 0 else Q(23)
    if m2_override is not None:
        require(m2_override >= req, f"Delta_Wick curvature {m2_override} < {req} on [{z_seg_lo}, {max(z0, zb)}]")
        return m2_override
    return req


def enclose_jet1_on_interval(f_iv, df_iv, z0: Q, za: Q, zb: Q, m2: Q):
    """Encloses f([za, zb]) via 1st-order Taylor at z0 with |f''| <= m2 on hull({z0}, [za, zb]).
    The upper quadratic Taylor model is convex in z and the lower model is concave in z,
    so their respective extrema over [za, zb] are attained at the endpoints {za, zb}."""
    ra = abs(za - z0)
    rb = abs(zb - z0)
    qa = q_to_iv(Q(1, 2) * m2 * ra * ra)[1]
    qb = q_to_iv(Q(1, 2) * m2 * rb * rb)[1]
    da = iv_mul(df_iv, q_to_iv(za - z0))
    db = iv_mul(df_iv, q_to_iv(zb - z0))
    lo = min(f_iv[0] + da[0] - qa, f_iv[0] + db[0] - qb)
    hi = max(f_iv[1] + da[1] + qa, f_iv[1] + db[1] + qb)
    return (lo, hi)


# ---------------------------------------------------------------------------
# 4. Analytic helpers checked in BOTH fast and recompute modes
# ---------------------------------------------------------------------------

def verify_fast_analytic_lemmas():
    """Verifies:
    (1) Small-zeta algebraic envelope on (0, 1/50]: (1 - z + 11 z^2)^5 * (1 + (19/5) z) < 1;
    (2) Near-zero log-slope lower bound g'(z) >= 3/2 on (0, 1/200];
    (3) Small-w PVD main integral F_pos(w) / w^2 > 19/50 on (0, 1/50];
    (4) Small-M PVD tail T_PVD(M) / M^2 < 7/25 on (0, 1/5];
    (5) Asymptotic m >= 13 step-by-step CLT monotonicity E|q_{m+1}| - E|q_m| >= 1 / (25 m(m+1)) > 0;
    (6) Single Wick monomial exact radius enclosure E|H(X)| in (0, sqrt(pi)/2).
    """
    # (1) Expand P(z) = (1 - z + 11 z^2)^5 * (1 + 19/5 z) = 1 - (6/5) z + sum_{k=2}^{11} a_k z^k:
    poly = [Q(1)]
    fac = [Q(1), Q(-1), Q(11)]
    for _ in range(5):
        nxt = [Q(0)] * (len(poly) + 2)
        for i, a in enumerate(poly):
            for j, b in enumerate(fac):
                nxt[i + j] += a * b
        poly = nxt
    full = [Q(0)] * (len(poly) + 1)
    for i, a in enumerate(poly):
        full[i] += a
        full[i + 1] += Q(19, 5) * a
    require(full[0] == 1 and full[1] == -Q(6, 5), "small-zeta algebraic envelope linear term must be -6/5")
    rem_1_50 = sum(abs(full[k]) * (Q(1, 50) ** (k - 1)) for k in range(2, len(full)))
    require(rem_1_50 < Q(6, 5), "small-zeta algebraic envelope fails at z = 1/50")

    # (2) Near-zero g'(z) >= 3/2 on (0, 1/200]:
    # |psi'''(z)| <= (1/48) E[R^3 (R - 2)^6] = 90816 / 48 = 1892.
    e_r3_r2_6 = sum(math.comb(6, j) * ((-2) ** (6 - j)) * math.factorial(3 + j) for j in range(7))
    require(e_r3_r2_6 == 90816 and Q(e_r3_r2_6, 48) == 1892, "exact moment E[R^3(R-2)^6]/48 == 1892")
    # On z in (0, 1/200]:
    # psi'(z) >= -1 + 22 z - (1892/2) z^2 = -1 + 22 z - 946 z^2;
    # psi(z)  >= 1 - z + 11 z^2 - (946/3) z^3, and t = 1 - psi(z) in [z - 11 z^2, z].
    # Since -x ln(x) >= t(1 - t)(2 + t)/2 = t - t^2/2 - t^3/2 for x = 1 - t in (0, 1]:
    # -psi(z) ln(psi(z)) >= (z - 11 z^2) - z^2/2 - z^3/2 = z - (23/2) z^2 - z^3/2.
    # Add z psi'(z) >= -z + 22 z^2 - 946 z^3:
    # N(z) = z psi'(z) - psi(z) ln(psi(z)) >= (21/2) z^2 - (1893/2) z^3.
    # Since psi(z) <= 1, g'(z) = N(z) / (z^2 psi(z)) >= 21/2 - (1893/2) z >= 21/2 - 1893/400 = 2307/400 > 3/2:
    require(Q(21, 2) - Q(1893, 2) * Q(1, 200) == Q(2307, 400) > Q(3, 2), "analytic g'(z) > 3/2 on (0, 1/200]")

    # (3) Small-w PVD main integral on (0, 1/50]:
    # int_0^1 sqrt(xi) e^{-xi} dxi via 200 panels (t = sqrt(xi), int_0^1 2 t^2 e^{-t^2} dt):
    int_sq_exp_lo = 0
    dt_iv = q_to_iv(Q(1, 200))
    for k in range(200):
        tk = Q(k, 200)
        tk1 = Q(k + 1, 200)
        int_sq_exp_lo += iv_mul(q_to_iv(2 * tk * tk), iv_mul(exp_neg_iv(tk1 * tk1), dt_iv))[0]
    f_pos_small_lb = iv_mul(q_to_iv(Q(1, 2) * Q(505, 100)), (int_sq_exp_lo, int_sq_exp_lo))[0]
    require(f_pos_small_lb > q_to_iv(Q(19, 50))[1], "F_pos(w)/w^2 > 19/50 on (0, 1/50]")

    # (4) Small-M PVD tail on (0, 1/5]:
    # Monotone logarithmic derivative on (0, 1/5]: (1/5)*ln(81/5) > (3/2)*(1/5) = 3/10:
    ln_81_5_lo = iv_ln_pos(q_to_iv(Q(81, 5)))[0]
    require(iv_div_int((ln_81_5_lo, ln_81_5_lo), 5)[0] > q_to_iv(Q(3, 10))[1], "d/dM [M^{-3/2} (81/5)^{-1/(5M)}] > 0 on (0, 1/5]")
    # Evaluate bound at M = 1/5: T_PVD(1/5) / (1/5)^2 = (25 / (2*sqrt(5))) * int_4^inf z^{-3/2} [(1 + 19/5 z)^{-1} + e^{-5 z}] dz
    # <= (25 / (2*sqrt(5))) * [ (5/19) * int_4^inf z^{-5/2} dz + (1/8) * int_4^inf e^{-5z} dz ]
    # = (25 / (2*sqrt(5))) * [ (5/19) * (2/3) * (1/8) + e^{-20} / 40 ]:
    pref_m15 = iv_div_pos(q_to_iv(Q(25, 2)), iv_sqrt_pos(q_to_iv(Q(5))))
    br_m15 = iv_add(q_to_iv(Q(5, 19 * 12)), iv_div_int(exp_neg_iv(Q(20)), 40))
    t_m15_over_m2 = iv_mul(pref_m15, br_m15)[1]
    require(t_m15_over_m2 < q_to_iv(Q(7, 25))[0], "T_PVD(M)/M^2 < 7/25 on (0, 1/5]")

    # (5) Asymptotic m >= 13 step-by-step CLT monotonicity:
    # Pos(m) >= (3/8) * int_0^1 sqrt(xi) e^{-xi} dxi / (m(m+1)):
    pos_m_coef_lo = iv_mul(q_to_iv(Q(3, 8)), (int_sq_exp_lo, int_sq_exp_lo))[0]
    require(pos_m_coef_lo > q_to_iv(Q(14, 100))[1], "Pos(m) * m(m+1) > 14/100")
    # Tail for m >= 13 on xi > (6/5)*m (z = xi/m > z0 := 6/5):
    # For m >= 13, m/(m+1) >= 13/14, so c2 := (19/5)*(13/14) = 247/70 is fixed.
    # By weighted AM-GM on z >= z0: 1 + c*z >= (1 + c*z0) * (z / z0)^theta with theta = c*z0 / (1 + c*z0),
    # giving int_{z0}^inf z^{-3/2} (1 + c*z)^{-a} dz <= z0^{-1/2} (1 + c*z0)^{-a} / (a*theta + 1/2).
    z0_clt = Q(6, 5)
    c1_clt = Q(19, 5)
    c2_clt = Q(19, 5) * Q(13, 14)
    base1_clt = 1 + c1_clt * z0_clt  # 139/25
    base2_clt = 1 + c2_clt * z0_clt  # 916/175
    require(base1_clt == Q(139, 25) and base2_clt == Q(916, 175) and base2_clt > Q(5, 1), "CLT base constants")
    ln_5_lo = iv_ln_pos(q_to_iv(Q(5)))[0]
    require(iv_div_int((ln_5_lo, ln_5_lo), 5)[0] > q_to_iv(Q(2, 13))[1], "m(m+1)*T_step(m) strictly decreasing for m >= 13")
    m0 = 13
    th1_clt = (c1_clt * z0_clt) / base1_clt
    th2_clt = (c2_clt * z0_clt) / base2_clt
    z0_inv_sq_hi = iv_sqrt_pos(q_to_iv(Q(1) / z0_clt))[1]
    a1_pow_hi = exp_neg_iv_from_iv(iv_mul(q_to_iv(Q(m0, 5)), iv_ln_pos(q_to_iv(base1_clt))))[1]
    a2_pow_hi = exp_neg_iv_from_iv(iv_mul(q_to_iv(Q(m0 + 1, 5)), iv_ln_pos(q_to_iv(base2_clt))))[1]
    t1_clt_hi = iv_mul((0, z0_inv_sq_hi), iv_mul((0, a1_pow_hi), q_to_iv(Q(1) / (Q(m0, 5) * th1_clt + Q(1, 2)))))[1]
    t2_clt_hi = iv_mul((0, z0_inv_sq_hi), iv_mul((0, a2_pow_hi), q_to_iv(Q(1) / (Q(m0 + 1, 5) * th2_clt + Q(1, 2)))))[1]
    pref_13 = iv_div_pos(q_to_iv(Q(m0 * (m0 + 1), 4)), iv_sqrt_pos(q_to_iv(Q(m0))))[1]
    tail_13_scaled = iv_mul((0, pref_13), (0, t1_clt_hi + t2_clt_hi))[1]
    require(tail_13_scaled < q_to_iv(Q(1, 10))[0], "13*14*T_step(13) < 1/10")
    # Net >= 14/100 - 10/100 = 4/100 = 1/25!

    # (6) Single Wick monomial E|H(X)| = 16 int_0^1 t^2 (1 - t^2) e^{-2 t^2} dt - sqrt(pi) / (4 sqrt(2))
    # Expand e^{-2 t^2} = sum_{k>=0} (-2)^k t^{2k} / k!:
    # 16 int_0^1 t^{2k+2} (1 - t^2) dt = 32 / ((2k + 3)(2k + 5)), an alternating series for k >= 1!
    pi_iv = compute_pi_iv()
    sqpi_iv = iv_sqrt_pos(pi_iv)
    sq2_iv = iv_sqrt_pos((2 * ONE, 2 * ONE))
    ih_acc = (0, 0)
    pow2 = 1
    fact = 1
    for k in range(220):
        if k > 0:
            pow2 <<= 1
            fact *= k
        term_iv = q_to_iv(Q(32 * pow2, fact * (2 * k + 3) * (2 * k + 5)))
        ih_acc = iv_sub(ih_acc, term_iv) if (k & 1) else iv_add(ih_acc, term_iv)
    rem_ih = q_to_iv(Q(32 * (pow2 << 1), fact * 220 * 443 * 445))[1]
    ih_iv = (ih_acc[0], ih_acc[1] + rem_ih)
    eh_iv = iv_sub(ih_iv, iv_div_pos(sqpi_iv, iv_mul((4 * ONE, 4 * ONE), sq2_iv)))
    half_sqpi = iv_div_int(sqpi_iv, 2)
    SCALE6 = 10 ** 6
    eh_lo_q = Q((eh_iv[0] * SCALE6) >> P, SCALE6)
    eh_hi_q = Q(-(((-eh_iv[1]) * SCALE6) >> P), SCALE6)
    gap_m1_lo = Q(((half_sqpi[0] - eh_iv[1]) * SCALE6) >> P, SCALE6)
    require(Q(69082, 100000) < eh_lo_q < eh_hi_q < Q(69083, 100000), "E|H(X)| enclosure")
    require(gap_m1_lo > Q(195, 1000), "sqrt(pi)/2 - E|H(X)| > 0.195")

    # (7) Exact cosine-moment polynomial bounds P_3(t) <= psi_Wick(t) <= P_2(t) and P_4(t) >= psi_Wick(t),
    # certifying D_doub(z) >= (P_3(z) - P_2(z/2)^2) = z^2 * (21/4 - (3751/12)*z - (121/16)*z^2)
    # >= z^2 * (21/4 - 313*z) >= (53/25) z^2 > 2 z^2 across all z in [0, 1/100]:
    w_exact = [
        sum(math.comb(2 * k, j) * ((-2) ** (2 * k - j)) * math.factorial(k + j) for j in range(2 * k + 1))
        for k in range(5)
    ]
    require(w_exact == [1, 2, 176, 90816, 121488384], "exact moments w_0..w_4 mismatch")
    require(Q(3751, 12) + Q(121, 1600) == Q(1500763, 4800) < Q(313), "affine slope 313 check on [0, 1/100]")
    ddoub_poly_at_1_100 = Q(21, 4) - Q(3751, 12) * Q(1, 100) - Q(121, 16) * Q(1, 10000)
    ddoub_aff_at_1_100 = Q(21, 4) - Q(313, 100)
    require(ddoub_poly_at_1_100 == Q(1019237, 480000) > ddoub_aff_at_1_100 == Q(53, 25) > Q(2), "D_doub(z)/z^2 > 2 on (0, 1/100]")

    return {
        "wick_monomial_E_abs_H_enclosure": [q_str(eh_lo_q), q_str(eh_hi_q)],
        "wick_monomial_unbuffered_gap_lower": q_str(gap_m1_lo),
        "asymptotic_clt_m13_net_scaled_lower": "1/25",
        "small_z_ddoub_over_z2_min_on_0_1_100": q_str(ddoub_poly_at_1_100),
    }, eh_iv


def compute_m1_wick_doubling_enclosure(pi_iv, eh_iv):
    """Encloses E|q_2| - E|q_1| via the non-oscillatory Parseval lambda-series
    Phi(a, b) = (a + b) * (1 - sum_{n>=1} d_n lambda^n), lambda = 4ab/(a+b)^2 in [0, 1],
    d_n = (1/(2n-1)) * (comb(2n, n) / 4^n)^2 > 0, sum_{n>=1} d_n = 1 - 2/pi,
    combined with separate convexity (Jensen lower bound + probability-preserving
    Edmundson-Madansky upper bound) on 400 1D intervals of R = 2 t^2 in [0, 512/25]
    plus exact [512/25, inf) tail, evaluated in 128-bit outward fixed-point arithmetic.
    """
    P1 = 128
    ONE1 = 1 << P1
    SH_DOWN = P - P1

    def to_128_iv(iv_p):
        return (iv_p[0] >> SH_DOWN, -((-iv_p[1]) >> SH_DOWN))

    def q_to_128_iv(q: Q):
        num, den = q.numerator, q.denominator
        return ((num << P1) // den, -(((-num) << P1) // den))

    n_max = 260
    d_lo = [0] * (n_max + 1)
    d_hi = [0] * (n_max + 1)
    for n in range(1, n_max + 1):
        cb = math.comb(2 * n, n)
        iv_d = q_to_128_iv(Q(cb * cb, (2 * n - 1) * (1 << (4 * n))))
        d_lo[n], d_hi[n] = iv_d[0], iv_d[1]

    two_over_pi_128 = to_128_iv(iv_div_pos((2 * ONE, 2 * ONE), pi_iv))
    four_over_pi_128 = (2 * two_over_pi_128[0], 2 * two_over_pi_128[1])
    sum_all_hi = ONE1 - two_over_pi_128[0]
    rem_tail_hi = [0] * (n_max + 1)
    partial_lo = 0
    for n in range(1, n_max + 1):
        partial_lo += d_lo[n]
        rem_tail_hi[n] = max(0, sum_all_hi - partial_lo)

    def phi_lo_128(a_int: int, b_int: int) -> int:
        if a_int == 0 or b_int == 0:
            return a_int + b_int
        if a_int == b_int:
            return (a_int * four_over_pi_128[0]) >> P1
        sm = a_int + b_int
        lam_hi = min(ONE1, -((-(4 * a_int * b_int * ONE1)) // (sm * sm)))
        n_use = 35 if 10 * lam_hi <= 9 * ONE1 else n_max
        pow_hi = ONE1
        sub_hi = 0
        for n in range(1, n_use + 1):
            pow_hi = -((-(pow_hi * lam_hi)) >> P1)
            sub_hi += -((-(d_hi[n] * pow_hi)) >> P1)
        pow_hi = -((-(pow_hi * lam_hi)) >> P1)
        sub_hi += -((-(rem_tail_hi[n_use] * pow_hi)) >> P1)
        fac_lo = max(0, ONE1 - sub_hi)
        return (sm * fac_lo) >> P1

    def phi_hi_128(a_int: int, b_int: int) -> int:
        if a_int == 0 or b_int == 0:
            return a_int + b_int
        if a_int == b_int:
            return -((-(a_int * four_over_pi_128[1])) >> P1)
        sm = a_int + b_int
        lam_lo = (4 * a_int * b_int * ONE1) // (sm * sm)
        n_use = 35 if 10 * lam_lo <= 9 * ONE1 else n_max
        pow_lo = ONE1
        sub_lo = 0
        for n in range(1, n_use + 1):
            pow_lo = (pow_lo * lam_lo) >> P1
            sub_lo += (d_lo[n] * pow_lo) >> P1
        fac_hi = ONE1 - sub_lo
        return -((-(sm * fac_hi)) >> P1)

    # Build 600-cell 1D t-grid on [0, 16/5] (R = 2 t^2 in [0, 512/25] = [0, 20.48]), with exact knot at t = 1:
    t_grid = [Q(k, 200) for k in range(201)]
    t_grid += [Q(1) + Q(k, 250) for k in range(1, 301)]
    t_grid += [Q(11, 5) + Q(k, 100) for k in range(1, 101)]
    require(t_grid[200] == Q(1) and t_grid[-1] == Q(16, 5), "t_grid endpoint check")

    def g_q(tq: Q) -> Q:
        return 2 * tq * abs(tq * tq - 1)

    def exact_M_128(tq: Q):
        # M(t) = int_0^t 8 s^2 (1 - s^2) e^{-2 s^2} ds
        #      = sum_{k>=0} (-1)^k * (8 t^3 (2 t^2)^k / k!) * (1/(2k+3) - t^2/(2k+5)).
        # For t <= 16/5, 2 t^2 <= 512/25 < 21; for k >= 120, 2 t^2 / (k + 1) < 21/121 < 1/5,
        # so the tail magnitude is bounded by (5/4) * (8 t^3 (1 + t^2) / 243) * (2 t^2)^120 / 120!.
        if tq == 0:
            return (0, 0)
        t2 = tq * tq
        two_t2 = 2 * t2
        require(two_t2 < 21, "exact_M_128 range")
        acc_lo = acc_hi = 0
        t_pow = 8 * tq * t2
        fact = 1
        for k in range(120):
            if k > 0:
                t_pow *= two_t2
                fact *= k
            cq = (t_pow * (Q(1, 2 * k + 3) - t2 * Q(1, 2 * k + 5))) / fact
            iv_c = q_to_128_iv(cq)
            if k & 1:
                acc_lo -= iv_c[1]
                acc_hi -= iv_c[0]
            else:
                acc_lo += iv_c[0]
                acc_hi += iv_c[1]
        t_pow *= two_t2
        fact *= 120
        rem_q = Q(5, 4) * (t_pow * (1 + t2)) / (243 * fact)
        rem_hi = q_to_128_iv(rem_q)[1]
        return (acc_lo - rem_hi, acc_hi + rem_hi)

    u_peak_hi_128 = to_128_iv(iv_div_pos((4 * ONE, 4 * ONE), iv_mul((3 * ONE, 3 * ONE), iv_sqrt_pos((3 * ONE, 3 * ONE)))))[1]
    u_peak_hi_q = Q(u_peak_hi_128, ONE1)

    e_grid = [to_128_iv(exp_neg_iv(2 * tq * tq, 32)) for tq in t_grid]
    m_grid = [exact_M_128(tq) for tq in t_grid]
    n_cells = len(t_grid) - 1
    p_lo_arr = []
    ubar_lo_arr = []
    em_atoms = {}  # exact Q -> weight_hi_128 int

    for k in range(n_cells):
        ta, tb = t_grid[k], t_grid[k + 1]
        ea, eb = e_grid[k], e_grid[k + 1]
        ma, mb = m_grid[k], m_grid[k + 1]
        pk_lo = max(0, ea[0] - eb[1])
        pk_hi = ea[1] - eb[0]
        require(pk_lo > 0, f"zero probability cell {k}")

        if tb <= 1:
            if 3 * tb * tb <= 1:
                u0_q, u1_q = g_q(ta), g_q(tb)
            elif 3 * ta * ta >= 1:
                u0_q, u1_q = g_q(tb), g_q(ta)
            else:
                u0_q, u1_q = min(g_q(ta), g_q(tb)), u_peak_hi_q
            mk_lo = max(0, mb[0] - ma[1])
            mk_hi = mb[1] - ma[0]
        else:
            require(ta >= 1, "cell straddles t = 1")
            u0_q, u1_q = g_q(ta), g_q(tb)
            mk_lo = max(0, ma[0] - mb[1])
            mk_hi = ma[1] - mb[0]
        require(0 <= u0_q < u1_q and mk_lo > 0, f"invalid cell {k} range/moment")

        u0_128 = q_to_128_iv(u0_q)
        ubar_lo = max(u0_128[0], (mk_lo << P1) // pk_hi)
        p_lo_arr.append(pk_lo)
        ubar_lo_arr.append(ubar_lo)

        # Probability-preserving Edmundson-Madansky weights:
        # Since f(u0) >= 0 and f(u1) - f(u0) >= 0, (1 - alpha) f(u0) + alpha f(u1) is non-decreasing in alpha in [0, 1].
        # Upper-bound alpha <= alpha_hi := min(1, max(0, mk_hi - pk_lo * u0) / (pk_lo * (u1 - u0))):
        du_lo = q_to_128_iv(u1_q - u0_q)[0]
        denom_lo = (pk_lo * du_lo) >> P1
        require(denom_lo > 0, "EM denom_lo <= 0")
        num_alpha_hi = max(0, mk_hi - ((pk_lo * u0_128[0]) >> P1))
        alpha_hi = min(ONE1, -((-(num_alpha_hi << P1)) // denom_lo))
        w0_hi = -((-(pk_hi * (ONE1 - alpha_hi))) >> P1)
        w1_hi = -((-(pk_hi * alpha_hi)) >> P1)
        em_atoms[u0_q] = em_atoms.get(u0_q, 0) + w0_hi
        em_atoms[u1_q] = em_atoms.get(u1_q, 0) + w1_hi

    jensen_2d_lo = 0
    for k in range(n_cells):
        pk = p_lo_arr[k]
        uk = ubar_lo_arr[k]
        diag_p = (pk * pk) >> P1
        jensen_2d_lo += (diag_p * phi_lo_128(uk, uk)) >> P1
        for ell in range(k + 1, n_cells):
            pair_p = (2 * pk * p_lo_arr[ell]) >> P1
            jensen_2d_lo += (pair_p * phi_lo_128(uk, ubar_lo_arr[ell])) >> P1

    atom_items = list(em_atoms.items())
    n_at = len(atom_items)
    atom_u_hi = [q_to_128_iv(uq)[1] for uq, _ in atom_items]
    atom_w_hi = [whi for _, whi in atom_items]
    em_2d_hi = 0
    for r in range(n_at):
        wr = atom_w_hi[r]
        ur = atom_u_hi[r]
        diag_w = -((-(wr * wr)) >> P1)
        em_2d_hi += -((-(diag_w * phi_hi_128(ur, ur))) >> P1)
        for s_i in range(r + 1, n_at):
            pair_w = -((-(2 * wr * atom_w_hi[s_i])) >> P1)
            em_2d_hi += -((-(pair_w * phi_hi_128(ur, atom_u_hi[s_i]))) >> P1)

    inv_sq2 = iv_div_pos((ONE, ONE), iv_sqrt_pos((2 * ONE, 2 * ONE)))
    tail_20_hi = 444 * exp_neg_iv(Q(20), 28)[1]
    j_p = jensen_2d_lo << SH_DOWN
    e_p = em_2d_hi << SH_DOWN
    eq2_lo = (j_p * inv_sq2[0]) >> P
    eq2_hi = -((-(e_p * inv_sq2[1])) >> P) + tail_20_hi
    return iv_sub((eq2_lo, eq2_hi), eh_iv)


# ---------------------------------------------------------------------------
# 5. Full 1088-bit continuum recomputation (--recompute)
# ---------------------------------------------------------------------------

def verify_interval_cover(cells: list[tuple[Q, Q]], target_lo: Q, target_hi: Q, label: str) -> None:
    """Checks that closed intervals `cells` cover [target_lo, target_hi] without gaps."""
    require(bool(cells), f"{label}: empty cell list")
    ordered = sorted(cells)
    require(ordered[0][0] <= target_lo, f"{label}: left endpoint {ordered[0][0]} > {target_lo}")
    reach = ordered[0][1]
    require(ordered[0][0] <= reach, f"{label}: inverted initial cell {ordered[0]}")
    for za, zb in ordered[1:]:
        require(za <= zb, f"{label}: inverted cell [{za}, {zb}]")
        require(za <= reach, f"{label}: gap ({reach}, {za}) in cover")
        if zb > reach:
            reach = zb
    require(reach >= target_hi, f"{label}: right endpoint {reach} < {target_hi}")


def build_compact_envelope_plan():
    """Returns ((dz_fine, rng_fine), (dz_main, rng_main), cells) and verifies gapless cover of [1/50, 19/2]."""
    dz_fine = Q(1, 1000)
    dz_main = Q(1, 100)
    rng_fine = range(20, 401)
    rng_main = range(40, 951)
    cells = [(i * dz_fine - dz_fine / 2, i * dz_fine + dz_fine / 2) for i in rng_fine]
    cells += [(i * dz_main - dz_main / 2, i * dz_main + dz_main / 2) for i in rng_main]
    verify_interval_cover(cells, Q(1, 50), ZETA_CROSS, "algebraic_envelope [1/50, 19/2]")
    return dz_fine, rng_fine, dz_main, rng_main, cells


def build_pvd_slab_edges():
    """Returns (w_edges, m_edges) and verifies gapless monotone partitions of [1/50, 1] and [1/5, 1]."""
    w_edges = [Q(k, 500) for k in range(10, 50)]
    w_edges += [Q(k, 200) for k in range(20, 80)]
    w_edges += [Q(k, 100) for k in range(40, 101)]
    verify_interval_cover(list(zip(w_edges, w_edges[1:])), Q(1, 50), Q(1), "PVD w_edges [1/50, 1]")
    m_edges = [Q(k, 400) for k in range(80, 401)]
    verify_interval_cover(list(zip(m_edges, m_edges[1:])), Q(1, 5), Q(1), "PVD m_edges [1/5, 1]")
    return w_edges, m_edges


def build_diffuse_doubling_slab_edges():
    """Returns wd_edges and verifies gapless monotone partition of [1/100, 1/7]."""
    wd_edges = [Q(k, 1400) for k in range(14, 70)] + [Q(k, 700) for k in range(35, 101)]
    verify_interval_cover(
        list(zip(wd_edges, wd_edges[1:])),
        Q(1, 100),
        Q(1, 7),
        "diffuse doubling wd_edges [1/100, 1/7]",
    )
    return wd_edges


def recompute_full(eng: WickEngine, c14_iv, pi_iv, eh_iv):
    """Recomputes all 4 continuum certificates in 1088-bit zero-float interval arithmetic."""
    # Precompute Jet1 grid on [0, 14.50] with spacing dz_main = 1/100 (1451 nodes),
    # plus fine grid on [0, 2/5] with spacing dz_fine = 1/1000 (401 nodes):
    n_fine = 400
    dz_fine, rng_env_fine, dz_main, rng_env_main, env_cells_plan = build_compact_envelope_plan()
    require(dz_fine == Q(2, 5) / n_fine, "dz_fine grid spacing mismatch")
    tab_fine = [eng.eval_psi_and_delta_jet1(i * dz_fine) for i in range(n_fine + 1)]

    n_main = 1450
    tab_main = [eng.eval_psi_and_delta_jet1(i * dz_main) for i in range(n_main + 1)]

    # (A) Certify |psi_Wick(zeta)| <= (1 + (19/5)*zeta)^{-1/5} on [1/50, 19/2]:
    max_env_ratio_q = Q(0)
    env_cells: list[tuple[Q, Q]] = []
    for tab_cur, dz_cur, rng_cur in [(tab_fine, dz_fine, rng_env_fine), (tab_main, dz_main, rng_env_main)]:
        for i in rng_cur:
            z0 = i * dz_cur
            za = z0 - dz_cur / 2
            zb = z0 + dz_cur / 2
            m2 = taylor_curv_psi(z0, za, zb)
            psi_iv, dpsi_iv, _, _ = tab_cur[i]
            p_cell = enclose_jet1_on_interval(psi_iv, dpsi_iv, z0, za, zb, m2)
            abs_hi = max(abs(p_cell[0]), abs(p_cell[1]))
            rhs_lo = iv_div_pos((ONE, ONE), iv_nth_root_pos(q_to_iv(1 + C1_ENV * zb), 5))[0]
            require(abs_hi < rhs_lo, f"algebraic envelope failed on cell [{za}, {zb}]")
            max_env_ratio_q = max(max_env_ratio_q, Q(abs_hi, rhs_lo))
            env_cells.append((za, zb))
    require(env_cells == env_cells_plan, "envelope cell list mismatch")
    verify_interval_cover(env_cells, Q(1, 50), ZETA_CROSS, "algebraic_envelope [1/50, 19/2]")

    # Also certify Delta_Wick(zeta) >= c_pos * min(zeta^2, 1) > 0 on (0, 4]:
    min_pos_sc = eng.pos_small_z2_coef
    pos_cells: list[tuple[Q, Q]] = []
    for i in range(20, n_fine + 1):
        z0 = i * dz_fine
        za, zb = z0 - dz_fine / 2, z0 + dz_fine / 2
        _, _, d_iv, dd_iv = tab_fine[i]
        d_cell = enclose_jet1_on_interval(d_iv, dd_iv, z0, za, zb, taylor_curv_delta(z0, za, zb))
        require(d_cell[0] > 0, f"Delta_Wick positivity failed on fine cell {i}")
        min_pos_sc = min(min_pos_sc, d_cell[0])
        pos_cells.append((za, zb))
    for i in range(40, 401):
        z0 = i * dz_main
        za, zb = z0 - dz_main / 2, z0 + dz_main / 2
        _, _, d_iv, dd_iv = tab_main[i]
        d_cell = enclose_jet1_on_interval(d_iv, dd_iv, z0, za, zb, taylor_curv_delta(z0, za, zb))
        require(d_cell[0] > 0, f"Delta_Wick positivity failed on main cell {i}")
        min_pos_sc = min(min_pos_sc, d_cell[0])
        pos_cells.append((za, zb))
    verify_interval_cover(pos_cells, Q(1, 50), Q(4), "Delta_Wick positivity [1/50, 4]")

    # (B) Certify F_pos(w) / w^2 >= 19/50 on w in [1/50, 1] and T_PVD(M) / M^2 <= 7/25 on M in [1/5, 1]:
    def delta_lb_on_panel(za: Q, zb: Q) -> int:
        zm = (za + zb) / 2
        if zb <= Q(2, 5):
            idx = max(1, min(n_fine, int((zm / dz_fine).__round__())))
            z0 = idx * dz_fine
            _, _, d_iv, dd_iv = tab_fine[idx]
        else:
            idx = max(1, min(400, int((zm / dz_main).__round__())))
            z0 = idx * dz_main
            _, _, d_iv, dd_iv = tab_main[idx]
        j_lb = enclose_jet1_on_interval(d_iv, dd_iv, z0, za, zb, taylor_curv_delta(z0, za, zb))[0]
        brk = eng.c2_small_lo - iv_mul((eng.c3_small_hi,) * 2, q_to_iv(zb))[1]
        p_lb = iv_mul((brk, brk), q_to_iv(za * za))[0] if brk > 0 else 0
        return max(0, j_lb, p_lb)

    # Piecewise-uniform small-denominator rational w-grid on [1/50, 1] and M-grid on [1/5, 1]:
    w_edges, m_edges = build_pvd_slab_edges()
    n_tau_pvd = 200
    dtau_pvd = Q(2, n_tau_pvd)  # tau = sqrt(xi) in [0, 2], (1/2) xi^{-3/2} dxi = tau^{-2} dtau
    min_fpos_over_w2 = Q(100)
    w_slabs_proved: list[tuple[Q, Q]] = []
    for s_idx in range(len(w_edges) - 1):
        wlo, whi = w_edges[s_idx], w_edges[s_idx + 1]
        acc_f = 0
        for k in range(n_tau_pvd):
            tk = k * dtau_pvd
            tk1 = (k + 1) * dtau_pvd
            eb = exp_neg_iv((1 - wlo) * tk1 * tk1, 28)[0]
            if k == 0:
                brk = eng.c2_small_lo - iv_mul((eng.c3_small_hi,) * 2, q_to_iv(whi * tk1 * tk1))[1]
                if brk > 0:
                    term = iv_mul((eb, eb), iv_mul((brk, brk), q_to_iv(wlo * wlo * (tk1 ** 3) / 3)))[0]
                    acc_f += max(0, term)
            else:
                inv_m = q_to_iv(Q(1) / tk - Q(1) / tk1)
                dlb = delta_lb_on_panel(wlo * tk * tk, whi * tk1 * tk1)
                if dlb > 0:
                    acc_f += iv_mul((eb, eb), iv_mul((dlb, dlb), inv_m))[0]
        ratio_f = Q(acc_f, ONE) / (whi * whi)
        require(ratio_f > Q(19, 50), f"F_pos/w^2 <= 19/50 on slab [{wlo}, {whi}]: {fmt_dec_floor(ratio_f)}")
        min_fpos_over_w2 = min(min_fpos_over_w2, ratio_f)
        w_slabs_proved.append((wlo, whi))
    verify_interval_cover(w_slabs_proved, Q(1, 50), Q(1), "PVD w_slabs proved [1/50, 1]")

    # T_PVD(M) / M^2 <= 7/25 on M in [1/5, 1]:
    # Octave-uniform dyadic zeta-grid on [4, 4096] (10 octaves * 50 panels = 500 panels, max denom 25):
    z_tail_grid = []
    for b_oct in range(2, 12):
        base_z = Q(1 << b_oct)
        step_z = base_z / 50
        for j_sub in range(50):
            z_tail_grid.append(base_z + j_sub * step_z)
    z_tail_grid.append(Q(4096))
    z_tail_ln = [iv_ln_pos(q_to_iv(1 + C1_ENV * zq)) for zq in z_tail_grid[:-1]]
    z_inv_sqrt = [iv_div_pos((ONE, ONE), iv_sqrt_pos(q_to_iv(zq))) for zq in z_tail_grid]
    z_panel_wt_hi = [2 * (z_inv_sqrt[k][1] - z_inv_sqrt[k + 1][0]) for k in range(len(z_tail_grid) - 1)]

    max_tpvd_over_m2 = Q(0)
    m_slabs_proved: list[tuple[Q, Q]] = []
    for s_idx in range(len(m_edges) - 1):
        mlo, mhi = m_edges[s_idx], m_edges[s_idx + 1]
        exp_q = q_to_iv(ALPHA_ENV / mhi)
        acc_t = 0
        for k, zk in enumerate(z_tail_grid[:-1]):
            t_alg = exp_neg_iv_from_iv(iv_mul(exp_q, z_tail_ln[k]), 28)[1]
            t_exp = exp_neg_iv(zk / mhi, 28)[1]
            acc_t += iv_mul((0, t_alg + t_exp), (0, z_panel_wt_hi[k]))[1]
        c1_inv15 = iv_div_pos((ONE, ONE), iv_nth_root_pos(q_to_iv(C1_ENV), 5))[1]
        rem_4096 = iv_mul((0, c1_inv15), q_to_iv(Q(5, 896)))[1] + iv_mul(exp_neg_iv(Q(4096) / mhi, 28), q_to_iv(Q(1, 32)))[1]
        tpvd_hi = iv_mul(iv_div_int(iv_sqrt_pos(q_to_iv(mhi)), 2), (0, acc_t + rem_4096))[1]
        ratio_t = Q(tpvd_hi, ONE) / (mlo * mlo)
        require(ratio_t < Q(7, 25), f"T_PVD/M^2 >= 7/25 on [{mlo}, {mhi}]: {fmt_dec_ceil(ratio_t)}")
        max_tpvd_over_m2 = max(max_tpvd_over_m2, ratio_t)
        m_slabs_proved.append((mlo, mhi))
    verify_interval_cover(m_slabs_proved, Q(1, 5), Q(1), "PVD M_slabs proved [1/5, 1]")

    # (C) Certify log-slope increase g'(zeta) >= 3/2 on [1/200, 1/12] and g'(zeta) > 0 on [1/12, 6/5]:
    min_gp_low_q = Q(2307, 400)
    min_gp_mid_q = Q(100)

    def check_gp_subcell(z_node: Q, psi_iv, dpsi_iv, za: Q, zb: Q) -> None:
        nonlocal min_gp_low_q, min_gp_mid_q
        if za < Q(1, 12) < zb:
            check_gp_subcell(z_node, psi_iv, dpsi_iv, za, Q(1, 12))
            check_gp_subcell(z_node, psi_iv, dpsi_iv, Q(1, 12), zb)
            return
        require(psi_iv[0] > 0, f"psi(z_node) <= 0 at {z_node}")
        # Evaluate K(z_node) = z_node * psi'(z_node) / psi(z_node) - ln(psi(z_node)) free of interval dependency:
        k_node_lo = iv_div_pos(iv_mul(q_to_iv(z_node), dpsi_iv), psi_iv)[0] - iv_ln_pos(psi_iv)[1]
        # Bound |K'(z)| on hull({z_node}, [za, zb]): K'(z) = z * (psi''(z) * psi(z) - psi'(z)^2) / psi(z)^2:
        z_hi_seg = max(z_node, zb)
        z_lo_seg = min(z_node, za)
        m2_p = taylor_curv_psi(z_node, z_lo_seg, z_hi_seg)
        p_seg = enclose_jet1_on_interval(psi_iv, dpsi_iv, z_node, z_lo_seg, z_hi_seg, m2_p)
        require(p_seg[0] > 0, f"psi <= 0 on segment [{z_lo_seg}, {z_hi_seg}]")
        rmax = max(abs(za - z_node), abs(zb - z_node))
        d_rad = q_to_iv(m2_p * rmax)[1]
        dp_abs_hi = max(abs(dpsi_iv[0] - d_rad), abs(dpsi_iv[1] + d_rad))
        num_kp_hi = iv_mul(q_to_iv(m2_p), (0, p_seg[1]))[1] + iv_mul((0, dp_abs_hi), (0, dp_abs_hi))[1]
        den_kp_lo = iv_mul((p_seg[0], p_seg[0]), (p_seg[0], p_seg[0]))[0]
        lip_k_hi = iv_mul(q_to_iv(z_hi_seg), iv_div_pos((0, num_kp_hi), (den_kp_lo, den_kp_lo)))[1]
        k_lo = k_node_lo - iv_mul((0, lip_k_hi), q_to_iv(rmax))[1]
        require(k_lo > 0, f"K(z) <= 0 on [{za}, {zb}] (k_lo={fmt_dec_floor(Q(k_lo, ONE))})")
        gp_lo_iv = iv_div_pos((k_lo, k_lo), q_to_iv(zb * zb))[0]
        gp_lo_q = Q(gp_lo_iv, ONE)
        if zb <= Q(1, 12):
            require(gp_lo_q >= Q(3, 2), f"g'(z) < 3/2 on [{za}, {zb}]: {fmt_dec_floor(gp_lo_q)}")
            min_gp_low_q = min(min_gp_low_q, gp_lo_q)
        else:
            require(gp_lo_q > 0, f"g'(z) <= 0 on [{za}, {zb}]: {fmt_dec_floor(gp_lo_q)}")
            min_gp_mid_q = min(min_gp_mid_q, gp_lo_q)

    gp_cells: list[tuple[Q, Q]] = []
    # Fine centered cells [i/1000 - 1/2000, i/1000 + 1/2000] for i = 5..400 cover [9/2000, 801/2000] supset [1/200, 2/5]:
    for i_f in range(5, 401):
        z_node = i_f * dz_fine
        z_left = z_node - Q(1, 2000)
        psi_iv, dpsi_iv, _, _ = tab_fine[i_f]
        for sub in range(4):
            za_s, zb_s = z_left + Q(sub, 4000), z_left + Q(sub + 1, 4000)
            check_gp_subcell(z_node, psi_iv, dpsi_iv, za_s, zb_s)
            gp_cells.append((za_s, zb_s))

    # Main centered cells [i/100 - 1/200, i/100 + 1/200] for i = 40..120 cover [79/200, 241/200] supset [2/5, 6/5]:
    for i in range(40, 121):
        z_node = i * dz_main
        z_left = z_node - Q(1, 200)
        psi_iv, dpsi_iv, _, _ = tab_main[i]
        for sub in range(20):
            za_s, zb_s = z_left + Q(sub, 2000), z_left + Q(sub + 1, 2000)
            check_gp_subcell(z_node, psi_iv, dpsi_iv, za_s, zb_s)
            gp_cells.append((za_s, zb_s))
    verify_interval_cover(gp_cells, Q(1, 200), Q(6, 5), "log_slope g' [1/200, 6/5]")

    # Certify step-by-step CLT gains E|q_{m+1}| - E|q_m| > 0 for m = 1..12:
    clt_steps = {}
    SCALE6 = 10 ** 6
    step1_iv = compute_m1_wick_doubling_enclosure(pi_iv, eh_iv)
    s1_lo_q = Q((step1_iv[0] * SCALE6) >> P, SCALE6)
    s1_hi_q = Q(-(((-step1_iv[1]) * SCALE6) >> P), SCALE6)
    require(0 < s1_lo_q < s1_hi_q, f"CLT step m=1 -> 2 not strictly positive: [{s1_lo_q}, {s1_hi_q}]")
    clt_steps["1"] = [q_str(s1_lo_q), q_str(s1_hi_q)]

    def eval_psi_jet_box(za: Q, zb: Q):
        zm = (za + zb) / 2
        if zb <= Q(2, 5):
            idx = max(1, min(n_fine, int((zm / dz_fine).__round__())))
            z0 = idx * dz_fine
            p0, dp0, _, _ = tab_fine[idx]
        else:
            idx = max(1, min(n_main, int((zm / dz_main).__round__())))
            z0 = idx * dz_main
            p0, dp0, _, _ = tab_main[idx]
        m2 = taylor_curv_psi(z0, za, zb)
        p_iv = enclose_jet1_on_interval(p0, dp0, z0, za, zb, m2)
        rmax = max(abs(za - z0), abs(zb - z0))
        drad = q_to_iv(m2 * rmax)[1]
        dp_iv = (dp0[0] - drad, dp0[1] + drad)
        return p_iv, dp_iv

    dtau_s = Q(1, 200)
    k_tau0 = int(Q(1, 20) / dtau_s)  # tau in [0, 1/20] -> z <= 1/400: 0 <= H_m(z) <= m(21 + m)/2 * z^2
    for m in range(2, 13):
        tau_max_m = Q(19, 5) if m <= 4 else Q(3)
        n_tau_s = int(tau_max_m / dtau_s)
        qm = Q(m, m + 1)
        acc_lo = 0
        acc_hi = q_to_iv(Q(m * (21 + m), 48000))[1]
        for k in range(k_tau0, n_tau_s):
            tk = k * dtau_s
            tk1 = (k + 1) * dtau_s
            za1, zb1 = tk * tk, tk1 * tk1
            zmid = (za1 + zb1) / 2
            rz = (zb1 - za1) / 2
            # Pointwise midpoint evaluation of H_m(zmid) = psi(zmid)^m - psi(qm*zmid)^{m+1}:
            p1_mid, _ = eval_psi_jet_box(zmid, zmid)
            p2_mid, _ = eval_psi_jet_box(qm * zmid, qm * zmid)
            hm_mid = iv_sub(iv_pow_int(p1_mid, m), iv_pow_int(p2_mid, m + 1))
            # Derivative bound H_m'(z) = m * [psi(z)^{m-1} psi'(z) - psi(qm*z)^m psi'(qm*z)] on [za1, zb1]:
            p1_seg, dp1_seg = eval_psi_jet_box(za1, zb1)
            p2_seg, dp2_seg = eval_psi_jet_box(qm * za1, qm * zb1)
            d1 = iv_mul(iv_pow_int(p1_seg, m - 1), dp1_seg)
            d2 = iv_mul(iv_pow_int(p2_seg, m), dp2_seg)
            d_diff = iv_sub(d1, d2)
            lip_hi = m * max(abs(d_diff[0]), abs(d_diff[1]))
            rad_hm = iv_mul((0, lip_hi), q_to_iv(rz))[1]
            diff_p = (hm_mid[0] - rad_hm, hm_mid[1] + rad_hm)
            if zb1 <= Q(6, 5):
                diff_p = (max(0, diff_p[0]), diff_p[1])
            wt = q_to_iv(Q(1) / tk - Q(1) / tk1)
            contrib = iv_mul(diff_p, wt)
            acc_lo += contrib[0]
            acc_hi += contrib[1]

        pref_m = iv_div_pos(q_to_iv(Q(1, 2)), iv_sqrt_pos(q_to_iv(Q(m))))
        main_iv = iv_mul(pref_m, (acc_lo, acc_hi))
        inv_z14 = iv_div_pos((ONE, ONE), iv_sqrt_pos(q_to_iv(tau_max_m)))
        t_part1 = iv_mul(
            q_to_iv(Q(4, m + 2)),
            iv_mul(iv_pow_int(c14_iv, m), iv_pow_int(inv_z14, m + 2)),
        )[1]
        ratio_q14 = iv_nth_root_pos(q_to_iv(Q(m + 1, m)), 4)
        t_part2 = iv_mul(
            q_to_iv(Q(4, m + 3)),
            iv_mul(
                iv_mul(iv_pow_int(c14_iv, m + 1), iv_pow_int(ratio_q14, m + 1)),
                iv_pow_int(inv_z14, m + 3),
            ),
        )[1]
        # Sign-aware Hankel tail: psi(z)^m >= 0 when m is even, and -psi(qm*z)^{m+1} <= 0 when m is odd:
        t_lo_loss = t_part2 if (m % 2 == 0) else (t_part1 + t_part2)
        t_hi_gain = t_part1 if (m % 2 == 1) else (t_part1 + t_part2)
        tail_lo = iv_mul(iv_div_pos(q_to_iv(Q(1, 4)), iv_sqrt_pos(q_to_iv(Q(m)))), (0, t_lo_loss))[1]
        tail_hi = iv_mul(iv_div_pos(q_to_iv(Q(1, 4)), iv_sqrt_pos(q_to_iv(Q(m)))), (0, t_hi_gain))[1]

        step_iv = (main_iv[0] - tail_lo, main_iv[1] + tail_hi)
        s_lo_q = Q((step_iv[0] * SCALE6) >> P, SCALE6)
        s_hi_q = Q(-(((-step_iv[1]) * SCALE6) >> P), SCALE6)
        require(0 < s_lo_q < s_hi_q, f"CLT step m={m} -> {m+1} not strictly positive: [{s_lo_q}, {s_hi_q}]")
        clt_steps[str(m)] = [q_str(s_lo_q), q_str(s_hi_q)]

    # (D) Certify diffuse unequal-weight doubling monotonicity for all max_j u_j <= (1/7) u:
    # 1. Certify D_doub(zeta) := psi_Wick(zeta) - psi_Wick(zeta/2)^2 > 0 on (0, 169/100] = (0, (13/10)^2]:
    #    On (0, 1/100]: P_3(z) - P_2(z/2)^2 = z^2 * (21/4 - (3751/12)*z - (121/16)*z^2) >= (1019237/480000) z^2 > 2 z^2:
    ddoub_c_100 = Q(21, 4) - Q(3751, 12) * Q(1, 100) - Q(121, 16) * Q(1, 10000)
    require(ddoub_c_100 == Q(1019237, 480000) > Q(2), "D_doub(z) > 2 z^2 on (0, 1/100]")

    def eval_ddoub_lb(za: Q, zb: Q) -> int:
        # Enclose D_doub(z) = psi(z) - psi(z/2)^2 from below on [za, zb] via midpoint + MVT
        # using D_doub'(z) = psi'(z) - psi(z/2) * psi'(z/2) (which cancels -1 - (-1) = 0 near z = 0):
        zmid = (za + zb) / 2
        rz = (zb - za) / 2
        p_mid, _ = eval_psi_jet_box(zmid, zmid)
        ph_mid, _ = eval_psi_jet_box(zmid / 2, zmid / 2)
        dd_mid_lo = p_mid[0] - iv_pow_int(ph_mid, 2)[1]
        if rz == 0:
            return dd_mid_lo
        p_seg, dp_seg = eval_psi_jet_box(za, zb)
        ph_seg, dph_seg = eval_psi_jet_box(za / 2, zb / 2)
        require(ph_seg[0] > 0, f"psi(z/2) <= 0 on [{za / 2}, {zb / 2}]")
        dd_deriv = iv_sub(dp_seg, iv_mul(ph_seg, dph_seg))
        lip_hi = max(abs(dd_deriv[0]), abs(dd_deriv[1]))
        return dd_mid_lo - iv_mul((0, lip_hi), q_to_iv(rz))[1]

    ddoub_cells: list[tuple[Q, Q]] = []
    # Fine centered cells [i/1000 - 1/2000, i/1000 + 1/2000] for i = 10..400 cover [19/2000, 801/2000] supset [1/100, 2/5]:
    for i_f in range(10, 401):
        z_node = i_f * dz_fine
        za, zb = z_node - Q(1, 2000), z_node + Q(1, 2000)
        require(eval_ddoub_lb(za, zb) > 0, f"D_doub <= 0 on fine [{za}, {zb}]")
        ddoub_cells.append((za, zb))

    # Main centered cells [i/100 - 1/200, i/100 + 1/200] for i = 40..169 cover [79/200, 339/200] supset [2/5, 169/100]:
    for i in range(40, 170):
        z_node = i * dz_main
        z_left = z_node - Q(1, 200)
        for sub in range(10):
            za = z_left + Q(sub, 1000)
            zb = z_left + Q(sub + 1, 1000)
            require(eval_ddoub_lb(za, zb) > 0, f"D_doub <= 0 on [{za}, {zb}]")
            ddoub_cells.append((za, zb))
    verify_interval_cover(ddoub_cells, Q(1, 100), Q(169, 100), "D_doub positivity [1/100, 169/100]")

    # 2. Certify F_doub(w) >= (173/1000) w^2 on w in (0, 1/7] and T_doub(M) <= (147/1000) M^2 on M in (0, 1/7]:
    #    On w in (0, 1/100], integrating on xi = tau^2 in [0, 1] (where w*xi <= 1/100 so D_doub(w*xi) >= 2 w^2 xi^2)
    #    yields F_doub(w)/w^2 >= (1/4) * int_0^1 e^{-xi} (2 xi^2) xi^{-3/2} dxi = int_0^1 tau^2 e^{-tau^2} dtau > 173/1000:
    m_doub_cap = Q(1, 7)
    int_sq_1_lo = 0
    dt_200 = q_to_iv(Q(1, 200))
    for k in range(200):
        tk, tk1 = Q(k, 200), Q(k + 1, 200)
        int_sq_1_lo += iv_mul(q_to_iv(tk * tk), iv_mul(exp_neg_iv(tk1 * tk1, 28), dt_200))[0]
    fdoub_small_q = Q(int_sq_1_lo, ONE)
    require(fdoub_small_q > Q(173, 1000), f"small-w F_doub/w^2 > 173/1000 ({fmt_dec_floor(fdoub_small_q)})")

    wd_edges = build_diffuse_doubling_slab_edges()
    require(wd_edges[0] == Q(1, 100) and wd_edges[-1] == m_doub_cap, "wd_edges endpoints")
    # Fixed tau_d_max = 17/5: for every M <= 1/7 and tau <= 17/5, M * tau^2 <= (1/7)*(289/25) = 289/175 < 169/100!
    tau_d_max = Q(17, 5)
    require(m_doub_cap * tau_d_max * tau_d_max <= Q(169, 100), "tau_d_max within [0, sqrt(1.69 / M)]")
    n_td = 340
    dtau_d = tau_d_max / n_td  # exact 1/100
    min_fdoub_over_w2 = fdoub_small_q
    wd_slabs_proved: list[tuple[Q, Q]] = []
    for s_idx in range(len(wd_edges) - 1):
        wlo, whi = wd_edges[s_idx], wd_edges[s_idx + 1]
        acc_fd = 0
        for k in range(n_td):
            tk, tk1 = k * dtau_d, (k + 1) * dtau_d
            za, zb = wlo * tk * tk, whi * tk1 * tk1
            eb = exp_neg_iv((1 - wlo) * tk1 * tk1, 28)[0]
            if zb <= Q(1, 100):
                # On [0, zb] subset [0, 1/100], D_doub(z) >= (21/4 - 313*zb) z^2, so
                # (1/4) * int_{tk^2}^{tk1^2} (21/4 - 313*zb) wlo^2 xi^2 * xi^{-3/2} dxi
                # = ((21/4 - 313*zb) / 6) * wlo^2 * (tk1^3 - tk^3):
                c_panel = (Q(21, 4) - 313 * zb) / 6
                term = iv_mul((eb, eb), q_to_iv(c_panel * wlo * wlo * (tk1 ** 3 - tk ** 3)))[0]
                acc_fd += max(0, term)
            else:
                dd_lo = eval_ddoub_lb(za, zb)
                if dd_lo > 0:
                    wt = q_to_iv(Q(1, 2) * (Q(1) / tk - Q(1) / tk1))
                    acc_fd += iv_mul((eb, eb), iv_mul((dd_lo, dd_lo), wt))[0]
        rf = Q(acc_fd, ONE) / (whi * whi)
        require(rf > Q(173, 1000), f"F_doub/w^2 <= 173/1000 on [{wlo}, {whi}]: {fmt_dec_floor(rf)}")
        min_fdoub_over_w2 = min(min_fdoub_over_w2, rf)
        wd_slabs_proved.append((wlo, whi))
    verify_interval_cover(wd_slabs_proved, Q(1, 100), m_doub_cap, "diffuse doubling w_slabs proved [1/100, 1/7]")

    zd_cut = Q(169, 100)
    # On ALL M in (0, 1/7], d/dM [M^{-3/2} (1 + c*z)^{-a/M}] > 0 since a*ln(1 + c*zd_cut) > (3/2)*(1/7) = 3/14:
    require(iv_div_int(iv_ln_pos(q_to_iv(1 + C1_ENV * zd_cut)), 5)[0] > q_to_iv(Q(3, 14))[1], "T_doub monotone log deriv 1 on (0, 1/7]")
    require(iv_mul(q_to_iv(Q(2, 5)), iv_ln_pos(q_to_iv(1 + (C1_ENV / 2) * zd_cut)))[0] > q_to_iv(Q(3, 14))[1], "T_doub monotone log deriv 2 on (0, 1/7]")

    z_d_grid = [zd_cut + k * Q(231, 5000) for k in range(50)] + z_tail_grid
    zd_inv_sq = [iv_div_pos((ONE, ONE), iv_sqrt_pos(q_to_iv(zq))) for zq in z_d_grid]
    zd_wt_hi = [2 * (zd_inv_sq[k][1] - zd_inv_sq[k + 1][0]) for k in range(len(z_d_grid) - 1)]
    zd_ln1 = [iv_ln_pos(q_to_iv(1 + C1_ENV * zq)) for zq in z_d_grid[:-1]]
    zd_ln2 = [iv_ln_pos(q_to_iv(1 + (C1_ENV / 2) * zq)) for zq in z_d_grid[:-1]]

    # By strict monotonicity in M on (0, 1/7], the global maximum of T_doub(M)/M^2 on (0, 1/7] is attained at M = 1/7:
    q1 = q_to_iv(ALPHA_ENV / m_doub_cap)
    q2 = q_to_iv(2 * ALPHA_ENV / m_doub_cap)
    acc_td = 0
    for k in range(len(z_d_grid) - 1):
        t1 = exp_neg_iv_from_iv(iv_mul(q1, zd_ln1[k]), 28)[1]
        t2 = exp_neg_iv_from_iv(iv_mul(q2, zd_ln2[k]), 28)[1]
        acc_td += iv_mul((0, t1 + t2), (0, zd_wt_hi[k]))[1]
    rem_td = q_to_iv(Q(1, 393216))[1]
    tdoub_hi = iv_mul(iv_div_int(iv_sqrt_pos(q_to_iv(m_doub_cap)), 4), (0, acc_td + rem_td))[1]
    max_tdoub_over_m2 = Q(tdoub_hi, ONE) / (m_doub_cap * m_doub_cap)
    require(max_tdoub_over_m2 < Q(147, 1000), f"T_doub/M^2 >= 147/1000 at M=1/7: {fmt_dec_ceil(max_tdoub_over_m2)}")

    SCALE7 = 10 ** 7
    env_ratio_ceil = Q(-(((-max_env_ratio_q.numerator) * SCALE7) // max_env_ratio_q.denominator), SCALE7)
    fpos_floor = Q((min_fpos_over_w2.numerator * SCALE7) // min_fpos_over_w2.denominator, SCALE7)
    tpvd_ceil = Q(-(((-max_tpvd_over_m2.numerator) * SCALE7) // max_tpvd_over_m2.denominator), SCALE7)
    fdoub_floor = Q((min_fdoub_over_w2.numerator * SCALE7) // min_fdoub_over_w2.denominator, SCALE7)
    tdoub_ceil = Q(-(((-max_tdoub_over_m2.numerator) * SCALE7) // max_tdoub_over_m2.denominator), SCALE7)
    pos_scaled_floor = Q((min_pos_sc * (10 ** 9)) >> P, 10 ** 9)

    require(env_ratio_ceil < 1, "env_ratio_ceil < 1")
    require(fpos_floor >= Q(19, 50) and tpvd_ceil <= Q(7, 25), "PVD constants check")
    require(fdoub_floor >= Q(173, 1000) and tdoub_ceil <= Q(147, 1000) and fdoub_floor - tdoub_ceil >= Q(1, 40), "diffuse doubling constants check")

    return {
        "algebraic_envelope": {
            "alpha": q_str(ALPHA_ENV),
            "c1": q_str(C1_ENV),
            "compact_zeta_cap": q_str(ZETA_CROSS),
            "num_compact_cells": len(env_cells),
            "max_compact_ratio_upper": q_str(env_ratio_ceil),
            "psi_wick_minus_exp_scaled_lb_min_zeta2_1_on_0_4": q_str(pos_scaled_floor),
        },
        "buffered_pvd": {
            "w_slab_count": len(w_slabs_proved),
            "M_slab_count": len(m_slabs_proved),
            "F_pos_over_w2_lower": q_str(fpos_floor),
            "T_PVD_over_M2_upper": q_str(tpvd_ceil),
            "certified_net_gap_coef": "1/20",
        },
        "clt_and_doubling": {
            "log_slope_g_prime_min_on_0_1_12": q_str(Q((min_gp_low_q.numerator * 10000) // min_gp_low_q.denominator, 10000)),
            "log_slope_g_prime_min_on_1_12_to_6_5": q_str(Q((min_gp_mid_q.numerator * 1000000) // min_gp_mid_q.denominator, 1000000)),
            "clt_step_gains_m_1_to_12": clt_steps,
            "diffuse_doubling_M_over_u_cap": q_str(m_doub_cap),
            "F_doub_over_w2_lower": q_str(fdoub_floor),
            "T_doub_over_M2_upper": q_str(tdoub_ceil),
            "certified_diffuse_doubling_coef": "1/40",
        },
    }


# ---------------------------------------------------------------------------
# 6. Audit of saved result.json & 22 built-in adversarial controls
# ---------------------------------------------------------------------------

def canonical_receipt_bytes(payload: dict) -> bytes:
    return (json.dumps(payload, indent=2, sort_keys=True) + "\n").encode("utf-8")


def verify_canonical_receipt_bytes(raw_bytes: bytes, expected: dict) -> dict:
    try:
        parsed = json.loads(raw_bytes.decode("utf-8"))
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise RuntimeError(f"CERTIFICATION FAILURE: invalid UTF-8/JSON in result.json: {exc}") from exc
    require(parsed == expected, "recomputed certificate differs from committed result.json")
    require(
        raw_bytes == canonical_receipt_bytes(expected),
        "committed result.json bytes differ from canonical --write-result output",
    )
    return parsed


def audit_result_dict(res: dict, sw_real: dict, fast_lem: dict, pi_iv=None, eh_iv=None, c14_iv=None, spot_eng=None) -> None:
    require(res.get("schema") == "wick-pvd-doubling-v1", "unexpected schema")
    require(res.get("agent_id") == "gemini-21d5", "unexpected agent_id")
    require(res.get("task_issue") == 730, "unexpected task_issue")
    require(res.get("precision_bits") == P, "unexpected precision_bits")
    require(res.get("schlaefli_watson_and_real_he3") == sw_real, "Schlaefli-Watson / real He_3 mismatch vs live recomputation")
    require(res.get("analytic_lemmas") == fast_lem, "analytic lemmas mismatch vs live recomputation")

    _, _, _, _, env_cells_expected = build_compact_envelope_plan()
    w_edges_exp, m_edges_exp = build_pvd_slab_edges()
    wd_edges_exp = build_diffuse_doubling_slab_edges()
    require(len(wd_edges_exp) - 1 == 121, "diffuse doubling slab count mismatch")

    ct = res.get("continuum_certificates", {})
    ae = ct.get("algebraic_envelope", {})
    require(Q(ae.get("alpha", "0")) == ALPHA_ENV and Q(ae.get("c1", "0")) == C1_ENV, "envelope parameter mismatch")
    require(Q(ae.get("compact_zeta_cap", "0")) == ZETA_CROSS, "compact_zeta_cap mismatch")
    require(ae.get("num_compact_cells") == len(env_cells_expected), "num_compact_cells mismatch vs verified cover")
    require(0 < Q(ae.get("max_compact_ratio_upper", "1")) < 1, "max_compact_ratio_upper must be < 1")
    require(Q(ae.get("psi_wick_minus_exp_scaled_lb_min_zeta2_1_on_0_4", "0")) >= Q(2509689, 10 ** 9), "positivity floor mismatch")

    bp = ct.get("buffered_pvd", {})
    require(
        bp.get("w_slab_count") == len(w_edges_exp) - 1 and bp.get("M_slab_count") == len(m_edges_exp) - 1,
        "PVD slab counts mismatch vs verified slab partitions",
    )
    fpos_lb = Q(bp.get("F_pos_over_w2_lower", "0"))
    tpvd_ub = Q(bp.get("T_PVD_over_M2_upper", "1"))
    net_pvd = Q(bp.get("certified_net_gap_coef", "0"))
    require(fpos_lb >= Q(19, 50) and 0 < tpvd_ub <= Q(7, 25), "PVD slab bounds out of range")
    require(Q(1, 2) * (fpos_lb - tpvd_ub) >= net_pvd == Q(1, 20) > 0, "PVD net coefficient invalid")

    cd = ct.get("clt_and_doubling", {})
    require(Q(cd.get("log_slope_g_prime_min_on_0_1_12", "0")) >= Q(3, 2), "g' min on (0, 1/12] < 3/2")
    require(Q(cd.get("log_slope_g_prime_min_on_1_12_to_6_5", "0")) > 0, "g' min on [1/12, 6/5] <= 0")
    steps = cd.get("clt_step_gains_m_1_to_12", {})
    require(set(steps.keys()) == {str(m) for m in range(1, 13)}, "missing CLT step keys 1..12")
    for m in range(1, 13):
        lo_q, hi_q = [Q(x) for x in steps[str(m)]]
        require(0 < lo_q < hi_q < Q(1, 10), f"invalid CLT step m={m} enclosure")
    lo1, hi1 = [Q(x) for x in steps["1"]]
    require(Q(160, 10000) < lo1 < hi1 < Q(164, 10000), "m=1 Wick doubling enclosure out of (0.0160, 0.0164)")

    require(Q(cd.get("diffuse_doubling_M_over_u_cap", "0")) == Q(1, 7), "diffuse doubling cap mismatch")
    fd_lb = Q(cd.get("F_doub_over_w2_lower", "0"))
    td_ub = Q(cd.get("T_doub_over_M2_upper", "1"))
    cd_net = Q(cd.get("certified_diffuse_doubling_coef", "0"))
    require(fd_lb >= Q(173, 1000) and 0 < td_ub <= Q(147, 1000), "diffuse doubling slab bounds out of range")
    require(fd_lb - td_ub >= cd_net == Q(1, 40) > 0, "diffuse doubling net coefficient invalid")

    if spot_eng is not None:
        # 1. Spot-check algebraic envelope and positivity at representative points:
        for z_t in [Q(1, 10), Q(1), Q(4), Q(8), Q(19, 2)]:
            p_iv, _, d_iv, _ = spot_eng.eval_psi_and_delta_jet1(z_t)
            rhs = iv_div_pos((ONE, ONE), iv_nth_root_pos(q_to_iv(1 + C1_ENV * z_t), 5))[0]
            require(max(abs(p_iv[0]), abs(p_iv[1])) < rhs, f"spot algebraic envelope failed at {z_t}")
            if z_t <= Q(4):
                require(d_iv[0] > 0, f"spot positivity failed at {z_t}")

        # 2. Live recomputation of m=1 Wick doubling & coarse outward consistency check on EVERY m = 2..12:
        if pi_iv is not None and eh_iv is not None:
            SCALE6 = 10 ** 6
            st1 = compute_m1_wick_doubling_enclosure(pi_iv, eh_iv)
            s1_lo = Q((st1[0] * SCALE6) >> P, SCALE6)
            s1_hi = Q(-(((-st1[1]) * SCALE6) >> P), SCALE6)
            require(steps["1"] == [q_str(s1_lo), q_str(s1_hi)], "m=1 step gain in result.json differs from live recomputation")

        if c14_iv is not None:
            dz_cf, n_cf = Q(1, 200), 80    # [0, 2/5]
            dz_cm, n_cm = Q(1, 50), 450    # [0, 9]
            tab_cf = [spot_eng.eval_psi_and_delta_jet1(i * dz_cf) for i in range(n_cf + 1)]
            tab_cm = [spot_eng.eval_psi_and_delta_jet1(i * dz_cm) for i in range(n_cm + 1)]

            def box_c(za: Q, zb: Q):
                zm = (za + zb) / 2
                if zb <= Q(2, 5):
                    idx = max(1, min(n_cf, int((zm / dz_cf).__round__())))
                    z0 = idx * dz_cf
                    p0, dp0, _, _ = tab_cf[idx]
                else:
                    idx = max(1, min(n_cm, int((zm / dz_cm).__round__())))
                    z0 = idx * dz_cm
                    p0, dp0, _, _ = tab_cm[idx]
                m2 = taylor_curv_psi(z0, za, zb)
                p_iv = enclose_jet1_on_interval(p0, dp0, z0, za, zb, m2)
                rm = max(abs(za - z0), abs(zb - z0))
                dr = q_to_iv(m2 * rm)[1]
                return p_iv, (dp0[0] - dr, dp0[1] + dr)

            dt_c = Q(1, 100)
            tau_c = Q(3)
            n_tc = int(tau_c / dt_c)
            inv_z14_c = iv_div_pos((ONE, ONE), iv_sqrt_pos(q_to_iv(tau_c)))
            for m in range(2, 13):
                qm = Q(m, m + 1)
                alo = 0
                ahi = q_to_iv(Q(m * (21 + m), 48000))[1]
                for k in range(5, n_tc):
                    tk, tk1 = k * dt_c, (k + 1) * dt_c
                    za1, zb1 = tk * tk, tk1 * tk1
                    zmid, rz = (za1 + zb1) / 2, (zb1 - za1) / 2
                    p1m, _ = box_c(zmid, zmid)
                    p2m, _ = box_c(qm * zmid, qm * zmid)
                    hmm = iv_sub(iv_pow_int(p1m, m), iv_pow_int(p2m, m + 1))
                    p1s, dp1s = box_c(za1, zb1)
                    p2s, dp2s = box_c(qm * za1, qm * zb1)
                    dd = iv_sub(iv_mul(iv_pow_int(p1s, m - 1), dp1s), iv_mul(iv_pow_int(p2s, m), dp2s))
                    rad = iv_mul((0, m * max(abs(dd[0]), abs(dd[1]))), q_to_iv(rz))[1]
                    dp = (hmm[0] - rad, hmm[1] + rad)
                    wt = q_to_iv(Q(1) / tk - Q(1) / tk1)
                    cb = iv_mul(dp, wt)
                    alo += cb[0]
                    ahi += cb[1]
                pref_m = iv_div_pos(q_to_iv(Q(1, 2)), iv_sqrt_pos(q_to_iv(Q(m))))
                m_iv = iv_mul(pref_m, (alo, ahi))
                tp1 = iv_mul(q_to_iv(Q(4, m + 2)), iv_mul(iv_pow_int(c14_iv, m), iv_pow_int(inv_z14_c, m + 2)))[1]
                rq = iv_nth_root_pos(q_to_iv(Q(m + 1, m)), 4)
                tp2 = iv_mul(q_to_iv(Q(4, m + 3)), iv_mul(iv_mul(iv_pow_int(c14_iv, m + 1), iv_pow_int(rq, m + 1)), iv_pow_int(inv_z14_c, m + 3)))[1]
                tlo = iv_mul(iv_div_pos(q_to_iv(Q(1, 4)), iv_sqrt_pos(q_to_iv(Q(m)))), (0, tp2 if (m % 2 == 0) else (tp1 + tp2)))[1]
                thi = iv_mul(iv_div_pos(q_to_iv(Q(1, 4)), iv_sqrt_pos(q_to_iv(Q(m)))), (0, tp1 if (m % 2 == 1) else (tp1 + tp2)))[1]
                c_lo = Q(m_iv[0] - tlo, ONE)
                c_hi = Q(m_iv[1] + thi, ONE)
                s_lo, s_hi = [Q(x) for x in steps[str(m)]]
                require(max(s_lo, c_lo) <= min(s_hi, c_hi), f"saved CLT step m={m} [{s_lo}, {s_hi}] disjoint from live enclosure")


def expect_failure(fn, name: str) -> None:
    failed = False
    try:
        fn()
    except RuntimeError:
        failed = True
    require(failed, f"adversarial control '{name}' failed to trigger")


def run_adversarial_controls(res: dict, sw_real: dict, fast_lem: dict, eng: WickEngine, pi_iv=None, eh_iv=None, c14_iv=None) -> int:
    # 1. AST rejects float literal / float() call:
    expect_failure(lambda: audit_ast_source("y = 1.5\n", "ctrl1_lit"), "ctrl1_float_literal")
    expect_failure(lambda: audit_ast_source("y = float(2)\n", "ctrl1_call"), "ctrl1_float_call")

    # 2. AST rejects bare assert:
    expect_failure(lambda: audit_ast_source("assert True\n", "ctrl2_assert"), "ctrl2_bare_assert")

    # 3. Real He_3/sqrt(6) doubling STRICTLY FAILS (proving complex structure is essential in 3.20):
    r_hi = Q(sw_real["real_he3_doubling_gain_enclosure"][1])
    require(r_hi < -Q(1, 80) < 0, "ctrl3: real He_3 doubling must be strictly negative")

    # 4. High-zeta sign flip of Delta_Wick(49/10) < 0 (showing (0, 4] positivity cannot extend to R_+):
    _, _, d_49, _ = eng.eval_psi_and_delta_jet1(Q(49, 10))
    require(d_49[1] < 0, "ctrl4: Delta_Wick(4.9) must be strictly negative")

    # 5. Sign flip of D_doub(zeta) = psi_Wick(zeta) - psi_Wick(zeta/2)^2 < 0 at zeta = 19/10 = 1.90:
    p_19, _, _, _ = eng.eval_psi_and_delta_jet1(Q(19, 10))
    p_95, _, _, _ = eng.eval_psi_and_delta_jet1(Q(19, 20))
    require(p_19[1] < iv_mul(p_95, p_95)[0], "ctrl5: D_doub(1.90) must be strictly negative")

    # 6. Log-slope g'(zeta) reverses sign (< 0) at zeta = 3/2 = 1.50 (showing (0, 13/10] cannot extend to 3/2):
    p_15, dp_15, _, _ = eng.eval_psi_and_delta_jet1(Q(3, 2))
    k_15_hi = iv_div_pos(iv_mul(q_to_iv(Q(3, 2)), dp_15), p_15)[1] - iv_ln_pos(p_15)[0]
    require(k_15_hi < 0, "ctrl6: g'(3/2) must be strictly negative")

    # 7. False overly aggressive algebraic envelope c1 = 21/5 = 4.2 at alpha = 1/5 FAILS at zeta = 1/10:
    p_tenth, _, _, _ = eng.eval_psi_and_delta_jet1(Q(1, 10))
    false_rhs = iv_div_pos((ONE, ONE), iv_nth_root_pos(q_to_iv(1 + Q(21, 5) * Q(1, 10)), 5))[1]
    require(p_tenth[0] > false_rhs, "ctrl7: false envelope (1 + 21/5 z)^{-1/5} must fail at z = 1/10")

    # 8. Jet node z0 below panel left endpoint za rejected if naive za curvature is supplied:
    z0_t, za_t, zb_t = Q(2, 5), Q(32041, 80000), Q(41, 100)
    expect_failure(lambda: taylor_curv_psi(z0_t, za_t, zb_t, m2_override=Q(1) / za_t), "ctrl8_psi_za_curv")
    expect_failure(lambda: taylor_curv_delta(z0_t, za_t, zb_t, m2_override=Q(1) / za_t + 1), "ctrl8_delta_za_curv")

    # 9. Unscaled Delta_Wick(1/1000) < c_pos confirms min(zeta^2, 1) scaling is required:
    pos_c = Q(res["continuum_certificates"]["algebraic_envelope"]["psi_wick_minus_exp_scaled_lb_min_zeta2_1_on_0_4"])
    _, _, d_tiny, _ = eng.eval_psi_and_delta_jet1(Q(1, 1000))
    require(d_tiny[1] < q_to_iv(pos_c)[0], "ctrl9: unscaled Delta_Wick(1/1000) < pos_c")

    # 10. Tampered max_compact_ratio_upper >= 1 rejected:
    bad10 = copy.deepcopy(res)
    bad10["continuum_certificates"]["algebraic_envelope"]["max_compact_ratio_upper"] = "1"
    expect_failure(lambda: audit_result_dict(bad10, sw_real, fast_lem), "ctrl10_bad_env_ratio")

    # 11. Tampered PVD F_pos_over_w2_lower violating net gap rejected:
    bad11 = copy.deepcopy(res)
    bad11["continuum_certificates"]["buffered_pvd"]["F_pos_over_w2_lower"] = "37/100"
    expect_failure(lambda: audit_result_dict(bad11, sw_real, fast_lem), "ctrl11_bad_pvd_lb")

    # 12. Tampered T_PVD_over_M2_upper > 7/25 rejected:
    bad12 = copy.deepcopy(res)
    bad12["continuum_certificates"]["buffered_pvd"]["T_PVD_over_M2_upper"] = "29/100"
    expect_failure(lambda: audit_result_dict(bad12, sw_real, fast_lem), "ctrl12_bad_tpvd_ub")

    # 13. Tampered CLT step gain <= 0 rejected:
    bad13 = copy.deepcopy(res)
    bad13["continuum_certificates"]["clt_and_doubling"]["clt_step_gains_m_1_to_12"]["5"] = ["0", "1/100"]
    expect_failure(lambda: audit_result_dict(bad13, sw_real, fast_lem), "ctrl13_bad_clt_step")

    # 14. Tampered diffuse doubling net coefficient rejected:
    bad14 = copy.deepcopy(res)
    bad14["continuum_certificates"]["clt_and_doubling"]["T_doub_over_M2_upper"] = "7/40"
    expect_failure(lambda: audit_result_dict(bad14, sw_real, fast_lem), "ctrl14_bad_tdoub")

    # 15. Tampered Schlaefli-Watson / real He_3 dictionary rejected:
    bad15 = copy.deepcopy(res)
    bad15["schlaefli_watson_and_real_he3"]["zeta_cross_19_2_power5_product_upper"] = "1"
    expect_failure(lambda: audit_result_dict(bad15, sw_real, fast_lem), "ctrl15_bad_sw")

    # 16. False small-frequency coefficient D_doub(z)/z^2 >= 9/2 at z = 1/100 rejected by exact cosine-moment polynomials:
    w_ex = [1, 2, 176, 90816, 121488384]
    z_cx = Q(1, 100)
    p3_half = sum(Q((-z_cx / 4) ** k * w_ex[k], math.factorial(k) ** 2) for k in range(4))
    p4_full = sum(Q((-z_cx / 2) ** k * w_ex[k], math.factorial(k) ** 2) for k in range(5))
    require(p3_half == Q(11942827, 12000000) > 0, "ctrl16: P_3(1/200) exact value")
    ddoub_ub_100 = (p4_full - p3_half * p3_half) / (z_cx * z_cx)
    require(ddoub_ub_100 == Q(60857808071, 14400000000) < Q(9, 2), "ctrl16: D_doub(1/100)/(1/100)^2 < 9/2")

    # 17. Arctangent alternating-series remainder side check at n_last = 2 (m = 5):
    #     s_3(1/5) < arctan(1/5) < s_2(1/5), so outward [lo, hi] must satisfy lo <= s_3 and s_2 <= hi < s_2 + rem/2:
    s2_5 = Q(1, 5) - Q(1, 3 * 125) + Q(1, 5 * 3125)
    s3_5 = s2_5 - Q(1, 7 * 78125)
    at2 = atan_recip_iv(5, n_last=2)
    require(
        at2[0] <= q_to_iv(s3_5)[0] and q_to_iv(s2_5)[0] <= at2[1] < q_to_iv(s2_5 + Q(1, 14 * 78125))[0],
        "ctrl17: atan_recip_iv remainder side",
    )

    # 18. Tampered num_compact_cells = 0 rejected:
    bad18 = copy.deepcopy(res)
    bad18["continuum_certificates"]["algebraic_envelope"]["num_compact_cells"] = 0
    expect_failure(lambda: audit_result_dict(bad18, sw_real, fast_lem), "ctrl18_zero_compact_cells")

    # 19. Disjoint m=5 step-gain interval rejected by live outward consistency check:
    if c14_iv is not None:
        bad19 = copy.deepcopy(res)
        bad19["continuum_certificates"]["clt_and_doubling"]["clt_step_gains_m_1_to_12"]["5"] = ["1/20", "3/50"]
        expect_failure(
            lambda: audit_result_dict(bad19, sw_real, fast_lem, pi_iv=pi_iv, eh_iv=eh_iv, c14_iv=c14_iv, spot_eng=eng),
            "ctrl19_disjoint_m5_step",
        )

    # 20. Gap or truncated endpoint in interval cover rejected by verify_interval_cover:
    expect_failure(
        lambda: verify_interval_cover([(Q(0), Q(1, 2)), (Q(3, 5), Q(1))], Q(0), Q(1), "ctrl20_gap"),
        "ctrl20_interval_gap",
    )
    expect_failure(
        lambda: verify_interval_cover([(Q(0), Q(9, 10))], Q(0), Q(1), "ctrl20_short"),
        "ctrl20_interval_short",
    )

    # 21. Omitted parameter slab in diffuse-doubling / PVD loops rejected by verify_interval_cover:
    wd_ctrl = build_diffuse_doubling_slab_edges()
    w_ctrl, m_ctrl = build_pvd_slab_edges()
    expect_failure(
        lambda: verify_interval_cover(list(zip(wd_ctrl, wd_ctrl[1:]))[1:], Q(1, 100), Q(1, 7), "ctrl21_wd_skip0"),
        "ctrl21_wd_omitted_first_slab",
    )
    expect_failure(
        lambda: verify_interval_cover(list(zip(w_ctrl, w_ctrl[1:]))[1:], Q(1, 50), Q(1), "ctrl21_w_skip0"),
        "ctrl21_pvd_w_omitted_first_slab",
    )
    expect_failure(
        lambda: verify_interval_cover(list(zip(m_ctrl, m_ctrl[1:]))[:-1], Q(1, 5), Q(1), "ctrl21_m_skiplast"),
        "ctrl21_pvd_m_omitted_last_slab",
    )

    # 22. Non-canonical receipt bytes (e.g. extra trailing newline) rejected even when parsed JSON matches:
    canon_res = canonical_receipt_bytes(res)
    require(verify_canonical_receipt_bytes(canon_res, res) == res, "ctrl22: canonical bytes must pass")
    expect_failure(
        lambda: verify_canonical_receipt_bytes(canon_res + b"\n", res),
        "ctrl22_extra_trailing_newline",
    )

    return 22


def main(argv: list[str]) -> int:
    t0 = time.monotonic_ns()
    recompute = "--recompute" in argv
    write_result = "--write-result" in argv
    unknown = [a for a in argv if a not in ("--recompute", "--write-result")]
    require(not unknown, f"unknown CLI flags: {unknown}")
    if write_result:
        require(recompute, "--write-result requires --recompute")

    audit_ast_source(Path(__file__).read_text(encoding="utf-8"), "verify.py")

    c14_iv, sw_real = compute_schlaefli_watson_and_real_he3()
    fast_lem, eh_iv = verify_fast_analytic_lemmas()
    pi_iv = compute_pi_iv()
    eng = WickEngine(full_range=recompute)

    if recompute:
        cont = recompute_full(eng, c14_iv, pi_iv, eh_iv)
        fresh = {
            "schema": "wick-pvd-doubling-v1",
            "agent_id": "gemini-21d5",
            "task_issue": 730,
            "precision_bits": P,
            "schlaefli_watson_and_real_he3": sw_real,
            "analytic_lemmas": fast_lem,
            "continuum_certificates": cont,
        }
        if write_result:
            RESULT_JSON.write_bytes(canonical_receipt_bytes(fresh))
            print(f"[write] Wrote {RESULT_JSON} ({RESULT_JSON.stat().st_size} bytes)")
        require(RESULT_JSON.is_file(), f"missing {RESULT_JSON}")
        saved = verify_canonical_receipt_bytes(RESULT_JSON.read_bytes(), fresh)
        audit_result_dict(saved, sw_real, fast_lem, pi_iv=pi_iv, eh_iv=eh_iv, c14_iv=c14_iv, spot_eng=eng)
        n_ctrl = run_adversarial_controls(saved, sw_real, fast_lem, eng, pi_iv=pi_iv, eh_iv=eh_iv, c14_iv=c14_iv)
        mode_lbl = "FULL 1088-BIT RECOMPUTE FROM SCRATCH (saved == fresh)"
        src_tag = "[recomputed]"
    else:
        require(RESULT_JSON.is_file(), f"missing {RESULT_JSON}; run with --recompute --write-result first")
        raw_saved = RESULT_JSON.read_bytes()
        saved = verify_canonical_receipt_bytes(raw_saved, json.loads(raw_saved.decode("utf-8")))
        audit_result_dict(saved, sw_real, fast_lem, pi_iv=pi_iv, eh_iv=eh_iv, c14_iv=c14_iv, spot_eng=eng)
        n_ctrl = run_adversarial_controls(saved, sw_real, fast_lem, eng, pi_iv=pi_iv, eh_iv=eh_iv, c14_iv=c14_iv)
        mode_lbl = "DEFAULT AUDIT (live analytic/m=1..12 checks + saved slab bounds)"
        src_tag = "[saved receipt, spot-checked]"

    dt_ms = (time.monotonic_ns() - t0) // 1000000
    ct = saved["continuum_certificates"]
    c14_lo, c14_hi = [Q(x) for x in sw_real["C_quarter_enclosure"]]
    r_lo, r_hi = [Q(x) for x in sw_real["real_he3_doubling_gain_enclosure"]]
    m1_lo, m1_hi = [Q(x) for x in ct["clt_and_doubling"]["clt_step_gains_m_1_to_12"]["1"]]
    env_cap_str = fmt_dec_ceil(Q(ct["algebraic_envelope"]["max_compact_ratio_upper"]))
    print(f"=== PASS [{mode_lbl}] ({dt_ms} ms, {n_ctrl} adversarial controls passed) ===")
    print(f"  Schlaefli-Watson C_{{1/4}}          : [{fmt_dec_floor(c14_lo)}, {fmt_dec_ceil(c14_hi)}] < 17/20 [recomputed]")
    print(f"  Envelope |psi_Wick(z)|(1+19z/5)^1/5 : <= 1 on [0, inf) (< 1 for z>0; <={env_cap_str} on [1/50, 19/2]) {src_tag}")
    print(f"  Buffered PVD gap coef (all m, v>=0) : >= {ct['buffered_pvd']['certified_net_gap_coef']} * sum(u_j^2)/(u+v)^(3/2) {src_tag}")
    print(f"  Complex Wick m=1 doubling gain      : [{fmt_dec_floor(m1_lo, 6)}, {fmt_dec_ceil(m1_hi, 6)}] > 0 [recomputed]")
    print(f"  Real He_3/sqrt(6) doubling gain     : [{fmt_dec_floor(r_lo, 6)}, {fmt_dec_ceil(r_hi, 6)}] < -1/80 < 0 [recomputed]")
    print(f"  CLT E|q_{{m+1}}| > E|q_m|            : m=1..12 coarse/exact + m>=13 analytic [recomputed], g'>0 {src_tag}")
    print(f"  Diffuse doubling (max u_j <= u/7)   : >= {ct['clt_and_doubling']['certified_diffuse_doubling_coef']} * sum(u_j^2)/u^(3/2) {src_tag}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
