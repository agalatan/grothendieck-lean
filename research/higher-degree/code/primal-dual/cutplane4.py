# Cutting-plane (Kelley + trust region) minimisation of the model norm N(lam) over games of degree 2K+1. [N]
# Oracles: best response in each listed graded model (warm + random starts), exact preprocessed-phase h o rho,
# plain phase.  Pool LP value = rigorous-in-the-model lower bound on min_lam N_model; best oracle value at the
# centre = upper estimate.  Usage: python cutplane.py K out.json [models] [grid] [iters]
import sys, json, time, numpy as np
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
from gm import *
from scipy.optimize import linprog

def make_model(spec, K, n1, n2):
    vs = [Var('z', (1, 0), n1=n1)]
    for kind, a, b in spec:
        vs.append(Var(kind, (a, b), n1=(n1 if kind != 'r' else 24), n2=n2))
    return Model(vs, K)

MODELS = {'W3': [('c', 2, 1)], 'Z2': [('c', 1, 0)], 'W5': [('c', 3, 2)], 'Y': [('r', 1, 1)], 'B': [('c', 2, 0)],
          'X11': [('c', 1, 1)], 'W7': [('c', 4, 3)]}

def lp(pool, K, center=None, delta=None):
    C = np.array([c[:K + 1] for c in pool])            # (R, K+1)
    nv = K + 1                                          # lam_1..K, v
    cost = np.zeros(nv); cost[-1] = 1
    Aub = np.hstack([C[:, 1:], -np.ones((len(C), 1))]); bub = -C[:, 0]
    bounds = []
    for k in range(K):
        lo, hi = -1.0, 1.0
        if center is not None:
            lo, hi = max(lo, center[k] - delta), min(hi, center[k] + delta)
        bounds.append((lo, hi))
    bounds.append((None, None))
    r = linprog(cost, A_ub=Aub, b_ub=bub, bounds=bounds, method='highs')
    mu = -r.ineqlin.marginals if r.status == 0 else None
    return r.fun, np.concatenate([[1.0], r.x[:K]]), mu

def main():
    K = int(sys.argv[1]); out = sys.argv[2]
    names = sys.argv[3].split(',') if len(sys.argv) > 3 else ['W3', 'Z2']
    n1, n2 = (int(x) for x in (sys.argv[4] if len(sys.argv) > 4 else '48,32').split(','))
    iters = int(sys.argv[5]) if len(sys.argv) > 5 else 40
    lam0 = {1: [1, -0.7564], 2: [1, -0.848926, 0.281576], 3: [1, -0.906596, 0.541570, -0.242531],
            4: [1, -0.9570388, 0.8543036, -0.8619060, 0.4248863], 5: [1, -0.97, 0.9, -0.9, 0.7, -0.3]}.get(K)
    if len(sys.argv) > 6 and sys.argv[6] != '-': lam0 = json.loads(sys.argv[6])
    f1, f2 = (int(x) for x in (sys.argv[7] if len(sys.argv) > 7 else '96,64').split(','))
    models = {nm: make_model(MODELS[nm], K, n1, n2) for nm in names}
    fines = {nm: make_model(MODELS[nm], K, f1, f2) for nm in names}
    rng = np.random.default_rng(K)
    pool = [phase_coeffs(K)]; tags = ['P']
    warm = {nm: [] for nm in names}; rhos = []
    center = np.array(lam0, float); delta = 0.08; Ubest = 9; best_info = None; log = []
    t0 = time.time()
    for it in range(iters):
        lam = center if it == 0 else lam_t
        vals = {}
        for nm, M in models.items():
            starts = [w for w in warm[nm][-3:]]
            for _ in range(2 if it > 0 else 6):
                c0 = rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb); c0[0] += 2.0; starts.append(c0)
            best = None; MF = fines[nm]
            for c0 in starts:
                res = alternate(M, lam, c0, iters=800, tol=1e-12)
                res = alternate(MF, lam, res['cf'], iters=250, tol=1e-12)     # polish and score on the fine grid
                pool.append(res['c']); tags.append(nm)
                if best is None or res['value'] > best['value']: best = res
            warm[nm].append(best['cf']); vals[nm] = best['value']
        rho, vr, cr = best_rho2(lam, warm=rhos[-6:], starts=30, seed=it); rhos.append(rho); pool.append(cr); tags.append('rho'); vals['rho'] = vr
        vals['P'] = float(np.dot(lam, phase_coeffs(K)))
        U = max(vals.values())
        if U < Ubest - 1e-12:
            Ubest = U; center = np.array(lam); best_info = dict(lam=list(lam), vals=vals); delta = min(0.15, delta * 1.5)
        else:
            delta = max(1e-4, delta * 0.5)
        LB, lam_glob, mu = lp(pool, K)
        vt, lam_t, _ = lp(pool, K, center[1:], delta)
        for inner in range(40):                    # saturate the cheap exact cuts (h o rho) first
            rr, vv, cc = best_rho2(lam_t, warm=rhos[-6:], starts=12, seed=1000 + it * 50 + inner)
            if vv <= vt + 1e-9: break
            rhos.append(rr); pool.append(cc); tags.append('rho')
            vt, lam_t, _ = lp(pool, K, center[1:], delta)
        rec = dict(it=it, lam=[round(x, 7) for x in lam], U=U, vals={k: round(v, 9) for k, v in vals.items()},
                   Ubest=Ubest, LB=LB, gap=Ubest - LB, delta=delta, t=round(time.time() - t0))
        log.append(rec); print(json.dumps(rec), flush=True)
        if Ubest - LB < 2e-7: break
    LB, lam_glob, mu = lp(pool, K)
    supp = [(tags[i], float(mu[i]), [float(x) for x in pool[i]]) for i in np.argsort(-mu)[:12] if mu[i] > 1e-9]
    json.dump(dict(K=K, rhos=[list(map(float, r)) for r in rhos[-5:]], models=names, grid=[n1, n2], best=best_info, Ubest=Ubest, LB=LB, lam_LP=list(lam_glob),
                   mixture=supp, log=log, pool=[[float(x) for x in p] for p in pool], tags=tags,
                   warm={nm: [[(float(z.real), float(z.imag)) for z in w] for w in warm[nm][-2:]] for nm in names}),
              open(out, 'w'), indent=1)

if __name__ == '__main__':
    main()
