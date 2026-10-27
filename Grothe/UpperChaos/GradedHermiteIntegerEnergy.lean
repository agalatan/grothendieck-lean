import Grothe.UpperChaos.GradedHermite
import Grothe.UpperChaos.PackedDyadicChunks

/-!
# Projected graded Hermite energies at an integer scale

Agent-ID: codex-37fb. This standard-axiom identity moves one
common dyadic denominator outside the entire projected energy before the
large finite arithmetic leaf is evaluated. No coefficient source or Gaussian
approximation error is assumed here.
-/

open MeasureTheory
namespace Grothe.UpperChaos

/-- Projection energy of an integer-scaled graded expansion is one integer fold. -/
theorem norm_projOn_gradedHermite_integer_sq_cast
    (B : Set Idx2) [DecidablePred (· ∈ B)]
    (N E : ℕ) (a : ℕ → ℕ → ℕ → ℤ) :
    ‖projOn B (gradedHermite N (fun q c d => (a q c d : ℚ) / (2 : ℚ)^E))‖ ^ 2 =
      (((PackedDyadic.gradedIntegerSum N
        (fun q c d => if gradedMode q c d ∈ B then a q c d ^ 2 else 0) : ℚ) /
          (2 : ℚ)^(2 * E) : ℚ) : ℝ) := by
  rw [norm_projOn_gradedHermite_sq_cast]
  apply congrArg (fun r : ℚ => (r : ℝ))
  rw [PackedDyadic.gradedIntegerSum_eq]
  have hterm (q c d : ℕ) :
      (if gradedMode q c d ∈ B then ((a q c d : ℚ) / (2 : ℚ)^E)^2 else 0) =
        ((if gradedMode q c d ∈ B then a q c d ^ 2 else 0 : ℤ) : ℚ) /
          (2 : ℚ)^(2 * E) := by
    by_cases h : gradedMode q c d ∈ B
    · simp only [h, ite_true]
      rw [div_pow, Int.cast_pow, ← pow_mul, Nat.mul_comm E 2]
    · simp only [h, ite_false, Int.cast_zero, zero_div]
  simp_rw [hterm]
  simp only [div_eq_mul_inv, ← Finset.sum_mul, ← Int.cast_sum]

end Grothe.UpperChaos
