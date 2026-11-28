#!/usr/bin/env python3
"""Primary exact pure-stdlib Sturm verifier of the Real Level-2 Malliavin-Stein certificate.

Usage:  python3 -IB verify.py [CERT.json] [--quiet] [--generic]

Only the Python standard library is used (fractions, json, math, pathlib, re, sys, time).
Zero floating-point operations occur anywhere in this file (`float` is never called) and zero `assert`
statements are used (`-O`-safe `require(...)` throughout).

============================================================================================
WHAT THIS SCRIPT VERIFIES EXACTLY (Issues #501, #506, #458; conjecture-K/STATUS.md 3.6, 3.7, 3.21):

1. Contiguous Pure Level-2 Real Malliavin-Stein Carré-du-Champ Cover across kappa_4(F) in [0, 90]:
   For every n >= 1 and every unit-variance F = I_3(T)/sqrt(6) in V_3(R^n) (traced or untraced),
   put r = |F|, V = F^2, tau = ||DF||^2 / 3, eta = ||D^2 F||_HS^2 / 6 = X^T M X,
   sigma_r = sgn(F) <DF, D tau>/2, nu_r = sgn(F) <DF, D eta>/2,
   w_tau = ||D tau||^2, w_{tau,eta} = <D tau, D eta>, w_eta = ||D eta||^2,
   with tensor invariants m = tr(M^2), u = ||U_tilde||_HS^2 (0 <= u <= m <= 1, kappa_4(F) = 36 m + 54 u).
   On each slab s = kappa_4(F) in [s_lo, s_hi] (covering [0, 90] contiguously):
     - Checks M_ker > 0 (2x2), M_w > 0 (2x2), lam_3 > 0, exact compact-support sums
       G_2(r_K) == 0, G_3(r_K) == 0, psi_4(0) == psi_4(r_K) == 0, psi_7(0) == psi_7(r_K) == 0;
     - On each finite interval [r_k, r_{k+1}] (k = 0 .. K - 1) and on the infinite ray [r_K, oo),
       verifies in exact integer Sturm arithmetic:
         * D_B(r) = A_e(r) t_2(r) - (3/2) l_B(r)^2 > 0  (certifying A_e eta + l_B sigma_r + t_2 tau^2 >= 0);
         * tau_{3,k}(r) - T_{3,exact}(r) > 0            (certifying Q_w + l_A sigma_r + L_nu nu_r + tau_{3,k} tau >= 0);
         * Sylvester minors m_11 > 0, M_2(r) > 0 (deg <= 2), M_3(r) = det P_k(r) > 0 (deg <= 6)
           of the 3x3 polynomial matrix P_k(r) on (1, tau, eta), certifying RHS(X) > r = |F(X)| everywhere;
     - Certifies E[RHS] < B across ALL (s, m, u) in the slab via exact convexity of s^(3/2)
       (rational upper bounds sig_lo^2 >= s_lo^3, sig_hi^2 >= s_hi^3), concavity of -s^2
       (-s^2 <= s_mid^2 - 2 s_mid s), and integer Sturm positivity on x = sqrt(u/m) in [x_lo, 1]
       of both N_*(x) > 0 (deg 4) and N_*(x)^2 - lam_3^2 sig_*^2 P_6(x)^2 (36 + 54 x^2) > 0 (deg 8).

   Default theorem claims verified across V_3(R^n):
     - Global real bound:       E|F| <= (3999/5000) ||F||_2 = 0.7998 ||F||_2 < (4/5) ||F||_2 < sqrt(17/25) ||F||_2
                                unconditionally for every n >= 1 and every F in V_3(R^n) (closing #501 and #506);
     - Sharp Gaussian regime:   E|F| <= (3989/5000) ||F||_2 = 0.7978 ||F||_2 < sqrt(2/pi) ||F||_2
                                across all kappa_4(F) in [14, 90] (refs #458).

2. Exact U(1) Phase-Averaging Transfer to Complex Cubic Chaos H_{2,1}(C^n):
   Using Machin enclosures pi_lo < pi < pi_hi, certifies for every q in H_{2,1}(C^n):
     - Global complex cubic radius:  E|q| <= (2221/2500) ||q||_2 = 0.8884 ||q||_2;
     - Sharp high-chi regime:        E|q| <= (4431/5000) ||q||_2 = 0.8862 ||q||_2 < (sqrt(pi)/2) ||q||_2
                                     across all chi(q) in [28/3, 42].

3. Exact Downstream Rational Cutoffs in `research/higher-degree/STATUS.md` (1.12, 4.12, 4.18a, 4.18e, 4.18f):
   Verifies exact t = 0 caps (`deg7_1403_cap`, `deg5_1402_cap`) and strict bracketed cutoffs for
   `4.18a`, `4.18e` (Parseval, sixth-moment clipping on [0, oo), Lean mass), and `4.18f` (24 Lean
   spectral mass witnesses, both pure rho_0-only and with reviewed KNG505 slope S_cplx = 26449/5000000).
============================================================================================
"""
from fractions import Fraction as Fr
import json
from math import gcd, isqrt
import pathlib
import re
import sys
import time

HERE = pathlib.Path(__file__).resolve().parent
DEFAULT_CERT = HERE / 'cert_real_501.json'

C6_CPLX = Fr(4045313, 100000)
S_REAL_COVER = Fr(90)
KNG505_SLOPE = Fr(26449, 5000000)
GRAM_COEFF = Fr(3, 16)
WICK6_NEG_COEFF = 4320


def verify_structural_constants(gram_coeff=None, wick6_neg_coeff=None):
    """Tie GRAM_COEFF (3/16) and WICK6_NEG_COEFF (4320) to zero-slack concrete chaos witnesses:
    1. F(X) = X_1 X_2 X_3 in V_3(R^3) at X = (1, 1, 1): tau = eta = 1, w_tau = 16/3, w_eta = 4/3,
       sigma_r = 2, nu_r = 1; at M_w = I_2 and (l_A, L_nu) = (-16/3, -8/3), the Gram cone equals
       -20/3 + (320/9) * gram_coeff, which is >= 0 iff gram_coeff >= 3/16 (rejecting e.g. 3/20).
    2. F(X_1) = (X_1^3 - 3 X_1)/sqrt(6) in V_3(R^1) (s = 90, x = 1): E[F^6] computed directly from
       Gaussian moments E[X^{2k}] = (2k - 1)!! equals 53,745, and the sixth-moment upper bound at
       (s = 90, x = 1) equals 15 + 15*90 + P_6(1) - wick6_neg_coeff = 58,065 - wick6_neg_coeff,
       which is >= E[F^6] iff wick6_neg_coeff <= 4320 (rejecting e.g. 5000)."""
    gc = GRAM_COEFF if gram_coeff is None else Fr(gram_coeff)
    wn = WICK6_NEG_COEFF if wick6_neg_coeff is None else wick6_neg_coeff
    # Witness 1: F = X_1 X_2 X_3 at X = (1, 1, 1):
    df = (Fr(1), Fr(1), Fr(1))
    d2f = ((Fr(0), Fr(1), Fr(1)), (Fr(1), Fr(0), Fr(1)), (Fr(1), Fr(1), Fr(0)))
    tau_w = sum(x * x for x in df) / 3
    dtau = tuple(Fr(2, 3) * sum(d2f[i][j] * df[j] for j in range(3)) for i in range(3))
    deta = (Fr(2, 3), Fr(2, 3), Fr(2, 3))
    w_tau = sum(x * x for x in dtau)
    w_eta = sum(x * x for x in deta)
    sig_r = sum(df[i] * dtau[i] for i in range(3)) / 2
    nu_r = sum(df[i] * deta[i] for i in range(3)) / 2
    lA_w, Lnu_w = -Fr(16, 3), -Fr(8, 3)
    gram_val = w_tau + w_eta + lA_w * sig_r + Lnu_w * nu_r + gc * (lA_w * lA_w + Lnu_w * Lnu_w) * tau_w
    require(gram_val >= 0, 'unsound GRAM_COEFF < 3/16 violated by X_1 X_2 X_3 at (1, 1, 1)')

    # Witness 2: F = (X_1^3 - 3 X_1)/sqrt(6), exact Gaussian sixth moment E[(X^3 - 3X)^6] / 216:
    p_h3 = [Fr(0), Fr(-3), Fr(0), Fr(1)]
    p2 = pmul(p_h3, p_h3)
    p6_raw = pmul(p2, pmul(p2, p2))
    dfact = [Fr(1)]
    for k in range(1, 10):
        dfact.append(dfact[-1] * (2 * k - 1))
    ev3_h3 = sum(p6_raw[2 * k] * dfact[k] for k in range(len(p6_raw) // 2 + 1) if 2 * k < len(p6_raw)) / 216
    P6_at_1 = Fr(32400 + 9720 + 14580)
    ub_h3 = Fr(15 + 15 * 90) + P6_at_1 - Fr(wn)
    require(ub_h3 >= ev3_h3, 'unsound WICK6_NEG_COEFF > 4320 violated by E[h_3(X)^6] = 53745')


def require(cond, msg='verification condition failed'):
    if not cond:
        raise ValueError(msg)


def dec_ceil10(q):
    q = Fr(q)
    require(q >= 0, 'dec_ceil10 expects nonnegative Fraction')
    n = (q.numerator * 10**10 + q.denominator - 1) // q.denominator
    return '%d.%010d' % (n // 10**10, n % 10**10)


def verify_pi_bounds():
    """Certify 10-digit Machin pi enclosure pi_lo < pi < pi_hi in pure Fraction arithmetic."""
    def arctan_inv_bounds(m, n_pairs):
        s_even = Fr(0)
        m2 = m * m
        mpow = m
        for j in range(n_pairs):
            t1 = Fr(1, (4 * j + 1) * mpow)
            mpow *= m2
            t2 = Fr(1, (4 * j + 3) * mpow)
            mpow *= m2
            s_even += t1 - t2
        t_next = Fr(1, (4 * n_pairs + 1) * mpow)
        require(s_even < s_even + t_next, 'arctan alternating series ordering failed')
        return s_even, s_even + t_next

    a5_lo, a5_hi = arctan_inv_bounds(5, 12)
    a239_lo, a239_hi = arctan_inv_bounds(239, 5)
    pi_lo = 16 * a5_lo - 4 * a239_hi
    pi_hi = 16 * a5_hi - 4 * a239_lo
    require(Fr(314159265358979, 10**14) < pi_lo < pi_hi < Fr(314159265358980, 10**14), 'Machin pi enclosure failed')
    return pi_lo, pi_hi


# ==============================================================================
# PART 1: UNIVARIATE POLYNOMIALS OVER Q & EXACT INTEGER STURM SEQUENCES
# ==============================================================================
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


def pprim(p, r0, val_r0):
    q = [Fr(0)] + [c / (i + 1) for i, c in enumerate(p)]
    q[0] = val_r0 - peval(q, r0)
    return ptrim(q)


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


# ==============================================================================
# PART 2: REAL LEVEL-2 MALLIAVIN-STEIN SLAB ROW VERIFIER
# ==============================================================================
def verify_row(row):
    verify_structural_constants()
    s_lo, s_hi = Fr(row['s_lo']), Fr(row['s_hi'])
    require(0 <= s_lo < s_hi <= S_REAL_COVER, f'invalid slab [{s_lo}, {s_hi}]')
    B_bound = Fr(row['bound'])
    require(B_bound > 0, 'row bound must be positive')

    knots = [Fr(x) for x in row['knots']]
    K = len(knots) - 1
    require(K >= 2 and knots[0] == 0 and all(knots[i] < knots[i + 1] for i in range(K)), 'invalid knots')

    kden_int = row['knot_den']
    require(isinstance(kden_int, int) and kden_int > 0, 'invalid knot_den')
    kden = Fr(kden_int)

    def get_int_arr(nm, exp_len):
        raw = row[nm]
        require(isinstance(raw, list) and len(raw) == exp_len and all(isinstance(x, int) for x in raw),
                f'invalid integer array {nm}')
        return [Fr(x, kden) for x in raw]

    phi1 = get_int_arr('phi1', K + 1)
    phi2 = get_int_arr('phi2', K + 1)
    phi3 = get_int_arr('phi3', K + 1)
    psi4 = get_int_arr('psi4', K + 1)
    psi7 = get_int_arr('psi7', K + 1)
    lB = get_int_arr('lB', K + 1)
    Ae = get_int_arr('Ae', K + 1)
    t2 = get_int_arr('t2', K + 1)
    xe = get_int_arr('xe', K + 1)
    xte = get_int_arr('xte', K + 1)

    raw_tau3 = row['tau3']
    require(isinstance(raw_tau3, list) and len(raw_tau3) == K, 'invalid tau3 outer length')
    tau3 = []
    for k, sub in enumerate(raw_tau3):
        require(isinstance(sub, list) and len(sub) == 5 and all(isinstance(x, int) for x in sub),
                f'invalid tau3[{k}]')
        tau3.append([Fr(x, kden) for x in sub])

    require(len(row['tail_xi']) == 4, 'invalid tail_xi length')
    xt0_tail, xt2_tail, xe0_tail, xe2_tail = (Fr(x, kden) for x in row['tail_xi'])
    require(xt0_tail >= 0 and xt2_tail >= 0 and xe0_tail >= 0 and xe2_tail >= 0, 'negative tail_xi')

    require(len(row['lam']) == 4 and len(row['m_ker']) == 3 and len(row['m_w']) == 3 and len(row['gam']) == 2,
            'invalid scalar tuple lengths')
    lam0, lam1, lam2, lam3 = (Fr(x) for x in row['lam'])
    m00, m01, m11 = (Fr(x) for x in row['m_ker'])
    mu00, mu01, mu11 = (Fr(x) for x in row['m_w'])
    gvt, gve = (Fr(x) for x in row['gam'])

    require(lam3 > 0, 'lam3 must be strictly positive')
    require(m00 > 0 and m11 > 0 and m00 * m11 - m01 * m01 > 0, 'M_ker not strictly PD')
    Dw = mu00 * mu11 - mu01 * mu01
    require(mu00 > 0 and mu11 > 0 and Dw > 0, 'M_w not strictly PD')

    # Boundary and compact-support conditions:
    require(phi2[K] == 0 and phi3[K] == 0, 'phi2(r_K) or phi3(r_K) nonzero')
    require(psi4[0] == 0 and psi4[K] == 0, 'psi4 boundary condition failed')
    require(psi7[0] == 0 and psi7[K] == 0, 'psi7 boundary condition failed')
    for k in range(K + 1):
        require(Ae[k] > 0 and t2[k] > 0, f'Ae or t2 <= 0 at knot {k}')
        require(xe[k] >= 0 and xte[k] >= 0, f'xe or xte < 0 at knot {k}')

    g2_end = sum(Fr(1, 2) * (phi2[j] + phi2[j + 1]) * (knots[j + 1] - knots[j]) for j in range(K))
    g3_end = sum(Fr(1, 2) * (phi3[j] + phi3[j + 1]) * (knots[j + 1] - knots[j]) for j in range(K))
    require(g2_end == 0 and g3_end == 0, 'exact compact-support integral G_2(r_K)=0 or G_3(r_K)=0 violated')

    h4_0 = -sum(Fr(1, 2) * (psi4[j] + psi4[j + 1]) * (knots[j + 1] - knots[j]) for j in range(K))
    h7_0 = -sum(Fr(1, 2) * (psi7[j] + psi7[j + 1]) * (knots[j + 1] - knots[j]) for j in range(K))

    G1_v, G2_v, G3_v, H4_v, H7_v = Fr(0), Fr(0), Fr(0), h4_0, h7_0
    rv_p = [Fr(0), Fr(1)]

    for k in range(K + 1):
        tail = (k == K)
        a_lo = knots[k]
        b_hi = None if tail else knots[k + 1]

        def lin_p(arr, k=k, tail=tail, a_lo=a_lo, b_hi=b_hi):
            if tail:
                return ptrim([arr[K]])
            sl = (arr[k + 1] - arr[k]) / (b_hi - a_lo)
            return ptrim([arr[k] - sl * a_lo, sl])

        p1 = lin_p(phi1)
        xte_p = lin_p(xte)
        g1 = pprim(p1, a_lo, G1_v)

        if not tail:
            p2, p3, ps4, ps7 = lin_p(phi2), lin_p(phi3), lin_p(psi4), lin_p(psi7)
            lb_p, ae_p, t2_p, xe_p = lin_p(lB), lin_p(Ae), lin_p(t2), lin_p(xe)
            g2, g3 = pprim(p2, a_lo, G2_v), pprim(p3, a_lo, G3_v)
            h4, h7 = pprim(ps4, a_lo, H4_v), pprim(ps7, a_lo, H7_v)

            DB = psub(pmul(ae_p, t2_p), pscale(pmul(lb_p, lb_p), Fr(3, 2)))
            require(positive_on(DB, a_lo, b_hi), f'D_B <= 0 on interval {k}')

            Lsig = pscale(padd(g2, ps4), Fr(2))
            Lnu = pscale(padd(g3, ps7), Fr(2))
            lA_p = psub(Lsig, lb_p)
            q_form = padd(
                psub(pscale(pmul(lA_p, lA_p), mu11), pscale(pmul(lA_p, Lnu), 2 * mu01)),
                pscale(pmul(Lnu, Lnu), mu00),
            )
            T3_exact = pscale(q_form, GRAM_COEFF / Dw)

            p_w1 = pscale([-a_lo, Fr(1)], Fr(1) / (b_hi - a_lo))
            T3_p, pw = [], [Fr(1)]
            for m in range(5):
                T3_p = padd(T3_p, pscale(pw, tau3[k][m]))
                pw = pmul(pw, p_w1)
            require(positive_on(psub(T3_p, T3_exact), a_lo, b_hi), f'tau3 <= T3_exact on interval {k}')

            xt_p = []
            G1_v = peval(g1, b_hi)
            G2_v = peval(g2, b_hi)
            G3_v = peval(g3, b_hi)
            H4_v = peval(h4, b_hi)
            H7_v = peval(h7, b_hi)
        else:
            require(G2_v == 0 and G3_v == 0 and H4_v == 0 and H7_v == 0, 'tail primitive nonzero at r_K')
            p2 = p3 = g2 = g3 = h4 = h7 = ae_p = t2_p = T3_p = []
            rK2 = knots[K] * knots[K]
            xt_p = ptrim([xt0_tail - xt2_tail * rK2, Fr(0), xt2_tail])
            xe_p = ptrim([xe0_tail - xe2_tail * rK2, Fr(0), xe2_tail])

        P12 = psub(padd([m01], pscale(p3, Fr(3, 2))), pscale(xte_p, Fr(1, 2)))
        P11 = psub(padd([m00], pscale(p2, Fr(3))), t2_p)

        c_eta = psub(
            padd(psub([-2 * m01 - 2 * m11, Fr(0), gve], pscale(pmul(rv_p, g3), Fr(3))),
                 psub(pscale(h4, Fr(4)), pscale(h7, Fr(2)))),
            padd(ae_p, xe_p),
        )
        P02 = pscale(c_eta, Fr(1, 2))

        c_tau = psub(
            psub(psub(padd([-2 * m00 - 2 * m01, Fr(0), gvt], pscale(psub(psub(p1, p2), p3), Fr(3))),
                      pscale(pmul(rv_p, g2), Fr(3))),
                 pscale(h4, Fr(4))),
            padd(T3_p, xt_p),
        )
        P01 = pscale(c_tau, Fr(1, 2))

        P00 = padd(
            padd([lam0 + m00 + 2 * m01 + m11, Fr(-1), lam1 - gvt - gve, Fr(0), lam2, Fr(0), lam3],
                 pscale(pmul(rv_p, psub(padd(g2, g3), g1)), Fr(3))),
            pscale(h7, Fr(2)),
        )

        M2 = psub(pscale(P11, m11), pmul(P12, P12))
        M3 = psub(
            padd(pmul(P00, M2), pscale(pmul(P01, pmul(P02, P12)), Fr(2))),
            padd(pscale(pmul(P01, P01), m11), pmul(pmul(P02, P02), P11)),
        )
        require(positive_on(M2, a_lo, b_hi), f'M2 <= 0 on interval {k}')
        require(positive_on(M3, a_lo, b_hi), f'M3 <= 0 on interval {k}')

    # --- Exact (s, x) Moment Envelope Verification ---
    sig_lo = Fr(row['sig_lo'])
    sig_hi = Fr(row['sig_hi'])
    x_lo = Fr(row['x_lo'])
    require(sig_lo >= 0 and sig_lo * sig_lo >= s_lo ** 3, 'sig_lo^2 < s_lo^3')
    require(sig_hi > 0 and sig_hi * sig_hi >= s_hi ** 3, 'sig_hi^2 < s_hi^3')
    require(0 <= x_lo < 1, 'invalid x_lo')
    if s_lo <= 36:
        require(x_lo == 0, 'x_lo must be 0 when s_lo <= 36')
    else:
        require(36 + 54 * x_lo * x_lo <= s_lo, '36 + 54 x_lo^2 > s_lo')

    s_mid = (s_lo + s_hi) / 2
    ssq_lo = 2 * s_mid * s_lo - s_mid * s_mid
    ssq_hi = 2 * s_mid * s_hi - s_mid * s_mid

    C0 = lam0 + lam1 + 3 * lam2 + 15 * lam3
    Cs = lam2 + 15 * lam3 + gvt / 3
    Cm = 8 * m00 + 8 * m01 + 2 * m11 + 16 * mu00 + 16 * mu01 + 4 * mu11 + 6 * gve
    Cu = 6 * m00 + 24 * mu00
    qx = [Fr(36), Fr(0), Fr(54)]
    qx2 = pmul(qx, qx)
    P6x = [Fr(0), Fr(32400), Fr(9720), Fr(14580)]
    P6sq_q = pmul(pmul(P6x, P6x), qx)

    for tag, s_ep, sig_ep, ssq_ep in (('lo', s_lo, sig_lo, ssq_lo), ('hi', s_hi, sig_hi, ssq_hi)):
        Nx = padd(
            psub(pscale(qx2, B_bound - C0 - s_ep * Cs), pmul([s_ep * Cm, Fr(0), s_ep * Cu], qx)),
            [WICK6_NEG_COEFF * lam3 * ssq_ep],
        )
        require(positive_on(Nx, x_lo, Fr(1)), f'moment N_{tag}(x) <= 0 on [{x_lo}, 1]')
        diff_x = psub(pmul(Nx, Nx), pscale(P6sq_q, (lam3 * sig_ep) ** 2))
        require(positive_on(diff_x, x_lo, Fr(1)), f'moment squared envelope {tag} <= 0 on [{x_lo}, 1]')

    return dict(ok=True, K=K, bound=B_bound, s_lo=s_lo, s_hi=s_hi)


# ==============================================================================
# PART 3: COMPLEX PHASE-AVERAGING TRANSFER & DOWNSTREAM DEGREE-5/7 CONSEQUENCES
# ==============================================================================
def verify_complex_transfer(claim_real, sharp_s, sharp_real, claim_cplx, sharp_chi, sharp_cplx, pi_lo, pi_hi):
    require(claim_real > 0 and claim_cplx > 0, 'claims must be positive')
    # Check claim_real < sqrt(17/25):
    require(claim_real * claim_real < Fr(17, 25), 'claim_real >= sqrt(17/25)')
    # Check (pi / (2*sqrt(2))) * claim_real < claim_cplx  <=>  pi_hi^2 * claim_real^2 < 8 * claim_cplx^2:
    require((pi_hi ** 2) * (claim_real ** 2) < 8 * (claim_cplx ** 2),
            'U(1) phase-averaging bound exceeds claim_complex')

    if sharp_s is not None:
        require(sharp_real > 0 and sharp_cplx > 0 and sharp_chi > 0, 'sharp claims must be positive')
        # Check sharp_real < sqrt(2/pi)  <=>  pi_hi * sharp_real^2 < 2:
        require(pi_hi * (sharp_real ** 2) < 2, 'sharp_hi_claim_real >= sqrt(2/pi)')
        # Check kappa_4(F_theta) = (3/2) chi(q) >= sharp_s for chi >= sharp_chi:
        require(Fr(3, 2) * sharp_chi >= sharp_s, '(3/2) * sharp_hi_chi < sharp_hi_s')
        # Check (pi / (2*sqrt(2))) * sharp_real < sharp_cplx < sqrt(pi)/2:
        require((pi_hi ** 2) * (sharp_real ** 2) < 8 * (sharp_cplx ** 2),
                'U(1) phase-averaging sharp bound exceeds sharp_hi_claim_complex')
        require(4 * (sharp_cplx ** 2) < pi_lo, 'sharp_hi_claim_complex >= sqrt(pi)/2')


def verify_downstream(ds, rho, pi_lo, pi_hi):
    require(isinstance(ds, dict), 'downstream must be a dict')
    require(rho > 0, 'rho must be positive')

    # 1. Exact t = 0 caps (1.12 and 4.12):
    cap_d7 = Fr(ds['deg7_1403_cap'])
    cap_d5 = Fr(ds['deg5_1402_cap'])
    require(cap_d7 == Fr(1000, 1403) / (rho * rho), 'deg7_1403_cap formula mismatch')
    require(cap_d5 == Fr(500, 701) / (rho * rho), 'deg5_1402_cap formula mismatch')
    require(cap_d7 > Fr(90307, 100000) and cap_d5 > Fr(90372, 100000), 't=0 cap decimal check failed')

    e, eta, target = Fr(39, 50), Fr(779, 10000), Fr(500, 701)
    carrier = Fr(431, 500)

    # 2. 4.18a direct Gaussian-buffer 6-decimal cutoff (strict crossing bracket):
    t_418a = Fr(ds['d5_418a_cutoff'])
    require(t_418a > 0 and t_418a == Fr(160633, 500000), 'd5_418a_cutoff mismatch')
    c_hi = e * (rho ** 2) + (eta ** 2) / (pi_lo * e)
    c_lo = e * (rho ** 2) + (eta ** 2) / (pi_hi * e)
    require((1 - eta) * (t_418a ** 2) + c_hi < target, '4.18a upper bound fails at t_418a')
    require((1 - eta) * ((t_418a + Fr(1, 10**6)) ** 2) + c_lo > target, '4.18a next 10^-6 step does not fail')

    # 3. 4.18e elliptic Parseval & Lean-mass 8-decimal cutoffs (strict crossing brackets):
    def check_elliptic_8dec(t_val, weight, offset, label):
        require(t_val > 0, label + ' must be positive')
        intercept = offset + weight * (rho ** 2)
        sl = 1 - eta - weight * (carrier ** 2)
        require(weight > 0 and sl > 0 and target > intercept, label + ' signs failed')
        t_next = t_val + Fr(1, 10**8)
        require(intercept + sl * (t_val ** 2) < target < intercept + sl * (t_next ** 2), label + ' 10^-8 bracket failed')

    t_pars = Fr(ds['d5_418e_parseval'])
    require(t_pars == Fr(45041147, 100000000), 'd5_418e_parseval mismatch')
    check_elliptic_8dec(t_pars, e - eta, eta, '4.18e Parseval')

    mass_e = Fr(25, 31)
    mass_c = Fr(1, 2) + 2 * Fr(47, 1953)
    mass_s = Fr(3798855002922010337121170986221578569, 22939068096000000000000000000000000000)
    t_mass = Fr(ds['d5_418e_lean_mass'])
    require(t_mass == Fr(45016597, 100000000), 'd5_418e_lean_mass mismatch')
    check_elliptic_8dec(t_mass, e - eta * mass_e / mass_c, eta * (1 + mass_s / mass_c), '4.18e Lean mass')

    # 4. 4.18e sixth-moment clipping 8-decimal cutoff (Sturm on [0, oo) + next-step failure witness):
    t_clip = Fr(ds['d5_418e_sixth_moment'])
    tang = Fr(ds['d5_418e_sixth_tang'])
    s_fail = Fr(ds['d5_418e_sixth_fail_s'])
    require(t_clip > 0 and t_clip == Fr(45406137, 100000000) and tang > 0 and s_fail > 0, '4.18e sixth-moment params invalid')
    shift = Fr(21, 200)
    nu_ell = carrier * carrier
    require(e - eta - eta * (1 + 2 * shift) > 0 and 1 - eta > (e - eta + eta * shift * shift) * nu_ell,
            '4.18e clipping monotonicity failed')
    x0 = rho * rho - nu_ell * t_clip * t_clip
    z0 = ((1 + shift) ** 2) * x0
    upper0 = eta + (1 - eta) * t_clip * t_clip + (e - eta) * x0
    require(upper0 > target and 0 < x0 < 1 and 2 * z0 > 1, '4.18e clipping range failed')
    need0 = (upper0 - target) / eta + shift * shift * x0
    sc12 = 10**12
    r_up = Fr(isqrt(int(need0 * (sc12 ** 2))) + 1, sc12)
    d0 = 2 * z0 - 1 - r_up * (2 + tang * tang) / (2 * tang)
    d1 = z0 - r_up / (2 * tang)
    require(d0 > 0 and d1 > 0, '4.18e clipping unsquared positivity failed')
    poly_clip = [d0 * d0 - 6 * r_up * r_up * z0, Fr(0), 2 * d0 * d1 - 9 * r_up * r_up * z0, -C6_CPLX * r_up * r_up * z0, d1 * d1]
    require(positive_on(poly_clip, Fr(0), None), '4.18e clipping Sturm check on [0, oo) failed')

    t_clip_next = t_clip + Fr(1, 10**8)
    x1 = rho * rho - nu_ell * t_clip_next * t_clip_next
    z1 = ((1 + shift) ** 2) * x1
    gran = Fr(1, sc12)
    sq_s_up = Fr(isqrt(int(s_fail * (sc12 ** 2))) + 1, sc12)
    mlo = 6 + 9 * s_fail + C6_CPLX * s_fail * (sq_s_up - gran)
    den_lo = Fr(isqrt(int(z1 * mlo * (sc12 ** 2))), sc12) + Fr(isqrt(int((2 + s_fail) * (sc12 ** 2))), sc12)
    require(den_lo > 0, '4.18e clipping control den_lo <= 0')
    corr_hi = ((z1 * (2 + s_fail) - 1) ** 2) / (den_lo * den_lo) - shift * shift * x1
    require(eta + (1 - eta) * t_clip_next * t_clip_next + (e - eta) * x1 - eta * corr_hi > target,
            '4.18e clipping next 10^-8 point did not fail')

    # 5. 4.18f 24-spectral-mass cutoffs (pure rho_0 AND rho_0 + reviewed KNG505 slope):
    t_418f_pure = Fr(ds['d5_418f_spectral_24_pure'])
    t_418f_kng = Fr(ds['d5_418f_spectral_24_kng'])
    require(t_418f_pure == Fr(45287, 100000) and t_418f_kng == Fr(11331, 25000), '4.18f cutoffs mismatch')

    repo_root = HERE.parents[3]
    lean_text = (repo_root / 'Grothe' / 'Lower' / 'MassWitnessData.lean').read_text(encoding='utf-8')
    names = re.findall(r'def (massWit\d+) : SWit :=', lean_text)
    pool_m = re.search(r'def massWitnesses : List SWit := \[(.*?)\]', lean_text, re.S)
    require(pool_m and names == re.findall(r'massWit\d+', pool_m[1]) and len(names) == 24, '24 Lean mass witnesses check failed')
    blocks = re.findall(r'def massWit\d+ : SWit :=\s*⟨(.*?⟩),', lean_text, re.S)
    pool = []
    for blk in blocks:
        terms = [Fr(int(n_), int(d_ or 1)) for n_, d_ in re.findall(r'\((-?\d+) : ℚ\)(?:\s*/\s*(\d+))?', blk)]
        require(len(terms) == 6, 'witness arity failed')
        tau_w, a0, a1, a2, a4, a6 = terms
        require(0 < tau_w < 1 and a1 == 0 and a6 >= 0, 'witness signs failed')
        pool.append((4 * tau_w / 3, a0 + a2 + 2 * a4 + 6 * a6, a4 + 9 * a6, C6_CPLX * a6))
    require(len(pool) == 24, 'parsed witness count != 24')

    sc10 = 10**10
    down10 = lambda x: Fr((x * sc10).__floor__(), sc10)
    up10 = lambda x: -down10(-x)
    sqrt_lo10 = lambda x: Fr(isqrt(int(x * (sc10 ** 2))), sc10)
    sqrt_hi10 = lambda x: sqrt_lo10(x) + Fr(1, sc10)

    a_min = Fr(11, 20)
    t_init = Fr(45, 100)
    require((e - eta) * (rho ** 2) + eta + (1 - eta - (e - eta) * (carrier ** 2)) * (t_init ** 2) < target,
            '4.18f initial Parseval interval [0, 0.45] failed')
    require(all(e > eta * mass_e * p_ / (mass_c * sqrt_lo10(a_min)) for p_, *_ in pool), '4.18f monotonicity failed')
    r_ax = 2 * (Fr(179, 200) ** 2) - 1
    cross = 2 * sqrt_hi10(3 * (1 + r_ax * r_ax))
    tail_c = 2 * (1 + r_ax * r_ax)
    mu2 = pi_hi / 4

    def quad_max_w(qa, qb, qc, lo, hi):
        vals = [(qa * lo + qb) * lo + qc, (qa * hi + qb) * hi + qc]
        if qa < 0:
            v_ = -qb / (2 * qa)
            if lo < v_ < hi:
                vals.append((qa * v_ + qb) * v_ + qc)
        return max(vals)

    def run_418f_cover(t_end, S_cplx):
        require(t_end > t_init, 't_end must exceed t_init')
        require(eta + (1 - eta) * t_end * t_end + (e - eta) * a_min < target, '4.18f small energy failed')
        boxes = 0

        def handle_box(t0_, t1_, y0_, y1_, depth):
            nonlocal boxes
            d0_, d1_ = (carrier * t0_) ** 2, (carrier * t1_) ** 2
            au = up10(rho * rho - d0_)
            if S_cplx is not None:
                for _ in range(2):
                    if au < a_min:
                        break
                    lo_w = d0_ / (au + d0_)
                    hi_w = d1_ / (a_min + d1_)
                    sy = y1_ * y1_
                    sm = quad_max_w(sy - cross * y1_ + tail_c, cross * y1_ - 2 * sy, sy, lo_w, hi_w)
                    au = min(au, up10(mu2 * ((1 + S_cplx * sm) ** 2) - d0_))
            if au < a_min:
                boxes += 1
                return
            sq_au = sqrt_lo10(au)
            best_val = max(
                (2 * mass_e * p_ * sq_au - max(a_ + b_ * y0_**2 + d_ * y0_**3, a_ + b_ * y1_**2 + d_ * y1_**3)) / mass_c
                for p_, a_, b_, d_ in pool
            )
            if eta + (1 - eta) * t1_ * t1_ + e * au - eta * best_val < target:
                boxes += 1
                return
            require(depth < 30, f'4.18f unresolved box [{t0_}, {t1_}] x [{y0_}, {y1_}]')
            if 30 * (t1_ - t0_) > y1_ - y0_:
                tm_ = (t0_ + t1_) / 2
                handle_box(t0_, tm_, y0_, y1_, depth + 1)
                handle_box(tm_, t1_, y0_, y1_, depth + 1)
            else:
                ym_ = (y0_ + y1_) / 2
                handle_box(t0_, t1_, y0_, ym_, depth + 1)
                handle_box(t0_, t1_, ym_, y1_, depth + 1)

        handle_box(t_init, t_end, Fr(0), Fr(13, 2), 0)
        return boxes

    boxes_pure = run_418f_cover(t_418f_pure, None)
    boxes_kng = run_418f_cover(t_418f_kng, KNG505_SLOPE)
    return dict(boxes_pure=boxes_pure, boxes_kng=boxes_kng)


def verify_certificate_dict(cert, generic=False, quiet=False):
    require(isinstance(cert, dict), 'certificate must be a JSON object')
    pi_lo, pi_hi = verify_pi_bounds()

    claim_real = Fr(cert['claim_real'])
    claim_cplx = Fr(cert['claim_complex'])
    sharp_s = Fr(cert['sharp_hi_s']) if 'sharp_hi_s' in cert else None
    sharp_real = Fr(cert['sharp_hi_claim_real']) if 'sharp_hi_claim_real' in cert else None
    sharp_chi = Fr(cert['sharp_hi_chi']) if 'sharp_hi_chi' in cert else None
    sharp_cplx = Fr(cert['sharp_hi_claim_complex']) if 'sharp_hi_claim_complex' in cert else None

    if (sharp_s is not None) or (sharp_real is not None) or (sharp_chi is not None) or (sharp_cplx is not None):
        require(all(x is not None for x in (sharp_s, sharp_real, sharp_chi, sharp_cplx)),
                'incomplete sharp_hi fields')

    verify_complex_transfer(claim_real, sharp_s, sharp_real, claim_cplx, sharp_chi, sharp_cplx, pi_lo, pi_hi)

    rows = cert['rows']
    require(isinstance(rows, list) and len(rows) >= 1, 'rows must be a non-empty list')
    prev = Fr(0)
    found_sharp_start = False
    for i, row in enumerate(rows):
        s_lo, s_hi = Fr(row['s_lo']), Fr(row['s_hi'])
        require(s_lo == prev and s_hi > s_lo, f'row {i} contiguity failed: expected s_lo={prev}, got {s_lo}')
        if sharp_s is not None and s_lo == sharp_s:
            found_sharp_start = True
        prev = s_hi
    require(prev >= S_REAL_COVER, f'rows end at {prev} < 90')
    if sharp_s is not None:
        require(found_sharp_start, 'sharp_hi_s does not match any row start knot')

    if not generic:
        require(claim_real <= Fr(3999, 5000), 'default theorem mode requires claim_real <= 3999/5000')
        require(claim_cplx <= Fr(2221, 2500), 'default theorem mode requires claim_complex <= 2221/2500')
        require(sharp_s is not None and sharp_s <= Fr(14), 'default theorem mode requires sharp_hi_s <= 14')
        require(sharp_real <= Fr(3989, 5000), 'default theorem mode requires sharp_hi_claim_real <= 3989/5000')
        require(sharp_chi <= Fr(28, 3), 'default theorem mode requires sharp_hi_chi <= 28/3')
        require(sharp_cplx <= Fr(4431, 5000), 'default theorem mode requires sharp_hi_claim_complex <= 4431/5000')
        require('downstream' in cert, 'default theorem mode requires downstream dictionary')

    ds_res = verify_downstream(cert['downstream'], claim_cplx, pi_lo, pi_hi) if not generic else None

    worst_real = Fr(0)
    worst_idx = -1
    worst_hi = None

    for i, row in enumerate(rows):
        res = verify_row(row)
        b_i = res['bound']
        if b_i > worst_real:
            worst_real = b_i
            worst_idx = i
        if sharp_s is not None and res['s_lo'] >= sharp_s:
            if worst_hi is None or b_i > worst_hi:
                worst_hi = b_i
        if not quiet:
            print('row %2d [L2]  s in [%6s, %6s]  K=%2d  PASS  bound <= %s' % (
                i, row['s_lo'], row['s_hi'], res['K'], dec_ceil10(b_i)), flush=True)

    require(worst_real <= claim_real, f'worst bound {worst_real} > claim_real {claim_real}')
    if sharp_real is not None:
        require(worst_hi is not None and worst_hi <= sharp_real,
                f'worst sharp bound {worst_hi} > sharp_hi_claim_real {sharp_real}')

    return dict(
        claim_real=claim_real,
        claim_cplx=claim_cplx,
        worst_real=worst_real,
        worst_idx=worst_idx,
        worst_hi=worst_hi,
        sharp_s=sharp_s,
        sharp_chi=sharp_chi,
        downstream=ds_res,
    )


def main(argv=None):
    args = list(sys.argv[1:] if argv is None else argv)
    quiet = '--quiet' in args
    generic = '--generic' in args
    pos_args = [a for a in args if not a.startswith('--')]
    require(len(pos_args) <= 1, 'Usage: verify.py [CERT.json] [--quiet] [--generic]')
    cert_path = pathlib.Path(pos_args[0]) if pos_args else DEFAULT_CERT

    t0 = time.monotonic_ns()
    cert = json.loads(cert_path.read_text(encoding='utf-8'))
    out = verify_certificate_dict(cert, generic=generic, quiet=quiet)
    dt_ms = (time.monotonic_ns() - t0) // 1_000_000

    print('Real Level-2 Sturm [0, 90]: all %d rows PASS, worst row = %d, max bound <= %s' % (
        len(cert['rows']), out['worst_idx'], dec_ceil10(out['worst_real'])))
    print('GLOBAL REAL CLAIM (#501, #506)  E|F| <= %s ||F||_2 < sqrt(17/25) ||F||_2  on ALL V_3(R^n):  VERIFIED  [%d ms, zero floats]' % (
        cert['claim_real'], dt_ms))
    if out['worst_hi'] is not None:
        print('SHARP GAUSSIAN CLAIM (#458)     E|F| <= %s ||F||_2 < sqrt(2/pi) ||F||_2  on kappa_4 in [%s, 90]:  VERIFIED (max <= %s)' % (
            cert['sharp_hi_claim_real'], out['sharp_s'], dec_ceil10(out['worst_hi'])))
        print('COMPLEX CUBIC RADIUS (3.6, 3.7) E|q| <= %s ||q||_2 globally;  <= %s ||q||_2 < (sqrt(pi)/2)||q||_2 on chi in [%s, 42]:  VERIFIED' % (
            cert['claim_complex'], cert['sharp_hi_claim_complex'], out['sharp_chi']))
    if out['downstream'] is not None:
        ds = cert['downstream']
        print('DOWNSTREAM CONSEQUENCES VERIFIED: deg7_cap=%s, deg5_cap=%s, 4.18a=%s, 4.18e=(%s, %s, %s), 4.18f_pure=%s (%d boxes), 4.18f_kng=%s (%d boxes)' % (
            ds['deg7_1403_cap'], ds['deg5_1402_cap'], ds['d5_418a_cutoff'],
            ds['d5_418e_parseval'], ds['d5_418e_sixth_moment'], ds['d5_418e_lean_mass'],
            ds['d5_418f_spectral_24_pure'], out['downstream']['boxes_pure'],
            ds['d5_418f_spectral_24_kng'], out['downstream']['boxes_kng']))


if __name__ == '__main__':
    main()
