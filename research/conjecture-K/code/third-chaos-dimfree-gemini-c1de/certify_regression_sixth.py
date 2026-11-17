#!/usr/bin/env python3
"""Outward-rounded Arb + exact rational certifier for kappa_4 <= 91/500 = 0.182.

Agent-ID: gemini-c1de (Refs #501, #458).

For F in V_3(R^n) with E[F^2] = 1, tau = ||grad F||^2 / 3, and kappa_4 = E[F^4] - 3,
define the even C^1 quadratic-tail spline at knot M = 33/10 = 3.3:
    phi_M(x) = He_4(x) = x^4 - 6 x^2 + 3                 (|x| <= M),
    phi_M(x) = A_0 + A_2 x^2                             (|x| >= M),
where A_2 = 2 M^2 - 6 = 789/50 and A_0 = 3 - M^4 = -1155921/10000.
With Phi_M(x) = int_0^x phi_M(t) dt and W_M(x) = x Phi_M(x) - phi_M(x), Gaussian
integration by parts gives E[(tau - 1) phi_M(F)] = E[W_M(F)].

This script certifies:
  1. In exact rational arithmetic, W_M(x) <= (1/5) He_6(x) + (33/20000) x^6 on R.
  2. With beta = 7/50, gamma = 7/2000, and R(x) = K(x) - 1/2 + beta He_2(x) - gamma phi_M(x),
     150-bit outward-rounded Arb integration on [0, 12] (mesh 2500/unit, tail to 14,
     analytic Mills bounds above 12) encloses the Gaussian mean and Stein-solution
     derivative span of h_rem(x) = R(x)^2 - q_lead^2 He_2(x)^2 - 2 q_lead c_inf He_2(x).
  3. Combining E[He_6(F)] = kappa_6(F) <= 67 kappa_4^(3/2) (Theorem 1) and
     Var(tau) <= (2/9) kappa_4 covers all kappa_4 in [0, 91/500] strictly below sqrt(17/25).
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
    ctx.prec = 150
    pi = arb.pi()
    sqrt2 = arb(2).sqrt()
    c0 = (arb(2) / pi).sqrt()
    norm_mills = (pi / arb(2)).sqrt()
    target = ball(Q(17, 25)).sqrt()

    M = Q(33, 10)
    beta_q = Q(7, 50)
    gamma_q = Q(7, 2000)
    eps6_q = Q(33, 20000)  # 0.00165

    A2_q = 2 * M * M - 6
    A0_q = 3 - (M ** 4)
    C_const_q = (M ** 5) / 5 - 2 * (M ** 3) + 3 * M - A0_q * M - (A2_q * (M ** 3)) / 3
    assert C_const_q == Q(8, 15) * (M ** 5)

    w_at_M = -A0_q + C_const_q * M + (A0_q - A2_q) * (M ** 2) + (A2_q / 3) * (M ** 4)
    he6_at_M = Q(1, 5) * (M ** 6 - 15 * (M ** 4) + 45 * (M ** 2) - 15)
    assert w_at_M == he6_at_M

    # Substitute x = M / u for u in (0, 1] and verify u^6 * ((1/5) He_6(M/u) + eps6 (M/u)^6 - W_M(M/u)) > 0.
    c6_u = Q(1, 5) + eps6_q
    c4_u = 3 + A2_q / 3
    c2_u = 9 - A0_q + A2_q
    c1_u = C_const_q * M
    c0_u = 3 - A0_q
    assert c6_u > 0 and c4_u > 0 and c2_u > 0 and c1_u > 0 and c0_u > 0

    def q_u_lo(lo, hi):
        pos_part = c6_u * (M ** 6) + c2_u * (M ** 2) * (lo ** 4)
        neg_part = c4_u * (M ** 4) * (hi ** 2) + c1_u * (hi ** 5) + c0_u * (hi ** 6)
        return pos_part - neg_part

    todo_w = [(Q(0), Q(1))]
    leaves_w = 0
    while todo_w:
        lo, hi = todo_w.pop()
        if q_u_lo(lo, hi) > 0:
            leaves_w += 1
        else:
            mid = (lo + hi) / 2
            todo_w.extend(((lo, mid), (mid, hi)))

    beta = ball(beta_q)
    gamma = ball(gamma_q)
    q_lead_q = beta_q - gamma_q * A2_q
    c_inf_q = Q(-1, 2) - gamma_q * (A0_q + A2_q)
    h_inf_q = c_inf_q * c_inf_q + 2 * q_lead_q

    q_lead = ball(q_lead_q)
    c_inf = ball(c_inf_q)
    h_inf = ball(h_inf_q)

    def K_point(xp):
        return arb(1) - xp * norm_mills * (xp * xp / arb(2)).exp() * (xp / sqrt2).erfc()

    mesh = 2500  # M = 33/10 = 8250/2500 is an exact grid node.
    assert (M * mesh).denominator == 1
    stop = 14
    end = 12
    step = ball(Q(1, mesh))
    pstep = arb(0).union(step)

    S_stop = arb(stop)
    C_decay = arb(2) * abs(c_inf - q_lead) + arb(6) * abs(q_lead) + arb(1) / (S_stop * S_stop)
    r_stop_bound = C_decay / (S_stop * S_stop)
    r_tail = (-r_stop_bound).union(r_stop_bound)
    erfc_stop = (S_stop / sqrt2).erfc()

    ez_r = r_tail * erfc_stop
    int_r = r_tail * norm_mills * erfc_stop
    cells = []
    M2_b = ball(M * M)

    for j in range(stop * mesh - 1, -1, -1):
        xl_q, xh_q = Q(j, mesh), Q(j + 1, mesh)
        xl_b, xh_b = ball(xl_q), ball(xh_q)
        x = xl_b.union(xh_b)
        k_hi, k_lo = K_point(xl_b), K_point(xh_b)
        K_box = k_lo.union(k_hi)
        x2_lo, x2_hi = xl_b * xl_b, xh_b * xh_b
        he2_box = (x2_lo - arb(1)).union(x2_hi - arb(1))

        if xh_q <= M:
            # On [0, M], A_2 * He_2(x) - He_4(x) = M^4 - (M^2 - x^2)^2 - (2 M^2 - 3) is strictly increasing.
            d_lo = M2_b - x2_lo
            d_hi = M2_b - x2_hi
            poly_lo = M2_b * M2_b - d_lo * d_lo - (arb(2) * M2_b - arb(3))
            poly_hi = M2_b * M2_b - d_hi * d_hi - (arb(2) * M2_b - arb(3))
            poly_box = poly_lo.union(poly_hi)
            g_sm = K_box - ball(Q(1, 2)) + gamma * poly_box
            h_val = g_sm * g_sm + arb(2) * q_lead * he2_box * (g_sm - c_inf)
            r_val = h_val - h_inf
        else:
            assert xl_q >= M
            x2K_mon = (x2_lo * k_hi).union(x2_hi * k_lo)
            r_val = K_box * K_box + arb(2) * (c_inf - q_lead) * K_box + arb(2) * q_lead * (x2K_mon - arb(1))

        ex_lo = (-xh_b * xh_b / arb(2)).exp()
        ex_hi = (-xl_b * xl_b / arb(2)).exp()
        ex = ex_lo.union(ex_hi)
        if j < end * mesh:
            one_minus_xM = K_box
            ex_pos = (arb(1) / ex_hi).union(arb(1) / ex_lo)
            cells.append((x, ex_pos, one_minus_xM, r_val, int_r, r_val * ex))
        ez_r += step * c0 * ex * r_val
        int_r += step * r_val * ex

    mh_rem = h_inf + ez_r
    lo_d, hi_d = arb(100), arb(-100)
    for x, ex_pos, one_minus_xM, rv, ir, ig in cells:
        dv = rv - x * ex_pos * (ir + pstep * ig) - ez_r * one_minus_xM
        if arb(dv.lower()) < lo_d:
            lo_d = arb(dv.lower())
        if arb(dv.upper()) > hi_d:
            hi_d = arb(dv.upper())

    E_b = arb(end)
    C_dec_E = arb(2) * abs(c_inf - q_lead) + arb(6) * abs(q_lead) + arb(1) / (E_b * E_b)
    tail_rE = C_dec_E / (E_b * E_b)
    tail_bd = abs(ez_r) / (arb(1) + E_b * E_b) + arb(2) * tail_rE
    lo_d = arb(min(lo_d.lower(), (-tail_bd).lower()))
    hi_d = arb(max(hi_d.upper(), tail_bd.upper()))
    sp_r = (hi_d - lo_d) / arb(2)

    k_cap = Q(91, 500)  # 0.182
    todo_k = [(Q(0), k_cap, 0)]
    leaves_k = 0
    while todo_k:
        k0, k1, dep = todo_k.pop()
        K4 = ball(k0).union(ball(k1))
        g_lo = (arb(2) * ball(k0) / arb(9)).sqrt()
        g_hi = (arb(2) * ball(k1) / arb(9)).sqrt()
        G_t = g_lo.union(g_hi)
        k15_hi = ball(k1) * ball(k1).sqrt()
        k6_cap = arb(67) * k15_hi
        ew_cap = gamma * (ball(Q(1, 5)) * k6_cap + ball(eps6_q) * (arb(15) + arb(15) * ball(k1) + k6_cap))
        er2_hi = arb((mh_rem + (q_lead * q_lead) * (arb(2) + K4) + sp_r * G_t).upper())
        rhs = -(beta / arb(3)) * ball(k0) + ew_cap + g_hi * er2_hi.sqrt()
        if c0 * (arb(1) + rhs) < target:
            leaves_k += 1
        else:
            assert dep < 25
            md = (k0 + k1) / 2
            todo_k.extend(((k0, md, dep + 1), (md, k1, dep + 1)))

    print(
        f"PASS certify_regression_sixth: W_M tail={leaves_w} intervals, "
        f"kappa_4 <= {k_cap} (0.1820): {leaves_k} k-intervals, 35000 compact cells + analytic tails"
    )


if __name__ == "__main__":
    main()
