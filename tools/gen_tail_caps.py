#!/usr/bin/env python3
"""Generate the Lean cap modules of the identity-tail certificate (claude-b9ee, issue #183).

usage: python3 tools/gen_tail_caps.py [--rows T,T,...] [--check] [--plan] [--dry-run] [--out DIR]

Inputs (committed under data/tail-caps/, copied byte for byte from the certificate's lean-data/ folder; their sha256 are in
data/tail-caps/SHA256SUMS and are checked first):
  row_set.json                        the final row set: per cap row its name t, index, θ (15 rationals), δ, κ, smax
  <t>/table.json                      the cap table: nodes s_i, caps c_i, sources
  <t>/bind.json                       the record and the live pieces behind every quad entry, the ends of every chord entry
  <t>/records.jsonl, <t>/index.json   the bound records (each line checked against the sha256 of the binding)

Outputs (Grothe/LowerAnalytic/TailCaps/): Common.lean, CommonFacts.lean and, per row K (two digits, the index of row_set.json),
  RowKK/Data.lean      the row's cap data (tailRowKK, tailRKK, tailChordsKK, tailRecsKK, tailExclKK)
  RowKK/AnchorJJ.lean  native facts rangeOKNu over consecutive node ranges (anchored nodes: table means; global: Gauss means)
  RowKK/D<iii>.lean    per localised node i: its directions and pieces (`grid;recipe;constraints`)
  RowKK/C<iii>.lean    its coverage fact (pieceCoverFastOK)
  RowKK/R<iii>_<J>.lean its piece facts (pieceRangeOKNu), one grid per module
  RowKK/N<iii>.lean    its cap (nodeCapNu_of_ranges)
  RowKK/Assembly.lean  the row's vertex caps, chord fact, PSD fact and node caps (tailCapsKK)
  RowKK/Bridge.lean    the row of the caps and the row of the Stein side (`tailSteinRowKK`, Grothe/Lower/TailRows, written by
                       `gen_lower_data.py --tail`) have the same constants and node table (`rfl`)
and data/tail-caps/native.txt: the native facts of the generated rows, in the format of data/axioms/native.txt (to be merged
into it when the facts enter the axiom report).
--check regenerates every selected row and compares with the files on disk (exit 1 on any difference); --plan prints the
modules with their estimated costs; --dry-run runs every check and the plan without writing; --out DIR writes the Lean
files under DIR instead of the repository's Grothe/LowerAnalytic/TailCaps (and leaves data/tail-caps/native.txt alone).

Before writing, every input is checked with exact fractions; the generator stops at the first failure:
  * every quad entry: value = max over its bound pieces of q(s_entry) (pieces checked at the entry's own s), and
    value + 2·10⁻⁹ <= cap;
  * every chord entry (i, a, b): a, b are vertex nodes, 0 <= s_a < s_i < s_b, and chord(c_a, c_b)(s_i) − 10⁻¹² <= c_i (the
    vertex nodes are checked in Lean at c − 10⁻¹², `capLow`);
  * every constraint vector of a piece is ±d₀, ±v₂ or ±v₃ of its node.
Recipes (anchors, variance vectors) are doubles; they are written as the exact rationals of the doubles, so that the
kernel's prices reproduce the generator's (the replay of 31 stored pieces, LEAN_STAGE2_DESIGN.md §12). Anchored nodes:
y = m₀ + s₀ a in doubles, s₀ the record's own s, a = (1 + b₁, b₂, b₃), as in the generator (nucert.certify_node).
"""
import argparse, hashlib, json, os, sys
from fractions import Fraction as F

sys.set_int_max_str_digits(0)
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA = os.path.join(ROOT, 'data', 'tail-caps')
OUTREL = os.path.join('Grothe', 'LowerAnalytic', 'TailCaps')
MOD = 'Grothe.LowerAnalytic.TailCaps'
EPS = F(25, 31)
NU = F(47, 1953)
MARGIN = F(2, 10**9)
CAPLOW = F(1, 10**12)
PIECE_GRID = {128: 0, 256: 1, 1024: 2}          # index into `pieceGrids` (CapPieceRange.lean)
# cost model: seconds of one Lean process on yo (x86-64), measured 17 Nov 2026 with the kernel b9689ee90
COST_ANCHORED, COST_GLOBAL = 79, 59
COST_PIECE = {0: 8, 1: 59, 2: 250}
COST_TABLES = {'whole': 19, 0: 2, 1: 19, 2: 23}
BUDGET = 600                                      # seconds per native fact module (estimated)


def die(msg):
    sys.exit(f'gen_tail_caps: {msg}')


def qs(x):
    x = F(x)
    return str(x.numerator) if x.denominator == 1 else f'{x.numerator}/{x.denominator}'


def ql(x):
    x = F(x)
    return f'({x.numerator} : ℚ)' if x.denominator == 1 else f'({x.numerator} : ℚ) / {x.denominator}'


def fbin(v):
    """The exact rational value of a double, as `p/q`."""
    return qs(F(float(v)))


def lstr(s):
    assert '"' not in s and '\\' not in s
    return '"' + s + '"'


def sha(path):
    return hashlib.sha256(open(path, 'rb').read()).hexdigest()


def check_inputs():
    for line in open(os.path.join(DATA, 'SHA256SUMS')):
        h, fn = line.split(None, 1)
        fn = fn.strip()
        if sha(os.path.join(DATA, fn)) != h:
            die(f'data/tail-caps/{fn}: sha256 differs from SHA256SUMS')


def qval(q, s):
    return F(q[0]) + F(q[1]) * s + F(q[2]) * s * s


class Row:
    def __init__(self, P):
        self.P = P
        self.t = P['name']
        self.K = P['index']
        th = [F(v) for v in P['theta']]
        self.E, self.R, self.delta, self.b = th[0:6], th[6:9], th[9], th[10:13]
        self.ell, self.beta = th[13], th[14]
        if (F(P['delta']), F(P['ell']), F(P['beta'])) != (self.delta, self.ell, self.beta):
            die(f'row {self.t}: header and θ disagree')
        self.kappa, self.smax = F(P['kappa']), F(P['smax'])
        self.a = [1 + self.b[0], self.b[1], self.b[2]]
        d = os.path.join(DATA, self.t)
        self.table_sha = sha(os.path.join(d, 'table.json'))
        T = json.load(open(os.path.join(d, 'table.json')))
        B = json.load(open(os.path.join(d, 'bind.json')))
        if not (self.table_sha == B['table_sha256'] == P['table']['sha256']):
            die(f'row {self.t}: table hash')
        if sha(os.path.join(d, 'bind.json')) != P['binding']['sha256'] or sha(os.path.join(d, 'records.jsonl')) != P['records']['sha256']:
            die(f'row {self.t}: binding or records hash differs from row_set.json')
        pos = json.load(open(os.path.join(d, 'index.json')))['pos']
        raw = open(os.path.join(d, 'records.jsonl'), 'rb').read().split(b'\n')
        self.recs = {}
        for key, meta in B['records'].items():
            line = raw[pos[key]]
            if hashlib.sha256(line).hexdigest() != meta['sha256']:
                die(f'row {self.t}: record {key} hash')
            self.recs[key] = json.loads(line)
        self.meta = B['records']
        self.nodes = [F(x) for x in T['nodes']]
        self.caps = [F(x) for x in T['caps']]
        n = len(self.nodes)
        if self.nodes[0] != 0 or any(self.nodes[i] >= self.nodes[i + 1] for i in range(n - 1)):
            die(f'row {self.t}: nodes not increasing from 0')
        E = B['entries']
        if [e['i'] for e in E] != list(range(n)) or any(F(e['s']) != self.nodes[e['i']] or F(e['cap']) != self.caps[e['i']] for e in E):
            die(f'row {self.t}: binding entries do not match the table')
        self.entries = E
        self.chords, self.whole, self.local = [], [], []
        for e in E:
            i = e['i']
            if e['record'] is None:
                a, b = e['chord']
                self.chords.append((i, a, b))
                continue
            meta, rec = self.meta[e['record']], self.recs[e['record']]
            if rec['kind'] != meta['kind'] or F(rec['s']) != F(meta['s']):
                die(f'row {self.t}: record {e["record"]} kind or s')
            s = self.nodes[i]
            if rec['kind'] in ('anchored', 'global'):
                val = max(qval(q, s) for q in rec['quads'])
                self.whole.append((i, rec))
            else:
                pcs = [rec['details']['plist'][j] for j in meta['pieces']]
                if any(p.get('superseded') for p in pcs):
                    die(f'row {self.t}: superseded piece bound at node {i}')
                val = max(qval(p['q'], s) for p in pcs)
                self.local.append((i, e['record'], rec, pcs))
            if val != F(e['value']) or val + MARGIN > self.caps[i]:
                die(f'row {self.t}: entry {i}: value {val} cap {self.caps[i]}')
        chordset = {c[0] for c in self.chords}
        for i, a, b in self.chords:
            if a in chordset or b in chordset or not (0 <= self.nodes[a] < self.nodes[i] < self.nodes[b]):
                die(f'row {self.t}: chord entry {i}: ends ({a}, {b})')
            ch = self.caps[a] + (self.caps[b] - self.caps[a]) / (self.nodes[b] - self.nodes[a]) * (self.nodes[i] - self.nodes[a])
            if ch - CAPLOW > self.caps[i]:
                die(f'row {self.t}: chord entry {i}: the chord of the lowered caps is above the cap')

    # ---- recipes and pieces ----
    def whole_recipe(self, rec):
        if rec['kind'] == 'anchored':
            r = rec['recipe']
            if r['nq'] != 64 or r.get('lean_grid') != '1600x256':
                die(f'row {self.t}: anchored record at {rec["s"]}: grid')
            s0 = float(F(rec['s']))
            y = [float(r['m0'][j]) + s0 * float(self.a[j]) for j in range(3)] + [0.0] * 9
            return False, ','.join(fbin(v) for v in y) + '|1'
        r = rec['recipe']
        if r['nq'] != 256 or r.get('cons'):
            die(f'row {self.t}: global record at {rec["s"]}: grid or constraints')
        return True, ','.join(fbin(v) for v in r['y']) + ''.join('|' + ','.join(fbin(v) for v in f) for f in r['var']) + '|1'

    def node_record(self, i, key, rec, pcs):
        det, meta = rec['details'], self.meta[key]
        v2, v3 = [F(u) for u in det['v2']], [F(u) for u in det['v3']]
        if v2 != [F(u) for u in meta['v2']] or v3 != [F(u) for u in meta['v3']]:
            die(f'row {self.t}: node {i}: directions of binding and record differ')
        v0 = [F(u) for u in det['v0']] if 'v0' in det else [F(0)] * 12
        dirs = [v0, v2, v3]
        out = []
        for p in pcs:
            g = PIECE_GRID.get(p['nq'])
            rc = p['recipe']
            if g is None or rc['nq'] != p['nq']:
                die(f'row {self.t}: node {i}: grid of a piece')
            recipe = ','.join(fbin(v) for v in rc['y']) + ''.join('|' + ','.join(fbin(v) for v in f) for f in rc['var']) + '|1'
            cons = []
            for c in rc['cons']:
                v = [F(u) for u in c['v']]
                for k in range(3):
                    if any(dirs[k]) and v == dirs[k]:
                        sg = '+'
                        break
                    if any(dirs[k]) and v == [-u for u in dirs[k]]:
                        sg = '-'
                        break
                else:
                    die(f'row {self.t}: node {i}: a constraint vector is not ±d0, ±v2, ±v3')
                hi = '*' if c['hi'] is None else qs(c['hi'])
                cons.append(f'{k},{sg},{qs(c["lo"])},{hi},{qs(c["lam"])},{qs(c["mu"])}')
            out.append((g, ';'.join([str(g), recipe] + cons)))
        out.sort(key=lambda x: x[0])                      # by grid (stable): one table per piece module
        return [','.join(qs(u) for u in d) for d in dirs], out

    # ---- module plan ----
    def anchor_ranges(self):
        cost = [0] * len(self.nodes)
        for i, rec in self.whole:
            cost[i] = COST_ANCHORED if rec['kind'] == 'anchored' else COST_GLOBAL
        ranges, lo, acc = [], 0, COST_TABLES['whole']
        for i, c in enumerate(cost):
            if c and acc + c > BUDGET and acc > COST_TABLES['whole']:
                ranges.append((lo, i, acc))
                lo, acc = i, COST_TABLES['whole']
            acc += c
        ranges.append((lo, len(self.nodes), acc))
        return ranges

    @staticmethod
    def piece_ranges(pieces):
        ranges, lo, acc, grid = [], 0, 0, None
        for j, (g, _) in enumerate(pieces):
            if grid is not None and (g != grid or acc + COST_PIECE[g] > BUDGET):
                ranges.append((lo, j, acc))
                lo, acc = j, 0
            if j == lo:
                acc, grid = COST_TABLES[g], g
            acc += COST_PIECE[g]
        ranges.append((lo, len(pieces), acc))
        return ranges


HEADER = '(generated by `tools/gen_tail_caps.py`; do not edit)'


def common_files():
    return {
        'Common.lean': f'''import Grothe.LowerAnalytic.CapRangeNuDefs

/-!
# The identity-tail certificate: weight, tail and grid of its caps {HEADER}

Witness `(ε, ν) = (191/250, 47/2000)`, in hat units `ε̂ = 25/31`, `ν̂ = 47/1953`.
-/

namespace Grothe.LowerAnalytic

/-- The hat weight `ε̂ = 25/31` of the certificate: the weight of the fibre form of its caps. -/
def tailEps : ℚ := 25 / 31

/-- The hat tail `ν̂ = 47/1953` of the certificate. -/
def tailNu : ℚ := 47 / 1953

/-- The grid of the whole-fibre nodes: `1600 × 256` on `[0, 8]`. -/
def tailGrids : List (ℕ × ℕ × ℚ) := [(1600, 256, 1 / 200)]

end Grothe.LowerAnalytic
''',
        'CommonFacts.lean': f'''import Grothe.LowerAnalytic.CapRowsNu
import {MOD}.Common

/-! # The tail of the certificate lies in `[0, 1)` {HEADER} -/

namespace Grothe.LowerAnalytic

theorem tailNu_nonneg : (0 : ℚ) ≤ tailNu := by norm_num [tailNu]

theorem tailNu_lt_one : tailNu < 1 := by norm_num [tailNu]

end Grothe.LowerAnalytic
'''}


def or_split(var, bounds, last):
    """`var < b₁ ∨ (b₁ ≤ var ∧ var < b₂) ∨ … ∨ (b_k ≤ var ∧ var < last)` and its rcases pattern."""
    parts, pats = [], []
    for k, b in enumerate(bounds + [last]):
        if k == 0:
            parts.append(f'{var} < {b}')
            pats.append('h')
        else:
            parts.append(f'({bounds[k - 1]} ≤ {var} ∧ {var} < {b})')
            pats.append('⟨h1, h2⟩')
    return ' ∨ '.join(parts), ' | '.join(pats)


def row_files(row):
    K = f'{row.K:02d}'
    pre = f'{MOD}.Row{K}'
    files, plan, facts = {}, [], []
    n = len(row.nodes)
    nodes_str = ';'.join(f'{qs(s)}:{qs(c)}' for s, c in zip(row.nodes, row.caps))
    recs = []
    for i, rec in sorted(row.whole, key=lambda x: x[0]):
        gauss, recipe = row.whole_recipe(rec)
        recs.append(f'  ({i}, 0, {"true" if gauss else "false"}, {lstr(recipe)})')
    excl = sorted(i for i, _, _, _ in row.local)
    kinds = {}
    for _, rec in row.whole:
        kinds[rec['kind']] = kinds.get(rec['kind'], 0) + 1
    for _, _, rec, _ in row.local:
        kinds[rec['kind']] = kinds.get(rec['kind'], 0) + 1
    E, R = row.E, row.R
    files['Data.lean'] = f'''import {MOD}.Common

/-!
# Cap data of row {row.K} (`t = {row.t}`) of the identity-tail certificate {HEADER}

Row constants θ from `data/tail-caps/row_set.json`; cap table `data/tail-caps/{row.t}/table.json` (sha256
`{row.table_sha}`), its binding and bound records in the same folder. {n} nodes up to `s = {qs(row.nodes[-1])}`:
{len(row.whole) + len(row.local)} certified by a record ({", ".join(f"{v} {k}" for k, v in sorted(kinds.items()))}), {len(row.chords)} chord nodes.
-/

namespace Grothe.LowerAnalytic

set_option maxRecDepth 100000

/-- Row {row.K} (`t = {row.t}`): forcing parameters, `δ`, `κ`, `smax`, even block, coupling and cap table `s:c;…` (the
row bound and the law certificate of the row are not part of its cap data). -/
def tailRow{K} : Grothe.Lower.Row :=
  ⟨{ql(row.ell)}, {ql(row.beta)}, {ql(row.delta)}, {ql(row.kappa)}, {ql(row.smax)}, (0 : ℚ),
   ⟨{", ".join(ql(v) for v in E)}⟩,
   {ql(row.b[0])}, {ql(row.b[1])}, {ql(row.b[2])},
   {lstr(nodes_str)},
   "", []⟩

/-- The odd block `R` of row {row.K}. -/
def tailR{K} : Grothe.Lower.Sym2 := ⟨{", ".join(ql(v) for v in R)}⟩

/-- The chord nodes `(node, left vertex, right vertex)` of row {row.K}. -/
def tailChords{K} : List (ℕ × ℕ × ℕ) := [{", ".join(f"({i}, {a}, {b})" for i, a, b in row.chords)}]

/-- The whole-fibre nodes of row {row.K}: `(node, grid, Gauss-point means?, recipe)`. -/
def tailRecs{K} : List (ℕ × ℕ × Bool × String) := [
{(",\n").join(recs)}]

/-- The localised nodes of row {row.K} (certified by their pieces). -/
def tailExcl{K} : List ℕ := [{", ".join(str(i) for i in excl)}]

end Grothe.LowerAnalytic
'''
    # whole-fibre range facts
    ranges = row.anchor_ranges()
    for J, (lo, hi, cost) in enumerate(ranges):
        hi_t = f'tailRow{K}.nodeList.length' if hi == n else str(hi)
        files[f'Anchor{J:02d}.lean'] = f'''import {pre}.Data

/-! # Whole-fibre nodes `{lo} ≤ i < {hi}` of row {row.K} (`t = {row.t}`) {HEADER} -/

open GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

theorem tailAnchor{K}_{J:02d} :
    rangeOKNu tailEps tailNu tailRow{K} tailR{K} tailChords{K} (parseRecsNu tailRecs{K}) tailGrids
      tailExcl{K} {lo} {hi_t} = true := by
  native_decide

end Grothe.LowerAnalytic
'''
        plan.append((f'{pre}.Anchor{J:02d}', cost))
        facts.append(f'tailAnchor{K}_{J:02d}')
    # localised nodes
    ncaps = []
    for i, key, rec, pcs in sorted(row.local, key=lambda x: x[0]):
        I = f'{i:03d}'
        dirs, pieces = row.node_record(i, key, rec, pcs)
        m = len(pieces)
        files[f'D{I}.lean'] = f'''/-! # Pieces of node {i} of row {row.K} (`t = {row.t}`, `s = {qs(row.nodes[i])}`, cap `{qs(row.caps[i])}`; record `{key}` of kind `{rec["kind"]}` at `s = {rec["s"]}`) {HEADER} -/

namespace Grothe.LowerAnalytic

set_option maxRecDepth 100000

/-- Node {i} of row {row.K}: directions `d₀, v₂, v₃` and pieces `grid;recipe;constraints`. -/
def tailNode{K}_{I} : Nat × Nat × List String × List String :=
  ({row.K}, {i}, [{", ".join(lstr(d) for d in dirs)}], [
{(",\n").join("    " + lstr(p) for _, p in pieces)}])

end Grothe.LowerAnalytic
'''
        files[f'C{I}.lean'] = f'''import Grothe.LowerAnalytic.CapPieceRange
import {pre}.D{I}

/-! # Coverage of node {i} of row {row.K} (`t = {row.t}`) {HEADER} -/

namespace Grothe.LowerAnalytic

theorem tailCover{K}_{I} : pieceCoverFastOK tailNode{K}_{I} = true := by native_decide

end Grothe.LowerAnalytic
'''
        plan.append((f'{pre}.C{I}', 5))
        facts.append(f'tailCover{K}_{I}')
        pr = Row.piece_ranges(pieces)
        for J, (lo, hi, cost) in enumerate(pr):
            files[f'R{I}_{J}.lean'] = f'''import {pre}.Data
import {pre}.D{I}

/-! # Pieces `{lo} ≤ j < {hi}` of node {i} of row {row.K} (`t = {row.t}`) {HEADER} -/

open GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

theorem tailPieces{K}_{I}_{J} :
    pieceRangeOKNu tailEps tailNu tailRow{K} tailR{K} tailNode{K}_{I} {lo} {hi} = true := by
  native_decide

end Grothe.LowerAnalytic
'''
            plan.append((f'{pre}.R{I}_{J}', cost))
            facts.append(f'tailPieces{K}_{I}_{J}')
        imports = '\n'.join([f'import {MOD}.CommonFacts', f'import {pre}.Data', f'import {pre}.C{I}'] +
                            [f'import {pre}.R{I}_{J}' for J in range(len(pr))])
        if len(pr) == 1:
            body = f'  exact pieceOneOKNu_of_range tailPieces{K}_{I}_0 (Nat.zero_le _) hj'
        else:
            disj, pats = or_split('j', [lo for lo, _, _ in pr[1:]], m)
            cases = [f'pieceOneOKNu_of_range tailPieces{K}_{I}_0 (Nat.zero_le _) h'] + \
                    [f'pieceOneOKNu_of_range tailPieces{K}_{I}_{J} h1 h2' for J in range(1, len(pr))]
            body = (f'  rcases (by omega : {disj}) with {pats}\n' +
                    '\n'.join(f'  · exact {c}' for c in cases))
        files[f'N{I}.lean'] = f'''{imports}

/-! # The cap of node {i} of row {row.K} (`t = {row.t}`) from its {m} pieces {HEADER} -/

namespace Grothe.LowerAnalytic

set_option maxRecDepth 100000

/-- **The cap of node {i} of row {row.K}** with the tail `ν̂`, at the weight `ε̂` of the certificate. -/
theorem tailNodeCap{K}_{I} (heps : tailEps = Grothe.Lower.ε) : NodeCapNu tailNu tailRow{K} tailR{K} {i} := by
  refine nodeCapNu_of_ranges heps tailNu_nonneg tailNu_lt_one tailRow{K} tailR{K} tailNode{K}_{I}
    (pieceCoverOK_of_fast tailCover{K}_{I}) (fun j hj => ?_)
  have hn : tailNode{K}_{I}.2.2.2.length = {m} := rfl
  rw [hn] at hj
{body}

end Grothe.LowerAnalytic
'''
        plan.append((f'{pre}.N{I}', 2))
        ncaps.append((i, I))
    # assembly
    imports = '\n'.join([f'import {MOD}.CommonFacts', f'import {pre}.Data'] +
                        [f'import {pre}.Anchor{J:02d}' for J in range(len(ranges))] +
                        [f'import {pre}.N{I}' for _, I in ncaps])
    if ncaps:
        excl_proof = (f'''  intro i hmem _hi
  simp only [tailExcl{K}, List.mem_cons, List.not_mem_nil, or_false] at hmem
  rcases hmem with {" | ".join("rfl" for _ in ncaps)}
''' + '\n'.join(f'  · exact tailNodeCap{K}_{I} heps' for _, I in ncaps))
    else:
        excl_proof = f'  intro i hmem\n  simp [tailExcl{K}] at hmem'
    if len(ranges) == 1:
        vbody = f'  exact nodeCapNu_of_rangeOK heps tailNu_nonneg tailNu_lt_one tailAnchor{K}_00 (tailExclCaps{K} heps)\n    (Nat.zero_le _) hi hi hc'
    else:
        bounds = [lo for lo, _, _ in ranges[1:]]
        parts = [f'i < {bounds[0]}'] + [f'({bounds[k - 1]} ≤ i ∧ i < {bounds[k]})' for k in range(1, len(bounds))] + [f'{bounds[-1]} ≤ i']
        pats = ['h'] + ['⟨h1, h2⟩'] * (len(bounds) - 1) + ['h1']
        lines = [f'  rcases (show {" ∨ ".join(parts)} by omega) with {" | ".join(pats)}']
        for J in range(len(ranges)):
            args = '(Nat.zero_le _) h' if J == 0 else ('h1 hi' if J == len(ranges) - 1 else 'h1 h2')
            lines.append(f'  · exact nodeCapNu_of_rangeOK heps tailNu_nonneg tailNu_lt_one tailAnchor{K}_{J:02d}\n      (tailExclCaps{K} heps) {args} hi hc')
        vbody = '\n'.join(lines)
    files['Assembly.lean'] = f'''{imports}

/-!
# The node caps of row {row.K} (`t = {row.t}`) of the identity-tail certificate {HEADER}

The vertex caps from the whole-fibre range facts and the caps of the localised nodes, the chord nodes by convexity
(`nodeCaps_of_vertexCapsNu`). Every statement takes `tailEps = ε`: the facts are checked at the weight `ε̂ = 25/31` of the
certificate, which is the rows' weight `ε` once the rows of the repository are those of the certificate.
-/

open GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

set_option maxRecDepth 100000

theorem tailExclCaps{K} (heps : tailEps = Grothe.Lower.ε) :
    ExclCapsNu tailNu tailRow{K} tailR{K} tailExcl{K} := by
{excl_proof}

theorem tailVertexCaps{K} (heps : tailEps = Grothe.Lower.ε) :
    VertexCapsRowNu tailNu tailRow{K} tailR{K} tailChords{K} := by
  intro i hi hc
{vbody}

theorem tailChordsOK{K} : chordOKLow tailRow{K}.nodeList tailChords{K} = true := by native_decide

theorem tailPsd{K} : tailRow{K}.E.psdOK = true ∧ tailR{K}.psdOK = true := by decide +kernel

/-- **The node caps of row {row.K}** (`t = {row.t}`) with the tail `ν̂`, at the weight `ε̂` of the certificate. -/
theorem tailCaps{K} (heps : tailEps = Grothe.Lower.ε) :
    ∀ m ∈ tailRow{K}.nodeList, pot tailRow{K}.E tailR{K} tailRow{K}.ell tailRow{K}.beta
      (aFib tailRow{K}.b1 tailRow{K}.b2 tailRow{K}.b3) tailNu m.1 - capPad ≤ m.2 :=
  nodeCaps_of_vertexCapsNu tailPsd{K}.1 tailPsd{K}.2 tailChordsOK{K} (tailVertexCaps{K} heps)

end Grothe.LowerAnalytic
'''
    plan.append((f'{pre}.Assembly', 5))
    facts.append(f'tailChordsOK{K}')
    fields = ['ell', 'beta', 'delta', 'kappa', 'smax', 'E', 'b1', 'b2', 'b3', 'nodes']
    files['Bridge.lean'] = (f'''import {pre}.Data
import Grothe.Lower.TailRows.Row{K}

/-! # Row {row.K} (`t = {row.t}`): the row of the caps is the row of the Stein side {HEADER}

The cap data `tailRow{K}` and the Stein row `tailSteinRow{K}` (`gen_lower_data.py --tail`) are written from the same constants
and the same cap table; their common fields agree by `rfl`. -/

namespace Grothe.LowerAnalytic

theorem tailBridge{K} :
    ''' + ' ∧\n      '.join(f'Grothe.Lower.tailSteinRow{K}.{fl} = tailRow{K}.{fl}' for fl in fields) +
        ' :=\n  ⟨' + ', '.join('rfl' for _ in fields) + '⟩\n\nend Grothe.LowerAnalytic\n')
    plan.append((f'{pre}.Bridge', 2))
    return {f'Row{K}/{k}': v for k, v in files.items()}, plan, facts


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--rows', default='')
    ap.add_argument('--check', action='store_true')
    ap.add_argument('--plan', action='store_true')
    ap.add_argument('--dry-run', action='store_true')
    ap.add_argument('--out', default='')
    args = ap.parse_args()
    check_inputs()
    S = json.load(open(os.path.join(DATA, 'row_set.json')))
    caprows = [P for P in S['pieces'] if P.get('kind') == 'caprow']
    want = [t for t in args.rows.split(',') if t] or [P['name'] for P in caprows]
    files, plan, facts = dict(common_files()), [], []
    for t in want:
        P = next((P for P in caprows if P['name'] == t), None)
        if P is None:
            die(f'no cap row {t} in row_set.json')
        fs, pl, fa = row_files(Row(P))
        files.update(fs)
        plan += pl
        facts += fa
    native = ''.join(f'Grothe.LowerAnalytic.{f}._native.native_decide.ax_1_1\n' for f in sorted(facts))
    native_path = os.path.join(DATA, 'native.txt')
    out = args.out or os.path.join(ROOT, OUTREL)
    if args.plan:
        for mod, cost in plan:
            print(f'{cost:6d} s  {mod}')
        print(f'{len(plan)} modules, {sum(c for _, c in plan)} s estimated (one process on yo)')
    if args.dry_run:
        print(f'gen_tail_caps --dry-run: rows {",".join(want)} pass every check; {len(files)} files would be written')
        return
    if args.check:
        bad = [k for k, v in files.items() if not os.path.exists(os.path.join(out, k)) or open(os.path.join(out, k), encoding='utf-8').read() != v]
        if not os.path.exists(native_path) or open(native_path, encoding='utf-8').read() != native:
            bad.append('../../../data/tail-caps/native.txt')
        for k in bad:
            print(f'differs: {OUTREL}/{k}')
        if bad:
            sys.exit(1)
        print(f'gen_tail_caps --check: {len(files)} files of rows {",".join(want)} reproduce byte for byte')
        return
    for k, v in files.items():
        p = os.path.join(out, k)
        os.makedirs(os.path.dirname(p), exist_ok=True)
        with open(p, 'w', encoding='utf-8') as f:
            f.write(v)
    if not args.out:
        with open(native_path, 'w', encoding='utf-8') as f:
            f.write(native)
    print(f'gen_tail_caps: {len(files)} files written for rows {",".join(want)}; {len(facts)} native facts' +
          ('' if args.out else ' in data/tail-caps/native.txt'))


if __name__ == '__main__':
    main()
