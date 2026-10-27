import Mathlib.Analysis.Calculus.Deriv.Mul
import Mathlib.Analysis.Calculus.Deriv.Pow
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
import Mathlib.Tactic

/-!
The exact moment recurrence for the global Gaussian polynomial variable.
Agent-ID: codex-e4b7.
-/

open MeasureTheory Set
open scoped Interval
namespace Grothe.UpperChaos

noncomputable def momentT (u : ℝ) : ℝ := (1 - 2 * u ^ 2) / 3
noncomputable def globalMoment (k : ℕ) : ℝ := ∫ u in (0 : ℝ)..1, momentT u ^ k

theorem momentT_hasDerivAt (u : ℝ) : HasDerivAt momentT (-4 * u / 3) u := by
  have h := (((hasDerivAt_pow 2 u).const_mul (2 : ℝ)).const_sub (1 : ℝ)).div_const 3
  exact h.congr_deriv (by norm_num; ring)

theorem globalMoment_zero : globalMoment 0 = 1 := by
  simp [globalMoment]

/-- One integration-by-parts identity evaluates every moment recursively. -/
theorem globalMoment_succ (k : ℕ) :
    (3 * (2 * (k : ℝ) + 3)) * globalMoment (k + 1) =
      2 * ((k : ℝ) + 1) * globalMoment k + (-1 : ℝ) ^ (k + 1) / 3 ^ k := by
  let F : ℝ → ℝ := fun u => u * momentT u ^ (k + 1)
  let F' : ℝ → ℝ := fun u =>
    (2 * (k : ℝ) + 3) * momentT u ^ (k + 1) -
      (2 * ((k : ℝ) + 1) / 3) * momentT u ^ k
  have hF (u : ℝ) : HasDerivAt F (F' u) u := by
    have h := (hasDerivAt_id u).mul ((momentT_hasDerivAt u).pow (k + 1))
    have hm : momentT u = (1 - 2 * u ^ 2) / 3 := rfl
    have e : F' u = 1 * (momentT ^ (k + 1)) u +
        id u * (((k + 1 : ℕ) : ℝ) * momentT u ^ (k + 1 - 1) * (-4 * u / 3)) := by
      simp only [F', Pi.pow_apply, id, Nat.add_sub_cancel, Nat.cast_add, Nat.cast_one, pow_succ]
      linear_combination (2 * (k : ℝ) + 2) * momentT u ^ k * hm
    rw [e]
    exact h
  have hInt1 : IntervalIntegrable (fun u : ℝ =>
      (2 * (k : ℝ) + 3) * momentT u ^ (k + 1)) volume 0 1 :=
    (show Continuous (fun u : ℝ =>
      (2 * (k : ℝ) + 3) * momentT u ^ (k + 1)) by unfold momentT; fun_prop).intervalIntegrable _ _
  have hInt2 : IntervalIntegrable (fun u : ℝ =>
      (2 * ((k : ℝ) + 1) / 3) * momentT u ^ k) volume 0 1 :=
    (show Continuous (fun u : ℝ =>
      (2 * ((k : ℝ) + 1) / 3) * momentT u ^ k) by unfold momentT; fun_prop).intervalIntegrable _ _
  have hFTC := intervalIntegral.integral_eq_sub_of_hasDerivAt
    (fun u _ => hF u) (hInt1.sub hInt2)
  change (∫ u in (0 : ℝ)..1,
      ((2 * (k : ℝ) + 3) * momentT u ^ (k + 1) -
       (2 * ((k : ℝ) + 1) / 3) * momentT u ^ k)) = F 1 - F 0 at hFTC
  rw [intervalIntegral.integral_sub hInt1 hInt2,
    intervalIntegral.integral_const_mul, intervalIntegral.integral_const_mul] at hFTC
  change (2 * (k : ℝ) + 3) * globalMoment (k + 1) -
    (2 * ((k : ℝ) + 1) / 3) * globalMoment k = F 1 - F 0 at hFTC
  have hFend : F 1 - F 0 = (-1 / 3 : ℝ) ^ (k + 1) := by
    simp [F, momentT]
    norm_num
  rw [hFend] at hFTC
  have hp : 3 * (-1 / 3 : ℝ) ^ (k + 1) = (-1 : ℝ) ^ (k + 1) / 3 ^ k := by
    rw [div_pow, pow_succ]
    field_simp
    ring
  nlinarith

end Grothe.UpperChaos
