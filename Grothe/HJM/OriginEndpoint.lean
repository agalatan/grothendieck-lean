import Grothe.HJM.OriginEnergyExtension
import Mathlib.Analysis.Calculus.Deriv.Slope
import Mathlib.Topology.Order.DenselyOrdered

/-!
# Exact endpoint values of the origin energy amplitudes

Agent-ID: codex-aa04.

The phase quotient is the continuous extension of the right-hand difference
quotient, hence its value at zero is the actual derivative. Substitution into
the nonsingular energy amplitude gives `-3/2` times that derivative. Its
squared norm is consequently `9/4` times the squared derivative norm.

-/

open Filter Set
open scoped Topology

namespace Grothe.HJM.Origin

noncomputable section

/-- Uniqueness of the right-hand limit identifies any continuous extension
of a complex-valued real difference quotient with the derivative. -/
private theorem continuous_right_quotient_value {v q : ℝ → ℂ} {d : ℂ}
    (hd : HasDerivAt v d 0) (hq : ContinuousWithinAt q (Ici 0) 0)
    (heq : ∀ s : ℝ, 0 < s → (v s - v 0) / (s : ℂ) = q s) :
    q 0 = d := by
  have hslope : Tendsto (fun s : ℝ => (v s - v 0) / (s : ℂ))
      (𝓝[>] (0 : ℝ)) (𝓝 d) := by
    simpa only [zero_add, Complex.real_smul, Complex.ofReal_inv, div_eq_inv_mul] using
      hd.tendsto_slope_zero_right
  have hlimit : Tendsto q (𝓝[>] (0 : ℝ)) (𝓝 d) := by
    refine hslope.congr' ?_
    filter_upwards [self_mem_nhdsWithin] with s (hs : 0 < s)
    exact heq s hs
  have hcontinuous : Tendsto q (𝓝[>] (0 : ℝ)) (𝓝 (q 0)) :=
    hq.mono Ioi_subset_Ici_self
  exact tendsto_nhds_unique hcontinuous hlimit

/-- The left rationalized quotient has the correct derivative value at zero. -/
theorem fPhaseQuotient_zero_eq_deriv : fPhaseQuotient 0 = deriv f 0 :=
  continuous_right_quotient_value (hasDerivAt_f 0 le_rfl)
    (continuousOn_fPhaseQuotient 0 (by simp)) f_difference_quotient

/-- The right rationalized quotient has the correct derivative value at zero. -/
theorem gPhaseQuotient_zero_eq_deriv : gPhaseQuotient 0 = deriv g 0 :=
  continuous_right_quotient_value (hasDerivAt_g 0 le_rfl)
    (continuousOn_gPhaseQuotient 0 (by simp)) g_difference_quotient

/-- Exact endpoint of the continuous left energy amplitude. -/
theorem fEnergyAmplitude_zero :
    fEnergyAmplitude 0 = ((-(3 / 2 : ℝ) : ℝ) : ℂ) * deriv f 0 := by
  simp only [fEnergyAmplitude, Complex.ofReal_zero, fPhaseQuotient_zero_eq_deriv]
  push_cast
  ring

/-- Exact endpoint of the continuous right energy amplitude. -/
theorem gEnergyAmplitude_zero :
    gEnergyAmplitude 0 = ((-(3 / 2 : ℝ) : ℝ) : ℂ) * deriv g 0 := by
  simp only [gEnergyAmplitude, Complex.ofReal_zero, gPhaseQuotient_zero_eq_deriv]
  push_cast
  ring

/-- The left endpoint energy density reduces to a derivative norm. -/
theorem norm_fEnergyAmplitude_zero_sq :
    ‖fEnergyAmplitude 0‖ ^ 2 = (9 / 4 : ℝ) * ‖deriv f 0‖ ^ 2 := by
  rw [fEnergyAmplitude_zero, norm_mul, mul_pow, Complex.norm_real, Real.norm_eq_abs]
  norm_num

/-- The right endpoint energy density reduces to a derivative norm. -/
theorem norm_gEnergyAmplitude_zero_sq :
    ‖gEnergyAmplitude 0‖ ^ 2 = (9 / 4 : ℝ) * ‖deriv g 0‖ ^ 2 := by
  rw [gEnergyAmplitude_zero, norm_mul, mul_pow, Complex.norm_real, Real.norm_eq_abs]
  norm_num

end

end Grothe.HJM.Origin
