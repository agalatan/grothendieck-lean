import Grothe.Upper.FiniteDifference
import Grothe.Upper.Haagerup

/-!
# Complete monotonicity of the Haagerup coefficients

Each quotient `(a)_k/(b)_k`, for `0 ≤ a ≤ b` and `b > 0`, is completely
monotone: one difference increases `b` and multiplies by `(b-a)/b`.
The Haagerup coefficient is the product of the quotients with parameters
`(1/2,1)` and `(1/2,2)`.
-/

namespace Grothe.HaagerupCompleteMonotone

open Upper.FiniteDifference

noncomputable section

/-- Quotient of rising factorials, expressed by its elementary recurrence. -/
def quotient (a b : ℝ) : ℕ → ℝ
  | 0 => 1
  | k + 1 => quotient a b k * (a + k) / (b + k)

lemma quotient_nonneg {a b : ℝ} (ha : 0 ≤ a) (hb : 0 < b) (k : ℕ) :
    0 ≤ quotient a b k := by
  induction k with
  | zero => exact zero_le_one
  | succ k ih =>
    exact div_nonneg (mul_nonneg ih (add_nonneg ha (Nat.cast_nonneg k)))
      (add_pos_of_pos_of_nonneg hb (Nat.cast_nonneg k)).le

lemma quotient_shift (a : ℝ) {b : ℝ} (hb : 0 < b) (k : ℕ) :
    quotient a (b + 1) k = b / (b + k) * quotient a b k := by
  induction k with
  | zero => simp [quotient, ne_of_gt hb]
  | succ k ih =>
    rw [quotient, quotient, ih]
    push_cast
    have h0 : b + k ≠ 0 := ne_of_gt (add_pos_of_pos_of_nonneg hb (Nat.cast_nonneg k))
    have h1 : b + 1 + k ≠ 0 := by positivity
    have h2 : b + (k + 1) ≠ 0 := by positivity
    field_simp [h0, h1, h2]
    ring

lemma diff_quotient (a : ℝ) {b : ℝ} (hb : 0 < b) :
    diff (quotient a b) = fun k => ((b - a) / b) * quotient a (b + 1) k := by
  funext k
  rw [diff, quotient, quotient_shift a hb]
  have h0 : b + k ≠ 0 := ne_of_gt (add_pos_of_pos_of_nonneg hb (Nat.cast_nonneg k))
  field_simp [h0, ne_of_gt hb]
  ring

lemma quotient_completelyMonotone {a b : ℝ} (ha : 0 ≤ a) (hab : a ≤ b) (hb : 0 < b) :
    CompletelyMonotone (quotient a b) := by
  intro m
  induction m generalizing b with
  | zero => exact quotient_nonneg ha hb
  | succ m ih =>
    intro k
    rw [iterDiff_succ, diff_quotient a hb, iterDiff_mul_const]
    apply mul_nonneg (div_nonneg (sub_nonneg.mpr hab) hb.le)
    exact ih (hab.trans (le_add_of_nonneg_right zero_le_one)) (by positivity) k

lemma haagR_eq (k : ℕ) :
    (haagR k : ℝ) = quotient (1/2) 1 k * quotient (1/2) 2 k := by
  induction k with
  | zero => norm_num [haagR, quotient]
  | succ k ih =>
    rw [haagR, quotient, quotient]
    push_cast
    rw [ih]
    have h1 : (k : ℝ) + 1 ≠ 0 := by positivity
    have h2 : (k : ℝ) + 2 ≠ 0 := by positivity
    field_simp [h1, h2, show (1 : ℝ) + k = k + 1 by ring,
      show (2 : ℝ) + k = k + 2 by ring]
    ring

theorem haagR_completelyMonotone : CompletelyMonotone (fun k => (haagR k : ℝ)) := by
  have h1 : CompletelyMonotone (quotient (1/2) 1) :=
    quotient_completelyMonotone (by norm_num) (by norm_num) (by norm_num)
  have h2 : CompletelyMonotone (quotient (1/2) 2) :=
    quotient_completelyMonotone (by norm_num) (by norm_num) (by norm_num)
  simpa only [haagR_eq] using h1.mul h2

theorem iterDiff_haagR_nonneg (m k : ℕ) :
    0 ≤ iterDiff m (fun k => (haagR k : ℝ)) k := haagR_completelyMonotone m k

theorem iterDiff_haagR_succ_le (m k : ℕ) :
    iterDiff m (fun k => (haagR k : ℝ)) (k + 1) ≤
      iterDiff m (fun k => (haagR k : ℝ)) k :=
  haagR_completelyMonotone.iterDiff_succ_le m k

lemma summable_haagR : Summable (fun k => (haagR k : ℝ)) := by
  have h := summable_haagCoeff.mul_left (4 / Real.pi)
  apply h.congr
  intro k
  rw [abs_of_nonneg (haagCoeff_nonneg k), haagCoeff]
  field_simp [Real.pi_ne_zero]

lemma tendsto_haagR_zero :
    Filter.Tendsto (fun k => (haagR k : ℝ)) Filter.atTop (nhds 0) :=
  summable_haagR.tendsto_atTop_zero

theorem tendsto_iterDiff_haagR_zero (m : ℕ) :
    Filter.Tendsto (iterDiff m (fun k => (haagR k : ℝ))) Filter.atTop (nhds 0) :=
  haagR_completelyMonotone.tendsto_iterDiff_zero tendsto_haagR_zero m

end
end Grothe.HaagerupCompleteMonotone
