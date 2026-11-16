# Remote-law layer at a row: sup over laws of U = |q|^2/u with E U = 1, E U^2 = m in [2,44],
# E U^3 <= 9m - 12 + C6 (m-2)^{3/2} (Lean inputs; Stein cuts NOT imposed), minus the Gaussian benchmark.  N.
import sys, os, json, time; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng as D
from scipy.optimize import linprog
C6 = 4045313 / 100000
def gap(rec, nus=None):
    rw = D.Row(rec['t'], rec['l'], rec['beta'], rec['bA'], rec['bB']); inn = D.Inner(rw)
    G, sig, nu = inn.sup()
    N = 900; X = 440.0 * (np.arange(N + 1) / N) ** 2
    best = (-9, None)
    nugrid = [nu] if nus is None else nus
    for nu5 in nugrid:
        for u in np.concatenate([np.linspace(0.0005, 0.02, 8), np.linspace(0.02, 0.3, 29)]):
            s = np.minimum(np.sqrt(u * X), inn.smax)
            f = inn.sp(s, np.full_like(s, nu5), grid=False)
            cost = u / rw.e1 + nu5 ** 2 / rw.eta - (rw.bA ** 2 + rw.bB ** 2) * u / rw.eta
            for m in (2.0, 2.01, 2.05, 2.2, 2.5, 3.0, 4.0, 6.0, 10.0, 20.0, 44.0):
                res = linprog(-f, A_ub=[X ** 3], b_ub=[9 * m - 12 + C6 * max(m - 2, 0) ** 1.5],
                              A_eq=np.vstack([np.ones_like(X), X, X ** 2]), b_eq=[1, 1, m], bounds=(0, None), method='highs')
                if res.status == 0:
                    v = -res.fun - cost
                    if v > best[0]: best = (v, (u, m, nu5))
    return dict(t=rec['t'], gauss=G, lp=best[0], gap=best[0] - G, at=best[1])
if __name__ == '__main__':
    for path in sys.argv[1:]:
        for rec in json.load(open(path)):
            t0 = time.time(); r = gap(rec, nus=None)
            print(json.dumps(r), '%.0fs' % (time.time() - t0), flush=True)
