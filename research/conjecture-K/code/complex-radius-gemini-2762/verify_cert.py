#!/usr/bin/env python3
"""Exact verifier of third-order complex-radius certificates (label C: exact rationals, no floats).

Usage:  python3 -I verify_cert.py CERT.json [--quiet] [--partial]

Only the Python standard library is used (fractions, json, math, sys).  Every number read from the
certificate is an exact integer or rational string, and every arithmetic operation and comparison is
performed in exact arbitrary-precision integers and Fractions.

For each row the verifier proves, for every n >= 1 and every Wick cubic q in H_{2,1}(C^n) normalised
to u = E|q|^2 = 1 with excess fourth moment s = E|q|^4 - 2 in [s_lo, s_hi]:

        E|q| <= max(B(s_lo), B(s_hi)),

checks that the rows partition [0, 42] contiguously (s <= 42 is a Lean theorem), and checks that the
maximum bound across all rows is strictly below the rational claim (9157/10000 < 0.916).

============================================================================================
NOTATION.
  z = (z_1, ..., z_n) i.i.d. standard complex Gaussians (E|z_j|^2 = 1, E z_j^2 = 0);
  d_j = d/dz_j,  dbar_j = d/dconj(z_j)  (Wirtinger derivatives);
  q in H_{2,1}(C^n) with u = E|q|^2 = 1,  V = |q|^2,  r = sqrt(V),  F_k = dbar_k q in H_{2,0}(C^n);
  c_1 = sum_j |d_j q|^2 >= 0,   c_2 = sum_k |F_k|^2 >= 0,   a = sum_j (d_j q) F_j;
  W_k = sum_j F_j (d_j F_k) in H_{3,0}(C^n),   w = sum_k |W_k|^2 >= 0,   b_loc = sum_k conj(F_k) W_k;
  on {V > 0}:  rho = Re(conj(q)^2 a)/V,   alpha_2 = |a|^2,   tilde_beta = Re(conj(q) b_loc).

ANALYTIC INPUTS (proved in sources/complex-radius-2026-11-17-gemini-2762/PROOF.md and checked on
polynomial instances up to dimension 6 by check_identities_exact.py):
 (F1) Antiholomorphic Stein identities, for real tests g_i = G_i/v in C^1[0, oo) with g_i, g_i' of
      polynomial growth (phi_i = G_i' = g_i + v g_i',  Y_i = phi_i - G_i/v = v g_i'):
        (I)   E[G_1(V) - c_2 phi_1(V) - rho Y_1(V)] = 0
        (II)  E[G_2(V) - (1/2) c_1 phi_2(V) - (1/2) rho Y_2(V)] = 0
        (III) E[c_2(c_2 - 1) phi_3(V) - (c_2 - 1) G_3(V) + (c_2 - 1) rho Y_3(V) + tilde_beta g_3(V)] = 0
        (IV)  E[alpha_2 phi_4(V) - rho G_4(V) + c_2 rho Y_4(V) + tilde_beta g_4(V)] = 0
      (I) and (II) are Lemma 1 of sources/antiholomorphic-stein-2026-11-16/NOTE.md (ledger 6.3.20)
      applied to conj(q) g_i(V) in its two forms.  (III) and (IV) apply Form I of Lemma 1
      (E[H q] = sum_j E[(d_j H) F_j]) to H = conj(q)(c_2 - 1) g_3(V) and H = q conj(a) g_4(V), using
      d_j conj(F_k) = 0 (F_k is holomorphic) and dbar_j a = W_j (since dbar_j F_k = 0 on H_{2,1}), so
      d_j conj(a) = conj(W_j) with no second-derivative remainder.
      Regularity: in every row, phi_i is continuous, piecewise linear in v on 0 = u_0 < u_1 < ... < u_K
      and constant on [u_K, oo) (plus slope_i * v for i = 1, 2; slope = 0 for i = 3, 4).  Hence G_i is
      C^1 on [0, oo), affine-quadratic a_i v + (b_i/2) v^2 on [0, u_1], so g_i(v) = G_i(v)/v equals
      a_i + (b_i/2) v near 0 and has continuous derivative g_i'(v) = Y_i(v)/v across every knot u_k > 0;
      thus g_i in C^1[0, oo) literally, with g_3, g_4 bounded and g_1, g_2 of at most linear growth.
 (F2) Pointwise inequalities (Cauchy-Schwarz):
        c_1 >= 0,  c_2 >= 0,  rho^2 <= alpha_2 <= c_1 c_2,  w >= 0,  tilde_beta^2 <= V c_2 w.
 (F3) First and second moments in the five contraction scalars pi = (n, h, b, y, z) of the normalised
      tensor (Grothe/LowerAnalytic/GramTensor.lean, GramSpectral.lean; REVIEW.md of KRR §2):
        s = 32n + 8h + 32b + 96y                                   [Lean: Circular.fourth_moment_contractions]
        E[(c_2 - 1)^2]          = 16n + 4h                         [KAS Thm 2(d); KRR REVIEW §2.2]
        2 E[(c_2 - 1)(c_1 - 2)] = 32n + 48y + 16z                  [from E(c_1+c_2-3)^2 - E(c_2-1)^2 - E(c_1-2)^2]
        E[(c_1 - 2)^2]          = 32n + 16h + 16b + 48y + 16z      [KRR check_budgets_exact.py, REVIEW §2.3]
        E[alpha_2] = E|a|^2     = 32b + 24y,  E[rho^2] <= 32b+24y  [Lean: AB_eq, radR_sq_le]
        E[V rho]                = 32b + 48y                        [Lean: N_eq]
        E[w] = sum_k E|W_k|^2   = 24y                              [KAS Thm 2(c); KRR REVIEW §2.3 step 5]
      and the homogeneous Lean inequalities on pi = (n, h, b, y, z):
        n, h, b, y, z >= 0,  b <= n,  y <= z,  z^2 <= n h,  m := n + b + 3y - z >= 0,
        (3y - z)^2 <= h m,  h_0 >= 0,  s_0 >= 0.
 (F4) Moments of V: E V = 1, E V^2 = 2 + s, s <= 42 (Lean: gaussian_moments, gaussian_fourth_moment_le_44),
      E V^3 <= 6 + 9s + C6 s^{3/2} with C6 = 4045313/100000 (Lean: Circular.gaussian_sixth), and for every
      alpha > 0, with s_0 = 8n + 2h + 8b + 8z, h_0 = (8n + 2h + 8b)/3 + 24y - 16z/3 (Lean: Circular.joint_sixth):
        E V^3 <= 6 + 9s + sqrt(s) (150 alpha s_0 + (198 + 150/alpha) h_0),
        E V^3 <= 6 + 9s + sqrt(s) ((135/2) alpha s_0 + (11781/32 + 135/(2 alpha)) h_0).

CHECKED EXACTLY BY THIS FILE FOR EACH ROW.
 (C1) Knot conditions at every k = 0, ..., K:
        xi_2[k] >= 0,  xi_1[k] >= 0,  xi_a[k]^2 <= 4 xi_1[k] xi_2[k]       (xi(v) in C* for all v >= 0);
        psi_a[k] >= 0,  psi_a[k] + mu_a - phi_4[k] >= 0                    (holds for all v >= 0 by linearity);
        D_1(u_k) = m_00 - phi_3[k] > 0                                     (D_1(v) > 0 for all v >= 0);
        D_2(u_k) = m_11 (m_00 - phi_3[k]) - (m_01 - psi_a[k]/2)^2 > 0      (concave in v, > 0 for all v >= 0);
      and scalar signs: l_3 >= 0, sum(l_3) > 0, m_00 >= 0, m_11 > 0, m_00 m_11 >= m_01^2,
      mu_a >= 0, mu_rho > 0, mu_w > 0.
 (C2) By exact integer Sturm chains on every knot interval [e_k, e_{k+1}] (k = 0, ..., K-1) and on [e_K, oo):
        D_2(r^2) > 0,   D_3(r) > 0,   D_4(r) = det P(r) > 0,
      where D_1, D_2, D_3, D_4 are the four leading principal minors of the symmetric 4x4 matrix P(r)
      on (c_2, c_1, rho, 1) defined below (with positive factors v^2 and v^3 cleared for k >= 1, where
      v = r^2 >= e_1^2 > 0).  By Sylvester's criterion, P(r) is strictly positive definite for all r >= 0.
 (C3) At each nonzero endpoint s_e in {s_lo, s_hi}, with rational sb >= sqrt(s_e) and alpha_e > 0,
      exact weak duality over P_1 = {p >= 0 : (32,8,32,96,0).p = 1, Lean cuts} bounds
      (d_lin + sb d_J(alpha_e)).p <= L_e, giving B(s_e) = base(s_e) + s_e L_e (and B(0) = lam_0+lam_1+2lam_2+6lam_3).

SOUNDNESS PROOF (verified row => E|q| <= max(B(s_lo), B(s_hi)) for s in [s_lo, s_hi]).
  For q != 0, {V = 0} has Lebesgue measure zero.  At any point with V = v = r^2 > 0, subtract from
    RHS := lam_0 + lam_1 V + lam_2 V^2 + lam_3 V^3 + Br_1 + Br_2 - Br_3 - Br_4 + sigma V rho
           + [c_2-1, c_1-2] M_ker [c_2-1, c_1-2]^T + mu_a alpha_2 + mu_rho rho^2 + mu_w w
  the target r = |q|.  Using tilde_beta^2 <= v c_2 w and mu_w > 0 gives
    mu_w w - (g_3(v) + g_4(v)) tilde_beta >= -(G_3(v) + G_4(v))^2 / (4 mu_w v) * c_2
  (trivially 0 when c_2 = 0, and by completing the square in tilde_beta when c_2 > 0).
  Using rho^2 <= alpha_2 <= c_1 c_2 with psi_a(v) >= 0 and psi_a(v) + mu_a - phi_4(v) >= 0 gives
    (mu_a - phi_4(v)) alpha_2 = (psi_a + mu_a - phi_4) alpha_2 - psi_a alpha_2
                             >= (psi_a + mu_a - phi_4) rho^2 - psi_a c_1 c_2.
  Using (c_2, c_1, rho) in C and xi(v) in C* gives xi_2 c_2 + xi_1 c_1 + xi_a rho >= 0.
  Collecting the remaining terms in z = (c_2, c_1, rho, 1)^T yields RHS - r >= z^T P(r) z > 0 by (C1)-(C2)
  and Sylvester's criterion.  Taking expectations via (F1), (F3), (F4) gives, for q's normalised scalars
  p = pi/s in P_1 (or pi = 0 when s = 0), E|q| <= f_p(s) := base(s) + s (d_lin.p) + s^{3/2} inf_{alpha>0}(d_J(alpha).p).
  Since l_3 >= 0 and s_0, h_0 >= 0 on P_1, f_p(s) is convex on [0, oo), hence bounded on [s_lo, s_hi] by
  max(f_p(s_lo), f_p(s_hi)) <= max(B(s_lo), B(s_hi)) by (C3).  QED
============================================================================================
"""
import json
import sys
import time
from fractions import Fraction as Fr
from math import gcd

C6 = Fr(4045313, 100000)
EROW = [Fr(32), Fr(8), Fr(32), Fr(96), Fr(0)]
S0 = [Fr(8), Fr(2), Fr(8), Fr(0), Fr(8)]
H0 = [Fr(8, 3), Fr(2, 3), Fr(8, 3), Fr(24), Fr(-16, 3)]
PMAX = [Fr(1, 32), Fr(1, 8), Fr(1, 32), Fr(1, 96), Fr(3, 64)]


# ------------------------------------------------------------------ exact polynomial arithmetic (low -> high)
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


# ------------------------------------------------------------------ exact integer Sturm chains
def to_int_poly(a):
    """Positive multiple of polynomial a with primitive integer coefficients."""
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
    """Exact sign (-1, 0, +1) of integer polynomial a at rational x = p/q."""
    p, q = x.numerator, x.denominator
    acc = 0
    n = len(a) - 1
    for i in range(n, -1, -1):
        acc = acc * p + a[i] * (q ** (n - i))
    return (acc > 0) - (acc < 0)


def irem_neg(a, b):
    """-(a mod b) up to a strictly positive integer multiplier."""
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


# ------------------------------------------------------------------ contraction scalar cuts
def cut_vector(typ, theta):
    """Valid homogeneous linear inequality a . (n, h, b, y, z) >= 0 (Lean theorems of (F3))."""
    m = [Fr(1), Fr(0), Fr(1), Fr(3), Fr(-1)]
    t3 = [Fr(0), Fr(0), Fr(0), Fr(3), Fr(-1)]
    if typ in ('n', 'h', 'b', 'y', 'z'):
        a_ = [Fr(0)] * 5
        a_['nhbyz'.index(typ)] = Fr(1)
        return a_
    if typ == 'bn':
        return [Fr(1), Fr(0), Fr(-1), Fr(0), Fr(0)]
    if typ == 'yz':
        return [Fr(0), Fr(0), Fr(0), Fr(-1), Fr(1)]
    if typ == 'h0':
        return list(H0)
    if typ == 'm':
        return m
    if theta is None or theta <= 0:
        raise ValueError('theta must be positive')
    if typ == 'c1':
        return [theta, Fr(1) / theta, Fr(0), Fr(0), Fr(-2)]
    if typ in ('c2+', 'c2-'):
        sg = -2 if typ == 'c2+' else 2
        return [m[i] / theta + (theta if i == 1 else Fr(0)) + sg * t3[i] for i in range(5)]
    raise ValueError('unknown cut: ' + str(typ))


# ------------------------------------------------------------------ row verification
def verify_row(row, quiet=False):
    e = [Fr(x) for x in row['knots']]
    K = len(e) - 1
    assert K >= 1 and e[0] == 0 and all(e[i] < e[i + 1] for i in range(K)), 'invalid knots'
    u = [x * x for x in e]
    assert isinstance(row['knot_den'], int) and row['knot_den'] > 0, 'invalid knot_den'
    kden = Fr(row['knot_den'])

    def get_karr(nm):
        raw = row[nm]
        assert len(raw) == K + 1 and all(isinstance(x, int) for x in raw), 'invalid array ' + nm
        return [Fr(x, kden) for x in raw]

    phi1, phi2 = get_karr('phi1'), get_karr('phi2')
    phi3, phi4 = get_karr('phi3'), get_karr('phi4')
    psi_a = get_karr('psi_a')
    xi2, xi1, xia = get_karr('xi2'), get_karr('xi1'), get_karr('xia')

    assert len(row['lam']) == 3 and len(row['slope']) == 2 and len(row['l3']) == 3 and len(row['m_ker']) == 3
    lam0, lam1, lam2 = (Fr(x) for x in row['lam'])
    slope = [Fr(x) for x in row['slope']]
    l3 = [Fr(x) for x in row['l3']]
    m00, m01, m11 = (Fr(x) for x in row['m_ker'])
    mu_a = Fr(row['mu_a'])
    mu_rho = Fr(row['mu_rho'])
    mu_w = Fr(row['mu_w'])
    sig = Fr(row['sigma'])

    assert all(x >= 0 for x in l3), 'l3 >= 0 failed'
    lam3 = sum(l3)
    assert lam3 > 0, 'lam3 > 0 failed'
    assert m00 >= 0 and m11 > 0 and m00 * m11 - m01 * m01 >= 0, 'M_ker PSD / m11 > 0 failed'
    assert mu_a >= 0 and mu_rho > 0 and mu_w > 0, 'mu signs failed'

    # (C1) Knotwise inequalities
    for k in range(K + 1):
        assert xi2[k] >= 0 and xi1[k] >= 0 and xia[k] ** 2 <= 4 * xi1[k] * xi2[k], 'C* failed at knot %d' % k
        assert psi_a[k] >= 0 and psi_a[k] + mu_a - phi4[k] >= 0, 'psi_a failed at knot %d' % k
        assert m00 - phi3[k] > 0, 'D1 failed at knot %d' % k
        d2k = m11 * (m00 - phi3[k]) - (m01 - Fr(1, 2) * psi_a[k]) ** 2
        assert d2k > 0, 'D2 failed at knot %d' % k

    # (C2) Piecewise Sylvester minors on [e_k, e_{k+1}] and [e_K, oo)
    G_val = [Fr(0), Fr(0), Fr(0), Fr(0)]
    vv = [Fr(0), Fr(1)]
    vv2 = [Fr(0), Fr(0), Fr(1)]
    nfail = 0

    for k in range(K + 1):
        tail = (k == K)
        u0 = u[k]
        if tail:
            pc = lambda arr: ptrim([arr[K]])
        else:
            u1 = u[k + 1]
            def pc(arr, k=k, u0=u0, u1=u1):
                sl = (arr[k + 1] - arr[k]) / (u1 - u0)
                return ptrim([arr[k] - sl * u0, sl])

        p1 = padd(pc(phi1), [Fr(0), slope[0]])
        p2 = padd(pc(phi2), [Fr(0), slope[1]])
        p3 = pc(phi3)
        p4 = pc(phi4)
        psa = pc(psi_a)
        x2p, x1p, xap = pc(xi2), pc(xi1), pc(xia)

        g1 = pprim(p1, u0, G_val[0])
        g2 = pprim(p2, u0, G_val[1])
        g3 = pprim(p3, u0, G_val[2])
        g4 = pprim(p4, u0, G_val[3])

        M11 = psub([m00], p3)
        M12 = psub([m01], pscale(psa, Fr(1, 2)))
        M33 = psub(padd([mu_rho + mu_a], psa), p4)
        D2 = psub(pscale(M11, m11), pmul(M12, M12))

        vY1 = psub(pmul(vv, p1), g1)
        vY2 = psub(pmul(vv, p2), g2)
        vY3 = psub(pmul(vv, p3), g3)
        vY4 = psub(pmul(vv, p4), g4)
        g34 = padd(g3, g4)

        q1_v = padd([lam0 + m00 + 4 * m01 + 4 * m11, lam1, lam2, lam3], psub(padd(g1, g2), g3))
        b2_v = pscale(psub([Fr(-2) * m01 - Fr(4) * m11], padd(pscale(p2, Fr(1, 2)), x1p)), Fr(1, 2))

        a_lo = e[k]
        b_hi = None if tail else e[k + 1]
        ok2 = positive_on(compose_r2(D2), a_lo, b_hi)

        if k == 0:
            assert not g34 or g34[0] == 0, 'G_3(0)+G_4(0) must vanish'
            g34_div_v = g34[1:] if len(g34) > 1 else []
            tau_w_v = pmul(vv, pscale(pmul(g34_div_v, g34_div_v), Fr(1) / (4 * mu_w)))

            for vy in (vY1, vY2, vY3, vY4):
                assert not vy or vy[0] == 0, 'vY_i(0) must vanish'
            Y1_v = vY1[1:] if len(vY1) > 1 else []
            Y2_v = vY2[1:] if len(vY2) > 1 else []
            Y3_v = vY3[1:] if len(vY3) > 1 else []
            Y4_v = vY4[1:] if len(vY4) > 1 else []

            M13_v = pscale(padd(Y3_v, Y4_v), Fr(-1, 2))
            D3_v = psub(pmul(M33, D2), pscale(pmul(M13_v, M13_v), m11))

            b1_v = pscale(psub(psub(padd(p3, g3), padd(p1, [2 * m00 + 4 * m01])), padd(tau_w_v, x2p)), Fr(1, 2))
            b3_v = pscale(psub(padd(padd([Fr(0), sig], Y3_v), g4),
                               padd(padd(Y1_v, pscale(Y2_v, Fr(1, 2))), xap)), Fr(1, 2))

            adj11 = pscale(M33, m11)
            adj22 = psub(pmul(M11, M33), pmul(M13_v, M13_v))
            adj33 = D2
            adj12 = pscale(pmul(M12, M33), Fr(-1))
            adj13 = pscale(M13_v, -m11)
            adj23 = pmul(M12, M13_v)

            quad_v = padd(
                padd(pmul(adj11, pmul(b1_v, b1_v)), pmul(adj22, pmul(b2_v, b2_v))),
                padd(pmul(adj33, pmul(b3_v, b3_v)),
                     pscale(padd(pmul(adj12, pmul(b1_v, b2_v)),
                                 padd(pmul(adj13, pmul(b1_v, b3_v)), pmul(adj23, pmul(b2_v, b3_v)))), Fr(2)))
            )
            D3_r = compose_r2(D3_v)
            q1_r = psub(compose_r2(q1_v), [Fr(0), Fr(1)])
            D4_r = psub(pmul(q1_r, D3_r), compose_r2(quad_v))
            ok3 = positive_on(D3_r, a_lo, b_hi)
            ok4 = positive_on(D4_r, a_lo, b_hi)
        else:
            vM13 = pscale(padd(vY3, vY4), Fr(-1, 2))
            v2D3 = psub(pmul(vv2, pmul(M33, D2)), pscale(pmul(vM13, vM13), m11))

            v_tau_w = pscale(pmul(g34, g34), Fr(1) / (4 * mu_w))
            vb1 = pscale(psub(pmul(vv, psub(padd(p3, g3), padd(p1, padd([2 * m00 + 4 * m01], x2p)))), v_tau_w), Fr(1, 2))
            vb3 = pscale(psub(padd(pmul(vv, padd([Fr(0), sig], g4)), vY3),
                              padd(padd(vY1, pscale(vY2, Fr(1, 2))), pmul(vv, xap))), Fr(1, 2))

            t11 = pmul(pscale(pmul(vv, M33), m11), pmul(vb1, vb1))
            v2_adj22 = psub(pmul(vv2, pmul(M11, M33)), pmul(vM13, vM13))
            t22 = pmul(vv, pmul(v2_adj22, pmul(b2_v, b2_v)))
            t33 = pmul(pmul(vv, D2), pmul(vb3, vb3))
            t12 = pscale(pmul(vv2, pmul(pmul(M12, M33), pmul(vb1, b2_v))), Fr(-2))
            t13 = pscale(pmul(vM13, pmul(vb1, vb3)), -2 * m11)
            t23 = pscale(pmul(vv, pmul(M12, pmul(vM13, pmul(b2_v, vb3)))), Fr(2))
            v3_quad = padd(padd(t11, t22), padd(t33, padd(t12, padd(t13, t23))))

            v2D3_r = compose_r2(v2D3)
            vq1_r = psub(compose_r2(pmul(vv, q1_v)), [Fr(0), Fr(0), Fr(0), Fr(1)])
            v3D4_r = psub(pmul(vq1_r, v2D3_r), compose_r2(v3_quad))
            ok3 = positive_on(v2D3_r, a_lo, b_hi)
            ok4 = positive_on(v3D4_r, a_lo, b_hi)

        if not (ok2 and ok3 and ok4):
            nfail += 1
            if not quiet:
                print('   (C2) FAILS on', 'tail' if tail else 'interval %d [%s, %s]' % (k, e[k], e[k + 1]),
                      'ok2=%s ok3=%s ok4=%s' % (ok2, ok3, ok4))
        if not tail:
            G_val = [peval(g1, u1), peval(g2, u1), peval(g3, u1), peval(g4, u1)]

    # (C3) Exact weak duality at endpoints s_lo, s_hi
    dlin = [
        16 * m00 + 32 * m01 + 32 * m11,
        4 * m00 + 16 * m11,
        16 * m11 + 32 * (mu_a + mu_rho + sig),
        48 * m01 + 48 * m11 + 24 * (mu_a + mu_rho + mu_w) + 48 * sig,
        16 * m01 + 16 * m11,
    ]
    bounds = {}
    for end in ('lo', 'hi'):
        s_e = Fr(row['s_' + end])
        if s_e == 0:
            bounds[end] = lam0 + lam1 + 2 * lam2 + 6 * lam3
            continue
        pd = row['par'][end]
        al = [Fr(x) for x in pd['alpha']]
        assert len(al) == 2 and all(x > 0 for x in al), 'alpha > 0 failed'
        dJ = [l3[1] * (150 * al[0] * S0[i] + (198 + Fr(150) / al[0]) * H0[i])
              + l3[2] * (Fr(135, 2) * al[1] * S0[i] + (Fr(11781, 32) + Fr(135, 2) / al[1]) * H0[i]) for i in range(5)]
        sb = Fr(pd['sqrt_ub'])
        assert sb > 0 and sb * sb >= s_e, 'sqrt_ub failed'
        c = [dlin[i] + sb * dJ[i] for i in range(5)]
        eta = Fr(pd['eta'])
        resid = [c[i] - eta * EROW[i] for i in range(5)]
        for typ, theta, yv in pd['cuts']:
            yv = Fr(yv)
            assert yv >= 0, 'negative cut multiplier'
            a_ = cut_vector(typ, None if theta is None else Fr(theta))
            resid = [resid[i] + yv * a_[i] for i in range(5)]
        L = eta + sum(max(resid[i], Fr(0)) * PMAX[i] for i in range(5))
        bounds[end] = (lam0 + lam1 + lam2 * (2 + s_e) + l3[0] * (6 + 9 * s_e + C6 * s_e * sb)
                       + (l3[1] + l3[2]) * (6 + 9 * s_e) + s_e * L)

    bound = max(bounds.values())
    used = dict(
        third_order=(any(x != 0 for x in phi3) or any(x != 0 for x in phi4)),
        cone=any(x != 0 for x in xi2 + xi1 + xia),
        psi_a=any(x != 0 for x in psi_a),
        linear_test=any(x != 0 for x in slope),
        joint_sixth=(l3[1] > 0 or l3[2] > 0),
        scalar_sixth=(l3[0] > 0),
    )
    return dict(ok=(nfail == 0), nfail=nfail, bound=bound, bounds=bounds, K=K, used=used)


def main():
    t0 = time.time()
    path = sys.argv[1]
    quiet = '--quiet' in sys.argv
    partial = '--partial' in sys.argv
    with open(path, encoding='utf-8') as fh:
        cert = json.load(fh)
    rows = cert['rows']
    assert len(rows) >= 1, 'empty rows'
    worst = None
    worst_idx = -1
    prev = Fr(rows[0]['s_lo']) if partial else Fr(0)
    start = prev
    allok = True
    for i, row in enumerate(rows):
        s_lo, s_hi = Fr(row['s_lo']), Fr(row['s_hi'])
        assert s_lo == prev and s_hi > s_lo, 'rows must be contiguous' + ('' if partial else ' from 0')
        prev = s_hi
        res = verify_row(row, quiet=quiet)
        allok = allok and res['ok']
        if worst is None or res['bound'] > worst:
            worst = res['bound']
            worst_idx = i
        if not quiet:
            print('row %2d  s in [%6s, %6s]  K=%3d  %s  bound <= %.10f  (lo=%.10f, hi=%.10f)' % (
                i, row['s_lo'], row['s_hi'], res['K'], 'PASS' if res['ok'] else 'FAIL',
                float(res['bound']), float(res['bounds']['lo']), float(res['bounds']['hi'])), flush=True)
    covered = prev
    dt = time.time() - t0
    print('covered s in [%s, %s];  all rows pass: %s;  worst row = %d;  max bound = %s  (<= %.10f)  [%.2fs]' % (
        start, covered, allok, worst_idx, worst, float(worst) + 1e-12, dt))
    target = cert.get('claim')
    if target is not None and not partial:
        t = Fr(target)
        okc = allok and worst < t and covered >= 42
        print('claim  E|q| <= %s ||q||_2  for every q in H_{2,1}:  %s' % (
            target, 'VERIFIED' if okc else 'NOT VERIFIED'))
        sys.exit(0 if okc else 1)
    sys.exit(0 if allok else 1)


if __name__ == '__main__':
    main()
