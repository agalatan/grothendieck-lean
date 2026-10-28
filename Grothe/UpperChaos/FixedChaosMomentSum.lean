import Grothe.UpperChaos.FixedChaosMomentCoefficients
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Order.Interval.Finset.Nat

/-! A computable single-sum evaluator for the two-variable moment.
Agent-ID: codex-7c2e -/

open Finset MvPolynomial

namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

variable {R : Type*} [CommSemiring R]

/-- Explicit fast binomial coefficients avoid Pascal recursion during kernel
evaluation; the powers and all arithmetic remain in the chosen semiring. -/
def linearMomentTerm (u v : R) (n k : ℕ) : R :=
  (Nat.fast_choose n k : R) * u ^ k * v ^ (n - k)

def matrixMomentSummand (u v w : R) (p a c k : ℕ) : R :=
  (Nat.fast_choose a k : R) * (Nat.fast_choose c (p - k) : R) *
    u ^ k * v ^ ((a - k) + (p - k)) * w ^ (c - (p - k))

/-- Only the admissible pairing counts are evaluated. Unequal total degrees
give zero before any summation. -/
def matrixMoment2Sum (u v w : R) (p r a c : ℕ) : R :=
  if p + r = a + c then
    (p.factorial : R) * (r.factorial : R) *
      ∑ k ∈ Icc (p - c) (min a p), matrixMomentSummand u v w p a c k
  else 0

private theorem momentIndex_sum_eq_iff (k s l t p r : ℕ) :
    momentIndex k s + momentIndex l t = momentIndex p r ↔
      k + l = p ∧ s + t = r := by
  constructor
  · intro h
    constructor
    · have h0 := congrArg (fun e : Fin 2 →₀ ℕ => e 0) h
      simpa [momentIndex] using h0
    · have h1 := congrArg (fun e : Fin 2 →₀ ℕ => e 1) h
      simpa [momentIndex] using h1
  · rintro ⟨h0, h1⟩
    ext i
    fin_cases i <;> simp [momentIndex, h0, h1]

private theorem coordinate_power (u : R) (i : Fin 2) (n : ℕ) :
    (C u * X i : MvPolynomial (Fin 2) R) ^ n =
      monomial (Finsupp.single i n) (u ^ n) := by
  rw [mul_pow, ← C_pow, C_mul_X_pow_eq_monomial]

private theorem linearPower_expansion (u v : R) (n : ℕ) :
    (C u * X 0 + C v * X 1 : MvPolynomial (Fin 2) R) ^ n =
      ∑ k ∈ range (n + 1),
        monomial (momentIndex k (n - k)) (linearMomentTerm u v n k) := by
  rw [add_pow]
  apply Finset.sum_congr rfl
  intro k _
  rw [coordinate_power, coordinate_power, monomial_mul_monomial]
  rw [show (n.choose k : MvPolynomial (Fin 2) R) = C (n.choose k : R) by simp]
  rw [mul_comm _ (C (n.choose k : R)), C_mul_monomial]
  simp only [linearMomentTerm, Nat.choose_eq_fast_choose, momentIndex, mul_assoc]

private theorem coeff_momentPower_double (u v w : R) (p r a c : ℕ) :
    (momentPower u v w a c).coeff (momentIndex p r) =
      ∑ k ∈ range (a + 1), ∑ l ∈ range (c + 1),
        if k + l = p ∧ (a - k) + (c - l) = r then
          linearMomentTerm u v a k * linearMomentTerm v w c l
        else 0 := by
  rw [momentPower, linearPower_expansion, linearPower_expansion, Finset.sum_mul_sum]
  simp only [coeff_sum, monomial_mul_monomial, coeff_monomial, momentIndex_sum_eq_iff]

private theorem double_degree_sum (A B : ℕ → R) (p r a c : ℕ) :
    (∑ k ∈ range (a + 1), ∑ l ∈ range (c + 1),
      if k + l = p ∧ (a - k) + (c - l) = r then A k * B l else 0) =
      if p + r = a + c then
        ∑ k ∈ Icc (p - c) (min a p), A k * B (p - k)
      else 0 := by
  by_cases hd : p + r = a + c
  · rw [ite_eq_left hd]
    have hinner (k : ℕ) (hk : k ∈ range (a + 1)) :
        (∑ l ∈ range (c + 1),
          if k + l = p ∧ (a - k) + (c - l) = r then A k * B l else 0) =
          if k ∈ Icc (p - c) (min a p) then A k * B (p - k) else 0 := by
      have hka : k ≤ a := Nat.lt_succ_iff.mp (Finset.mem_range.mp hk)
      by_cases hi : k ∈ Icc (p - c) (min a p)
      · rw [ite_eq_left hi]
        obtain ⟨hlo, hhi⟩ := Finset.mem_Icc.mp hi
        have hkp : k ≤ p := hhi.trans (min_le_right _ _)
        have hpc : p - k ≤ c := by omega
        have hmem : p - k ∈ range (c + 1) := Finset.mem_range.mpr (by omega)
        have hcond : k + (p - k) = p ∧ (a - k) + (c - (p - k)) = r := by omega
        have hother (l : ℕ) (_hl : l ∈ range (c + 1)) (hne : l ≠ p - k) :
            (if k + l = p ∧ (a - k) + (c - l) = r then A k * B l else 0) = 0 := by
          apply ite_eq_right
          omega
        rw [Finset.sum_eq_single_of_mem (p - k) hmem hother, ite_eq_left hcond]
      · rw [ite_eq_right hi]
        apply Finset.sum_eq_zero
        intro l hl
        have hlc : l ≤ c := Nat.lt_succ_iff.mp (Finset.mem_range.mp hl)
        apply ite_eq_right
        intro hcond
        apply hi
        apply Finset.mem_Icc.mpr
        exact ⟨by omega, le_min hka (by omega)⟩
    calc
      _ = ∑ k ∈ range (a + 1),
          if k ∈ Icc (p - c) (min a p) then A k * B (p - k) else 0 :=
        Finset.sum_congr rfl hinner
      _ = _ := by
        have hfilter : (range (a + 1)).filter (fun k => k ∈ Icc (p - c) (min a p)) =
            Icc (p - c) (min a p) := by
          ext k
          simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_Icc]
          constructor
          · exact fun h => h.2
          · intro h
            exact ⟨lt_of_le_of_lt (h.2.trans (min_le_left _ _)) (Nat.lt_succ_self a), h⟩
        rw [← Finset.sum_filter, hfilter]
  · rw [ite_eq_right hd]
    apply Finset.sum_eq_zero
    intro k hk
    have hka : k ≤ a := Nat.lt_succ_iff.mp (Finset.mem_range.mp hk)
    apply Finset.sum_eq_zero
    intro l hl
    have hlc : l ≤ c := Nat.lt_succ_iff.mp (Finset.mem_range.mp hl)
    apply ite_eq_right
    omega

private theorem linearMomentTerm_product (u v w : R) (p a c k : ℕ) :
    linearMomentTerm u v a k * linearMomentTerm v w c (p - k) =
      matrixMomentSummand u v w p a c k := by
  unfold linearMomentTerm matrixMomentSummand
  rw [pow_add]
  ring

/-- The coefficient of the two linear powers is a single finite sum; its
index interval ensures that every natural subtraction denotes the intended
pairing multiplicity. -/
theorem coeff_momentPower_eq_sum (u v w : R) (p r a c : ℕ) :
    (momentPower u v w a c).coeff (momentIndex p r) =
      if p + r = a + c then
        ∑ k ∈ Icc (p - c) (min a p), matrixMomentSummand u v w p a c k
      else 0 := by
  rw [coeff_momentPower_double, double_degree_sum]
  split_ifs
  · apply Finset.sum_congr rfl
    intro k _
    exact linearMomentTerm_product u v w p a c k
  · rfl

/-- A computable evaluator for the actual two-variable recurrence, without
recursive branching over all matchings. -/
theorem matrixMoment2_eq_sum (u v w : R) (p r a c : ℕ) :
    matrixMoment2 u v w (p, r) (a, c) = matrixMoment2Sum u v w p r a c := by
  rw [matrixMoment2_eq_coefficient, coeff_momentPower_eq_sum]
  unfold matrixMoment2Sum
  split_ifs <;> simp

end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.matrixMoment2_eq_sum' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.matrixMoment2_eq_sum
