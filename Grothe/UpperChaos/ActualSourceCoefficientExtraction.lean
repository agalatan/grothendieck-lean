import Grothe.UpperChaos.ScaledActualCoherentL2
import Grothe.UpperChaos.GaussianFockBessel
import Mathlib.Algebra.Polynomial.Derivative

/-!
# Finite Gaussian extraction of the actual scaled coherent coefficients

Agent-ID: codex-2ca4.

Only source-space Fubini is used. The source-space L2 theorem supplies absolute
integrability of each coefficient pairing. Integrating the first side of a
holomorphic bipartite Gaussian leaves a finite polynomial on the second side.
Its Gaussian moments are finite factorial sums. This evaluates coefficient8
of the actual scaled transform, without a reproducing-equality premise or a
physical/source interchange.

Source order is the gate order ((y,u),(x,v)) for each physical coordinate.
Comparison of the resulting finite expression with actual Hermite matrix
entries is a remaining algebraic obligation, not an assumption below.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.ActualSourceCoefficientExtraction

open IndependentSourceMoments IndependentSourcePolynomial GaussianFockBessel
open BipartitePolynomialL2 ScaledActualCoherentL2
open OriginalHSParameterGates OriginalHSParameterSoundness OriginalHSQuadraticForms
open OriginalHSGaussianMass

noncomputable section

/-- At unit rate and zero second source the moment recurrence is ordinary
polynomial differentiation. -/
theorem momentPolynomial_one_zero (p q : ℕ) :
    momentPolynomial 1 0 p q = Polynomial.derivative^[p] (Polynomial.X ^ q) := by
  induction p with
  | zero => simp [momentPolynomial]
  | succ p ih => simp [momentPolynomial, ih, Function.iterate_succ_apply']

/-- Exact coefficient extraction, including the vanishing case p > q. -/
theorem momentValue_one_zero (a : ℂ) (p q : ℕ) :
    momentValue 1 a 0 p q = (q.descFactorial p : ℂ) * a ^ (q - p) := by
  rw [momentValue, momentPolynomial_one_zero,
    Polynomial.iterate_derivative_X_pow_eq_C_mul]
  simp

theorem integrable_holomorphic_mixed (a : ℂ) (p q : ℕ) :
    Integrable (fun z : ℂ => z ^ p * conj z ^ q * Complex.exp (a * z)) gaussC := by
  simpa [integrand] using integrable_integrand p q (show (0 : ℝ) < 1 by norm_num) a 0

/-- Gaussian integration extracts a finite derivative of exp(a*z). -/
theorem integral_holomorphic_mixed (a : ℂ) (p q : ℕ) :
    (∫ z : ℂ, z ^ p * conj z ^ q * Complex.exp (a * z) ∂gaussC) =
      (q.descFactorial p : ℂ) * a ^ (q - p) := by
  simpa [integrand, momentValue_one_zero] using
    integral_eq_momentValue p q (show (0 : ℝ) < 1 by norm_num) a 0

/-- The Gaussian moment of a physical four-variable polynomial as a finite sum. -/
def polynomialMoment (P : P4) : ℂ :=
  ∑ s ∈ P.support, P.coeff s * (mom (s 0) (s 1) * mom (s 2) (s 3))

theorem integral_ev4_eq_polynomialMoment (P : P4) :
    (∫ w, ev4 w P ∂mu2) = polynomialMoment P := by
  classical
  rw [← E2_apply]
  have h := congrArg E2 P.as_sum
  simpa only [map_sum, E2_monomial, polynomialMoment] using h

/-- Product of the four actual one-source inverse-square-root factorials. -/
def normalization4 (n : PairPowers) : ℝ :=
  ((Real.sqrt (n.1.1.factorial : ℝ))⁻¹ * (Real.sqrt (n.1.2.factorial : ℝ))⁻¹) *
    ((Real.sqrt (n.2.1.factorial : ℝ))⁻¹ * (Real.sqrt (n.2.2.factorial : ℝ))⁻¹)

theorem monomial4_eq (n : PairPowers) (zw : PairSources) :
    monomial4 n zw = (normalization4 n : ℂ) * BipartitePolynomialL2.monomial n zw := by
  simp only [monomial4, monomial2, tensorFamily, monomial1_eq,
    normalization4, BipartitePolynomialL2.monomial, Complex.ofReal_mul]
  ring

/-- After extracting the (y,u) source pair, this polynomial remains in (x,v)
and their conjugates. Falling factorials make impossible degrees zero. -/
def residualPolynomial (p q r s : ℝ) (n e : PairPowers) : P4 :=
  C (n.1.1.descFactorial e.1.1 : ℂ) * C (n.1.2.descFactorial e.1.2 : ℂ) *
    X 0 ^ e.2.1 * X 1 ^ n.2.1 * X 2 ^ e.2.2 * X 3 ^ n.2.2 *
      (C (p : ℂ) * X 0 + C (q : ℂ) * X 2) ^ (n.1.1 - e.1.1) *
        (C (r : ℂ) * X 0 + C (s : ℂ) * X 2) ^ (n.1.2 - e.1.2)

private theorem eval_residualPolynomial (p q r s : ℝ) (n e : PairPowers) (w : ℂ × ℂ) :
    ev4 w (residualPolynomial p q r s n e) =
      (w.1 ^ e.2.1 * conj w.1 ^ n.2.1 * w.2 ^ e.2.2 * conj w.2 ^ n.2.2) *
        ((n.1.1.descFactorial e.1.1 : ℂ) * (image p q r s w).1 ^ (n.1.1 - e.1.1)) *
        ((n.1.2.descFactorial e.1.2 : ℂ) * (image p q r s w).2 ^ (n.1.2 - e.1.2)) := by
  simp [ev4, residualPolynomial, wv, image]
  ring

/-- Exact inner source integration; no exchange with physical variables occurs. -/
theorem integral_inner_source_pair (c : ℂ) (p q r s : ℝ)
    (n e : PairPowers) (w : ℂ × ℂ) :
    (∫ z : ℂ × ℂ, conj (monomial4 n (z, w)) *
      (BipartitePolynomialL2.monomial e (z, w) * kernel c p q r s (z, w)) ∂mu2) =
      (normalization4 n : ℂ) * c * ev4 w (residualPolynomial p q r s n e) := by
  have hp (z : ℂ × ℂ) :
      conj (monomial4 n (z, w)) *
        (BipartitePolynomialL2.monomial e (z, w) * kernel c p q r s (z, w)) =
      ((normalization4 n : ℂ) * c *
        (w.1 ^ e.2.1 * conj w.1 ^ n.2.1 * w.2 ^ e.2.2 * conj w.2 ^ n.2.2)) *
        ((z.1 ^ e.1.1 * conj z.1 ^ n.1.1 * Complex.exp ((image p q r s w).1 * z.1)) *
          (z.2 ^ e.1.2 * conj z.2 ^ n.1.2 * Complex.exp ((image p q r s w).2 * z.2))) := by
    rw [monomial4_eq]
    simp only [BipartitePolynomialL2.monomial, kernel, coupling,
      map_mul, map_pow, Complex.conj_ofReal, Complex.exp_add]
    ring
  simp_rw [hp]
  rw [integral_const_mul, integral_prod_mul, integral_holomorphic_mixed,
    integral_holomorphic_mixed, eval_residualPolynomial]
  ring

/-- A normalized Fock coefficient of a polynomial monomial times the bipartite
Gaussian is a finite factorial expression. The original Schur hypotheses
provide the source-space Fubini justification. -/
theorem integral_source_pair (c : ℂ) {p q r s : ℝ}
    (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) - (p * q + r * s) ^ 2)
    (n e : PairPowers) :
    (∫ zw, conj (monomial4 n zw) *
      (BipartitePolynomialL2.monomial e zw * kernel c p q r s zw) ∂pairMeasure) =
      (normalization4 n : ℂ) * c * polynomialMoment (residualPolynomial p q r s n e) := by
  have hf : Integrable (fun zw => conj (monomial4 n zw) *
      (BipartitePolynomialL2.monomial e zw * kernel c p q r s zw)) pairMeasure := by
    exact ((memLp_monomial4 n).star.integrable_mul
      (memLp_monomial_kernel e c hA hdet)).congr
        (Filter.Eventually.of_forall fun zw => rfl)
  rw [integral_prod_symm _ hf]
  simp_rw [integral_inner_source_pair]
  rw [integral_const_mul, integral_ev4_eq_polynomialMoment]

/-- The finite coefficient evaluator for one actual physical-pair gate. -/
def gatePairValue (g : Gate) (side : Fin 2) (n e : PairPowers) : ℂ :=
  (normalization4 n : ℂ) * (nu g.power : ℂ) *
    polynomialMoment (residualPolynomial (matrix00 g) (matrix01 g side)
      (matrix10 g side) (matrix11 g side) n e)

theorem integral_gate_pair (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) (n e : PairPowers) :
    (∫ zw, conj (monomial4 n zw) *
      (BipartitePolynomialL2.monomial e zw * gateKernel g side zw) ∂pairMeasure) =
      gatePairValue g side n e := by
  apply integral_source_pair
  · rw [matrix_leadingRate_eq g hg side]
    exact leadingRate_pos g hg side
  · rw [matrix_determinant_eq g hg side]
    exact (pair_positive g hg side).determinant

/-- The two physical pairs factor in the actual eight-source coefficient integral. -/
theorem coefficient8_tensor_monomial (g : Gate) (hg : gateOK g = true)
    (n e : TensorPowers) :
    coefficient8 (fun zw => tensorMonomial e zw * tensorKernel g zw) n =
      gatePairValue g 0 n.1 e.1 * gatePairValue g 1 n.2 e.2 := by
  unfold coefficient8
  have hp (zw : TensorSources) :
      conj (monomial8 n zw) * (tensorMonomial e zw * tensorKernel g zw) =
      (conj (monomial4 n.1 zw.1) *
        (BipartitePolynomialL2.monomial e.1 zw.1 * gateKernel g 0 zw.1)) *
      (conj (monomial4 n.2 zw.2) *
        (BipartitePolynomialL2.monomial e.2 zw.2 * gateKernel g 1 zw.2)) := by
    simp only [monomial8, tensorFamily, tensorMonomial, tensorKernel, map_mul]
    ring
  simp_rw [hp]
  rw [integral_prod_mul, integral_gate_pair g hg, integral_gate_pair g hg]

/-- Finite linearity gives an exact eight-source coefficient formula for any
finite holomorphic polynomial insertion under the checked gate. -/
theorem coefficient8_tensor_polynomial {ι : Type*} (t : Finset ι)
    (d : ι → ℂ) (e : ι → TensorPowers) (g : Gate) (hg : gateOK g = true)
    (n : TensorPowers) :
    coefficient8 (fun zw => (∑ i ∈ t, d i * tensorMonomial (e i) zw) *
      tensorKernel g zw) n =
      ∑ i ∈ t, d i * (gatePairValue g 0 n.1 (e i).1 * gatePairValue g 1 n.2 (e i).2) := by
  have hp (zw : TensorSources) :
      conj (monomial8 n zw) *
        ((∑ i ∈ t, d i * tensorMonomial (e i) zw) * tensorKernel g zw) =
      ∑ i ∈ t, d i *
        (conj (monomial8 n zw) * (tensorMonomial (e i) zw * tensorKernel g zw)) := by
    simp only [Finset.sum_mul, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i hi
    ring
  unfold coefficient8
  simp_rw [hp]
  rw [integral_finsetSum t fun i _ =>
    (integrable_coefficient8 (memLp_tensor_monomial (e i) g hg) n).const_mul (d i)]
  apply Finset.sum_congr rfl
  intro i hi
  rw [integral_const_mul]
  change d i * coefficient8 (fun zw => tensorMonomial (e i) zw * tensorKernel g zw) n = _
  rw [coefficient8_tensor_monomial g hg]

/-- Exact finite extraction of the coefficient8 of the actual scaled production
coherent transform. No normalized Hermite matrix-entry equality is assumed. -/
theorem coefficient8_scaledTransform (g : Gate) (hg : gateOK g = true) (n : TensorPowers) :
    coefficient8 (scaledTransform g) n =
      ∑ s ∈ (actualSourcePolynomial g).support, (actualSourcePolynomial g).coeff s *
        (gatePairValue g 0 n.1 (powers s).1 * gatePairValue g 1 n.2 (powers s).2) := by
  classical
  have he : scaledTransform g = fun zw =>
      (∑ s ∈ (actualSourcePolynomial g).support,
        (actualSourcePolynomial g).coeff s * tensorMonomial (powers s) zw) * tensorKernel g zw := by
    funext zw
    rw [scaledTransform_eq g hg, eval_eq_support]
  rw [he]
  exact coefficient8_tensor_polynomial _ _ _ g hg n

end
end Grothe.UpperChaos.ActualSourceCoefficientExtraction
