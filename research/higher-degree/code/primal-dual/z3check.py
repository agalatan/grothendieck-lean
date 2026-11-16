# Verify Z3 = (z, z2, z3) responses on finer grids: search on a coarse grid, then score the explicit pair on finer
# grids (fixed pair = valid model payoff, no sup bias) and re-converge there.  [N]
import sys, json, numpy as np, time
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
from gm import *
from richer import build
K = int(sys.argv[1]); lam = json.loads(sys.argv[2]); seed = int(sys.argv[3]); out = sys.argv[4]
M = build(['Z2', 'Z3'], K, 24, 16); rng = np.random.default_rng(seed)
sc = [0.3, 1.0, 3.0][seed % 3]
c0 = sc * (rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb)); c0[0] += 2
t0 = time.time(); r = alternate(M, lam, c0, iters=600, tol=1e-11)
rec = dict(seed=seed, coarse=r['value'], c=list(r['c']))
print(json.dumps(rec), flush=True)
cf, cg = r['cf'], r['cg']
for (n1, n2) in [(32, 24), (40, 32), (48, 40)]:
    try:
        Mf = build(['Z2', 'Z3'], K, n1, n2)
        fh, gh, c = eval_pair(Mf, cf, cg); pay = float(np.dot(lam, c))
        rr = alternate(Mf, lam, cf, iters=150, tol=1e-11)
        rec[f'{n1}x{n2}'] = dict(fixed_pair=pay, reconverged=rr['value'], c=list(rr['c']))
        cf, cg = rr['cf'], rr['cg']
        print(json.dumps(dict(seed=seed, grid=[n1, n2], fixed_pair=pay, reconverged=rr['value'], t=round(time.time() - t0))), flush=True)
    except MemoryError:
        break
    json.dump(rec, open(out, 'w'), indent=1, default=float)
