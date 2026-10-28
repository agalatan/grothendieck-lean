import Grothe.UpperChaos.TaylorBandDefs
import Grothe.UpperChaos.TaylorCenterIndex
import Grothe.UpperChaos.GenericRationalGradeAggregation
import Grothe.UpperChaos.ThirdGradeActualTargetNumerics
import Mathlib.Tactic.FinCases
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Exact third-center energy from 26 source-bound integer-grade equalities.
Draft: this wrapper has not yet been Lean-checked. The grade equalities are
explicit hypotheses, and the native check cannot be replaced until those
equalities are proved from the actual authoritative integer arrays.
Agent-ID: codex-8c4d. -/
open Grothe.UpperChaos
namespace Grothe.UpperChaos.ThirdCenterEnergyConditional
open ThirdEnergyAggregation ThirdGradeCandidateNumerics

/-- This is the actual third-center rational coefficient at its exact
integer source lookup, not an additional parsing or energy hypothesis. -/
theorem coeff_eq (q c d : ℕ) :
    thirdCenterCoeff q c d = (thirdCenterAt q c d : ℚ) / (2 : ℚ)^105 := by
  rfl

theorem mode_degree (q c d : ℕ) (hc : c < q + 2) (hd : d < q + 1) :
    (bideg (gradedMode q c d)).1 + (bideg (gradedMode q c d)).2 = 2*q+1 := by
  dsimp [gradedMode, bideg]
  omega

def gradePred (k : Fin 4) (q : ℕ) : Prop :=
  thirdCenterBandLo k < 2*q+1 ∧ 2*q+1 ≤ thirdCenterBandHi k
instance (k : Fin 4) : DecidablePred (gradePred k) := fun _ => by
  unfold gradePred
  infer_instance

theorem filtered_band (k : Fin 4) :
    (∑ q ∈ Finset.range 26, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1),
        if gradedMode q c d ∈ thirdCenterBandModes k then thirdCenterCoeff q c d ^ 2 else 0) =
    (∑ q ∈ Finset.range 26, if gradePred k q then
      ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        ((thirdCenterAt q c d : ℚ) / (2 : ℚ)^105)^2 else 0) := by
  simp_rw [coeff_eq]
  apply band_filter_eq 26 thirdCenterAt ((2 : ℚ)^105)
    (fun q c d => gradedMode q c d ∈ thirdCenterBandModes k) (gradePred k)
  intro q c d _ hc hd
  change (thirdCenterBandLo k < (bideg (gradedMode q c d)).1 +
    (bideg (gradedMode q c d)).2 ∧
    (bideg (gradedMode q c d)).1 + (bideg (gradedMode q c d)).2 ≤
      thirdCenterBandHi k) ↔ gradePred k q
  rw [mode_degree q c d hc hd]
  rfl

/-- Exactly the proposition of `thirdCenter_energy_check`, conditional only on
26 exact source-grade integer sums; neither this theorem nor its dependencies
use the existing native energy check. -/
theorem energy_check_of_grade_sums
    (hgrade : ∀ q < 26, (∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1), thirdCenterAt q c d ^ 2) = grade q) :
    (∑ q ∈ Finset.range 26, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1), thirdCenterCoeff q c d ^ 2) = thirdCenterEnergyQ ∧
    ∀ k : Fin 4,
      (∑ q ∈ Finset.range 26, ∑ c ∈ Finset.range (q + 2),
        ∑ d ∈ Finset.range (q + 1),
          if gradedMode q c d ∈ thirdCenterBandModes k then thirdCenterCoeff q c d ^ 2 else 0) =
        thirdCenterBandEnergyQ k := by
  constructor
  · have h := total_of_grade_sums 26 thirdCenterAt ((2 : ℚ)^105) grade hgrade
    rw [← pow_mul] at h
    simp only [Nat.reduceMul] at h
    simpa only [coeff_eq, total_arithmetic] using h
  · intro k
    rw [filtered_band k]
    have h := band_of_grade_sums 26 thirdCenterAt ((2 : ℚ)^105) grade (gradePred k) hgrade
    rw [← pow_mul] at h
    simp only [Nat.reduceMul] at h
    rw [h]
    fin_cases k
    · change (((∑ q ∈ Finset.range 26, if 0 < 2*q+1 ∧ 2*q+1 ≤ 11 then
        grade q else 0 : ℤ) : ℚ) / (2 : ℚ)^210) = thirdCenterBandEnergyQ 0
      exact band0_arithmetic
    · change (((∑ q ∈ Finset.range 26, if 11 < 2*q+1 ∧ 2*q+1 ≤ 21 then
        grade q else 0 : ℤ) : ℚ) / (2 : ℚ)^210) = thirdCenterBandEnergyQ 1
      exact band1_arithmetic
    · change (((∑ q ∈ Finset.range 26, if 21 < 2*q+1 ∧ 2*q+1 ≤ 31 then
        grade q else 0 : ℤ) : ℚ) / (2 : ℚ)^210) = thirdCenterBandEnergyQ 2
      exact band2_arithmetic
    · change (((∑ q ∈ Finset.range 26, if 31 < 2*q+1 ∧ 2*q+1 ≤ 51 then
        grade q else 0 : ℤ) : ℚ) / (2 : ℚ)^210) = thirdCenterBandEnergyQ 3
      exact band3_arithmetic

#print axioms coeff_eq
#print axioms mode_degree
#print axioms filtered_band
#print axioms energy_check_of_grade_sums
end Grothe.UpperChaos.ThirdCenterEnergyConditional
open Lean Elab Command
run_cmd do
  let targets : Array Name := #[``Grothe.UpperChaos.ThirdCenterEnergyConditional.energy_check_of_grade_sums]
  for target in targets do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
