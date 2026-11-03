#!/usr/bin/env python3
"""Reproduce all original conditional-node offset/cutoff rows in Lean.

The three small binary inputs are immutable historical data, not numerical
enclosures. Generated Lean checks the literal layout and integer counts;
it does not establish the analytic cutoff or any floating-point error.
Agent-ID: codex-aa04.
"""
from pathlib import Path
import hashlib
import sys
import numpy as np

ROOT = Path(__file__).resolve().parents[2]
DATA = ROOT / 'data/q0_quadrature/conditional_source'
OUT = ROOT / 'Grothe/UpperChaos'
HASHES = {
    'conditional_offsets.npy': '8bf1649d9620449873e32a8fa120709f29888885e8e43ae024c5305b95101c5c',
    'conditional_cutoffs.npy': 'b799d62d61e3183a13b16dbe3e0cd22ac8d3460779e0e0d561ecd11f63ebb10f',
    'conditional_canonical_pairs.npy': '075eb8fe8a52766742c7ca82097171f8dfce173ac8dc9ed80193fc7821ee1ead',
    'conditionalnodes_header.bin': 'ade6bc86992c071913fce63b966ebe535e0aea620d4681d7ce4886ea03a6aa01',
}
CHUNK = 128
GROUP = 8
NODES = 21577
VALUES = 421701618

def inputs():
    for name, expected in HASHES.items():
        actual = hashlib.sha256((DATA / name).read_bytes()).hexdigest()
        if actual != expected:
            raise ValueError(f'{name}: SHA-256 {actual} != pinned {expected}')
    header = (DATA / 'conditionalnodes_header.bin').read_bytes()
    if not (len(header) == 128 and header.startswith(b'\x93NUMPY\x01\x00v\x00') and
            b"'descr': '<f8'" in header and b"'fortran_order': False" in header and
            b"'shape': (421701618,)" in header):
        raise ValueError('unexpected saved conditional NPY header')
    offsets = np.load(DATA / 'conditional_offsets.npy', allow_pickle=False)
    cutoffs = np.load(DATA / 'conditional_cutoffs.npy', allow_pickle=False)
    pairs = np.load(DATA / 'conditional_canonical_pairs.npy', allow_pickle=False)
    if offsets.shape != (NODES + 1,) or offsets.dtype.str != '<i8':
        raise ValueError('unexpected original offset array shape/dtype')
    if cutoffs.shape != (NODES,) or cutoffs.dtype.str != '<i2':
        raise ValueError('unexpected original cutoff array shape/dtype')
    if pairs.shape != (35777, 2) or pairs.dtype.str != '<i2':
        raise ValueError('unexpected original pair array shape/dtype')
    expected = [(c, m - c) for m in range(532)
                for c in range(max(0, m - 265), min(266, m, (m + 1)//2) + 1)]
    if pairs.tolist() != [list(pair) for pair in expected]:
        raise ValueError('historical pair enumeration differs')
    off = [int(x) for x in offsets]
    cut = [int(x) for x in cutoffs]
    if off[0] != 0 or off[-1] != VALUES or any(k < 0 or k > 532 for k in cut):
        raise ValueError('unexpected offset endpoints or cutoff')
    degrees = pairs.astype(np.int64).sum(axis=1)
    counts = np.searchsorted(degrees, np.minimum(cutoffs, 531), side='right')
    if any(off[i+1] != off[i] + int(counts[i]) for i in range(NODES)):
        raise ValueError('offset/cutoff mismatch')
    return off, cut

def make_check():
    return '''import Grothe.UpperChaos.Q0GaussSourceAddress
import Mathlib.Data.List.Chain
import Mathlib.Tactic

/-! Integer layout of the original conditional-node storage. Literal source
data are generated from hash-pinned NPY inputs. Analytic error bounds and
the 3.37 GB payload are separate. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0ConditionalMetadataCheck

structure Row where
  index : ℕ
  first : ℕ
  last : ℕ
  cutoff : ℕ
  deriving DecidableEq, Inhabited

/-- Number of canonical degree-531 pairs at degrees strictly below m. -/
def pairPrefix (m : ℕ) : ℕ :=
  m + m*m/4 - (m-266)*(m-265)/2

/-- Number of pairs of exact total degree m in the original storage order. -/
def degreeCount (m : ℕ) : ℕ :=
  min 266 (min m ((m+1)/2)) + 1 - (m-265)

set_option maxRecDepth 8192 in
set_option maxHeartbeats 4000000 in
/-- Every finite prefix increment has the correct degree-block size. -/
theorem prefix_increment_checked :
    (List.range 532).all (fun m => decide (pairPrefix (m+1) = pairPrefix m + degreeCount m)) = true := by
  decide +kernel

theorem prefix_increment (m : ℕ) (hm : m < 532) :
    pairPrefix (m+1) = pairPrefix m + degreeCount m := by
  have h := (List.all_eq_true.mp prefix_increment_checked) m (List.mem_range.mpr hm)
  exact of_decide_eq_true h

def valid (r : Row) : Bool :=
  decide (r.index < 21577 ∧ r.cutoff ≤ 532 ∧
    r.last = r.first + pairPrefix (min r.cutoff 531 + 1) ∧ r.last ≤ 421701618)

theorem valid_sound (r : Row) (h : valid r = true) :
    r.index < 21577 ∧ r.cutoff ≤ 532 ∧
      r.last = r.first + pairPrefix (min r.cutoff 531 + 1) ∧ r.last ≤ 421701618 :=
  of_decide_eq_true h

/-- Consecutive stored records have consecutive ordinals and share the
same end/start offset. -/
def adjacent (a b : Row) : Prop := a.index + 1 = b.index ∧ a.last = b.first

instance : DecidableRel adjacent := fun a b =>
  inferInstanceAs (Decidable (a.index + 1 = b.index ∧ a.last = b.first))

end Grothe.UpperChaos.Q0ConditionalMetadataCheck
'''

def generate():
    offsets, cutoffs = inputs()
    files = {OUT / 'Q0ConditionalMetadataCheck.lean': make_check().encode()}
    groups = []
    for start in range(0, NODES, CHUNK * GROUP):
        group = start // (CHUNK * GROUP)
        name = f'Q0ConditionalMetadataGroup{group:03}'
        ns = f'Grothe.UpperChaos.{name}'
        dep = 'Q0ConditionalMetadataCheck' if group == 0 else f'Q0ConditionalMetadataGroup{group-1:03}'
        lines = [f'import Grothe.UpperChaos.{dep}', '',
                 '/-! Actual original ordinal/offset/cutoff literals; kernel checks.',
                 'Agent-ID: codex-aa04. -/', f'namespace {ns}', '',
                 'open Grothe.UpperChaos.Q0ConditionalMetadataCheck', '']
        chunks = []
        for ci, off in enumerate(range(start, min(start + CHUNK*GROUP, NODES), CHUNK)):
            count = min(CHUNK, NODES - off)
            chunks.append((ci, off, count))
            lines.append(f'def rows{ci} : List Row := [')
            for j in range(off, off + count):
                lines.append(f'  ⟨{j}, {offsets[j]}, {offsets[j+1]}, {cutoffs[j]}⟩' + (',' if j+1 < off+count else ''))
            lines += [']', '',
                f'theorem checked{ci} : rows{ci}.all valid = true := by decide +kernel',
                f'theorem indices{ci} : rows{ci}.map Row.index = List.range\' {off} {count} := by decide +kernel',
                f'theorem count{ci} : rows{ci}.length = {count} := by decide +kernel',
                f'theorem chain{ci} : rows{ci}.IsChain adjacent := by decide +kernel',
                f'theorem first{ci} : rows{ci}.head? = some ⟨{off}, {offsets[off]}, {offsets[off+1]}, {cutoffs[off]}⟩ := by decide +kernel',
                f'theorem last{ci} : rows{ci}.getLast? = some ⟨{off+count-1}, {offsets[off+count-1]}, {offsets[off+count]}, {cutoffs[off+count-1]}⟩ := by decide +kernel', '']
        count = sum(x[2] for x in chunks)
        join = ' ++ '.join(f'rows{i}' for i,_,_ in chunks)
        lines += [f'def rows : List Row := {join}', '',
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
        lines += ['', f'theorem count : rows.length = {count} := by',
            '  simp only [rows, ' + ', '.join((['List.length_append'] if len(chunks)>1 else []) +
                [f'count{i}' for i,_,_ in chunks]) + ']', '',
            'theorem chain : rows.IsChain adjacent := by']
        if len(chunks) == 1:
            lines += ['  simpa only [rows] using chain0']
        else:
            lines += ['  simp [rows, List.isChain_append, adjacent, ' + ', '.join(
                [f'chain{i}' for i,_,_ in chunks] + [f'first{i}' for i,_,_ in chunks[1:]] +
                [f'last{i}' for i,_,_ in chunks[:-1]]) + ']']
        lines += ['',
            f'theorem first : rows.head? = some ⟨{start}, {offsets[start]}, {offsets[start+1]}, {cutoffs[start]}⟩ := by',
            '  simp [rows, first0]', '',
            f'theorem last : rows.getLast? = some ⟨{start+count-1}, {offsets[start+count-1]}, {offsets[start+count]}, {cutoffs[start+count-1]}⟩ := by',
            f'  simp [rows, last{chunks[-1][0]}]', '', f'end {ns}', '']
        files[OUT / f'{name}.lean'] = '\n'.join(lines).encode()
        groups.append((group, start, count))
    refs = [f'Grothe.UpperChaos.Q0ConditionalMetadataGroup{g:03}' for g,_,_ in groups]
    ns = 'Grothe.UpperChaos.Q0ConditionalMetadataAll'
    lines = [*(f'import {r}' for r in refs),
      'import Grothe.UpperChaos.Q0OrdinalCoverage', '',
      '/-! Source ordinal coverage for the complete original offset/cutoff table.',
      'Numerical coefficient bounds and NPY payload decoding remain separate.',
      'Agent-ID: codex-aa04. -/', f'namespace {ns}', '',
      'open Grothe.UpperChaos.Q0ConditionalMetadataCheck',
      'open Grothe.UpperChaos.Q0GaussOrdinalEquiv', '',
      'def rows : List Row := ' + ' ++ '.join(r+'.rows' for r in refs), '',
      'theorem checked : rows.all valid = true := by',
      '  simp only [rows, List.all_append, ' + ', '.join(r+'.checked' for r in refs) + ', Bool.and_self]', '',
      'theorem indices : rows.map Row.index = List.range\' 0 21577 := by',
      '  simp only [rows, List.map_append, ' + ', '.join(r+'.indices' for r in refs) + ', List.append_assoc]']
    steps = [f"← List.range'_append_1 (s := {start}) (m := {count}) (n := {sum(k for _,_,k in groups[j+1:])})"
             for j,(_,start,count) in enumerate(groups[:-1])]
    lines += ['  rw [' + ',\n    '.join(steps) + ']', '',
      '/-- All 21,577 records form a continuous ordinal and offset chain. -/',
      'theorem chain : rows.IsChain adjacent := by',
      '  simp [rows, List.isChain_append, adjacent, ' + ', '.join(
          [r+'.chain' for r in refs] + [r+'.first' for r in refs[1:]] + [r+'.last' for r in refs[:-1]]) + ']', '',
      '/-- Every actual source panel/rule address has exactly one metadata row. -/',
      'theorem unique_row_for_address (a : Address) :',
      '    ∃! r : Row, r ∈ rows ∧ r.index = (fromAddress a).val :=',
      '  Grothe.UpperChaos.Q0OrdinalCoverage.exists_unique_of_map_range Row.index',
      '    rows 21577 indices (fromAddress a).val (fromAddress a).isLt', '',
      'noncomputable def rowAt (a : Address) : Row :=',
      '  Classical.choose (unique_row_for_address a).exists', '',
      '/-- The actual-address row preserves the original ordinal and its',
      'stored offset/cutoff integer invariants. -/',
      'theorem rowAt_spec (a : Address) :',
      '    rowAt a ∈ rows ∧ (rowAt a).index = (fromAddress a).val ∧',
      '    (rowAt a).cutoff ≤ 532 ∧',
      '    (rowAt a).last = (rowAt a).first + pairPrefix (min (rowAt a).cutoff 531 + 1) ∧',
      '    (rowAt a).last ≤ 421701618 := by',
      '  have h := Classical.choose_spec (unique_row_for_address a).exists',
      '  have hv := valid_sound (rowAt a) ((List.all_eq_true.mp checked) (rowAt a) h.1)',
      '  exact ⟨h.1, h.2, hv.2.1, hv.2.2.1, hv.2.2.2⟩', '',
      '/-- A retained rank resolves to a valid value-record and byte span in',
      'the original little-endian NPY payload (which starts after 128 bytes). -/',
      'theorem retained_index_bounds (a : Address) (rank : ℕ)',
      '    (h : rank < (rowAt a).last - (rowAt a).first) :',
      '    (rowAt a).first ≤ (rowAt a).first + rank ∧',
      '    (rowAt a).first + rank < (rowAt a).last ∧',
      '    (rowAt a).first + rank < 421701618 ∧',
      '    128 + 8 * ((rowAt a).first + rank) + 8 ≤ 3373613072 := by',
      '  have hl := (rowAt_spec a).2.2.2.2',
      '  omega', '',
      '/-- The original table has exactly the recorded first and final offsets. -/',
      f'theorem first_offset : (Grothe.UpperChaos.Q0ConditionalMetadataGroup000.rows0.head!).first = {offsets[0]} := by decide +kernel',
      f'theorem final_offset : (Grothe.UpperChaos.Q0ConditionalMetadataGroup{groups[-1][0]:03}.rows{(groups[-1][2]-1)//CHUNK}.getLast!).last = {offsets[-1]} := by decide +kernel', '',
      f'end {ns}', '']
    files[OUT/'Q0ConditionalMetadataAll.lean'] = '\n'.join(lines).encode()
    lines = ['import Grothe.UpperChaos.Q0ConditionalMetadataAll', 'import Lean.Util.CollectAxioms',
      'import Lean.Elab.Command', '', '/-! Strict standard-three audit. Agent-ID: codex-aa04. -/',
      'open Lean Elab Command', 'run_cmd do',
      '  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]',
      '  for target in #[``Grothe.UpperChaos.Q0ConditionalMetadataCheck.prefix_increment,',
      '      ``Grothe.UpperChaos.Q0ConditionalMetadataAll.unique_row_for_address,',
      '      ``Grothe.UpperChaos.Q0ConditionalMetadataAll.rowAt_spec,',
      '      ``Grothe.UpperChaos.Q0ConditionalMetadataAll.chain,',
      '      ``Grothe.UpperChaos.Q0ConditionalMetadataAll.retained_index_bounds,',
      '      ``Grothe.UpperChaos.Q0ConditionalMetadataAll.first_offset,',
      '      ``Grothe.UpperChaos.Q0ConditionalMetadataAll.final_offset] do',
      '    let dependencies ← Lean.collectAxioms target',
      '    logInfo m!"Conditional metadata audit {target}: {dependencies}"',
      '    for dependency in dependencies do',
      '      unless allowed.contains dependency do',
      '        throwError m!"{target} uses unexpected axiom {dependency}"', '']
    files[OUT/'Q0ConditionalMetadataAudit.lean'] = '\n'.join(lines).encode()
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
        raise SystemExit('usage: gen_conditional_source_metadata.py [--check]')
    print(f'{len(files)} generated Lean modules; {sum(map(len,files.values()))} bytes')
