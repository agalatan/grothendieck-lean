# Cutting-plane game search with parallel oracles [N].
#   3-D oracles (W3, Z2, W5): coarse search, then polished and scored on a fine grid.
#   5-D oracles (Z3, W3W5): coarse search, then the explicit pair is scored on a finer grid (no re-optimisation).
#   Exact oracles: preprocessed phase h o rho (inner loop until saturated) and the plain phase.
# Usage: python cp5.py K out.json 'lam0' workers iters 'oracle list'
import sys, json, time, numpy as np, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from concurrent.futures import ProcessPoolExecutor
from scipy.optimize import linprog
from gm import best_rho2, phase_coeffs
from gm2 import *
from attack import grid_vars

ORACLES = {
    'W3': dict(spec='W3', search=(48, 48, 32), fine=(96, 96, 64), polish=True, nrand=2),
    'Z2': dict(spec='Z2', search=(48, 48, 32), fine=(96, 96, 64), polish=True, nrand=2),
    'W5': dict(spec='W5', search=(48, 48, 32), fine=(96, 96, 64), polish=True, nrand=1),
    'Z3': dict(spec='Z3', search=(16, 16, 12), fine=(40, 40, 32), polish=False, nrand=3),
    'W3W5': dict(spec='W3W5', search=(24, 16, 12), fine=(64, 48, 32), polish=False, nrand=1),
}
_cache = {}
def model(spec, K, g):
    key = (spec, K, g)
    if key not in _cache: _cache[key] = grid_vars(SPECS[spec], K, *g)
    return _cache[key]

def task(args):
    name, K, lam, c0, seed = args; o = ORACLES[name]
    M = model(o['spec'], K, o['search']); rng = np.random.default_rng(seed)
    if c0 is None:
        c0 = (rng.choice([0.5, 1.0, 2.0])) * (rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb)); c0[0] += 2
    r = alternate2(M, lam, np.asarray(c0, complex), iters=400, tol=1e-11)
    Mf = model(o['spec'], K, o['fine'])
    if o['polish']:
        r = alternate2(Mf, lam, r['cf'], iters=200, tol=1e-12); c = r['c']; cf = r['cf']
    else:
        chunk = max(1, Mf.vars[0].n // 16)
        fh = Mf.phase_proj(r['cf'], chunk); gh = Mf.phase_proj(r['cg'], chunk); c = Mf.pair_coeffs(fh, gh); cf = r['cf']
    return name, float(np.dot(lam, c)), [float(x) for x in c], cf

def lp(pool, K, center=None, delta=None):
    C = np.array([c[:K + 1] for c in pool]); nv = K + 1
    cost = np.zeros(nv); cost[-1] = 1
    Aub = np.hstack([C[:, 1:], -np.ones((len(C), 1))]); bub = -C[:, 0]
    bounds = [((max(-1, center[k] - delta), min(1, center[k] + delta)) if center is not None else (-1, 1)) for k in range(K)] + [(None, None)]
    r = linprog(cost, A_ub=Aub, b_ub=bub, bounds=bounds, method='highs')
    return r.fun, np.concatenate([[1.0], r.x[:K]]), -r.ineqlin.marginals

def main():
    K = int(sys.argv[1]); out = sys.argv[2]; lam0 = json.loads(sys.argv[3]); W = int(sys.argv[4]); iters = int(sys.argv[5])
    names = sys.argv[6].split(',')
    pool = [phase_coeffs(K)]; tags = ['P']; rhos = []; warm = {n: [] for n in names}
    center = np.array(lam0 + [0.0] * (K + 1 - len(lam0)), float); delta = 0.05; Ubest = 9; best = None; log = []
    ex = ProcessPoolExecutor(W); t0 = time.time(); lam = center.copy(); seedc = 0
    for it in range(iters):
        jobs = []
        for n in names:
            for w in warm[n][-2:]: jobs.append((n, K, list(lam), w, 0))
            for _ in range(ORACLES[n]['nrand'] + (2 if it == 0 else 0)): seedc += 1; jobs.append((n, K, list(lam), None, 1000 * K + seedc))
        res = list(ex.map(task, jobs))
        vals = {}; bestcf = {}
        for n, v, c, cf in res:
            pool.append(np.array(c)); tags.append(n)
            if v > vals.get(n, -9): vals[n] = v; bestcf[n] = cf
        for n in names: warm[n].append(bestcf[n])
        rho, vr, cr = best_rho2(lam, warm=rhos[-6:], starts=20, seed=it); rhos.append(rho); pool.append(cr); tags.append('rho'); vals['rho'] = vr
        vals['P'] = float(np.dot(lam, phase_coeffs(K)))
        U = max(vals.values())
        if U < Ubest - 1e-12: Ubest = U; center = lam.copy(); best = dict(lam=list(lam), vals=vals); delta = min(0.1, delta * 1.5)
        else: delta = max(2e-4, delta * 0.5)
        LB, lam_glob, mu = lp(pool, K)
        vt, lam_t, _ = lp(pool, K, center[1:], delta)
        for inner in range(40):
            rr, vv, cc = best_rho2(lam_t, warm=rhos[-6:], starts=10, seed=5000 + 50 * it + inner)
            if vv <= vt + 1e-9: break
            rhos.append(rr); pool.append(cc); tags.append('rho'); vt, lam_t, _ = lp(pool, K, center[1:], delta)
        rec = dict(it=it, lam=[round(x, 7) for x in lam], vals={k: round(v, 9) for k, v in vals.items()}, U=U, Ubest=Ubest, LB=LB,
                   gap=Ubest - LB, delta=delta, t=round(time.time() - t0))
        log.append(rec); print(json.dumps(rec), flush=True)
        LB, lam_glob, mu = lp(pool, K)
        supp = [(tags[i], float(mu[i]), [float(x) for x in pool[i]]) for i in np.argsort(-mu)[:12] if mu[i] > 1e-9]
        json.dump(dict(K=K, oracles=names, best=best, Ubest=Ubest, LB=LB, lam_LP=list(lam_glob), mixture=supp, log=log,
                       rhos=[list(map(float, r)) for r in rhos[-6:]],
                       warm={n: [[(float(z.real), float(z.imag)) for z in w] for w in warm[n][-2:]] for n in names}),
                  open(out, 'w'), indent=1)
        if Ubest - LB < 1e-6: break
        lam = np.array(lam_t)

if __name__ == '__main__':
    main()
