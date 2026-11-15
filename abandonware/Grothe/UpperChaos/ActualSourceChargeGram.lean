import Grothe.UpperChaos.ActualSourceInsertionCharge
import Mathlib.LinearAlgebra.Finsupp.LinearCombination

/-!
# Finite charge-block regrouping of the actual rational source Gram expression

Agent-ID: codex-2ca4. Task #40.

The actual insertion maps distinct physical charge blocks to orthogonal
source blocks. Its norm is therefore a diagonal finite sum indexed before
eight-variable source expansion.

The bilinear form below packages precisely the pair kernel and coefficients
in rationalSourceNormValue. It adds no source identity, Gaussian parameter,
normalization factor, numerical enclosure, or compiler-limit exception.
Linearity is used symbolically; no expanded-support enumeration is evaluated.
-/

set_option warningAsError true

namespace Grothe.UpperChaos.ActualSourceChargeGram

open ActualRationalSourcePolynomial ActualSourceNormEvaluation ActualTaylorCoherent
open ActualSourceInsertionLinear ActualSourceInsertionCharge RationalChargeOrthogonality
open ScaledActualCoherentL2 OriginalHSParameterGates

noncomputable section

abbrev SourceExponent := Fin 8 →₀ ℕ

/-- Exactly the tensor pair contribution already used by rationalSourceNormValue. -/
def rationalTensorKernel (g : Gate) (e f : SourceExponent) : ℚ :=
  rationalGatePairValue g 0 (powers e).1 (powers f).1 *
    rationalGatePairValue g 1 (powers e).2 (powers f).2

private def gramRowQ (g : Gate) (e : SourceExponent) :
    RationalSourcePolynomial →ₗ[ℚ] ℚ :=
  (Finsupp.linearCombination ℚ (rationalTensorKernel g e)).comp
    (AddMonoidAlgebra.coeffLinearEquiv ℚ).toLinearMap

private theorem gramRowQ_apply (g : Gate) (e : SourceExponent)
    (Q : RationalSourcePolynomial) :
    gramRowQ g e Q =
      ∑ f ∈ Q.support, Q.coeff f * rationalTensorKernel g e f := by
  classical
  change Q.coeff.sum (fun f b => b • rationalTensorKernel g e f) = _
  simp only [Finsupp.sum, MvPolynomial.finsupp_support_eq_support, smul_eq_mul]

/-- Bilinear packaging of the existing exact rational source Gram expression. -/
def sourceGramQ (g : Gate) :
    RationalSourcePolynomial →ₗ[ℚ] RationalSourcePolynomial →ₗ[ℚ] ℚ :=
  (Finsupp.linearCombination ℚ (gramRowQ g)).comp
    (AddMonoidAlgebra.coeffLinearEquiv ℚ).toLinearMap

theorem sourceGramQ_apply (g : Gate) (P Q : RationalSourcePolynomial) :
    sourceGramQ g P Q =
      ∑ e ∈ P.support, ∑ f ∈ Q.support,
        (P.coeff e * Q.coeff f) * rationalTensorKernel g e f := by
  classical
  change (P.coeff.sum (fun e a => a • gramRowQ g e)) Q = _
  rw [LinearMap.finsupp_sum_apply]
  simp only [LinearMap.smul_apply, gramRowQ_apply,
    Finsupp.sum, MvPolynomial.finsupp_support_eq_support, smul_eq_mul,
    Finset.mul_sum, mul_assoc]

/-- The new bilinear packaging agrees exactly with the landed norm definition. -/
theorem rationalSourceNormValue_eq_sourceGramQ (g : Gate) :
    rationalSourceNormValue g =
      sourceGramQ g (rationalSourcePolynomial g.power) (rationalSourcePolynomial g.power) := by
  rw [sourceGramQ_apply]
  rfl

/-- Different homogeneous source charges have zero cross Gram value. -/
theorem sourceGramQ_eq_zero_of_homogeneous (g : Gate)
    (P Q : RationalSourcePolynomial) (k l : ℤ × ℤ)
    (hP : MvPolynomial.IsWeightedHomogeneous sourceChargeWeights P k)
    (hQ : MvPolynomial.IsWeightedHomogeneous sourceChargeWeights Q l)
    (hkl : k ≠ l) : sourceGramQ g P Q = 0 := by
  classical
  rw [sourceGramQ_apply]
  apply Finset.sum_eq_zero
  intro e he
  apply Finset.sum_eq_zero
  intro f hf
  have heCharge : sourceCharge e = k := by
    rw [← weight_sourceChargeWeights]
    exact hP (MvPolynomial.mem_support_iff.mp he)
  have hfCharge : sourceCharge f = l := by
    rw [← weight_sourceChargeWeights]
    exact hQ (MvPolynomial.mem_support_iff.mp hf)
  have hne : sourceCharge e ≠ sourceCharge f := by
    rwa [heCharge, hfCharge]
  have hz := rationalTensorPairValue_eq_zero_of_charge_ne g e f hne
  simp only [rationalTensorKernel, hz, mul_zero]

/-- Actual inserted physical charge blocks are pairwise Gram-orthogonal. -/
theorem inserted_chargeBlocks_orthogonal (g : Gate) (r : ℚ)
    (P : MultiplierPolynomial) (k l : ℤ × ℤ) (hkl : k ≠ l) :
    sourceGramQ g (insertion r (chargeBlock P k)) (insertion r (chargeBlock P l)) = 0 := by
  refine sourceGramQ_eq_zero_of_homogeneous g _ _ (-k) (-l)
    (insertion_chargeBlock_homogeneous r P k)
    (insertion_chargeBlock_homogeneous r P l) ?_
  intro h
  exact hkl (neg_injective h)

/-- Exact finite regrouping with indices drawn from the physical multiplier,
before eight-variable source expansion. -/
theorem sourceGramQ_insertion_eq_sum_chargeBlocks (g : Gate) (r : ℚ)
    (P : MultiplierPolynomial) :
    sourceGramQ g (insertion r P) (insertion r P) =
      ∑ k ∈ chargeSet P,
        sourceGramQ g (insertion r (chargeBlock P k)) (insertion r (chargeBlock P k)) := by
  classical
  have hdec : insertion r P =
      ∑ k ∈ chargeSet P, insertion r (chargeBlock P k) := by
    rw [← map_sum, sum_chargeBlock]
  calc
    sourceGramQ g (insertion r P) (insertion r P) =
        sourceGramQ g
          (∑ k ∈ chargeSet P, insertion r (chargeBlock P k))
          (∑ l ∈ chargeSet P, insertion r (chargeBlock P l)) := by
      simp only [hdec]
    _ = ∑ k ∈ chargeSet P, ∑ l ∈ chargeSet P,
        sourceGramQ g (insertion r (chargeBlock P k)) (insertion r (chargeBlock P l)) := by
      simp only [map_sum, LinearMap.sum_apply]
      exact Finset.sum_comm
    _ = _ := by
      apply Finset.sum_congr rfl
      intro k hk
      apply Finset.sum_eq_single_of_mem k hk
      intro l _hl hlk
      exact inserted_chargeBlocks_orthogonal g r P k l (fun h => hlk h.symm)

/-- The landed rationalSourceNormValue equals the diagonal sum over the
actual multiplier's finite charge blocks. No charge-count or radial square
formula is asserted. -/
theorem rationalSourceNormValue_eq_chargeBlocks (g : Gate) :
    rationalSourceNormValue g =
      ∑ k ∈ chargeSet (multiplierQ g.power),
        sourceGramQ g
          (insertion (rateQ g.power) (chargeBlock (multiplierQ g.power) k))
          (insertion (rateQ g.power) (chargeBlock (multiplierQ g.power) k)) := by
  rw [rationalSourceNormValue_eq_sourceGramQ]
  simpa only [rationalSourcePolynomial_eq_insertion] using
    sourceGramQ_insertion_eq_sum_chargeBlocks g (rateQ g.power) (multiplierQ g.power)

open Lean Elab Command
run_cmd do
  for target in #[``sourceGramQ_apply,
      ``rationalSourceNormValue_eq_sourceGramQ,
      ``inserted_chargeBlocks_orthogonal,
      ``rationalSourceNormValue_eq_chargeBlocks] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"

end
end Grothe.UpperChaos.ActualSourceChargeGram
