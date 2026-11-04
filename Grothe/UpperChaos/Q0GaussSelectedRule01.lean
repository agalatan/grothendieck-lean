import Grothe.UpperChaos.Q0GaussSelected
import Grothe.UpperChaos.Q0GaussBracketInterior
import Grothe.UpperChaos.Q0LegendreRootWeightRule01
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Selected original roots with LeanCert formula-weight bounds.
Gauss-rule identity and the integration remainder are separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussSelectedRule01

open Grothe.UpperChaos.Q0LegendreInteger
open Grothe.UpperChaos.Q0LegendreRuleBase
open Grothe.UpperChaos.Q0GaussSelected
open LeanCert.Core

noncomputable def root : Fin 1 → ℝ := Classical.choose Grothe.UpperChaos.Q0LegendreRule01.all_unique

theorem root_spec (i : Fin 1) :
    root i ∈ Set.Icc (((Grothe.UpperChaos.Q0LegendreRule01.bracketAt i).1 : ℝ) / denominator)
      (((Grothe.UpperChaos.Q0LegendreRule01.bracketAt i).2 : ℝ) / denominator) ∧
      (realPair (root i) 0).2 = 0 := by
  exact (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule01.all_unique).1 i

def lower : Fin 1 → ℚ := ![Grothe.UpperChaos.Q0LegendreWeightRule01.r00Interval.lo.toRat]
def upper : Fin 1 → ℚ := ![Grothe.UpperChaos.Q0LegendreWeightRule01.r00Upper]

theorem specr00 :
    root (0 : Fin 1) ∈ Set.Icc (((-1 : ℤ) : ℝ) / denominator)
      (((2 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (0 : Fin 1)) 0).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule01.bracketAt, Grothe.UpperChaos.Q0LegendreRule01.brackets] using root_spec (0 : Fin 1)

theorem interiorr00 : |root (0 : Fin 1)| < 1 := by
  exact interior_of_integer_bracket (-1) (2) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr00.1

theorem lowerr00 : (Grothe.UpperChaos.Q0LegendreWeightRule01.r00Interval.lo.toRat : ℝ) ≤ root (0 : Fin 1) := by
  have hle : ((-1 : ℤ) : ℚ) / denominator ≤ ((2 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule01.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg, Int.cast_one] using Grothe.UpperChaos.Q0LegendreWeightRule01.r00Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-1) (2) denominator hle specr00.1
  have hinput : root (0 : Fin 1) ∈ Grothe.UpperChaos.Q0LegendreWeightRule01.r00Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule01.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg, Int.cast_one] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr00 : weight 0 (root (0 : Fin 1)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule01.r00Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule01.boundr00 specr00.1

noncomputable def selected : SelectedRule 1 where
  root := root
  lower := lower
  upper := upper
  interior := by
    intro i
    fin_cases i
    · exact interiorr00
  isRoot := by
    intro i
    exact (root_spec i).2
  lower_le := by
    intro i
    fin_cases i
    · simpa [lower] using lowerr00
  weight_le := by
    intro i
    fin_cases i
    · simpa [upper] using weightr00
  injective := by
    apply injective_of_ordered_integer_brackets 1 Grothe.UpperChaos.Q0LegendreRule01.brackets
      Grothe.UpperChaos.Q0LegendreRule01.count denominator denominator_pos Grothe.UpperChaos.Q0LegendreRule01.ordered root
    intro i
    simpa only [Grothe.UpperChaos.Q0LegendreRule01.bracketAt] using (root_spec i).1

def indexedContext : Array (ℚ × ℚ) := #[(Grothe.UpperChaos.Q0LegendreWeightRule01.r00Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule01.r00Upper)]

theorem context_lookup (i : Fin 1) :
    indexedContext[i.val]? = some (selected.lower i, selected.upper i) := by
  fin_cases i; rfl

end Grothe.UpperChaos.Q0GaussSelectedRule01

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[``Grothe.UpperChaos.Q0GaussSelectedRule01.root_spec, ``Grothe.UpperChaos.Q0GaussSelectedRule01.selected, ``Grothe.UpperChaos.Q0GaussSelectedRule01.context_lookup]
  for target in targets do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Selected rule audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
