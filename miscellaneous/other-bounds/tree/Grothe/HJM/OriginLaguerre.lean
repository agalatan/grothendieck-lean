import Grothe.UpperChaos.Charge
import Grothe.UpperChaos.Mehler

/-!
# The charge-one spectral slice for the HJM origin branch

Agent-ID: codex-aa04.

The scalar origin response has charge one. Its only nonzero complex Hermite
coefficients therefore have bidegree `(n+1,n)`. This file reuses the existing
Gaussian Hilbert basis to supply Bessel bounds and Parseval on that slice,
and proves the polynomial number-operator eigenvalue `2*n+1`.

These are the spectral ingredients of HJM (arXiv:2609.25462), §4.2 and (6.8).
The explicit radial Laguerre formula and the integration-by-parts identity
for the endpoint-subtracted response are separate analytic obligations. In particular,
the results here do not assert any numerical enclosure for the origin table.

The normalized Hermite mode equals `(-1)^n` times the normalized Laguerre
mode in the paper. The pinned upstream coefficient generator uses this same
sign convention. Cross products and energies are unchanged, but endpoint
subtraction must retain the sign of the reference phase coefficient.
-/

open MeasureTheory ProbabilityTheory MvPolynomial Grothe.LowerAnalytic
open Grothe.UpperChaos
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.HJM

noncomputable section

/-- The charge-one slice of the normalized complex Hermite basis. -/
def chargeOneMode (n : ℕ) : Lp ℂ 2 gaussC := hvec (n + 1, n)

/-- Hermite coefficients with Mathlib's conjugate-linear first argument.
The real symmetrized kernel coefficient is `re (conj (a n) * b n)`. -/
def chargeOneCoeff (F : Lp ℂ 2 gaussC) (n : ℕ) : ℂ := ⟪chargeOneMode n, F⟫_ℂ

@[simp] theorem chargeOneCoeff_sub (F G : Lp ℂ 2 gaussC) (n : ℕ) :
    chargeOneCoeff (F - G) n = chargeOneCoeff F n - chargeOneCoeff G n := by
  simp only [chargeOneCoeff, inner_sub_right]

theorem orthonormal_chargeOneMode : Orthonormal ℂ chargeOneMode := by
  exact orthonormal_hvec.comp (fun n => (n + 1, n)) (fun a b h => congrArg Prod.snd h)

/-- Every actual Gaussian `L²` response has square-summable charge-one coefficients. -/
theorem chargeOneCoeff_summable_sq (F : Lp ℂ 2 gaussC) :
    Summable fun n => ‖chargeOneCoeff F n‖ ^ 2 :=
  orthonormal_chargeOneMode.inner_products_summable F

/-- The finite Bessel budget does not assume charge equivariance. -/
theorem chargeOneCoeff_sum_sq_le (F : Lp ℂ 2 gaussC) (s : Finset ℕ) :
    ∑ n ∈ s, ‖chargeOneCoeff F n‖ ^ 2 ≤ ‖F‖ ^ 2 :=
  orthonormal_chargeOneMode.sum_inner_products_le F

/-- The complete Bessel budget does not assume charge equivariance. -/
theorem chargeOneCoeff_tsum_sq_le (F : Lp ℂ 2 gaussC) :
    ∑' n, ‖chargeOneCoeff F n‖ ^ 2 ≤ ‖F‖ ^ 2 :=
  orthonormal_chargeOneMode.tsum_inner_products_le F

/-- Charge-one responses have no coefficients outside the indicated slice. -/
theorem hermiteCoeff_eq_zero_of_charge_one {F : ℂ → ℂ} (hF : MemLp F 2 gaussC)
    (hcharge : ∀ c z, ‖c‖ = 1 → F (c * z) = c * F z)
    {p q : ℕ} (hpq : p ≠ q + 1) :
    ⟪hvec (p, q), hF.toLp F⟫_ℂ = 0 := by
  rw [inner_hvec_left]
  have heq : (∫ z, conj (ev z (H p q)) * (hF.toLp F) z ∂gaussC) =
      ∫ z, conj (ev z (H p q)) * F z ∂gaussC := by
    apply integral_congr_ae
    filter_upwards [hF.coeFn_toLp] with z hz
    rw [hz]
  rw [heq, integral_H_charge_one hcharge hpq, mul_zero]

/-- Parseval for an actual charge-one response, rather than an assumed coefficient table. -/
theorem chargeOneCoeff_hasSum_sq {F : ℂ → ℂ} (hF : MemLp F 2 gaussC)
    (hcharge : ∀ c z, ‖c‖ = 1 → F (c * z) = c * F z) :
    HasSum (fun n => ‖chargeOneCoeff (hF.toLp F) n‖ ^ 2) (‖hF.toLp F‖ ^ 2) := by
  have hi : Function.Injective (fun n : ℕ => (n + 1, n)) := fun a b h => congrArg Prod.snd h
  apply (hi.hasSum_iff ?_).2 (hasSum_energy (hF.toLp F))
  rintro ⟨p, q⟩ hpq
  have hne : p ≠ q + 1 := by
    intro h
    exact hpq ⟨q, by simp [h]⟩
  simp [hermiteCoeff_eq_zero_of_charge_one hF hcharge hne]

/-- The absolute coefficient budget of a pair follows from Bessel and Cauchy–Schwarz. -/
theorem chargeOneCoeff_sum_norm_mul_le (F G : Lp ℂ 2 gaussC) (s : Finset ℕ) :
    ∑ n ∈ s, ‖chargeOneCoeff F n‖ * ‖chargeOneCoeff G n‖ ≤ ‖F‖ * ‖G‖ := by
  calc
    _ ≤ √(∑ n ∈ s, ‖chargeOneCoeff F n‖ ^ 2) *
        √(∑ n ∈ s, ‖chargeOneCoeff G n‖ ^ 2) :=
      Real.sum_mul_le_sqrt_mul_sqrt s _ _
    _ ≤ √(‖F‖ ^ 2) * √(‖G‖ ^ 2) :=
      mul_le_mul (Real.sqrt_le_sqrt (chargeOneCoeff_sum_sq_le F s))
        (Real.sqrt_le_sqrt (chargeOneCoeff_sum_sq_le G s))
        (Real.sqrt_nonneg _) (Real.sqrt_nonneg _)
    _ = _ := by rw [Real.sqrt_sq (norm_nonneg _), Real.sqrt_sq (norm_nonneg _)]

/-- Absolute summability of the asymmetric scalar coefficient products. -/
theorem chargeOneCoeff_summable_norm_mul (F G : Lp ℂ 2 gaussC) :
    Summable fun n => ‖chargeOneCoeff F n‖ * ‖chargeOneCoeff G n‖ :=
  summable_of_sum_le (fun _n => mul_nonneg (norm_nonneg _) (norm_nonneg _))
    (chargeOneCoeff_sum_norm_mul_le F G)

theorem chargeOneCoeff_tsum_norm_mul_le (F G : Lp ℂ 2 gaussC) :
    ∑' n, ‖chargeOneCoeff F n‖ * ‖chargeOneCoeff G n‖ ≤ ‖F‖ * ‖G‖ :=
  (chargeOneCoeff_summable_norm_mul F G).tsum_le_of_sum_le
    (chargeOneCoeff_sum_norm_mul_le F G)

/-- A modewise integration-by-parts identity suffices for the weighted energy
budget. No claim about an unbounded operator domain is needed: `Q` is the
actual square-integrable differential expression and `hQ` is the coefficient
identity to prove by scalar integration by parts. For the origin response,
the weight is `w n = 2*n+1`. -/
theorem chargeOneCoeff_weighted_energy (R Q : Lp ℂ 2 gaussC) (w : ℕ → ℝ)
    (hQ : ∀ n, chargeOneCoeff Q n = (w n : ℂ) * chargeOneCoeff R n) :
    (Summable fun n => w n ^ 2 * ‖chargeOneCoeff R n‖ ^ 2) ∧
      (∑' n, w n ^ 2 * ‖chargeOneCoeff R n‖ ^ 2) ≤ ‖Q‖ ^ 2 := by
  have heq : (fun n => w n ^ 2 * ‖chargeOneCoeff R n‖ ^ 2) =
      (fun n => ‖chargeOneCoeff Q n‖ ^ 2) := by
    funext n
    rw [hQ n]
    simp only [norm_mul, Complex.norm_real, Real.norm_eq_abs, mul_pow, sq_abs]
  simp only [heq]
  exact ⟨chargeOneCoeff_summable_sq Q, chargeOneCoeff_tsum_sq_le Q⟩

/-- The polynomial number operator, in creation/annihilation form. -/
def originNumberOperator (P : CPoly) : CPoly :=
  A0 (pderiv 0 P) + A1 (pderiv 1 P)

/-- Every Hermite bidegree is an eigenspace of the polynomial number operator. -/
theorem originNumberOperator_H (p q : ℕ) :
    originNumberOperator (H p q) = (p + q) • H p q := by
  have hp : A0 (pderiv 0 (H p q)) = p • H p q := by
    cases p with
    | zero => simp [pderiv0_H_zero, A0]
    | succ p => rw [pderiv0_H_succ, A0_smul, ← H_succ_left]
  have hq : A1 (pderiv 1 (H p q)) = q • H p q := by
    cases q with
    | zero => simp [pderiv1_H_zero, A1]
    | succ q => rw [pderiv1_H_succ, A1_smul, A1_H]
  rw [originNumberOperator, hp, hq, add_smul]

/-- The energy weight of the charge-one mode is exactly the original chaos degree. -/
theorem originNumberOperator_charge_one (n : ℕ) :
    originNumberOperator (H (n + 1) n) = (2 * n + 1) • H (n + 1) n := by
  simpa [show n + 1 + n = 2 * n + 1 by omega] using originNumberOperator_H (n + 1) n

end

end Grothe.HJM
