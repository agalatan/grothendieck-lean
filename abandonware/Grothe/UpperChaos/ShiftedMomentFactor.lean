import Grothe.UpperChaos.Q0RealShiftMoments
import Grothe.UpperChaos.ShiftedMomentRecurrence

/-! Inverse-rate factoring of the production shifted Gaussian moment; no numerical enclosure. Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.ShiftedMomentFactor
open Grothe.UpperChaos.Q0RealShiftMoments

noncomputable section

/-- The moment with the universal Gaussian mass removed. -/
def reducedMoment (β m : ℝ) (p q : ℕ) : ℝ :=
  ∑ j ∈ Finset.range (min p q + 1),
    (p.choose j : ℝ) * (q.choose j : ℝ) * m ^ (p - j) * m ^ (q - j) *
      (j.factorial : ℝ) / β ^ j

/-- Every shifted real moment has one universal inverse-rate factor. -/
theorem realShiftedMoment_eq_inv_mul (β m : ℝ) (p q : ℕ) :
    realShiftedMoment β m p q = β⁻¹ * reducedMoment β m p q := by
  unfold realShiftedMoment reducedMoment
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  rw [pow_succ]
  simp only [div_eq_mul_inv, mul_inv_rev]
  ring

/-- The completed-square affine moment has two inverse-rate factors. -/
theorem real_affine_eq_inv_sq (α a t r : ℝ) (p q : ℕ)
    (hα : 0 < α) (ht : 0 < t) :
    let β := α + a ^ 2 * t
    let m := -(a * t / β) * r
    r * realShiftedMoment β m p q + a * realShiftedMoment β m (p + 1) q =
      β⁻¹ ^ 2 * (α * r * reducedMoment β m p q +
        a * q * reducedMoment β m p (q - 1)) := by
  let β := α + a ^ 2 * t
  let m := -(a * t / β) * r
  change r * realShiftedMoment β m p q + a * realShiftedMoment β m (p + 1) q =
      β⁻¹ ^ 2 * (α * r * reducedMoment β m p q +
        a * q * reducedMoment β m p (q - 1))
  have hh := shiftedDampedMoment_affine_step α a t (r : ℂ) p q hα ht
  change (r : ℂ) * shiftedDampedMoment β (-(a * t / β : ℝ) * (r : ℂ)) p q +
    (a : ℂ) * shiftedDampedMoment β (-(a * t / β : ℝ) * (r : ℂ)) (p + 1) q =
    ((α : ℂ) * (r : ℂ) / (β : ℂ)) * shiftedDampedMoment β (-(a * t / β : ℝ) * (r : ℂ)) p q +
      ((a : ℂ) * (q : ℂ) / (β : ℂ)) * shiftedDampedMoment β (-(a * t / β : ℝ) * (r : ℂ)) p (q - 1) at hh
  have hshift : (m : ℂ) = -((a * t / β : ℝ) : ℂ) * (r : ℂ) := by
    dsimp only [m]
    push_cast
    rfl
  simp only [← hshift, shiftedDampedMoment_ofReal] at hh
  have hreal : r * realShiftedMoment β m p q + a * realShiftedMoment β m (p + 1) q =
      (α * r / β) * realShiftedMoment β m p q +
        (a * q / β) * realShiftedMoment β m p (q - 1) := by
    exact_mod_cast hh
  rw [hreal, realShiftedMoment_eq_inv_mul, realShiftedMoment_eq_inv_mul]
  simp only [div_eq_mul_inv]
  ring

end
end Grothe.UpperChaos.ShiftedMomentFactor
