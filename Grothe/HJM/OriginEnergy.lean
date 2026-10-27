import Grothe.HJM.OriginLaguerre

/-!
# Endpoint cancellation for the asymmetric origin response

Agent-ID: codex-aa04.

HJM's endpoint phases have a purely imaginary cross product. Removing those
endpoints from both coefficient sequences therefore removes the phase-phase
term *before* taking absolute values. `origin_endpoint_cancellation` is this
algebraic step (HJM (6.6)); it applies to either conjugation convention.

The energy enclosures and the coefficient integration-by-parts identities
for the concrete radial responses remain separate analytic obligations.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.HJM

noncomputable section

/-- Cancellation of the slow phase-phase contribution in the real coefficient.
The reference phase coefficient may be complex: its self-pairing is real.
This statement uses the same conjugation convention as `scalarPairKernel`. -/
theorem origin_endpoint_cancellation (α β r t ξ : ℂ)
    (hα : ‖α‖ ≤ 1) (hβ : ‖β‖ ≤ 1) (hcancel : (conj α * β).re = 0) :
    |(conj (α * ξ + r) * (β * ξ + t)).re| ≤
      ‖ξ‖ * (‖r‖ + ‖t‖) + ‖r‖ * ‖t‖ := by
  have hexpand : conj (α * ξ + r) * (β * ξ + t) =
      (conj α * β) * (conj ξ * ξ) +
        (conj α * conj ξ * t + conj r * β * ξ + conj r * t) := by
    simp only [map_add, map_mul]
    ring
  have hξim : (conj ξ * ξ).im = 0 := by
    simp only [Complex.mul_im, Complex.conj_re, Complex.conj_im]
    ring
  have hzero : ((conj α * β) * (conj ξ * ξ)).re = 0 := by
    rw [Complex.mul_re, hcancel, hξim]
    ring
  rw [hexpand, Complex.add_re, hzero, zero_add]
  calc
    _ ≤ ‖conj α * conj ξ * t + conj r * β * ξ + conj r * t‖ :=
      Complex.abs_re_le_norm _
    _ ≤ (‖conj α * conj ξ * t‖ + ‖conj r * β * ξ‖) + ‖conj r * t‖ :=
      (norm_add_le _ _).trans (add_le_add_right (norm_add_le _ _) _)
    _ = ‖α‖ * ‖ξ‖ * ‖t‖ + ‖r‖ * ‖β‖ * ‖ξ‖ + ‖r‖ * ‖t‖ := by
      simp only [norm_mul, Complex.norm_conj]
    _ ≤ _ := by
      have ha := mul_le_mul_of_nonneg_right hα (mul_nonneg (norm_nonneg ξ) (norm_nonneg t))
      have hb := mul_le_mul_of_nonneg_right hβ (mul_nonneg (norm_nonneg r) (norm_nonneg ξ))
      nlinarith

/-- Finite-table stability under a common `L²` approximation error.
Applied to the spatial truncation at radius squared `36`, Bessel supplies the
two coefficient-difference budgets with `ε = exp (-18)`. This theorem keeps
that analytic error separate from numerical integration or interval errors. -/
theorem origin_coefficients_perturbation {ι : Type*} (s : Finset ι)
    (a b at bt : ι → ℂ) (ε : ℝ) (hε : 0 ≤ ε)
    (ha : ∑ n ∈ s, ‖a n - at n‖ ^ 2 ≤ ε ^ 2)
    (hb : ∑ n ∈ s, ‖b n - bt n‖ ^ 2 ≤ ε ^ 2) :
    ∑ n ∈ s, ‖conj (a n) * b n - conj (at n) * bt n‖ ≤
      ε * (√(∑ n ∈ s, ‖at n‖ ^ 2) + √(∑ n ∈ s, ‖bt n‖ ^ 2)) + ε ^ 2 := by
  have hpoint (n : ι) : ‖conj (a n) * b n - conj (at n) * bt n‖ ≤
      ‖at n‖ * ‖b n - bt n‖ + ‖a n - at n‖ * ‖bt n‖ +
        ‖a n - at n‖ * ‖b n - bt n‖ := by
    have heq : conj (a n) * b n - conj (at n) * bt n =
        conj (at n) * (b n - bt n) + conj (a n - at n) * bt n +
          conj (a n - at n) * (b n - bt n) := by
      simp only [map_sub]
      ring
    rw [heq]
    calc
      _ ≤ (‖conj (at n) * (b n - bt n)‖ + ‖conj (a n - at n) * bt n‖) +
          ‖conj (a n - at n) * (b n - bt n)‖ :=
        (norm_add_le _ _).trans (add_le_add_right (norm_add_le _ _) _)
      _ = _ := by simp only [norm_mul, Complex.norm_conj]
  have hsa : √(∑ n ∈ s, ‖a n - at n‖ ^ 2) ≤ ε := by
    simpa [Real.sqrt_sq hε] using Real.sqrt_le_sqrt ha
  have hsb : √(∑ n ∈ s, ‖b n - bt n‖ ^ 2) ≤ ε := by
    simpa [Real.sqrt_sq hε] using Real.sqrt_le_sqrt hb
  calc
    _ ≤ ∑ n ∈ s, (‖at n‖ * ‖b n - bt n‖ + ‖a n - at n‖ * ‖bt n‖ +
          ‖a n - at n‖ * ‖b n - bt n‖) := Finset.sum_le_sum fun n _ => hpoint n
    _ = (∑ n ∈ s, ‖at n‖ * ‖b n - bt n‖) +
        (∑ n ∈ s, ‖a n - at n‖ * ‖bt n‖) +
        ∑ n ∈ s, ‖a n - at n‖ * ‖b n - bt n‖ := by simp only [Finset.sum_add_distrib]
    _ ≤ √(∑ n ∈ s, ‖at n‖ ^ 2) * √(∑ n ∈ s, ‖b n - bt n‖ ^ 2) +
        √(∑ n ∈ s, ‖a n - at n‖ ^ 2) * √(∑ n ∈ s, ‖bt n‖ ^ 2) +
        √(∑ n ∈ s, ‖a n - at n‖ ^ 2) * √(∑ n ∈ s, ‖b n - bt n‖ ^ 2) :=
      add_le_add (add_le_add (Real.sum_mul_le_sqrt_mul_sqrt s _ _)
        (Real.sum_mul_le_sqrt_mul_sqrt s _ _)) (Real.sum_mul_le_sqrt_mul_sqrt s _ _)
    _ ≤ √(∑ n ∈ s, ‖at n‖ ^ 2) * ε + ε * √(∑ n ∈ s, ‖bt n‖ ^ 2) + ε * ε :=
      add_le_add (add_le_add
        (mul_le_mul_of_nonneg_left hsb (Real.sqrt_nonneg _))
        (mul_le_mul_of_nonneg_right hsa (Real.sqrt_nonneg _)))
        (mul_le_mul hsa hsb (Real.sqrt_nonneg _) hε)
    _ = _ := by ring

/-- Spatial `L²` approximation gives the finite coefficient perturbation budget
without separately assuming any coefficient accuracy. -/
theorem origin_response_coefficients_perturbation (s : Finset ℕ)
    (F G Ft Gt : Lp ℂ 2 gaussC) (ε : ℝ) (hε : 0 ≤ ε)
    (hF : ‖F - Ft‖ ≤ ε) (hG : ‖G - Gt‖ ≤ ε) :
    ∑ n ∈ s, ‖conj (chargeOneCoeff F n) * chargeOneCoeff G n -
      conj (chargeOneCoeff Ft n) * chargeOneCoeff Gt n‖ ≤
        ε * (√(∑ n ∈ s, ‖chargeOneCoeff Ft n‖ ^ 2) +
          √(∑ n ∈ s, ‖chargeOneCoeff Gt n‖ ^ 2)) + ε ^ 2 := by
  apply origin_coefficients_perturbation s _ _ _ _ ε hε
  · have h := chargeOneCoeff_sum_sq_le (F - Ft) s
    simp only [chargeOneCoeff_sub] at h
    exact h.trans ((sq_le_sq₀ (norm_nonneg _) hε).2 hF)
  · have h := chargeOneCoeff_sum_sq_le (G - Gt) s
    simp only [chargeOneCoeff_sub] at h
    exact h.trans ((sq_le_sq₀ (norm_nonneg _) hε).2 hG)

end

end Grothe.HJM
