# [copy from degree5-cert/{gate/code,share/code,capgate}; claude-b9ee worker d5newcap, 16 Nov 2026: module path made local,
#  game constants from the environment D5_E1, D5_ETA (d5eng.py); nothing else changed]
"""lp_rows.py -- law-layer loss of a capped row (claude-b9ee worker, 16 Nov 2026).  N.
lp = sup over (u, m, nu5) and over laws of X = |q|^2/u with E X = 1, E X^2 = m, E X^3 <= 9m - 12 + C6 (m-2)^1.5 (moments only,
no Stein cuts) of E Psi5(sqrt(uX); nu5) - cost(u, nu5); S5 = the Gaussian sup (Inner.sup, same potential); loss = lp - S5.
Also the best value per m (the profile of the relaxation).  Run with D5_E1, D5_ETA set.  usage: lp_rows.py k OUT"""
import sys, os, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng as D
from scipy.optimize import linprog
C6 = 4045313 / 100000
here = os.path.dirname(os.path.abspath(__file__))
k = int(sys.argv[1]); rec = json.loads(open(os.path.join(here, 'rows5.lines')).read().split('\n')[k - 1])
rw = D.Row(rec['t'], rec['l'], rec['beta'], rec['bA'], rec['bB']); inn = D.Inner(rw)
S5, ss, nus = inn.sup()
N = 900; X = 440.0 * (np.arange(N + 1) / N) ** 2
MS = (2.0, 2.02, 2.05, 2.1, 2.2, 2.35, 2.5, 2.75, 3.0, 3.5, 4.0, 5.0, 6.0, 8.0, 10.0, 15.0, 20.0, 30.0, 44.0)
U = np.unique(np.concatenate([[0.0], np.linspace(0.0005, 0.02, 12), np.linspace(0.02, 0.24, 45), ss ** 2 * np.array([0.8, 0.9, 1.0, 1.1, 1.25])]))
best = (-9, None); perm = {m: (-9, None) for m in MS}
for nu5 in nus + np.array([-0.004, -0.002, 0.0, 0.002, 0.004]):
    for u in U:
        s = np.minimum(np.sqrt(u * X), inn.smax); f = inn.sp(s, np.full_like(s, nu5), grid=False)
        cost = u / rw.e1 + nu5 ** 2 / rw.eta - (rw.bA ** 2 + rw.bB ** 2) * u / rw.eta
        for m in MS:
            res = linprog(-f, A_ub=[X ** 3], b_ub=[9 * m - 12 + C6 * max(m - 2, 0) ** 1.5],
                          A_eq=np.vstack([np.ones_like(X), X, X ** 2]), b_eq=[1, 1, m], bounds=(0, None), method='highs')
            if res.status != 0: continue
            v = -res.fun - cost
            if v > best[0]: best = (v, (float(u), m, float(nu5)))
            if v > perm[m][0]: perm[m] = (v, (float(u), float(nu5)))
out = dict(t=rec['t'], k=k, e1=rw.e1, eta=rw.eta, S5=float(S5), sstar=float(ss), nustar=float(nus), lp=float(best[0]), lp_at=best[1], loss=float(best[0] - S5),
           per_m={str(m): dict(loss=float(v - S5), u=a[0], nu5=a[1]) for m, (v, a) in perm.items() if a})
json.dump(out, open(sys.argv[2], 'w'), indent=1)
print('t=%.3f S5=%.9f (sig %.4f nu %.5f) lp=%.9f at %s loss %.2e' % (rec['t'], S5, ss, nus, best[0], best[1], best[0] - S5))
