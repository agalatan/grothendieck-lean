import Grothe.Upper.KernelScreen

/-!
# Common signed-tail prices with a finite all-index certificate

The old triangle budget prices each noise residual separately. Here the same
signed coefficient sequence enters every residual before the absolute value.
A finite spectral front and one geometric-tail budget bound every index.
The Gaussian integral values remain application inputs.
-/

namespace Grothe.Upper.SpectralScreen

noncomputable section

theorem all_level_price_of_front_tail {ι : Type*} [Fintype ι]
    (r price : ι → ℝ) (L : ℕ) (hr : ∀ i, 0 ≤ r i) (hr1 : ∀ i, r i ≤ 1)
    (hfront : ∀ n : ℕ, n < L → |∑ i, price i * r i ^ (2 * n + 5)| ≤ 1)
    (htail : ∑ i, |price i| * r i ^ (2 * L + 5) ≤ 1) (n : ℕ) :
    |∑ i, price i * r i ^ (2 * n + 5)| ≤ 1 := by
  by_cases hn : n < L
  · exact hfront n hn
  · have hp : ∀ i, r i ^ (2 * n + 5) ≤ r i ^ (2 * L + 5) := by
      intro i
      obtain ⟨k, hk⟩ := Nat.exists_eq_add_of_le (le_of_not_gt hn)
      rw [hk]
      have he : 2 * (L + k) + 5 = 2 * k + (2 * L + 5) := by omega
      rw [he, pow_add]
      exact mul_le_of_le_one_left (pow_nonneg (hr i) _) (pow_le_one₀ (hr i) (hr1 i))
    calc
      |∑ i, price i * r i ^ (2 * n + 5)| ≤ ∑ i, |price i * r i ^ (2 * n + 5)| :=
        Finset.abs_sum_le_sum_abs _ _
      _ ≤ ∑ i, |price i| * r i ^ (2 * L + 5) := by
        apply Finset.sum_le_sum
        intro i _
        rw [abs_mul, abs_of_nonneg (pow_nonneg (hr i) _)]
        exact mul_le_mul_of_nonneg_left (hp i) (abs_nonneg _)
      _ ≤ 1 := htail

theorem common_tail_price {ι : Type*} [Fintype ι]
    (r price : ι → ℝ) (a : ℕ → ℝ) (ha : Summable fun n => |a n|)
    (hr : ∀ i, 0 ≤ r i) (hr1 : ∀ i, r i ≤ 1)
    (hspec : ∀ n : ℕ, |∑ i, price i * r i ^ (2 * n + 5)| ≤ 1) :
    |∑ i, price i * (∑' n, a n * r i ^ (2 * n + 5))| ≤ ∑' n, |a n| := by
  have hi : ∀ i, Summable fun n => a n * r i ^ (2 * n + 5) := by
    intro i
    apply Summable.of_norm_bounded ha
    intro n
    rw [Real.norm_eq_abs, abs_mul, abs_of_nonneg (pow_nonneg (hr i) _)]
    exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ (hr i) (hr1 i))
  have hid : (∑ i, price i * (∑' n, a n * r i ^ (2 * n + 5))) =
      ∑' n, a n * (∑ i, price i * r i ^ (2 * n + 5)) := by
    calc
      (∑ i, price i * (∑' n, a n * r i ^ (2 * n + 5))) =
          ∑ i, ∑' n, price i * (a n * r i ^ (2 * n + 5)) := by simp_rw [tsum_mul_left]
      _ = ∑' n, ∑ i, price i * (a n * r i ^ (2 * n + 5)) := by
        rw [← Summable.tsum_finsetSum fun i _ => (hi i).mul_left (price i)]
      _ = _ := by
        apply tsum_congr
        intro n
        rw [Finset.mul_sum]
        apply Finset.sum_congr rfl
        intro i _
        ring
  have hb : ∀ n : ℕ, ‖a n * (∑ i, price i * r i ^ (2 * n + 5))‖ ≤ |a n| := by
    intro n
    rw [Real.norm_eq_abs, abs_mul]
    exact mul_le_of_le_one_right (abs_nonneg _) (hspec n)
  have hs := Summable.of_norm_bounded ha hb
  rw [hid]
  exact (norm_tsum_le_tsum_norm hs.norm).trans (hs.norm.tsum_le_tsum hb ha)

theorem full_score_upper {ι : Type*} [Fintype ι]
    (r price K : ι → ℝ) (a : ℕ → ℝ) (ha : Summable fun n => |a n|)
    (hr : ∀ i, 0 ≤ r i) (hr1 : ∀ i, r i ≤ 1)
    (hspec : ∀ n : ℕ, |∑ i, price i * r i ^ (2 * n + 5)| ≤ 1)
    (c0 c1 s : ℝ) (hs : |s| ≤ 1)
    (hK : ∀ i, K i = c0 * r i + c1 * r i ^ 3 + ∑' n, a n * r i ^ (2 * n + 5)) :
    c0 - |c1| - ∑' n, |a n| ≤
      c0 - s * c1 - ∑ i, price i * (K i - c0 * r i - c1 * r i ^ 3) := by
  have hid : (∑ i, price i * (K i - c0 * r i - c1 * r i ^ 3)) =
      ∑ i, price i * (∑' n, a n * r i ^ (2 * n + 5)) := by
    apply Finset.sum_congr rfl
    intro i _
    rw [hK i]
    ring
  have h := common_tail_price r price a ha hr hr1 hspec
  rw [← hid] at h
  have hp := (le_abs_self (∑ i, price i * (K i - c0 * r i - c1 * r i ^ 3))).trans h
  have hc : s * c1 ≤ |c1| := by
    calc
      s * c1 ≤ |s * c1| := le_abs_self _
      _ = |s| * |c1| := abs_mul _ _
      _ ≤ |c1| := mul_le_of_le_one_left (abs_nonneg _) hs
  linarith

theorem affine_error_bound {ι : Type*} [Fintype ι]
    (w x mid err : ι → ℝ) (he : ∀ i, |x i - mid i| ≤ err i) :
    |∑ i, w i * x i - ∑ i, w i * mid i| ≤ ∑ i, |w i| * err i := by
  rw [← Finset.sum_sub_distrib]
  calc
    |∑ i, (w i * x i - w i * mid i)| = |∑ i, w i * (x i - mid i)| := by
      congr 1
      apply Finset.sum_congr rfl
      intro i _
      ring
    _ ≤ ∑ i, |w i * (x i - mid i)| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ i, |w i| * err i := by
      apply Finset.sum_le_sum
      intro i _
      rw [abs_mul]
      exact mul_le_mul_of_nonneg_left (he i) (abs_nonneg _)

/-- The separator, rather than the concave full score, is averaged over a pool. -/
theorem finite_mixture_score_bound {ι : Type*} [Fintype ι]
    (w c0 c1 c2 c3 : ι → ℝ) (s cap tail : ℝ)
    (hw : ∀ i, 0 ≤ w i) (hws : ∑ i, w i = 1) (hs : |s| ≤ 1)
    (hcol : ∀ i, c0 i-s*c1 i-c2 i-c3 i ≤ cap)
    (ht : |∑ i, w i*c1 i|+|∑ i, w i*c2 i|+|∑ i, w i*c3 i| ≤ tail) :
    (∑ i, w i*c0 i)-tail ≤ cap := by
  have h1 : s*(∑ i, w i*c1 i) ≤ |∑ i, w i*c1 i| := by
    calc
      _ ≤ |s*(∑ i, w i*c1 i)| := le_abs_self _
      _ = |s| * |∑ i, w i*c1 i| := abs_mul _ _
      _ ≤ _ := mul_le_of_le_one_left (abs_nonneg _) hs
  have h2 := le_abs_self (∑ i, w i*c2 i)
  have h3 := le_abs_self (∑ i, w i*c3 i)
  have hbound : ∑ i, w i*(c0 i-s*c1 i-c2 i-c3 i) ≤ cap := by
    calc
      _ ≤ ∑ i, w i*cap := Finset.sum_le_sum fun i _ => mul_le_mul_of_nonneg_left (hcol i) (hw i)
      _ = cap := by rw [← Finset.sum_mul,hws,one_mul]
  have hid : (∑ i, w i*(c0 i-s*c1 i-c2 i-c3 i)) =
      (∑ i, w i*c0 i)-s*(∑ i, w i*c1 i)-(∑ i, w i*c2 i)-(∑ i, w i*c3 i) := by
    have hswap : (∑ i, w i*(s*c1 i)) = s*(∑ i, w i*c1 i) := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro i _
      ring
    simp_rw [mul_sub]
    simp only [Finset.sum_sub_distrib,hswap]
  rw [hid] at hbound
  linarith

end
end Grothe.Upper.SpectralScreen
