-- Grothe/Upper/SignedTailMassSharp.lean
import Mathlib.Data.Fin.VecNotation
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Equality cases for the mass-sensitive signed-tail bound

Two positive reference weights and opposite coefficient signs attain
`(sum |k|)^2 = A * (2*S - A + E)`, where `A` is the reference mass, `S` the
signed coefficient mass, and `E` the weighted quadratic error. Every feasible
triple of these moments is attained, including the boundary. Thus no stronger
bound can be deduced from these three numbers alone, even for two coefficients.

The final exact example has old signed-tail allowance `5` and sharp allowance
`4`. It is an algebraic comparison, not a numerical Grothendieck endpoint.

Agent-ID: codex-9b17. Refs #379.
-/

namespace Grothe.Upper.SignedTailMassSharp

open Finset

noncomputable section

/-- A positive reference of total mass `A` when `0 < theta < 1`. -/
def reference (A theta : ℝ) : Fin 2 → ℝ := ![theta * A, (1 - theta) * A]

/-- Coefficients of opposite signs with a common absolute ratio `r` to the reference. -/
def coefficient (A r theta : ℝ) : Fin 2 → ℝ :=
  ![r * theta * A, -(r * (1 - theta) * A)]

theorem reference_pos {A theta : ℝ} (hA : 0 < A) (ht : 0 < theta)
    (ht1 : theta < 1) (i : Fin 2) : 0 < reference A theta i := by
  fin_cases i
  · change 0 < theta * A
    exact mul_pos ht hA
  · change 0 < (1 - theta) * A
    exact mul_pos (sub_pos.mpr ht1) hA

theorem reference_sum (A theta : ℝ) : ∑ i, reference A theta i = A := by
  simp only [Fin.sum_univ_two, reference, Matrix.cons_val_zero, Matrix.cons_val_one]
  ring

theorem coefficient_sum (A r theta : ℝ) :
    ∑ i, coefficient A r theta i = A * r * (2 * theta - 1) := by
  simp only [Fin.sum_univ_two, coefficient, Matrix.cons_val_zero, Matrix.cons_val_one]
  ring

theorem coefficient_abs_sum {A r theta : ℝ} (hA : 0 ≤ A) (hr : 0 ≤ r)
    (ht : 0 ≤ theta) (ht1 : theta ≤ 1) :
    ∑ i, |coefficient A r theta i| = A * r := by
  have hp : 0 ≤ r * theta * A := by positivity
  have hn : 0 ≤ r * (1 - theta) * A := by positivity
  simp only [Fin.sum_univ_two, coefficient, Matrix.cons_val_zero, Matrix.cons_val_one,
    abs_neg, abs_of_nonneg hp, abs_of_nonneg hn]
  ring

theorem quadratic_error_sum {A r theta : ℝ} (hA : 0 < A) (ht : 0 < theta)
    (ht1 : theta < 1) :
    (∑ i, (coefficient A r theta i - reference A theta i) ^ 2 / reference A theta i) =
      A * (r ^ 2 - 2 * r * (2 * theta - 1) + 1) := by
  have hAn : A ≠ 0 := ne_of_gt hA
  have htn : theta ≠ 0 := ne_of_gt ht
  have htn1 : 1 - theta ≠ 0 := ne_of_gt (sub_pos.mpr ht1)
  simp only [Fin.sum_univ_two, reference, coefficient,
    Matrix.cons_val_zero, Matrix.cons_val_one]
  field_simp
  ring

/-- The strengthened squared bound is attained by this entire two-point family. -/
theorem mass_bound_equality {A r theta : ℝ} (hA : 0 < A) (hr : 0 ≤ r)
    (ht : 0 < theta) (ht1 : theta < 1) :
    (∑ i, |coefficient A r theta i|) ^ 2 =
      (∑ i, reference A theta i) *
        (2 * (∑ i, coefficient A r theta i) - (∑ i, reference A theta i) +
          ∑ i, (coefficient A r theta i - reference A theta i) ^ 2 /
            reference A theta i) := by
  rw [coefficient_abs_sum hA.le hr ht.le ht1.le, reference_sum, coefficient_sum,
    quadratic_error_sum hA ht ht1]
  ring

/-- No universal multiplicative constant smaller than one can bound the squared
absolute mass, even when restricted to positive two-point references. -/
theorem mass_bound_factor_iff (C : ℝ) :
    (∀ A r theta : ℝ, 0 < A → 0 ≤ r → 0 < theta → theta < 1 →
      (∑ i, |coefficient A r theta i|) ^ 2 ≤
        C * ((∑ i, reference A theta i) *
          (2 * (∑ i, coefficient A r theta i) - (∑ i, reference A theta i) +
            ∑ i, (coefficient A r theta i - reference A theta i) ^ 2 /
              reference A theta i))) ↔ 1 ≤ C := by
  constructor
  · intro h
    have hc := h 2 2 (1 / 2) (by norm_num) (by norm_num) (by norm_num) (by norm_num)
    norm_num [Fin.sum_univ_two, reference, coefficient] at hc
    linarith
  · intro hC A r theta hA hr ht ht1
    rw [← mass_bound_equality hA hr ht ht1]
    exact le_mul_of_one_le_left (sq_nonneg _) hC

/-- Every feasible reference mass, signed mass and quadratic error is realized
by two coefficients attaining the strengthened bound. This includes the boundary
case in which the two coefficients have the same sign. -/
theorem moment_bound_attained (A S E : ℝ) (hA : 0 < A)
    (hfeas : S ^ 2 ≤ A * (2 * S - A + E)) :
    ∃ a k : Fin 2 → ℝ, (∀ i, 0 < a i) ∧ (∑ i, a i) = A ∧
      (∑ i, k i) = S ∧ (∑ i, (k i - a i) ^ 2 / a i) = E ∧
      (∑ i, |k i|) ^ 2 = A * (2 * S - A + E) := by
  by_cases hstrict : S ^ 2 < A * (2 * S - A + E)
  · let L := Real.sqrt (A * (2 * S - A + E))
    have hQ : 0 < A * (2 * S - A + E) := lt_of_le_of_lt (sq_nonneg S) hstrict
    have hL : 0 < L := Real.sqrt_pos.mpr hQ
    have hLsq : L ^ 2 = A * (2 * S - A + E) := Real.sq_sqrt hQ.le
    have hSL : -L < S ∧ S < L := by
      constructor <;> nlinarith
    let r := L / A
    let theta := (L + S) / (2 * L)
    have hr : 0 < r := div_pos hL hA
    have ht : 0 < theta := div_pos (by linarith [hSL.1]) (by positivity)
    have ht1 : theta < 1 := by
      apply (div_lt_one (by positivity : 0 < 2 * L)).mpr
      linarith [hSL.2]
    have hAr : A * r = L := by
      dsimp [r]
      field_simp [ne_of_gt hA]
    have hS : A * r * (2 * theta - 1) = S := by
      rw [hAr]
      dsimp [theta]
      field_simp [ne_of_gt hL]
      ring
    have hr2 : A * r ^ 2 = 2 * S - A + E := by
      calc
        A * r ^ 2 = L ^ 2 / A := by dsimp [r]; field_simp [ne_of_gt hA]
        _ = 2 * S - A + E := by rw [hLsq]; field_simp [ne_of_gt hA]
    have hE : A * (r ^ 2 - 2 * r * (2 * theta - 1) + 1) = E := by
      nlinarith only [hS, hr2]
    refine ⟨reference A theta, coefficient A r theta,
      reference_pos hA ht ht1, reference_sum A theta,
      (coefficient_sum A r theta).trans hS, (quadratic_error_sum hA ht ht1).trans hE, ?_⟩
    rw [coefficient_abs_sum hA.le hr.le ht.le ht1.le, hAr]
    exact hLsq
  · have heq : S ^ 2 = A * (2 * S - A + E) := le_antisymm hfeas (le_of_not_gt hstrict)
    refine ⟨![A / 2, A / 2], ![S / 2, S / 2], ?_, ?_, ?_, ?_, ?_⟩
    · intro i
      fin_cases i <;> change 0 < A / 2 <;> positivity
    · simp only [Fin.sum_univ_two, Matrix.cons_val_zero, Matrix.cons_val_one]
      ring
    · simp only [Fin.sum_univ_two, Matrix.cons_val_zero, Matrix.cons_val_one]
      ring
    · simp only [Fin.sum_univ_two, Matrix.cons_val_zero, Matrix.cons_val_one]
      have hAn : A ≠ 0 := ne_of_gt hA
      field_simp [hAn]
      nlinarith only [heq]
    · simp only [Fin.sum_univ_two, Matrix.cons_val_zero, Matrix.cons_val_one, abs_div]
      norm_num
      nlinarith only [heq, sq_abs S]

/-- The original signed-mass-plus-half-error allowance is exactly `5`, while the
actual absolute mass and the strengthened square-root allowance are both `4`. -/
theorem strict_improvement_example :
    (∑ i, reference 2 (1 / 2) i) = 2 ∧
    (∑ i, coefficient 2 2 (1 / 2) i) = 0 ∧
    (∑ i, (coefficient 2 2 (1 / 2) i - reference 2 (1 / 2) i) ^ 2 /
      reference 2 (1 / 2) i) = 10 ∧
    (∑ i, |coefficient 2 2 (1 / 2) i|) = 4 ∧
    (0 : ℝ) + 10 / 2 = 5 ∧
    Real.sqrt ((2 : ℝ) * (2 * 0 - 2 + 10)) = 4 := by
  norm_num [Fin.sum_univ_two, reference, coefficient]
  exact (Real.sqrt_eq_iff_eq_sq (by norm_num) (by norm_num)).mpr (by norm_num)

end

end Grothe.Upper.SignedTailMassSharp
