#!/usr/bin/env python3
"""Rigorous external certificate: |phi| < 1 everywhere for the phase of the upper certificate.

phi = D exp(-eps(U+V)) S(U,V,W), U=|z|^2, V=|w|^2, W=Re(conj(z) w), D=Im(conj(z) w), D^2 = UV - W^2,
eps = 21/20, S from phase_damped_m4_d36_eps1p05.json (1140 monomials, exact rationals).

Box region (U+V < 60): bisection of [0,64]^2 x [-32,32] in integer units 2^-SC (SC=16).  Per box with centre
c and half-widths r (exact integers), with y = 2^SC (x - c), |y_i| <= r_i:
  * S(c+h) = (1/(L 2^{17 SC})) sum_a B_a y^a, B = exact integer Taylor shift of the scaled array A0;
  * e^{-eps hs} = 1 - eps hs + R1, 0 <= R1 <= (eps rs)^2/2 e^{eps rs}  (hs = hU+hV, rs = rU+rV);
  * P1 = S (1 - eps hs) exactly (integer array), so |e^{-eps hs} S| <= |P1|_r + |S|_r R1 with
    |P|_r = sum_a |P_a| r^a;
  * UV - W^2 <= min(Uh Vh - minW^2, Mc + Vc rU + Uc rV + 2|Wc| rW + rU rV)   (exact rationals);
  * phi^2 <= Mmax e^{-2 eps (Uc+Vc)} g^2  evaluated in arb (python-flint), upper endpoint <= TARGET.
Far field U+V >= 60: |phi| <= (s/2) e^{-eps s} sum |c| s^{i+j} (s/2)^k  with every s^n e^{-eps s} (n <= 18)
decreasing for s >= 60 >= n/eps, so |phi| <= value at s = 60 (arb).
Empty boxes: minW^2 > Uh Vh.
Usage: phi_cover_exact.py PHASE_JSON TARGET [NPROC]   -> prints counts, max leaf bound, far-field bound.
"""
import json, math, sys, time
from fractions import Fraction as Q
from multiprocessing import Pool
from flint import arb, ctx
ctx.prec = 128
SC = 16; DEG = 17; FAR = 60; ONE = 1 << SC
d = json.load(open(sys.argv[1])); TARGET = Q(sys.argv[2]); NPROC = int(sys.argv[3]) if len(sys.argv) > 3 else 8
EPS = Q(d['epsilon']); assert EPS == Q(21, 20)
terms = [(tuple(t['powers']), Q(t['coefficient'])) for t in d['monomial_coefficients']]
L = 1
for _, c in terms: L = L * c.denominator // math.gcd(L, c.denominator)
A0 = {}
for (i, j, k), c in terms:
    n = c * L; assert n.denominator == 1 and i + j + k <= DEG
    A0[(i, j, k)] = A0.get((i, j, k), 0) + int(n) * (1 << (SC * (DEG - i - j - k)))
SCALE = arb(L) * arb(2) ** (DEG * SC)

def shift(P, axis, m):
    out = {}; lines = {}
    for e, c in P.items():
        lines.setdefault(e[:axis] + e[axis + 1:], {})[e[axis]] = c
    for key, line in lines.items():
        acc = []
        for i in range(max(line), -1, -1):
            new = [0] * (len(acc) + 1)
            for t, a in enumerate(acc):
                new[t] += a * m; new[t + 1] += a
            new[0] += line.get(i, 0); acc = new
        for t, a in enumerate(acc):
            if a: e = key[:axis] + (t,) + key[axis:]; out[e] = out.get(e, 0) + a
    return out

def absr(P, r):
    return sum(abs(c) * r[0] ** e[0] * r[1] ** e[1] * r[2] ** e[2] for e, c in P.items())

def leaf_bound(box):
    Ul, Uh, Vl, Vh, Wl, Wh = box
    m = ((Ul + Uh) // 2, (Vl + Vh) // 2, (Wl + Wh) // 2)
    r = ((Uh - Ul) // 2, (Vh - Vl) // 2, (Wh - Wl) // 2)
    B = shift(shift(shift(A0, 0, m[0]), 1, m[1]), 2, m[2])
    # 20*2^SC * P1 = 20*2^SC*B - 21*(B shifted in U + B shifted in V)
    P1 = {e: 20 * ONE * c for e, c in B.items()}
    for (i, j, k), c in B.items():
        for e in ((i + 1, j, k), (i, j + 1, k)):
            P1[e] = P1.get(e, 0) - 21 * c
    aP1 = arb(absr(P1, r)) / (20 * ONE)
    aS = arb(absr(B, r))
    rs = arb(r[0] + r[1]) / ONE
    R1 = (arb(21) / 20 * rs) ** 2 / 2 * (arb(21) / 20 * rs).exp()
    g = (aP1 + aS * R1) / SCALE
    w2lo = 0 if Wl <= 0 <= Wh else min(Wl * Wl, Wh * Wh)
    c = [Q(x, ONE) for x in m]; rr = [Q(x, ONE) for x in r]
    M1 = Q(Uh * Vh - w2lo, ONE * ONE)
    M2 = c[0] * c[1] - c[2] ** 2 + c[1] * rr[0] + c[0] * rr[1] + 2 * abs(c[2]) * rr[2] + rr[0] * rr[1]
    Mmax = max(Q(0), min(M1, M2))
    Mq = arb(Mmax.numerator) / Mmax.denominator
    E = (-(arb(21) / 10) * (arb(c[0].numerator) / c[0].denominator + arb(c[1].numerator) / c[1].denominator)).exp()
    return Mq * E * g * g

def run(box, depth_cap=60):
    stack = [box]; ev = 0; leaves = 0; mx = arb(0); tree = []
    tgt = arb(TARGET.numerator) / TARGET.denominator
    while stack:
        b = stack.pop()
        Ul, Uh, Vl, Vh, Wl, Wh = b
        if Ul + Vl >= FAR * ONE: leaves += 1; continue
        w2lo = 0 if Wl <= 0 <= Wh else min(Wl * Wl, Wh * Wh)
        if w2lo > Uh * Vh: leaves += 1; continue
        ev += 1
        v = leaf_bound(b)
        if v < tgt:
            leaves += 1
            if v.upper() > mx.upper(): mx = v
            continue
        w = [Uh - Ul, Vh - Vl, Wh - Wl]; ax = max(range(3), key=lambda i: w[i])
        lo, hi = b[2 * ax], b[2 * ax + 1]; assert hi - lo >= 2
        mid = (lo + hi) // 2
        b1 = list(b); b1[2 * ax + 1] = mid; b2 = list(b); b2[2 * ax] = mid
        stack += [tuple(b2), tuple(b1)]
    return ev, leaves, float(mx.upper())

def split(box, k):
    out = [box]
    for _ in range(k):
        nxt = []
        for b in out:
            w = [b[1] - b[0], b[3] - b[2], b[5] - b[4]]; ax = max(range(3), key=lambda i: w[i])
            mid = (b[2 * ax] + b[2 * ax + 1]) // 2
            b1 = list(b); b1[2 * ax + 1] = mid; b2 = list(b); b2[2 * ax] = mid
            nxt += [tuple(b1), tuple(b2)]
        out = nxt
    return out

def far():
    s = arb(60); tot = arb(0)
    for (i, j, k), c in terms:
        tot += arb(abs(c.numerator)) / abs(c.denominator) * s ** (i + j) * (s / 2) ** k
    return (s / 2) * (-(arb(21) / 20) * s).exp() * tot

if __name__ == '__main__':
    t0 = time.time()
    root = (0, 64 * ONE, 0, 64 * ONE, -32 * ONE, 32 * ONE)
    subs = split(root, 6)
    with Pool(NPROC) as p:
        res = p.map(run, subs, chunksize=1)
    ev = sum(x[0] for x in res); lv = sum(x[1] for x in res); mx = max(x[2] for x in res)
    fb = far()
    print(f"target phi^2 < {TARGET} : evaluated boxes {ev}, leaves {lv} (+ split prefix {len(subs)} subroots)")
    print(f"max leaf upper bound on phi^2: {mx:.12f}  => |phi| < {math.sqrt(mx):.9f} on U+V<60")
    print(f"far field U+V>=60: |phi| <= {float(fb.upper()):.6e}")
    print(f"seconds {time.time() - t0:.1f}")
