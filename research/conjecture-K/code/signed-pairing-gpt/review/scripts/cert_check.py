#!/usr/bin/env python3
# Reviewer's independent exact replay of the diffuse-bulk certificate (results/certificate.json).
# Own code, integers and Fractions only.  Nothing is imported from the package; the certificate is read as data.
#
# What is checked (PROOFS.md section 7, (22)-(25)), with Q = rho p(X) + W in units beta = 1, p(X) = X(|X|^2 - 2):
#   target      conj(C_0) = Xbar (3T^2 - 2T - 2) = 3 H_23 + 16 H_12 + 12 H_01            (T = |X|^2)
#   null vectors, for a Wick monomial A (charge 0) or B (charge -2) in (X, W):
#     N_A = (Xbar - d_X) A - rho { (Wbar - d_W)[2 H_11(X) A] + (W - d_Wbar)[H_02(X) A] }
#     N_B = (X - d_Xbar) B - rho { (Wbar - d_W)[H_20(X) B]  + (W - d_Wbar)[2 H_11(X) B] }
#   For each cell [lo, hi] with dyadic coefficients d_j:  Zbar(rho) = target - sum_j d_j N_j(rho) = z0 + rho z1,
#     max(||Zbar(lo)||^2, ||Zbar(hi)||^2) + 1024 hi^2/(1 + 2 hi^2)  <=  252 theta_row        for every row whose
#     certified range contains the cell.
# The operators are built here from the one-variable rules
#     z H_ab = H_{a+1,b} + b H_{a,b-1},   zbar H_ab = H_{a,b+1} + a H_{a-1,b},   d_z H_ab = a H_{a-1,b},  d_zbar H_ab = b H_{a,b-1}
# (not from the product formula the package's verifier uses), and are then tested in ORDINARY monomials with
# E[z^a zbar^b] = a! delta_ab: orthogonality/norms of the Wick monomials and the null identities E[N f(Q)] = 0.
import json, sys, time
from fractions import Fraction
from math import factorial

cert_path = sys.argv[1]
payload = json.load(open(cert_path))
assert payload['format'] == 'wick-null-certificate-v1'
D, BITS = payload['degree'], payload['bits']
SC = 1 << BITS

# ---------- Wick polynomials: dict {(a, b, c, d): int};  H_ab(X) H_cd(W)
def add_to(p, k, v):
    if v:
        nv = p.get(k, 0) + v
        if nv: p[k] = nv
        else: p.pop(k, None)

def mul_z(p, pos):            # multiply by the variable of slot pos (0: X, 2: W);  z H_ab = H_{a+1,b} + b H_{a,b-1}
    out = {}
    for k, v in p.items():
        k1 = list(k); k1[pos] += 1; add_to(out, tuple(k1), v)
        if k[pos + 1] > 0:
            k2 = list(k); k2[pos + 1] -= 1; add_to(out, tuple(k2), v * k[pos + 1])
    return out

def mul_zbar(p, pos):         # zbar H_ab = H_{a,b+1} + a H_{a-1,b}
    out = {}
    for k, v in p.items():
        k1 = list(k); k1[pos + 1] += 1; add_to(out, tuple(k1), v)
        if k[pos] > 0:
            k2 = list(k); k2[pos] -= 1; add_to(out, tuple(k2), v * k[pos])
    return out

def d_z(p, pos):              # d/dz H_ab = a H_{a-1,b}
    out = {}
    for k, v in p.items():
        if k[pos] > 0:
            k2 = list(k); k2[pos] -= 1; add_to(out, tuple(k2), v * k[pos])
    return out

def d_zbar(p, pos):
    out = {}
    for k, v in p.items():
        if k[pos + 1] > 0:
            k2 = list(k); k2[pos + 1] -= 1; add_to(out, tuple(k2), v * k[pos + 1])
    return out

def lin(*terms):              # sum of c * p
    out = {}
    for c, p in terms:
        for k, v in p.items(): add_to(out, k, c * v)
    return out

def adj_dz(p, pos):  return lin((1, mul_zbar(p, pos)), (-1, d_z(p, pos)))       # (zbar - d_z)
def adj_dzb(p, pos): return lin((1, mul_z(p, pos)), (-1, d_zbar(p, pos)))       # (z - d_zbar)
def mul_H11(p): return lin((1, mul_z(mul_zbar(p, 0), 0)), (-1, p))              # H_11(X) = X Xbar - 1
def mul_H20(p): return mul_z(mul_z(p, 0), 0)                                    # H_20(X) = X^2
def mul_H02(p): return mul_zbar(mul_zbar(p, 0), 0)                              # H_02(X) = Xbar^2

def null_parts(typ, idx):
    """return (L, R) with N = L - rho R."""
    A = {idx: 1}
    if typ == 'A':
        L = adj_dz(A, 0)
        R = lin((2, adj_dz(mul_H11(A), 2)), (1, adj_dzb(mul_H02(A), 2)))
    else:
        L = adj_dzb(A, 0)
        R = lin((1, adj_dz(mul_H20(A), 2)), (2, adj_dzb(mul_H11(A), 2)))
    return L, R

def indices(Dm, ch):
    return [(a, b, c, d) for a in range(Dm + 1) for b in range(Dm - a + 1) for c in range(Dm - a - b + 1)
            for d in range(Dm - a - b - c + 1) if a - b + c - d == ch]

cols = [('A', i) for i in indices(D, 0)] + [('B', i) for i in indices(D, -2)]
t0 = time.time()
parts = [null_parts(t, i) for t, i in cols]
wt = lambda k: factorial(k[0]) * factorial(k[1]) * factorial(k[2]) * factorial(k[3])

# target: conj(C_0) = Xbar (3 T^2 - 2 T - 2), built from ordinary multiplication in the Wick basis
one = {(0, 0, 0, 0): 1}
Xb = mul_zbar(one, 0)
Tm = lambda p: mul_z(mul_zbar(p, 0), 0)
target = lin((3, Tm(Tm(Xb))), (-2, Tm(Xb)), (-2, Xb))
assert target == {(2, 3, 0, 0): 3, (1, 2, 0, 0): 16, (0, 1, 0, 0): 12}, target
assert sum(wt(k) * v * v for k, v in target.items()) == 764
maxdeg = max(sum(k) for L, R in parts for p in (L, R) for k in p)
charges = {k[0] - k[1] + k[2] - k[3] for L, R in parts for p in (L, R) for k in p}
print('controls', len(cols), '(A: %d, B: %d)' % (len(indices(D, 0)), len(indices(D, -2))), '| output degree <=', maxdeg, '| output charges', charges)
assert charges == {-1} and maxdeg == D + 3
assert all(len(L) == 1 and list(L.values()) == [1] for L, R in parts), 'the rho-free part of a null vector is one Wick monomial'

# ---------- ordinary-monomial tests of the Wick rules and of the null identities
def wick_to_ordinary_1(a, b):       # H_ab(z) = sum_r (-1)^r C(a,r) C(b,r) r! z^(a-r) zbar^(b-r)
    from math import comb
    return {(a - r, b - r): (-1) ** r * comb(a, r) * comb(b, r) * factorial(r) for r in range(min(a, b) + 1)}

def to_ordinary(p):
    out = {}
    for (a, b, c, d), v in p.items():
        for (i, j), x in wick_to_ordinary_1(a, b).items():
            for (k, l), y in wick_to_ordinary_1(c, d).items():
                add_to(out, (i, j, k, l), v * x * y)
    return out

def omul(p, q):
    out = {}
    for (a, b, c, d), v in p.items():
        for (e, f, g, h), w in q.items():
            add_to(out, (a + e, b + f, c + g, d + h), v * w)
    return out

def oexp(p):                         # E of an ordinary polynomial: E[z^a zbar^b] = a! delta_ab for each variable
    return sum(v * factorial(a) * factorial(c) for (a, b, c, d), v in p.items() if a == b and c == d)

# (i) orthogonality and norms of Wick monomials, total degree <= 5 in each variable pair (exhaustive, small)
small = [(a, b) for a in range(4) for b in range(4)]
for (a, b) in small:
    for (c, d) in small:
        pa = {(i, j, 0, 0): v for (i, j), v in wick_to_ordinary_1(a, b).items()}
        pc = {(j, i, 0, 0): v for (i, j), v in wick_to_ordinary_1(c, d).items()}       # conjugate
        val = oexp(omul(pa, pc))
        assert val == (factorial(a) * factorial(b) if (a, b) == (c, d) else 0), (a, b, c, d, val)
print('ordinary-monomial test: <H_ab, H_cd> = a! b! delta, a, b, c, d <= 3: ok')

# (ii) null identities E[N f(Q)] = 0 for f(Q) = Q, Q|Q|^2, Q|Q|^4 at rational rho, all in ordinary monomials
def Q_ord(rho_n, rho_d):             # rho_d * Q = rho_n (X^2 Xbar - 2 X) + rho_d W
    return {(2, 1, 0, 0): rho_n, (1, 0, 0, 0): -2 * rho_n, (0, 0, 1, 0): rho_d}
def conj_ord(p): return {(b, a, d, c): v for (a, b, c, d), v in p.items()}

import random
random.seed(20261116)
nchecks = 0; nwrong = 0
for rho_n, rho_d in ((1, 3), (5, 2)):
    Q = Q_ord(rho_n, rho_d); V = omul(Q, conj_ord(Q)); QV = omul(Q, V); QV2 = omul(QV, V)
    tests = [(Q, list(range(len(cols)))), (QV, list(range(len(cols)))), (QV2, random.sample(range(len(cols)), 60))]
    for f, js in tests:
        for j in js:
            L, R = parts[j]
            # rho_d * N = rho_d L - rho_n R
            Nord = to_ordinary(lin((rho_d, L), (-rho_n, R)))
            val = oexp(omul(Nord, f))
            assert val == 0, ('null identity fails', cols[j], rho_n, rho_d)
            wrong = oexp(omul(to_ordinary(lin((rho_d, L), (rho_n, R))), f))
            nwrong += (wrong != 0); nchecks += 1
    # content identity in ordinary monomials:  E[Xbar Q |Q|^2] = rho^2 <C_0, Q> ... with h(v) = v:  k' = 1, F = Q
    tord = to_ordinary(target)
    lhs = oexp(omul({(0, 1, 0, 0): 1}, QV))                     # rho_d^3 * E[Xbar Q |Q|^2]
    rhs = rho_n ** 2 * oexp(omul(tord, Q))                      # rho_d^3 * rho^2 E[conj(C_0) Q]   (oexp carries one rho_d)
    assert lhs == rhs == 32 * rho_n ** 3, (lhs, rhs)
    # h(v) = v^2: k' = 2v + 2u, u = 2 rho^2 + 1:  E[Xbar Q V^2] = rho^2 (2 E[conj(C_0) Q V] + 2u E[conj(C_0) Q])
    lhs2 = oexp(omul({(0, 1, 0, 0): 1}, QV2))                   # rho_d^5 * E[Xbar Q V^2]
    rhs2 = rho_n ** 2 * (2 * oexp(omul(tord, QV)) + 2 * (2 * rho_n ** 2 + rho_d ** 2) * oexp(omul(tord, Q)))
    assert lhs2 == rhs2, (lhs2, rhs2)
print('ordinary-monomial test: Lemma 10 for h(v) = v and v^2 at rho = 1/3, 5/2 (E[Xbar Q h(V)] = rho^2 <C_0, Q k\'(V)>): ok')
print('ordinary-monomial test: E[N f(Q)] = 0 for f = Q, Q|Q|^2 (all %d controls) and Q|Q|^4 (60 random controls), rho = 1/3, 5/2: %d checks ok;' % (len(cols), nchecks),
      'sign-flipped rho term gives a nonzero value in %d of them' % nwrong)
print('ordinary-monomial test: E[Xbar Q |Q|^2] = rho^2 E[conj(C_0) Q] = 32 rho^3 (beta = 1): ok')

# ---------- the cells
F = Fraction
rows = [(t['row'], F(int(t['rho_max'][0]), int(t['rho_max'][1])), F(int(t['theta'][0]), int(t['theta'][1]))) for t in payload['thresholds']]
expected = [('0.80', F(11, 100), F(7, 20)), ('0.82', F(13, 100), F(3, 5)), ('0.84', F(1, 5), F(13, 10)),
            ('0.845', F(1, 4), F(9, 5)), ('0.85', F(1, 3), F(12, 5)), ('0.855', F(3, 5), F(18, 5))]
assert rows == expected, rows
keys = sorted({k for L, R in parts for p in (L, R) for k in p} | set(target))
loc = {k: i for i, k in enumerate(keys)}
W = [wt(k) for k in keys]
Lloc = [loc[next(iter(L))] for L, R in parts]
Rloc = [[(loc[k], v) for k, v in R.items()] for L, R in parts]
tgt = [0] * len(keys)
for k, v in target.items(): tgt[loc[k]] = v * SC

def norm2(z0, z1, r):
    n, d = r.numerator, r.denominator
    s = 0
    for w, a, b in zip(W, z0, z1):
        z = d * a + n * b
        s += w * z * z
    return F(s, SC * SC * d * d)

prev = F(0)
stats = {r[0]: dict(max=F(0), cells=0, worst=None) for r in rows}
maxcoef = 0; cellrep = []
for cell in payload['cells']:
    lo = F(int(cell['lo'][0]), int(cell['lo'][1])); hi = F(int(cell['hi'][0]), int(cell['hi'][1]))
    assert lo == prev and hi > lo, 'cover gap'
    prev = hi
    co = [int(s) for s in cell['coeff']]
    assert len(co) == len(cols)
    maxcoef = max(maxcoef, max(abs(c) for c in co))
    z0 = tgt[:]; z1 = [0] * len(keys)
    for j, c in enumerate(co):
        if c:
            z0[Lloc[j]] -= c
            for i, v in Rloc[j]: z1[i] += c * v
    nlo, nhi = norm2(z0, z1, lo), norm2(z0, z1, hi)
    corr = F(1024) * hi * hi / (1 + 2 * hi * hi)
    upper = (max(nlo, nhi) + corr) / 252
    cellrep.append((float(lo), float(hi), float(nlo), float(nhi), float(corr), float(upper)))
    for name, cap, th in rows:
        if hi <= cap:
            assert upper <= th, ('FAIL', name, lo, hi, float(upper))
            st = stats[name]; st['cells'] += 1
            if upper > st['max']: st['max'] = upper; st['worst'] = (lo, hi)
        else:
            assert lo >= cap, 'row cap is not a cell boundary'
assert prev == F(3, 5), 'cover endpoint'
print('cells', len(payload['cells']), '| cover [0, 3/5] contiguous | largest |coefficient| / 2^%d = %.3f' % (BITS, maxcoef / SC))
for name, cap, th in rows:
    st = stats[name]
    print('row %-5s rho <= %-6s theta %-5s : %3d cells, largest certified bound %.9f (margin %.6f), at cell [%s, %s]' % (
        name, cap, th, st['cells'], float(st['max']), float(th - st['max']), st['worst'][0], st['worst'][1]))
json.dump(cellrep, open(sys.argv[2], 'w'))
print('PASS (reviewer replay, %.1f s)' % (time.time() - t0))
