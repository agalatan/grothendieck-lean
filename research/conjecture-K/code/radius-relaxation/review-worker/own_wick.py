#!/usr/bin/env python3
"""Reviewer's exact Wick calculus (written for the review; nothing imported from the author's scripts).

Complex side.  Polynomials in y_1..y_d and their conjugates with Gaussian-integer coefficients:
dict {(alpha_1..alpha_d, beta_1..beta_d): (re, im)} for prod y_j^alpha_j conj(y_j)^beta_j.
Standard complex Gaussian (E|y_j|^2 = 1):  E prod y^alpha conj(y)^beta = prod [alpha_j = beta_j] alpha_j!.

Real side (the conventions of the Lean development, read from the Lean sources):
real polynomials in x_1..x_{2d} with Fraction coefficients, E = standard real Gaussian,
y_j = (x_{2j-1} + i x_{2j})/sqrt(2).  The functions lean_* transcribe the definitions of
Grothe/LowerAnalytic/Circular.lean (rotD, kern, cubicKernel, Circular), Fluctuation.lean (ouL) and
GramTensor.lean (cplxProj, cplxT, gramT, ctN, ctH, ctB, ctW, ctY, gramN, gramH, gramB, gramY, gramZ),
JointContractions.lean (jointS0, jointH0), CircularFourth.lean (cubicTensorNormSq).
"""
from fractions import Fraction as Fr
from math import factorial
import itertools

# ---------------------------------------------------------------- Gaussian integers / rationals as pairs
def cadd(a, b): return (a[0] + b[0], a[1] + b[1])
def csub(a, b): return (a[0] - b[0], a[1] - b[1])
def cmul(a, b): return (a[0] * b[0] - a[1] * b[1], a[0] * b[1] + a[1] * b[0])
def cconj(a): return (a[0], -a[1])
def cabs2(a): return a[0] * a[0] + a[1] * a[1]
def cscale(a, f): return (a[0] * f, a[1] * f)
CZ = (0, 0)


# ---------------------------------------------------------------- complex polynomials
def p_clean(p):
    return {k: v for k, v in p.items() if v[0] != 0 or v[1] != 0}


def p_add(p, q, f=1):
    r = dict(p)
    for k, v in q.items():
        w = r.get(k, CZ)
        r[k] = (w[0] + f * v[0], w[1] + f * v[1])
    return p_clean(r)


def p_mul(p, q):
    r = {}
    for k1, v1 in p.items():
        for k2, v2 in q.items():
            k = tuple(x + y for x, y in zip(k1, k2))
            w = r.get(k, CZ)
            r[k] = (w[0] + v1[0] * v2[0] - v1[1] * v2[1], w[1] + v1[0] * v2[1] + v1[1] * v2[0])
    return p_clean(r)


def p_conj(p, d):
    return {k[d:] + k[:d]: (v[0], -v[1]) for k, v in p.items()}


def p_d(p, i):
    """partial derivative in variable number i (0..d-1: y_i;  d..2d-1: conj(y_{i-d}))."""
    r = {}
    for k, v in p.items():
        if k[i] > 0:
            kk = k[:i] + (k[i] - 1,) + k[i + 1:]
            r[kk] = (v[0] * k[i], v[1] * k[i])
    return r


def p_x(p, i):
    """multiplication by variable number i."""
    return {k[:i] + (k[i] + 1,) + k[i + 1:]: v for k, v in p.items()}


def p_const(c, d):
    return p_clean({(0,) * (2 * d): c})


def p_E(p, d):
    re = im = 0
    for k, v in p.items():
        if k[:d] == k[d:]:
            f = 1
            for j in range(d):
                f *= factorial(k[j])
            re += v[0] * f
            im += v[1] * f
    return (re, im)


def wick_cubic(t, d):
    """q = sum_{abc} t[a][b][c] :y_a y_b conj(y_c):,  :y_a y_b conj(y_c): = y_a y_b conj(y_c) - d_ac y_b - d_bc y_a."""
    q = {}
    z = (0,) * (2 * d)
    for a in range(d):
        for b in range(d):
            for c in range(d):
                v = t[a][b][c]
                if v == CZ:
                    continue
                k = list(z); k[a] += 1; k[b] += 1; k[d + c] += 1
                q = p_add(q, {tuple(k): v})
                if a == c:
                    k = list(z); k[b] += 1
                    q = p_add(q, {tuple(k): v}, -1)
                if b == c:
                    k = list(z); k[a] += 1
                    q = p_add(q, {tuple(k): v}, -1)
    return q


def number_ops(q, d):
    """(N1 q, N2 q) with N1 = sum_j (y_j d_j - dbar_j d_j), N2 = sum_j (conj(y_j) dbar_j - d_j dbar_j)."""
    n1, n2 = {}, {}
    for j in range(d):
        dj = p_d(q, j)
        dbj = p_d(q, d + j)
        mixed = p_d(dj, d + j)
        n1 = p_add(p_add(n1, p_x(dj, j)), mixed, -1)
        n2 = p_add(p_add(n2, p_x(dbj, d + j)), mixed, -1)
    return n1, n2


def stein_objects(q, d):
    """V = |q|^2, c1 = sum |d_j q|^2, c2 = sum |dbar_j q|^2, a = sum d_j q dbar_j q."""
    qb = p_conj(q, d)
    V = p_mul(q, qb)
    c1, c2, a = {}, {}, {}
    for j in range(d):
        dj = p_d(q, j)
        dbj = p_d(q, d + j)
        c1 = p_add(c1, p_mul(dj, p_conj(dj, d)))
        c2 = p_add(c2, p_mul(dbj, p_conj(dbj, d)))
        a = p_add(a, p_mul(dj, dbj))
    return qb, V, c1, c2, a


# ---------------------------------------------------------------- the Lean contractions (literal index patterns)
def lean_contractions(t, R):
    """n, h, b, y, z of GramTensor.lean for a 3-tensor t[a][b][c] of pairs over the index range R.
    ctN a b = sum_{j,k} t a j k * conj (t b j k);   ctH a b = sum_{j,k} t j k a * conj (t j k b)
    ctB b e = sum_{a,d} t a b d * t d e a;          ctW a b j c = sum_i t a b i * t j i c
    ctY = (W abjc + W ajbc + W bajc + W bjac + W jabc + W jbac)/6
    gramN = sum |ctN|^2, gramH = sum |ctH|^2, gramB = sum |ctB|^2, gramY = sum |ctY|^2,
    gramZ = sum_{a,b} Re (ctN a b * ctH a b)."""
    R = list(R)
    ZZ = (Fr(0), Fr(0))

    def S(gen):
        acc = ZZ
        for x in gen:
            acc = cadd(acc, x)
        return acc
    N = {(a, b): S(cmul(t[a][j][k], cconj(t[b][j][k])) for j in R for k in R) for a in R for b in R}
    H = {(a, b): S(cmul(t[j][k][a], cconj(t[j][k][b])) for j in R for k in R) for a in R for b in R}
    B = {(b, e): S(cmul(t[a][b][dd], t[dd][e][a]) for a in R for dd in R) for b in R for e in R}
    W = {(a, b, j, c): S(cmul(t[a][b][i], t[j][i][c]) for i in R) for a in R for b in R for j in R for c in R}
    gN = sum(cabs2(v) for v in N.values())
    gH = sum(cabs2(v) for v in H.values())
    gB = sum(cabs2(v) for v in B.values())
    gY = 0
    for a in R:
        for b in R:
            for j in R:
                for c in R:
                    s6 = S([W[(a, b, j, c)], W[(a, j, b, c)], W[(b, a, j, c)], W[(b, j, a, c)], W[(j, a, b, c)],
                            W[(j, b, a, c)]])
                    gY += cabs2(s6) / Fr(36)
    gZ = sum(cmul(N[(a, b)], H[(a, b)])[0] for a in R for b in R)
    return Fr(gN), Fr(gH), Fr(gB), Fr(gY), Fr(gZ)


def tensor_norm_sq(t, R):
    R = list(R)
    return sum(cabs2(t[a][b][c]) for a in R for b in R for c in R)


def to_fr_tensor(t, d):
    return [[[(Fr(t[a][b][c][0]), Fr(t[a][b][c][1])) for c in range(d)] for b in range(d)] for a in range(d)]


# ---------------------------------------------------------------- real side (Lean's own objects)
def r_add(p, q, f=1):
    r = dict(p)
    for k, v in q.items():
        r[k] = r.get(k, 0) + f * v
    return {k: v for k, v in r.items() if v != 0}


def r_mul(p, q):
    r = {}
    for k1, v1 in p.items():
        for k2, v2 in q.items():
            k = tuple(x + y for x, y in zip(k1, k2))
            r[k] = r.get(k, 0) + v1 * v2
    return {k: v for k, v in r.items() if v != 0}


def r_d(p, i):
    r = {}
    for k, v in p.items():
        if k[i] > 0:
            r[k[:i] + (k[i] - 1,) + k[i + 1:]] = v * k[i]
    return r


def r_x(p, i):
    return {k[:i] + (k[i] + 1,) + k[i + 1:]: v for k, v in p.items()}


def dfact(n):
    r = 1
    while n > 1:
        r *= n
        n -= 2
    return r


def r_E(p):
    """standard real Gaussian: E x^k = (k-1)!! for even k."""
    tot = 0
    for k, v in p.items():
        if all(e % 2 == 0 for e in k):
            f = 1
            for e in k:
                f *= dfact(e - 1)
            tot += v * f
    return tot


def real_pair(q, d):
    """(atil, btil) = (Re, Im) of sqrt(2) q under y_j = (x_{2j} + i x_{2j+1})/sqrt(2) (0-based real indices):
    a monomial of total degree 3 gets the factor sqrt(2) 2^{-3/2} = 1/2, of degree 1 the factor 1."""
    m = 2 * d
    re, im = {}, {}
    zero = (0,) * m
    for k, v in q.items():
        deg = sum(k)
        assert deg in (1, 3)
        fac = Fr(1, 2) if deg == 3 else Fr(1)
        # expand prod (x_{2j} + i x_{2j+1})^alpha_j (x_{2j} - i x_{2j+1})^beta_j as complex polynomial in x
        cur = {zero: (Fr(1), Fr(0))}
        for j in range(d):
            for sgn, cnt in ((1, k[j]), (-1, k[d + j])):
                for _ in range(cnt):
                    nxt = {}
                    for kk, vv in cur.items():
                        k1 = kk[:2 * j] + (kk[2 * j] + 1,) + kk[2 * j + 1:]
                        w = nxt.get(k1, (Fr(0), Fr(0)))
                        nxt[k1] = cadd(w, vv)
                        k2 = kk[:2 * j + 1] + (kk[2 * j + 1] + 1,) + kk[2 * j + 2:]
                        w = nxt.get(k2, (Fr(0), Fr(0)))
                        nxt[k2] = cadd(w, cmul(vv, (Fr(0), Fr(sgn))))
                    cur = nxt
        for kk, vv in cur.items():
            w = cmul(vv, (Fr(v[0]) * fac, Fr(v[1]) * fac))
            re[kk] = re.get(kk, 0) + w[0]
            im[kk] = im.get(kk, 0) + w[1]
    return {k: v for k, v in re.items() if v != 0}, {k: v for k, v in im.items() if v != 0}


def complex_to_real(p, d, scale_log2=0):
    """(Re, Im) of 2^{scale_log2/2} p under y_j = (x_{2j} + i x_{2j+1})/sqrt(2); every monomial of p must have a total
    degree of the parity of scale_log2 (so that all coefficients are rational)."""
    m = 2 * d
    re, im = {}, {}
    zero = (0,) * m
    for k, v in p.items():
        deg = sum(k)
        assert (deg - scale_log2) % 2 == 0
        e2 = (scale_log2 - deg) // 2                      # factor 2^{e2}
        fac = Fr(2) ** e2 if e2 >= 0 else Fr(1, 2 ** (-e2))
        cur = {zero: (Fr(1), Fr(0))}
        for j in range(d):
            for sgn, cnt in ((1, k[j]), (-1, k[d + j])):
                for _ in range(cnt):
                    nxt = {}
                    for kk, vv in cur.items():
                        k1 = kk[:2 * j] + (kk[2 * j] + 1,) + kk[2 * j + 1:]
                        nxt[k1] = cadd(nxt.get(k1, (Fr(0), Fr(0))), vv)
                        k2 = kk[:2 * j + 1] + (kk[2 * j + 1] + 1,) + kk[2 * j + 2:]
                        nxt[k2] = cadd(nxt.get(k2, (Fr(0), Fr(0))), cmul(vv, (Fr(0), Fr(sgn))))
                    cur = nxt
        for kk, vv in cur.items():
            w = cmul(vv, (Fr(v[0]) * fac, Fr(v[1]) * fac))
            re[kk] = re.get(kk, 0) + w[0]
            im[kk] = im.get(kk, 0) + w[1]
    return {k: v for k, v in re.items() if v != 0}, {k: v for k, v in im.items() if v != 0}


def lean_gam(P, Q, m):
    """gam P Q = sum_i pderiv i P * pderiv i Q."""
    out = {}
    for i in range(m):
        out = r_add(out, r_mul(r_d(P, i), r_d(Q, i)))
    return out


def lean_J(d):
    """the complex structure with rotD J (a + ib) = i (a + ib):  J[2k][2k+1] = 1, J[2k+1][2k] = -1."""
    m = 2 * d
    J = [[Fr(0)] * m for _ in range(m)]
    for k in range(d):
        J[2 * k][2 * k + 1] = Fr(1)
        J[2 * k + 1][2 * k] = Fr(-1)
    return J


def lean_rotD(J, P, m):
    """rotD J P = sum_i sum_j C (J j i) * (X j * pderiv i P)."""
    out = {}
    for i in range(m):
        dP = r_d(P, i)
        for j in range(m):
            if J[j][i] != 0:
                out = r_add(out, r_x(dP, j), J[j][i])
    return out


def lean_ouL(P, m):
    """ouL P = sum_i (pderiv i (pderiv i P) - X i * pderiv i P)."""
    out = {}
    for i in range(m):
        dP = r_d(P, i)
        out = r_add(out, r_d(dP, i))
        out = r_add(out, r_x(dP, i), -1)
    return out


def lean_cubicKernel(F, m):
    """cubicKernel F i j k = constantCoeff (pderiv i (pderiv j (pderiv k F))) / 6."""
    zero = (0,) * m
    return [[[Fr(r_d(r_d(r_d(F, k), j), i).get(zero, 0)) / 6 for k in range(m)] for j in range(m)] for i in range(m)]


def lean_gramT(J, f, g, m):
    """cplxProj J s a a' = ((if a = a' then 1 else 0) - s * I * J a a') / 2
    cplxT J f g a b c = 3 * sum_{a',b',c'} cplxProj J 1 a a' * cplxProj J 1 b b' * cplxProj J (-1) c c'
                            * (f a' b' c' + I * g a' b' c')."""
    def proj(s):
        return [[cscale(csub((Fr(1) if a == a2 else Fr(0), Fr(0)), cmul((Fr(0), Fr(s)), (J[a][a2], Fr(0)))), Fr(1, 2))
                 for a2 in range(m)] for a in range(m)]
    Pp, Pm = proj(1), proj(-1)
    tau = [[[(f[a][b][c], g[a][b][c]) for c in range(m)] for b in range(m)] for a in range(m)]
    # apply the three projections one slot at a time (the triple sum, reassociated)
    s1 = [[[(Fr(0), Fr(0))] * m for _ in range(m)] for _ in range(m)]
    for a in range(m):
        for a2 in range(m):
            if Pp[a][a2] == (0, 0):
                continue
            for b in range(m):
                for c in range(m):
                    s1[a][b][c] = cadd(s1[a][b][c], cmul(Pp[a][a2], tau[a2][b][c]))
    s2 = [[[(Fr(0), Fr(0))] * m for _ in range(m)] for _ in range(m)]
    for b in range(m):
        for b2 in range(m):
            if Pp[b][b2] == (0, 0):
                continue
            for a in range(m):
                for c in range(m):
                    s2[a][b][c] = cadd(s2[a][b][c], cmul(Pp[b][b2], s1[a][b2][c]))
    s3 = [[[(Fr(0), Fr(0))] * m for _ in range(m)] for _ in range(m)]
    for c in range(m):
        for c2 in range(m):
            if Pm[c][c2] == (0, 0):
                continue
            for a in range(m):
                for b in range(m):
                    s3[a][b][c] = cadd(s3[a][b][c], cmul(Pm[c][c2], s2[a][b][c2]))
    return [[[cscale(s3[a][b][c], 3) for c in range(m)] for b in range(m)] for a in range(m)]


def jointS0(n, h, b, y, z):
    return 8 * n + 2 * h + 8 * b + 8 * z


def jointH0(n, h, b, y, z):
    return Fr(8, 3) * n + Fr(2, 3) * h + Fr(8, 3) * b + 24 * y - Fr(16, 3) * z
