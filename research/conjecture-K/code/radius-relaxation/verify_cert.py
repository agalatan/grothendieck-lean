#!/usr/bin/env python3
"""Exact verifier of radius certificates (label C: exact rational arithmetic, no floats).

Usage:  python3 -I verify_cert.py CERT.json [--quiet] [--partial]

Only the standard library is used (fractions, json, math, sys).  Every number of a certificate
is an exact rational.  For each row the verifier proves, for every cubic q in H_{2,1}(C^n), every n,
with E|q|^2 = 1 and s = E|q|^4 - 2 in [s_lo, s_hi]:

        E|q| <= max(B(s_lo), B(s_hi)),

and then reports the maximum over the rows, which must cover [0, 42] (s <= 42 is a Lean theorem).

============================================================================================
NOTATION.  V = |q|^2, r = sqrt(V), c1 = sum_j |d_j q|^2, c2 = sum_j |dbar_j q|^2,
a = sum_j d_j q dbar_j q, rho = Re(conj(q)^2 a)/V (so |rho| <= |a|).

FACTS USED (inputs of the proof; none is checked by this file).
 (F1) Identities, for tests G with g = G/v in C^1[0, oo) of polynomial growth (phi = G', Y = phi - G/v):
        (I)   E[G(V)] = E[c2 phi(V)] + E[rho Y(V)]
        (II)  E[G(V)] = (1/2) E[c1 phi(V)] + (1/2) E[rho Y(V)]
      Lemma 1 of research/conjecture-K/sources/antiholomorphic-stein-2026-11-16/NOTE.md (ledger 6.3.20)
      with the test conj(q) g(V) in its two forms.  A row's tests have phi_i = spline_i + slope_i v with
      spline_i continuous, piecewise linear in v and constant beyond the last knot; phi_i is affine
      near 0, so g_i = G_i/v is C^1 on [0, oo) (g_i' = Y_i/v is bounded near 0).
      The mixture ((I) + 2 (II))/3 is Lean: with S = c1 + c2, v_Lean = S/3 - 1, r = (2/3) rho it reads
      E[Phi(U) - phi(U)] = E[(S/3 - 1) phi(U) + r Y(U)].  The Lean theorem radial_cut
      (Grothe/LowerAnalytic/RadialCut.lean; used through gaussian_steinInputs) states it for tests that
      vanish from the last knot on.  A row's test is  phi = (spline - c) + c + kappa v  with c the value
      of the spline beyond the last knot: the first part is a radial_cut test, the constant c is
      E U = 1 with E S = 3 (fluctuation_mean, Fluctuation.lean), and the linear part kappa v is
      energy_identity (RadialCut.lean; the relation 2P + Q = E U^2 - 2).
 (F2) Pointwise: c1 >= 0, c2 >= 0, rho^2 <= |a|^2 <= c1 c2 (Cauchy-Schwarz).  (rho^2 <= |a|^2 is the Lean
      lemma radR_sq_le; the product bound |a|^2 <= c1 c2 is not in Lean.)
 (F3) Second moments, in the contraction scalars (n, h, b, y, z) of the coefficient tensor
      (Grothe/LowerAnalytic/GramTensor.lean, GramSpectral.lean):
        s = 32n + 8h + 32b + 96y                                   [Lean: Circular.fourth_moment_contractions]
        E (c2 - 1)^2      = 16n + 4h                               [NOTE Thm 2(d) with the Lean values]
        E (c1 - c2 - 1)^2 = 16n + 20h + 16b                        [proved in check_budgets_exact.py]
        E (c1 + c2 - 3)^2 = 80n + 20h + 16b + 96y + 32z            [Lean: varS_eq]
        E (c1 - 2)^2      = 32n + 16h + 16b + 48y + 16z            [proved in check_budgets_exact.py]
        E rho^2 <= E|a|^2 = 32b + 24y,   E[V rho] = 32b + 48y      [Lean: radR_sq_le with AB_eq; N_eq]
      and n, h, b, y, z >= 0, b <= n, y <= z, z^2 <= n h, m := n + b + 3y - z >= 0,
      (3y - z)^2 <= h m, h0 >= 0                                   [Lean: gramT_schatten, gramT_symm,
                                                                    gramZ_sq_le, gramT_gram1a/b, jointH0_nonneg]
 (F4) Moments: E V = 1, E V^2 = 2 + s, E V^3 <= 6 + 9s + C6 s^{3/2} (Circular.gaussian_sixth, whose
      hypothesis TensorFacts is the Lean theorem Circular.tensorFacts), and for
      every alpha > 0, with s0 = 8n + 2h + 8b + 8z, h0 = (8n + 2h + 8b)/3 + 24y - 16z/3
      (Circular.joint_sixth):
        E V^3 <= 6 + 9s + sqrt(s) (150 alpha s0 + (198 + 150/alpha) h0),
        E V^3 <= 6 + 9s + sqrt(s) ((135/2) alpha s0 + (11781/32 + 135/(2 alpha)) h0).

ROW DATA.  Knots 0 = e_0 < ... < e_K (in r; u_k = e_k^2), and continuous functions of v that are
piecewise linear in v on the u_k and constant beyond u_K, given by their knot values:
phi1, phi2 (tests; to each a multiple slope_i * v is added), xi2, xi1, xia (cone multipliers), th2, th4;
numbers lam0, lam1, lam2, l3 = (l3s, l3a, l3b) >= 0 with lam3 their sum, mu_1..mu_5 >= 0, sigma;
per endpoint alpha_a, alpha_b > 0.
Derived:  G_i(v) = int_0^v phi_i,  Y_i = phi_i - G_i/v,
          th3 = xi1 + phi2/2 - th2 - th4,   th1 = xi2 + phi1 + th2 - th3,
          th5 = xia + Y1 + Y2/2 - sigma v.

CHECKED EXACTLY BY THIS FILE.
 (C1) at every knot xi2 >= 0, xi1 >= 0, xia^2 <= 4 xi1 xi2;  th_j == 0 wherever mu_j = 0;  mu_5 > 0.
 (C2) for all r >= 0 (v = r^2), by Sturm sequences on every knot interval and on [e_K, oo):
        r < lam0 + lam1 v + lam2 v^2 + lam3 v^3 + G1 + G2
              - th1 - th2 - 3 th3 - 2 th4 - sum_{j<=4} th_j^2/(4 mu_j) - th5^2/(4 mu_5).
      (After multiplication by v^2 this is a polynomial inequality of degree <= 10 in r.)
 (C3) for both endpoints s_e, with a rational sb >= sqrt(s_e), an exact weak-duality bound
      L_e >= max { (d_lin + sb d_J(alpha_e)) . p :  p in P1 },  P1 = the scalars (n,h,b,y,z)
      normalised to 32n + 8h + 32b + 96y = 1, relaxed to the listed valid cuts of (F3)
      (the cone constraints through tangents, e.g. 2z <= theta n + h/theta), where
      d_lin = sum_j mu_j B_j + sigma (0,0,32,48,0),  B_j the right sides of (F3) in the order
      c2, c1-c2, c1+c2, c1, a, and d_J the coefficient vector of the two joint forms of (F4)
      with the weights l3a, l3b.
      The bound: a certificate lists cuts a_k . p >= 0 with multipliers y_k >= 0 and a number eta.
      With c = d_lin + sb d_J and resid = c - eta e + sum_k y_k a_k (e = (32, 8, 32, 96, 0)), every
      p in P1 has  c.p = eta + resid.p - sum_k y_k (a_k.p) <= eta + sum_i max(resid_i, 0) pmax_i =: L_e,
      where 0 <= p <= pmax := (1/32, 1/8, 1/32, 1/96, 3/64) on P1: the first four bounds are p >= 0 with
      e.p = 1, and z <= 3/64 follows from h0 >= 0, since
      (16/3) z <= (8n + 2h + 8b)/3 + 24y = (32n + 8h + 32b)/12 + (96y)/4 <= 1/4.
Then  B(s_e) = lam0 + lam1 + lam2 (2+s_e) + l3s (6 + 9 s_e + C6 s_e sb) + (l3a+l3b)(6 + 9 s_e) + s_e L_e.

PROOF THAT A VERIFIED ROW GIVES  E|q| <= max(B(s_lo), B(s_hi))  FOR s IN [s_lo, s_hi].
 Pointwise.  Put k = (k2, k1, at) = (c2, c1, rho); by (F2) it lies in the cone
 C = {k2 >= 0, k1 >= 0, at^2 <= k1 k2}.  xi = (xi2, xi1, xia) is piecewise linear and lies at the
 knots in the convex cone C* = {xi2, xi1 >= 0, xia^2 <= 4 xi1 xi2} by (C1), hence everywhere, and
 xi.k >= (sqrt(xi2 k2) - sqrt(xi1 k1))^2 >= 0.  With l_1 = (1,0,0), l_2 = (-1,1,0), l_3 = (1,1,0),
 l_4 = (0,1,0), l_5 = (0,0,1), c = (1,1,3,2,0) and beta = (-phi1, -phi2/2, -Y1 - Y2/2 + sigma v), the
 definitions of th1, th3, th5 say  sum_j th_j l_j = xi - beta.  Since mu t^2 >= th t - th^2/(4 mu),
     beta.k + sum_j mu_j (l_j.k - c_j)^2 >= beta.k + (xi - beta).k - sum th_j c_j - sum th_j^2/(4 mu_j)
                                          >= - sum th_j c_j - sum th_j^2/(4 mu_j).
 With (C2), at v = V:
     |q| <= lam0 + lam1 V + lam2 V^2 + lam3 V^3 + [G1 - c2 phi1 - rho Y1](V) + [G2 - c1 phi2/2 - rho Y2/2](V)
            + sigma V rho + sum_j mu_j q_j,   q = ((c2-1)^2, (c1-c2-1)^2, (c1+c2-3)^2, (c1-2)^2, rho^2).
 Expectation.  The two brackets have mean zero by (I), (II).  By (F3), (F4), for the scalars pi of q
 and every alpha > 0:  E|q| <= base(s) + d_lin.pi + sqrt(s) d_J(alpha).pi,  where
 base(s) = lam0 + lam1 + lam2 (2+s) + l3s (6 + 9s + C6 s^{3/2}) + (l3a + l3b)(6 + 9s) is convex.
 The interval.  All cuts of (F3) are homogeneous, so pi = s p with p in P1.  Minimising over alpha at
 fixed p gives base(s) + s A(p) + s^{3/2} C(p) with C(p) >= 0 (as s0, h0 >= 0): convex in s.  So is the
 supremum B*(s) over p in P1; hence B*(s) <= max(B*(s_lo), B*(s_hi)), and at an endpoint
 B*(s_e) <= base(s_e) + s_e max_p (d_lin + sqrt(s_e) d_J(alpha_e)).p <= B(s_e) by (C3), d_J.p >= 0
 and sb >= sqrt(s_e).   QED

A row with xi == 0, th2 == th4 == 0, mu_1 = mu_2 = mu_4 = 0, phi2 = 2 phi1 AND slope_2 = 2 slope_1 uses
(I), (II) only through their Lean mixture, and of (F3) only the rows marked Lean: such a row needs
Lean theorems only (the verifier reports separate_identities = false exactly in this case).
The verifier prints which ingredients each row uses.

NON-LEAN INPUTS of a general row (certificate N), precisely:
  1. (I) and (II) separately (equivalently: the Lean mixture and the rotation identity
     E G(V) = E[(c1 - c2) G'(V)]);
  2. the pointwise cone (F2): c1, c2 >= 0 and |a|^2 <= c1 c2;
  3. E (c2 - 1)^2 = 16n + 4h;
  4. E (c1 - c2 - 1)^2 = 16n + 20h + 16b.
E (c1 - 2)^2 follows from 3, 4 and the Lean value of E (c1 + c2 - 3)^2 by the parallelogram law:
E (c1 - 2)^2 = [E (c1+c2-3)^2 + E (c1-c2-1)^2]/2 - E (c2-1)^2.
Independent review of both certificates: REVIEW.md in the folder above scripts/ (16 November 2026).
============================================================================================
"""
import json
import sys
from fractions import Fraction as Fr
from math import gcd

C6 = Fr(4045313, 100000)
CJ = [Fr(1), Fr(1), Fr(3), Fr(2)]                     # c_j of the budgets q_1..q_4 (q_5 has c = 0)
# budgets B_j and the linear data over (n, h, b, y, z)
BJ = [[16, 4, 0, 0, 0], [16, 20, 16, 0, 0], [80, 20, 16, 96, 32], [32, 16, 16, 48, 16], [0, 0, 32, 24, 0]]
EA = [0, 0, 32, 48, 0]
EROW = [32, 8, 32, 96, 0]
S0 = [Fr(8), Fr(2), Fr(8), Fr(0), Fr(8)]
H0 = [Fr(8, 3), Fr(2, 3), Fr(8, 3), Fr(24), Fr(-16, 3)]
PMAX = [Fr(1, 32), Fr(1, 8), Fr(1, 32), Fr(1, 96), Fr(3, 64)]   # bounds of p on P1 (z from h0 >= 0)


def F(x):
    return Fr(x)


# ------------------------------------------------------------------ polynomials (lists, low -> high)
def padd(a, b):
    n = max(len(a), len(b))
    return [(a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0) for i in range(n)]


def pscale(a, c):
    return [c * x for x in a]


def pmul(a, b):
    if not a or not b:
        return []
    out = [Fr(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                out[i + j] += x * y
    return out


def ptrim(a):
    a = list(a)
    while a and a[-1] == 0:
        a.pop()
    return a


def to_int(a):
    """positive multiple of a with integer, content-free coefficients."""
    a = ptrim(a)
    if not a:
        return []
    den = 1
    for x in a:
        x = Fr(x)
        den = den * x.denominator // gcd(den, x.denominator)
    ints = [int(Fr(x) * den) for x in a]
    g = 0
    for x in ints:
        g = gcd(g, abs(x))
    return [x // g for x in ints]


def ieval_sign(a, x):
    """sign of the integer polynomial a at the rational x = p/q (exact)."""
    p, q = x.numerator, x.denominator
    acc = 0
    n = len(a) - 1
    # sum a_i p^i q^(n-i)
    for i in range(n, -1, -1):
        acc = acc * p + a[i] * q ** (n - i)
    return (acc > 0) - (acc < 0)


def irem_neg(a, b):
    """-(a mod b) up to a positive factor, integer arithmetic (pseudo-remainder with sign care)."""
    a = list(a)
    lb = b[-1]
    db = len(b) - 1
    while len(a) - 1 >= db and a:
        la = a[-1]
        k = len(a) - 1 - db
        # a <- |lb| * a - sign(lb) * la * x^k * b   (positive multiple of a minus a multiple of b)
        m = abs(lb)
        sg = 1 if lb > 0 else -1
        a = [m * x for x in a]
        for i, y in enumerate(b):
            a[i + k] -= sg * la * y
        a = ptrim(a)
    out = to_int([-x for x in a])
    return out


def sturm_chain(p):
    p0 = to_int(p)
    p1 = to_int([i * p0[i] for i in range(1, len(p0))])
    chain = [p0, p1]
    while len(chain[-1]) > 1:
        r = irem_neg(chain[-2], chain[-1])
        if not r:
            break
        chain.append(r)
    return chain


def changes(signs):
    s = [x for x in signs if x != 0]
    return sum(1 for i in range(len(s) - 1) if s[i] != s[i + 1])


def positive_on(p, a, b=None):
    """True iff p > 0 on [a, b] (b = None: on [a, oo)).  Exact."""
    p = ptrim(p)
    if not p:
        return False
    ch = sturm_chain(p)
    if ieval_sign(ch[0], a) <= 0:
        return False
    va = changes([ieval_sign(c, a) for c in ch])
    if b is None:
        if ch[0][-1] <= 0:
            return False
        vb = changes([(c[-1] > 0) - (c[-1] < 0) for c in ch])
    else:
        if ieval_sign(ch[0], b) <= 0:
            return False
        vb = changes([ieval_sign(c, b) for c in ch])
    return va == vb


def compose_r2(pv):
    """p(v) -> p(r^2)."""
    out = []
    for c in pv:
        out.append(c)
        out.append(Fr(0))
    return ptrim(out) if any(out) else []


# ------------------------------------------------------------------ one row
def lin_piece(a0, a1, u0, u1):
    """coefficients in v of the affine function with values a0 at u0 and a1 at u1."""
    sl = (a1 - a0) / (u1 - u0)
    return [a0 - sl * u0, sl]


def verify_row(row, quiet=False):
    e = [F(x) for x in row['knots']]
    K = len(e) - 1
    assert e[0] == 0 and all(e[i] < e[i + 1] for i in range(K)), 'knots'
    u = [x * x for x in e]
    get = lambda name: [F(x) for x in row[name]]
    phi1, phi2, xi2, xi1, xia, th2, th4 = (get(nm) for nm in ['phi1', 'phi2', 'xi2', 'xi1', 'xia', 'th2', 'th4'])
    for arr in (phi1, phi2, xi2, xi1, xia, th2, th4):
        assert len(arr) == K + 1, 'length'
    lam0, lam1, lam2 = (F(x) for x in row['lam'])
    slope = [F(x) for x in row.get('slope', ['0', '0'])]
    l3 = [F(x) for x in row['l3']]
    mu = [F(x) for x in row['mu']]
    sig = F(row['sigma'])
    assert all(x >= 0 for x in l3) and all(x >= 0 for x in mu) and mu[4] > 0, 'signs'
    lam3 = sum(l3)
    assert lam3 > 0, 'lam3'
    # (C1)
    for k in range(K + 1):
        assert xi2[k] >= 0 and xi1[k] >= 0 and xia[k] ** 2 <= 4 * xi1[k] * xi2[k], 'cone at knot %d' % k
    for j in (1, 3):
        if mu[j] == 0:
            assert all(x == 0 for x in (th2, th4)[j // 2]), 'theta_%d must vanish (mu = 0)' % (j + 1)
    used = dict(budgets=[j + 1 for j in range(5) if mu[j] > 0],
                cone=any(x != 0 for x in xi2 + xi1 + xia),
                separate_identities=any(phi2[k] != 2 * phi1[k] for k in range(K + 1)) or slope[1] != 2 * slope[0],
                linear_test=any(x != 0 for x in slope),
                sigma=sig != 0, joint_sixth=(l3[1] > 0 or l3[2] > 0), scalar_sixth=l3[0] > 0)
    # (C2)
    G1 = Fr(0)
    G2 = Fr(0)
    nfail = 0
    for k in range(K + 1):
        tail = (k == K)
        if tail:
            u0 = u[K]
            pc = lambda arr: [arr[K]]
        else:
            u0, u1 = u[k], u[k + 1]
            pc = lambda arr: lin_piece(arr[k], arr[k + 1], u0, u1)
        p1 = padd(pc(phi1), [0, slope[0]])                   # phi_i = spline + slope_i v
        p2 = padd(pc(phi2), [0, slope[1]])
        # derived multipliers, as polynomials on the piece
        t2p, t4p = pc(th2), pc(th4)
        t3p = padd(padd(pc(xi1), pscale(p2, Fr(1, 2))), pscale(padd(t2p, t4p), -1))
        t1p = padd(padd(pc(xi2), p1), padd(t2p, pscale(t3p, -1)))
        thp = [t1p, t2p, t3p, t4p]
        for j in (0, 2):
            if mu[j] == 0:
                assert not any(ptrim(thp[j])), 'theta_%d must vanish (mu = 0)' % (j + 1)

        def prim(p, Gk):
            # G(v) = Gk + int_{u0}^v p
            q = [Fr(0)] + [c / (i + 1) for i, c in enumerate(p)]
            val0 = sum(c * u0 ** i for i, c in enumerate(q))
            q[0] = Gk - val0
            return q

        g1, g2 = prim(p1, G1), prim(p2, G2)
        vv = [Fr(0), Fr(1)]
        W1 = padd(pmul(vv, p1), pscale(g1, -1))            # v phi - G
        W2 = padd(pmul(vv, p2), pscale(g2, -1))
        vth5 = padd(padd(pmul(vv, pc(xia)), W1), padd(pscale(W2, Fr(1, 2)), [0, 0, -sig]))
        inner = padd([lam0, lam1, lam2, lam3], padd(g1, g2))
        for j in range(4):
            tj = thp[j]
            inner = padd(inner, pscale(tj, -CJ[j]))
            if mu[j] > 0:
                inner = padd(inner, pscale(pmul(tj, tj), -1 / (4 * mu[j])))
        S = padd(pmul([0, 0, Fr(1)], inner), pscale(pmul(vth5, vth5), -1 / (4 * mu[4])))
        P = compose_r2(S)
        P = padd(P, [0, 0, 0, 0, 0, Fr(-1)])               # - r^5
        P = [Fr(x) for x in P]
        if k == 0:
            assert all(x == 0 for x in P[:4]), 'divisibility by r^4 on the first interval'
            P = P[4:]
        ok = positive_on(P, e[k], None if tail else e[k + 1])
        if not ok:
            nfail += 1
            if not quiet:
                print('   (C2) FAILS on', 'tail' if tail else 'interval %d [%s, %s]' % (k, e[k], e[k + 1]))
        if not tail:
            # advance G to the next knot
            G1 = sum(c * u1 ** i for i, c in enumerate(g1))
            G2 = sum(c * u1 ** i for i, c in enumerate(g2))
    # (C3)
    dlin = [sum(mu[j] * BJ[j][i] for j in range(5)) + sig * EA[i] for i in range(5)]
    bounds = {}
    for end in ('lo', 'hi'):
        s_e = F(row['s_' + end])
        if s_e == 0:
            bounds[end] = lam0 + lam1 + 2 * lam2 + 6 * lam3
            continue
        pd = row['par'][end]
        al = [F(x) for x in pd['alpha']]                 # any alpha > 0 is valid at an endpoint (see the proof in the module docstring)
        assert all(x > 0 for x in al), 'alpha'
        dJ = [l3[1] * (150 * al[0] * S0[i] + (198 + 150 / al[0]) * H0[i])
              + l3[2] * (Fr(135, 2) * al[1] * S0[i] + (Fr(11781, 32) + Fr(135, 2) / al[1]) * H0[i]) for i in range(5)]
        sb = F(pd['sqrt_ub'])
        assert sb > 0 and sb * sb >= s_e, 'sqrt bound'
        c = [dlin[i] + sb * dJ[i] for i in range(5)]
        eta = F(pd['eta'])
        resid = [c[i] - eta * EROW[i] for i in range(5)]
        for typ, theta, yv in pd['cuts']:
            yv = F(yv)
            assert yv >= 0, 'multiplier'
            a_ = cut_vector(typ, None if theta is None else F(theta))
            resid = [resid[i] + yv * a_[i] for i in range(5)]
        L = eta + sum(max(resid[i], 0) * PMAX[i] for i in range(5))
        bounds[end] = (lam0 + lam1 + lam2 * (2 + s_e) + l3[0] * (6 + 9 * s_e + C6 * s_e * sb)
                       + (l3[1] + l3[2]) * (6 + 9 * s_e) + s_e * L)
    bound = max(bounds.values())
    return dict(ok=(nfail == 0), nfail=nfail, bound=bound, bounds=bounds, used=used, K=K)


def cut_vector(typ, theta):
    """a valid homogeneous inequality a . (n,h,b,y,z) >= 0 for the contraction scalars."""
    m = [Fr(1), Fr(0), Fr(1), Fr(3), Fr(-1)]              # m = n + b + 3y - z >= 0
    t3 = [Fr(0), Fr(0), Fr(0), Fr(3), Fr(-1)]             # 3y - z
    if typ in ('n', 'h', 'b', 'y', 'z'):
        a_ = [Fr(0)] * 5
        a_['nhbyz'.index(typ)] = Fr(1)
        return a_
    if typ == 'bn':                                        # b <= n
        return [Fr(1), Fr(0), Fr(-1), Fr(0), Fr(0)]
    if typ == 'yz':                                        # y <= z
        return [Fr(0), Fr(0), Fr(0), Fr(-1), Fr(1)]
    if typ == 'h0':                                        # h0 >= 0 (a squared norm)
        return list(H0)
    if typ == 'm':
        return m
    assert theta is not None and theta > 0, 'theta'
    if typ == 'c1':                                        # z^2 <= n h  =>  2z <= theta n + h/theta
        return [theta, 1 / theta, Fr(0), Fr(0), Fr(-2)]
    if typ in ('c2+', 'c2-'):                              # (3y-z)^2 <= h m => 2|3y-z| <= theta h + m/theta
        sg = -2 if typ == 'c2+' else 2
        return [m[i] / theta + (theta if i == 1 else 0) + sg * t3[i] for i in range(5)]
    raise ValueError(typ)


def main():
    path = sys.argv[1]
    quiet = '--quiet' in sys.argv
    partial = '--partial' in sys.argv            # a window of s only: rows contiguous, not starting at 0
    cert = json.load(open(path))
    rows = cert['rows']
    worst = None
    prev = F(rows[0]['s_lo']) if partial else Fr(0)
    start = prev
    allok = True
    for i, row in enumerate(rows):
        s_lo, s_hi = F(row['s_lo']), F(row['s_hi'])
        assert s_lo == prev and s_hi > s_lo, 'rows must be contiguous' + ('' if partial else ' from 0')
        prev = s_hi
        res = verify_row(row, quiet)
        allok = allok and res['ok']
        if worst is None or res['bound'] > worst:
            worst = res['bound']
        if not quiet:
            print('row %2d  s in [%s, %s]  K=%d  %s  bound <= %.9f   uses %s' % (
                i, row['s_lo'], row['s_hi'], res['K'], 'PASS' if res['ok'] else 'FAIL', float(res['bound']),
                json.dumps(res['used'])), flush=True)
    covered = prev
    print('covered s in [%s, %s];  all rows pass: %s;  max bound = %s  (<= %.10f)' % (
        start, covered, allok, worst, float(worst) + 1e-10))
    target = cert.get('claim')
    if target is not None and not partial:
        t = F(target)
        okc = allok and worst < t and covered >= 42
        print('claim  E|q| <= %s ||q||_2  for every q in H_{2,1}:  %s' % (target, 'VERIFIED' if okc else 'NOT VERIFIED'))
        sys.exit(0 if okc else 1)
    sys.exit(0 if allok else 1)


if __name__ == '__main__':
    main()
