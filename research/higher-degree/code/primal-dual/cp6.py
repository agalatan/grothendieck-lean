# Cutting plane over identity-tail games (lam_1..lam_K, nu) with parallel oracles [N].
# Pool rows: (c_0..c_K, t) with t = Re E[conj f g] - sum_{k<=K} c_k; payoff = sum lam_k c_k + nu t.
# Usage: python cp6.py K out.json 'lam0' nu0 workers iters 'oracles'
import sys, json, time, numpy as np, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from concurrent.futures import ProcessPoolExecutor
from scipy.optimize import linprog
from gm import phase_coeffs
from gm2 import SPECS
from gm3 import alternate_tail, score_tail_pair, best_rho_tail
from attack import grid_vars

ORACLES = {
    'W3': dict(spec='W3', search=(48, 48, 32), fine=(96, 96, 64), polish=True, nrand=2),
    'Z2': dict(spec='Z2', search=(48, 48, 32), fine=(96, 96, 64), polish=True, nrand=2),
    'Z3': dict(spec='Z3', search=(16, 16, 12), fine=(40, 40, 32), polish=False, nrand=3),
    'W3W5': dict(spec='W3W5', search=(24, 16, 12), fine=(64, 48, 32), polish=False, nrand=1),
}
_cache = {}
def model(spec, K, g):
    key = (spec, K, g)
    if key not in _cache: _cache[key] = grid_vars(SPECS[spec], K, *g)
    return _cache[key]

def task(args):
    name, K, lam, nu, c0, seed = args; o = ORACLES[name]
    M = model(o['spec'], K, o['search']); rng = np.random.default_rng(seed)
    if c0 is None:
        c0 = rng.choice([0.5, 1.0, 2.0]) * (rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb)); c0[0] += 2
    r = alternate_tail(M, lam, nu, np.asarray(c0, complex), iters=400, tol=1e-11)
    Mf = model(o['spec'], K, o['fine'])
    if o['polish']:
        r = alternate_tail(Mf, lam, nu, r['a_g'], iters=200, tol=1e-12); c, t = r['c'], r['tail']
    else:
        c, t, _ = score_tail_pair(Mf, lam, nu, r['a_f'], r['a_g'], chunk=max(1, Mf.vars[0].n // 16))
    v = float(np.dot(lam, c) + nu * t)
    return name, v, [float(x) for x in c] + [float(t)], r['a_g']

def lp(pool, K, center=None, delta=None):
    C = np.array(pool)                                   # columns: c_0..c_K, t
    A = np.hstack([C[:, 1:K + 1], C[:, K + 1:K + 2], -np.ones((len(C), 1))]); b = -C[:, 0]
    cost = np.zeros(K + 2); cost[-1] = 1
    bounds = []
    for j in range(K + 1):
        lo, hi = -1.0, 1.0
        if center is not None: lo, hi = max(lo, center[j] - delta), min(hi, center[j] + delta)
        bounds.append((lo, hi))
    bounds.append((None, None))
    r = linprog(cost, A_ub=A, b_ub=b, bounds=bounds, method='highs')
    return r.fun, np.concatenate([[1.0], r.x[:K]]), float(r.x[K]), -r.ineqlin.marginals

def main():
    K = int(sys.argv[1]); out = sys.argv[2]; lam0 = json.loads(sys.argv[3]); nu0 = float(sys.argv[4])
    W = int(sys.argv[5]); iters = int(sys.argv[6]); names = sys.argv[7].split(',')
    h = phase_coeffs(K); pool = [list(h) + [1.0 - h.sum()]]; tags = ['P']; rhos = []; warm = {n: [] for n in names}
    center = np.array(lam0[1:] + [nu0], float); lam, nu = np.array(lam0, float), nu0
    delta = 0.04; Ubest = 9; best = None; log = []; ex = ProcessPoolExecutor(W); t0 = time.time(); seedc = 0
    for it in range(iters):
        jobs = []
        for n in names:
            for w in warm[n][-2:]: jobs.append((n, K, list(lam), nu, w, 0))
            for _ in range(ORACLES[n]['nrand'] + (2 if it == 0 else 0)): seedc += 1; jobs.append((n, K, list(lam), nu, None, 7000 * K + seedc))
        res = list(ex.map(task, jobs)); vals = {}; bestw = {}
        for n, v, row, ag in res:
            pool.append(row); tags.append(n)
            if v > vals.get(n, -9): vals[n] = v; bestw[n] = ag
        for n in names: warm[n].append(bestw[n])
        rho, vr, comp, tr = best_rho_tail(lam, nu, warm=rhos[-6:], starts=20, seed=it)
        rhos.append(rho); pool.append(list(comp) + [tr]); tags.append('rho'); vals['rho'] = vr
        vals['P'] = float(np.dot(lam, h) + nu * (1.0 - h.sum()))
        U = max(vals.values()); cur = np.concatenate([lam[1:], [nu]])
        if U < Ubest - 1e-12: Ubest = U; center = cur.copy(); best = dict(lam=list(lam), nu=nu, vals=vals); delta = min(0.08, delta * 1.5)
        else: delta = max(2e-4, delta * 0.5)
        LB = lp(pool, K)[0]
        vt, lam_t, nu_t, _ = lp(pool, K, center, delta)
        for inner in range(30):
            rr, vv, cc, tt = best_rho_tail(lam_t, nu_t, warm=rhos[-6:], starts=8, seed=9000 + 50 * it + inner)
            if vv <= vt + 1e-9: break
            rhos.append(rr); pool.append(list(cc) + [tt]); tags.append('rho'); vt, lam_t, nu_t, _ = lp(pool, K, center, delta)
        rec = dict(it=it, lam=[round(x, 7) for x in lam], nu=round(nu, 7), vals={k: round(v, 9) for k, v in vals.items()}, U=U,
                   Ubest=Ubest, LB=LB, gap=Ubest - LB, delta=delta, t=round(time.time() - t0))
        log.append(rec); print(json.dumps(rec), flush=True)
        LBg, lamg, nug, mu = lp(pool, K)
        supp = [(tags[i], float(mu[i]), [float(x) for x in pool[i]]) for i in np.argsort(-mu)[:12] if mu[i] > 1e-9]
        json.dump(dict(K=K, oracles=names, best=best, Ubest=Ubest, LB=LBg, lam_LP=list(lamg), nu_LP=nug, mixture=supp, log=log,
                       rhos=[list(map(float, r)) for r in rhos[-6:]]), open(out, 'w'), indent=1)
        if Ubest - LB < 1e-6: break
        lam, nu = np.array(lam_t), float(nu_t)

if __name__ == '__main__':
    main()
