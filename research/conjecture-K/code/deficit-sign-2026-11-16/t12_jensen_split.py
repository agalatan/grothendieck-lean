"""The 'Jensen split'  D = JG + Delta  (label N):
   JG    = B_phi(u) - E B_phi(c2)      >= 0 always (Jensen; c2 = |dbar q|^2, E c2 = u)
   Delta = E B_phi(c2) - E phi(V)      = E phi(|q~|^2) - E phi(|q|^2),  q~ = <w, dbar q(y)> the decoupled Gaussian-mixture surrogate.
Delta >= 0 is the 'decoupling inequality with constant one' for the profile phi.  It is false for phi = sqrt (Wick monomial).
usage: t12_jensen_split.py [search <profile> <nstarts> <seed> | table <profile> ...]
"""
import sys, os, math, time, json
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy import optimize
from scipy.interpolate import CubicSpline
from dslib import *

class BenchB:
    """b(s) = E phi(s tau) as a spline in sqrt(s)."""
    def __init__(self, prof, smax=None):
        gx, gw = np.polynomial.laguerre.laggauss(120)
        rt = np.concatenate([np.linspace(0, 1, 201)[:-1], np.linspace(1, 8, 281)[:-1], np.linspace(8, 70, 250)]) * math.sqrt(prof.u)
        b = np.array([np.sum(gw * prof.phi(x * x * gx)) for x in rt])
        self.cs = CubicSpline(rt, b); self.rmax = rt[-1]
    def __call__(self, s):
        return self.cs(np.minimum(np.sqrt(s), self.rmax))

def jsplit(g, t, prof, bench):
    V, c1, c2, rhoV = stein_fields(t, g.Y)
    Ephi = g.E(prof.phi(V)); Eb = g.E(bench(c2))
    D = prof.B - Ephi
    return dict(D=D, JG=prof.B - Eb, Delta=Eb - Ephi, T2=g.E(rhoV * prof.gp(V)))

def make_prof(spec):
    if spec == 'sqrt': return SqrtProfile(1.0)
    k, v = spec.split(':')
    return peak_profile(float(v)) if k == 'peak' else buffer_profile(float(v))

if __name__ == '__main__':
    if len(sys.argv) > 1 and sys.argv[1] == 'search':
        prof = make_prof(sys.argv[2]); nst = int(sys.argv[3]); seed = int(sys.argv[4])
        bench = BenchB(prof); gc = Grid(2, PANELS_COARSE, 6, 16); gf = Grid(2, PANELS_FINE, 8, 48)
        rng = np.random.default_rng(seed)
        def obj(p):
            r = jsplit(gc, normalise(tensor_from_params(p, 2), prof.u), prof, bench); return r['Delta'] / r['D']
        for k in range(nst):
            t1 = time.time()
            r = optimize.minimize(obj, rng.standard_normal(16), method='BFGS', options=dict(maxiter=100, gtol=1e-6))
            r2 = optimize.minimize(obj, r.x, method='Nelder-Mead', options=dict(maxiter=1000, xatol=1e-6, fatol=1e-10))
            tt = normalise(tensor_from_params(r2.x, 2), prof.u); f = jsplit(gf, tt, prof, bench); m = moments(gf, tt)
            print(f"start {k}: coarse min Delta/D = {r2.fun:+.5f}; fine: D={f['D']:.5e} JG/D={f['JG']/f['D']:+.4f} Delta/D={f['Delta']/f['D']:+.5f} T2/D={f['T2']/f['D']:+.4f} chi={m['delta']/prof.u**2:.2f} ({time.time()-t1:.0f}s)", flush=True)
        sys.exit()
    g = Grid(2, PANELS_FINE, 8, 48)
    cases = [('Wick monomial', t_monomial(2)), ('X^2 conj(Y)', t_z0sq_z1bar()), ('H(X)+H(Y)', t_sum_monomials(2)), ('item-5 cubic', t_item5(1j)),
             ('X(|Y|^2-1)', t_item5(1e6)), ('X(|X|^2+|Y|^2-3)', t_item5(1.0)), ('cyclic n=2', t_cyclic(2))]
    rng = np.random.default_rng(5)
    for i in range(6): cases.append((f'random #{i}', random_tensor(2, rng)))
    specs = sys.argv[2:] if sys.argv[1:2] == ['table'] else ['sqrt', 'buf:0.03', 'buf:0.1', 'buf:0.3', 'buf:1', 'buf:4', 'peak:0.0463', 'peak:0.02', 'peak:0.2']
    for spec in specs:
        prof = make_prof(spec); bench = BenchB(prof)
        print(f'--- profile {prof.name} (u = {prof.u}): JG/D, Delta/D')
        line = ''
        for name, t in cases:
            r = jsplit(g, normalise(t, prof.u), prof, bench)
            line += f"{name}: {r['JG']/r['D']:+.3f}, {r['Delta']/r['D']:+.3f} | "
        print('   ' + line, flush=True)
