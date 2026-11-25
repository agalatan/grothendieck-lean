#!/usr/bin/env python3
"""Model value of the games (1, -eps, lam_2, ..., lam_K) of degree 2K+1 (K = 2: degree 5; KDEG=3: degree 7), without and with an
identity tail nu, as a function of the cubic weight eps  [N].
For each eps of the list and each of the two problems (nu = 0; nu free) a Kelley cutting plane over (lam_2..lam_K) or (lam_2..lam_K, nu):
    minimise over the game   max over the pool of explicit unimodular pairs of   c_0 - eps c_1 + sum_{k>=2} lam_k c_k + nu t,
where c_k are the pair's bidegree coefficients and t = Re E[conj(f) g] - sum_{k<=K} c_k (the pointwise identity tail).
ONE pool serves every problem (a pair is a pair, whatever game it was found against).  Oracles, at the LP optimum of every problem:
the graded models W3 (one remote cubic) and Z2 (one more coordinate) of ../../primal-dual/ by alternating best responses (search grid
48x48x32, polished and scored on 96x96x64), the exact preprocessed phase h o rho, and the plain phase.
What the two numbers of a problem mean:
  LB = the LP value over the pool: every game of that problem has model norm >= LB, so within the oracle families (and up to the
       quadrature error of the pair coefficients, about 1e-6) NO game of the problem certifies more than 1/LB;
  U  = the largest oracle value at the best game visited: a lower estimate of that game's norm from a local best-response search,
       so 1/U is an upper estimate of what THAT game certifies.  Neither is a certified bound; richer responses can only raise them.
usage: eps_profile.py OUT.json WORKERS ITERS "eps,eps,...|free"     (needs numpy, scipy and the folder ../../primal-dual)"""
import sys, os, json, time, numpy as np
HERE = os.path.dirname(os.path.abspath(__file__)); sys.path.insert(0, os.environ.get('PD_DIR', os.path.join(HERE, '..', '..', 'primal-dual')))
from concurrent.futures import ProcessPoolExecutor
from scipy.optimize import linprog
from gm import phase_coeffs
from gm2 import SPECS
from gm3 import alternate_tail, best_rho_tail
from attack import grid_vars
K = int(os.environ.get('KDEG', 2)); GRID = dict(W3=((48, 48, 32), (96, 96, 64)), Z2=((48, 48, 32), (96, 96, 64))); _cache = {}
def model(spec, g):
    if (spec, g) not in _cache: _cache[(spec, g)] = grid_vars(SPECS[spec], K, *g)
    return _cache[(spec, g)]
def task(a):
    name, lam, nu, c0, seed = a; M = model(name, GRID[name][0]); rng = np.random.default_rng(seed)
    if c0 is None:
        c0 = rng.choice([0.5, 1.0, 2.0]) * (rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb)); c0[0] += 2
    r = alternate_tail(M, lam, nu, np.asarray(c0, complex), iters=400, tol=1e-11)
    r = alternate_tail(model(name, GRID[name][1]), lam, nu, r['a_g'], iters=200, tol=1e-12)
    return name, float(np.dot(lam, r['c']) + nu * r['tail']), [float(x) for x in r['c']] + [float(r['tail'])], r['a_g']
def lp(pool, eps, tail, center=None, delta=None):
    C = np.array(pool); A = np.hstack([C[:, 1:K + 2], -np.ones((len(C), 1))]); b = -C[:, 0]
    bnd = [(-eps, -eps) if eps is not None else (-1, 0)] + [(-1, 1)] * (K - 1) + [(-0.2, 0.2) if tail else (0, 0), (None, None)]
    if center is not None:
        for j in range(K + 1):
            if bnd[j][0] != bnd[j][1]: bnd[j] = (max(bnd[j][0], center[j] - delta), min(bnd[j][1], center[j] + delta))
    r = linprog([0] * (K + 1) + [1], A_ub=A, b_ub=b, bounds=bnd, method='highs')
    return r.fun, r.x[:K + 1]
def start(e):
    ee = (0.85 if K == 2 else 0.9) if e == 'free' else float(e)
    if K == 2: return np.array([-ee, max(0.0, 2.9 * (ee - 0.752)), 0.0])
    return np.array([-ee] + [0.54, -0.24, 0.0, 0.0][:K - 1] + [0.0])
def main():
    out, W, iters = sys.argv[1], int(sys.argv[2]), int(sys.argv[3])
    probs = [dict(eps=(None if e == 'free' else float(e)), tail=tl, x=start(e),
                  U=9.0, best=None, delta=0.05, warm={'W3': [], 'Z2': []}, rhos=[], log=[]) for e in sys.argv[4].split(',') for tl in (False, True)]
    h = phase_coeffs(K); pool = [list(h) + [1.0 - h.sum()]]; tags = ['P']; ex = ProcessPoolExecutor(W); t0 = time.time(); seed = 0
    for it in range(iters):
        jobs = []; owner = []
        for i, p in enumerate(probs):
            if p.get('done'): continue
            lam = [1.0] + [float(v) for v in p['x'][:K]]; nu = float(p['x'][K])
            for n in (('W3', 'Z2') if it % 3 == 0 else ('W3',)):
                for w in p['warm'][n][-1:]: jobs.append((n, lam, nu, w, 0)); owner.append(i)
                for _ in range(2 if it == 0 else (1 if n == 'W3' and it % 2 == 0 else 0)): seed += 1; jobs.append((n, lam, nu, None, 31000 + seed)); owner.append(i)
        res = list(ex.map(task, jobs)); vals = [dict() for _ in probs]; bw = [dict() for _ in probs]
        for i, (n, v, row, ag) in zip(owner, res):
            pool.append(row); tags.append(n)
            if v > vals[i].get(n, -9): vals[i][n] = v; bw[i][n] = ag
        for i, p in enumerate(probs):
            if p.get('done'): continue
            lam = np.array([1.0] + [float(v) for v in p['x'][:K]]); nu = float(p['x'][K])
            for n in bw[i]: p['warm'][n].append(bw[i][n])
            rho, vr, comp, tr = best_rho_tail(lam, nu, warm=p['rhos'][-4:], starts=12, seed=it); p['rhos'].append(rho); pool.append(list(comp) + [tr]); tags.append('rho')
            vals[i]['rho'] = vr; vals[i]['P'] = float(np.dot(lam, h) + nu * (1.0 - h.sum()))
        for i, p in enumerate(probs):
            if p.get('done'): continue
            # every pair of the pool scores against this game: the game's value is at least the pool maximum as well
            x = p['x']; C = np.array(pool); pv = float((C[:, 0] + C[:, 1:K + 2] @ x).max()); U = max(max(vals[i].values()), pv)
            if U < p['U'] - 1e-12: p['U'] = U; p['best'] = dict(lam=[1.0] + [float(v) for v in x[:K]], nu=float(x[K]), vals=vals[i], pool_max=pv); p['center'] = x.copy(); p['delta'] = min(0.08, p['delta'] * 1.5)
            else: p['delta'] = max(2e-4, p['delta'] * 0.5)
            LB, _ = lp(pool, p['eps'], p['tail']); _, xt = lp(pool, p['eps'], p['tail'], p['center'], p['delta'])
            p['LB'] = LB; p['log'].append(dict(it=it, x=[float(v) for v in x], U=U, Ubest=p['U'], LB=LB, gap=p['U'] - LB, vals={k: round(v, 9) for k, v in vals[i].items()}))
            if p['U'] - LB < float(os.environ.get('GAP', 1e-6)): p['done'] = True
            else: p['x'] = xt
        C = np.array(pool)
        for p in probs:                       # the pool has grown: refresh the LP value of the finished problems too
            p['LB'] = lp(pool, p['eps'], p['tail'])[0]
        rec = [dict(eps=p['eps'], tail=p['tail'], best=p['best'], U=p['U'], LB=p['LB'], gap=p['U'] - p['LB'], K_of_U=1 / p['U'], K_of_LB=1 / p['LB'], done=bool(p.get('done')), log=p['log']) for p in probs]
        json.dump(dict(iters=it + 1, secs=round(time.time() - t0), pool_size=len(pool), problems=rec, pool=[[tg] + [float(v) for v in r] for tg, r in zip(tags, pool)]), open(out, 'w'), indent=0)
        print('it %d  %ds  pool %d  open %d  max gap %.2e' % (it, time.time() - t0, len(pool), sum(1 for p in probs if not p.get('done')), max(p['U'] - p['LB'] for p in probs)), flush=True)
        if all(p.get('done') for p in probs): break
if __name__ == '__main__':
    main()
