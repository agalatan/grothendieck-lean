import Grothe.UpperChaos.Charge

/-!
# Two standard complex Gaussians as four real ones

`mu2 = gaussC ⊗ gaussC` is the image of the standard Gaussian on `ℝ⁴` under
`e2 x = ((x₀ + i x₁)/√2, (x₂ + i x₃)/√2)` (`map_e2`), and `e2` is a measurable embedding with
inverse `fromC2` (`measurableEmbedding_e2`).
-/

open MeasureTheory ProbabilityTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- `x ↦ ((x₀ + i x₁)/√2, (x₂ + i x₃)/√2)`. -/
def e2 (x : Fin 4 → ℝ) : ℂ × ℂ := (toC ![x 0, x 1], toC ![x 2, x 3])

/-- The inverse of `e2`. -/
def fromC2 (u : ℂ × ℂ) : Fin 4 → ℝ :=
  ![fromC u.1 0, fromC u.1 1, fromC u.2 0, fromC u.2 1]

lemma fromC2_e2 (x : Fin 4 → ℝ) : fromC2 (e2 x) = x := by
  ext i
  fin_cases i <;> simp [fromC2, e2, fromC_toC]

lemma e2_fromC2 (u : ℂ × ℂ) : e2 (fromC2 u) = u := by
  have h1 : ![fromC u.1 0, fromC u.1 1] = fromC u.1 := by ext j; fin_cases j <;> rfl
  have h2 : ![fromC u.2 0, fromC u.2 1] = fromC u.2 := by ext j; fin_cases j <;> rfl
  simp only [e2, fromC2]
  simp [h1, h2, toC_fromC]

lemma measurable_e2 : Measurable e2 := by
  unfold e2
  refine Measurable.prodMk (measurable_toC.comp ?_) (measurable_toC.comp ?_) <;>
    · refine measurable_pi_iff.2 fun j => ?_
      fin_cases j <;> simp <;> exact measurable_pi_apply _

lemma measurable_fromC2 : Measurable fromC2 := by
  unfold fromC2 fromC
  refine measurable_pi_iff.2 fun i => ?_
  fin_cases i <;> simp <;> fun_prop

lemma measurableEmbedding_e2 : MeasurableEmbedding e2 := by
  refine MeasurableEmbedding.of_measurable_inverse measurable_e2 ?_ measurable_fromC2 fromC2_e2
  rw [Set.range_eq_univ.2 fun u => ⟨fromC2 u, e2_fromC2 u⟩]; exact MeasurableSet.univ

/-- The four real coordinates split as two pairs. -/
def split4 : (Fin 4 → ℝ) ≃ᵐ (Fin 2 → ℝ) × (Fin 2 → ℝ) :=
  (MeasurableEquiv.piCongrLeft (fun _ => ℝ) (finSumFinEquiv (m := 2) (n := 2))).symm.trans
    (MeasurableEquiv.sumPiEquivProdPi fun _ => ℝ)

lemma split4_apply (x : Fin 4 → ℝ) : split4 x = (![x 0, x 1], ![x 2, x 3]) := by
  ext j <;> fin_cases j <;> rfl

lemma map_split4 : (stdGaussian 4).map split4 = (stdGaussian 2).prod (stdGaussian 2) := by
  have h1 := (measurePreserving_piCongrLeft (fun _ : Fin 4 => gaussianReal 0 1)
    (finSumFinEquiv (m := 2) (n := 2))).symm
  have h2 := measurePreserving_sumPiEquivProdPi (fun _ : Fin 2 ⊕ Fin 2 => gaussianReal 0 1)
  exact (h1.trans h2).map_eq

/-- **`gaussC ⊗ gaussC` is the image of the standard Gaussian on `ℝ⁴`.** -/
theorem map_e2 : (stdGaussian 4).map e2 = mu2 := by
  have he : e2 = Prod.map toC toC ∘ split4 := by
    funext x; rw [Function.comp_apply, split4_apply]; rfl
  rw [he, ← Measure.map_map (measurable_toC.prodMap measurable_toC) split4.measurable, map_split4,
    ← Measure.map_prod_map _ _ measurable_toC measurable_toC]
  rfl

end

end Grothe.UpperChaos
