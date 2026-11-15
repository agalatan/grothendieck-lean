import Grothe.UpperChaos.ActualSourceNormEvaluation
import Mathlib.Tactic.IntervalCases

/-!
# Actual coordinate-exclusion matrix tails from checked gate weights

Agent-ID: codex-2ca4.

For outgoing total degree at most D and incoming selected coordinate at least
L + 1, the exact gate weight is at least R^D T^(L+1). The full excluded matrix energy
is therefore bounded by the actual finite source norm divided by this factor.
Application to a named retained band still requires its index-degree binding.
No numerical source-norm estimate or operator-norm identity is assumed.
-/

namespace Grothe.UpperChaos.ActualMatrixCutoffTail

open ActualTaylorFiniteCoefficients ActualGateMatrixWeights
open ActualGateMatrixCoefficients ActualSourceNormEvaluation
open OriginalHSParameterGates OriginalHSQuadraticForms

noncomputable section

def outputDegree (m : Idx2) : ℕ := m.1.1 + m.1.2 + m.2.1 + m.2.2

def coordinateExponent (n : Idx2) : ℕ → ℕ
  | 0 => n.1.1
  | 1 => n.1.2
  | 2 => n.2.1
  | 3 => n.2.2
  | _ => 0

private theorem radial_lt_one (g : Gate) (hg : gateOK g = true) :
    (g.r : ℝ) < 1 := by
  simp only [gateOK, Bool.and_eq_true, decide_eq_true_eq] at hg
  exact_mod_cast hg.1.1.2.1

private theorem coordinate_lt_four (g : Gate) (hg : gateOK g = true) :
    g.coordinate < 4 := by
  simp only [gateOK, Bool.and_eq_true, decide_eq_true_eq] at hg
  exact hg.1.1.2.2.2.2.2.1

/-- Exactly one input coordinate carries T; the other three carry one. -/
theorem energyWeight_eq_selected_coordinate (g : Gate) (hg : gateOK g = true)
    (m n : Idx2) :
    energyWeight g m n =
      (g.r : ℝ) ^ outputDegree m * (g.t : ℝ) ^ coordinateExponent n g.coordinate := by
  have hc := coordinate_lt_four g hg
  interval_cases h : g.coordinate <;>
    simp [energyWeight, axisWeight, h, coordinateExponent, outputDegree]

def cutoffWeight (g : Gate) : ℝ := (g.r : ℝ) ^ g.degree * (g.t : ℝ) ^ (g.cutoff + 1)

theorem cutoffWeight_pos (g : Gate) (hg : gateOK g = true) : 0 < cutoffWeight g := by
  exact mul_pos (pow_pos (radial_pos g hg) _)
    (pow_pos (lt_trans zero_lt_one (enlarged_weight_gt_one g hg)) _)

/-- The weighting direction uses R below one and T above one. -/
theorem cutoffWeight_le_energyWeight (g : Gate) (hg : gateOK g = true)
    (m n : Idx2) (hm : outputDegree m ≤ g.degree)
    (hn : g.cutoff < coordinateExponent n g.coordinate) :
    cutoffWeight g ≤ energyWeight g m n := by
  rw [energyWeight_eq_selected_coordinate g hg]
  exact mul_le_mul
    (pow_le_pow_of_le_one (radial_pos g hg).le (radial_lt_one g hg).le hm)
    (pow_le_pow_right₀ (enlarged_weight_gt_one g hg).le (Nat.succ_le_iff.mpr hn))
    (pow_nonneg (lt_trans zero_lt_one (enlarged_weight_gt_one g hg)).le _)
    (pow_nonneg (radial_pos g hg).le _)

/-- The actual excluded matrix term, with its exact finite-output condition. -/
def excludedEnergyTerm (g : Gate) (mn : Idx2 × Idx2) : ℝ :=
  if outputDegree mn.1 ≤ g.degree ∧
      g.cutoff < coordinateExponent mn.2 g.coordinate then
    ‖matrixEntry g.power mn.1 mn.2‖ ^ 2
  else 0

theorem excludedEnergyTerm_nonneg (g : Gate) (mn : Idx2 × Idx2) :
    0 ≤ excludedEnergyTerm g mn := by
  unfold excludedEnergyTerm
  split
  · exact sq_nonneg _
  · exact le_rfl

private theorem weighted_excludedEnergyTerm_le (g : Gate) (hg : gateOK g = true)
    (mn : Idx2 × Idx2) :
    cutoffWeight g * excludedEnergyTerm g mn ≤
      energyWeight g mn.1 mn.2 * ‖matrixEntry g.power mn.1 mn.2‖ ^ 2 := by
  unfold excludedEnergyTerm
  split_ifs with h
  · exact mul_le_mul_of_nonneg_right
      (cutoffWeight_le_energyWeight g hg mn.1 mn.2 h.1 h.2) (sq_nonneg _)
  · rw [mul_zero, ← sourceWeight_sq g hg]
    exact mul_nonneg (sq_nonneg _) (sq_nonneg _)

/-- Every finite excluded matrix block obeys the original cutoff weighting. -/
theorem finite_excludedEnergy_le (g : Gate) (hg : gateOK g = true)
    (s : Finset (Idx2 × Idx2)) :
    (∑ mn ∈ s, excludedEnergyTerm g mn) ≤ (sourceNormValue g).re / cutoffWeight g := by
  have hw : cutoffWeight g * (∑ mn ∈ s, excludedEnergyTerm g mn) ≤
      ∑ mn ∈ s, energyWeight g mn.1 mn.2 * ‖matrixEntry g.power mn.1 mn.2‖ ^ 2 := by
    rw [Finset.mul_sum]
    exact Finset.sum_le_sum fun mn _ => weighted_excludedEnergyTerm_le g hg mn
  have hb := (finite_actual_matrix_energy_le g hg s).trans_eq
    (integral_scaledTransform_sq_eq_value g hg)
  apply (le_div_iff₀ (cutoffWeight_pos g hg)).2
  simpa only [mul_comm] using hw.trans hb

/-- The infinite excluded energy is genuinely summable. -/
theorem summable_excludedEnergyTerm (g : Gate) (hg : gateOK g = true) :
    Summable (excludedEnergyTerm g) := by
  exact summable_of_sum_le (excludedEnergyTerm_nonneg g)
    (finite_excludedEnergy_le g hg)

/-- The full excluded matrix tail reduces to one actual source-norm bound.
The arithmetic enclosure and conversion to a desired operator norm are
separate obligations; no additional tolerance is introduced here. -/
theorem tsum_excludedEnergy_le (g : Gate) (hg : gateOK g = true) :
    (∑' mn : Idx2 × Idx2, excludedEnergyTerm g mn) ≤
      (sourceNormValue g).re / cutoffWeight g := by
  exact Real.tsum_le_of_sum_le (excludedEnergyTerm_nonneg g)
    (finite_excludedEnergy_le g hg)

end
end Grothe.UpperChaos.ActualMatrixCutoffTail
