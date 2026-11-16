# Attack a game near its true W3 optimum in a richer model, with per-variable grids [N].
# 1. W3 optimum on a fine 3-D grid; 2. embed it in the richer model + noise of relative size sigma in all directions;
# 3. alternate on the search grid; 4. score the found pair AND the pure embedded W3 pair on finer grids (same grids:
#    an apples-to-apples comparison).  Grid strings: "nz|nr1,nth1|nr2,nth2|..." (one block per remote variable).
# Usage: python attack2.py MODEL K 'lam' seed sigma 'search grid' 'score grid;score grid' out
import sys, json, time, numpy as np, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from gm import Var
from gm2 import *

def qq(n): return 8 if n % 8 == 0 else (6 if n % 6 == 0 else max(1, n // 2))
def mk(spec, K, gs):
    parts = gs.split('|'); nz = int(parts[0]); vs = [Var('z', (1, 0), n1=nz, q=qq(nz), name='z')]
    for (kind, a, b, name), p in zip(spec, parts[1:]):
        nr, nth = (int(x) for x in p.split(','))
        vs.append(Var(kind, (a, b), n1=(nr if kind != 'r' else 16), n2=nth, q=qq(nr), name=name))
    return Model2(vs, K)

def main():
    name, K, lam, seed, sigma = sys.argv[1], int(sys.argv[2]), json.loads(sys.argv[3]), int(sys.argv[4]), float(sys.argv[5])
    sg, fgs, out = sys.argv[6], sys.argv[7].split(';'), sys.argv[8]; spec = SPECS[name]
    assert spec[0][3] == 'W3'
    t0 = time.time(); rng = np.random.default_rng(seed)
    S = mk(spec[:1], K, '96|96,64'); best = None
    for s in range(6):
        cs = rng.normal(size=S.nb) + 1j * rng.normal(size=S.nb); cs[0] += 2
        r = alternate2(S, lam, cs, iters=3000, tol=1e-13)
        if best is None or r['value'] > best['value']: best = r
    M = mk(spec, K, sg)
    def embed(cv):
        look = {b: i for i, b in enumerate(S.basis)}; base = np.zeros(M.nb, complex)
        for j, (k, combo) in enumerate(M.basis):
            if all((e == 0 if isinstance(e, int) else e == (0, 0)) for e in combo[2:]):
                key = (k, combo[:2])
                if key in look: base[j] = cv[look[key]]
        return base
    bf, bg = embed(best['cf']), embed(best['cg'])
    noise = rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb)
    c0 = bf + sigma * np.linalg.norm(bf) / np.sqrt(M.nb) * noise
    r = alternate2(M, lam, c0, iters=int(os.environ.get('ITERS', 400)), tol=1e-11)
    rec = dict(model=name, K=K, lam=lam, seed=seed, sigma=sigma, w3_fine=best['value'], search_grid=sg, search_value=r['value'],
               c=[float(x) for x in r['c']], asym=float(np.linalg.norm(r['cg'] - r['cf']) / np.linalg.norm(r['cf'])),
               t=round(time.time() - t0), scores=[])
    print(json.dumps(rec), flush=True); np.save(out + '.npy', np.array([r['cf'], r['cg']]))
    for g in fgs:
        Mf = mk(spec, K, g); ch = max(1, Mf.vars[0].n // 8)
        fh = Mf.phase_proj(r['cf'], ch); gh = Mf.phase_proj(r['cg'], ch); c = Mf.pair_coeffs(fh, gh)
        f0 = Mf.phase_proj(bf, ch); g0 = Mf.phase_proj(bg, ch); c0s = Mf.pair_coeffs(f0, g0)
        sc = dict(grid=g, payoff=float(np.dot(lam, c)), w3_baseline_same_grid=float(np.dot(lam, c0s)), c=[float(x) for x in c],
                  t=round(time.time() - t0))
        rec['scores'].append(sc); print(json.dumps(sc), flush=True); json.dump(rec, open(out + '.json', 'w'), indent=1)

if __name__ == '__main__':
    main()
