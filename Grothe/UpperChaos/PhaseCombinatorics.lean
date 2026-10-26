import Mathlib.RingTheory.Binomial
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Finite coefficient identity for phase rounding

The charge-one complex Hermite coefficients reduce to a terminating Vandermonde identity.
This file proves that identity first for rising factorials, then for Gamma values.
-/

open Polynomial Finset

namespace Grothe.UpperChaos.PhaseCombinatorics

noncomputable def asc (a : ℝ) (n : ℕ) : ℝ := (ascPochhammer ℝ n).eval a
noncomputable def desc (a : ℝ) (n : ℕ) : ℝ := (descPochhammer ℤ n).smeval a

lemma desc_nat (n j : ℕ) : desc n j = (j.factorial : ℝ) * (n.choose j : ℝ) := by
  simpa only [desc, Nat.descFactorial_eq_factorial_mul_choose, Nat.cast_mul] using
    (descPochhammer_smeval_eq_descFactorial (R := ℝ) n j)

lemma desc_neg (a : ℝ) (n : ℕ) : desc (-a) n = (-1 : ℝ) ^ n * asc a n := by
  have h := ascPochhammer_smeval_neg_eq_descPochhammer (-a) n
  simp only [neg_neg, ascPochhammer_smeval_eq_eval, Units.smul_def, zsmul_eq_mul,
    Int.cast_negOnePow_natCast] at h
  change asc a n = (-1 : ℝ) ^ n * desc (-a) n at h
  rw [h, ← mul_assoc, ← mul_pow]
  norm_num

/-- A finite polynomial identity; no analytic convergence hypotheses. -/
theorem pochhammer_antidiagonal (k : ℕ) (a : ℝ) :
    (∑ ij ∈ antidiagonal k, (-1 : ℝ) ^ ij.1 * ((k + 1).choose ij.1 : ℝ) *
      (k.choose ij.1 : ℝ) * (ij.1.factorial : ℝ) * asc a ij.2) =
      (-1 : ℝ) ^ k * asc (2 - a) k := by
  have h := Ring.descPochhammer_smeval_add k
    (Commute.all (((k + 1 : ℕ) : ℝ)) (-a))
  rw [descPochhammer_smeval_eq_ascPochhammer, ascPochhammer_smeval_eq_eval] at h
  have ha : (((k + 1 : ℕ) : ℝ) + -a - (k : ℝ) + 1) = 2 - a := by push_cast; ring
  rw [ha] at h
  change asc (2 - a) k = ∑ ij ∈ antidiagonal k,
    (k.choose ij.1 : ℝ) * (desc (k + 1 : ℕ) ij.1 * desc (-a) ij.2) at h
  rw [h, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro ij hij
  have hij' : ij.1 + ij.2 = k := Finset.mem_antidiagonal.mp hij
  have hs : (-1 : ℝ) ^ k * (-1 : ℝ) ^ ij.2 = (-1 : ℝ) ^ ij.1 := by
    rw [← hij', pow_add, mul_assoc, ← mul_pow]
    norm_num
  rw [desc_nat, desc_neg]
  calc
    _ = ((-1 : ℝ) ^ k * (-1 : ℝ) ^ ij.2) *
        (((k + 1).choose ij.1 : ℝ) * (k.choose ij.1 : ℝ) *
          (ij.1.factorial : ℝ) * asc a ij.2) := by rw [hs]; ring
    _ = _ := by ring

/-- The same identity in the index convention of the phase coefficient. -/
theorem pochhammer_range (k : ℕ) (a : ℝ) :
    (∑ j ∈ range (k + 1), (-1 : ℝ) ^ j * ((k + 1).choose j : ℝ) *
      (k.choose j : ℝ) * (j.factorial : ℝ) * asc a (k - j)) =
      (-1 : ℝ) ^ k * asc (2 - a) k := by
  simpa only [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk] using
    pochhammer_antidiagonal k a

lemma Gamma_add_nat (a : ℝ) (ha : 0 < a) (n : ℕ) :
    Real.Gamma (a + n) = Real.Gamma a * asc a n := by
  induction n with
  | zero => simp [asc]
  | succ n ih =>
    rw [show a + ((n + 1 : ℕ) : ℝ) = (a + n) + 1 by push_cast; ring,
      Real.Gamma_add_one (by positivity), ih]
    simp only [asc, ascPochhammer_succ_eval]
    ring

/-- The finite Gamma coefficient identity for charge-one phase rounding. -/
theorem phase_coefficient (k : ℕ) :
    (∑ j ∈ range (k + 1), (-1 : ℝ) ^ j * ((k + 1).choose j : ℝ) *
      (k.choose j : ℝ) * (j.factorial : ℝ) * Real.Gamma ((k : ℝ) + 3 / 2 - j)) =
      (-1 : ℝ) ^ k * Real.Gamma (3 / 2) * asc (1 / 2) k := by
  calc
    _ = Real.Gamma (3 / 2) * (∑ j ∈ range (k + 1), (-1 : ℝ) ^ j *
        ((k + 1).choose j : ℝ) * (k.choose j : ℝ) * (j.factorial : ℝ) *
          asc (3 / 2) (k - j)) := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro j hj
      have hjk : j ≤ k := by simpa only [mem_range, Nat.lt_succ_iff] using hj
      rw [show (k : ℝ) + 3 / 2 - j = 3 / 2 + ((k - j : ℕ) : ℝ) by
        rw [Nat.cast_sub hjk]; ring, Gamma_add_nat (3 / 2) (by norm_num)]
      ring
    _ = _ := by
      rw [pochhammer_range, show (2 - 3 / 2 : ℝ) = 1 / 2 by norm_num]
      ring

end Grothe.UpperChaos.PhaseCombinatorics
