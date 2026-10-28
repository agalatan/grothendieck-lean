import Grothe.UpperChaos.RectangleMonomialIntegral

/-!
# Exact integral of a ragged bivariate rational coefficient list

The outer list indexes powers of `x`, and each inner list indexes powers of
`y`. Every row has its own length; empty rows and zero coefficients are valid.
The output is an exact rational, with no numerical quadrature premise.

Agent-ID: codex-8c4d
-/

open MeasureTheory intervalIntegral

namespace Grothe.UpperChaos.RectangleListPolynomialIntegral

open Grothe.UpperChaos.RectangleMonomialIntegral

/-- Rational integral of a normalized-square monomial. -/
def squareMomentQ (i j : ℕ) : ℚ :=
  if i % 2 = 0 ∧ j % 2 = 0 then
    4 / (((i : ℚ) + 1) * ((j : ℚ) + 1))
  else 0

theorem integral_monomial_eq_squareMomentQ (i j : ℕ) :
    (∫ x in (-1 : ℝ)..1, ∫ y in (-1 : ℝ)..1, x ^ i * y ^ j) =
      (squareMomentQ i j : ℝ) := by
  by_cases hi : i % 2 = 0
  · by_cases hj : j % 2 = 0
    · have hei : Even i := Nat.even_iff.mpr hi
      have hej : Even j := Nat.even_iff.mpr hj
      rw [integral_monomial_even i j hei hej]
      simp [squareMomentQ, hi, hj]
    · have hoj : Odd j := Nat.not_even_iff_odd.mp (by simpa [Nat.even_iff] using hj)
      rw [integral_monomial_odd i j (Or.inr hoj)]
      simp [squareMomentQ, hj]
  · have hoi : Odd i := Nat.not_even_iff_odd.mp (by simpa [Nat.even_iff] using hi)
    rw [integral_monomial_odd i j (Or.inl hoi)]
    simp [squareMomentQ, hi]

/-- The real polynomial represented by outer-x, inner-y rational rows. -/
def squareListEval (p : List (List ℚ)) (x y : ℝ) : ℝ :=
  ∑ i ∈ Finset.range p.length,
    ∑ j ∈ Finset.range (p.getD i []).length,
      (((p.getD i []).getD j 0 : ℚ) : ℝ) * x ^ i * y ^ j

/-- Exact rational integral, summing only entries actually present in each row. -/
def squareListIntegralQ (p : List (List ℚ)) : ℚ :=
  ∑ i ∈ Finset.range p.length,
    ∑ j ∈ Finset.range (p.getD i []).length,
      (p.getD i []).getD j 0 * squareMomentQ i j

private theorem integral_scaled_monomial (c : ℚ) (i j : ℕ) :
    (∫ x in (-1 : ℝ)..1, ∫ y in (-1 : ℝ)..1, (c : ℝ) * x ^ i * y ^ j) =
      (c : ℝ) * (squareMomentQ i j : ℝ) := by
  have he : (fun x : ℝ => ∫ y in (-1 : ℝ)..1, (c : ℝ) * x ^ i * y ^ j) =
      (fun x : ℝ => (c : ℝ) * ∫ y in (-1 : ℝ)..1, x ^ i * y ^ j) := by
    funext x
    simp only [mul_assoc, intervalIntegral.integral_const_mul]
  rw [he, intervalIntegral.integral_const_mul, integral_monomial_eq_squareMomentQ]

/-- The finite rational coefficient sum is exactly the iterated integral of
its real polynomial on `[-1,1]²`. -/
theorem integral_squareListEval (p : List (List ℚ)) :
    (∫ x in (-1 : ℝ)..1, ∫ y in (-1 : ℝ)..1, squareListEval p x y) =
      (squareListIntegralQ p : ℝ) := by
  have hinner (x : ℝ) (i j : ℕ) :
      IntervalIntegrable
        (fun y : ℝ => (((p.getD i []).getD j 0 : ℚ) : ℝ) * x ^ i * y ^ j)
        volume (-1) 1 := by
    exact (by fun_prop : Continuous (fun y : ℝ =>
      (((p.getD i []).getD j 0 : ℚ) : ℝ) * x ^ i * y ^ j)).intervalIntegrable _ _
  have houter (i : ℕ) : Continuous (fun x : ℝ =>
      ∑ j ∈ Finset.range (p.getD i []).length,
        ∫ y in (-1 : ℝ)..1, (((p.getD i []).getD j 0 : ℚ) : ℝ) * x ^ i * y ^ j) := by
    apply continuous_finsetSum _
    intro j hj
    simp_rw [intervalIntegral.integral_const_mul]
    fun_prop
  have houterTerm (i j : ℕ) : IntervalIntegrable (fun x : ℝ =>
      ∫ y in (-1 : ℝ)..1, (((p.getD i []).getD j 0 : ℚ) : ℝ) * x ^ i * y ^ j)
      volume (-1) 1 := by
    have hc : Continuous (fun x : ℝ =>
        ∫ y in (-1 : ℝ)..1, (((p.getD i []).getD j 0 : ℚ) : ℝ) * x ^ i * y ^ j) := by
      simp_rw [intervalIntegral.integral_const_mul]
      fun_prop
    exact hc.intervalIntegrable _ _
  have hexpand (x : ℝ) :
      (∫ y in (-1 : ℝ)..1, squareListEval p x y) =
        ∑ i ∈ Finset.range p.length, ∑ j ∈ Finset.range (p.getD i []).length,
          ∫ y in (-1 : ℝ)..1, (((p.getD i []).getD j 0 : ℚ) : ℝ) * x ^ i * y ^ j := by
    have hrow (i : ℕ) : IntervalIntegrable (fun y : ℝ =>
        ∑ j ∈ Finset.range (p.getD i []).length,
          (((p.getD i []).getD j 0 : ℚ) : ℝ) * x ^ i * y ^ j) volume (-1) 1 := by
      have hc : Continuous (fun y : ℝ =>
          ∑ j ∈ Finset.range (p.getD i []).length,
            (((p.getD i []).getD j 0 : ℚ) : ℝ) * x ^ i * y ^ j) := by
        apply continuous_finsetSum _
        intro j hj
        fun_prop
      exact hc.intervalIntegrable _ _
    unfold squareListEval
    rw [intervalIntegral.integral_finsetSum (fun i _ => hrow i)]
    apply Finset.sum_congr rfl
    intro i hi
    exact intervalIntegral.integral_finsetSum (fun j _ => hinner x i j)
  simp_rw [hexpand]
  rw [intervalIntegral.integral_finsetSum (fun i _ => (houter i).intervalIntegrable _ _)]
  simp only [squareListIntegralQ, Rat.cast_sum, Rat.cast_mul]
  apply Finset.sum_congr rfl
  intro i hi
  rw [intervalIntegral.integral_finsetSum (fun j _ => houterTerm i j)]
  apply Finset.sum_congr rfl
  intro j hj
  exact integral_scaled_monomial ((p.getD i []).getD j 0) i j

end Grothe.UpperChaos.RectangleListPolynomialIntegral
