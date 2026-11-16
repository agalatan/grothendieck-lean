# Generic sub-model -> model attack [N]: optimise the sub-model formed by the first m remote variables (random starts),
# embed its best pair into the full model with relative noise sigma, alternate on the search grid, and score the found
# pair and the embedded sub-model pair on the same finer grids.  Grid strings as in attack2.py ("nz|nr,nth|...").
# Usage: python attack3.py MODEL m K 'lam' seed sigma 'sub grid' 'search grid' 'score;score' out [sub_starts] [iters]
import sys, json, time, numpy as np, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from gm2 import *
from attack2 import mk

def main():
    name, m, K, lam = sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), json.loads(sys.argv[4])
    seed, sigma, subg, sg, fgs, out = int(sys.argv[5]), float(sys.argv[6]), sys.argv[7], sys.argv[8], sys.argv[9].split(';'), sys.argv[10]
    nsub = int(sys.argv[11]) if len(sys.argv) > 11 else 6; iters = int(sys.argv[12]) if len(sys.argv) > 12 else 200
    spec = SPECS[name]; t0 = time.time(); rng = np.random.default_rng(seed)
    S = mk(spec[:m], K, subg); best = None
    for s in range(nsub):
        cs = rng.choice([0.5, 1.0, 2.0]) * (rng.normal(size=S.nb) + 1j * rng.normal(size=S.nb)); cs[0] += 2
        r = alternate2(S, lam, cs, iters=iters, tol=1e-11)
        if best is None or r['value'] > best['value']: best = r
    print(json.dumps(dict(sub_value=best['value'], sub_c=[round(x, 6) for x in best['c']], t=round(time.time() - t0))), flush=True)
    M = mk(spec, K, sg); look = {b: i for i, b in enumerate(S.basis)}
    def embed(cv):
        base = np.zeros(M.nb, complex)
        for j, (k, combo) in enumerate(M.basis):
            if all((e == 0 if isinstance(e, int) else e == (0, 0)) for e in combo[m + 1:]):
                key = (k, combo[:m + 1])
                if key in look: base[j] = cv[look[key]]
        return base
    bf, bg = embed(best['cf']), embed(best['cg'])
    c0 = bf + sigma * np.linalg.norm(bf) / np.sqrt(M.nb) * (rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb))
    r = alternate2(M, lam, c0, iters=iters, tol=1e-11)
    rec = dict(model=name, m=m, K=K, lam=lam, seed=seed, sigma=sigma, sub_value=best['value'], search_value=r['value'],
               c=[float(x) for x in r['c']], t=round(time.time() - t0), scores=[])
    print(json.dumps(rec), flush=True); np.save(out + '.npy', np.array([r['cf'], r['cg'], bf, bg]))
    for g in fgs:
        Mf = mk(spec, K, g); ch = max(1, Mf.vars[0].n // 8)
        fh = Mf.phase_proj(r['cf'], ch); gh = Mf.phase_proj(r['cg'], ch); c = Mf.pair_coeffs(fh, gh)
        f0 = Mf.phase_proj(bf, ch); g0 = Mf.phase_proj(bg, ch); c0s = Mf.pair_coeffs(f0, g0)
        sc = dict(grid=g, payoff=float(np.dot(lam, c)), sub_pair_same_grid=float(np.dot(lam, c0s)), c=[float(x) for x in c], t=round(time.time() - t0))
        rec['scores'].append(sc); print(json.dumps(sc), flush=True); json.dump(rec, open(out + '.json', 'w'), indent=1)

if __name__ == '__main__':
    main()
