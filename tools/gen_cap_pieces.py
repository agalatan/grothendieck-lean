#!/usr/bin/env python3
"""Generate `Grothe/LowerAnalytic/CapPieceData<k>.lean`: the localised (route M) node caps of the rows
0.84, 0.845, 0.85, 0.855 as lists of constrained pieces, from the MIDCAPS data of cert-0745d/e
(handoff/lower-stein/cert-0745{d,e}/midcaps; MIDCAPS.md, MIDCAPS_e.md).

usage: tools/gen_cap_pieces.py json OUT.json
         writes the piece lists of every vertex node that has a localised certificate (JSON, consumed by the
         diagnostics and by the Lean writer);
       tools/gen_cap_pieces.py lean PIECES.json GRIDS.json
         writes Grothe/LowerAnalytic/CapPieceData.lean from the nodes listed in GRIDS.json:
         {"k:i": [grid index of every piece]} (0 = 400 x 128, 1 = 1600 x 256, 2 = 1600 x 1024; the grid on
         which the Lean check of that piece passes, found by the diagnostics).

A piece is (grid, recipe, constraints).  The recipe is the stored price anchor y, the variance factors and
the price scale (search data: the Lean check recomputes the prices from it, and every bound is certified
whatever the prices are).  A constraint is (direction index k, sign, lo, hi or none, lam, mu): the vector is
+-d_k, d_0 = u (slice direction, block 0), d_1 = v2 (block 2), d_2 = v3 (block 3).
"""
import json, sys, os, glob, re
from fractions import Fraction as F

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
H = os.environ.get('GROTHE_HANDOFF', os.path.join(ROOT, 'handoff'))
ROWS = {12: '0.84', 13: '0.845', 14: '0.85', 15: '0.855'}

def pf(x):
    x = str(x).strip()
    if x.startswith('np.float64('): x = x[11:-1]
    return F(x)

def nn(x): return None if x in (None, 'None') else F(x)

def qs(x):
    x = F(x); return f"{x.numerator}" if x.denominator == 1 else f"{x.numerator}/{x.denominator}"

def cons_of(nd, p):
    """(vector, lo, hi, lam, mu) as in replay_midcaps_exact.cons_of."""
    if 'cons' in p:
        return [([F(x) for x in c[0]], F(c[1]), nn(c[2]), F(c[3]), F(c[4])) for c in p['cons']]
    if 'v' in nd:
        v = [F(x) for x in nd['v']]
        return [(v, F(p['lo']), None if p['hi'] is None else F(p['hi']), F(p['lam']), F(p['mu']))]
    v2 = [F(x) for x in nd['v2']]; v3 = [F(x) for x in nd['v3']]
    if p['kind'] == 'box':
        return [(v2, F(p['box'][0][0]), F(p['box'][0][1]), F(p['mult'][0][0]), F(p['mult'][0][1])),
                (v3, F(p['box'][1][0]), F(p['box'][1][1]), F(p['mult'][1][0]), F(p['mult'][1][1]))]
    vd = v2 if p['dir'] == 2 else v3
    return [(vd, F(p['lo']), None if p['hi'] is None else F(p['hi']), F(p['mult'][0][0]), F(p['mult'][0][1]))]

def dirs_of(nd):
    z = [F(0)] * 12
    u = [F(x) for x in nd['u']] if 'u' in nd else z
    v2 = [F(x) for x in nd['v2']] if 'v2' in nd else z
    v3 = [F(x) for x in (nd['v3'] if 'v3' in nd else nd['v'])]
    return [u, v2, v3]

def enc_cons(ds, c):
    v, lo, hi, lam, mu = c
    for k, d in enumerate(ds):
        if any(d) and v == d: return f"{k},+,{qs(lo)},{'*' if hi is None else qs(hi)},{qs(lam)},{qs(mu)}"
        if any(d) and v == [-x for x in d]: return f"{k},-,{qs(lo)},{'*' if hi is None else qs(hi)},{qs(lam)},{qs(mu)}"
    raise ValueError('constraint vector is not a node direction')

def enc_recipe(p):
    v0 = [pf(x) for x in p['anchor']]; var = [[pf(x) for x in f] for f in p['var']]
    return "|".join([",".join(qs(x) for x in v0)] + [",".join(qs(x) for x in f) for f in var] + [qs(F(p.get('scale', '1')))])

def chords(k):
    s = open(os.path.join(ROOT, 'Grothe/LowerAnalytic/CapChordData.lean')).read()
    rows = re.findall(r'^  \[(.*?)\],?$', s[s.index(':= [') + 4:], re.M)
    return set(int(a) for a, _, _ in re.findall(r'\((\d+), (\d+), (\d+)\)', rows[k]))

def collect(k):
    t = ROWS[k]
    r = json.load(open(os.path.join(H, 'lower-stein/cert-0745e/row_%s.json' % t)))
    nodes = [F(x) for x in r['nodes']]; caps = [F(c) for c in r['caps']]; ch = chords(k)
    files = sorted(glob.glob(os.path.join(H, 'lower-stein/cert-0745d/midcaps/*_%s.json' % t))) + \
        [os.path.join(H, 'lower-stein/cert-0745e/midcaps/m3_%s.json' % t)]
    best = {}
    for fn in files:
        D = json.load(open(fn))
        if not isinstance(D, dict) or not isinstance(D.get('nodes'), list) or not D['nodes'] or not isinstance(D['nodes'][0], dict): continue
        for nd in D['nodes']:
            s = F(nd['s'])
            if s not in nodes: continue
            i = nodes.index(s)
            if i in ch: continue
            fb = [p.get('float_bound') for p in nd['pieces']]
            if any(x is None for x in fb) or max(fb) > float(caps[i]) + 1e-10: continue
            if i not in best or len(nd['pieces']) < len(best[i][1]['pieces']): best[i] = (D, nd)
    out = []
    for i in sorted(best):
        D, nd = best[i]; ds = dirs_of(nd); pcs = []
        for p in nd['pieces']:
            nq = p.get('nq', D.get('NQ'))
            pcs.append(dict(nq=nq, slack=float(caps[i]) - p['float_bound'], recipe=enc_recipe(p),
                            cons=[enc_cons(ds, c) for c in cons_of(nd, p)]))
        out.append(dict(k=k, i=i, s=str(nodes[i]), cap=str(caps[i]), ds=[",".join(qs(x) for x in d) for d in ds], pieces=pcs))
    return out

def write_lean(pieces, grids):
    P = {f"{n['k']}:{n['i']}": n for n in json.load(open(pieces))}; G = json.load(open(grids))
    L = ["/-!", "# Localised node caps: the pieces (generated by `tools/gen_cap_pieces.py`; do not edit)", "",
         "Per node `(row, node, directions d₀ d₂ d₃, pieces g;recipe;constraints)` (see `CapPieceNodes.lean`).",
         "-/", "", "namespace Grothe.LowerAnalytic", "", "set_option maxRecDepth 100000", "",
         "/-- The piece nodes. -/", "def capPieceNodes : List (Nat × Nat × List String × List String) := ["]
    body = []
    for key in sorted(G, key=lambda x: tuple(map(int, x.split(':')))):
        n = P[key]; g = G[key]; assert len(g) == len(n['pieces'])
        pcs = [f"{gi};{p['recipe']};" + ";".join(p['cons']) for gi, p in zip(g, n['pieces'])]
        body.append(f"  ({n['k']}, {n['i']}, [{', '.join(json.dumps(d) for d in n['ds'])}], [\n" +
                    ",\n".join("    " + json.dumps(x) for x in pcs) + "])")
    L.append(",\n".join(body)); L += ["]", "", "end Grothe.LowerAnalytic", ""]
    out = os.path.join(ROOT, 'Grothe/LowerAnalytic/CapPieceData.lean')
    open(out, 'w').write("\n".join(L))
    print(f"wrote {out}: {len(G)} nodes, {sum(len(v) for v in G.values())} pieces")

if __name__ == '__main__':
    if sys.argv[1] == 'json':
        res = []
        for k in sorted(ROWS): res += collect(k)
        json.dump(res, open(sys.argv[2], 'w'))
        print(f"{len(res)} nodes, {sum(len(n['pieces']) for n in res)} pieces")
    else:
        write_lean(sys.argv[2], sys.argv[3])
