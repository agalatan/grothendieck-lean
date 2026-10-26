import Mathlib

/-!
# Residuals of radial coefficient sequences

The residual of a radial coefficient sequence `h` (radial index `n` ↔ odd degree `2n+1`) against
the linear kernel `c·z` is `|h₀ − c| + Σ_{n ≥ 1} |hₙ|` (see `Grothe.transfer`).

* `residual_split`: the residual is a finite head plus a tail;
* `hardy_budget_after_linear`: subtract the energy already forced by the linear coefficient;
* `hardy_tail`: a weighted square-sum bound `Σ_n hₙ² r^{2(2n+1)} ≤ B` with `r > 1` (the Parseval
  form of a mean-square bound for the analytic continuation of the kernel to the circle of
  radius `r`) bounds the tail `Σ_{n ≥ K} |hₙ|` by Cauchy–Schwarz.
-/

namespace Grothe

open Finset

noncomputable section

/-- The residual is its head of length `K` plus the tail. -/
theorem residual_split (h : ℕ → ℝ) (hs : Summable fun n => |h n|) (c : ℝ) (K : ℕ) :
    |h 0 - c| + ∑' n, |h (n + 1)|
      = ∑ n ∈ range (K + 1), |h n - if n = 0 then c else 0| + ∑' n, |h (n + (K + 1))| := by
  have hs1 : Summable fun n => |h (n + 1)| := (summable_nat_add_iff 1).mpr hs
  rw [← hs1.sum_add_tsum_nat_add K, sum_range_succ']
  have e1 : ∑ n ∈ range K, |h (n + 1) - if n + 1 = 0 then c else 0| = ∑ n ∈ range K, |h (n + 1)| :=
    sum_congr rfl fun n _ => by simp
  have e2 : ∑' n, |h (n + K + 1)| = ∑' n, |h (n + (K + 1))| := tsum_congr fun n => by
    rw [add_assoc]
  rw [e1, e2]
  simp only [ite_true]
  ring

/-- Remove a known lower bound on the first coefficient's energy from a Hardy budget.
The factor `r⁴` accounts for shifting the radial coefficient index by one. -/
theorem hardy_budget_after_linear (h : ℕ → ℝ) (r B L : ℝ) (hr : 0 < r)
    (hL : 0 ≤ L) (h0 : L ≤ h 0)
    (hB : ∀ J, ∑ n ∈ range J, h n ^ 2 * r ^ (2 * (2 * n + 1)) ≤ B) :
    ∀ J, ∑ n ∈ range J, h (n + 1) ^ 2 * r ^ (2 * (2 * n + 1))
      ≤ (B - L ^ 2 * r ^ 2) / r ^ 4 := by
  intro J
  have hsq : L ^ 2 ≤ h 0 ^ 2 := by nlinarith
  have he : ∀ n : ℕ, r ^ (2 * (2 * (n + 1) + 1))
      = r ^ 4 * r ^ (2 * (2 * n + 1)) := by
    intro n
    rw [← pow_add]
    congr 1
    omega
  have hb := hB (J + 1)
  rw [sum_range_succ'] at hb
  simp only [Nat.mul_zero, zero_add, Nat.mul_one] at hb
  simp_rw [he] at hb
  have he' : (∑ n ∈ range J, h (n + 1) ^ 2 *
      (r ^ 4 * r ^ (2 * (2 * n + 1)))) =
      r ^ 4 * ∑ n ∈ range J, h (n + 1) ^ 2 * r ^ (2 * (2 * n + 1)) := by
    rw [mul_sum]
    exact sum_congr rfl fun n _ => by ring
  rw [he'] at hb
  apply (le_div_iff₀ (pow_pos hr 4)).2
  have hsq' := mul_le_mul_of_nonneg_right hsq (sq_nonneg r)
  nlinarith only [hb, hsq']

/-- **Hardy tail.**  If `Σ_{n < J} hₙ² r^{2(2n+1)} ≤ B` for all `J`, with `r > 1`, then
`Σ_{n ≥ K} |hₙ| ≤ T` whenever `B · r^{−2(2K+1)} ≤ T² (1 − r^{−4})`. -/
theorem hardy_tail (h : ℕ → ℝ) (r : ℝ) (hr : 1 < r) (B : ℝ)
    (hB : ∀ J, ∑ n ∈ range J, h n ^ 2 * r ^ (2 * (2 * n + 1)) ≤ B) (K : ℕ) (T : ℝ) (hT : 0 ≤ T)
    (hcmp : B * r⁻¹ ^ (2 * (2 * K + 1)) ≤ T ^ 2 * (1 - r⁻¹ ^ 4)) :
    ∑' n, |h (n + K)| ≤ T := by
  have hr0 : 0 < r := zero_lt_one.trans hr
  have hs0 : 0 < r⁻¹ := inv_pos.2 hr0
  have hs1 : r⁻¹ < 1 := inv_lt_one_of_one_lt₀ hr
  have hq0 : 0 ≤ r⁻¹ ^ 4 := (pow_pos hs0 4).le
  have hq1 : r⁻¹ ^ 4 < 1 := pow_lt_one₀ hs0.le hs1 (by norm_num)
  have hrs : ∀ k : ℕ, r ^ k * r⁻¹ ^ k = 1 := fun k => by
    rw [← mul_pow, mul_inv_cancel₀ hr0.ne', one_pow]
  have key : ∀ J, ∑ n ∈ Ico K J, |h n| ≤ T := by
    intro J
    have hcs := sum_mul_sq_le_sq_mul_sq (Ico K J) (fun n => |h n| * r ^ (2 * n + 1))
      (fun n => r⁻¹ ^ (2 * n + 1))
    have e1 : ∑ n ∈ Ico K J, |h n| * r ^ (2 * n + 1) * r⁻¹ ^ (2 * n + 1) = ∑ n ∈ Ico K J, |h n| :=
      sum_congr rfl fun n _ => by rw [mul_assoc, hrs, mul_one]
    have e2 : ∑ n ∈ Ico K J, (|h n| * r ^ (2 * n + 1)) ^ 2
        = ∑ n ∈ Ico K J, h n ^ 2 * r ^ (2 * (2 * n + 1)) :=
      sum_congr rfl fun n _ => by rw [mul_pow, sq_abs, ← pow_mul, mul_comm (2 * n + 1) 2]
    have h2 : ∑ n ∈ Ico K J, h n ^ 2 * r ^ (2 * (2 * n + 1)) ≤ B := by
      refine le_trans ?_ (hB J)
      refine sum_le_sum_of_subset_of_nonneg (fun n hn => ?_) fun n _ _ => by positivity
      exact mem_range.2 (mem_Ico.1 hn).2
    have e3 : ∑ n ∈ Ico K J, (r⁻¹ ^ (2 * n + 1)) ^ 2
        = r⁻¹ ^ 2 * ∑ n ∈ Ico K J, (r⁻¹ ^ 4) ^ n := by
      rw [mul_sum]
      exact sum_congr rfl fun n _ => by rw [← pow_mul, ← pow_mul, ← pow_add]; congr 1; ring
    have h3 : ∑ n ∈ Ico K J, (r⁻¹ ^ 4) ^ n ≤ (r⁻¹ ^ 4) ^ K / (1 - r⁻¹ ^ 4) :=
      geom_sum_Ico_le_of_lt_one hq0 hq1
    have hpos : 0 < 1 - r⁻¹ ^ 4 := by linarith
    have hB0 : 0 ≤ B := le_trans (by simp) (hB 0)
    rw [e1, e2, e3] at hcs
    have h4 : (∑ n ∈ Ico K J, |h n|) ^ 2 ≤ T ^ 2 := by
      calc (∑ n ∈ Ico K J, |h n|) ^ 2
          ≤ (∑ n ∈ Ico K J, h n ^ 2 * r ^ (2 * (2 * n + 1)))
              * (r⁻¹ ^ 2 * ∑ n ∈ Ico K J, (r⁻¹ ^ 4) ^ n) := hcs
        _ ≤ B * (r⁻¹ ^ 2 * ((r⁻¹ ^ 4) ^ K / (1 - r⁻¹ ^ 4))) := by
            refine mul_le_mul h2 (mul_le_mul_of_nonneg_left h3 (by positivity)) ?_ hB0
            exact mul_nonneg (by positivity) (sum_nonneg fun n _ => by positivity)
        _ = B * r⁻¹ ^ (2 * (2 * K + 1)) / (1 - r⁻¹ ^ 4) := by
            rw [← pow_mul]
            have : r⁻¹ ^ (2 * (2 * K + 1)) = r⁻¹ ^ 2 * r⁻¹ ^ (4 * K) := by
              rw [← pow_add]; congr 1; ring
            rw [this]; ring
        _ ≤ T ^ 2 := by rw [div_le_iff₀ hpos]; exact hcmp
    exact (pow_le_pow_iff_left₀ (sum_nonneg fun n _ => abs_nonneg _) hT (by norm_num)).1 h4
  refine Real.tsum_le_of_sum_range_le (fun n => abs_nonneg _) fun J => ?_
  have := key (K + J)
  rwa [sum_Ico_eq_sum_range, Nat.add_sub_cancel_left,
    show (fun k => |h (K + k)|) = fun k => |h (k + K)| from funext fun k => by rw [add_comm]]
    at this

end

end Grothe
