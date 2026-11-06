import Grothe.UpperChaos.HermiteTranslation
import Grothe.UpperChaos.HermiteDegree
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Eval.Degree
import Mathlib.Algebra.Polynomial.BigOperators

/-!
# Exact common translation of the two Hermite variables

The univariate path `P(X₀ + T, X₁ + T)` has derivative equal to the same path applied to
`derivativeX P`. Its coefficients are therefore the iterated real-coordinate derivatives
divided by their factorials. The path degree is at most the total degree of `P`, giving
an exact finite Taylor formula for simultaneous substitution of a complex shift in both
formal variables. Combining this identity with the Gaussian derivative estimate gives
the exponential norm bound for the actual substitution operator.

Agent-ID: codex-2f3d. Refs #334.
-/

namespace Grothe.UpperChaos.HermiteTranslation

open Finset MvPolynomial
open scoped ComplexConjugate

noncomputable section

/-- Complex continuation of translation in the real coordinate shifts both variables equally. -/
def simultaneousShift (δ : ℂ) : CPoly →ₐ[ℂ] CPoly :=
  MvPolynomial.aeval fun i ↦ MvPolynomial.X i + MvPolynomial.C δ

/-- The polynomial path obtained by adding the same new variable to both original variables. -/
def shiftPath : CPoly →+* Polynomial CPoly :=
  MvPolynomial.eval₂Hom (Polynomial.C.comp MvPolynomial.C)
    (fun i ↦ Polynomial.C (MvPolynomial.X i) + Polynomial.X)

@[simp]
theorem simultaneousShift_C (δ a : ℂ) :
    simultaneousShift δ (MvPolynomial.C a) = MvPolynomial.C a := by
  simp [simultaneousShift]

@[simp]
theorem simultaneousShift_X (δ : ℂ) (i : Fin 2) :
    simultaneousShift δ (MvPolynomial.X i) = MvPolynomial.X i + MvPolynomial.C δ := by
  simp [simultaneousShift]

@[simp]
theorem shiftPath_C (a : ℂ) :
    shiftPath (MvPolynomial.C a) = Polynomial.C (MvPolynomial.C a) := by
  simp [shiftPath]

@[simp]
theorem shiftPath_X (i : Fin 2) :
    shiftPath (MvPolynomial.X i) = Polynomial.C (MvPolynomial.X i) + Polynomial.X := by
  simp [shiftPath]

@[simp]
theorem simultaneousShift_zero (P : CPoly) : simultaneousShift 0 P = P := by
  simp [simultaneousShift]

/-- Evaluating the path at a constant gives the simultaneous formal substitution. -/
theorem shiftPath_eval (δ : ℂ) (P : CPoly) :
    (shiftPath P).eval (MvPolynomial.C δ) = simultaneousShift δ P := by
  induction P using MvPolynomial.induction_on with
  | C a => simp
  | add P Q hP hQ => simp [hP, hQ]
  | mul_X P i hP => simp [hP]

@[simp]
theorem shiftPath_eval_zero (P : CPoly) : (shiftPath P).eval 0 = P := by
  simpa using shiftPath_eval 0 P

@[simp]
theorem derivativeX_C (a : ℂ) : derivativeX (MvPolynomial.C a) = 0 := by
  simp [derivativeX]

@[simp]
theorem derivativeX_X (i : Fin 2) : derivativeX (MvPolynomial.X i) = 1 := by
  fin_cases i <;> simp [derivativeX, MvPolynomial.pderiv_X]

theorem derivativeX_add (P Q : CPoly) :
    derivativeX (P + Q) = derivativeX P + derivativeX Q := by
  simp only [derivativeX, map_add]
  ring

theorem derivativeX_mul (P Q : CPoly) :
    derivativeX (P * Q) = derivativeX P * Q + P * derivativeX Q := by
  simp only [derivativeX, MvPolynomial.pderiv_mul]
  ring

/-- Differentiating the path differentiates both formal coordinates once. -/
theorem shiftPath_derivative (P : CPoly) :
    (shiftPath P).derivative = shiftPath (derivativeX P) := by
  induction P using MvPolynomial.induction_on with
  | C a => simp
  | add P Q hP hQ => simp [derivativeX_add, hP, hQ]
  | mul_X P i hP => simp [derivativeX_mul, Polynomial.derivative_mul, hP]

/-- All iterated path derivatives agree with the iterates of `derivativeX`. -/
theorem shiftPath_iterate_derivative (P : CPoly) (k : ℕ) :
    (Polynomial.derivative^[k]) (shiftPath P) = shiftPath ((derivativeX^[k]) P) := by
  induction k with
  | zero => rfl
  | succ k ih =>
    simp only [Function.iterate_succ_apply', ih, shiftPath_derivative]

/-- The path coefficients are the exact Taylor coefficients, with factorial normalization. -/
theorem shiftPath_coeff (P : CPoly) (k : ℕ) :
    (shiftPath P).coeff k = ((k.factorial : ℂ)⁻¹) • (derivativeX^[k]) P := by
  have hcoeff := Polynomial.coeff_iterate_derivative (k := k) (shiftPath P) 0
  have h : (k.factorial : ℂ) • (shiftPath P).coeff k = (derivativeX^[k]) P := by
    simpa only [shiftPath_iterate_derivative, Polynomial.coeff_zero_eq_eval_zero,
      shiftPath_eval_zero,
      zero_add, Nat.descFactorial_self, Nat.cast_smul_eq_nsmul] using hcoeff.symm
  have hk : (k.factorial : ℂ) ≠ 0 := by exact_mod_cast k.factorial_ne_zero
  calc
    (shiftPath P).coeff k =
        ((k.factorial : ℂ)⁻¹) • ((k.factorial : ℂ) • (shiftPath P).coeff k) := by
      rw [smul_smul, inv_mul_cancel₀ hk, one_smul]
    _ = _ := by rw [h]

private theorem shiftPath_monomial_natDegree_le (m : Fin 2 →₀ ℕ) (a : ℂ) :
    (shiftPath (MvPolynomial.monomial m a)).natDegree ≤ m.sum (fun _ n ↦ n) := by
  simp only [shiftPath, MvPolynomial.eval₂Hom_monomial, RingHom.comp_apply,
    Finsupp.prod_fintype _ _ (fun _ ↦ pow_zero _), Fin.prod_univ_two]
  have hp (i : Fin 2) :
      ((Polynomial.C (MvPolynomial.X i) + Polynomial.X : Polynomial CPoly) ^ m i).natDegree ≤
        m i := by
    calc
      _ ≤ m i * (Polynomial.C (MvPolynomial.X i) + Polynomial.X : Polynomial CPoly).natDegree :=
        Polynomial.natDegree_pow_le
      _ ≤ m i * 1 := Nat.mul_le_mul_left _
        (Polynomial.natDegree_add_le_of_degree_le (by simp) (by simp))
      _ = _ := Nat.mul_one _
  apply (Polynomial.natDegree_C_mul_le _ _).trans
  rw [Finsupp.sum_fintype _ _ (fun _ ↦ rfl), Fin.sum_univ_two]
  exact Polynomial.natDegree_mul_le_of_le (hp 0) (hp 1)

/-- Common translation introduces no path degree beyond the original total degree. -/
theorem shiftPath_natDegree_le (P : CPoly) : (shiftPath P).natDegree ≤ P.totalDegree := by
  conv_lhs => rw [P.as_sum, map_sum]
  apply Polynomial.natDegree_sum_le_of_forall_le
  intro m hm
  exact (shiftPath_monomial_natDegree_le m (P.coeff m)).trans (MvPolynomial.le_totalDegree hm)

/-- The formal common shift is exactly the finite series through any total-degree bound. -/
theorem simultaneousShift_eq_finiteTaylor_of_totalDegree
    (d : ℕ) (δ : ℂ) (P : CPoly) (hP : P.totalDegree ≤ d) :
    simultaneousShift δ P = finiteTaylor d δ P := by
  have hd : (shiftPath P).natDegree < d + 1 :=
    lt_of_le_of_lt ((shiftPath_natDegree_le P).trans hP) (Nat.lt_succ_self d)
  rw [← shiftPath_eval, Polynomial.eval_eq_sum_range' hd, finiteTaylor]
  apply Finset.sum_congr rfl
  intro k _
  rw [shiftPath_coeff]
  simp only [smul_eq_C_mul, div_eq_mul_inv, map_mul, map_pow]
  ring

/-- The finite normalized Hermite polynomial space has the stated total-degree bound. -/
theorem polynomialSpace_le_D (d : ℕ) : polynomialSpace d ≤ Grothe.UpperChaos.D d := by
  apply Submodule.span_le.mpr
  rintro _ ⟨i, hi, rfl⟩
  change (nrm i.1 i.2 : ℂ) • H i.1 i.2 ∈ Grothe.UpperChaos.D d
  exact Submodule.smul_mem _ _ (D_mono ((mem_modes d i).1 hi) (H_mem_D i.1 i.2))

/-- The exact Taylor identity on the production finite Hermite space. -/
theorem simultaneousShift_eq_finiteTaylor (d : ℕ) (δ : ℂ) (P : CPoly)
    (hP : P ∈ polynomialSpace d) :
    simultaneousShift δ P = finiteTaylor d δ P := by
  apply simultaneousShift_eq_finiteTaylor_of_totalDegree d δ P
  have hd := polynomialSpace_le_D d hP
  rwa [MvPolynomial.mem_restrictTotalDegree] at hd

/-- Exact common substitution therefore has the Gaussian exponential norm bound. -/
theorem norm_simultaneousShift_le (d : ℕ) (δ : ℂ) (P : CPoly)
    (hP : P ∈ polynomialSpace d) :
    ‖evalL2 (simultaneousShift δ P)‖ ≤
      Real.exp (‖δ‖ * Real.sqrt (2 * d)) * ‖evalL2 P‖ := by
  rw [simultaneousShift_eq_finiteTaylor d δ P hP]
  exact norm_finiteTaylor_le d δ P hP

end

end Grothe.UpperChaos.HermiteTranslation

open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.HermiteTranslation.simultaneousShift_eq_finiteTaylor,
      ``Grothe.UpperChaos.HermiteTranslation.norm_simultaneousShift_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[`propext, `Classical.choice, `Quot.sound].contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
