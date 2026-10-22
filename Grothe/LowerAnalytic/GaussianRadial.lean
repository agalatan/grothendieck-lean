import Grothe.LowerAnalytic.Gaussian

/-!
# The planar Gaussian radius and rotation invariance of the product Gaussian

* `integral_norm_gauss2`: `E √(x² + y²) = √2·√π/2 = √(π/2)` for independent standard real `x, y`
  (polar coordinates, then `∫_0^∞ r² e^{−r²/2} dr = √(2π)/2` from `E x² = 1` by evenness).
* `integral_sq_fst_gauss2`: `E x² = 1` under the planar Gaussian.
* `integral_two_linear`: for `a ⊥ b` in `ℝ^d` with `‖a‖ = ‖b‖ = s > 0` and continuous `F`,
  `∫ F(⟨a,x⟩, ⟨b,x⟩) d(stdGaussian d) = ∫ F(s p₁, s p₂) d(gauss2)`: the pair `(⟨a,x⟩, ⟨b,x⟩)/s`
  is a standard planar Gaussian (extend `a/s, b/s` to an orthonormal basis, use Mathlib's
  `stdGaussian_eq_map_pi_orthonormalBasis` and `map_pi_eq_stdGaussian`, and the independence of two
  coordinates of a product measure).
-/

open MeasureTheory ProbabilityTheory Real Set

namespace Grothe.LowerAnalytic

/-- The standard planar Gaussian `γ ⊗ γ` on `ℝ × ℝ`. -/
noncomputable abbrev gauss2 : Measure (ℝ × ℝ) := (gaussianReal 0 1).prod (gaussianReal 0 1)

lemma gaussianPDFReal_mul (x y : ℝ) :
    gaussianPDFReal 0 1 x * gaussianPDFReal 0 1 y = (2 * π)⁻¹ * exp (-(x ^ 2 + y ^ 2) / 2) := by
  simp only [gaussianPDFReal_def, NNReal.coe_one, mul_one, sub_zero]
  have h : (√(2 * π))⁻¹ * (√(2 * π))⁻¹ = (2 * π)⁻¹ := by
    rw [← mul_inv, Real.mul_self_sqrt (by positivity)]
  rw [← h, show -(x ^ 2 + y ^ 2) / 2 = -x ^ 2 / 2 + -y ^ 2 / 2 by ring, exp_add]; ring

/-- The planar Gaussian integral as a Lebesgue integral against the density. -/
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

/-- `E x² = 1` for the standard real Gaussian (the Stein identity with `f = id`). -/
lemma integral_sq_gaussianReal : ∫ t, t ^ 2 ∂(gaussianReal 0 1) = 1 := by
  have h := stein_scalar (f := fun t => t) (f' := fun _ => 1) (fun t => hasDerivAt_id t)
    (by simpa using integrable_pow_gaussian 1) (integrable_const 1)
    (by simpa [sq] using integrable_pow_gaussian 2)
  simp only [integral_const, probReal_univ, smul_eq_mul, mul_one] at h
  rw [← h]; congr 1; ext t; ring

lemma integral_sq_exp_full : ∫ r : ℝ, r ^ 2 * exp (-r ^ 2 / 2) = √2 * √π := by
  have h := integral_sq_gaussianReal
  rw [integral_gaussianReal_eq_integral_smul one_ne_zero] at h
  simp only [gaussianPDFReal_def, NNReal.coe_one, mul_one, sub_zero, smul_eq_mul] at h
  have h2 : (fun x : ℝ => (√(2 * π))⁻¹ * exp (-x ^ 2 / 2) * x ^ 2)
      = fun x => (√(2 * π))⁻¹ * (x ^ 2 * exp (-x ^ 2 / 2)) := by ext x; ring
  rw [h2, integral_const_mul, inv_mul_eq_div, div_eq_one_iff_eq (by positivity)] at h
  rw [h, Real.sqrt_mul (by norm_num)]

lemma integrable_sq_exp : Integrable (fun r : ℝ => r ^ 2 * exp (-r ^ 2 / 2)) := by
  have h := (integrable_gaussian_iff (fun t => t ^ 2)).mp (integrable_pow_gaussian 2)
  refine (h.const_mul (√(2 * π))).congr (Filter.Eventually.of_forall fun x => ?_)
  simp only [gaussianPDFReal_def, NNReal.coe_one, mul_one, sub_zero]
  have : √(2 * π) ≠ 0 := by positivity
  field_simp

/-- `∫_0^∞ r² e^{−r²/2} dr = √2·√π/2`. -/
lemma integral_sq_exp_Ioi : ∫ r in Ioi (0 : ℝ), r ^ 2 * exp (-r ^ 2 / 2) = √2 * √π / 2 := by
  have heven : ∫ r in Iic (0 : ℝ), r ^ 2 * exp (-r ^ 2 / 2)
      = ∫ r in Ioi (0 : ℝ), r ^ 2 * exp (-r ^ 2 / 2) := by
    have := integral_comp_neg_Ioi 0 (fun r : ℝ => r ^ 2 * exp (-r ^ 2 / 2))
    simp only [neg_zero, neg_sq] at this
    exact this.symm
  have := intervalIntegral.integral_Iic_add_Ioi (b := 0) integrable_sq_exp.integrableOn integrable_sq_exp.integrableOn
  rw [heven, integral_sq_exp_full] at this
  linarith

/-- **The planar Gaussian radius**: `E √(x² + y²) = √2·√π/2`. -/
theorem integral_norm_gauss2 : ∫ p, √(p.1 ^ 2 + p.2 ^ 2) ∂gauss2 = √2 * √π / 2 := by
  rw [integral_gauss2_eq, ← integral_comp_polarCoord_symm]
  have hT : polarCoord.target = Ioi (0 : ℝ) ×ˢ Ioo (-π) π := rfl
  have hpt : ∀ p ∈ Ioi (0 : ℝ) ×ˢ Ioo (-π) π,
      p.1 • (gaussianPDFReal 0 1 (polarCoord.symm p).1 * gaussianPDFReal 0 1 (polarCoord.symm p).2
        * √((polarCoord.symm p).1 ^ 2 + (polarCoord.symm p).2 ^ 2))
        = (p.1 ^ 2 * exp (-p.1 ^ 2 / 2)) * (2 * π)⁻¹ := by
    rintro ⟨r, θ⟩ ⟨hr, -⟩
    simp only [polarCoord_symm_apply, smul_eq_mul]
    rw [gaussianPDFReal_mul]
    have h1 : (r * cos θ) ^ 2 + (r * sin θ) ^ 2 = r ^ 2 := by
      rw [mul_pow, mul_pow, ← mul_add, cos_sq_add_sin_sq, mul_one]
    rw [h1, Real.sqrt_sq (le_of_lt hr)]; ring
  have hprod := setIntegral_prod_mul (μ := volume) (ν := volume)
    (fun r : ℝ => r ^ 2 * exp (-r ^ 2 / 2)) (fun _ : ℝ => (2 * π)⁻¹) (Ioi 0) (Ioo (-π) π)
  beta_reduce at hprod
  rw [hT, setIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo) hpt, Measure.volume_eq_prod,
    hprod, setIntegral_const, integral_sq_exp_Ioi]
  simp only [measureReal_def, Real.volume_Ioo, sub_neg_eq_add, smul_eq_mul]
  rw [ENNReal.toReal_ofReal (by positivity)]
  field_simp
  norm_num

/-- `E x² = 1` under the planar Gaussian. -/
lemma integral_sq_fst_gauss2 : ∫ p, p.1 ^ 2 ∂gauss2 = 1 := by
  have := integral_prod_mul (μ := gaussianReal 0 1) (ν := gaussianReal 0 1)
    (fun x : ℝ => x ^ 2) (fun _ => (1 : ℝ))
  simp only [mul_one, integral_const, probReal_univ, smul_eq_mul] at this
  rw [this, integral_sq_gaussianReal]

lemma integral_sq_snd_gauss2 : ∫ p, p.2 ^ 2 ∂gauss2 = 1 := by
  have := integral_prod_mul (μ := gaussianReal 0 1) (ν := gaussianReal 0 1)
    (fun _ => (1 : ℝ)) (fun y : ℝ => y ^ 2)
  simp only [one_mul, integral_const, probReal_univ, smul_eq_mul] at this
  rw [this, integral_sq_gaussianReal]

/-! ### Two coordinates of the product Gaussian -/

section rotation

variable {ι : Type*} [Fintype ι]

/-- The law of two distinct coordinates of the product Gaussian is the planar Gaussian. -/
lemma pi_map_two (i₀ i₁ : ι) (h : i₀ ≠ i₁) :
    (Measure.pi fun _ : ι => gaussianReal 0 1).map (fun y => (y i₀, y i₁)) = gauss2 := by
  classical
  have hind := (iIndepFun_pi (μ := fun _ : ι => gaussianReal 0 1) (X := fun _ t => t)
    fun _ => aemeasurable_id).indepFun h
  rw [hind.map_prod_eq_prod_map_map (measurable_pi_apply _).aemeasurable
    (measurable_pi_apply _).aemeasurable]
  have hev : ∀ i : ι, (Measure.pi fun _ : ι => gaussianReal 0 1).map (fun y => y i)
      = gaussianReal 0 1 := fun i => by
    have := Measure.pi_map_eval (μ := fun _ : ι => gaussianReal 0 1) i
    simpa using this
  rw [hev, hev]

lemma integral_pi_two (i₀ i₁ : ι) (h : i₀ ≠ i₁) (F : ℝ × ℝ → ℝ) (hF : Continuous F) :
    ∫ y, F (y i₀, y i₁) ∂(Measure.pi fun _ : ι => gaussianReal 0 1) = ∫ p, F p ∂gauss2 := by
  rw [← pi_map_two i₀ i₁ h, integral_map (by fun_prop) hF.aestronglyMeasurable]

lemma inner_toLp {d : ℕ} (f g : Fin d → ℝ) :
    inner ℝ (WithLp.toLp 2 f : EuclideanSpace ℝ (Fin d)) (WithLp.toLp 2 g) = ∑ i, f i * g i := by
  simp [PiLp.inner_apply, mul_comm]

/-- **Rotation invariance**: for orthogonal `a, b ∈ ℝ^d` of common norm `s > 0`,
`(⟨a,x⟩, ⟨b,x⟩)` has the law of `s` times a standard planar Gaussian. -/
theorem integral_two_linear {d : ℕ} (hd : 2 ≤ d) (a b : Fin d → ℝ) (s : ℝ) (hs : 0 < s)
    (ha : ∑ i, a i ^ 2 = s ^ 2) (hb : ∑ i, b i ^ 2 = s ^ 2) (hab : ∑ i, a i * b i = 0)
    (F : ℝ × ℝ → ℝ) (hF : Continuous F) :
    ∫ x, F (∑ i, a i * x i, ∑ i, b i * x i) ∂(stdGaussian d)
      = ∫ p, F (s * p.1, s * p.2) ∂gauss2 := by
  classical
  let v₀ : EuclideanSpace ℝ (Fin d) := WithLp.toLp 2 fun i => a i / s
  let v₁ : EuclideanSpace ℝ (Fin d) := WithLp.toLp 2 fun i => b i / s
  let i₀ : Fin d := ⟨0, by omega⟩
  let i₁ : Fin d := ⟨1, by omega⟩
  have hi : i₀ ≠ i₁ := by simp [i₀, i₁, Fin.ext_iff]
  let v : Fin d → EuclideanSpace ℝ (Fin d) := fun i => if i = i₀ then v₀ else if i = i₁ then v₁ else 0
  have h00 : inner ℝ v₀ v₀ = 1 := by
    rw [inner_toLp]; simp_rw [div_mul_div_comm, ← sq, ← Finset.sum_div, ha]; field_simp
  have h11 : inner ℝ v₁ v₁ = 1 := by
    rw [inner_toLp]; simp_rw [div_mul_div_comm, ← sq, ← Finset.sum_div, hb]; field_simp
  have h01 : inner ℝ v₀ v₁ = 0 := by
    rw [inner_toLp]; simp_rw [div_mul_div_comm, ← Finset.sum_div, hab, zero_div]
  have h10 : inner ℝ v₁ v₀ = 0 := by rw [real_inner_comm]; exact h01
  have hv : Orthonormal ℝ (({i₀, i₁} : Set (Fin d)).domRestrict v) := by
    have hv0 : v i₀ = v₀ := by simp [v]
    have hv1 : v i₁ = v₁ := by simp [v, hi.symm]
    rw [orthonormal_iff_ite]
    rintro ⟨i, hi'⟩ ⟨j, hj'⟩
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hi' hj'
    change inner ℝ (v i) (v j) = if (⟨i, hi'⟩ : {x // x ∈ ({i₀, i₁} : Set (Fin d))}) = ⟨j, hj'⟩
      then (1 : ℝ) else 0
    rcases hi' with rfl | rfl <;> rcases hj' with rfl | rfl
    · simp only [hv0, h00, ite_true]
    · simp only [hv0, hv1, h01]
      rw [ite_eq_right_of_eq_false _ _ (eq_false fun h => hi (congrArg Subtype.val h))]
    · simp only [hv0, hv1, h10]
      rw [ite_eq_right_of_eq_false _ _ (eq_false fun h => hi (congrArg Subtype.val h).symm)]
    · simp only [hv1, h11, ite_true]
  obtain ⟨B, hB⟩ := Orthonormal.exists_orthonormalBasis_extension_of_card_eq (𝕜 := ℝ)
    (E := EuclideanSpace ℝ (Fin d)) (ι := Fin d) (by simp) hv
  have hB0 : B i₀ = v₀ := by rw [hB i₀ (by simp)]; simp [v]
  have hB1 : B i₁ = v₁ := by rw [hB i₁ (by simp)]; simp [v, hi.symm]
  obtain ⟨G, hGdef⟩ : ∃ G : EuclideanSpace ℝ (Fin d) → ℝ,
      G = fun y => F (s * inner ℝ v₀ y, s * inner ℝ v₁ y) := ⟨_, rfl⟩
  have hG : Continuous G := by rw [hGdef]; fun_prop
  have h1 : ∀ x : Fin d → ℝ, F (∑ i, a i * x i, ∑ i, b i * x i) = G (WithLp.toLp 2 x) := by
    intro x
    rw [hGdef]
    simp only [v₀, v₁, inner_toLp]
    congr 2 <;> (rw [Finset.mul_sum]; refine Finset.sum_congr rfl fun i _ => ?_; field_simp)
  have h2 : ∀ y : Fin d → ℝ, G (∑ i, y i • B i) = F (s * y i₀, s * y i₁) := by
    intro y
    rw [hGdef]
    simp only [← hB0, ← hB1, B.orthonormal.inner_right_fintype]
  simp_rw [h1]
  rw [stdGaussian, ← integral_map (PiLp.continuous_toLp 2 _).measurable.aemeasurable
    hG.aestronglyMeasurable, map_pi_eq_stdGaussian, stdGaussian_eq_map_pi_orthonormalBasis B,
    integral_map (φ := fun x : Fin d → ℝ => ∑ i, x i • B i)
      (by fun_prop : Measurable fun x : Fin d → ℝ => ∑ i, x i • B i).aemeasurable
      hG.aestronglyMeasurable]
  simp_rw [h2]
  exact integral_pi_two i₀ i₁ hi (fun p => F (s * p.1, s * p.2)) (by fun_prop)

end rotation

end Grothe.LowerAnalytic
