import Grothe.UpperChaos.Q0GaussSelected
import Grothe.UpperChaos.Q0GaussBracketInterior
import Grothe.UpperChaos.Q0LegendreRootWeightRule03
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Selected original roots with LeanCert formula-weight bounds.
Gauss-rule identity and the integration remainder are separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussSelectedRule03

open Grothe.UpperChaos.Q0LegendreInteger
open Grothe.UpperChaos.Q0LegendreRuleBase
open Grothe.UpperChaos.Q0GaussSelected
open LeanCert.Core

noncomputable def root : Fin 3 → ℝ := Classical.choose Grothe.UpperChaos.Q0LegendreRule03.all_unique

theorem root_spec (i : Fin 3) :
    root i ∈ Set.Icc (((Grothe.UpperChaos.Q0LegendreRule03.bracketAt i).1 : ℝ) / denominator)
      (((Grothe.UpperChaos.Q0LegendreRule03.bracketAt i).2 : ℝ) / denominator) ∧
      (realPair (root i) 2).2 = 0 := by
  exact (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule03.all_unique).1 i

def lower : Fin 3 → ℚ := ![Grothe.UpperChaos.Q0LegendreWeightRule03.r00Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule03.r01Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule03.r02Interval.lo.toRat]
def upper : Fin 3 → ℚ := ![Grothe.UpperChaos.Q0LegendreWeightRule03.r00Upper, Grothe.UpperChaos.Q0LegendreWeightRule03.r01Upper, Grothe.UpperChaos.Q0LegendreWeightRule03.r02Upper]

theorem specr00 :
    root (0 : Fin 3) ∈ Set.Icc (((-3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356902 : ℤ) : ℝ) / denominator)
      (((-3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356899 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (0 : Fin 3)) 2).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule03.bracketAt, Grothe.UpperChaos.Q0LegendreRule03.brackets] using root_spec (0 : Fin 3)

theorem interiorr00 : |root (0 : Fin 3)| < 1 := by
  exact interior_of_integer_bracket (-3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356902) (-3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356899) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr00.1

theorem lowerr00 : (Grothe.UpperChaos.Q0LegendreWeightRule03.r00Interval.lo.toRat : ℝ) ≤ root (0 : Fin 3) := by
  have hle : ((-3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356902 : ℤ) : ℚ) / denominator ≤ ((-3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356899 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule03.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using Grothe.UpperChaos.Q0LegendreWeightRule03.r00Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356902) (-3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356899) denominator hle specr00.1
  have hinput : root (0 : Fin 3) ∈ Grothe.UpperChaos.Q0LegendreWeightRule03.r00Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule03.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr00 : weight 2 (root (0 : Fin 3)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule03.r00Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule03.boundr00 specr00.1

theorem specr01 :
    root (1 : Fin 3) ∈ Set.Icc (((-1 : ℤ) : ℝ) / denominator)
      (((2 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (1 : Fin 3)) 2).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule03.bracketAt, Grothe.UpperChaos.Q0LegendreRule03.brackets] using root_spec (1 : Fin 3)

theorem interiorr01 : |root (1 : Fin 3)| < 1 := by
  exact interior_of_integer_bracket (-1) (2) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr01.1

theorem lowerr01 : (Grothe.UpperChaos.Q0LegendreWeightRule03.r01Interval.lo.toRat : ℝ) ≤ root (1 : Fin 3) := by
  have hle : ((-1 : ℤ) : ℚ) / denominator ≤ ((2 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule03.r01Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg, Int.cast_one] using Grothe.UpperChaos.Q0LegendreWeightRule03.r01Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-1) (2) denominator hle specr01.1
  have hinput : root (1 : Fin 3) ∈ Grothe.UpperChaos.Q0LegendreWeightRule03.r01Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule03.r01Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg, Int.cast_one] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr01 : weight 2 (root (1 : Fin 3)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule03.r01Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule03.boundr01 specr01.1

theorem specr02 :
    root (2 : Fin 3) ∈ Set.Icc (((3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356899 : ℤ) : ℝ) / denominator)
      (((3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356902 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (2 : Fin 3)) 2).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule03.bracketAt, Grothe.UpperChaos.Q0LegendreRule03.brackets] using root_spec (2 : Fin 3)

theorem interiorr02 : |root (2 : Fin 3)| < 1 := by
  exact interior_of_integer_bracket (3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356899) (3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356902) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr02.1

theorem lowerr02 : (Grothe.UpperChaos.Q0LegendreWeightRule03.r02Interval.lo.toRat : ℝ) ≤ root (2 : Fin 3) := by
  have hle : ((3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356899 : ℤ) : ℚ) / denominator ≤ ((3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356902 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule03.r02Input, denominator, Int.cast_pow, Int.cast_ofNat] using Grothe.UpperChaos.Q0LegendreWeightRule03.r02Input.le
  have hmem := mem_rational_interval_of_integer_bracket (3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356899) (3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356902) denominator hle specr02.1
  have hinput : root (2 : Fin 3) ∈ Grothe.UpperChaos.Q0LegendreWeightRule03.r02Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule03.r02Input, denominator, Int.cast_pow, Int.cast_ofNat] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr02 : weight 2 (root (2 : Fin 3)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule03.r02Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule03.boundr02 specr02.1

noncomputable def selected : SelectedRule 3 where
  root := root
  lower := lower
  upper := upper
  interior := by
    intro i
    fin_cases i
    · exact interiorr00
    · exact interiorr01
    · exact interiorr02
  isRoot := by
    intro i
    exact (root_spec i).2
  lower_le := by
    intro i
    fin_cases i
    · simpa [lower] using lowerr00
    · simpa [lower] using lowerr01
    · simpa [lower] using lowerr02
  weight_le := by
    intro i
    fin_cases i
    · simpa [upper] using weightr00
    · simpa [upper] using weightr01
    · simpa [upper] using weightr02
  injective := by
    apply injective_of_ordered_integer_brackets 3 Grothe.UpperChaos.Q0LegendreRule03.brackets
      Grothe.UpperChaos.Q0LegendreRule03.count denominator denominator_pos Grothe.UpperChaos.Q0LegendreRule03.ordered root
    intro i
    simpa only [Grothe.UpperChaos.Q0LegendreRule03.bracketAt] using (root_spec i).1

def indexedContext : Array (ℚ × ℚ) := #[(Grothe.UpperChaos.Q0LegendreWeightRule03.r00Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule03.r00Upper), (Grothe.UpperChaos.Q0LegendreWeightRule03.r01Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule03.r01Upper), (Grothe.UpperChaos.Q0LegendreWeightRule03.r02Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule03.r02Upper)]

theorem context_lookup (i : Fin 3) :
    indexedContext[i.val]? = some (selected.lower i, selected.upper i) := by
  fin_cases i <;> rfl

end Grothe.UpperChaos.Q0GaussSelectedRule03

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[``Grothe.UpperChaos.Q0GaussSelectedRule03.root_spec, ``Grothe.UpperChaos.Q0GaussSelectedRule03.selected, ``Grothe.UpperChaos.Q0GaussSelectedRule03.context_lookup]
  for target in targets do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Selected rule audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
