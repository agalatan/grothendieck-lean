#!/usr/bin/env python3
"""Draft per-grade actual-array bindings for first/second centers.

The authoritative arrays and kernel-checked subchunk energy receipts must be
provided separately. Generated Lean modules remain unverified until compiled.
"""
from pathlib import Path
import argparse, hashlib, json
ROOT = Path(__file__).resolve().parents[1]
SIDES = [('First', 'first', 91), ('Second', 'second', 46)]

def values(side,q): return f'{side}CenterGrade{q:03}.values'
def names(side,n): return ' ++ '.join(values(side,q) for q in range(n))
def length(q): return (q+1)*(q+2)
def offset(q): return q*(q+1)*(q+2)//3
def cat(side,lo,hi): return ' ++ '.join(values(side,q) for q in range(lo,hi)) or '[]'

def generate():
    files={}
    binding=['import Grothe.UpperChaos.TaylorFirstSecondSource','',
      '/-! Direct aliases of the actual first/second center integer arrays.',
      'No copied witness or numerical bound is asserted. Draft until Lean checked.',
      'Agent-ID: codex-8c4d. -/', 'namespace Grothe.UpperChaos','']
    for side,low,count in SIDES:
        for q in range(count):
            binding += [f'namespace {side}CenterGrade{q:03}',
                        f'def values : List ℤ := {low}CenterIntegerGrade{q:03}.toList',
                        f'end {side}CenterGrade{q:03}','']
    binding += ['namespace FirstSecondIntegerBinding']
    for side,low,count in SIDES:
        binding += [f'def {low}AllValues : List ℤ := {low}CenterIntegerValues',
          f'theorem {low}_source_values : {low}CenterIntegerValues =',
          f'    {names(side,count)} := by rfl',
          f'theorem {low}_source_array : {low}CenterInts = {low}AllValues.toArray := by rfl','']
    binding += ['end FirstSecondIntegerBinding','end Grothe.UpperChaos','']
    files['FirstSecondIntegerBinding.lean']='\n'.join(binding)

    for side,low,count in SIDES:
      for q in range(count):
        tag=f'{q:03}'
        files[f'{side}CenterGrade{tag}Length.lean']=f'''import Grothe.UpperChaos.FirstSecondIntegerBinding
import Grothe.UpperChaos.Taylor{side}IntegerGrade{tag}Check

/-! Draft length proof for actual {low} center grade {q}. -/
namespace Grothe.UpperChaos.{side}CenterGrade{tag}Length

theorem length : {values(side,q)}.length = {length(q)} := by
  simpa only [{values(side,q)}, Array.length_toList] using
    Taylor{side}IntegerGrade{tag}Check.grade_length
end Grothe.UpperChaos.{side}CenterGrade{tag}Length
'''
        imports='\n'.join(f'import Grothe.UpperChaos.{side}CenterGrade{k:03}Length' for k in range(q+1))
        splitrules = ', '.join(['List.append_assoc'] +
            (['List.nil_append'] if q == 0 else []) +
            (['List.append_nil'] if q == count - 1 else []))
        lengthrules = ', '.join(['before'] +
            (['List.length_append'] if q >= 2 else []) +
            (['List.length_nil'] if q == 0 else []) +
            [f'{side}CenterGrade{k:03}Length.length' for k in range(q)] +
            (['Nat.reduceAdd'] if q >= 2 else []))
        files[f'{side}CenterGrade{tag}Binding.lean']=f'''{imports}
import Grothe.UpperChaos.ThirdArrayLookup
import Grothe.UpperChaos.ThirdFoldRectangle
import Grothe.UpperChaos.FirstSecondGradeEnergyTargets
import Mathlib.Tactic

/-! Draft actual {low} center grade {q} lookup and energy; no native check. -/
namespace Grothe.UpperChaos.{side}CenterGrade{tag}Binding
open FirstSecondGradeEnergyTargets
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := {cat(side,0,q)}
def suffix : List ℤ := {cat(side,q+1,count)}

theorem source_split : FirstSecondIntegerBinding.{low}AllValues =
    before ++ {values(side,q)} ++ suffix := by
  simp only [FirstSecondIntegerBinding.{low}AllValues,
    FirstSecondIntegerBinding.{low}_source_values, before, suffix,
    {splitrules}]

theorem before_length : before.length = {offset(q)} := by
  simp only [{lengthrules}]

theorem lookup (c d : ℕ) (hc : c < {q+2}) (hd : d < {q+1}) :
    {low}CenterAt {q} c d = {values(side,q)}[c * {q+1} + d]?.getD 0 := by
  have hk : c * {q+1} + d < {values(side,q)}.length := by
    rw [{side}CenterGrade{tag}Length.length]
    omega
  change {low}CenterInts[gradedFlatIndex {q} c d]?.getD 0 = _
  rw [FirstSecondIntegerBinding.{low}_source_array, source_split]
  have h := ThirdArrayLookup.middle_get before {values(side,q)} suffix (c * {q+1} + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range ({q} + 2), ∑ d ∈ Finset.range ({q} + 1),
      {low}CenterAt {q} c d ^ 2) = {low}GradeEnergy {q} := by
  calc
    _ = ∑ c ∈ Finset.range {q+2}, ∑ d ∈ Finset.range {q+1},
        ({values(side,q)}[c * {q+1} + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = {low}CenterIntegerGrade{tag}.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [{values(side,q)}, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold {low}CenterIntegerGrade{tag} {q+2} {q+1}
              Taylor{side}IntegerGrade{tag}Check.grade_length)
    _ = {low}GradeEnergy {q} := by
          rw [Taylor{side}IntegerGrade{tag}Check.grade_energy]
          decide +kernel
end Grothe.UpperChaos.{side}CenterGrade{tag}Binding
'''
      agg=[*(f'import Grothe.UpperChaos.{side}CenterGrade{q:03}Binding' for q in range(count)),
           'import Mathlib.Tactic.FinCases','',
           f'/-! Draft all actual-source {low} grade sums; check all imports. -/',
           f'namespace Grothe.UpperChaos.{side}CenterGradeBindings',
           'open FirstSecondGradeEnergyTargets','set_option maxRecDepth 16384','set_option maxHeartbeats 0','',
           f'theorem all_grade_sums : ∀ q < {count},',
           f'    (∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),',
           f'      {low}CenterAt q c d ^ 2) = {low}GradeEnergy q := by',
           '  intro q hq','  interval_cases q']
      agg += [f'  · exact {side}CenterGrade{q:03}Binding.grade_sum' for q in range(count)]
      agg += [f'end Grothe.UpperChaos.{side}CenterGradeBindings','']
      files[f'{side}CenterGradeBindings.lean']='\n'.join(agg)
    return files

def main():
    ap=argparse.ArgumentParser(); ap.add_argument('--check',action='store_true'); args=ap.parse_args()
    expected=generate()
    sources={}
    for side,low,count in SIDES:
      paths=[ROOT/f'Grothe/UpperChaos/Taylor{side}IntegerData.lean']
      paths += [ROOT/f'Grothe/UpperChaos/Taylor{side}IntegerGrade{q:03}{kind}.lean'
                for q in range(count) for kind in ('Data','Check')]
      for path in paths:
        if not path.exists(): raise SystemExit(f'missing actual typed source/receipt: {path}')
        sources[path.name]=hashlib.sha256(path.read_bytes()).hexdigest()
    target=ROOT/'Grothe/UpperChaos/FirstSecondGradeEnergyTargets.lean'
    if not target.exists(): raise SystemExit(f'missing grade target arithmetic: {target}')
    sources[target.name]=hashlib.sha256(target.read_bytes()).hexdigest()
    expected['manifest.json']=json.dumps({'source_sha256':sources,'file_names':sorted(expected),
       'first_grades':91,'second_grades':46},indent=2)+'\n'
    stale=[]
    for name,text in expected.items():
      p=ROOT/'data/first-second-grade-bindings-manifest.json' if name=='manifest.json' else ROOT/'Grothe/UpperChaos'/name
      if args.check:
        if not p.exists() or p.read_text()!=text: stale.append(str(p))
      else: p.write_text(text)
    if stale: raise SystemExit('mismatch: '+', '.join(stale))
    print(f'{"Checked" if args.check else "Generated"} {len(expected)-1} first/second grade binding drafts; Lean validation required')
if __name__=='__main__':main()
