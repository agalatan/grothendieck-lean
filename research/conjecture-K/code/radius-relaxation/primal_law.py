"""N: the extremal ("defeating") law of a relaxation, read off the dual SOCP.

The multipliers of the pointwise constraints (*) are the masses p_i of the law of V at the check
points; the kernels (kappa2, kappa1, alpha~) at the support are the minimisers of the inner cone
problem.  Prints the law, its kernels, the budgets it uses and the parameters it chooses."""
import os, sys, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
import cvxpy as cp
from grid import r_edges, C6
import dual as D
from dualcp import inner_min

s = float(sys.argv[1]) if len(sys.argv) > 1 else 5.0
mode = sys.argv[2] if len(sys.argv) > 2 else 'N'
opts = json.loads(sys.argv[3]) if len(sys.argv) > 3 else dict(joint=True)
out = sys.argv[4] if len(sys.argv) > 4 else None
ek = r_edges(0.1, 6.0, 30.0, 1.06)
rr = D.check_points(ek, 8, tail=40, tail_max=300.0)
prob, info = D.build(s, mode, ek, rr, opts)
prob.solve(solver=cp.CLARABEL)
p = np.maximum(np.array(info['slack_con'].dual_value), 0.0) * info['sc']
v = rr ** 2
print('value', prob.value, prob.status)
print('law: mass %.6f  E V %.6f  E V^2 %.5f (2+s = %.2f)  E V^3 %.3f (scalar bound %.3f)  E sqrt V %.6f' % (
    p.sum(), p @ v, p @ v ** 2, 2 + s, p @ v ** 3, 6 + 9 * s + C6 * s ** 1.5, p @ rr))
sg = info['sigma']
sol = dict(c1=info['c1'].value, c2=info['c2'].value, lam=info['lam'].value, mu=np.maximum(info['mu'].value, 0),
           sigma=float(sg.value) if hasattr(sg, 'value') else 0.0)
print('multipliers: lam', sol['lam'], 'mu', sol['mu'], 'sigma', sol['sigma'], 'l3', info['l3'].value if 'l3' in info else None)
if 'stat' in info:
    par = np.array([float(c.dual_value) for c in info['stat']])
    print('parameters (n,h,b,y,z) [duals of the stationarity rows, up to sign]:', par)
supp = p > 1e-7
if D.MODES[mode]['cone'] != 'none' or (opts and opts.get('cone', 'none') != 'none'):
    sl, (K2, K1, KA) = inner_min(sol, mode, ek, rr, opts, want_k=True)
    print('budget use: E(k2-1)^2 %.4f  E(k1-k2-1)^2 %.4f  E(k1+k2-3)^2 %.4f  E(k1-2)^2 %.4f  E at^2 %.4f  E[V at] %.4f' % (
        p @ (K2 - 1) ** 2, p @ (K1 - K2 - 1) ** 2, p @ (K1 + K2 - 3) ** 2, p @ (K1 - 2) ** 2, p @ KA ** 2, p @ (v * KA)))
    print('E k2 %.4f  E k1 %.4f   cone slack min(k1 k2 - at^2) on support %.2e' % (p @ K2, p @ K1, (K1 * K2 - KA ** 2)[supp].min()))
else:
    K2 = K1 = KA = np.zeros_like(p)
# coarse histogram of the law in r
edges = [0, 0.2, 0.4, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.4, 1.7, 2, 2.5, 3, 4, 5, 6, 8, 10, 14, 20, 30, 300]
print('  r-bin        mass       E[r|bin]   kappa2   kappa1   alpha~   (mass-weighted means)')
for a_, b_ in zip(edges[:-1], edges[1:]):
    m = (rr >= a_) & (rr < b_)
    ms = p[m].sum()
    if ms > 1e-9:
        print('  [%5.1f,%5.1f)  %.3e  %8.4f  %7.3f  %7.3f  %7.3f' % (a_, b_, ms, (p[m] @ rr[m]) / ms, (p[m] @ K2[m]) / ms,
                                                                 (p[m] @ K1[m]) / ms, (p[m] @ KA[m]) / ms))
print('atoms with mass > 1e-3:')
for i in np.where(p > 1e-3)[0]:
    print('   r = %.4f  mass %.5f  kappa2 %.3f kappa1 %.3f alpha~ %.3f' % (rr[i], p[i], K2[i], K1[i], KA[i]))
if out:
    np.savez(out, r=rr, p=p, k2=K2, k1=K1, ka=KA)
