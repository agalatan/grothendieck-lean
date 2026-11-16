#!/usr/bin/env python3
"""N: the extremal law of the combined relaxation (mine + (19) + more Gram directions), Hermite tests.
In the package's variables: C = kappa2, D = (kappa1 + kappa2)/3, b = alpha~ (conditional means given V)."""
import os, sys, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
import cvxpy as cp
from grid import r_edges, C6
import dual as D
import dualcp as DC
from hermite_tests import hermite_matrices

s = float(sys.argv[1]) if len(sys.argv) > 1 else 6.0
D.test_matrices = hermite_matrices
DC.test_matrices = hermite_matrices
opts = dict(joint=True, r19=[0.25, 0.5, 1, 2, 4, 8, 16, 32], budgets=tuple(range(1, D.NB + 1)))
ek = r_edges(0.1, 6.0, 30.0, 1.06)
rr = D.check_points(ek, 8, tail=40, tail_max=300.0)
prob, info = D.build(s, 'N', ek, rr, opts)
prob.solve(solver=cp.CLARABEL)
p = np.maximum(np.array(info['slack_con'].dual_value), 0.0) * info['sc']
v = rr ** 2
sol = dict(c1=info['c1'].value, c2=info['c2'].value, lam=info['lam'].value, mu=np.maximum(info['mu'].value, 0),
           sigma=float(info['sigma'].value), ek=ek)
par = np.abs(np.array([float(c.dual_value) for c in info['stat']]))
print('s = %g  value %.5f (%s)   law: mass %.6f  E V %.5f  E V^2 %.4f  E V^3 %.2f (scalar bound %.2f)' % (
    s, prob.value, prob.status, p.sum(), p @ v, p @ v ** 2, p @ v ** 3, 6 + 9 * s + C6 * s ** 1.5))
n, h, b, y, z = par
print('scalars (n,h,b,y,z) = %s   ->  package (A,B,P,Q,R) = (%.3f, %.3f, %.3f, %.3f, %.3f);  s check %.4f' % (
    np.round(par, 4), 32 * b, 96 * y, 16 * n, 4 * h, 8 * z, 32 * n + 8 * h + 32 * b + 96 * y))
print('(19) slack at alpha=32: %.3f;  z^2 <= nh: %.4f <= %.4f;  caps n,h <= 1/4' % (
    24 * 33 * y + (5 + 3 / 32) * (1 - 4 * h) - 8 * z, z * z, n * h))
print('multipliers: mu', np.round(sol['mu'], 5), 'sigma %.5f' % sol['sigma'], 'l3', info['l3'].value, 'x19', np.round(info['x19'].value, 6))
sl, (K2, K1, KA) = DC.inner_min(sol, 'N', ek, rr, opts, want_k=True)
Dm = (K1 + K2) / 3
edges = [0, 0.3, 0.6, 0.8, 0.9, 0.95, 1.0, 1.1, 1.3, 1.7, 2.5, 4, 6, 9, 14, 30, 300]
print('  |q|-bin        mass      E|q|      C       D       b     (mass-weighted conditional means)')
for a_, b_ in zip(edges[:-1], edges[1:]):
    m = (rr >= a_) & (rr < b_)
    ms = p[m].sum()
    if ms > 1e-9:
        print('  [%5.2f,%5.2f)  %.3e  %7.3f  %7.3f %7.3f %7.3f' % (a_, b_, ms, (p[m] @ rr[m]) / ms, (p[m] @ K2[m]) / ms,
                                                             (p[m] @ Dm[m]) / ms, (p[m] @ KA[m]) / ms))
print('budget use: E c^2 %.3f (budget %.3f)  E(3d)^2 %.3f (%.3f)  E b^2 %.3f (%.3f)  E[Vb] %.3f (%.3f)  E(c1-2)^2 %.3f (%.3f)' % (
    p @ (K2 - 1) ** 2, 16 * n + 4 * h, p @ (K1 + K2 - 3) ** 2, 80 * n + 20 * h + 16 * b + 96 * y + 32 * z, p @ KA ** 2, 32 * b + 24 * y,
    p @ (v * KA), 32 * b + 48 * y, p @ (K1 - 2) ** 2, 32 * n + 16 * h + 16 * b + 48 * y + 16 * z))
