import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-! Algebra for the one-sided conditional Gaussian seed; no Gaussian identity
or numerical value is asserted. -/
namespace Grothe.UpperChaos.OneSidedShiftAlgebra

theorem combine (A t : ℝ) (d : ℕ) (ht : 0 < t) :
    A * (-(t / (1 + t)) * A) ^ d / (1 + t) +
      (-(t / (1 + t)) * A) ^ (d + 1) / (1 + t) =
    A * (-A) ^ d * (t / (1 + t)) ^ d / (1 + t) ^ 2 := by
  have hb : 1 + t ≠ 0 := by linarith
  have hs : -(t / (1 + t)) * A = (-A) * (t / (1 + t)) := by ring
  rw [hs, pow_succ, mul_pow]
  field_simp
  ring

#print axioms combine
end Grothe.UpperChaos.OneSidedShiftAlgebra
