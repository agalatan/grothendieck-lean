import Grothe.LowerAnalytic.GaussianRadial

/-!
# The standard complex Gaussian and its rotation invariance

The measure `gaussC` is the law of `(x₀ + i x₁)/√2` for independent standard real
Gaussians. This shared foundation provides its planar presentation, change-of-variables
interfaces, rotation invariance and the radial-moment reduction used by both the
complex Hermite calculus and the lower-bound fibre theory.
-/

open MeasureTheory ProbabilityTheory Real Set MvPolynomial
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

/-! ### Planar presentation and rotation invariance -/

/-- `(x, y) ↦ (x + iy)/√2`. -/
def F2 (p : ℝ × ℝ) : ℂ := ((p.1 : ℂ) + (p.2 : ℂ) * Complex.I) / (√2 : ℝ)

lemma measurable_F2 : Measurable F2 := by unfold F2; fun_prop

lemma gaussC_eq_map : gaussC = gauss2.map F2 := by
  have h := pi_map_two (ι := Fin 2) 0 1 (by decide)
  rw [gaussC, ← h, Measure.map_map measurable_F2 (by fun_prop)]
  rfl

lemma toC_eq_F2 (x : Fin 2 → ℝ) : toC x = F2 (x 0, x 1) := rfl

lemma integral_gaussC_eq_gauss2 (f : ℂ → ℝ) (hf : Continuous f) :
    ∫ z, f z ∂gaussC = ∫ p, f (F2 p) ∂gauss2 := by
  rw [gaussC_eq_map, integral_map measurable_F2.aemeasurable hf.aestronglyMeasurable]

/-- Rotation invariance for continuous integrands. -/
lemma integral_rot_continuous (c : ℂ) (hc : ‖c‖ = 1) (f : ℂ → ℝ) (hf : Continuous f) :
    ∫ z, f (c * z) ∂gaussC = ∫ z, f z ∂gaussC := by
  have hc2 : c.re ^ 2 + c.im ^ 2 = 1 := by
    have h0 : Complex.normSq c = 1 := by rw [Complex.normSq_eq_norm_sq, hc, one_pow]
    rw [Complex.normSq_apply] at h0
    nlinarith
  have hF : Continuous fun p : ℝ × ℝ => f (F2 p) := hf.comp (by unfold F2; fun_prop)
  have h := integral_two_linear (d := 2) le_rfl ![c.re, -c.im] ![c.im, c.re] 1 one_pos
    (by simp [Fin.sum_univ_two]; linarith) (by simp [Fin.sum_univ_two]; linarith)
    (by simp [Fin.sum_univ_two]; ring) (fun p => f (F2 p)) hF
  simp only [one_mul] at h
  rw [← integral_gaussC_eq_gauss2 f hf] at h
  rw [integral_gaussC_of_continuous (fun z => f (c * z)) (hf.comp (continuous_const.mul continuous_id)), ← h]
  congr 1
  funext x
  congr 1
  apply Complex.ext <;>
    simp [toC, F2, Fin.sum_univ_two, Complex.mul_re, Complex.mul_im, Complex.div_ofReal_re,
      Complex.div_ofReal_im] <;> ring

/-- **Rotation invariance of the standard complex Gaussian.** -/
theorem map_rot_gaussC (c : ℂ) (hc : ‖c‖ = 1) : gaussC.map (fun z => c * z) = gaussC := by
  have hm : Measurable fun z : ℂ => c * z := by fun_prop
  have : IsFiniteMeasure (gaussC.map fun z => c * z) := Measure.isFiniteMeasure_map _ _
  refine ext_of_forall_integral_eq_of_IsFiniteMeasure fun f => ?_
  rw [integral_map hm.aemeasurable f.continuous.aestronglyMeasurable]
  exact integral_rot_continuous c hc f f.continuous

/-- Rotation invariance of integrals. -/
theorem integral_rot_gaussC {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] (c : ℂ)
    (hc : ‖c‖ = 1) (f : ℂ → E) : ∫ z, f (c * z) ∂gaussC = ∫ z, f z ∂gaussC := by
  have hc0 : c ≠ 0 := by rintro rfl; simp at hc
  let e : ℂ ≃ᵐ ℂ :=
    { toFun := fun z => c * z, invFun := fun z => c⁻¹ * z,
      left_inv := fun z => by simp [hc0], right_inv := fun z => by simp [hc0],
      measurable_toFun := measurable_const.mul measurable_id,
      measurable_invFun := measurable_const.mul measurable_id }
  have := integral_map_equiv e f (μ := gaussC)
  rw [show (⇑e) = fun z => c * z from rfl, map_rot_gaussC c hc] at this
  exact this.symm

/-! ### Radial moments -/

lemma integral_normSq_pow (k : ℕ) (P : MvPolynomial (Fin 2) ℝ)
    (hP : ∀ x, eval x P = (x 0 ^ 2 + x 1 ^ 2) ^ k) :
    ∫ z, Complex.normSq z ^ k ∂gaussC = gaussE 2 P / 2 ^ k := by
  rw [integral_gaussC_of_continuous (fun z => Complex.normSq z ^ k) (Complex.continuous_normSq.pow k)]
  simp_rw [normSq_toC, div_pow]
  rw [integral_div, gaussE_apply]
  congr 1
  exact integral_congr_ae (Filter.Eventually.of_forall fun x => (hP x).symm)

/-! ### Orthogonality of distinct charges -/

/-- If `G(cz) = −G(z)` for some `|c| = 1`, then `E G = 0`. -/
lemma integral_eq_zero_of_rot (G : ℂ → ℂ) (c : ℂ) (hc : ‖c‖ = 1) (hG : ∀ z, G (c * z) = -G z) :
    ∫ z, G z ∂gaussC = 0 := by
  have h := integral_rot_gaussC c hc G
  simp_rw [hG, integral_neg] at h
  have : (2 : ℂ) * ∫ z, G z ∂gaussC = 0 := by linear_combination -h
  exact (mul_eq_zero.1 this).resolve_left two_ne_zero

end

end Grothe.LowerAnalytic
