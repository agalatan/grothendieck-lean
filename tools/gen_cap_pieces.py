#!/usr/bin/env python3
"""Generate `Grothe/LowerAnalytic/CapPieceData<k>.lean`: the localised (route M) node caps of the rows
0.84, 0.845, 0.85, 0.855 as lists of constrained pieces, from the MIDCAPS data of cert-0745d/e
(handoff/lower-stein/cert-0745{d,e}/midcaps; MIDCAPS.md, MIDCAPS_e.md).

usage: tools/gen_cap_pieces.py json OUT.json
         writes the piece lists of every vertex node that has a localised certificate (JSON, consumed by the
         diagnostics and by the Lean writer);
       tools/gen_cap_pieces.py nodes PIECES.json SEL.json
         writes, for every node "k:i" of SEL.json, the modules of Grothe/LowerAnalytic/CapPieces/:
         D<k>x<i> (the piece-node data: strings only, no imports), C<k>x<i> (the coverage fact),
         R<k>x<i>_<n> (one single-threaded native range fact per chunk of checked pieces) and N<k>x<i>
         (the theorem nodeCap_<k>x<i>: the piece bounds of the excluded pieces => NodeCap k i).
         SEL.json: {"k:i": {"excl": [pieces left out, e.g. failing ones], "chunk": pieces per range fact,
         "grids": optional [grid index per piece]}}; default grid per piece from its nq
         (256 -> 1 = 1600 x 256, 1024 -> 2 = 1600 x 1024, else 0 = 400 x 128).
         Canonical inputs: data/caps-m-pieces/pieces.json (from `json`) and data/caps-m-pieces/sel.json.
       tools/gen_cap_pieces.py repairs PIECES.json REPAIRS.json
         writes a separate one-piece data module D<k>x<i>p<j>Repair for each multiplier repair.
         REPAIRS.json maps "k:i" to piece indices with `grid`, `lm` and zero `cap_up`.
         Directions, constraint intervals, recipes, row and node indices are unchanged.
         Existing piece data and range facts are not rewritten. Agent-ID: codex-2ca4.
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

NQ_GRID = {256: 1, 1024: 2}

def node_strings(n, grids):
    return ([d for d in n['ds']], [f"{gi};{p['recipe']};" + ";".join(p['cons']) for gi, p in zip(grids, n['pieces'])])

def ranges_of(npieces, excl, chunk):
    out, run = [], []
    for j in range(npieces + 1):
        if j < npieces and j not in excl:
            run.append(j)
            if len(run) == chunk: out.append((run[0], run[-1] + 1)); run = []
        elif run:
            out.append((run[0], run[-1] + 1)); run = []
    return out

def write_repairs(pieces, repairs):
    """Emit one-piece certificates changing only the S-lemma multipliers."""
    P = {f"{n['k']}:{n['i']}": n for n in json.load(open(pieces))}
    repairs = json.load(open(repairs))
    directory = os.path.join(ROOT, 'Grothe/LowerAnalytic/CapPieces')
    os.makedirs(directory, exist_ok=True)
    for key in sorted(repairs, key=lambda x: tuple(map(int, x.split(':')))):
        n = P[key]
        for index in sorted(repairs[key], key=int):
            j = int(index)
            repair = repairs[key][index]
            assert 0 <= j < len(n['pieces'])
            assert F(repair['cap_up']) == 0, 'A repair must preserve the stored cap'
            p = n['pieces'][j]
            grid = repair['grid']
            assert type(grid) is int and grid == NQ_GRID.get(p['nq'], 0), 'Keep the original grid'
            assert len(repair['lm']) == len(p['cons'])
            cons = []
            for encoded, multipliers in zip(p['cons'], repair['lm']):
                fields = encoded.split(',')
                assert len(fields) == 6 and len(multipliers) == 2
                lam, mu = map(F, multipliers)
                assert lam >= 0 and mu >= 0
                assert fields[3] != '*' or lam == 0
                cons.append(','.join(fields[:4] + [qs(lam), qs(mu)]))
            encoded = f"{grid};{p['recipe']};" + ';'.join(cons)
            tag = f"{n['k']}x{n['i']}p{j}"
            body = [
                '/-! A multiplier repair generated by `tools/gen_cap_pieces.py repairs`.',
                'Agent-ID: codex-2ca4. The original cap, recipe and constraint region are unchanged. -/',
                '', 'namespace Grothe.LowerAnalytic', '',
                f'def pieceRepair_{tag} : Nat × Nat × List String × List String :=',
                f"  ({n['k']}, {n['i']}, [{', '.join(json.dumps(d) for d in n['ds'])}],",
                f'    [{json.dumps(encoded)}])', '',
                'end Grothe.LowerAnalytic', '']
            path = os.path.join(directory, f'D{tag}Repair.lean')
            with open(path, 'w') as out:
                out.write('\n'.join(body))
            print(f'repair {key} piece {j}: grid {grid}, unchanged cap {n["cap"]}')

def write_nodes(pieces, sel):
    P = {f"{n['k']}:{n['i']}": n for n in json.load(open(pieces))}; S = json.load(open(sel))
    d = os.path.join(ROOT, 'Grothe/LowerAnalytic/CapPieces'); os.makedirs(d, exist_ok=True)
    gen = "(generated by `tools/gen_cap_pieces.py nodes`; do not edit)"
    for key in sorted(S, key=lambda x: tuple(map(int, x.split(':')))):
        n = P[key]; k, i = n['k'], n['i']; tag = f"{k}x{i}"; sl = S[key]
        excl = sorted(set(sl.get('excl', []))); chunk = int(sl.get('chunk', 4))
        grids = sl.get('grids') or [NQ_GRID.get(p['nq'], 0) for p in n['pieces']]
        assert len(grids) == len(n['pieces'])
        ds, pcs = node_strings(n, grids)
        name = f"pieceNode_{tag}"
        data = [f"/-! # Pieces of node {i} of row {k} (s = {n['s']}, cap = {n['cap']}) {gen} -/", "",
                "namespace Grothe.LowerAnalytic", "", "set_option maxRecDepth 100000", "",
                f"/-- Node {i} of row {k}: directions and pieces `grid;recipe;constraints`. -/",
                f"def {name} : Nat × Nat × List String × List String :=",
                f"  ({k}, {i}, [{', '.join(json.dumps(x) for x in ds)}], [\n" + ",\n".join("    " + json.dumps(x) for x in pcs) + "])",
                "", "end Grothe.LowerAnalytic", ""]
        open(os.path.join(d, f"D{tag}.lean"), 'w').write("\n".join(data))
        hdr = ["import Grothe.LowerAnalytic.CapPieceRange", f"import Grothe.LowerAnalytic.CapPieces.D{tag}", ""]
        cov = hdr + [f"/-! # Coverage of node {i} of row {k} {gen} -/", "", "namespace Grothe.LowerAnalytic", "",
                     f"theorem pieceCover_{tag} : pieceCoverOK {name} = true := by native_decide", "",
                     "end Grothe.LowerAnalytic", ""]
        open(os.path.join(d, f"C{tag}.lean"), 'w').write("\n".join(cov))
        rs = ranges_of(len(pcs), set(excl), chunk)
        for r, (lo, hi) in enumerate(rs):
            body = hdr + [f"/-! # Pieces {lo} <= j < {hi} of node {i} of row {k} {gen} -/", "",
                          "namespace Grothe.LowerAnalytic", "",
                          f"theorem pieceRange_{tag}_{r} : pieceRangeOK {name} {lo} {hi} = true := by native_decide", "",
                          "end Grothe.LowerAnalytic", ""]
            open(os.path.join(d, f"R{tag}_{r}.lean"), 'w').write("\n".join(body))
        imps = ["import Grothe.LowerAnalytic.CapPieceNodes", f"import Grothe.LowerAnalytic.CapPieces.C{tag}"] + \
               [f"import Grothe.LowerAnalytic.CapPieces.R{tag}_{r}" for r in range(len(rs))]
        alts = " ∨ ".join(f"({lo} ≤ j ∧ j < {hi})" for lo, hi in rs) or "False"
        pat = " | ".join("h" for _ in rs) or "h"
        uses = ", ".join(f"pieceOneOK_of_range pieceRange_{tag}_{r} h.1 h.2" for r in range(len(rs)))
        exs = "[" + ", ".join(map(str, excl)) + "]"
        node = imps + ["", f"/-! # The cap of node {i} of row {k} from its pieces {gen}",
                       "", f"Checked pieces: {len(pcs) - len(excl)} of {len(pcs)} in {len(rs)} range facts; excluded: {exs}.", "-/", "",
                       "namespace Grothe.LowerAnalytic", "",
                       f"/-- **The cap of node {i} of row {k}**, given the bounds of the excluded pieces {exs}. -/",
                       f"theorem nodeCap_{tag}",
                       f"    (hex : ∀ j ∈ ({exs} : List ℕ), ∀ cs, (pieceCons {name})[j]? = some cs → PieceCap {k} {i} cs) :",
                       f"    NodeCap {k} {i} := by",
                       f"  refine nodeCap_of_ranges {name} {exs} pieceCover_{tag} (fun j hj hx => ?_) hex",
                       f"  have hn : ({name}).2.2.2.length = {len(pcs)} := rfl",
                       "  rw [hn] at hj",
                       *(["  simp only [List.mem_cons, List.not_mem_nil, or_false" + (", not_or" if len(excl) > 1 else "") + "] at hx"]
                         if excl else []),
                       f"  obtain {pat} := (by omega : {alts})" if rs else "  omega",
                       ]
        if rs: node.append(f"  exacts [{uses}]")
        node += ["", "end Grothe.LowerAnalytic", ""]
        open(os.path.join(d, f"N{tag}.lean"), 'w').write("\n".join(node))
        print(f"node {key}: {len(pcs)} pieces, excluded {exs}, {len(rs)} range facts")

if __name__ == '__main__':
    if sys.argv[1] == 'json':
        res = []
        for k in sorted(ROWS): res += collect(k)
        json.dump(res, open(sys.argv[2], 'w'))
        print(f"{len(res)} nodes, {sum(len(n['pieces']) for n in res)} pieces")
    elif sys.argv[1] == 'repairs':
        write_repairs(sys.argv[2], sys.argv[3])
    elif sys.argv[1] == 'nodes':
        write_nodes(sys.argv[2], sys.argv[3])
    else:
        write_lean(sys.argv[2], sys.argv[3])
