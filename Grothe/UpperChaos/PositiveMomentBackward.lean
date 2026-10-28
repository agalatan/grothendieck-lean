import Grothe.UpperChaos.PositiveMomentRatio
import Mathlib.Tactic.NormNum

/-! Finite downward enclosures for actual angular moment ratios. No numerical
values or change-of-variables identity for the historical J integral are
asserted. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.PositiveMomentTheta
noncomputable section

/-- The angular ratio at h is the finite downward iteration starting from the
exact ratio at h+n. -/
theorem ratio_eq_backward (h n : ℕ) {x : ℝ} (hx : 0 ≤ x) :
    ratio h x = PositiveRatio.backward x n h (ratio (h + n) x) := by
  induction n generalizing h with
  | zero => simp only [Nat.add_zero, PositiveRatio.backward]
  | succ n ih =>
    change ratio h x = PositiveRatio.next h x
      (PositiveRatio.backward x n (h + 1) (ratio (h + (n + 1)) x))
    have hn : h + (n + 1) = (h + 1) + n := by omega
    rw [hn, ← ih (h + 1)]
    exact ratio_eq_next h hx

/-- The full interval [0,1] at any finite terminal index gives valid lower
and upper bounds for the angular ratio, without assuming a terminal value. -/
theorem ratio_backward_enclosure (h n : ℕ) {x : ℝ} (hx : 0 ≤ x) :
    PositiveRatio.backward x n h 0 ≤ ratio h x ∧
      ratio h x ≤ PositiveRatio.backward x n h 1 := by
  have hr : 0 ≤ ratio (h + n) x ∧ ratio (h + n) x ≤ 1 := by
    exact ⟨(moment_ratio_mem_unit (h + n) x).1.le, (moment_ratio_mem_unit (h + n) x).2⟩
  rw [ratio_eq_backward h n hx]
  exact PositiveRatio.backward_interval hx (by norm_num) hr.1 hr.2 (by norm_num) n h

end
end Grothe.UpperChaos.PositiveMomentTheta
#print axioms Grothe.UpperChaos.PositiveMomentTheta.ratio_backward_enclosure
