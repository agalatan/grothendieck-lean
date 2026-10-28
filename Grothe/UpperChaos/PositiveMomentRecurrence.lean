import Grothe.UpperChaos.PositiveMomentTheta
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith

/-! Integration-by-parts recurrence for the smooth angular moments. The
change of variables from the original J integral is not asserted here.
Agent-ID: codex-8c4d. -/
open MeasureTheory Set
open scoped Real
namespace Grothe.UpperChaos.PositiveMomentTheta
noncomputable section

/-- Endpoint-vanishing primitive for the angular moment recurrence. -/
def primitive (h : ℕ) (x t : ℝ) : ℝ :=
  Real.sin t ^ (2 * h + 1) * Real.cos t ^ 3 * Real.exp (-x * Real.sin t ^ 2)

def primitiveDerivative (h : ℕ) (x t : ℝ) : ℝ :=
  density h x t * (((2 * h + 1 : ℕ) : ℝ) -
    (((2 * h + 4 : ℕ) : ℝ) + 2 * x) * Real.sin t ^ 2 + 2 * x * Real.sin t ^ 4)

theorem primitive_hasDerivAt (h : ℕ) (x t : ℝ) :
    HasDerivAt (primitive h x) (primitiveDerivative h x t) t := by
  have hs := (Real.hasDerivAt_sin t).pow (2 * h + 1)
  have hc := (Real.hasDerivAt_cos t).pow 3
  have he := ((hasDerivAt_const t (-x)).mul ((Real.hasDerivAt_sin t).pow 2)).exp
  have hv := (hs.mul hc).mul he
  convert hv using 1
  · rfl
  · unfold primitiveDerivative density
    simp only [Pi.mul_apply, Pi.pow_apply, Nat.cast_add, Nat.cast_mul, Nat.cast_one,
      Nat.cast_ofNat, Nat.add_sub_cancel, Nat.reduceSub, zero_mul, zero_add]
    rw [show Real.sin t ^ (2 * h + 1) = Real.sin t ^ (2 * h) * Real.sin t by rw [pow_succ]]
    have hc2 : Real.cos t ^ 2 = 1 - Real.sin t ^ 2 := by
      nlinarith [Real.sin_sq_add_cos_sq t]
    simp only [show Real.cos t ^ 3 = Real.cos t ^ 2 * Real.cos t by ring, hc2]
    ring_nf
    simp only [hc2]
    ring


theorem primitiveDerivative_continuous (h : ℕ) (x : ℝ) :
    Continuous (primitiveDerivative h x) := by
  unfold primitiveDerivative density
  fun_prop

theorem primitive_endpoints (h : ℕ) (x : ℝ) :
    primitive h x 0 = 0 ∧ primitive h x (Real.pi / 2) = 0 := by
  constructor
  · simp [primitive, pow_succ]
  · simp [primitive]

theorem integral_primitiveDerivative (h : ℕ) (x : ℝ) :
    (∫ t in (0 : ℝ)..(Real.pi / 2), primitiveDerivative h x t) = 0 := by
  have hfund := intervalIntegral.integral_eq_sub_of_hasDerivAt
    (fun t _ => primitive_hasDerivAt h x t)
    ((primitiveDerivative_continuous h x).intervalIntegrable 0 (Real.pi / 2))
  rw [(primitive_endpoints h x).1, (primitive_endpoints h x).2] at hfund
  simpa using hfund

theorem derivative_as_densities (h : ℕ) (x t : ℝ) :
    primitiveDerivative h x t =
      (((2 * h + 1 : ℕ) : ℝ) * density h x t) -
      ((((2 * h + 4 : ℕ) : ℝ) + 2 * x) * density (h + 1) x t) +
      (2 * x) * density (h + 2) x t := by
  rw [show h + 2 = (h + 1) + 1 by omega]
  simp only [density_succ]
  unfold primitiveDerivative
  ring


/-- The smooth angular moments satisfy the three-term integration-by-parts
recurrence. This theorem makes no claim about the endpoint-singular original
integral until its change of variables is separately proved. -/
theorem moment_recurrence (h : ℕ) (x : ℝ) :
    ((h : ℝ) + 1 / 2) * moment h x - ((h : ℝ) + 2 + x) * moment (h + 1) x +
      x * moment (h + 2) x = 0 := by
  let A : ℝ := ((2 * h + 1 : ℕ) : ℝ)
  let B : ℝ := ((2 * h + 4 : ℕ) : ℝ) + 2 * x
  let C : ℝ := 2 * x
  have hi0 : IntervalIntegrable (fun t => A * density h x t) volume 0 (Real.pi / 2) :=
    (continuous_const.mul (density_continuous h x)).intervalIntegrable _ _
  have hi1 : IntervalIntegrable (fun t => B * density (h + 1) x t) volume 0 (Real.pi / 2) :=
    (continuous_const.mul (density_continuous (h + 1) x)).intervalIntegrable _ _
  have hi2 : IntervalIntegrable (fun t => C * density (h + 2) x t) volume 0 (Real.pi / 2) :=
    (continuous_const.mul (density_continuous (h + 2) x)).intervalIntegrable _ _
  have heq : primitiveDerivative h x = fun t =>
      A * density h x t - B * density (h + 1) x t + C * density (h + 2) x t := by
    funext t
    exact derivative_as_densities h x t
  have hz := integral_primitiveDerivative h x
  rw [heq, intervalIntegral.integral_add (hi0.sub hi1) hi2,
    intervalIntegral.integral_sub hi0 hi1,
    intervalIntegral.integral_const_mul, intervalIntegral.integral_const_mul,
    intervalIntegral.integral_const_mul] at hz
  change A * moment h x - B * moment (h + 1) x + C * moment (h + 2) x = 0 at hz
  dsimp [A, B, C] at hz
  push_cast at hz
  linarith


end
end Grothe.UpperChaos.PositiveMomentTheta
#print axioms Grothe.UpperChaos.PositiveMomentTheta.moment_recurrence
