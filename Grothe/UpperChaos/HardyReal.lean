import Grothe.UpperChaos.HardyRealLaw
import Grothe.UpperChaos.HardyStep4
import Grothe.UpperChaos.Realise2
import Grothe.UpperChaos.Kernel2

/-!
# Hardy step 1(b): the real identification, and the `hardy` input of the sharp upper bound

For real `0 < t < 1` let `p = t P(t²)`, `q = t Q(t²)` (the preprocessors of the certificate), `R = Rt t`. Then

    ∑ⱼ hⱼ t^{2j+1} = HholPair Tround Tround (Rt t),     h = kernelCoeff (energy G_T)          (`hreal_GT`)

The left side is the Mehler correlation `E[conj G_T(X) G_T(Y)]` (`Bm_polyKernel`, `Bm_toLp`). Unfolding the
smoothing `G_T(x) = E_Z T(Mx + NZ)` (Fubini, `mehler_smoothed`) gives `E[conj T(U) T(V)]` for the smoothed
Mehler pair, whose law is that of `(u, Ru + Sw)` (`law_swap`), whose density is `kHol R` (`integral_pair_eq_kHol`).
`I − R² ≻ 0` because `R = M diag(p, q) M` with `‖M‖ ≤ 1` and `|p|, |q| ≤ t < 1` (`k11_pos`, `kdet_pos`).

With the region and circle mean of step 4 (`hardy_of_real`) this proves the `hardy` input for the actual rounding
(`hardy_GT`).
-/

open MeasureTheory Complex
open scoped ComplexConjugate

namespace Grothe.UpperChaos.HardyReal

noncomputable section

/-! ### The real correlations and `Rt t` -/

/-- `p = t P(t²)` and `q = t Q(t²)` for the two preprocessors. -/
def pr (t : ℝ) : ℝ := t * Grothe.Upper.primaryPoly.eval (t ^ 2)
def qr (t : ℝ) : ℝ := t * Grothe.Upper.auxPoly.eval (t ^ 2)

/-- The entries `a, b, c` of `R = M diag(p, q) M`. -/
def ra (t : ℝ) : ℝ := m00 ^ 2 * pr t + m01 ^ 2 * qr t
def rb (t : ℝ) : ℝ := m00 * m01 * pr t + m01 * m11 * qr t
def rc (t : ℝ) : ℝ := m01 ^ 2 * pr t + m11 ^ 2 * qr t

lemma Rt_real (t : ℝ) : Rt (t : ℂ) = Rre (ra t) (rb t) (rc t) := by
  have e1 : Polynomial.aeval ((t : ℂ) ^ 2) Grothe.Upper.primaryPoly =
      ((Grothe.Upper.primaryPoly.eval (t ^ 2) : ℝ) : ℂ) := by
    rw [← Complex.ofReal_pow]; exact (Polynomial.ofReal_eval (K := ℂ) _ _).symm
  have e2 : Polynomial.aeval ((t : ℂ) ^ 2) Grothe.Upper.auxPoly =
      ((Grothe.Upper.auxPoly.eval (t ^ 2) : ℝ) : ℂ) := by
    rw [← Complex.ofReal_pow]; exact (Polynomial.ofReal_eval (K := ℂ) _ _).symm
  simp only [Rt, Rre, e1, e2, ra, rb, rc, pr, qr]
  push_cast; ring_nf

lemma polyKernel_real (P : Polynomial ℝ) {t : ℝ} (ht : 0 ≤ t) :
    Grothe.polyKernel P (t : ℂ) = ((t * P.eval (t ^ 2) : ℝ) : ℂ) := by
  rw [Grothe.polyKernel, Complex.norm_real, Real.norm_of_nonneg ht]; push_cast; ring

lemma abs_mul_eval_le {P : Polynomial ℝ} (hP : Grothe.l1 P ≤ 1) {t : ℝ} (ht0 : 0 ≤ t) (ht1 : t ≤ 1) :
    |t * P.eval (t ^ 2)| ≤ t := by
  rw [abs_mul, abs_of_nonneg ht0]
  have := (Grothe.abs_eval_le_l1 P (sq_nonneg t) (by nlinarith)).trans hP
  nlinarith

lemma abs_pr_le {t : ℝ} (ht0 : 0 ≤ t) (ht1 : t ≤ 1) : |pr t| ≤ t :=
  abs_mul_eval_le Grothe.l1_primaryPoly ht0 ht1

lemma abs_qr_le {t : ℝ} (ht0 : 0 ≤ t) (ht1 : t ≤ 1) : |qr t| ≤ t :=
  abs_mul_eval_le Grothe.l1_auxPoly ht0 ht1

/-! ### `I − R² ≻ 0` -/

/-- `‖My‖ ≤ ‖y‖` (from `M² + N² = I`). -/
lemma normM_le (y₁ y₂ : ℝ) : (m00 * y₁ + m01 * y₂) ^ 2 + (m01 * y₁ + m11 * y₂) ^ 2 ≤ y₁ ^ 2 + y₂ ^ 2 := by
  have e : (m00 * y₁ + m01 * y₂) ^ 2 + (m01 * y₁ + m11 * y₂) ^ 2 + (n00 * y₁ + n01 * y₂) ^ 2
      + (n01 * y₁ + n11 * y₂) ^ 2 = y₁ ^ 2 + y₂ ^ 2 := by
    linear_combination y₁ ^ 2 * mn_00 + 2 * y₁ * y₂ * mn_01 + y₂ ^ 2 * mn_11
  nlinarith [sq_nonneg (n00 * y₁ + n01 * y₂), sq_nonneg (n01 * y₁ + n11 * y₂)]

/-- `‖Rx‖² ≤ t² ‖x‖²` for `R = M diag(p, q) M`, `|p|, |q| ≤ t`. -/
lemma normR_le {p q t : ℝ} (hp : |p| ≤ t) (hq : |q| ≤ t) (x₁ x₂ : ℝ) :
    ((m00 ^ 2 * p + m01 ^ 2 * q) * x₁ + (m00 * m01 * p + m01 * m11 * q) * x₂) ^ 2 +
      ((m00 * m01 * p + m01 * m11 * q) * x₁ + (m01 ^ 2 * p + m11 ^ 2 * q) * x₂) ^ 2 ≤
      t ^ 2 * (x₁ ^ 2 + x₂ ^ 2) := by
  set y₁ := m00 * x₁ + m01 * x₂
  set y₂ := m01 * x₁ + m11 * x₂
  have e1 : (m00 ^ 2 * p + m01 ^ 2 * q) * x₁ + (m00 * m01 * p + m01 * m11 * q) * x₂
      = m00 * (p * y₁) + m01 * (q * y₂) := by ring
  have e2 : (m00 * m01 * p + m01 * m11 * q) * x₁ + (m01 ^ 2 * p + m11 ^ 2 * q) * x₂
      = m01 * (p * y₁) + m11 * (q * y₂) := by ring
  rw [e1, e2]
  have h1 := normM_le (p * y₁) (q * y₂)
  have h2 := normM_le x₁ x₂
  have hp2 : p ^ 2 ≤ t ^ 2 := by rw [← sq_abs]; exact pow_le_pow_left₀ (abs_nonneg _) hp 2
  have hq2 : q ^ 2 ≤ t ^ 2 := by rw [← sq_abs]; exact pow_le_pow_left₀ (abs_nonneg _) hq 2
  have h3 : (p * y₁) ^ 2 + (q * y₂) ^ 2 ≤ t ^ 2 * (y₁ ^ 2 + y₂ ^ 2) := by
    rw [mul_pow, mul_pow]; nlinarith [sq_nonneg y₁, sq_nonneg y₂]
  have h4 : t ^ 2 * (y₁ ^ 2 + y₂ ^ 2) ≤ t ^ 2 * (x₁ ^ 2 + x₂ ^ 2) :=
    mul_le_mul_of_nonneg_left h2 (sq_nonneg t)
  linarith

/-- `k₁₁ > 0` and `det(I − R²) > 0` for real `0 ≤ t < 1`. -/
theorem k11_kdet_pos {t : ℝ} (ht0 : 0 ≤ t) (ht1 : t < 1) :
    0 < k11 (ra t) (rb t) ∧ 0 < kdet (ra t) (rb t) (rc t) := by
  have hp := abs_pr_le ht0 ht1.le
  have hq := abs_qr_le ht0 ht1.le
  have ht2 : t ^ 2 < 1 := by nlinarith
  -- the quadratic form of `K = I − R²` is `‖x‖² − ‖Rx‖² ≥ (1 − t²)‖x‖²`
  have hK : ∀ x₁ x₂ : ℝ, (1 - t ^ 2) * (x₁ ^ 2 + x₂ ^ 2) ≤
      k11 (ra t) (rb t) * x₁ ^ 2 + 2 * k12 (ra t) (rb t) (rc t) * x₁ * x₂ + k22 (rb t) (rc t) * x₂ ^ 2 := by
    intro x₁ x₂
    have := normR_le hp hq x₁ x₂
    simp only [k11, k12, k22, ra, rb, rc] at *
    nlinarith
  have h11 : 0 < k11 (ra t) (rb t) := by
    have := hK 1 0; nlinarith
  refine ⟨h11, ?_⟩
  have h := hK (-k12 (ra t) (rb t) (rc t)) (k11 (ra t) (rb t))
  have e : k11 (ra t) (rb t) * (-k12 (ra t) (rb t) (rc t)) ^ 2
      + 2 * k12 (ra t) (rb t) (rc t) * (-k12 (ra t) (rb t) (rc t)) * k11 (ra t) (rb t)
      + k22 (rb t) (rc t) * k11 (ra t) (rb t) ^ 2 = k11 (ra t) (rb t) * kdet (ra t) (rb t) (rc t) := by
    simp only [kdet]; ring
  rw [e] at h
  have hpos : 0 < (1 - t ^ 2) * ((-k12 (ra t) (rb t) (rc t)) ^ 2 + k11 (ra t) (rb t) ^ 2) := by
    have : 0 < 1 - t ^ 2 := by linarith
    positivity
  exact (pos_iff_pos_of_mul_pos (hpos.trans_le h)).1 h11

/-! ### The smoothed Mehler correlation -/

/-- `conj T(U) · T(V)`. -/
def hT (z : (ℂ × ℂ) × (ℂ × ℂ)) : ℂ := conj (Tround z.1) * Tround z.2

lemma measurable_hT : Measurable hT :=
  (Complex.continuous_conj.measurable.comp (measurable_Tround.comp measurable_fst)).mul
    (measurable_Tround.comp measurable_snd)

lemma norm_hT_le (hφ : PhiBound) (z : (ℂ × ℂ) × (ℂ × ℂ)) : ‖hT z‖ ≤ 1 := by
  rw [hT, norm_mul, Complex.norm_conj]
  nlinarith [norm_Tround_le hφ z.1, norm_Tround_le hφ z.2, norm_nonneg (Tround z.1), norm_nonneg (Tround z.2)]

lemma integrable_of_le_one {α : Type*} [MeasurableSpace α] {μ : Measure α} [IsFiniteMeasure μ]
    {f : α → ℂ} (hf : Measurable f) (h : ∀ x, ‖f x‖ ≤ 1) : Integrable f μ :=
  (integrable_const (1 : ℝ)).mono' hf.aestronglyMeasurable (Filter.Eventually.of_forall h)

/-- **Unfolding the smoothing** `G_T(x) = E_Z T(Mx + NZ)` (Fubini). -/
theorem mehler_smoothed (hφ : PhiBound) (p q : ℝ) :
    ∫ ω, conj (GT (Xof ω)) * GT (Yof p q ω) ∂mu4 =
      ∫ v, hT (mehlerPair p q v) ∂(mu4.prod (mu2.prod mu2)) := by
  have hm : Measurable fun v => hT (mehlerPair p q v) :=
    measurable_hT.comp (mehlerPair p q).continuous.measurable
  rw [integral_prod _ (integrable_of_le_one hm fun v => norm_hT_le hφ _)]
  congr 1; ext ω
  symm
  simp only [hT, mehlerPair, LinearMap.coe_toContinuousLinearMap', LinearMap.coe_mk, AddHom.coe_mk]
  rw [integral_prod_mul (fun Z => conj (Tround (smoothArg (Xof ω) Z)))
    (fun Z => Tround (smoothArg (Yof p q ω) Z)), integral_conj]
  rfl

/-- **The Mehler correlation of `G_T` is the continued kernel at a real point.** -/
theorem mehler_eq_HholPair (hφ : PhiBound) {t : ℝ} (ht0 : 0 < t) (ht1 : t < 1) :
    ∫ ω, conj (GT (Xof ω)) * GT (Yof (pr t) (qr t) ω) ∂mu4 = HholPair Tround Tround (Rt t) := by
  obtain ⟨h, hd⟩ := k11_kdet_pos ht0.le ht1
  have hp : |pr t| ≤ 1 := (abs_pr_le ht0.le ht1.le).trans ht1.le
  have hq : |qr t| ≤ 1 := (abs_qr_le ht0.le ht1.le).trans ht1.le
  rw [mehler_smoothed hφ, ← integral_map (mehlerPair (pr t) (qr t)).continuous.measurable.aemeasurable
      measurable_hT.aestronglyMeasurable, law_swap (a := ra t) (b := rb t) (c := rc t) hp hq rfl rfl rfl h hd,
    integral_map (pairMap _ _ _).continuous.measurable.aemeasurable measurable_hT.aestronglyMeasurable,
    integral_prod (fun v => hT (pairMap _ _ _ v))
      (integrable_of_le_one (measurable_hT.comp (pairMap _ _ _).continuous.measurable) fun v => norm_hT_le hφ _)]
  simp only [pairMap, LinearMap.coe_toContinuousLinearMap', LinearMap.coe_mk, AddHom.coe_mk]
  rw [integral_pair_eq_kHol h hd measurable_hT (norm_hT_le hφ), Rt_real]
  rfl

/-! ### The real identification and the `hardy` input -/

/-- The kernel coefficients of the rounding of the certificate. -/
abbrev hGT (hφ : PhiBound) : ℕ → ℝ := Grothe.Upper.kernelCoeff (energy ((memLp_GT hφ).toLp GT))

lemma summable_hGT (hφ : PhiBound) : Summable fun j => |hGT hφ j| :=
  Grothe.summable_kernelCoeff (summable_abs_energy _)

/-- **Step 1(b), the real identification**, for the rounding of the certificate. -/
theorem hreal_GT (hφ : PhiBound) (t : ℝ) (ht0 : 0 < t) (ht1 : t < 1) :
    HasSum (fun j => (hGT hφ j : ℂ) * (t : ℂ) ^ (2 * j + 1)) (HholPair Tround Tround (Rt t)) := by
  have hP : ‖Grothe.polyKernel Grothe.Upper.primaryPoly (t : ℂ)‖ ≤ 1 := by
    rw [polyKernel_real _ ht0.le, Complex.norm_real, Real.norm_eq_abs]
    exact (abs_pr_le ht0.le ht1.le).trans ht1.le
  have hQ : ‖Grothe.polyKernel Grothe.Upper.auxPoly (t : ℂ)‖ ≤ 1 := by
    rw [polyKernel_real _ ht0.le, Complex.norm_real, Real.norm_eq_abs]
    exact (abs_qr_le ht0.le ht1.le).trans ht1.le
  have hz : ‖(t : ℂ)‖ ≤ 1 := by rw [Complex.norm_real, Real.norm_of_nonneg ht0.le]; exact ht1.le
  have hB := Bm_polyKernel (chargeOne_toLp (memLp_GT hφ) fun c u hc => GT_rot2 hc u)
    Grothe.l1_primaryPoly Grothe.l1_auxPoly hz hP hQ
  rw [Bm_toLp (memLp_GT hφ) hP hQ, polyKernel_real _ ht0.le, polyKernel_real _ ht0.le] at hB
  change ∫ ω, conj (GT (Xof ω)) * GT (Yof (pr t) (qr t) ω) ∂mu4 = _ at hB
  rw [mehler_eq_HholPair hφ ht0 ht1] at hB
  rw [hB, radialKernel]
  have e : ∀ n : ℕ, ((Grothe.Upper.bivarKernel Grothe.Upper.primaryPoly Grothe.Upper.auxPoly
      (energy ((memLp_GT hφ).toLp GT)) n : ℝ) : ℂ) * ((t : ℂ) * (((‖(t : ℂ)‖ : ℝ) : ℂ)) ^ (2 * n)) =
      (hGT hφ n : ℂ) * (t : ℂ) ^ (2 * n + 1) := by
    intro n
    rw [Complex.norm_real, Real.norm_of_nonneg ht0.le]
    simp only [hGT, Grothe.Upper.kernelCoeff]; ring
  simp_rw [e]
  refine (Summable.of_norm_bounded (summable_hGT hφ) fun n => ?_).hasSum
  rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, norm_pow, Complex.norm_real,
    Real.norm_of_nonneg ht0.le]
  exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ ht0.le ht1.le)

/-- **The `hardy` input of the sharp upper bound, proved** for the rounding of the certificate. -/
theorem hardy_GT (hφ : PhiBound) (J : ℕ) :
    ∑ n ∈ Finset.range J, Grothe.Upper.kernelCoeff (energy ((memLp_GT hφ).toLp GT)) n ^ 2
      * (4149 / 4000 : ℝ) ^ (2 * (2 * n + 1)) ≤ 7 / 4 :=
  hardy_of_real measurable_Tround measurable_Tround (norm_Tround_le hφ) (norm_Tround_le hφ)
    (summable_hGT hφ) (hreal_GT hφ) J

/-- The same verified arc cover gives a stronger budget for the production rounding. -/
theorem hardy_GT_tight (hφ : PhiBound) (J : ℕ) :
    ∑ n ∈ Finset.range J, Grothe.Upper.kernelCoeff (energy ((memLp_GT hφ).toLp GT)) n ^ 2
      * (4149 / 4000 : ℝ) ^ (2 * (2 * n + 1)) ≤ 1737972 / 1000000 :=
  hardy_of_real_sharp measurable_Tround measurable_Tround (norm_Tround_le hφ) (norm_Tround_le hφ)
    (summable_hGT hφ) (hreal_GT hφ) J

end

end Grothe.UpperChaos.HardyReal
