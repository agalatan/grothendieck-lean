import sys, time, numpy as np
sys.path.insert(0, '.')
from gm import *
for (n1, n2) in [(64, 48), (96, 64)]:
    for K, lam in [(1, [1, -0.7564]), (2, [1, -0.848926, 0.281576]), (3, [1, -0.906596, 0.541570, -0.242531])]:
        t0 = time.time()
        vars = [Var('z', (1, 0), n1=n1), Var('c', (2, 1), n1=n1, n2=n2, name='W')]
        M = Model(vars, K)
        ge = M.gram_err()
        # plain phase check
        e = np.zeros(M.nb, complex); e[[i for i,(k,cmb) in enumerate(M.basis) if cmb==((1,0),(0,0))][0]] = 1
        f = M.evaluate(e); f = f/np.abs(f); fh = M.project(f)
        pc = M.pair_coeffs(fh, fh, K)
        best = None; vals = []
        rng = np.random.default_rng(0)
        for s in range(12):
            c0 = rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb)
            c0[0] += 3
            res = alternate(M, lam, c0, iters=1500, tol=1e-13)
            vals.append(res['value'])
            if best is None or res['value'] > best['value']: best = res
        print(f'grid {n1}x{n1}x{n2} K={K} nb={M.nb} gram_err={ge:.1e} plain={np.dot(lam, pc):.9f} (exact {np.dot(lam, phase_coeffs(K)):.9f}) best={best["value"]:.9f} 1/v={1/best["value"]:.7f} its={best["it"]} spread={np.round(sorted(vals)[-5:],8)} t={time.time()-t0:.1f}s', flush=True)
