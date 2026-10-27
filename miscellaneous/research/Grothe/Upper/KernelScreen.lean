import Mathlib

/-!
# Necessary full-score bounds from physical correlation samples

The signed mixed Hermite tail is not determined by the cubic witness payoff.
One physical-noise kernel value, or a priced finite set of values, can bound
the complete score from above without fitting or truncating that tail.
The coefficient extraction / Gaussian kernel identity is an application input;
no numerical phase integral or new Grothendieck endpoint is proved here.
-/

namespace Grothe.Upper.KernelScreen

noncomputable section

/-- The priced kernel screen also gives an admissible all-level witness tail.
This bounds every index, rather than validating a finite multiplier scan. -/
theorem all_level_price_bound {ι : Type*} [Fintype ι] (r price : ι → ℝ)
    (hr : ∀ i, 0 ≤ r i) (hr1 : ∀ i, r i ≤ 1)
    (hbudget : ∑ i, |price i| * r i ^ 5 ≤ 1) (n : ℕ) :
    |∑ i, price i * r i ^ (2 * n + 5)| ≤ 1 := by
  calc
    |∑ i, price i * r i ^ (2 * n + 5)| ≤ ∑ i, |price i * r i ^ (2 * n + 5)| :=
      Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ i, |price i| * r i ^ 5 := by
      apply Finset.sum_le_sum
      intro i _
      rw [abs_mul, abs_of_nonneg (pow_nonneg (hr i) _)]
      apply mul_le_mul_of_nonneg_left _ (abs_nonneg _)
      rw [pow_add]
      exact mul_le_of_le_one_left (pow_nonneg (hr i) 5) (pow_le_one₀ (hr i) (hr1 i))
    _ ≤ 1 := hbudget

theorem weighted_tail (a : ℕ → ℝ) (ha : Summable fun n => |a n|)
    {r : ℝ} (hr : 0 ≤ r) (hr1 : r ≤ 1) :
    |∑' n, a n * r ^ (2 * n + 5)| ≤ r ^ 5 * ∑' n, |a n| := by
  have hp : ∀ n : ℕ, r ^ (2 * n + 5) ≤ r ^ 5 := by
    intro n
    rw [pow_add]
    exact mul_le_of_le_one_left (pow_nonneg hr 5) (pow_le_one₀ hr hr1)
  have hb : ∀ n : ℕ, ‖a n * r ^ (2 * n + 5)‖ ≤ r ^ 5 * |a n| := by
    intro n
    rw [Real.norm_eq_abs, abs_mul, abs_of_nonneg (pow_nonneg hr _)]
    exact (mul_le_mul_of_nonneg_left (hp n) (abs_nonneg _)).trans_eq (mul_comm _ _)
  exact tsum_of_norm_bounded (ha.hasSum.mul_left (r ^ 5)) hb

theorem full_score_upper (a : ℕ → ℝ) (ha : Summable fun n => |a n|)
    {r : ℝ} (hr : 0 < r) (hr1 : r ≤ 1) (c0 c1 K : ℝ)
    (hK : K = c0 * r + c1 * r ^ 3 + ∑' n, a n * r ^ (2 * n + 5)) :
    c0 - |c1| - ∑' n, |a n| ≤
      c0 - |c1| - |K - c0 * r - c1 * r ^ 3| / r ^ 5 := by
  have h := weighted_tail a ha hr.le hr1
  have hid : K - c0 * r - c1 * r ^ 3 = ∑' n, a n * r ^ (2 * n + 5) := by
    rw [hK]
    ring
  rw [← hid] at h
  have ht : |K - c0 * r - c1 * r ^ 3| / r ^ 5 ≤ ∑' n, |a n| :=
    (div_le_iff₀ (pow_pos hr 5)).mpr (by simpa [mul_comm] using h)
  linarith

/-- A finite priced screen is affine in each response column. Hence the same
price works on every convex mixture if it bounds every column. The hypotheses
are necessary tail bounds; satisfying them does not prove an achievable score. -/
theorem priced_score_upper {ι : Type*} [Fintype ι]
    (r price residual : ι → ℝ) (T c0 c1 s : ℝ)
    (hT : 0 ≤ T)
    (hres : ∀ i, |residual i| ≤ r i ^ 5 * T)
    (hbudget : ∑ i, |price i| * r i ^ 5 ≤ 1) (hs : |s| ≤ 1) :
    c0 - |c1| - T ≤ c0 - s * c1 - ∑ i, price i * residual i := by
  have hp : (∑ i, price i * residual i) ≤ T := by
    calc
      (∑ i, price i * residual i) ≤ ∑ i, |price i| * |residual i| := by
        apply Finset.sum_le_sum
        intro i _
        simpa [abs_mul] using le_abs_self (price i * residual i)
      _ ≤ ∑ i, |price i| * (r i ^ 5 * T) := by
        exact Finset.sum_le_sum fun i _ => mul_le_mul_of_nonneg_left (hres i) (abs_nonneg _)
      _ = (∑ i, |price i| * r i ^ 5) * T := by rw [Finset.sum_mul]; congr 1; funext i; ring
      _ ≤ T := mul_le_of_le_one_left hT hbudget
  have hc : s * c1 ≤ |c1| := by
    calc
      s * c1 ≤ |s * c1| := le_abs_self _
      _ = |s| * |c1| := abs_mul _ _
      _ ≤ |c1| := mul_le_of_le_one_left (abs_nonneg _) hs
  linarith

end
end Grothe.Upper.KernelScreen
