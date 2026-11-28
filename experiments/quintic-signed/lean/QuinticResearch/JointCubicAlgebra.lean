import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity

/-! Pointwise inequalities for the joint cubic projection budget. Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic.JointCubic
open Finset Real

/-- Both possible groups of visible cubic tests have Gaussian-weighted density at most one. -/
theorem density_polynomials {T : ℝ} (hT : 0 ≤ T) :
    2*T + T*(T-2)^2/2 ≤ exp T ∧ (T-1)^2+T^2/2 ≤ exp T := by
  have h3 := Real.sum_le_exp_of_nonneg hT 4
  have h4 := Real.sum_le_exp_of_nonneg hT 5
  norm_num [sum_range_succ, Nat.factorial] at h3 h4
  constructor
  · nlinarith only [h4, sq_nonneg (1-3*T/2+T^2/12),
      mul_nonneg (sq_nonneg T) (sq_nonneg (T-6/5)), sq_nonneg T]
  · nlinarith only [h3, mul_nonneg hT (sq_nonneg (T-3)), hT]

/-- Reflecting the odd perturbation cancels its first variation and both
mixed terms in the quadratic cost. This form also covers the zero denominator. -/
theorem reflected_cost (x v u : ℂ) :
    ‖x‖*(‖x+v+u‖+‖x+v-u‖-2*‖x‖) ≤
      2*(inner ℂ x v).re+‖v‖^2+‖u‖^2 := by
  have ha := @norm_add_sq ℂ _ _ _ _ (x+v) u
  have hs := @norm_sub_sq ℂ _ _ _ _ (x+v) u
  have hx := @norm_add_sq ℂ _ _ _ _ x v
  change ‖x+v‖ ^ 2 = ‖x‖ ^ 2 + 2 * (inner ℂ x v).re + ‖v‖ ^ 2 at hx
  nlinarith only [ha,hs,hx,sq_nonneg (‖x+v+u‖-‖x‖),sq_nonneg (‖x+v-u‖-‖x‖)]

/-- The shift-dependent even first variation is paid from the actual Rice deficit. -/
theorem absorb_even {D m A b : ℝ} (hD : 0 ≤ D) (hm : 0 ≤ m)
    (hA : A^2 ≤ (9*m/2)*D) : A*b ≤ D+(9*m/8)*b^2 := by
  rcases eq_or_lt_of_le hD with h|h
  · subst D
    have hz : A=0 := by nlinarith only [hA,sq_nonneg A]
    rw [hz]
    nlinarith only [mul_nonneg hm (sq_nonneg b)]
  · have hf : 0 ≤ 4*D*(D+(9*m/8)*b^2-A*b) := by
      nlinarith only [sq_nonneg (2*D-A*b),mul_nonneg (sub_nonneg.mpr hA) (sq_nonneg b)]
    have hpos : 0 < 4*D := by positivity
    exact sub_nonneg.mp ((mul_nonneg_iff_of_pos_left hpos).mp hf)

/-- Optimize the independent projections in a quadratic phase support estimate. -/
theorem shared_projection_budget {t m T O E : ℝ} (hm : 0 < m)
    (h : ∀ a b c : ℝ, t+a*T+b*O+c*E ≤ m+m/2*a^2*T+b^2*O+(1+9*m/8)*c^2*E) :
    T+(m/2)*O+(m/(2+9*m/4))*E ≤ 2*m*(m-t) := by
  have hpos : 0 < 2+9*m/4 := by positivity
  have hu := h (1/m) (1/2) (1/(2+9*m/4))
  let q := 2+9*m/4
  have hq : q ≠ 0 := hpos.ne'
  change t+(1/m)*T+(1/2)*O+(1/q)*E ≤ m+m/2*(1/m)^2*T+(1/2)^2*O+(1+9*m/8)*(1/q)^2*E at hu
  have he : (1+9*m/8)*(1/q)^2*E = (1/q)*E/2 := by
    have heq : 1 + 9*m/8 = q/2 := by dsimp [q]; ring
    rw [heq]
    field_simp [hq]
  have hT : m/2*(1/m)^2*T = (1/m)*T/2 := by field_simp [hm.ne']
  rw [he,hT] at hu
  have hs : (1/m)*T + O/2 + (1/q)*E ≤ 2*(m-t) := by linarith
  have hx := mul_le_mul_of_nonneg_left hs hm.le
  change T+(m/2)*O+(m/q)*E ≤ 2*m*(m-t)
  convert hx using 1 <;> field_simp [hm.ne',hq]


end Grothe.LowerAnalytic.JointCubic
