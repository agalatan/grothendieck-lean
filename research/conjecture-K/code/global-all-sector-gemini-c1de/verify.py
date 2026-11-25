#!/usr/bin/env python3
"""Exact rational audit and replay verifier for Global All-Sector Closure F_joint(c*) <= 0 (#436).

Agent-ID: gemini-c1de. Refs #436, #177.
Python 3 standard library only (`python3 -I`, assertions required). Verifies:
  1. Peak row exact rationals, Q_0 > (1/3) I_2, global phase-invariant odd shift
     c* = -(7/25) nu and zero-mean compensating form C_inv(Q, nu) = -(6801/18910) Re(Q conj(nu)),
     giving off-diagonal k_comp = -11/20 and d_nu = 3422717/2363750, exact Sylvester PSD of
     B_odd - (50/61) I_6 > 0, and amplitude exterior cutoff S_r >= 25/16
     ((25/16 - 3/4)*(25/16) = 325/256 > 61/50).
  2. Exact zero-float symbolic proofs of:
     - C_0 potential psi(r, q) = q^2/(mu*(mu+r)^2) = 2*mu - 2*r - q/mu,
       -psi'(r) = q^2*(2*mu+r)/(mu^3*(mu+r)^2) > 0, psi''(r) = 3*q^2/mu^5 > 0.
     - Lemma L1 (||D_X A(X, q)[h]||_op <= 1/mu^2): exact 2D Bernstein certificates.
     - Lemma L2 (mu^3 D_X^2 A(X, q)[h, h] <= 2 I_2): exact 2D Bernstein certificates.
     - Exact rational w >= 8 analytic shift exterior for BOTH even (< 3/2 < 97/3)
       and odd (1/4 + 1/3 = 7/12 < 50/61 < lambda_min(B_odd)) sectors.
     - Exact rational r >= 24/30 even & odd tail bounds and T >= 25 base curvature tail.
  3. Part 1 (Potential exteriors on [0, 8]): exact contiguity and exact rational
     Sylvester PSD of Q_0 + shift*I_2 - P_re/P_im on [0, 11/8] (S_r >= 3/4) and
     [11/8, 8] (w >= 11/8), plus B_3 - O_iso > 0 on [11/8, 8].
  4. Part 2 (Hybrid local-pullback + Theorem 2(b) origin strip on [0, 11/8]):
     exact contiguity, positive s_odd/delta/eps_cs, exact rational Sylvester PSD
     of B_3 - M_re > 0 and B_3 - M_im > 0 on every slab.
  5. Part 3 (4D adaptive all-sector bulk cover on [0, 11/8] via 5D convexity-semiconvexity
     point-corner theorem and flat-quartic convex combination): exact contiguity,
     inner handoff s_odd_p3 <= s_odd_p2, positive curvature bounds, open_boxes == 0,
     worst_margin < 0, min_odd_piv > 0, and exact leaf count consistency.
  6. Unconditional six-sector corollary on u <= 0.0463, u + V <= 0.080051:
     Lambda_hat(G) < S + 4936/10^8 = S + 49.36e-6 < S + 99e-6.
  7. Optional `--replay-cpp`: recompiles certify_all_sector.cpp with
     -O2 -ffp-contract=off -frounding-math -std=c++17 -pthread -Wall -Wextra -Werror,
     runs `--control-false-hotspot`, generates a temporary receipt, audits it,
     and compares exact-for-exact against committed `result.json` (pass `--update-result`
     alongside `--replay-cpp` to overwrite `result.json`).
"""
import argparse
import hashlib
import json
import subprocess
import tempfile
from fractions import Fraction as F
from math import comb
from pathlib import Path

if not __debug__:
    raise RuntimeError("Run without -O so all assertions execute")

# Peak row exact rational constants (STATUS 7.4.10, 7.5.6)
A = F(699, 1250)
B = F(179, 1250)
P = F(2500, 1891)
RHO0 = F(5053, 10000)
C1 = F(3, 5) * RHO0  # 15159/50000
D_SHIFT = F(2, 5)
P_MINUS = P - F(463, 5000)
QA0 = P_MINUS - F(67, 100) - F(2, 25) * RHO0**2
QB0 = P_MINUS - F(67, 100) * RHO0**2 - F(2, 25)
QAB0 = (F(2, 25) - F(67, 100)) * RHO0

# Global U(1)-invariant odd shift & zero-mean compensating form
ALPHA_NU = F(-7, 25)
K_COMP = F(-11, 20)
D_NU = P + 2 * K_COMP * ALPHA_NU - (P + 1) * ALPHA_NU**2


def parse_hex(s: str) -> F:
    """Exact conversion of IEEE-754 hexfloat (or decimal/rational) to Fraction."""
    s = s.strip()
    if s.startswith(("0x", "-0x", "+0x", "0X", "-0X", "+0X")):
        return F(float.fromhex(s))
    return F(s)


def exp_neg_upper(x: F, deg: int = 44) -> F:
    """Exact rational upper bound for exp(-x) = 1/exp(x) via truncated Taylor sum of exp(x)."""
    assert x >= 0
    s = F(0)
    term = F(1)
    for k in range(deg + 1):
        if k > 0:
            term = term * x / k
        s += term
    return F(1) / s


def poly_add(p: dict, q: dict) -> dict:
    out = dict(p)
    for k, v in q.items():
        out[k] = out.get(k, F(0)) + v
    return {k: v for k, v in out.items() if v != 0}


def poly_sub(p: dict, q: dict) -> dict:
    return poly_add(p, {k: -v for k, v in q.items()})


def poly_mul(p: dict, q: dict) -> dict:
    out: dict = {}
    for (i1, j1), v1 in p.items():
        for (i2, j2), v2 in q.items():
            k = (i1 + i2, j1 + j2)
            out[k] = out.get(k, F(0)) + v1 * v2
    return {k: v for k, v in out.items() if v != 0}


def bernstein_2d_min(poly: dict, dx: int, dy: int) -> F:
    """Minimum exact rational 2D Bernstein coefficient of poly on [0, 1]^2 at degree (dx, dy)."""
    mn = None
    for p in range(dx + 1):
        for q in range(dy + 1):
            val = F(0)
            for (i, j), a in poly.items():
                if i <= p and j <= q:
                    val += a * F(comb(p, i), comb(dx, i)) * F(comb(q, j), comb(dy, j))
            mn = val if mn is None else min(mn, val)
    assert mn is not None
    return mn


def check_psd_minus_interval_sym2(sym: dict, shift: F) -> F:
    """Exact rational Sylvester proof that Q_0 + shift * I_2 - M > 0 for every M in box."""
    a00_l, a00_h = parse_hex(sym["a00"][0]), parse_hex(sym["a00"][1])
    a01_l, a01_h = parse_hex(sym["a01"][0]), parse_hex(sym["a01"][1])
    a11_l, a11_h = parse_hex(sym["a11"][0]), parse_hex(sym["a11"][1])
    assert a00_l <= a00_h and a01_l <= a01_h and a11_l <= a11_h
    d00 = QA0 + shift - a00_h
    d11 = QB0 + shift - a11_h
    d01_abs = max(abs(QAB0 - a01_l), abs(QAB0 - a01_h))
    assert d00 > 0, f"Even d00 <= 0: {float(d00)}"
    assert d11 > 0, f"Even d11 <= 0: {float(d11)}"
    det = d00 * d11 - d01_abs**2
    assert det > 0, f"Even det <= 0: {float(det)}"
    return det


def check_b3_minus_interval_sym3(arr: list) -> F:
    """Exact rational Sylvester proof that B_3 - M > 0 for every symmetric 3x3 M in box.

    By monotonicity of det(B_3 - M) in the diagonal entries and convexity of the symmetric
    interval box (its extreme points are the 8 sign choices of off-diagonal endpoints
    {e1, e2, e4} with diagonal entries at their upper bounds {e0_h, e3_h, e5_h}),
    B_3 - M > 0 on the entire interval box iff all 8 corner matrices are strictly PD!
    """
    assert isinstance(arr, list) and len(arr) == 6
    lo = [parse_hex(arr[k][0]) for k in range(6)]
    hi = [parse_hex(arr[k][1]) for k in range(6)]
    for k in range(6):
        assert lo[k] <= hi[k], f"Invalid interval at entry {k}"
    # Worst-case diagonal entries of D = B_3 - M:
    d00 = P - hi[0]
    d11 = P - hi[3]
    d22 = D_NU - hi[5]
    assert d00 > 0 and d11 > 0 and d22 > 0, f"Odd diagonal non-positive: {(float(d00), float(d11), float(d22))}"

    # Off-diagonal endpoint sets for D01 = -M01, D02 = K_COMP - M02, D12 = -M12:
    c01 = (-lo[1], -hi[1])
    c02 = (K_COMP - lo[2], K_COMP - hi[2])
    c12 = (-lo[4], -hi[4])
    min_det3 = None
    for d01 in c01:
        m2 = d00 * d11 - d01 * d01
        assert m2 > 0, f"Odd 2x2 minor <= 0: {float(m2)}"
        for d02 in c02:
            for d12 in c12:
                det3 = (
                    d00 * (d11 * d22 - d12 * d12)
                    - d01 * (d01 * d22 - d12 * d02)
                    + d02 * (d01 * d12 - d11 * d02)
                )
                assert det3 > 0, f"Odd 3x3 det <= 0: {float(det3)}"
                min_det3 = det3 if min_det3 is None else min(min_det3, det3)
    assert min_det3 is not None
    return min_det3


def check_bernstein_lemmas():
    """Exact zero-float 2D Bernstein proofs of Lemma L1 (C1 = 1) and Lemma L2 (C2 = 2)."""
    P1 = {(0, 0): F(1)}
    Px = {(1, 0): F(1)}
    Py = {(0, 1): F(1)}
    u = {(0, 0): F(1), (1, 0): F(1)}  # 1 + x
    u2 = poly_mul(u, u)
    u3 = poly_mul(u2, u)
    u4 = poly_mul(u2, u2)

    # Lemma L1: ||mu^2 D_X A(X, q)[h]||_op <= 1 for all X in R^2, q > 0, |h| = 1.
    # At X = (r, 0), h = (c, s), x = r^2/mu^2 in [0, 1], y = c^2 in [0, 1]:
    #   M1 = -sqrt(x) * [[(3-x)/(1+x)^2 c, 1/(1+x) s], [1/(1+x) s, c]].
    # Need: (1) |M00| <= 1 <=> (1+x)^4 - x*(3-x)^2 >= 0 on [0, 1];
    #       (2) 1 + det(M1) >= 0 <=> (1+x)^2 + x*((4-x)y - 1) >= 0 on [0, 1]^2;
    #       (3) (1 + det(M1))^2 - (tr M1)^2 >= 0 on [0, 1]^2.
    p3mx = {(0, 0): F(3), (1, 0): F(-1)}
    p4mx = {(0, 0): F(4), (1, 0): F(-1)}
    l1_a = poly_sub(u4, poly_mul(Px, poly_mul(p3mx, p3mx)))
    l1_1pdet = poly_add(u2, poly_mul(Px, poly_sub(poly_mul(p4mx, Py), P1)))
    tr_fac = poly_add(p3mx, u2)  # 4 + x + x^2
    l1_c = poly_sub(poly_mul(l1_1pdet, l1_1pdet), poly_mul(Px, poly_mul(poly_mul(tr_fac, tr_fac), Py)))
    assert bernstein_2d_min(l1_a, 6, 0) > 0, "Lemma L1a Bernstein check failed"
    assert bernstein_2d_min(l1_1pdet, 2, 1) >= 1, "Lemma L1 (1+det) Bernstein check failed"
    assert bernstein_2d_min(l1_c, 6, 2) >= 0, "Lemma L1c Bernstein check failed"

    # Lemma L2: mu^3 D_X^2 A(X, q)[h, h] <= 2 I_2 <=> H = 2 I_2 - mu^3 D_X^2 A[h,h] >= 0.
    # Exact cleared-denominator numerators H00 = u^3*(2 - A00), H11 = u^3*(2 - A11),
    # DET = H00*H11 - 4*y*(1-y)*u^2*(1 - 4*x - x^2)^2 on (x, y) in [0, 1]^2:
    p3xy_m1 = {(1, 1): F(3), (0, 0): F(-1)}
    g2_u3 = poly_add(
        poly_add(
            poly_mul({(1, 1): F(3, 2), (0, 0): F(-1, 2)}, u2),
            poly_mul({(1, 1): F(4), (0, 0): F(-2)}, u),
        ),
        {(1, 1): F(16)},
    )
    u_p4 = {(0, 0): F(5), (1, 0): F(1)}
    a00_u3 = poly_sub(
        poly_add(
            poly_sub(poly_mul(p3xy_m1, u3), poly_mul({(1, 0): F(2)}, g2_u3)),
            poly_mul({(1, 1): F(4)}, poly_mul(u_p4, u)),
        ),
        poly_mul({(0, 1): F(2)}, u2),
    )
    a11_u3 = poly_sub(poly_mul(p3xy_m1, u3), poly_mul({(0, 0): F(2), (0, 1): F(-2)}, u2))
    h00 = poly_sub(poly_mul({(0, 0): F(2)}, u3), a00_u3)
    h11 = poly_sub(poly_mul({(0, 0): F(2)}, u3), a11_u3)
    p_off = {(0, 0): F(1), (1, 0): F(-4), (2, 0): F(-1)}
    h01_sq = poly_mul(poly_mul({(0, 1): F(4), (0, 2): F(-4)}, u2), poly_mul(p_off, p_off))
    det_l2 = poly_sub(poly_mul(h00, h11), h01_sq)
    assert bernstein_2d_min(h00, 6, 2) > 0, "Lemma L2 H00 Bernstein check failed"
    assert bernstein_2d_min(h11, 6, 2) >= 0, "Lemma L2 H11 Bernstein check failed"
    assert bernstein_2d_min(det_l2, 8, 4) >= 0, "Lemma L2 DET Bernstein check failed"

    # Exact polynomial check of C0 potential psi(r, q) = q^2/(mu*(mu+r)^2) = 2*mu - 2*r - q/mu
    # with q = mu^2 - r^2:
    #   (1) (2*mu - 2*r)*mu - (mu^2 - r^2) == (mu - r)^2 and ((mu-r)*(mu+r))^2 == (mu^2 - r^2)^2
    #   (2) -psi'(r)*mu^3*(mu+r)^2 == (mu^2 - r^2)^2 * (2*mu + r):
    #       LHS = (2*mu^3 - 2*r*mu^2 - r*(mu^2 - r^2)) * (mu+r)^2
    #   (3) psi''(r)*mu^5 == 3*(mu^2 - r^2)^2:
    #       LHS = (2*mu^2*(mu^2 - r^2) + (mu^2 - r^2)*(mu^2 - 3*r^2)) = 3*(mu^2 - r^2)^2
    Pr = {(1, 0): F(1)}
    Pm = {(0, 1): F(1)}
    Pq = poly_sub(poly_mul(Pm, Pm), poly_mul(Pr, Pr))  # mu^2 - r^2
    Pm_m_r = poly_sub(Pm, Pr)
    Pm_p_r = poly_add(Pm, Pr)
    assert poly_sub(poly_mul(poly_mul(Pm_m_r, Pm_p_r), poly_mul(Pm_m_r, Pm_p_r)), poly_mul(Pq, Pq)) == {}
    assert poly_sub(poly_sub(poly_mul({(0, 1): F(2)}, Pm_m_r), Pq), poly_mul(Pm_m_r, Pm_m_r)) == {}
    lhs_d1 = poly_mul(
        poly_sub(
            poly_sub(poly_mul({(0, 3): F(2)}, P1), poly_mul({(1, 2): F(2)}, P1)),
            poly_mul(Pr, Pq),
        ),
        poly_mul(Pm_p_r, Pm_p_r),
    )
    rhs_d1 = poly_mul(poly_mul(Pq, Pq), poly_add(poly_mul({(0, 1): F(2)}, P1), Pr))
    assert poly_sub(lhs_d1, rhs_d1) == {}, "psi'(r) identity failed"
    lhs_d2 = poly_add(
        poly_mul(poly_mul({(0, 2): F(2)}, P1), Pq),
        poly_mul(Pq, poly_sub(poly_mul(Pm, Pm), poly_mul({(2, 0): F(3)}, P1))),
    )
    rhs_d2 = poly_mul({(0, 0): F(3)}, poly_mul(Pq, Pq))
    assert poly_sub(lhs_d2, rhs_d2) == {}, "psi''(r) identity failed"


def check_exact_analytic_foundations() -> dict:
    """Verify all exact zero-float algebraic, Bernstein, tail, and w >= 8 exterior theorems."""
    # 1. Even quadratic Q_0 > (1/3) I_2
    assert QA0 > F(1, 3) and QB0 > F(1, 3)
    assert (QA0 - F(1, 3)) * (QB0 - F(1, 3)) > QAB0**2

    # 2. Odd budget B_odd: exact gamma, d_nu, lambda_min(B_odd) > 50/61, amplitude exterior S_r >= 25/16
    gamma = K_COMP - P * ALPHA_NU
    assert gamma == F(-6801, 37820)
    assert P + (P - 1) * ALPHA_NU**2 + 2 * gamma * ALPHA_NU == D_NU
    assert D_NU == F(3422717, 2363750)
    lam_lo = F(50, 61)
    assert P > lam_lo and D_NU > lam_lo
    assert (P - lam_lo) * (D_NU - lam_lo) > K_COMP**2
    S_ext = F(25, 16)
    assert (S_ext - F(3, 4)) * S_ext == F(325, 256)
    assert F(325, 256) > F(61, 50)

    # 3. Exact 2D Bernstein proofs of Lemmas L1, L2 and C0 psi(r, q) calculus
    check_bernstein_lemmas()

    # 4. Linear envelope M(T) = 503/1000 + (613/500)T >= sqrt((T-2/5)^2 + (c1 + T/sqrt2)^2)
    s2_lo = F(1414213, 1000000)
    s2_hi = F(1414214, 1000000)
    assert s2_lo**2 < 2 < s2_hi**2
    inv_s2_hi = F(1) / s2_lo
    m0, m1 = F(503, 1000), F(613, 500)
    assert m0**2 > D_SHIFT**2 + C1**2
    assert m1**2 > F(3, 2)
    assert 2 * m0 * m1 > 2 * C1 * inv_s2_hi - 2 * D_SHIFT

    # 5. Exact r >= 24 (w <= 2) and r >= 30 (w <= 8) tails: T > 25 since H(25) < 22^2
    H25 = F(25) * (A + F(25) * B) ** 2
    assert H25 < F(22) ** 2
    assert F(1, 2) * F(25) ** 2 + (F(4, 5) - s2_hi * C1) * F(25) - (D_SHIFT**2 + C1**2) > 0
    e25_hi = exp_neg_upper(F(25))
    even_tail_24 = F(1354, 24) * e25_hi
    assert even_tail_24 < F(1, 10**9)
    # Odd tail on T >= 25: G_iso <= (1/2) T^3 I_6 (since T^3/2 - T*(1 + (T-2)^2/2) = T*(2T-3) > 0 for T >= 2),
    # and (1/2) Gamma(4, 25) = (1/2)*(25^3 + 3*25^2 + 6*25 + 6) e^{-25} = 8828 e^{-25}:
    odd_tail_24 = F(8828, 24) * e25_hi
    assert odd_tail_24 < F(1, 10**8)
    # Also check Part 2 tail_eta_ub: on T >= 25 and w <= 11/8, |L+w| >= b*T^{3/2} since a/5 - (11/8)/125 > 0,
    # and M_K(T) <= (5/4)*T, so MK(T)*s/|L+w| <= (5/4)/(5*b) * s < 2*s:
    assert A / F(5) - F(11, 8) / F(125) > 0
    assert m0 + m1 * F(25) <= F(5, 4) * F(25)
    assert F(5, 4) / (F(5) * B) < F(2)

    # 6. Exact rational analytic shift exterior for ALL w >= 8 (BOTH even AND odd!):
    H6 = F(6) * (A + F(6) * B) ** 2
    assert H6 < F(16)
    e6_hi = exp_neg_upper(F(6))
    denom6 = (A + F(6) * B) * (A + F(18) * B)
    # 6a. Even w >= 8: Region 1 (|L|<=4) + Region 2 (T>6, |h_E|^2 <= 3 T^2) < 3/2 < 1/3 + 32 = 97/3
    reg1_even = F(1, 4) * (F(84, 25) + 2 * C1**2)
    assert reg1_even < F(9, 10)
    assert 2 * C1**2 < F(6) ** 2
    m0_even = F(150) * e6_hi
    M0_even = F(108) * e6_hi / denom6
    assert 4 * M0_even * m0_even < F(1, 9)  # 2*sqrt(M0*m0) < 1/3
    even_w8_ub = reg1_even + F(1, 3)
    assert even_w8_ub < F(3, 2) < F(1, 3) + F(32)

    # 6b. Odd w >= 8: Region 1 (|L|<=4 => 1/|L+w| <= 1/4, E[G_iso] = I_6 => <= (1/4) I_6)
    #   + Region 2 (T>6, G_iso <= (1/2) T^3 I_6 => mass m0 = (1/2) Gamma(4,6) = 183 e^{-6},
    #     density M0 = 108 e^{-6}/((a+6b)(a+18b)), 4*M0*m0 < 1/9 => layer-cake < 1/3)!
    #   Total O_iso(w) <= (1/4 + 1/3) I_6 = (7/12) I_6 < (50/61) I_6 < B_odd!
    assert F(1, 2) * (6**3 + 3 * 6**2 + 6 * 6 + 6) == F(183)
    assert F(1, 2) * 6**3 == F(108)
    m0_odd = F(183) * e6_hi
    M0_odd = F(108) * e6_hi / denom6
    assert 4 * M0_odd * m0_odd < F(1, 9)  # 2*sqrt(M0*m0) < 1/3
    odd_w8_ub = F(1, 4) + F(1, 3)
    assert odd_w8_ub == F(7, 12) < lam_lo

    # 7. Base curvature T >= 25 tail inequality (matches 7.4.16)
    q_c = F(5, 2)
    m25 = F(27, 25)
    t25 = F(25)
    assert 1 + B / (A + t25 * B) + 3 * B / (A + 3 * t25 * B) <= m25
    assert F(17) * s2_hi / F(3) < F(9)
    assert F(5) * s2_hi / F(3) < q_c
    coeff25 = (
        F(9) / t25**2
        + F(4) * m25 * q_c / (F(3) * t25)
        + ((m25**2 + F(2) / t25**2) * F(4) / (F(9) * t25) + F(2) * m25 / (F(3) * t25**2)) * (F(5, 4) * t25)
    )
    assert coeff25 < 2

    # 8. Unconditional six-sector peak-row corollary (via 7.5.6 + 7.5.3 + 3.3/3.14):
    #    E[F_joint(c*)] <= 0  =>  Lambda_hat(G) < S + 49e-6 + 0.36e-6 = S + 4936/10^8!
    assert F(49, 10**6) + F(36, 10**8) == F(4936, 10**8) < F(99, 10**6)

    return {
        "d_nu": f"{D_NU.numerator}/{D_NU.denominator}",
        "even_tail_24_ub": float(even_tail_24),
        "odd_tail_24_ub": float(odd_tail_24),
        "even_w8_ub": float(even_w8_ub),
        "odd_w8_ub": f"{odd_w8_ub.numerator}/{odd_w8_ub.denominator}",
        "odd_w8_layercake_4M0m0": float(4 * M0_odd * m0_odd),
    }


def verify_contiguous(slabs: list, start: F, end: F):
    """Verify exact contiguous partition of [start, end] with no gaps or overlaps."""
    assert len(slabs) > 0
    cur = start
    for sl in slabs:
        wl, wh = parse_hex(sl["wl"]), parse_hex(sl["wh"])
        assert wl == cur, f"Discontinuity: expected {cur}, got {wl}"
        assert wh > wl, f"Non-positive slab width: {wl}..{wh}"
        cur = wh
    assert cur == end, f"Did not reach {end}: ended at {cur}"


def min_s_odd_on_interval(p2_slabs: list, wl: F, wh: F) -> F:
    """Minimum certified s_odd(w) over all Part 2 slabs overlapping (wl, wh)."""
    vals = []
    for s in p2_slabs:
        owl, owh = parse_hex(s["wl"]), parse_hex(s["wh"])
        if owh > wl and owl < wh:
            vals.append(parse_hex(s["s_odd"]))
    assert len(vals) > 0, f"No Part 2 slab covers [{wl}, {wh}]"
    return min(vals)


def verify_all(data: dict) -> dict:
    assert data.get("format") == "global-all-sector-v1"
    assert data.get("self_tests_passed") is True
    w_ext = parse_hex(data["shift_exterior_cutoff"])
    w_tail = parse_hex(data["analytic_tail_cutoff"])
    S_ext = parse_hex(data["amplitude_exterior_S_min"])
    assert w_ext == F(11, 8) and w_tail == F(8) and S_ext == F(25, 16)

    foundations = check_exact_analytic_foundations()

    # Part 1: Potential exteriors on [0, 8]
    p1 = data["part1_potential_slabs"]
    p1_amp = [s for s in p1 if not s["shift_ext"]]
    p1_sh = [s for s in p1 if s["shift_ext"]]
    verify_contiguous(p1_amp, F(0), w_ext)
    verify_contiguous(p1_sh, w_ext, w_tail)
    for s in p1_amp:
        wl = parse_hex(s["wl"])
        shift = wl**2 / 2 + F(3, 4)
        check_psd_minus_interval_sym2(s["P_re"], shift)
        check_psd_minus_interval_sym2(s["P_im"], shift)
    for s in p1_sh:
        wl = parse_hex(s["wl"])
        shift = wl**2 / 2
        check_psd_minus_interval_sym2(s["P_re"], shift)
        check_psd_minus_interval_sym2(s["P_im"], shift)
        assert "O_iso" in s, f"Missing O_iso on shift exterior slab {wl}"
        check_b3_minus_interval_sym3(s["O_iso"])

    # Part 2: Hybrid origin strip on [0, 11/8]
    p2 = data["part2_origin_strip"]
    verify_contiguous(p2, F(0), w_ext)
    min_p2_det3 = None
    for s in p2:
        assert parse_hex(s["s_odd"]) > 0
        assert parse_hex(s["delta"]) > 0
        assert parse_hex(s["eps_cs"]) > 0
        d_re = check_b3_minus_interval_sym3(s["M_re"])
        d_im = check_b3_minus_interval_sym3(s["M_im"])
        d_min = min(d_re, d_im)
        min_p2_det3 = d_min if min_p2_det3 is None else min(min_p2_det3, d_min)

    # Part 3: 4D adaptive bulk cover on [0, 11/8]
    p3 = data["part3_bulk_4d"]
    verify_contiguous(p3, F(0), w_ext)
    tot_4d = 0
    worst_m = None
    min_piv = None
    for s in p3:
        wl, wh = parse_hex(s["wl"]), parse_hex(s["wh"])
        assert s["open_boxes"] == 0, f"Part 3 open boxes on [{wl}, {wh}]"
        wm = parse_hex(s["worst_margin"])
        mp = parse_hex(s["min_odd_piv"])
        assert wm < 0, f"Part 3 non-negative margin {wm} on [{wl}, {wh}]"
        assert mp > 0, f"Part 3 non-positive odd pivot {mp} on [{wl}, {wh}]"
        worst_m = wm if worst_m is None else max(worst_m, wm)
        min_piv = mp if min_piv is None else min(min_piv, mp)
        so = parse_hex(s["s_odd"])
        assert so > 0, f"Part 3 non-positive s_odd on [{wl}, {wh}]"
        s2_min = min_s_odd_on_interval(p2, wl, wh)
        assert so <= s2_min, f"Part 3/Part 2 handoff gap on [{wl}, {wh}]: {so} > {s2_min}"
        assert parse_hex(s["n_up"]) > 0 and parse_hex(s["a2_up"]) > 0 and parse_hex(s["b2_up"]) > 0

        c_ext = int(s["closed_ext"])
        c_ori = int(s["closed_ori"])
        c_piv = int(s["closed_piv"])
        c_g = s["closed_g"]
        assert isinstance(c_g, list) and len(c_g) == 3
        c_g_ints = [int(x) for x in c_g]
        assert c_ext >= 0 and c_ori >= 0 and c_piv >= 0 and all(x >= 0 for x in c_g_ints)
        assert sum(c_g_ints) > 0, f"Part 3 zero grid-closed boxes on [{wl}, {wh}]"
        sb_boxes = int(s["total_boxes"])
        assert sb_boxes == c_ext + c_ori + c_piv + sum(c_g_ints), f"Part 3 box-count mismatch on [{wl}, {wh}]"
        assert sb_boxes >= 8, f"Part 3 impossible box count {sb_boxes} < 8 on [{wl}, {wh}]"
        tot_4d += sb_boxes

    assert tot_4d > 0 and tot_4d == int(data["summary"]["total_4d_boxes"])
    assert worst_m == parse_hex(data["summary"]["worst_margin"])
    assert min_piv == parse_hex(data["summary"]["min_odd_piv"])

    return {
        "foundations": foundations,
        "part1_slabs": {"amp": len(p1_amp), "shift": len(p1_sh)},
        "part2_origin_slabs": len(p2),
        "part2_min_det3": float(min_p2_det3),
        "part3_4d_slabs": len(p3),
        "part3_4d_boxes": tot_4d,
        "part3_worst_margin": float(worst_m),
        "part3_min_odd_piv": float(min_piv),
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--result", type=Path, default=Path(__file__).with_name("result.json"))
    parser.add_argument(
        "--replay-cpp",
        action="store_true",
        help="Recompile and run certify_all_sector.cpp into a temp file, audit it, and compare with --result",
    )
    parser.add_argument(
        "--update-result",
        action="store_true",
        help="With --replay-cpp, overwrite --result after auditing the freshly generated output",
    )
    parser.add_argument(
        "--foundations-only",
        action="store_true",
        help="Run only the zero-float symbolic, Bernstein, and analytic exterior proofs (no result.json needed)",
    )
    args = parser.parse_args()

    if args.foundations_only:
        fnd = check_exact_analytic_foundations()
        print(json.dumps(fnd, indent=2))
        print("FOUNDATIONS PASS (zero-float Bernstein L1/L2, psi calculus, B_odd > 50/61 I, w >= 8 even+odd exteriors)")
        return

    if args.update_result and not args.replay_cpp:
        raise RuntimeError("--update-result requires --replay-cpp")

    cpp = Path(__file__).with_name("certify_all_sector.cpp")
    cpp_sha = hashlib.sha256(cpp.read_bytes()).hexdigest()

    if args.replay_cpp:
        with tempfile.TemporaryDirectory() as td:
            exe = Path(td) / "certify_all_sector"
            cmd = [
                "clang++", "-O2", "-ffp-contract=off", "-frounding-math",
                "-std=c++17", "-pthread", "-Wall", "-Wextra", "-Werror",
                str(cpp), "-o", str(exe),
            ]
            subprocess.run(cmd, check=True)
            subprocess.run([str(exe), "--control-false-hotspot"], check=True)
            out_tmp = Path(td) / "result.json"
            subprocess.run([str(exe), "--output", str(out_tmp)], check=True)
            data = json.loads(out_tmp.read_text(encoding="utf-8"))
            data["cpp_sha256"] = cpp_sha
            summary = verify_all(data)
            rendered = json.dumps(data, separators=(",", ":")) + "\n"
            if args.update_result:
                args.result.write_text(rendered, encoding="utf-8")
            else:
                saved_text = args.result.read_text(encoding="utf-8")
                saved_data = json.loads(saved_text)
                assert saved_data == data, f"Replayed output differs from saved receipt {args.result}"
                print(
                    f"REPLAY EXACT MATCH against {args.result} "
                    f"(SHA-256 {hashlib.sha256(saved_text.encode('utf-8')).hexdigest()})"
                )
    else:
        data = json.loads(args.result.read_text(encoding="utf-8"))
        assert data.get("cpp_sha256") == cpp_sha, (
            f"cpp_sha256 mismatch: result has {data.get('cpp_sha256')}, disk has {cpp_sha}"
        )
        summary = verify_all(data)

    print(json.dumps(summary, indent=2))
    print("ALL CHECKS PASSED: Global all-sector closure F_joint(c*) <= 0 certified on all of C^6!")


if __name__ == "__main__":
    main()
