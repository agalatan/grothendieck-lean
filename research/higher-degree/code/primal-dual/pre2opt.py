import sys, json, time, numpy as np
sys.path.insert(0, '.')
from pre2 import *
from scipy.optimize import minimize
K = int(sys.argv[1]); lam = json.loads(sys.argv[2]); tag = sys.argv[3]
M = make(K, 40, 32); Mf = make(K, 96, 64)
def unpack(x):
    a1, a2, b0, b2 = x
    a0 = 1 - abs(a1) - abs(a2); b1 = 1 - abs(b0) - abs(b2)
    return [a0, a1, a2], [b0, b1, b2]
cache = {}
def obj(x):
    if abs(x[0]) + abs(x[1]) > 1 or abs(x[2]) + abs(x[3]) > 1: return 1.0
    r1, r2 = unpack(x); v, cf = value(M, lam, r1, r2, starts=(1 if 'w' in cache else 4), seed=1, warm=cache.get('w'))
    if v > cache.get('best', (-9,))[0]: cache['best'] = (v, list(x)); cache['w'] = cf
    return -v
t0 = time.time()
base = -obj(np.zeros(4)); print(tag, 'W3 baseline (coarse)', base, flush=True)
results = []
for x0 in [np.array([0.04, 0.0, 0.0, 0.04]), np.array([-0.04, 0.02, 0.04, -0.02]), np.array([0.0, -0.04, 0.0, 0.0])]:
    r = minimize(obj, x0, method='Nelder-Mead', options=dict(xatol=1e-4, fatol=1e-8, maxfev=70, initial_simplex=None))
    results.append((-r.fun, list(r.x))); print(tag, 'start', np.round(x0, 3), '->', round(-r.fun, 8), np.round(r.x, 4), f'{time.time()-t0:.0f}s', flush=True)
vb, xb = cache['best']; r1, r2 = unpack(xb)
vf, _ = value(Mf, lam, r1, r2, starts=2, seed=2, warm=cache['w'])
vw, _ = value(Mf, lam, [1], [0, 1], starts=3, seed=3)
print(tag, 'BEST coarse', vb, 'rho1', np.round(r1, 5), 'rho2', np.round(r2, 5), '| fine: best-config', vf, ' W3', vw, flush=True)
