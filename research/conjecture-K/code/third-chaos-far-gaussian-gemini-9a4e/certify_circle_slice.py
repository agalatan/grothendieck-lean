#!/usr/bin/env python3
"""Decoupled piecewise-linear + Gaussian-circle slice certificate for the real third Wiener chaos.

Agent-ID: gemini-9a4e. Refs #506, #501, #458.
Standard library only (`python3 -I`). All real enclosures use outward-rounded integer intervals
at scale `S = 10**30` (and `S2 = 10**16` in the 3D angular sum, checked for integer bounds).

Proves dimension-free for every normalized real third-chaos polynomial `F = I_3(T)/sqrt(6)` (`||T||_HS = 1`):
  1. `a(F) >= 129/200 = 0.645  ==>  E|F| < 16491/20000 = 0.82455 < sqrt(17/25)` (practical target (T)),
  2. `a(F) >= 349/500 = 0.698  ==>  E|F| < 19947/25000 = 0.79788 < sqrt(2/pi)`  (Gaussian bound),
improving `0.662` -> `0.645` and `0.711` -> `0.698`.
"""
if not __debug__:
    raise RuntimeError("Run without -O; assertions are required.")

import math
import time
from fractions import Fraction as Q
from functools import lru_cache

S = 10**30
S2 = 10**16


def fdiv(a, b):
    return a // b


def cdiv(a, b):
    return -((-a) // b)


class Iv:
    """Outward-rounded closed interval `[lo / S, hi / S]`."""

    __slots__ = ("lo", "hi")

    def __init__(self, lo, hi=None):
        if hi is None:
            hi = lo
        assert lo <= hi, f"Inverted interval: {lo} > {hi}"
        self.lo = lo
        self.hi = hi

    @staticmethod
    def frac(x):
        x = Q(x)
        lo = fdiv(x.numerator * S, x.denominator)
        hi = cdiv(x.numerator * S, x.denominator)
        assert lo * x.denominator <= x.numerator * S <= hi * x.denominator
        return Iv(lo, hi)

    def __add__(self, o):
        return Iv(self.lo + o.lo, self.hi + o.hi)

    def __sub__(self, o):
        return Iv(self.lo - o.hi, self.hi - o.lo)

    def __neg__(self):
        return Iv(-self.hi, -self.lo)

    def __mul__(self, o):
        p1 = self.lo * o.lo
        p2 = self.lo * o.hi
        p3 = self.hi * o.lo
        p4 = self.hi * o.hi
        return Iv(fdiv(min(p1, p2, p3, p4), S), cdiv(max(p1, p2, p3, p4), S))

    def __truediv__(self, o):
        assert o.lo > 0, "Interval divisor must be strictly positive"
        if self.lo >= 0:
            return Iv(fdiv(self.lo * S, o.hi), cdiv(self.hi * S, o.lo))
        if self.hi <= 0:
            return Iv(fdiv(self.lo * S, o.lo), cdiv(self.hi * S, o.hi))
        return Iv(fdiv(self.lo * S, o.lo), cdiv(self.hi * S, o.lo))

    def abs_upper(self):
        return max(-self.lo, self.hi)


ZERO = Iv(0, 0)
ONE = Iv(S, S)


def iv_sqrt(x):
    assert x.lo >= 0
    lo = math.isqrt(x.lo * S)
    hi_arg = x.hi * S
    hi = math.isqrt(hi_arg)
    if hi * hi < hi_arg:
        hi += 1
    assert lo * lo <= x.lo * S and hi * hi >= hi_arg
    return Iv(lo, hi)


def _atan_unit_inv(m):
    """Rigorous Leibniz enclosure of `arctan(1 / m)` for integer `m >= 2`."""
    m2 = m * m
    term_num = S // m
    term_hi = cdiv(S, m)
    acc = ZERO
    k = 0
    while True:
        denom = 2 * k + 1
        t = Iv(fdiv(term_num, denom), cdiv(term_hi, denom))
        if k % 2 == 0 and t.hi <= 4:
            return acc + Iv(0, t.hi)
        acc = (acc + t) if (k % 2 == 0) else (acc - t)
        term_num = fdiv(term_num, m2)
        term_hi = cdiv(term_hi, m2)
        k += 1


PI = Iv.frac(16) * _atan_unit_inv(5) - Iv.frac(4) * _atan_unit_inv(239)
assert Iv.frac(Q(31415926535897932384626433, 10**25)).hi < PI.lo
assert PI.hi < Iv.frac(Q(31415926535897932384626434, 10**25)).lo

INV_SQRT6 = ONE / iv_sqrt(Iv.frac(6))
PHI0 = ONE / iv_sqrt(Iv.frac(2) * PI)
SQRT_2_OVER_PI = iv_sqrt(Iv.frac(2) / PI)


def iv_exp_neg(u_frac):
    """Rigorous enclosure of `exp(-u)` for exact `Fraction` `u >= 0` via halving + Leibniz series."""
    u = Q(u_frac)
    assert u >= 0
    if u == 0:
        return ONE
    halves = 0
    v = u
    while v > Q(1, 2):
        v /= 2
        halves += 1
    v_iv = Iv.frac(v)
    term = ONE
    acc = ZERO
    k = 0
    while True:
        if k % 2 == 0 and term.hi <= 4:
            res = acc + Iv(0, term.hi)
            break
        acc = (acc + term) if (k % 2 == 0) else (acc - term)
        k += 1
        term = (term * v_iv) / Iv.frac(k)
    for _ in range(halves):
        res = res * res
    return res


def iv_cos_sin(theta):
    """Rigorous Leibniz enclosures of `(cos(theta), sin(theta))` for `Iv` `0 <= theta < 10`."""
    assert 0 <= theta.lo and theta.hi < 10 * S
    t2 = theta * theta
    # cos(theta) = sum_{k>=0} (-1)^k theta^(2k) / (2k)!
    term = ONE
    acc_c = ZERO
    k = 0
    while True:
        # Strict decrease holds once theta^2 < (2k+1)(2k+2); for theta <= 10, k >= 6 suffices.
        if k >= 6 and k % 2 == 0 and term.hi <= 8:
            cos_v = acc_c + Iv(0, term.hi)
            break
        acc_c = (acc_c + term) if (k % 2 == 0) else (acc_c - term)
        k += 1
        term = (term * t2) / Iv.frac((2 * k - 1) * (2 * k))
    # sin(theta) = sum_{k>=0} (-1)^k theta^(2k+1) / (2k+1)!
    term = theta
    acc_s = ZERO
    k = 0
    while True:
        if k >= 6 and k % 2 == 0 and term.hi <= 8:
            sin_v = acc_s + Iv(0, term.hi)
            break
        acc_s = (acc_s + term) if (k % 2 == 0) else (acc_s - term)
        k += 1
        term = (term * t2) / Iv.frac((2 * k) * (2 * k + 1))
    return cos_v, sin_v


E_ABS_H3 = (ONE + Iv.frac(4) * iv_exp_neg(Q(3, 2))) / iv_sqrt(Iv.frac(3) * PI)


@lru_cache(maxsize=None)
def gaussian_pair(t_frac):
    """Returns `(phi(t), Phi_N(t))` as `Iv` enclosures for exact `Fraction` `t` in `[-8, 8]`."""
    t = Q(t_frac)
    assert -8 <= t <= 8
    dens = PHI0 * iv_exp_neg(t * t / 2)
    if t == 0:
        return dens, Iv.frac(Q(1, 2))
    if t < 0:
        _, cdf_pos = gaussian_pair(-t)
        return dens, ONE - cdf_pos
    # 0 < t <= 8: Phi_N(t) = 1/2 + phi(0) * sum_{k>=0} (-1)^k t^(2k+1) / (2^k k! (2k+1)).
    # Ratio |a_{k+1}/a_k| < t^2 / (2(k+1)) <= 32 / (k+1) < 1 for all k >= 32.
    t_iv = Iv.frac(t)
    half_t2 = Iv.frac(t * t / 2)
    pow_term = t_iv  # t^(2k+1) / (2^k k!)
    acc = ZERO
    k = 0
    while True:
        term = pow_term / Iv.frac(2 * k + 1)
        if k >= 34 and k % 2 == 0 and term.hi <= 8:
            integral = acc + Iv(0, term.hi)
            break
        acc = (acc + term) if (k % 2 == 0) else (acc - term)
        k += 1
        pow_term = (pow_term * half_t2) / Iv.frac(k)
    return dens, Iv.frac(Q(1, 2)) + PHI0 * integral


@lru_cache(maxsize=None)
def psi_upper_int(q_frac, b_frac):
    """Returns an integer `U` such that `E|h_3(X) + q X + b| <= U / S`."""
    q = Q(q_frac)
    b = Q(b_frac)
    q_iv = Iv.frac(q)
    b_iv = Iv.frac(b)
    lin = q_iv - Iv.frac(3) * INV_SQRT6

    def p_iv(x_iv):
        return x_iv * (x_iv * x_iv * INV_SQRT6 + lin) + b_iv

    def dp_iv(x_iv):
        return Iv.frac(3) * x_iv * x_iv * INV_SQRT6 + lin

    def prim(t):
        dens, cdf = gaussian_pair(t)
        return (Iv.frac(1 - t * t) * INV_SQRT6 - q_iv) * dens + b_iv * cdf

    outer = Q(8)
    assert dp_iv(Iv.frac(outer)).lo > 0 and dp_iv(Iv.frac(-outer)).lo > 0
    assert p_iv(Iv.frac(-outer)).hi < 0 and p_iv(Iv.frac(outer)).lo > 0

    res = b_iv - prim(outer) - prim(-outer)
    todo = [(-outer, outer, 0)]
    while todo:
        lo, hi, depth = todo.pop()
        x_box = Iv(Iv.frac(lo).lo, Iv.frac(hi).hi)
        val = p_iv(x_box)
        pos = val.lo >= 0
        neg = val.hi <= 0
        if not (pos or neg):
            sl = dp_iv(x_box)
            if sl.lo > 0 or sl.hi < 0:
                p_lo = p_iv(Iv.frac(lo))
                p_hi = p_iv(Iv.frac(hi))
                pos = p_lo.lo >= 0 and p_hi.lo >= 0
                neg = p_lo.hi <= 0 and p_hi.hi <= 0
        if pos or neg:
            seg = prim(hi) - prim(lo)
            res = (res + seg) if pos else (res - seg)
        elif depth >= 18:
            width = Iv.frac(hi - lo)
            res = res + Iv(0, val.abs_upper()) * PHI0 * width
        else:
            mid = (lo + hi) / 2
            todo.extend(((lo, mid, depth + 1), (mid, hi, depth + 1)))
    return res.hi


B_KNOTS = [
    Q("0.00"), Q("0.10"), Q("0.20"), Q("0.30"), Q("0.40"), Q("0.50"),
    Q("0.58"), Q("0.64"), Q("0.69"), Q("0.73"), Q("0.76"), Q("0.78"),
    Q("0.81"), Q("0.85"), Q("0.91"), Q("1.00"), Q("1.15"), Q("1.40"),
    Q("1.80"), Q("2.40"), Q("3.40"), Q("5.00"),
]

# Precompute centi-bin segment map for B_KNOTS (every knot is an exact integer multiple of 1/100):
SEG_BY_CENTI = [0] * 500
for _j in range(len(B_KNOTS) - 1):
    _c0 = int(B_KNOTS[_j] * 100)
    _c1 = int(B_KNOTS[_j + 1] * 100)
    assert Q(_c0, 100) == B_KNOTS[_j] and Q(_c1, 100) == B_KNOTS[_j + 1]
    for _c in range(_c0, _c1):
        SEG_BY_CENTI[_c] = _j

# Precompute angular trig enclosures at N_THETA = 1024 uniform grid points on [0, pi] in scale S2 = 10**16:
N_THETA = 1024
TRIG_S2 = []
for _m in range(N_THETA):
    _th = (PI * Iv.frac(_m)) / Iv.frac(N_THETA)
    _c1, _s1 = iv_cos_sin(_th)
    _c3, _s3 = iv_cos_sin(_th * Iv.frac(3))
    assert (_c1 * _c1 + _s1 * _s1).lo <= S <= (_c1 * _c1 + _s1 * _s1).hi
    assert (_c3 * _c3 + _s3 * _s3).lo <= S <= (_c3 * _c3 + _s3 * _s3).hi
    TRIG_S2.append((
        fdiv(_c1.lo * S2, S), cdiv(_c1.hi * S2, S),
        fdiv(_c3.lo * S2, S), cdiv(_c3.hi * S2, S),
        fdiv(_s3.lo * S2, S), cdiv(_s3.hi * S2, S),
    ))

# Chord angular quadrature factor (pi / N_THETA)^2 / 12 in scale S2:
CHORD_COEFF_S2 = cdiv(((PI * PI) / Iv.frac(12 * N_THETA * N_THETA)).hi * S2, S)


def verify_phi_convex_and_lipschitz(phi_vals):
    """Verifies `0 < s_0 < s_1 < ... < s_{20} < s_{21} = 1` and `Phi(b) > |b|` on all of R."""
    assert len(phi_vals) == len(B_KNOTS)
    slopes = []
    intercepts = []
    for j in range(len(B_KNOTS) - 1):
        sj = (phi_vals[j + 1] - phi_vals[j]) / (B_KNOTS[j + 1] - B_KNOTS[j])
        uj = phi_vals[j] - sj * B_KNOTS[j]
        slopes.append(sj)
        intercepts.append(uj)
        assert phi_vals[j] > B_KNOTS[j], f"Knot {j} must satisfy phi_j > b_j"
    assert phi_vals[-1] > B_KNOTS[-1]
    slopes.append(Q(1))
    intercepts.append(phi_vals[-1] - B_KNOTS[-1])
    assert slopes[0] > 0
    for j in range(len(slopes) - 1):
        assert slopes[j] < slopes[j + 1], f"Slopes not strictly increasing at {j}: {slopes[j]} >= {slopes[j+1]}"
    return slopes, intercepts


def certify_stage1_1d_knots(phi_vals, ell, alpha):
    """Proves `Psi(q, b) <= Phi(b) + ell*q + alpha*q^2` on all `R^2` via the 22 knot lines `b = b_k`."""
    q_bound = Q(5)
    # 1. Exterior |q| >= 5, all b in R: since Psi(q, b) - Phi(b) <= E|h_3| + sqrt(2/pi)|q| - (phi_21 - 5),
    # check 2*alpha*5 > sqrt(2/pi) + |ell| and E|h_3| - (phi_21 - 5) + (sqrt(2/pi) + |ell|)*5 - 25*alpha < 0:
    slope_ext = SQRT_2_OVER_PI + Iv.frac(abs(ell))
    assert (Iv.frac(2 * alpha * q_bound) - slope_ext).lo > 0
    ext_at_5 = E_ABS_H3 - Iv.frac(phi_vals[-1] - B_KNOTS[-1]) + slope_ext * Iv.frac(q_bound) - Iv.frac(alpha * q_bound * q_bound)
    assert ext_at_5.hi < 0

    # 2. Compact |q| <= 5 for each knot b_k (k = 0..21):
    # By convexity of b |-> Psi(q, b) on each [b_j, b_{j+1}] where Phi(b) is affine, and monotonicity of
    # b |-> Psi(q, b) - b = 2 E[(-h_3(X) - qX - b)_+] on [5, inf) where Phi(b) - b == phi_21 - 5,
    # sup_{b in R} (Psi(q, b) - Phi(b)) == max_{0 <= k <= 21} (Psi(q, b_k) - phi_k)!
    total_intervals = 0
    for k, (bk, phik) in enumerate(zip(B_KNOTS, phi_vals)):
        def corner_excess_hi(q_val):
            rhs = Iv.frac(phik + ell * q_val + alpha * q_val * q_val)
            return psi_upper_int(q_val, bk) - rhs.lo

        stack = [(Q(-5) + Q(m, 2), Q(-5) + Q(m + 1, 2), 0) for m in range(20)]
        while stack:
            q0, q1, depth = stack.pop()
            hq = (q1 - q0) / 2
            pen_hi = Iv.frac(alpha * hq * hq).hi
            if max(corner_excess_hi(q0), corner_excess_hi(q1)) + pen_hi < 0:
                total_intervals += 1
                continue
            assert depth < 24, f"Stage 1 failed at knot {k} ({bk}), q in [{float(q0)}, {float(q1)}]"
            qm = (q0 + q1) / 2
            stack.extend(((q0, qm, depth + 1), (qm, q1, depth + 1)))
    return total_intervals


def certify_stage2_3d_circle(phi_vals, slopes, intercepts, c0, mu1, mu3):
    """Proves `I_Phi(r1, r3, t3) <= c0 + mu1*r1^2 + mu3*(r3^2 + t3^2)` on `R_+ x R x R_+`."""
    # 1. Analytic exterior S = r1^2 + r3^2 + t3^2 >= 16 (R_max = 4):
    # I_Phi <= phi_0 + sqrt(S / 2), while RHS >= c0 + min(mu1, mu3)*S.
    # For S >= 16: check c0 >= phi_0 and min(mu1, mu3)^2 * 16 > 1/2 (so min(mu1, mu3)*sqrt(S) > 1/sqrt(2),
    # hence min(mu1, mu3)*S > sqrt(S/2) for all S >= 16!).
    mu_min = min(mu1, mu3)
    assert c0 >= phi_vals[0]
    assert mu_min * mu_min * 16 > Q(1, 2)

    # Pre-convert piecewise-linear coefficients u_j, s_j to integer upper bounds in scale S2:
    u_hi_s2 = [cdiv(u.numerator * S2, u.denominator) for u in intercepts]
    s_hi_s2 = [cdiv(s.numerator * S2, s.denominator) for s in slopes]
    assert s_hi_s2[-1] == S2
    centi_unit = S2 // 100
    assert centi_unit * 100 == S2
    five_s2 = 5 * S2
    u21_hi = u_hi_s2[21]

    @lru_cache(maxsize=None)
    def vertex_excess_s2(r1, r3, t3):
        """Upper bound in scale S2 on `I_Phi(r1, r3, t3) - (c0 + mu1*r1^2 + mu3*(r3^2 + t3^2))`."""
        assert r1 >= 0 and t3 >= 0
        assert (r1.numerator * S2) % r1.denominator == 0
        assert (r3.numerator * S2) % r3.denominator == 0
        assert (t3.numerator * S2) % t3.denominator == 0
        r1_s2 = (r1.numerator * S2) // r1.denominator
        r3_s2 = (r3.numerator * S2) // r3.denominator
        t3_s2 = (t3.numerator * S2) // t3.denominator

        acc_phi = 0
        for c1_lo, c1_hi, c3_lo, c3_hi, s3_lo, s3_hi in TRIG_S2:
            # g(theta_m) = r1*cos(theta_m) + r3*cos(3*theta_m) + t3*sin(3*theta_m)
            # Only |g| upper bound is needed because Phi is even and nondecreasing on [0, inf)!
            a_lo = (r1_s2 * c1_lo) // S2
            a_hi = cdiv(r1_s2 * c1_hi, S2)
            if r3_s2 >= 0:
                b_lo = (r3_s2 * c3_lo) // S2
                b_hi = cdiv(r3_s2 * c3_hi, S2)
            else:
                b_lo = (r3_s2 * c3_hi) // S2
                b_hi = cdiv(r3_s2 * c3_lo, S2)
            d_lo = (t3_s2 * s3_lo) // S2
            d_hi = cdiv(t3_s2 * s3_hi, S2)
            g_lo = a_lo + b_lo + d_lo
            g_hi = a_hi + b_hi + d_hi
            w = -g_lo if (-g_lo > g_hi) else g_hi
            if w >= five_s2:
                acc_phi += u21_hi + w
            else:
                j = SEG_BY_CENTI[w // centi_unit]
                acc_phi += u_hi_s2[j] + cdiv(s_hi_s2[j] * w, S2)

        mean_hi = cdiv(acc_phi, N_THETA)
        # Chord remainder: ((pi / N_THETA)^2 / 12) * (r1 + 9 * sqrt(r3^2 + t3^2))
        rad3_sq = r3 * r3 + t3 * t3
        rad3_hi_s2 = math.isqrt(cdiv(rad3_sq.numerator * S2 * S2, rad3_sq.denominator)) + 1
        l2_s2 = r1_s2 + 9 * rad3_hi_s2
        rem_s2 = cdiv(CHORD_COEFF_S2 * l2_s2, S2)

        rhs_q = c0 + mu1 * r1 * r1 + mu3 * rad3_sq
        rhs_lo_s2 = fdiv(rhs_q.numerator * S2, rhs_q.denominator)
        return (mean_hi + rem_s2) - rhs_lo_s2

    # Initialize with unit cubes on [0, 4] x [-4, 4] x [0, 4]:
    stack = [
        (Q(i1), Q(i1 + 1), Q(i3), Q(i3 + 1), Q(k3), Q(k3 + 1), 0)
        for i1 in range(4)
        for i3 in range(-4, 4)
        for k3 in range(4)
    ]
    accepted = 0
    while stack:
        a1, b1, a3, b3, c3, d3, depth = stack.pop()
        r3_min_sq = Q(0) if (a3 <= 0 <= b3) else min(a3 * a3, b3 * b3)
        if a1 * a1 + r3_min_sq + c3 * c3 >= 16:
            accepted += 1
            continue
        h1 = (b1 - a1) / 2
        h3 = (b3 - a3) / 2
        k3 = (d3 - c3) / 2
        pen_q = mu1 * h1 * h1 + mu3 * (h3 * h3 + k3 * k3)
        pen_s2 = cdiv(pen_q.numerator * S2, pen_q.denominator)

        max_c = max(
            vertex_excess_s2(x1, x3, y3)
            for x1 in (a1, b1)
            for x3 in (a3, b3)
            for y3 in (c3, d3)
        )
        if max_c + pen_s2 < 0:
            accepted += 1
            continue
        assert depth < 24, f"Stage 2 failed at ({float(a1)}, {float(a3)}, {float(c3)}), exc={(max_c + pen_s2)/S2:.3e}"
        # Split along axis with largest quadratic penalty contribution:
        w1 = mu1 * h1 * h1
        w3 = mu3 * h3 * h3
        wt = mu3 * k3 * k3
        if w1 >= w3 and w1 >= wt:
            m = (a1 + b1) / 2
            stack.extend(((a1, m, a3, b3, c3, d3, depth + 1), (m, b1, a3, b3, c3, d3, depth + 1)))
        elif w3 >= wt:
            m = (a3 + b3) / 2
            stack.extend(((a1, b1, a3, m, c3, d3, depth + 1), (a1, b1, m, b3, c3, d3, depth + 1)))
        else:
            m = (c3 + d3) / 2
            stack.extend(((a1, b1, a3, b3, c3, m, depth + 1), (a1, b1, a3, b3, m, d3, depth + 1)))

    return accepted, vertex_excess_s2.cache_info().currsize


def certify_regime(label, a0_s, ell_s, alpha_s, phi_strs, c0_s, mu1_s, mu3_s, promised_s, target_iv):
    t0 = time.time()
    a0 = Q(a0_s)
    ell = Q(ell_s)
    alpha = Q(alpha_s)
    phi_vals = [Q(s) for s in phi_strs]
    c0 = Q(c0_s)
    mu1 = Q(mu1_s)
    mu3 = Q(mu3_s)
    promised = Q(promised_s)

    slopes, intercepts = verify_phi_convex_and_lipschitz(phi_vals)
    n1 = certify_stage1_1d_knots(phi_vals, ell, alpha)
    n2, n_verts = certify_stage2_3d_circle(phi_vals, slopes, intercepts, c0, mu1, mu3)

    mu = max(alpha, Q(3, 2) * mu1 + Q(1, 2) * mu3)
    assert mu > 0
    endpoint = max(c0, a0 * c0 + mu * (1 - a0 * a0) / a0)
    assert endpoint < promised, f"Endpoint {float(endpoint)} >= {float(promised)}"
    assert Iv.frac(promised).hi < target_iv.lo, "Promised rational not below target!"
    dt = time.time() - t0
    print(
        f"PASS {label} a(F) >= {a0} ({float(a0):.3f}): "
        f"Stage1={n1} 1D-cells, Stage2={n2} 3D-boxes ({n_verts} vertices), "
        f"E|F| <= {float(endpoint):.6f} < {promised} ({dt:.2f}s)",
        flush=True,
    )


def run_rejection_controls():
    # 1. Self-test E|h_3(X)| == (1 + 4 e^(-3/2)) / sqrt(3 pi) ~ 0.6165 within 10^-6:
    u00 = psi_upper_int(Q(0), Q(0))
    assert u00 >= E_ABS_H3.lo
    assert u00 - E_ABS_H3.lo < S // 10**6

    # 2. Lowering phi_0 = 0.710 below sup_q (Psi(q, 0) - ell*q - alpha*q^2) ~ 0.7182 must fail Stage 1:
    bad_phi = [
        Q("0.710000"), Q("0.721530"), Q("0.728709"), Q("0.740837"), Q("0.758021"), Q("0.780614"),
        Q("0.802894"), Q("0.822333"), Q("0.840566"), Q("0.876053"), Q("0.903701"), Q("0.922165"),
        Q("0.949945"), Q("0.987060"), Q("1.042903"), Q("1.127064"), Q("1.268237"), Q("1.505570"),
        Q("1.889331"), Q("2.471362"), Q("3.451700"), Q("5.034238"),
    ]
    try:
        certify_stage1_1d_knots(bad_phi, Q("-0.135"), Q("0.400"))
        raise AssertionError("Control failed to reject invalid phi_0 = 0.710 below Stage-1 supremum")
    except AssertionError as exc:
        assert "failed to reject" not in str(exc)

    # 3. Lowering c_0 below phi_0 must fail Stage 2:
    phis_ok = [Q(s) for s in PHI_PRACTICAL]
    sl_ok, ic_ok = verify_phi_convex_and_lipschitz(phis_ok)
    try:
        certify_stage2_3d_circle(phis_ok, sl_ok, ic_ok, Q("0.75000"), Q("0.18440"), Q("0.17880"))
        raise AssertionError("Control failed to reject c_0 < phi_0 in Stage 2")
    except AssertionError as exc:
        assert "failed to reject" not in str(exc)


PHI_PRACTICAL = [
    "0.762546", "0.764713", "0.771272", "0.782267", "0.797825", "0.818144",
    "0.838040", "0.855232", "0.871171", "0.885061", "0.896211", "0.912533",
    "0.940364", "0.977564", "1.033550", "1.117898", "1.259359", "1.497119",
    "1.881449", "2.464118", "3.445178", "5.028351",
]

PHI_GAUSSIAN = [
    "0.718362", "0.720758", "0.727975", "0.740125", "0.757370", "0.780020",
    "0.802370", "0.821879", "0.840182", "0.875750", "0.903415", "0.921896",
    "0.949666", "0.986786", "1.042650", "1.126829", "1.268020", "1.505384",
    "1.889175", "2.471229", "3.451602", "5.034152",
]


def main():
    run_rejection_controls()
    print("PASS self-test E|h_3(X)| and Stage-1 rejection control", flush=True)

    certify_regime(
        label="practical (T)",
        a0_s="129/200",
        ell_s="-12/125",
        alpha_s="183/500",
        phi_strs=PHI_PRACTICAL,
        c0_s="0.76450",
        mu1_s="0.18440",
        mu3_s="0.17880",
        promised_s="16491/20000",
        target_iv=iv_sqrt(Iv.frac(Q(17, 25))),
    )

    certify_regime(
        label="Gaussian c",
        a0_s="349/500",
        ell_s="-27/200",
        alpha_s="201/500",
        phi_strs=PHI_GAUSSIAN,
        c0_s="0.71996",
        mu1_s="0.20250",
        mu3_s="0.19650",
        promised_s="79788/100000",
        target_iv=SQRT_2_OVER_PI,
    )


if __name__ == "__main__":
    main()
