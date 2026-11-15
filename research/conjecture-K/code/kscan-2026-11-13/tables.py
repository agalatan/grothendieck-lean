# claude-b9ee, 13 Nov 2026: tables of phi(v) = 2E|L + sqrt v| and g(v) (F_A(y) = y g(|y|^2)) on a grid in y = sqrt v.
# usage: python tables.py <row> ; writes tables-<row>.npz
import numpy as np, sys
from scipy import integrate, special, optimize
ROWS = {'peak': (1891/2500, 1057/1250, 179/1250), 'flank': (0.745, 0.8534, 0.1467), 'upper': (0.7564, 0.877, 0.152)}
row = sys.argv[1]; eps, l, beta = ROWS[row]; a = l - 2*beta; b = beta
SMAX = 9.0
rs = lambda s: s*(a + b*s*s)                     # r(T) with T = s^2
def A1(r, y):                                    # E_theta |r + y e^{i theta}|
    if y < 1e-300: return r
    if r < 1e-300: return y
    return 2/np.pi*(r + y)*special.ellipe(4*r*y/(r + y)**2)
def Kinv(r, y):                                  # E_theta 1/|r + y e^{i theta}|
    k2 = min(4*r*y/(r + y)**2, 1 - 1e-16)
    return 2/np.pi*special.ellipk(k2)/(r + y)
def sstar(y): return optimize.brentq(lambda s: rs(s) - y, 0, SMAX) if 0 < y < rs(SMAX) else None
def quad(f, y):
    p = sstar(y)
    return integrate.quad(f, 0, SMAX, points=[p] if p else None, limit=800, epsabs=1e-13, epsrel=1e-12)[0]
def phi(y): return 2*quad(lambda s: 2*s*np.exp(-s*s)*A1(rs(s), y), y)
def g(y):
    if y == 0: return integrate.quad(lambda s: np.exp(-s*s)*(s*s - 1)/(a + b*s*s), 0, SMAX, epsabs=1e-13)[0]
    def f(s):
        r = rs(s)
        if r < 1e-300: return 0.0
        return 2*s*np.exp(-s*s)*(s*s - 1)*(A1(r, y) + (y*y - r*r)*Kinv(r, y))/(2*y)
    return quad(f, y)/y
ys = np.concatenate([np.arange(0, 2, 0.004), np.arange(2, 20.0001, 0.05)])
PHI = np.array([phi(y) for y in ys]); G = np.array([g(y) for y in ys])
np.savez(f'tables-{row}.npz', y=ys, phi=PHI, g=G, eps=eps, l=l, beta=beta)
print(row, 'phi(0)=%.6f g(0)=%.6f g(0.2)=%.6f' % (PHI[0], G[0], g(0.2)))
