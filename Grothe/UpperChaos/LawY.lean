import Grothe.UpperChaos.Mehler

/-!
# The law of the complex Mehler mixture

For `|ρ| ≤ 1`, the linear combination `ρX + √(1 − |ρ|²) W` of independent standard
complex Gaussians is standard complex Gaussian (`map_mehlerY`). The characteristic function
of `gaussC` follows from its two independent real Gaussian coordinates. The mixture law then
follows from the characteristic function of a product measure and `|ρ|² + σ² = 1`.
-/

open MeasureTheory ProbabilityTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

private def toCL : (Fin 2 → ℝ) →L[ℝ] ℂ :=
  LinearMap.toContinuousLinearMap
    { toFun := toC
      map_add' := fun x y => by simp [toC]; ring
      map_smul' := fun a x => by simp [toC]; ring }

private lemma L_apply (L : StrongDual ℝ ℂ) (z : ℂ) :
    L z = z.re * L 1 + z.im * L Complex.I := by
  conv_lhs => rw [← Complex.re_add_im z]
  rw [map_add, show (z.re : ℂ) = z.re • (1 : ℂ) by simp,
    show (z.im : ℂ) * Complex.I = z.im • Complex.I by simp, map_smul, map_smul,
    smul_eq_mul, smul_eq_mul]

private lemma charFunDual_real (L : StrongDual ℝ ℝ) :
    charFunDual (gaussianReal 0 1) L = Complex.exp (-((L 1 : ℝ) : ℂ) ^ 2 / 2) := by
  rw [charFunDual_eq_charFun_map_one, gaussianReal_map_continuousLinearMap,
    charFun_gaussianReal]
  simp [Real.toNNReal_of_nonneg (sq_nonneg (L 1)), neg_div]

/-- The standard complex Gaussian has characteristic function `exp (−(L(1)² + L(i)²)/4)`. -/
lemma charFunDual_gaussC (L : StrongDual ℝ ℂ) :
    charFunDual gaussC L = Complex.exp (-(((L 1) ^ 2 + (L Complex.I) ^ 2 : ℝ) : ℂ) / 4) := by
  change charFunDual ((LowerAnalytic.stdGaussian 2).map toCL) L = _
  rw [charFunDual_map, LowerAnalytic.stdGaussian, charFunDual_pi, Fin.prod_univ_two,
    charFunDual_real, charFunDual_real, ← Complex.exp_add]
  have hs : (2 : ℝ)⁻¹ * √2 = (√2)⁻¹ := by
    field_simp
    nlinarith [Real.sq_sqrt (show (0 : ℝ) ≤ 2 by norm_num)]
  have h0 : (L.comp toCL |>.comp (.single ℝ (fun _ : Fin 2 => ℝ) 0)) 1 = L 1 / √2 := by
    change L (toC (Pi.single 0 1)) = _
    rw [L_apply]
    simp [toC, div_eq_mul_inv, mul_comm, hs]
  have h1 : (L.comp toCL |>.comp (.single ℝ (fun _ : Fin 2 => ℝ) 1)) 1 = L Complex.I / √2 := by
    change L (toC (Pi.single 1 1)) = _
    rw [L_apply]
    simp [toC, div_eq_mul_inv, mul_comm, hs]
  rw [h0, h1]
  congr 1
  have hs2 : (((√2 : ℝ) : ℂ) ^ 2) = 2 := by
    exact_mod_cast Real.sq_sqrt (show (0 : ℝ) ≤ 2 by norm_num)
  push_cast
  rw [div_pow, div_pow, hs2]
  ring

private def mehlerL (ρ : ℂ) : ℂ × ℂ →L[ℝ] ℂ :=
  LinearMap.toContinuousLinearMap
    { toFun := fun u => ρ * u.1 + sig ρ * u.2
      map_add' := fun u v => by simp; ring
      map_smul' := fun a u => by simp; ring }

/-- A normalized linear combination of independent complex Gaussians is standard. -/
theorem map_mehlerY {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) :
    mu2.map (fun u => ρ * u.1 + sig ρ * u.2) = gaussC := by
  change mu2.map (mehlerL ρ) = gaussC
  apply Measure.ext_of_charFunDual
  ext L
  rw [charFunDual_map, show mu2 = gaussC.prod gaussC from rfl, charFunDual_prod,
    charFunDual_gaussC, charFunDual_gaussC, charFunDual_gaussC, ← Complex.exp_add]
  have hσ : (sig ρ).re ^ 2 = 1 - ‖ρ‖ ^ 2 := by
    simp only [sig, Complex.ofReal_re]
    rw [Real.sq_sqrt (by nlinarith [norm_nonneg ρ])]
  have hn : ‖ρ‖ ^ 2 = ρ.re ^ 2 + ρ.im ^ 2 := by
    rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply]
    ring
  simp only [ContinuousLinearMap.comp_apply, mehlerL,
    LinearMap.coe_toContinuousLinearMap', LinearMap.coe_mk, AddHom.coe_mk,
    ContinuousLinearMap.inl_apply, ContinuousLinearMap.inr_apply,
    mul_one, mul_zero, zero_add, add_zero]
  congr 1
  have he : (L ρ) ^ 2 + (L (ρ * Complex.I)) ^ 2 +
      ((L (sig ρ)) ^ 2 + (L (sig ρ * Complex.I)) ^ 2) = (L 1) ^ 2 + (L Complex.I) ^ 2 := by
    calc
      _ = (ρ.re ^ 2 + ρ.im ^ 2 + (sig ρ).re ^ 2) * ((L 1) ^ 2 + (L Complex.I) ^ 2) := by
        rw [L_apply L ρ, L_apply L (ρ * Complex.I), L_apply L (sig ρ),
          L_apply L (sig ρ * Complex.I)]
        simp [sig]
        ring
      _ = _ := by rw [hσ, hn]; ring
  have heC : (L ρ : ℂ) ^ 2 + (L (ρ * Complex.I) : ℂ) ^ 2 +
      ((L (sig ρ) : ℂ) ^ 2 + (L (sig ρ * Complex.I) : ℂ) ^ 2) =
      (L 1 : ℂ) ^ 2 + (L Complex.I : ℂ) ^ 2 := by exact_mod_cast he
  push_cast
  linear_combination -(1 / 4 : ℂ) * heC

end
end Grothe.UpperChaos
