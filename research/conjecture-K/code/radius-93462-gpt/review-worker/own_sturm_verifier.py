#!/usr/bin/env python3
"""Independent exact check of the certificates of the 0.93462 package (reviewer: worker of claude-b9ee).

Written from the statement of PROOF.md sections 6-8 (conditions (23), (25), (26) and the spline
definition), not from the delivered verifiers.  Positivity of the majorant polynomial Phi on each
knot interval and on the tail is decided by Sturm sequences in integer arithmetic (the delivery
uses Bernstein subdivision).  Standard library only.

Usage: python3 -I own_sturm_verifier.py CERTIFICATES.json
"""
import json
import sys
from fractions import Fraction as Fr
from math import gcd, isqrt

C6 = Fr(4045313, 100000)
ALPHAS = [Fr(1, 4), Fr(1, 2), Fr(1), Fr(2), Fr(4), Fr(8), Fr(16), Fr(32)]


# ---------------- polynomials (lists of Fractions, low degree first)
def padd(*ps):
    n = max(len(p) for p in ps)
    return [sum((p[i] if i < len(p) else 0) for p in ps) for i in range(n)]


def psc(p, c):
    return [c * x for x in p]


def pmul(a, b):
    out = [Fr(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                out[i + j] += x * y
    return out


def pder(p):
    return [i * p[i] for i in range(1, len(p))] or [Fr(0)]


def trim(a):
    a = list(a)
    while a and a[-1] == 0:
        a.pop()
    return a


def to_int(a):
    a = trim(a)
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


def sign_at(a, x):
    p, q = x.numerator, x.denominator
    acc, n = 0, len(a) - 1
    for i in range(n, -1, -1):
        acc = acc * p + a[i] * q ** (n - i)
    return (acc > 0) - (acc < 0)


def neg_rem(a, b):
    a = list(a)
    lb, db = b[-1], len(b) - 1
    while a and len(a) - 1 >= db:
        la, k = a[-1], len(a) - 1 - db
        m, sg = abs(lb), (1 if lb > 0 else -1)
        a = [m * x for x in a]
        for i, y in enumerate(b):
            a[i + k] -= sg * la * y
        a = trim(a)
    return to_int([-x for x in a])


def sturm_positive(p, a, b=None):
    """p > 0 on [a, b] (or on [a, oo) when b is None)."""
    p0 = to_int(p)
    if not p0:
        return False
    chain = [p0, to_int(pder(p0))]
    while len(chain[-1]) > 1:
        r = neg_rem(chain[-2], chain[-1])
        if not r:
            break
        chain.append(r)
    chain = [c for c in chain if c]
    if sign_at(chain[0], a) <= 0:
        return False

    def var(signs):
        s = [x for x in signs if x]
        return sum(1 for i in range(len(s) - 1) if s[i] != s[i + 1])
    va = var([sign_at(c, a) for c in chain])
    if b is None:
        if chain[0][-1] <= 0:
            return False
        vb = var([(c[-1] > 0) - (c[-1] < 0) for c in chain])
    else:
        if sign_at(chain[0], b) <= 0:
            return False
        vb = var([sign_at(c, b) for c in chain])
    return va == vb


def psd2(m):
    return m[0][0] >= 0 and m[1][1] >= 0 and m[0][0] * m[1][1] - m[0][1] ** 2 >= 0 and m[0][1] == m[1][0]


def check(x):
    kn = [Fr(v) for v in x['knots']]
    co = [[Fr(v) for v in row] for row in x['coef']]
    ww = [[Fr(v) for v in row] for row in x['ww']]
    J = len(kn)
    assert kn[0] == 0 and all(kn[i] < kn[i + 1] for i in range(J - 1)), 'knots'
    assert len(co) == 2 * J and len(ww) == J
    assert all(v == 0 for v in co[0] + co[1]), 'f(0) = f\'(0) = 0'
    d = [Fr(v) for v in x['d']]
    etaD, etaC = (Fr(v) for v in x['alpha'])
    M = [[Fr(v) for v in row] for row in x['mat']]
    zeta, nu, tau, psi = Fr(x['zeta']), Fr(x['nu']), Fr(x['tau']), Fr(x['psi'])
    muP, muQ = (Fr(v) for v in x['mu'])
    L0 = [[Fr(v) for v in row] for row in x['gram']]
    N0 = [[Fr(v) for v in row] for row in x['gramN']]
    kc, kb = Fr(x['kc']), Fr(x['kb'])
    chi = [Fr(v) for v in x['chi']]
    det = M[0][0] * M[1][1] - M[0][1] ** 2
    assert M[0][1] == M[1][0] and M[0][0] > 0 and det > 0 and zeta > 0 and d[3] >= 0, 'M0, zeta, d3'
    assert muP >= 0 and muQ >= 0 and tau >= 0 and psi >= 0 and all(c >= 0 for c in chi) and len(chi) == 8, 'signs'
    assert psd2(L0) and psd2(N0), 'L0, N0'
    for w11, w22, w12 in ww:
        assert w11 >= 0 and w22 >= 0 and w12 ** 2 <= w11 * w22, 'W at a knot'
    # ---- (23)
    m11, m12, m22 = M[0][0], M[0][1], M[1][1]
    cA = m11 / 18 + zeta + kb
    cB = m11 / 9 + m12 / 6 + zeta / 4 + kc / 4 + kb / 2
    cP = 5 * m11 / 9 + 4 * m12 / 3 + m22 + kc
    cQ = 5 * m11 / 9 + 2 * m12 / 3 + m22 + kc
    cR = 4 * m11 / 9 + 2 * m12 / 3
    a_ = [(1 + al) / 4 for al in ALPHAS]
    k_ = [5 + 3 / al for al in ALPHAS]
    assert cA + N0[0][0] / 2 <= nu + tau, '(23.1)'
    assert cB + N0[0][0] + N0[0][1] / 2 <= nu + psi - sum(a_[i] / k_[i] * chi[i] for i in range(8)), '(23.2)'
    assert cP + 2 * tau + L0[0][0] + N0[0][0] <= 2 * nu + muP, '(23.3)'
    assert cQ + L0[1][1] + N0[0][0] + 2 * N0[0][1] + N0[1][1] <= 2 * nu + muQ + sum(chi), '(23.4)'
    assert cR + 2 * L0[0][1] - 4 * N0[0][0] - 2 * N0[0][1] + 12 * psi <= sum(chi[i] / k_[i] for i in range(8)), '(23.5)'
    # ---- (25) on every segment (local variable t in [0,1], r = a + L t) and on the tail (x = r - R0 >= 0)
    nseg = 0
    for j in range(J):
        tail = (j == J - 1)
        if tail:
            R0 = kn[-1]
            r = [R0, Fr(1)]                                    # r = R0 + x
            r2 = pmul(r, r)
            f = [padd([co[-2][i]], psc(padd(r2, [-R0 * R0]), co[-1][i] / (2 * R0))) for i in range(2)]
            fr = [pder(g) for g in f]                          # d/dr = d/dx
            w = [[ww[-1][i]] for i in range(3)]
        else:
            a, b = kn[j], kn[j + 1]
            L = b - a
            r = [a, L]                                         # r = a + L t
            r2 = pmul(r, r)
            H = ([Fr(1), Fr(0), Fr(-3), Fr(2)], [Fr(0), L, -2 * L, L], [Fr(0), Fr(0), Fr(3), Fr(-2)], [Fr(0), Fr(0), -L, L])
            f = [padd(psc(H[0], co[2 * j][i]), psc(H[1], co[2 * j + 1][i]), psc(H[2], co[2 * j + 2][i]),
                      psc(H[3], co[2 * j + 3][i])) for i in range(2)]
            fr = [psc(pder(g), 1 / L) for g in f]              # d/dr = (1/L) d/dt
            w = [[ww[j][i], ww[j + 1][i] - ww[j][i]] for i in range(3)]
        k = [psc(pmul(r, g), Fr(1, 2)) for g in fr]            # (r/2) f'
        h = [padd(f[i], k[i]) for i in range(2)]
        w11, w22, w12 = w
        calR = padd(pmul(r2, padd(f[0], f[1])), psc(padd(h[0], h[1]), -1))
        HD = padd(h[0], [-etaD], psc(w22, 3))
        HC = padd(h[1], [-etaC], psc(padd(r2, [Fr(-1)]), -kc), w11, psc(w22, -1))
        Hb = padd(psc(k[0], Fr(2, 3)), k[1], psc(r2, -kb), psc(w12, 2))
        pv = padd([d[0]], psc(r2, d[1]), psc(pmul(r2, r2), d[2]), psc(pmul(r2, pmul(r2, r2)), d[3]))
        quad = padd(psc(pmul(HD, HD), m22), psc(pmul(HD, HC), -2 * m12), psc(pmul(HC, HC), m11))
        Phi = padd(pv, calR, psc(r, -1), psc(w11, -1), psc(w22, -2), psc(quad, -1 / (4 * det)), psc(pmul(Hb, Hb), -1 / (4 * zeta)))
        ok = sturm_positive(Phi, Fr(0), None if tail else Fr(1))
        assert ok, 'Phi > 0 fails on %s' % ('the tail' if tail else 'segment %d' % j)
        nseg += 1
    # ---- (26) at both ends of the s-interval
    s_lo, s_hi = (Fr(v) for v in x['interval'])
    bounds = []
    for s in (s_lo, s_hi):
        q = 10 ** 12
        sb = Fr(isqrt(s.numerator * q * q // s.denominator) + 1, q)
        assert sb * sb >= s
        M3 = 6 + 9 * s + C6 * s * sb
        bounds.append(d[0] + d[1] + d[2] * (2 + s) + d[3] * M3 + nu * s + 4 * muP + muQ + sum(chi))
    return s_lo, s_hi, max(bounds), nseg


if __name__ == '__main__':
    pack = json.load(open(sys.argv[1]))
    rho = Fr(pack['rho'])
    last = Fr(0)
    worst = Fr(0)
    for x in pack['certificates']:
        s_lo, s_hi, bnd, nseg = check(x)
        assert s_lo == last and s_hi > s_lo, 'cover'
        last = s_hi
        worst = max(worst, bnd)
        assert bnd <= rho, 'bound above rho'
        print('%-18s s in [%s, %s]  %d Sturm checks (segments + tail)  bound <= %.12f' % (x['id'], s_lo, s_hi, nseg, float(bnd)))
    assert last >= 42
    print('PASS (Sturm): all certificates; cover [0, %s]; largest bound %.12f <= rho = %s' % (last, float(worst), rho))
