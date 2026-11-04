import Grothe.UpperChaos.Q0GaussSelected
import Grothe.UpperChaos.Q0GaussBracketInterior
import Grothe.UpperChaos.Q0LegendreRootWeightRule02
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Selected original roots with LeanCert formula-weight bounds.
Gauss-rule identity and the integration remainder are separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussSelectedRule02

open Grothe.UpperChaos.Q0LegendreInteger
open Grothe.UpperChaos.Q0LegendreRuleBase
open Grothe.UpperChaos.Q0GaussSelected
open LeanCert.Core

noncomputable def root : Fin 2 → ℝ := Classical.choose Grothe.UpperChaos.Q0LegendreRule02.all_unique

theorem root_spec (i : Fin 2) :
    root i ∈ Set.Icc (((Grothe.UpperChaos.Q0LegendreRule02.bracketAt i).1 : ℝ) / denominator)
      (((Grothe.UpperChaos.Q0LegendreRule02.bracketAt i).2 : ℝ) / denominator) ∧
      (realPair (root i) 1).2 = 0 := by
  exact (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule02.all_unique).1 i

def lower : Fin 2 → ℚ := ![Grothe.UpperChaos.Q0LegendreWeightRule02.r00Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule02.r01Interval.lo.toRat]
def upper : Fin 2 → ℚ := ![Grothe.UpperChaos.Q0LegendreWeightRule02.r00Upper, Grothe.UpperChaos.Q0LegendreWeightRule02.r01Upper]

theorem specr00 :
    root (0 : Fin 2) ∈ Set.Icc (((-2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791634 : ℤ) : ℝ) / denominator)
      (((-2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791631 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (0 : Fin 2)) 1).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule02.bracketAt, Grothe.UpperChaos.Q0LegendreRule02.brackets] using root_spec (0 : Fin 2)

theorem interiorr00 : |root (0 : Fin 2)| < 1 := by
  exact interior_of_integer_bracket (-2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791634) (-2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791631) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr00.1

theorem lowerr00 : (Grothe.UpperChaos.Q0LegendreWeightRule02.r00Interval.lo.toRat : ℝ) ≤ root (0 : Fin 2) := by
  have hle : ((-2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791634 : ℤ) : ℚ) / denominator ≤ ((-2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791631 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule02.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using Grothe.UpperChaos.Q0LegendreWeightRule02.r00Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791634) (-2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791631) denominator hle specr00.1
  have hinput : root (0 : Fin 2) ∈ Grothe.UpperChaos.Q0LegendreWeightRule02.r00Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule02.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr00 : weight 1 (root (0 : Fin 2)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule02.r00Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule02.boundr00 specr00.1

theorem specr01 :
    root (1 : Fin 2) ∈ Set.Icc (((2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791631 : ℤ) : ℝ) / denominator)
      (((2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791634 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (1 : Fin 2)) 1).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule02.bracketAt, Grothe.UpperChaos.Q0LegendreRule02.brackets] using root_spec (1 : Fin 2)

theorem interiorr01 : |root (1 : Fin 2)| < 1 := by
  exact interior_of_integer_bracket (2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791631) (2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791634) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr01.1

theorem lowerr01 : (Grothe.UpperChaos.Q0LegendreWeightRule02.r01Interval.lo.toRat : ℝ) ≤ root (1 : Fin 2) := by
  have hle : ((2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791631 : ℤ) : ℚ) / denominator ≤ ((2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791634 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule02.r01Input, denominator, Int.cast_pow, Int.cast_ofNat] using Grothe.UpperChaos.Q0LegendreWeightRule02.r01Input.le
  have hmem := mem_rational_interval_of_integer_bracket (2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791631) (2634126318745856839997195949293142617849391950757203542140175216826044454514540482628082004863627892501137147615156536666192191119171239897926204508390627729618705351029392030489144103755791634) denominator hle specr01.1
  have hinput : root (1 : Fin 2) ∈ Grothe.UpperChaos.Q0LegendreWeightRule02.r01Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule02.r01Input, denominator, Int.cast_pow, Int.cast_ofNat] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr01 : weight 1 (root (1 : Fin 2)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule02.r01Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule02.boundr01 specr01.1

noncomputable def selected : SelectedRule 2 where
  root := root
  lower := lower
  upper := upper
  interior := by
    intro i
    fin_cases i
    · exact interiorr00
    · exact interiorr01
  isRoot := by
    intro i
    exact (root_spec i).2
  lower_le := by
    intro i
    fin_cases i
    · simpa [lower] using lowerr00
    · simpa [lower] using lowerr01
  weight_le := by
    intro i
    fin_cases i
    · simpa [upper] using weightr00
    · simpa [upper] using weightr01
  injective := by
    apply injective_of_ordered_integer_brackets 2 Grothe.UpperChaos.Q0LegendreRule02.brackets
      Grothe.UpperChaos.Q0LegendreRule02.count denominator denominator_pos Grothe.UpperChaos.Q0LegendreRule02.ordered root
    intro i
    simpa only [Grothe.UpperChaos.Q0LegendreRule02.bracketAt] using (root_spec i).1

def indexedContext : Array (ℚ × ℚ) := #[(Grothe.UpperChaos.Q0LegendreWeightRule02.r00Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule02.r00Upper), (Grothe.UpperChaos.Q0LegendreWeightRule02.r01Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule02.r01Upper)]

theorem context_lookup (i : Fin 2) :
    indexedContext[i.val]? = some (selected.lower i, selected.upper i) := by
  fin_cases i <;> rfl

end Grothe.UpperChaos.Q0GaussSelectedRule02

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[``Grothe.UpperChaos.Q0GaussSelectedRule02.root_spec, ``Grothe.UpperChaos.Q0GaussSelectedRule02.selected, ``Grothe.UpperChaos.Q0GaussSelectedRule02.context_lookup]
  for target in targets do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Selected rule audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
