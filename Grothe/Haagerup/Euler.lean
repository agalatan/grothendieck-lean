import Grothe.Haagerup.GaussG

/-!
# The Euler representation of the phase correlation

`|a|⁻¹ = π^{−1/2} ∫₀^∞ t^{−1/2} e^{−t|a|²} dt` (`integral_eul`) turns the phase correlation

  `Φ₂(z, s) = E[conj(phase U) · phase(zU + sW)]`  (`Phi2`, `phase a = a/|a|`, `phase 0 = 0`)

into `π⁻¹ ∫∫_{u,v>0} (uv)^{−1/2} G(u, v) du dv` (`Phi2_eq`), with `G(u,v) = 2z/Δ²`
(`integral_G`), after a Fubini swap (`integrable_eulF`).
-/

namespace Grothe.Haag

open MeasureTheory ProbabilityTheory Real Set
open scoped ComplexConjugate

noncomputable section

/-- The phase `a/|a|` (`0` at `0`). -/
def ph (a : ℂ) : ℂ := a / ((‖a‖ : ℝ) : ℂ)

lemma norm_ph_le (a : ℂ) : ‖ph a‖ ≤ 1 := by
  unfold ph
  rcases eq_or_ne a 0 with rfl | ha
  · simp
  · rw [norm_div, Complex.norm_real, Real.norm_of_nonneg (norm_nonneg _),
      div_self (norm_ne_zero_iff.2 ha)]

/-- The phase correlation `E[conj(phase U) · phase(zU + sW)]`. -/
def Phi2 (z : ℂ) (s : ℝ) : ℂ :=
  ∫ p, conj (ph (cx p.1)) * ph (z * cx p.1 + (s : ℂ) * cx p.2) ∂g4

/-- The Euler weight `t^{−1/2} e^{−t r²}`. -/
def eul (r t : ℝ) : ℝ := t ^ (-(1 / 2 : ℝ)) * rexp (-(t * r ^ 2))

/-- The measure `dt` on `(0, ∞)`. -/
abbrev muI : Measure ℝ := volume.restrict (Ioi 0)

lemma integrable_eul {r : ℝ} (hr : 0 < r) : Integrable (eul r) muI := by
  have := integrableOn_rpow_mul_exp_neg_mul_rpow (p := 1) (s := -(1 / 2 : ℝ)) (b := r ^ 2)
    (by norm_num) one_pos (by positivity)
  refine this.congr_fun (fun t _ => ?_) measurableSet_Ioi
  simp only [eul, Real.rpow_one]
  ring_nf

lemma integral_eul {r : ℝ} (hr : 0 < r) : ∫ t, eul r t ∂muI = √π / r := by
  have h := Real.integral_rpow_mul_exp_neg_mul_Ioi (a := 1 / 2) (r := r ^ 2) (by norm_num)
    (by positivity)
  have e1 : ∫ t in Ioi (0 : ℝ), eul r t = ∫ t in Ioi (0 : ℝ), t ^ ((1 / 2 : ℝ) - 1)
      * rexp (-(r ^ 2 * t)) := by
    refine setIntegral_congr_fun measurableSet_Ioi fun t _ => ?_
    simp only [eul]
    rw [show (1 / 2 : ℝ) - 1 = -(1 / 2) by norm_num, mul_comm (r ^ 2) t]
  rw [e1, h, Real.Gamma_one_half_eq, ← Real.sqrt_eq_rpow, Real.sqrt_div' _ (sq_nonneg r),
    Real.sqrt_sq hr.le, Real.sqrt_one]
  ring

lemma eul_nonneg {r t : ℝ} (ht : 0 ≤ t) : 0 ≤ eul r t :=
  mul_nonneg (Real.rpow_nonneg ht _) (exp_pos _).le

/-- `conj(phase a) · phase b = π⁻¹ conj(a) b ∫∫ eul eul`. -/
lemma conj_ph_mul_ph (a b : ℂ) :
    conj (ph a) * ph b = ((π : ℝ) : ℂ)⁻¹ * (conj a * b
      * ((∫ q, eul ‖a‖ q.1 * eul ‖b‖ q.2 ∂(muI.prod muI) : ℝ) : ℂ)) := by
  rcases eq_or_ne a 0 with rfl | ha
  · simp [ph]
  rcases eq_or_ne b 0 with rfl | hb
  · simp [ph]
  have ha' : 0 < ‖a‖ := norm_pos_iff.2 ha
  have hb' : 0 < ‖b‖ := norm_pos_iff.2 hb
  rw [integral_prod_mul (fun t => eul ‖a‖ t) (fun t => eul ‖b‖ t), integral_eul ha',
    integral_eul hb']
  have hpi : (0 : ℝ) < π := Real.pi_pos
  have hs : √π * √π = π := Real.mul_self_sqrt hpi.le
  unfold ph
  rw [map_div₀, Complex.conj_ofReal]
  have hpi' : ((π : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hpi.ne'
  have ha'' : ((‖a‖ : ℝ) : ℂ) ≠ 0 := by exact_mod_cast ha'.ne'
  have hb'' : ((‖b‖ : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hb'.ne'
  have hsC : ((√π : ℝ) : ℂ) * ((√π : ℝ) : ℂ) = ((π : ℝ) : ℂ) := by exact_mod_cast hs
  push_cast
  rw [show ((√π : ℝ) : ℂ) / ((‖a‖ : ℝ) : ℂ) * (((√π : ℝ) : ℂ) / ((‖b‖ : ℝ) : ℂ))
      = ((π : ℝ) : ℂ) / (((‖a‖ : ℝ) : ℂ) * ((‖b‖ : ℝ) : ℂ)) by rw [div_mul_div_comm, hsC]]
  field_simp

/-- The integrand of the Fubini swap. -/
def eulF (z : ℂ) (s : ℝ) (p : (ℝ × ℝ) × (ℝ × ℝ)) (q : ℝ × ℝ) : ℂ :=
  conj (cx p.1) * (z * cx p.1 + (s : ℂ) * cx p.2)
    * ((eul ‖cx p.1‖ q.1 * eul ‖z * cx p.1 + (s : ℂ) * cx p.2‖ q.2 : ℝ) : ℂ)

lemma integral_norm_eulF (z : ℂ) (s : ℝ) (p : (ℝ × ℝ) × (ℝ × ℝ)) :
    ∫ q, ‖eulF z s p q‖ ∂(muI.prod muI) ≤ π := by
  set a := cx p.1
  set b := z * cx p.1 + (s : ℂ) * cx p.2
  have e : ∀ q : ℝ × ℝ, ‖eulF z s p q‖ = ‖a‖ * ‖b‖ * (|eul ‖a‖ q.1| * |eul ‖b‖ q.2|) := fun q => by
    simp only [eulF, norm_mul, Complex.norm_conj, Complex.norm_real, Real.norm_eq_abs]
    rfl
  simp_rw [e]
  rw [integral_const_mul, integral_prod_mul (fun t => |eul ‖a‖ t|) (fun t => |eul ‖b‖ t|)]
  rcases eq_or_ne a 0 with ha | ha
  · simp [ha, Real.pi_pos.le]
  rcases eq_or_ne b 0 with hb | hb
  · simp [hb, Real.pi_pos.le]
  have ha' : 0 < ‖a‖ := norm_pos_iff.2 ha
  have hb' : 0 < ‖b‖ := norm_pos_iff.2 hb
  have habs : ∀ r, ∫ t, |eul r t| ∂muI = ∫ t, eul r t ∂muI := fun r =>
    setIntegral_congr_fun measurableSet_Ioi fun t ht => abs_of_nonneg (eul_nonneg (le_of_lt ht))
  rw [habs, habs, integral_eul ha', integral_eul hb']
  have hs : √π * √π = π := Real.mul_self_sqrt Real.pi_pos.le
  apply le_of_eq
  field_simp
  linarith [hs]

lemma measurable_eul : Measurable (fun q : ℝ × ℝ × ℝ => eul q.1 q.2.1) := by
  unfold eul; fun_prop

lemma aestronglyMeasurable_eulF (z : ℂ) (s : ℝ) :
    AEStronglyMeasurable (Function.uncurry (eulF z s)) (g4.prod (muI.prod muI)) := by
  apply Measurable.aestronglyMeasurable
  unfold eulF eul
  fun_prop

lemma integrable_eulF (z : ℂ) (s : ℝ) :
    Integrable (Function.uncurry (eulF z s)) (g4.prod (muI.prod muI)) := by
  rw [integrable_prod_iff (aestronglyMeasurable_eulF z s)]
  refine ⟨Filter.Eventually.of_forall fun p => ?_, ?_⟩
  · simp only [Function.uncurry_apply_pair]
    set a := cx p.1
    set b := z * cx p.1 + (s : ℂ) * cx p.2
    rcases eq_or_ne a 0 with ha | ha
    · simp only [eulF]
      rw [show cx p.1 = a from rfl, ha]
      simp
    rcases eq_or_ne b 0 with hb | hb
    · simp only [eulF]
      rw [show z * cx p.1 + (s : ℂ) * cx p.2 = b from rfl, hb]
      simp
    have h := ((integrable_eul (norm_pos_iff.2 ha)).mul_prod
      (integrable_eul (norm_pos_iff.2 hb))).ofReal (𝕜 := ℂ)
    exact h.const_mul (conj a * b)
  · refine (integrable_const π).mono' ?_ (Filter.Eventually.of_forall fun p => ?_)
    · exact (aestronglyMeasurable_eulF z s).norm.integral_prod_right'
    · rw [Real.norm_of_nonneg (integral_nonneg fun _ => norm_nonneg _)]
      exact integral_norm_eulF z s p

/-- **The Euler form**: `Φ₂ = π⁻¹ ∫∫ (uv)^{−1/2} G(u,v)`. -/
theorem Phi2_eq (z : ℂ) (s : ℝ) :
    Phi2 z s = ((π : ℝ) : ℂ)⁻¹ * ∫ q, (((q.1 ^ (-(1 / 2 : ℝ)) * q.2 ^ (-(1 / 2 : ℝ))) : ℝ) : ℂ)
      * (2 * z / ((Delta q.1 q.2 z s : ℝ) : ℂ) ^ 2) ∂(muI.prod muI) := by
  have h1 : ∀ p : (ℝ × ℝ) × (ℝ × ℝ), conj (ph (cx p.1)) * ph (z * cx p.1 + (s : ℂ) * cx p.2)
      = ((π : ℝ) : ℂ)⁻¹ * ∫ q, eulF z s p q ∂(muI.prod muI) := fun p => by
    rw [conj_ph_mul_ph, ← integral_complex_ofReal, ← integral_const_mul]
    rfl
  rw [Phi2]
  simp_rw [h1]
  rw [integral_const_mul, integral_integral_swap (integrable_eulF z s)]
  congr 1
  refine integral_congr_ae ?_
  have hae : ∀ᵐ q ∂(muI.prod muI), 0 < q.1 ∧ 0 < q.2 := by
    have h : ∀ᵐ q ∂(muI.prod muI), q ∈ Ioi (0 : ℝ) ×ˢ Ioi (0 : ℝ) := by
      rw [Measure.prod_restrict]
      exact ae_restrict_mem (measurableSet_Ioi.prod measurableSet_Ioi)
    exact h.mono fun q hq => ⟨hq.1, hq.2⟩
  filter_upwards [hae] with q hq
  have e : ∀ p : (ℝ × ℝ) × (ℝ × ℝ), eulF z s p q
      = (((q.1 ^ (-(1 / 2 : ℝ)) * q.2 ^ (-(1 / 2 : ℝ))) : ℝ) : ℂ)
        * (conj (cx p.1) * (z * cx p.1 + (s : ℂ) * cx p.2)
          * ((rexp (-(q.1 * ‖cx p.1‖ ^ 2)) * rexp (-(q.2 * ‖z * cx p.1 + (s : ℂ) * cx p.2‖ ^ 2))
            : ℝ) : ℂ)) := fun p => by
    simp only [eulF, eul]
    push_cast
    ring
  simp_rw [e]
  rw [integral_const_mul, integral_G hq.1.le hq.2.le z s]
