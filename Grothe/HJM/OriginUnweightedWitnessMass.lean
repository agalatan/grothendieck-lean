import Grothe.HJM.OriginUnweightedProjection

/-!
# Exact mass of the finite unweighted rational witness

Agent-ID: codex-aa04. The two concrete
checks are kernel reductions, not native facts. They do not establish
any phase-mean, endpoint, or correlation bound.
-/

open Finset

namespace Grothe.HJM.Origin

noncomputable section

/-- Exact rational mass of the unweighted test, using the original pinned
witness coefficients. -/
def rationalUnweightedMass (xs : List (ℚ × ℚ)) (N : ℕ) : ℚ :=
  ((List.range N).map fun (n : ℕ) =>
    let a := xs.getD n (0, 0)
    ((n : ℚ) + 1) * (a.1 ^ 2 + a.2 ^ 2) / (2 * (n : ℚ) + 1) ^ 2).sum

private theorem rational_list_sum_range (f : ℕ → ℚ) : ∀ k : ℕ,
    ((List.range k).map f).sum = ∑ n ∈ range k, f n
  | 0 => by simp
  | k + 1 => by
    rw [List.range_succ, List.map_append, List.sum_append,
      rational_list_sum_range f k, sum_range_succ]
    simp

/-- The transformed witness used by the unweighted theorem has precisely the
rational mass above. This equality does not use numerical approximation. -/
theorem unweightedRationalTest_mass (xs : List (ℚ × ℚ)) (N : ℕ) :
    unweightedTestMass (unweightedRationalTest xs) N = (rationalUnweightedMass xs N : ℝ) := by
  unfold unweightedTestMass rationalUnweightedMass
  rw [rational_list_sum_range]
  push_cast
  apply sum_congr rfl
  intro n _hn
  have hd : 0 ≤ (2 * (n : ℝ) + 1) := by positivity
  have hs : 0 ≤ (n : ℝ) + 1 := by positivity
  simp only [unweightedRationalTest, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (div_nonneg (Real.sqrt_nonneg _) hd), mul_pow, div_pow,
    Real.sq_sqrt hs, rationalAlpha_norm_sq, Rat.cast_add, Rat.cast_pow]
  ring

-- These are exact computations in the kernel; duration is unmeasured.
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem leftUnweightedRationalMassCheck :
    rationalUnweightedMass OriginWitnessData.leftAlpha 64 ≤ (46592860 / 10 ^ 8 : ℚ) := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem rightUnweightedRationalMassCheck :
    rationalUnweightedMass OriginWitnessData.rightAlpha 64 ≤ (46577055 / 10 ^ 8 : ℚ) := by
  decide +kernel

/-- The mass target needed by the left 64-mode projection theorem. -/
theorem leftUnweightedWitness_mass :
    unweightedTestMass (unweightedRationalTest OriginWitnessData.leftAlpha) 64 ≤
      (46592860 / 10 ^ 8 : ℝ) := by
  rw [unweightedRationalTest_mass]
  have h : (rationalUnweightedMass OriginWitnessData.leftAlpha 64 : ℝ) ≤
      ((46592860 / 10 ^ 8 : ℚ) : ℝ) :=
    Rat.cast_le.mpr leftUnweightedRationalMassCheck
  simpa only [Rat.cast_div, Rat.cast_ofNat, Rat.cast_pow] using h

/-- The mass target needed by the right 64-mode projection theorem. -/
theorem rightUnweightedWitness_mass :
    unweightedTestMass (unweightedRationalTest OriginWitnessData.rightAlpha) 64 ≤
      (46577055 / 10 ^ 8 : ℝ) := by
  rw [unweightedRationalTest_mass]
  have h : (rationalUnweightedMass OriginWitnessData.rightAlpha 64 : ℝ) ≤
      ((46577055 / 10 ^ 8 : ℚ) : ℝ) :=
    Rat.cast_le.mpr rightUnweightedRationalMassCheck
  simpa only [Rat.cast_div, Rat.cast_ofNat, Rat.cast_pow] using h

end
end Grothe.HJM.Origin
