import Mathlib

/-!
# Coefficient `ℓ¹` norm of polynomials

The *Wiener-algebra norm* of a polynomial is the sum of the absolute values of its
coefficients, `‖f‖_𝒜 = ∑ₖ |[tᵏ] f|`.  It is submultiplicative,
`‖fg‖_𝒜 ≤ ‖f‖_𝒜 ‖g‖_𝒜`, which is the only structural property the composition and tail
estimates need.
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

end Grothe
