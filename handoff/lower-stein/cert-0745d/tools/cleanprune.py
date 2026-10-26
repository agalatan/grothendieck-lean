"""clean + prune of re-cover outputs (logic of t4/clean.py and t4/prune.py, paths as arguments).
usage: cleanprune.py pkl out_prefix cover1.json [cover2.json ...]  -> out_prefix_<k>.json (one per input, rebank format)"""
import sys, json
from fractions import Fraction as Fr
import pickle, numpy as np
sys.path.insert(0, '/Users/alingalatan/workspaces/grothe/handoff/lower-stein'); import verify_cert as VC
pk = pickle.load(open(sys.argv[1], 'rb')); kappa = Fr(int(np.floor(pk['kappa'] * 10**9)), 10**9); const = pk['const']
class S:
    interval_bound = staticmethod(VC.chord_max)
pref = sys.argv[2]; files = sys.argv[3:]; D = [json.load(open(f)) for f in files]; pref = sys.argv[2]; files = sys.argv[3:]; D = [json.load(open(f)) for f in files]
ch = lambda a, b: const + float(S.interval_bound(Fr(a['sigma']), Fr(a['V']), Fr(b['sigma']), Fr(b['V']), kappa))
def chords(N): return [ch(a, b) for a, b in zip(N[:-1], N[1:])]
tot = 0
for d in D:                                                                   # clean: drop interior nodes whose removal lowers the cell bound
    for c in d['cells']:
        N = c['nodes']; small = max(const + float(Fr(q['bound'])) for q in c['small'])
        while True:
            cb = chords(N); im = max(range(len(cb)), key=lambda i: cb[i]); best = None
            for i in (im, im + 1):
                if 0 < i < len(N) - 1:
                    M = N[:i] + N[i + 1:]; v = max(chords(M))
                    if v < cb[im] - 1e-9 and (best is None or v < best[0]): best = (v, M)
            if best is None: break
            N = best[1]; tot += 1
        c['nodes'] = N; c['bound'] = max(max(chords(N)), small)
rb = max(c['bound'] for d in D for c in d['cells']); n0 = n1 = 0
for d, k in zip(D, range(len(D))):                                            # prune: drop nodes not needed for (row bound - 4e-6)
    for c in d['cells']:
        N = c['nodes']; n0 += len(N); lim = c['bound'] if c['bound'] > rb - 4e-6 else rb - 4e-6; i = 1
        while i < len(N) - 1:
            if ch(N[i - 1], N[i + 1]) <= lim: del N[i]
            else: i += 1
        used = sorted(set(j for n in N for j in n['cuts'])); remap = {j: a for a, j in enumerate(used)}; c['bank'] = [c['bank'][j] for j in used]
        for n in N: n['cuts'] = [remap[j] for j in n['cuts']]
        small = max(const + float(Fr(q['bound'])) for q in c['small']); c['bound'] = max(max(chords(N)), small); n1 += len(N)
    d['rowbound'] = max(c['bound'] for c in d['cells']); json.dump(d, open(f'{pref}_{k}.json', 'w'))
print(f"cleaned {tot} nodes; row bound {rb:.9f} -> {max(d['rowbound'] for d in D):.9f}; nodes {n0} -> {n1}; worst cell {max((c for d in D for c in d['cells']), key=lambda c: c['bound'])['x']}")
