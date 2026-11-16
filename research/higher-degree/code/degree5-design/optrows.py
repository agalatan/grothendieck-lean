# Optimise the gate-free degree-5 row (l, beta, bA, bB) at each t (convex in these parameters), Gaussian ideal.  N.
import sys, os, json, time; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng as D
from scipy.optimize import minimize
T0 = np.array([0.72, 0.76, 0.82, 0.84, 0.86, 0.87, 0.88]); B0 = np.array([0.0985, 0.1166, 0.1476, 0.1591, 0.1712, 0.1775, 0.1833])
A0 = np.array([-0.1149, -0.1284, -0.1506, -0.1585, -0.1664, -0.1727, -0.1741]); C0 = np.array([-0.0683, -0.0768, -0.0912, -0.0965, -0.1020, -0.1064, -0.1101])
L0 = np.array([0.7036, 0.7497, 0.8181, 0.8402, 0.8605, 0.8707, 0.8800])
def start(t): return [float(np.interp(t, T0, X)) for X in (L0, B0, A0, C0)]
gc = D.zgrid(npan=40, nq=8, nth=256, half=True); gf = D.zgrid(half=True)
out = []
for t in [float(x) for x in sys.argv[1:]]:
    t0 = time.time()
    f = lambda p: D.row_value(t, p, grid=gc)
    res = minimize(f, start(t), method='Nelder-Mead', options={'xatol': 2e-5, 'fatol': 2e-9, 'maxiter': 400, 'initial_simplex': None})
    p = res.x
    val, sig, nu, inn = D.row_value(t, p, grid=gf, ret=True)
    (vp, _, nup), (vd, sd, nud) = inn.branches()
    rw = inn.row; C = val - t * t + 2 * p[0] * t
    rec = dict(t=t, l=p[0], beta=p[1], bA=p[2], bB=p[3], row=val, coarse=res.fun, sig=sig, nu5=nu, C=C,
               plain=vp + rw.const(), plain_nu5=nup, driver=vd + rw.const(), driver_sig=sd, driver_nu5=nud, nfev=res.nfev, secs=time.time() - t0)
    out.append(rec); print(json.dumps(rec), flush=True)
json.dump(out, open(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'out', 'rows_%s.json' % '_'.join(sys.argv[1:])), 'w'), indent=1)
