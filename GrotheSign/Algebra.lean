import GrotheSign.Basic
import Mathlib.Algebra.MvPolynomial.CommRing
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Tactic

/-!
# Algebraic numerator shift in the resolvent coefficient

The alternating Boolean sum annihilates polynomials of degree smaller than the number of labels.
A divided difference of falling factorials then removes the label sum from the numerator without
changing the resolvent sum.

Agent-ID: codex-1a87. Refs #363.
-/

namespace GrotheSign

open Finset MvPolynomial

variable {ι : Type*} [DecidableEq ι]

/-- Evaluation at the indicator vector of a finite subset. -/
def subsetPoint (u : Finset ι) (a : ι) : ℝ := if a ∈ u then 1 else 0

private theorem alternatingSum_eq_zero_of_independent (t : Finset ι) (f : Finset ι → ℝ)
    {a : ι} (ha : a ∈ t)
    (hf : ∀ u ∈ (t.erase a).powerset, f (insert a u) = f u) :
    ∑ u ∈ t.powerset, (-1 : ℝ) ^ (t.card - u.card) * f u = 0 := by
  have hsplit := Finset.sum_powerset_insert (Finset.notMem_erase a t)
    (fun u ↦ (-1 : ℝ) ^ (t.card - u.card) * f u)
  rw [Finset.insert_erase ha] at hsplit
  rw [hsplit, ← Finset.sum_add_distrib]
  apply Finset.sum_eq_zero
  intro u hu
  have hus : u ⊆ t.erase a := Finset.mem_powerset.mp hu
  have hau : a ∉ u := fun h ↦ Finset.notMem_erase a t (hus h)
  have hcard : u.card < t.card :=
    (Finset.card_le_card hus).trans_lt (Finset.card_erase_lt_of_mem ha)
  rw [Finset.card_insert_of_notMem hau, hf u hu]
  have he : t.card - u.card = (t.card - (u.card + 1)) + 1 := by omega
  rw [he, pow_succ]
  ring

private theorem alternatingSum_monomial_eq_zero (t : Finset ι) (d : ι →₀ ℕ)
    (hd : d.sum (fun _ n ↦ n) < t.card) :
    ∑ u ∈ t.powerset, (-1 : ℝ) ^ (t.card - u.card) *
      ∏ a ∈ d.support, subsetPoint u a ^ d a = 0 := by
  have hsupport : d.support.card ≤ d.sum (fun _ n ↦ n) := by
    change d.support.card ≤ ∑ a ∈ d.support, d a
    calc
      d.support.card = ∑ _a ∈ d.support, 1 := by simp
      _ ≤ ∑ a ∈ d.support, d a := by
        apply Finset.sum_le_sum
        intro a ha
        exact Nat.one_le_iff_ne_zero.mpr (Finsupp.mem_support_iff.mp ha)
  obtain ⟨a, hat, had⟩ :=
    Finset.exists_mem_notMem_of_card_lt_card (hsupport.trans_lt hd)
  apply alternatingSum_eq_zero_of_independent t _ hat
  intro u _
  apply Finset.prod_congr rfl
  intro b hb
  have hba : b ≠ a := by
    intro h
    subst b
    exact had hb
  simp [subsetPoint, hba]

/-- Alternating evaluation on all subsets annihilates every polynomial below the label count. -/
theorem alternatingSum_eval_eq_zero (t : Finset ι) (P : MvPolynomial ι ℝ)
    (hP : P.totalDegree < t.card) :
    ∑ u ∈ t.powerset, (-1 : ℝ) ^ (t.card - u.card) * eval (subsetPoint u) P = 0 := by
  calc
    ∑ u ∈ t.powerset, (-1 : ℝ) ^ (t.card - u.card) * eval (subsetPoint u) P =
        ∑ d ∈ P.support, P.coeff d *
          ∑ u ∈ t.powerset, (-1 : ℝ) ^ (t.card - u.card) *
            ∏ a ∈ d.support, subsetPoint u a ^ d a := by
      simp only [MvPolynomial.eval_eq, Finset.mul_sum]
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro d _
      apply Finset.sum_congr rfl
      intro u _
      ring
    _ = 0 := by
      apply Finset.sum_eq_zero
      intro d hd
      rw [alternatingSum_monomial_eq_zero t d ((le_totalDegree hd).trans_lt hP), mul_zero]

private noncomputable def subsetLinear (t : Finset ι) (w : ι → ℝ) : MvPolynomial ι ℝ :=
  ∑ a ∈ t, C (w a) * X a

omit [DecidableEq ι] in
private theorem totalDegree_subsetLinear_le (t : Finset ι) (w : ι → ℝ) :
    (subsetLinear t w).totalDegree ≤ 1 := by
  apply (totalDegree_finsetSum t _).trans
  apply Finset.sup_le
  intro a _
  simpa using totalDegree_mul (C (w a)) (X a : MvPolynomial ι ℝ)

private theorem eval_subsetLinear (t u : Finset ι) (w : ι → ℝ) (hu : u ⊆ t) :
    eval (subsetPoint u) (subsetLinear t w) = ∑ a ∈ u, w a := by
  simp only [subsetLinear, map_sum, map_mul, eval_C, eval_X, subsetPoint, mul_ite,
    mul_one, mul_zero]
  calc
    (∑ a ∈ t, if a ∈ u then w a else 0) =
        ∑ a ∈ u, if a ∈ u then w a else 0 := by
      symm
      apply Finset.sum_subset hu
      intro a _ hau
      simp [hau]
    _ = ∑ a ∈ u, w a := Finset.sum_congr rfl fun a ha ↦ by simp [ha]

private noncomputable def fallingPolynomial (A : MvPolynomial ι ℝ) : ℕ → MvPolynomial ι ℝ
  | 0 => 1
  | n + 1 => fallingPolynomial A n * (A - C (n : ℝ))

omit [DecidableEq ι] in
private theorem eval_fallingPolynomial (A : MvPolynomial ι ℝ) (x : ι → ℝ) (n : ℕ) :
    eval x (fallingPolynomial A n) = (descPochhammer ℝ n).eval (eval x A) := by
  induction n with
  | zero => simp [fallingPolynomial]
  | succ n ih =>
    simp only [fallingPolynomial, map_mul, map_sub, eval_C, ih, descPochhammer_succ_eval]

omit [DecidableEq ι] in
private theorem totalDegree_fallingPolynomial_le (A : MvPolynomial ι ℝ)
    (hA : A.totalDegree ≤ 1) (n : ℕ) : (fallingPolynomial A n).totalDegree ≤ n := by
  induction n with
  | zero => simp [fallingPolynomial]
  | succ n ih =>
    exact (totalDegree_mul _ _).trans
      (add_le_add ih ((totalDegree_sub_C_le A _).trans hA))

/-- A falling factorial of a subset sum vanishes under a higher-order finite difference. -/
theorem alternatingSum_falling_eq_zero (t : Finset ι) (w : ι → ℝ) {r : ℕ}
    (hr : r < t.card) :
    ∑ u ∈ t.powerset, (-1 : ℝ) ^ (t.card - u.card) *
      (descPochhammer ℝ r).eval (∑ a ∈ u, w a) = 0 := by
  have h := alternatingSum_eval_eq_zero t (fallingPolynomial (subsetLinear t w) r)
    ((totalDegree_fallingPolynomial_le _ (totalDegree_subsetLinear_le t w) r).trans_lt hr)
  convert h using 1
  apply Finset.sum_congr rfl
  intro u hu
  rw [eval_fallingPolynomial, eval_subsetLinear t u w (Finset.mem_powerset.mp hu)]

private noncomputable def dividedFalling (A B : MvPolynomial ι ℝ) :
    ℕ → MvPolynomial ι ℝ
  | 0 => 0
  | n + 1 => fallingPolynomial A n + (B - C (n : ℝ)) * dividedFalling A B n

omit [DecidableEq ι] in
private theorem fallingPolynomial_sub (A B : MvPolynomial ι ℝ) (n : ℕ) :
    fallingPolynomial A n - fallingPolynomial B n = (A - B) * dividedFalling A B n := by
  induction n with
  | zero => simp [fallingPolynomial, dividedFalling]
  | succ n ih =>
    simp only [fallingPolynomial, dividedFalling]
    calc
      fallingPolynomial A n * (A - C (n : ℝ)) -
          fallingPolynomial B n * (B - C (n : ℝ)) =
        (A - B) * fallingPolynomial A n +
          (B - C (n : ℝ)) * (fallingPolynomial A n - fallingPolynomial B n) := by ring
      _ = _ := by rw [ih]; ring

omit [DecidableEq ι] in
private theorem totalDegree_dividedFalling_le (A B : MvPolynomial ι ℝ)
    (hA : A.totalDegree ≤ 1) (hB : B.totalDegree ≤ 1) (n : ℕ) :
    (dividedFalling A B n).totalDegree ≤ n := by
  induction n with
  | zero => simp [dividedFalling]
  | succ n ih =>
    apply (totalDegree_add _ _).trans
    apply max_le
    · exact (totalDegree_fallingPolynomial_le A hA n).trans (Nat.le_succ n)
    · calc
        ((B - C (n : ℝ)) * dividedFalling A B n).totalDegree ≤
            (B - C (n : ℝ)).totalDegree + (dividedFalling A B n).totalDegree :=
          totalDegree_mul _ _
        _ ≤ 1 + n := add_le_add ((totalDegree_sub_C_le B _).trans hB) ih
        _ = n + 1 := Nat.add_comm _ _

/-- Below the label count, the falling-factorial numerator may be shifted across its denominator. -/
theorem resolventSum_eq_shiftedSum (t : Finset ι) (j : ι → ℕ) {s : ℝ}
    (hs : 0 < s) {r : ℕ} (hr : r < t.card) :
    resolventSum t j s r = shiftedSum t j s r := by
  let A : MvPolynomial ι ℝ := subsetLinear t (fun a ↦ 2 * (j a : ℝ) + 1)
  let B : MvPolynomial ι ℝ := subsetLinear t (fun _ ↦ 1) - C (2 * s)
  let Q := dividedFalling A B r
  have hA : A.totalDegree ≤ 1 := totalDegree_subsetLinear_le _ _
  have hB : B.totalDegree ≤ 1 :=
    (totalDegree_sub_C_le _ _).trans (totalDegree_subsetLinear_le _ _)
  have hQ : Q.totalDegree < t.card :=
    (totalDegree_dividedFalling_le A B hA hB r).trans_lt hr
  have hevalA (u : Finset ι) (hu : u ⊆ t) :
      eval (subsetPoint u) A = 2 * (labelSum j u : ℝ) + u.card := by
    rw [eval_subsetLinear t u _ hu]
    simp [labelSum, Finset.sum_add_distrib, Finset.mul_sum]
  have hevalB (u : Finset ι) (hu : u ⊆ t) :
      eval (subsetPoint u) B = (u.card : ℝ) - 2 * s := by
    change eval (subsetPoint u) (subsetLinear t (fun _ ↦ 1) - C (2 * s)) = _
    rw [map_sub, eval_C, eval_subsetLinear t u _ hu]
    simp
  apply sub_eq_zero.mp
  unfold resolventSum shiftedSum
  rw [← Finset.sum_sub_distrib]
  calc
    ∑ u ∈ t.powerset,
        ((-1 : ℝ) ^ (t.card - u.card) *
          (descPochhammer ℝ r).eval (2 * (labelSum j u : ℝ) + u.card) /
            (s + labelSum j u) -
          (-1 : ℝ) ^ (t.card - u.card) *
            (descPochhammer ℝ r).eval ((u.card : ℝ) - 2 * s) /
              (s + labelSum j u)) =
      2 * ∑ u ∈ t.powerset, (-1 : ℝ) ^ (t.card - u.card) * eval (subsetPoint u) Q := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro u hu
      have hut : u ⊆ t := Finset.mem_powerset.mp hu
      have hden : s + (labelSum j u : ℝ) ≠ 0 := ne_of_gt (by positivity)
      have hid := congrArg (eval (subsetPoint u)) (fallingPolynomial_sub A B r)
      simp only [map_sub, map_mul, eval_fallingPolynomial, hevalA u hut, hevalB u hut] at hid
      have hnum :
          (descPochhammer ℝ r).eval (2 * (labelSum j u : ℝ) + u.card) -
            (descPochhammer ℝ r).eval ((u.card : ℝ) - 2 * s) =
          2 * (s + labelSum j u) * eval (subsetPoint u) Q := by
        calc
          _ = ((2 * (labelSum j u : ℝ) + u.card) - ((u.card : ℝ) - 2 * s)) *
              eval (subsetPoint u) Q := hid
          _ = _ := by ring
      calc
        _ = (-1 : ℝ) ^ (t.card - u.card) *
            ((descPochhammer ℝ r).eval (2 * (labelSum j u : ℝ) + u.card) -
              (descPochhammer ℝ r).eval ((u.card : ℝ) - 2 * s)) /
                (s + labelSum j u) := by ring
        _ = _ := by rw [hnum]; field_simp [hden]
    _ = 0 := by rw [alternatingSum_eval_eq_zero t Q hQ, mul_zero]

end GrotheSign
