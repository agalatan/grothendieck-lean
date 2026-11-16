# Quick flank rows: short Nelder-Mead on the coarse grid from interpolated starts, then the fine-grid value (both branches).  N.
import sys, os, json, time; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng as D
from scipy.optimize import minimize
gc = D.zgrid(npan=40, nq=8, nth=256, half=True); gf = D.zgrid(half=True)
starts = {0.875: [0.8750, 0.1805, -0.1650, -0.0990], 0.88: [0.8800, 0.1833, -0.1700, -0.1030], 0.886: [0.8860, 0.1870, -0.1720, -0.1060]}
t = float(sys.argv[1]); p0 = starts[t]; t0 = time.time()
res = minimize(lambda p: D.row_value(t, p, grid=gc), p0, method='Nelder-Mead', options={'xatol': 1e-4, 'fatol': 1e-8, 'maxiter': int(sys.argv[2]) if len(sys.argv) > 2 else 60})
val, sig, nu, inn = D.row_value(t, res.x, grid=gf, ret=True)
(vp, _, nup), (vd, sd, nud) = inn.branches(lo=0.05)
print(json.dumps(dict(t=t, p=list(res.x), row=val, sig=sig, nu5=nu, plain=vp + inn.row.const(), driver=vd + inn.row.const(), driver_sig=sd, nfev=res.nfev, secs=time.time() - t0)), flush=True)
