#!/usr/bin/env python3
"""Outward-rounded Arb certifier for dimension-inductive rank-one correlation bounds.

Agent-ID: gemini-c1de (Refs #501, #458).

For F = I_3(T) / sqrt(6) in V_3(R^n) with E[F^2] = 1, let v be a unit direction
attaining a = a(F) = max_{||w||=1} |E[F h_3(<w, G>)]| >= a_0, write X = <v, G>,
and let Y be the orthogonal Gaussian coordinates. Stationarity on S^(n-1) gives
    F = a h_3(X) + X Q(Y) + R(Y),   E[Q] = 0,   E[Q^2] + E[R^2] = 1 - a^2,
with Q in V_2(R^(n-1)) and R = sqrt(u_r) R_hat in V_3(R^(n-1)) (E[R_hat^2] = 1).

Setting Psi(q, b) = E_X |h_3(X) + q X + b| = Psi(q, -b), this script certifies:
  1. Global pointwise dominance on R x [0, inf) for each rational majorant
         M(q, b) = C + l q + mu_q q^2 + alpha b + mu_{b,2} b^2 - mu_{b,4} b^4 + mu_{b,6} b^6
     via 128-bit outward-rounded Arb integration and second-derivative midpoint/corner
     bounds on [-9/2, 9/2] x [0, 9/2], completion-of-square interval bounds on
     [9/2, 110], and quintic derivative negativity on [110, inf).
  2. Over (a, s, kappa_R) in [a_0, 1] x [0, 1] x [0, 90], where s = u_r / (1 - a^2)
     and kappa_R = kappa_4(R_hat):
       - E[|R_hat|] <= C_tar for kappa_R >= kappa_hi(a_0) (by Theorem 2: a(R_hat) > a_0,
         and dimension induction on n - 1), and E[|R_hat|] <= min(44357/50000, g_Stein(kappa_R))
         for kappa_R < kappa_hi(a_0) (note: all 15 sharp-bound majorants have alpha = 0,
         so the sharp proof uses neither E[|R_hat|] nor dimension induction);
       - E[(R/a)^4] = (3 + kappa_R) sigma_r^4 and
         E[(R/a)^6] <= (15 + 15 kappa_R + 67 kappa_R^(3/2)) sigma_r^6 (by Theorem 1).
     Every cell is strictly below sqrt(17/25) for a_0 = 321/500 = 0.642 (with
     kappa_hi = 46.6, 19 majorants), and strictly below sqrt(2/pi) for a_0 = 7/10 = 0.700
     (15 majorants, all with alpha = 0).
"""

from fractions import Fraction as Q
from functools import lru_cache
from flint import arb, ctx, fmpq


def ball(x):
    if isinstance(x, arb):
        return x
    x = Q(x)
    return arb(fmpq(x.numerator, x.denominator))


class GaussianSlice:
    def __init__(self):
        self.inv_sqrt6 = arb(1) / arb(6).sqrt()
        self.sqrt2 = arb(2).sqrt()
        self.phi0 = arb(1) / (arb(2) * arb.pi()).sqrt()

    @lru_cache(maxsize=None)
    def gaussian(self, t):
        x = ball(t)
        density = self.phi0 * (-x * x / arb(2)).exp()
        cdf = (-x / self.sqrt2).erfc() / arb(2)
        return density, cdf

    @lru_cache(maxsize=None)
    def upper(self, q, r):
        linear = ball(q) - arb(3) * self.inv_sqrt6
        constant = ball(r)

        def p(x):
            return x * (x * x * self.inv_sqrt6 + linear) + constant

        def deriv(x):
            return arb(3) * x * x * self.inv_sqrt6 + linear

        def primitive(t):
            density, cdf = self.gaussian(t)
            return ((arb(1) - ball(t * t)) * self.inv_sqrt6 - ball(q)) * density + constant * cdf

        outer = Q(9)
        assert deriv(ball(outer)) > 0
        assert p(ball(-outer)) < 0 and p(ball(outer)) > 0
        result = constant - primitive(outer) - primitive(-outer)
        todo = [(-outer, outer, 0)]
        while todo:
            lo, hi, depth = todo.pop()
            x = ball(lo).union(ball(hi))
            value = p(x)
            pos, neg = value >= 0, value <= 0
            if not (pos or neg):
                slope = deriv(x)
                if slope > 0 or slope < 0:
                    left, right = p(ball(lo)), p(ball(hi))
                    pos = left >= 0 and right >= 0
                    neg = left <= 0 and right <= 0
            if pos or neg:
                integral = primitive(hi) - primitive(lo)
                result += integral if pos else -integral
            elif depth >= 22:
                result += arb(abs(value).upper()) * self.phi0 * ball(hi - lo)
            else:
                mid = (lo + hi) / 2
                todo.extend(((lo, mid, depth + 1), (mid, hi, depth + 1)))
        return arb(result.upper())


def sup_eb_interval(al, mb2, mb4, mb6, b_lo_q, b_hi_q):
    """Upper bound on (1 - al) b - (mb2 b^2 - mb4 b^4 + mb6 b^6) on [b_lo_q, b_hi_q]."""
    y_star = mb4 / (arb(2) * mb6)
    delta_sq = mb2 - (mb4 * mb4) / (arb(4) * mb6)
    todo = [(Q(b_lo_q), Q(b_hi_q), 0)]
    best = arb(-10 ** 9)
    while todo:
        l, h, dep = todo.pop()
        bl, bh = ball(l), ball(h)
        B = bl.union(bh)
        B2 = (bl * bl).union(bh * bh)
        diff_y = B2 - y_star
        dl_b, dh_b = arb(diff_y.lower()), arb(diff_y.upper())
        if diff_y.contains(0):
            sq_y = arb(0).union(arb(max((dl_b * dl_b).upper(), (dh_b * dh_b).upper())))
        else:
            sq_y = diff_y * diff_y
        val = (arb(1) - al) * B - B2 * (mb6 * sq_y + delta_sq)
        if dep >= 16 or float(h - l) <= 5e-3:
            if arb(val.upper()) > best:
                best = arb(val.upper())
        else:
            if arb(val.upper()) <= best:
                continue
            md = (l + h) / 2
            todo.extend(((l, md, dep + 1), (md, h, dep + 1)))
    return best


def certify_majorant_global(maj_strs, slice_obj, Bq=Q(9, 2), Bb=Q(9, 2)):
    C, l, mq2, al, mb2, mb4, mb6 = [ball(Q(s)) for s in maj_strs]
    _, _, mq2_q, al_q, mb2_q, mb4_q, mb6_q = [Q(s) for s in maj_strs]
    assert mq2_q > 0 and 0 <= al_q <= 1 and mb2_q > 0 and mb4_q >= 0 and mb6_q > 0

    c0 = (arb(2) / arb.pi()).sqrt()
    h0 = (arb(1) + arb(4) * ball(Q(-3, 2)).exp()) / (arb(3) * arb.pi()).sqrt()

    # Exterior tail check on |q| >= Bq or b >= Bb using Psi(q, b) <= E|h_3(X)| + c0 |q| + b.
    slope_q = c0 + abs(l)
    assert arb(2) * mq2 * ball(Bq) > slope_q
    sup_eq_all = (slope_q * slope_q) / (arb(4) * mq2)
    sup_eq_tail = slope_q * ball(Bq) - mq2 * ball(Bq * Bq)

    B_far = Q(110)
    bf_b = ball(B_far)
    assert arb(6) * mb6 * (bf_b * bf_b) > arb(4) * mb4
    assert (bf_b ** 3) * (arb(6) * mb6 * (bf_b * bf_b) - arb(4) * mb4) > arb(1) - al
    eb_at_bfar = (arb(1) - al) * bf_b - mb2 * (bf_b ** 2) + mb4 * (bf_b ** 4) - mb6 * (bf_b ** 6)
    sup_eb_tail = sup_eb_interval(al, mb2, mb4, mb6, Bb, B_far)
    if eb_at_bfar > sup_eb_tail:
        sup_eb_tail = arb(eb_at_bfar.upper())
    sup_eb_comp = sup_eb_interval(al, mb2, mb4, mb6, Q(0), Bb)
    sup_eb_all = sup_eb_comp if sup_eb_comp >= sup_eb_tail else sup_eb_tail

    assert (h0 - C) + sup_eq_tail + sup_eb_all < 0
    assert (h0 - C) + sup_eq_all + sup_eb_tail < 0

    # Compact rectangle [-Bq, Bq] x [0, Bb]: Psi is convex on R^2, while -M has
    # second derivatives -2 mq2 in q and -(2 mb2 - 12 mb4 b^2 + 30 mb6 b^4) in b.
    # For any 1D function g on [x0, x1] with g''(x) >= -L (L >= 0), bilinear/linear
    # interpolation I_g satisfies I_g(x) - g(x) <= L (x1 - x0)^2 / 8.
    @lru_cache(maxsize=None)
    def corner_excess(qq, bq):
        qb, bb = ball(qq), ball(bq)
        b2 = bb * bb
        M_val = C + l * qb + mq2 * (qb * qb) + al * bb + mb2 * b2 - mb4 * (b2 * b2) + mb6 * (b2 * b2 * b2)
        return arb((slice_obj.upper(qq, bq) - M_val).upper())

    todo = [(-Bq, Bq, Q(0), Bb, 0)]
    leaves = 0
    while todo:
        q0, q1, b0, b1, dep = todo.pop()
        dq = ball(q1 - q0)
        db = ball(b1 - b0)
        B_int = ball(b0).union(ball(b1))
        B2_int = B_int * B_int
        gb_pp = arb(2) * mb2 - arb(12) * mb4 * B2_int + arb(30) * mb6 * (B2_int * B2_int)
        gb_pp_pos = arb(gb_pp.upper()) if gb_pp.upper() > 0 else arb(0)
        # Note (2 mq2) * dq^2 / 8 = mq2 * dq^2 / 4.
        pen = (mq2 * dq * dq) / arb(4) + (db * db * gb_pp_pos) / arb(8)
        mx_c = max((corner_excess(q, b) for q in (q0, q1) for b in (b0, b1)), key=lambda z: float(z.upper()))
        if mx_c + pen < 0:
            leaves += 1
            continue
        assert dep < 30
        if q1 - q0 >= b1 - b0:
            md = (q0 + q1) / 2
            todo.extend(((q0, md, b0, b1, dep + 1), (md, q1, b0, b1, dep + 1)))
        else:
            md = (b0 + b1) / 2
            todo.extend(((q0, q1, b0, md, dep + 1), (q0, q1, md, b1, dep + 1)))
    return leaves


def certify_domain_cover(a0_str, target, k4_hi_str, maj_list):
    a0_q = Q(a0_str)
    k4_hi_q = Q(k4_hi_str)
    c0 = (arb(2) / arb.pi()).sqrt()
    V0_1st = ball(Q(23, 32)) - arb(2).log()
    K3_cap = ball(Q(44357, 50000))

    majs = [[ball(Q(s)) for s in m] for m in maj_list]

    todo = [
        (a0_q, Q(1), Q(0), Q(1), Q(0), k4_hi_q, False, 0),
        (a0_q, Q(1), Q(0), Q(1), k4_hi_q, Q(90), True, 0),
    ]
    leaves = 0
    while todo:
        a0, a1, s0, s1, k0, k1, is_hi, dep = todo.pop()
        a_lo, a_hi = ball(a0), ball(a1)
        fac_lo = (arb(1) - a_hi * a_hi) / (a_hi * a_hi)
        fac_hi = (arb(1) - a_lo * a_lo) / (a_lo * a_lo)
        sq2_hi = fac_hi * ball(Q(1) - s0)
        sr2_lo = fac_lo * ball(s0)
        sr2_hi = fac_hi * ball(s1)
        sr_hi = sr2_hi.sqrt()

        if is_hi:
            u_cap_hi = target
        else:
            g_hi = (arb(2) * ball(k1) / arb(9)).sqrt()
            reg_hi = c0 * (
                arb(1) - ball(k0) / arb(24)
                + g_hi * (V0_1st + ball(k1) / arb(64) + ball(Q(7, 100)) * g_hi).sqrt()
            )
            u_cap_hi = K3_cap if K3_cap < reg_hi else arb(reg_hi.upper())

        eb4_lo = (arb(3) + ball(k0)) * (sr2_lo * sr2_lo)
        k1_b = ball(k1)
        eb6_hi = (arb(15) + arb(15) * k1_b + arb(67) * k1_b * k1_b.sqrt()) * (sr2_hi * sr2_hi * sr2_hi)

        passed = False
        for C, _, mq2, al, mb2, mb4, mb6 in majs:
            inner_hi = C + mq2 * sq2_hi + al * u_cap_hi * sr_hi + mb2 * sr2_hi - mb4 * eb4_lo + mb6 * eb6_hi
            val_hi = a_hi * inner_hi if inner_hi > 0 else a_lo * inner_hi
            if val_hi < target:
                passed = True
                break
        if passed:
            leaves += 1
            continue

        assert dep < 36
        wa = float(a1 - a0) * 3.0
        ws = float(s1 - s0) * 1.5
        wk = float(k1 - k0) / 30.0
        if wa >= ws and wa >= wk:
            md = (a0 + a1) / 2
            todo.extend(((a0, md, s0, s1, k0, k1, is_hi, dep + 1), (md, a1, s0, s1, k0, k1, is_hi, dep + 1)))
        elif ws >= wk:
            md = (s0 + s1) / 2
            todo.extend(((a0, a1, s0, md, k0, k1, is_hi, dep + 1), (a0, a1, md, s1, k0, k1, is_hi, dep + 1)))
        else:
            md = (k0 + k1) / 2
            todo.extend(((a0, a1, s0, s1, k0, md, is_hi, dep + 1), (a0, a1, s0, s1, md, k1, is_hi, dep + 1)))
    return leaves


PRAC_MAJS = [
    ("0.75235", "-0.127471", "0.343607", "0", "0.395894", "0.00093669", "0.0000006127"),
    ("0.63650", "-0.123273", "1.500000", "0", "0.511017", "0.04349532", "0.0018281899"),
    ("0.65670", "0.013476", "1.500000", "0.070465", "0.384584", "0.00695328", "0.0000477355"),
    ("0.67970", "-0.160728", "0.500653", "0", "0.498299", "0.04207692", "0.0017948251"),
    ("0.72310", "-0.094829", "0.458243", "0", "0.412277", "0.00769788", "0.0000551564"),
    ("0.72796", "-0.038096", "0.545292", "0.016978", "0.380888", "0.00328825", "0.0000090071"),
    ("0.72588", "-0.173125", "0.329795", "0", "0.476304", "0.03500952", "0.0012477417"),
    ("0.76493", "-0.121610", "0.331276", "0", "0.393545", "0.00520086", "0.0000238476"),
    ("0.76532", "-0.093971", "0.365220", "0", "0.381192", "0.00262287", "0.0000055471"),
    ("0.74260", "-0.120479", "0.370892", "0", "0.407853", "0.00740115", "0.0000512939"),
    ("0.75066", "-0.079615", "0.412816", "0", "0.389670", "0.00491518", "0.0000213350"),
    ("0.76493", "-0.121610", "0.331276", "0", "0.391460", "0.00384848", "0.0000122513"),
    ("0.76219", "-0.102072", "0.359993", "0", "0.388670", "0.00496205", "0.0000219036"),
    ("0.75850", "-0.137235", "0.321806", "0", "0.405797", "0.00726425", "0.0000495454"),
    ("0.76399", "-0.097405", "0.363004", "0", "0.384358", "0.00360957", "0.0000109503"),
    ("0.65700", "0.013476", "1.500000", "0.120990", "0.335433", "0.00129355", "0.0000014379"),
    ("0.65700", "0.013476", "1.500000", "0.091395", "0.358835", "0.00111753", "0.0000009807"),
    ("0.75860", "-0.075172", "0.402943", "0", "0.379222", "0.00165599", "0.0000021083"),
    ("0.74904", "-0.078832", "0.417219", "0", "0.384854", "0.00133533", "0.0000013203"),
]

SHARP_MAJS = [
    ("0.70374", "-0.162266", "0.399602", "0", "0.437902", "0.00142069", "0.0000012842"),
    ("0.63565", "-0.131762", "1.500000", "0", "0.516568", "0.04710096", "0.0021958262"),
    ("0.65315", "-0.010435", "1.500000", "0", "0.452989", "0.01057851", "0.0000981296"),
    ("0.65907", "-0.192325", "0.563630", "0", "0.525085", "0.05000000", "0.0024261480"),
    ("0.68662", "-0.127937", "0.539231", "0", "0.444002", "0.00991903", "0.0000874782"),
    ("0.67713", "-0.080513", "0.735648", "0", "0.434197", "0.00495850", "0.0000181918"),
    ("0.68675", "-0.195440", "0.395441", "0", "0.506643", "0.03861365", "0.0013517371"),
    ("0.70761", "-0.158681", "0.394822", "0", "0.444334", "0.00994307", "0.0000878549"),
    ("0.69911", "-0.135489", "0.465922", "0", "0.433370", "0.00522967", "0.0000205126"),
    ("0.72190", "-0.159380", "0.357554", "0", "0.432927", "0.00594207", "0.0000272956"),
    ("0.71179", "-0.154810", "0.389661", "0", "0.437304", "0.00742912", "0.0000446385"),
    ("0.65835", "0.020483", "1.500000", "0", "0.437748", "0.00229705", "0.0000034851"),
    ("0.65715", "0.014490", "1.500000", "0", "0.438427", "0.00183314", "0.0000021736"),
    ("0.70067", "-0.132286", "0.466039", "0", "0.427991", "0.00250124", "0.0000042889"),
    ("0.70139", "-0.131531", "0.464666", "0", "0.426684", "0.00198229", "0.0000026454"),
]


def main():
    if not __debug__:
        raise RuntimeError("Run without -O so assert checks remain active")
    ctx.prec = 128
    sl = GaussianSlice()
    # Base-case check for n = 1: E|h_3(X)| < sqrt(2/pi) < sqrt(17/25).
    c0 = (arb(2) / arb.pi()).sqrt()
    h0 = (arb(1) + arb(4) * ball(Q(-3, 2)).exp()) / (arb(3) * arb.pi()).sqrt()
    assert sl.upper(Q(0), Q(0)) < c0 and h0 < c0

    tot_rect_p = sum(certify_majorant_global(m, sl) for m in PRAC_MAJS)
    dom_p = certify_domain_cover("0.642", ball(Q(17, 25)).sqrt(), "46.6", PRAC_MAJS)
    print(
        f"PASS certify_rank_slice a >= 321/500 (0.642): {len(PRAC_MAJS)} majorants "
        f"({tot_rect_p} Psi-rectangles), {dom_p} (a,s,kR)-cells < sqrt(17/25)"
    )

    assert all(Q(m[3]) == 0 for m in SHARP_MAJS)
    tot_rect_s = sum(certify_majorant_global(m, sl) for m in SHARP_MAJS)
    dom_s = certify_domain_cover("0.700", c0, "49.0", SHARP_MAJS)
    print(
        f"PASS certify_rank_slice a >= 7/10 (0.700): {len(SHARP_MAJS)} majorants "
        f"({tot_rect_s} Psi-rectangles, all alpha=0), {dom_s} (a,s,kR)-cells < sqrt(2/pi)"
    )


if __name__ == "__main__":
    main()
