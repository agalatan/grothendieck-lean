import Grothe.Upper.Selector.Transfer

/-! # Signed polynomial preprocessing at dyadic working precision -/

open Polynomial Finset
open scoped Polynomial

set_option warningAsError true

namespace Grothe.Upper.Selector

/-- The signed linear preprocessor of the single-selector certificate. -/
noncomputable def linearPreprocessor : ℝ[X] := C (23 / 25 : ℝ) + C (-2 / 25 : ℝ) * X

private noncomputable def positivePolynomial : ℝ[X] := C (23 / 25 : ℝ) + C (2 / 25 : ℝ) * X

/-- The positive binomial coefficient before restoring the alternating polynomial signs. -/
noncomputable def polynomialWeight (k i : ℕ) := (positivePolynomial ^ (2 * k + 1)).coeff i

private def prev {A : Type*} [Zero A] (f : ℕ → A) : ℕ → A
  | 0 => 0
  | n + 1 => f n

private lemma linear_mul_coeff (P : ℝ[X]) (a b : ℝ) (i : ℕ) :
    (P * (C a + C b * X)).coeff i = a * P.coeff i + b * prev P.coeff i := by
  rw [mul_add, ← mul_assoc, coeff_add, coeff_mul_C]
  cases i with
  | zero => simp [prev, mul_comm]
  | succ i => simp [prev, mul_comm]

private lemma positive_coeff_nonneg (n i : ℕ) : 0 ≤ (positivePolynomial ^ n).coeff i := by
  induction n generalizing i with
  | zero => simp [coeff_one]; split <;> norm_num
  | succ n ih =>
    rw [pow_succ, show positivePolynomial = C (23/25 : ℝ) + C (2/25 : ℝ) * X from rfl,
      linear_mul_coeff]
    have hprev : 0 ≤ prev (positivePolynomial ^ n).coeff i := by cases i <;> simp [prev, ih]
    exact add_nonneg (mul_nonneg (by norm_num) (ih i)) (mul_nonneg (by norm_num) hprev)

theorem polynomialWeight_nonneg (k i : ℕ) : 0 ≤ polynomialWeight k i :=
  positive_coeff_nonneg _ _

private lemma restore_sign (n i : ℕ) :
    (linearPreprocessor ^ n).coeff i = (-1 : ℝ) ^ i * (positivePolynomial ^ n).coeff i := by
  induction n generalizing i with
  | zero => by_cases h : i = 0 <;> simp [coeff_one, h]
  | succ n ih =>
    rw [pow_succ, pow_succ, show linearPreprocessor = C (23/25 : ℝ) + C (-2/25 : ℝ) * X from rfl,
      show positivePolynomial = C (23/25 : ℝ) + C (2/25 : ℝ) * X from rfl, linear_mul_coeff,
      linear_mul_coeff]
    change 23 / 25 * (linearPreprocessor ^ n).coeff i + -2 / 25 * prev (linearPreprocessor ^ n).coeff i =
      (-1 : ℝ) ^ i * (23 / 25 * (positivePolynomial ^ n).coeff i + 2 / 25 * prev (positivePolynomial ^ n).coeff i)
    cases i with
    | zero => simp [prev, ih]
    | succ i => simp only [prev, ih, pow_succ]; ring

theorem polynomialWeight_signed (k i : ℕ) :
    (linearPreprocessor ^ (2 * k + 1)).coeff i = (-1 : ℝ) ^ i * polynomialWeight k i :=
  restore_sign _ _

theorem polynomialWeight_sum (k : ℕ) : HasSum (polynomialWeight k) 1 := by
  let P := positivePolynomial ^ (2 * k + 1)
  have he : P.eval 1 = 1 := by norm_num [P, positivePolynomial]
  change HasSum (fun i => P.coeff i) 1
  have hsum : HasSum (fun i => P.coeff i) (P.eval 1) := by
    rw [Polynomial.eval_eq_sum_range]
    simpa only [one_pow, mul_one] using (hasSum_sum_of_ne_finset_zero (L := .unconditional ℕ)
      (f := P.coeff) (s := range (P.natDegree + 1)) fun i hi =>
        Polynomial.coeff_eq_zero_of_natDegree_lt (by simpa using hi))
  rwa [he] at hsum

private lemma weight_step (k i : ℕ) : polynomialWeight (k + 1) i =
    (529 * polynomialWeight k i + 92 * prev (polynomialWeight k) i +
      4 * prev (prev (polynomialWeight k)) i) / 625 := by
  let P := positivePolynomial ^ (2 * k + 1)
  have hstep (Q : ℝ[X]) (j : ℕ) : (Q * positivePolynomial).coeff j =
      23 / 25 * Q.coeff j + 2 / 25 * prev Q.coeff j := linear_mul_coeff Q _ _ j
  change (positivePolynomial ^ (2 * (k + 1) + 1)).coeff i =
    (529 * P.coeff i + 92 * prev P.coeff i + 4 * prev (prev P.coeff) i) / 625
  rw [show 2 * (k + 1) + 1 = 2 * k + 1 + 2 by omega, pow_add, pow_two, ← mul_assoc,
    hstep, hstep]
  cases i with
  | zero => simp [prev]; ring
  | succ i => change _ + _ * (P * positivePolynomial).coeff i = _; rw [hstep]; simp only [prev]; ring

/-- Downward-rounded coefficients. The cutoff stores degrees strictly below `M`. -/
def polynomialCount (M S : ℕ) : ℕ → ℕ → ℕ
  | 0, i => if i < M then (if i = 0 then 23 * S / 25 else if i = 1 then 2 * S / 25 else 0) else 0
  | k + 1, i => if i < M then
      (529 * polynomialCount M S k i + 92 * prev (polynomialCount M S k) i +
        4 * prev (prev (polynomialCount M S k)) i) / 625 else 0

private theorem prev_bound {N : ℕ → ℕ} {v : ℕ → ℝ} {s : ℝ}
    (h : ∀ i, (N i : ℝ) ≤ s * v i) (i : ℕ) : ((prev N i : ℕ) : ℝ) ≤ s * prev v i := by
  cases i with
  | zero => simp [prev]
  | succ j => exact h j

theorem polynomialCount_le (M S k i : ℕ) :
    (polynomialCount M S k i : ℝ) ≤ S * polynomialWeight k i := by
  induction k generalizing i with
  | zero =>
    have hw : polynomialWeight 0 i = if i = 0 then 23 / 25 else if i = 1 then 2 / 25 else 0 := by
      simp only [polynomialWeight, Nat.mul_zero, Nat.zero_add, pow_one, positivePolynomial,
        coeff_add, coeff_C, coeff_C_mul, coeff_X]
      cases i with
      | zero => norm_num
      | succ i => cases i <;> norm_num
    by_cases hi : i < M
    · simp only [polynomialCount, hi, ↓reduceIte, hw]
      split_ifs
      · exact (Nat.cast_div_le (α := ℝ)).trans (by push_cast; ring_nf; rfl)
      · exact (Nat.cast_div_le (α := ℝ)).trans (by push_cast; ring_nf; rfl)
      · simp
    · simpa only [polynomialCount, hi, ↓reduceIte, Nat.cast_zero] using
        mul_nonneg (Nat.cast_nonneg S) (polynomialWeight_nonneg 0 i)
  | succ k ih =>
    by_cases hi : i < M
    · simp only [polynomialCount, hi, ↓reduceIte, weight_step k i]
      refine (Nat.cast_div_le (α := ℝ)).trans ?_
      push_cast
      linarith [ih i, prev_bound ih i, prev_bound (prev_bound ih) i]
    · simpa only [polynomialCount, hi, ↓reduceIte, Nat.cast_zero] using
        mul_nonneg (Nat.cast_nonneg S) (polynomialWeight_nonneg (k + 1) i)

/-- The final retained binomial numerator after the lower-precision conversion. -/
def polynomialNumerator (M B H k i : ℕ) := polynomialCount M (B * H) k i / H

private theorem polynomialNumerator_le (M k i : ℕ) {B H : ℕ} (hB : 0 < B) (hH : 0 < H) :
    (polynomialNumerator M B H k i : ℝ) / B ≤ polynomialWeight k i := by
  have hle : (polynomialNumerator M B H k i : ℝ) * H ≤ polynomialCount M (B * H) k i := by
    exact_mod_cast Nat.div_mul_le_self (polynomialCount M (B * H) k i) H
  have h := hle.trans (polynomialCount_le M (B * H) k i)
  push_cast at h
  rw [div_le_iff₀ (by exact_mod_cast hB)]
  exact le_of_mul_le_mul_right (by nlinarith only [h] :
    (polynomialNumerator M B H k i : ℝ) * H ≤ polynomialWeight k i * B * H) (by exact_mod_cast hH)

/-- The signed finite preprocessor, represented as a zero-padded sequence on the naturals. -/
noncomputable def clippedPolynomial (M B H k i : ℕ) : ℝ :=
  if i < M then (-1 : ℝ) ^ i * ((polynomialNumerator M B H k i : ℝ) / B) else 0

/-- Restoring the alternating signs and rounding down loses exactly the omitted positive mass. -/
theorem clippedPolynomial_bounds (M k : ℕ) {B H : ℕ} (hB : 0 < B) (hH : 0 < H) :
    WienerBound (clippedPolynomial M B H k) 1 ∧
    WienerBound (fun i => (linearPreprocessor ^ (2 * k + 1)).coeff i - clippedPolynomial M B H k i)
      (1 - ∑ i ∈ range M, (polynomialNumerator M B H k i : ℝ) / B) := by
  let w (i : ℕ) : ℝ := if i < M then (polynomialNumerator M B H k i : ℝ) / B else 0
  have h0 (i) : 0 ≤ w i := by dsimp [w]; split <;> positivity
  have hle (i) : w i ≤ polynomialWeight k i := by
    dsimp [w]
    split
    · exact polynomialNumerator_le M k i hB hH
    · exact polynomialWeight_nonneg _ _
  have hsum : HasSum w (∑ i ∈ range M, (polynomialNumerator M B H k i : ℝ) / B) := by
    convert hasSum_sum_of_ne_finset_zero (L := .unconditional ℕ) (s := range M)
      (f := w) (fun i hi => by simp [w, show ¬ i < M from fun h => hi (mem_range.mpr h)]) using 1
    exact sum_congr rfl fun i hi => by simp [w, mem_range.mp hi]
  have hv (i) : clippedPolynomial M B H k i = (-1 : ℝ) ^ i * w i := by
    by_cases hi : i < M <;> simp [clippedPolynomial, w, hi]
  constructor
  · simp only [WienerBound, hv, abs_mul, abs_pow, abs_neg, abs_one, one_pow, one_mul,
      abs_of_nonneg (h0 _)]
    exact ⟨hsum.summable, ((hsum.summable.tsum_le_tsum hle (polynomialWeight_sum k).summable).trans_eq
      (polynomialWeight_sum k).tsum_eq)⟩
  · have herr (i) : |(linearPreprocessor ^ (2 * k + 1)).coeff i - clippedPolynomial M B H k i| =
        polynomialWeight k i - w i := by
      rw [polynomialWeight_signed, hv, ← mul_sub, abs_mul, abs_pow, abs_neg, abs_one, one_pow,
        one_mul, abs_of_nonneg (sub_nonneg.mpr (hle i))]
    simp only [WienerBound, herr]
    exact ⟨((polynomialWeight_sum k).sub hsum).summable, ((polynomialWeight_sum k).sub hsum).tsum_eq.le⟩

/-- The signed preprocessor lies exactly on the admissible ℓ¹ boundary. -/
theorem linearPreprocessor_l1 : l1 linearPreprocessor = 1 := by
  have hd : linearPreprocessor.natDegree < 2 := by unfold linearPreprocessor; compute_degree; decide
  rw [l1_eq_sum_range linearPreprocessor hd]
  norm_num [linearPreprocessor, sum_range_succ, coeff_C, coeff_C_mul, coeff_X]

/-- Simultaneously advance all the retained positive coefficients. -/
def nextPolynomialCounts (M : ℕ) (a : Array ℕ) : Array ℕ :=
  Array.ofFn fun i : Fin M => (529 * a.getD i 0 + 92 * prev (fun j => a.getD j 0) i +
    4 * prev (prev (fun j => a.getD j 0)) i) / 625

def polynomialCountRow (M S : ℕ) : ℕ → Array ℕ
  | 0 => Array.ofFn fun i : Fin M => if i.val = 0 then 23 * S / 25 else if i.val = 1 then 2 * S / 25 else 0
  | k + 1 => nextPolynomialCounts M (polynomialCountRow M S k)

theorem polynomialCountRow_get (M S k i : ℕ) :
    (polynomialCountRow M S k).getD i 0 = polynomialCount M S k i := by
  induction k generalizing i with
  | zero => by_cases hi : i < M <;> simp [polynomialCountRow, polynomialCount, hi]
  | succ k ih =>
    by_cases hi : i < M
    · have hf : (fun j => (polynomialCountRow M S k).getD j 0) = polynomialCount M S k := funext ih
      simpa only [polynomialCount, hi, ↓reduceIte, ← hf] using
        (show (polynomialCountRow M S (k + 1)).getD i 0 =
          (529 * (polynomialCountRow M S k).getD i 0 +
            92 * prev (fun j => (polynomialCountRow M S k).getD j 0) i +
            4 * prev (prev (fun j => (polynomialCountRow M S k).getD j 0)) i) / 625 by
          simp [polynomialCountRow, nextPolynomialCounts, hi])
    · simp [polynomialCountRow, nextPolynomialCounts, polynomialCount, hi]

/-- The convolution error with the retained preprocessor is additive over the two omitted series. -/
theorem preprocessedRow_error (M k : ℕ) {B H : ℕ} (hB : 0 < B) (hH : 0 < H)
    (t : ℝ) (A : ℕ → ℝ) {e : ℝ} (herr : WienerBound (fun j => angularRow t k j - A j) e) :
    WienerBound (fun n => preprocessedRow linearPreprocessor t k n -
      wienerConv (clippedPolynomial M B H k) A n)
      (e + (1 - ∑ i ∈ range M, (polynomialNumerator M B H k i : ℝ) / B)) := by
  let P := (linearPreprocessor ^ (2 * k + 1)).coeff
  let C := clippedPolynomial M B H k
  let r := angularRow t k
  obtain ⟨hC, hPC⟩ := clippedPolynomial_bounds M k hB hH
  have heq (n) : preprocessedRow linearPreprocessor t k n - wienerConv C A n =
      wienerConv C (fun j => r j - A j) n + wienerConv (fun j => P j - C j) r n := by
    change wienerConv P r n - wienerConv C A n = _
    simp only [wienerConv, ← sum_sub_distrib, ← sum_add_distrib]
    exact sum_congr rfl fun _ _ => by ring
  have h := (hC.convolution herr).add (hPC.convolution (angularRow_wienerBound t k))
  simpa only [heq, P, C, r, one_mul, mul_one] using h

end Grothe.Upper.Selector
