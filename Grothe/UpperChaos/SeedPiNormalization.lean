import Mathlib.Analysis.Real.Sqrt
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring
import Mathlib.Tactic.LinearCombination

/-! Elementary π-normalization for the real seed integral. -/
namespace Grothe.UpperChaos.SeedPiNormalization

theorem sqrt_pi_factor (r : ℝ) :
    (Real.sqrt Real.pi)⁻¹ * ((Real.pi / 2) * r) = (Real.sqrt Real.pi / 2) * r := by
  have hp : (Real.sqrt Real.pi) ≠ 0 := ne_of_gt (Real.sqrt_pos.2 Real.pi_pos)
  have hs : (Real.sqrt Real.pi) ^ 2 = Real.pi := Real.sq_sqrt Real.pi_pos.le
  have hsr := congrArg (fun x : ℝ => x * r) hs
  field_simp
  nlinarith [hsr]

#print axioms sqrt_pi_factor
end Grothe.UpperChaos.SeedPiNormalization
