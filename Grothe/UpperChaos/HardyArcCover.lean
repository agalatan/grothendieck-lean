import Grothe.UpperChaos.HardyArcSound
import Grothe.UpperChaos.HardyArcCircle

/-!
# The squared correlation on the Hardy circle

`gF F G neg θ` is `‖HholPair F G (R(±ρ e^{iθ}))‖²` on the two charts of the circle `ρ = 4149/4000`; holomorphy
near the circle makes it integrable (`gF_intervalIntegrable`). The Gaussian-amplitude bound of
`HardyGaussian.lean` integrates it over both charts.
-/

open MeasureTheory Real
open scoped ComplexConjugate

namespace Grothe.UpperChaos.HardyArcCover

open GrotheKernel GrotheKernel.HardyArc Grothe.Upper HardyArcSound HardyArcCircle SchurMain SchurKernel

/-- The squared correlation along a chart. -/
noncomputable def gF (F G : ℂ × ℂ → ℂ) (neg : Bool) (θ : ℝ) : ℝ :=
  ‖HholPair F G (Rt (HardyArcSound.sig neg * ((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2

variable {F G : ℂ × ℂ → ℂ} (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1)
  (hG : ∀ u, ‖G u‖ ≤ 1)
include hFm hGm hF hG

/-- Holomorphy near the circle makes every chart function integrable. -/
lemma gF_intervalIntegrable {r : ℝ} (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (Rt t) l) (neg : Bool) (a b : ℝ) :
    IntervalIntegrable (gF F G neg) volume a b := by
  have hd := differentiableOn_HholPair_Rt hFm hGm hF hG Metric.isOpen_ball hU
  have hc : Continuous (gF F G neg) := by
    unfold gF
    have hmaps : ∀ θ : ℝ, HardyArcSound.sig neg * ((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I) ∈
        Metric.ball (0 : ℂ) r := by
      intro θ
      rw [Metric.mem_ball, dist_zero_right, norm_mul, norm_mul, Complex.norm_exp_ofReal_mul_I, mul_one]
      have hs : ‖HardyArcSound.sig neg‖ = 1 := by cases neg <;> simp [HardyArcSound.sig]
      rw [hs, one_mul, Complex.norm_of_nonneg (by norm_num [rhoQ])]
      exact hr
    have hcont : Continuous fun θ : ℝ => HardyArcSound.sig neg * ((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I) := by
      fun_prop
    exact (continuous_norm.comp (hd.continuousOn.comp_continuous hcont hmaps)).pow 2
  exact hc.intervalIntegrable a b

end Grothe.UpperChaos.HardyArcCover
