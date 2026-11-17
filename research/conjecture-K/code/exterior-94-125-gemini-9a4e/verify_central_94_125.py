#!/usr/bin/env python3
"""Outward-rounded integer Rice-benchmark and central-consumer verifier at eps = 3/4 and eps = 94/125.

Agent-ID: gemini-9a4e. Task #511 (Refs #177, #440).
Standard library only (`python3 -I`). All interval bounds use outward-rounded
Python big-integer arithmetic at fixed-point scale S = 10^45, and all consumer
budget inequalities use exact `fractions.Fraction` arithmetic.

Certifies:
1. Closed-form Rice self-tests at beta = 0 against exact algebraic identities
   J(v) = sqrt(pi * (ell^2 + v)) - v/eps, J'(v) = sqrt(pi)/(2*sqrt(ell^2 + v)) - 1/eps.
2. Nine central rows covering [159/200, 108/125] = [0.795, 0.864] at eps = 3/4
   (where Lean's `Lower.rho` alone closes the exterior), certifying S_i < S_i^upper
   and exact allowance eta_max_i > 75/10^6 (minimum > 7.57e-5, > 2.49x STATUS 8.10) on every row.
3. Thirteen central rows covering [1503/2000, 863/1000] = [0.7515, 0.863] at eps = 94/125
   (where `rho = 93462/100000` of STATUS 3.7 closes the exterior), certifying S_i < S_i^upper
   and exact allowance eta_max_i > 1/10000 (10^-4; minimum > 1.021e-4, > 3.36x STATUS 8.10)
   on every row, with Row 8 ([0.840, 0.847]) strictly inside the proved remote rectangle
   (STATUS 3.15) and proved retained A-core rectangle (STATUS 11.53).
4. Three rejection controls (unbracketed variance, deflated S_upper, excessive eta).
"""
if not __debug__:
    raise RuntimeError("Run without -O; assertions are required.")

import json
import time
from fractions import Fraction as F
from math import isqrt
from pathlib import Path

S = 10**45
TARGET = F(500, 701)
A_212B = F(886762780, 10**9)
B_212B = F(432306903, 10**9)


class Iv:
    """Outward-rounded interval [lo/S, hi/S] represented by exact Python integers."""

    __slots__ = ("lo", "hi")

    def __init__(self, lo, hi=None):
        self.lo = lo
        self.hi = lo if hi is None else hi
        assert self.lo <= self.hi

    @staticmethod
    def from_frac(q):
        q = F(q)
        lo = (q.numerator * S) // q.denominator
        hi = -((-q.numerator * S) // q.denominator)
        return Iv(lo, hi)

    def __add__(self, o):
        return Iv(self.lo + o.lo, self.hi + o.hi)

    def __sub__(self, o):
        return Iv(self.lo - o.hi, self.hi - o.lo)

    def __neg__(self):
        return Iv(-self.hi, -self.lo)

    def __mul__(self, o):
        a, b, c, d = self.lo, self.hi, o.lo, o.hi
        p1, p2, p3, p4 = a * c, a * d, b * c, b * d
        return Iv(min(p1, p2, p3, p4) // S, -((-max(p1, p2, p3, p4)) // S))

    def __truediv__(self, o):
        assert o.lo > 0, "Denominator interval must be strictly positive"
        lo = (self.lo * S) // (o.hi if self.lo >= 0 else o.lo)
        hi = -((-self.hi * S) // (o.lo if self.hi >= 0 else o.hi))
        return Iv(lo, hi)

    def hull(self, o):
        return Iv(min(self.lo, o.lo), max(self.hi, o.hi))

    def abs_hi(self):
        return max(abs(self.lo), abs(self.hi))

    def sqrt(self):
        assert self.lo >= 0
        lo = isqrt(self.lo * S)
        hi = isqrt(self.hi * S)
        if hi * hi < self.hi * S:
            hi += 1
        return Iv(lo, hi)


def _exp_neg_small_bounds(y_int):
    """Rigorous [lo, hi] for exp(-y_int/S) when 0 <= y_int <= S // 4.

    Since 0 <= y <= 1/4 < 1, the alternating Taylor series sum_{k>=0} (-y)^k / k!
    has strictly decreasing term magnitudes from k = 1 onward. Truncating after k = 35
    (odd) gives a strict lower bound, and adding y^36 / 36! gives a strict upper bound.
    """
    assert 0 <= y_int <= S // 4
    acc_lo = S
    acc_hi = S
    term_lo = S
    term_hi = S
    for k in range(1, 36):
        term_lo = (term_lo * y_int) // (k * S)
        term_hi = -((-term_hi * y_int) // (k * S))
        if k % 2 == 1:
            acc_lo -= term_hi
            acc_hi -= term_lo
        else:
            acc_lo += term_lo
            acc_hi += term_hi
    rem36 = -((-term_hi * y_int) // (36 * S))
    return Iv(max(0, acc_lo), acc_hi + rem36)


def exp_neg_point(x_int):
    """Outward enclosure of exp(-x_int / S) for x_int >= 0 via halving + monotonicity."""
    if x_int <= 0:
        return Iv(S, S)
    m = 0
    y_lo = x_int
    y_hi = x_int
    while y_hi > S // 4:
        y_lo //= 2
        y_hi = -((-y_hi) // 2)
        m += 1
    # Monotonicity of exp(-y): lower bound from y_hi, upper bound from y_lo
    lo_iv = _exp_neg_small_bounds(y_hi)
    hi_iv = _exp_neg_small_bounds(y_lo)
    res = Iv(lo_iv.lo, hi_iv.hi)
    for _ in range(m):
        res = res * res
    return res


def iv_exp_neg(x_iv):
    assert x_iv.lo >= 0
    return Iv(exp_neg_point(x_iv.hi).lo, exp_neg_point(x_iv.lo).hi)


def _atan_inv(q, n=35):
    terms = [F((-1) ** j, (2 * j + 1) * q ** (2 * j + 1)) for j in range(n)]
    a = sum(terms, F(0))
    nxt = F((-1) ** n, (2 * n + 1) * q ** (2 * n + 1))
    return Iv.from_frac(min(a, a + nxt)).hull(Iv.from_frac(max(a, a + nxt)))


PI = Iv.from_frac(16) * _atan_inv(5) - Iv.from_frac(4) * _atan_inv(239)
TWO_PI = PI * Iv(2 * S)
SQRT_PI = PI.sqrt()


def i0e_point(z_int):
    """Outward enclosure of y_0(z) = exp(-z) * I_0(z) at z = z_int / S >= 0.

    - For 0 <= z <= 45: nonnegative power series I_0(z) = sum_{m>=0} ((z/2)^2)^m / (m!)^2
      truncated at M = 100; since (22.5)^2 / 101^2 < 1/20, the tail is <= t_100 / 19 <= t_100.
    - For z > 45: exact substitution u = sin(theta/2) gives
        y_0(z) = (2/pi) * int_0^1 exp(-2 z u^2) * (1 - u^2)^(-1/2) du.
      Expanding (1 - u^2)^(-1/2) = 1 + u^2/2 + 3 u^4/8 + 5 u^6/16 + R_4(u^2) with R_4 >= 0
      and R_4(w) <= (4/3)*(35/128)*w^4 on w in [0, 1/4] (u in [0, 1/2]), while bounding
      u in [1/2, 1] by (2/pi)*exp(-z/2)*int_{1/2}^1 (1-u^2)^(-1/2) du = (2/3)*exp(-z/2)
      and the lower Gaussian moment tail on [1, infinity) by <= 3*exp(-2z), yields a
      purely algebraic two-sided enclosure.
    """
    if z_int <= 0:
        return Iv(S, S)
    if z_int <= 45 * S:
        hz_lo = z_int // 2
        hz_hi = -((-z_int) // 2)
        w_lo = (hz_lo * hz_lo) // S
        w_hi = -((-hz_hi * hz_hi) // S)
        acc_lo = S
        acc_hi = S
        t_lo = S
        t_hi = S
        for m in range(1, 101):
            m2 = m * m * S
            t_lo = (t_lo * w_lo) // m2
            t_hi = -((-t_hi * w_hi) // m2)
            acc_lo += t_lo
            acc_hi += t_hi
        acc_hi += t_hi
        return exp_neg_point(z_int) * Iv(acc_lo, acc_hi)

    z_iv = Iv(z_int, z_int)
    inv_z = Iv(S) / z_iv
    inv_z2 = inv_z * inv_z
    inv_z3 = inv_z2 * inv_z
    inv_z4 = inv_z2 * inv_z2
    pref = Iv(S) / (TWO_PI * z_iv).sqrt()
    poly_lo = (
        Iv(S)
        + inv_z / Iv(8 * S)
        + (Iv(9 * S) * inv_z2) / Iv(128 * S)
        + (Iv(75 * S) * inv_z3) / Iv(1024 * S)
    )
    poly_hi = poly_lo + (Iv(3675 * S) * inv_z4) / Iv(24576 * S)
    tail_lo = Iv(3 * S) * exp_neg_point(2 * z_int)
    tail_hi = (Iv(2 * S) * exp_neg_point(z_int // 2)) / Iv(3 * S)
    return Iv(max(0, (pref * poly_lo).lo - tail_lo.hi), (pref * poly_hi).hi + tail_hi.hi)


def i0e_iv(z_iv):
    """Monotone decreasing enclosure of y_0(z) = exp(-z) I_0(z) on z_iv >= 0."""
    assert z_iv.lo >= 0
    return Iv(i0e_point(z_iv.hi).lo, i0e_point(z_iv.lo).hi)


class Jet2:
    """Degree-2 Taylor jet (v0, v1, v2) = (f, f', f''/2) over Iv."""

    __slots__ = ("v0", "v1", "v2")

    def __init__(self, v0, v1, v2):
        self.v0, self.v1, self.v2 = v0, v1, v2

    def __add__(self, o):
        return Jet2(self.v0 + o.v0, self.v1 + o.v1, self.v2 + o.v2)

    def __sub__(self, o):
        return Jet2(self.v0 - o.v0, self.v1 - o.v1, self.v2 - o.v2)

    def __mul__(self, o):
        return Jet2(
            self.v0 * o.v0,
            self.v0 * o.v1 + self.v1 * o.v0,
            self.v0 * o.v2 + self.v1 * o.v1 + self.v2 * o.v0,
        )

    def __truediv__(self, o):
        r0 = Iv(S) / o.v0
        r0_2 = r0 * r0
        r1 = -(o.v1 * r0_2)
        r2 = (o.v1 * o.v1 * r0 - o.v2) * r0_2
        return self * Jet2(r0, r1, r2)


SEGS_DERIV_ONLY = [(F(0), F(1), 800), (F(1), F(4), 600), (F(4), F(12), 500), (F(12), F(28), 300)]
SEGS_FINE = [(F(0), F(1), 1400), (F(1), F(4), 1300), (F(4), F(12), 1100), (F(12), F(28), 600)]
SEGS_MED = SEGS_FINE


def calc_rice(e_f, ell_f, beta_f, v_f, segs, deriv_only=False):
    """Rigorous midpoint-Taylor enclosure of (J(v), J'(v)) or J'(v) alone."""
    e_f, ell_f, beta_f, v_f = F(e_f), F(ell_f), F(beta_f), F(v_f)
    assert e_f > 0 and v_f > 0 and ell_f - 2 * beta_f > 0 and beta_f >= 0
    a = Iv.from_frac(ell_f - 2 * beta_f)
    b = Iv.from_frac(beta_f)
    v = Iv.from_frac(v_f)
    p_iv = Iv.from_frac(1 / e_f)

    one = Iv(S)
    two = Iv(2 * S)
    three = Iv(3 * S)
    half = Iv(S // 2)
    zero = Iv(0)
    cA = Jet2(a, zero, zero)
    cB = Jet2(b, zero, zero)
    c1 = Jet2(one, zero, zero)
    c2 = Jet2(two, zero, zero)
    c3 = Jet2(three, zero, zero)
    cV = Jet2(v, zero, zero)
    cHalf = Jet2(half, zero, zero)

    t_end = int(segs[-1][1])
    assert segs[0][0] == 0 and all(segs[i][1] == segs[i + 1][0] for i in range(len(segs) - 1))

    J_int = Iv(0)
    dJ_int = Iv(0)
    for s_lo, s_hi, n_c in segs:
        h_q = (s_hi - s_lo) / (2 * n_c)
        two_h = Iv.from_frac(2 * h_q)
        rem_w = Iv.from_frac(F(2, 3) * h_q**3)
        for k in range(n_c):
            t_lo = Iv.from_frac(s_lo + (2 * k) * h_q)
            t_hi = Iv.from_frac(s_lo + (2 * k + 2) * h_q)
            t_mid = Iv.from_frac(s_lo + (2 * k + 1) * h_q)

            et_m = iv_exp_neg(t_mid)
            aa_m = a + b * t_mid
            x_m = (t_mid * aa_m * aa_m) / v
            f_m = i0e_iv(x_m * half)
            gdJ_mid = et_m * f_m

            t_iv = Iv(t_lo.lo, t_hi.hi)
            T_j = Jet2(t_iv, one, zero)
            et_iv = iv_exp_neg(t_iv)
            E_j = Jet2(et_iv, -et_iv, et_iv * half)
            aa_j = cA + cB * T_j
            X_j = (T_j * aa_j * aa_j) / cV
            Z_j = X_j * cHalf

            y0_iv = i0e_iv(Z_j.v0)
            # Elementary integral bounds on y_0(z) = (1/pi) int_0^pi exp(-z(1-cos th)) dth:
            # 0 <= -y_0'(z) <= min(2 y_0(z), z^(-3/2)) and 0 <= y_0''(z)/2 <= min(2 y_0(z), (3/2) z^(-5/2)) for z >= 1.
            d1_cap = 2 * y0_iv.hi
            d2_cap = 2 * y0_iv.hi
            if Z_j.v0.lo >= S:
                z_lo_iv = Iv(Z_j.v0.lo, Z_j.v0.lo)
                inv_z = one / z_lo_iv
                inv_sz = inv_z.sqrt()
                c_32 = (inv_z * inv_sz).hi
                c_52 = ((three * inv_z * inv_z * inv_sz) / two).hi
                if c_32 < d1_cap:
                    d1_cap = c_32
                if c_52 < d2_cap:
                    d2_cap = c_52
            yp = Iv(-d1_cap, 0)
            ypp_half = Iv(0, d2_cap)
            F_j = Jet2(y0_iv, yp * Z_j.v1, yp * Z_j.v2 + ypp_half * (Z_j.v1 * Z_j.v1))

            GDJ_j = E_j * F_j
            dJ_int = dJ_int + two_h * gdJ_mid + rem_w * GDJ_j.v2

            if not deriv_only:
                bb_m = a + three * b * t_mid
                h_m = (two * t_mid * aa_m) / bb_m
                dh_m = (two * (a * a + two * a * b * t_mid + three * b * b * t_mid * t_mid)) / (bb_m * bb_m)
                P_m = one + two * x_m + h_m - dh_m
                gJ_mid = et_m * P_m * f_m

                bb_j = cA + c3 * cB * T_j
                H_j = (c2 * T_j * aa_j) / bb_j
                DH_j = (c2 * (cA * cA + c2 * cA * cB * T_j + c3 * cB * cB * T_j * T_j)) / (bb_j * bb_j)
                P_j = c1 + c2 * X_j + H_j - DH_j
                GJ_j = E_j * P_j * F_j
                J_int = J_int + two_h * gJ_mid + rem_w * GJ_j.v2

    etT = exp_neg_point(t_end * S)
    dJ_val = (dJ_int * SQRT_PI) / (two * v.sqrt()) - p_iv
    tail_dJ = (SQRT_PI / (two * v.sqrt())) * etT
    dJ_val = Iv(dJ_val.lo, dJ_val.hi + tail_dJ.hi)
    if deriv_only:
        return None, dJ_val

    assert t_end >= 1
    T_iv = Iv(t_end * S)
    aaT = a + b * T_iv
    bbT = a + three * b * T_iv
    xT = (T_iv * aaT * aaT) / v
    hT = (two * T_iv * aaT) / bbT
    fT = i0e_iv(xT * half)
    sqrt_piv = (PI * v).sqrt()
    J_val = J_int * sqrt_piv - p_iv * v + sqrt_piv * etT * hT * fT
    # Original Rice integral on [t_end, infinity): 2 E|r(t) + sqrt(v) W| <= 2 t a + 2 t^2 b + sqrt(pi v) for t >= 1
    tail_J = etT * (
        Iv((2 * (t_end + 1)) * S) * a
        + Iv((2 * (t_end * t_end + 2 * t_end + 2)) * S) * b
        + sqrt_piv
    )
    J_val = Iv(J_val.lo, J_val.hi + tail_J.hi)
    return J_val, dJ_val


def run_closed_form_selftest():
    """At beta = 0, L = ell * Z is complex Gaussian, so 2 E|ell Z + sqrt(v) W| = sqrt(pi*(ell^2 + v))."""
    for ell_f, v_f in ((F(3, 5), F(1, 20)), (F(17, 20), F(1, 25))):
        e_f = F(3, 4)
        J_iv, dJ_iv = calc_rice(e_f, ell_f, F(0), v_f, SEGS_MED, deriv_only=False)
        s_iv = Iv.from_frac(ell_f * ell_f + v_f)
        J_exact = (PI * s_iv).sqrt() - Iv.from_frac(v_f / e_f)
        dJ_exact = SQRT_PI / (Iv(2 * S) * s_iv.sqrt()) - Iv.from_frac(1 / e_f)
        # Closed-form interval and quadrature interval must overlap with small width:
        assert max(J_iv.lo, J_exact.lo) <= min(J_iv.hi, J_exact.hi)
        assert max(dJ_iv.lo, dJ_exact.lo) <= min(dJ_iv.hi, dJ_exact.hi)
        assert (J_iv.hi - J_iv.lo) < 2 * 10**40  # < 2e-5


def certify_row(e_f, row, segs_mid):
    lo, hi, ell, beta, vl, vr, shi, eta_req = map(F, row)
    assert 0 <= lo < hi and ell - 2 * beta > 0 and beta > 0 and 0 < vl < vr
    vm = (vl + vr) / 2
    _, dl = calc_rice(e_f, ell, beta, vl, SEGS_DERIV_ONLY, deriv_only=True)
    _, dr = calc_rice(e_f, ell, beta, vr, SEGS_DERIV_ONLY, deriv_only=True)
    assert dl.lo > 0 and dr.hi < 0, f"Derivative sign bracket failed on [{lo}, {hi}]: dl.lo={dl.lo}, dr.hi={dr.hi}"

    jm, dm = calc_rice(e_f, ell, beta, vm, segs_mid, deriv_only=False)
    width_iv = Iv.from_frac(vr - vl)
    dm_abs = Iv(0, dm.abs_hi())
    upper_iv = jm + dm_abs * width_iv
    shi_iv = Iv.from_frac(shi)
    assert upper_iv.hi < shi_iv.lo, f"S_upper check failed on [{lo}, {hi}]: {upper_iv.hi / S:.10f} vs {float(shi):.10f}"

    env = max(t * t - 2 * ell * t + 2 * beta * beta / e_f for t in (lo, hi))
    eta_max = TARGET - env - shi
    assert eta_req < eta_max, f"Allowance check failed on [{lo}, {hi}]: {float(eta_max):.8f} <= {float(eta_req):.8f}"

    # Outward response-energy caps across [lo, hi] (decreasing in t on [0, A_212B]):
    assert hi <= A_212B
    u_cap_exact = 4 * e_f * e_f * B_212B * (A_212B - lo)
    e_iv = Iv.from_frac(e_f)
    lo_iv = Iv.from_frac(lo)
    tot_iv = e_iv * e_iv * (
        (Iv(3 * S) * (PI / Iv(4 * S) - lo_iv * lo_iv)) / Iv(2 * S)
        + Iv.from_frac(B_212B * (A_212B - lo))
    )
    # Outward 10^-9 rational cap on total cubic energy:
    tot_cap_rat = F(-((-tot_iv.hi) // 10**36), 10**9)
    assert Iv.from_frac(tot_cap_rat).lo >= tot_iv.hi

    return {
        "epsilon": str(e_f),
        "lo": str(lo),
        "hi": str(hi),
        "ell": str(ell),
        "beta": str(beta),
        "v_lower": str(vl),
        "v_upper": str(vr),
        "J_vm_lower_1e12": round(jm.lo / 10**33) / 10**12,
        "S_upper_interval_1e12": round((upper_iv.hi + 10**33 - 1) // 10**33) / 10**12,
        "S_upper_accepted": str(shi),
        "eta_max_exact": str(eta_max),
        "eta_max_decimal": round(float(eta_max), 10),
        "eta_requested": str(eta_req),
        "cap_reserve_exact": str(eta_max - eta_req),
        "remote_u_cap_exact": str(u_cap_exact),
        "total_G_cap_upper": str(tot_cap_rat),
    }


ROWS_3_4 = [
    ("159/200", "81/100", "1542969/2000000", "1232759/10000000", "719494/10000000", "719695/10000000", "1264705500/1000000000", "3/40000"),
    ("81/100", "823/1000", "7954809/10000000", "1300237/10000000", "600914/10000000", "601115/10000000", "1299336000/1000000000", "3/40000"),
    ("823/1000", "417/500", "8165663/10000000", "271813/2000000", "499220/10000000", "499421/10000000", "1330104000/1000000000", "3/40000"),
    ("417/500", "421/500", "8323827/10000000", "350717/2500000", "424483/10000000", "424684/10000000", "1353387000/1000000000", "3/40000"),
    ("421/500", "847/1000", "8424857/10000000", "143069/1000000", "377443/10000000", "377644/10000000", "1368348500/1000000000", "3/40000"),
    ("847/1000", "1703/2000", "3397/4000", "289849/2000000", "346257/10000000", "346458/10000000", "1378402000/1000000000", "3/40000"),
    ("1703/2000", "107/125", "683/800", "292311/2000000", "325647/10000000", "325848/10000000", "1385111200/1000000000", "3/40000"),
    ("107/125", "43/50", "538199/625000", "1481653/10000000", "292141/10000000", "292342/10000000", "1396123000/1000000000", "3/40000"),
    ("43/50", "108/125", "4347969/5000000", "60187/400000", "253971/10000000", "254172/10000000", "1408833500/1000000000", "3/40000"),
]

ROWS_94_125 = [
    ("1503/2000", "77/100", "7051063/10000000", "1041357/10000000", "1079038/10000000", "1079239/10000000", "1171687500/1000000000", "1/10000"),
    ("77/100", "157/200", "3649209/5000000", "69501/625000", "947626/10000000", "947827/10000000", "1206107000/1000000000", "1/10000"),
    ("157/200", "4/5", "1889181/2500000", "296371/2500000", "813840/10000000", "814041/10000000", "1242562200/1000000000", "1/10000"),
    ("4/5", "203/250", "777181/1000000", "1246313/10000000", "705110/10000000", "705312/10000000", "1273301500/1000000000", "1/10000"),
    ("203/250", "411/500", "3978583/5000000", "649211/5000000", "613358/10000000", "613559/10000000", "1300063000/1000000000", "1/10000"),
    ("411/500", "831/1000", "2032259/2500000", "673221/5000000", "529893/10000000", "530094/10000000", "1325096000/1000000000", "1/10000"),
    ("831/1000", "21/25", "8305981/10000000", "1395547/10000000", "445596/10000000", "445797/10000000", "1351083200/1000000000", "1/10000"),
    ("21/25", "847/1000", "4209371/5000000", "1428641/10000000", "395104/10000000", "395305/10000000", "1367604800/1000000000", "1/10000"),
    ("847/1000", "1701/2000", "679/800", "1445533/10000000", "360857/10000000", "361058/10000000", "1377964600/1000000000", "1/10000"),
    ("1701/2000", "427/500", "3409/4000", "1455123/10000000", "344723/10000000", "344924/10000000", "1383173600/1000000000", "1/10000"),
    ("427/500", "1715/2000", "1718423/2000000", "1474149/10000000", "312830/10000000", "313031/10000000", "1393558400/1000000000", "1/10000"),
    ("1715/2000", "1721/2000", "866587/1000000", "1494233/10000000", "279330/10000000", "279531/10000000", "1404596100/1000000000", "1/10000"),
    ("1721/2000", "863/1000", "4364919/5000000", "151159/1000000", "250520/10000000", "250721/10000000", "1414198300/1000000000", "1/10000"),
]


def certify_bank(e_f, rows, expected_lo, expected_hi, segs_mid):
    cur = F(expected_lo)
    out = []
    for r in rows:
        assert F(r[0]) == cur, f"Gap in central cover at {cur} vs {r[0]}"
        out.append(certify_row(e_f, r, segs_mid))
        cur = F(r[1])
    assert cur == F(expected_hi), f"End of central cover {cur} != {expected_hi}"
    return out


def verify_row8_peak_rectangles(res8):
    """Exact verification that Row 8 ([21/25, 847/1000] at eps = 94/125) lies inside STATUS 3.15 and 11.53."""
    e_f = F(94, 125)
    lam = e_f / F(1891, 2500)
    assert lam == F(1880, 1891)
    ell8 = F(res8["ell"])
    beta8 = F(res8["beta"])
    a8 = ell8 - 2 * beta8
    # STATUS 3.15 (remote rectangle) & STATUS 11.53 (retained A-core rectangle):
    assert F(74, 100) <= e_f <= F(76, 100)
    assert a8 / lam - F(699, 1250) == F(188043, 940000000)
    assert beta8 / lam - F(179, 1250) == F(9400131, 18800000000)
    assert 0 <= a8 / lam - F(699, 1250) <= F(1, 2500) <= F(1, 2000)
    assert 0 <= beta8 / lam - F(179, 1250) <= F(1, 800) <= F(1, 625)
    # Scaled response energies on Row 8:
    u_cap8 = F(res8["remote_u_cap_exact"])
    tot_cap8 = F(res8["total_G_cap_upper"])
    assert u_cap8 / (lam * lam) < F(463, 10000)
    assert tot_cap8 / (lam * lam) < F(80051, 10**6)
    # Exact error budgets of 3.15 and 11.53 are strictly below Row 8's certified allowance:
    eta8 = F(res8["eta_max_exact"])
    err_315 = F(2348075715791501, 23637500000000000000)
    err_1153 = F(869040549842757089931, 8877866800000000000000000)
    assert err_315 < F(1, 10000) < eta8
    assert err_1153 < F(1, 10000) < eta8


def run_rejection_controls():
    row = list(ROWS_94_125[8])
    # Control 1: shift v-bracket above v* so both derivatives are negative
    bad1 = list(row)
    bad1[4], bad1[5] = "370000/10000000", "371000/10000000"
    try:
        certify_row(F(94, 125), bad1, SEGS_MED)
        raise AssertionError("Control 1 failed to reject unbracketed v")
    except AssertionError as exc:
        assert "failed to reject" not in str(exc)

    # Control 2: deflate S_upper below J(v_m)
    bad2 = list(row)
    bad2[6] = "1377960000/1000000000"
    try:
        certify_row(F(94, 125), bad2, SEGS_MED)
        raise AssertionError("Control 2 failed to reject deflated S_upper")
    except AssertionError as exc:
        assert "failed to reject" not in str(exc)

    # Control 3: request eta larger than eta_max
    bad3 = list(row)
    bad3[7] = "11/100000"
    try:
        certify_row(F(94, 125), bad3, SEGS_MED)
        raise AssertionError("Control 3 failed to reject excessive eta_requested")
    except AssertionError as exc:
        assert "failed to reject" not in str(exc)


def main():
    t0 = time.time()
    run_closed_form_selftest()
    print("PASS closed-form beta=0 Rice self-tests")

    out_34 = certify_bank(F(3, 4), ROWS_3_4, F(159, 200), F(108, 125), SEGS_MED)
    min_eta_34 = min(F(r["eta_max_exact"]) for r in out_34)
    min_res_34 = min(F(r["cap_reserve_exact"]) for r in out_34)
    assert min_eta_34 > F(3, 40000)
    print(
        f"PASS eps=3/4 central bank (9 rows on [0.795, 0.864]): min eta_max = {float(min_eta_34):.8f} "
        f"(> 7.5e-5), min reserve after 7.5e-5 = {float(min_res_34):.9f}"
    )

    out_94 = certify_bank(F(94, 125), ROWS_94_125, F(1503, 2000), F(863, 1000), SEGS_FINE)
    min_eta_94 = min(F(r["eta_max_exact"]) for r in out_94)
    min_res_94 = min(F(r["cap_reserve_exact"]) for r in out_94)
    assert min_eta_94 > F(1, 10000)
    verify_row8_peak_rectangles(out_94[7])
    print(
        f"PASS eps=94/125 central bank (13 rows on [0.7515, 0.863]): min eta_max = {float(min_eta_94):.8f} "
        f"(> 1e-4), min reserve after 1e-4 = {float(min_res_94):.9f}"
    )
    print("PASS Row 8 ([0.840, 0.847]) inside STATUS 3.15 remote and 11.53 retained A-core rectangles")

    run_rejection_controls()
    out_path = Path(__file__).resolve().parent / "central_94_125_certificate.json"
    doc = {
        "target_cap": "500/701",
        "eps_3_4": {
            "exterior_cap": "7132652/10000000",
            "central_interval": ["159/200", "108/125"],
            "requested_all_sector_error": "3/40000",
            "min_eta_max_exact": str(min_eta_34),
            "min_reserve_exact": str(min_res_34),
            "rows": out_34,
        },
        "eps_94_125": {
            "exterior_cap": "7132660/10000000",
            "central_interval": ["1503/2000", "863/1000"],
            "requested_all_sector_error": "1/10000",
            "min_eta_max_exact": str(min_eta_94),
            "min_reserve_exact": str(min_res_94),
            "row8_in_3_15_and_11_53": True,
            "rows": out_94,
        },
    }
    out_path.write_text(json.dumps(doc, indent=2) + "\n")
    print(f"PASS 3 rejection controls; wrote {out_path.name} in {time.time() - t0:.2f}s (ALL-SECTOR PREMISES OPEN)")


if __name__ == "__main__":
    main()
