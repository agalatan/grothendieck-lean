import Grothe.UpperChaos.ActualSourceCoefficientExtraction
import Grothe.UpperChaos.ActualTaylorFiniteCoefficients
import Grothe.UpperChaos.GateFockCoefficients
import Grothe.UpperChaos.DampedMoments

/-!
# Finite physical matrix evaluation and the actual ground coefficient

Agent-ID: codex-2ca4.

The actual normalized Hermite matrix entry is reduced to a finite sum of
radially damped Gaussian moments of the production polynomial. The ground
source coefficient is identified with the actual ground matrix entry, using
only the already justified source-space Fubini. No physical/source exchange
or generating-series premise is introduced.

For arbitrary indices, comparison with the finite source-side expression is
still a finite Hermite/Wick algebra identity. The theorem below does not
claim that remaining all-index identity or transfer a numerical HS cap.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.ActualMatrixFiniteComparison

open ActualTaylorCoherent ActualTaylorFiniteCoefficients
open ActualSourceCoefficientExtraction GaussianFockBessel
open IndependentSourceMoments IndependentSourcePolynomial
open BipartitePolynomialL2 ScaledActualCoherentL2 GateFockCoefficients
open OriginalHSParameterGates OriginalHSParameterSoundness OriginalHSGaussianMass

noncomputable section

/-- The unnormalized physical Hermite insertion, in the production variable
order `(z, conjugate z, w, conjugate w)`. -/
def hermiteInsertion (m n : Idx2) : P4 :=
  sX (conjP (H m.1.1 m.1.2)) * sY 0 (conjP (H m.2.1 m.2.2)) *
    sX (H n.1.1 n.1.2) * sY 0 (H n.2.1 n.2.2)

theorem ev4_hermiteInsertion (m n : Idx2) (zw : ℂ × ℂ) :
    ev4 zw (hermiteInsertion m n) = conj (H2 m zw) * H2 n zw := by
  simp only [hermiteInsertion, ev4, map_mul]
  change ev4 zw (sX (conjP (H m.1.1 m.1.2))) *
    ev4 zw (sY 0 (conjP (H m.2.1 m.2.2))) *
      ev4 zw (sX (H n.1.1 n.1.2)) * ev4 zw (sY 0 (H n.2.1 n.2.2)) = _
  rw [ev4_sX, ev4_sY, ev4_sX, ev4_sY, ev_conjP, ev_conjP]
  simp only [sig, norm_zero, zero_pow (by decide : (2 : ℕ) ≠ 0),
    sub_zero, Real.sqrt_one, Complex.ofReal_one, zero_mul, one_mul,
    zero_add, H2, map_mul]
  ring

/-- This polynomial includes the actual multiplier, not the base response F0. -/
def physicalMatrixPolynomial (j : ℕ) (m n : Idx2) : P4 :=
  hermiteInsertion m n * multiplierPolynomial j

/-- Exact normalized complex Gaussian moment at the original radial rate. -/
def dampedMoment (r : ℝ) (p q : ℕ) : ℂ :=
  if p = q then (p.factorial : ℂ) / (r : ℂ) ^ (p + 1) else 0

theorem momentValue_zero_sources (p q : ℕ) {r : ℝ} (hr : 0 < r) :
    momentValue r 0 0 p q = dampedMoment r p q := by
  rw [← integral_eq_momentValue p q hr 0 0]
  have hp (z : ℂ) : integrand r 0 0 p q z =
      z ^ p * conj z ^ q * (Real.exp (-(r - 1) * Complex.normSq z) : ℂ) := by
    simp only [integrand, zero_mul, add_zero, Complex.ofReal_exp,
      Complex.ofReal_mul, Complex.ofReal_neg]
  simp_rw [hp]
  exact integral_moment_damped p q hr

private theorem ev4_support (P : P4) (zw : ℂ × ℂ) :
    ev4 zw P = ∑ s ∈ P.support, P.coeff s *
      ((zw.1 ^ s 0 * conj zw.1 ^ s 1) * (zw.2 ^ s 2 * conj zw.2 ^ s 3)) := by
  classical
  have h := congrArg (fun Q : P4 => ev4 zw Q) P.as_sum
  simp only [ev4, map_sum] at h
  change ev4 zw P = ∑ s ∈ P.support, ev4 zw (monomial s (P.coeff s)) at h
  simpa only [ev4_monomial] using h

/-- Finite physical polynomial integration, with both normalized Gaussian
inverse-rate factors retained in `dampedMoment`. -/
theorem integral_physical_polynomial (P : P4) {r : ℝ} (hr : 0 < r) :
    (∫ zw, ev4 zw P *
      Complex.exp (-((r - 1 : ℝ) : ℂ) * (Complex.normSq zw.1 : ℂ)) *
      Complex.exp (-((r - 1 : ℝ) : ℂ) * (Complex.normSq zw.2 : ℂ)) ∂mu2) =
      ∑ s ∈ P.support, P.coeff s *
        (dampedMoment r (s 0) (s 1) * dampedMoment r (s 2) (s 3)) := by
  classical
  have hp (zw : ℂ × ℂ) : ev4 zw P *
      Complex.exp (-((r - 1 : ℝ) : ℂ) * (Complex.normSq zw.1 : ℂ)) *
      Complex.exp (-((r - 1 : ℝ) : ℂ) * (Complex.normSq zw.2 : ℂ)) =
      ∑ s ∈ P.support, P.coeff s *
        (integrand r 0 0 (s 0) (s 1) zw.1 *
          integrand r 0 0 (s 2) (s 3) zw.2) := by
    rw [ev4_support]
    simp only [Finset.sum_mul, integrand, zero_mul, add_zero]
    apply Finset.sum_congr rfl
    intro s hs
    ring
  simp_rw [hp]
  rw [integral_finsetSum P.support fun s _ =>
    ((integrable_integrand (s 0) (s 1) hr 0 0).mul_prod
      (integrable_integrand (s 2) (s 3) hr 0 0)).const_mul (P.coeff s)]
  apply Finset.sum_congr rfl
  intro s hs
  rw [integral_const_mul, integral_prod_mul,
    integral_eq_momentValue (s 0) (s 1) hr,
    integral_eq_momentValue (s 2) (s 3) hr,
    momentValue_zero_sources (s 0) (s 1) hr,
    momentValue_zero_sources (s 2) (s 3) hr]

/-- All actual normalized Hermite entries have a finite physical Wick formula.
No numerical certificate or source-coefficient identity is a premise. -/
theorem matrixEntry_eq_finite_moments (j : ℕ) (m n : Idx2) :
    matrixEntry j m n = ((nrm2 m : ℂ) * (nrm2 n : ℂ)) *
      ∑ s ∈ (physicalMatrixPolynomial j m n).support,
        (physicalMatrixPolynomial j m n).coeff s *
          (dampedMoment (rate j) (s 0) (s 1) *
            dampedMoment (rate j) (s 2) (s 3)) := by
  rw [matrixEntry_eq_unnormalized]
  congr 1
  rw [← integral_physical_polynomial (physicalMatrixPolynomial j m n) (rate_pos j)]
  apply integral_congr_ae
  refine Filter.Eventually.of_forall fun zw => ?_
  rw [taylorPhasePower_eq_polynomial]
  simp only [physicalMatrixPolynomial, ev4, map_mul]
  change conj (H2 m zw) *
    (ev4 zw (multiplierPolynomial j) * _ * _) * H2 n zw =
      (ev4 zw (hermiteInsertion m n) * ev4 zw (multiplierPolynomial j)) * _ * _
  rw [ev4_hermiteInsertion]
  ring

private theorem integral_pure_power (k : ℕ) :
    (∫ z : ℂ, z ^ k ∂gaussC) = (0 : ℂ) ^ k := by
  have h := integral_moment k 0
  cases k <;> simpa using h

private theorem zero_descFactorial_cast (k : ℕ) :
    ((0 : ℕ).descFactorial k : ℂ) = (0 : ℂ) ^ k := by
  cases k <;> simp

private theorem residual_ground (p q r s : ℝ) (e : PairPowers) :
    polynomialMoment (residualPolynomial p q r s 0 e) =
      BipartitePolynomialL2.monomial e 0 := by
  rw [← integral_ev4_eq_polynomialMoment]
  have hp (w : ℂ × ℂ) : ev4 w (residualPolynomial p q r s 0 e) =
      ((0 : ℕ).descFactorial e.1.1 : ℂ) *
        ((0 : ℕ).descFactorial e.1.2 : ℂ) * (w.1 ^ e.2.1 * w.2 ^ e.2.2) := by
    simp [ev4, residualPolynomial, wv, mul_assoc]
  simp_rw [hp]
  rw [integral_const_mul, integral_prod_mul, integral_pure_power, integral_pure_power,
    zero_descFactorial_cast, zero_descFactorial_cast]
  rfl

theorem gatePairValue_ground (g : Gate) (side : Fin 2) (e : PairPowers) :
    gatePairValue g side 0 e =
      BipartitePolynomialL2.monomial e 0 * gateKernel g side 0 := by
  simp only [gatePairValue, residual_ground]
  simp [normalization4, gateKernel, kernel, coupling, image]
  ring

/-- The ground source coefficient of any finite polynomial insertion is its
value at zero. Source Fubini is supplied by the checked gate, not assumed. -/
theorem coefficient8_tensor_polynomial_ground {ι : Type*} (t : Finset ι)
    (d : ι → ℂ) (e : ι → TensorPowers) (g : Gate) (hg : gateOK g = true) :
    coefficient8 (fun zw => (∑ i ∈ t, d i * tensorMonomial (e i) zw) *
      tensorKernel g zw) 0 =
      (∑ i ∈ t, d i * tensorMonomial (e i) 0) * tensorKernel g 0 := by
  rw [coefficient8_tensor_polynomial t d e g hg]
  simp only [gatePairValue_ground, Finset.sum_mul, tensorMonomial, tensorKernel]
  apply Finset.sum_congr rfl
  intro i hi
  ring

theorem coefficient8_scaledTransform_ground (g : Gate) (hg : gateOK g = true) :
    coefficient8 (scaledTransform g) 0 = scaledTransform g 0 := by
  classical
  have he : scaledTransform g = fun zw =>
      (∑ s ∈ (actualSourcePolynomial g).support,
        (actualSourcePolynomial g).coeff s * tensorMonomial (powers s) zw) *
          tensorKernel g zw := by
    funext zw
    rw [scaledTransform_eq g hg, eval_eq_support]
  rw [he, coefficient8_tensor_polynomial_ground _ _ _ g hg]

theorem scaledTransform_zero (g : Gate) :
    scaledTransform g 0 = ∫ zw, taylorPhasePower g.power zw ∂mu2 := by
  unfold scaledTransform
  apply integral_congr_ae
  refine Filter.Eventually.of_forall fun zw => ?_
  simp [coherentIntegrand, coherentPair, evalPair, xPolynomial, yPolynomial,
    uPolynomial, vPolynomial, coordinates]

/-- An actual full-transform/Hermite-entry identification, at the ground
matrix index. All weights have degree zero and are therefore exactly one. -/
theorem coefficient8_scaledTransform_ground_matrixEntry
    (g : Gate) (hg : gateOK g = true) :
    coefficient8 (scaledTransform g) (gateMatrixIndexEquiv (0, 0)) =
      matrixEntry g.power 0 0 := by
  change coefficient8 (scaledTransform g) 0 = _
  rw [coefficient8_scaledTransform_ground g hg, scaledTransform_zero]
  simp [matrixEntry, hfun2, nrm2, fac2, H2, H_zero_zero, ev]

end
end Grothe.UpperChaos.ActualMatrixFiniteComparison
