# Gaussian-ideal rows of a degree-5 game on a list of t (N): rowfast.py in a loop, warm-started from the previous row.
# claude-b9ee worker d5newcap, 16 Nov 2026.   usage: D5_E1=.. D5_ETA=.. rowscan.py out.lines t1,t2,... [fine=1]
import sys, os, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng2 as D, rowfast as R
from scipy.optimize import minimize
out = sys.argv[1]; ts = [float(x) for x in sys.argv[2].split(',')]; fine = (len(sys.argv) < 4 or sys.argv[3] == '1')
gc = D.zgrid(npan=40, nq=8, nth=256, half=True); gf = D.zgrid(half=True)
prev = None
for t in ts:
    t0 = time.time()
    if prev is None or abs(prev[0] - t) > 0.06: p0 = [t, 0.17 * t, -0.055 * t, -0.033 * t]
    else: p0 = [prev[1][0] + (t - prev[0]) * 1.8, prev[1][1] + (t - prev[0]) * 0.58, prev[1][2] - (t - prev[0]) * 0.13, prev[1][3] - (t - prev[0]) * 0.06]
    res = minimize(lambda p: R.fg(t, p, gc)[:2], p0, jac=True, method='BFGS', options={'gtol': float(os.environ.get('ROW_GTOL', 1e-6)), 'maxiter': 40})
    p = list(res.x)
    val, sig, nu, inn = D.row_value(t, p, grid=(gf if fine else gc), ret=True)
    (vp, _, nup), (vd, sd, nud) = inn.branches(lo=0.05); c = inn.row.const()
    rec = dict(t=t, l=p[0], beta=p[1], bA=p[2], bB=p[3], c5=0.0, row=val, sig=sig, nu5=nu, C=val - t * t + 2 * p[0] * t,
               plain=vp + c, plain_nu5=nup, driver=vd + c, driver_sig=sd, driver_nu5=nud, branch=('plain' if vp >= vd else 'driver'),
               coarse=float(res.fun), nfev=int(res.nfev), gnorm=float(np.abs(res.jac).max()), e1=D.E1, eta=D.ETA, secs=time.time() - t0)
    open(out, 'a').write(json.dumps(rec) + '\n')
    print('t=%.4f row %.7f l=%.5f beta=%.5f bA=%.5f bB=%.5f sig=%.4f nu5=%.5f %s nfev %d g %.1e (%.0fs)' % (
        t, val, p[0], p[1], p[2], p[3], sig, nu, rec['branch'], res.nfev, rec['gnorm'], rec['secs']), flush=True)
    prev = (t, p)
