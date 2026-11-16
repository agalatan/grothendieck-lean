#!/usr/bin/env python3
"""C (exact rational arithmetic on instances): the budget formulas of the relaxation on random cubics.

q = sum t_{abc} :Z_a Z_b conj(Z_c):  with Gaussian-integer coefficients (t symmetric in a, b), in
d = 1, ..., 5 complex variables (sparse tensors for d = 4, 5).  Polynomials in (z, zbar) are dictionaries; expectations use
E prod z_j^{a_j} conj(z_j)^{b_j} = prod a_j! [a_j = b_j].  Complex numbers are pairs of Fractions.
With u = E|q|^2 and the contraction scalars of the normalised tensor (definitions below):

  u^2 s              = E|q|^4 - 2u^2                 = u^2 (32n + 8h + 32b + 96y)
  E (c2 - u)^2       = u^2 (16n + 4h)
  E (c1 - c2 - u)^2  = u^2 (16n + 20h + 16b)                      [derived in this folder]
  E (c1 + c2 - 3u)^2 = u^2 (80n + 20h + 16b + 96y + 32z)          [Lean: 4 u2 + u4]
  E (c1 - 2u)^2      = u^2 (32n + 16h + 16b + 48y + 16z)          [derived in this folder]
  E |a|^2            = u^2 (32b + 24y),     E[conj(q)^2 a] = u^2 (32b + 48y)
  E[V c2] - u^2      = u^2 (16n + 4h + 24y),  E[V c1] - 2u^2 = u^2 (32n + 8h + 16b + 72y)
and the identities (I), (II) for g(v) = v and g(v) = v^2 (the tests G = v^2 and G = v^3).

Definitions of the scalars (they are n, h, b, y, z of Grothe/LowerAnalytic/GramTensor.lean: the line-by-line
match of the definitions is section 2.1 of the independent review, REVIEW.md in the folder above scripts/;
its log review/own_identities.log has 22 further exact tensors up to d = 6):  N_{jl} = sum_{bk} t_{jbk} conj(t_{lbk}),  H_{kl} = sum_{ab} conj(t_{abk}) t_{abl},
B_{ab} = sum_{cd} t_{acd} t_{bdc},  W_{abe;f} = sum_c t_{abc} t_{cef};  n = |N|^2, h = |H|^2,
z = tr(N H), b = |B|^2, y = |Sym_{abe} W|^2  (Frobenius norms, tensor normalised to 2 sum |t|^2 = 1).

PROOF of the two rows "derived in this folder" (u = 1).  P_{1,1}F has the coefficient matrix
E[d_j dbar_k F].  For F = V it is 4N + 2H (E[d_j q conj(d_k q)] = 4 N_{jk}, E[dbar_k q conj(dbar_j q)] =
2 H_{jk}; the terms with d_j dbar_k q vanish by orthogonality of the chaoses), so |P_{1,1}V|^2 =
16n + 4h + 16z as in Lean.  For F = c2 = sum_k F_k conj(F_k), F_k = dbar_k q holomorphic, it is
sum_k E[d_j F_k conj(d_l F_k)] = 4N.  Hence f1 := <P_{1,1}V, P_{1,1}c2> = 16n + 8z.  By Theorem 2(b) of
the antiholomorphic-Stein note, c1 + c2 - 3 = 2 P_{1,1}V + P_{2,2}V, and by Theorem 2(c),
<V, c2 - 1> = E(c2-1)^2 + 24y.  So <c1 + c2 - 3, c2 - 1> = f1 + <V, c2 - 1> = 32n + 4h + 24y + 8z, and
  E(c1 - c2 - 1)^2 = E(c1+c2-3)^2 - 4 <c1+c2-3, c2-1> + 4 E(c2-1)^2 = 16n + 20h + 16b,
  E(c1 - 2)^2      = E(c1+c2-3)^2 - 2 <c1+c2-3, c2-1> + E(c2-1)^2   = 32n + 16h + 16b + 48y + 16z.   QED
Consequence for the law of V alone (rotation identity E f(V) - f(0) = E[(c1 - c2) f'(V)], i.e.
E[c1 - c2 | V = v] p_V(v) = P(V > v), and conditional Jensen):
  E[(P(V > v)/p_V(v) - 1)^2] <= 16n + 20h + 16b <= 5s/2.
"""
import sys, random, itertools
from fractions import Fraction as Fr
from math import factorial


class C:
    """complex number with Fraction parts."""
    __slots__ = ('re', 'im')

    def __init__(self, re=0, im=0):
        self.re, self.im = Fr(re), Fr(im)

    def __add__(self, o): return C(self.re + o.re, self.im + o.im)
    def __sub__(self, o): return C(self.re - o.re, self.im - o.im)
    def __mul__(self, o): return C(self.re * o.re - self.im * o.im, self.re * o.im + self.im * o.re)
    def conj(self): return C(self.re, -self.im)
    def scale(self, f): return C(self.re * f, self.im * f)
    def iszero(self): return self.re == 0 and self.im == 0
    def abs2(self): return self.re ** 2 + self.im ** 2


def padd(p, q, sign=1):
    r = dict(p)
    for k, v in q.items():
        r[k] = (r[k] + v.scale(sign)) if k in r else v.scale(sign)
    return {k: v for k, v in r.items() if not v.iszero()}


def pmul(p, q):
    r = {}
    for k1, v1 in p.items():
        for k2, v2 in q.items():
            k = tuple(a + b for a, b in zip(k1, k2))
            r[k] = (r[k] + v1 * v2) if k in r else v1 * v2
    return {k: v for k, v in r.items() if not v.iszero()}


def pconj(p, d):
    # swap the exponents of z_j and conj(z_j); conjugate coefficients
    return {tuple(k[d:]) + tuple(k[:d]): v.conj() for k, v in p.items()}


def pdiff(p, i):
    r = {}
    for k, v in p.items():
        if k[i] > 0:
            kk = list(k); kk[i] -= 1
            r[tuple(kk)] = v.scale(k[i])
    return r


def expect(p, d):
    tot = C()
    for k, v in p.items():
        if all(k[j] == k[d + j] for j in range(d)):
            f = 1
            for j in range(d):
                f *= factorial(k[j])
            tot = tot + v.scale(f)
    return tot


def const(c, d):
    return {tuple([0] * (2 * d)): c}


def cubic(t, d):
    """q = sum t_abc (Z_a Z_b conj(Z_c) - delta_ac Z_b - delta_bc Z_a)."""
    q = {}
    for a, b, c in itertools.product(range(d), repeat=3):
        if t[a][b][c].iszero():
            continue
        k = [0] * (2 * d); k[a] += 1; k[b] += 1; k[d + c] += 1
        q = padd(q, {tuple(k): t[a][b][c]})
        if a == c:
            k = [0] * (2 * d); k[b] += 1
            q = padd(q, {tuple(k): t[a][b][c]}, -1)
        if b == c:
            k = [0] * (2 * d); k[a] += 1
            q = padd(q, {tuple(k): t[a][b][c]}, -1)
    return q


def scalars(t, d):
    """n, h, b, y, z of the tensor t / sqrt(2 sum |t|^2) (exact)."""
    R = range(d)
    nrm = 2 * sum(t[a][b][c].abs2() for a in R for b in R for c in R)
    N = [[sum((t[j][b][k] * t[l][b][k].conj() for b in R for k in R), C()) for l in R] for j in R]
    H = [[sum((t[a][b][k].conj() * t[a][b][l] for a in R for b in R), C()) for l in R] for k in R]
    B = [[sum((t[a][c][e] * t[b][e][c] for c in R for e in R), C()) for b in R] for a in R]
    W = {}
    for a, b, e, f in itertools.product(R, repeat=4):
        W[(a, b, e, f)] = sum((t[a][b][c] * t[c][e][f] for c in R), C())
    Ws = {}
    for a, b, e, f in itertools.product(R, repeat=4):
        acc = C()
        for pa, pb, pe in itertools.permutations((a, b, e)):
            acc = acc + W[(pa, pb, pe, f)]
        Ws[(a, b, e, f)] = acc.scale(Fr(1, 6))
    n = sum(N[j][l].abs2() for j in R for l in R) / nrm ** 2
    h = sum(H[j][l].abs2() for j in R for l in R) / nrm ** 2
    z = sum((N[j][l] * H[l][j]).re for j in R for l in R) / nrm ** 2
    b = sum(B[j][l].abs2() for j in R for l in R) / nrm ** 2
    y = sum(v.abs2() for v in Ws.values()) / nrm ** 2
    return n, h, b, y, z, nrm


def check(d, rng, density=0.75):
    R = range(d)
    t = [[[C() for _ in R] for _ in R] for _ in R]
    for a in R:
        for b in range(a, d):
            for c in R:
                if rng.random() < density:
                    val = C(rng.randint(-3, 3), rng.randint(-3, 3))
                    t[a][b][c] = val
                    t[b][a][c] = val
    if all(t[a][b][c].iszero() for a in R for b in R for c in R):
        t[0][0][0] = C(1)
    q = cubic(t, d)
    qb = pconj(q, d)
    V = pmul(q, qb)
    dq = [pdiff(q, j) for j in R]                 # d/dz_j
    dbq = [pdiff(q, d + j) for j in R]            # d/dconj(z_j)
    c1, c2, a = {}, {}, {}
    for j in R:
        c1 = padd(c1, pmul(dq[j], pconj(dq[j], d)))
        c2 = padd(c2, pmul(dbq[j], pconj(dbq[j], d)))
        a = padd(a, pmul(dq[j], dbq[j]))
    E = lambda p: expect(p, d)
    u = E(V).re
    n, h, b, y, z, nrm = scalars(t, d)
    assert u == nrm, 'E|q|^2 = 2 sum |t|^2'
    assert E(c1).re == 2 * u and E(c2).re == u
    V2 = pmul(V, V)
    qb2a = pmul(pmul(qb, qb), a)
    cu = lambda x: const(C(x), d)
    sq = lambda p: E(pmul(p, p)).re
    checks = {
        's': (E(V2).re - 2 * u ** 2, u ** 2 * (32 * n + 8 * h + 32 * b + 96 * y)),
        'c2': (sq(padd(c2, cu(u), -1)), u ** 2 * (16 * n + 4 * h)),
        'c1-c2': (sq(padd(padd(c1, c2, -1), cu(u), -1)), u ** 2 * (16 * n + 20 * h + 16 * b)),
        'c1+c2': (sq(padd(padd(c1, c2), cu(3 * u), -1)), u ** 2 * (80 * n + 20 * h + 16 * b + 96 * y + 32 * z)),
        'c1': (sq(padd(c1, cu(2 * u), -1)), u ** 2 * (32 * n + 16 * h + 16 * b + 48 * y + 16 * z)),
        '|a|^2': (E(pmul(a, pconj(a, d))).re, u ** 2 * (32 * b + 24 * y)),
        'E qb^2 a': (E(qb2a).re, u ** 2 * (32 * b + 48 * y)),
        'Im E qb^2 a': (E(qb2a).im, Fr(0)),
        'E V c2': (E(pmul(V, c2)).re - u ** 2, u ** 2 * (16 * n + 4 * h + 24 * y)),
        'E V c1': (E(pmul(V, c1)).re - 2 * u ** 2, u ** 2 * (32 * n + 8 * h + 16 * b + 72 * y)),
        # identities with g = v:   E V^2 = 2 E[c2 V] + E[qb^2 a] = E[c1 V] + E[qb^2 a]/2
        'I, g=v': (E(V2).re, 2 * E(pmul(V, c2)).re + E(qb2a).re),
        'II, g=v': (E(V2).re, E(pmul(V, c1)).re + E(qb2a).re / 2),
    }
    if d <= 2:
        # g = v^2:  E V^3 = 3 E[c2 V^2] + 2 E[qb^2 a V] = (3/2) E[c1 V^2] + E[qb^2 a V]
        V3 = E(pmul(V2, V)).re
        checks['I, g=v^2'] = (V3, 3 * E(pmul(V2, c2)).re + 2 * E(pmul(qb2a, V)).re)
        checks['II, g=v^2'] = (V3, Fr(3, 2) * E(pmul(V2, c1)).re + E(pmul(qb2a, V)).re)
        # pointwise cone |a|^2 <= c1 c2 cannot be checked by expectations; the scalar constraints can
    ok = all(x == y_ for x, y_ in checks.values())
    cons = dict(b_le_n=b <= n, y_le_z=y <= z, z2_le_nh=z * z <= n * h, m_ge_0=n + b + 3 * y - z >= 0,
                g1=(3 * y - z) ** 2 <= h * (n + b + 3 * y - z),
                h0_ge_0=Fr(8, 3) * n + Fr(2, 3) * h + Fr(8, 3) * b + 24 * y - Fr(16, 3) * z >= 0)
    return ok, checks, cons, (n, h, b, y, z), u


if __name__ == '__main__':
    rng = random.Random(20261116)
    total, bad = 0, 0
    # d >= 4 (sparse tensors): beyond the range where low-dimensional coincidences of the invariants can occur
    for d, reps in ((1, 2), (2, 6), (3, 4), (4, 3), (5, 2)):
        for it in range(reps):
            ok, checks, cons, sc, u = check(d, rng, density=(0.75 if d <= 3 else (0.22 if d == 4 else 0.10)))
            total += 1
            bad += (not ok) or (not all(cons.values()))
            print('d=%d  u=%s  (n,h,b,y,z)=%s  kurtosis s=%.4f  all identities exact: %s  scalar constraints: %s' % (
                d, u, tuple(round(float(x), 5) for x in sc), float(32 * sc[0] + 8 * sc[1] + 32 * sc[2] + 96 * sc[3]), ok,
                all(cons.values())), flush=True)
            if not ok:
                for k, (x, y_) in checks.items():
                    if x != y_:
                        print('    MISMATCH', k, float(x), float(y_))
    print('%d random cubics, %d failures' % (total, bad))
    sys.exit(1 if bad else 0)
