import Grothe.LowerAnalytic.Potential

/-!
# Polar cells of the complex Gaussian (route Core, integration)

* `integral_gaussC_eq_volume`: `∫ F dγ = ∫ π⁻¹ e^{−|z|²} F(z) dz` (Lebesgue on `ℂ`) for measurable `F`;
* `integral_gaussC_polar`: in polar coordinates, `∫ F dγ = ∫_{(0,∞)×(−π,π)} r π⁻¹ e^{−r²} F(re^{iθ})`;
* `cellInd ra rb θa θb`: the indicator of the polar cell `{ra ≤ |z| < rb, θa < arg z ≤ θb}`;
* `integral_cell_cos`, `integral_cell_sin`: for `0 ≤ ra ≤ rb`, `−π ≤ θa ≤ θb ≤ π`,
  `∫ 1_cell |z|^m cos(n arg z) dγ = π⁻¹ (∫_{ra}^{rb} r^{m+1} e^{−r²}) (∫_{θa}^{θb} cos nθ)` (and `sin`);
* `integral_tail_cos`, `integral_tail_sin`: the same on `{|z| ≥ R}` with `∫_R^∞` and `θ ∈ (−π, π)`.
-/

open MeasureTheory ProbabilityTheory Real Set
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-- `(p₁ + i p₂)/√2`. -/
def toC2 (p : ℝ × ℝ) : ℂ := ((p.1 : ℂ) + (p.2 : ℂ) * Complex.I) / (√2 : ℝ)

lemma measurable_toC2 : Measurable toC2 := by unfold toC2; fun_prop

/-- **The density of `γ`**: `∫ F dγ = ∫ π⁻¹ e^{−|z|²} F(z) dz`. -/
theorem integral_gaussC_eq_volume (F : ℂ → ℝ) (hF : Measurable F) :
    ∫ z, F z ∂gaussC = ∫ z : ℂ, (π⁻¹ * exp (-Complex.normSq z)) * F z := by
  rw [integral_gaussC F hF.aestronglyMeasurable]
  have h := (measurePreserving_finTwoArrow (gaussianReal 0 1)).map_eq
  have e1 : ∫ x, F (toC x) ∂(stdGaussian 2) = ∫ p, F (toC2 p) ∂gauss2 := by
    have : (fun x : Fin 2 → ℝ => F (toC x)) = fun x => (F ∘ toC2) (MeasurableEquiv.finTwoArrow x) := by
      funext x; rfl
    rw [this, ← integral_map (by fun_prop) (hF.comp measurable_toC2).aestronglyMeasurable]
    rw [stdGaussian, h]
    rfl
  rw [e1, integral_gauss2_eq]
  -- ℝ × ℝ → ℂ and the scaling by √2
  have e2 : ∫ p : ℝ × ℝ, gaussianPDFReal 0 1 p.1 * gaussianPDFReal 0 1 p.2 * F (toC2 p)
      = ∫ z : ℂ, gaussianPDFReal 0 1 z.re * gaussianPDFReal 0 1 z.im
          * F (toC2 (z.re, z.im)) := by
    rw [← (Complex.volume_preserving_equiv_real_prod.symm).integral_comp
      Complex.measurableEquivRealProd.symm.measurableEmbedding]
    rfl
  rw [e2]
  have e3 := Measure.integral_comp_smul (μ := (volume : Measure ℂ))
    (fun z : ℂ => gaussianPDFReal 0 1 z.re * gaussianPDFReal 0 1 z.im * F (toC2 (z.re, z.im))) √2
  rw [Complex.finrank_real_complex] at e3
  have hs : (√2 : ℝ) ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  rw [hs] at e3
  have e4 : ∀ w : ℂ, gaussianPDFReal 0 1 ((√2 : ℝ) • w).re * gaussianPDFReal 0 1 ((√2 : ℝ) • w).im
      * F (toC2 (((√2 : ℝ) • w).re, ((√2 : ℝ) • w).im))
      = (2 * π)⁻¹ * exp (-Complex.normSq w) * F w := by
    intro w
    have h2 : (√2 : ℝ) ≠ 0 := by positivity
    have ht : toC2 (((√2 : ℝ) • w).re, ((√2 : ℝ) • w).im) = w := by
      unfold toC2
      apply Complex.ext <;> simp [Complex.div_re, Complex.div_im, Complex.normSq_ofReal] <;>
        field_simp <;> rw [hs] <;> ring
    rw [ht, gaussianPDFReal_mul]
    congr 2
    simp only [Complex.smul_re, Complex.smul_im, smul_eq_mul, Complex.normSq_apply]
    rw [mul_pow, mul_pow, hs]; ring_nf
  simp_rw [e4] at e3
  have e5 : ∫ z : ℂ, π⁻¹ * exp (-Complex.normSq z) * F z
      = 2 * ∫ w : ℂ, (2 * π)⁻¹ * exp (-Complex.normSq w) * F w := by
    rw [← integral_const_mul]
    congr 1; funext w
    field_simp
  rw [e5, e3, smul_eq_mul]
  norm_num
  ring

/-- **Polar coordinates for `γ`.** -/
theorem integral_gaussC_polar (F : ℂ → ℝ) (hF : Measurable F) :
    ∫ z, F z ∂gaussC = ∫ p in Ioi (0 : ℝ) ×ˢ Ioo (-π) π,
      p.1 * (π⁻¹ * exp (-p.1 ^ 2)) * F (Complex.polarCoord.symm p) := by
  rw [integral_gaussC_eq_volume F hF, ← Complex.integral_comp_polarCoord_symm,
    polarCoord_target]
  congr 1; funext p
  rw [smul_eq_mul, Complex.normSq_eq_norm_sq, Complex.norm_polarCoord_symm, sq_abs]
  ring

lemma norm_polarCoord_symm_of_mem {p : ℝ × ℝ} (hp : p ∈ Ioi (0 : ℝ) ×ˢ Ioo (-π) π) :
    ‖Complex.polarCoord.symm p‖ = p.1 := by
  rw [Complex.norm_polarCoord_symm, abs_of_pos hp.1]

lemma arg_polarCoord_symm_of_mem {p : ℝ × ℝ} (hp : p ∈ Ioi (0 : ℝ) ×ˢ Ioo (-π) π) :
    Complex.arg (Complex.polarCoord.symm p) = p.2 := by
  rw [Complex.polarCoord_symm_apply, Complex.arg_real_mul _ hp.1]
  rw [Complex.ofReal_cos, Complex.ofReal_sin]
  exact Complex.arg_cos_add_sin_mul_I ⟨hp.2.1, hp.2.2.le⟩

/-- Two indicators of sets with finite symmetric difference have the same integral. -/
lemma integral_indicator_congr_finite (F : ℝ → ℝ) {S T : Set ℝ} {X : Set ℝ} (hX : X.Finite) (h : ∀ x ∉ X, (x ∈ S ↔ x ∈ T)) :
    ∫ x, S.indicator F x = ∫ x, T.indicator F x := by
  refine integral_congr_ae ?_
  have h0 : (volume : Measure ℝ) X = 0 := hX.measure_zero _
  have : ∀ᵐ x ∂(volume : Measure ℝ), x ∉ X := measure_eq_zero_iff_ae_notMem.1 h0
  filter_upwards [this] with x hx
  by_cases hxS : x ∈ S
  · rw [indicator_of_mem hxS, indicator_of_mem ((h x hx).1 hxS)]
  · rw [indicator_of_notMem hxS, indicator_of_notMem (fun h' => hxS ((h x hx).2 h'))]

/-- The indicator of the polar cell `{ra ≤ |z| < rb, θa < arg z ≤ θb}`. -/
def cellInd (ra rb θa θb : ℝ) (z : ℂ) : ℝ :=
  if ra ≤ ‖z‖ ∧ ‖z‖ < rb ∧ θa < Complex.arg z ∧ Complex.arg z ≤ θb then 1 else 0

lemma measurable_cellInd (ra rb θa θb : ℝ) : Measurable (cellInd ra rb θa θb) := by
  unfold cellInd
  refine Measurable.ite ?_ measurable_const measurable_const
  refine ((measurableSet_le measurable_const measurable_norm).inter
    ((measurableSet_lt measurable_norm measurable_const).inter
    ((measurableSet_lt measurable_const Complex.measurable_arg).inter
    (measurableSet_le Complex.measurable_arg measurable_const))))

/-- The indicator of the tail `{|z| ≥ R}`. -/
def tailInd (R : ℝ) (z : ℂ) : ℝ := if R ≤ ‖z‖ then 1 else 0

lemma measurable_tailInd (R : ℝ) : Measurable (tailInd R) := by
  unfold tailInd
  exact Measurable.ite (measurableSet_le measurable_const measurable_norm) measurable_const
    measurable_const

/-- The product form of a set integral over the polar target. -/
lemma setIntegral_target_mul (f g : ℝ → ℝ) :
    ∫ p in Ioi (0 : ℝ) ×ˢ Ioo (-π) π, f p.1 * g p.2
      = (∫ r in Ioi (0 : ℝ), f r) * ∫ θ in Ioo (-π) π, g θ := by
  rw [Measure.volume_eq_prod]
  exact setIntegral_prod_mul f g _ _

/-- **The integral of a polar monomial over a cell.** -/
theorem integral_cell (g : ℝ → ℝ) (hg : Measurable g) (m : ℕ) {ra rb θa θb : ℝ} (hra : 0 ≤ ra)
    (hab : ra ≤ rb) (hθa : -π ≤ θa) (hθ : θa ≤ θb) (hθb : θb ≤ π) :
    ∫ z, cellInd ra rb θa θb z * (‖z‖ ^ m * g (Complex.arg z)) ∂gaussC
      = π⁻¹ * (∫ r in ra..rb, r ^ (m + 1) * exp (-r ^ 2)) * ∫ θ in θa..θb, g θ := by
  rw [integral_gaussC_polar (fun z => cellInd ra rb θa θb z * (‖z‖ ^ m * g (Complex.arg z)))
    ((measurable_cellInd _ _ _ _).mul
      ((measurable_norm.pow_const m).mul (hg.comp Complex.measurable_arg)))]
  have hpt : ∀ p ∈ Ioi (0 : ℝ) ×ˢ Ioo (-π) π,
      p.1 * (π⁻¹ * exp (-p.1 ^ 2)) * (cellInd ra rb θa θb (Complex.polarCoord.symm p)
        * (‖Complex.polarCoord.symm p‖ ^ m * g (Complex.arg (Complex.polarCoord.symm p))))
      = (Ico ra rb).indicator (fun r => π⁻¹ * (r ^ (m + 1) * exp (-r ^ 2))) p.1
        * (Ioc θa θb).indicator g p.2 := by
    intro p hp
    rw [norm_polarCoord_symm_of_mem hp, arg_polarCoord_symm_of_mem hp]
    unfold cellInd
    rw [norm_polarCoord_symm_of_mem hp, arg_polarCoord_symm_of_mem hp]
    by_cases h1 : p.1 ∈ Ico ra rb <;> by_cases h2 : p.2 ∈ Ioc θa θb
    · have hc : ra ≤ p.1 ∧ p.1 < rb ∧ θa < p.2 ∧ p.2 ≤ θb := ⟨h1.1, h1.2, h2.1, h2.2⟩
      rw [indicator_of_mem h1, indicator_of_mem h2]
      simp only [hc.1, hc.2.1, hc.2.2.1, hc.2.2.2, and_self, ↓reduceIte]; ring
    · have hc : ¬(ra ≤ p.1 ∧ p.1 < rb ∧ θa < p.2 ∧ p.2 ≤ θb) := fun h => h2 ⟨h.2.2.1, h.2.2.2⟩
      rw [indicator_of_notMem h2]; simp only [hc, ↓reduceIte]; ring
    · have hc : ¬(ra ≤ p.1 ∧ p.1 < rb ∧ θa < p.2 ∧ p.2 ≤ θb) := fun h => h1 ⟨h.1, h.2.1⟩
      rw [indicator_of_notMem h1]; simp only [hc, ↓reduceIte]; ring
    · have hc : ¬(ra ≤ p.1 ∧ p.1 < rb ∧ θa < p.2 ∧ p.2 ≤ θb) := fun h => h1 ⟨h.1, h.2.1⟩
      rw [indicator_of_notMem h1]; simp only [hc, ↓reduceIte]; ring
  rw [setIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo) hpt,
    setIntegral_target_mul]
  have hr : ∫ r in Ioi (0 : ℝ), (Ico ra rb).indicator (fun r => π⁻¹ * (r ^ (m + 1) * exp (-r ^ 2))) r
      = π⁻¹ * ∫ r in ra..rb, r ^ (m + 1) * exp (-r ^ 2) := by
    rw [intervalIntegral.integral_of_le hab, ← integral_const_mul,
      ← integral_indicator measurableSet_Ioi, ← integral_indicator measurableSet_Ioc]
    rw [show (Ioi (0 : ℝ)).indicator ((Ico ra rb).indicator
        fun r => π⁻¹ * (r ^ (m + 1) * exp (-r ^ 2)))
        = (Ioi 0 ∩ Ico ra rb).indicator fun r => π⁻¹ * (r ^ (m + 1) * exp (-r ^ 2)) from
      (indicator_indicator _ _ _)]
    refine integral_indicator_congr_finite _ (X := {0, ra, rb}) (by simp) fun x hx => ?_
    simp only [mem_insert_iff, mem_singleton_iff, not_or] at hx
    simp only [mem_inter_iff, mem_Ioi, mem_Ico, mem_Ioc]
    constructor
    · rintro ⟨-, h1, h2⟩; exact ⟨lt_of_le_of_ne h1 (Ne.symm hx.2.1), h2.le⟩
    · rintro ⟨h1, h2⟩
      exact ⟨lt_of_le_of_lt hra h1, h1.le, lt_of_le_of_ne h2 hx.2.2⟩
  have ht : ∫ θ in Ioo (-π) π, (Ioc θa θb).indicator g θ = ∫ θ in θa..θb, g θ := by
    rw [intervalIntegral.integral_of_le hθ, ← integral_indicator measurableSet_Ioo,
      ← integral_indicator measurableSet_Ioc, indicator_indicator]
    refine integral_indicator_congr_finite _ (X := {π}) (by simp) fun x hx => ?_
    simp only [mem_singleton_iff] at hx
    simp only [mem_inter_iff, mem_Ioo, mem_Ioc]
    constructor
    · rintro ⟨-, h⟩; exact h
    · rintro ⟨h1, h2⟩
      exact ⟨⟨lt_of_le_of_lt hθa h1, lt_of_le_of_ne (h2.trans hθb) hx⟩, h1, h2⟩
  rw [hr, ht]

/-- **The integral of a polar monomial over the tail** `{|z| ≥ R}`. -/
theorem integral_tail (g : ℝ → ℝ) (hg : Measurable g) (m : ℕ) {R : ℝ} (hR : 0 < R) :
    ∫ z, tailInd R z * (‖z‖ ^ m * g (Complex.arg z)) ∂gaussC
      = π⁻¹ * (∫ r in Ioi R, r ^ (m + 1) * exp (-r ^ 2)) * ∫ θ in (-π)..π, g θ := by
  rw [integral_gaussC_polar (fun z => tailInd R z * (‖z‖ ^ m * g (Complex.arg z)))
    ((measurable_tailInd _).mul
      ((measurable_norm.pow_const m).mul (hg.comp Complex.measurable_arg)))]
  have hpt : ∀ p ∈ Ioi (0 : ℝ) ×ˢ Ioo (-π) π,
      p.1 * (π⁻¹ * exp (-p.1 ^ 2)) * (tailInd R (Complex.polarCoord.symm p)
        * (‖Complex.polarCoord.symm p‖ ^ m * g (Complex.arg (Complex.polarCoord.symm p))))
      = (Ici R).indicator (fun r => π⁻¹ * (r ^ (m + 1) * exp (-r ^ 2))) p.1 * g p.2 := by
    intro p hp
    rw [norm_polarCoord_symm_of_mem hp, arg_polarCoord_symm_of_mem hp]
    unfold tailInd
    rw [norm_polarCoord_symm_of_mem hp]
    by_cases h1 : p.1 ∈ Ici R
    · have hc : R ≤ p.1 := h1
      rw [indicator_of_mem h1]; simp only [hc, ↓reduceIte]; ring
    · have hc : ¬ R ≤ p.1 := h1
      rw [indicator_of_notMem h1]; simp only [hc, ↓reduceIte]; ring
  rw [setIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo) hpt,
    setIntegral_target_mul]
  have hr : ∫ r in Ioi (0 : ℝ), (Ici R).indicator (fun r => π⁻¹ * (r ^ (m + 1) * exp (-r ^ 2))) r
      = π⁻¹ * ∫ r in Ioi R, r ^ (m + 1) * exp (-r ^ 2) := by
    rw [← integral_const_mul, ← integral_indicator measurableSet_Ioi,
      ← integral_indicator measurableSet_Ioi, indicator_indicator]
    refine integral_indicator_congr_finite _ (X := {R}) (by simp) fun x hx => ?_
    simp only [mem_singleton_iff] at hx
    simp only [mem_inter_iff, mem_Ioi, mem_Ici]
    constructor
    · rintro ⟨-, h⟩; exact lt_of_le_of_ne h (Ne.symm hx)
    · intro h; exact ⟨hR.trans h, h.le⟩
  have ht : ∫ θ in Ioo (-π) π, g θ = ∫ θ in (-π)..π, g θ := by
    rw [intervalIntegral.integral_of_le (by linarith [pi_pos]), integral_Ioc_eq_integral_Ioo]
  rw [hr, ht]

end

end Grothe.LowerAnalytic
