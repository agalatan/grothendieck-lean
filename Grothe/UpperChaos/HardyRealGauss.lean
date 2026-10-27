import Grothe.UpperChaos.HardyRealKernel
import Grothe.UpperChaos.Mehler
import Grothe.LowerAnalytic.GaussianRadial

/-!
# `mu2` in the real coordinates of `HholPair` (Hardy step 1(b))

`HholPair` integrates over `q = ((x, ξ), (y, η))` with `x, ξ, y, η ∈ ℝ × ℝ`, the complex points being
`toC2 x ξ = ((x₁ + iξ₁)/√2, (x₂ + iξ₂)/√2)`. Here the standard complex Gaussian pair `mu2 = gaussC ⊗ gaussC` is
written in those coordinates: for integrable `g`,

    ∫ g dmu2 = ∫_{(x, ξ)} φ₂(x) φ₂(ξ) g(toC2 x ξ) dx dξ      (`integral_mu2_eq`)

with `φ₂` the standard planar density.
-/

open MeasureTheory ProbabilityTheory Grothe.LowerAnalytic Complex

namespace Grothe.UpperChaos.HardyReal

noncomputable section

/-- The standard planar density `φ₂(x) = φ(x₁) φ(x₂)`. -/
def phi2 (x : ℝ × ℝ) : ℝ := gaussianPDFReal 0 1 x.1 * gaussianPDFReal 0 1 x.2

lemma phi2_nonneg (x : ℝ × ℝ) : 0 ≤ phi2 x := mul_nonneg (gaussianPDFReal_nonneg _ _ _) (gaussianPDFReal_nonneg _ _ _)

lemma measurable_phi2 : Measurable phi2 := by unfold phi2; fun_prop

/-- `(p₁ + i p₂)/√2`. -/
def toC' (p : ℝ × ℝ) : ℂ := ((p.1 : ℂ) + (p.2 : ℂ) * I) / ((√2 : ℝ) : ℂ)

lemma measurable_toC' : Measurable toC' := by unfold toC'; fun_prop

/-- The planar Gaussian integral of a complex function as a Lebesgue integral against the density. -/
lemma integral_gauss2_eq_complex (F : ℝ × ℝ → ℂ) :
    ∫ p, F p ∂gauss2 = ∫ p : ℝ × ℝ, (phi2 p : ℂ) * F p := by
  rw [gauss2, gaussianReal_of_var_ne_zero 0 one_ne_zero,
    MeasureTheory.prod_withDensity (measurable_gaussianPDF 0 1) (measurable_gaussianPDF 0 1),
    integral_withDensity_eq_integral_toReal_smul (by fun_prop)
      (Filter.Eventually.of_forall fun p => ENNReal.mul_lt_top gaussianPDF_lt_top gaussianPDF_lt_top),
    ← Measure.volume_eq_prod]
  congr 1; ext p
  rw [ENNReal.toReal_mul, toReal_gaussianPDF, toReal_gaussianPDF, Complex.real_smul, phi2]

/-- `gaussC` is the image of the planar Gaussian under `toC'`. -/
lemma gaussC_eq_map : gaussC = gauss2.map toC' := by
  have e : gauss2 = (Measure.pi fun _ : Fin 2 => gaussianReal 0 1).map MeasurableEquiv.finTwoArrow :=
    (measurePreserving_finTwoArrow (gaussianReal 0 1)).map_eq.symm
  rw [gaussC, Grothe.LowerAnalytic.stdGaussian, e,
    Measure.map_map measurable_toC' (MeasurableEquiv.finTwoArrow).measurable]
  congr 1

lemma integral_gaussC_eq (h : ℂ → ℂ) (hm : AEStronglyMeasurable h gaussC) :
    ∫ z, h z ∂gaussC = ∫ p : ℝ × ℝ, (phi2 p : ℂ) * h (toC' p) := by
  rw [← integral_gauss2_eq_complex]
  rw [gaussC_eq_map] at hm ⊢
  exact integral_map measurable_toC'.aemeasurable hm

/-- The coordinate shuffle `((a, b), (c, d)) ↦ ((a, c), (b, d))`. -/
def shuffle {α : Type*} (q : (α × α) × (α × α)) : (α × α) × (α × α) := ((q.1.1, q.2.1), (q.1.2, q.2.2))

lemma measurePreserving_shuffle :
    MeasurePreserving (shuffle : (ℝ × ℝ) × (ℝ × ℝ) → _) volume volume := by
  have h1 := measurePreserving_prodAssoc (volume : Measure ℝ) (volume : Measure ℝ) (volume : Measure (ℝ × ℝ))
  have h2 := measurePreserving_prodAssoc (volume : Measure ℝ) (volume : Measure ℝ) (volume : Measure ℝ)
  have hsw := (Measure.measurePreserving_swap (μ := (volume : Measure ℝ)) (ν := (volume : Measure ℝ))).prod
    (MeasurePreserving.id (volume : Measure ℝ))
  have inner := (h2.comp hsw).comp h2.symm
  have h3 := (MeasurePreserving.id (volume : Measure ℝ)).prod inner
  have h4 := measurePreserving_prodAssoc (volume : Measure ℝ) (volume : Measure ℝ) (volume : Measure (ℝ × ℝ))
  have := (h4.symm.comp h3).comp h1
  simp only [← Measure.volume_eq_prod] at this
  convert this using 1
  ext q <;> rfl

end

end Grothe.UpperChaos.HardyReal
