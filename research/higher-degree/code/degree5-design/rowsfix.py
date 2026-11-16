# Re-optimise rows with the fixed two-branch supremum (d5eng.Inner.sup = max of plain and driver branch).  N.
# usage: rowsfix.py t l beta bA bB [maxiter]   -> prints one JSON line (fine-grid value, both branches)
import sys, os, json, time; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng as D
from scipy.optimize import minimize
t = float(sys.argv[1]); p0 = [float(x) for x in sys.argv[2:6]]; mi = int(sys.argv[6]) if len(sys.argv) > 6 else 250
gc = D.zgrid(npan=40, nq=8, nth=256, half=True); gf = D.zgrid(half=True)
t0 = time.time()
if mi > 0:
    res = minimize(lambda p: D.row_value(t, p, grid=gc), p0, method='Nelder-Mead',
                   options={'xatol': 2e-5, 'fatol': 2e-9, 'maxiter': mi, 'initial_simplex': [p0, [p0[0] + 0.004] + p0[1:], [p0[0], p0[1] + 0.003] + p0[2:], p0[:2] + [p0[2] + 0.006, p0[3]], p0[:3] + [p0[3] + 0.006]]})
    p = list(res.x); nfev = res.nfev; coarse = res.fun
else:
    p = p0; nfev = 0; coarse = None
val, sig, nu, inn = D.row_value(t, p, grid=gf, ret=True)
(vp, _, nup), (vd, sd, nud) = inn.branches(lo=0.05)
c = inn.row.const()
print(json.dumps(dict(t=t, l=p[0], beta=p[1], bA=p[2], bB=p[3], c5=0.0, row=val, sig=sig, nu5=nu, C=val - t * t + 2 * p[0] * t,
                      plain=vp + c, plain_nu5=nup, driver=vd + c, driver_sig=sd, driver_nu5=nud, coarse=coarse, nfev=nfev,
                      e1=D.E1, eta=D.ETA, secs=time.time() - t0)), flush=True)
