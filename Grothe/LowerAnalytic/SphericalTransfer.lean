import Mathlib

/-!+# Spherical dual truncation: certificate algebra

The analytic random-restriction/Jacobi bridge is proved in the accompanying
manuscript, not in this module. This module proves its all-level truncation
logic, including the signed coefficients and the cubic ratio certificate.
No spherical norm cap is assumed to have been computed.
-/

namespace Grothe.LowerAnalytic.SphericalTransfer

noncomputable section

set_option maxHeartbeats 2000000

/-- Exact factorization of the numerator controlling the cubic multiplier ratio. -/
theorem cubic_ratio_identity (m r e : ℝ) :
    (m + r - 1) * (2 + e * r * (r + m)) -
        (r + 2) * (2 + e * (r + 1) * (r + m + 1)) =
      2 * (m - 6) + 6 * (1 - e) +
        e * ((m - 5) * (r - 1) * (r + m + 2) + (m - 6) * (m + 1)) := by
  ring

theorem cubic_ratio_nonneg {m r e : ℝ}
    (hm : 6 ≤ m) (hr : 1 ≤ r) (he : 0 ≤ e) (he1 : e ≤ 1) :
    (r + 2) * (2 + e * (r + 1) * (r + m + 1)) ≤
      (m + r - 1) * (2 + e * r * (r + m)) := by
  have hm5 : 0 ≤ m - 5 := by linarith
  have h0 : 0 ≤ 2 * (m - 6) := by positivity
  have h1 : 0 ≤ 6 * (1 - e) := by positivity
  have h2 : 0 ≤ (m - 5) * (r - 1) * (r + m + 2) := by positivity
  have h3 : 0 ≤ (m - 6) * (m + 1) := by positivity
  have h4 := mul_nonneg he (add_nonneg h2 h3)
  linarith [cubic_ratio_identity m r e]

/-- A ratio recurrence is accepted only when its denominator is positive. -/
theorem cubic_step {m r e u v : ℝ}
    (hm : 6 ≤ m) (hr : 1 ≤ r) (he : 0 ≤ e) (he1 : e ≤ 1)
    (hu : 0 ≤ u)
    (hrec : v * ((m + r - 1) * (2 + e * r * (r + m))) =
      u * ((r + 2) * (2 + e * (r + 1) * (r + m + 1)))) :
    v ≤ u := by
  have hmr : 0 < m + r - 1 := by linarith
  have hr0 : 0 ≤ r := by linarith
  have hrm : 0 ≤ r + m := by linarith
  have hd : 0 < (m + r - 1) * (2 + e * r * (r + m)) := by positivity
  have h := mul_le_mul_of_nonneg_left (cubic_ratio_nonneg hm hr he he1) hu
  nlinarith

/-- The recurrence prices every omitted index; a finite scan alone is insufficient. -/
theorem cubic_tail {m e : ℝ} {u : ℕ → ℝ}
    (hm : 6 ≤ m) (he : 0 ≤ e) (he1 : e ≤ 1)
    (hu : ∀ r, 0 ≤ u r)
    (hrec : ∀ r : ℕ, 1 ≤ r →
      u (r + 1) * ((m + r - 1) * (2 + e * r * (r + m))) =
        u r * ((r + 2) * (2 + e * (r + 1) * (r + m + 1))))
    {L r : ℕ} (hL : L < r) : u r ≤ u (L + 1) := by
  have hmono : ∀ j : ℕ, 1 ≤ j → u (j + 1) ≤ u j := by
    intro j hj
    have hj' : (1 : ℝ) ≤ j := by exact_mod_cast hj
    exact cubic_step hm hj' he he1 (hu j) (hrec j hj)
  have hh : ∀ j : ℕ, u (L + 1 + j) ≤ u (L + 1) := by
    intro j
    induction j with
    | zero => simp
    | succ j ih =>
      have hh := hmono (L + 1 + j) (by omega)
      simpa [Nat.add_assoc] using hh.trans ih
  obtain ⟨j, hj⟩ := Nat.exists_eq_add_of_le (show L + 1 ≤ r by omega)
  simpa [hj] using hh j

/-- Absolute value of the explicit inverse Jacobi multiplier for the cubic game. -/
def cubicAmp (m r : ℕ) (e : ℝ) : ℝ :=
  ((r : ℝ) + 1) / (Nat.choose (m + r - 2) r : ℝ) *
    (1 + e * r * (r + m) / 2)

theorem cubicAmp_nonneg {m : ℕ} (hm : 2 ≤ m) (r : ℕ) {e : ℝ} (he : 0 ≤ e) :
    0 ≤ cubicAmp m r e := by
  unfold cubicAmp
  positivity

theorem cubicAmp_recurrence {m : ℕ} (hm : 2 ≤ m) (r : ℕ) (e : ℝ) :
    cubicAmp m (r + 1) e *
      (((m : ℝ) + r - 1) * (2 + e * r * (r + m))) =
    cubicAmp m r e *
      ((r + 2) * (2 + e * (r + 1) * (r + m + 1))) := by
  have hc : (0 : ℝ) < (Nat.choose (m + r - 2) r : ℝ) := by
    exact_mod_cast Nat.choose_pos (show r ≤ m + r - 2 by omega)
  have hcn : (0 : ℝ) < (Nat.choose (m + (r + 1) - 2) (r + 1) : ℝ) := by
    exact_mod_cast Nat.choose_pos (show r + 1 ≤ m + (r + 1) - 2 by omega)
  have hbin : ((m : ℝ) + r - 1) * (Nat.choose (m + r - 2) r : ℝ) =
      (Nat.choose (m + (r + 1) - 2) (r + 1) : ℝ) * (r + 1) := by
    have hh := Nat.add_one_mul_choose_eq (m + r - 2) r
    have hi : m + r - 2 + 1 = m + (r + 1) - 2 := by omega
    rw [hi] at hh
    have hl : ((m + (r + 1) - 2 : ℕ) : ℝ) = (m : ℝ) + r - 1 := by
      rw [Nat.cast_sub (by omega : 2 ≤ m + (r + 1)), Nat.cast_add,
        Nat.cast_add, Nat.cast_one, Nat.cast_ofNat]
      ring
    have hx := congrArg (fun n : ℕ => (n : ℝ)) hh
    simpa only [Nat.cast_mul, hl, Nat.cast_add, Nat.cast_one] using hx
  have hquot : (((r : ℝ) + 2) /
      (Nat.choose (m + (r + 1) - 2) (r + 1) : ℝ)) * ((m : ℝ) + r - 1) =
      (((r : ℝ) + 2) * (r + 1)) / (Nat.choose (m + r - 2) r : ℝ) := by
    rw [div_mul_eq_mul_div]
    apply (div_eq_div_iff hcn.ne' hc.ne').2
    linear_combination ((r : ℝ) + 2) * hbin
  unfold cubicAmp
  push_cast
  calc
    _ = ((((r : ℝ) + 2) /
          (Nat.choose (m + (r + 1) - 2) (r + 1) : ℝ)) * ((m : ℝ) + r - 1)) *
        ((2 + e * (r + 1) * (r + m + 1)) * (2 + e * r * (r + m)) / 2) := by ring
    _ = _ := by rw [hquot]; ring

/-- Fully connected all-index tail bound for the displayed binomial formula. -/
theorem cubicAmp_tail {m : ℕ} (hm : 6 ≤ m) {e : ℝ}
    (he : 0 ≤ e) (he1 : e ≤ 1) {L r : ℕ} (hr : L < r) :
    cubicAmp m r e ≤ cubicAmp m (L + 1) e := by
  have hm' : (6 : ℝ) ≤ m := by exact_mod_cast hm
  exact cubic_tail hm' he he1
    (fun j => cubicAmp_nonneg (by omega) j he)
    (fun j _ => cubicAmp_recurrence (by omega) j e) hr

/-- Exact rational allowance in the manuscript, with the binomial checked by the kernel. -/
theorem cubicAmp_32_13 : cubicAmp 32 13 (149 / 200) = 17513 / 209010560960 := by
  have hc : Nat.choose 43 13 = 36576848168 := by
    rw [Nat.choose_eq_factorial_div_factorial (by decide : 13 ≤ 43)]
    decide
  norm_num [cubicAmp, hc]

/-- The numerical allowance is valid at every omitted spherical index. -/
theorem cubic_tail_32_12 {r : ℕ} (hr : 12 < r) :
    cubicAmp 32 r (149 / 200) < 419 / 5000000000 := by
  have h := cubicAmp_tail (m := 32) (by norm_num)
    (e := 149 / 200) (by norm_num) (by norm_num) hr
  rw [show 12 + 1 = 13 from rfl, cubicAmp_32_13] at h
  linarith

/-- Bessel's absolute coefficient budget prices a bounded multiplier defect. -/
theorem finite_defect {ι : Type*} (s : Finset ι) (a b c : ι → ℝ)
    {t : ℝ} (ht : 0 ≤ t)
    (hc : ∑ i ∈ s, |c i| ≤ 1)
    (hd : ∀ i ∈ s, |a i - b i| ≤ t) :
    |(∑ i ∈ s, a i * c i) - ∑ i ∈ s, b i * c i| ≤ t := by
  rw [← Finset.sum_sub_distrib]
  calc
    |∑ i ∈ s, (a i * c i - b i * c i)|
        = |∑ i ∈ s, (a i - b i) * c i| := by congr 1; apply Finset.sum_congr rfl; intro i _; ring
    _ ≤ ∑ i ∈ s, |(a i - b i) * c i| := Finset.abs_sum_le_sum_abs _ _
    _ = ∑ i ∈ s, |a i - b i| * |c i| := by simp only [abs_mul]
    _ ≤ ∑ i ∈ s, t * |c i| := Finset.sum_le_sum fun i hi =>
      mul_le_mul_of_nonneg_right (hd i hi) (abs_nonneg _)
    _ = t * ∑ i ∈ s, |c i| := by rw [Finset.mul_sum]
    _ ≤ t := by simpa using mul_le_mul_of_nonneg_left hc ht

/-- Countable form: it applies to the mixed spectrum of an actual response pair. -/
theorem infinite_defect (a b c : ℕ → ℝ) {t : ℝ} (ht : 0 ≤ t)
    (ha : Summable (fun i => a i * c i))
    (hb : Summable (fun i => b i * c i))
    (hc : Summable (fun i => |c i|)) (hbudget : ∑' i, |c i| ≤ 1)
    (hd : ∀ i, |a i - b i| ≤ t) :
    |(∑' i, a i * c i) - ∑' i, b i * c i| ≤ t := by
  have hn : Summable (fun i => |(a i - b i) * c i|) :=
    Summable.of_nonneg_of_le (fun _ => abs_nonneg _) (fun i => by
      rw [abs_mul]
      exact mul_le_mul_of_nonneg_right (hd i) (abs_nonneg _)) (hc.mul_left t)
  rw [← ha.tsum_sub hb]
  simp_rw [← sub_mul]
  calc
    |∑' i, (a i - b i) * c i| ≤ ∑' i, |(a i - b i) * c i| :=
      by simpa only [Real.norm_eq_abs] using
        (norm_tsum_le_tsum_norm (f := fun i => (a i - b i) * c i)
          (by simpa only [Real.norm_eq_abs] using hn))
    _ ≤ ∑' i, t * |c i| := hn.tsum_le_tsum (fun i => by
      rw [abs_mul]
      exact mul_le_mul_of_nonneg_right (hd i) (abs_nonneg _)) (hc.mul_left t)
    _ = t * ∑' i, |c i| := tsum_mul_left
    _ ≤ t := by simpa using mul_le_mul_of_nonneg_left hbudget ht

/-- The hypothesis is a spherical norm certificate; this theorem does not supply it. -/
theorem global_cap_from_truncation (a b c : ℕ → ℝ) {t B : ℝ} (ht : 0 ≤ t)
    (ha : Summable (fun i => a i * c i))
    (hb : Summable (fun i => b i * c i))
    (hc : Summable (fun i => |c i|)) (hbudget : ∑' i, |c i| ≤ 1)
    (hd : ∀ i, |a i - b i| ≤ t) (hcap : ∑' i, b i * c i ≤ B) :
    ∑' i, a i * c i ≤ B + t := by
  have h := infinite_defect a b c ht ha hb hc hbudget hd
  have hh := (abs_le.mp h).2
  linarith

end
end Grothe.LowerAnalytic.SphericalTransfer
