#!/usr/bin/env python3
"""End-to-end numerical sanity check of the Stein step on concrete laws (claude-b9ee review of
ledger row 3.7).  Not a proof.

For every certificate row (w, mu) the scalar-Stein step claims, for EVERY normalised genuine Wick
cubic q (whatever its s), E Psi_w(|q|) = E h_w(Re q) <= mu s / 24.  Checked on
 (a) the single Wick monomial q = Z(|Z|^2 - 2)/sqrt2 (s = 42), by 1-d quadrature in U = |Z|^2;
 (b) q = N^{-1/2} sum_i Z_i(|Z_i|^2 - 2)/sqrt2, N = 4 (s = 42/4), by Monte Carlo;
also E|q| <= B_row(s) for the row whose s-interval contains s.
Usage: python3 -I law_check.py radius_certificates.json
"""
import json, sys
import numpy as np
from fractions import Fraction as F
from scipy import integrate

sys.argv, J = sys.argv[:1], sys.argv[1]
rows = json.load(open(J))
gl_x, gl_w = np.polynomial.legendre.leggauss(16)

def setup(c):
    xi = np.array([float(F(x)) for x in c['xi']]); v = np.array([float(F(x)) for x in c['v']])
    mu = float(F(c['mu']))
    G = np.concatenate([[0.0], np.cumsum(np.diff(xi) * (v[1:] + v[:-1]) / 2)])
    def w(x): return np.interp(np.abs(x), xi, v)
    def V(x):
        s = np.sign(x); a = np.abs(x)
        k = np.clip(np.searchsorted(xi, a, side='right') - 1, 0, len(xi) - 1)
        return s * (G[k] + (a - xi[k]) * (v[k] + w(a)) / 2)
    def h(x):
        ww = w(x); return x * V(x) - ww / 2 - ww * ww / (2 * mu)
    def Psi(r):
        th = [0.0]
        for x in xi[::-1]:
            if 0 < r and x < r:
                t = np.arccos(x / r)
                if t > th[-1] + 1e-15: th.append(t)
        if th[-1] < np.pi / 2: th.append(np.pi / 2)
        tot = 0.0
        for a_, b_ in zip(th, th[1:]):
            tt = (a_ + b_) / 2 + (b_ - a_) / 2 * gl_x
            tot += (b_ - a_) / 2 * np.dot(gl_w, h(r * np.cos(tt)))
        return 2 / np.pi * tot
    return h, Psi, mu

def B(c, s, C6=4045313 / 100000):
    l0, l1, l2, l3, mu = (float(F(c[k])) for k in ('lam0', 'lam1', 'L2', 'L3', 'mu'))
    return l0 + l1 + l2 * (2 + s) + l3 * (6 + 9 * s + C6 * s ** 1.5) + mu * s / 24

def row_for(s):
    for c in rows:
        a, b = (float(F(x)) for x in c['s_interval'])
        if a <= s <= b:
            return c

# (a) single monomial: R = sqrt(U/2) |U - 2|, U ~ Exp(1)
Rm = lambda u: np.sqrt(u / 2) * abs(u - 2)
ER = (integrate.quad(lambda u: Rm(u) * np.exp(-u), 0, 2, limit=200)[0]
      + integrate.quad(lambda u: Rm(u) * np.exp(-u), 2, np.inf, limit=200)[0])
print(f'(a) monomial: E|q| = {ER:.6f}, B(42) = {B(row_for(42.0), 42.0):.6f}')
for i, c in enumerate(rows):
    h, Psi, mu = setup(c)
    val = integrate.quad(lambda u: Psi(Rm(u)) * np.exp(-u), 0, 60, limit=400, points=[2.0])[0]
    print(f'   row {i:2d}: E Psi_w(R) = {val: .6f}  <=  mu*42/24 = {mu * 42 / 24:.6f}  ', 'ok' if val <= mu * 42 / 24 else 'VIOLATED', flush=True)
# (b) N = 4 independent monomials, Monte Carlo
rng = np.random.default_rng(7); N = 4; M = 2_000_000
Z = (rng.standard_normal((M, N)) + 1j * rng.standard_normal((M, N))) / np.sqrt(2)
q = (Z * (np.abs(Z) ** 2 - 2)).sum(axis=1) / np.sqrt(2) / np.sqrt(N)
R = np.abs(q); X = q.real
s = 42 / N
print(f'(b) N={N}: E|q|^2 ~ {np.mean(R**2):.4f}, s = {s}, E|q| ~ {R.mean():.5f} +- {R.std()/np.sqrt(M):.1e}, B(s) = {B(row_for(s), s):.6f}')
for i, c in enumerate(rows):
    h, Psi, mu = setup(c)
    vals = h(X)
    m, se = vals.mean(), vals.std() / np.sqrt(M)
    print(f'   row {i:2d}: E h_w(Re q) ~ {m: .5f} +- {se:.1e}  <=  mu*s/24 = {mu * s / 24:.5f}  ', 'ok' if m <= mu * s / 24 + 4 * se else 'VIOLATED?', flush=True)
