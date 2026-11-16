import sys, json, numpy as np, time
sys.path.insert(0, '.')
from gm import *
from richer import build, sectors
games = {2: [1, -0.848926, 0.281576], 3: [1, -0.906596, 0.541570, -0.242531]}
K = int(sys.argv[1]); lam = games[K]
for names in (['W3'], ['Z2'], ['W5'], ['Y'], ['B'], ['X11'], ['B31'], ['A30'], ['Y22'], ['W7']):
    t0 = time.time()
    try:
        M = build(names, K, 48, 32)
    except Exception as e:
        print(names, 'skip', e); continue
    rng = np.random.default_rng(1); vals = []; best = None
    for s in range(10):
        sc = [0.3, 1.0, 3.0][s % 3]
        c0 = sc * (rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb)); c0[0] += 2
        r = alternate(M, lam, c0, iters=1500, tol=1e-13); vals.append(r['value'])
        if best is None or r['value'] > best['value']: best = r
    print(f"K={K} {'+'.join(names):6s} nb={M.nb:3d} best={best['value']:.8f} top={np.round(sorted(vals)[-4:], 8)} t={time.time()-t0:.0f}s", flush=True)
