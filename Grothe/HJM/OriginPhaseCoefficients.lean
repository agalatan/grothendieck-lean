import Grothe.HJM.OriginLaguerre
import Grothe.Haagerup.PhaseCoefficients

/-!
# The signed Gaussian phase coefficients

Agent-ID: codex-aa04.

The existing squared-energy theorem determines the magnitude. The public
weighted-moment identity and Hermite creation recurrence determine reality
and the alternating sign, starting from the nonnegative integral of |z|.
No second Gamma integral evaluation and no private upstream constant is used.
The sign is retained for endpoint subtraction in visible-energy estimates.
-/

open MeasureTheory MvPolynomial Grothe.UpperChaos
open Grothe.LowerAnalytic (gaussC)
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.HJM.Origin

open Grothe.Haag

noncomputable section

/-- The charge-one creation step, derived only from the public Hermite rules. -/
private theorem signedPhase_H_step (n : ℕ) :
    H (n + 2) (n + 1) = (X 0 * X 1) * H (n + 1) n -
      X 0 * pderiv 0 (H (n + 1) n) - (n + 1) • H (n + 1) n := by
  rw [show n + 2 = (n + 1) + 1 by omega, H_succ_left, A0, pderiv1_H_succ,
    ← A1_H, A1]
  ring

private theorem signedPhase_moment_step (n : ℕ) :
    phaseMoment (H (n + 2) (n + 1)) =
      (((-(n : ℝ) - 1 / 2) : ℝ) : ℂ) * phaseMoment (H (n + 1) n) := by
  rw [signedPhase_H_step, map_sub, map_sub, phaseMoment_weighted,
    map_nsmul, nsmul_eq_mul]
  push_cast
  ring

/-- The initial moment is real and nonnegative, without evaluating it. -/
private theorem signedPhase_moment_zero :
    phaseMoment (H 1 0) = ((∫ z : ℂ, ‖z‖ ∂gaussC : ℝ) : ℂ) := by
  have hH : H 1 0 = (X 0 : CPoly) := by
    rw [H_succ_left, H_zero_zero]
    simp [A0]
  change (∫ z : ℂ, ev z (H 1 0) * conj (ph z) ∂gaussC) = _
  rw [hH]
  calc
    (∫ z : ℂ, ev z (X 0 : CPoly) * conj (ph z) ∂gaussC) =
        ∫ z : ℂ, (‖z‖ : ℂ) ∂gaussC := by
      refine integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)
      change ev z (X 0 : CPoly) * conj (ph z) = (‖z‖ : ℂ)
      have hev : ev z (X 0 : CPoly) = z := by simp [ev, zv]
      rw [hev]
      have hp : conj z * ph z = (‖z‖ : ℂ) := by
        simpa [ph] using conj_monomial_mul_div_norm 0 z
      simpa only [map_mul, Complex.conj_conj, Complex.conj_ofReal] using congrArg conj hp
    _ = _ := integral_complex_ofReal

/-- Every charge-one moment has the Hermite sign (-1)^n times a nonnegative
real magnitude. Only the recurrence algebra is needed for this assertion. -/
private theorem signedPhase_moment (n : ℕ) :
    ∃ r : ℝ, 0 ≤ r ∧ phaseMoment (H (n + 1) n) = (((-1 : ℝ) ^ n * r : ℝ) : ℂ) := by
  induction n with
  | zero =>
    refine ⟨∫ z : ℂ, ‖z‖ ∂gaussC, integral_nonneg (fun z => norm_nonneg z), ?_⟩
    simpa only [zero_add, pow_zero, one_mul] using signedPhase_moment_zero
  | succ n ih =>
    rcases ih with ⟨r, hr, hmoment⟩
    refine ⟨((n : ℝ) + 1 / 2) * r, mul_nonneg (by positivity) hr, ?_⟩
    rw [show n + 1 + 1 = n + 2 by omega, signedPhase_moment_step, hmoment]
    push_cast
    rw [pow_succ]
    ring

private theorem signedPhase_integral_conj_moment (P : CPoly) :
    (∫ z : ℂ, conj (ev z P) * ph z ∂gaussC) = conj (phaseMoment P) := by
  change (∫ z : ℂ, conj (ev z P) * ph z ∂gaussC) =
    conj (∫ z : ℂ, ev z P * conj (ph z) ∂gaussC)
  rw [← integral_conj]
  congr 1
  funext z
  simp

private theorem signedPhase_coefficient_moment (n : ℕ) :
    chargeOneCoeff phaseLp n = (nrm (n + 1) n : ℂ) * conj (phaseMoment (H (n + 1) n)) := by
  change ⟪hvec (n + 1, n), phaseLp⟫_ℂ = _
  rw [hvec, phaseLp, Grothe.UpperChaos.inner_toLp]
  simp only [hfun, map_mul, Complex.conj_ofReal]
  simp_rw [mul_assoc]
  rw [integral_const_mul, signedPhase_integral_conj_moment]

/-- The actual phase coefficient, with the signed normalized-Hermite
convention used by the origin coefficient data. This is the coefficient
itself, not only its squared magnitude. -/
theorem phase_chargeOneCoeff_eq_signed_sqrt (n : ℕ) :
    chargeOneCoeff Grothe.Haag.phaseLp n =
      (((-1 : ℝ) ^ n * Real.sqrt (haagCoeff n) : ℝ) : ℂ) := by
  rcases signedPhase_moment n with ⟨r, hr, hmoment⟩
  have ht : 0 ≤ nrm (n + 1) n * r := mul_nonneg (nrm_pos _ _).le hr
  have hcoeff : chargeOneCoeff phaseLp n =
      (((-1 : ℝ) ^ n * (nrm (n + 1) n * r) : ℝ) : ℂ) := by
    rw [signedPhase_coefficient_moment, hmoment, Complex.conj_ofReal]
    push_cast
    ring
  have hnorm : ‖chargeOneCoeff phaseLp n‖ = nrm (n + 1) n * r := by
    rw [hcoeff, Complex.norm_real, Real.norm_eq_abs, abs_mul, abs_neg_one_pow,
      abs_of_nonneg ht, one_mul]
  have henergy : ‖chargeOneCoeff phaseLp n‖ ^ 2 = haagCoeff n := by
    simpa only [chargeOneCoeff, chargeOneMode] using phase_energy n
  rw [hnorm] at henergy
  have hsqrt : Real.sqrt (haagCoeff n) = nrm (n + 1) n * r := by
    rw [← henergy, Real.sqrt_sq ht]
  rw [hsqrt]
  exact hcoeff

end

end Grothe.HJM.Origin
