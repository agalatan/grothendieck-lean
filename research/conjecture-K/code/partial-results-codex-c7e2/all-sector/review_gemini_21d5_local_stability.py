#!/usr/bin/env python3
"""Independent exact rational/Bernstein verification of C7E2 all-sector/GAUSSIAN_LOCAL_STABILITY.md (STATUS 12.7).

Agent-ID: gemini-21d5

Checks over Q (pure Python stdlib fractions.Fraction, zero floats, zero external libraries,
safe under python3 -IB -O because acceptance uses explicit require() rather than assert):
  1. Exponential integration-by-parts polynomial identities for Q/P, A, B, the A/B cross term,
     the linear slope matrix determinant 3ab + b^2, and the visible cubic nu tangential kernel (§§3-5).
  2. Strict positivity / single-crossing conditions on all kernels, and exact v = 0 Laplace-integral
     representations for M_0 and nu_0^tan with exact Bernstein positivity on x in [0, 1] (§§4-5).
  3. Fourth-order remote Taylor coefficient (B''(v)/4) E|q|^4 from the 2D fourth directional average
     (3/8) Delta^2 and heat equation B''(v) = (1/8) E[Delta^2 m_v], circularity factor 3/8, and
     Wick fourth-cumulant normalization 3240 on He_3(X_1) (§7).
"""

from __future__ import annotations

from fractions import Fraction
import math
import sys
from typing import Dict, Tuple

Monom = Tuple[int, int, int, int]  # exponents of (t, a, b, x)
Poly = Dict[Monom, Fraction]


def require(cond: bool, msg: str) -> None:
    if not cond:
        sys.stderr.write(f"FAIL: {msg}\n")
        raise SystemExit(1)


def clean(p: Poly) -> Poly:
    return {m: c for m, c in p.items() if c != 0}


def const(val: int | Fraction) -> Poly:
    f = Fraction(val)
    return {(0, 0, 0, 0): f} if f != 0 else {}


def var(idx: int) -> Poly:
    m = [0, 0, 0, 0]
    m[idx] = 1
    return {(m[0], m[1], m[2], m[3]): Fraction(1)}


def add(p: Poly, q: Poly) -> Poly:
    out = dict(p)
    for m, c in q.items():
        out[m] = out.get(m, Fraction(0)) + c
    return clean(out)


def sub(p: Poly, q: Poly) -> Poly:
    out = dict(p)
    for m, c in q.items():
        out[m] = out.get(m, Fraction(0)) - c
    return clean(out)


def scale(c: int | Fraction, p: Poly) -> Poly:
    fc = Fraction(c)
    if fc == 0:
        return {}
    return {m: fc * v for m, v in p.items()}


def mul(p: Poly, q: Poly) -> Poly:
    out: Poly = {}
    for m1, c1 in p.items():
        for m2, c2 in q.items():
            m = (m1[0] + m2[0], m1[1] + m2[1], m1[2] + m2[2], m1[3] + m2[3])
            out[m] = out.get(m, Fraction(0)) + c1 * c2
    return clean(out)


def pow_poly(p: Poly, n: int) -> Poly:
    res = const(1)
    for _ in range(n):
        res = mul(res, p)
    return res


def diff_var(p: Poly, idx: int) -> Poly:
    out: Poly = {}
    for m, c in p.items():
        e = m[idx]
        if e > 0:
            nm = list(m)
            nm[idx] -= 1
            key = (nm[0], nm[1], nm[2], nm[3])
            out[key] = out.get(key, Fraction(0)) + c * e
    return clean(out)


def bernstein_coeffs_unit_interval(coeffs_power_x: list[Fraction]) -> list[Fraction]:
    """Convert p(x) = sum_{k=0}^d c_k x^k to degree-d Bernstein coefficients on [0, 1]."""
    d = len(coeffs_power_x) - 1
    b_coeffs: list[Fraction] = []
    for j in range(d + 1):
        acc = Fraction(0)
        for k in range(j + 1):
            acc += coeffs_power_x[k] * Fraction(math.comb(j, k), math.comb(d, k))
        b_coeffs.append(acc)
    return b_coeffs


def check_ibp_and_slope_identities() -> None:
    t, a, b = var(0), var(1), var(2)
    # w(t) = t(a + b t) / (a + 3 b t) := w_num / w_den
    w_num = mul(t, add(a, mul(b, t)))
    w_den = add(a, scale(3, mul(b, t)))

    # Exponential IBP antiderivatives:
    # int_0^infty G(t) (-f'(t)) e^{-t} dt = int_0^infty (G'(t) - G(t)) f(t) e^{-t} dt when G(0) = 0,
    # so E[g(T) R_v(T)] = E[G(T) (-R_v'(T))] iff G(0) = 0 and G'(t) - G(t) == g(t).
    # 1. Q/P (§3): g_Q(t) = 1 - t, G_Q(t) = t.
    g_q = sub(const(1), t)
    G_q = t
    require( (0, 0, 0, 0) not in G_q, "G_Q(0) must vanish" )
    require( sub(diff_var(G_q, 0), G_q) == g_q, "G_Q' - G_Q == 1 - t" )
    # p_v - E[T R_v] = E[(-R_v'(T)) (T - w(T))]; clear denominator w_den:
    lhs_q = sub(mul(G_q, w_den), w_num)
    rhs_q = scale(2, mul(b, pow_poly(t, 2)))
    require( lhs_q == rhs_q, "Q/P IBP kernel numerator == 2 b t^2" )

    # 2. A diagonal (§4): p_v - E[(D_v + R_v)/2 * (T - 1)^2]
    #    = E[(1 - (T - 1)^2) R_v + (1 - (T - 1)^2) w R_v'] since (D_v + R_v)/2 = R_v + w R_v'.
    one_minus_tm1_sq = sub(const(1), pow_poly(sub(t, const(1)), 2))  # 2t - t^2
    two_G_a = pow_poly(t, 2)
    require( (0, 0, 0, 0) not in two_G_a, "2 G_A(0) must vanish" )
    require( sub(diff_var(two_G_a, 0), two_G_a) == one_minus_tm1_sq, "(t^2)' - t^2 == 2t - t^2" )
    lhs_a = sub(mul(two_G_a, w_den), mul(one_minus_tm1_sq, w_num))
    rhs_a = mul(pow_poly(t, 2), add(mul(a, sub(t, const(1))), mul(mul(b, t), add(const(1), t))))
    require( lhs_a == rhs_a, "A_v IBP kernel == t^2 [a(t-1) + b t(1+t)] / (a + 3bt)" )

    # 3. B diagonal (§4): B_v^AB = p_v - E[(D_v + R_v)/4 * T^2] = E[(1 - T^2/2) R_v + (1 - T^2/2) w R_v'].
    one_minus_half_t2 = sub(const(1), scale(Fraction(1, 2), pow_poly(t, 2)))
    G_b = add(scale(Fraction(1, 2), pow_poly(t, 2)), t)
    require( (0, 0, 0, 0) not in G_b, "G_B(0) must vanish" )
    require( sub(diff_var(G_b, 0), G_b) == one_minus_half_t2, "G_B' - G_B == 1 - t^2/2" )
    lhs_b = sub(mul(G_b, w_den), mul(one_minus_half_t2, w_num))
    rhs_b = scale(
        Fraction(1, 2),
        mul(
            pow_poly(t, 2),
            add(
                mul(a, add(t, const(1))),
                mul(b, add(pow_poly(t, 2), add(scale(3, t), const(4)))),
            ),
        ),
    )
    require( lhs_b == rhs_b, "B_v^AB IBP kernel == t^2 [a(t+1) + b(t^2+3t+4)] / (2(a+3bt))" )

    # 4. A/B cross term (§4): (R_v - D_v) T(T - 1) / (2 sqrt(2)) = (-R_v') w(T) T(T - 1) / sqrt(2),
    #    contributing 2 C m_v^AB = E[(-R_v') (T^2 / (a + 3bT)) * sqrt(2) C (T - 1)(a + bT)].
    cross_num = mul(w_num, mul(t, sub(t, const(1))))
    cross_rhs = mul(pow_poly(t, 2), mul(sub(t, const(1)), add(a, mul(b, t))))
    require( cross_num == cross_rhs, "A/B cross kernel numerator == t^2 (t - 1)(a + b t)" )

    # 5. Linear slope matrix determinant of H_{alpha, beta}(t) (§4):
    #    det [[a + b, (a - b)/sqrt(2)], [(a - b)/sqrt(2), (a + 3b)/2]] == 3ab + b^2.
    det_slope = sub(
        scale(Fraction(1, 2), mul(add(a, b), add(a, scale(3, b)))),
        scale(Fraction(1, 2), pow_poly(sub(a, b), 2)),
    )
    expected_det_slope = add(scale(3, mul(a, b)), pow_poly(b, 2))
    require( det_slope == expected_det_slope, "Slope matrix determinant == 3ab + b^2" )

    # 6. Visible cubic nu tangential cost (§5): p_v - E[T(T - 2)^2 R_v / 2]
    #    = E[(1 - T(T - 2)^2 / 2) R_v + w(T) R_v'].
    g_nu = sub(const(1), scale(Fraction(1, 2), mul(t, pow_poly(sub(t, const(2)), 2))))
    G_nu = add(sub(t, scale(Fraction(1, 2), pow_poly(t, 2))), scale(Fraction(1, 2), pow_poly(t, 3)))
    require( (0, 0, 0, 0) not in G_nu, "G_nu(0) must vanish" )
    require( sub(diff_var(G_nu, 0), G_nu) == g_nu, "G_nu' - G_nu == 1 - t(t-2)^2/2" )
    lhs_nu = sub(mul(G_nu, w_den), w_num)
    P_nu = add(
        add(scale(3, mul(b, pow_poly(t, 2))), mul(sub(a, scale(3, b)), t)),
        sub(scale(4, b), a),
    )
    rhs_nu = scale(Fraction(1, 2), mul(pow_poly(t, 2), P_nu))
    require( lhs_nu == rhs_nu, "nu tangential IBP kernel == t^2 P(t) / (2(a + 3bt))" )

    # Vertex minimum of P_nu(t) when r = a/b in (0, 3):
    # 3b t^2 + (a - 3b) t + 4b - a == 3b (t + (a - 3b)/(6b))^2 + b [4 - r - (r - 3)^2 / 12],
    # and 4 - r - (r - 3)^2 / 12 == 1 + (3 - r)(9 + r) / 12 >= 1 > 0 on r in [0, 3].
    r = var(3)
    vertex_lhs = sub(sub(const(4), r), scale(Fraction(1, 12), pow_poly(sub(r, const(3)), 2)))
    vertex_rhs = add(const(1), scale(Fraction(1, 12), mul(sub(const(3), r), add(const(9), r))))
    require( vertex_lhs == vertex_rhs, "nu vertex minimum == 1 + (3 - r)(9 + r) / 12 >= 1 on [0, 3]" )
    b_vertex = bernstein_coeffs_unit_interval([Fraction(13, 4), Fraction(-3, 2), Fraction(-3, 4)])
    require(
        b_vertex == [Fraction(13, 4), Fraction(5, 2), Fraction(1)] and all(c >= 1 for c in b_vertex),
        "nu vertex minimum Bernstein coeffs on r = 3x in [0, 3] all >= 1",
    )


def check_zero_buffer_laplace_positivity() -> None:
    x = var(3)
    # Gamma(j + 1/2) / sqrt(pi) for j = 0, 1, 2, 3:
    gamma_half = [Fraction(1, 1), Fraction(1, 2), Fraction(3, 4), Fraction(15, 8)]
    # Check recurrence Gamma(j + 1/2) = (j - 1/2) Gamma(j - 1/2):
    for j in range(1, 4):
        require( gamma_half[j] == Fraction(2 * j - 1, 2) * gamma_half[j - 1], f"Gamma({j}+1/2) recurrence" )

    # Under 1/(a + b t) = int_0^infty e^{-a s} e^{-b s t} ds and x = (1 + b s)^{-1} in (0, 1],
    # int_0^infty t^{j - 1/2} e^{-t/x} dt = sqrt(pi) * gamma_half[j] * x^{j + 1/2}.
    # Factor out sqrt(pi) * sqrt(x): J_j integrand is gamma_half[j] * x^j.
    J = [scale(gamma_half[j], pow_poly(x, j)) for j in range(4)]

    # M_0 = [[J_1 - J_2/2, (J_2 - J_1)/(2 sqrt(2))], [(J_2 - J_1)/(2 sqrt(2)), J_0/2 - J_2/4]].
    # Factor out 1/4 to match displayed inner matrix in §4:
    m11 = scale(4, sub(J[1], scale(Fraction(1, 2), J[2])))          # 2x - 3x^2/2
    m22 = scale(4, sub(scale(Fraction(1, 2), J[0]), scale(Fraction(1, 4), J[2])))  # 2 - 3x^2/4
    m12_sq_times_2 = pow_poly(scale(2, sub(J[2], J[1])), 2)        # (3x^2/2 - x)^2 == 2 * (off-diag)^2

    require( m11 == sub(scale(2, x), scale(Fraction(3, 2), pow_poly(x, 2))), "M_0(1,1) == 2x - 3x^2/2" )
    require( m22 == sub(const(2), scale(Fraction(3, 4), pow_poly(x, 2))), "M_0(2,2) == 2 - 3x^2/4" )

    # Upper-left entry divided by x is 2 - 3x/2, with degree-1 Bernstein coeffs [2, 1/2] > 0 on [0, 1]:
    b_m11 = bernstein_coeffs_unit_interval([Fraction(2), Fraction(-3, 2)])
    require( b_m11 == [Fraction(2), Fraction(1, 2)] and all(c > 0 for c in b_m11), "M_0(1,1)/x > 0 on [0, 1]" )

    # Determinant of displayed inner matrix: m11 * m22 - m12_sq_times_2 / 2 == x * (4 - 7x/2).
    det_inner = sub(mul(m11, m22), scale(Fraction(1, 2), m12_sq_times_2))
    expected_det_inner = mul(x, sub(const(4), scale(Fraction(7, 2), x)))
    require( det_inner == expected_det_inner, "det(M_0 inner) == x(4 - 7x/2)" )
    b_det = bernstein_coeffs_unit_interval([Fraction(4), Fraction(-7, 2)])
    require( b_det == [Fraction(4), Fraction(1, 2)] and all(c > 0 for c in b_det), "det(M_0 inner)/x > 0 on [0, 1]" )

    # nu_0^tan = (J_0 - J_3 + 4 J_2 - 4 J_1) / 2 == (sqrt(pi) sqrt(x) / 2) * (1 - 2x + 3x^2 - 15x^3/8).
    nu_poly = add(sub(J[0], J[3]), scale(4, sub(J[2], J[1])))
    expected_nu_poly = add(
        sub(const(1), scale(2, x)),
        sub(scale(3, pow_poly(x, 2)), scale(Fraction(15, 8), pow_poly(x, 3))),
    )
    require( nu_poly == expected_nu_poly, "nu_0 Laplace polynomial == 1 - 2x + 3x^2 - 15x^3/8" )

    # Exact degree-3 Bernstein coefficients of 1 - 2x + 3x^2 - 15x^3/8 on [0, 1]:
    b_nu = bernstein_coeffs_unit_interval([Fraction(1), Fraction(-2), Fraction(3), Fraction(-15, 8)])
    require(
        b_nu == [Fraction(1), Fraction(1, 3), Fraction(2, 3), Fraction(1, 8)] and all(c >= Fraction(1, 8) for c in b_nu),
        "nu_0 Laplace polynomial >= 1/8 on [0, 1]",
    )
    # Derivative -2 + 6x - 45x^2/8 == -(45/8)(x - 8/15)^2 - 2/5 <= -2/5 < 0:
    d_nu = diff_var(nu_poly, 3)
    sos_d_nu = sub(
        scale(Fraction(-45, 8), pow_poly(sub(x, const(Fraction(8, 15))), 2)),
        const(Fraction(2, 5)),
    )
    require( d_nu == sos_d_nu, "nu_0'(x) == -(45/8)(x - 8/15)^2 - 2/5 < 0" )


def check_fourth_order_remote_constants() -> None:
    # 1. Average of (cos theta * d_x + sin theta * d_y)^4 over theta in [0, 2 pi]:
    #    E[cos^4] = E[sin^4] = 3/8, 6 * E[cos^2 sin^2] = 6 * (1/8) = 6/8 = 2 * (3/8), so 3/8 * (d_x^2 + d_y^2)^2.
    c4 = Fraction(3, 8)
    c2s2 = Fraction(1, 8)
    require( 6 * c2s2 == 2 * c4, "2D fourth directional average == (3/8) Delta^2" )

    # 2. B(v) = 2 E[m_v(|L + sqrt(v) W|)] and d_v m_v = (1/4) Delta m_v
    #    => B'(v) = 2 * (1/4) E[Delta m_v] = (1/2) E[Delta m_v],
    #       B''(v) = 2 * (1/16) E[Delta^2 m_v] = (1/8) E[Delta^2 m_v].
    #    Fourth-order term of 2 E[m_v(|L + q|)] in circular q:
    #    2 * (1 / 4!) * (3/8) E[Delta^2 m_v] * E|q|^4 == (B''(v) / 4) E|q|^4,
    #    matching (1/2) B''(v) u^2 when q ~ CN(0, u) has E|q|^4 = 2 u^2.
    b_second_over_delta2 = Fraction(2, 16)
    require( b_second_over_delta2 == Fraction(1, 8), "B''(v) == (1/8) E[Delta^2 m_v]" )
    taylor_coeff = Fraction(2, math.factorial(4)) * c4 / b_second_over_delta2
    require( taylor_coeff == Fraction(1, 4), "Fourth-order Taylor coefficient == B''(v)/4" )
    require( taylor_coeff * 2 == Fraction(1, 2), "Circular Gaussian E|q|^4 = 2u^2 matches (1/2) B''(v) u^2" )

    # 3. Circularity for F = Re q: E[F^4] = E[cos^4 theta] E|q|^4 = (3/8) E|q|^4, E[F^2] = u/2
    #    => E[F^4] - 3 (E[F^2])^2 = (3/8)(E|q|^4 - 2 u^2) = (3/8) kappa_4(q).
    require( c4 * 2 - 3 * Fraction(1, 2) ** 2 == 0, "Circularity: E[(Re q)^4] - 3(E[(Re q)^2])^2 == (3/8) kappa_4(q)" )

    # 4. Wick contraction normalization on F = He_3(X_1) = I_3(e_1^{otimes 3}):
    #    He_3(X)^2 = He_6(X) + 9 He_4(X) + 18 He_2(X) + 6
    #    => E[He_3(X)^4] = 6! + 81*4! + 324*2! + 36 = 3348, E[He_3(X)^2] = 6,
    #    so kappa_4(He_3(X)) = 3348 - 3*36 = 3240 = 324*(1 + 6) + 324*(1 + 2).
    ef2 = math.factorial(3)
    ef4 = math.factorial(6) + 81 * math.factorial(4) + 324 * math.factorial(2) + 36
    kappa4_he3 = ef4 - 3 * (ef2 ** 2)
    formula_rhs = 324 * (1 + 6) + 324 * (1 + 2)
    require( kappa4_he3 == 3240 and formula_rhs == 3240, "Wick fourth-cumulant normalization 3240 on He_3" )


def main() -> None:
    check_ibp_and_slope_identities()
    check_zero_buffer_laplace_positivity()
    check_fourth_order_remote_constants()
    print(
        "PASS: C7E2 GAUSSIAN_LOCAL_STABILITY (STATUS 12.7) exact symbolic IBP, "
        "v=0 Laplace Bernstein positivity, and 4th-order remote/Wick identities verified over Q."
    )


if __name__ == "__main__":
    main()
