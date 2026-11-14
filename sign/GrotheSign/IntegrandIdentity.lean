import GrotheSign.BinomialProduct
import GrotheSign.PositiveIntegral
import Mathlib.Tactic.FieldSimp

/-!
# The finite numerator identity behind beta preservation

Comparing the two binomial-product expansions turns the shifted alternating numerator into the
positive polynomial. The factorial and parity are retained explicitly.
-/

namespace GrotheSign

open Finset Polynomial

lemma desc_eval_eq_factorial_mul_choose (x : ℝ) (r : ℕ) :
    (descPochhammer ℝ r).eval x = (r.factorial : ℝ) * Ring.choose x r := by
  rw [descPochhammer_eval_eq_ascPochhammer, ← Polynomial.ascPochhammer_smeval_eq_eval,
    ← Polynomial.descPochhammer_smeval_eq_ascPochhammer,
    Ring.descPochhammer_eq_factorial_smul_choose, nsmul_eq_mul]

lemma choose_neg_eq_asc (x : ℝ) (r : ℕ) :
    Ring.choose (-x) r = (-1 : ℝ) ^ r * (ascPochhammer ℝ r).eval x / r.factorial := by
  have hf : (r.factorial : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.factorial_ne_zero r)
  apply (eq_div_iff hf).mpr
  rw [mul_comm, ← desc_eval_eq_factorial_mul_choose]
  have h := ascPochhammer_eval_neg_eq_descPochhammer ℝ (-x) r
  simp only [neg_neg] at h
  rw [h, ← mul_assoc, ← mul_pow]
  norm_num

private lemma sign_pair (m r q : ℕ) (hqm : q ≤ m) (hqr : q ≤ r)
    (he : Even (m + r)) : (-1 : ℝ) ^ (m - q) * (-1 : ℝ) ^ (r - q) = 1 := by
  have h2 : (-1 : ℝ) ^ (2 * q) = 1 := by rw [pow_mul]; norm_num
  calc
    (-1 : ℝ) ^ (m - q) * (-1 : ℝ) ^ (r - q) =
        (-1 : ℝ) ^ ((m - q) + (r - q)) * (-1 : ℝ) ^ (2 * q) := by
      rw [pow_add, h2, mul_one]
    _ = (-1 : ℝ) ^ (m + r) := by rw [← pow_add]; congr 1; omega
    _ = 1 := he.neg_one_pow

variable {ι : Type*} [DecidableEq ι]

/-- For matching parity, the alternating falling-factorial numerator is a positive polynomial. -/
theorem numerator_identity (t : Finset ι) (j : ι → ℕ) (s z : ℝ) (r : ℕ)
    (he : Even (t.card + r)) :
    (∑ u ∈ t.powerset, (-1 : ℝ) ^ (t.card - u.card) *
      (descPochhammer ℝ r).eval ((u.card : ℝ) - 2 * s) * z ^ labelSum j u) =
    (r.factorial : ℝ) *
      ∑ u ∈ t.powerset.filter (fun u ↦ u.card ≤ r),
        (ascPochhammer ℝ (r - u.card)).eval (2 * s) / (r - u.card).factorial *
          z ^ labelSum j u * ∏ a ∈ t \ u, (1 - z ^ j a) := by
  calc
    _ = (r.factorial : ℝ) * ∑ u ∈ t.powerset,
        (-1 : ℝ) ^ (t.card - u.card) * (∏ i ∈ u, z ^ j i) *
          Ring.choose (-2 * s + u.card) r := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro u hu
      rw [desc_eval_eq_factorial_mul_choose, Finset.prod_pow_eq_pow_sum]
      simp only [labelSum, show (u.card : ℝ) - 2 * s = -2 * s + u.card by ring]
      ring
    _ = (r.factorial : ℝ) *
        ∑ u ∈ t.powerset.filter (fun u ↦ u.card ≤ r),
          (∏ i ∈ u, z ^ j i) * (∏ i ∈ t \ u, (z ^ j i - 1)) *
            Ring.choose (-2 * s) (r - u.card) := by rw [sum_choose_card]
    _ = _ := by
      congr 1
      apply Finset.sum_congr rfl
      intro u hu
      obtain ⟨hut, hur⟩ := Finset.mem_filter.mp hu
      have hus := Finset.mem_powerset.mp hut
      have hp : (∏ i ∈ t \ u, (z ^ j i - 1)) =
          (-1 : ℝ) ^ (t.card - u.card) * ∏ i ∈ t \ u, (1 - z ^ j i) := by
        simp_rw [show ∀ i : ι, z ^ j i - 1 = -(1 - z ^ j i) by intro i; ring]
        rw [Finset.prod_neg, Finset.card_sdiff_of_subset hus]
      rw [hp, show -2 * s = -(2 * s) by ring, choose_neg_eq_asc,
        Finset.prod_pow_eq_pow_sum]
      have hsign := sign_pair t.card r u.card (Finset.card_le_card hus) hur he
      simp only [labelSum]
      calc
        _ = ((-1 : ℝ) ^ (t.card - u.card) * (-1 : ℝ) ^ (r - u.card)) *
            ((ascPochhammer ℝ (r - u.card)).eval (2 * s) / (r - u.card).factorial *
              z ^ (∑ i ∈ u, j i) * ∏ i ∈ t \ u, (1 - z ^ j i)) := by ring
        _ = _ := by rw [hsign, one_mul]

end GrotheSign
