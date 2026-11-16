"""Weighted cubic contraction  W_w(q) = E[w(V) Re(conj(q)^2 a)]  with w = -phi'' (label N).

By the decoupling path formula (REPORT section 6),  Delta_phi(q) = 2 int_0^{pi/2} tan(theta) W_{-phi''}(q_theta) dtheta, so
W_{-phi''} >= 0 on all cubics implies Delta >= 0, hence D >= JG >= 0.   w = 1 gives ||P20 q^2||^2 + ||P31 q^2||^2/2 >= 0;
w = exp(-V) at u = 1 is negative on an explicit cubic (ledger section 13, item 11.6).
Prints rho_w(q) = W_w(q) / (w(0) E Re(conj(q)^2 a)) on families, and minimises it over H21(C^2).
usage: t13_weighted_contraction.py [search <spec> <nstarts> <seed>]     spec: peak:<u> | buf:<s2>
"""
import sys, os, math, time
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy import optimize, special
from scipy.interpolate import CubicSpline
from dslib import *

def weight(spec):
    k, v = spec.split(':'); v = float(v)
    if k == 'buf':
        s2 = v
        def w(x):
            x = np.asarray(x, dtype=float) / s2
            out = np.full_like(x, 0.25)
            m = x > 1e-8
            out[m] = special.ive(1, x[m] / 2) / x[m]
            return out * SQPI / (2 * s2 ** 1.5)
        return w, SQPI / (8 * s2 ** 1.5), 1.0
    d = np.load('tab_peak.npz'); J = CubicSpline(d['s'], d['j']); smax = d['s'][-1]
    w0 = -float(J(0.0, 2)) / 2
    def w(x):
        s = np.sqrt(np.asarray(x, dtype=float)); out = np.full_like(s, w0)
        m = (s > 1e-5) & (s < smax)
        out[m] = -J(s[m], 1) / (2 * s[m])
        out[s >= smax] = 0.0
        return out
    return w, w0, v

def rho(g, t, w, w0):
    V, c1, c2, rhoV = stein_fields(t, g.Y)
    return g.E(w(V) * rhoV) / (w0 * g.E(rhoV)), g.E(rhoV)

if __name__ == '__main__':
    if len(sys.argv) > 1 and sys.argv[1] == 'search':
        spec = sys.argv[2]; nst = int(sys.argv[3]); seed = int(sys.argv[4])
        w, w0, u = weight(spec); gc = Grid(2, PANELS_COARSE, 6, 16); gf = Grid(2, PANELS_FINE, 8, 48)
        rng = np.random.default_rng(seed)
        obj = lambda p: rho(gc, normalise(tensor_from_params(p, 2), u), w, w0)[0]
        for k in range(nst):
            t1 = time.time()
            r = optimize.minimize(obj, rng.standard_normal(16), method='BFGS', options=dict(maxiter=100, gtol=1e-6))
            r2 = optimize.minimize(obj, r.x, method='Nelder-Mead', options=dict(maxiter=1000, xatol=1e-6, fatol=1e-10))
            tt = normalise(tensor_from_params(r2.x, 2), u); v, ea = rho(gf, tt, w, w0); m = moments(gf, tt)
            print(f'{spec} start {k}: coarse min rho = {r2.fun:+.5f}; fine rho = {v:+.5f}  E Re(q^2bar a)/u^2 = {ea/u**2:.4f} chi = {m["delta"]/u**2:.2f} ({time.time()-t1:.0f}s)', flush=True)
        sys.exit()
    g = Grid(2, PANELS_FINE, 8, 48)
    cases = [('Wick monomial', t_monomial(2)), ('H(X)+H(Y)', t_sum_monomials(2)), ('item-5 cubic', t_item5(1j)), ('11.6 cubic', t_item5(1.2j)),
             ('X(|Y|^2-1)', t_item5(1e6)), ('X(|X|^2+|Y|^2-3)', t_item5(1.0)), ('cyclic n=2', t_cyclic(2))]
    rng = np.random.default_rng(5)
    for i in range(5): cases.append((f'random #{i}', random_tensor(2, rng)))
    for spec in ['buf:0.03', 'buf:0.1', 'buf:0.3', 'buf:1', 'buf:4', 'peak:0.0463', 'peak:0.02', 'peak:0.2', 'peak:1']:
        w, w0, u = weight(spec)
        line = f'{spec:12s} rho_w: '
        for name, t in cases:
            line += f'{name}: {rho(g, normalise(t, u), w, w0)[0]:+.3f} | '
        print(line, flush=True)
