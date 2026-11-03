import Grothe.UpperChaos.OriginalHSCovariance
import Grothe.UpperChaos.OriginalHSParameterGates
import Mathlib.Tactic.NormNum

/-!
# Positive Gaussian quadratic forms from the original parameter certificates

The finite rational certificates are consumed here as real inequalities.
All inequalities encoded by `covarianceGate` are preserved. Squaring the
cross coefficient identifies the explicit Gaussian form's determinant with
the checked polynomial. No additional numerical certificate is assumed.

Agent-ID: codex-2ca4.
-/

namespace Grothe.UpperChaos.OriginalHSParameterSoundness

open OriginalHSCovariance OriginalHSParameterGates

noncomputable section

def alpha (power : ℕ) : ℝ := 21 * (power : ℝ) / 20

def nu (power : ℕ) : ℝ := 1 / (1 + alpha power)

def damping (power : ℕ) : ℝ := alpha power * nu power

/-- The inequalities actually encoded by `covarianceGate`, after transport to ℝ. -/
structure CovariancePositive (a n R P Q : ℝ) : Prop where
  unitMinor : 0 < 1 - a ^ 2 * R ^ 2
  blockMinor : 0 < 1 - a ^ 2 * R ^ 2 - n ^ 2 * R * P
  determinant : 0 < delta a n R P Q
  plusNumerator : 0 < R + Q - R * Q * (R + P)
  minusNumerator : 0 < R + P - R * P * (R + Q)

/-- Kernel-checked rational positivity supplies the analytic real premises. -/
theorem covarianceGate_sound (power : ℕ) (R P Q : ℚ)
    (h : covarianceGate power R P Q = true) :
    CovariancePositive (damping power) (nu power) R P Q := by
  let alphaQ : ℚ := 21 * (power : ℚ) / 20
  let nuQ : ℚ := 1 / (1 + alphaQ)
  let dampingQ : ℚ := alphaQ * nuQ
  have halpha : (alphaQ : ℝ) = alpha power := by
    simp only [alphaQ, alpha, Rat.cast_div, Rat.cast_mul, Rat.cast_ofNat,
      Rat.cast_natCast]
  have hnu : (nuQ : ℝ) = nu power := by
    dsimp only [nuQ, nu]
    simp only [Rat.cast_div, Rat.cast_one, Rat.cast_add, halpha]
  have hdamping : (dampingQ : ℝ) = damping power := by
    dsimp only [dampingQ, damping]
    rw [Rat.cast_mul, halpha, hnu]
  simp only [covarianceGate, decide_eq_true_eq] at h
  change (0 < 1 - dampingQ ^ 2 * R ^ 2 ∧
    0 < 1 - dampingQ ^ 2 * R ^ 2 - nuQ ^ 2 * R * P ∧
    0 < 1 - dampingQ ^ 2 * (R ^ 2 + P * Q) - nuQ ^ 2 * R * (P + Q) +
      (dampingQ ^ 2 - nuQ ^ 2) ^ 2 * R ^ 2 * P * Q ∧
    0 < R + Q - R * Q * (R + P) ∧ 0 < R + P - R * P * (R + Q)) at h
  constructor
  · have hreal : (0 : ℝ) < ((1 - dampingQ ^ 2 * R ^ 2 : ℚ) : ℝ) :=
      Rat.cast_pos.mpr h.1
    simpa only [Rat.cast_sub, Rat.cast_one, Rat.cast_mul, Rat.cast_pow,
      hdamping] using hreal
  · have hreal : (0 : ℝ) <
        ((1 - dampingQ ^ 2 * R ^ 2 - nuQ ^ 2 * R * P : ℚ) : ℝ) :=
      Rat.cast_pos.mpr h.2.1
    simpa only [Rat.cast_sub, Rat.cast_one, Rat.cast_mul, Rat.cast_pow,
      hdamping, hnu] using hreal
  · have hreal : (0 : ℝ) <
        ((1 - dampingQ ^ 2 * (R ^ 2 + P * Q) - nuQ ^ 2 * R * (P + Q) +
          (dampingQ ^ 2 - nuQ ^ 2) ^ 2 * R ^ 2 * P * Q : ℚ) : ℝ) :=
      Rat.cast_pos.mpr h.2.2.1
    simpa only [delta, Rat.cast_add, Rat.cast_sub, Rat.cast_one, Rat.cast_mul,
      Rat.cast_pow, hdamping, hnu] using hreal
  · exact_mod_cast h.2.2.2.1
  · exact_mod_cast h.2.2.2.2

/-- Squaring the actual cross coefficient eliminates its only radical. -/
theorem cross_coefficient_sq (a n R P Q : ℝ) (hRQ : 0 ≤ R * Q) :
    (a * n * Real.sqrt (R * Q) * (R + P)) ^ 2 =
      (a * n) ^ 2 * R * Q * (R + P) ^ 2 := by
  rw [mul_pow, mul_pow, Real.sq_sqrt hRQ]
  ring

/-- The determinant is that of the Gaussian form, not just a formal polynomial. -/
theorem actual_block_det (a n R P Q : ℝ) (hRQ : 0 ≤ R * Q) :
    (1 - a ^ 2 * R ^ 2 - n ^ 2 * R * P) *
        (1 - n ^ 2 * R * Q - a ^ 2 * P * Q) -
      (a * n * Real.sqrt (R * Q) * (R + P)) ^ 2 =
        delta a n R P Q := by
  rw [cross_coefficient_sq a n R P Q hRQ]
  exact first_block_det a n R P Q

end
end Grothe.UpperChaos.OriginalHSParameterSoundness
