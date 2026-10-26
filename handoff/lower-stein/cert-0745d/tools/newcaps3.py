"""Node table of cert-0745d for one row: the cert-0745c table (same 336 nodes) with the certified mid-range caps (MIDCAPS.md):
   c_new(s) = min(c_0745c(s), midcap(s)) at every node with a replayed mid-range cap, unchanged elsewhere; then the lower convex hull,
   rounded UP at 1e-12 where it lowers a value (Psi convex).  Since every new value is <= the old one and the node set is unchanged,
   the chord interpolant decreases pointwise, so every node certificate of cert-0745c stays valid against the new table.
usage: newcaps3.py t CERTC_DIR base.pkl out_prefix midcap.json [...]   -> <out_prefix>_<t>.json (nodes, caps, src), <out_prefix>_<t>.pkl"""
import sys, json, pickle, numpy as np
from fractions import Fraction as F
from math import ceil
t, certc, basepkl, pref = sys.argv[1:5]; R = json.load(open(f'{certc}/row_{t}.json')); N = [F(v) for v in R['nodes']]; C0 = [F(v) for v in R['caps']]
pk = pickle.load(open(basepkl, 'rb')); assert [str(v) for v in C0] == list(pk['caps_exact']) and all(abs(float(a) - b) < 1e-12 for a, b in zip(N, pk['nodes']))
mid = {}
for fn in sys.argv[5:]:
    D = json.load(open(fn)); assert D['t'] == t
    for nd in D['nodes']: s = F(nd['s']); c = F(nd['cap']); mid[s] = min(mid.get(s, c), c)
up12 = lambda v: F(ceil(v * 10 ** 12), 10 ** 12); C = list(C0); src = ['c'] * len(N)
for s, c in mid.items():
    assert s in N, f'mid node {s} not in the table'; i = N.index(s)
    if c < C[i]: C[i] = c; src[i] = 'mid'
H = []
for i in range(len(N)):
    while len(H) >= 2 and (C[H[-1]] - C[H[-2]]) * (N[i] - N[H[-2]]) >= (C[i] - C[H[-2]]) * (N[H[-1]] - N[H[-2]]): H.pop()
    H.append(i)
for a, b in zip(H[:-1], H[1:]):
    for i in range(a + 1, b):
        v = up12(C[a] + (C[b] - C[a]) * (N[i] - N[a]) / (N[b] - N[a]))
        if v < C[i]: C[i] = v; src[i] = 'hull(' + src[i] + ')'
assert all(c <= c0 for c, c0 in zip(C, C0))
json.dump(dict(t=t, nodes=[str(v) for v in N], caps=[str(v) for v in C], src=src), open(f'{pref}_{t}.json', 'w'))
pk['caps_exact'] = [str(v) for v in C]; pk['caps'] = np.array([float(v) for v in C]); pickle.dump(pk, open(f'{pref}_{t}.pkl', 'wb'))
d = [float(a - b) for a, b in zip(C0, C)]
import collections; print(t, dict(collections.Counter(src)), 'max lowering %.2e' % max(d), 'lowered on', [float(N[i]) for i in range(len(N)) if d[i] > 0][:1], '..', [float(N[i]) for i in range(len(N)) if d[i] > 0][-1:])
