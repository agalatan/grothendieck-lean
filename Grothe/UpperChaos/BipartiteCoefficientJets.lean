import Grothe.UpperChaos.HolomorphicCoefficientJets

/-!
# Finite jets of the actual bipartite source kernel

Agent-ID: codex-2ca4.

The source order is ((y,u),(x,v)). The finite mixed jet takes u first,
then y, then v, then x. The first two derivatives leave a holomorphic
polynomial in x,v. Its finite Gaussian coefficient pairing is exactly its
remaining two derivatives. Source-space Fubini uses only the existing
Schur hypotheses; there is no exchange with physical variables.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.BipartiteCoefficientJets

open ActualSourceCoefficientExtraction BipartitePolynomialL2
open GaussianFockBessel HolomorphicCoefficientJets

noncomputable section

/-- Inner derivatives in the first source pair, at its origin. -/
def innerJet (n : ℕ × ℕ) (F : PairSources → ℂ) (w : ℂ × ℂ) : ℂ :=
  iteratedDeriv n.1 (fun y =>
    iteratedDeriv n.2 (fun u => F ((y, u), w)) 0) 0

/-- Outer derivatives in the remaining source pair, at its origin. -/
def outerJet (n : ℕ × ℕ) (F : ℂ × ℂ → ℂ) : ℂ :=
  iteratedDeriv n.1 (fun x =>
    iteratedDeriv n.2 (fun v => F (x, v)) 0) 0

/-- Finite mixed jet in the exact gate source order ((y,u),(x,v)). -/
def pairJet (n : PairPowers) (F : PairSources → ℂ) : ℂ :=
  outerJet n.2 (innerJet n.1 F)

/-- A two-variable polynomial evaluated at independent complex sources. -/
def holEval (P : MvPolynomial (Fin 2) ℂ) (w : ℂ × ℂ) : ℂ :=
  MvPolynomial.eval ![w.1, w.2] P

/-- The actual holomorphic residual after the y,u derivatives. -/
def residualHolomorphicPolynomial (p q r s : ℝ) (n e : PairPowers) :
    MvPolynomial (Fin 2) ℂ :=
  C (n.1.1.descFactorial e.1.1 : ℂ) * C (n.1.2.descFactorial e.1.2 : ℂ) *
    X 0 ^ e.2.1 * X 1 ^ e.2.2 *
      (C (p : ℂ) * X 0 + C (q : ℂ) * X 1) ^ (n.1.1 - e.1.1) *
        (C (r : ℂ) * X 0 + C (s : ℂ) * X 1) ^ (n.1.2 - e.1.2)

theorem holEval_residual (p q r s : ℝ) (n e : PairPowers) (w : ℂ × ℂ) :
    holEval (residualHolomorphicPolynomial p q r s n e) w =
      (w.1 ^ e.2.1 * w.2 ^ e.2.2) *
        ((n.1.1.descFactorial e.1.1 : ℂ) *
          (image p q r s w).1 ^ (n.1.1 - e.1.1)) *
        ((n.1.2.descFactorial e.1.2 : ℂ) *
          (image p q r s w).2 ^ (n.1.2 - e.1.2)) := by
  simp [holEval, residualHolomorphicPolynomial, image]
  ring

/-- Exact pointwise inner jet. No Schur hypothesis is needed for this finite
derivative identity. Impossible degrees vanish through falling factorials. -/
theorem innerJet_monomial_kernel (c : ℂ) (p q r s : ℝ)
    (n e : PairPowers) (w : ℂ × ℂ) :
    innerJet n.1 (fun zw =>
      BipartitePolynomialL2.monomial e zw * kernel c p q r s zw) w =
      c * holEval (residualHolomorphicPolynomial p q r s n e) w := by
  have hp (y u : ℂ) :
      BipartitePolynomialL2.monomial e ((y, u), w) *
        kernel c p q r s ((y, u), w) =
      (c * (w.1 ^ e.2.1 * w.2 ^ e.2.2)) *
        (y ^ e.1.1 * Complex.exp ((image p q r s w).1 * y)) *
        (u ^ e.1.2 * Complex.exp ((image p q r s w).2 * u)) := by
    simp only [BipartitePolynomialL2.monomial, kernel, coupling, Complex.exp_add]
    ring
  unfold innerJet
  simp_rw [hp]
  simp only [iteratedDeriv_const_mul_field, iteratedDeriv_mul_const_field,
    iteratedDeriv_monomial_cexp_zero]
  rw [holEval_residual]
  ring

/-- The existing physical polynomial is the holomorphic residual times the
two outer conjugate powers; no source permutation or factorial is omitted. -/
theorem ev4_residual_eq (p q r s : ℝ) (n e : PairPowers) (w : ℂ × ℂ) :
    ev4 w (residualPolynomial p q r s n e) =
      holEval (residualHolomorphicPolynomial p q r s n e) w *
        conj w.1 ^ n.2.1 * conj w.2 ^ n.2.2 := by
  rw [holEval_residual]
  simp [ev4, residualPolynomial, wv, image]
  ring

/-- The inner Gaussian extraction is exactly the normalized inner finite jet,
with the two not-yet-extracted conjugate source powers retained. -/
theorem integral_inner_source_pair_eq_jet (c : ℂ) (p q r s : ℝ)
    (n e : PairPowers) (w : ℂ × ℂ) :
    (∫ z : ℂ × ℂ, conj (monomial4 n (z, w)) *
      (BipartitePolynomialL2.monomial e (z, w) * kernel c p q r s (z, w)) ∂mu2) =
      (normalization4 n : ℂ) *
        innerJet n.1 (fun zw =>
          BipartitePolynomialL2.monomial e zw * kernel c p q r s zw) w *
        conj w.1 ^ n.2.1 * conj w.2 ^ n.2.2 := by
  rw [integral_inner_source_pair, innerJet_monomial_kernel, ev4_residual_eq]
  ring

private theorem holEval_monomial (d : Fin 2 →₀ ℕ) (a : ℂ) (w : ℂ × ℂ) :
    holEval (MvPolynomial.monomial d a) w = a * w.1 ^ d 0 * w.2 ^ d 1 := by
  simp [holEval, MvPolynomial.eval_monomial, Finsupp.prod_fintype,
    Fin.prod_univ_two, mul_assoc]

theorem holEval_eq_support (P : MvPolynomial (Fin 2) ℂ) (w : ℂ × ℂ) :
    holEval P w = ∑ d ∈ P.support, P.coeff d * w.1 ^ d 0 * w.2 ^ d 1 := by
  classical
  have h := congrArg (MvPolynomial.eval ![w.1, w.2]) P.as_sum
  simp only [map_sum] at h
  change holEval P w =
    ∑ d ∈ P.support, holEval (MvPolynomial.monomial d (P.coeff d)) w at h
  simpa only [holEval_monomial] using h

private theorem integrable_pow_conj (p q : ℕ) :
    Integrable (fun z : ℂ => z ^ p * conj z ^ q) gaussC := by
  simpa only [zero_mul, Complex.exp_zero, mul_one] using
    integrable_holomorphic_mixed 0 p q

private theorem integral_pow_conj_eq_jet (p q : ℕ) :
    (∫ z : ℂ, z ^ p * conj z ^ q ∂gaussC) =
      iteratedDeriv q (fun z : ℂ => z ^ p) 0 := by
  simpa only [zero_mul, Complex.exp_zero, mul_one] using
    integral_holomorphic_mixed_eq_jet 0 p q

theorem outerJet_holEval (P : MvPolynomial (Fin 2) ℂ) (n : ℕ × ℕ) :
    outerJet n (holEval P) =
      ∑ d ∈ P.support, P.coeff d *
        iteratedDeriv n.1 (fun z : ℂ => z ^ d 0) 0 *
        iteratedDeriv n.2 (fun z : ℂ => z ^ d 1) 0 := by
  classical
  have hi (x : ℂ) :
      iteratedDeriv n.2 (fun v : ℂ =>
        ∑ d ∈ P.support, P.coeff d * x ^ d 0 * v ^ d 1) 0 =
        ∑ d ∈ P.support, P.coeff d * x ^ d 0 *
          iteratedDeriv n.2 (fun z : ℂ => z ^ d 1) 0 := by
    rw [iteratedDeriv_fun_sum (fun d hd => by fun_prop)]
    apply Finset.sum_congr rfl
    intro d hd
    exact iteratedDeriv_const_mul_field _ _
  unfold outerJet
  simp_rw [holEval_eq_support, hi]
  rw [iteratedDeriv_fun_sum (fun d hd => by fun_prop)]
  simp only [iteratedDeriv_mul_const_field, iteratedDeriv_const_mul_field]

/-- Gaussian extraction of a finite holomorphic two-variable polynomial is
its finite mixed jet, established term by term without infinite expansions. -/
theorem integral_holEval_eq_outerJet (P : MvPolynomial (Fin 2) ℂ) (n : ℕ × ℕ) :
    (∫ w : ℂ × ℂ, holEval P w * conj w.1 ^ n.1 * conj w.2 ^ n.2 ∂mu2) =
      outerJet n (holEval P) := by
  classical
  have hp (w : ℂ × ℂ) :
      holEval P w * conj w.1 ^ n.1 * conj w.2 ^ n.2 =
        ∑ d ∈ P.support, P.coeff d *
          ((w.1 ^ d 0 * conj w.1 ^ n.1) * (w.2 ^ d 1 * conj w.2 ^ n.2)) := by
    rw [holEval_eq_support]
    simp only [Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro d hd
    ring
  simp_rw [hp]
  rw [integral_finsetSum P.support fun d hd =>
    ((integrable_pow_conj (d 0) n.1).mul_prod
      (integrable_pow_conj (d 1) n.2)).const_mul (P.coeff d)]
  rw [outerJet_holEval]
  apply Finset.sum_congr rfl
  intro d hd
  rw [integral_const_mul, integral_prod_mul, integral_pow_conj_eq_jet,
    integral_pow_conj_eq_jet]
  ring

theorem polynomialMoment_residual_eq_outerJet (p q r s : ℝ) (n e : PairPowers) :
    polynomialMoment (residualPolynomial p q r s n e) =
      outerJet n.2 (holEval (residualHolomorphicPolynomial p q r s n e)) := by
  rw [← integral_ev4_eq_polynomialMoment]
  simp_rw [ev4_residual_eq]
  exact integral_holEval_eq_outerJet _ _

theorem outerJet_const_mul (n : ℕ × ℕ) (c : ℂ) (F : ℂ × ℂ → ℂ) :
    outerJet n (fun w => c * F w) = c * outerJet n F := by
  simp only [outerJet, iteratedDeriv_const_mul_field]

/-- The raw monomial/kernel mixed jet is the existing finite coefficient
evaluator before multiplication by the normalized Fock prefactor. -/
theorem pairJet_monomial_kernel (c : ℂ) (p q r s : ℝ) (n e : PairPowers) :
    pairJet n (fun zw =>
      BipartitePolynomialL2.monomial e zw * kernel c p q r s zw) =
      c * polynomialMoment (residualPolynomial p q r s n e) := by
  unfold pairJet
  have h : innerJet n.1 (fun zw =>
      BipartitePolynomialL2.monomial e zw * kernel c p q r s zw) =
      fun w => c * holEval (residualHolomorphicPolynomial p q r s n e) w :=
    funext (innerJet_monomial_kernel c p q r s n e)
  rw [h, outerJet_const_mul, polynomialMoment_residual_eq_outerJet]

/-- Exact normalized source-pair coefficient versus finite mixed jet, under
the same original Schur hypotheses as the existing source coefficient theorem. -/
theorem integral_source_pair_eq_jet (c : ℂ) {p q r s : ℝ}
    (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) - (p * q + r * s) ^ 2)
    (n e : PairPowers) :
    (∫ zw, conj (monomial4 n zw) *
      (BipartitePolynomialL2.monomial e zw * kernel c p q r s zw) ∂pairMeasure) =
      (normalization4 n : ℂ) * pairJet n (fun zw =>
        BipartitePolynomialL2.monomial e zw * kernel c p q r s zw) := by
  rw [integral_source_pair c hA hdet, pairJet_monomial_kernel]
  ring

end
end Grothe.UpperChaos.BipartiteCoefficientJets
