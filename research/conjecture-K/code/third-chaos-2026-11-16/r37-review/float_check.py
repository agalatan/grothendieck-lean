#!/usr/bin/env python3
"""Independent float check of the 13 radial majorants (claude-b9ee review of ledger row 3.7).

Q(r) = lam0 + lam1 r^2 + L2 r^4 + L3 r^6 + Psi(r) - r,  Psi(r) = E_theta h(r cos theta),
h(x) = x V(x) - w(x)/2 - w(x)^2/(2 mu),  V(x) = int_0^x w,  w even, piecewise linear on the
knots xi (values v), constant beyond the last knot.

Psi is computed from the definition by Gauss-Legendre quadrature in theta on the sub-intervals
cut at theta_k = acos(xi_k / r) (the integrand is a polynomial in cos(theta) on each), not from
the certificate's closed-form primitives.  V is computed knot to knot with the trapezoid rule
(exact for piecewise-linear w).  Prints min Q over a fine grid of r, per row.
Usage: python3 -I float_check.py radius_certificates.json [--compare /path/to/pkgdir]
"""
import json, sys
import numpy as np
from fractions import Fraction as F

rows = json.load(open(sys.argv[1]))
gl_x, gl_w = np.polynomial.legendre.leggauss(12)

def make(c):
    xi = np.array([float(F(x)) for x in c['xi']]); v = np.array([float(F(x)) for x in c['v']])
    mu = float(F(c['mu'])); l0, l1, l2, l3 = (float(F(c[k])) for k in ('lam0', 'lam1', 'L2', 'L3'))
    G = np.concatenate([[0.0], np.cumsum(np.diff(xi) * (v[1:] + v[:-1]) / 2)])
    def w(x):
        return np.interp(np.abs(x), xi, v)
    def V(x):
        s = np.sign(x); a = np.abs(x)
        k = np.clip(np.searchsorted(xi, a, side='right') - 1, 0, len(xi) - 1)
        return s * (G[k] + (a - xi[k]) * (v[k] + w(a)) / 2)
    def h(x):
        ww = w(x)
        return x * V(x) - ww / 2 - ww * ww / (2 * mu)
    def Psi(r):
        if r == 0:
            return h(np.array([0.0]))[0]
        th = [0.0]
        for x in xi[::-1]:
            if x < r:
                t = np.arccos(x / r)
                if t > th[-1] + 1e-15:
                    th.append(t)
        if th[-1] < np.pi / 2:
            th.append(np.pi / 2)
        tot = 0.0
        for a, b in zip(th, th[1:]):
            tt = (a + b) / 2 + (b - a) / 2 * gl_x
            tot += (b - a) / 2 * np.dot(gl_w, h(r * np.cos(tt)))
        return 2 / np.pi * tot
    def Q(r):
        return l0 + l1 * r * r + l2 * r ** 4 + l3 * r ** 6 + Psi(r) - r
    return Q, Psi, xi

if __name__ == '__main__':
    grid = np.concatenate([np.linspace(0, 8, 16001), np.linspace(8, 60, 5201)[1:], np.geomspace(60, 1e4, 400)[1:]])
    allmin = []
    for i, c in enumerate(rows):
        Q, Psi, xi = make(c)
        vals = np.array([Q(r) for r in grid])
        j = int(np.argmin(vals))
        # refine around the minimiser
        lo = grid[max(j - 1, 0)]; hi = grid[min(j + 1, len(grid) - 1)]
        fine = np.linspace(lo, hi, 2001); fv = np.array([Q(r) for r in fine]); jj = int(np.argmin(fv))
        allmin.append(fv[jj])
        # second smallest local minimum (separated by > 0.5)
        mask = np.abs(grid - fine[jj]) > 0.5
        j2 = int(np.argmin(np.where(mask, vals, np.inf)))
        print(f'row {i:2d} s={c["s_interval"]}: min Q = {fv[jj]:.6e} at r = {fine[jj]:.5f};'
              f' next local min {vals[j2]:.3e} at r = {grid[j2]:.3f}; Q(0) = {Q(0.0):.4e};'
              f' Q(60) = {Q(60.0):.4e}; min over r>=60 = {vals[grid >= 60].min():.4e}', flush=True)
    print('overall min Q over rows =', min(allmin))
    if len(sys.argv) > 3 and sys.argv[2] == '--compare':
        sys.path.insert(0, sys.argv[3])
        from verify_radius import qvalue
        from radius_core import Cert, A
        rng = np.random.default_rng(1)
        worst = 0.0
        for i, c in enumerate(rows):
            Q, Psi, xi = make(c)
            cc = dict(c)
            C = Cert([F(x) for x in c['xi']], [F(x) for x in c['v']], F(c['lam0']), F(c['lam1']), F(c['L2']), F(c['L3']), F(c['mu']))
            for r in list(rng.uniform(0, 30, 25)) + [0.5, 1.0, 2.0, 24.0, 24.5, 59.9]:
                rf = F(r)
                a = qvalue(C, rf)
                d = abs(float(a.mid()) - Q(float(rf)))
                worst = max(worst, d)
        print('max |Q_float - Q_arb(certificate code)| over 13 x 31 points =', worst)
