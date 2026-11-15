import Grothe.UpperChaos.RadialRepair
import Grothe.UpperChaos.KernelStability

/-!
# A sixth-moment ceiling for outward radial changes

The small radial gap of `P3` controls a complete kernel, rather than a truncated
head. The phase moment is an explicit hypothesis: this file does not identify
the concrete Gaussian sixth moment with an external arithmetic certificate.
The comparison always uses the same preprocessors on the two responses.
For charge-one responses the composed energy coefficients are those of the
actual radial correlation kernel (`Kernel2.lean`).
-/

namespace Grothe.UpperChaos

open MeasureTheory
open scoped InnerProductSpace

noncomputable section

private lemma norm_sq_integral (F : Lp ℂ 2 mu2) :
    ‖F‖ ^ 2 = ∫ u, ‖F u‖ ^ 2 ∂mu2 := by
  calc
    ‖F‖ ^ 2 = RCLike.re (⟪F, F⟫_ℂ) := norm_sq_eq_re_inner (𝕜 := ℂ) F
    _ = ∫ u, RCLike.re (⟪F u, F u⟫_ℂ) ∂mu2 := by
      rw [L2.inner_def]
      exact (integral_re (L2.integrable_inner (𝕜 := ℂ) F F)).symm
    _ = _ := integral_congr_ae (Filter.Eventually.of_forall fun u =>
      (norm_sq_eq_re_inner (𝕜 := ℂ) (F u)).symm)

/-- An outward radial change is limited by the sixth moment of the original
phase. The almost-everywhere gap condition also allows point-dependent repairs. -/
theorem radial_distance_le_of_sixth_moment (G H : Lp ℂ 2 mu2)
    (φ : ℂ × ℂ → ℝ) (hφ : ∀ᵐ u ∂mu2, φ u ^ 2 ≤ 1)
    (hgap : ∀ᵐ u ∂mu2, ‖H u - G u‖ ≤ 1 - ‖P3 (φ u)‖)
    (h6 : Integrable (fun u => φ u ^ 6) mu2)
    {e : ℝ} (he : 0 ≤ e) (hmoment : ∫ u, φ u ^ 6 ∂mu2 ≤ 1225 * e ^ 2) :
    ‖H - G‖ ≤ e := by
  have hsq : ∀ᵐ u ∂mu2, ‖(H - G) u‖ ^ 2 ≤ φ u ^ 6 / 1225 := by
    filter_upwards [Lp.coeFn_sub H G, hφ, hgap] with u hu hφu hgu
    rw [hu]
    exact (pow_le_pow_left₀ (norm_nonneg _) hgu 2).trans
      (RadialRepair.radial_gap_sq_le hφu)
  have hi : ‖H - G‖ ^ 2 ≤ e ^ 2 := by
    rw [norm_sq_integral]
    calc
      _ ≤ ∫ u, φ u ^ 6 / 1225 ∂mu2 :=
        integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => sq_nonneg _)
          (h6.div_const 1225) hsq
      _ = (∫ u, φ u ^ 6 ∂mu2) / 1225 := integral_div _ _
      _ ≤ e ^ 2 := by linarith
  nlinarith [norm_nonneg (H - G)]

/-- The radial ceiling covers the entire composed energy coefficient sequence,
for any same feasible preprocessors, with its moment premise explicit. -/
theorem radial_kernel_ceiling (G H : Lp ℂ 2 mu2)
    (P Q : Polynomial ℝ) (hP : Grothe.l1 P ≤ 1) (hQ : Grothe.l1 Q ≤ 1)
    (hG : ‖G‖ ≤ 1) (hH : ‖H‖ ≤ 1)
    (φ : ℂ × ℂ → ℝ) (hφ : ∀ᵐ u ∂mu2, φ u ^ 2 ≤ 1)
    (hgap : ∀ᵐ u ∂mu2, ‖H u - G u‖ ≤ 1 - ‖P3 (φ u)‖)
    (h6 : Integrable (fun u => φ u ^ 6) mu2)
    {e : ℝ} (he : 0 ≤ e) (hmoment : ∫ u, φ u ^ 6 ∂mu2 ≤ 1225 * e ^ 2) :
    ∑' j, |Grothe.Upper.bivarKernel P Q (energy H) j -
      Grothe.Upper.bivarKernel P Q (energy G) j| ≤ 2 * e :=
  tsum_abs_bivarKernel_energy_sub_le_two_mul G H P Q hP hQ hG hH
    (radial_distance_le_of_sixth_moment G H φ hφ hgap h6 he hmoment)

end

end Grothe.UpperChaos
