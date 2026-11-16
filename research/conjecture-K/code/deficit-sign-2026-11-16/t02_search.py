"""Adversarial search over H_{2,1}(C^n) (n = 2 or 3): minimise T1/D or T2/D for a profile (label N; lower bounds on suprema only).
usage: t02_search.py <n> <profile: sqrt | peak:<u> | buf:<s2>> <target: T1|T2|D> <nstarts> <seed> [out.json]"""
import sys, os, math, time, json
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy import optimize
from dslib import *

def make_prof(spec):
    if spec == 'sqrt': return SqrtProfile(1.0)
    k, v = spec.split(':')
    if k == 'peak': return peak_profile(float(v))
    if k == 'buf': return buffer_profile(float(v))
    raise ValueError(spec)

if __name__ == '__main__':
    n = int(sys.argv[1]); prof = make_prof(sys.argv[2]); target = sys.argv[3]; nst = int(sys.argv[4]); seed = int(sys.argv[5])
    out = sys.argv[6] if len(sys.argv) > 6 else None
    if n == 2:
        gc = Grid(2, PANELS_COARSE, 6, 16); gf = Grid(2, PANELS_FINE, 8, 48)
    else:
        gc = Grid(3, [0, 1, 2.5, 5, 9, 15, 26], 3, 8); gf = Grid(3, [0, .5, 1, 2, 3, 5, 8, 12, 18, 28], 4, 12)
    print('grid sizes', gc.W.size, gf.W.size, flush=True)
    rng = np.random.default_rng(seed)
    def obj(p, g=gc):
        t = normalise(tensor_from_params(p, n), prof.u)
        r = split(g, t, prof)
        if target == 'D': return r['D'] / math.sqrt(prof.u)
        return r[target] / r['D']
    res = []
    for k in range(nst):
        p0 = rng.standard_normal(2 * n ** 3)
        if k % 3 == 1:   # start near the z-family
            z = rng.standard_normal() + 1j * rng.standard_normal()
            t0 = np.zeros((n, n, n), complex); t0[0, 0, 0] = 1; t0[0, 1, 1] = t0[1, 0, 1] = z / 2
            t0 = t0 + 0.05 * random_tensor(n, rng)
            p0 = np.concatenate([t0.real.ravel(), t0.imag.ravel()])
        t1 = time.time()
        r = optimize.minimize(obj, p0, method='BFGS', options=dict(maxiter=120, gtol=1e-6))
        r2 = optimize.minimize(obj, r.x, method='Nelder-Mead', options=dict(maxiter=1200, xatol=1e-6, fatol=1e-10))
        tt = normalise(tensor_from_params(r2.x, n), prof.u)
        fine = split(gf, tt, prof); mom = moments(gf, tt)
        rec = dict(start=k, coarse=float(r2.fun), fine=fine, chi=mom['delta'] / prof.u ** 2, t_re=tt.real.tolist(), t_im=tt.imag.tolist())
        res.append(rec)
        print(f"start {k:3d}: coarse {target} obj = {r2.fun:+.6f}; fine D={fine['D']:+.6e} T1/D={fine['T1']/fine['D']:+.5f} T2/D={fine['T2']/fine['D']:+.5f} err={(fine['T1']+fine['T2']-fine['D'])/fine['D']:+.1e} chi={rec['chi']:.3f}  ({time.time()-t1:.0f}s)", flush=True)
        if out: json.dump(res, open(out, 'w'))
    key = (lambda r: r['fine']['D']) if target == 'D' else (lambda r: r['fine'][target] / r['fine']['D'])
    best = min(res, key=key)
    print('BEST (fine):', key(best), 'chi', best['chi'])
