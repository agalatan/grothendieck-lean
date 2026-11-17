#!/usr/bin/env python3
"""Floating-point orientation (N) for PROOF_BATH.md; nothing here is a proof step.

claude-b9ee, 17 Nov 2026.
  1. J(p, q) on the triangle (composite Gauss-Legendre): the maximum, and the deficit near the corner against the
     second-order term sqrt(2/pi)(15/4 p^2 + 3/2 pq + 1/4 q^2) = sqrt(2/pi) kappa_4(F)/24;
  2. Monte Carlo spot checks of J (independent of the quadrature and of the Arb integrand of certify_caseB.py);
  3. the corner bound (Section 6 of PROOF_BATH.md) piece by piece against the truth, and the quantity
     E_{p,q} = E[H^4/(sqrt(v)(2v + pH^2))] against what the quartic route needs, 12 alpha(p) - 1.2 q^2/p^2;
  4. Gemini's Case B: its Cauchy-Schwarz lower bound for E_{p,q} (with exact constants) against 12 alpha(p);
  5. Case C: the tail saving s(p)/p^2 against alpha(p).
usage: python3 -I numerics.py > numerics.log   (numpy, scipy; under a minute)
"""
import numpy as np
from scipy.special import erf
from numpy.polynomial.legendre import leggauss

S = np.sqrt(2 / np.pi)
g, gw = leggauss(40)
edges = np.concatenate([np.linspace(-14, -1, 261), np.linspace(-1, 1, 41)[1:], np.linspace(1, 14, 261)[1:]])
x = np.concatenate([(b - a) / 2 * g + (a + b) / 2 for a, b in zip(edges[:-1], edges[1:])])
wq = np.concatenate([(b - a) / 2 * gw for a, b in zip(edges[:-1], edges[1:])]) * np.exp(-x * x / 2) / np.sqrt(2 * np.pi)
H = (x ** 3 - 3 * x) / np.sqrt(6)


def Psi(mu, v):
    v = np.maximum(v, 1e-300)
    s = np.sqrt(v)
    return S * s * np.exp(-mu * mu / (2 * v)) + mu * erf(mu / (np.sqrt(2) * s))


def J(p, q):
    return float(wq @ Psi(np.sqrt(p) * H, q * x * x + 1 - p - q))


def alpha(p):
    return 1 / (2 * np.sqrt(1 - p) * (2 - p + 2 * np.sqrt(1 - p)))


print('quadrature check: sum of weights %.15f, E H^2 = %.12f, E H^4 = %.10f (93)' % (wq.sum(), wq @ H ** 2, wq @ H ** 4))

print('\n== 1. J on the triangle ==')
best, n = (-1, None), 120
for i in range(n + 1):
    for j in range(n + 1 - i):
        p, q = i / n, j / n
        val = J(p, q)
        if val > best[0]:
            best = (val, (p, q))
print('grid of %d points (step 1/%d): max J = %.12f at %s; sqrt(2/pi) = %.12f' % ((n + 1) * (n + 2) // 2, n, best[0], best[1], S))
worst = (9, None)
for p in np.linspace(0, 0.05, 51):
    for q in np.linspace(0, 0.05, 51):
        if p + q == 0:
            continue
        d = S - J(p, q)
        quad = S * (15 / 4 * p * p + 1.5 * p * q + 0.25 * q * q)
        worst = min(worst, (d / quad, (round(p, 4), round(q, 4))))
print('near the corner (p, q in [0, 0.05]): min of deficit / [sqrt(2/pi)(15/4 p^2 + 3/2 pq + 1/4 q^2)] = %.4f at %s (positive: no violation)' % worst)
for p, q in [(1e-3, 0), (0, 1e-3), (1e-3, 1e-3), (1e-2, 0), (0, 1e-2)]:
    d = S - J(p, q); quad = S * (15 / 4 * p * p + 1.5 * p * q + 0.25 * q * q)
    print('   (p, q) = (%g, %g): deficit = %.4e, second-order term = %.4e, ratio %.4f' % (p, q, d, quad, d / quad))
print('deficit along q = 0 divided by sqrt(2/pi) p^2 (tends to 15/4 = 3.75 as p -> 0; the third-order coefficient is large):')
print('   ' + ', '.join('p=%g: %.3f' % (p, (S - J(p, 0)) / (S * p * p)) for p in [0.001, 0.003, 0.01, 0.03, 0.1, 1 / 9, 0.2, 1 / 3]))

print('\n== 2. Monte Carlo spot checks (4e6 samples each, independent of the quadrature) ==')
rng = np.random.default_rng(20261117)
X, Y, Z = rng.standard_normal((3, 4_000_000))
for p, q in [(1 / 9, 0), (0.15, 0.05), (0.2, 0.08), (0.3, 0.02), (0.05, 0.1)]:
    F = np.sqrt(p / 6) * (X ** 3 - 3 * X) + np.sqrt(q) * X * Y + np.sqrt(1 - p - q) * Z
    a = np.abs(F)
    print('   (p, q) = (%.4f, %.4f): quadrature J = %.6f, Monte Carlo %.6f +- %.6f, sqrt(2/pi) - J = %.5f' % (p, q, J(p, q), a.mean(), a.std() / 2000, S - J(p, q)))
for p, q in [(1 / 9, 0), (0.15, 0.05), (0.2, 0.08), (0.3, 0.02)]:
    print('   compare with certify_caseB.log sanity lines: J(%.4f, %.4f) = %.12f' % (p, q, J(p, q)))
print('   (the five Monte Carlo values above share one sample, so their errors are correlated; 20 fresh seeds:)')
pts = [(1 / 9, 0.0), (0.05, 0.1), (0.2, 0.08)]
acc = {pt: [] for pt in pts}
for seed in range(1, 21):
    rng = np.random.default_rng(1000 + seed)
    X, Y, Z = rng.standard_normal((3, 4_000_000))
    for p, q in pts:
        acc[(p, q)].append(np.abs(np.sqrt(p / 6) * (X ** 3 - 3 * X) + np.sqrt(q) * X * Y + np.sqrt(1 - p - q) * Z).mean())
for p, q in pts:
    a = np.array(acc[(p, q)]); se = a.std(ddof=1) / np.sqrt(len(a))
    print('   (p, q) = (%.4f, %.4f): Monte Carlo over 8e7 samples %.6f +- %.6f, quadrature %.6f, z = %.2f' % (p, q, a.mean(), se, J(p, q), (a.mean() - J(p, q)) / se))

print('\n== 3. the corner bound of Section 6 against the truth ==')
print('    p       q       J/S-1       [A]-bound    [B]-bound    E_pq    need=12a-1.2q2/p2   E-need')
rows = []
for p in [0.01, 0.05, 0.1, 1 / 9, 0.13, 0.15, 0.17, 0.2, 0.25, 0.28, 0.3, 0.32, 1 / 3 - 1e-9]:
    for frac in [0, 0.25, 0.5, 0.75, 0.999]:
        q = frac * (1 - 3 * p) / 5
        v = q * x * x + 1 - p - q
        A = float(wq @ np.sqrt(v)); B = float(wq @ (p * H ** 2 / (2 * np.sqrt(v))))
        E = float(wq @ (H ** 4 / (np.sqrt(v) * (2 * v + p * H ** 2))))
        need = 12 * alpha(p) - 1.2 * q * q / (p * p)
        rows.append((E - need, p, q))
        print('  %.4f  %.4f  % .4e  % .2e   % .2e   %7.4f   %8.4f        %7.4f' % (p, q, J(p, q) / S - 1, A - (np.sqrt(1 - p) - q * q / 10), B - p / (2 * np.sqrt(1 - p)), E, need, E - need))
print('smallest E - need over these points: %.4f at (p, q) = (%.4f, %.4f): the quartic route of Section 6 is sound on the whole corner,' % min(rows))
print('but its margin near 3p + 5q = 1, p ~ 0.3 is under 2%; Case B is certified directly on J instead (Section 8).')

print('\n== 4. Gemini Case B (line 2917): Cauchy-Schwarz lower bound for E_pq with exact constants ==')
from math import sqrt, exp, pi
cs_exact = 24 * sqrt(15) * exp(-1.5) / (9 * sqrt(pi)) * 4356 * 9 / 44368
print('   bound = (24 sqrt15 e^{-3/2}/(9 sqrt pi)) * 4356/(44368/9) = %.5f; Gemini states > 18392/8319 = %.5f' % (cs_exact, 18392 / 8319))
print('   needed: 12 alpha(p) up to 12 alpha(1/5) = %.5f; true min of E_pq on Case B ~ %.4f (at p = 1/5, q = 2/25)'
      % (12 * alpha(0.2), float(wq @ (H ** 4 / (np.sqrt(0.08 * x * x + 0.72) * (2 * (0.08 * x * x + 0.72) + 0.2 * H ** 2))))))
cs_A = 8 * sqrt(15) * exp(-1.5) / (9 * sqrt(pi)) * 39204 / 9338
print('   (Case A, line 2915, same method: bound = %.5f > 12/7 = %.5f: correct)' % (cs_A, 12 / 7))

print('\n== 5. Case C (line 2918-2921): tail saving s(p)/p^2 against alpha(p) ==')
Ac, Bc = 85 / (3 * sqrt(2 * pi)), 4 * sqrt(6) / 3
for p in [0.2, 0.25, 0.3, 1 / 3]:
    s = exp(-4.5) * (Ac * p - Bc * sqrt(p))
    print('   p = %.4f: s(p)/p^2 = %.5f, alpha(p) = %.5f, margin %.5f' % (p, s / p ** 2, alpha(p), s / p ** 2 - alpha(p)))
print('   Gemini writes the bound at p = 1/3 as 3 e^{-9/2}(85/sqrt(2pi) - 12 sqrt2) = %.5f > 49/92 = %.5f > 1/5;'
      % (3 * exp(-4.5) * (85 / sqrt(2 * pi) - 12 * sqrt(2)), 49 / 92))
print('   the correct value is e^{-9/2}(85/sqrt(2pi) - 12 sqrt2) = %.5f (< 1/5), and its rational bound 49/276 = %.5f < alpha(1/3)'
      % (exp(-4.5) * (85 / sqrt(2 * pi) - 12 * sqrt(2)), 49 / 276))
