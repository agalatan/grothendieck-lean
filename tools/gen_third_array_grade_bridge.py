#!/usr/bin/env python3
"""Reproduce exact source-array grade bridges and third-center energy proofs."""
from pathlib import Path
import argparse, hashlib, json, re

ROOT = Path(__file__).resolve().parents[1]
G = 26

def v(q): return f'ThirdGradeReceipt{q:02}.values'
def concat(qs):
    xs = [v(q) for q in qs]
    return ' ++ '.join(xs) if xs else '[]'
def lengths(q): return (q + 2) * (q + 1)
def offset(q): return q * (q + 1) * (q + 2) // 3

def files():
    result = {}
    header = '\n'.join(f'import Grothe.UpperChaos.TaylorThirdIntegerGrade{q:02}Check' for q in range(G)) + '\n' + '''import Grothe.UpperChaos.ThirdIntegerSourceBinding
import Grothe.UpperChaos.ThirdArrayLookup
import Grothe.UpperChaos.ThirdGradeActualTargetNumerics
import Grothe.UpperChaos.TaylorCenterIndex
import Mathlib.Tactic

/-! Exact integer grade lengths bound to the authoritative integer source.
The source-grade facts are checked by Lean without a native leaf.
Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.ThirdGradeLengths
set_option maxRecDepth 16384
'''
    for q in range(G):
        header += (f'theorem len{q:02} : {v(q)}.length = {lengths(q)} := by\n'
                   f'  simpa only [{v(q)}, Array.length_toList] using '
                   f'TaylorThirdIntegerGrade{q:02}Check.grade_length\n')
    header += 'end Grothe.UpperChaos.ThirdGradeLengths\n'
    result['ThirdGradeLengths.lean'] = header
    target_source=(ROOT/'Grothe/UpperChaos/ThirdGradeActualTargetNumerics.lean').read_text()
    matches=re.search(r'def candidates : List ℤ := \[(.*?)\]',target_source,re.S)
    assert matches
    targets=[int(item.strip()) for item in matches.group(1).split(',')]
    assert len(targets)==G
    for q in range(G):
        p, m, n = offset(q), q + 1, q + 2
        source_rules = 'before, suffix, List.append_assoc'
        if q == 0:
            source_rules += ', List.nil_append'
        elif q == G - 1:
            source_rules += ', List.append_nil'
        before_rules = ['before']
        if q >= 2:
            before_rules.append('List.length_append')
        if q == 0:
            before_rules.append('List.length_nil')
        before_rules += [f'ThirdGradeLengths.len{k:02}' for k in range(q)]
        if q >= 2:
            before_rules.append('Nat.reduceAdd')
        text = f'''import Grothe.UpperChaos.ThirdGradeLengths
import Grothe.UpperChaos.ThirdFoldRectangle

/-! Exact source-bound integer sum for grade {q}. -/
namespace Grothe.UpperChaos.ThirdArrayGrade{q:02}
open ThirdGradeCandidateNumerics
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def before : List ℤ := {concat(range(q))}
def suffix : List ℤ := {concat(range(q + 1, G))}

theorem source_split : ThirdIntegerSourceBinding.allValues =
    before ++ {v(q)} ++ suffix := by
  simp only [ThirdIntegerSourceBinding.allValues, ThirdIntegerSourceBinding.source_values,
    {source_rules}]

theorem before_length : before.length = {p} := by
  simp only [{', '.join(before_rules)}]

theorem lookup (c d : ℕ) (hc : c < {n}) (hd : d < {m}) :
    thirdCenterAt {q} c d = {v(q)}[c * {m} + d]?.getD 0 := by
  have hk : c * {m} + d < {v(q)}.length := by
    rw [ThirdGradeLengths.len{q:02}]
    omega
  change thirdCenterInts[gradedFlatIndex {q} c d]?.getD 0 = _
  rw [ThirdIntegerSourceBinding.source_array, source_split]
  have h := ThirdArrayLookup.middle_get before {v(q)} suffix (c * {m} + d) hk
  simpa only [gradedFlatIndex, Nat.reduceAdd, Nat.reduceMul, Nat.reduceDiv,
    Nat.add_assoc, before_length] using h

theorem grade_sum :
    (∑ c ∈ Finset.range ({q} + 2), ∑ d ∈ Finset.range ({q} + 1),
      thirdCenterAt {q} c d ^ 2) = grade {q} := by
  calc
    _ = ∑ c ∈ Finset.range {n}, ∑ d ∈ Finset.range {m},
        ({v(q)}[c * {m} + d]?.getD 0) ^ 2 := by
          apply Finset.sum_congr rfl
          intro c hc
          apply Finset.sum_congr rfl
          intro d hd
          rw [lookup c d (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)]
    _ = thirdCenterIntegerGrade{q:02}.foldl (fun a x => a + x ^ 2) (0 : ℤ) := by
          simpa only [{v(q)}, Array.getElem?_toList] using
            (ThirdFoldRectangle.grade_rectangle_fold thirdCenterIntegerGrade{q:02} {n} {m}
              TaylorThirdIntegerGrade{q:02}Check.grade_length)
    _ = grade {q} := by
          have htarget : grade {q} = {targets[q]} := by decide +kernel
          rw [htarget]
          exact TaylorThirdIntegerGrade{q:02}Check.grade_energy

end Grothe.UpperChaos.ThirdArrayGrade{q:02}
'''
        result[f'ThirdArrayGrade{q:02}.lean'] = text
    lines = [f'import Grothe.UpperChaos.ThirdArrayGrade{q:02}' for q in range(G)]
    lines += ['import Mathlib.Tactic.FinCases', '', '''/-! Complete aggregate of the 26 source-bound integer grade sums. -/
namespace Grothe.UpperChaos.ThirdArrayGrades
open ThirdGradeCandidateNumerics
set_option maxRecDepth 16384

theorem all_grade_sums : ∀ q < 26,
    (∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      thirdCenterAt q c d ^ 2) = grade q := by
  intro q hq
  interval_cases q''']
    lines.extend(f'  · exact ThirdArrayGrade{q:02}.grade_sum' for q in range(G))
    lines.append('end Grothe.UpperChaos.ThirdArrayGrades\n')
    result['ThirdArrayGrades.lean'] = '\n'.join(lines)
    result['ThirdCenterKernelEnergy.lean'] = '''import Grothe.UpperChaos.ThirdArrayGrades
import Grothe.UpperChaos.ThirdCenterEnergyConditional
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Source-bound exact third-center size and energy, with strict transitive
axiom checks. These finite identities do not establish Gaussian error estimates
or close the other endpoint obligations. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.ThirdCenterKernelEnergy

/-- The direct authoritative integer source contains exactly 6,552 values. -/
theorem size_check : thirdCenterInts.size = 6552 := by
  rw [ThirdIntegerSourceBinding.source_array]
  simp only [List.size_toArray, ThirdIntegerSourceBinding.allValues,
    ThirdIntegerSourceBinding.source_values, List.length_append,
    ThirdGradeLengths.len00, ThirdGradeLengths.len01, ThirdGradeLengths.len02, ThirdGradeLengths.len03, ThirdGradeLengths.len04, ThirdGradeLengths.len05, ThirdGradeLengths.len06, ThirdGradeLengths.len07, ThirdGradeLengths.len08, ThirdGradeLengths.len09, ThirdGradeLengths.len10, ThirdGradeLengths.len11, ThirdGradeLengths.len12, ThirdGradeLengths.len13, ThirdGradeLengths.len14, ThirdGradeLengths.len15, ThirdGradeLengths.len16, ThirdGradeLengths.len17, ThirdGradeLengths.len18, ThirdGradeLengths.len19, ThirdGradeLengths.len20, ThirdGradeLengths.len21, ThirdGradeLengths.len22, ThirdGradeLengths.len23, ThirdGradeLengths.len24, ThirdGradeLengths.len25, Nat.reduceAdd]

/-- The actual complete third-center energy proposition; all 26 source-grade
sums and the source-array binding are discharged by checked imports. -/
theorem energy_check :
    (∑ q ∈ Finset.range 26, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1), thirdCenterCoeff q c d ^ 2) = thirdCenterEnergyQ ∧
    ∀ k : Fin 4,
      (∑ q ∈ Finset.range 26, ∑ c ∈ Finset.range (q + 2),
        ∑ d ∈ Finset.range (q + 1),
          if gradedMode q c d ∈ thirdCenterBandModes k then thirdCenterCoeff q c d ^ 2 else 0) =
        thirdCenterBandEnergyQ k :=
  ThirdCenterEnergyConditional.energy_check_of_grade_sums ThirdArrayGrades.all_grade_sums

open Lean Elab Command
run_cmd do
  for target in #[``size_check, ``energy_check] do
    let axs ← Lean.collectAxioms target
    logInfo m!"Audit {target}: {axs}"
    for ax in axs do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
end Grothe.UpperChaos.ThirdCenterKernelEnergy
'''
    return result

def main():
    ap = argparse.ArgumentParser(); ap.add_argument('--check', action='store_true'); args=ap.parse_args()
    expected = files()
    source=(ROOT/'Grothe/UpperChaos/TaylorThirdIntegerData.lean').read_text()
    manifest={'source_sha256':hashlib.sha256(source.encode()).hexdigest(),
              'grade_count':G,'file_names':sorted(expected)}
    expected['manifest.json']=json.dumps(manifest,indent=2)+'\n'
    bad=[]
    for name, text in expected.items():
        path = (ROOT/'data/third-array-grade-bridge-manifest.json') if name == 'manifest.json' else ROOT/'Grothe/UpperChaos'/name
        if args.check:
            if not path.exists() or path.read_text() != text: bad.append(name)
        else: path.write_text(text)
    if bad: raise SystemExit('stale: ' + ', '.join(bad))
    print(f'{"verified" if args.check else "generated"} {len(expected)-1} source-array grade and energy modules')
if __name__ == '__main__': main()
