#!/usr/bin/env python3
"""Exact stdlib verifier for the symmetrised spiked cubic radius certificate (label C, zero floats).

Usage:  python3 -I verify.py [CERT.json] [--quiet]

Only the Python standard library is used (fractions, json, math, os, sys, time). Every number read
from the certificate is an exact integer or rational string, and every arithmetic operation and
comparison is performed in exact arbitrary-precision integers and Fractions (zero float literals or
conversions anywhere in this file).

Given `cert_spiked.json`, this script verifies:
  1. Machin rational brackets PI_LO < pi < PI_HI and Laguerre-Stieltjes rational upper bounds for
     the visible-sector response ellipsoids B_S(c) (c in C_BANK) and radial envelope F(d) of
     `spiked-radius-sectors-codex-a7c4` (STATUS.md row 4.18g, P + C);
  2. Left analytical closure on 0 <= t <= t_left via the elliptic quadratic lift
     (431/500)^2 t^2 + s^2 <= (2287/2500)^2 of `cubic-carrier-ellipse-codex-a7c4` (STATUS.md 4.18e, P + C);
  3. For each interior Pythagorean ray (a_j, b_j, c_j) with a_j^2 + b_j^2 = c_j^2 (p_j = a_j^2/c_j^2,
     u_j = b_j^2/c_j^2 = 1 - p_j):
       - d_cut == 0 (PI_HI / 4 <= R_j^2) or envelope(d_cut)[1] <= R_j (handling d <= d_cut);
       - Contiguous s_G-slab partition of [0, 42] (Lean: s_G = E|G/||G|||^4 - 2 <= 42);
       - On every slab [s_lo, s_hi]:
           (C1) Scalar signs, 2x2 PSD M_ker, SOCP mu_vr * tau_vr >= sig_vr^2, knotwise C* cone,
                psi_a >= 0, psi_del >= 0, D_1(u_k) > 0, N_22(u_k) > 0, and phi_3[K] = phi_4[K] = 0;
           (C2) Exact integer Sturm positivity on every knot interval [u_k, u_{k+1}] and [u_K, oo)
                of A_4(v) (or v A_4(v)), D_2(v), D_3(v), det M(v) (or v^2 det M(v)), and on
                [e_k, e_{k+1}] and [e_K, oo) of det P_sh(r) (or v^3 det P_sh(r));
           (C3) Exact rational weak duality at both endpoints s_e in {s_lo, s_hi} over both the
                normalised contraction polytope P_1 (Lean cuts) and the visible-sector polytope
                E_sec (with exact rational integer-fourth-root bounds for Holder (4/3, 4) + 4-term
                AM-GM concavity of (2 + s_G)^{3/4}, or Young sixth-moment bound for small s_G),
                certifying max_{s_G in [0, 42]} B(s_G) < R_j;
  4. For each right analytical Pythagorean ray (a_j, b_j, c_j), envelope(1 - p_j)[1] <= R_j;
  5. Convex-quadratic slab cover of [t_left, t_right] (with t_right^2 >= PI_HI / 4 >= ||P_{1,0}h||_2^2):
     on each [tau_j, tau_{j+1}], t^2 + ((R_j - ell_j t) / m_j)^2 is strictly convex in t and strictly
     below r_1^2 at both endpoints, proving ||P_{1,0}h||_2^2 + ||P_{2,1}k||_2^2 <= r_1^2 (hence
     rho_s <= r_1) across all dimensions n >= 1;
  6. Exact rational degree-5 mid-t payoff implications for T = P_{1,0} - (39/50)P_{2,1} + (779/10000)P_{3,2}
     combining 4.18e on [0, t_ell] with the certified low-p Pythagorean rays on [t_ell, t_*], both
     by Parseval alone and with the Lean mass inequality.

Agent-ID: gemini-4c4c
"""
from concurrent.futures import ProcessPoolExecutor
from fractions import Fraction as Fr
import json
from math import comb, factorial, gcd, isqrt
import os
import sys
from time import perf_counter_ns

C6 = Fr(4045313, 100000)
EROW = [Fr(32), Fr(8), Fr(32), Fr(96), Fr(0)]
S0 = [Fr(8), Fr(2), Fr(8), Fr(0), Fr(8)]
H0 = [Fr(8, 3), Fr(2, 3), Fr(8, 3), Fr(24), Fr(-16, 3)]
PMAX = [Fr(1, 32), Fr(1, 8), Fr(1, 32), Fr(1, 96), Fr(3, 64)]

# Exact fourth-moment constants K_S = (kappa_S)^4 for z_1 d_1 G + zb_1 F_1 across S in (11, 20, 10, 01, 21):
#   11: E|2 T G_11|^4 = 16 * 24 * 2 E_11^2 = 768 E_11^2
#   20: E|sqrt(2) z_1^2 G_20|^4 = 4 * 24 * 2 E_20^2 = 192 E_20^2
#   10: E|z_1 G_10|^4 <= 2 * 9 E_10^2 = 18 E_10^2
#   01: E|zb_1 G_01|^4 <= 2 * 6 E_01^2 = 12 E_01^2
#   21: E|z_1(3T - 2)/sqrt(2) G_21|^4 = (1/4) E[T^2 (3T - 2)^4] E_21^2 = 9260 E_21^2
HOLDER_K4 = [768, 192, 18, 12, 9260]

C_ELL = Fr(431, 500)
RHO0_REV = Fr(2287, 2500)


def require(cond, msg="verification condition failed"):
    if not cond:
        raise ValueError(msg)


def dec_ceil10(q):
    n = (q.numerator * 10**10 + q.denominator - 1) // q.denominator
    return "%d.%010d" % (n // 10**10, n % 10**10)


def dec_floor8(q):
    n = (q.numerator * 10**8) // q.denominator
    return "%d.%08d" % (n // 10**8, n % 10**8)


def dec_floor5(q):
    n = (q.numerator * 10**5) // q.denominator
    return "%d.%05d" % (n // 10**5, n % 10**5)


# ------------------------------------------------------------------ exact roots, pi, Stieltjes & F(d)
def root_interval(z):
    require(z >= 0, "negative root_interval input")
    if z == 0:
        return Fr(0), Fr(0)
    scale = 10**24
    num = isqrt(z.numerator * scale * scale // z.denominator)
    lo, hi = Fr(num, scale), Fr(num + 1, scale)
    require(lo * lo <= z <= hi * hi, "root_interval bracket failed")
    return lo, hi


def root4_lo(z):
    """Exact rational lower bound q > 0 with q^4 <= z for rational z > 0."""
    require(z > 0, "root4_lo requires z > 0")
    scale = 10**15
    n4 = z.numerator * (scale ** 4) // z.denominator
    r2 = isqrt(n4)
    r1 = isqrt(r2)
    q = Fr(r1, scale)
    require(q > 0 and q ** 4 <= z, "root4_lo failed")
    return q


def root4_hi_int(m_int):
    """Exact rational upper bound q > 0 with q^4 >= m_int for positive integer m_int."""
    scale = 10**15
    n4 = m_int * (scale ** 4)
    r1 = isqrt(isqrt(n4))
    while (r1 ** 4) < n4:
        r1 += 1
    q = Fr(r1, scale)
    require(q ** 4 >= m_int, "root4_hi_int failed")
    return q


KAPPA_HI = [root4_hi_int(m) for m in HOLDER_K4]


def arctan_interval(j):
    x = Fr(1, j)
    low = sum((Fr(-1) ** k) * (x ** (2 * k + 1)) / (2 * k + 1) for k in range(32))
    return low, low + (x ** 65) / 65


def pi_interval():
    a, b = arctan_interval(5), arctan_interval(239)
    return 16 * a[0] - 4 * b[1], 16 * a[1] - 4 * b[0]


PI_LO, PI_HI = pi_interval()
require(Fr(333, 106) < PI_LO < PI_HI < Fr(355, 113), "Machin pi bracket failed")


def stieltjes_lower(c, k, n):
    """First inverse diagonal of the compressed positive Laguerre matrix (4.18g)."""
    comp = c + 2 * (n - 1) + 1 + k
    for j in range(n - 1, 0, -1):
        require(comp > 0, "nonpositive Laguerre Schur complement")
        comp = c + 2 * (j - 1) + 1 + k - Fr(j * (j + k)) / comp
    require(comp > 0, "nonpositive final Laguerre complement")
    return Fr(1) / comp


def integral_divided_by_shift(poly, c, lo, hi):
    quot = [Fr(x) for x in poly]
    corr = Fr(0)
    for j in range(len(quot) - 1, 0, -1):
        corr += quot[j] * factorial(j - 1)
        quot[j - 1] -= c * quot[j]
    return corr + max(quot[0] * lo, quot[0] * hi)


def sector_B_upper(c, n_lag=48):
    """Certified rational upper bounds (B00_hi, BT_hi, B11_hi, B20_hi, B21_hi) on B_*(c)."""
    require(c > 0, "c must be positive")
    lo = stieltjes_lower(c, 0, n_lag)
    hi = (1 - stieltjes_lower(c, 1, n_lag)) / c
    require(0 < lo < hi, "invalid Stieltjes bracket")
    polys = (
        [Fr(1)],
        [Fr(0), Fr(1)],
        [Fr(1), Fr(-2), Fr(1)],
        [Fr(0), Fr(0), Fr(1, 2)],
        [Fr(0), Fr(2), Fr(-2), Fr(1, 2)],
    )
    return tuple((1 + c) * integral_divided_by_shift(p, c, lo, hi) for p in polys)


def envelope(d):
    """Certified rational enclosure (F_lo, F_hi) of F(d) = int_0^oo e^{-t} sqrt(d + (1-d)t) dt."""
    x = d / (1 - d)
    require(0 < x < 1, "envelope requires 0 < d < 1/2")
    exp_lo = sum((x ** k) / factorial(k) for k in range(25))
    exp_hi = exp_lo + (x ** 25) / factorial(25) / (1 - x / 26)
    int_lo = sum(((-x) ** k) / (factorial(k) * (2 * k + 1)) for k in range(24))
    int_hi = int_lo + (x ** 24) / (factorial(24) * 49)
    d_lo, d_hi = root_interval(d)
    br_lo = root_interval((1 - d) * PI_LO / 4)[0] - d_hi * int_hi
    br_hi = root_interval((1 - d) * PI_HI / 4)[1] - d_lo * int_lo
    require(br_lo > 0, "envelope positive multiplier failed")
    return d_lo + exp_lo * br_lo, d_hi + exp_hi * br_hi


# ------------------------------------------------------------------ exact polynomial & Sturm arithmetic
def ptrim(a):
    a = list(a)
    while a and a[-1] == 0:
        a.pop()
    return a


def padd(a, b):
    n = max(len(a), len(b))
    return ptrim([(a[i] if i < len(a) else Fr(0)) + (b[i] if i < len(b) else Fr(0)) for i in range(n)])


def psub(a, b):
    n = max(len(a), len(b))
    return ptrim([(a[i] if i < len(a) else Fr(0)) - (b[i] if i < len(b) else Fr(0)) for i in range(n)])


def pscale(a, c):
    if c == 0 or not a:
        return []
    return ptrim([c * x for x in a])


def pmul(a, b):
    if not a or not b:
        return []
    out = [Fr(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                out[i + j] += x * y
    return ptrim(out)


def peval(a, x):
    acc = Fr(0)
    for c in reversed(a):
        acc = acc * x + c
    return acc


def pprim(p, u0, val_u0):
    q = [Fr(0)] + [c / (i + 1) for i, c in enumerate(p)]
    q[0] = val_u0 - peval(q, u0)
    return ptrim(q)


def compose_r2(pv):
    out = []
    for c in pv:
        out.append(c)
        out.append(Fr(0))
    return ptrim(out)


def to_int_poly(a):
    a = ptrim(a)
    if not a:
        return []
    den = 1
    for x in a:
        den = den * x.denominator // gcd(den, x.denominator)
    ints = [int(x * den) for x in a]
    g = 0
    for x in ints:
        g = gcd(g, abs(x))
    return [x // g for x in ints]


def ieval_sign(a, x):
    p, q = x.numerator, x.denominator
    acc = 0
    n = len(a) - 1
    for i in range(n, -1, -1):
        acc = acc * p + a[i] * (q ** (n - i))
    return (acc > 0) - (acc < 0)


def irem_neg(a, b):
    a = list(a)
    lb = b[-1]
    db = len(b) - 1
    m = abs(lb)
    sg = 1 if lb > 0 else -1
    while len(a) - 1 >= db and a:
        la = a[-1]
        k = len(a) - 1 - db
        a = [m * x for x in a]
        for i, y in enumerate(b):
            a[i + k] -= sg * la * y
        a = ptrim(a)
    return to_int_poly([-x for x in a])


def sturm_chain(p):
    p0 = to_int_poly(p)
    p1 = to_int_poly([i * p0[i] for i in range(1, len(p0))])
    chain = [p0]
    if p1:
        chain.append(p1)
    while len(chain) >= 2 and len(chain[-1]) > 1:
        r = irem_neg(chain[-2], chain[-1])
        if not r:
            break
        chain.append(r)
    return chain


def sign_changes(signs):
    nz = [x for x in signs if x != 0]
    return sum(1 for i in range(len(nz) - 1) if nz[i] != nz[i + 1])


def positive_on(p, a, b=None):
    """Exact decision: True iff p(x) > 0 for all x in [a, b] (or [a, oo) when b is None)."""
    p = ptrim(p)
    if not p:
        return False
    if len(p) == 1:
        return p[0] > 0
    ch = sturm_chain(p)
    if ieval_sign(ch[0], a) <= 0:
        return False
    va = sign_changes([ieval_sign(c, a) for c in ch])
    if b is None:
        if ch[0][-1] <= 0:
            return False
        vb = sign_changes([(c[-1] > 0) - (c[-1] < 0) for c in ch])
    else:
        if ieval_sign(ch[0], b) <= 0:
            return False
        vb = sign_changes([ieval_sign(c, b) for c in ch])
    return va == vb


# ------------------------------------------------------------------ contraction cuts
def cut_vector(typ, theta):
    m = [Fr(1), Fr(0), Fr(1), Fr(3), Fr(-1)]
    t3 = [Fr(0), Fr(0), Fr(0), Fr(3), Fr(-1)]
    if typ in ("n", "h", "b", "y", "z"):
        a_ = [Fr(0)] * 5
        a_["nhbyz".index(typ)] = Fr(1)
        return a_
    if typ == "bn":
        return [Fr(1), Fr(0), Fr(-1), Fr(0), Fr(0)]
    if typ == "yz":
        return [Fr(0), Fr(0), Fr(0), Fr(-1), Fr(1)]
    if typ == "h0":
        return list(H0)
    if typ == "m":
        return m
    require(theta is not None and theta > 0, "theta must be positive")
    if typ == "c1":
        return [theta, Fr(1) / theta, Fr(0), Fr(0), Fr(-2)]
    if typ in ("c2+", "c2-"):
        sg = -2 if typ == "c2+" else 2
        return [m[i] / theta + (theta if i == 1 else Fr(0)) + sg * t3[i] for i in range(5)]
    raise ValueError("unknown cut: " + str(typ))


def build_sector_polytope(pv, d_cut, R_ray, B_rows):
    """Build exact rational (A_sec, b_sec) such that phi(ell, G) > R_ray => A_sec E <= b_sec."""
    uv = 1 - pv
    A_sec = [
        [Fr(1, 2), Fr(5, 4), Fr(1), Fr(1), Fr(9, 8)],
        [Fr(1), Fr(1), Fr(1), Fr(1), Fr(1)],
    ]
    b_sec = [max(Fr(0), uv - d_cut), uv]
    r2 = R_ray * R_ray
    for (B00, BT, B11, B20, B21) in B_rows:
        A_sec.append([B00 - B11, B00 - B20, B00 - BT, B00 - BT, B00 - B21])
        b_sec.append(B00 * uv + BT * pv - r2)
    return A_sec, b_sec


# ------------------------------------------------------------------ single Stein slab verification
def verify_spiked_row(row, ray_abc, A_sec, b_sec, knot_sets, quiet=False):
    a_r, b_r, c_r = ray_abc
    ell = Fr(a_r, c_r)
    m_amp = Fr(b_r, c_r)
    pv = ell * ell
    uv = m_amp * m_amp
    u2 = uv * uv
    u3 = u2 * uv
    u_32 = m_amp * m_amp * m_amp  # exact (u^2)^{3/4} = (b/c)^3 in Q!

    e = [Fr(x) for x in knot_sets[row["knot_set"]]]
    K = len(e) - 1
    require(K >= 1 and e[0] == 0 and all(e[i] < e[i + 1] for i in range(K)), "invalid knots")
    u_kn = [x * x for x in e]
    require(isinstance(row["knot_den"], int) and row["knot_den"] > 0, "invalid knot_den")
    kden = Fr(row["knot_den"])

    def get_karr(nm):
        raw = row[nm]
        require(len(raw) == K + 1 and all(isinstance(x, int) for x in raw), "invalid array " + nm)
        return [Fr(x, kden) for x in raw]

    phi1, phi2 = get_karr("phi1"), get_karr("phi2")
    phi3, phi4 = get_karr("phi3"), get_karr("phi4")
    psi_a, psi_del = get_karr("psi_a"), get_karr("psi_del")
    xi2, xit1, xia, xik1 = get_karr("xi2"), get_karr("xit1"), get_karr("xia"), get_karr("xik1")

    require(phi3[K] == 0 and phi4[K] == 0, "phi3[K] and phi4[K] must vanish on [u_K, oo)")

    require(
        len(row["lam"]) == 3 and len(row["slope"]) == 2 and len(row["l3"]) == 3
        and len(row["m_ker"]) == 3 and len(row["q_sym"]) == 3 and len(row["vr"]) == 3,
        "invalid scalar tuple lengths",
    )
    lam0, lam1, lam2 = (Fr(x) for x in row["lam"])
    slope = [Fr(x) for x in row["slope"]]
    l3 = [Fr(x) for x in row["l3"]]
    m00, m01, m11 = (Fr(x) for x in row["m_ker"])
    m_del = Fr(row["m_del"])
    q0, q1, q2 = (Fr(x) for x in row["q_sym"])
    sig_vr, mu_vr, tau_vr = (Fr(x) for x in row["vr"])
    mu_a = Fr(row["mu_a"])
    mu_rho = Fr(row["mu_rho"])
    mu_w = Fr(row["mu_w"])
    mu_w1 = Fr(row["mu_w1"])
    mu_T = Fr(row["mu_T"])
    mu_F4 = Fr(row["mu_F4"])

    require(all(x >= 0 for x in l3), "l3 >= 0 failed")
    lam3 = sum(l3)
    require(lam3 > 0, "lam3 > 0 failed")
    require(m00 >= 0 and m11 > 0 and m00 * m11 - m01 * m01 >= 0, "M_ker PSD / m11 > 0 failed")
    require(m_del >= 0, "m_del >= 0 failed")
    require(mu_vr > 0 and tau_vr >= 0 and mu_vr * tau_vr >= sig_vr * sig_vr, "vr SOCP failed")
    require(mu_a >= 0 and mu_rho > 0 and mu_w > 0 and mu_w1 > 0 and mu_T > 0 and mu_F4 > 0, "mu signs failed")

    # (C1) Knotwise inequalities
    for k in range(K + 1):
        require(
            xi2[k] >= 0 and xit1[k] >= 0 and xik1[k] >= 0 and xia[k] * xia[k] <= 4 * xi2[k] * xit1[k],
            "C* cone failed at knot %d" % k,
        )
        require(psi_a[k] >= 0 and psi_del[k] >= 0, "psi signs failed at knot %d" % k)
        require(m00 - phi3[k] > 0, "D1 failed at knot %d" % k)
        require(m11 * (m_del + psi_del[k]) - q1 * q1 > 0, "N22 failed at knot %d" % k)

    # (C2) Exact Sturm positivity across all K + 1 intervals
    G_val = [Fr(0), Fr(0), Fr(0), Fr(0)]
    vv = [Fr(0), Fr(1)]
    vv2 = [Fr(0), Fr(0), Fr(1)]
    nfail = 0

    for k in range(K + 1):
        tail = (k == K)
        u0 = u_kn[k]
        u1 = None if tail else u_kn[k + 1]
        if tail:
            pc = lambda arr: ptrim([arr[K]])
        else:
            def pc(arr, k=k, u0=u0, u1=u1):
                sl = (arr[k + 1] - arr[k]) / (u1 - u0)
                return ptrim([arr[k] - sl * u0, sl])

        p1 = padd(pc(phi1), [Fr(0), slope[0]])
        p2 = padd(pc(phi2), [Fr(0), slope[1]])
        p3 = pc(phi3)
        p4 = pc(phi4)
        psa = pc(psi_a)
        psd = pc(psi_del)
        x2p, xtp, xap, xkp = pc(xi2), pc(xit1), pc(xia), pc(xik1)

        g1 = pprim(p1, u0, G_val[0])
        g2 = pprim(p2, u0, G_val[1])
        g3 = pprim(p3, u0, G_val[2])
        g4 = pprim(p4, u0, G_val[3])

        vY1 = psub(pmul(vv, p1), g1)
        vY2 = psub(pmul(vv, p2), g2)
        vY3 = psub(pmul(vv, p3), g3)
        vY4 = psub(pmul(vv, p4), g4)
        g34 = padd(g3, g4)

        M00 = psub([m00], p3)
        M01 = psub(psub([q2], pscale(p3, Fr(1, 8))), pscale(psa, Fr(1, 2)))
        M11 = padd([m_del], psd)
        M02 = psub([m01], pscale(psa, Fr(1, 2)))

        C00 = psub(pscale(M11, m11), [q1 * q1])
        C11 = psub(pscale(M00, m11), pmul(M02, M02))
        C22 = psub(pmul(M00, M11), pmul(M01, M01))  # = D2
        C01 = psub(pscale(M02, q1), pscale(M01, m11))
        C02 = psub(pscale(M01, q1), pmul(M02, M11))
        C12 = psub(pmul(M01, M02), pscale(M00, q1))
        D3 = padd(pmul(M00, C00), padd(pmul(M01, C01), pmul(M02, C02)))

        b1_v = padd(
            psub([Fr(1, 2) * q0], pscale(xtp, Fr(1, 2))),
            padd(pscale(p1, Fr(-1, 8)), padd(pscale(p2, Fr(-3, 16)), pscale(p3, Fr(1, 8) * uv))),
        )
        b2_v = psub(
            [Fr(-1) * uv * m01 - 2 * uv * m11],
            padd(pscale(p2, Fr(1, 4)), padd(pscale(psd, 8 * pv), pscale(padd(xtp, xkp), Fr(1, 2)))),
        )
        q1_v = padd(
            [lam0 + u2 * (m00 + 4 * m01 + 4 * m11), lam1, lam2, lam3],
            psub(
                padd(g1, padd(g2, pscale(p3, pv * uv))),
                padd(pscale(p1, pv), padd(pscale(p2, pv), padd(pscale(g3, uv), pscale(xtp, 4 * pv)))),
            ),
        )
        Q12 = padd(psub(pscale(pmul(b1_v, b1_v), m11), pscale(pmul(b1_v, b2_v), 2 * q1)), pmul(M11, pmul(b2_v, b2_v)))

        a_lo = e[k]
        b_hi = None if tail else e[k + 1]
        ok_d2 = positive_on(C22, u0, u1)
        ok_d3 = positive_on(D3, u0, u1)

        A4_base = psub(padd([mu_a], psa), padd(p4, pscale(pmul(p4, p4), Fr(1) / (2 * mu_F4))))
        b0_lin = psub(
            padd([Fr(-1) * uv * m00 - 2 * uv * m01], padd(pscale(p3, Fr(1, 2) * (uv - pv)), pscale(g3, Fr(1, 2)))),
            padd(pscale(p1, Fr(1, 2)), padd(pscale(psa, 2 * pv), pscale(x2p, Fr(1, 2)))),
        )

        if k == 0:
            for pol in (g3, g4, vY1, vY2, vY3, vY4):
                require(not pol or pol[0] == 0, "k=0 origin vanishing failed")
            g3_d = g3[1:] if len(g3) > 1 else []
            g4_d = g4[1:] if len(g4) > 1 else []
            g34_d = g34[1:] if len(g34) > 1 else []
            Y1_v = vY1[1:] if len(vY1) > 1 else []
            Y2_v = vY2[1:] if len(vY2) > 1 else []
            Y3_v = vY3[1:] if len(vY3) > 1 else []
            Y4_v = vY4[1:] if len(vY4) > 1 else []

            A4_v = psub(A4_base, pmul(vv, pscale(pmul(g4_d, g4_d), Fr(1) / (2 * mu_T))))
            M33_v = padd([mu_rho], A4_v)
            M03_v = pscale(padd(Y3_v, Y4_v), Fr(-1, 2))
            D4top_v = psub(pmul(M33_v, D3), pmul(pmul(M03_v, M03_v), C00))

            tau_sum_v = pmul(
                vv,
                padd(pscale(pmul(g34_d, g34_d), Fr(1) / (4 * mu_w)), pscale(pmul(g3_d, g3_d), Fr(1) / (4 * mu_w1))),
            )
            b0_v = psub(b0_lin, pscale(tau_sum_v, Fr(1, 2)))
            b3_v = psub(
                padd([Fr(0), Fr(1, 2) * sig_vr], padd(pscale(Y3_v, Fr(1, 2) * uv), pscale(g4, Fr(1, 2)))),
                padd(pscale(Y1_v, Fr(1, 2)), padd(pscale(Y2_v, Fr(1, 4)), pscale(xap, Fr(1, 2)))),
            )

            S_C = padd(
                padd(pmul(C00, pmul(b0_v, b0_v)), pmul(C11, pmul(b1_v, b1_v))),
                padd(
                    pmul(C22, pmul(b2_v, b2_v)),
                    pscale(
                        padd(pmul(C01, pmul(b0_v, b1_v)), padd(pmul(C02, pmul(b0_v, b2_v)), pmul(C12, pmul(b1_v, b2_v)))),
                        Fr(2),
                    ),
                ),
            )
            L0 = padd(pmul(C00, b0_v), padd(pmul(C01, b1_v), pmul(C02, b2_v)))
            quad_v = padd(
                psub(pmul(M33_v, S_C), pmul(pmul(M03_v, M03_v), Q12)),
                psub(pmul(D3, pmul(b3_v, b3_v)), pscale(pmul(M03_v, pmul(b3_v, L0)), Fr(2))),
            )
            det5_r = psub(pmul(psub(compose_r2(q1_v), [Fr(0), Fr(1)]), compose_r2(D4top_v)), compose_r2(quad_v))
            ok_a4 = positive_on(A4_v, u0, u1)
            ok_d4 = positive_on(D4top_v, u0, u1)
            ok_det5 = positive_on(det5_r, a_lo, b_hi)
        else:
            vA4 = psub(pmul(vv, A4_base), pscale(pmul(g4, g4), Fr(1) / (2 * mu_T)))
            vM33 = padd([Fr(0), mu_rho], vA4)
            vM03 = pscale(padd(vY3, vY4), Fr(-1, 2))
            v2D4top = psub(pmul(vv, pmul(vM33, D3)), pmul(pmul(vM03, vM03), C00))

            v_tau_sum = padd(pscale(pmul(g34, g34), Fr(1) / (4 * mu_w)), pscale(pmul(g3, g3), Fr(1) / (4 * mu_w1)))
            vb0 = psub(pmul(vv, b0_lin), pscale(v_tau_sum, Fr(1, 2)))
            vb3 = psub(
                padd(
                    pmul(vv, padd([Fr(0), Fr(1, 2) * sig_vr], pscale(g4, Fr(1, 2)))),
                    pscale(vY3, Fr(1, 2) * uv),
                ),
                padd(pscale(vY1, Fr(1, 2)), padd(pscale(vY2, Fr(1, 4)), pmul(vv, pscale(xap, Fr(1, 2))))),
            )

            c01_b12 = padd(pmul(C01, b1_v), pmul(C02, b2_v))
            c11_22 = padd(pmul(C11, pmul(b1_v, b1_v)), padd(pscale(pmul(C12, pmul(b1_v, b2_v)), Fr(2)), pmul(C22, pmul(b2_v, b2_v))))
            v2_SC = padd(pmul(C00, pmul(vb0, vb0)), padd(pscale(pmul(vv, pmul(vb0, c01_b12)), Fr(2)), pmul(vv2, c11_22)))
            vL0 = padd(pmul(C00, vb0), pmul(vv, c01_b12))
            v3_quad = padd(
                psub(pmul(vM33, v2_SC), pmul(vv, pmul(pmul(vM03, vM03), Q12))),
                psub(pmul(vv, pmul(D3, pmul(vb3, vb3))), pscale(pmul(vM03, pmul(vb3, vL0)), Fr(2))),
            )
            vq1_r = psub(compose_r2(pmul(vv, q1_v)), [Fr(0), Fr(0), Fr(0), Fr(1)])
            v3_det5_r = psub(pmul(vq1_r, compose_r2(v2D4top)), compose_r2(v3_quad))
            ok_a4 = positive_on(vA4, u0, u1)
            ok_d4 = positive_on(v2D4top, u0, u1)
            ok_det5 = positive_on(v3_det5_r, a_lo, b_hi)

        if not (ok_a4 and ok_d2 and ok_d3 and ok_d4 and ok_det5):
            nfail += 1
            if not quiet:
                print(
                    "   (C2) FAILS on",
                    "tail" if tail else "interval %d [%s, %s]" % (k, e[k], e[k + 1]),
                    "a4=%s d2=%s d3=%s d4=%s det5=%s" % (ok_a4, ok_d2, ok_d3, ok_d4, ok_det5),
                )
        if not tail:
            G_val = [peval(g1, u1), peval(g2, u1), peval(g3, u1), peval(g4, u1)]

    # (C3) Exact rational weak duality over P_1 and E_sec at s_lo and s_hi
    s_lo = Fr(row["s_lo"])
    s_hi = Fr(row["s_hi"])
    mode = row["v3_mode"]
    require(mode in ("young", "holder"), "invalid v3_mode")
    if mode == "young":
        gy = Fr(row["g_young"])
        require(gy > 0, "g_young must be positive")
        mult_G6 = u3 * (1 + 10 * gy)
    else:
        s_mid = Fr(1, 2) * (s_lo + s_hi)
        q_mid = root4_lo(2 + s_mid)
        mult_G6 = u3

    dlin = [
        u2 * (16 * m00 + 32 * m01 + 32 * m11),
        u2 * (4 * m00 + 16 * m11),
        u2 * (16 * m11 + 32 * (mu_a + mu_rho + sig_vr + tau_vr)),
        u2 * (48 * m01 + 48 * m11 + 24 * (mu_a + mu_rho + mu_w + tau_vr) + 48 * sig_vr),
        u2 * (16 * m01 + 16 * m11),
    ]

    c_DF = lam2 + mu_a + mu_rho + sig_vr + Fr(1, 8) * mu_F4
    c_dd = max(Fr(0), lam2 + 2 * m_del)
    sec_DF_w = [Fr(4), Fr(0), Fr(0), Fr(4), Fr(4)]
    sec_ed_w = [Fr(1), Fr(2), Fr(1), Fr(0), Fr(2)]
    sec_T2_w = [Fr(12), Fr(10), Fr(4), Fr(4), Fr(22)]
    M_sec = len(b_sec)

    bounds = {}
    for end, s_e in (("lo", s_lo), ("hi", s_hi)):
        # 1) Sector dual bound B_sec(s_e):
        sd = row["sec_dual"][end]
        y_sec = [Fr(x) for x in sd["y_sec"]]
        require(len(y_sec) == M_sec and all(y >= 0 for y in y_sec), "invalid y_sec")
        th12 = Fr(sd["theta_12"])
        require(th12 > 0, "theta_12 must be positive")
        sec_dd_w = [4 * (1 + th12), 8 * (1 + Fr(1) / th12), Fr(8), Fr(0), Fr(16)]

        if mode == "holder":
            # 4-term AM-GM: (2 + s_G)^{3/4} <= (8 + s_mid + 3 s_G) / (4 q_mid)
            psi34_hi = Fr(8 + s_mid + 3 * s_e) / (4 * q_mid)
            hol_pref = 30 * lam3 * pv * u_32 * psi34_hi
            a_hol = [Fr(x) for x in sd["a_hol"]]
            require(len(a_hol) == 5 and all(a > 0 for a in a_hol), "a_hol must be positive")
            b_hol = [((hol_pref * KAPPA_HI[s]) ** 2) / (4 * a_hol[s]) for s in range(5)]
            V3_p_c = 6 * (pv ** 3) + 30 * (pv ** 2) * uv + 15 * pv * u2 * (2 + s_e)
        else:
            a_hol = [Fr(0)] * 5
            b_hol = [Fr(0)] * 5
            V3_p_c = 6 * (pv ** 3) * (1 + Fr(5) / (gy * gy)) + 30 * (pv ** 2) * uv

        rem_sum = Fr(0)
        for s_idx in range(5):
            lhs_s = (
                c_DF * pv * sec_DF_w[s_idx]
                + c_dd * pv * sec_dd_w[s_idx]
                + mu_w1 * pv * sec_ed_w[s_idx]
                + 15 * lam3 * (pv * pv) * sec_T2_w[s_idx]
                + a_hol[s_idx]
            )
            cov_s = sum(y_sec[m] * A_sec[m][s_idx] for m in range(M_sec))
            if lhs_s > cov_s:
                rem_sum += lhs_s - cov_s
        B_sec = sum(y_sec[m] * b_sec[m] for m in range(M_sec)) + sum(b_hol) + uv * rem_sum

        # 2) Contraction polytope dual bound B_par(s_e):
        V3_base = V3_p_c + mult_G6 * (6 + 9 * s_e)
        const_base = (
            lam0 + lam1 + lam2 * (2 + u2 * s_e) + Fr(1, 2) * mu_T * pv + Fr(1, 2) * mu_vr * (pv * pv)
        )
        if s_e == 0:
            bounds[end] = const_base + lam3 * V3_base + B_sec
            continue

        pd = row["par"][end]
        al = [Fr(x) for x in pd["alpha"]]
        require(len(al) == 2 and all(x > 0 for x in al), "alpha > 0 failed")
        dJ = [
            mult_G6 * (
                l3[1] * (150 * al[0] * S0[i] + (198 + Fr(150) / al[0]) * H0[i])
                + l3[2] * (Fr(135, 2) * al[1] * S0[i] + (Fr(11781, 32) + Fr(135, 2) / al[1]) * H0[i])
            )
            for i in range(5)
        ]
        sb = Fr(pd["sqrt_ub"])
        require(sb > 0 and sb * sb >= s_e, "sqrt_ub failed")
        c_vec = [dlin[i] + sb * dJ[i] for i in range(5)]
        eta = Fr(pd["eta"])
        resid = [c_vec[i] - eta * EROW[i] for i in range(5)]
        for typ, theta, yv in pd["cuts"]:
            yv = Fr(yv)
            require(yv >= 0, "negative cut multiplier")
            a_ = cut_vector(typ, None if theta is None else Fr(theta))
            resid = [resid[i] + yv * a_[i] for i in range(5)]
        L_par = eta + sum(max(resid[i], Fr(0)) * PMAX[i] for i in range(5))
        bounds[end] = (
            const_base
            + l3[0] * (V3_base + mult_G6 * C6 * s_e * sb)
            + (l3[1] + l3[2]) * V3_base
            + s_e * L_par
            + B_sec
        )

    return dict(ok=(nfail == 0), bound=max(bounds.values()), bounds=bounds, K=K)


def _verify_stein_ray_task(args):
    idx, ray_entry, B_rows, knot_sets, quiet = args
    abc = ray_entry["abc"]
    a_r, b_r, c_r = abc
    pv = Fr(a_r * a_r, c_r * c_r)
    uv = Fr(b_r * b_r, c_r * c_r)
    R_ray = Fr(ray_entry["R"])
    d_cut = Fr(ray_entry["d_cut"])
    require(0 <= d_cut < uv, "invalid d_cut")
    if d_cut == 0:
        require(PI_HI / 4 <= R_ray * R_ray, "d_cut=0 requires sqrt(pi)/2 <= R_ray")
    else:
        require(envelope(d_cut)[1] <= R_ray, "envelope(d_cut) > R_ray on ray %d" % idx)
    A_sec, b_sec = build_sector_polytope(pv, d_cut, R_ray, B_rows)
    rows = ray_entry["rows"]
    require(len(rows) >= 1, "empty Stein rows on ray %d" % idx)
    prev_s = Fr(0)
    worst_r = Fr(0)
    for r_i, row in enumerate(rows):
        s_lo, s_hi = Fr(row["s_lo"]), Fr(row["s_hi"])
        require(s_lo == prev_s and s_hi > s_lo, "non-contiguous s_G slab on ray %d row %d" % (idx, r_i))
        prev_s = s_hi
        res = verify_spiked_row(row, abc, A_sec, b_sec, knot_sets, quiet=quiet)
        require(res["ok"], "Sturm failure on ray %d row %d" % (idx, r_i))
        if res["bound"] > worst_r:
            worst_r = res["bound"]
    require(prev_s >= 42, "ray %d s_G cover stops at %s < 42" % (idx, prev_s))
    require(worst_r < R_ray, "ray %d Stein worst %s >= R_ray %s" % (idx, dec_ceil10(worst_r), R_ray))
    msg = (
        "  ray %2d [stein ] abc=%-15s p=%s  sG in [0, %s] (%d rows): max <= %s < R=%s  PASS"
        % (idx, str(tuple(abc)), dec_floor5(pv), prev_s, len(rows), dec_ceil10(worst_r), R_ray)
    )
    return idx, len(rows), msg


# ------------------------------------------------------------------ global polygon & mid-t payoff checks
def verify_certificate(cert, quiet=False, jobs=None):
    t0 = perf_counter_ns()
    r1 = Fr(cert["claim"])
    # Check strictly below unsymmetrised barrier sqrt(9 * pi / 32) > sqrt(9 * PI_LO / 32):
    require(r1 * r1 < Fr(9, 32) * PI_LO, "claim does not beat unsymmetrised barrier sqrt(9*pi/32)")

    c_bank = [Fr(x) for x in cert["c_bank"]]
    B_rows = [sector_B_upper(c) for c in c_bank]
    knot_sets = cert["knot_sets"]

    # 1. Left closure 0 <= t <= t_left via 4.18e:
    t_left = Fr(cert["t_left"])
    require(t_left > 0, "t_left must be positive")
    lhs_left = RHO0_REV * RHO0_REV + (1 - C_ELL * C_ELL) * t_left * t_left
    require(lhs_left < r1 * r1, "4.18e left closure exceeds r_1^2 at t_left")
    if not quiet:
        print(
            "[1] Left closure 0 <= t <= %s (4.18e): max sqrt(t^2+s^2) <= %s < %s  PASS"
            % (t_left, dec_ceil10(root_interval(lhs_left)[1]), r1)
        )

    # Parse rays and check Pythagorean triples & strict slope ordering first:
    certified_rays = []
    for idx, ray_entry in enumerate(cert["rays"]):
        abc = ray_entry["abc"]
        require(len(abc) == 3 and all(isinstance(x, int) and x > 0 for x in abc), "invalid abc")
        a_r, b_r, c_r = abc
        require(a_r * a_r + b_r * b_r == c_r * c_r, "non-Pythagorean ray %s" % (abc,))
        require(ray_entry["kind"] in ("stein", "analytic_418g"), "unknown ray kind: " + str(ray_entry["kind"]))
        certified_rays.append((abc, Fr(a_r, c_r), Fr(b_r, c_r), Fr(ray_entry["R"])))

    M = len(certified_rays)
    require(M >= 1, "empty rays")
    for j in range(M - 1):
        ell0, m0 = certified_rays[j][1], certified_rays[j][2]
        ell1, m1 = certified_rays[j + 1][1], certified_rays[j + 1][2]
        require(ell0 * m1 < ell1 * m0, "rays must be strictly ordered by increasing a_j / b_j")

    # Check convex-quadratic slab cover on [t_left, t_right] with t_right^2 >= PI_HI / 4:
    t_right = Fr(cert["t_right"])
    require(t_right > t_left and t_right * t_right >= PI_HI / 4, "t_right must cover sqrt(pi)/2")
    taus = [Fr(x) for x in cert["t_slabs"]]
    require(len(taus) == M + 1 and taus[0] == t_left and taus[M] == t_right, "invalid t_slabs endpoints")
    require(all(taus[j] <= taus[j + 1] for j in range(M)), "t_slabs must be nondecreasing")

    worst_poly_sq = lhs_left
    for j in range(M):
        _, ell_j, m_j, R_j = certified_rays[j]
        for t_end in (taus[j], taus[j + 1]):
            s_ub = max(Fr(0), (R_j - ell_j * t_end) / m_j)
            val_sq = t_end * t_end + s_ub * s_ub
            require(val_sq < r1 * r1, "polygon slab %d endpoint t=%s exceeds r_1^2" % (j, t_end))
            if val_sq > worst_poly_sq:
                worst_poly_sq = val_sq

    # Check degree-5 sector-free mid-t cutoffs (if present in cert):
    midt_res = {}
    if "degree5_midt" in cert:
        d5 = cert["degree5_midt"]
        e_g = Fr(39, 50)
        eta_g = Fr(779, 10000)
        target_g = Fr(500, 701)
        e_hat = Fr(25, 31)
        m_mass = Fr(2141, 3906)
        S_mass = Fr(3798855002922010337121170986221578569, 22939068096000000000000000000000000000)

        regimes = {
            "parseval": (Fr(34554022, 10**8), eta_g, Fr(1) - eta_g, e_g - eta_g),
            "lean_mass": (
                Fr(35859076, 10**8),
                eta_g * (1 + S_mass / m_mass),
                Fr(1) - eta_g,
                e_g - eta_g * e_hat / m_mass,
            ),
        }
        for reg_name, (t_ell_end, a0, a2, b2) in regimes.items():
            if reg_name not in d5:
                continue
            spec = d5[reg_name]
            t_star = Fr(spec["t_cutoff"])
            t_next = t_star + Fr(1, 10**8)
            segs = spec["segments"]
            prev_t = t_ell_end
            for seg in segs:
                r_idx = seg["ray_idx"]
                t_hi_seg = Fr(seg["t_hi"])
                require(0 <= r_idx < M and t_hi_seg >= prev_t, "invalid mid-t segment")
                _, ell_j, m_j, R_j = certified_rays[r_idx]
                for t_pt in (prev_t, t_hi_seg):
                    s_ub = max(Fr(0), (R_j - ell_j * t_pt) / m_j)
                    V_ub = a0 + a2 * t_pt * t_pt + b2 * s_ub * s_ub
                    require(V_ub < target_g, "%s payoff >= 500/701 at t=%s" % (reg_name, t_pt))
                prev_t = t_hi_seg
            require(prev_t == t_star, "%s segments end at %s != %s" % (reg_name, prev_t, t_star))
            min_V_next = min(
                a0 + a2 * t_next * t_next + b2 * (max(Fr(0), (Rj - lj * t_next) / mj) ** 2)
                for (_, lj, mj, Rj) in certified_rays
            )
            require(min_V_next > target_g, "%s next 10^-8 step not tight" % reg_name)
            midt_res[reg_name] = t_star

    # 2. Verify every Pythagorean ray's bound R_j (Stein-covered or right-analytical 4.18g):
    stein_tasks = []
    ray_msgs = {}
    total_stein_rows = 0
    for idx, ray_entry in enumerate(cert["rays"]):
        if ray_entry["kind"] == "stein":
            stein_tasks.append((idx, ray_entry, B_rows, knot_sets, quiet))
        else:
            abc = ray_entry["abc"]
            a_r, b_r, c_r = abc
            pv = Fr(a_r * a_r, c_r * c_r)
            uv = Fr(b_r * b_r, c_r * c_r)
            R_ray = Fr(ray_entry["R"])
            env_hi = envelope(uv)[1]
            require(env_hi <= R_ray, "analytic_418g envelope(1-p) > R_ray on ray %d" % idx)
            ray_msgs[idx] = (
                "  ray %2d [4.18g ] abc=%-15s p=%s  F(1-p) <= %s <= R=%s  PASS"
                % (idx, str(tuple(abc)), dec_floor5(pv), dec_ceil10(env_hi), R_ray)
            )

    if jobs is None:
        jobs = min(len(stein_tasks), os.cpu_count() or 1) if len(stein_tasks) > 1 else 1
    if jobs <= 1 or len(stein_tasks) <= 1:
        stein_results = [_verify_stein_ray_task(t) for t in stein_tasks]
    else:
        with ProcessPoolExecutor(max_workers=jobs) as ex:
            stein_results = list(ex.map(_verify_stein_ray_task, stein_tasks))

    for idx, nrows, msg in stein_results:
        total_stein_rows += nrows
        ray_msgs[idx] = msg

    if not quiet:
        for idx in range(M):
            print(ray_msgs[idx], flush=True)

    worst_r1_hi = root_interval(worst_poly_sq)[1]
    if not quiet:
        print(
            "[3] Support-polygon slab cover [%s, %s] (%d rays, %d Stein rows): sup sqrt(t^2+s^2) <= %s < %s  PASS"
            % (t_left, t_right, M, total_stein_rows, dec_ceil10(worst_r1_hi), r1)
        )
        for reg_name, t_star in midt_res.items():
            print(
                "[4] Degree-5 sector-free cutoff (%s): V < 500/701 for all t <= %s (tight at +10^-8)  PASS"
                % (reg_name, dec_floor8(t_star))
            )

    dt_cs = (perf_counter_ns() - t0) // 10_000_000
    if not quiet:
        print(
            "VERIFIED: rho_s <= %s (max <= %s < sqrt(9*pi/32)) across all dimensions n >= 1  [%d.%02ds]"
            % (r1, dec_ceil10(worst_r1_hi), dt_cs // 100, dt_cs % 100)
        )
    return dict(ok=True, r1=r1, worst_r1_hi=worst_r1_hi, midt=midt_res)


def main():
    default_cert = os.path.join(os.path.dirname(os.path.abspath(__file__)), "cert_spiked.json")
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    path = args[0] if args else default_cert
    quiet = "--quiet" in sys.argv
    jobs = 1 if "--seq" in sys.argv else None
    with open(path, encoding="utf-8") as fh:
        cert = json.load(fh)
    verify_certificate(cert, quiet=quiet, jobs=jobs)


if __name__ == "__main__":
    main()
