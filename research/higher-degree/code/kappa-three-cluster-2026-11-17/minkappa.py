import numpy as np, sys
from scipy.optimize import minimize
src = open('wick4.py').read().split('for c in (2, 3):')[0]; ns = {}; exec(src, ns)
exact4, bound = ns['exact4'], ns['bound']
def unpack(v, c):
    z = v[:3*c**3] + 1j*v[3*c**3:]; z = z.reshape(3, c, c, c); return z[0], z[1], z[2]
def kap(v, c):
    A, B, C = unpack(v, c); n2 = sum(np.vdot(T, T).real for T in (A, B, C))
    return (c/(c + 1))**3*exact4(A, B, C)/n2**2
def kb(v, c):
    A, B, C = unpack(v, c); n2 = sum(np.vdot(T, T).real for T in (A, B, C))
    return (c/(c + 1))**3*bound(A, B, C)/n2**2
rng = np.random.default_rng(int(sys.argv[2]) if len(sys.argv) > 2 else 0)
c = int(sys.argv[1]); best = (9, None)
for start in range(12 if c <= 3 else 4):
    v0 = rng.standard_normal(6*c**3)
    r = minimize(kap, v0, args=(c,), method='L-BFGS-B', options={'maxiter': 3000})
    if r.fun < best[0]: best = (r.fun, r.x)
    print('c=%d start %d: kappa %.6f (bound at that point %.6f)' % (c, start, r.fun, kb(r.x, c)), flush=True)
k = best[0]; print('c=%d: smallest kappa found %.6f; proved bound 2c^2(3c+5)/(3(c+1)^3) = %.6f' % (c, k, 2*c**2*(3*c + 5)/(3*(c + 1)**3)))
