#!/usr/bin/env python3
"""claude-b9ee, 16 Nov 2026: an independent exact verifier for the radius certificate cubic_l1_rho_0_9359.

Written from the README's sections 5 and 6 only (the dual-certificate lemma and the data format), without reading
the delivered verify.mjs / verify.py.  Exact rational arithmetic (fractions.Fraction) throughout.

For each certificate it checks:
  (a) lambda_0..4 >= 0, alpha = 3 lambda_0 > 0, beta = 2 lambda_1 + lambda_3 > 0,
      zeta = (2/3) lambda_0 + lambda_1 + lambda_2 + lambda_4 > 0, d_3 >= 0;
  (b) f_D(0) = f_C(0) = f_D'(0) = f_C'(0) = 0 (so g_i(v) = f_i(sqrt v) is C^1 at 0);
  (c) W(r_j) is positive semidefinite at every knot (W is piecewise linear, constant on the tail);
  (d) Phi(r) >= 0 on every segment and on the tail [R, infinity), by Bernstein coefficients with exact subdivision;
  (e) B(s) <= 9359/10000 at both ends of its s-interval, with a rational upper bound for sqrt(s);
and that the s-intervals cover [0, 42].
usage: own_verifier.py certificates.json
"""
import json, sys
from fractions import Fraction as Fr
from math import comb, isqrt

RHO = Fr(9359, 10000)
C6 = Fr(4045313, 100000)

# ---- polynomials in one variable, lists of Fractions, lowest degree first
def padd(p, q):
    n = max(len(p), len(q)); return [(p[i] if i < len(p) else 0) + (q[i] if i < len(q) else 0) for i in range(n)]
def pscale(c, p): return [c * x for x in p]
def psub(p, q): return padd(p, pscale(Fr(-1), q))
def pmul(p, q):
    out = [Fr(0)] * (len(p) + len(q) - 1)
    for i, a in enumerate(p):
        if a:
            for j, b in enumerate(q): out[i + j] += a * b
    return out
def pder(p): return [i * p[i] for i in range(1, len(p))] or [Fr(0)]
def pcompose_sq(coeffs, r):
    """sum_k coeffs[k] * (r^2)^k for a polynomial r."""
    r2 = pmul(r, r); out = [Fr(0)]; pw = [Fr(1)]
    for c in coeffs:
        out = padd(out, pscale(c, pw)); pw = pmul(pw, r2)
    return out

def bernstein(p, n):
    p = p + [Fr(0)] * (n + 1 - len(p))
    assert len(p) == n + 1, 'degree above %d' % n
    return [sum(p[j] * Fr(comb(i, j), comb(n, j)) for j in range(i + 1)) for i in range(n + 1)]

def nonneg_bernstein(b, depth=0, maxdepth=60):
    """True iff the subdivision rule proves the polynomial with Bernstein coefficients b nonnegative on [0, 1]."""
    if all(x >= 0 for x in b): return 1
    if b[0] < 0 or b[-1] < 0: return 0                      # an endpoint value is negative
    if depth >= maxdepth: return 0
    left, right, cur = [], [], list(b)                         # de Casteljau at 1/2
    while cur:
        left.append(cur[0]); right.append(cur[-1])
        cur = [(cur[i] + cur[i + 1]) / 2 for i in range(len(cur) - 1)]
    a = nonneg_bernstein(left, depth + 1, maxdepth)
    if not a: return 0
    c = nonneg_bernstein(right[::-1], depth + 1, maxdepth)
    return a + c if c else 0

def phi_poly(cert, r, fD, fC, dfD, dfC, w11, w22, w12):
    """Phi as a polynomial in the local variable, from polynomials r, f_i, f_i' (derivatives in r) and W."""
    lam = cert['lam']; etaD, etaC = cert['eta']
    alpha = 3 * lam[0]; beta = 2 * lam[1] + lam[3]; zeta = Fr(2, 3) * lam[0] + lam[1] + lam[2] + lam[4]
    half_r = pscale(Fr(1, 2), r)
    kD, kC = pmul(half_r, dfD), pmul(half_r, dfC)
    hD, hC = padd(fD, kD), padd(fC, kC)
    r2 = pmul(r, r)
    R = psub(pmul(r2, padd(fD, fC)), padd(hD, hC))
    HD = padd(psub(hD, [etaD]), pscale(3, w22))
    HC = padd(padd(psub(hC, [etaC]), pscale(lam[3] - 2 * lam[2], psub(r2, [Fr(1)]))), psub(w11, w22))
    Hb = padd(padd(padd(pscale(Fr(2, 3), kD), kC), pscale(lam[4], r2)), pscale(2, w12))
    phi = padd(pcompose_sq(cert['d'], r), R)
    phi = psub(phi, r); phi = psub(phi, w11); phi = psub(phi, pscale(2, w22))
    phi = psub(phi, pscale(1 / (4 * alpha), pmul(HD, HD)))
    phi = psub(phi, pscale(1 / (4 * beta), pmul(HC, HC)))
    phi = psub(phi, pscale(1 / (4 * zeta), pmul(Hb, Hb)))
    while len(phi) > 1 and phi[-1] == 0: phi.pop()
    return phi

def sqrt_upper(s, digits=12):
    n, d = s.numerator, s.denominator; k = 10 ** digits
    a = isqrt(n * d * k * k) + 1                                  # a/(d k) >= sqrt(n/d)
    return Fr(a, d * k)

def check(raw):
    cert = dict(lam=[Fr(x) for x in raw['la']], eta=[Fr(x) for x in raw['alpha']], d=[Fr(x) for x in raw['d']])
    knots = [Fr(x) for x in raw['knots']]; m = len(knots) - 1
    Y = [[Fr(x) for x in raw['coef'][2 * j]] for j in range(m + 1)]; Z = [[Fr(x) for x in raw['coef'][2 * j + 1]] for j in range(m + 1)]
    Wk = [[Fr(x) for x in row] for row in raw['ww']]                 # (w11, w22, w12)
    lam = cert['lam']
    assert all(x >= 0 for x in lam) and 3 * lam[0] > 0 and 2 * lam[1] + lam[3] > 0, 'a multiplier has the wrong sign'
    assert Fr(2, 3) * lam[0] + lam[1] + lam[2] + lam[4] > 0 and cert['d'][3] >= 0 and len(cert['d']) == 4, 'zeta or d_3 has the wrong sign'
    assert knots[0] == 0 and all(knots[i] < knots[i + 1] for i in range(m)), 'knots not increasing from 0'
    assert Y[0] == [0, 0] and Z[0] == [0, 0], 'f_i(0), f_i\'(0) must vanish'
    for w11, w22, w12 in Wk:
        assert w11 >= 0 and w22 >= 0 and w11 * w22 - w12 * w12 >= 0, 'W not PSD at a knot'
    leaves = 0
    t = [Fr(0), Fr(1)]
    for j in range(m):
        a, b = knots[j], knots[j + 1]; h = b - a
        r = [a, h]
        fs, dfs = [], []
        for i in (0, 1):
            y0, z0, y1, z1 = Y[j][i], Z[j][i], Y[j + 1][i], Z[j + 1][i]
            f = [y0, h * z0, -3 * y0 - 2 * h * z0 + 3 * y1 - h * z1, 2 * y0 + h * z0 - 2 * y1 + h * z1]   # cubic Hermite in t
            fs.append(f); dfs.append(pscale(1 / h, pder(f)))
        W = [[Wk[j][c], Wk[j + 1][c] - Wk[j][c]] for c in range(3)]
        phi = phi_poly(cert, r, fs[0], fs[1], dfs[0], dfs[1], W[0], W[1], W[2])
        assert len(phi) <= 7, 'degree above six on a segment'
        got = nonneg_bernstein(bernstein(phi, 6))
        assert got, 'Phi not proved nonnegative on segment %d' % j
        leaves += got
    # tail: r = R + x, f_i = y_m + (r^2 - R^2)/(2R) z_m, f_i' = (r/R) z_m, W constant
    Rm = knots[m]; r = [Rm, Fr(1)]; r2 = pmul(r, r)
    fs = [padd([Y[m][i]], pscale(Z[m][i] / (2 * Rm), psub(r2, [Rm * Rm]))) for i in (0, 1)]
    dfs = [pscale(Z[m][i] / Rm, r) for i in (0, 1)]
    phi = phi_poly(cert, r, fs[0], fs[1], dfs[0], dfs[1], [Wk[m][0]], [Wk[m][1]], [Wk[m][2]])
    assert len(phi) <= 7, 'degree above six on the tail'
    phi = phi + [Fr(0)] * (7 - len(phi))
    # (1 - t)^6 P(t/(1 - t)) has Bernstein coefficients p_i / C(6, i) on [0, 1): nonnegative there iff P >= 0 on [0, infinity)
    got = nonneg_bernstein([phi[i] / comb(6, i) for i in range(7)])
    assert got, 'Phi not proved nonnegative on the tail'
    leaves += got
    lo, hi = [Fr(x) for x in raw['interval']]
    Lam = lam[0] + lam[1] + lam[2]; d = cert['d']; bounds = []
    for s in (lo, hi):
        M3 = 6 + 9 * s + C6 * s * sqrt_upper(s)
        B = d[0] + d[1] + d[2] * (2 + s) + d[3] * M3 + Lam * s
        assert B <= RHO, 'endpoint bound above 9359/10000 at s = %s' % s
        bounds.append(B)
    return lo, hi, bounds, leaves, m

if __name__ == '__main__':
    data = json.load(open(sys.argv[1]))
    assert Fr(data['rho']) == RHO and Fr(data['C6']) == C6
    res = sorted(check(c) for c in data['certificates'])
    assert res[0][0] == 0 and res[-1][1] == 42 and all(res[i][1] == res[i + 1][0] for i in range(len(res) - 1)), 'no cover of [0, 42]'
    total = 0
    for lo, hi, bounds, leaves, m in res:
        total += leaves
        print('s in [%s, %s]: %d segments + tail, %d Bernstein leaves, endpoint bounds %.12f, %.12f  <= 0.9359' % (lo, hi, m, leaves, float(bounds[0]), float(bounds[1])))
    print('ALL CHECKS PASS: %d certificates cover [0, 42]; %d leaves; largest endpoint bound %.12f' % (len(res), total, max(float(b) for r in res for b in r[2])))
