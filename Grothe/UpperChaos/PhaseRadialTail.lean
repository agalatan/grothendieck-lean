import Grothe.UpperChaos.RestrictedPhaseMoments
import Grothe.UpperChaos.PhaseTailExponential

/-!
The production phase has squared integral less than `(5 / 10^15)^2` outside
the squared-radius cutoff 50 in its first Gaussian coordinate. The finite
check evaluates the actual phase terms; no external moment table is assumed.
-/

open MeasureTheory Grothe.Upper

namespace Grothe.UpperChaos

open PhaseMomentCheck

set_option maxRecDepth 4096

/-- Exact rational factor after removing the common exponential `exp (-155)`. -/
def phaseCutoffFactor : ℚ := cutPhasePowerMoment phaseTerms phaseEpsQ 50 1

/-- Direct single-threaded exact arithmetic on the production phase. -/
theorem phase_cutoff_factor_check :
    0 ≤ phaseCutoffFactor ∧
      phaseCutoffFactor < (148 : ℚ) ^ 31 * (5 / 10 ^ 15 : ℚ) ^ 2 := by
  native_decide

/-- The actual phase's squared radial tail, with no numerical hypotheses. -/
theorem integral_phiT_sq_radial_tail_lt :
    (∫ u, phiT u ^ 2 ∂(RestrictedWick.muCut 50)) < (5 / 10 ^ 15 : ℝ) ^ 2 := by
  have h := integral_phiT_pow_even_cut (50 : ℚ) (by norm_num) 1
  have he : -(((1 + 2 * (1 : ℚ) * phaseEpsQ : ℚ) : ℝ) * ((50 : ℚ) : ℝ)) =
      (-155 : ℝ) := by norm_num [phaseEpsQ]
  rw [he] at h
  simp only [Nat.mul_one, Rat.cast_ofNat] at h
  change (∫ u, phiT u ^ 2 ∂(RestrictedWick.muCut 50)) =
    Real.exp (-155) * (phaseCutoffFactor : ℝ) at h
  rw [h]
  exact phase_tail_scalar_bound phase_cutoff_factor_check.1 phase_cutoff_factor_check.2

end Grothe.UpperChaos
