-- Grothe/Upper/SignedTail.lean
import Mathlib.Topology.Algebra.InfiniteSum.Real
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Signed tails around a positive reference sequence

An absolutely summable positive reference `a` controls the absolute mass of a
real coefficient sequence `k` through the weighted quadratic error
`Σ (k - a)² / a`. The bound retains the signed sum of `k`; it does not require
the actual coefficients to be positive. Bounded partial quadratic sums already
imply absolute summability, so there is no hidden convergence premise.

The three-component version uses positive rational parameters in Young's
inequality. It can reproduce the weighted Minkowski bound without introducing
square roots into an exact numerical certificate.

Agent-ID: codex-9b17
-/

namespace Grothe.Upper

open Finset

noncomputable section

/-- A positive reference turns negative coefficients into a quadratic cost. -/
theorem abs_le_self_add_sq_sub_div {a k : ℝ} (ha : 0 < a) :
    |k| ≤ k + (k - a) ^ 2 / (2 * a) := by
  by_cases hk : 0 ≤ k
  · rw [abs_of_nonneg hk]
    exact le_add_of_nonneg_right (by positivity)
  · rw [abs_of_neg (lt_of_not_ge hk)]
    have hsq : 0 ≤ (k + a) ^ 2 := sq_nonneg _
    have hdiv : -2 * k ≤ (k - a) ^ 2 / (2 * a) := by
      apply (le_div_iff₀ (by positivity : 0 < 2 * a)).2
      nlinarith only [hsq]
    linarith

/-- The factor `1/2` in the positive-reference estimate cannot be reduced.
Equality occurs at `k = -a`, where the perturbation is `-2a`. -/
theorem quadratic_reference_constant_is_optimal (c : ℝ)
    (h : ∀ a k : ℝ, 0 < a → |k| ≤ k + c * ((k - a) ^ 2 / a)) :
    1 / 2 ≤ c := by
  have htest := h 1 (-1) (by norm_num)
  norm_num at htest
  linarith

private lemma abs_le_reference_majorant {a k : ℝ} (ha : 0 < a) :
    |k| ≤ 2 * a + (k - a) ^ 2 / a := by
  have hsq : 0 ≤ (|k - a| - a) ^ 2 := sq_nonneg _
  have habs : |k - a| ^ 2 = (k - a) ^ 2 := sq_abs _
  have hdiv : |k - a| - a ≤ (k - a) ^ 2 / a := by
    apply (le_div_iff₀ ha).2
    nlinarith [sq_nonneg a, mul_nonneg ha.le (abs_nonneg (k - a))]
  have htri : |k| ≤ |k - a| + a := by
    simpa only [sub_add_cancel, abs_of_pos ha] using abs_add_le (k - a) a
  linarith

/-- A finite weighted quadratic budget implies absolute summability of `k`.
No summability of `k`, or positivity of its coefficients, is assumed. -/
theorem summable_abs_of_reference_quadratic {ι : Type*} {a k : ι → ℝ}
    (ha : ∀ i, 0 < a i) (hs : Summable a)
    (he : Summable fun i => (k i - a i) ^ 2 / a i) :
    Summable fun i => |k i| := by
  exact Summable.of_nonneg_of_le (fun _ => abs_nonneg _)
    (fun i => abs_le_reference_majorant (ha i)) ((hs.mul_left 2).add he)

/-- Preserve the signed mass and pay only half the weighted squared error. -/
theorem tsum_abs_le_signed_add_quadratic {ι : Type*} {a k : ι → ℝ}
    (ha : ∀ i, 0 < a i) (hs : Summable a)
    (he : Summable fun i => (k i - a i) ^ 2 / a i) :
    (∑' i, |k i|) ≤ (∑' i, k i) + (∑' i, (k i - a i) ^ 2 / a i) / 2 := by
  have hk := summable_abs_of_reference_quadratic ha hs he
  have hpoint (i : ι) : |k i| ≤ k i + ((k i - a i) ^ 2 / a i) / 2 := by
    convert abs_le_self_add_sq_sub_div (ha i) using 1; ring
  calc
    _ ≤ ∑' i, (k i + ((k i - a i) ^ 2 / a i) / 2) :=
      Summable.tsum_le_tsum hpoint hk (hk.of_abs.add (he.div_const 2))
    _ = _ := by rw [hk.of_abs.tsum_add (he.div_const 2), tsum_div_const]

/-- Uniform finite energy budgets suffice; no infinite quadratic sum is an input. -/
theorem tsum_abs_le_signed_add_of_quadratic_budget {a k : ℕ → ℝ} {E : ℝ}
    (ha : ∀ n, 0 < a n) (hs : Summable a)
    (hE : ∀ J, ∑ n ∈ range J, (k n - a n) ^ 2 / a n ≤ E) :
    (∑' n, |k n|) ≤ (∑' n, k n) + E / 2 := by
  have hn (n : ℕ) : 0 ≤ (k n - a n) ^ 2 / a n :=
    div_nonneg (sq_nonneg _) (ha n).le
  have he := summable_of_sum_range_le hn hE
  have hbound := tsum_abs_le_signed_add_quadratic ha hs he
  have hbudget := Real.tsum_le_of_sum_range_le hn hE
  linarith

/-- A signed tail is the total signed mass minus its finite head. The quadratic
budget itself proves convergence, including convergence of the full sequence. -/
theorem signed_tail_le_of_quadratic_budget (a k : ℕ → ℝ) (N : ℕ) (E : ℝ)
    (ha : ∀ n, 0 < a (n + N)) (hs : Summable fun n => a (n + N))
    (hE : ∀ J, ∑ n ∈ range J,
      (k (n + N) - a (n + N)) ^ 2 / a (n + N) ≤ E) :
    (∑' n, |k (n + N)|) ≤ (∑' n, k n) - (∑ n ∈ range N, k n) + E / 2 := by
  have hn (n : ℕ) : 0 ≤ (k (n + N) - a (n + N)) ^ 2 / a (n + N) := by
    exact div_nonneg (sq_nonneg _) (ha n).le
  have he := summable_of_sum_range_le hn hE
  have htail := summable_abs_of_reference_quadratic ha hs he
  have hk : Summable k := (summable_nat_add_iff N).mp htail.of_abs
  have hsplit := hk.sum_add_tsum_nat_add N
  have hbound := tsum_abs_le_signed_add_of_quadratic_budget ha hs hE
  linarith

private lemma two_mul_le_weighted_sq (x y t : ℝ) (ht : 0 < t) :
    2 * x * y ≤ t * x ^ 2 + y ^ 2 / t := by
  have hdiv : 2 * x * y - t * x ^ 2 ≤ y ^ 2 / t := by
    apply (le_div_iff₀ ht).2
    nlinarith only [sq_nonneg (t * x - y)]
  linarith

/-- A three-piece quadratic error bound with exact, freely chosen positive weights.
For positive budgets `X`, `Y`, `Z`, choosing `t = √(Y/X)`, `u = √(Z/X)`,
and `v = √(Z/Y)` gives the Minkowski coefficient `(√X + √Y + √Z)²` after
summation; rational choices avoid radicals in certificates. -/
theorem sq_add_three_le_weighted (x y z t u v : ℝ)
    (ht : 0 < t) (hu : 0 < u) (hv : 0 < v) :
    (x + y + z) ^ 2 ≤ (1 + t + u) * x ^ 2 +
      (1 + 1 / t + v) * y ^ 2 + (1 + 1 / u + 1 / v) * z ^ 2 := by
  have hxy := two_mul_le_weighted_sq x y t ht
  have hxz := two_mul_le_weighted_sq x z u hu
  have hyz := two_mul_le_weighted_sq y z v hv
  simp only [div_eq_mul_inv, one_mul] at *
  nlinarith only [hxy, hxz, hyz]

/-- Three independent quadratic energy budgets control the full signed tail.
The reference, not the actual coefficient sequence, must be positive. -/
theorem signed_tail_le_of_three_quadratic_budgets
    (a k x y z : ℕ → ℝ) (N : ℕ) (X Y Z t u v : ℝ)
    (ha : ∀ n, 0 < a (n + N)) (hs : Summable fun n => a (n + N))
    (ht : 0 < t) (hu : 0 < u) (hv : 0 < v)
    (hparts : ∀ n, k (n + N) - a (n + N) = x n + y n + z n)
    (hX : ∀ J, ∑ n ∈ range J, x n ^ 2 / a (n + N) ≤ X)
    (hY : ∀ J, ∑ n ∈ range J, y n ^ 2 / a (n + N) ≤ Y)
    (hZ : ∀ J, ∑ n ∈ range J, z n ^ 2 / a (n + N) ≤ Z) :
    (∑' n, |k (n + N)|) ≤ (∑' n, k n) - (∑ n ∈ range N, k n) +
      ((1 + t + u) * X + (1 + 1 / t + v) * Y + (1 + 1 / u + 1 / v) * Z) / 2 := by
  apply signed_tail_le_of_quadratic_budget a k N _ ha hs
  intro J
  calc
    _ ≤ ∑ n ∈ range J, ((1 + t + u) * (x n ^ 2 / a (n + N)) +
        (1 + 1 / t + v) * (y n ^ 2 / a (n + N)) +
        (1 + 1 / u + 1 / v) * (z n ^ 2 / a (n + N))) := by
      apply sum_le_sum
      intro n _
      rw [hparts n]
      convert div_le_div_of_nonneg_right
        (sq_add_three_le_weighted (x n) (y n) (z n) t u v ht hu hv) (ha n).le using 1;
        ring
    _ = (1 + t + u) * (∑ n ∈ range J, x n ^ 2 / a (n + N)) +
        (1 + 1 / t + v) * (∑ n ∈ range J, y n ^ 2 / a (n + N)) +
        (1 + 1 / u + 1 / v) * (∑ n ∈ range J, z n ^ 2 / a (n + N)) := by
      simp only [sum_add_distrib, mul_sum]
    _ ≤ _ := by
      exact add_le_add (add_le_add
        (mul_le_mul_of_nonneg_left (hX J) (by positivity))
        (mul_le_mul_of_nonneg_left (hY J) (by positivity)))
        (mul_le_mul_of_nonneg_left (hZ J) (by positivity))

end

end Grothe.Upper
