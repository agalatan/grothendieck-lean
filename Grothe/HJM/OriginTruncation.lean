import Grothe.HJM.OriginLaguerre
import Grothe.LowerAnalytic.CapTables

/-!
# Bessel control of the omitted spatial Gaussian tail

Agent-ID: codex-aa04.

The coefficient integrals are computed on `|z|² ≤ 36`. The omitted response
has squared `L²` norm at most `exp (-36)` for every disk-valued response.
Bessel transfers that bound to the whole omitted coefficient sequence,
without a separate error allowance for each of the 120 retained coefficients.
-/

open MeasureTheory Real Set Grothe.LowerAnalytic Grothe.UpperChaos
open Grothe.LowerAnalytic.CapTab
open scoped InnerProductSpace

namespace Grothe.HJM

noncomputable section

/-- Gaussian mass of the exterior of a circle, written as an indicator integral. -/
theorem integral_gaussian_tailInd {R : ℝ} (hR : 0 < R) :
    ∫ z, tailInd R z ∂gaussC = exp (-R ^ 2) := by
  have h := integral_tail (fun _ : ℝ => (1 : ℝ)) measurable_const 0 hR
  simp only [pow_zero, mul_one, zero_add, pow_one] at h
  have hangle : ∫ _θ in (-pi)..pi, (1 : ℝ) = 2 * pi := by
    rw [intervalIntegral.integral_const]
    simp only [smul_eq_mul]
    ring
  rw [hangle] at h
  calc
    (∫ z, tailInd R z ∂gaussC) = 2 * ∫ r in Ioi R, r * exp (-r ^ 2) := by
      rw [h]
      field_simp [Real.pi_ne_zero] <;> ring
    _ = tailJ R 1 := by
      rw [tailJ, ← integral_const_mul]
      simp only [pow_one, mul_assoc]
    _ = exp (-R ^ 2) := tailJ_one hR

/-- Retain only the response outside the specified radius. -/
def spatialTail (F : ℂ → ℂ) (R : ℝ) (z : ℂ) : ℂ :=
  if R ≤ ‖z‖ then F z else 0

lemma measurable_spatialTail {F : ℂ → ℂ} (hF : Measurable F) (R : ℝ) :
    Measurable (spatialTail F R) :=
  Measurable.ite (measurableSet_le measurable_const measurable_norm) hF measurable_const

lemma norm_spatialTail_le {F : ℂ → ℂ} (hF : ∀ z, ‖F z‖ ≤ 1) (R : ℝ) (z : ℂ) :
    ‖spatialTail F R z‖ ≤ 1 := by
  unfold spatialTail
  split_ifs
  · exact hF z
  · simp

lemma memLp_spatialTail {F : ℂ → ℂ} (hF : Measurable F)
    (hF1 : ∀ z, ‖F z‖ ≤ 1) (R : ℝ) : MemLp (spatialTail F R) 2 gaussC :=
  MemLp.of_bound (measurable_spatialTail hF R).aestronglyMeasurable 1
    (Filter.Eventually.of_forall (norm_spatialTail_le hF1 R))

lemma scalar_norm_toLp_sq {F : ℂ → ℂ} (hF : MemLp F 2 gaussC) :
    ‖hF.toLp F‖ ^ 2 = ∫ z, ‖F z‖ ^ 2 ∂gaussC := by
  calc
    ‖hF.toLp F‖ ^ 2 = RCLike.re ⟪hF.toLp F, hF.toLp F⟫_ℂ :=
      norm_sq_eq_re_inner (𝕜 := ℂ) _
    _ = ∫ z, RCLike.re ⟪hF.toLp F z, hF.toLp F z⟫_ℂ ∂gaussC := by
      rw [L2.inner_def]
      exact (integral_re (L2.integrable_inner (𝕜 := ℂ) _ _)).symm
    _ = _ := by
      refine integral_congr_ae ?_
      filter_upwards [hF.coeFn_toLp] with z hz
      rw [hz, ← norm_sq_eq_re_inner]

/-- Spatial truncation has a dimension-free bound for every disk-valued response. -/
theorem spatialTail_norm_sq_le {F : ℂ → ℂ} (hF : Measurable F)
    (hF1 : ∀ z, ‖F z‖ ≤ 1) {R : ℝ} (hR : 0 < R) :
    ‖(memLp_spatialTail hF hF1 R).toLp (spatialTail F R)‖ ^ 2 ≤ exp (-R ^ 2) := by
  have hi : Integrable (tailInd R) gaussC :=
    Integrable.mono' (integrable_const (1 : ℝ))
      (measurable_tailInd R).aestronglyMeasurable
      (Filter.Eventually.of_forall fun z => by
        simpa only [Real.norm_eq_abs] using abs_tailInd_le R z)
  rw [scalar_norm_toLp_sq, ← integral_gaussian_tailInd hR]
  apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => sq_nonneg _) hi
  exact Filter.Eventually.of_forall fun z => by
    unfold spatialTail tailInd
    split_ifs
    · nlinarith [hF1 z, norm_nonneg (F z)]
    · simp

/-- Bessel controls all omitted coefficients jointly, not only a finite prefix. -/
theorem spatialTail_coeff_budget {F : ℂ → ℂ} (hF : Measurable F)
    (hF1 : ∀ z, ‖F z‖ ≤ 1) {R : ℝ} (hR : 0 < R) :
    ∑' n, ‖chargeOneCoeff ((memLp_spatialTail hF hF1 R).toLp
      (spatialTail F R)) n‖ ^ 2 ≤ exp (-R ^ 2) :=
  (chargeOneCoeff_tsum_sq_le _).trans (spatialTail_norm_sq_le hF hF1 hR)

/-- The actual Bessel truncation budget used by the 120-coefficient certificate. -/
theorem spatialTail_coeff_budget_at_six {F : ℂ → ℂ} (hF : Measurable F)
    (hF1 : ∀ z, ‖F z‖ ≤ 1) :
    ∑' n, ‖chargeOneCoeff ((memLp_spatialTail hF hF1 6).toLp
      (spatialTail F 6)) n‖ ^ 2 ≤ exp (-36) := by
  have h := spatialTail_coeff_budget hF hF1 (R := 6) (by norm_num)
  norm_num at h
  exact h

end

end Grothe.HJM
