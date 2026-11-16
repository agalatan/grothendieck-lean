"""Task 3 (N): the Wick monomial q = y(|y|^2-2)/sqrt2 against the finite-volume identities.

t = |y|^2 ~ Exp(1);  V = t (t-2)^2 / 2,  c2 = t^2/2,  c1 = 2 (t-1)^2,
Re(conj(q)^2 a) = (t-1) t^2 (t-2)^2 / 2   [a = (t-1) y^2, q^2 = y^2 (t-2)^2 / 2].
"""
import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from grid import r_edges, atoms

tt = np.linspace(0, 70, 14000001)
tm = 0.5 * (tt[1:] + tt[:-1])
wt = np.exp(-tt[:-1]) - np.exp(-tt[1:])
V = tm * (tm - 2) ** 2 / 2
c2 = tm ** 2 / 2
c1 = 2 * (tm - 1) ** 2
qa = (tm - 1) * tm ** 2 * (tm - 2) ** 2 / 2
print('E c2', wt @ c2, 'E c1', wt @ c1, 'Var c2', wt @ (c2 - 1) ** 2, 'E qa', wt @ qa, '(8+12=20)',
      'E a^2', wt @ ((tm - 1) ** 2 * tm ** 2), '(8+6=14)', 'Var(c1-c2)', wt @ (c1 - c2 - 1) ** 2, '(13)',
      'Var(c1+c2)', wt @ (c1 + c2 - 3) ** 2, '(61)')
# continuum identity at a few hinge knots: E(V-t)+ = E[c2 1(V>t)] + t E[qa/V^2 1(V>t)]
for tk in [0.0, 0.3, 1.0, 1.1, 3.0, 20.0]:
    m = V > tk
    lhs = wt[m] @ (V[m] - tk)
    rhs1 = wt[m] @ c2[m] + tk * (wt[m] @ (qa[m] / V[m] ** 2))
    rhs2 = 0.5 * (wt[m] @ c1[m]) + 0.5 * tk * (wt[m] @ (qa[m] / V[m] ** 2))
    print('knot', tk, 'lhs', lhs, 'I:', rhs1, 'II:', rhs2)
for dr, gr in [(0.05, 1.05), (0.02, 1.03), (0.01, 1.02)]:
    e = r_edges(dr, 6.0, 400.0, gr)
    r, v = atoms(e)
    t = e ** 2
    idx = np.searchsorted(t, V) - 1
    N = len(r)
    p = np.bincount(idx, weights=wt, minlength=N)[:N]
    m2 = np.bincount(idx, weights=wt * c2, minlength=N)[:N]
    m1 = np.bincount(idx, weights=wt * c1, minlength=N)[:N]
    At_over_v = np.bincount(idx, weights=wt * qa / V ** 2, minlength=N)[:N]   # mass of A/v^2
    At = At_over_v * v                                                          # FV variable At_k
    Tp = np.append(np.cumsum(p[::-1])[::-1][1:], 0.0)
    Ta = np.append(np.cumsum(At_over_v[::-1])[::-1][1:], 0.0)
    tl, th = t[:-1], t[1:]
    D = th - tl
    m2_fv = (v - tl) * p - tl * At / v + D * (Tp + Ta)
    d_fv = (v - tl) * p + D * Tp
    res2 = m2 - m2_fv
    resd = (m1 - m2) - d_fv
    print(dr, 'N', N, 'max|res m2|/max m2', np.abs(res2).max() / m2.max(), 'sum|res m2|', np.abs(res2).sum(),
          'sum|res d|', np.abs(resd).sum(), 'sum m2', m2.sum(), m2_fv.sum())
    ok = p > 0
    print('   budgets: E(k2-1)^2', np.sum((m2[ok] - p[ok]) ** 2 / p[ok]), '<= 5;  FV version', np.sum((m2_fv[ok] - p[ok]) ** 2 / p[ok]),
          ' E(alpha/V)^2', np.sum(At[ok] ** 2 / p[ok]), '<= 14; hazard', np.sum((d_fv[ok] - p[ok]) ** 2 / p[ok]), '<= 13',
          ' plus', np.sum((2 * m2_fv[ok] + d_fv[ok] - 3 * p[ok]) ** 2 / p[ok]), '<= 61',
          ' R0 total', np.sum((2 * m2_fv[ok] + d_fv[ok] - 3 * p[ok]) ** 2 / p[ok]) / 36 + np.sum(At[ok] ** 2 / p[ok]) / 18, '<= 3.5',
          ' min m2_fv', m2_fv.min(), ' cone viol', np.max(At ** 2 - m2_fv * (m2_fv + d_fv)))
