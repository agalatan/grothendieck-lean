#!/usr/bin/env python3
"""Generate a Lean certificate for every original degree-531 pair rank.

The NPY hash binds generator input provenance; Lean checks the emitted literals
and finite properties, not the NPY byte parser or any analytic bound.
Agent-ID: codex-aa04.
"""
from pathlib import Path
import hashlib
import sys
import numpy as np

ROOT = Path(__file__).resolve().parents[2]
INPUT = ROOT / 'data/q0_quadrature/conditional_source/conditional_canonical_pairs.npy'
OUT = ROOT / 'Grothe/UpperChaos'
SHA256 = '075eb8fe8a52766742c7ca82097171f8dfce173ac8dc9ed80193fc7821ee1ead'
COUNT = 35777
CHUNK = 128
GROUP = 8


def rank(c, d):
    m = c + d
    return m + m*m//4 - max(0, m-266)*max(0, m-265)//2 + c - max(0, m-265)


def inputs():
    if hashlib.sha256(INPUT.read_bytes()).hexdigest() != SHA256:
        raise ValueError('original pair input hash mismatch')
    array = np.load(INPUT, allow_pickle=False)
    if array.shape != (COUNT, 2) or array.dtype.str != '<i2':
        raise ValueError('unexpected pair input shape or dtype')
    pairs = [tuple(map(int, pair)) for pair in array]
    expected = [(c, m-c) for m in range(532)
                for c in range(max(0, m-265), min(266, m, (m+1)//2)+1)]
    if pairs != expected or any(rank(c, d) != i for i, (c, d) in enumerate(pairs)):
        raise ValueError('original ordering/rank mismatch')
    return pairs


def generate():
    pairs = inputs()
    files = {}
    files[OUT / 'Q0ConditionalPairRankCheck.lean'] = '''import Grothe.UpperChaos.Q0OrdinalCoverage
import Mathlib.Tactic

/-! Finite integer rank of the original degree-531 canonical pair table.
Generator input provenance is separate from Lean's literal checks.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0ConditionalPairRankCheck

structure Row where
  index : ℕ
  c : ℕ
  d : ℕ
  deriving DecidableEq, Inhabited

/-- Zero-based original storage rank for a valid canonical pair. -/
def rank (c d : ℕ) : ℕ :=
  let m := c + d
  m + m*m/4 - (m-266)*(m-265)/2 + c - (m-265)

def valid (r : Row) : Bool :=
  decide (r.index = rank r.c r.d ∧ r.c ≤ 266 ∧ r.d ≤ 265 ∧
    r.c ≤ r.d + 1 ∧ r.c + r.d ≤ 531)

theorem valid_sound (r : Row) (h : valid r = true) :
    r.index = rank r.c r.d ∧ r.c ≤ 266 ∧ r.d ≤ 265 ∧
      r.c ≤ r.d + 1 ∧ r.c + r.d ≤ 531 := of_decide_eq_true h

end Grothe.UpperChaos.Q0ConditionalPairRankCheck
'''.encode()
    groups = []
    for start in range(0, COUNT, CHUNK * GROUP):
        group = start // (CHUNK * GROUP)
        name = f'Q0ConditionalPairRankGroup{group:03}'
        ns = f'Grothe.UpperChaos.{name}'
        lines = ['import Grothe.UpperChaos.Q0ConditionalPairRankCheck', '',
                 '/-! Original ordered pair literals and exact rank checks.',
                 'Agent-ID: codex-aa04. -/',
                 f'namespace {ns}', '', 'open Grothe.UpperChaos.Q0ConditionalPairRankCheck', '']
        chunks = []
        for ci, off in enumerate(range(start, min(start + CHUNK * GROUP, COUNT), CHUNK)):
            n = min(CHUNK, COUNT - off)
            chunks.append((ci, off, n))
            lines.append(f'def rows{ci} : List Row := [')
            for j in range(off, off+n):
                c, d = pairs[j]
                lines.append(f'  ⟨{j}, {c}, {d}⟩' + (',' if j+1 < off+n else ''))
            lines += [']', '',
                      f'theorem checked{ci} : rows{ci}.all valid = true := by decide +kernel',
                      f'theorem indices{ci} : rows{ci}.map Row.index = List.range\' {off} {n} := by decide +kernel', '']
        count = sum(n for _, _, n in chunks)
        lines += ['def rows : List Row := ' + ' ++ '.join(f'rows{i}' for i,_,_ in chunks), '',
                  'theorem checked : rows.all valid = true := by',
                  '  simp only [rows, ' + ', '.join((['List.all_append'] if len(chunks)>1 else []) +
                      [f'checked{i}' for i,_,_ in chunks] + (['Bool.and_self'] if len(chunks)>1 else [])) + ']', '',
                  f'theorem indices : rows.map Row.index = List.range\' {start} {count} := by',
                  '  simp only [rows, ' + ', '.join((['List.map_append'] if len(chunks)>1 else []) +
                      [f'indices{i}' for i,_,_ in chunks] + (['List.append_assoc'] if len(chunks)>1 else [])) + ']']
        if len(chunks)>1:
            steps = [f"← List.range'_append_1 (s := {off}) (m := {n}) (n := {sum(k for _,_,k in chunks[j+1:])})"
                     for j,(_,off,n) in enumerate(chunks[:-1])]
            lines.append('  rw [' + ',\n    '.join(steps) + ']')
        lines += ['', f'end {ns}', '']
        files[OUT / (name + '.lean')] = '\n'.join(lines).encode()
        groups.append((group, start, count))

    refs = [f'Grothe.UpperChaos.Q0ConditionalPairRankGroup{g:03}' for g,_,_ in groups]
    ns = 'Grothe.UpperChaos.Q0ConditionalPairRankAll'
    lines = [*(f'import {r}' for r in refs), '',
             '/-! All 35,777 original pair ranks and finite lookup coverage.',
             'The historical NPY bytes are not interpreted by this theorem.',
             'Agent-ID: codex-aa04. -/', f'namespace {ns}', '',
             'open Grothe.UpperChaos.Q0ConditionalPairRankCheck', '',
             'def rows : List Row := ' + ' ++ '.join(r+'.rows' for r in refs), '',
             'theorem checked : rows.all valid = true := by',
             '  simp only [rows, List.all_append, ' + ', '.join(r+'.checked' for r in refs) + ', Bool.and_self]', '',
             'theorem indices : rows.map Row.index = List.range\' 0 35777 := by',
             '  simp only [rows, List.map_append, ' + ', '.join(r+'.indices' for r in refs) + ', List.append_assoc]']
    steps = [f"← List.range'_append_1 (s := {start}) (m := {count}) (n := {sum(k for _,_,k in groups[j+1:])})"
             for j,(_,start,count) in enumerate(groups[:-1])]
    lines += ['  rw [' + ',\n    '.join(steps) + ']', '',
              '/-- Every index of the original pair table selects exactly one row. -/',
              'theorem unique_row (i : Fin 35777) :',
              '    ∃! r : Row, r ∈ rows ∧ r.index = i.val :=',
              '  Grothe.UpperChaos.Q0OrdinalCoverage.exists_unique_of_map_range Row.index',
              '    rows 35777 indices i.val i.isLt', '',
              'noncomputable def rowAt (i : Fin 35777) : Row :=',
              '  Classical.choose (unique_row i).exists', '',
              'theorem rowAt_spec (i : Fin 35777) :',
              '    rowAt i ∈ rows ∧ (rowAt i).index = i.val ∧ valid (rowAt i) = true := by',
              '  have h := Classical.choose_spec (unique_row i).exists',
              '  exact ⟨h.1, h.2, (List.all_eq_true.mp checked) (rowAt i) h.1⟩', '',
              '/-- The selected literal pair computes exactly its ordinal rank. -/',
              'theorem rowAt_rank (i : Fin 35777) :',
              '    rank (rowAt i).c (rowAt i).d = i.val := by',
              '  have h := rowAt_spec i',
              '  exact (valid_sound (rowAt i) h.2.2).1.symm.trans h.2.1', '',
              '/-- No two saved rows contain the same canonical pair. -/',
              'theorem pair_unique {r s : Row} (hr : r ∈ rows) (hs : s ∈ rows)',
              '    (hc : r.c = s.c) (hd : r.d = s.d) : r = s := by',
              '  have vr := valid_sound r ((List.all_eq_true.mp checked) r hr)',
              '  have vs := valid_sound s ((List.all_eq_true.mp checked) s hs)',
              '  have hi : r.index = s.index := by rw [vr.1, vs.1, hc, hd]',
              '  have hn : (rows.map Row.index).Nodup := by',
              "    rw [indices]; exact List.nodup_range' _",
              '  exact List.inj_on_of_nodup_map hn hr hs hi', '',
              f'end {ns}', '']
    files[OUT / 'Q0ConditionalPairRankAll.lean'] = '\n'.join(lines).encode()
    files[OUT / 'Q0ConditionalPairRankAudit.lean'] = '''import Grothe.UpperChaos.Q0ConditionalPairRankAll
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Strict transitive audit of the original finite pair-rank table.
Agent-ID: codex-aa04. -/
open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0ConditionalPairRankAll.checked,
      ``Grothe.UpperChaos.Q0ConditionalPairRankAll.indices,
      ``Grothe.UpperChaos.Q0ConditionalPairRankAll.unique_row,
      ``Grothe.UpperChaos.Q0ConditionalPairRankAll.rowAt_spec,
      ``Grothe.UpperChaos.Q0ConditionalPairRankAll.rowAt_rank,
      ``Grothe.UpperChaos.Q0ConditionalPairRankAll.pair_unique] do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Conditional pair-rank audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
'''.encode()
    return files


if __name__ == '__main__':
    files = generate()
    if sys.argv[1:] == ['--check']:
        mismatch = [str(path) for path, data in files.items() if not path.is_file() or path.read_bytes() != data]
        if mismatch:
            raise ValueError('missing/different generated files: ' + ', '.join(mismatch))
    elif not sys.argv[1:]:
        for path, data in files.items():
            path.write_bytes(data)
    else:
        raise SystemExit('usage: gen_conditional_pair_ranks.py [--check]')
    print(f'{len(files)} generated Lean modules; {sum(map(len, files.values()))} bytes')
