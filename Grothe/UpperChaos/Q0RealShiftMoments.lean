import Grothe.UpperChaos.Q0PhaseWickBridge

/-!
# Real-shifted damped Wick moments

When the Gaussian shift is real, every complex shifted moment is the real
embedding of an explicit finite rational-coefficient expression. This is a
formal algebraic step toward compressing the actual q0 Wick sum; it does not
assert the compressed double-factorial identity or any numerical bound.
Agent-ID: codex-8c4d.
-/

open Grothe.UpperChaos.Q0PhaseWickBridge
open scoped ComplexConjugate

namespace Grothe.UpperChaos.Q0RealShiftMoments

noncomputable section

/-- The real version of the existing shifted damped moment. -/
def realShiftedMoment (β m : ℝ) (p q : ℕ) : ℝ :=
  ∑ j ∈ Finset.range (min p q + 1),
    (p.choose j : ℝ) * (q.choose j : ℝ) * m ^ (p - j) * m ^ (q - j) *
      (j.factorial : ℝ) / β ^ (j + 1)

/-- A real shift turns the existing complex Wick moment into the real sum. -/
theorem shiftedDampedMoment_ofReal (β m : ℝ) (p q : ℕ) :
    shiftedDampedMoment β (m : ℂ) p q = (realShiftedMoment β m p q : ℂ) := by
  rw [shiftedDampedMoment, realShiftedMoment, Complex.ofReal_sum]
  apply Finset.sum_congr rfl
  intro j hj
  push_cast; simp

/-- Within the finite moment range, the two shift powers combine without
negative exponents. This works even when the shift is zero. -/
theorem realShiftedMoment_powerSum (β m : ℝ) (p q : ℕ) :
    realShiftedMoment β m p q =
      ∑ j ∈ Finset.range (min p q + 1),
        (p.choose j : ℝ) * (q.choose j : ℝ) * m ^ (p + q - 2 * j) *
          (j.factorial : ℝ) / β ^ (j + 1) := by
  unfold realShiftedMoment
  apply Finset.sum_congr rfl
  intro j hj
  have hjmin : j ≤ min p q := by
    have h := Finset.mem_range.mp hj
    omega
  have hp : j ≤ p := le_trans hjmin (Nat.min_le_left _ _)
  have hq : j ≤ q := le_trans hjmin (Nat.min_le_right _ _)
  have he : (p - j) + (q - j) = p + q - 2 * j := by omega
  have hpow : m ^ (p - j) * m ^ (q - j) = m ^ (p + q - 2 * j) := by
    rw [← pow_add, he]
  calc
    _ = (p.choose j : ℝ) * (q.choose j : ℝ) *
        (m ^ (p - j) * m ^ (q - j)) * (j.factorial : ℝ) / β ^ (j + 1) := by ring
    _ = _ := by rw [hpow]

/-- Real scalar form of the imaginary-square insertion. -/
def realImSqMoment (β m : ℝ) (p q : ℕ) : ℝ :=
  (2 * realShiftedMoment β m (p + 1) (q + 1) -
    realShiftedMoment β m (p + 2) q - realShiftedMoment β m p (q + 2)) / 4

/-- The existing imaginary-square Wick sum is real for every real shift. -/
theorem imSqMoment_ofReal (β m : ℝ) (p q : ℕ) :
    imSqMoment β (m : ℂ) p q = (realImSqMoment β m p q : ℂ) := by
  simp only [imSqMoment, realImSqMoment, shiftedDampedMoment_ofReal]
  push_cast
  rfl

/-- In particular no imaginary remainder is hidden in the real-shifted sum. -/
theorem imSqMoment_im_eq_zero (β m : ℝ) (p q : ℕ) :
    (imSqMoment β (m : ℂ) p q).im = 0 := by
  rw [imSqMoment_ofReal]
  simp

end
end Grothe.UpperChaos.Q0RealShiftMoments
