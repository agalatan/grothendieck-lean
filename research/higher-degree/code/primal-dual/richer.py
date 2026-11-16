# Richer response families for a fixed game lam: many restarts in larger graded models. [N]
# Usage: python richer.py K 'lam-json' MODEL n1,n2 nstarts out.json [warm.json]
#   MODEL: '+'-joined names, e.g. W3+Z2.  The W3 optimum (from a 3D run) is embedded as a warm start, so the
#   baseline (same grid) and any gain from the new variables are measured on the same quadrature.
import sys, json, time, numpy as np, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from gm import *

SPEC = {'W3': ('c', 2, 1), 'W3b': ('c', 2, 1), 'Z2': ('c', 1, 0), 'Z3': ('c', 1, 0), 'W5': ('c', 3, 2),
        'Y': ('r', 1, 1), 'B': ('c', 2, 0), 'X11': ('c', 1, 1), 'W7': ('c', 4, 3), 'B31': ('c', 3, 1),
        'Y22': ('r', 2, 2), 'A30': ('c', 3, 0)}

def build(names, K, n1, n2, nz=None):
    vs = [Var('z', (1, 0), n1=nz or n1, name='z')]
    for nm in names:
        kind, a, b = SPEC[nm]
        vs.append(Var(kind, (a, b), n1=(n1 if kind != 'r' else 20), n2=n2, name=nm))
    return Model(vs, K)

def embed(sub, big, c_sub):
    """map coefficients from a sub-model (variables = prefix of big's variables) into big"""
    nsub = len(sub.vars); look = {b: i for i, b in enumerate(sub.basis)}
    out = np.zeros(big.nb, complex)
    for j, (k, combo) in enumerate(big.basis):
        extra = combo[nsub:]
        if all((e == 0 if isinstance(e, int) else e == (0, 0)) for e in extra):
            key = (k, combo[:nsub])
            if key in look: out[j] = c_sub[look[key]]
    return out

def sectors(model, fhat):
    """energy of f per (k, set of remote variables used, total remote Hermite degree)"""
    out = {}
    for (k, combo), a in zip(model.basis, fhat):
        tag = []
        for v, idx in zip(model.vars[1:], combo[1:]):
            d = idx if isinstance(idx, int) else idx[0] + idx[1]
            if d: tag.append(f'{v.name}^{d}' if d > 1 else v.name)
        key = f'k{k}:' + ('*'.join(tag) if tag else 'z')
        out[key] = out.get(key, 0) + abs(a) ** 2
    return {k: round(v, 7) for k, v in sorted(out.items())}

def main():
    K = int(sys.argv[1]); lam = json.loads(sys.argv[2]); names = sys.argv[3].split('+')
    n1, n2 = (int(x) for x in sys.argv[4].split(',')); nst = int(sys.argv[5]); out = sys.argv[6]
    M = build(names, K, n1, n2)
    rng = np.random.default_rng(abs(hash(sys.argv[3])) % 2 ** 32)
    starts = []
    # warm start: W3 optimum embedded (computed here on a 3D sub-model with the same z/W grids)
    if names[0] == 'W3':
        S = build(['W3'], K, n1, n2)
        bs = None
        for s in range(4):
            c0 = rng.normal(size=S.nb) + 1j * rng.normal(size=S.nb); c0[0] += 2
            r = alternate(S, lam, c0, iters=1500, tol=1e-13)
            if bs is None or r['value'] > bs['value']: bs = r
        base = embed(S, M, bs['cf'])
        r0 = alternate(M, lam, base, iters=500, tol=1e-11)
        print(json.dumps(dict(model='W3 sub', value=bs['value'], embedded=r0['value'])), flush=True)
        starts += [base + 0.05 * (rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb)) * np.linalg.norm(base) / np.sqrt(M.nb) for _ in range(nst // 3)]
    for s in range(nst - len(starts)):
        sc = rng.choice([0.3, 1.0, 3.0])
        c0 = sc * (rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb)); c0[0] += 2; starts.append(c0)
    res = []; t0 = time.time(); best = None
    for i, c0 in enumerate(starts):
        r = alternate(M, lam, c0, iters=500, tol=1e-11)
        res.append(r['value'])
        if best is None or r['value'] > best['value']: best = r
        print(json.dumps(dict(start=i, value=r['value'], it=r['it'], t=round(time.time() - t0))), flush=True)
    info = dict(K=K, lam=lam, model=names, grid=[n1, n2], nb=M.nb, values=sorted(res, reverse=True),
                best=best['value'], c=list(best['c']), sectors_f=sectors(M, best['fhat']), sectors_g=sectors(M, best['ghat']),
                cf=[(float(z.real), float(z.imag)) for z in best['cf']], cg=[(float(z.real), float(z.imag)) for z in best['cg']],
                basis=[str(b) for b in M.basis])
    if names[0] == 'W3': info.update(w3_sub=bs['value'], w3_embedded=r0['value'])
    json.dump(info, open(out, 'w'), indent=1)
    print(json.dumps(dict(model='+'.join(names), best=best['value'], top=sorted(res, reverse=True)[:5])), flush=True)

if __name__ == '__main__':
    main()
