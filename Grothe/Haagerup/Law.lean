import Grothe.Haagerup.GaussG

/-!
# Four orthonormal coordinates of the standard Gaussian

For a real orthonormal family `v : Fin 4 → E` in a finite-dimensional real inner product space,
the coordinates `((⟪v₀,g⟫, ⟪v₁,g⟫), (⟪v₂,g⟫, ⟪v₃,g⟫))` of `g ~ stdGaussian E` are four independent
standard Gaussians: `(stdGaussian E).map (coords4 v) = g4` (`map_coords4`), by comparing
characteristic functions (`exp(−‖L ∘ T‖²/2)` against the product of four one-dimensional ones).
-/

namespace Grothe.Haag

open MeasureTheory ProbabilityTheory Real Complex
open scoped RealInnerProductSpace

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- The four coordinates. -/
def coords4 (v : Fin 4 → E) : E →L[ℝ] (ℝ × ℝ) × (ℝ × ℝ) :=
  ((innerSL ℝ (v 0)).prod (innerSL ℝ (v 1))).prod ((innerSL ℝ (v 2)).prod (innerSL ℝ (v 3)))

omit [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] in
lemma coords4_apply (v : Fin 4 → E) (g : E) :
    coords4 v g = ((⟪v 0, g⟫, ⟪v 1, g⟫), (⟪v 2, g⟫, ⟪v 3, g⟫)) := rfl

/-- `charFunDual` of a measure on `ℝ`. -/
lemma charFunDual_real (μ : Measure ℝ) (ℓ : StrongDual ℝ ℝ) :
    charFunDual μ ℓ = charFun μ (ℓ 1) := by
  rw [charFunDual_apply, charFun_apply_real]
  congr 1
  funext x
  congr 2
  have : ℓ x = x * ℓ 1 := by
    rw [← smul_eq_mul, ← ℓ.map_smul, smul_eq_mul, mul_one]
  rw [this]; push_cast; ring

lemma charFunDual_std (ℓ : StrongDual ℝ ℝ) :
    charFunDual (gaussianReal 0 1) ℓ = cexp (-(((ℓ 1 : ℝ) : ℂ) ^ 2 / 2)) := by
  rw [charFunDual_real, charFun_gaussianReal]
  congr 1
  push_cast
  ring

/-- A functional on `(ℝ × ℝ) × (ℝ × ℝ)` in coordinates. -/
lemma dual_apply4 (L : StrongDual ℝ ((ℝ × ℝ) × (ℝ × ℝ))) (p : (ℝ × ℝ) × (ℝ × ℝ)) :
    L p = p.1.1 * L ((1, 0), (0, 0)) + p.1.2 * L ((0, 1), (0, 0))
      + p.2.1 * L ((0, 0), (1, 0)) + p.2.2 * L ((0, 0), (0, 1)) := by
  have e : p = p.1.1 • (((1, 0), (0, 0)) : (ℝ × ℝ) × (ℝ × ℝ)) + p.1.2 • ((0, 1), (0, 0))
      + p.2.1 • ((0, 0), (1, 0)) + p.2.2 • ((0, 0), (0, 1)) := by
    ext <;> simp
  conv_lhs => rw [e]
  simp only [map_add, map_smul, smul_eq_mul]

theorem map_coords4 (v : Fin 4 → E) (hv : Orthonormal ℝ v) :
    (stdGaussian E).map (coords4 v) = g4 := by
  apply Measure.ext_of_charFunDual
  funext L
  rw [charFunDual_map, charFunDual_stdGaussian, charFunDual_prod, charFunDual_prod,
    charFunDual_prod, charFunDual_std, charFunDual_std, charFunDual_std, charFunDual_std]
  set c : Fin 4 → ℝ := ![L ((1, 0), (0, 0)), L ((0, 1), (0, 0)), L ((0, 0), (1, 0)),
    L ((0, 0), (0, 1))] with hc
  set a : E := ∑ i, c i • v i with ha
  have hLT : L.comp (coords4 v) = innerSL ℝ a := by
    ext g
    rw [ContinuousLinearMap.comp_apply, dual_apply4, coords4_apply, innerSL_apply_apply, ha,
      sum_inner, Fin.sum_univ_four]
    simp only [real_inner_smul_left, hc, Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.cons_val_two, Matrix.cons_val_three, Matrix.head_cons, Matrix.tail_cons]
    ring
  have hnorm : ‖a‖ ^ 2 = ∑ i, c i ^ 2 := by
    rw [← real_inner_self_eq_norm_sq, ha, sum_inner]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [real_inner_smul_left, hv.inner_right_fintype, sq]
  rw [hLT, innerSL_apply_norm, ← Complex.ofReal_pow, hnorm, Fin.sum_univ_four]
  simp only [ContinuousLinearMap.comp_apply, ContinuousLinearMap.inl_apply, hc,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two, Matrix.cons_val_three,
    Matrix.head_cons, Matrix.tail_cons, ContinuousLinearMap.inr_apply]
  rw [← Complex.exp_add, ← Complex.exp_add, ← Complex.exp_add]
  simp only [Prod.mk_zero_zero]
  congr 1
  push_cast
  ring

/-- Integrals of functions of the four coordinates. -/
theorem integral_coords4 (v : Fin 4 → E) (hv : Orthonormal ℝ v) {F : (ℝ × ℝ) × (ℝ × ℝ) → ℂ}
    (hF : Measurable F) :
    ∫ g, F (coords4 v g) ∂stdGaussian E = ∫ p, F p ∂g4 := by
  rw [← map_coords4 v hv, integral_map (coords4 v).continuous.aemeasurable
    hF.aestronglyMeasurable]

end

end Grothe.Haag
