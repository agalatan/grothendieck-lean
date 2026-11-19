#!/usr/bin/env python3
"""Floating-point orientation (N) for PROOF_HARMONIC.md; nothing here is a proof step.  claude-b9ee, 17 Nov 2026.
  1. H1: the ratio (1/2pi)int|g| / ((1/2pi)int g^2)^{1/2} on the two-parameter family g = cos t cos a + sin t cos(3a + psi);
  2. H2: the radial factor kappa_n, and Monte Carlo of E|H|/(sqrt(2/pi)||H||) for random harmonic cubics and e_3;
  3. H3: random third-chaos cubics in n = 5: the maximising direction, (a, b, c), the bound of (H3) against E|P|;
  4. H4: E|P_N|/sqrt(2/pi) for the normalised e_3 against the bounds of (H2) and (H3).
usage: python3 -I numerics_harmonic.py > numerics_harmonic.log   (numpy, scipy; a few minutes)
"""
import numpy as np
from math import gamma, sqrt, pi, comb, atan
from scipy.optimize import minimize

S = sqrt(2 / pi)
c3 = 4 * sqrt(5) / (3 * pi)
rng = np.random.default_rng(20261117)

print('== 1. H1 landscape ==')
K = 20000
a = (np.arange(K) + 0.5) * 2 * np.pi / K                    # midpoint rule; |g| has kinks, error O(K^-2) ~ 1e-9
ca, c3a, s3a = np.cos(a), np.cos(3 * a), np.sin(3 * a)
best, worst = (0, None), (9, None)
for t in np.linspace(0, np.pi / 2, 181):
    for psi in np.linspace(0, np.pi, 91):
        g = np.cos(t) * ca + np.sin(t) * (np.cos(psi) * c3a - np.sin(psi) * s3a)
        r = np.abs(g).mean() / np.sqrt((g * g).mean())
        best = max(best, (r, (t, psi)))
        worst = min(worst, (r, (t, psi)))
print('grid 181 x 91 over t in [0, pi/2], psi in [0, pi]: max %.7f at (t, psi) = (%.4f, %.4f); min %.7f at (%.4f, %.4f)'
      % (best[0], *best[1], worst[0], *worst[1]))
print('4 sqrt5/(3 pi) = %.7f attained at t = atan(1/3) = %.4f, psi = pi (g = cos a - cos(3a)/3 normalised); pure harmonics: 2 sqrt2/pi = %.7f'
      % (c3, atan(1 / 3), 2 * sqrt(2) / pi))

print('\n== 2. H2: radial factor and harmonic cubics ==')
for n in range(2, 16):
    kap = 2 ** 1.5 * gamma((n + 3) / 2) / gamma(n / 2) / sqrt(n * (n + 2) * (n + 4))
    print('   n = %2d: kappa_n = %.6f, kappa_n c_3 = %.6f (%s sqrt(2/pi) = %.6f)' % (n, kap, kap * c3, '<' if kap * c3 < S else '>', S))


def harmonic_tensor(n):
    T = rng.standard_normal((n, n, n))
    T = (T + T.transpose(0, 2, 1) + T.transpose(1, 0, 2) + T.transpose(1, 2, 0) + T.transpose(2, 0, 1) + T.transpose(2, 1, 0)) / 6
    v = np.einsum('iik->k', T)
    D = np.zeros_like(T)
    for i in range(n):
        D[i, i, :] += v; D[i, :, i] += v; D[:, i, i] += v
    T = T - D / (n + 2)                      # trace-free: sum_i T_iik = 0, so H(x) = T(x, x, x) is harmonic
    assert np.abs(np.einsum('iik->k', T)).max() < 1e-12
    return T


def cubic_values(T, X, block=100_000):
    n = T.shape[0]
    out = np.empty(X.shape[0])
    for i in range(0, X.shape[0], block):
        Xb = X[i:i + block]
        U = (Xb @ T.reshape(n, n * n)).reshape(-1, n, n)          # U[m] = T(x_m, ., .)
        out[i:i + block] = np.einsum('mij,mi,mj->m', U, Xb, Xb)
    return out


M = 1_000_000
for n in (8, 11, 12):
    vals = []
    for rep in range(5):
        T = harmonic_tensor(n)
        X = rng.standard_normal((M, n))
        H = cubic_values(T, X)
        vals.append(np.abs(H).mean() / sqrt(6 * (T * T).sum()) / S)
    kap = 2 ** 1.5 * gamma((n + 3) / 2) / gamma(n / 2) / sqrt(n * (n + 2) * (n + 4))
    print('   n = %2d: five random harmonic cubics, E|H|/(sqrt(2/pi)||H||) = %s (Monte Carlo, %d samples); the bound kappa_n c_3/sqrt(2/pi) = %.4f'
          % (n, ', '.join('%.4f' % v for v in vals), M, kap * c3 / S))

print('\n== 3. H3: random cubics in n = 5 (third chaos, Wick form T:x x x:) ==')
A_, B_, C_ = 34925 / 131072, 25 / 64, 0.5
n = 5
for rep in range(4):
    T = rng.standard_normal((n, n, n))
    T = (T + T.transpose(0, 2, 1) + T.transpose(1, 0, 2) + T.transpose(1, 2, 0) + T.transpose(2, 0, 1) + T.transpose(2, 1, 0)) / 6
    T /= sqrt(6 * (T * T).sum())             # ||P||_2 = 1 for P = I_3(T)
    f = lambda v: -np.einsum('ijk,i,j,k->', T, v, v, v) / np.dot(v, v) ** 1.5
    vstar = min((minimize(f, rng.standard_normal(n)) for _ in range(30)), key=lambda r: r.fun).x
    vstar /= np.linalg.norm(vstar)
    a_ = sqrt(6) * np.einsum('ijk,i,j,k->', T, vstar, vstar, vstar)          # E[h3(<v,Z>) P] = sqrt6 T(v,v,v)
    grad = np.einsum('ijk,j,k->i', T, vstar, vstar)
    Lres = np.linalg.norm(grad - np.dot(grad, vstar) * vstar)                # T(v*,v*,w) for w orthogonal to v*
    Bm = np.einsum('ijk,i->jk', T, vstar)
    Pp = np.eye(n) - np.outer(vstar, vstar)
    Bp = Pp @ Bm @ Pp
    b_ = sqrt(6 * 3 * (Bp * Bp).sum())                                        # ||W1 Q2|| with Q2 = 3 sum B'_jk :Y_j Y_k:
    c_ = sqrt(max(0.0, 1 - a_ ** 2 - b_ ** 2))
    X = rng.standard_normal((2_000_000, n))
    # P = I_3(T) = sum T_ijk (x_i x_j x_k - 3 delta_ij x_k)
    P = cubic_values(T, X) - 3 * X @ np.einsum('iik->k', T)
    bound = 5 / (4 * sqrt(6)) * (1 + pi * (A_ * a_ ** 2 + B_ * b_ ** 2 + C_ * c_ ** 2))
    xs = rng.standard_normal(4_000_000)
    mid = np.sqrt(a_ ** 2 * (xs ** 3 - 3 * xs) ** 2 / 6 + b_ ** 2 * xs ** 2 + c_ ** 2).mean() / S
    print('   rep %d: a = %.4f, b = %.4f, c = %.4f, |T(v*,v*,.) tangential| = %.1e; E|P|/S = %.4f <= E sqrt(a^2h3^2+b^2X^2+c^2)/S = %.4f <= bound %.4f; criterion %s'
          % (rep, a_, b_, c_, Lres, np.abs(P).mean() / S, mid, bound, 'holds' if bound < 1 else 'fails'))

print('\n== 4. H4: the complete cubics P_N = C(N,3)^{-1/2} e_3 ==')
print('   N   E|P_N|/S (MC)   (H2) bound kappa_N c3/S   (H3) bound along u   E sqrt(a^2h3^2+b^2X^2+c^2)/S')
for N in (3, 4, 6, 8, 10, 11, 12, 16, 24, 40, 100):
    tot, cnt, block = 0.0, 0, 250_000
    for _ in range(8):
        Z = rng.standard_normal((block, N))
        p1, p2, p3 = Z.sum(1), (Z * Z).sum(1), (Z ** 3).sum(1)
        tot += np.abs((p1 ** 3 - 3 * p1 * p2 + 2 * p3) / 6).sum(); cnt += block
    mc = tot / cnt / sqrt(comb(N, 3)) / S
    kap = 2 ** 1.5 * gamma((N + 3) / 2) / gamma(N / 2) / sqrt(N * (N + 2) * (N + 4))
    a2, b2, cc2 = (N - 1) * (N - 2) / N ** 2, 3 * (N - 2) / N ** 2, 4 / N ** 2
    h3b = 5 / (4 * sqrt(6)) * (1 + pi * (A_ * a2 + B_ * b2 + C_ * cc2))
    xs = rng.standard_normal(4_000_000)
    mid = np.sqrt(a2 * (xs ** 3 - 3 * xs) ** 2 / 6 + b2 * xs ** 2 + cc2).mean() / S
    print('  %3d   %.4f            %.4f                    %.4f               %.4f' % (N, mc, kap * c3 / S, h3b, mid))
print('   exact: E|P_3| = (2/pi)^{3/2}, so E|P_3|/S = 2/pi = %.4f; limit N -> oo: E|h3(X)|/S = (1 + 4e^{-3/2})/sqrt(3pi)/S = %.4f'
      % (2 / pi, (1 + 4 * np.exp(-1.5)) / sqrt(3 * pi) / S))
