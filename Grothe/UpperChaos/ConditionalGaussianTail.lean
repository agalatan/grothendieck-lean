import Grothe.UpperChaos.ConditionalGaussianBase
import Grothe.UpperChaos.RealGaussianKernelTail

/-!
# An auxiliary tail bound for the exact conditional base kernel

These results concern the zeroth conditional Gaussian moment at `‖z‖ ≥ r₀ > 0`.
They are uniform in the real affine coefficient `a`. They are not an enclosure
of the full polynomial-weighted comparison inner products.

Agent-ID: codex-37fb.
-/

open MeasureTheory Set Grothe.LowerAnalytic Grothe.Haag

namespace Grothe.UpperChaos

noncomputable section

/-- The exact conditional base kernel has a profile-uniform `t^(-5/2)` bound away from zero. -/
theorem norm_integral_affine_phaseLaplace_base_le (α a t r₀ : ℝ) (z : ℂ)
    (hα : 0 < α) (ht : 0 < t) (hr₀ : 0 < r₀) (hz : r₀ ≤ ‖z‖) :
    ‖∫ w, phaseLaplaceKernel (z + (a : ℂ) * w) t *
      (Real.exp (-(α - 1) * Complex.normSq w) : ℂ) ∂gaussC‖ ≤
        (2 / (α * r₀ ^ 3)) * t ^ (-5 / 2 : ℝ) := by
  have hβ : 0 < α + a ^ 2 * t :=
    add_pos_of_pos_of_nonneg hα (mul_nonneg (sq_nonneg a) ht.le)
  rw [norm_integral_affine_phaseLaplace_base α a t z hα ht]
  have hp := conditional_gaussian_laplace_profile_le_uniform ‖z‖ r₀ α t
    (α + a ^ 2 * t) hr₀ hz hα ht hβ
  simpa only [Complex.normSq_eq_norm_sq, neg_div, mul_assoc, mul_left_comm, mul_comm] using hp

/-- The norm of the conditional base kernel is integrable above a positive auxiliary cutoff. -/
theorem integrableOn_norm_affine_phaseLaplace_base_tail (α a T r₀ : ℝ) (z : ℂ)
    (hα : 0 < α) (hT : 0 < T) (hr₀ : 0 < r₀) (hz : r₀ ≤ ‖z‖) :
    IntegrableOn (fun t : ℝ => ‖∫ w, phaseLaplaceKernel (z + (a : ℂ) * w) t *
      (Real.exp (-(α - 1) * Complex.normSq w) : ℂ) ∂gaussC‖) (Ioi T) := by
  have hβ (t : ℝ) (ht : t ∈ Ioi T) : 0 < α + a ^ 2 * t :=
    add_pos_of_pos_of_nonneg hα (mul_nonneg (sq_nonneg a) (hT.trans ht).le)
  have hp := integrableOn_conditional_gaussian_laplace_profile
    (fun t : ℝ => α + a ^ 2 * t) (by fun_prop) ‖z‖ r₀ α T hr₀ hz hα hT hβ
  apply hp.congr
  filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht
  have hn := norm_integral_affine_phaseLaplace_base α a t z hα (hT.trans ht)
  simpa only [Complex.normSq_eq_norm_sq, neg_div, mul_assoc, mul_left_comm, mul_comm] using hn.symm

/-- Explicit integrated auxiliary tail bound for the exact conditional base kernel. -/
theorem integral_norm_affine_phaseLaplace_base_tail_le (α a T r₀ : ℝ) (z : ℂ)
    (hα : 0 < α) (hT : 0 < T) (hr₀ : 0 < r₀) (hz : r₀ ≤ ‖z‖) :
    (∫ t : ℝ in Ioi T, ‖∫ w, phaseLaplaceKernel (z + (a : ℂ) * w) t *
      (Real.exp (-(α - 1) * Complex.normSq w) : ℂ) ∂gaussC‖) ≤
        (2 / (α * r₀ ^ 3)) * (2 / 3 : ℝ) * T ^ (-3 / 2 : ℝ) := by
  calc
    _ = ∫ t : ℝ in Ioi T, t ^ (-1 / 2 : ℝ) *
        Real.exp (-(α * ‖z‖ ^ 2 * t / (α + a ^ 2 * t))) *
          α * ‖z‖ / (α + a ^ 2 * t) ^ 2 := by
      apply setIntegral_congr_fun measurableSet_Ioi
      intro t ht
      have hn := norm_integral_affine_phaseLaplace_base α a t z hα (hT.trans ht)
      simpa only [Complex.normSq_eq_norm_sq, neg_div, mul_assoc, mul_left_comm, mul_comm] using hn
    _ ≤ _ := integral_conditional_gaussian_laplace_profile_tail_le
      (fun t : ℝ => α + a ^ 2 * t) (by fun_prop) ‖z‖ r₀ α T hr₀ hz hα hT
      (fun t ht => add_pos_of_pos_of_nonneg hα
        (mul_nonneg (sq_nonneg a) (hT.trans ht).le))

end
end Grothe.UpperChaos
