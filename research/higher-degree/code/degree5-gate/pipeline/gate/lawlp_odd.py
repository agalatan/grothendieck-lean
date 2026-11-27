# [copy from degree5-cert/{gate/code,share/code,capgate}; claude-b9ee worker d5newcap, 16 Nov 2026: module path made local,
#  game constants from the environment D5_E1, D5_ETA (d5eng.py); nothing else changed]
# Item 3, lossy closure: add the pointwise k-odd excess Emax(s) (h11c.py) to the q-only potential and redo the moment
# law LP.  allowance = sup_laws [E(Psi5 + Emax)(sqrt(uU)) - cost] - sup_laws [E Psi5 - cost].  N.
import sys, os, json; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng as D
from scipy.optimize import linprog
C6 = 4045313 / 100000
def lp_sup(rec, extra=None):
    rw = D.Row(rec['t'], rec['l'], rec['beta'], rec['bA'], rec['bB']); inn = D.Inner(rw)
    N = 900; X = 440.0 * (np.arange(N + 1) / N) ** 2; best = (-9, None)
    for nu5 in [rec['nu5'] - 0.004, rec['nu5'], rec['nu5'] + 0.004]:
        for u in np.concatenate([[0.0], np.linspace(0.0005, 0.02, 8), np.linspace(0.02, 0.2, 19)]):
            s = np.minimum(np.sqrt(u * X), inn.smax)
            f = inn.sp(s, np.full_like(s, nu5), grid=False)
            if extra is not None: f = f + extra(np.sqrt(u * X))
            cost = u / rw.e1 + nu5 ** 2 / rw.eta - (rw.bA ** 2 + rw.bB ** 2) * u / rw.eta
            for m in (2.0, 2.05, 2.2, 2.5, 3.0, 4.0, 6.0, 10.0, 20.0, 44.0):
                res = linprog(-f, A_ub=[X ** 3], b_ub=[9 * m - 12 + C6 * max(m - 2, 0) ** 1.5],
                              A_eq=np.vstack([np.ones_like(X), X, X ** 2]), b_eq=[1, 1, m], bounds=(0, None), method='highs')
                if res.status == 0 and -res.fun - cost > best[0]: best = (-res.fun - cost, (float(u), m, nu5))
    return best
if __name__ == '__main__':
    rec = json.loads(sys.argv[1]); h = json.load(open(sys.argv[2]))
    S = np.array([r['s'] for r in h['pointwise']]); Em = np.array([r['Emax'] for r in h['pointwise']])
    extra = lambda s: np.interp(s, S, Em, right=0.0)
    b0 = lp_sup(rec); b1 = lp_sup(rec, extra)
    print(json.dumps(dict(t=rec['t'], lp=b0[0], lp_at=b0[1], lp_odd=b1[0], lp_odd_at=b1[1], allowance=b1[0] - b0[0])))
