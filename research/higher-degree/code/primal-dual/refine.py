# Grid refinement of W3 (and Z2) model norms for fixed games; Richardson extrapolation with error ~ n^-2. [N]
import sys, json, numpy as np, time
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
from gm import *
from richer import build
games = json.loads(sys.argv[1]); model = sys.argv[2] if len(sys.argv) > 2 else 'W3'
grids = [(96, 64), (128, 96), (160, 128)]
for lam in games:
    K = len(lam) - 1; rng = np.random.default_rng(5); out = []; warm = []
    for (n1, n2) in grids:
        t0 = time.time(); M = build([model], K, n1, n2); best = None
        starts = warm + [None] * (6 if not warm else 1)
        for c0 in starts:
            if c0 is None:
                c0 = rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb); c0[0] += 2
            r = alternate(M, lam, c0, iters=4000, tol=1e-14)
            if best is None or r['value'] > best['value']: best = r
        # keep the two best distinct branches as warm starts
        warm = [best['cf']]
        out.append(best['value'])
        print(json.dumps(dict(model=model, K=K, grid=[n1, n2], value=best['value'], t=round(time.time() - t0))), flush=True)
    n = np.array([g[0] for g in grids], float)
    rich = (n[2] ** 2 * out[2] - n[1] ** 2 * out[1]) / (n[2] ** 2 - n[1] ** 2)
    print(json.dumps(dict(model=model, K=K, lam=lam, values=out, richardson=rich, inv=1 / rich)), flush=True)
