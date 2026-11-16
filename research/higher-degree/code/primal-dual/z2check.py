import sys, json, numpy as np, time
sys.path.insert(0, '.')
from gm import *
from richer import build, sectors
K = 2; lam = [1, -0.848926, 0.281576]
best = None
M = build(['Z2'], K, 48, 32)
rng = np.random.default_rng(1)
for s in range(24):
    sc = [0.3, 1.0, 3.0][s % 3]
    c0 = sc * (rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb)); c0[0] += 2
    r = alternate(M, lam, c0, iters=2000, tol=1e-13)
    if best is None or r['value'] > best['value']: best = r
print('48x32 best', best['value'], flush=True)
print('sectors f', sectors(M, best['fhat'])); print('sectors g', sectors(M, best['ghat']))
print('c', best['c'])
cf = best['cf']; cg = best['cg']
for i,(b, a, g) in enumerate(zip(M.basis, cf, cg)):
    if abs(a) > 1e-3 * abs(cf).max() or abs(g) > 1e-3*abs(cg).max(): print('  ', b, np.round(a/cf[0], 4), np.round(g/cg[0], 4))
for (n1, n2) in [(64, 48), (96, 64), (128, 96)]:
    t0 = time.time(); M2 = build(['Z2'], K, n1, n2)
    fh, gh, c = eval_pair(M2, cf, cg)
    r = alternate(M2, lam, cf, iters=3000, tol=1e-14)
    print(f'grid {n1}x{n2}: fixed pair payoff {np.dot(lam, c):.9f}; re-converged {r["value"]:.9f}  t={time.time()-t0:.0f}s', flush=True)
    Mw = build(['W3'], K, n1, n2); rw = None
    for s in range(3):
        c0 = rng.normal(size=Mw.nb) + 1j * rng.normal(size=Mw.nb); c0[0] += 2
        r2 = alternate(Mw, lam, c0, iters=3000, tol=1e-14)
        if rw is None or r2['value'] > rw['value']: rw = r2
    print(f'          W3 on same grid {rw["value"]:.9f}', flush=True)
