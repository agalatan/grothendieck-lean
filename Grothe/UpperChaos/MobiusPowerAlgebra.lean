import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith

/-! Pointwise power identity for the conditional moment substitution. This
asserts no improper integral equality or Gaussian coefficient identity. -/
namespace Grothe.UpperChaos.MobiusPowerAlgebra
noncomputable section

theorem mobius_power_identity (d : ℕ) (t : ℝ) (ht : 0 < t) :
    (t / (1 + t)) ^ ((d : ℝ) - 1 / 2) * Real.sqrt (1 - t / (1 + t)) =
      (t / (1 + t)) ^ d * t ^ (-(1 / 2 : ℝ)) := by
  have hp : 0 < 1 + t := by linarith
  have hv : 0 < t / (1 + t) := div_pos ht hp
  have htneg : t ^ (-(1 / 2 : ℝ)) = (Real.sqrt t)⁻¹ := by
    rw [Real.rpow_neg ht.le, ← Real.sqrt_eq_rpow]
  have hvpow : (t / (1 + t)) ^ ((d : ℝ) - 1 / 2) =
      (t / (1 + t)) ^ d / Real.sqrt (t / (1 + t)) := by
    rw [Real.rpow_sub hv, Real.rpow_natCast, ← Real.sqrt_eq_rpow]
  have hone : 1 - t / (1 + t) = 1 / (1 + t) := by
    field_simp; ring
  have hsqrt : Real.sqrt (1 + t) ≠ 0 := ne_of_gt (Real.sqrt_pos.2 hp)
  have hroot : Real.sqrt t ≠ 0 := ne_of_gt (Real.sqrt_pos.2 ht)
  rw [hvpow, htneg, hone, Real.sqrt_div (by norm_num : (0 : ℝ) ≤ 1), Real.sqrt_one,
    Real.sqrt_div ht.le]
  field_simp

end
end Grothe.UpperChaos.MobiusPowerAlgebra
#print axioms Grothe.UpperChaos.MobiusPowerAlgebra.mobius_power_identity
