import Grothe.Lower.RowGates

/-!
# The standard complex Gaussian on `ℂ` and the fibre potential of a row (L4, S4)

`gaussC` is the standard complex Gaussian measure on `ℂ` (density `π⁻¹e^{−|z|²}`, `E|z|² = 1`), the
law of `(x₀ + i x₁)/√2` under `stdGaussian 2`.  This is the normalisation of the certified potential
(`handoff/lower-stein/cert-0745e`, `anchored_potential_formalization.md` §1).

This part: integrability of polynomially bounded functions (`integrable_gaussC_of_bound`), the
moments `E|z|² = 1` (`integral_normSq_gaussC`) and the first absolute moment of the second
Hermite function, `E||z|² − 1| = 2/e` (`integral_abs_normSq_sub_one`, by polar coordinates), with
the rational bound `2/e ≤ 7358/10000` used by the Lipschitz headers of the rows.
-/

open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### The measure -/

/-- `(x₀ + i x₁)/√2`. -/
def toC (x : Fin 2 → ℝ) : ℂ := ((x 0 : ℂ) + (x 1 : ℂ) * Complex.I) / (√2 : ℝ)

lemma continuous_toC : Continuous toC := by unfold toC; fun_prop

lemma measurable_toC : Measurable toC := continuous_toC.measurable

lemma normSq_toC (x : Fin 2 → ℝ) : Complex.normSq (toC x) = (x 0 ^ 2 + x 1 ^ 2) / 2 := by
  unfold toC
  rw [Complex.normSq_div, Complex.normSq_ofReal, Real.mul_self_sqrt (by norm_num)]
  simp [Complex.normSq_apply]
  ring

/-- **The standard complex Gaussian** on `ℂ`: the law of `(x₀ + i x₁)/√2`. -/
def gaussC : Measure ℂ := (stdGaussian 2).map toC

instance : IsProbabilityMeasure gaussC :=
  ⟨by rw [gaussC, Measure.map_apply measurable_toC MeasurableSet.univ, Set.preimage_univ, measure_univ]⟩

lemma integral_gaussC (F : ℂ → ℝ) (hF : AEStronglyMeasurable F gaussC) :
    ∫ z, F z ∂gaussC = ∫ x, F (toC x) ∂(stdGaussian 2) :=
  integral_map measurable_toC.aemeasurable hF

lemma integral_gaussC_of_continuous (F : ℂ → ℝ) (hF : Continuous F) :
    ∫ z, F z ∂gaussC = ∫ x, F (toC x) ∂(stdGaussian 2) :=
  integral_gaussC F hF.aestronglyMeasurable

lemma integrable_gaussC_iff (F : ℂ → ℝ) (hF : AEStronglyMeasurable F gaussC) :
    Integrable F gaussC ↔ Integrable (fun x => F (toC x)) (stdGaussian 2) :=
  integrable_map_measure hF measurable_toC.aemeasurable

/-- The polynomial `|z|² = (x₀² + x₁²)/2` in the real coordinates. -/
def Pn : MvPolynomial (Fin 2) ℝ := MvPolynomial.C (1 / 2) * (MvPolynomial.X 0 ^ 2 + MvPolynomial.X 1 ^ 2)

lemma eval_Pn (x : Fin 2 → ℝ) : MvPolynomial.eval x Pn = Complex.normSq (toC x) := by
  simp [Pn, normSq_toC]; ring

/-- **Integrability** of a continuous function bounded by a cubic polynomial in `|z|²`. -/
lemma integrable_gaussC_of_bound (F : ℂ → ℝ) (hF : Continuous F) (c0 c1 c2 c3 : ℝ)
    (h : ∀ z, |F z| ≤ c0 + c1 * Complex.normSq z + c2 * Complex.normSq z ^ 2
      + c3 * Complex.normSq z ^ 3) : Integrable F gaussC := by
  rw [integrable_gaussC_iff F hF.aestronglyMeasurable]
  refine integrable_of_abs_le_eval (hF.comp continuous_toC).aestronglyMeasurable
    (MvPolynomial.C c0 + MvPolynomial.C c1 * Pn + MvPolynomial.C c2 * Pn ^ 2
      + MvPolynomial.C c3 * Pn ^ 3) fun x => ?_
  simp only [map_add, map_mul, map_pow, MvPolynomial.eval_C, eval_Pn]
  exact h (toC x)

lemma integrable_gaussC_of_bound' (F : ℂ → ℂ) (hF : Continuous F) (c0 c1 c2 c3 : ℝ)
    (h : ∀ z, ‖F z‖ ≤ c0 + c1 * Complex.normSq z + c2 * Complex.normSq z ^ 2
      + c3 * Complex.normSq z ^ 3) : Integrable F gaussC := by
  refine (integrable_gaussC_of_bound (fun z => ‖F z‖) hF.norm c0 c1 c2 c3 fun z => ?_).mono'
    hF.aestronglyMeasurable (Filter.Eventually.of_forall fun z => le_rfl)
  rw [abs_of_nonneg (norm_nonneg _)]; exact h z

/-! ### Moments -/

lemma integral_normSq_gaussC : ∫ z, Complex.normSq z ∂gaussC = 1 := by
  rw [integral_gaussC_of_continuous _ Complex.continuous_normSq]
  simp_rw [normSq_toC]
  have h0 := gE_X_sq (d := 2) 0
  have h1 := gE_X_sq (d := 2) 1
  simp only [gaussE_apply, map_pow, MvPolynomial.eval_X] at h0 h1
  have hi : ∀ i : Fin 2, Integrable (fun x : Fin 2 → ℝ => x i ^ 2) (stdGaussian 2) := fun i =>
    (integrable_eval (MvPolynomial.X i ^ 2 : MvPolynomial (Fin 2) ℝ)).congr
      (Filter.Eventually.of_forall fun x => by simp)
  rw [integral_div, integral_add (hi 0) (hi 1), h0, h1]
  norm_num

/-! ### `E||z|² − 1| = 2/e` by polar coordinates -/

/-- The planar Gaussian `γ ⊗ γ`. -/
abbrev gauss2 : Measure (ℝ × ℝ) := (gaussianReal 0 1).prod (gaussianReal 0 1)

lemma integral_stdGaussian_two (F : ℝ × ℝ → ℝ) (hF : Continuous F) :
    ∫ x, F (x 0, x 1) ∂(stdGaussian 2) = ∫ p, F p ∂gauss2 := by
  have h := (measurePreserving_finTwoArrow (gaussianReal 0 1)).map_eq
  calc ∫ x, F (x 0, x 1) ∂(stdGaussian 2)
      = ∫ p, F p ∂((stdGaussian 2).map MeasurableEquiv.finTwoArrow) :=
        (integral_map (by fun_prop) hF.aestronglyMeasurable).symm
    _ = ∫ p, F p ∂gauss2 := by rw [stdGaussian, h]

lemma gaussianPDFReal_mul (x y : ℝ) :
    gaussianPDFReal 0 1 x * gaussianPDFReal 0 1 y = (2 * π)⁻¹ * exp (-(x ^ 2 + y ^ 2) / 2) := by
  simp only [gaussianPDFReal_def, NNReal.coe_one, mul_one, sub_zero]
  have h : (√(2 * π))⁻¹ * (√(2 * π))⁻¹ = (2 * π)⁻¹ := by
    rw [← mul_inv, Real.mul_self_sqrt (by positivity)]
  rw [← h, show -(x ^ 2 + y ^ 2) / 2 = -x ^ 2 / 2 + -y ^ 2 / 2 by ring, exp_add]; ring

lemma integral_gauss2_eq (F : ℝ × ℝ → ℝ) :
    ∫ p, F p ∂gauss2
      = ∫ p : ℝ × ℝ, gaussianPDFReal 0 1 p.1 * gaussianPDFReal 0 1 p.2 * F p := by
  rw [gauss2, gaussianReal_of_var_ne_zero 0 one_ne_zero,
    MeasureTheory.prod_withDensity (measurable_gaussianPDF 0 1) (measurable_gaussianPDF 0 1),
    integral_withDensity_eq_integral_toReal_smul (by fun_prop)
      (Filter.Eventually.of_forall fun p => ENNReal.mul_lt_top gaussianPDF_lt_top gaussianPDF_lt_top),
    ← Measure.volume_eq_prod]
  congr 1; ext p
  rw [ENNReal.toReal_mul, toReal_gaussianPDF, toReal_gaussianPDF, smul_eq_mul]

/-- The antiderivative `G(r) = (r²/2) e^{−r²/2}` of `(1 − r²/2) r e^{−r²/2}`. -/
lemma hasDerivAt_G (r : ℝ) :
    HasDerivAt (fun r : ℝ => r ^ 2 / 2 * exp (-r ^ 2 / 2)) ((1 - r ^ 2 / 2) * (r * exp (-r ^ 2 / 2))) r := by
  have h1 : HasDerivAt (fun r : ℝ => r ^ 2 / 2) r r := by
    simpa using ((hasDerivAt_pow 2 r).div_const 2)
  have h2 : HasDerivAt (fun r : ℝ => exp (-r ^ 2 / 2)) (exp (-r ^ 2 / 2) * (-r)) r := by
    have : HasDerivAt (fun r : ℝ => -r ^ 2 / 2) (-r) r := by
      convert ((hasDerivAt_pow 2 r).neg).div_const 2 using 1; ring
    exact this.exp
  convert h1.mul h2 using 1
  ring

lemma integrable_pow_mul_exp (k : ℕ) : Integrable (fun r : ℝ => r ^ k * exp (-r ^ 2 / 2)) := by
  have h := (integrable_gaussian_iff (fun t => t ^ k)).mp (integrable_pow_gaussian k)
  refine (h.const_mul (√(2 * π))).congr (Filter.Eventually.of_forall fun x => ?_)
  simp only [gaussianPDFReal_def, NNReal.coe_one, mul_one, sub_zero]
  have : √(2 * π) ≠ 0 := by positivity
  field_simp

/-- The radial integrand `|r²/2 − 1| r e^{−r²/2}`. -/
def radF (r : ℝ) : ℝ := |r ^ 2 / 2 - 1| * (r * exp (-r ^ 2 / 2))

lemma continuous_radF : Continuous radF := by unfold radF; fun_prop

lemma integrable_radF : Integrable radF := by
  refine (((integrable_pow_mul_exp 3).abs.div_const 2).add (integrable_pow_mul_exp 1).abs).mono'
    continuous_radF.aestronglyMeasurable (Filter.Eventually.of_forall fun r => ?_)
  have he : 0 < exp (-r ^ 2 / 2) := exp_pos _
  show ‖radF r‖ ≤ |r ^ 3 * exp (-r ^ 2 / 2)| / 2 + |r ^ 1 * exp (-r ^ 2 / 2)|
  simp only [radF, Real.norm_eq_abs, abs_mul, abs_abs, abs_pow, abs_of_pos he, pow_one]
  have h1 : |r ^ 2 / 2 - 1| ≤ r ^ 2 / 2 + 1 := by
    have := abs_sub (r ^ 2 / 2) 1
    rw [abs_one, abs_of_nonneg (by positivity : (0 : ℝ) ≤ r ^ 2 / 2)] at this
    linarith
  have h2 : r ^ 2 = |r| ^ 2 := (sq_abs r).symm
  calc |r ^ 2 / 2 - 1| * (|r| * exp (-r ^ 2 / 2))
      ≤ (r ^ 2 / 2 + 1) * (|r| * exp (-r ^ 2 / 2)) := by gcongr
    _ = |r| ^ 3 * exp (-r ^ 2 / 2) / 2 + |r| * exp (-r ^ 2 / 2) := by rw [h2]; ring

lemma radF_of_le {r : ℝ} (h : r ^ 2 ≤ 2) : radF r = (1 - r ^ 2 / 2) * (r * exp (-r ^ 2 / 2)) := by
  rw [radF, abs_of_nonpos (by linarith)]; ring

lemma radF_of_ge {r : ℝ} (h : 2 ≤ r ^ 2) : radF r = -((1 - r ^ 2 / 2) * (r * exp (-r ^ 2 / 2))) := by
  rw [radF, abs_of_nonneg (by linarith)]; ring

lemma G_sqrt_two : (√2 : ℝ) ^ 2 / 2 * exp (-(√2 : ℝ) ^ 2 / 2) = exp (-1) := by
  rw [Real.sq_sqrt (by norm_num)]; norm_num

lemma integral_radF_Ioc : ∫ r in Ioc (0 : ℝ) (√2), radF r = exp (-1) := by
  rw [← intervalIntegral.integral_of_le (Real.sqrt_nonneg 2)]
  have hc : ∀ r ∈ uIcc (0 : ℝ) (√2), radF r = (1 - r ^ 2 / 2) * (r * exp (-r ^ 2 / 2)) := by
    intro r hr
    rw [uIcc_of_le (Real.sqrt_nonneg 2)] at hr
    refine radF_of_le ?_
    have : r ≤ √2 := hr.2
    nlinarith [hr.1, Real.sq_sqrt (show (0 : ℝ) ≤ 2 by norm_num)]
  rw [intervalIntegral.integral_congr hc,
    intervalIntegral.integral_eq_sub_of_hasDerivAt (fun r _ => hasDerivAt_G r)
      ((by fun_prop : Continuous fun r : ℝ => (1 - r ^ 2 / 2) * (r * exp (-r ^ 2 / 2))).intervalIntegrable _ _)]
  rw [G_sqrt_two]; simp

lemma tendsto_G : Filter.Tendsto (fun r : ℝ => r ^ 2 / 2 * exp (-r ^ 2 / 2)) Filter.atTop (nhds 0) := by
  have h1 : Filter.Tendsto (fun r : ℝ => r ^ 2 / 2) Filter.atTop Filter.atTop :=
    (Filter.tendsto_pow_atTop two_ne_zero).atTop_div_const (by norm_num)
  have h2 := (tendsto_pow_mul_exp_neg_atTop_nhds_zero 1).comp h1
  refine h2.congr fun r => ?_
  simp only [Function.comp, pow_one, neg_div]

lemma integral_radF_Ioi : ∫ r in Ioi (√2 : ℝ), radF r = exp (-1) := by
  have h := integral_Ioi_of_hasDerivAt_of_tendsto (a := √2)
    (f := fun r : ℝ => -(r ^ 2 / 2 * exp (-r ^ 2 / 2))) (f' := radF) (m := 0)
    ((by fun_prop : Continuous fun r : ℝ => -(r ^ 2 / 2 * exp (-r ^ 2 / 2))).continuousWithinAt)
    (fun r hr => by
      have hr2 : 2 ≤ r ^ 2 := by
        have : √2 < r := hr
        nlinarith [Real.sq_sqrt (show (0 : ℝ) ≤ 2 by norm_num), Real.sqrt_nonneg 2]
      rw [radF_of_ge hr2]; exact (hasDerivAt_G r).neg)
    integrable_radF.integrableOn (by rw [← neg_zero]; exact tendsto_G.neg)
  rw [h, G_sqrt_two]; ring

/-- `∫₀^∞ |r²/2 − 1| r e^{−r²/2} dr = 2/e`. -/
lemma integral_radF : ∫ r in Ioi (0 : ℝ), radF r = 2 / exp 1 := by
  rw [← Ioc_union_Ioi_eq_Ioi (Real.sqrt_nonneg 2),
    setIntegral_union (Set.disjoint_left.2 fun x hx hx' => (hx.2.trans_lt hx').false)
      measurableSet_Ioi integrable_radF.integrableOn integrable_radF.integrableOn,
    integral_radF_Ioc, integral_radF_Ioi, exp_neg]
  ring

/-- **`E||z|² − 1| = 2/e`** under the standard complex Gaussian. -/
theorem integral_abs_normSq_sub_one : ∫ z, |Complex.normSq z - 1| ∂gaussC = 2 / exp 1 := by
  rw [integral_gaussC_of_continuous _ (by fun_prop)]
  simp_rw [normSq_toC]
  rw [integral_stdGaussian_two (fun p => |(p.1 ^ 2 + p.2 ^ 2) / 2 - 1|) (by fun_prop),
    integral_gauss2_eq, ← integral_comp_polarCoord_symm]
  have hT : polarCoord.target = Ioi (0 : ℝ) ×ˢ Ioo (-π) π := rfl
  have hpt : ∀ p ∈ Ioi (0 : ℝ) ×ˢ Ioo (-π) π,
      p.1 • (gaussianPDFReal 0 1 (polarCoord.symm p).1 * gaussianPDFReal 0 1 (polarCoord.symm p).2
        * |((polarCoord.symm p).1 ^ 2 + (polarCoord.symm p).2 ^ 2) / 2 - 1|)
        = radF p.1 * (2 * π)⁻¹ := by
    rintro ⟨r, θ⟩ -
    simp only [polarCoord_symm_apply, smul_eq_mul]
    rw [gaussianPDFReal_mul]
    have h1 : (r * cos θ) ^ 2 + (r * sin θ) ^ 2 = r ^ 2 := by
      rw [mul_pow, mul_pow, ← mul_add, cos_sq_add_sin_sq, mul_one]
    rw [h1, radF]; ring
  have hprod := setIntegral_prod_mul (μ := volume) (ν := volume) radF (fun _ : ℝ => (2 * π)⁻¹)
    (Ioi 0) (Ioo (-π) π)
  beta_reduce at hprod
  rw [hT, setIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo) hpt, Measure.volume_eq_prod,
    hprod, setIntegral_const, integral_radF]
  simp only [measureReal_def, Real.volume_Ioo, sub_neg_eq_add, smul_eq_mul]
  rw [ENNReal.toReal_ofReal (by positivity)]
  field_simp
  norm_num

/-- `2/e ≤ 7358/10000`, the rational constant of the Lipschitz headers. -/
lemma two_div_exp_one_le : 2 / exp 1 ≤ 7358 / 10000 := by
  rw [div_le_iff₀ (exp_pos 1)]
  have := exp_one_gt_d9
  norm_num at this ⊢
  linarith

end

end Grothe.LowerAnalytic
