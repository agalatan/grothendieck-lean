import Grothe.UpperChaos.OriginalHSCovariance
import Grothe.UpperChaos.OriginalHSParameterGates
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity

/-!
# Positive Gaussian quadratic forms from the original parameter certificates

The finite rational certificates are consumed here as real inequalities. The
Schur complement is proved positive from the checked leading minor and
determinant, including the square-root cross coefficient of the actual
two-variable Gaussian form. No additional numerical certificate is assumed.

Agent-ID: codex-2ca4.
-/

namespace Grothe.UpperChaos.OriginalHSParameterSoundness

open OriginalHSCovariance OriginalHSParameterGates

noncomputable section

def alpha (power : ℕ) : ℝ := 21 * (power : ℝ) / 20

def nu (power : ℕ) : ℝ := 1 / (1 + alpha power)

def damping (power : ℕ) : ℝ := alpha power * nu power

theorem alpha_nonneg (power : ℕ) : 0 ≤ alpha power := by
  dsimp [alpha]
  positivity

theorem gaussian_rate_pos (power : ℕ) : 0 < 1 + alpha power := by
  linarith [alpha_nonneg power]

theorem nu_pos (power : ℕ) : 0 < nu power := by
  exact one_div_pos.mpr (gaussian_rate_pos power)

theorem damping_add_nu (power : ℕ) : damping power + nu power = 1 := by
  have hden := (gaussian_rate_pos power).ne'
  dsimp [damping, nu]
  field_simp [hden]
  ring

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

/-- The first actual complex-coordinate pair has the checked positive form. -/
theorem first_pair_positive (g : Gate) (hg : g ∈ gates) :
    CovariancePositive (damping g.power) (nu g.power) g.r
      (if g.coordinate = 0 then (g.t : ℝ) else 1)
      (if g.coordinate = 1 then (g.t : ℝ) else 1) := by
  have h := gate_checked_of_mem g hg
  simp only [gateOK, Bool.and_eq_true] at h
  simpa only [apply_ite, Rat.cast_one] using
    covarianceGate_sound g.power g.r
      (if g.coordinate = 0 then g.t else 1)
      (if g.coordinate = 1 then g.t else 1) h.1.2

/-- The second actual complex-coordinate pair has the checked positive form. -/
theorem second_pair_positive (g : Gate) (hg : g ∈ gates) :
    CovariancePositive (damping g.power) (nu g.power) g.r
      (if g.coordinate = 2 then (g.t : ℝ) else 1)
      (if g.coordinate = 3 then (g.t : ℝ) else 1) := by
  have h := gate_checked_of_mem g hg
  simp only [gateOK, Bool.and_eq_true] at h
  simpa only [apply_ite, Rat.cast_one] using
    covarianceGate_sound g.power g.r
      (if g.coordinate = 2 then g.t else 1)
      (if g.coordinate = 3 then g.t else 1) h.2

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

/-- Completing the square gives the exact positive remainder rate. -/
theorem schur_complement_eq (A B C : ℝ) (hA : A ≠ 0) :
    C - B ^ 2 / A = (A * C - B ^ 2) / A := by
  field_simp [hA]

theorem schur_complement_pos (A B C : ℝ) (hA : 0 < A)
    (hdet : 0 < A * C - B ^ 2) : 0 < C - B ^ 2 / A := by
  rw [schur_complement_eq A B C hA.ne']
  exact div_pos hdet hA

/-- This is the rate required after the first complex Gaussian integration. -/
theorem actual_schur_complement_pos (a n R P Q : ℝ)
    (h : CovariancePositive a n R P Q) (hRQ : 0 ≤ R * Q) :
    0 < (1 - n ^ 2 * R * Q - a ^ 2 * P * Q) -
      (a * n * Real.sqrt (R * Q) * (R + P)) ^ 2 /
        (1 - a ^ 2 * R ^ 2 - n ^ 2 * R * P) := by
  apply schur_complement_pos _ _ _ h.blockMinor
  rw [actual_block_det a n R P Q hRQ]
  exact h.determinant

theorem quadratic_eq_completed_square (A B C x y : ℝ) (hA : A ≠ 0) :
    A * x ^ 2 + 2 * B * x * y + C * y ^ 2 =
      A * (x + B / A * y) ^ 2 + (C - B ^ 2 / A) * y ^ 2 := by
  field_simp [hA]
  ring

/-- Positive leading minor and determinant control every nonzero real vector. -/
theorem quadratic_pos (A B C x y : ℝ) (hA : 0 < A)
    (hdet : 0 < A * C - B ^ 2) (hxy : x ≠ 0 ∨ y ≠ 0) :
    0 < A * x ^ 2 + 2 * B * x * y + C * y ^ 2 := by
  by_cases hy : y = 0
  · have hx : x ≠ 0 := hxy.resolve_right (fun hy' => hy' hy)
    simpa only [hy, mul_zero, zero_pow (by decide : 2 ≠ 0), add_zero] using
      mul_pos hA (sq_pos_of_ne_zero hx)
  · rw [quadratic_eq_completed_square A B C x y hA.ne']
    exact add_pos_of_nonneg_of_pos (mul_nonneg hA.le (sq_nonneg _))
      (mul_pos (schur_complement_pos A B C hA hdet) (sq_pos_of_ne_zero hy))

end
end Grothe.UpperChaos.OriginalHSParameterSoundness
