import Grothe.UpperChaos.RationalCovarianceAlgebra

/-!
# Exact quadratic polynomial covariance evaluation

Agent-ID: codex-2ca4. Task #40.
This module uses the unchanged rational moment evaluator. It adds no
Gaussian premise and no numerical enclosure.
-/

set_option warningAsError true

namespace Grothe.UpperChaos.RationalCovariancePolynomial

open MvPolynomial RationalQuadraticMoments RationalCovarianceAlgebra

noncomputable section

theorem polynomialMomentValue_C_mul (A B D c : ℚ)
    (P : MvPolynomial (Fin 4) ℚ) :
    polynomialMomentValue A B D (C c * P) =
      c * polynomialMomentValue A B D P := by
  induction P using MvPolynomial.induction_on' with
  | monomial e a =>
    rw [MvPolynomial.C_mul_monomial, polynomialMomentValue_monomial,
      polynomialMomentValue_monomial, mul_assoc]
  | add P Q hP hQ =>
    rw [mul_add, polynomialMomentValue_add, polynomialMomentValue_add, hP, hQ,
      mul_add]

theorem polynomialMomentValue_C (A B D c : ℚ) :
    polynomialMomentValue A B D (C c) = c * momentValue A B D 0 0 0 0 := by
  change polynomialMomentValue A B D (monomial 0 c) = _
  simpa only [Finsupp.coe_zero, Pi.zero_apply] using
    polynomialMomentValue_monomial A B D (0 : Fin 4 →₀ ℕ) c

theorem polynomialMomentValue_X_mul_X (A B D : ℚ) (i j : Fin 4) :
    polynomialMomentValue A B D (X i * X j) =
      momentValue A B D
        ((Finsupp.single i 1 + Finsupp.single j 1 : Fin 4 →₀ ℕ) 0)
        ((Finsupp.single i 1 + Finsupp.single j 1 : Fin 4 →₀ ℕ) 1)
        ((Finsupp.single i 1 + Finsupp.single j 1 : Fin 4 →₀ ℕ) 2)
        ((Finsupp.single i 1 + Finsupp.single j 1 : Fin 4 →₀ ℕ) 3) := by
  rw [MvPolynomial.X, MvPolynomial.X, monomial_mul_monomial,
    polynomialMomentValue_monomial]
  simp only [mul_one, one_mul]

/-- The conditional constant is retained, and the determinant mass occurs once.
The positive variables are X0,X2 and their conjugates are X1,X3. -/
theorem polynomialMomentValue_quadratic (A B D k u v x y : ℚ)
    (hA : A ≠ 0) (hdet : A * D - B ^ 2 ≠ 0) :
    polynomialMomentValue A B D
        (C k + (C u * X 0 + C v * X 2) * (C x * X 1 + C y * X 3)) =
      k / (A * D - B ^ 2) +
        (u * x * D - u * y * B - v * x * B + v * y * A) /
          (A * D - B ^ 2) ^ 2 := by
  have hp : (C k + (C u * X 0 + C v * X 2) *
      (C x * X 1 + C y * X 3) : MvPolynomial (Fin 4) ℚ) =
      C k + (C (u * x) * (X 0 * X 1) + C (u * y) * (X 0 * X 3) +
        C (v * x) * (X 2 * X 1) + C (v * y) * (X 2 * X 3)) := by
    simp only [map_mul]
    ring
  rw [hp]
  simp only [polynomialMomentValue_add, polynomialMomentValue_C,
    polynomialMomentValue_C_mul, polynomialMomentValue_X_mul_X]
  norm_num only [Finsupp.add_apply, Finsupp.single_apply, ite_true, ite_false,
    Fin.reduceEq, Nat.reduceAdd]
  rw [moment_zero A B D hA hdet, moment_first_variance A B D hA hdet,
    moment_cross A B D hA hdet, moment_cross_reverse A B D hA hdet,
    moment_second_variance A B D hA hdet]
  ring

open Lean Elab Command
run_cmd do
  for target in #[``polynomialMomentValue_C_mul, ``polynomialMomentValue_C,
      ``polynomialMomentValue_X_mul_X, ``polynomialMomentValue_quadratic] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"

end
end Grothe.UpperChaos.RationalCovariancePolynomial
