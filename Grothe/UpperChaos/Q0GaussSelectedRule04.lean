import Grothe.UpperChaos.Q0GaussSelected
import Grothe.UpperChaos.Q0GaussBracketInterior
import Grothe.UpperChaos.Q0LegendreRootWeightRule04
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Selected original roots with LeanCert formula-weight bounds.
Gauss-rule identity and the integration remainder are separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussSelectedRule04

open Grothe.UpperChaos.Q0LegendreInteger
open Grothe.UpperChaos.Q0LegendreRuleBase
open Grothe.UpperChaos.Q0GaussSelected
open LeanCert.Core

noncomputable def root : Fin 4 → ℝ := Classical.choose Grothe.UpperChaos.Q0LegendreRule04.all_unique

theorem root_spec (i : Fin 4) :
    root i ∈ Set.Icc (((Grothe.UpperChaos.Q0LegendreRule04.bracketAt i).1 : ℝ) / denominator)
      (((Grothe.UpperChaos.Q0LegendreRule04.bracketAt i).2 : ℝ) / denominator) ∧
      (realPair (root i) 3).2 = 0 := by
  exact (Classical.choose_spec Grothe.UpperChaos.Q0LegendreRule04.all_unique).1 i

def lower : Fin 4 → ℚ := ![Grothe.UpperChaos.Q0LegendreWeightRule04.r00Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule04.r01Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule04.r02Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule04.r03Interval.lo.toRat]
def upper : Fin 4 → ℚ := ![Grothe.UpperChaos.Q0LegendreWeightRule04.r00Upper, Grothe.UpperChaos.Q0LegendreWeightRule04.r01Upper, Grothe.UpperChaos.Q0LegendreWeightRule04.r02Upper, Grothe.UpperChaos.Q0LegendreWeightRule04.r03Upper]

theorem specr00 :
    root (0 : Fin 4) ∈ Set.Icc (((-3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788751 : ℤ) : ℝ) / denominator)
      (((-3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788748 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (0 : Fin 4)) 3).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule04.bracketAt, Grothe.UpperChaos.Q0LegendreRule04.brackets] using root_spec (0 : Fin 4)

theorem interiorr00 : |root (0 : Fin 4)| < 1 := by
  exact interior_of_integer_bracket (-3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788751) (-3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788748) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr00.1

theorem lowerr00 : (Grothe.UpperChaos.Q0LegendreWeightRule04.r00Interval.lo.toRat : ℝ) ≤ root (0 : Fin 4) := by
  have hle : ((-3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788751 : ℤ) : ℚ) / denominator ≤ ((-3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788748 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule04.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using Grothe.UpperChaos.Q0LegendreWeightRule04.r00Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788751) (-3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788748) denominator hle specr00.1
  have hinput : root (0 : Fin 4) ∈ Grothe.UpperChaos.Q0LegendreWeightRule04.r00Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule04.r00Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr00 : weight 3 (root (0 : Fin 4)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule04.r00Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule04.boundr00 specr00.1

theorem specr01 :
    root (1 : Fin 4) ∈ Set.Icc (((-1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387296 : ℤ) : ℝ) / denominator)
      (((-1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387293 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (1 : Fin 4)) 3).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule04.bracketAt, Grothe.UpperChaos.Q0LegendreRule04.brackets] using root_spec (1 : Fin 4)

theorem interiorr01 : |root (1 : Fin 4)| < 1 := by
  exact interior_of_integer_bracket (-1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387296) (-1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387293) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr01.1

theorem lowerr01 : (Grothe.UpperChaos.Q0LegendreWeightRule04.r01Interval.lo.toRat : ℝ) ≤ root (1 : Fin 4) := by
  have hle : ((-1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387296 : ℤ) : ℚ) / denominator ≤ ((-1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387293 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule04.r01Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using Grothe.UpperChaos.Q0LegendreWeightRule04.r01Input.le
  have hmem := mem_rational_interval_of_integer_bracket (-1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387296) (-1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387293) denominator hle specr01.1
  have hinput : root (1 : Fin 4) ∈ Grothe.UpperChaos.Q0LegendreWeightRule04.r01Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule04.r01Input, denominator, Int.cast_pow, Int.cast_ofNat, Int.cast_neg] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr01 : weight 3 (root (1 : Fin 4)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule04.r01Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule04.boundr01 specr01.1

theorem specr02 :
    root (2 : Fin 4) ∈ Set.Icc (((1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387293 : ℤ) : ℝ) / denominator)
      (((1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387296 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (2 : Fin 4)) 3).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule04.bracketAt, Grothe.UpperChaos.Q0LegendreRule04.brackets] using root_spec (2 : Fin 4)

theorem interiorr02 : |root (2 : Fin 4)| < 1 := by
  exact interior_of_integer_bracket (1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387293) (1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387296) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr02.1

theorem lowerr02 : (Grothe.UpperChaos.Q0LegendreWeightRule04.r02Interval.lo.toRat : ℝ) ≤ root (2 : Fin 4) := by
  have hle : ((1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387293 : ℤ) : ℚ) / denominator ≤ ((1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387296 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule04.r02Input, denominator, Int.cast_pow, Int.cast_ofNat] using Grothe.UpperChaos.Q0LegendreWeightRule04.r02Input.le
  have hmem := mem_rational_interval_of_integer_bracket (1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387293) (1551143322473130088389723086008304426788197859818259154298973704106906547013835374996442118370523171721078513518230222262404941750670724390130825726624170407995972201813346032926121929779387296) denominator hle specr02.1
  have hinput : root (2 : Fin 4) ∈ Grothe.UpperChaos.Q0LegendreWeightRule04.r02Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule04.r02Input, denominator, Int.cast_pow, Int.cast_ofNat] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr02 : weight 3 (root (2 : Fin 4)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule04.r02Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule04.boundr02 specr02.1

theorem specr03 :
    root (3 : Fin 4) ∈ Set.Icc (((3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788748 : ℤ) : ℝ) / denominator)
      (((3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788751 : ℤ) : ℝ) / denominator) ∧
      (realPair (root (3 : Fin 4)) 3).2 = 0 := by
  simpa [Grothe.UpperChaos.Q0LegendreRule04.bracketAt, Grothe.UpperChaos.Q0LegendreRule04.brackets] using root_spec (3 : Fin 4)

theorem interiorr03 : |root (3 : Fin 4)| < 1 := by
  exact interior_of_integer_bracket (3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788748) (3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788751) denominator denominator_pos
    (by decide +kernel) (by decide +kernel) specr03.1

theorem lowerr03 : (Grothe.UpperChaos.Q0LegendreWeightRule04.r03Interval.lo.toRat : ℝ) ≤ root (3 : Fin 4) := by
  have hle : ((3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788748 : ℤ) : ℚ) / denominator ≤ ((3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788751 : ℤ) : ℚ) / denominator := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule04.r03Input, denominator, Int.cast_pow, Int.cast_ofNat] using Grothe.UpperChaos.Q0LegendreWeightRule04.r03Input.le
  have hmem := mem_rational_interval_of_integer_bracket (3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788748) (3928883285326068380507294953135603316439990269045265913775310955237915543058050840195934684259327893332634719479729322110610410280497576122843897133215426076513975178506957958559852720903788751) denominator hle specr03.1
  have hinput : root (3 : Fin 4) ∈ Grothe.UpperChaos.Q0LegendreWeightRule04.r03Input := by
    simpa only [Grothe.UpperChaos.Q0LegendreWeightRule04.r03Input, denominator, Int.cast_pow, Int.cast_ofNat] using hmem
  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1

theorem weightr03 : weight 3 (root (3 : Fin 4)) ≤ (Grothe.UpperChaos.Q0LegendreWeightRule04.r03Upper : ℝ) := by
  exact Grothe.UpperChaos.Q0LegendreRootWeightRule04.boundr03 specr03.1

noncomputable def selected : SelectedRule 4 where
  root := root
  lower := lower
  upper := upper
  interior := by
    intro i
    fin_cases i
    · exact interiorr00
    · exact interiorr01
    · exact interiorr02
    · exact interiorr03
  isRoot := by
    intro i
    exact (root_spec i).2
  lower_le := by
    intro i
    fin_cases i
    · simpa [lower] using lowerr00
    · simpa [lower] using lowerr01
    · simpa [lower] using lowerr02
    · simpa [lower] using lowerr03
  weight_le := by
    intro i
    fin_cases i
    · simpa [upper] using weightr00
    · simpa [upper] using weightr01
    · simpa [upper] using weightr02
    · simpa [upper] using weightr03
  injective := by
    apply injective_of_ordered_integer_brackets 4 Grothe.UpperChaos.Q0LegendreRule04.brackets
      Grothe.UpperChaos.Q0LegendreRule04.count denominator denominator_pos Grothe.UpperChaos.Q0LegendreRule04.ordered root
    intro i
    simpa only [Grothe.UpperChaos.Q0LegendreRule04.bracketAt] using (root_spec i).1

def indexedContext : Array (ℚ × ℚ) := #[(Grothe.UpperChaos.Q0LegendreWeightRule04.r00Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule04.r00Upper), (Grothe.UpperChaos.Q0LegendreWeightRule04.r01Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule04.r01Upper), (Grothe.UpperChaos.Q0LegendreWeightRule04.r02Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule04.r02Upper), (Grothe.UpperChaos.Q0LegendreWeightRule04.r03Interval.lo.toRat, Grothe.UpperChaos.Q0LegendreWeightRule04.r03Upper)]

theorem context_lookup (i : Fin 4) :
    indexedContext[i.val]? = some (selected.lower i, selected.upper i) := by
  fin_cases i <;> rfl

end Grothe.UpperChaos.Q0GaussSelectedRule04

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[``Grothe.UpperChaos.Q0GaussSelectedRule04.root_spec, ``Grothe.UpperChaos.Q0GaussSelectedRule04.selected, ``Grothe.UpperChaos.Q0GaussSelectedRule04.context_lookup]
  for target in targets do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Selected rule audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
