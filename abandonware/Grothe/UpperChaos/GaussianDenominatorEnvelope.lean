import Mathlib.Analysis.SpecialFunctions.Exp

/-! Gaussian decay controls small denominators without expanding their inverse.
The exponent is arbitrary, so a finite certificate can choose the useful power
separately on each rectangle. The radial exponential is retained.
Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.GaussianDenominatorEnvelope

theorem pow_mul_exp_neg_le_factorial (n : ℕ) (t : ℝ) (ht : 0 ≤ t) :
    t^n * Real.exp (-t) ≤ (n.factorial : ℝ) := by
  have hn : (0 : ℝ) < n.factorial := by positivity
  have h := (div_le_iff₀ hn).mp (Real.pow_div_factorial_le_exp t ht n)
  rw [Real.exp_neg, ← div_eq_mul_inv, div_le_iff₀ (Real.exp_pos t)]
  simpa only [mul_comm] using h

theorem pow_one_add_mul_exp_neg_le (n : ℕ) (t : ℝ) (ht : 0 ≤ t) :
    t^n * (1 + t) * Real.exp (-t) ≤ (n.factorial + (n+1).factorial : ℝ) := by
  have h₀ := pow_mul_exp_neg_le_factorial n t ht
  have h₁ := pow_mul_exp_neg_le_factorial (n+1) t ht
  calc
    _ = t^n * Real.exp (-t) + t^(n+1) * Real.exp (-t) := by rw [pow_succ]; ring
    _ ≤ _ := add_le_add h₀ h₁

/-- Valid for every nonnegative denominator, including its algebraic value at
zero. Increasing `n` supplies an arbitrarily high positive power of `D`. -/
theorem inverse_sq (n : ℕ) (s D : ℝ) (hs : 0 < s) (hD : 0 ≤ D) :
    Real.exp (-s - s / D) / D^2 ≤
      Real.exp (-s) * ((n+2).factorial : ℝ) * D^n / s^(n+2) := by
  by_cases hzero : D = 0
  · simp only [hzero, zero_pow (by decide : 2 ≠ 0), div_zero]
    positivity
  have h := pow_mul_exp_neg_le_factorial (n+2) (s/D) (div_nonneg hs.le hD)
  calc
    _ = Real.exp (-s) * ((s/D)^(n+2) * Real.exp (-(s/D))) * D^n / s^(n+2) := by
      rw [sub_eq_add_neg, Real.exp_add, div_pow, pow_add]
      field_simp
      simp only [pow_add, mul_comm]
    _ ≤ _ := by gcongr

/-- The signed companion numerator is bounded only for the error envelope;
the main numerical integral retains its sign. -/
theorem companion_inverse_sq (n : ℕ) (s D : ℝ) (hs : 0 < s) (hD : 0 ≤ D) :
    |1 - s/D| * (Real.exp (-s - s/D) / D^2) ≤
      Real.exp (-s) * ((n+2).factorial + (n+3).factorial : ℝ) * D^n / s^(n+2) := by
  by_cases hzero : D = 0
  · simp only [hzero, zero_pow (by decide : 2 ≠ 0), div_zero, mul_zero]
    positivity
  have ht : 0 ≤ s/D := div_nonneg hs.le hD
  have habs : |1 - s/D| ≤ 1 + s/D := abs_le.mpr ⟨by linarith, by linarith⟩
  have h := pow_one_add_mul_exp_neg_le (n+2) (s/D) ht
  calc
    _ ≤ (1+s/D) * (Real.exp (-s-s/D) / D^2) :=
      mul_le_mul_of_nonneg_right habs (by positivity)
    _ = Real.exp (-s) * ((s/D)^(n+2) * (1+s/D) * Real.exp (-(s/D))) * D^n /
        s^(n+2) := by
      rw [sub_eq_add_neg, Real.exp_add, div_pow, pow_add]
      field_simp
      ring
    _ ≤ _ := by gcongr

/-- Rectangle form: only rational bounds on the denominator and radius, plus
one scalar exponential upper bound, remain for a numerical certificate. -/
theorem inverse_sq_box (n : ℕ) (r s D s₀ D₁ E : ℝ)
    (hr : 0 ≤ r) (hs₀ : 0 < s₀) (hs : s₀ ≤ s)
    (hD : 0 ≤ D) (hD₁ : D ≤ D₁) (hE : Real.exp (-s₀) ≤ E) :
    Real.exp (-r-s-s/D) / D^2 ≤ E * ((n+2).factorial : ℝ) * D₁^n / s₀^(n+2) := by
  have hspos : 0 < s := hs₀.trans_le hs
  have hD₁nonneg : 0 ≤ D₁ := hD.trans hD₁
  have hEpos : 0 ≤ E := (Real.exp_pos _).le.trans hE
  have he : Real.exp (-s) ≤ E :=
    (Real.exp_le_exp.mpr (neg_le_neg hs)).trans hE
  calc
    _ ≤ Real.exp (-s-s/D) / D^2 :=
      div_le_div_of_nonneg_right (Real.exp_le_exp.mpr (by linarith)) (sq_nonneg D)
    _ ≤ Real.exp (-s) * ((n+2).factorial : ℝ) * D^n / s^(n+2) :=
      inverse_sq n s D hspos hD
    _ ≤ _ := by gcongr

theorem companion_inverse_sq_box (n : ℕ) (r s D s₀ D₁ E : ℝ)
    (hr : 0 ≤ r) (hs₀ : 0 < s₀) (hs : s₀ ≤ s)
    (hD : 0 ≤ D) (hD₁ : D ≤ D₁) (hE : Real.exp (-s₀) ≤ E) :
    |1-s/D| * (Real.exp (-r-s-s/D) / D^2) ≤
      E * ((n+2).factorial + (n+3).factorial : ℝ) * D₁^n / s₀^(n+2) := by
  have hspos : 0 < s := hs₀.trans_le hs
  have hD₁nonneg : 0 ≤ D₁ := hD.trans hD₁
  have hEpos : 0 ≤ E := (Real.exp_pos _).le.trans hE
  have he : Real.exp (-s) ≤ E :=
    (Real.exp_le_exp.mpr (neg_le_neg hs)).trans hE
  calc
    _ ≤ |1-s/D| * (Real.exp (-s-s/D) / D^2) := by
      gcongr
      linarith
    _ ≤ Real.exp (-s) * ((n+2).factorial + (n+3).factorial : ℝ) * D^n / s^(n+2) :=
      companion_inverse_sq n s D hspos hD
    _ ≤ _ := by gcongr

/-- Direct-chart denominators are at least one, so only the radial
exponential is needed in the far tail. -/
theorem direct_core (r s t D : ℝ) (hr : 0 ≤ r) (ht : 0 ≤ t) (hD : 1 ≤ D) :
    Real.exp (-r-s-t) / D^2 ≤ Real.exp (-s) := by
  have hDsq : 1 ≤ D^2 := by nlinarith
  calc
    _ ≤ Real.exp (-s) / D^2 :=
      div_le_div_of_nonneg_right (Real.exp_le_exp.mpr (by linarith)) (sq_nonneg D)
    _ ≤ Real.exp (-s) / 1 := div_le_div_of_nonneg_left (Real.exp_pos _).le (by norm_num) hDsq
    _ = _ := div_one _

theorem direct_companion (r s t D : ℝ) (hr : 0 ≤ r) (ht : 0 ≤ t) (hD : 1 ≤ D) :
    |1-t| * (Real.exp (-r-s-t) / D^2) ≤ 2 * Real.exp (-s) := by
  have hDsq : 1 ≤ D^2 := by nlinarith
  have habs : |1-t| ≤ 1+t := abs_le.mpr ⟨by linarith, by linarith⟩
  have hpoly : (1+t) * Real.exp (-t) ≤ 2 := by
    have h := pow_one_add_mul_exp_neg_le 0 t ht
    norm_num at h
    exact h
  have hremove : Real.exp (-r-s-t) / D^2 ≤ Real.exp (-s-t) := by
    calc
      _ ≤ Real.exp (-s-t) / D^2 :=
        div_le_div_of_nonneg_right (Real.exp_le_exp.mpr (by linarith)) (sq_nonneg D)
      _ ≤ Real.exp (-s-t) / 1 :=
        div_le_div_of_nonneg_left (Real.exp_pos _).le (by norm_num) hDsq
      _ = _ := div_one _
  calc
    _ ≤ (1+t) * Real.exp (-s-t) := mul_le_mul habs hremove (by positivity) (by positivity)
    _ = ((1+t) * Real.exp (-t)) * Real.exp (-s) := by
      rw [sub_eq_add_neg, Real.exp_add]
      ring
    _ ≤ 2 * Real.exp (-s) := mul_le_mul_of_nonneg_right hpoly (Real.exp_pos _).le

end Grothe.UpperChaos.GaussianDenominatorEnvelope
