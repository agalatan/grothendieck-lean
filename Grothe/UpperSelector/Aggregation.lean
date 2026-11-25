import Grothe.UpperSelector.Wiener

set_option warningAsError true

/-!
# Aggregating shifted scalar-phase grades

The scalar phase grade `k` contributes its radial row beginning at degree `k`.
Absolute summability allows regrouping by total degree. For retained lower scalar
masses the full error is the missing mass plus the weighted sum of row errors.

Agent-ID: codex-a7c4
-/

namespace Haagerup.AngularSelector

open Finset

/-- Coefficients of `∑ₖ xᵏ Fₖ(x)` after grouping the row grades by total degree. -/
noncomputable def gradeSeries (F : ℕ → ℕ → ℝ) (n : ℕ) : ℝ :=
  ∑ k ∈ range (n + 1), F k (n - k)

/-- Regroup one absolutely summable signed table by total grade. -/
private theorem hasSum_gradeSeries {F : ℕ → ℕ → ℝ}
    (hs : Summable (fun p : ℕ × ℕ => F p.1 p.2)) :
    HasSum (gradeSeries F) (∑' p : ℕ × ℕ, F p.1 p.2) := by
  let e := HasAntidiagonal.sigmaAntidiagonalEquivProd (A := ℕ)
  have h := e.hasSum_iff.mpr hs.hasSum
  refine h.sigma fun n => ?_
  change HasSum (fun p : antidiagonal n => F p.val.1 p.val.2) (gradeSeries F n)
  rw [gradeSeries, ← Nat.sum_antidiagonal_eq_sum_range_succ F n, ← Finset.sum_finset_coe]
  exact hasSum_fintype _

private theorem summable_table_abs {F : ℕ → ℕ → ℝ} {b : ℕ → ℝ}
    (hF : ∀ k, WienerBound (F k) (b k)) (hb : Summable b) :
    Summable (fun p : ℕ × ℕ => |F p.1 p.2|) := by
  apply (summable_prod_of_nonneg (fun p : ℕ × ℕ => abs_nonneg (F p.1 p.2))).mpr
  exact ⟨fun k => (hF k).1, Summable.of_nonneg_of_le
    (fun _ => tsum_nonneg fun _ => abs_nonneg _) (fun k => (hF k).2) hb⟩

/-- The norm of the aggregate of shifted rows is at most the sum of the row budgets. -/
theorem gradeSeries_wienerBound {F : ℕ → ℕ → ℝ} {b : ℕ → ℝ} {B : ℝ}
    (hF : ∀ k, WienerBound (F k) (b k)) (hb : HasSum b B) : WienerBound (gradeSeries F) B := by
  have hp := summable_table_abs hF hb.summable
  have hmajor := hasSum_gradeSeries (F := fun k j => |F k j|) hp
  have hle (n : ℕ) : |gradeSeries F n| ≤ gradeSeries (fun k j => |F k j|) n :=
    abs_sum_le_sum_abs _ _
  have hs := Summable.of_nonneg_of_le (fun k => abs_nonneg _) hle hmajor.summable
  refine ⟨hs, ((hs.tsum_le_tsum hle hmajor.summable).trans_eq hmajor.tsum_eq).trans ?_⟩
  rw [hp.tsum_prod]
  exact (hp.prod.tsum_le_tsum (fun k => (hF k).2) hb.summable).trans_eq hb.tsum_eq

/-- On the closed unit interval the aggregate series evaluates to the sum of the individual
row series multiplied by their shifts. -/
theorem gradeSeries_hasSum {F : ℕ → ℕ → ℝ} {b v : ℕ → ℝ} {x : ℝ} (hx : |x| ≤ 1)
    (hF : ∀ k, WienerBound (F k) (b k)) (hb : Summable b)
    (hval : ∀ k, HasSum (fun j => F k j * x ^ j) (v k)) :
    HasSum (fun n => gradeSeries F n * x ^ n) (∑' k, x ^ k * v k) := by
  let g (p : ℕ × ℕ) := F p.1 p.2 * x ^ (p.1 + p.2)
  have hp := summable_table_abs hF hb
  have hle (p : ℕ × ℕ) : ‖g p‖ ≤ |F p.1 p.2| := by
    change ‖F p.1 p.2 * x ^ (p.1 + p.2)‖ ≤ _
    rw [Real.norm_eq_abs, abs_mul, abs_pow]
    exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ (abs_nonneg _) hx)
  have hpair : Summable g := (Summable.of_nonneg_of_le (fun p => norm_nonneg (g p)) hle hp).of_norm
  have hv (k : ℕ) : HasSum (fun j => g (k, j)) (x ^ k * v k) := by
    refine ((hval k).mul_left (x ^ k)).congr_fun fun j => ?_
    dsimp [g]
    rw [pow_add]
    ring
  have htotal := (hpair.hasSum.prod_fiberwise hv).tsum_eq
  rw [htotal]
  refine (hasSum_gradeSeries (F := fun k j => g (k,j)) hpair).congr_fun fun n => ?_
  rw [gradeSeries, sum_mul, gradeSeries]
  apply sum_congr rfl
  intro k hk
  simp only [g, Nat.add_sub_of_le (Nat.le_of_lt_succ (mem_range.mp hk))]

theorem WienerBound.const_mul {f : ℕ → ℝ} {a b : ℝ} (ha : 0 ≤ a) (hf : WienerBound f b) :
    WienerBound (fun n => a * f n) (a * b) := by
  simp only [WienerBound, abs_mul, abs_of_nonneg ha]
  exact ⟨hf.1.mul_left _, (hf.1.hasSum.mul_left _).tsum_eq.le.trans (mul_le_mul_of_nonneg_left hf.2 ha)⟩

private theorem hasSum_prefix (a : ℕ → ℝ) (K : ℕ) :
    HasSum (fun k => if k < K then a k else 0) (∑ k ∈ range K, a k) := by
  have hs := hasSum_sum_of_ne_finset_zero (L := .unconditional ℕ) (f := fun k => if k < K then a k else 0) (s := range K)
    (fun k hk => by simp [show ¬ k < K from fun h => hk (mem_range.mpr h)])
  convert hs using 1
  exact sum_congr rfl fun k hk => by simp [mem_range.mp hk]

/-- Dropping and rounding down scalar-phase masses costs only the missing mass.
The retained row approximations contribute their Wiener errors with the retained weights. -/
theorem scalarGrade_truncation (r b ε : ℕ → ℝ) (F A : ℕ → ℕ → ℝ) (K : ℕ)
    (hr : Summable r) (hmass : ∑' k, r k ≤ 1) (hr0 : ∀ k, 0 ≤ r k)
    (hb : ∀ k < K, 0 ≤ b k ∧ b k ≤ r k) (hF : ∀ k, WienerBound (F k) 1)
    (herr : ∀ k < K, WienerBound (fun j => F k j - A k j) (ε k)) :
    WienerBound (fun n => gradeSeries (fun k j => r k * F k j) n -
      gradeSeries (fun k j => if k < K then b k * A k j else 0) n)
      (1 - ∑ k ∈ range K, b k + ∑ k ∈ range K, b k * ε k) := by
  let G (k j : ℕ) := r k * F k j - (if k < K then b k * A k j else 0)
  let d (k : ℕ) := r k - (if k < K then b k else 0) + (if k < K then b k * ε k else 0)
  have hrows (k : ℕ) : WienerBound (G k) (d k) := by
    by_cases hk : k < K
    · have h := ((hF k).const_mul (sub_nonneg.mpr (hb k hk).2)).add ((herr k hk).const_mul (hb k hk).1)
      have heq (j : ℕ) : G k j = (r k - b k) * F k j + b k * (F k j - A k j) := by
        simp only [G, hk, ↓reduceIte]
        ring
      simpa only [WienerBound, heq, d, hk, ↓reduceIte, mul_one] using h
    · simpa [G, d, hk, WienerBound] using (hF k).const_mul (hr0 k)
  have hd : HasSum d ((∑' k, r k) - ∑ k ∈ range K, b k + ∑ k ∈ range K, b k * ε k) :=
    (hr.hasSum.sub (hasSum_prefix b K)).add (hasSum_prefix (fun k => b k * ε k) K)
  have heq (n : ℕ) : gradeSeries G n = gradeSeries (fun k j => r k * F k j) n -
      gradeSeries (fun k j => if k < K then b k * A k j else 0) n := by
    simp only [gradeSeries, G, sum_sub_distrib]
  obtain ⟨hs, hbudget⟩ := gradeSeries_wienerBound hrows hd
  simp only [heq] at hs hbudget
  exact ⟨hs, hbudget.trans (by linarith)⟩


/-- Replacing an approximation by its finite head adds exactly the Wiener allowance
of its discarded coefficients to the original error budget. -/
theorem wienerBound_truncateHead {f A : ℕ → ℝ} {a b : ℝ} (J : ℕ)
    (herr : WienerBound (fun n => f n - A n) a) (htail : WienerBound (fun n => A (n + J)) b) :
    WienerBound (fun n => f n - (if n < J then A n else 0)) (a + b) := by
  let rem (n : ℕ) := if n < J then (0 : ℝ) else A n
  have hshift (n : ℕ) : rem (n + J) = A (n + J) := by simp [rem]
  have hs : Summable (fun n => |rem n|) := (summable_nat_add_iff J).mp
    (htail.1.congr fun n => by rw [hshift])
  have hrem : WienerBound rem b := by
    refine ⟨hs, ?_⟩
    rw [← hs.sum_add_tsum_nat_add J]
    have hzero : ∑ n ∈ range J, |rem n| = 0 := sum_eq_zero fun n hn => by simp [rem, mem_range.mp hn]
    simpa only [hzero, zero_add, hshift] using htail.2
  have heq (n : ℕ) : f n - (if n < J then A n else 0) = f n - A n + rem n := by
    by_cases h : n < J <;> simp [rem, h]
  simpa only [WienerBound, heq] using herr.add hrem

/-- Combining channel errors preserves the cancellation in the mixed approximate head.
Only the individual full-series approximation allowances are added with the weights. -/
theorem weightedMix_approximation {ι : Type*} [Fintype ι] (p : ι → ℝ) (hp : ∀ i, 0 ≤ p i)
    {f A : ι → ℕ → ℝ} {b : ι → ℝ} (hb : ∀ i, WienerBound (fun n => f i n - A i n) (b i)) :
    WienerBound (fun n => (∑ i, p i * f i n) - ∑ i, p i * A i n) (∑ i, p i * b i) := by
  have major := hasSum_sum (s := (univ : Finset ι)) fun i _ => (hb i).1.hasSum.mul_left (p i)
  have hle (n : ℕ) : |(∑ i, p i * f i n) - ∑ i, p i * A i n| ≤ ∑ i, p i * |f i n - A i n| := by
    rw [← sum_sub_distrib]
    simpa only [← mul_sub, abs_mul, abs_of_nonneg (hp _)] using
      (abs_sum_le_sum_abs (fun i => p i * (f i n - A i n)) univ)
  have hs := Summable.of_nonneg_of_le (fun n => abs_nonneg _) hle major.summable
  refine ⟨hs, ((hs.tsum_le_tsum hle major.summable).trans_eq major.tsum_eq).trans ?_⟩
  exact sum_le_sum fun i _ => mul_le_mul_of_nonneg_left (hb i).2 (hp i)

end Haagerup.AngularSelector
