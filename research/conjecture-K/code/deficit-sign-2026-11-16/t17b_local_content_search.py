"""Search (label N; lower bound on a supremum) for the largest value over H21(C^2) of the projected Cauchy-Schwarz bound of the
local content representation divided by D, peak row, u = 0.0463.  Compare: Theorem 4 of the package reaches 0.229 (raw), 0.048 (tilt).
usage: t17b_local_content_search.py <raw|tilt> <nstarts> <seed>"""
import sys, os, math, json, time
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy import optimize
from scipy.interpolate import CubicSpline
from dslib import *
from t17_local_content import basis, from_twovar

U = 0.0463
d = np.load('tab_peak.npz'); s = d['s']; smax = s[-1]
g0 = float(d['g'][0]); j0 = float(d['j'][0])
def mk(fs):
    def h(v): return fs(np.minimum(np.sqrt(v), smax))
    def hp(v):
        sv = np.sqrt(v); out = np.full_like(sv, float(fs(0.0, 2)) / 2)
        m = (sv > 1e-5) & (sv < smax); out[m] = fs(sv[m], 1) / (2 * sv[m]); out[sv >= smax] = 0.0
        return out
    return h, hp
PROF = {'raw': mk(CubicSpline(s, d['g'])), 'tilt': mk(CubicSpline(s, (d['g'] - g0) - 0.6 * (j0 - d['j'])))}
pk = peak_profile(U)

class Ev:
    def __init__(self, g, nlag):
        self.g = g; self.bas = {pq: basis(g.Y, g.W, *pq) for pq in [(2, 0), (3, 1), (3, 0)]}
        self.lx, self.lw = np.polynomial.laguerre.laggauss(nlag)
    def __call__(self, t, h, hp):
        g = self.g; t = normalise(t, U)
        q, dq, F = cubic_eval(t, g.Y)
        V = np.abs(q) ** 2; c2 = np.sum(np.abs(F) ** 2, axis=1); a = np.sum(dq * F, axis=1)
        DF = 2 * np.einsum('ijk,Ni->Nkj', t, g.Y, optimize=True); Wk = np.einsum('Nkj,Nj->Nk', DF, F)
        kv = np.zeros_like(V); kc = np.zeros_like(V)
        for tau, wt in zip(self.lx, self.lw):
            if wt < 1e-16: continue
            val = hp(V + c2 * tau); kv += wt * val; kc += wt * tau * val
        hv = h(V)
        cv = np.array([np.sum(g.W * np.conj(g.Y[:, j]) * q * hv) for j in range(2)])
        C = np.linalg.norm(cv); e = cv / C; ye = g.Y @ e
        nW2 = np.sum(g.W * np.sum(np.abs(Wk) ** 2, axis=1))
        G1 = ye * q * kv
        p20G = self.bas[(2, 0)] @ G1; p31G = self.bas[(3, 1)] @ G1; p20a = self.bas[(2, 0)] @ a; p31a = self.bas[(3, 1)] @ a
        p30 = [self.bas[(3, 0)] @ (ye * F[:, k] * kc) for k in range(2)]
        proj = (np.linalg.norm(p20G) * np.linalg.norm(p20a) + np.linalg.norm(p31G) * np.linalg.norm(p31a)
                + math.sqrt(sum(np.linalg.norm(x) ** 2 for x in p30)) * math.sqrt(nW2)) ** 2
        D = pk.B - np.sum(g.W * pk.phi(V))
        return proj / D, C ** 2 / D, (np.sum(g.W * V * V) - 2 * U * U) / U ** 2

if __name__ == '__main__':
    lab = sys.argv[1]; nst = int(sys.argv[2]); seed = int(sys.argv[3])
    h, hp = PROF[lab]
    ec = Ev(Grid(2, PANELS_COARSE, 6, 16), 20); ef = Ev(Grid(2, PANELS_FINE, 8, 32), 40)
    rng = np.random.default_rng(seed)
    o1 = json.load(open('../antiholomorphic-stein-2026-11-17/package/results/survey_raw.json'))['results']['0.0463']
    t_o1 = from_twovar(np.array(o1['argmax_re']) + 1j * np.array(o1['argmax_im']))
    obj = lambda p: -ec(tensor_from_params(p, 2), h, hp)[0]
    for k in range(nst):
        t1 = time.time()
        if k == 0: p0 = np.concatenate([t_o1.real.ravel(), t_o1.imag.ravel()])         # start from the O1 cubic
        else: p0 = rng.standard_normal(16)
        r = optimize.minimize(obj, p0, method='Nelder-Mead', options=dict(maxiter=2500, xatol=1e-5, fatol=1e-8, adaptive=True))
        f = ef(tensor_from_params(r.x, 2), h, hp)
        print(f'{lab} start {k}: coarse max {-r.fun:.5f}; fine: projected local bound/D = {f[0]:.5f}, C^2/D = {f[1]:.5f}, chi = {f[2]:.2f} ({time.time()-t1:.0f}s)', flush=True)
        json.dump(dict(p=list(map(float, r.x)), fine=list(map(float, f))), open(f'local_content_{lab}_{seed}_{k}.json', 'w'))
