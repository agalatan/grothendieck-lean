"""Adversarial search (label N) for the signs of the two local terms at the peak row, H21(C^2).
usage: t16b_local_search.py <T2loc|T3> <u> <nstarts> <seed>"""
import sys, os, math, time, json
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy import optimize
import t16_local_form as L
from dslib import *
from t12_jensen_split import BenchB, make_prof
from t13_weighted_contraction import weight

if __name__ == '__main__':
    target = sys.argv[1]; u = float(sys.argv[2]); nst = int(sys.argv[3]); seed = int(sys.argv[4])
    spec = f'peak:{u}'; prof = make_prof(spec); bench = BenchB(prof); w, w0, _ = weight(spec)
    gx, gw = np.polynomial.legendre.leggauss(6); lx, lw = np.polynomial.laguerre.laggauss(14)
    fine = (L.Sx, L.Sw, L.LGx, L.LGw); coarse = (0.5 * (gx + 1), 0.5 * gw, lx, lw)
    gc = Grid(2, PANELS_COARSE, 6, 16); gf = Grid(2, PANELS_MED, 6, 24)
    def terms(g, t, rule):
        L.Sx, L.Sw, L.LGx, L.LGw = rule
        return L.local_terms(g, t, prof, bench, w)
    rng = np.random.default_rng(seed)
    def obj(p):
        r = terms(gc, normalise(tensor_from_params(p, 2), u), coarse); return r[target] / r['D']
    for k in range(nst):
        t1 = time.time()
        r = optimize.minimize(obj, rng.standard_normal(16), method='BFGS', options=dict(maxiter=60, gtol=1e-5))
        r2 = optimize.minimize(obj, r.x, method='Nelder-Mead', options=dict(maxiter=500, xatol=1e-5, fatol=1e-9, adaptive=True))
        tt = normalise(tensor_from_params(r2.x, 2), u); f = terms(gf, tt, fine); m = moments(gf, tt)
        print(f"{target} start {k}: coarse min {r2.fun:+.5f}; fine: D={f['D']:.5e} JG/D={f['JG']/f['D']:+.4f} T2loc/D={f['T2loc']/f['D']:+.5f} T3/D={f['T3']/f['D']:+.5f} chi={m['delta']/u**2:.2f} ({time.time()-t1:.0f}s)", flush=True)
