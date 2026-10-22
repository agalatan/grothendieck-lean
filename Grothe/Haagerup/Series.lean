import Grothe.Haagerup.BetaJ
import Grothe.Upper.Haagerup

/-!
# The radial series of the phase correlation

* `coeff_eq`: `(2/π) (k+1) 4^k J_k² = c_k = (π/4) r_k` (Haagerup's coefficients);
* `Kint_eq`: for `0 ≤ R ≤ 1`,
  `(2/π) ∫∫_{u,v>0} (uv)^{−1/2} / ((1+2u)(1+2v) − 4uvR)² du dv = Σ_k c_k R^k`,
  by `(1 − x)^{−2} = Σ (k+1) x^k`, `x = 4uvR/((1+2u)(1+2v))`, and termwise integration of the
  nonnegative series (in `ℝ≥0∞`).
-/

namespace Grothe.Haag

open MeasureTheory Real Set
open scoped ENNReal

noncomputable section

/-! ### Haagerup's coefficients -/

lemma Gamma_three_halves : Real.Gamma (3 / 2) = √π / 2 := by
  rw [show (3 / 2 : ℝ) = 1 / 2 + 1 by norm_num, Real.Gamma_add_one (by norm_num),
    Real.Gamma_one_half_eq]
  ring

lemma Jk_zero : Jk 0 = π / (2 * √2) := by
  simp only [Jk, Nat.cast_zero, zero_add]
  rw [Real.Gamma_one_half_eq, Gamma_three_halves, Real.Gamma_two, ← Real.sqrt_eq_rpow]
  have hs : √π * √π = π := Real.mul_self_sqrt Real.pi_pos.le
  field_simp
  linarith [hs]

lemma Jk_succ (k : ℕ) : Jk (k + 1) = Jk k * ((k + 1 / 2) / (2 * (k + 2))) := by
  simp only [Jk, Nat.cast_add, Nat.cast_one]
  have h1 : Real.Gamma ((k : ℝ) + 1 + 1 / 2) = (k + 1 / 2) * Real.Gamma (k + 1 / 2) := by
    rw [show (k : ℝ) + 1 + 1 / 2 = (k + 1 / 2) + 1 by ring, Real.Gamma_add_one (by positivity)]
  have h2 : Real.Gamma ((k : ℝ) + 1 + 2) = (k + 2) * Real.Gamma (k + 2) := by
    rw [show (k : ℝ) + 1 + 2 = (k + 2) + 1 by ring, Real.Gamma_add_one (by positivity)]
  have h3 : (2 : ℝ) ^ ((k : ℝ) + 1 + 1 / 2) = 2 * (2 : ℝ) ^ ((k : ℝ) + 1 / 2) := by
    rw [show (k : ℝ) + 1 + 1 / 2 = ((k : ℝ) + 1 / 2) + 1 by ring, Real.rpow_add (by norm_num),
      Real.rpow_one]
    ring
  rw [h1, h2, h3]
  have hG : 0 < Real.Gamma (k + 2) := Real.Gamma_pos_of_pos (by positivity)
  have hp : 0 < (2 : ℝ) ^ ((k : ℝ) + 1 / 2) := by positivity
  field_simp

/-- **Haagerup's coefficients**: `(2/π) (k+1) 4^k J_k² = c_k`. -/
theorem coeff_eq (k : ℕ) : 2 / π * ((k + 1) * 4 ^ k * Jk k ^ 2) = haagCoeff k := by
  have hpi := Real.pi_pos
  induction k with
  | zero =>
    rw [Jk_zero, haagCoeff]
    have hs : √2 * √2 = 2 := Real.mul_self_sqrt (by norm_num)
    simp only [Nat.cast_zero, zero_add, pow_zero, one_mul, haagR, Rat.cast_one, mul_one]
    field_simp
    nlinarith [hs]
  | succ k ih =>
    have hr : (haagR (k + 1) : ℝ) = (haagR k : ℝ) * ((2 * k + 1) ^ 2 / (4 * (k + 1) * (k + 2))) := by
      simp only [haagR]
      push_cast
      ring
    have hk : (haagR k : ℝ) = 4 / π * (2 / π * ((k + 1) * 4 ^ k * Jk k ^ 2)) := by
      rw [ih, haagCoeff]; field_simp
    rw [haagCoeff, hr, hk, Jk_succ]
    push_cast
    field_simp
    ring

/-! ### The series -/

/-- `(1 − x)^{−2} = Σ (k+1) x^k`. -/
lemma hasSum_succ_mul_geometric {x : ℝ} (h0 : 0 ≤ x) (h1 : x < 1) :
    HasSum (fun k : ℕ => ((k : ℝ) + 1) * x ^ k) (1 / (1 - x) ^ 2) := by
  have hn : ‖x‖ < 1 := by rw [Real.norm_of_nonneg h0]; exact h1
  have := (hasSum_coe_mul_geometric_of_norm_lt_one hn).add (hasSum_geometric_of_lt_one h0 h1)
  convert this using 1
  · funext k; ring
  · have : (1 - x) ≠ 0 := by linarith
    field_simp
    ring

/-- The weight `(uv)^{−1/2}`. -/
def wq (q : ℝ × ℝ) : ℝ := q.1 ^ (-(1 / 2 : ℝ)) * q.2 ^ (-(1 / 2 : ℝ))

/-- `D = (1+2u)(1+2v) − 4uvR`. -/
def Dq (R : ℝ) (q : ℝ × ℝ) : ℝ := (1 + 2 * q.1) * (1 + 2 * q.2) - 4 * q.1 * q.2 * R

/-- The series terms. -/
def fk (R : ℝ) (k : ℕ) (q : ℝ × ℝ) : ℝ := ((k : ℝ) + 1) * (4 * R) ^ k * (gk k q.1 * gk k q.2)

lemma hasSum_fk {R : ℝ} (hR0 : 0 ≤ R) (hR1 : R ≤ 1) {q : ℝ × ℝ} (hu : 0 < q.1) (hv : 0 < q.2) :
    HasSum (fun k => fk R k q) (wq q / Dq R q ^ 2) := by
  obtain ⟨u, v⟩ := q
  simp only at hu hv
  have hP0 : 0 < (1 + 2 * u) * (1 + 2 * v) := by positivity
  have hx0 : 0 ≤ 4 * u * v * R / ((1 + 2 * u) * (1 + 2 * v)) := by positivity
  have hx1 : 4 * u * v * R / ((1 + 2 * u) * (1 + 2 * v)) < 1 := by
    rw [div_lt_one hP0]
    nlinarith [mul_pos hu hv, mul_nonneg (mul_nonneg hu.le hv.le) hR0]
  have h := (hasSum_succ_mul_geometric hx0 hx1).mul_left
    (wq (u, v) / ((1 + 2 * u) * (1 + 2 * v)) ^ 2)
  have hD : Dq R (u, v) = (1 + 2 * u) * (1 + 2 * v)
      * (1 - 4 * u * v * R / ((1 + 2 * u) * (1 + 2 * v))) := by
    simp only [Dq]; field_simp
  convert h using 1
  · funext k
    simp only [fk, gk, wq]
    have e1 : u ^ ((k : ℝ) - 1 / 2) = u ^ (-(1 / 2 : ℝ)) * u ^ k := by
      rw [← Real.rpow_natCast, ← Real.rpow_add hu]; ring_nf
    have e2 : v ^ ((k : ℝ) - 1 / 2) = v ^ (-(1 / 2 : ℝ)) * v ^ k := by
      rw [← Real.rpow_natCast, ← Real.rpow_add hv]; ring_nf
    rw [e1, e2, div_pow]
    simp only [mul_pow]
    field_simp
    ring
  · rw [hD]
    have : (1 - 4 * u * v * R / ((1 + 2 * u) * (1 + 2 * v))) ≠ 0 := by linarith
    field_simp

lemma fk_nonneg {R : ℝ} (hR0 : 0 ≤ R) (k : ℕ) {q : ℝ × ℝ} (hu : 0 ≤ q.1) (hv : 0 ≤ q.2) :
    0 ≤ fk R k q :=
  mul_nonneg (by positivity) (mul_nonneg (gk_nonneg k hu) (gk_nonneg k hv))

/-- The double integral. -/
def Kint (R : ℝ) : ℝ := ∫ q, wq q / Dq R q ^ 2 ∂(muI.prod muI)

lemma ae_pos : ∀ᵐ q ∂(muI.prod muI), 0 < q.1 ∧ 0 < q.2 := by
  have h : ∀ᵐ q ∂(muI.prod muI), q ∈ Ioi (0 : ℝ) ×ˢ Ioi (0 : ℝ) := by
    rw [Measure.prod_restrict]
    exact ae_restrict_mem (measurableSet_Ioi.prod measurableSet_Ioi)
  exact h.mono fun q hq => ⟨hq.1, hq.2⟩

lemma lintegral_fk {R : ℝ} (hR0 : 0 ≤ R) (k : ℕ) :
    ∫⁻ q, ENNReal.ofReal (fk R k q) ∂(muI.prod muI)
      = ENNReal.ofReal (((k : ℝ) + 1) * (4 * R) ^ k * Jk k ^ 2) := by
  have hc : 0 ≤ ((k : ℝ) + 1) * (4 * R) ^ k := by positivity
  have e : ∫⁻ q, ENNReal.ofReal (fk R k q) ∂(muI.prod muI)
      = ∫⁻ q, ENNReal.ofReal (((k : ℝ) + 1) * (4 * R) ^ k)
        * (ENNReal.ofReal (gk k q.1) * ENNReal.ofReal (gk k q.2)) ∂(muI.prod muI) := by
    refine lintegral_congr_ae ?_
    filter_upwards [ae_pos] with q hq
    rw [fk, ENNReal.ofReal_mul hc, ENNReal.ofReal_mul (gk_nonneg k hq.1.le)]
  rw [e, lintegral_const_mul' _ _ ENNReal.ofReal_ne_top,
    lintegral_prod_mul (f := fun u => ENNReal.ofReal (gk k u)) (g := fun u => ENNReal.ofReal (gk k u))
      (ENNReal.measurable_ofReal.comp (measurable_gk k)).aemeasurable
      (ENNReal.measurable_ofReal.comp (measurable_gk k)).aemeasurable,
    lintegral_gk, ← ENNReal.ofReal_mul (by
      unfold Jk; positivity), ← ENNReal.ofReal_mul hc]
  congr 1
  ring

/-- **The radial series**: `(2/π) Kint R = Σ_k c_k R^k` for `0 ≤ R ≤ 1`. -/
theorem Kint_eq {R : ℝ} (hR0 : 0 ≤ R) (hR1 : R ≤ 1) :
    2 / π * Kint R = ∑' k, haagCoeff k * R ^ k := by
  have hpi := Real.pi_pos
  set b : ℕ → ℝ := fun k => ((k : ℝ) + 1) * (4 * R) ^ k * Jk k ^ 2 with hb
  have hbe : ∀ k, b k = π / 2 * (haagCoeff k * R ^ k) := fun k => by
    rw [← coeff_eq k, hb]
    field_simp
    ring
  have hb0 : ∀ k, 0 ≤ b k := by
    intro k
    rw [hbe k]
    exact mul_nonneg (by positivity) (mul_nonneg (haagCoeff_nonneg k) (pow_nonneg hR0 k))
  have hcs : Summable fun k => haagCoeff k * R ^ k :=
    Summable.of_norm_bounded summable_haagCoeff fun k => by
      rw [Real.norm_eq_abs, abs_mul, abs_of_nonneg (pow_nonneg hR0 k)]
      exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ hR0 hR1)
  have hbs : Summable b := (hcs.mul_left (π / 2)).congr fun k => (hbe k).symm
  have hmeas : Measurable fun q : ℝ × ℝ => wq q / Dq R q ^ 2 := by
    unfold wq Dq; fun_prop
  have hnn : 0 ≤ᵐ[muI.prod muI] fun q => wq q / Dq R q ^ 2 := by
    filter_upwards [ae_pos] with q hq
    exact (hasSum_fk hR0 hR1 hq.1 hq.2).nonneg fun k => fk_nonneg hR0 k hq.1.le hq.2.le
  have hl : ∫⁻ q, ENNReal.ofReal (wq q / Dq R q ^ 2) ∂(muI.prod muI)
      = ENNReal.ofReal (∑' k, b k) := by
    have e : ∫⁻ q, ENNReal.ofReal (wq q / Dq R q ^ 2) ∂(muI.prod muI)
        = ∫⁻ q, ∑' k, ENNReal.ofReal (fk R k q) ∂(muI.prod muI) := by
      refine lintegral_congr_ae ?_
      filter_upwards [ae_pos] with q hq
      have h := hasSum_fk hR0 hR1 hq.1 hq.2
      rw [← h.tsum_eq, ENNReal.ofReal_tsum_of_nonneg (fun k => fk_nonneg hR0 k hq.1.le hq.2.le)
        h.summable]
    rw [e, lintegral_tsum (f := fun k q => ENNReal.ofReal (fk R k q)) fun k => (ENNReal.measurable_ofReal.comp (by
      unfold fk gk; fun_prop)).aemeasurable, ENNReal.ofReal_tsum_of_nonneg hb0 hbs]
    exact tsum_congr fun k => lintegral_fk hR0 k
  rw [Kint, integral_eq_lintegral_of_nonneg_ae hnn hmeas.aestronglyMeasurable, hl,
    ENNReal.toReal_ofReal (tsum_nonneg hb0)]
  simp_rw [hbe]
  rw [tsum_mul_left]
  field_simp

end

end Grothe.Haag
