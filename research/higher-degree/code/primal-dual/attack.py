# Attack a fixed game with a richer response family [N]: best-response search from one seed on a coarse grid, then
# fixed-pair re-scoring of the SAME explicit pair (f, g) on finer grids (chunked).  A genuine response keeps its
# payoff under refinement; a quadrature artefact loses it.
# Usage: python attack.py MODEL K 'lam' seed start_type 'search grid nz,nr,nth' 'score grids a,b,c;d,e,f' out_prefix
#   start_type: rand | small_z (random, visible coefficient small) | embed (W3/Z2 optimum + noise in new directions)
import sys, json, time, numpy as np, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from gm import Var
from gm2 import *

def grid_vars(spec, K, nz, nr, nth):
    q = lambda n: 8 if n % 8 == 0 else (6 if n % 6 == 0 else n // 2)
    vs = [Var('z', (1, 0), n1=nz, q=q(nz), name='z')]
    for kind, a, b, name in spec:
        vs.append(Var(kind, (a, b), n1=(nr if kind != 'r' else 16), n2=nth, q=q(nr), name=name))
    return Model2(vs, K)

def main():
    name, K, lam, seed, stype = sys.argv[1], int(sys.argv[2]), json.loads(sys.argv[3]), int(sys.argv[4]), sys.argv[5]
    sg = [int(x) for x in sys.argv[6].split(',')]; fgs = [[int(x) for x in g.split(',')] for g in sys.argv[7].split(';')]
    out = sys.argv[8]; spec = SPECS[name]
    t0 = time.time(); M = grid_vars(spec, K, *sg); rng = np.random.default_rng(seed)
    c0 = rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb)
    if stype == 'rand': c0[0] += 2
    elif stype == 'small_z': c0 *= 1.5; c0[0] = 0.2
    elif stype == 'embed':
        # optimum of the first variable's 3-D sub-model, embedded, plus noise in all directions
        S = grid_vars(spec[:1], K, *sg); best = None
        for s in range(4):
            cs = rng.normal(size=S.nb) + 1j * rng.normal(size=S.nb); cs[0] += 2
            r = alternate2(S, lam, cs, iters=600, tol=1e-12)
            if best is None or r['value'] > best['value']: best = r
        look = {b: i for i, b in enumerate(S.basis)}; base = np.zeros(M.nb, complex)
        for j, (k, combo) in enumerate(M.basis):
            if all((e == 0 if isinstance(e, int) else e == (0, 0)) for e in combo[2:]):
                key = (k, combo[:2])
                if key in look: base[j] = best['cf'][look[key]]
        c0 = base + 0.08 * np.linalg.norm(base) / np.sqrt(M.nb) * c0
        print(json.dumps(dict(sub_model_value=best['value'])), flush=True)
    r = alternate2(M, lam, c0, iters=int(os.environ.get('ITERS', 400)), tol=1e-11)
    rec = dict(model=name, K=K, lam=lam, seed=seed, start=stype, nb=M.nb, search_grid=sg, search_value=r['value'],
               c=[float(x) for x in r['c']], energies_f=[float(x) for x in M.energies(r['fhat'])],
               asym=float(np.linalg.norm(r['cg'] - r['cf']) / np.linalg.norm(r['cf'])), t=round(time.time() - t0))
    print(json.dumps(rec), flush=True)
    np.save(out + '.npy', np.array([r['cf'], r['cg']])); rec['scores'] = []
    for g in fgs:
        Mf = grid_vars(spec, K, *g)
        fh = Mf.phase_proj(r['cf'], chunk=1); gh = Mf.phase_proj(r['cg'], chunk=1); c = Mf.pair_coeffs(fh, gh)
        sc = dict(grid=g, payoff=float(np.dot(lam, c)), c=[float(x) for x in c], t=round(time.time() - t0))
        rec['scores'].append(sc); print(json.dumps(sc), flush=True)
        json.dump(rec, open(out + '.json', 'w'), indent=1)
    json.dump(rec, open(out + '.json', 'w'), indent=1)

if __name__ == '__main__':
    main()
