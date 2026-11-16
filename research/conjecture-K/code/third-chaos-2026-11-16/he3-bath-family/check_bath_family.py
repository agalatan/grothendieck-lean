#!/usr/bin/env python3
"""Checks of the bound E|a He3(X) + b XY + c Z| <= (5/(2 sqrt(3 pi))) ||F||_2 (claude-b9ee, 16-17 Nov 2026).

The proof (PROOF_as_pasted.md) is analytic; nothing here is part of it.  This script checks its steps:
  1. the lemma E|mu + sigma W| <= sqrt(mu^2 + (2/pi) sigma^2), i.e. D(y) = y^2 + 2/pi - Psi(y,1)^2 >= 0, in 60-digit
     arithmetic on a grid, and the Gaussian tail bound used in its proof;
  2. the three vertex values of the affine majorant L, in exact rational arithmetic, and the bounds 25/8 < pi < 7/2;
  3. J(p, q) = E|F| against L(p, q) on a grid of the parameter triangle, by composite Gauss-Legendre quadrature;
  4. J by Monte Carlo at four interior points;
  5. the weight that balances L(1,0) = L(0,0) (the remark of the proof).
Labels: 2 is exact (C); 1, 3, 4, 5 are floating point (N).
usage: python3 check_bath_family.py      (numpy, scipy, mpmath; about a minute)
"""
from fractions import Fraction as Fr
import numpy as np
import mpmath as mp
from scipy.special import erf
from numpy.polynomial.legendre import leggauss

# 1. the lemma and the tail bound
mp.mp.dps = 60
Psi1 = lambda y: mp.sqrt(2 / mp.pi) * mp.exp(-y * y / 2) + y * mp.erf(y / mp.sqrt(2))
ys = [mp.mpf(k) / 1000 for k in range(0, 12001)] + [mp.mpf(10) ** e for e in range(-30, -3)] + [mp.mpf(k) for k in range(13, 60)]
D = [(y * y + 2 / mp.pi - Psi1(y) ** 2, y) for y in ys]
tail = [mp.sqrt(mp.pi / 2) * mp.erfc(y / mp.sqrt(2)) - 2 / (mp.sqrt(y * y + 4) + y) * mp.exp(-y * y / 2) for y in ys]
print('1. lemma: min D(y) over %d points = %s at y = %s; min D(y)/y^2 (y > 0) = %s; tail bound violated at %d points'
      % (len(ys), mp.nstr(min(D)[0], 5), mp.nstr(min(D)[1], 5), mp.nstr(min(d / (y * y) for d, y in D if y > 0), 8),
         sum(1 for v in tail if v <= 0)))

# 2. exact vertex arithmetic (L in units of 5/(4 sqrt(3 pi)): the weight part is 1, the R part as below)
s = Fr(32, 25)
c10 = Fr(1, 12) * (15 / s ** 3 - 18 / s ** 2 + 9 / s)
print('2. vertex (1,0): R part = (%s)*pi; with pi < 7/2 it is < %s %s 1' % (c10, c10 * Fr(7, 2), '<' if c10 * Fr(7, 2) < 1 else '>='))
print('   vertex (0,1): R part = 1/s = %s, so L(0,1) = %s * L(0,0)' % (1 / s, (1 + 1 / s) / 2))
pif = mp.mpf(mp.pi)
print('   pi in (25/8, 7/2): %s; so 25/(12 pi) < 25/(12*25/8) = %s < 17/25 = %s (strict because pi > 25/8)'
      % (mp.mpf(25) / 8 < pif < mp.mpf(7) / 2, Fr(25) / (12 * Fr(25, 8)), Fr(17, 25)))
L00 = 5 / (2 * mp.sqrt(3 * mp.pi))
print('   L(0,0) = %s, L(1,0) = %s, sqrt(2/3) = %s, sqrt(17/25) = %s' % (mp.nstr(L00, 12), mp.nstr((1 + c10.numerator * mp.pi / c10.denominator) * L00 / 2, 12),
                                                                 mp.nstr(mp.sqrt(mp.mpf(2) / 3), 12), mp.nstr(mp.sqrt(mp.mpf(17) / 25), 12)))

# 3. J against L on the triangle
g, gw = leggauss(24)
edges = np.linspace(-12, 12, 481)
x = np.concatenate([(b - a) / 2 * g + (a + b) / 2 for a, b in zip(edges[:-1], edges[1:])])
w = np.concatenate([(b - a) / 2 * gw for a, b in zip(edges[:-1], edges[1:])]) * np.exp(-x * x / 2) / np.sqrt(2 * np.pi)


def J(p, q):
    mu = np.sqrt(p / 6) * (x ** 3 - 3 * x); v = np.maximum(q * x * x + 1 - p - q, 0.0)
    pos = v > 1e-300; vv = np.where(pos, v, 1.0); sv = np.sqrt(vv)
    return float(w @ np.where(pos, np.sqrt(2 / np.pi) * sv * np.exp(-mu * mu / (2 * vv)) + mu * erf(mu / (np.sqrt(2) * sv)), np.abs(mu)))


lam, cw = 7 / 25, np.sqrt(3 / (2 * np.pi))


def L(p, q):
    R = p * (x ** 3 - 3 * x) ** 2 / 6 + (2 / np.pi) * (q * x * x + 1 - p - q); W = cw * np.exp(lam * x * x / 2)
    return float(w @ (W / 2 + R / (2 * W)))


print('3. quadrature: sum of weights %.15f, E X^6 = %.12f' % (w.sum(), w @ x ** 6))
worst = (-9, None); best = (0, None); n = 100
for i in range(n + 1):
    for j in range(n + 1 - i):
        p, q = i / n, j / n; a, b = J(p, q), L(p, q)
        worst = max(worst, (a - b, (p, q))); best = max(best, (a, (p, q)))
print('   %d points of the triangle: largest J - L = %.5f at %s; largest J = %.6f at %s (sqrt(2/pi) = %.6f)'
      % ((n + 1) * (n + 2) // 2, worst[0], worst[1], best[0], best[1], np.sqrt(2 / np.pi)))
print('   J(1,0) = %.6f, closed form (1 + 4e^{-3/2})/sqrt(3 pi) = %.6f; J(0,1) = %.6f, 2/pi = %.6f'
      % (J(1, 0), (1 + 4 * np.exp(-1.5)) / np.sqrt(3 * np.pi), J(0, 1), 2 / np.pi))

# 4. Monte Carlo
rng = np.random.default_rng(7); X, Y, Z = rng.standard_normal((3, 4_000_000))
for p, q in [(0.3, 0.3), (0.6, 0.1), (0.1, 0.8), (0.05, 0.05)]:
    F = np.sqrt(p / 6) * (X ** 3 - 3 * X) + np.sqrt(q) * X * Y + np.sqrt(1 - p - q) * Z
    print('4. (p, q) = (%.2f, %.2f): quadrature %.5f, Monte Carlo %.5f +- %.5f, majorant %.5f'
          % (p, q, J(p, q), np.abs(F).mean(), np.abs(F).std() / 2000, L(p, q)))

# 5. the balancing weight
mp.mp.dps = 30


def Lv(lmb, vertex):
    c = mp.sqrt((2 / mp.pi) * mp.sqrt((1 - lmb) / (1 + lmb))); sp = 1 + lmb
    base = c / (2 * mp.sqrt(1 - lmb))
    if vertex == '00': return base + (1 / (mp.pi * c)) / mp.sqrt(sp)
    if vertex == '01': return base + (1 / (mp.pi * c)) / sp ** mp.mpf('1.5')
    return base + (15 / sp ** 3 - 18 / sp ** 2 + 9 / sp) / (12 * c * mp.sqrt(sp))


lb = mp.findroot(lambda l: Lv(l, '10') - Lv(l, '00'), 0.18)
print('5. L(1,0) = L(0,0) at lambda = %s, where the bound is %s (L(0,1) = %s)' % (mp.nstr(lb, 8), mp.nstr(Lv(lb, '00'), 8), mp.nstr(Lv(lb, '01'), 8)))
