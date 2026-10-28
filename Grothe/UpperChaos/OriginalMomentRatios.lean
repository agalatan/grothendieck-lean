import Grothe.UpperChaos.OriginalMomentSubstitution
import Grothe.UpperChaos.PositiveMomentBackward
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-! Positivity and finite backward enclosures for the original historical
positive moment J_h. No concrete numerical bounds or seed formulas are asserted.
Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.OriginalPositiveMoment
noncomputable section

def ratio (h : ℕ) (x : ℝ) : ℝ := moment (h + 1) x / moment h x

theorem moment_pos (h : ℕ) (x : ℝ) : 0 < moment h x := by
  rw [moment_eq_angular]
  have hp := PositiveMomentTheta.moment_pos h x
  positivity

theorem ratio_eq_angular (h : ℕ) (x : ℝ) :
    ratio h x = PositiveMomentTheta.ratio h x := by
  unfold ratio PositiveMomentTheta.ratio
  rw [moment_eq_angular, moment_eq_angular]
  have hm : PositiveMomentTheta.moment h x ≠ 0 := ne_of_gt (PositiveMomentTheta.moment_pos h x)
  have hp : Real.pi ≠ 0 := ne_of_gt Real.pi_pos
  field_simp [hm, hp]

theorem ratio_mem_unit (h : ℕ) (x : ℝ) : 0 < ratio h x ∧ ratio h x ≤ 1 := by
  rw [ratio_eq_angular]
  exact PositiveMomentTheta.moment_ratio_mem_unit h x

/-- The original positive moments satisfy their exact three-term recurrence. -/
theorem moment_recurrence (h : ℕ) (x : ℝ) :
    ((h : ℝ) + 1 / 2) * moment h x - ((h : ℝ) + 2 + x) * moment (h + 1) x +
      x * moment (h + 2) x = 0 := by
  simp only [moment_eq_angular]
  calc
    _ = (4 / Real.pi) * (((h : ℝ) + 1 / 2) * PositiveMomentTheta.moment h x -
      ((h : ℝ) + 2 + x) * PositiveMomentTheta.moment (h + 1) x +
      x * PositiveMomentTheta.moment (h + 2) x) := by ring
    _ = 0 := by rw [PositiveMomentTheta.moment_recurrence]; ring

/-- Exact continued-fraction update for original moment ratios. -/
theorem ratio_eq_next (h : ℕ) {x : ℝ} (hx : 0 ≤ x) :
    ratio h x = PositiveRatio.next h x (ratio (h + 1) x) := by
  rw [ratio_eq_angular, ratio_eq_angular]
  exact PositiveMomentTheta.ratio_eq_next h hx

/-- Starting at an arbitrary terminal depth with [0,1] bounds the original ratio. -/
theorem ratio_backward_enclosure (h n : ℕ) {x : ℝ} (hx : 0 ≤ x) :
    PositiveRatio.backward x n h 0 ≤ ratio h x ∧
      ratio h x ≤ PositiveRatio.backward x n h 1 := by
  rw [ratio_eq_angular]
  exact PositiveMomentTheta.ratio_backward_enclosure h n hx

end
end Grothe.UpperChaos.OriginalPositiveMoment
#print axioms Grothe.UpperChaos.OriginalPositiveMoment.moment_pos
#print axioms Grothe.UpperChaos.OriginalPositiveMoment.ratio_eq_next
#print axioms Grothe.UpperChaos.OriginalPositiveMoment.ratio_backward_enclosure
