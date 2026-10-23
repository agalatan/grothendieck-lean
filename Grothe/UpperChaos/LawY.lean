import Grothe.UpperChaos.HermiteC2Basis

/-!
# The law of `ρX + √(1 − |ρ|²) W` (input to U3 for `L²` functions)

`gaussC` is a Gaussian measure in Mathlib's sense (`isGaussian_gaussC`), and for `|ρ| ≤ 1`

    (gaussC ⊗ gaussC).map (fun u => ρ u₁ + σ u₂) = gaussC                 (`map_mehlerY`)

Both sides are centred Gaussian measures on `ℂ` (as a real vector space) with the same variance
`(L(1)² + L(i)²)/2` along every real linear form `L` (`variance_gaussC`, using
`L(ρ)² + L(ρi)² = |ρ|²(L(1)² + L(i)²)` and `σ² = 1 − |ρ|²`), hence equal
(`Measure.ext_of_charFunDual`).
-/

open MeasureTheory ProbabilityTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-! ### `gaussC` is Gaussian -/

instance isGaussian_stdGaussian2 : IsGaussian (Grothe.LowerAnalytic.stdGaussian 2) := by
  have h := map_pi_eq_stdGaussian (ι := Fin 2)
  rw [← isGaussian_map_equiv_iff (EuclideanSpace.equiv (Fin 2) ℝ).symm]
  have : (Grothe.LowerAnalytic.stdGaussian 2).map (EuclideanSpace.equiv (Fin 2) ℝ).symm
      = ProbabilityTheory.stdGaussian (EuclideanSpace ℝ (Fin 2)) := by
    rw [← h]; rfl
  rw [this]; infer_instance

/-- `toC` as a continuous real-linear map. -/
def toCL : (Fin 2 → ℝ) →L[ℝ] ℂ :=
  LinearMap.toContinuousLinearMap
    { toFun := toC
      map_add' := fun x y => by simp [toC]; ring
      map_smul' := fun a x => by simp [toC]; ring }

lemma toCL_apply (x : Fin 2 → ℝ) : toCL x = toC x := rfl

instance isGaussian_gaussC : IsGaussian gaussC := by
  have : gaussC = (Grothe.LowerAnalytic.stdGaussian 2).map toCL := rfl
  rw [this]; infer_instance

/-! ### Means and variances of real linear forms -/

lemma L_apply (L : StrongDual ℝ ℂ) (z : ℂ) : L z = z.re * L 1 + z.im * L Complex.I := by
  conv_lhs => rw [← Complex.re_add_im z]
  rw [map_add, show (z.re : ℂ) = z.re • (1 : ℂ) by simp,
    show (z.im : ℂ) * Complex.I = z.im • Complex.I by simp, map_smul, map_smul, smul_eq_mul,
    smul_eq_mul]

lemma L_toC (L : StrongDual ℝ ℂ) (x : Fin 2 → ℝ) :
    L (toC x) = eval x (C (L 1 / √2) * X 0 + C (L Complex.I / √2) * X 1) := by
  rw [L_apply]
  have h : (√2 : ℝ) / 2 = 1 / √2 := by
    rw [div_eq_div_iff (by norm_num) (by positivity), one_mul, Real.mul_self_sqrt (by norm_num)]
  simp [toC, Complex.div_re, Complex.div_im]
  linear_combination (x 0 * L 1 + x 1 * L Complex.I) * h

lemma gE_X (i : Fin 2) : gaussE 2 (X i) = 0 := by
  have := (gaussE_isGaussianExpectation 2).ibp i 1
  simpa using this

lemma gE_XX (i j : Fin 2) : gaussE 2 (X i * X j) = if i = j then 1 else 0 := by
  rw [(gaussE_isGaussianExpectation 2).ibp]
  by_cases h : i = j
  · subst h; simp [(gaussE_isGaussianExpectation 2).one]
  · simp [pderiv_X, h, Ne.symm h]

lemma integral_L_gaussC (L : StrongDual ℝ ℂ) : ∫ z, L z ∂gaussC = 0 := by
  rw [integral_gaussC_of_continuous _ L.continuous]
  simp_rw [L_toC]
  rw [← gaussE_apply, map_add, C_mul', C_mul', map_smul, map_smul, gE_X, gE_X]; simp

lemma integral_L_sq_gaussC (L : StrongDual ℝ ℂ) :
    ∫ z, (L z) ^ 2 ∂gaussC = (L 1 ^ 2 + L Complex.I ^ 2) / 2 := by
  rw [integral_gaussC_of_continuous (fun z => (L z) ^ 2) (by fun_prop)]
  simp_rw [L_toC, ← map_pow]
  rw [← gaussE_apply]
  have e : (C (L 1 / √2) * X 0 + C (L Complex.I / √2) * X 1 : MvPolynomial (Fin 2) ℝ) ^ 2
      = (L 1 / √2) ^ 2 • (X 0 * X 0) + (2 * (L 1 / √2) * (L Complex.I / √2)) • (X 0 * X 1)
        + (L Complex.I / √2) ^ 2 • (X 1 * X 1) := by
    simp only [smul_eq_C_mul, map_mul, map_pow, map_ofNat]; ring
  rw [e, map_add, map_add, map_smul, map_smul, map_smul, gE_XX, gE_XX, gE_XX]
  simp only [↓reduceIte, smul_eq_mul, mul_one, Fin.isValue, zero_ne_one, mul_zero,
    add_zero]
  rw [div_pow, div_pow, Real.sq_sqrt (by norm_num)]; ring

lemma variance_gaussC (L : StrongDual ℝ ℂ) :
    Var[L; gaussC] = (L 1 ^ 2 + L Complex.I ^ 2) / 2 := by
  rw [variance_of_integral_eq_zero L.continuous.aemeasurable (integral_L_gaussC L),
    integral_L_sq_gaussC]

/-! ### The law of `Y` -/

/-- `u ↦ ρu₁ + σu₂` as a continuous real-linear map. -/
def mehlerL (ρ : ℂ) : ℂ × ℂ →L[ℝ] ℂ :=
  LinearMap.toContinuousLinearMap
    { toFun := fun u => ρ * u.1 + sig ρ * u.2
      map_add' := fun u v => by simp; ring
      map_smul' := fun a u => by simp; ring }

lemma mehlerL_apply (ρ : ℂ) (u : ℂ × ℂ) : mehlerL ρ u = ρ * u.1 + sig ρ * u.2 := rfl

lemma integrable_L_gaussC (L : StrongDual ℝ ℂ) : Integrable (fun z => L z) gaussC :=
  IsGaussian.integrable_dual gaussC L

lemma memLp_L_gaussC (L : StrongDual ℝ ℂ) : MemLp (fun z => L z) 2 gaussC :=
  IsGaussian.memLp_dual gaussC L 2 (by simp)

/-- Mean and second moment of `M₁(u₁) + M₂(u₂)` under `gaussC ⊗ gaussC`. -/
lemma integral_sum_L (M₁ M₂ : StrongDual ℝ ℂ) :
    ∫ u, (M₁ u.1 + M₂ u.2) ∂mu2 = 0 := by
  rw [integral_add ((integrable_L_gaussC M₁).comp_fst gaussC)
    ((integrable_L_gaussC M₂).comp_snd gaussC), integral_fun_fst, integral_fun_snd,
    integral_L_gaussC, integral_L_gaussC]
  simp

lemma integral_sum_L_sq (M₁ M₂ : StrongDual ℝ ℂ) :
    ∫ u, (M₁ u.1 + M₂ u.2) ^ 2 ∂mu2
      = (M₁ 1 ^ 2 + M₁ Complex.I ^ 2) / 2 + (M₂ 1 ^ 2 + M₂ Complex.I ^ 2) / 2 := by
  have h1 := (memLp_two_iff_integrable_sq (integrable_L_gaussC M₁).aestronglyMeasurable).1
    (memLp_L_gaussC M₁)
  have h2 := (memLp_two_iff_integrable_sq (integrable_L_gaussC M₂).aestronglyMeasurable).1
    (memLp_L_gaussC M₂)
  have h12 : Integrable (fun u : ℂ × ℂ => M₁ u.1 * M₂ u.2) mu2 :=
    (integrable_L_gaussC M₁).mul_prod (integrable_L_gaussC M₂)
  have e : (fun u : ℂ × ℂ => (M₁ u.1 + M₂ u.2) ^ 2)
      = fun u => (M₁ u.1) ^ 2 + 2 * (M₁ u.1 * M₂ u.2) + (M₂ u.2) ^ 2 := by funext u; ring
  have i1 : Integrable (fun u : ℂ × ℂ => M₁ u.1 ^ 2) mu2 := h1.comp_fst gaussC
  have i2 : Integrable (fun u : ℂ × ℂ => 2 * (M₁ u.1 * M₂ u.2)) mu2 := h12.const_mul 2
  have i3 : Integrable (fun u : ℂ × ℂ => M₂ u.2 ^ 2) mu2 := h2.comp_snd gaussC
  have i12 : Integrable (fun u : ℂ × ℂ => M₁ u.1 ^ 2 + 2 * (M₁ u.1 * M₂ u.2)) mu2 := i1.add i2
  rw [e, integral_add i12 i3, integral_add i1 i2, integral_const_mul,
    show mu2 = gaussC.prod gaussC from rfl,
    integral_fun_fst (f := fun z : ℂ => M₁ z ^ 2), integral_fun_snd (f := fun z : ℂ => M₂ z ^ 2),
    integral_prod_mul (f := fun z => M₁ z) (g := fun z => M₂ z),
    integral_L_gaussC, integral_L_sq_gaussC, integral_L_sq_gaussC]
  simp

/-- **The law of `ρX + σW` is `gaussC`** for `|ρ| ≤ 1`. -/
theorem map_mehlerY {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) :
    mu2.map (fun u => ρ * u.1 + sig ρ * u.2) = gaussC := by
  have hmap : mu2.map (fun u => ρ * u.1 + sig ρ * u.2) = mu2.map (mehlerL ρ) := rfl
  rw [hmap]
  refine Measure.ext_of_charFunDual ?_
  ext L
  rw [IsGaussian.charFunDual_eq, IsGaussian.charFunDual_eq]
  -- the linear forms `M₁ = L(ρ ·)`, `M₂ = σ L`
  set M₁ : StrongDual ℝ ℂ := L.comp ((ContinuousLinearMap.lsmul ℝ ℂ ρ).restrictScalars ℝ) with hM₁
  set M₂ : StrongDual ℝ ℂ := (sig ρ).re • L with hM₂
  have hs : (sig ρ : ℂ) = ((sig ρ).re : ℂ) := by simp [sig]
  have hLY : ∀ u : ℂ × ℂ, L (mehlerL ρ u) = M₁ u.1 + M₂ u.2 := fun u => by
    rw [mehlerL_apply, map_add, hs, show ((sig ρ).re : ℂ) * u.2 = (sig ρ).re • u.2 by simp,
      map_smul]
    simp [hM₁, hM₂]
  have hmean : (mu2.map (mehlerL ρ))[L] = 0 := by
    rw [integral_map (mehlerL ρ).continuous.aemeasurable L.continuous.aestronglyMeasurable]
    simp_rw [hLY]; exact integral_sum_L M₁ M₂
  have hvar : Var[L; mu2.map (mehlerL ρ)] = (L 1 ^ 2 + L Complex.I ^ 2) / 2 := by
    rw [variance_of_integral_eq_zero L.continuous.aemeasurable hmean,
      integral_map (f := fun x => (L x) ^ 2) (mehlerL ρ).continuous.aemeasurable
        (L.continuous.pow 2).aestronglyMeasurable]
    simp_rw [hLY]
    rw [integral_sum_L_sq]
    have e1 : M₁ 1 = L ρ := by simp [hM₁]
    have e2 : M₁ Complex.I = L (ρ * Complex.I) := by simp [hM₁]
    rw [e1, e2, L_apply L ρ, L_apply L (ρ * Complex.I)]
    simp only [hM₂, FunLike.coe_smul, Pi.smul_apply, smul_eq_mul, Complex.mul_re,
      Complex.mul_im, Complex.I_re, Complex.I_im, mul_zero, mul_one]
    have hσ : (sig ρ).re ^ 2 = 1 - ‖ρ‖ ^ 2 := by
      simp only [sig, Complex.ofReal_re]
      rw [Real.sq_sqrt (by nlinarith [norm_nonneg ρ])]
    have hn : ‖ρ‖ ^ 2 = ρ.re ^ 2 + ρ.im ^ 2 := by
      rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply]; ring
    rw [mul_pow, mul_pow, hσ, hn]; ring
  have hmean0 : gaussC[L] = 0 := integral_L_gaussC L
  rw [integral_complex_ofReal, integral_complex_ofReal, hmean, hvar, hmean0, variance_gaussC]

end

end Grothe.UpperChaos
