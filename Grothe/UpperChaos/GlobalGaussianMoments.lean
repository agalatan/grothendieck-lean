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
  unfold momentT
  convert ((hasDerivAt_const u (1 : ℝ)).sub (((hasDerivAt_id u).pow 2).const_mul 2)).div_const 3 using 1 <;> ring

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
    convert h using 1
    dsimp [F, F', momentT]
    simp only [Nat.cast_add, Nat.cast_one, pow_succ]
    ring
  have hInt1 : IntervalIntegrable (fun u : ℝ =>
      (2 * (k : ℝ) + 3) * momentT u ^ (k + 1)) volume 0 1 :=
    (by fun_prop : Continuous (fun u : ℝ =>
      (2 * (k : ℝ) + 3) * momentT u ^ (k + 1))).intervalIntegrable _ _
  have hInt2 : IntervalIntegrable (fun u : ℝ =>
      (2 * ((k : ℝ) + 1) / 3) * momentT u ^ k) volume 0 1 :=
    (by fun_prop : Continuous (fun u : ℝ =>
      (2 * ((k : ℝ) + 1) / 3) * momentT u ^ k)).intervalIntegrable _ _
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
  rw [hFend] at hFTC
  have hp : 3 * (-1 / 3 : ℝ) ^ (k + 1) = (-1 : ℝ) ^ (k + 1) / 3 ^ k := by
    rw [div_pow, pow_succ]
    field_simp
    ring
  nlinarith

end Grothe.UpperChaos
