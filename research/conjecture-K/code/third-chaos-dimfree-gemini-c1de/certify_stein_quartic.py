#!/usr/bin/env python3
"""Outward-rounded Arb certifier for the quartic-Huber + D_1 IBP Stein bound (lambda <= 0.0064).

Agent-ID: gemini-c1de (Refs #501, #458).

For F = I_3(T) / sqrt(6) in V_3(R^n) with E[F^2] = 1, M = T otimes_2 T, lambda = ||M||_op,
m = tr(M^2) = x_m lambda, and u = ||U_tilde||_HS^2 = x_u lambda (0 <= x_u <= x_m <= 1),
consider the C^2 even quartic-Huber majorant of |x| at delta = 6/25 = 0.24:
    Q_delta(x) = 3 delta / 8 + 3 x^2 / (4 delta) - x^4 / (8 delta^3)   (|x| <= delta),
    Q_delta(x) = |x|                                                   (|x| >= delta).
Then |x| <= Q_delta(x) on R, and solving psi_delta'(x) - x psi_delta(x) = -(Q_delta(x) - g_delta)
with g_delta = E[Q_delta(Z)] gives the C^1 odd kernel chi_delta(x) = -psi_delta''(x) / c_0
satisfying b_delta(x) = (g_delta / c_0) b_0(x) identically for x >= delta, and
    E|F| <= E[Q_delta(F)] = g_delta - c_0 E[chi_delta(F) (D_1 + D_3 + D_5)].

Writing D_1 = (7/2) sqrt(6) <V, G> in H_1, Gaussian integration by parts gives
    |E[chi_delta(F) D_1]| = (7/2) sqrt(6) |E[chi_delta'(F) <V, grad F>]|
                          <= (21 / sqrt(2)) ||chi_delta'(F)||_2 sqrt(x_m) lambda^(3/2),
while optimal Cauchy-Schwarz on D_3 gives E[D_3^2] <= lambda^2 (6 sqrt(x_m) + 9 sqrt(x_u))^2.
Enclosing E[F chi_delta(F)], E[(chi_delta(F) - (6/25) F)^2], and E[chi_delta'(F)^2] around
their Gaussian means via outward-rounded Stein solutions certifies standalone:
    lambda <= 16/2500 = 0.0064  ==>  E|F| < sqrt(17/25) ||F||_2.
"""

from fractions import Fraction as Q
from flint import arb, ctx, fmpq


def ball(x):
    if isinstance(x, arb):
        return x
    x = Q(x)
    return arb(fmpq(x.numerator, x.denominator))


def main():
    if not __debug__:
        raise RuntimeError("Run without -O so assert checks remain active")
    ctx.prec = 128
    pi = arb.pi()
    sqrt2 = arb(2).sqrt()
    c0 = (arb(2) / pi).sqrt()
    norm_mills = (pi / arb(2)).sqrt()
    target = ball(Q(17, 25)).sqrt()

    d = ball(Q(6, 25))
    d2, d3 = d * d, d * d * d

    def I_poly(t):
        J0 = norm_mills * (arb(1) - (t / sqrt2).erfc())
        ex = (-t * t / arb(2)).exp()
        i0 = J0
        i2 = J0 - t * ex
        i4 = arb(3) * J0 - (t * t * t + arb(3) * t) * ex
        return (arb(3) * d / arb(8)) * i0 + (arb(3) / (arb(4) * d)) * i2 - (arb(1) / (arb(8) * d3)) * i4

    g_d = c0 * (I_poly(d) + (-d2 / arb(2)).exp())
    assert g_d < target
    ratio_gc = g_d / c0

    def b0_and_deriv_point(xp):
        mills = norm_mills * (xp * xp / arb(2)).exp() * (xp / sqrt2).erfc()
        b0 = (arb(1) + xp * xp) * mills - xp
        b0p = (arb(3) * xp + xp ** 3) * mills - (arb(2) + xp * xp)
        return ratio_gc * b0, ratio_gc * b0p

    def eval_bd_and_deriv(x_lo_q, x_hi_q):
        x = ball(x_lo_q).union(ball(x_hi_q))
        if Q(x_hi_q) <= Q(6, 25):
            xl_b, xh_b = ball(x_lo_q), ball(x_hi_q)
            Qd = (arb(3) * d / arb(8) + arb(3) * xl_b * xl_b / (arb(4) * d) - (xl_b ** 4) / (arb(8) * d3)).union(
                arb(3) * d / arb(8) + arb(3) * xh_b * xh_b / (arb(4) * d) - (xh_b ** 4) / (arb(8) * d3)
            )
            Qd_p = (arb(3) * xl_b / (arb(2) * d) - (xl_b ** 3) / (arb(2) * d3)).union(
                arb(3) * xh_b / (arb(2) * d) - (xh_b ** 3) / (arb(2) * d3)
            )
            Qd_pp = (arb(3) / (arb(2) * d) - arb(3) * xh_b * xh_b / (arb(2) * d3)).union(
                arb(3) / (arb(2) * d) - arb(3) * xl_b * xl_b / (arb(2) * d3)
            )
            ip_box = I_poly(xl_b).union(I_poly(xh_b))
            erfc_box = (xh_b / sqrt2).erfc().union((xl_b / sqrt2).erfc())
            tail_int = (I_poly(d) - ip_box) + (-d2 / arb(2)).exp() - g_d * norm_mills * erfc_box
            ex_p = (xl_b * xl_b / arb(2)).exp().union((xh_b * xh_b / arb(2)).exp())
            fd_p = -ex_p * tail_int
            b_d = ((arb(1) + x * x) * fd_p + x * (Qd - g_d) + Qd_p) / c0
            bd_p = ((arb(3) * x + x ** 3) * fd_p + (arb(2) + x * x) * (Qd - g_d) + x * Qd_p + Qd_pp) / c0
            return x, b_d, bd_p
        assert Q(x_lo_q) >= Q(6, 25)
        bd_lo, bdp_lo = b0_and_deriv_point(ball(x_lo_q))
        bd_hi, bdp_hi = b0_and_deriv_point(ball(x_hi_q))
        return x, bd_hi.union(bd_lo), bdp_lo.union(bdp_hi)

    # Continuity cross-check at the knot x = delta = 6/25 (mesh = 2500 hits 600/2500 = 6/25 exactly).
    _, bd_left, bdp_left = eval_bd_and_deriv(Q(6, 25), Q(6, 25))
    bd_right, bdp_right = b0_and_deriv_point(d)
    assert bd_left.overlaps(bd_right) and bdp_left.overlaps(bdp_right)

    alpha = ball(Q(6, 25))
    mesh = 2500
    stop = 12
    end = 10
    step = ball(Q(1, mesh))
    pstep = arb(0).union(step)

    S_stop = arb(stop)
    b_tail_hi = ratio_gc * arb(2) / (S_stop ** 3)
    bp_tail_hi = ratio_gc * arb(6) / (S_stop ** 4)
    erfc_stop = (S_stop / sqrt2).erfc()

    r1_tail = arb(0).union(ratio_gc * arb(2) / (S_stop ** 2))
    r2_tail = (-arb(4) * alpha * ratio_gc / (S_stop ** 2)).union(b_tail_hi * b_tail_hi)
    r3_tail = arb(0).union(bp_tail_hi * bp_tail_hi)

    ez_r1 = r1_tail * erfc_stop
    ez_r2 = r2_tail * erfc_stop
    ez_r3 = r3_tail * erfc_stop

    int_r1 = r1_tail * norm_mills * erfc_stop
    int_r2 = r2_tail * norm_mills * erfc_stop
    int_r3 = r3_tail * norm_mills * erfc_stop

    cells_r = []
    for j in range(stop * mesh - 1, -1, -1):
        xl_q, xh_q = Q(j, mesh), Q(j + 1, mesh)
        x, bd, bdp = eval_bd_and_deriv(xl_q, xh_q)
        ex_lo = (-ball(xh_q) ** 2 / arb(2)).exp()
        ex_hi = (-ball(xl_q) ** 2 / arb(2)).exp()
        ex = ex_lo.union(ex_hi)
        r1 = x * bd
        r2 = bd * bd - arb(2) * alpha * x * bd
        r3 = bdp * bdp
        if j < end * mesh:
            xl_b, xh_b = ball(xl_q), ball(xh_q)
            xm_lo = xl_b * norm_mills * (xl_b * xl_b / arb(2)).exp() * (xl_b / sqrt2).erfc()
            xm_hi = xh_b * norm_mills * (xh_b * xh_b / arb(2)).exp() * (xh_b / sqrt2).erfc()
            one_minus_xM = (arb(1) - xm_hi).union(arb(1) - xm_lo)
            ex_pos = (arb(1) / ex_hi).union(arb(1) / ex_lo)
            cells_r.append((x, ex_pos, one_minus_xM, r1, r2, r3, int_r1, int_r2, int_r3, r1 * ex, r2 * ex, r3 * ex))
        ez_r1 += step * c0 * ex * r1
        ez_r2 += step * c0 * ex * r2
        ez_r3 += step * c0 * ex * r3
        int_r1 += step * r1 * ex
        int_r2 += step * r2 * ex
        int_r3 += step * r3 * ex

    m1 = ez_r1
    m2 = alpha * alpha + ez_r2
    m3 = ez_r3

    lo1, hi1 = arb(100), arb(-100)
    lo2, hi2 = arb(100), arb(-100)
    lo3, hi3 = arb(100), arb(-100)

    for x, ex_pos, one_minus_xM, r1, r2, r3, ir1, ir2, ir3, ig1, ig2, ig3 in cells_r:
        d1 = r1 - x * ex_pos * (ir1 + pstep * ig1) - ez_r1 * one_minus_xM
        d2 = r2 - x * ex_pos * (ir2 + pstep * ig2) - ez_r2 * one_minus_xM
        d3_v = r3 - x * ex_pos * (ir3 + pstep * ig3) - ez_r3 * one_minus_xM
        if arb(d1.lower()) < lo1:
            lo1 = arb(d1.lower())
        if arb(d1.upper()) > hi1:
            hi1 = arb(d1.upper())
        if arb(d2.lower()) < lo2:
            lo2 = arb(d2.lower())
        if arb(d2.upper()) > hi2:
            hi2 = arb(d2.upper())
        if arb(d3_v.lower()) < lo3:
            lo3 = arb(d3_v.lower())
        if arb(d3_v.upper()) > hi3:
            hi3 = arb(d3_v.upper())

    E_b = arb(end)
    tail_r1 = ratio_gc * arb(2) / (E_b ** 2)
    tail_b1 = abs(-m1) / (arb(1) + E_b * E_b) + arb(2) * tail_r1
    lo1 = arb(min(lo1.lower(), (-tail_b1).lower()))
    hi1 = arb(max(hi1.upper(), tail_b1.upper()))

    b_E = ratio_gc * arb(2) / (E_b ** 3)
    tail_r2 = arb(max((arb(4) * alpha * ratio_gc / (E_b ** 2)).upper(), (b_E * b_E).upper()))
    tail_b2 = abs(alpha * alpha - m2) / (arb(1) + E_b * E_b) + arb(2) * tail_r2
    lo2 = arb(min(lo2.lower(), (-tail_b2).lower()))
    hi2 = arb(max(hi2.upper(), tail_b2.upper()))

    tail_r3 = (ratio_gc * arb(6) / (E_b ** 4)) ** 2
    tail_b3 = abs(-m3) / (arb(1) + E_b * E_b) + arb(2) * tail_r3
    lo3 = arb(min(lo3.lower(), (-tail_b3).lower()))
    hi3 = arb(max(hi3.upper(), tail_b3.upper()))

    sp1 = (hi1 - lo1) / arb(2)
    sp2 = (hi2 - lo2) / arb(2)
    sp3 = (hi3 - lo3) / arb(2)

    c21_sq2 = arb(21) / sqrt2
    lam_cap = Q(16, 2500)  # 0.0064

    # Standalone 3D cover over all 0 <= x_u <= x_m <= 1 and 0 <= lambda <= 16/2500.
    todo_s = [(Q(0), Q(1), Q(0), Q(1), Q(0), lam_cap, 0)]
    leaves_s = 0
    while todo_s:
        xm0, xm1, xu0, xu1, l0, l1, dep = todo_s.pop()
        if xu0 > xm1:
            continue
        xu_top = min(xu1, xm1)
        XM = ball(xm0).union(ball(xm1))
        XU = ball(xu0).union(ball(xu_top))
        LAM = ball(l0).union(ball(l1))
        SQ_XMXU = (ball(xm0) * ball(xu0)).sqrt().union((ball(xm1) * ball(xu_top)).sqrt())

        S_v = arb(36) * XM + arb(54) * XU
        g_lo = ((arb(8) * ball(xm0) + arb(6) * ball(xu0)) * ball(l0)).sqrt()
        g_hi = ((arb(8) * ball(xm1) + arb(6) * ball(xu_top)) * ball(l1)).sqrt()
        G_tau = g_lo.union(g_hi)

        a_eff_raw = m1 - sp1 * G_tau
        a_eff_lo = arb(0) if a_eff_raw.lower() <= 0 else arb(a_eff_raw.lower())
        b_eff = arb((m2 + sp2 * G_tau).upper()).sqrt()
        dp_l2 = arb((m3 + sp3 * G_tau).upper()).sqrt()

        # Bound A (Quartic-Huber + D_1 integration by parts):
        xm_hi = ball(xm1)
        lam_hi = ball(l1)
        d1_ibp = c21_sq2 * dp_l2 * xm_hi.sqrt() * (lam_hi * lam_hi.sqrt())
        v35_raw = arb(36) * XM + arb(126) * XU + arb(108) * SQ_XMXU - (S_v * S_v) / arb(36)
        v35_sq = arb(0) if v35_raw.upper() <= 0 else arb(v35_raw.upper()).sqrt()
        ub_ibp = g_d + c0 * (d1_ibp + LAM * (b_eff * v35_sq - a_eff_lo * ball(36 * xm0 + 54 * xu0) / arb(6)))
        if ub_ibp < target:
            leaves_s += 1
            continue

        # Bound B (Quartic-Huber full D = D_1 + D_3 + D_5):
        vf_raw = ball(Q(219, 2)) * XM + arb(126) * XU + arb(108) * SQ_XMXU - (S_v * S_v) / arb(36)
        vf_sq = arb(0) if vf_raw.upper() <= 0 else arb(vf_raw.upper()).sqrt()
        ub_full = g_d + c0 * LAM * (b_eff * vf_sq - a_eff_lo * ball(36 * xm0 + 54 * xu0) / arb(6))
        if ub_full < target:
            leaves_s += 1
            continue

        assert dep < 36
        w_xm, w_xu, w_l = float(xm1 - xm0), float(xu1 - xu0), float(l1 - l0) * 150.0
        if w_xm >= w_xu and w_xm >= w_l:
            md = (xm0 + xm1) / 2
            todo_s.extend(((xm0, md, xu0, xu1, l0, l1, dep + 1), (md, xm1, xu0, xu1, l0, l1, dep + 1)))
        elif w_xu >= w_l:
            md = (xu0 + xu1) / 2
            todo_s.extend(((xm0, xm1, xu0, md, l0, l1, dep + 1), (xm0, xm1, md, xu1, l0, l1, dep + 1)))
        else:
            md = (l0 + l1) / 2
            todo_s.extend(((xm0, xm1, xu0, xu1, l0, md, dep + 1), (xm0, xm1, xu0, xu1, md, l1, dep + 1)))

    print(
        f"PASS certify_stein_quartic lambda <= {lam_cap} (0.0064): "
        f"{leaves_s} boxes, 30000 compact cells + analytic tails"
    )


if __name__ == "__main__":
    main()
