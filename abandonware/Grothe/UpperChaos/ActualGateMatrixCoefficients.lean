import Grothe.UpperChaos.ActualProductionMomentCoefficients
import Grothe.UpperChaos.ActualGateCoefficientWeights

/-!
# Coherent coefficients of the actual weighted Hermite matrix

Agent-ID: codex-2ca4.

Finite physical polynomial linearity closes the coefficient-to-matrix join.
The source weights and all eight factorial factors are identified exactly.
The resulting Bessel bound still requires a numerical source-norm bound before
it can discharge an actual Hilbert--Schmidt cap.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.ActualGateMatrixCoefficients

open ActualTaylorCoherent IndependentSourceMoments PhysicalGateJets
open ActualTaylorFiniteCoefficients ActualProductionMomentCoefficients
open ActualTensorMomentCoefficients ActualGateMatrixWeights
open ActualGateCoefficientWeights ScaledActualCoherentL2
open GaussianFockBessel OriginalHSParameterGates

noncomputable section

private theorem ev4_eq_support (P : P4) (zw : ℂ × ℂ) :
    ev4 zw P = ∑ e ∈ P.support, P.coeff e *
      ((zw.1 ^ e 0 * conj zw.1 ^ e 1) * (zw.2 ^ e 2 * conj zw.2 ^ e 3)) := by
  classical
  have h := congrArg (fun Q : P4 => ev4 zw Q) P.as_sum
  simp only [ev4, map_sum] at h
  change ev4 zw P = ∑ e ∈ P.support, ev4 zw (monomial e (P.coeff e)) at h
  simpa only [ev4_monomial] using h

/-- The physical monomial expansion retains the production damping twice,
once for each Gaussian coordinate. -/
theorem taylorPhasePower_eq_monomial_sum (j : ℕ) (zw : ℂ × ℂ) :
    taylorPhasePower j zw =
      ∑ e ∈ (multiplierPolynomial j).support,
        (multiplierPolynomial j).coeff e *
          (integrand (rate j) 0 0 (e 0) (e 1) zw.1 *
            integrand (rate j) 0 0 (e 2) (e 3) zw.2) := by
  rw [taylorPhasePower_eq_polynomial, ev4_eq_support]
  simp only [Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro e _
  simp only [integrand, zero_mul, add_zero]
  ring

def physicalMomentIntegrand (g : Gate) (e : Fin 4 → ℕ) (m n : Idx2)
    (zw : ℂ × ℂ) : ℂ :=
  integrand (rate g.power) 0 0 (e 0) (e 1) zw.1 *
    integrand (rate g.power) 0 0 (e 2) (e 3) zw.2 *
      conj (H2 m zw) * H2 n zw

/-- Each physical monomial with both Hermite factors is absolutely
integrable, independently of any numerical phase or source-norm cap. -/
theorem integrable_physicalMomentIntegrand (g : Gate) (e : Fin 4 → ℕ)
    (m n : Idx2) : Integrable (physicalMomentIntegrand g e m n) mu2 := by
  have h₁ := integrable_physical_Hermite_product
    (e 0) (e 1) m.1.1 m.1.2 n.1.1 n.1.2 (rate_pos g.power)
  have h₂ := integrable_physical_Hermite_product
    (e 2) (e 3) m.2.1 m.2.2 n.2.1 n.2.2 (rate_pos g.power)
  refine (h₁.mul_prod h₂).congr (Filter.Eventually.of_forall fun zw => ?_)
  simp only [physicalMomentIntegrand, H2, map_mul]
  ring

/-- Finite integration of the actual physical polynomial gives its actual
unnormalized Hermite matrix entry. No source/physical Fubini is used. -/
theorem integral_actual_multiplier_eq_sum (g : Gate) (m n : Idx2) :
    (∫ zw, conj (H2 m zw) * taylorPhasePower g.power zw * H2 n zw ∂mu2) =
      ∑ e ∈ (multiplierPolynomial g.power).support,
        (multiplierPolynomial g.power).coeff e *
          tensorPhysicalMoment g (fun k => e k) m n := by
  classical
  have hp (zw : ℂ × ℂ) :
      conj (H2 m zw) * taylorPhasePower g.power zw * H2 n zw =
        ∑ e ∈ (multiplierPolynomial g.power).support,
          (multiplierPolynomial g.power).coeff e *
            physicalMomentIntegrand g (fun k => e k) m n zw := by
    rw [taylorPhasePower_eq_monomial_sum]
    simp only [Finset.mul_sum, Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro e _
    unfold physicalMomentIntegrand
    ring
  simp_rw [hp]
  rw [integral_finsetSum _ fun e _ =>
    (integrable_physicalMomentIntegrand g (fun k => e k) m n).const_mul
      ((multiplierPolynomial g.power).coeff e)]
  simp only [integral_const_mul, physicalMomentIntegrand, tensorPhysicalMoment]

/-- Every actual gate coefficient is the corresponding actual matrix entry
with the exact outgoing and incoming source scales. -/
theorem coefficient8_scaledTransform_eq_weightedMatrixEntry (g : Gate)
    (hg : gateOK g = true) (m n : Idx2) :
    coefficient8 (scaledTransform g) (gateMatrixIndexEquiv (m, n)) =
      weightedMatrixEntry g m n := by
  rw [coefficient8_scaledTransform_eq_physical g hg,
    tensorNormalization_eq_nrm2, tensorSourceWeight_eq_sourceWeight,
    weightedMatrixEntry, matrixEntry_eq_unnormalized,
    integral_actual_multiplier_eq_sum]
  ring

/-- The complete weighted matrix energy is summable, so its infinite sum is
not relying on the default value assigned to a divergent series. -/
theorem summable_weightedMatrixEntry_sq (g : Gate) (hg : gateOK g = true) :
    Summable (fun mn : Idx2 × Idx2 => ‖weightedMatrixEntry g mn.1 mn.2‖ ^ 2) := by
  have hF := memLp_scaledTransform g hg
  have ho := orthonormal_monomialVector8.comp
    gateMatrixIndexEquiv gateMatrixIndexEquiv.injective
  have h : Summable (fun mn : Idx2 × Idx2 =>
      ‖coefficient8 (scaledTransform g) (gateMatrixIndexEquiv mn)‖ ^ 2) := by
    simpa only [Function.comp_apply, inner_monomialVector8 hF] using
      ho.inner_products_summable (hF.toLp (scaledTransform g))
  simpa only [coefficient8_scaledTransform_eq_weightedMatrixEntry g hg] using h

/-- Bessel controls the full actual weighted Hermite matrix by the source
integral of the actual coherent transform. -/
theorem tsum_weightedMatrixEntry_sq_le (g : Gate) (hg : gateOK g = true) :
    (∑' mn : Idx2 × Idx2, ‖weightedMatrixEntry g mn.1 mn.2‖ ^ 2) ≤
      ∫ Z, ‖scaledTransform g Z‖ ^ 2 ∂sourceMeasure8 := by
  have h := tsum_gate_coefficient_sq_le (memLp_scaledTransform g hg)
  simpa only [coefficient8_scaledTransform_eq_weightedMatrixEntry g hg] using h

/-- The exact real gate energy weights appear in the complete matrix sum.
A numerical bound for the right-hand side remains a separate obligation. -/
theorem tsum_actual_matrix_energy_le (g : Gate) (hg : gateOK g = true) :
    (∑' mn : Idx2 × Idx2,
      energyWeight g mn.1 mn.2 * ‖matrixEntry g.power mn.1 mn.2‖ ^ 2) ≤
      ∫ Z, ‖scaledTransform g Z‖ ^ 2 ∂sourceMeasure8 := by
  simpa only [norm_weightedMatrixEntry_sq g hg] using
    tsum_weightedMatrixEntry_sq_le g hg

/-- Every finite production matrix block inherits the same source bound. -/
theorem finite_actual_matrix_energy_le (g : Gate) (hg : gateOK g = true)
    (s : Finset (Idx2 × Idx2)) :
    (∑ mn ∈ s,
      energyWeight g mn.1 mn.2 * ‖matrixEntry g.power mn.1 mn.2‖ ^ 2) ≤
      ∫ Z, ‖scaledTransform g Z‖ ^ 2 ∂sourceMeasure8 := by
  have hs := (summable_weightedMatrixEntry_sq g hg).sum_le_tsum s
    (fun mn _ => sq_nonneg ‖weightedMatrixEntry g mn.1 mn.2‖)
  have h := hs.trans (tsum_weightedMatrixEntry_sq_le g hg)
  simpa only [norm_weightedMatrixEntry_sq g hg] using h

end
end Grothe.UpperChaos.ActualGateMatrixCoefficients
