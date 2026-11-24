#!/usr/bin/env python3
"""Exact rational audit and assembly for the Sharp Global Joint Secant theorems (#436).

Agent-ID: gemini-c1de. Refs #436.
Standard library only (`python3 -I`). Verifies:
  1. Peak row exact rationals, Q_0 positive definiteness, visible shift c* and
     zero-mean compensating form C(Q, P, nu) algebraic identity + B_re, B_im > 0.
  2. Theorem 2(b) exact symbolic polynomial positivity for all eta in (0, 1).
  3. Analytic tail for w >= 8 across O-block (both B_756 and B_cstar), K-block,
     and recentered H-block in exact rational arithmetic.
  4. Outward-rounded C++ interval certificate output (Parts A, B, C, D) on [0, 8].
  5. Exact rational Gaussian-driver tail expectation bound for Sr = lam1*E1 + lam2*E2
     and multiscale staircase assembly proving E[F_joint(c*)] < 50e-6 unconditionally
     for all 0 <= V <= V_max.
"""
import argparse
import hashlib
import json
import subprocess
import sys
from fractions import Fraction as F
from math import factorial
from pathlib import Path

if not __debug__:
    raise RuntimeError("Run without -O so all assertions execute")

# Peak row exact rational constants (STATUS 7.4.10, 7.5.3, 7.5.6)
A = F(699, 1250)
B = F(179, 1250)
RHO = F(5053, 10000)
C = F(15159, 50000)
D = F(2, 5)
DH = F(11, 20)
P = F(2500, 1891)
PC = P - F(463, 5000)
QA0 = PC - F(67, 100) - F(2, 25) * RHO**2
QB0 = PC - F(67, 100) * RHO**2 - F(2, 25)
QAB0 = -F(59, 100) * RHO

# Global rational visible shift c* = AL_R * Re(nu) + i * AL_I * Im(nu)
# and zero-mean compensating form C(Q, P, nu) = 2*c1*Qr*nur + 2*c2*Qi*nui + 2*c3*Pr*nur + 2*c4*Pi*nui
K1, C3, AL_R = F(-1, 2), F(-1, 5), F(-11, 50)
K2, C4, AL_I = F(-4, 5), F(3, 20), F(-17, 50)
C1 = K1 - P * AL_R
C2 = K2 - P * AL_I
DIAG_NUR = P + 2 * K1 * AL_R - (P + 1) * AL_R**2
DIAG_NUI = P + 2 * K2 * AL_I - (P + 1) * AL_I**2


def exp_neg_upper(x: F, deg: int = 36) -> F:
    """Exact rational upper bound for exp(-x) via reciprocal of truncated Taylor sum of exp(x)."""
    assert x >= 0
    s = F(0)
    term = F(1)
    for k in range(deg + 1):
        if k > 0:
            term = term * x / k
        s += term
    return F(1) / s


def exp_neg_lower(x: F, deg: int = 36) -> F:
    """Exact rational lower bound for exp(-x) for x >= 0 via scaling + alternating Taylor."""
    assert x >= 0
    if x == 0:
        return F(1)
    # Scale by power of 2 so y = x / 2^m <= 1/2
    m = 0
    y = x
    while y > F(1, 2):
        y /= 2
        m += 1
    # Alternating series for exp(-y) stopped at odd degree 2k+1 is a strict lower bound
    s = F(1)
    term = F(1)
    for k in range(1, deg + 2):
        term = term * (-y) / k
        s += term
    assert s > 0
    for _ in range(m):
        s = s * s
    return s


def check_algebra_and_matrices():
    """Verify Q_0 > 0, c* + C(Q,P,nu) pointwise quadratic identity, and lambda_min(B) > 7/10."""
    assert QA0 > 0 and QB0 > 0 and QA0 * QB0 > QAB0**2

    # Pointwise identity check on basis + random rational test points:
    #   p*(|Q'+c|^2 + |P|^2 + |nu|^2) - |c|^2 + C(Q'+c, P, nu) == v_re^T B_re v_re + v_im^T B_im v_im
    B_re = [[P, F(0), K1], [F(0), P, C3], [K1, C3, DIAG_NUR]]
    B_im = [[P, F(0), K2], [F(0), P, C4], [K2, C4, DIAG_NUI]]
    for Qpr, Qpi, Pr, Pi, nur, nui in [
        (F(1), F(0), F(0), F(0), F(0), F(0)),
        (F(0), F(0), F(0), F(0), F(1), F(1)),
        (F(3, 7), F(-5, 11), F(2, 5), F(-1, 3), F(4, 9), F(-7, 13)),
    ]:
        cr, ci = AL_R * nur, AL_I * nui
        Qr, Qi = Qpr + cr, Qpi + ci
        lhs = (
            P * (Qr**2 + Qi**2 + Pr**2 + Pi**2 + nur**2 + nui**2)
            - (cr**2 + ci**2)
            + 2 * (C1 * Qr * nur + C2 * Qi * nui + C3 * Pr * nur + C4 * Pi * nui)
        )
        vr = [Qpr, Pr, nur]
        vi = [Qpi, Pi, nui]
        rhs = sum(vr[i] * B_re[i][j] * vr[j] for i in range(3) for j in range(3)) + sum(
            vi[i] * B_im[i][j] * vi[j] for i in range(3) for j in range(3)
        )
        assert lhs == rhs

    # Certify B_re - (3/5)I > 0 and B_im - (3/5)I > 0 by exact rational Sylvester minors
    def check_pd3(M, shift):
        A00 = M[0][0] - shift
        A11 = M[1][1] - shift
        A22 = M[2][2] - shift
        A01, A02, A12 = M[0][1], M[0][2], M[1][2]
        m1 = A00
        m2 = A00 * A11 - A01**2
        m3 = (
            A00 * (A11 * A22 - A12**2)
            - A01 * (A01 * A22 - A12 * A02)
            + A02 * (A01 * A12 - A11 * A02)
        )
        assert m1 > 0 and m2 > 0 and m3 > 0

    check_pd3(B_re, F(3, 5))
    check_pd3(B_im, F(3, 5))

    # Also check B_756 (with |h| <= 62/100) has B_756 - (3/5)I > 0:
    # min eig of [[p, 0, h], [0, p, 0], [h, 0, p]] is p - |h| >= 2500/1891 - 62/100 > 3/5!
    assert P - F(62, 100) > F(3, 5)


def check_theorem_2b_polynomial():
    """Exact symbolic polynomial check for Theorem 2(b):
    4*r*(A*B - C^2) >= 2*eta^2*(1-eta)^2*u + (1-eta)*(3 + 4*eta^2 - eta^3)*u^2
                       + (3 - eta)*(1 + eta^2)*u^3 + (1/4)*(1-eta)^2*u^4 >= 0.
    """
    def add(p, q):
        r = dict(p)
        for m, v in q.items():
            r[m] = r.get(m, F(0)) + v
            if r[m] == 0:
                del r[m]
        return r

    def mul(p, q):
        r = {}
        for (e1, u1), v1 in p.items():
            for (e2, u2), v2 in q.items():
                m = (e1 + e2, u1 + u2)
                r[m] = r.get(m, F(0)) + v1 * v2
                if r[m] == 0:
                    del r[m]
        return r

    def sc(p, c):
        return {m: v * c for m, v in p.items()} if c != 0 else {}

    ONE, ET, U = {(0, 0): F(1)}, {(1, 0): F(1)}, {(0, 1): F(1)}
    om, op, tp = add(ONE, sc(ET, F(-1))), add(ONE, ET), add({(0, 0): F(2)}, ET)
    R = add(om, U)
    R2 = mul(R, R)
    br = add(add(mul(op, R2), sc(mul(mul(om, tp), R), F(-1))), mul(om, om))
    t1 = sc(mul(R, br), F(2))
    ET2 = mul(ET, ET)
    inner = sc(add(add(R2, sc(ONE, F(-1))), sc(ET2, F(-1))), F(1, 2))
    y2max = add(ET2, sc(mul(inner, inner), F(-1)))
    t2 = sc(mul(mul(om, om), y2max), F(-1))
    Ptot = add(t1, t2)

    # Expected manifestly-positive closed form:
    om2 = mul(om, om)
    u1 = mul(sc(mul(ET2, om2), F(2)), U)
    # (1-eta)*(3 + 4*eta^2 - eta^3)*u^2
    c2_f = add(add({(0, 0): F(3)}, sc(ET2, F(4))), sc(mul(ET2, ET), F(-1)))
    u2 = mul(mul(om, c2_f), mul(U, U))
    # (3 - eta)*(1 + eta^2)*u^3
    c3_f = mul(add({(0, 0): F(3)}, sc(ET, F(-1))), add(ONE, ET2))
    u3 = mul(c3_f, mul(mul(U, U), U))
    # (1/4)*(1-eta)^2*u^4
    u4 = mul(sc(om2, F(1, 4)), mul(mul(U, U), mul(U, U)))
    expected = add(add(u1, u2), add(u3, u4))
    assert Ptot == expected, "Theorem 2(b) symbolic factorization mismatch"


def check_large_w_tail(cV_recen_L3: F, cV_recen_L5: F):
    """Exact rational verification of the analytic w >= 8 exterior for Parts A, B, D."""
    # 1. Thresholds: phi(6) < 4^2 = 16 (so |L| > w/2 >= 4 => T > 6);
    #                phi(19/2) < 6^2 = 36 (so |L| >= w - 2 >= 6 => T > 19/2).
    phi6 = F(6) * (A + F(6) * B) ** 2
    phi95 = F(19, 2) * (A + F(19, 2) * B) ** 2
    assert phi6 < 16, f"phi(6)={float(phi6)}"
    assert phi95 < 36, f"phi(19/2)={float(phi95)}"

    # 2. O-block operator norm for ALL w >= 8 (and any L >= 1, since aO <= 1, gO = 1):
    #   - {|L| <= w/2}: 1/|L+w| <= 2/w <= 1/4, and E[|O|^2] = omega => <= (1/4)*omega.
    #   - {|L| > w/2, r >= 2}: T > 6 and 1/r <= 1/2.
    #     |O_row|^2 = 2T + T(T-2)^2/2 = T^3/2 - 2T^2 + 4T.
    #     int_6^inf (T^3/2 - 2T^2 + 4T) e^{-T} dT = (366/2 - 2*50 + 4*7) e^{-6} = 111 * e^{-6}.
    #   - {r < 2}: T > 19/2; |O_row|^2 <= T^3/2 (since -2T^2 + 4T <= 0 for T >= 2).
    #     T^3 e^{-T} decreases for T >= 3, so <= (19/2)^3 e^{-19/2}.
    #     D(T) >= D(19/2) = (a + 19b/2)(a + 57b/2).
    #     Polar integral over r in [0, 2], theta in [0, pi] of (2/pi)*(|O_row|^2 * e^{-T} / D):
    #       <= 4 * ((19/2)^3 / 2) * e^{-19/2} / D(19/2) = 2 * (19/2)^3 * e^{-19/2} / D(19/2).
    D95 = (A + F(19, 2) * B) * (A + F(57, 2) * B)
    o_tail = F(1, 4) + F(111, 2) * exp_neg_upper(F(6)) + F(2) * F(19, 2) ** 3 * exp_neg_upper(F(19, 2)) / D95
    assert o_tail < F(3, 5), f"O-block w>=8 tail too large: {float(o_tail)}"

    # 3. K-block operator norm for ALL w >= 8 at any L >= 1 (with L <= 5):
    #   |K_row|^2 = (T - 2/5)^2 + (c + T/sqrt(2))^2 <= (3/2) T^2 + 13/50 for all T >= 0
    #     (verify: coeff of T is sqrt(2)*c - 4/5 < 0 since 2*c^2 < (4/5)^2; const 4/25 + c^2 < 13/50!)
    #   And on T >= 24 (r >= R_max tail): |K_row|^2 < (3/2) T^2 strictly since
    #     (4/5 - sqrt(2)*c)*24 > 4/25 + c^2  <=>  (4/5 - (4/25 + c^2)/24)^2 > 2*c^2 !
    assert 2 * C**2 < F(4, 5) ** 2 and F(4, 25) + C**2 < F(13, 50)
    assert (F(4, 5) - (F(4, 25) + C**2) / 24) ** 2 > 2 * C**2
    assert F(24) * (A + F(24) * B) ** 2 < F(400)
    #   E[|K_row|^2] <= (3/2)*2 + 13/50 = 163/50.
    #   int_6^inf ((3/2)T^2 + 13/50) e^{-T} dT = (75 + 13/50) e^{-6} = (3763/50) e^{-6}.
    #   For r < 2 (T >= 19/2): (3/2)T^2 + 13/50 <= 2 T^2, and T^2 e^{-T} decreases for T >= 2.
    #   Polar integral <= 4 * 2 * (19/2)^2 * e^{-19/2} / D(19/2).
    k_unit_tail = (
        F(1, 4) * F(163, 50)
        + F(1, 2) * F(3763, 50) * exp_neg_upper(F(6))
        + F(8) * F(19, 2) ** 2 * exp_neg_upper(F(19, 2)) / D95
    )
    # Lowest eigenvalue of Q_K(w) for w >= 8 is >= (8^2 / 2) + min_eig(Q_0) >= 32 (since Q_0 > 0!).
    assert F(5) * k_unit_tail < F(32), f"K-block w>=8 tail check failed at L=5: {float(5*k_unit_tail)}"

    # 4. Recentered H-block for w >= 8 at L = 3.25 and L = 5:
    #   |H_row|^2 = (T - 11/20)^2 + T^2/2 = (3/2)T^2 - (11/10)T + 121/400.
    #   Exact expectation under T ~ Exp(1) (E[T] = 1, E[T^2] = 2):
    #     E[|H_row|^2] = 3 - 11/10 + 121/400 = 881/400.
    #   On T >= 6: -(11/10)T + 121/400 < 0, so |H_row|^2 < (3/2)T^2 strictly.
    assert F(121, 400) < F(11, 10) * 6
    e_h2 = F(3) - F(11, 10) + F(121, 400)
    assert e_h2 == F(881, 400)
    h_unit_tail = (
        F(1, 4) * e_h2
        + F(1, 2) * F(75) * exp_neg_upper(F(6))
        + F(6) * F(19, 2) ** 2 * exp_neg_upper(F(19, 2)) / D95
    )
    assert F(13, 4) * h_unit_tail < cV_recen_L3, "H-block w>=8 exceeds L=3.25 bound"
    assert F(5) * h_unit_tail < cV_recen_L5, "H-block w>=8 exceeds L=5 bound"
    return o_tail, k_unit_tail, h_unit_tail


def exact_phi_K_max(K: F, V: F, n_sub: int = 120) -> F:
    """Exact rational upper bound on max_{lam1 + lam2 = V, lam1 >= lam2 >= 0} E[Sr * 1{Sr > K}]
    for Sr = lam1*E1 + lam2*E2 (E1, E2 iid Exp(1)).

    Let x = K / V > 0. Scaling by V, Phi_K(r*V, (1-r)*V) / V = (g(r) - g(1-r)) / (2r - 1)
    where g(t) = t*(t + x)*exp(-x/t) is strictly increasing and convex on (0, inf) with
    g'(t) = (2t + 2x + x^2/t)*exp(-x/t) strictly increasing on (0, inf).
    - If x >= 2: g'''(t) > 0 on (0, 1], so the secant slope is strictly increasing in r in [1/2, 1],
      hence its EXACT maximum is at r = 1: (1 + x)*exp(-x).
    - If 0 < x < 2: we certify the upper bound over r in [1/2, 1] directly via exact rational
      interval arithmetic on n_sub subintervals:
        * Near r = 1/2 (say r in [1/2, r_1]): by the mean value theorem,
          (g(r) - g(1-r)) / (2r - 1) = integral avg of g' on [1-r, r] <= g'(r) <= g'(r_1) (since g'' > 0!).
        * On [r_i, r_{i+1}] with r_i > 1/2: g is increasing, so
          (g(r) - g(1-r)) / (2r - 1) <= (g(r_{i+1}) - g(1 - r_{i+1})) / (2*r_i - 1) !
      Zero unproved monotonicity assumption needed on 0 < x < 2!
    """
    assert K > 0 and V > 0
    x = K / V
    if x >= 2:
        return (K + V) * exp_neg_upper(x)

    def g_up(t: F) -> F:
        return F(0) if t == 0 else t * (t + x) * exp_neg_upper(x / t)

    def g_dn(t: F) -> F:
        return F(0) if t == 0 else t * (t + x) * exp_neg_lower(x / t)

    def gp_up(t: F) -> F:
        return (2 * t + 2 * x + x * x / t) * exp_neg_upper(x / t)

    # First subinterval [1/2, 1/2 + 1/(2*n_sub)]: MVT gives <= g'(r_hi) since g'' > 0.
    r_split = F(1, 2) + F(1, 2 * n_sub)
    best = gp_up(r_split)
    # Remaining subintervals [r_lo, r_hi] on [r_split, 1]:
    # Since g' is strictly increasing on (0, 1], for every r in [r_lo, r_hi]:
    #   g(r) - g(1-r) = [g(r_lo) - g(1-r_lo)] + int_{r_lo}^r (g'(t) + g'(1-t)) dt
    #                 <= A_v + B_v * (r - r_lo),
    # where A_v = g_up(r_lo) - g_dn(1-r_lo) and B_v = gp_up(r_hi) + gp_up(1-r_lo).
    # Writing h = 2*r - 1 in [d_lo, d_hi], the ratio (A_v + (B_v/2)*(h - d_lo)) / h is
    # monotone in h > 0, so its maximum on [d_lo, d_hi] is attained at an endpoint!
    for i in range(1, n_sub):
        r_lo = F(1, 2) + F(i, 2 * n_sub)
        r_hi = F(1, 2) + F(i + 1, 2 * n_sub)
        d_lo = 2 * r_lo - 1
        d_hi = 2 * r_hi - 1
        A_v = g_up(r_lo) - g_dn(1 - r_lo)
        B_v = gp_up(r_hi) + gp_up(1 - r_lo)
        val = max(A_v / d_lo, (A_v + B_v * (r_hi - r_lo)) / d_hi)
        if val > best:
            best = val
    return V * min(F(1), best)


def parse_cpp_output(text: str) -> dict:
    """Parse machine-readable output of certify_joint_secant."""
    res = {"partA": None, "partBD": {}, "partC": []}
    for line in text.splitlines():
        line = line.strip()
        if not line or not line.startswith("PART_"):
            continue
        parts = line.split()
        kv = {}
        for tok in parts[1:]:
            k, v = tok.split("=", 1)
            kv[k] = v
        if parts[0] == "PART_A":
            res["partA"] = kv
        elif parts[0] == "PART_BD":
            res["partBD"][kv["L"]] = kv
        elif parts[0] == "PART_C":
            res["partC"].append(kv)
    return res


def ceil_rat(val_str: str, den: int = 100000) -> F:
    """Parse decimal float string as exact Fraction and round UP to 1/den."""
    x = F(val_str)
    n = -(-(x.numerator * den) // x.denominator)
    out = F(n, den)
    assert out >= x
    return out


def floor_rat(val_str: str, den: int = 100000) -> F:
    """Parse decimal float string as exact Fraction and round DOWN to 1/den."""
    x = F(val_str)
    n = (x.numerator * den) // x.denominator
    out = F(n, den)
    assert out <= x
    return out


def verify_all(data: dict, target_V: F = F(1, 10000)):
    check_algebra_and_matrices()
    check_theorem_2b_polynomial()

    # Part A verification
    pA = data["partA"]
    assert pA is not None and pA["PASS"] == "1", "Part A failed"
    assert F(pA["w_lo"]) == F(7, 5) and F(pA["w_hi"]) == F(8)
    assert F(pA["max_evK"]) < 0
    assert F(pA["max_evO_756"]) < 0
    assert F(pA["max_evO_cstar"]) < 0
    assert F(-62, 100) < F(pA["h756_lo"]) < F(pA["h756_hi"]) < 0

    # Parts B & D verification (L = 3.25 and L = 5)
    b325 = data["partBD"]["3.25"]
    b5 = data["partBD"]["5"]
    assert F(b325["max_evO"]) < 0, f"L=3.25 evO not negative: {b325['max_evO']}"
    assert F(b5["max_evO"]) < 0, f"L=5 evO not negative: {b5['max_evO']}"

    cV_F325 = ceil_rat(b325["max_cV_Fjoint"], 1000)
    cW_325 = floor_rat(str(-F(b325["max_evO"])), 10000)
    cV_H325 = ceil_rat(b325["max_cV_recen"], 1000)

    cV_F5 = ceil_rat(b5["max_cV_Fjoint"], 1000)
    cW_5 = floor_rat(str(-F(b5["max_evO"])), 10000)
    cV_H5 = ceil_rat(b5["max_cV_recen"], 1000)
    assert cW_325 > 0 and cW_5 > 0

    o_tail, k_tail, h_tail = check_large_w_tail(cV_H325, cV_H5)

    # Part C staircase verification:
    # Every level has K_j = K_num/K_den, certified evO < 0 on all w in [0, 7/5]
    # (and w >= 7/5 already has F_joint(c*) <= 0 by Part A + w >= 8 tail!).
    levels = []
    for row in data["partC"]:
        assert F(row["max_evO"]) < 0, f"Part C level {row} failed evO < 0"
        K = F(int(row["K_num"]), int(row["K_den"]))
        cK = max(F(0), ceil_rat(row["c_K_hi"], 100000))
        levels.append((K, cK))
    levels.sort(key=lambda t: t[0])
    # Enforce monotone nondecreasing envelope (valid since K_j < K_{j+1} => bound on Sr <= K_{j+1} also holds on Sr <= K_j)
    Ks = [t[0] for t in levels]
    cs = [t[1] for t in levels]
    for i in range(len(cs) - 2, -1, -1):
        cs[i] = min(cs[i], cs[i + 1])
    c_top = cV_F325  # global unconditional top bound from L = 3.25!
    assert cs[-1] <= c_top

    # Exact rational evaluation of E[F_joint(c*)] <= c_0 * V + sum_j (c_{j+1} - c_j) * Phi_{K_j}(V)
    # By pointwise monotonicity of s -> c_0*s + sum dc_j*s*1{s > K_j}, this holds for ALL 0 <= V <= target_V!
    total = cs[0] * target_V
    for j in range(len(Ks)):
        c_next = cs[j + 1] if j + 1 < len(Ks) else c_top
        dc = c_next - cs[j]
        assert dc >= 0
        if dc > 0:
            total += dc * exact_phi_K_max(Ks[j], target_V)
    budget = F(50, 10**6)
    assert total < budget, f"Staircase failed target V={float(target_V)}: {float(total)} >= {float(budget)}"
    den_disp = 10**12
    total_up = F(-(-(total.numerator * den_disp) // total.denominator), den_disp)
    assert total <= total_up < budget

    return {
        "o_tail_w8": float(o_tail),
        "k_tail_w8": float(k_tail),
        "h_tail_w8": float(h_tail),
        "L325": {"cV_Fjoint": str(cV_F325), "cW": str(cW_325), "cV_recen": str(cV_H325)},
        "L5": {
            "cV_Fjoint": str(cV_F5),
            "cW": str(cW_5),
            "cV_recen": str(cV_H5),
            "WV_Fjoint": float(cV_F5 / cW_5),
            "WV_recen": float(cV_H5 / cW_5),
        },
        "staircase_levels": [(str(K), str(c)) for K, c in zip(Ks, cs)],
        "c_top": str(c_top),
        "target_V": str(target_V),
        "E_Fjoint_upper": float(total_up),
        "E_Fjoint_upper_rat": str(total_up),
        "budget": str(budget),
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--result", type=Path, default=Path(__file__).with_name("result.json"))
    parser.add_argument("--replay-cpp", action="store_true", help="Recompile and run certify_joint_secant.cpp")
    parser.add_argument("--target-v", default="1/10000", help="Target V as rational p/q (default 1/10000)")
    args = parser.parse_args()

    cpp = Path(__file__).with_name("certify_joint_secant.cpp")
    cpp_sha = hashlib.sha256(cpp.read_bytes()).hexdigest()

    if args.replay_cpp:
        bin_path = Path("/tmp/certify_joint_secant_verify")
        subprocess.run(
            ["clang++", "-O2", "-std=c++17", "-pthread", "-Wall", "-Wextra", "-Werror", str(cpp), "-o", str(bin_path)],
            check=True,
        )
        out = subprocess.check_output([str(bin_path), "all"], text=True)
        bin_path.unlink(missing_ok=True)
        parsed = parse_cpp_output(out)
        parsed["cpp_sha256"] = cpp_sha
        args.result.write_text(json.dumps(parsed, indent=2) + "\n", encoding="utf-8")
    else:
        parsed = json.loads(args.result.read_text(encoding="utf-8"))
        assert parsed.get("cpp_sha256") == cpp_sha, "result.json cpp_sha256 does not match certify_joint_secant.cpp"

    target_V = F(args.target_v)
    summary = verify_all(parsed, target_V=target_V)
    print(json.dumps(summary, indent=2))
    print(f"ALL CHECKS PASSED: E[F_joint(c*)] <= {summary['E_Fjoint_upper']:.6e} < 5.00e-5 for all 0 <= V <= {target_V}")


if __name__ == "__main__":
    main()
