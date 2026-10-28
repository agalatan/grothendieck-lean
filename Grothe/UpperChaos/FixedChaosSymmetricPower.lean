import Grothe.UpperChaos.FixedChaosMatrixBounds
import Grothe.UpperChaos.FixedChaosMatrixFactorization
import Grothe.UpperChaos.GradedHermite

/-!
# Normalized holomorphic factors of the actual smoothing matrix

The existing one-coordinate Hermite normalization also normalizes the
holomorphic two-variable moments. At grade `q`, the smoothing entry is the
product of a degree-`q + 1` entry and a degree-`q` entry.
Agent-ID: codex-7c2e
-/

namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

noncomputable section

/-- Regroup the four factorials into holomorphic and antiholomorphic pairs. -/
theorem nrm2_eq_holomorphic_factors (i : Idx2) :
    nrm2 i = nrm i.1.1 i.2.1 * nrm i.1.2 i.2.2 := by
  unfold nrm2 nrm fac2
  rw [show ((i.1.1.factorial * i.1.2.factorial *
      (i.2.1.factorial * i.2.2.factorial) : ℕ) : ℝ) =
      ((i.1.1.factorial * i.2.1.factorial : ℕ) : ℝ) *
        ((i.1.2.factorial * i.2.2.factorial : ℕ) : ℝ) by
    push_cast
    ring]
  rw [Real.sqrt_mul (by positivity), mul_inv]

/-- A normalized real two-variable entry. The first index is the tested
coefficient (matrix row), and the second is the basis input (matrix column). -/
def normalizedMoment2 (j i : ℕ × ℕ) : ℝ :=
  nrm j.1 j.2 * nrm i.1 i.2 * matrixMoment2 m00 m01 m11 j i

/-- The actual entry is the product of its two normalized real factors. -/
theorem actualEntry_eq_normalizedMoment2 (j i : Idx2) :
    actualEntry j i =
      ((normalizedMoment2 (j.1.1, j.2.1) (i.1.1, i.2.1) *
        normalizedMoment2 (j.1.2, j.2.2) (i.1.2, i.2.2) : ℝ) : ℂ) := by
  rw [actualEntry_eq_real_recurrence, matrixRecurrence_eq_matrixMoment2]
  apply congrArg Complex.ofReal
  rw [nrm2_eq_holomorphic_factors j, nrm2_eq_holomorphic_factors i]
  unfold normalizedMoment2
  ring

/-- Degree-`n` symmetric-power entry: row `c` and column `e` count the
second-coordinate degrees; the corresponding first-coordinate degrees are
`n - c` and `n - e`. -/
def symmetricEntry (n : ℕ) (c e : Fin (n + 1)) : ℝ :=
  normalizedMoment2 (n - c.val, c.val) (n - e.val, e.val)

/-- At charge-one grade `q`, the left factor has degree `q + 1` and the
right factor has degree `q`. This fixes the orientation for the later
coefficient-matrix action `S * A * T`, with `T` the transposed right factor. -/
theorem actualEntry_gradedMode (q : ℕ)
    (c e : Fin (q + 2)) (d f : Fin (q + 1)) :
    actualEntry (gradedMode q c d) (gradedMode q e f) =
      ((symmetricEntry (q + 1) c e * symmetricEntry q d f : ℝ) : ℂ) := by
  simpa only [symmetricEntry, gradedMode] using
    actualEntry_eq_normalizedMoment2 (gradedMode q c d) (gradedMode q e f)

end
end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.actualEntry_gradedMode' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.actualEntry_gradedMode
