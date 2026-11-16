"""Adversarial searches in three variables at the peak row (label N): minimise Delta/D (Jensen split), T2/D (Theorem 5) or rho_w (weighted contraction).
usage: t15_search_n3_peak.py <Delta|T2|rho> <u> <nstarts> <seed>"""
import sys, os, math, time, json
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy import optimize
from dslib import *
from dsn import ChunkGrid
from t05_hessian_n3 import onb
from t12_jensen_split import BenchB
from t13_weighted_contraction import weight

def run(g, t, prof, bench, w, w0):
    M = g.subW.size; acc = np.zeros(6)
    for r1, w1 in zip(g.r, g.wr):
        Y = np.concatenate([np.full((M, 1), math.sqrt(r1), dtype=complex), g.subY], axis=1); W = w1 * g.subW
        V, c1, c2, rhoV = stein_fields(t, Y)
        acc += [np.sum(W * prof.phi(V)), np.sum(W * bench(c2)), np.sum(W * rhoV * prof.gp(V)), np.sum(W * w(V) * rhoV), np.sum(W * rhoV), np.sum(W * V * V)]
    D = prof.B - acc[0]
    return dict(D=D, Delta=(acc[1] - acc[0]) / D, T2=acc[2] / D, rho=acc[3] / (w0 * acc[4]), chi=acc[5] / prof.u ** 2 - 2)

if __name__ == '__main__':
    target = sys.argv[1]; u = float(sys.argv[2]); nst = int(sys.argv[3]); seed = int(sys.argv[4])
    prof = peak_profile(u); bench = BenchB(prof); w, w0, _ = weight(f'peak:{u}')
    gc = ChunkGrid(3, [0, 1, 2.5, 5, 9, 15, 26], 3, 8); gf = ChunkGrid(3, [0, .5, 1, 2, 3, 5, 8, 12, 18, 28], 4, 12)
    B = onb(3); rng = np.random.default_rng(seed)
    def ten(p): return normalise(sum((p[i] + 1j * p[18 + i]) * B[i] for i in range(18)), u)
    obj = lambda p: run(gc, ten(p), prof, bench, w, w0)[target]
    print('grid', gc.size, gf.size, flush=True)
    for k in range(nst):
        t1 = time.time()
        r = optimize.minimize(obj, rng.standard_normal(36), method='BFGS', options=dict(maxiter=45, gtol=1e-5))
        r2 = optimize.minimize(obj, r.x, method='Nelder-Mead', options=dict(maxiter=600, xatol=1e-5, fatol=1e-9, adaptive=True))
        f = run(gf, ten(r2.x), prof, bench, w, w0)
        print(f"{target} start {k}: coarse min {r2.fun:+.5f}; fine: D={f['D']:.5e} Delta/D={f['Delta']:+.5f} T2/D={f['T2']:+.5f} rho_w={f['rho']:+.5f} chi={f['chi']:.2f} ({time.time()-t1:.0f}s)", flush=True)
        json.dump(dict(p=list(map(float, r2.x)), fine=f), open(f'search_n3_peak_{target}_{seed}_{k}.json', 'w'))
