import Grothe.UpperChaos.PhaseRadialTail
import Grothe.UpperChaos.ComparisonPieces
import Mathlib.MeasureTheory.Function.LpSeminorm.Indicator
import Mathlib.MeasureTheory.Integral.Bochner.Set

/-!
Radial tails of every positive Taylor source in the original Gaussian L² space.
The phase tail certificate and the pointwise bound |phiT| < 1 supply the numerical
estimate. Restricting with an indicator preserves the L² space used by the
smoothing and band-projection contractions.
-/

open MeasureTheory
open scoped InnerProductSpace

namespace Grothe.UpperChaos.TaylorRadialTail

noncomputable section

/-- The same first-coordinate squared-radius event as RestrictedWick.muCut. -/
def cutoffSet (L : ℝ) : Set (ℂ × ℂ) :=
  {z : ℂ | L < ‖z‖ ^ 2} ×ˢ Set.univ

lemma measurableSet_cutoffSet (L : ℝ) : MeasurableSet (cutoffSet L) := by
  exact (isOpen_lt continuous_const (continuous_norm.pow 2)).measurableSet.prod
    MeasurableSet.univ

lemma muCut_eq_restrict (L : ℝ) :
    RestrictedWick.muCut L = mu2.restrict (cutoffSet L) := by
  exact Measure.restrict_prod_eq_prod_univ _

lemma muCut_le_mu2 (L : ℝ) : RestrictedWick.muCut L ≤ mu2 := by
  rw [muCut_eq_restrict]
  exact Measure.restrict_le_self

lemma integrable_phiT_pow_cut (L : ℝ) (j : ℕ) :
    Integrable (fun u => phiT u ^ j) (RestrictedWick.muCut L) :=
  (integrable_phiT_pow j).mono_measure (muCut_le_mu2 L)

/-- Positive even powers contract because the phase has modulus at most one. -/
lemma phiT_even_pow_le_sq {j : ℕ} (hj : 0 < j) (u : ℂ × ℂ) :
    phiT u ^ (2 * j) ≤ phiT u ^ 2 := by
  have hunit : phiT u ^ 2 ≤ 1 := (phiT_sq_le u).trans (by norm_num)
  rw [pow_mul]
  exact pow_le_of_le_one (sq_nonneg _) hunit hj.ne'

/-- Exact pointwise phase energy remains exact after a radial restriction. -/
lemma integral_hpow_sq_cut_eq {j : ℕ} (hj : 0 < j) (L : ℝ) :
    (∫ u, ‖hpow j u‖ ^ 2 ∂(RestrictedWick.muCut L)) =
      ∫ u, phiT u ^ (2 * j) ∂(RestrictedWick.muCut L) := by
  exact integral_congr_ae (Filter.Eventually.of_forall (norm_hpow_sq_eq hj))

/-- One radial phase-energy estimate controls every positive Taylor source. -/
lemma integral_hpow_sq_cut_le {j : ℕ} (hj : 0 < j) (L : ℝ) :
    (∫ u, ‖hpow j u‖ ^ 2 ∂(RestrictedWick.muCut L)) ≤
      ∫ u, phiT u ^ 2 ∂(RestrictedWick.muCut L) := by
  apply integral_mono_of_nonneg
    (Filter.Eventually.of_forall fun _ => sq_nonneg _)
    (integrable_phiT_pow_cut L 2)
  exact Filter.Eventually.of_forall fun u =>
    (norm_hpow_sq_eq hj u).le.trans (phiT_even_pow_le_sq hj u)

/-- The actual restricted squared source integral needs no new numeric check. -/
theorem integral_hpow_sq_cut_fifty_lt {j : ℕ} (hj : 0 < j) :
    (∫ u, ‖hpow j u‖ ^ 2 ∂(RestrictedWick.muCut 50)) <
      (5 / 10 ^ 15 : ℝ) ^ 2 :=
  (integral_hpow_sq_cut_le hj 50).trans_lt integral_phiT_sq_radial_tail_lt

/-- The radial tail of a Taylor source, represented in the original measure. -/
def source (L : ℝ) (j : ℕ) : ℂ × ℂ → ℂ :=
  (cutoffSet L).indicator (hpow j)

lemma source_memLp (L : ℝ) (j : ℕ) : MemLp (source L j) 2 mu2 := by
  exact (chargeFn_hpow phiBound j).memLp.indicator (measurableSet_cutoffSet L)

/-- The indicator's original-space energy equals the restricted source energy. -/
lemma norm_source_sq_eq_integral (L : ℝ) (j : ℕ) :
    ‖(source_memLp L j).toLp (source L j)‖ ^ 2 =
      ∫ u, ‖hpow j u‖ ^ 2 ∂(RestrictedWick.muCut L) := by
  rw [norm_toLp_sq_eq_integral]
  calc
    (∫ u, ‖source L j u‖ ^ 2 ∂mu2) =
        ∫ u, (cutoffSet L).indicator (fun u => ‖hpow j u‖ ^ 2) u ∂mu2 := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall fun u => by
        by_cases hu : u ∈ cutoffSet L <;> simp [source, hu]
    _ = _ := by
      rw [integral_indicator (measurableSet_cutoffSet L), muCut_eq_restrict]

/-- The radial indicator energy bound for every positive Taylor source. -/
theorem norm_source_fifty_sq_lt {j : ℕ} (hj : 0 < j) :
    ‖(source_memLp 50 j).toLp (source 50 j)‖ ^ 2 < (5 / 10 ^ 15 : ℝ) ^ 2 := by
  rw [norm_source_sq_eq_integral]
  exact integral_hpow_sq_cut_fifty_lt hj

/-- Every positive Taylor source has radial L² tail strictly below 5e-15. -/
theorem norm_source_fifty_lt {j : ℕ} (hj : 0 < j) :
    ‖(source_memLp 50 j).toLp (source 50 j)‖ < (5 / 10 ^ 15 : ℝ) := by
  exact (sq_lt_sq₀ (norm_nonneg _) (by positivity)).mp (norm_source_fifty_sq_lt hj)

end

end Grothe.UpperChaos.TaylorRadialTail
