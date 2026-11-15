import Grothe.UpperChaos.ActualTensorMomentCoefficients
import Grothe.UpperChaos.ActualGateMatrixWeights

/-!
# Actual gate coefficient normalization and source weights

Agent-ID: codex-2ca4.

The gate order ((y,u),(x,v)) permutes the eight factorial factors but
does not change their product. Its outgoing scales share sqrt(R), while
each incoming exponent retains its own axis scale. Both identities below
are unconditional algebraic identities, with no gate-positivity premise.
-/

namespace Grothe.UpperChaos.ActualGateCoefficientWeights

open ActualTensorMomentCoefficients ActualSourceCoefficientExtraction
open ActualPairMomentCoefficients PairJetPolynomialOperations
open OriginalHSParameterGates OriginalHSQuadraticForms

noncomputable section

private theorem inv_sqrt_nat_mul (a b : ℕ) :
    (Real.sqrt ((a * b : ℕ) : ℝ))⁻¹ =
      (Real.sqrt (a : ℝ))⁻¹ * (Real.sqrt (b : ℝ))⁻¹ := by
  rw [Nat.cast_mul, Real.sqrt_mul (Nat.cast_nonneg a), mul_inv]

/-- The normalized eight-source coefficient has exactly the two physical
Hermite normalizations, including every outgoing and incoming factorial. -/
theorem tensorNormalization_eq_nrm2 (m n : Idx2) :
    tensorNormalization m n = (nrm2 m : ℂ) * (nrm2 n : ℂ) := by
  simp only [tensorNormalization, normalization4, nrm2, fac2,
    inv_sqrt_nat_mul, Complex.ofReal_mul]
  ring

/-- Regrouping the actual gate source scales recovers the physical matrix
weight. The outgoing (b,a) permutation never swaps the incoming axis weights. -/
theorem tensorSourceWeight_eq_sourceWeight (g : Gate) (m n : Idx2) :
    tensorSourceWeight g m n = (ActualGateMatrixWeights.sourceWeight g m n : ℂ) := by
  change
    (((Real.sqrt (g.r : ℝ) : ℂ) ^ m.1.2 *
        (Real.sqrt (axisWeight g 0) : ℂ) ^ n.1.1) *
      ((Real.sqrt (g.r : ℝ) : ℂ) ^ m.1.1 *
        (Real.sqrt (axisWeight g 1) : ℂ) ^ n.1.2)) *
    (((Real.sqrt (g.r : ℝ) : ℂ) ^ m.2.2 *
        (Real.sqrt (axisWeight g 2) : ℂ) ^ n.2.1) *
      ((Real.sqrt (g.r : ℝ) : ℂ) ^ m.2.1 *
        (Real.sqrt (axisWeight g 3) : ℂ) ^ n.2.2)) =
      ((Real.sqrt (g.r : ℝ) ^ (m.1.1 + m.1.2 + m.2.1 + m.2.2) *
        Real.sqrt (axisWeight g 0) ^ n.1.1 *
        Real.sqrt (axisWeight g 1) ^ n.1.2 *
        Real.sqrt (axisWeight g 2) ^ n.2.1 *
        Real.sqrt (axisWeight g 3) ^ n.2.2 : ℝ) : ℂ)
  simp only [Complex.ofReal_mul, Complex.ofReal_pow, pow_add]
  ring

end
end Grothe.UpperChaos.ActualGateCoefficientWeights
