import Grothe.UpperChaos.HermiteTranslation
import Grothe.UpperChaos.HermiteTranslationAlgebra
import Mathlib.Algebra.Module.LinearMap.End

/-!
# Coupled coefficient bounds for the translated finite Hermite family

The finite Taylor norm bound controls the synthesis map of the whole family.
Duality therefore bounds all coefficient errors together without a factor for
the number of selected modes. The theorem uses the explicit finite Taylor
polynomial; its identification with simultaneous formal translation is separate.

Agent-ID: codex-2f3d. Refs #334.
-/

namespace Grothe.UpperChaos.HermiteTranslationBessel

open MeasureTheory Finset MvPolynomial Grothe.LowerAnalytic HermiteTranslation
open scoped InnerProductSpace ComplexConjugate

noncomputable section

/-- A bound for finite synthesis controls the corresponding coefficient vector. -/
theorem finite_family_bessel_of_synthesis_bound {ι E : Type*} [DecidableEq ι]
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (S : Finset ι) (v : ι → E) (C : ℝ)
    (hS : ∀ a : ι → ℂ, ‖∑ i ∈ S, a i • v i‖ ^ 2 ≤
      C ^ 2 * (∑ i ∈ S, ‖a i‖ ^ 2)) (f : E) :
    ∑ i ∈ S, ‖⟪v i, f⟫_ℂ‖ ^ 2 ≤ C ^ 2 * ‖f‖ ^ 2 := by
  let e : ℝ := ∑ i ∈ S, ‖⟪v i, f⟫_ℂ‖ ^ 2
  let g : E := ∑ i ∈ S, ⟪v i, f⟫_ℂ • v i
  have he : 0 ≤ e := Finset.sum_nonneg (fun _ _ ↦ sq_nonneg _)
  have hinner : ⟪g, f⟫_ℂ = (e : ℂ) := by
    simp only [g, e, sum_inner, inner_smul_left, Complex.conj_mul', Complex.ofReal_sum,
      Complex.ofReal_pow]
  have hnorm : e ≤ ‖g‖ * ‖f‖ := by
    calc
      e = ‖(e : ℂ)‖ := by rw [Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg he]
      _ = ‖⟪g, f⟫_ℂ‖ := by rw [hinner]
      _ ≤ _ := norm_inner_le_norm _ _
  have hsq := pow_le_pow_left₀ he hnorm 2
  rw [mul_pow] at hsq
  have hsyn : ‖g‖ ^ 2 ≤ C ^ 2 * e := hS (fun i ↦ ⟪v i, f⟫_ℂ)
  have hfinal : e ^ 2 ≤ (C ^ 2 * e) * ‖f‖ ^ 2 :=
    hsq.trans (mul_le_mul_of_nonneg_right hsyn (sq_nonneg _))
  change e ≤ C ^ 2 * ‖f‖ ^ 2
  by_cases hzero : e = 0
  · rw [hzero]
    positivity
  · have hpos : 0 < e := lt_of_le_of_ne he (Ne.symm hzero)
    nlinarith

/-- The formal real-coordinate derivative, packaged as a linear endomorphism. -/
def derivativeLinear : Module.End ℂ CPoly :=
  (pderiv 0 : Derivation ℂ CPoly CPoly).toLinearMap +
    (pderiv 1 : Derivation ℂ CPoly CPoly).toLinearMap

theorem derivativeLinear_apply (P : CPoly) : derivativeLinear P = derivativeX P := rfl

theorem derivativeLinear_pow_apply (k : ℕ) (P : CPoly) :
    (derivativeLinear ^ k) P = (derivativeX^[k]) P := by
  induction k with
  | zero => rfl
  | succ k ih =>
    rw [pow_succ', Module.End.mul_apply, ih, derivativeLinear_apply,
      Function.iterate_succ_apply']

/-- The existing finite Taylor polynomial as a linear map in its polynomial input. -/
def finiteTaylorLinear (D : ℕ) (δ : ℂ) : Module.End ℂ CPoly :=
  ∑ k ∈ range (D + 1), (δ ^ k / (k.factorial : ℂ)) • derivativeLinear ^ k

theorem finiteTaylorLinear_apply (D : ℕ) (δ : ℂ) (P : CPoly) :
    finiteTaylorLinear D δ P = finiteTaylor D δ P := by
  simp only [finiteTaylorLinear, LinearMap.sum_apply, LinearMap.smul_apply,
    derivativeLinear_pow_apply, finiteTaylor]

/-- The actual finite-Taylor Gaussian vector associated with one normalized Hermite mode. -/
def taylorVector (D : ℕ) (δ : ℂ) (i : ℕ × ℕ) : Lp ℂ 2 gaussC :=
  evalL2 (finiteTaylor D δ (normalizedPolynomial i))

theorem synthesis_eq (D : ℕ) (δ : ℂ) (S : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ) :
    (∑ i ∈ S, a i • taylorVector D δ i) =
      evalL2 (finiteTaylor D δ (polynomialCombination S a)) := by
  simp only [taylorVector, ← finiteTaylorLinear_apply, polynomialCombination, map_sum, map_smul]

theorem polynomialCombination_mem_of_support (D : ℕ) (S : Finset (ℕ × ℕ))
    (a : ℕ × ℕ → ℂ) (hD : ∀ i ∈ S, i.1 + i.2 ≤ D) :
    polynomialCombination S a ∈ polynomialSpace D := by
  apply Submodule.sum_mem
  intro i hi
  exact Submodule.smul_mem _ _ (normalizedPolynomial_mem D i (hD i hi))

/-- The finite translated family has the exponential synthesis bound. -/
theorem norm_synthesis_sq_le (D : ℕ) (δ : ℂ) (S : Finset (ℕ × ℕ))
    (hD : ∀ i ∈ S, i.1 + i.2 ≤ D) (a : ℕ × ℕ → ℂ) :
    ‖∑ i ∈ S, a i • taylorVector D δ i‖ ^ 2 ≤
      Real.exp (‖δ‖ * Real.sqrt (2 * D)) ^ 2 * (∑ i ∈ S, ‖a i‖ ^ 2) := by
  rw [synthesis_eq]
  have h := norm_finiteTaylor_le D δ (polynomialCombination S a)
    (polynomialCombination_mem_of_support D S a hD)
  have hs := pow_le_pow_left₀ (norm_nonneg _) h 2
  rw [mul_pow, evalL2_polynomialCombination, norm_combination_sq] at hs
  exact hs

/-- Every selected translated Hermite coefficient is controlled together, independently
of the size of the mode set. -/
theorem sum_inner_taylorVector_sq_le (D : ℕ) (δ : ℂ) (S : Finset (ℕ × ℕ))
    (hD : ∀ i ∈ S, i.1 + i.2 ≤ D) (f : Lp ℂ 2 gaussC) :
    ∑ i ∈ S, ‖⟪taylorVector D δ i, f⟫_ℂ‖ ^ 2 ≤
      Real.exp (‖δ‖ * Real.sqrt (2 * D)) ^ 2 * ‖f‖ ^ 2 :=
  finite_family_bessel_of_synthesis_bound S (taylorVector D δ)
    (Real.exp (‖δ‖ * Real.sqrt (2 * D))) (norm_synthesis_sq_le D δ S hD) f

/-- Simultaneously shifting both formal variables controls the whole Hermite coefficient
vector independently of the size of the selected mode set. -/
theorem sum_inner_simultaneousShift_sq_le (D : ℕ) (δ : ℂ) (S : Finset (ℕ × ℕ))
    (hD : ∀ i ∈ S, i.1 + i.2 ≤ D) (f : Lp ℂ 2 gaussC) :
    ∑ i ∈ S, ‖⟪evalL2 (simultaneousShift δ (normalizedPolynomial i)), f⟫_ℂ‖ ^ 2 ≤
      Real.exp (‖δ‖ * Real.sqrt (2 * D)) ^ 2 * ‖f‖ ^ 2 := by
  calc
    _ = ∑ i ∈ S, ‖⟪taylorVector D δ i, f⟫_ℂ‖ ^ 2 := by
      apply Finset.sum_congr rfl
      intro i hi
      simp only [taylorVector, simultaneousShift_eq_finiteTaylor D δ (normalizedPolynomial i)
        (normalizedPolynomial_mem D i (hD i hi))]
    _ ≤ _ := sum_inner_taylorVector_sq_le D δ S hD f

end

end Grothe.UpperChaos.HermiteTranslationBessel

open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.HermiteTranslationBessel.finite_family_bessel_of_synthesis_bound,
      ``Grothe.UpperChaos.HermiteTranslationBessel.norm_synthesis_sq_le,
      ``Grothe.UpperChaos.HermiteTranslationBessel.sum_inner_taylorVector_sq_le,
      ``Grothe.UpperChaos.HermiteTranslationBessel.sum_inner_simultaneousShift_sq_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[`propext, `Classical.choice, `Quot.sound].contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
