#!/usr/bin/env python3
"""Exact rational polynomial check of all analytic inputs (F1)-(F3) (label C, standard library only).

Usage:  python3 -I check_identities_exact.py

Checks in exact Fraction arithmetic on 25 structured and random Gaussian-integer Wick cubics
q = sum t_{abc} :z_a z_b conj(z_c): across dimensions d = 1, 2, 3, 4, 5, 6:
  1. Operator identity dbar_k a == W_k := sum_j F_j (d_j F_k) identically as polynomials in (z, zbar);
  2. First and second moments:
       E|q|^2 = u = 2 sum |t|^2,   E c_1 = 2u,   E c_2 = u,
       E V^2 - 2u^2            = u^2 (32n + 8h + 32b + 96y),
       E[(c_2 - u)^2]          = u^2 (16n + 4h),
       2 E[(c_2 - u)(c_1 - 2u)]= u^2 (32n + 48y + 16z),
       E[(c_1 - 2u)^2]         = u^2 (32n + 16h + 16b + 48y + 16z),
       E|a|^2                  = u^2 (32b + 24y),
       E[conj(q)^2 a]          = u^2 (32b + 48y)   (and Im == 0),
       E[w] = sum_k E|W_k|^2   = u^2 (24y);
  3. Antiholomorphic Stein identities (I), (II), (III) and (IV) for g(V) = V^m (m = 0, 1, 2 for d <= 2;
     m = 0, 1 for d = 3, 4; m = 0 for d = 5, 6);
  4. Pointwise Cauchy-Schwarz cone inequalities at exact Gaussian-integer evaluation points z in Z[i]^d:
       c_1 >= 0, c_2 >= 0, (Re(conj(q)^2 a))^2 <= V^2 |a|^2 <= V^2 c_1 c_2,
       tilde_beta^2 = (Re(conj(q) b_loc))^2 <= V |b_loc|^2 <= V c_2 w;
  5. Homogeneous Gram scalar cuts on (n, h, b, y, z).
"""
import itertools
import random
import sys
import time
from fractions import Fraction as Fr
from math import factorial


class QComplex:
    __slots__ = ('re', 'im')

    def __init__(self, re=0, im=0):
        self.re, self.im = Fr(re), Fr(im)

    def __add__(self, o):
        return QComplex(self.re + o.re, self.im + o.im)

    def __sub__(self, o):
        return QComplex(self.re - o.re, self.im - o.im)

    def __mul__(self, o):
        return QComplex(self.re * o.re - self.im * o.im, self.re * o.im + self.im * o.re)

    def __eq__(self, o):
        return self.re == o.re and self.im == o.im

    def conj(self):
        return QComplex(self.re, -self.im)

    def scale(self, f):
        return QComplex(self.re * f, self.im * f)

    def iszero(self):
        return self.re == 0 and self.im == 0

    def abs2(self):
        return self.re * self.re + self.im * self.im


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
            r[k] = (r[k] + v1 * v2) if k in r else (v1 * v2)
    return {k: v for k, v in r.items() if not v.iszero()}


def pconj(p, d):
    return {tuple(k[d:]) + tuple(k[:d]): v.conj() for k, v in p.items()}


def pdiff(p, idx):
    r = {}
    for k, v in p.items():
        if k[idx] > 0:
            kk = list(k)
            kk[idx] -= 1
            r[tuple(kk)] = v.scale(k[idx])
    return r


def pconst(c, d):
    return {} if c.iszero() else {tuple([0] * (2 * d)): c}


def pexpect(p, d):
    tot = QComplex()
    for k, v in p.items():
        if all(k[j] == k[d + j] for j in range(d)):
            wt = 1
            for j in range(d):
                wt *= factorial(k[j])
            tot = tot + v.scale(wt)
    return tot


def peval_point(p, z_pts, d):
    tot = QComplex()
    zc = [z.conj() for z in z_pts]
    for k, coeff in p.items():
        term = coeff
        for j in range(d):
            for _ in range(k[j]):
                term = term * z_pts[j]
            for _ in range(k[d + j]):
                term = term * zc[j]
        tot = tot + term
    return tot


def build_wick_cubic(t, d):
    q = {}
    for a, b, c in itertools.product(range(d), repeat=3):
        val = t[a][b][c]
        if val.iszero():
            continue
        k = [0] * (2 * d)
        k[a] += 1; k[b] += 1; k[d + c] += 1
        q = padd(q, {tuple(k): val})
        if a == c:
            k2 = [0] * (2 * d); k2[b] += 1
            q = padd(q, {tuple(k2): val}, -1)
        if b == c:
            k3 = [0] * (2 * d); k3[a] += 1
            q = padd(q, {tuple(k3): val}, -1)
    return q


def tensor_scalars(t, d):
    R = range(d)
    u = 2 * sum(t[a][b][c].abs2() for a in R for b in R for c in R)
    N = [[sum((t[j][b][k] * t[l][b][k].conj() for b in R for k in R), QComplex()) for l in R] for j in R]
    H = [[sum((t[a][b][k].conj() * t[a][b][l] for a in R for b in R), QComplex()) for l in R] for k in R]
    B = [[sum((t[a][c][e] * t[b][e][c] for c in R for e in R), QComplex()) for b in R] for a in R]
    W = {}
    for a, b, e, f in itertools.product(R, repeat=4):
        W[(a, b, e, f)] = sum((t[a][b][c] * t[c][e][f] for c in R), QComplex())
    y_num = Fr(0)
    for a, b, e, f in itertools.product(R, repeat=4):
        acc = QComplex()
        for pa, pb, pe in itertools.permutations((a, b, e)):
            acc = acc + W[(pa, pb, pe, f)]
        y_num += acc.scale(Fr(1, 6)).abs2()
    u2 = u * u
    n = sum(N[j][l].abs2() for j in R for l in R) / u2
    h = sum(H[j][l].abs2() for j in R for l in R) / u2
    z = sum((N[j][l] * H[l][j]).re for j in R for l in R) / u2
    b = sum(B[j][l].abs2() for j in R for l in R) / u2
    y = y_num / u2
    return n, h, b, y, z, u


def empty_tensor(d):
    return [[[QComplex() for _ in range(d)] for _ in range(d)] for _ in range(d)]


def set_sym(t, a, b, c, val):
    t[a][b][c] = val
    t[b][a][c] = val


def verify_instance(name, t, d, rng):
    R = range(d)
    q = build_wick_cubic(t, d)
    qb = pconj(q, d)
    V = pmul(q, qb)
    dq = [pdiff(q, j) for j in R]
    F = [pdiff(q, d + j) for j in R]

    c1, c2, a_pol = {}, {}, {}
    for j in R:
        c1 = padd(c1, pmul(dq[j], pconj(dq[j], d)))
        c2 = padd(c2, pmul(F[j], pconj(F[j], d)))
        a_pol = padd(a_pol, pmul(dq[j], F[j]))

    W = []
    for k in R:
        Wk = {}
        for j in R:
            Wk = padd(Wk, pmul(F[j], pdiff(F[k], j)))
        # Check operator identity dbar_k a == W_k identically!
        dbar_k_a = pdiff(a_pol, d + k)
        assert dbar_k_a == Wk, f'{name}: dbar_{k} a != W_{k}'
        W.append(Wk)

    w_pol, bloc = {}, {}
    for k in R:
        w_pol = padd(w_pol, pmul(W[k], pconj(W[k], d)))
        bloc = padd(bloc, pmul(pconj(F[k], d), W[k]))

    E = lambda p: pexpect(p, d)
    n, h, b, y, z, u = tensor_scalars(t, d)
    assert E(V) == QComplex(u, 0), f'{name}: E V != u'
    assert E(c1) == QComplex(2 * u, 0) and E(c2) == QComplex(u, 0), f'{name}: E c1 / E c2'

    c2_u = padd(c2, pconst(QComplex(u), d), -1)
    c1_2u = padd(c1, pconst(QComplex(2 * u), d), -1)
    V2 = pmul(V, V)
    qb2a = pmul(pmul(qb, qb), a_pol)
    abs_a2 = pmul(a_pol, pconj(a_pol, d))
    qb_bloc = pmul(qb, bloc)

    u2 = u * u
    assert E(V2).re - 2 * u2 == u2 * (32 * n + 8 * h + 32 * b + 96 * y), f'{name}: s'
    assert E(pmul(c2_u, c2_u)).re == u2 * (16 * n + 4 * h), f'{name}: Var c2'
    assert 2 * E(pmul(c2_u, c1_2u)).re == u2 * (32 * n + 48 * y + 16 * z), f'{name}: Cov(c2,c1)'
    assert E(pmul(c1_2u, c1_2u)).re == u2 * (32 * n + 16 * h + 16 * b + 48 * y + 16 * z), f'{name}: Var c1'
    assert E(abs_a2).re == u2 * (32 * b + 24 * y), f'{name}: E|a|^2'
    assert E(qb2a) == QComplex(u2 * (32 * b + 48 * y), 0), f'{name}: E[qb^2 a]'
    assert E(w_pol).re == u2 * (24 * y), f'{name}: E[w]'

    # Homogeneous Gram cuts
    assert n >= 0 and h >= 0 and b >= 0 and y >= 0 and z >= 0
    assert b <= n and y <= z and z * z <= n * h
    m_val = n + b + 3 * y - z
    assert m_val >= 0 and (3 * y - z) ** 2 <= h * m_val
    assert Fr(8, 3) * n + Fr(2, 3) * h + Fr(8, 3) * b + 24 * y - Fr(16, 3) * z >= 0
    assert 8 * n + 2 * h + 8 * b + 8 * z >= 0

    # Identities (I), (II), (III), (IV) for g(V) = V^m (G(V) = V^{m+1}, phi(V) = (m+1)V^m, Y(V) = m V^m)
    max_m = 2 if d <= 2 else (1 if d <= 4 else 0)
    Vm = pconst(QComplex(1), d)
    Vm_prev = None
    for m in range(max_m + 1):
        Vm1 = pmul(Vm, V)
        EVm1 = E(Vm1).re
        # (I) & (II) for m >= 1 (for m=0: E V = E c2 = (1/2) E c1, already checked)
        t_rho_Y = Fr(0) if m == 0 else m * E(pmul(qb2a, Vm_prev)).re
        assert EVm1 == (m + 1) * E(pmul(c2, Vm)).re + t_rho_Y, f'{name}: (I) m={m}'
        assert EVm1 == Fr(m + 1, 2) * E(pmul(c1, Vm)).re + Fr(1, 2) * t_rho_Y, f'{name}: (II) m={m}'

        # (III): E[c2(c2-u)(m+1)V^m - (c2-u)V^{m+1} + (c2-u)(V rho) m V^{m-1} + tilde_beta V^m] == 0
        lhs3 = ((m + 1) * E(pmul(pmul(c2, c2_u), Vm)).re
                - E(pmul(c2_u, Vm1)).re
                + (Fr(0) if m == 0 else m * E(pmul(pmul(c2_u, qb2a), Vm_prev)).re)
                + E(pmul(qb_bloc, Vm)).re)
        assert lhs3 == 0, f'{name}: (III) failed at m={m}: {lhs3}'

        # (IV): E[|a|^2 (m+1)V^m - (V rho) V^m + c2 (V rho) m V^{m-1} + tilde_beta V^m] == 0
        lhs4 = ((m + 1) * E(pmul(abs_a2, Vm)).re
                - E(pmul(qb2a, Vm)).re
                + (Fr(0) if m == 0 else m * E(pmul(pmul(c2, qb2a), Vm_prev)).re)
                + E(pmul(qb_bloc, Vm)).re)
        assert lhs4 == 0, f'{name}: (IV) failed at m={m}: {lhs4}'

        Vm_prev = Vm
        if m < max_m:
            Vm = Vm1

    # Pointwise cone at 5 exact Gaussian-integer points
    for _ in range(5):
        z_pts = [QComplex(rng.randint(-2, 2), rng.randint(-2, 2)) for _ in R]
        v_pt = peval_point(V, z_pts, d).re
        c1_pt = peval_point(c1, z_pts, d).re
        c2_pt = peval_point(c2, z_pts, d).re
        a2_pt = peval_point(abs_a2, z_pts, d).re
        w_pt = peval_point(w_pol, z_pts, d).re
        vrho_pt = peval_point(qb2a, z_pts, d).re
        tbeta_pt = peval_point(qb_bloc, z_pts, d).re
        bloc2_pt = peval_point(bloc, z_pts, d).abs2()
        assert c1_pt >= 0 and c2_pt >= 0 and w_pt >= 0
        assert vrho_pt ** 2 <= (v_pt ** 2) * a2_pt <= (v_pt ** 2) * c1_pt * c2_pt
        assert tbeta_pt ** 2 <= v_pt * bloc2_pt <= v_pt * c2_pt * w_pt

    s_kurt = 32 * n + 8 * h + 32 * b + 96 * y
    return u, s_kurt, max_m


def main():
    t0 = time.time()
    rng = random.Random(20261117)
    instances = []

    # 6 named structured cubics
    t = empty_tensor(1); set_sym(t, 0, 0, 0, QComplex(1, 0))
    instances.append(('d=1 Wick monomial', t, 1))

    t = empty_tensor(2); set_sym(t, 0, 0, 1, QComplex(1, 0))
    instances.append(('d=2 Z1^2 conj(Z2)', t, 2))

    t = empty_tensor(2); set_sym(t, 0, 1, 1, QComplex(1, 0))
    instances.append(('d=2 Z1(|Z2|^2 - 1)', t, 2))

    t = empty_tensor(3); set_sym(t, 0, 1, 2, QComplex(1, 0))
    instances.append(('d=3 Z1 Z2 conj(Z3)', t, 3))

    t = empty_tensor(3)
    for j in range(3):
        set_sym(t, j, j, (j + 1) % 3, QComplex(1, j))
    instances.append(('d=3 cyclic 3-chain', t, 3))

    t = empty_tensor(3)
    set_sym(t, 0, 1, 1, QComplex(1, 0)); set_sym(t, 0, 2, 2, QComplex(1, 0))
    instances.append(('d=3 Z1(|Z2|^2+|Z3|^2-2)', t, 3))

    # 19 random cubics across d = 2, 3, 4, 5, 6 (d >= 4 rules out low-dimensional invariant coincidences)
    specs = [(2, 5, 0.85), (3, 5, 0.75), (4, 5, 0.30), (5, 2, 0.14), (6, 2, 0.09)]
    for d, count, dens in specs:
        for idx in range(count):
            t = empty_tensor(d)
            for a in range(d):
                for b in range(a, d):
                    for c in range(d):
                        if rng.random() < dens:
                            val = QComplex(rng.randint(-3, 3), rng.randint(-3, 3))
                            set_sym(t, a, b, c, val)
            if all(t[a][b][c].iszero() for a in range(d) for b in range(d) for c in range(d)):
                set_sym(t, 0, min(1, d - 1), d - 1, QComplex(1, 1))
            instances.append((f'd={d} random #{idx + 1}', t, d))

    for idx, (name, t, d) in enumerate(instances, 1):
        u, s_kurt, max_m = verify_instance(name, t, d, rng)
        print(f'[{idx:2d}/{len(instances)}] {name:<26s} u={str(u):<6s} s={float(s_kurt):7.4f}  m<= {max_m}  EXACT PASS', flush=True)

    print(f'All {len(instances)} instances passed every exact rational check in {time.time() - t0:.2f}s.')


if __name__ == '__main__':
    main()
