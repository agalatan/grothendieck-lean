#!/usr/bin/env python3
"""Generate compact exact rational certificates (`homothety_consumers_cert.json`, < 250 KB)
for Issue #760 (STATUS tag KHOM).

Agent-ID: gemini-c1de
Refs: #760, #436, #177
"""
from fractions import Fraction as Q
import json
from math import comb, factorial, isqrt
import os

HERE = os.path.dirname(os.path.abspath(__file__))

EPS0 = Q(1891, 2500)
P0 = Q(2500, 1891)
ELL0 = Q(1057, 1250)
BETA0 = Q(179, 1250)
A0_PROF = ELL0 - 2 * BETA0  # 699/1250
RHO0 = Q(5053, 10000)
D_RHO = 1 + RHO0 * RHO0  # 125532809/100000000
E0 = Q(463, 10000)
U_TOT0 = Q(80051, 1000000)
U_NO_1161 = Q(3, 2000)  # [0, 3/2000] = [0, 0.0015] contains 11.61's [1/1000, 3/2000] box; 11.61 never invoked below 3/2000!
GAMMA_A = Q(7, 25)
ETA_A = Q(6, 1000000)

A_212B = Q(886762780, 10**9)
B_212B = Q(432306903, 10**9)
PI_HI = Q(31415926535897932385, 10**19)
SQRT_PI_HI = Q(1772453850905517, 10**15)
R_HI = SQRT_PI_HI / Q(2)  # strict upper bound on sqrt(pi)/2

U0_REM = Q(1373953883, 10**9)
S0_LO = Q(13739535256614, 10**13)
S0_HI = Q(13739535256616, 10**13)

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


# ============================================================================
# 1. Self-contained 220-bit rational enclosures of M_D[0..7] & B_hi(u)
# ============================================================================
BITS = 220
SCALE = 1 << BITS


class RatIval:
    __slots__ = ("lo", "hi")

    def __init__(self, lo, hi=None):
        lq = Q(lo)
        hq = Q(lq if hi is None else hi)
        if lq > hq:
            raise ValueError(f"Inverted RatIval: {lq} > {hq}")
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
        if x.lo <= 0 <= x.hi:
            raise ValueError("Division by zero interval")
        return self * RatIval(Q(1) / x.hi, Q(1) / x.lo)

    def __rtruediv__(self, x):
        return self.lift(x) / self

    def sqrt(self):
        if self.lo < 0:
            raise ValueError("Negative sqrt")
        low = isqrt((self.lo.numerator * SCALE * SCALE) // self.lo.denominator)
        high_n = (self.hi.numerator * SCALE * SCALE + self.hi.denominator - 1) // self.hi.denominator
        high = isqrt(high_n)
        if high * high < high_n:
            high += 1
        return RatIval(Q(low, SCALE), Q(high, SCALE))


def build_b_hi_poly():
    def atan_rec(n, terms=160):
        q = Q(1, n)
        tot = sum(Q((-1) ** k, 2 * k + 1) * (q ** (2 * k + 1)) for k in range(terms))
        nxt = (q ** (2 * terms + 1)) / Q(2 * terms + 1)
        return RatIval(tot - nxt, tot + nxt)

    pi_iv = 16 * atan_rec(5) - 4 * atan_rec(239)
    sp_iv = pi_iv.sqrt()

    def exp_pos(r, terms=180):
        r = Q(r)
        tot = sum((r ** k) / Q(factorial(k)) for k in range(terms))
        first = (r ** terms) / Q(factorial(terms))
        return RatIval(tot, tot + first / (1 - r / Q(terms + 1)))

    def single_pole(a, b, n=24):
        r = a / b
        terms = 180
        tot = sum(((-r) ** k) / Q(factorial(k) * (2 * k + 1)) for k in range(terms))
        nxt = (r ** terms) / Q(factorial(terms) * (2 * terms + 1))
        erf_s = RatIval(tot - nxt, tot + nxt)
        j0 = exp_pos(r) * (pi_iv / (b * RatIval(r).sqrt()) - 2 * sp_iv * erf_s / b)
        out = [sp_iv / 2, j0 / 2]
        for k in range(1, n):
            out.append(((2 * k - 1 - 2 * a / b) * out[k] + 2 * out[k - 1] / b) / (2 * k * a))
        return out

    def mixed_int(p, q, a, ia, ib):
        if q == 0:
            return ia[p]
        if p == 0:
            return ib[q]
        ca = {
            i: Q((-1) ** q) * Q(comb(q + p - i - 1, p - i)) * (3 ** (p - i)) / ((2 * a) ** (q + p - i))
            for i in range(1, p + 1)
        }
        cb = {
            j: Q((3 ** p) * ((-1) ** (q - j))) * Q(comb(p + q - j - 1, q - j)) / ((2 * a) ** (p + q - j))
            for j in range(1, q + 1)
        }
        return sum((c * ia[i] for i, c in ca.items()), RatIval(0)) + sum(
            (c * ib[j] for j, c in cb.items()), RatIval(0)
        )

    ia = single_pole(A0_PROF, BETA0, n=24)
    ib = single_pole(A0_PROF, 3 * BETA0, n=24)
    td = {(1, 1): Q(1)}
    v_derivs = [Q(387, 500) * sp_iv]
    for m in range(7):
        w_int = RatIval(0)
        for (p, q), c in td.items():
            part = (3 * ia[p - 1] - 2 * A0_PROF * ia[p]) if q == 0 else mixed_int(p, q - 1, A0_PROF, ia, ib)
            w_int = w_int + c * part
        ang = Q(comb(2 * m, m), 4 ** m)
        v_derivs.append(Q((-1) ** m, m + 1) * ang * w_int)
        nxt_td = {}
        for (p, q), v in td.items():
            for key, cf in [((p + 1, q + 1), v), ((p + 2, q + 1), v * p * BETA0), ((p + 1, q + 2), v * 3 * q * BETA0)]:
                nxt_td[key] = nxt_td.get(key, Q(0)) + cf
        td = nxt_td

    binom_half = [Q(1)]
    for k in range(1, 8):
        binom_half.append(binom_half[-1] * (Q(1, 2) - (k - 1)) / k)
    md = [v_derivs[k] / binom_half[k] for k in range(8)]

    ratios = [Q(17, 16), Q(5, 4), Q(13, 8)]
    nodes = [r * r - 1 for r in ratios]
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
                tab[i][j] = Q(1) / (2 * rts[i])
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

    b_hi = [(u7[k] * md[k]).hi if u7[k] >= 0 else (u7[k] * md[k]).lo for k in range(8)]
    return b_hi


B_HI_POLY = build_b_hi_poly()
G_HI_POLY = [B_HI_POLY[0], B_HI_POLY[1] - P0] + B_HI_POLY[2:]


def bernstein_1d(c, lo, hi):
    n = len(c) - 1
    d = hi - lo
    aff = [sum(c[i] * comb(i, j) * (lo ** (i - j)) * (d ** j) for i in range(j, n + 1)) for j in range(n + 1)]
    return [sum(aff[j] * Q(comb(i, j), comb(n, j)) for j in range(i + 1)) for i in range(n + 1)]


def ceil_1e10(q):
    q = Q(q)
    return (q.numerator * 10**10 + q.denominator - 1) // q.denominator


def rat_sqrt_hi_int(q, scale=10**8):
    if q <= 0:
        return 0
    n = (q.numerator * scale * scale + q.denominator - 1) // q.denominator
    r = isqrt(n)
    if r * r < n:
        r += 1
    return r


def rat_sqrt_hi(q, scale=10**10):
    return Q(rat_sqrt_hi_int(q, scale), scale)


def rat_sqrt_lo(q, scale=10**10):
    if q <= 0:
        return Q(0)
    n = (q.numerator * scale * scale) // q.denominator
    return Q(isqrt(n), scale)


C_NEG_HI = rat_sqrt_hi(ETA_A, 10**10)
C_NEG_LO = rat_sqrt_lo(ETA_A, 10**10)


def best_gamma(u_lo):
    best = Q(2, 25)
    for e_i, g_i in GAMMA_TABLE:
        if u_lo >= e_i and g_i < best:
            best = g_i
    return best


def sigma_lo_iv(u_lo, u_hi):
    lo = max(Q(0), S0_LO - max(bernstein_1d(G_HI_POLY, u_lo, u_hi)))
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


def rho_rem_hi(u_lo, u_hi, use_33a=False):
    if use_33a:
        return -sigma_lo_iv(u_lo, u_hi)
    # Track A (pure P + C): 2.7 Jensen + 7.2.11 + 3.3:
    jensen = max(
        B_HI_POLY[0] + (B_HI_POLY[1] - P0) * u_lo,
        B_HI_POLY[0] + (B_HI_POLY[1] - P0) * u_hi,
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


def max_quad_on_iv(A_c2, B_c1, C_c0, lo, hi):
    vals = [A_c2 * lo * lo + B_c1 * lo + C_c0, A_c2 * hi * hi + B_c1 * hi + C_c0]
    if A_c2 < 0:
        c_star = -B_c1 / (2 * A_c2)
        if lo < c_star < hi:
            vals.append(A_c2 * c_star * c_star + B_c1 * c_star + C_c0)
    return max(vals)


def opt_lam(a0, b0, A0, B0, dV_lo, dV_hi, c_lo, c_hi, q_coeff):
    lo_lam = max(-float(A0), -float(B0)) + 1e-8
    a0f, b0f, A0f, B0f = float(a0), float(b0), float(A0), float(B0)
    dv_l, dv_h = float(dV_lo), float(dV_hi)
    clo, chi, qf = float(c_lo), float(c_hi), float(q_coeff)

    def eval_l(lf):
        Af, Bf = A0f + lf, B0f + lf
        if Af <= 1e-9 or Bf <= 1e-9:
            return 1e99
        dv = dv_h if lf >= 0 else dv_l
        c2, c1, c0 = 1.0 / Af - qf, 2.0 * a0f / Af, a0f * a0f / Af + b0f * b0f / Bf + lf * dv
        vs = [c2 * clo * clo + c1 * clo + c0, c2 * chi * chi + c1 * chi + c0]
        if c2 < -1e-15:
            cs = -c1 / (2.0 * c2)
            if clo < cs < chi:
                vs.append(c2 * cs * cs + c1 * cs + c0)
        return max(vs)

    best_v, best_l = 1e99, max(0.0, lo_lam + 1e-5)
    cands = [0.0] + [lo_lam + (1.25 ** k) * 1e-6 for k in range(-25, 100, 3)]
    if lo_lam < 0:
        cands += [lo_lam * (t / 100.0) for t in range(8, 98, 9)] + [-1e-6 * (1.6 ** k) for k in range(24)]
    for lf in cands:
        if lf > lo_lam:
            v = eval_l(lf)
            if v < best_v:
                best_v, best_l = v, lf
    span = max(1e-4, abs(best_l) * 0.5, (best_l - lo_lam) * 0.45)
    left, right = max(lo_lam + 1e-9, best_l - span), best_l + span
    for _ in range(30):
        m1 = left + (right - left) * 0.38196601125
        m2 = left + (right - left) * 0.61803398875
        if eval_l(m1) < eval_l(m2):
            right = m2
        else:
            left = m1
    best_l = 0.5 * (left + right)
    l_int = round(best_l * 10**4)
    q_lam = Q(l_int, 10**4)
    if A0 + q_lam <= 0 or B0 + q_lam <= 0:
        l_int = int((max(-A0, -B0) + Q(1, 10**4)) * 10**4) + 1
        q_lam = Q(l_int, 10**4)
    return q_lam, l_int


def _round_interior_1e6(vals, hi_cap):
    out = []
    for x in vals:
        if x <= 0 or x >= hi_cap:
            continue
        rx = Q(int(x * 10**6), 10**6)
        if 0 < rx < hi_cap:
            out.append(rx)
    return out


def build_homothety_cover(
    u_max, u_tot, mu=Q(1), dp=Q(0), use_signed_1161=True, use_33a=False,
    ell_base=None, tier=1
):
    """Build exact 2D (u_0, V_0) cover with free homothety mu and price shift dp = mu/eps - p_0.
    Tiers: 0 = lean, 1 = medium, 2 = fine boundary, 3 = peak benchmark.
    Cell modes:
      mode = 2: Pure 11.30 content cap (kap = 0, NEVER invokes 11.61; mandatory on u_0 < 3/2000!)
      mode = 0: D_+ 11.61 mode (allowed on u_0 >= 3/2000)
      mode = 1: Signed D(q_0) mode (allowed on u_0 >= 2/125 in Track A, or u_0 >= 3/2000 in Track B via 3.3a D >= 0)
    """
    nu_grid, nv_grid = [(4, 2), (7, 4), (13, 6), (20, 11)][tier]
    special_u = [
        Q(0), U_NO_1161, Q(551, 100000), Q(1, 100), Q(2, 125), Q(2, 100),
        Q(25, 1000), Q(3, 100), Q(403448, 10**7), Q(403449, 10**7), u_max
    ]
    if tier >= 1:
        special_u += [Q(3, 1000), Q(398, 10000), Q(402, 10000), Q(405, 10000), Q(454, 10000)]
    if tier >= 2:
        special_u += [
            Q(8, 1000), Q(12, 1000), Q(14, 1000), Q(353, 10000), Q(354, 10000),
            Q(4047, 100000), Q(4049, 100000), Q(4051, 100000),
            Q(455, 10000), Q(456, 10000), Q(4625, 10000),
        ]
    u_prop = _round_interior_1e6([u_max * i / nu_grid for i in range(1, nu_grid)], u_max)
    if tier == 0:
        u_extra = [Q(400, 10000), Q(407, 10000)] + _round_interior_1e6([u_max * Q(15, 16)], u_max)
    elif tier == 1:
        u_extra = (
            [Q(400, 10000), Q(403, 10000), Q(404, 10000), Q(407, 10000)]
            + _round_interior_1e6([u_max * Q(16 - k * k, 16) for k in (1, 2, 3)], u_max)
        )
    else:
        u_extra = (
            [Q(398 + 2 * k, 10000) for k in range(9)]
            + [Q(2021 + k, 50000) for k in range(0, 18, 1 if tier == 3 else 2)]
            + [Q(450 + 2 * k, 10000) for k in range(7)]
            + _round_interior_1e6([u_max * Q(64 - k * k, 64) for k in range(1, 7)], u_max)
        )
    u_edges = sorted(set(u for u in (u_prop + special_u + u_extra) if 0 <= u <= u_max))

    if tier <= 1:
        v_tiny = [Q(0), Q(1, 10**6), Q(5, 10**5), Q(4, 10**4)]
    else:
        v_tiny = [
            Q(0), Q(1, 10**7), Q(1, 10**6), Q(5, 10**6), Q(2, 10**5),
            Q(5, 10**5), Q(1, 10**4), Q(25, 10**5), Q(6, 10**4),
        ]
    v_prop = _round_interior_1e6([u_tot * j / nv_grid for j in range(1, nv_grid)], u_tot)
    v_edges = sorted(set([v for v in (v_tiny + v_prop) if 0 <= v < u_tot] + [u_tot]))

    resp_ell34 = None if ell_base is None else Q(3, 2) * ell_base
    odd_rate = max(Q(0), Q(49, 625) * (mu - 1) - dp, -dp)
    if odd_rate > 0 and ell_base is None:
        raise ValueError("Positive odd_rate requires ell_base ellipsoid bound on W_0")

    alpha_base = Q(31, 100) - Q(9, 25) * (mu - 1) + dp / D_RHO
    beta_base = Q(2, 25) + dp / D_RHO

    strips = []
    worst_all = Q(-10)

    for iu in range(len(u_edges) - 1):
        ul, uh = u_edges[iu], u_edges[iu + 1]
        sig_lo = sigma_lo_iv(ul, uh)
        r_rem = rho_rem_hi(ul, uh, use_33a=use_33a)
        dp_u = -dp * (ul if dp >= 0 else uh)

        e_int = rat_sqrt_hi_int(Q(49, 4000000) * uh, 10**10)
        E_cell = Q(e_int, 10**10)
        a_cell = RHO0 * E_cell / D_RHO
        b_cell = E_cell / D_RHO
        g_best = best_gamma(ul)
        c_cap_sq = min(Q(1, 2500), Q(19321, 10**6) * uh, 42 * g_best * uh * uh)
        c_int = min(2_000_000, rat_sqrt_hi_int(c_cap_sq, 10**8))
        C_max = Q(c_int, 10**8)

        v_dom_hi = u_tot - ul
        if resp_ell34 is not None:
            v_dom_hi = min(v_dom_hi, resp_ell34 - Q(3, 4) * ul)

        v_cells = []
        worst_u = Q(-10)
        for iv in range(len(v_edges) - 1):
            vl, vh = v_edges[iv], v_edges[iv + 1]
            if vl > v_dom_hi:
                continue
            vh_eff = min(vh, v_dom_hi)
            s_uv_hi = min(uh + vh_eff, u_tot)
            if resp_ell34 is not None:
                s_uv_hi = min(s_uv_hi, resp_ell34 + Q(1, 4) * uh)
            k_val = 2 * (s_uv_hi - E0)
            A0 = alpha_base - k_val / D_RHO
            B0 = beta_base - k_val / D_RHO
            dV_lo, dV_hi = D_RHO * vl, D_RHO * vh_eff
            odd_add = Q(0) if odd_rate == 0 else odd_rate * max(Q(0), ell_base - Q(1, 2) * ul - Q(2, 3) * vl)

            if ul < U_NO_1161:
                # Mode 2: pure 11.30 content cap (kap = 0; 11.61 is NOT used at all!)
                lam, l_int = opt_lam(a_cell, b_cell, A0, B0, dV_lo, dV_hi, Q(0), C_max, Q(0))
                A, B = A0 + lam, B0 + lam
                dVs = dV_hi if lam >= 0 else dV_lo
                cell_val = odd_add + dp_u + r_rem + ((C_max + a_cell) ** 2) / A + (b_cell ** 2) / B + lam * dVs
                v_cells.append([2, l_int])
            elif (use_signed_1161 and ul >= Q(2, 125)) or use_33a:
                # Mode 1: signed D(q_0) mode (either ul >= 2/125 via signed 11.61, or ul >= 1/200 via 3.3a D >= 0)
                best_rec = None
                for k_ten in (10, 9, 8, 0):
                    kap = Q(k_ten, 10)
                    q_c = kap / GAMMA_A
                    lam, l_int = opt_lam(a_cell, b_cell, A0, B0, dV_lo, dV_hi, Q(0), C_max, q_c)
                    A, B = A0 + lam, B0 + lam
                    dVs = dV_hi if lam >= 0 else dV_lo
                    val = (
                        odd_add + dp_u + (1 - kap) * r_rem - kap * sig_lo + kap * ETA_A / GAMMA_A
                        + max_quad_on_iv(Q(1) / A - q_c, 2 * a_cell / A,
                                         a_cell * a_cell / A + b_cell * b_cell / B + lam * dVs,
                                         Q(0), C_max)
                    )
                    if best_rec is None or val < best_rec[0]:
                        best_rec = (val, k_ten, l_int)
                cell_val, k_win, l_win = best_rec
                v_cells.append([1, k_win, l_win])
            else:
                # Mode 0: D_+ 11.61 on u_0 >= 1/200
                r_pos = min(r_rem, -sig_lo)
                c_mid_hi = min(C_max, C_NEG_HI)
                lam0, l0_int = opt_lam(a_cell, b_cell, A0, B0, dV_lo, dV_hi, Q(0), c_mid_hi, Q(0))
                A, B = A0 + lam0, B0 + lam0
                dVs = dV_hi if lam0 >= 0 else dV_lo
                quad0 = ((c_mid_hi + a_cell) ** 2) / A + (b_cell ** 2) / B + lam0 * dVs
                v_pos_low = odd_add + dp_u + r_pos + quad0
                v_neg = odd_add + dp_u + r_rem + quad0

                if C_max > C_NEG_LO:
                    best_ph = None
                    for k_ten in (10, 9):
                        kap = Q(k_ten, 10)
                        q_c = kap / GAMMA_A
                        lam1, l1_int = opt_lam(a_cell, b_cell, A0, B0, dV_lo, dV_hi, C_NEG_LO, C_max, q_c)
                        A1, B1 = A0 + lam1, B0 + lam1
                        dVs1 = dV_hi if lam1 >= 0 else dV_lo
                        vh_val = (
                            odd_add + dp_u + (1 - kap) * r_pos - kap * sig_lo + kap * ETA_A / GAMMA_A
                            + max_quad_on_iv(Q(1) / A1 - q_c, 2 * a_cell / A1,
                                             a_cell * a_cell / A1 + b_cell * b_cell / B1 + lam1 * dVs1,
                                             C_NEG_LO, C_max)
                        )
                        if best_ph is None or vh_val < best_ph[0]:
                            best_ph = (vh_val, k_ten, l1_int)
                    cell_val = max(v_pos_low, best_ph[0], v_neg)
                    v_cells.append([0, l0_int, best_ph[1], best_ph[2]])
                else:
                    cell_val = max(v_pos_low, v_neg)
                    v_cells.append([0, l0_int])

            if cell_val > worst_u:
                worst_u = cell_val
            if cell_val > worst_all:
                worst_all = cell_val

        ub_int = ceil_1e10(worst_u)
        if Q(ub_int, 10**10) > worst_all:
            worst_all = Q(ub_int, 10**10)
        strips.append({"e": e_int, "c": c_int, "ub": ub_int, "cells": v_cells})

    w_int = ceil_1e10(worst_all)
    return {
        "u_max": str(u_max),
        "u_tot": str(u_tot),
        "mu": str(mu),
        "dp": str(dp),
        "use_signed_1161": bool(use_signed_1161),
        "use_33a": bool(use_33a),
        "ell_base": None if ell_base is None else str(ell_base),
        "u_edges": [str(u) for u in u_edges[:-1]] + ["MAX"],
        "v_edges": [str(v) for v in v_edges[:-1]] + ["MAX"],
        "worst_ub_1e10": w_int,
        "strips": strips,
    }


def eval_slab_with_mu(eps, ta, tb, mu, use_35a, use_33a, tier=1):
    """Evaluate exact rational bound on slab [ta, tb] (where tb may equal R_HI >= sqrt(pi)/2!)."""
    if use_35a and ta * ta >= Q(3, 14) * PI_HI:
        u_cap = eps * eps * (PI_HI / Q(4) - ta * ta)
    else:
        u_cap = Q(4) * eps * eps * B_212B * (A_212B - ta)
    u0_c = u_cap / (mu * mu)
    if u0_c <= 0 or u0_c > E0:
        return None
    ell_base = ((eps / mu) ** 2) * (PI_HI / Q(4) - ta * ta)
    utot_c = Q(3, 2) * ell_base + Q(1, 4) * u0_c
    if utot_c <= 0 or utot_c > U_TOT0:
        return None
    dp = mu / eps - P0
    cov = build_homothety_cover(
        u_max=u0_c, u_tot=utot_c, mu=mu, dp=dp,
        use_signed_1161=True, use_33a=use_33a, ell_base=ell_base, tier=tier
    )
    ell_m, beta_m = mu * ELL0, mu * BETA0
    qa = ta * ta - Q(2) * ell_m * ta + Q(2) * beta_m * beta_m / eps
    qb = tb * tb - Q(2) * ell_m * tb + Q(2) * beta_m * beta_m / eps
    tot_v = max(qa, qb) + mu * (S0_HI + Q(cov["worst_ub_1e10"], 10**10))
    tot_1e10 = ceil_1e10(tot_v)
    return cov, Q(tot_1e10, 10**10), tot_1e10


def optimize_mu_for_slab(eps, ta, tb, use_35a, use_33a, tier=1):
    lam = float(eps / EPS0)
    t_mid = 0.5 * (float(ta) + float(tb))
    mu_center = lam * (1.0 + 1.35 * (t_mid - 0.8456))
    best = None
    c_int = round(mu_center * 1000)
    for m_int in range(c_int - 28, c_int + 32, 2):
        if m_int <= 500:
            continue
        mu = Q(m_int, 1000)
        res = eval_slab_with_mu(eps, ta, tb, mu, use_35a, use_33a, tier=tier)
        if res is not None and (best is None or res[1] < best[1]):
            best = (mu, res[1], res[2], res[0])
    if best is None:
        return None
    w5 = round(float(best[0]) * 5000)
    for m5 in range(w5 - 10, w5 + 11):
        if m5 <= 2500:
            continue
        mu = Q(m5, 5000)
        res = eval_slab_with_mu(eps, ta, tb, mu, use_35a, use_33a, tier=tier)
        if res is not None and res[1] < best[1]:
            best = (mu, res[1], res[2], res[0])
    return best  # (mu, cap_q, cap_1e10, cov)


def certify_interval_homothety(eps, target_cap, t_start, t_end, use_35a, use_33a):
    """Certify [t_start, t_end] with adaptive recursive subdivision and minimal cover tier."""
    slabs = []

    def rec(ta, tb, depth=0):
        margin_req = Q(15, 10**8) if depth < 6 else Q(1, 10**10)
        best = optimize_mu_for_slab(eps, ta, tb, use_35a, use_33a, tier=1)
        win_tier = 1
        if (best is None or best[1] > target_cap - margin_req) and depth >= 4:
            best2 = optimize_mu_for_slab(eps, ta, tb, use_35a, use_33a, tier=2)
            if best2 is not None and (best is None or best2[1] < best[1]):
                best, win_tier = best2, 2
        if best is not None and best[1] <= target_cap - margin_req:
            mu_win = best[0]
            # Shrink cover to coarsest tier (0..win_tier-1) that still meets target_cap - margin_req:
            for t_small in range(win_tier):
                r_small = eval_slab_with_mu(eps, ta, tb, mu_win, use_35a, use_33a, tier=t_small)
                if r_small is not None and r_small[1] <= target_cap - margin_req:
                    best = (mu_win, r_small[1], r_small[2], r_small[0])
                    break
            slabs.append({
                "t_lo": str(ta),
                "t_hi": str(tb),
                "mu": str(best[0]),
                "cap_1e10": best[2],
                "cover": best[3],
            })
            return
        if depth >= 9:
            raise RuntimeError(f"Failed to close [{ta}, {tb}] at eps={eps} (use_35a={use_35a}, use_33a={use_33a})")
        t_mid = Q(int((ta + tb) * 10000), 20000)
        if t_mid <= ta or t_mid >= tb:
            t_mid = (ta + tb) / 2
        rec(ta, t_mid, depth + 1)
        rec(t_mid, tb, depth + 1)

    rec(t_start, t_end, 0)
    return {
        "eps": str(eps),
        "target_cap": str(target_cap),
        "use_35a": bool(use_35a),
        "use_33a": bool(use_33a),
        "t_covered": [str(t_start), str(t_end)],
        "max_cap_1e10": max(s["cap_1e10"] for s in slabs),
        "slabs": slabs,
    }


def main():
    print("1. Building exempt-box-free Peak Retained covers (kap=0 on u_0 < 3/2000)...")
    peak_dplus = build_homothety_cover(
        E0, U_TOT0, Q(1), Q(0), use_signed_1161=False, use_33a=False,
        ell_base=None, tier=3
    )
    peak_signed = build_homothety_cover(
        E0, U_TOT0, Q(1), Q(0), use_signed_1161=True, use_33a=False,
        ell_base=None, tier=3
    )
    peak_33a = build_homothety_cover(
        E0, U_TOT0, Q(1), Q(0), use_signed_1161=True, use_33a=True,
        ell_base=None, tier=3
    )
    print(f"  peak_dplus  (exempt-free): {peak_dplus['worst_ub_1e10']/1e4:.4f}e-6")
    print(f"  peak_signed (exempt-free): {peak_signed['worst_ub_1e10']/1e4:.4f}e-6")
    print(f"  peak_33a    (exempt-free): {peak_33a['worst_ub_1e10']/1e4:.4f}e-6")

    print("\n2. Building Track A (Pure P + C, exempt-box-free, zero 3.3a/3.5a) consumer covers...")
    cons_a_85 = certify_interval_homothety(
        Q(149, 200), Q(100000, 140171), Q(839, 1000), Q(8556, 10000), False, False
    )
    cons_a_87 = certify_interval_homothety(
        EPS0, Q(500, 701), Q(21, 25), R_HI, False, False
    )
    cons_a_813ii = certify_interval_homothety(
        Q(94, 125), Q(500, 701), Q(21, 25), Q(8645, 10000), False, False
    )
    cons_a_813i = certify_interval_homothety(
        Q(3, 4), Q(500, 701), Q(21, 25), Q(429, 500), False, False
    )
    cons_a_810 = certify_interval_homothety(
        Q(299, 400), Q(713263, 1000000), Q(21, 25), Q(8498, 10000), False, False
    )

    for tag, obj in [
        ("Track A 8.5 (149/200 -> 1.40171)", cons_a_85),
        ("Track A 8.1/8.7 (1891/2500 -> 1.402)", cons_a_87),
        ("Track A 8.13(ii) (94/125 -> 1.402, Rows 8-13!)", cons_a_813ii),
        ("Track A 8.13(i) (3/4 -> 1.402)", cons_a_813i),
        ("Track A 8.10 (299/400 -> 713263/10^6)", cons_a_810),
    ]:
        print(f"  {tag:48s}: {obj['t_covered']} ({len(obj['slabs'])} slabs, max_cap={obj['max_cap_1e10']/1e10:.9f})")

    print("\n3. Building Track B (Adding 3.5a buffered-Rice + 3.3a peak deficit) consumer covers...")
    cons_b_87 = certify_interval_homothety(
        EPS0, Q(500, 701), Q(1679, 2000), R_HI, True, True
    )
    cons_b_813ii = certify_interval_homothety(
        Q(94, 125), Q(500, 701), Q(1679, 2000), R_HI, True, True
    )
    cons_b_813i = certify_interval_homothety(
        Q(3, 4), Q(500, 701), Q(1679, 2000), R_HI, True, True
    )
    cons_b_810_lo = certify_interval_homothety(
        Q(299, 400), Q(713263, 1000000), Q(1679, 2000), Q(8499, 10000), True, True
    )
    cons_b_810_hi = certify_interval_homothety(
        Q(299, 400), Q(713263, 1000000), Q(1731, 2000), R_HI, True, True
    )

    for tag, obj in [
        ("Track B 8.1/8.7 (1891/2500 -> 1.402)", cons_b_87),
        ("Track B 8.13(ii) (94/125 -> 1.402, ALL >=0.8395)", cons_b_813ii),
        ("Track B 8.13(i) (3/4 -> 1.402, ALL >=0.8395!)", cons_b_813i),
        ("Track B 8.10 lower (299/400)", cons_b_810_lo),
        ("Track B 8.10 upper (299/400)", cons_b_810_hi),
    ]:
        print(f"  {tag:48s}: {obj['t_covered']} ({len(obj['slabs'])} slabs, max_cap={obj['max_cap_1e10']/1e10:.9f})")

    bundle = {
        "schema": "khom-v1",
        "peak_covers": {
            "peak_dplus_exempt_free": peak_dplus,
            "peak_signed_exempt_free": peak_signed,
            "peak_33a_exempt_free": peak_33a,
        },
        "track_a_pure_pc": {
            "c85_149_200": cons_a_85,
            "c87_1891_2500": cons_a_87,
            "c813ii_94_125": cons_a_813ii,
            "c813i_3_4": cons_a_813i,
            "c810_299_400": cons_a_810,
        },
        "track_b_35a_33a": {
            "c87_1891_2500": cons_b_87,
            "c813ii_94_125": cons_b_813ii,
            "c813i_3_4": cons_b_813i,
            "c810_299_400_lo": cons_b_810_lo,
            "c810_299_400_hi": cons_b_810_hi,
        },
    }
    out_path = os.path.join(HERE, "homothety_consumers_cert.json")
    with open(out_path, "w") as f:
        json.dump(bundle, f, separators=(",", ":"))
    sz = os.path.getsize(out_path)
    print(f"\nWrote {out_path} ({sz:,} bytes)")
    if sz >= 300_000:
        raise RuntimeError(f"Certificate {sz} B exceeds 300,000 B limit!")


if __name__ == "__main__":
    main()
