"""Node table of cert-0745e for one row (standard library only, exact fractions).
  nodes = the 336 cert-0745d nodes  U  the 0.00125 midpoints (2k+1)/800 of [0.05, 0.2)  (60 new nodes; exact rationals, no rounding)
  new node s:      min( ceil_1e-12 min_j Q_j(s)  [anchored quadratics of the given proof bundles, each a global bound of Psi (AF eq. (8))],
                        ceil_1e-12 chord_d(s)     [chord of the cert-0745d caps: Psi convex] )
  cert-0745d node: min( c_d(s), M(s) )            [M = localised mid-range cap of the given midcaps files, exact replay replay_midcaps_exact.py]
  then the lower convex hull (Psi convex) rounded UP at 1e-12; asserts c_e <= chord_d at every node (so cert-0745d node certificates
  remain valid against the new table).
usage: newcaps4.py t DROW_DIR out.json --bundles b1.json ... --midcaps m1.json ...
Writes out.json = {t, nodes, caps, src, bundles: [[name, sha256, n_anchors]]}.  Re-running reproduces it byte for byte."""
import sys, json, hashlib, os
from fractions import Fraction as F
from math import ceil
args = sys.argv[1:]; t, ddir, out = args[:3]; rest = args[3:]
bun = rest[rest.index('--bundles') + 1: rest.index('--midcaps')] if '--midcaps' in rest else rest[rest.index('--bundles') + 1:]
mid = rest[rest.index('--midcaps') + 1:] if '--midcaps' in rest else []
R = json.load(open(os.path.join(ddir, f'row_{t}.json'))); th = [F(v) for v in R['theta']]; eps = F(R['eps'])
N0 = [F(x) for x in R['nodes']]; C0 = [F(x) for x in R['caps']]
up = lambda v: F(ceil(v * 10 ** 12), 10 ** 12)
quads = []; bsrc = []
for fn in bun:
    raw = open(fn, 'rb').read(); d = json.loads(raw); assert d['version'] == 'anchored-row-table-v1'
    assert F(d['source_row']['eps']) == eps and [F(v) for v in d['source_row']['theta']] == th
    for r in d['results']:
        p = r['profile']; assert F(p['eps']) == eps and [F(v) for v in p['theta']] == th and F(p.get('E_repair', '0')) == 0
        q = r['global_quadratic']; quads.append((F(q['q0']), F(q['q1']), F(q['q2'])))
    bsrc.append([os.path.basename(fn), hashlib.sha256(raw).hexdigest(), len(d['results'])])
def chord(s):
    k = max(i for i in range(len(N0)) if N0[i] <= s)
    return C0[k] if N0[k] == s else C0[k] + (C0[k + 1] - C0[k]) * (s - N0[k]) / (N0[k + 1] - N0[k])
M = {}
for fn in mid:
    D = json.load(open(fn)); assert D['t'] == t
    for nd in D['nodes']: s = F(nd['s']); M[s] = min(M.get(s, F(nd['cap'])), F(nd['cap']))
cap = dict(zip(N0, C0)); src = {s: 'd' for s in N0}
for s, c in M.items():
    assert s in cap, f'midcap node {s} not a cert-0745d node'
    if c < cap[s]: cap[s] = c; src[s] = 'mid'
for k in range(20, 80):
    s = F(2 * k + 1, 800); assert s not in cap
    a = up(min(q0 + q1 * s + q2 * s * s for q0, q1, q2 in quads)) if quads else None; b = up(chord(s))
    cap[s], src[s] = (a, 'A') if a is not None and a < b else (b, 'chord_d')
N = sorted(cap); C = [cap[s] for s in N]; S = [src[s] for s in N]
H = []
for i in range(len(N)):
    while len(H) >= 2 and (C[H[-1]] - C[H[-2]]) * (N[i] - N[H[-2]]) >= (C[i] - C[H[-2]]) * (N[H[-1]] - N[H[-2]]): H.pop()
    H.append(i)
for a, b in zip(H[:-1], H[1:]):
    for i in range(a + 1, b):
        v = up(C[a] + (C[b] - C[a]) * (N[i] - N[a]) / (N[b] - N[a]))
        if v < C[i]: C[i] = v; S[i] = 'hull(' + S[i] + ')'
assert all(c <= up(chord(s)) for s, c in zip(N, C)) and all(cap_ <= c0 for cap_, c0 in ((C[N.index(s)], c0) for s, c0 in zip(N0, C0)))
assert N[0] == 0 and N[-1] == N0[-1] and all(a < b for a, b in zip(N[:-1], N[1:]))
json.dump(dict(t=t, nodes=[str(v) for v in N], caps=[str(v) for v in C], src=S, bundles=bsrc), open(out, 'w'))
import collections; print(t, len(N), 'nodes', dict(collections.Counter(x.split('(')[-1].rstrip(')') for x in S)), 'hull-lowered', sum(x.startswith('hull') for x in S))
