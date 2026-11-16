import Grothe.LowerAnalytic.ComplexGaussianCore

/-!
# The reflections of the standard complex Gaussian

The standard complex Gaussian `gaussC` is invariant under the maps `z ↦ z̄` and `z ↦ −z`
(`gaussC_map_conj`, `gaussC_map_neg`); `integral_gaussC_comp` is the integral form.  Both maps are
sign changes of the two real coordinates of the planar Gaussian (`stdGaussian_two_map_coord`,
`gaussC_map_of`).

This module imports `ComplexGaussianCore` only.  It is used by the lower bound (the symmetries of
the fibre potential, `CapSymmetry.lean`) and by the upper bound (`UpperChaos/F0ConditionalReality.lean`),
and it keeps the upper-bound modules independent of the witness and fibre chain of the lower bound.
-/

open MeasureTheory ProbabilityTheory Real Set
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### Invariance of the Gaussian -/

/-- The coordinatewise sign maps `x ↦ x`, `x ↦ −x` on `Fin 2 → ℝ`. -/
lemma stdGaussian_two_map_coord (f : Fin 2 → ℝ → ℝ) (hm : ∀ i, Measurable (f i))
    (hf : ∀ i, (gaussianReal 0 1).map (f i) = gaussianReal 0 1) :
    (stdGaussian 2).map (fun x i => f i (x i)) = stdGaussian 2 := by
  unfold stdGaussian
  rw [Measure.pi_map_pi (hμ := fun i => by rw [hf i]; infer_instance) (fun i => (hm i).aemeasurable)]
  simp only [hf]

lemma gaussianReal_map_neg_std : (gaussianReal 0 1).map (fun x : ℝ => -x) = gaussianReal 0 1 := by
  rw [gaussianReal_map_neg, neg_zero]

/-- The sign pattern of `z ↦ z̄`. -/
def sgnC : Fin 2 → ℝ → ℝ := ![fun x => x, fun x => -x]
/-- The sign pattern of `z ↦ −z`. -/
def sgnN : Fin 2 → ℝ → ℝ := ![fun x => -x, fun x => -x]

lemma toC_sgnC (x : Fin 2 → ℝ) : toC (fun i => sgnC i (x i)) = conj (toC x) := by
  simp [toC, sgnC, map_div₀, Complex.conj_ofReal]

lemma toC_sgnN (x : Fin 2 → ℝ) : toC (fun i => sgnN i (x i)) = -toC x := by
  simp [toC, sgnN]; ring

lemma measurable_sgnC (i : Fin 2) : Measurable (sgnC i) := by
  fin_cases i <;> simp [sgnC] <;> fun_prop

lemma measurable_sgnN (i : Fin 2) : Measurable (sgnN i) := by
  fin_cases i <;> simp [sgnN] <;> fun_prop

lemma map_sgnC (i : Fin 2) : (gaussianReal 0 1).map (sgnC i) = gaussianReal 0 1 := by
  fin_cases i
  · simp [sgnC, Measure.map_id']
  · simpa [sgnC] using gaussianReal_map_neg_std

lemma map_sgnN (i : Fin 2) : (gaussianReal 0 1).map (sgnN i) = gaussianReal 0 1 := by
  fin_cases i <;> simpa [sgnN] using gaussianReal_map_neg_std

lemma gaussC_map_of (g : ℂ → ℂ) (hg : Measurable g) (f : Fin 2 → ℝ → ℝ) (hm : ∀ i, Measurable (f i))
    (hf : ∀ i, (gaussianReal 0 1).map (f i) = gaussianReal 0 1)
    (hgt : ∀ x, toC (fun i => f i (x i)) = g (toC x)) : gaussC.map g = gaussC := by
  have hmf : Measurable (fun (x : Fin 2 → ℝ) i => f i (x i)) :=
    measurable_pi_iff.mpr fun i => (hm i).comp (measurable_pi_apply i)
  have h1 : g ∘ toC = toC ∘ (fun x i => f i (x i)) := funext fun x => (hgt x).symm
  rw [gaussC, Measure.map_map hg measurable_toC, h1, ← Measure.map_map measurable_toC hmf,
    stdGaussian_two_map_coord f hm hf]

/-- **`gaussC` is invariant under `z ↦ z̄`.** -/
theorem gaussC_map_conj : gaussC.map (fun z => conj z) = gaussC :=
  gaussC_map_of _ Complex.continuous_conj.measurable sgnC measurable_sgnC map_sgnC toC_sgnC

/-- **`gaussC` is invariant under `z ↦ −z`.** -/
theorem gaussC_map_neg : gaussC.map (fun z => -z) = gaussC :=
  gaussC_map_of _ measurable_neg sgnN measurable_sgnN map_sgnN toC_sgnN

lemma integral_gaussC_comp (g : ℂ → ℂ) (hg : Continuous g) (hmap : gaussC.map g = gaussC)
    (F : ℂ → ℝ) (hF : Continuous F) : ∫ z, F (g z) ∂gaussC = ∫ z, F z ∂gaussC := by
  conv_rhs => rw [← hmap]
  rw [integral_map hg.measurable.aemeasurable hF.aestronglyMeasurable]

end

end Grothe.LowerAnalytic
