import Grothe.UpperChaos.ActualTensorMomentCoefficients

/-!
# Production multiplier coefficients as finite physical Hermite moments

Agent-ID: codex-2ca4.

This joins the tensor-monomial coefficient theorem to the actual production
multiplier polynomial. Both the physical support and coefficients are taken
from multiplierPolynomial g.power; no replacement polynomial, coefficient
identity or physical/source interchange is assumed.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.ActualProductionMomentCoefficients

open ActualTaylorCoherent GaussianFockBessel BipartitePolynomialL2
open ScaledActualCoherentL2 ActualPairMomentCoefficients
open ActualTensorMomentCoefficients OriginalHSParameterGates

noncomputable section

/-- The actual coherent transform is the finite sum of its physical monomial
transforms, with exactly the production coefficients and source scaling. -/
theorem scaledTransform_eq_moment_sum (g : Gate) (Z : TensorSources) :
    scaledTransform g Z =
      ∑ e ∈ (multiplierPolynomial g.power).support,
        (multiplierPolynomial g.power).coeff e *
          scaledTensorMoment g (fun k => e k) Z := by
  classical
  have hx : evalPair (xPolynomial g) Z = (pairX g Z.1, pairX g Z.2) := by
    simp [evalPair, xPolynomial, coordinates, pairX]
  have hy : evalPair (yPolynomial g) Z = (pairY g Z.1, pairY g Z.2) := by
    simp [evalPair, yPolynomial, coordinates, pairY]
  have hu : evalPair (uPolynomial g) Z = (pairU g 0 Z.1, pairU g 1 Z.2) := by
    simp [evalPair, uPolynomial, coordinates, pairU]
  have hv : evalPair (vPolynomial g) Z = (pairV g 0 Z.1, pairV g 1 Z.2) := by
    simp [evalPair, vPolynomial, coordinates, pairV]
  unfold scaledTransform
  rw [integral_coherentIntegrand_eq_moments, hx, hy, hu, hv]
  simp only [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro e _
  rw [scaledTensorMoment, scaledPairMoment_eq_normalized,
    scaledPairMoment_eq_normalized]
  simp only [sourceNormalization]
  ring

/-- Finite source-space linearity supplies the actual production coefficient.
Each summand is integrable by the checked gate's pair L2 theorem. -/
theorem coefficient8_scaledTransform_eq_moment_sum (g : Gate)
    (hg : gateOK g = true) (i : TensorPowers) :
    coefficient8 (scaledTransform g) i =
      ∑ e ∈ (multiplierPolynomial g.power).support,
        (multiplierPolynomial g.power).coeff e *
          coefficient8 (scaledTensorMoment g (fun k => e k)) i := by
  classical
  have hp (Z : TensorSources) :
      conj (monomial8 i Z) * scaledTransform g Z =
        ∑ e ∈ (multiplierPolynomial g.power).support,
          (multiplierPolynomial g.power).coeff e *
            (conj (monomial8 i Z) * scaledTensorMoment g (fun k => e k) Z) := by
    rw [scaledTransform_eq_moment_sum]
    simp only [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro e _
    ring
  unfold coefficient8
  simp_rw [hp]
  rw [integral_finsetSum _ fun e _ =>
    (integrable_coefficient8 (memLp_scaledTensorMoment g hg (fun k => e k)) i).const_mul
      ((multiplierPolynomial g.power).coeff e)]
  simp only [integral_const_mul]

/-- Every coefficient of the actual scaled production transform is a finite
sum of actual physical Hermite moments, with the exact common factors. -/
theorem coefficient8_scaledTransform_eq_physical (g : Gate)
    (hg : gateOK g = true) (m n : Idx2) :
    coefficient8 (scaledTransform g) (gateMatrixIndexEquiv (m, n)) =
      tensorNormalization m n * tensorSourceWeight g m n *
        ∑ e ∈ (multiplierPolynomial g.power).support,
          (multiplierPolynomial g.power).coeff e *
            tensorPhysicalMoment g (fun k => e k) m n := by
  rw [coefficient8_scaledTransform_eq_moment_sum g hg]
  simp_rw [coefficient8_scaledTensorMoment_eq_Hermite g hg]
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro e _
  ring

end
end Grothe.UpperChaos.ActualProductionMomentCoefficients
