import Grothe.UpperChaos.OriginalMomentSubstitutionLemmas
import Grothe.UpperChaos.PositiveMomentTheta
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

/-! Pointwise pullback on the open interval. Equality of the actual integrals
requires a separate change-of-variables theorem and endpoint handling.
Agent-ID: codex-8c4d. -/
open Set
namespace Grothe.UpperChaos.OriginalPositiveMoment
noncomputable section

/-- The historical integrand with Jacobian equals twice the angular density
at interior points. No assertion is made at the singular left endpoint. -/
theorem pullback_interior (h : ℕ) (x t : ℝ)
    (ht : t ∈ Ioo (0 : ℝ) (Real.pi / 2)) :
    integrand h x (sinSq t) * (2 * Real.sin t * Real.cos t) =
      2 * PositiveMomentTheta.density h x t := by
  rcases ht with ⟨ht0, ht1⟩
  have hs : 0 < Real.sin t := Real.sin_pos_of_pos_of_lt_pi ht0 (by linarith [Real.pi_pos])
  have hc : 0 < Real.cos t := Real.cos_pos_of_mem_Ioo ⟨by linarith [Real.pi_pos], ht1⟩
  have hs2 : 0 < Real.sin t ^ 2 := sq_pos_of_pos hs
  have hp : (Real.sin t ^ 2) ^ ((h : ℝ) - 1 / 2) =
      Real.sin t ^ (2 * h) / Real.sin t := by
    rw [Real.rpow_sub hs2, Real.rpow_natCast, ← Real.sqrt_eq_rpow,
      Real.sqrt_sq_eq_abs, abs_of_pos hs, pow_mul]
  have hc2 : Real.sqrt (1 - Real.sin t ^ 2) = Real.cos t := by
    rw [show 1 - Real.sin t ^ 2 = Real.cos t ^ 2 by nlinarith [Real.sin_sq_add_cos_sq t],
      Real.sqrt_sq_eq_abs, abs_of_pos hc]
  unfold integrand sinSq PositiveMomentTheta.density
  rw [hp, hc2]
  field_simp [ne_of_gt hs]

end
end Grothe.UpperChaos.OriginalPositiveMoment
#print axioms Grothe.UpperChaos.OriginalPositiveMoment.pullback_interior
