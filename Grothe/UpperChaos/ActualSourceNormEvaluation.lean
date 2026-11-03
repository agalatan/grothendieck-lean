import Grothe.UpperChaos.ActualSourceNormGram
import Grothe.UpperChaos.BipartiteKernelGramEvaluation
import Grothe.UpperChaos.ActualGateConditionalScaling

/-!
# Finite evaluation of the actual production source norm

Agent-ID: codex-2ca4.

Complete WIP proof bodies; compilation remains pending.

This binds every pair Gram evaluator to the actual gate parameters and every
polynomial coefficient to actualSourcePolynomial. The final expression has
only finite polynomial support sums and scalar Gaussian moment formulas.
Its numerical enclosure and reproducible arithmetic certificate remain open.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.ActualSourceNormEvaluation

open BipartitePolynomialL2 ScaledActualCoherentL2 ActualSourceNormGram
open BipartiteKernelGramEvaluation OriginalHSParameterGates
open OriginalHSParameterSoundness OriginalHSQuadraticForms OriginalHSGaussianMass
open ActualTaylorFiniteCoefficients ActualGateMatrixWeights

noncomputable section

/-- Exact scalar Gram value for a physical pair of the original gate. -/
def gatePairValue (g : Gate) (side : Fin 2) (e f : PairPowers) : ℂ :=
  gramMomentValue e f (nu g.power : ℂ) (matrix00 g) (matrix01 g side)
    (matrix10 g side) (matrix11 g side)

/-- The complete rational pair contribution, including kernel mass and both
outer complex-coordinate Jacobians. Raw unscaled pair values need not be rational. -/
def rationalGatePairValue (g : Gate) (side : Fin 2) (e f : PairPowers) : ℚ :=
  RationalQuadraticMoments.nuQ g.power ^ 2 *
    RationalQuadraticMoments.polynomialMomentValue
      (RationalQuadraticMoments.gateLeadingQ g side)
      (RationalQuadraticMoments.gateCrossQ g side)
      (RationalQuadraticMoments.gateTrailingQ g side)
      (ActualGateConditionalScaling.gateConditionalP4Q g side e f) /
    (g.r * RationalQuadraticMoments.axisWeightQ g (2 * side.val + 1))

/-- Actual pair Gram values become rational after the two exact source
coefficient factors are included. This closes the conditional-polynomial and
outer-moment join without assuming a source identity or numerical enclosure. -/
theorem scaled_gatePairValue_eq_rational (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) (e f : PairPowers) :
    (ActualGateConditionalScaling.pairSourceScale (g.r : ℝ)
        (axisWeight g (2 * side.val)) (axisWeight g (2 * side.val + 1)) e *
      ActualGateConditionalScaling.pairSourceScale (g.r : ℝ)
        (axisWeight g (2 * side.val)) (axisWeight g (2 * side.val + 1)) f) *
      gatePairValue g side e f = (rationalGatePairValue g side e f : ℂ) := by
  have h := RationalQuadraticMoments.actual_polynomialMomentValue_eq_rational
    g hg side (ActualGateConditionalScaling.gateConditionalP4Q g side e f)
  rw [ActualGateConditionalScaling.actual_gate_conditional_scaling g hg side e f,
    polynomialMomentValue_C_mul] at h
  have hn : ((‖(nu g.power : ℂ)‖ ^ 2 : ℝ) : ℂ) =
      ((RationalQuadraticMoments.nuQ g.power ^ 2 : ℚ) : ℂ) := by
    rw [Complex.norm_real, Real.norm_eq_abs, sq_abs,
      ← RationalQuadraticMoments.nuQ_cast]
    norm_cast
  unfold gatePairValue gramMomentValue
  rw [matrix_leadingRate_eq g hg side, matrix_crossRate_eq g hg side,
    matrix_trailingRate_eq g hg side, hn]
  calc
    _ = ((RationalQuadraticMoments.nuQ g.power ^ 2 : ℚ) : ℂ) *
        ((ActualGateConditionalScaling.pairSourceScale (g.r : ℝ)
            (axisWeight g (2 * side.val)) (axisWeight g (2 * side.val + 1)) e *
          ActualGateConditionalScaling.pairSourceScale (g.r : ℝ)
            (axisWeight g (2 * side.val)) (axisWeight g (2 * side.val + 1)) f) *
          polynomialMomentValue (leadingRate g side) (crossRate g side)
            (trailingRate g side)
            (conditionalP4 e f (matrix00 g) (matrix01 g side)
              (matrix10 g side) (matrix11 g side))) := by ring
    _ = _ := by
      rw [h]
      simp only [rationalGatePairValue, Rat.cast_div, Rat.cast_mul]
      ring

theorem pairGram_eq_gatePairValue (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) (e f : PairPowers) :
    pairGram g side e f = gatePairValue g side e f := by
  unfold pairGram pairFeature gateKernel gatePairValue
  apply integral_pairing_eq_value
  · rw [matrix_leadingRate_eq g hg side]
    exact leadingRate_pos g hg side
  · rw [matrix_determinant_eq g hg side]
    exact (pair_positive g hg side).determinant

/-- Finite evaluator using the actual production polynomial's coefficients
and support, with the two independent physical pair moments multiplied. -/
def sourceNormValue (g : Gate) : ℂ :=
  ∑ e ∈ (actualSourcePolynomial g).support,
    ∑ f ∈ (actualSourcePolynomial g).support,
      (conj ((actualSourcePolynomial g).coeff e) *
        (actualSourcePolynomial g).coeff f) *
        (gatePairValue g 0 (powers e).1 (powers f).1 *
          gatePairValue g 1 (powers e).2 (powers f).2)

theorem gramValue_actual_eq_sourceNormValue (g : Gate) (hg : gateOK g = true) :
    gramValue g (actualSourcePolynomial g) = sourceNormValue g := by
  simp only [gramValue, sourceNormValue, tensorGram, pairGram_eq_gatePairValue g hg]

/-- Exact finite evaluation of the actual coherent source squared norm. -/
theorem integral_scaledTransform_sq_eq_value (g : Gate) (hg : gateOK g = true) :
    (∫ Z, ‖scaledTransform g Z‖ ^ 2 ∂tensorMeasure) = (sourceNormValue g).re := by
  rw [integral_scaledTransform_sq_eq_gram g hg, gramValue_actual_eq_sourceNormValue g hg]

theorem sourceNormValue_im_eq_zero (g : Gate) (hg : gateOK g = true) :
    (sourceNormValue g).im = 0 := by
  rw [← gramValue_actual_eq_sourceNormValue g hg]
  exact gramValue_im_eq_zero g hg _

theorem sourceNormValue_re_nonneg (g : Gate) (hg : gateOK g = true) :
    0 ≤ (sourceNormValue g).re := by
  rw [← gramValue_actual_eq_sourceNormValue g hg]
  exact gramValue_re_nonneg g hg _

/-- The remaining numerical task is an enclosure of this exact finite
expression, which controls the full actual weighted matrix energy. -/
theorem tsum_actual_matrix_energy_le_value (g : Gate) (hg : gateOK g = true) :
    (∑' mn : Idx2 × Idx2,
      energyWeight g mn.1 mn.2 * ‖matrixEntry g.power mn.1 mn.2‖ ^ 2) ≤
      (sourceNormValue g).re := by
  rw [← gramValue_actual_eq_sourceNormValue g hg]
  exact tsum_actual_matrix_energy_le_gram g hg

end
end Grothe.UpperChaos.ActualSourceNormEvaluation
