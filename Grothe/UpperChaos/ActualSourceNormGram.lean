import Grothe.UpperChaos.ActualGateMatrixCoefficients

/-!
# Finite Gram formula for the actual coherent source norm

Agent-ID: codex-2ca4.

Complete WIP proof bodies; compilation remains pending.

The exact production source polynomial supplies both finite supports and
coefficients. Polarization retains every cross term. Each Gram entry factors
over the two physical pairs; its correlated pair-moment evaluation remains
separate from this finite assembly theorem.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.ActualSourceNormGram

open BipartitePolynomialL2 ScaledActualCoherentL2
open ActualTaylorFiniteCoefficients ActualGateMatrixWeights ActualGateMatrixCoefficients
open OriginalHSParameterGates

noncomputable section

def pairFeature (g : Gate) (side : Fin 2) (e : PairPowers) (z : PairSources) : ℂ :=
  BipartitePolynomialL2.monomial e z * gateKernel g side z

def pairGram (g : Gate) (side : Fin 2) (e f : PairPowers) : ℂ :=
  ∫ z, conj (pairFeature g side e z) * pairFeature g side f z ∂pairMeasure

def tensorFeature (g : Gate) (e : TensorPowers) (Z : TensorSources) : ℂ :=
  tensorMonomial e Z * tensorKernel g Z

def tensorGram (g : Gate) (e f : TensorPowers) : ℂ :=
  pairGram g 0 e.1 f.1 * pairGram g 1 e.2 f.2

theorem integrable_tensor_cross (g : Gate) (hg : gateOK g = true)
    (e f : TensorPowers) :
    Integrable (fun Z => conj (tensorFeature g e Z) * tensorFeature g f Z)
      tensorMeasure := by
  exact ((memLp_tensor_monomial e g hg).star.integrable_mul
    (memLp_tensor_monomial f g hg)).congr
      (Filter.Eventually.of_forall fun Z => rfl)

/-- Independence of the two physical pairs factors the full Gram entry,
while retaining both one-pair Gaussian masses. -/
theorem integral_tensor_cross (g : Gate) (e f : TensorPowers) :
    (∫ Z, conj (tensorFeature g e Z) * tensorFeature g f Z ∂tensorMeasure) =
      tensorGram g e f := by
  have hp (Z : TensorSources) :
      conj (tensorFeature g e Z) * tensorFeature g f Z =
        (conj (pairFeature g 0 e.1 Z.1) * pairFeature g 0 f.1 Z.1) *
          (conj (pairFeature g 1 e.2 Z.2) * pairFeature g 1 f.2 Z.2) := by
    simp only [tensorFeature, pairFeature, tensorMonomial, tensorKernel, map_mul]
    ring
  simp_rw [hp]
  exact integral_prod_mul (μ := pairMeasure) (ν := pairMeasure)
    (fun z : PairSources => conj (pairFeature g 0 e.1 z) * pairFeature g 0 f.1 z)
    (fun z : PairSources => conj (pairFeature g 1 e.2 z) * pairFeature g 1 f.2 z)

/-- Exact finite quadratic form; off-diagonal cross terms are preserved. -/
def gramValue (g : Gate) (P : SourcePolynomial) : ℂ :=
  ∑ e ∈ P.support, ∑ f ∈ P.support,
    (conj (P.coeff e) * P.coeff f) * tensorGram g (powers e) (powers f)

private theorem eval_kernel_eq_features (g : Gate) (P : SourcePolynomial)
    (Z : TensorSources) :
    MvPolynomial.eval (coordinates Z) P * tensorKernel g Z =
      ∑ e ∈ P.support, P.coeff e * tensorFeature g (powers e) Z := by
  rw [eval_eq_support, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro e _
  simp only [tensorFeature, mul_assoc]

private theorem squared_eval_eq_cross_sum (g : Gate) (P : SourcePolynomial)
    (Z : TensorSources) :
    ((‖MvPolynomial.eval (coordinates Z) P * tensorKernel g Z‖ ^ 2 : ℝ) : ℂ) =
      ∑ e ∈ P.support, ∑ f ∈ P.support,
        (conj (P.coeff e) * P.coeff f) *
          (conj (tensorFeature g (powers e) Z) * tensorFeature g (powers f) Z) := by
  have hn (z : ℂ) : ((‖z‖ ^ 2 : ℝ) : ℂ) = conj z * z := by
    simpa only [Complex.ofReal_pow] using (Complex.conj_mul' z).symm
  rw [hn, eval_kernel_eq_features]
  simp only [map_sum, map_mul, Finset.sum_mul, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro e _
  apply Finset.sum_congr rfl
  intro f _
  ring

/-- Source integration of a finite polynomial norm is its exact Gram form.
The gate supplies cross-term integrability, rather than assuming it. -/
theorem complex_integral_eval_sq_eq_gram (g : Gate) (hg : gateOK g = true)
    (P : SourcePolynomial) :
    ((∫ Z, ‖MvPolynomial.eval (coordinates Z) P * tensorKernel g Z‖ ^ 2
      ∂tensorMeasure : ℝ) : ℂ) = gramValue g P := by
  classical
  rw [← integral_complex_ofReal]
  simp_rw [squared_eval_eq_cross_sum]
  rw [integral_finsetSum _ fun e _ => integrable_finsetSum _ fun f _ =>
    (integrable_tensor_cross g hg (powers e) (powers f)).const_mul
      (conj (P.coeff e) * P.coeff f)]
  unfold gramValue
  apply Finset.sum_congr rfl
  intro e _
  rw [integral_finsetSum _ fun f _ =>
    (integrable_tensor_cross g hg (powers e) (powers f)).const_mul
      (conj (P.coeff e) * P.coeff f)]
  apply Finset.sum_congr rfl
  intro f _
  rw [integral_const_mul, integral_tensor_cross]

theorem integral_eval_sq_eq_gram_re (g : Gate) (hg : gateOK g = true)
    (P : SourcePolynomial) :
    (∫ Z, ‖MvPolynomial.eval (coordinates Z) P * tensorKernel g Z‖ ^ 2
      ∂tensorMeasure) = (gramValue g P).re := by
  have h := congrArg Complex.re (complex_integral_eval_sq_eq_gram g hg P)
  simpa only [Complex.ofReal_re] using h

/-- The quadratic form is real, as required by a squared-norm certificate. -/
theorem gramValue_im_eq_zero (g : Gate) (hg : gateOK g = true)
    (P : SourcePolynomial) : (gramValue g P).im = 0 := by
  have h := congrArg Complex.im (complex_integral_eval_sq_eq_gram g hg P)
  simpa only [Complex.ofReal_im] using h.symm

theorem gramValue_re_nonneg (g : Gate) (hg : gateOK g = true)
    (P : SourcePolynomial) : 0 ≤ (gramValue g P).re := by
  rw [← integral_eval_sq_eq_gram_re g hg P]
  exact integral_nonneg fun Z => sq_nonneg _

/-- This is the actual production source norm, with no replacement source
polynomial and no assumed coefficient identification. -/
theorem integral_scaledTransform_sq_eq_gram (g : Gate) (hg : gateOK g = true) :
    (∫ Z, ‖scaledTransform g Z‖ ^ 2 ∂tensorMeasure) =
      (gramValue g (actualSourcePolynomial g)).re := by
  simp_rw [scaledTransform_eq g hg]
  exact integral_eval_sq_eq_gram_re g hg (actualSourcePolynomial g)

/-- The complete actual matrix energy reduces to the actual source Gram form.
Its numerical enclosure remains a separate concrete certificate obligation. -/
theorem tsum_actual_matrix_energy_le_gram (g : Gate) (hg : gateOK g = true) :
    (∑' mn : Idx2 × Idx2,
      energyWeight g mn.1 mn.2 * ‖matrixEntry g.power mn.1 mn.2‖ ^ 2) ≤
      (gramValue g (actualSourcePolynomial g)).re := by
  exact (tsum_actual_matrix_energy_le g hg).trans_eq
    (integral_scaledTransform_sq_eq_gram g hg)

end
end Grothe.UpperChaos.ActualSourceNormGram
