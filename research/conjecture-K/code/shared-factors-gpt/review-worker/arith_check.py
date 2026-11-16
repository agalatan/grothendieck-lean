#!/usr/bin/env python3
# Reviewer (exact fractions; the last block N): the rational claims of the shared-factors package.
from fractions import Fraction as F
import math
# (3) radius transfer: the t = 0 constraint of higher-degree 4.12 is  lambda_1 rho*^2 <= 500/701
rho = F(9359, 10000); tgt = F(500, 701)
cap = tgt / rho ** 2
assert cap == F(50_000_000_000, 61_401_207_581), cap
room = tgt - F(81, 100) * rho ** 2
assert room == F(26502185939, 7010000000000) and room > 0
print('radius: (500/701)/0.9359^2 = %s = %.8f;  room at 81/100: %s = %.10f;  with the old radius 0.9513293: cap %.5f' % (cap, float(cap), room, float(room), float(tgt) / 0.9513293 ** 2))
print('        81/100 <= cap: %s;  82/100 <= cap: %s' % (F(81, 100) <= cap, F(82, 100) <= cap))
# section 2: Hermitian basis
th = lambda d: F(1, 3) * (1 + F(2 * (1 + 7 * d), d * d * (1 + 2 * d) + d))
assert th(8) == F(605, 1644) and th(8) < F(37, 100) and th(7) > F(37, 100)
assert all(th(d) < F(37, 100) for d in range(8, 2000)) and all(th(d + 1) < th(d) for d in range(1, 2000))
p = lambda x: 22 * x ** 3 + 11 * x * x - 1389 * x - 200
assert all((th(d) < F(37, 100)) == (p(d) > 0) for d in range(1, 200))
print('basis family: theta(d) = (1/3)(1 + 2(1+7d)/(d^2(1+2d)+d));  theta(8) = %s = %.6f < 0.37 < theta(7) = %.6f;  decreasing;  theta(d) < 7/20 from d = %d;  limit 1/3' % (
    th(8), float(th(8)), float(th(7)), next(d for d in range(1, 999) if th(d) < F(7, 20))))
print('        its fourth excess chi(d) = 4(d^2(1+2d)+d)/d^4: chi(8) = %.4f, chi(12) = %.4f' % (4 * (64 * 17 + 8) / 8 ** 4, 4 * (144 * 25 + 12) / 12 ** 4))
# section 2: rank-one factors
t2 = lambda n: F(1, 3) * (F(23, 50) + (5 - F(23, 50)) / n)
assert t2(7) == F(194, 525) and t2(8) == F(137, 400) and t2(7) < F(37, 100) < t2(6) and t2(8) < F(7, 20)
assert t2(1) == F(5, 3)
print('rank-one family: (23/50 + (227/50)/n)/3: n = 1: %s, n = 6: %.5f, n = 7: %s = %.5f, n = 8: %s = %.5f, limit 23/150 = %.4f' % (t2(1), float(t2(6)), t2(7), float(t2(7)), t2(8), float(t2(8)), 23 / 150))
e_up = sum(F(1, math.factorial(k)) for k in range(6)) + F(7, 4320)
assert e_up < F(68, 25) and F(68, 25) ** 2 < F(200, 27)
print('        e < %s = %.7f < 68/25, so 1 - 4/e^2 < 23/50 (true value %.6f)' % (e_up, float(e_up), 1 - 4 / math.e ** 2))
# constants of Theorem 2 and Corollary 3
c = 0.25 * (68 + 8 * math.sqrt(30)) * (3 / 8) ** 1.5
assert F(30) < F(11, 2) ** 2 and F(3, 8) < F(49, 80) ** 2 and 28 * F(3, 8) * F(49, 80) < F(13, 2)
print('Theorem 2: 2 * 8 * 27^2 (sqrt60 + 2 sqrt2)^2 /36^3 * (3/8)^1.5 = %.6f < 13/2;  Corollary 3: 2 (4/3)^2 324^2 /36^3 (3/8)^1.5 = %.6f = 3 sqrt6/4 = %.6f' % (
    2 * 8 * 27 ** 2 * (math.sqrt(60) + 2 * math.sqrt(2)) ** 2 / 36 ** 3 * (3 / 8) ** 1.5, 2 * (4 / 3) ** 2 * 324 ** 2 / 36 ** 3 * (3 / 8) ** 1.5, 3 * math.sqrt(6) / 4))
assert abs(c - 2 * 8 * 27 ** 2 * (math.sqrt(60) + 2 * math.sqrt(2)) ** 2 / 36 ** 3 * (3 / 8) ** 1.5) < 1e-12
# N: the exact scalars of section 2 at m = 1 (alpha^2 = J_1, J_w), and what they would give
import numpy as np
from numpy.polynomial.legendre import leggauss
x, w = leggauss(200)
def integ(f, a, b): return float(((b - a) / 2 * w) @ f((a + b) / 2 + (b - a) / 2 * x))
dens = lambda b: np.exp(-1 - b) + np.where(b < 1, np.exp(-1 + b), 0.0)          # density of |p|, p = T - 1
g = lambda b: (np.exp(-1 - b) - np.where(b < 1, np.exp(-1 + b), 0.0)) / dens(b)
al2 = integ(lambda b: g(b) ** 2 * dens(b), 0, 1) + integ(lambda b: g(b) ** 2 * dens(b), 1, 60)
Jw = integ(lambda b: (b * b + 1) ** 2 * g(b) ** 2 * dens(b), 0, 1) + integ(lambda b: (b * b + 1) ** 2 * g(b) ** 2 * dens(b), 1, 80)
tex = lambda n: (al2 + ((Jw + 28) / 8 - al2) / n) / 3
print('section 2 at m = 1 with the exact scalars (N): alpha^2 = %.6f (used: 23/50), J_w = %.5f (used: 12): bound %.4f, %.4f, %.4f, %.4f at n = 5, 6, 7, 8; first n below 0.37: %d' % (
    al2, Jw, tex(5), tex(6), tex(7), tex(8), next(n for n in range(1, 99) if tex(n) < 0.37)))
