import Grothe.UpperQuad.TwistFactorPolynomial
import Grothe.UpperQuad.PolynomialHermiteCoefficient
import Grothe.UpperQuad.PolynomialRescale
import Mathlib.Algebra.MvPolynomial.Funext

/-!
# Analytic dependence of the finite twisted Hermite coefficients

The actual auxiliary polynomial is the evaluation of a fixed polynomial in the radial
parameter, with coefficients in `CPoly`. Applying any complex linear functional to this
family produces a finite sum of scalar monomials. This proves analytic dependence without
introducing a topology on the space of auxiliary polynomials.

Agent-ID: codex-f3dd. Refs #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistFactorAnalytic

open MvPolynomial Grothe.UpperChaos PolynomialHermite PolynomialRescale

noncomputable section

attribute [local irreducible] Grothe.UpperChaos.phaseTerms

private def halfParameter : Polynomial CPoly :=
  Polynomial.C (C (1 / 2 : ℂ)) * Polynomial.X

private lemma eval_halfParameter (r : ℂ) :
    halfParameter.eval (C r) = C (r / 2) := by
  simp only [halfParameter, Polynomial.eval_mul, Polynomial.eval_C, Polynomial.eval_X,
    ← map_mul]
  congr 1
  ring

/-- One phase monomial, retaining the radial parameter as a formal indeterminate. -/
def parameterTerm (t : (ℕ × ℕ × ℕ) × ℚ) : Polynomial CPoly :=
  Polynomial.C (C (t.2 : ℂ)) * Polynomial.X ^ (2 * t.1.1) *
    Polynomial.C ((X 0 * X 1) ^ t.1.2.1) *
    (halfParameter * Polynomial.C (X 0 + X 1)) ^ t.1.2.2

lemma eval_parameterTerm (t : (ℕ × ℕ × ℕ) × ℚ) (r : ℂ) :
    (parameterTerm t).eval (C r) = TwistFactorPolynomial.phaseTerm r t := by
  simp only [parameterTerm, Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_C,
    Polynomial.eval_X, eval_halfParameter, TwistFactorPolynomial.phaseTerm,
    ← map_pow, ← map_mul]

/-- Build a formal radial polynomial while retaining the source list as an argument. -/
def parameterQFor (ts : List ((ℕ × ℕ × ℕ) × ℚ)) : Polynomial CPoly :=
  halfParameter * Polynomial.C (X 0 - X 1) * (ts.map parameterTerm).sum

/-- The production phase source, as one polynomial with auxiliary-polynomial coefficients. -/
def parameterQ : Polynomial CPoly := parameterQFor phaseTerms

private lemma parameterQ_def : parameterQ = parameterQFor phaseTerms := rfl

private lemma phaseSum_def (r : ℂ) : TwistFactorPolynomial.phaseSum r =
    (phaseTerms.map (TwistFactorPolynomial.phaseTerm r)).sum := rfl

private lemma Q_def (r : ℂ) : TwistFactorPolynomial.Q r =
    C (r / 2) * (X 0 - X 1) * TwistFactorPolynomial.phaseSum r := rfl

private lemma eval_parameterSum (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (r : ℂ) :
    ((ts.map parameterTerm).sum).eval (C r) =
      (ts.map (TwistFactorPolynomial.phaseTerm r)).sum := by
  simp only [Polynomial.eval_listSum, List.map_map, Function.comp_def, eval_parameterTerm]

private lemma eval_parameterQ_list (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (r : ℂ) :
    (parameterQFor ts).eval (C r) =
      C (r / 2) * (X 0 - X 1) * (ts.map (TwistFactorPolynomial.phaseTerm r)).sum := by
  unfold parameterQFor
  rw [Polynomial.eval_mul, Polynomial.eval_mul, Polynomial.eval_C, eval_halfParameter,
    eval_parameterSum]

lemma eval_parameterQ (r : ℂ) : parameterQ.eval (C r) = TwistFactorPolynomial.Q r := by
  calc
    parameterQ.eval (C r) = (parameterQFor phaseTerms).eval (C r) :=
      congrArg (Polynomial.eval (C r)) parameterQ_def
    _ = C (r / 2) * (X 0 - X 1) *
        (phaseTerms.map (TwistFactorPolynomial.phaseTerm r)).sum :=
      eval_parameterQ_list phaseTerms r
    _ = C (r / 2) * (X 0 - X 1) * TwistFactorPolynomial.phaseSum r :=
      congrArg (fun P : CPoly ↦ C (r / 2) * (X 0 - X 1) * P) (phaseSum_def r).symm
    _ = TwistFactorPolynomial.Q r := (Q_def r).symm

/-- A linear functional applied to a formal radial polynomial is a finite scalar polynomial. -/
theorem linear_eval_eq_sum (L : CPoly →ₗ[ℂ] ℂ) (P : Polynomial CPoly) (r : ℂ) :
    L (P.eval (C r)) = ∑ n ∈ P.support, r ^ n * L (P.coeff n) := by
  classical
  rw [Polynomial.eval_eq_sum, Polynomial.sum_def, map_sum]
  apply Finset.sum_congr rfl
  intro n _
  rw [← map_pow, mul_comm, ← smul_eq_C_mul, map_smul]
  rfl

/-- Coefficientwise linear operations preserve entire dependence on the radial parameter. -/
theorem analyticAt_linear_eval (L : CPoly →ₗ[ℂ] ℂ) (P : Polynomial CPoly) (r : ℂ) :
    AnalyticAt ℂ (fun z ↦ L (P.eval (C z))) r := by
  simp_rw [linear_eval_eq_sum]
  apply Finset.analyticAt_fun_sum
  intro n _
  fun_prop

/-- Every linear coefficient of every power of the production source is entire. -/
theorem analyticAt_linear_Q_pow (L : CPoly →ₗ[ℂ] ℂ) (j : ℕ) (r : ℂ) :
    AnalyticAt ℂ (fun z ↦ L (TwistFactorPolynomial.Q z ^ j)) r := by
  simpa only [Polynomial.eval_pow, eval_parameterQ] using
    analyticAt_linear_eval L (parameterQ ^ j) r

/-- The real auxiliary-variable rescaling is complex linear in the polynomial. -/
def rescaleLinear (scale : ℝ) : CPoly →ₗ[ℂ] CPoly where
  toFun := rescale scale
  map_add' P R := by
    apply MvPolynomial.funext
    intro v
    simp only [eval_rescale, map_add]
  map_smul' a P := by
    apply MvPolynomial.funext
    intro v
    simp only [eval_rescale, smul_eval, RingHom.id_apply]

lemma rescaleLinear_apply (scale : ℝ) (P : CPoly) :
    rescaleLinear scale P = rescale scale P := rfl

/-- A fixed multiplier, rescaling and Hermite coefficient form a complex linear functional. -/
def rescaledCoefficient (scale : ℝ) (P : CPoly) (pq : ℕ × ℕ) : CPoly →ₗ[ℂ] ℂ where
  toFun R := hermiteCoeff (rescale scale (P * R)) pq
  map_add' R S := by
    change hermiteCoeff (rescaleLinear scale (P * (R + S))) pq = _
    rw [mul_add, map_add, hermiteCoeff_add]
    rfl
  map_smul' a R := by
    change hermiteCoeff (rescaleLinear scale (P * (a • R))) pq = _
    rw [mul_smul_comm, map_smul, hermiteCoeff_smul]
    rfl

/-- The finite factorization coefficients are entire before the scalar Gaussian prefactor. -/
theorem analyticAt_hermiteCoeff_rescale_mul_Q_pow (scale : ℝ) (P : CPoly) (j : ℕ)
    (pq : ℕ × ℕ) (r : ℂ) :
    AnalyticAt ℂ (fun z ↦ hermiteCoeff (rescale scale (P * TwistFactorPolynomial.Q z ^ j))
      pq) r :=
  analyticAt_linear_Q_pow (rescaledCoefficient scale P pq) j r

/-- A fixed normalization factor preserves entire dependence of the exact coefficient family. -/
theorem analyticAt_hermiteCoeff_smul_rescale_mul_Q_pow (a : ℂ) (scale : ℝ) (P : CPoly)
    (j : ℕ) (pq : ℕ × ℕ) (r : ℂ) :
    AnalyticAt ℂ (fun z ↦ hermiteCoeff
      (a • rescale scale (P * TwistFactorPolynomial.Q z ^ j)) pq) r := by
  simp_rw [hermiteCoeff_smul]
  exact analyticAt_const.mul (analyticAt_hermiteCoeff_rescale_mul_Q_pow scale P j pq r)

end

end Grothe.UpperQuad.TwistFactorAnalytic
