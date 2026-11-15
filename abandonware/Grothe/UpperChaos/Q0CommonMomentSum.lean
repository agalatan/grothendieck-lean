import Grothe.UpperChaos.Q0RealShiftMoments

/-!
# A common-index sum for imaginary-square Wick moments

The three shifted moments may be extended to the same finite index range:
outside each moment's natural range, a binomial coefficient vanishes. This
keeps the common real-shift power and retains the exact tilted Gaussian mass.
No phase data, compressed coefficient table or numerical bound is used.
Agent-ID: codex-8c4d.
-/

namespace Grothe.UpperChaos.Q0CommonMomentSum

open Grothe.UpperChaos.Q0RealShiftMoments

noncomputable section

/-- A real shifted moment can be zero-extended to any larger finite range. -/
theorem realShiftedMoment_zeroExtend (β m : ℝ) (p q N : ℕ)
    (hN : min p q ≤ N) :
    realShiftedMoment β m p q =
      ∑ j ∈ Finset.range (N + 1),
        (p.choose j : ℝ) * (q.choose j : ℝ) * m ^ (p + q - 2 * j) *
          (j.factorial : ℝ) / β ^ (j + 1) := by
  rw [realShiftedMoment_powerSum]
  apply Finset.sum_subset (Finset.range_mono (Nat.add_le_add_right hN 1))
  intro j hj hsmall
  have hgt : min p q < j := by
    have hn : ¬ j < min p q + 1 := by simpa only [Finset.mem_range] using hsmall
    omega
  by_cases hpq : p ≤ q
  · have hp : p < j := by simpa only [Nat.min_eq_left hpq] using hgt
    simp [Nat.choose_eq_zero_of_lt hp]
  · have hqp : q ≤ p := le_of_not_ge hpq
    have hq : q < j := by simpa only [Nat.min_eq_right hqp] using hgt
    simp [Nat.choose_eq_zero_of_lt hq]

/-- Signed combination of binomial coefficients from the imaginary-square
insertion; it is defined over reals only for direct use in the moment sum. -/
def imSqBinomialFactor (p q j : ℕ) : ℝ :=
  2 * ((p + 1).choose j : ℝ) * ((q + 1).choose j : ℝ) -
    ((p + 2).choose j : ℝ) * (q.choose j : ℝ) -
      (p.choose j : ℝ) * ((q + 2).choose j : ℝ)

/-- The three exact real Wick sums share one summation index and one shift
power. This identity is algebraic and includes `m = 0` and `β = 0`. -/
theorem realImSqMoment_commonSum (β m : ℝ) (p q : ℕ) :
    realImSqMoment β m p q =
      ∑ j ∈ Finset.range ((p + q + 2) / 2 + 1),
        imSqBinomialFactor p q j * m ^ (p + q + 2 - 2 * j) *
          (j.factorial : ℝ) / β ^ (j + 1) / 4 := by
  let N : ℕ := (p + q + 2) / 2
  have h₁ : min (p + 1) (q + 1) ≤ N := by
    have hp := Nat.min_le_left (p + 1) (q + 1)
    have hq := Nat.min_le_right (p + 1) (q + 1)
    dsimp only [N]
    omega
  have h₂ : min (p + 2) q ≤ N := by
    have hp := Nat.min_le_left (p + 2) q
    have hq := Nat.min_le_right (p + 2) q
    dsimp only [N]
    omega
  have h₃ : min p (q + 2) ≤ N := by
    have hp := Nat.min_le_left p (q + 2)
    have hq := Nat.min_le_right p (q + 2)
    dsimp only [N]
    omega
  have e₁ (j : ℕ) : (p + 1) + (q + 1) - 2 * j = p + q + 2 - 2 * j := by omega
  have e₂ (j : ℕ) : (p + 2) + q - 2 * j = p + q + 2 - 2 * j := by omega
  have e₃ (j : ℕ) : p + (q + 2) - 2 * j = p + q + 2 - 2 * j := by omega
  unfold realImSqMoment
  rw [realShiftedMoment_zeroExtend β m (p + 1) (q + 1) N h₁,
    realShiftedMoment_zeroExtend β m (p + 2) q N h₂,
    realShiftedMoment_zeroExtend β m p (q + 2) N h₃]
  change (2 * (∑ j ∈ Finset.range (N + 1),
      ((p + 1).choose j : ℝ) * ((q + 1).choose j : ℝ) * m ^ ((p + 1) + (q + 1) - 2 * j) *
        (j.factorial : ℝ) / β ^ (j + 1)) -
      (∑ j ∈ Finset.range (N + 1),
        ((p + 2).choose j : ℝ) * (q.choose j : ℝ) * m ^ ((p + 2) + q - 2 * j) *
          (j.factorial : ℝ) / β ^ (j + 1)) -
      (∑ j ∈ Finset.range (N + 1),
        (p.choose j : ℝ) * ((q + 2).choose j : ℝ) * m ^ (p + (q + 2) - 2 * j) *
          (j.factorial : ℝ) / β ^ (j + 1))) / 4 =
      ∑ j ∈ Finset.range (N + 1),
        imSqBinomialFactor p q j * m ^ (p + q + 2 - 2 * j) *
          (j.factorial : ℝ) / β ^ (j + 1) / 4
  simp only [e₁, e₂, e₃, Finset.mul_sum, ← Finset.sum_sub_distrib, Finset.sum_div]
  apply Finset.sum_congr rfl
  intro j hj
  unfold imSqBinomialFactor
  ring

end
end Grothe.UpperChaos.Q0CommonMomentSum
