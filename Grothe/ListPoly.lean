import Mathlib

/-!
# Coefficient `ℓ¹` norm of polynomials, and exact integer-list arithmetic

The *Wiener-algebra norm* of a polynomial is the sum of the absolute values of its
coefficients, `‖f‖_𝒜 = ∑ₖ |[tᵏ] f|`.  It is submultiplicative,
`‖fg‖_𝒜 ≤ ‖f‖_𝒜 ‖g‖_𝒜`, which is the only structural property the tail estimates need.

To evaluate `‖ρ⁽ⁿ⁾‖_𝒜` for concrete integer polynomials and large `n` we also provide an
executable integer-list implementation (`conv`, `listPow`, `absSum`) together with the bridge
lemma `l1_ofList_listPow_le` connecting it to `Polynomial ℝ`.  The concrete numerical facts are
then discharged by `native_decide` (see `Grothe/Upper/FifthTail.lean`).
-/

namespace Grothe

open Polynomial

noncomputable section

/-- The coefficient `ℓ¹` norm `‖p‖_𝒜 = ∑ₙ |coeff p n|`. -/
def l1 (p : ℝ[X]) : ℝ := p.sum fun _ a => |a|

lemma l1_def (p : ℝ[X]) : l1 p = ∑ n ∈ p.support, |p.coeff n| := rfl

lemma l1_nonneg (p : ℝ[X]) : 0 ≤ l1 p :=
  Finset.sum_nonneg fun _ _ => abs_nonneg _

@[simp] lemma l1_zero : l1 0 = 0 := by simp [l1]

lemma l1_eq_sum_range (p : ℝ[X]) {N : ℕ} (hN : p.natDegree < N) :
    l1 p = ∑ n ∈ Finset.range N, |p.coeff n| := by
  rw [l1_def]
  apply Finset.sum_subset
  · intro n hn
    exact Finset.mem_range.2 (lt_of_le_of_lt (le_natDegree_of_mem_supp n hn) hN)
  · intro n _ hn
    simp [Polynomial.notMem_support_iff.1 hn]

lemma l1_add_le (p q : ℝ[X]) : l1 (p + q) ≤ l1 p + l1 q := by
  set N := (p + q).natDegree + p.natDegree + q.natDegree + 1 with hNdef
  have h1 : (p + q).natDegree < N := by omega
  have h2 : p.natDegree < N := by omega
  have h3 : q.natDegree < N := by omega
  rw [l1_eq_sum_range (p + q) h1, l1_eq_sum_range p h2, l1_eq_sum_range q h3,
    ← Finset.sum_add_distrib]
  apply Finset.sum_le_sum
  intro n _
  simp only [coeff_add]
  exact abs_add_le _ _

lemma l1_sum_le {ι : Type*} (s : Finset ι) (f : ι → ℝ[X]) :
    l1 (∑ i ∈ s, f i) ≤ ∑ i ∈ s, l1 (f i) := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | insert a s ha ih =>
    rw [Finset.sum_insert ha, Finset.sum_insert ha]
    exact (l1_add_le _ _).trans (add_le_add le_rfl ih)

@[simp] lemma l1_monomial (n : ℕ) (c : ℝ) : l1 (monomial n c) = |c| := by
  simp [l1, sum_monomial_index]

@[simp] lemma l1_C (c : ℝ) : l1 (C c) = |c| := by
  rw [← monomial_zero_left]; exact l1_monomial 0 c

@[simp] lemma l1_X : l1 (X : ℝ[X]) = 1 := by
  rw [← monomial_one_one_eq_X]; simp

@[simp] lemma l1_one : l1 (1 : ℝ[X]) = 1 := by
  rw [← C_1, l1_C, abs_one]

lemma l1_mul_le (p q : ℝ[X]) : l1 (p * q) ≤ l1 p * l1 q := by
  calc l1 (p * q)
      = l1 (∑ i ∈ p.support, ∑ j ∈ q.support, monomial (i + j) (p.coeff i * q.coeff j)) := by
        rw [mul_eq_sum_sum]; rfl
    _ ≤ ∑ i ∈ p.support, ∑ j ∈ q.support, |p.coeff i * q.coeff j| := by
        refine (l1_sum_le _ _).trans (Finset.sum_le_sum fun i _ => ?_)
        refine (l1_sum_le _ _).trans (Finset.sum_le_sum fun j _ => ?_)
        rw [l1_monomial]
    _ = l1 p * l1 q := by
        rw [l1_def, l1_def, Finset.sum_mul_sum]
        simp [abs_mul]

lemma l1_pow_le (p : ℝ[X]) (n : ℕ) : l1 (p ^ n) ≤ l1 p ^ n := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [pow_succ, pow_succ]
    exact (l1_mul_le _ _).trans (mul_le_mul_of_nonneg_right ih (l1_nonneg _))

lemma l1_C_mul_le (c : ℝ) (p : ℝ[X]) : l1 (C c * p) ≤ |c| * l1 p := by
  simpa using l1_mul_le (C c) p

end

/-! ### Executable integer-list polynomial arithmetic -/

/-- Pointwise addition of coefficient lists (the shorter list is zero-padded). -/
def addL : List ℤ → List ℤ → List ℤ
  | [], m => m
  | l, [] => l
  | a :: l, b :: m => (a + b) :: addL l m

/-- Convolution of coefficient lists, i.e. polynomial multiplication. -/
def conv : List ℤ → List ℤ → List ℤ
  | [], _ => []
  | a :: l, m => addL (m.map (a * ·)) (0 :: conv l m)

/-- `listPow l n` is the coefficient list of the `n`-th power. -/
def listPow (l : List ℤ) : ℕ → List ℤ
  | 0 => [1]
  | n + 1 => conv l (listPow l n)

/-- Sum of absolute values of an integer coefficient list. -/
def absSum (l : List ℤ) : ℕ := (l.map Int.natAbs).sum

noncomputable section

/-- The real polynomial with the given integer coefficient list (Horner form). -/
def ofList : List ℤ → ℝ[X]
  | [] => 0
  | a :: l => C (a : ℝ) + X * ofList l

@[simp] lemma ofList_nil : ofList [] = 0 := rfl
@[simp] lemma ofList_cons (a : ℤ) (l : List ℤ) : ofList (a :: l) = C (a : ℝ) + X * ofList l := rfl

lemma ofList_addL (l m : List ℤ) : ofList (addL l m) = ofList l + ofList m := by
  induction l generalizing m with
  | nil => simp [addL]
  | cons a l ih =>
    cases m with
    | nil => simp [addL]
    | cons b m =>
      simp only [addL, ofList_cons, ih]
      push_cast
      simp only [C_add]
      ring

lemma ofList_map_mul (a : ℤ) (m : List ℤ) :
    ofList (m.map (a * ·)) = C (a : ℝ) * ofList m := by
  induction m with
  | nil => simp
  | cons b m ih =>
    simp only [List.map_cons, ofList_cons, ih]
    push_cast
    simp only [C_mul]
    ring

lemma ofList_conv (l m : List ℤ) : ofList (conv l m) = ofList l * ofList m := by
  induction l with
  | nil => simp [conv]
  | cons a l ih =>
    simp only [conv, ofList_addL, ofList_map_mul, ofList_cons, ih, Int.cast_zero, C_0, zero_add]
    ring

lemma ofList_listPow (l : List ℤ) (n : ℕ) : ofList (listPow l n) = ofList l ^ n := by
  induction n with
  | zero => simp [listPow]
  | succ n ih => rw [listPow, ofList_conv, ih, pow_succ, mul_comm]

lemma l1_ofList_le (l : List ℤ) : l1 (ofList l) ≤ (absSum l : ℝ) := by
  induction l with
  | nil => simp [absSum]
  | cons a l ih =>
    simp only [ofList_cons, absSum, List.map_cons, List.sum_cons]
    calc l1 (C (a : ℝ) + X * ofList l)
        ≤ l1 (C (a : ℝ)) + l1 (X * ofList l) := l1_add_le _ _
      _ ≤ |(a : ℝ)| + l1 X * l1 (ofList l) := by
          gcongr
          · exact (l1_C _).le
          · exact l1_mul_le _ _
      _ ≤ (a.natAbs : ℝ) + (absSum l : ℝ) := by
          rw [l1_X, one_mul]
          gcongr
          · rw [Nat.cast_natAbs, Int.cast_abs]
      _ = ((a.natAbs + absSum l : ℕ) : ℝ) := by push_cast; rfl

lemma l1_ofList_listPow_le (l : List ℤ) (n : ℕ) :
    l1 (ofList l ^ n) ≤ (absSum (listPow l n) : ℝ) := by
  rw [← ofList_listPow]; exact l1_ofList_le _

end

end Grothe
