import Grothe.Haagerup.Euler

/-!
# The Beta-type integrals `J_k`

`J_k = ∫₀^∞ u^{k−1/2} (1+2u)^{−(k+2)} du = Γ(k+½) Γ(3/2) / (2^{k+½} Γ(k+2))` (`lintegral_gk`),
proved in `ℝ≥0∞` by the Gamma representation `(1+2u)^{−(k+2)} = Γ(k+2)⁻¹ ∫₀^∞ t^{k+1} e^{−(1+2u)t} dt`
and Tonelli.
-/

namespace Grothe.Haag

open MeasureTheory Real Set
open scoped ENNReal

noncomputable section

/-- `∫₀^∞ t^{a−1} e^{−rt} dt = r^{−a} Γ(a)` in `ℝ≥0∞`. -/
lemma lintegral_gamma {a r : ℝ} (ha : 0 < a) (hr : 0 < r) :
    ∫⁻ t, ENNReal.ofReal (t ^ (a - 1) * rexp (-(r * t))) ∂muI
      = ENNReal.ofReal ((1 / r) ^ a * Real.Gamma a) := by
  have hi : Integrable (fun t : ℝ => t ^ (a - 1) * rexp (-(r * t))) muI := by
    have := integrableOn_rpow_mul_exp_neg_mul_rpow (p := 1) (s := a - 1) (b := r)
      (by linarith) one_pos hr
    refine this.congr_fun (fun t _ => ?_) measurableSet_Ioi
    simp only [Real.rpow_one, neg_mul]
  rw [← ofReal_integral_eq_lintegral_ofReal hi, Real.integral_rpow_mul_exp_neg_mul_Ioi ha hr]
  filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht
  exact mul_nonneg (Real.rpow_nonneg (le_of_lt ht) _) (exp_pos _).le

/-- The integrand `u^{k−1/2} / (1+2u)^{k+2}`. -/
def gk (k : ℕ) (u : ℝ) : ℝ := u ^ ((k : ℝ) - 1 / 2) / (1 + 2 * u) ^ (k + 2)

/-- `J_k` in closed form. -/
def Jk (k : ℕ) : ℝ :=
  Real.Gamma (k + 1 / 2) * Real.Gamma (3 / 2) / ((2 : ℝ) ^ ((k : ℝ) + 1 / 2) * Real.Gamma (k + 2))

lemma gk_nonneg (k : ℕ) {u : ℝ} (hu : 0 ≤ u) : 0 ≤ gk k u :=
  div_nonneg (Real.rpow_nonneg hu _) (by positivity)

lemma measurable_gk (k : ℕ) : Measurable (gk k) := by unfold gk; fun_prop

/-- The Gamma representation of `(1+2u)^{−(k+2)}`. -/
lemma ofReal_gk (k : ℕ) {u : ℝ} (hu : 0 < u) :
    ENNReal.ofReal (gk k u) = ∫⁻ t, ENNReal.ofReal (u ^ ((k : ℝ) - 1 / 2)
      * (t ^ ((k : ℝ) + 1) * rexp (-t)) * rexp (-((2 * t) * u)) / Real.Gamma (k + 2)) ∂muI := by
  have hr : (0 : ℝ) < 1 + 2 * u := by positivity
  have hG : 0 < Real.Gamma (k + 2) := Real.Gamma_pos_of_pos (by positivity)
  have h := lintegral_gamma (a := (k : ℝ) + 2) (r := 1 + 2 * u) (by positivity) hr
  have e : ∀ t : ℝ, u ^ ((k : ℝ) - 1 / 2) * (t ^ ((k : ℝ) + 1) * rexp (-t))
      * rexp (-((2 * t) * u)) / Real.Gamma (k + 2)
      = (u ^ ((k : ℝ) - 1 / 2) / Real.Gamma (k + 2))
        * (t ^ ((k : ℝ) + 2 - 1) * rexp (-((1 + 2 * u) * t))) := fun t => by
    rw [show (k : ℝ) + 2 - 1 = k + 1 by ring, show -((1 + 2 * u) * t) = -t + -((2 * t) * u) by ring,
      Real.exp_add]
    ring
  have hc : 0 ≤ u ^ ((k : ℝ) - 1 / 2) / Real.Gamma (k + 2) :=
    div_nonneg (Real.rpow_nonneg hu.le _) hG.le
  simp_rw [e, ENNReal.ofReal_mul hc]
  rw [lintegral_const_mul' _ _ ENNReal.ofReal_ne_top, h, ← ENNReal.ofReal_mul hc]
  congr 1
  rw [show (k : ℝ) + 2 = ((k + 2 : ℕ) : ℝ) by push_cast; ring, Real.rpow_natCast, one_div_pow, gk]
  field_simp

/-- `t^{k+1} (1/(2t))^{k+1/2} = 2^{−(k+1/2)} t^{1/2}` for `t > 0`. -/
lemma rpow_combine (k : ℕ) {t : ℝ} (ht : 0 < t) :
    t ^ ((k : ℝ) + 1) * ((1 / (2 * t)) ^ ((k : ℝ) + 1 / 2))
      = t ^ ((3 / 2 : ℝ) - 1) / (2 : ℝ) ^ ((k : ℝ) + 1 / 2) := by
  rw [one_div, Real.inv_rpow (by positivity), Real.mul_rpow (by norm_num) ht.le]
  rw [show (3 / 2 : ℝ) - 1 = ((k : ℝ) + 1) - ((k : ℝ) + 1 / 2) by ring, Real.rpow_sub ht]
  field_simp

/-- **`J_k = Γ(k+½) Γ(3/2) / (2^{k+½} Γ(k+2))`.** -/
theorem lintegral_gk (k : ℕ) : ∫⁻ u, ENNReal.ofReal (gk k u) ∂muI = ENNReal.ofReal (Jk k) := by
  have hG : 0 < Real.Gamma (k + 2) := Real.Gamma_pos_of_pos (by positivity)
  have hG' : 0 < Real.Gamma (k + 1 / 2) := Real.Gamma_pos_of_pos (by positivity)
  have h1 : ∫⁻ u, ENNReal.ofReal (gk k u) ∂muI = ∫⁻ u, ∫⁻ t, ENNReal.ofReal
      (u ^ ((k : ℝ) - 1 / 2) * (t ^ ((k : ℝ) + 1) * rexp (-t)) * rexp (-((2 * t) * u))
        / Real.Gamma (k + 2)) ∂muI ∂muI := by
    refine lintegral_congr_ae ?_
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with u hu
    exact ofReal_gk k hu
  rw [h1, lintegral_lintegral_swap (by
    apply Measurable.aemeasurable
    apply ENNReal.measurable_ofReal.comp
    fun_prop)]
  have h2 : ∀ t ∈ Ioi (0 : ℝ), ∫⁻ u, ENNReal.ofReal
      (u ^ ((k : ℝ) - 1 / 2) * (t ^ ((k : ℝ) + 1) * rexp (-t)) * rexp (-((2 * t) * u))
        / Real.Gamma (k + 2)) ∂muI
      = ENNReal.ofReal (Real.Gamma (k + 1 / 2) / (2 ^ ((k : ℝ) + 1 / 2) * Real.Gamma (k + 2))
          * (t ^ ((3 / 2 : ℝ) - 1) * rexp (-(1 * t)))) := by
    intro t ht
    have ht' : (0 : ℝ) < t := ht
    have hc : 0 ≤ t ^ ((k : ℝ) + 1) * rexp (-t) / Real.Gamma (k + 2) :=
      div_nonneg (mul_nonneg (Real.rpow_nonneg ht'.le _) (exp_pos _).le) hG.le
    have e : ∀ u : ℝ, u ^ ((k : ℝ) - 1 / 2) * (t ^ ((k : ℝ) + 1) * rexp (-t))
        * rexp (-((2 * t) * u)) / Real.Gamma (k + 2)
        = (t ^ ((k : ℝ) + 1) * rexp (-t) / Real.Gamma (k + 2))
          * (u ^ (((k : ℝ) + 1 / 2) - 1) * rexp (-((2 * t) * u))) := fun u => by
      rw [show ((k : ℝ) + 1 / 2) - 1 = (k : ℝ) - 1 / 2 by ring]
      ring
    simp_rw [e, ENNReal.ofReal_mul hc]
    rw [lintegral_const_mul' _ _ ENNReal.ofReal_ne_top,
      lintegral_gamma (by positivity) (by positivity), ← ENNReal.ofReal_mul hc]
    congr 1
    have hr := rpow_combine k ht'
    rw [one_mul]
    calc t ^ ((k : ℝ) + 1) * rexp (-t) / Real.Gamma (k + 2)
          * ((1 / (2 * t)) ^ ((k : ℝ) + 1 / 2) * Real.Gamma (k + 1 / 2))
        = (t ^ ((k : ℝ) + 1) * (1 / (2 * t)) ^ ((k : ℝ) + 1 / 2)) * rexp (-t)
          * Real.Gamma (k + 1 / 2) / Real.Gamma (k + 2) := by ring
      _ = _ := by rw [hr]; field_simp
  rw [setLIntegral_congr_fun measurableSet_Ioi h2]
  have hC : 0 ≤ Real.Gamma (k + 1 / 2) / (2 ^ ((k : ℝ) + 1 / 2) * Real.Gamma (k + 2)) := by
    positivity
  simp_rw [ENNReal.ofReal_mul hC]
  rw [lintegral_const_mul' _ _ ENNReal.ofReal_ne_top, lintegral_gamma (by norm_num) one_pos,
    ← ENNReal.ofReal_mul hC, Jk]
  congr 1
  simp
  ring

end

end Grothe.Haag
