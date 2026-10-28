import Grothe.UpperChaos.PositiveMomentRecurrence
import Grothe.UpperChaos.PositiveRatio
import Mathlib.Tactic.FieldSimp

/-! Continued-fraction update for the smooth angular moment ratio. The
connection to the original J integral is not asserted here.
Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.PositiveMomentTheta
noncomputable section

def ratio (h : ℕ) (x : ℝ) : ℝ := moment (h + 1) x / moment h x

/-- The continued-fraction update for the smooth angular moment ratio. -/
theorem ratio_recurrence (h : ℕ) {x : ℝ} (hx : 0 ≤ x) :
    ratio h x = ((h : ℝ) + 1 / 2) /
      ((h : ℝ) + 2 + x - x * ratio (h + 1) x) := by
  have hm0 := moment_pos h x
  have hm1 := moment_pos (h + 1) x
  have hr := (moment_ratio_mem_unit (h + 1) x).2
  have hprod : 0 ≤ x * (1 - ratio (h + 1) x) := by
    apply mul_nonneg hx
    exact sub_nonneg.mpr hr
  have hnat : (0 : ℝ) ≤ h := Nat.cast_nonneg h
  have hd : (h : ℝ) + 2 + x - x * ratio (h + 1) x ≠ 0 := by
    have hp : (0 : ℝ) < (h : ℝ) + 2 + x - x * ratio (h + 1) x := by nlinarith
    exact ne_of_gt hp
  apply (eq_div_iff hd).2
  unfold ratio
  have hm2 : moment (h + 1 + 1) x = moment (h + 2) x := by rfl
  rw [hm2]
  field_simp [ne_of_gt hm0, ne_of_gt hm1]
  nlinarith [moment_recurrence h x]


/-- Identify the angular moment recurrence with the exact algebraic interval update. -/
theorem ratio_eq_next (h : ℕ) {x : ℝ} (hx : 0 ≤ x) :
    ratio h x = PositiveRatio.next h x (ratio (h + 1) x) := by
  simpa only [PositiveRatio.next, PositiveRatio.denominator] using ratio_recurrence h hx

end
end Grothe.UpperChaos.PositiveMomentTheta
#print axioms Grothe.UpperChaos.PositiveMomentTheta.ratio_recurrence

#print axioms Grothe.UpperChaos.PositiveMomentTheta.ratio_eq_next
