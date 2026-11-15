import Grothe.UpperChaos.Q0RealPhaseTerm

/-!
# Radial powers for a real-shifted q0 phase term

These identities isolate the natural-number index arithmetic needed to remove
`sqrt s` from a single real source term. They use no division by the radius or
shift, so they remain valid at zero. They do not yet combine the three Wick
moment sums or certify a compressed coefficient bank.
Agent-ID: codex-8c4d.
-/

namespace Grothe.UpperChaos.Q0RealTermPowers

open Grothe.UpperChaos.Q0RealPhaseTerm

noncomputable section

/-- All binomial pieces of a real phase source term have the same radius
power; the bound on `k` prevents truncated natural subtraction. -/
theorem realPhaseMonomialCoeff_radius (a c k : ℕ) (d : ℚ) (r : ℝ)
    (hk : k ≤ c) :
    realPhaseMonomialCoeff a c k d r =
      (d : ℝ) * (1 / 2 : ℝ) ^ c * (c.choose k : ℝ) * r ^ (2 * a + c) := by
  have hr : (r ^ 2) ^ a * (r ^ k * r ^ (c - k)) = r ^ (2 * a + c) := by
    rw [← pow_add, Nat.add_sub_of_le hk, ← pow_mul, ← pow_add]
  unfold realPhaseMonomialCoeff
  calc
    _ = (d : ℝ) * (1 / 2 : ℝ) ^ c * (c.choose k : ℝ) *
        ((r ^ 2) ^ a * (r ^ k * r ^ (c - k))) := by ring
    _ = _ := by rw [hr]

/-- The real phase radius power and a centered real-shift power combine to an
even power. The index condition is exactly the common Wick-moment range. -/
theorem phase_shift_power_to_radial (a b c j : ℕ) (d : ℚ) (r v : ℝ)
    (k : ℕ) (hk : k ≤ c) (hj : 2 * j ≤ 2 * b + c + 2) :
    realPhaseMonomialCoeff a c k d r * (-(v * r)) ^ (2 * b + c + 2 - 2 * j) =
      (d : ℝ) * (1 / 2 : ℝ) ^ c * (c.choose k : ℝ) *
        (-v) ^ (2 * b + c + 2 - 2 * j) * (r ^ 2) ^ (a + b + c + 1 - j) := by
  let n : ℕ := 2 * b + c + 2 - 2 * j
  have hexp : 2 * a + c + n = 2 * (a + b + c + 1 - j) := by
    dsimp only [n]
    omega
  have hr : r ^ (2 * a + c) * r ^ n = (r ^ 2) ^ (a + b + c + 1 - j) := by
    rw [← pow_add, ← pow_mul, hexp]
  rw [realPhaseMonomialCoeff_radius a c k d r hk]
  change (d : ℝ) * (1 / 2 : ℝ) ^ c * (c.choose k : ℝ) *
    r ^ (2 * a + c) * (-(v * r)) ^ n =
      (d : ℝ) * (1 / 2 : ℝ) ^ c * (c.choose k : ℝ) *
        (-v) ^ n * (r ^ 2) ^ (a + b + c + 1 - j)
  rw [show -(v * r) = (-v) * r by ring, mul_pow]
  calc
    _ = (d : ℝ) * (1 / 2 : ℝ) ^ c * (c.choose k : ℝ) *
        (-v) ^ n * (r ^ (2 * a + c) * r ^ n) := by ring
    _ = _ := by rw [hr]

end
end Grothe.UpperChaos.Q0RealTermPowers
