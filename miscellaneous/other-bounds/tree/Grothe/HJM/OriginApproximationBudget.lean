import Grothe.HJM.OriginTruncation
import Grothe.HJM.OriginEnergy

/-!
# A single spatial error budget for all origin coefficients

Agent-ID: codex-aa04.

A measurable approximation with uniform error `ε` inside radius `R`, and
zero outside, has squared Gaussian `L²` error at most `ε² + exp (-R²)`.
The two errors have disjoint spatial support. Bessel transfers this one
budget to the entire charge-one coefficient sequence, without multiplying
the approximation allowance by the number of retained coefficients.

Only the original response is required to be disk-valued. The polynomial
approximation is used to enclose its integrals, not as a rounding response.
-/

open MeasureTheory Real Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.HJM

noncomputable section

/-- A compactly supported uniform approximation is itself in Gaussian `L²`.
It need not take values in the unit disk. -/
theorem memLp_of_spatial_approximation {F V : ℂ → ℂ} (hV : Measurable V)
    (hF1 : ∀ z, ‖F z‖ ≤ 1) {R ε : ℝ} (hε : 0 ≤ ε)
    (hclose : ∀ z, ‖z‖ < R → ‖F z - V z‖ ≤ ε)
    (hzero : ∀ z, R ≤ ‖z‖ → V z = 0) : MemLp V 2 gaussC := by
  apply MemLp.of_bound hV.aestronglyMeasurable (1 + ε)
  exact Filter.Eventually.of_forall fun z => by
    by_cases hz : R ≤ ‖z‖
    · rw [hzero z hz, norm_zero]
      linarith
    · calc
        ‖V z‖ = ‖F z - (F z - V z)‖ := by congr 1; abel
        _ ≤ ‖F z‖ + ‖F z - V z‖ := norm_sub_le _ _
        _ ≤ 1 + ε := add_le_add (hF1 z) (hclose z (lt_of_not_ge hz))

/-- The interior approximation error and the omitted Gaussian mass are
added at the squared-norm level because their supports are disjoint. -/
theorem spatial_approximation_norm_sq_le {F V : ℂ → ℂ}
    (hF : MemLp F 2 gaussC) (hV : MemLp V 2 gaussC)
    (hF1 : ∀ z, ‖F z‖ ≤ 1) {R ε : ℝ} (hR : 0 < R) (hε : 0 ≤ ε)
    (hclose : ∀ z, ‖z‖ < R → ‖F z - V z‖ ≤ ε)
    (hzero : ∀ z, R ≤ ‖z‖ → V z = 0) :
    ‖hF.toLp F - hV.toLp V‖ ^ 2 ≤ ε ^ 2 + exp (-R ^ 2) := by
  have htail : Integrable (tailInd R) gaussC :=
    Integrable.mono' (integrable_const (1 : ℝ))
      (measurable_tailInd R).aestronglyMeasurable
      (Filter.Eventually.of_forall fun z => by
        simpa only [Real.norm_eq_abs] using abs_tailInd_le R z)
  have hpoint (z : ℂ) : ‖F z - V z‖ ^ 2 ≤ ε ^ 2 + tailInd R z := by
    by_cases hz : R ≤ ‖z‖
    · simp only [hzero z hz, sub_zero, tailInd, hz, ↓reduceIte]
      have h := pow_le_one₀ (norm_nonneg (F z)) (hF1 z) (n := 2)
      nlinarith [sq_nonneg ε]
    · simp only [tailInd, hz, ↓reduceIte, add_zero]
      exact (sq_le_sq₀ (norm_nonneg _) hε).2 (hclose z (lt_of_not_ge hz))
  calc
    ‖hF.toLp F - hV.toLp V‖ ^ 2 = ∫ z, ‖F z - V z‖ ^ 2 ∂gaussC :=
      scalar_norm_toLp_sq (hF.sub hV)
    _ ≤ ∫ z, ε ^ 2 + tailInd R z ∂gaussC :=
      integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => sq_nonneg _)
        ((integrable_const (ε ^ 2)).add htail) (Filter.Eventually.of_forall hpoint)
    _ = ε ^ 2 + exp (-R ^ 2) := by
      rw [integral_add (integrable_const _) htail, integral_gaussian_tailInd hR]
      simp

/-- One spatial approximation controls every Hermite coefficient jointly. -/
theorem spatial_approximation_coeff_budget {F V : ℂ → ℂ}
    (hF : MemLp F 2 gaussC) (hV : MemLp V 2 gaussC)
    (hF1 : ∀ z, ‖F z‖ ≤ 1) {R ε : ℝ} (hR : 0 < R) (hε : 0 ≤ ε)
    (hclose : ∀ z, ‖z‖ < R → ‖F z - V z‖ ≤ ε)
    (hzero : ∀ z, R ≤ ‖z‖ → V z = 0) :
    ∑' n, ‖chargeOneCoeff (hF.toLp F) n - chargeOneCoeff (hV.toLp V) n‖ ^ 2 ≤
      ε ^ 2 + exp (-R ^ 2) := by
  have h := chargeOneCoeff_tsum_sq_le (hF.toLp F - hV.toLp V)
  simp only [chargeOneCoeff_sub] at h
  exact h.trans (spatial_approximation_norm_sq_le hF hV hF1 hR hε hclose hzero)

/-- Unit-energy actual responses turn the joint spatial error into a finite
coefficient-product error. The reference energies are those of the actual
responses, so no disk constraint on the approximants is needed. -/
theorem origin_approximation_sum_error (s : Finset ℕ)
    (F G V W : Lp ℂ 2 gaussC) (hF1 : ‖F‖ ≤ 1) (hG1 : ‖G‖ ≤ 1)
    (ε : ℝ) (hε : 0 ≤ ε) (hFV : ‖F - V‖ ≤ ε) (hGW : ‖G - W‖ ≤ ε) :
    ∑ n ∈ s, ‖conj (chargeOneCoeff F n) * chargeOneCoeff G n -
      conj (chargeOneCoeff V n) * chargeOneCoeff W n‖ ≤ 2 * ε + ε ^ 2 := by
  have hVF : ‖V - F‖ ≤ ε := by rw [norm_sub_rev]; exact hFV
  have hWG : ‖W - G‖ ≤ ε := by rw [norm_sub_rev]; exact hGW
  have hF : √(∑ n ∈ s, ‖chargeOneCoeff F n‖ ^ 2) ≤ 1 := by
    have h := Real.sqrt_le_sqrt (chargeOneCoeff_sum_sq_le F s)
    rw [Real.sqrt_sq (norm_nonneg F)] at h
    exact h.trans hF1
  have hG : √(∑ n ∈ s, ‖chargeOneCoeff G n‖ ^ 2) ≤ 1 := by
    have h := Real.sqrt_le_sqrt (chargeOneCoeff_sum_sq_le G s)
    rw [Real.sqrt_sq (norm_nonneg G)] at h
    exact h.trans hG1
  calc
    _ = ∑ n ∈ s, ‖conj (chargeOneCoeff V n) * chargeOneCoeff W n -
        conj (chargeOneCoeff F n) * chargeOneCoeff G n‖ :=
      Finset.sum_congr rfl fun _ _ => norm_sub_rev _ _
    _ ≤ ε * (√(∑ n ∈ s, ‖chargeOneCoeff F n‖ ^ 2) +
        √(∑ n ∈ s, ‖chargeOneCoeff G n‖ ^ 2)) + ε ^ 2 :=
      origin_response_coefficients_perturbation s V W F G ε hε hVF hWG
    _ ≤ 2 * ε + ε ^ 2 := by
      have hsum := mul_le_mul_of_nonneg_left (add_le_add hF hG) hε
      nlinarith

/-- The same error allowance controls all modes at once. A finite table may
use it once, with any separate integration error added independently. -/
theorem origin_approximation_tsum_error
    (F G V W : Lp ℂ 2 gaussC) (hF1 : ‖F‖ ≤ 1) (hG1 : ‖G‖ ≤ 1)
    (ε : ℝ) (hε : 0 ≤ ε) (hFV : ‖F - V‖ ≤ ε) (hGW : ‖G - W‖ ≤ ε) :
    ∑' n, ‖conj (chargeOneCoeff F n) * chargeOneCoeff G n -
      conj (chargeOneCoeff V n) * chargeOneCoeff W n‖ ≤ 2 * ε + ε ^ 2 := by
  have hs := summable_of_sum_le (fun n => norm_nonneg
    (conj (chargeOneCoeff F n) * chargeOneCoeff G n -
      conj (chargeOneCoeff V n) * chargeOneCoeff W n))
    (fun s => origin_approximation_sum_error s F G V W hF1 hG1 ε hε hFV hGW)
  exact hs.tsum_le_of_sum_le
    (fun s => origin_approximation_sum_error s F G V W hF1 hG1 ε hε hFV hGW)

end

end Grothe.HJM
