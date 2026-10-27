import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Tactic.Ring

/-!
# Completely monotone sequences

Forward differences use the sign convention `a k - a (k+1)`. Complete
monotonicity is preserved by sums, nonnegative multiples, shifts and products.
-/

namespace Grothe.Upper.FiniteDifference

def diff {R : Type*} [Sub R] (a : ℕ → R) (k : ℕ) : R := a k - a (k + 1)

def iterDiff {R : Type*} [Sub R] : ℕ → (ℕ → R) → ℕ → R
  | 0, a => a
  | m + 1, a => iterDiff m (diff a)

@[simp] lemma iterDiff_zero {R : Type*} [Sub R] (a : ℕ → R) : iterDiff 0 a = a := rfl

lemma iterDiff_succ {R : Type*} [Sub R] (m : ℕ) (a : ℕ → R) :
    iterDiff (m + 1) a = iterDiff m (diff a) := rfl

lemma iterDiff_succ_apply {R : Type*} [Sub R] (m : ℕ) (a : ℕ → R) (k : ℕ) :
    iterDiff (m + 1) a k = iterDiff m a k - iterDiff m a (k + 1) := by
  induction m generalizing a with
  | zero => rfl
  | succ m ih => exact ih (diff a)

lemma iterDiff_shift {R : Type*} [Sub R] (m : ℕ) (a : ℕ → R) (s k : ℕ) :
    iterDiff m (fun i => a (i + s)) k = iterDiff m a (k + s) := by
  induction m generalizing a with
  | zero => rfl
  | succ m ih =>
    rw [iterDiff_succ, iterDiff_succ]
    have h : diff (fun i => a (i + s)) = fun i => diff a (i + s) := by
      funext i
      simp only [diff, Nat.add_right_comm]
    rw [h, ih]

lemma iterDiff_add {R : Type*} [AddCommGroup R] (m : ℕ) (a b : ℕ → R) (k : ℕ) :
    iterDiff m (fun i => a i + b i) k = iterDiff m a k + iterDiff m b k := by
  induction m generalizing a b with
  | zero => rfl
  | succ m ih =>
    rw [iterDiff_succ, iterDiff_succ, iterDiff_succ]
    have h : diff (fun i => a i + b i) = fun i => diff a i + diff b i := by
      funext i
      simp only [diff, add_sub_add_comm]
    rw [h, ih]

lemma iterDiff_ratCast (m : ℕ) (a : ℕ → ℚ) (k : ℕ) :
    iterDiff m (fun i => (a i : ℝ)) k = ((iterDiff m a k : ℚ) : ℝ) := by
  induction m generalizing a with
  | zero => rfl
  | succ m ih =>
    rw [iterDiff_succ, iterDiff_succ]
    have h : diff (fun i => (a i : ℝ)) = fun i => ((diff a i : ℚ) : ℝ) := by
      funext i
      simp only [diff, Rat.cast_sub]
    rw [h, ih]

lemma iterDiff_mul_const {R : Type*} [Ring R] (m : ℕ) (a : ℕ → R) (c : R) (k : ℕ) :
    iterDiff m (fun i => c * a i) k = c * iterDiff m a k := by
  induction m generalizing a with
  | zero => rfl
  | succ m ih =>
    rw [iterDiff_succ, iterDiff_succ]
    have h : diff (fun i => c * a i) = fun i => c * diff a i := by
      funext i
      simp only [diff, mul_sub]
    rw [h, ih]

lemma diff_mul (a b : ℕ → ℝ) :
    diff (fun k => a k * b k) =
      fun k => diff a k * b (k + 1) + a k * diff b k := by
  funext k
  simp only [diff]
  ring

/-- Every order of forward difference is nonnegative. -/
def CompletelyMonotone (a : ℕ → ℝ) : Prop := ∀ m k, 0 ≤ iterDiff m a k

namespace CompletelyMonotone

lemma nonneg {a : ℕ → ℝ} (ha : CompletelyMonotone a) (k : ℕ) : 0 ≤ a k := ha 0 k

lemma diff {a : ℕ → ℝ} (ha : CompletelyMonotone a) : CompletelyMonotone (diff a) :=
  fun m k => ha (m + 1) k

lemma shift {a : ℕ → ℝ} (ha : CompletelyMonotone a) (s : ℕ) :
    CompletelyMonotone (fun k => a (k + s)) := by
  intro m k
  rw [iterDiff_shift]
  exact ha m (k + s)

lemma add {a b : ℕ → ℝ} (ha : CompletelyMonotone a) (hb : CompletelyMonotone b) :
    CompletelyMonotone (fun k => a k + b k) := by
  intro m k
  rw [iterDiff_add]
  exact add_nonneg (ha m k) (hb m k)

lemma mul_const {a : ℕ → ℝ} (ha : CompletelyMonotone a) {c : ℝ} (hc : 0 ≤ c) :
    CompletelyMonotone (fun k => c * a k) := by
  intro m k
  rw [iterDiff_mul_const]
  exact mul_nonneg hc (ha m k)

/-- The discrete product rule proves closure under products without a measure representation. -/
lemma mul {a b : ℕ → ℝ} (ha : CompletelyMonotone a) (hb : CompletelyMonotone b) :
    CompletelyMonotone (fun k => a k * b k) := by
  intro m
  induction m generalizing a b with
  | zero => exact fun k => mul_nonneg (ha.nonneg k) (hb.nonneg k)
  | succ m ih =>
    intro k
    rw [iterDiff_succ, diff_mul, iterDiff_add]
    exact add_nonneg (ih ha.diff (hb.shift 1) k) (ih ha hb.diff k)

lemma iterDiff_succ_le {a : ℕ → ℝ} (ha : CompletelyMonotone a) (m k : ℕ) :
    iterDiff m a (k + 1) ≤ iterDiff m a k := by
  exact sub_nonneg.mp (by simpa only [iterDiff_succ_apply] using ha (m + 1) k)

lemma iterDiff_le_self {a : ℕ → ℝ} (ha : CompletelyMonotone a) (m k : ℕ) :
    iterDiff m a k ≤ a k := by
  induction m with
  | zero => exact le_rfl
  | succ m ih =>
    rw [iterDiff_succ_apply]
    exact (sub_le_self _ (ha m (k + 1))).trans ih

lemma tendsto_iterDiff_zero {a : ℕ → ℝ} (ha : CompletelyMonotone a)
    (hzero : Filter.Tendsto a Filter.atTop (nhds 0)) (m : ℕ) :
    Filter.Tendsto (iterDiff m a) Filter.atTop (nhds 0) :=
  squeeze_zero (ha m) (ha.iterDiff_le_self m) hzero

end CompletelyMonotone
end Grothe.Upper.FiniteDifference
