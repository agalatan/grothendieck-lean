import Grothe.UpperChaos.PhysicalGateJets
import Grothe.UpperChaos.PairJetPolynomialOperations

/-!
# Actual scaled physical-pair Gaussian coefficients

Agent-ID: codex-2ca4.

The finite moment polynomial is specialized to the existing gate sources.
Its actual L2 integrability follows from gateOK. Finite Gaussian extraction,
unconditional diagonal jet scaling, and the physical Hermite contraction
identity then give the actual one-physical-coordinate matrix integral.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.ActualPairMomentCoefficients

open ActualTaylorCoherent IndependentSourcePolynomial
open OriginalHSParameterGates OriginalHSParameterSoundness OriginalHSQuadraticForms
open OriginalHSGaussianMass ScaledActualCoherentL2 BipartitePolynomialL2
open ActualSourceCoefficientExtraction GaussianFockBessel
open BipartiteCoefficientJets PairJetPolynomialOperations PhysicalGateJets

noncomputable section

def pairScales (g : Gate) (side : Fin 2) : PairSources :=
  (((Real.sqrt (g.r : ℝ) : ℂ), (Real.sqrt (axisWeight g (2 * side.val)) : ℂ)),
    ((Real.sqrt (g.r : ℝ) : ℂ), (Real.sqrt (axisWeight g (2 * side.val + 1)) : ℂ)))

def scaledPairMoment (g : Gate) (side : Fin 2) (p q : ℕ) (s : PairSources) : ℂ :=
  physicalCoherentMoment (rate g.power) p q (scaleSources (pairScales g side) s)

theorem scaledPairMoment_eq_normalized (g : Gate) (side : Fin 2) (p q : ℕ)
    (s : PairSources) :
    scaledPairMoment g side p q s =
      Complex.exp (-pairX g s * pairY g s - pairU g side s * pairV g side s) *
        momentValue (rate g.power) (pairY g s + pairU g side s)
          (pairX g s + pairV g side s) p q := by
  change (Complex.exp (-pairX g s * pairY g s) *
    Complex.exp (-pairV g side s * pairU g side s)) * _ = _
  rw [← Complex.exp_add]
  congr 2
  ring

/-- A literal specialization of the existing lifted finite moment polynomial.
Only the first four coordinates are used; the other four are set to zero. -/
def pairMomentPolynomial (g : Gate) (side : Fin 2) (p q : ℕ) : SourcePolynomial :=
  insertedPolynomial (rate g.power)
    (C (Real.sqrt (g.r : ℝ) : ℂ) * X 0 +
      C (Real.sqrt (axisWeight g (2 * side.val)) : ℂ) * X 1)
    (C (Real.sqrt (g.r : ℝ) : ℂ) * X 2 +
      C (Real.sqrt (axisWeight g (2 * side.val + 1)) : ℂ) * X 3) p q

private theorem physicalCoherentMoment_eq (r : ℝ) (p q : ℕ) (s : PairSources) :
    physicalCoherentMoment r p q s =
      gaussianCoherent r s.2.1 s.1.1 s.1.2 s.2.2 *
        (momentPolynomial r (s.2.1 + s.2.2) p q).eval (s.1.1 + s.1.2) := by
  have he : (-s.2.1 * s.1.1 + -s.2.2 * s.1.2) +
      (s.1.1 + s.1.2) * (s.2.1 + s.2.2) / (r : ℂ) =
      -(1 - (r : ℂ)⁻¹) * (s.2.1 * s.1.1 + s.1.2 * s.2.2) +
        (r : ℂ)⁻¹ * (s.2.1 * s.1.2 + s.1.1 * s.2.2) := by
    simp only [div_eq_mul_inv]
    ring
  unfold physicalCoherentMoment momentValue gaussianCoherent
  calc
    _ = (r : ℂ)⁻¹ *
        (Complex.exp (-s.2.1 * s.1.1) * Complex.exp (-s.2.2 * s.1.2) *
          Complex.exp ((s.1.1 + s.1.2) * (s.2.1 + s.2.2) / (r : ℂ))) *
        (momentPolynomial r (s.2.1 + s.2.2) p q).eval (s.1.1 + s.1.2) := by ring
    _ = _ := by rw [← Complex.exp_add, ← Complex.exp_add, he]

private theorem eval_pairMomentPolynomial (g : Gate) (side : Fin 2) (p q : ℕ)
    (s : PairSources) :
    MvPolynomial.eval (coordinates (s, 0)) (pairMomentPolynomial g side p q) =
      (momentPolynomial (rate g.power) (pairX g s + pairV g side s) p q).eval
        (pairY g s + pairU g side s) := by
  rw [pairMomentPolynomial, eval_insertedPolynomial]
  simp [coordinates, pairX, pairY, pairU, pairV]

theorem scaledPairMoment_eq_polynomial_kernel (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) (p q : ℕ) (s : PairSources) :
    scaledPairMoment g side p q s =
      MvPolynomial.eval (coordinates (s, 0)) (pairMomentPolynomial g side p q) *
        gateKernel g side s := by
  rw [scaledPairMoment, physicalCoherentMoment_eq]
  change gaussianCoherent (rate g.power) (pairX g s) (pairY g s)
      (pairU g side s) (pairV g side s) *
      (momentPolynomial (rate g.power) (pairX g s + pairV g side s) p q).eval
        (pairY g s + pairU g side s) = _
  rw [scaled_pair_gaussian g hg, eval_pairMomentPolynomial]
  ring

def pairPolynomialCoeff (P : SourcePolynomial) (e : Fin 8 →₀ ℕ) : ℂ :=
  P.coeff e * BipartitePolynomialL2.monomial (powers e).2 0

theorem eval_pair_polynomial (P : SourcePolynomial) (s : PairSources) :
    MvPolynomial.eval (coordinates (s, 0)) P =
      ∑ e ∈ P.support, pairPolynomialCoeff P e *
        BipartitePolynomialL2.monomial (powers e).1 s := by
  rw [eval_eq_support]
  apply Finset.sum_congr rfl
  intro e he
  simp only [pairPolynomialCoeff, tensorMonomial]
  ring

theorem memLp_scaledPairMoment (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) (p q : ℕ) :
    MemLp (scaledPairMoment g side p q) 2 pairMeasure := by
  let P := pairMomentPolynomial g side p q
  have h := memLp_gate_polynomial P.support (pairPolynomialCoeff P)
    (fun e => (powers e).1) g hg side
  refine MemLp.ae_eq (Filter.Eventually.of_forall fun s => ?_) h
  rw [scaledPairMoment_eq_polynomial_kernel g hg, eval_pair_polynomial]
  rfl

/-- A normalized Gaussian coefficient of the actual scaled pair is its finite
jet, under exactly the actual checked gate. -/
theorem integral_scaledPairMoment_eq_jet (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) (p q : ℕ) (n : PairPowers) :
    (∫ s, conj (monomial4 n s) * scaledPairMoment g side p q s ∂pairMeasure) =
      (normalization4 n : ℂ) * pairJet n (scaledPairMoment g side p q) := by
  let P := pairMomentPolynomial g side p q
  have he : scaledPairMoment g side p q = fun s =>
      (∑ e ∈ P.support, pairPolynomialCoeff P e *
        BipartitePolynomialL2.monomial (powers e).1 s) * gateKernel g side s := by
    funext s
    rw [scaledPairMoment_eq_polynomial_kernel g hg, eval_pair_polynomial]
  rw [he]
  apply integral_source_pair_polynomial_eq_jet
  · rw [matrix_leadingRate_eq g hg side]
    exact leadingRate_pos g hg side
  · rw [matrix_determinant_eq g hg side]
    exact (pair_positive g hg side).determinant

/-- All four source degrees, including their actual weights, give the actual
unnormalized physical Hermite entry for one physical coordinate. -/
theorem integral_scaledPairMoment_eq_Hermite (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) (p q a b c d : ℕ) :
    (∫ s, conj (monomial4 ((b, c), (a, d)) s) *
      scaledPairMoment g side p q s ∂pairMeasure) =
      (normalization4 ((b, c), (a, d)) : ℂ) *
        scaleWeight ((b, c), (a, d)) (pairScales g side) *
        ∫ z, IndependentSourceMoments.integrand (rate g.power) 0 0 p q z *
          conj (ev z (H a b)) * ev z (H c d) ∂gaussC := by
  rw [integral_scaledPairMoment_eq_jet g hg side p q]
  change (normalization4 ((b, c), (a, d)) : ℂ) *
    pairJet ((b, c), (a, d)) (fun s =>
      physicalCoherentMoment (rate g.power) p q (scaleSources (pairScales g side) s)) = _
  rw [pairJet_scale, pairJet_eq_integral_Hermite_product p q a b c d (rate_pos g.power)]
  ring

end
end Grothe.UpperChaos.ActualPairMomentCoefficients
