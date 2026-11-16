#!/usr/bin/env python3
# Reviewer (exact): the null identities E[N f(Q)] = 0 of PROOFS.md (23)-(24) for ALL 400 controls against test functions
# of high degree, f_a = Q^a conj(Q)^(a-1), a = 1..17 (degree up to 99 in X), so that every control is tested by a pairing
# in which the rho-free part and the rho part are both nonzero.  (The package's instance checks and the reviewer's
# ordinary-monomial checks use f of degree <= 15, where most of the 2400 pairings are 0 = 0.)
# Everything is in the Wick basis with the one-variable rules of cert_check.py; integers only.
#   E[H_ab(X) H_cd(W) * H_a'b'(X) H_c'd'(W)] = a! b! c! d!  if (a', b', c', d') = (b, a, d, c), else 0.
import sys, time
from math import factorial
t0 = time.time()
def add_to(p, k, v):
    if v:
        nv = p.get(k, 0) + v
        if nv: p[k] = nv
        else: p.pop(k, None)
def mul_z(p, pos):
    out = {}
    for k, v in p.items():
        k1 = list(k); k1[pos] += 1; add_to(out, tuple(k1), v)
        if k[pos + 1] > 0:
            k2 = list(k); k2[pos + 1] -= 1; add_to(out, tuple(k2), v * k[pos + 1])
    return out
def mul_zbar(p, pos):
    out = {}
    for k, v in p.items():
        k1 = list(k); k1[pos + 1] += 1; add_to(out, tuple(k1), v)
        if k[pos] > 0:
            k2 = list(k); k2[pos] -= 1; add_to(out, tuple(k2), v * k[pos])
    return out
def d_z(p, pos):
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
def lin(*terms):
    out = {}
    for c, p in terms:
        for k, v in p.items(): add_to(out, k, c * v)
    return out
adj_dz = lambda p, pos: lin((1, mul_zbar(p, pos)), (-1, d_z(p, pos)))
adj_dzb = lambda p, pos: lin((1, mul_z(p, pos)), (-1, d_zbar(p, pos)))
mul_H11 = lambda p: lin((1, mul_z(mul_zbar(p, 0), 0)), (-1, p))
mul_H20 = lambda p: mul_z(mul_z(p, 0), 0)
mul_H02 = lambda p: mul_zbar(mul_zbar(p, 0), 0)
def null_parts(typ, idx):
    A = {idx: 1}
    if typ == 'A': return adj_dz(A, 0), lin((2, adj_dz(mul_H11(A), 2)), (1, adj_dzb(mul_H02(A), 2)))
    return adj_dzb(A, 0), lin((1, adj_dz(mul_H20(A), 2)), (2, adj_dzb(mul_H11(A), 2)))
def indices(Dm, ch):
    return [(a, b, c, d) for a in range(Dm + 1) for b in range(Dm - a + 1) for c in range(Dm - a - b + 1)
            for d in range(Dm - a - b - c + 1) if a - b + c - d == ch]
D = 14
cols = [('A', i) for i in indices(D, 0)] + [('B', i) for i in indices(D, -2)]
parts = [null_parts(t, i) for t, i in cols]
wt = lambda k: factorial(k[0]) * factorial(k[1]) * factorial(k[2]) * factorial(k[3])
def pair(p, f): return sum(v * f.get((k[1], k[0], k[3], k[2]), 0) * wt(k) for k, v in p.items())
def mul_Q(p, rn, rd):      # multiply by rd * Q = rn (X^2 Xbar - 2 X) + rd W
    x = mul_z(p, 0)
    return lin((rn, mul_z(mul_zbar(x, 0), 0)), (-2 * rn, x), (rd, mul_z(p, 2)))
def mul_Qb(p, rn, rd):
    x = mul_zbar(p, 0)
    return lin((rn, mul_zbar(mul_z(x, 0), 0)), (-2 * rn, x), (rd, mul_zbar(p, 2)))
tested = [0] * len(cols); total = 0; nontrivial = 0
for rn, rd in ((1, 4), (3, 5)):
    f = mul_Q({(0, 0, 0, 0): 1}, rn, rd)
    for a in range(1, 18):
        if a > 1: f = mul_Q(mul_Qb(f, rn, rd), rn, rd)
        # sanity of the test function itself: E|Q|^2 = 2 rho^2 + 1 from f_1, in the Wick basis
        if a == 1:
            fb = {(k[1], k[0], k[3], k[2]): v for k, v in f.items()}
            assert pair(f, fb) == sum(v * v * wt(k) for k, v in f.items()) == 2 * rn * rn + rd * rd and pair(f, f) == 0
        for j, (L, R) in enumerate(parts):
            l = pair(L, f); r = pair(R, f)
            assert rd * l - rn * r == 0, ('null identity fails', cols[j], a, rn, rd)
            total += 1
            if l != 0 and r != 0: nontrivial += 1; tested[j] += 1
        print('rho = %d/%d, f = Q^%d conj(Q)^%d (%d Wick terms, degree %d): all %d controls ok' % (rn, rd, a, a - 1, len(f), max(sum(k) for k in f), len(cols)), flush=True)
print('%d exact pairings vanish; in %d of them the rho-free part and the rho part are separately nonzero; controls with at least one such nontrivial test: %d of %d' % (
    total, nontrivial, sum(1 for x in tested if x), len(cols)))
print('done in %.1f s' % (time.time() - t0))
