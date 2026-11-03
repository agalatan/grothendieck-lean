import Grothe.UpperChaos.OneSidedSeedIntegral
import Grothe.UpperChaos.ShiftedMomentZeroRight
import Grothe.UpperChaos.HermiteZeroRow

/-! Normalized Gaussian zero-row seed from the original positive moments.
The shifted-Wick identity and Hermite normalization are proved internally.
Numerical node bounds are separate obligations. Agent-ID: codex-8c4d. -/

open MeasureTheory Set Grothe.LowerAnalytic
open scoped ComplexConjugate
namespace Grothe.UpperChaos.OneSidedHermiteSeed
noncomputable section

/-- The zero-row normalization denominator is strictly positive. -/
theorem factorial_sqrt_pos (d : ℕ) : 0 < Real.sqrt (d.factorial : ℝ) := by
  apply Real.sqrt_pos.2
  exact_mod_cast Nat.factorial_pos d

/-- The Gaussian coefficient of the phase against the normalized zero-row
Hermite function, with the one-sided shifted-Wick identity discharged. -/
theorem phase_hermite_zero_row (A : ℝ) (d : ℕ) :
    (∫ w : ℂ, Haag.ph ((A : ℂ) + w) * conj (hfun (0, d) w) ∂gaussC) =
      (((Real.sqrt Real.pi / 2) * A * (-A) ^ d *
        OriginalPositiveMoment.moment d (A ^ 2) /
        Real.sqrt (d.factorial : ℝ) : ℝ) : ℂ) := by
  calc
    _ = ∫ w : ℂ, (w ^ d * Haag.ph ((A : ℂ) + w)) /
        (Real.sqrt (d.factorial : ℝ) : ℂ) ∂gaussC := by
          apply integral_congr_ae
          filter_upwards with w
          rw [HermiteZeroRow.conj_hfun_zero]
          ring
    _ = (∫ w : ℂ, w ^ d * Haag.ph ((A : ℂ) + w) ∂gaussC) /
        (Real.sqrt (d.factorial : ℝ) : ℂ) := by
          rw [integral_div]
    _ = _ := by
      rw [OneSidedSeedIntegral.phase_seed_of_wick A d shiftedDampedMoment_zero_right]
      exact (Complex.ofReal_div _ _).symm

#print axioms phase_hermite_zero_row
end
end Grothe.UpperChaos.OneSidedHermiteSeed
