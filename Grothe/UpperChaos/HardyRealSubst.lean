import Grothe.UpperChaos.HardyRealGauss

/-!
# The substitution `y = Rx + Sw` (Hardy step 1(b))

For the lower-triangular Cholesky factor `S` of `K = I − R²` (`det S = s₁₁ s₂₂ > 0`):

    ∫ φ₂(ω) g(Rx + Sω) dω = (s₁₁ s₂₂)⁻¹ ∫ φ₂(S⁻¹(y − Rx)) g(y) dy          (`integral_subst`)
-/

open MeasureTheory Complex

namespace Grothe.UpperChaos.HardyReal

noncomputable section

variable {a b c : ℝ}

/-- `S` as a linear map of `ℝ × ℝ`. -/
def linS (a b c : ℝ) : (ℝ × ℝ) →ₗ[ℝ] (ℝ × ℝ) where
  toFun := mulS a b c
  map_add' u v := by ext <;> simp [mulS] <;> ring
  map_smul' r u := by ext <;> simp [mulS] <;> ring

lemma det_linS : LinearMap.det (linS a b c) = s11 a b * s22 a b c := by
  rw [← LinearMap.det_toMatrix (Module.Basis.finTwoProd ℝ), Matrix.det_fin_two]
  simp [LinearMap.toMatrix_apply, linS, mulS, Module.Basis.finTwoProd, LinearEquiv.finTwoArrow]

lemma measurable_solveS : Measurable (solveS a b c) := by unfold solveS; fun_prop

lemma measurable_mulR : Measurable (mulR a b c) := by unfold mulR; fun_prop

/-- **The substitution** `y = Rx + Sω`. -/
theorem integral_subst (h : 0 < k11 a b) (hd : 0 < kdet a b c) (x : ℝ × ℝ) {g : ℝ × ℝ → ℂ}
    (hg : Measurable g) :
    ∫ ω : ℝ × ℝ, (phi2 ω : ℂ) * g (mulR a b c x + mulS a b c ω) =
      ((s11 a b * s22 a b c)⁻¹ : ℝ) * ∫ y : ℝ × ℝ, (phi2 (solveS a b c (y - mulR a b c x)) : ℂ) * g y := by
  have hdet : LinearMap.det (linS a b c) ≠ 0 := by
    rw [det_linS]; exact (mul_pos (s11_pos h) (s22_pos h hd)).ne'
  have hpos : 0 < s11 a b * s22 a b c := mul_pos (s11_pos h) (s22_pos h hd)
  set G : ℝ × ℝ → ℂ := fun v => (phi2 (solveS a b c v) : ℂ) * g (mulR a b c x + v) with hG
  have e1 : (fun ω => (phi2 ω : ℂ) * g (mulR a b c x + mulS a b c ω)) = fun ω => G (linS a b c ω) := by
    ext ω; simp only [hG, linS, LinearMap.coe_mk, AddHom.coe_mk, solveS_mulS h hd]
  have hmap := Measure.map_linearMap_addHaar_eq_smul_addHaar (volume : Measure (ℝ × ℝ)) hdet
  have e2 : ∫ ω, G (linS a b c ω) = ((s11 a b * s22 a b c)⁻¹ : ℝ) * ∫ v, G v := by
    have hm : Measurable (linS a b c) := (linS a b c).continuous_of_finiteDimensional.measurable
    have hGm : AEStronglyMeasurable G (Measure.map (linS a b c) volume) :=
      ((measurable_phi2.comp measurable_solveS).complex_ofReal.mul
        (hg.comp (measurable_const_add _))).aestronglyMeasurable
    rw [← integral_map hm.aemeasurable hGm, hmap, integral_smul_measure, det_linS,
      ENNReal.toReal_ofReal (abs_nonneg _), abs_of_pos (inv_pos.2 hpos), Complex.real_smul]
  rw [e1, e2]
  congr 1
  rw [← integral_add_right_eq_self (μ := volume) (fun y => (phi2 (solveS a b c (y - mulR a b c x)) : ℂ) * g y)
    (mulR a b c x)]
  congr 1; ext v; rw [add_sub_cancel_right, add_comm v (mulR a b c x)]

end

end Grothe.UpperChaos.HardyReal
