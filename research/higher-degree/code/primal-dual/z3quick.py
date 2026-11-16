# Quick Z3 artefact test [N]: search on a small grid, then score the SAME explicit pair (no re-optimisation) on finer
# grids and print at once.  A real branch keeps its payoff; a quadrature artefact loses it under refinement.
import sys, json, numpy as np, time
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
from gm import *
from richer import build
K = int(sys.argv[1]); lam = json.loads(sys.argv[2]); seed = int(sys.argv[3])
t0 = time.time(); M = build(['Z2', 'Z3'], K, 20, 12); rng = np.random.default_rng(seed)
c0 = (rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb)); c0[0] += 2
r = alternate(M, lam, c0, iters=300, tol=1e-10)
print(json.dumps(dict(seed=seed, grid=[20, 12], search_value=r['value'], c=[round(x, 6) for x in r['c']], t=round(time.time() - t0))), flush=True)
np.save(f'z3q_K{K}_s{seed}.npy', np.array([r['cf'], r['cg']]))
for (n1, n2) in [(24, 16), (32, 24), (40, 32), (48, 40)]:
    Mf = build(['Z2', 'Z3'], K, n1, n2); fh, gh, c = eval_pair(Mf, r['cf'], r['cg'])
    print(json.dumps(dict(seed=seed, grid=[n1, n2], fixed_pair_payoff=float(np.dot(lam, c)), c=[round(x, 6) for x in c], t=round(time.time() - t0))), flush=True)
