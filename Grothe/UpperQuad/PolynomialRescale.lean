import Grothe.UpperChaos.ComplexHermite
import Mathlib.Algebra.MvPolynomial.Degrees

/-!
# Rescaling the two variables of a complex polynomial

The coefficient form of `P(scale⁻¹ X₀, scale⁻¹ X₁)` retains the original monomial support and hence
cannot increase total degree. Evaluation at a scaled pair recovers the original polynomial.
For a real scale, the substitution also commutes with the real-plane evaluation `(z, conjugate z)`.

Agent-ID: codex-1a87. Refs #339.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.PolynomialRescale

open MvPolynomial Grothe.UpperChaos
open scoped ComplexConjugate

noncomputable section

/-- Substitute `scale⁻¹ Xᵢ` for both variables, written coefficientwise. -/
def rescale (scale : ℝ) (P : CPoly) : CPoly :=
  ∑ s ∈ P.support, monomial s (P.coeff s * (scale : ℂ)⁻¹ ^ (s 0 + s 1))

/-- Scalar substitution cannot increase total degree. -/
theorem totalDegree_rescale_le (scale : ℝ) (P : CPoly) :
    (rescale scale P).totalDegree ≤ P.totalDegree := by
  unfold rescale
  apply totalDegree_finsetSum_le
  intro s hs
  exact (totalDegree_monomial_le _ _).trans (le_totalDegree hs)

/-- Evaluation after rescaling is evaluation at the inversely scaled variables. -/
theorem eval_rescale (scale : ℝ) (P : CPoly) (v : Fin 2 → ℂ) :
    eval v (rescale scale P) = eval (fun i ↦ (scale : ℂ)⁻¹ * v i) P := by
  classical
  have hprod (s : Fin 2 →₀ ℕ) (w : Fin 2 → ℂ) :
      s.prod (fun i e ↦ w i ^ e) = w 0 ^ s 0 * w 1 ^ s 1 := by
    simp [Finsupp.prod_fintype, Fin.prod_univ_two]
  calc
    eval v (rescale scale P) = ∑ s ∈ P.support,
        (P.coeff s * (scale : ℂ)⁻¹ ^ (s 0 + s 1)) * (v 0 ^ s 0 * v 1 ^ s 1) := by
      simp only [rescale, eval_sum, eval_monomial, hprod]
    _ = eval (fun i ↦ (scale : ℂ)⁻¹ * v i) P := by
      conv_rhs => rw [P.as_sum]
      simp only [eval_sum, eval_monomial, hprod]
      apply Finset.sum_congr rfl
      intro s _
      simp only [mul_pow, pow_add]
      ring

/-- Evaluation at the scaled variables cancels a nonzero real rescaling. -/
theorem eval_rescale_scaled (scale : ℝ) (hscale : scale ≠ 0) (P : CPoly)
    (v : Fin 2 → ℂ) :
    eval (fun i ↦ (scale : ℂ) * v i) (rescale scale P) = eval v P := by
  have hs : (scale : ℂ) ≠ 0 := by exact_mod_cast hscale
  have hv : (fun i ↦ (scale : ℂ)⁻¹ * ((scale : ℂ) * v i)) = v := by
    funext i
    rw [← mul_assoc, inv_mul_cancel₀ hs, one_mul]
  rw [eval_rescale, hv]

/-- The cancellation identity for two explicitly supplied complex arguments. -/
theorem eval_rescale_scaled_pair (scale : ℝ) (hscale : scale ≠ 0) (P : CPoly)
    (z₁ z₂ : ℂ) :
    eval ![(scale : ℂ) * z₁, (scale : ℂ) * z₂] (rescale scale P) =
      eval ![z₁, z₂] P := by
  have hv : (fun i : Fin 2 ↦ (scale : ℂ) * ![z₁, z₂] i) =
      ![(scale : ℂ) * z₁, (scale : ℂ) * z₂] := by
    funext i
    fin_cases i <;> rfl
  simpa only [hv] using eval_rescale_scaled scale hscale P ![z₁, z₂]

/-- Real scaling commutes with the conjugate-pair evaluation on the Gaussian plane. -/
theorem ev_rescale (scale : ℝ) (P : CPoly) (z : ℂ) :
    ev z (rescale scale P) = ev ((scale : ℂ)⁻¹ * z) P := by
  have hv : (fun i ↦ (scale : ℂ)⁻¹ * zv z i) = zv ((scale : ℂ)⁻¹ * z) := by
    funext i
    fin_cases i <;> simp [zv]
  unfold ev
  rw [eval_rescale, hv]

/-- Evaluating a rescaled polynomial at a scaled Gaussian-plane point recovers its value. -/
theorem ev_rescale_scaled (scale : ℝ) (hscale : scale ≠ 0) (P : CPoly) (z : ℂ) :
    ev ((scale : ℂ) * z) (rescale scale P) = ev z P := by
  have hs : (scale : ℂ) ≠ 0 := by exact_mod_cast hscale
  rw [ev_rescale, ← mul_assoc, inv_mul_cancel₀ hs, one_mul]

end

end Grothe.UpperQuad.PolynomialRescale
