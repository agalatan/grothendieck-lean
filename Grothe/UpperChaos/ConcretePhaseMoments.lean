import Grothe.UpperChaos.PhaseMomentEval
import Grothe.UpperChaos.Rounder

/-!
# Exact moment evaluation for the phase used by the rounding

The finite calculation reads the same rational term list and damping parameter
as `phiT`. The analytic identity holds for every even power. Numerical leaf
checks can specialize this identity without an external moment premise.
-/

open MeasureTheory Grothe.Upper

namespace Grothe.UpperChaos

/-- The exact rational value of the `2j`-th moment of the production phase. -/
def phaseMomentValue (j : ℕ) : ℚ :=
  PhaseMomentCheck.phasePowerMoment phaseTerms phaseEpsQ j

noncomputable section

/-- **Every even moment of the production phase equals its finite rational calculation.** -/
theorem integral_phiT_pow_even (j : ℕ) :
    (∫ u, phiT u ^ (2 * j) ∂mu2) = (phaseMomentValue j : ℝ) := by
  have heps : (0 : ℚ) < phaseEpsQ := by norm_num [phaseEpsQ]
  simpa only [PhaseMomentCheck.phaseOfTerms, Complex.normSq_eq_norm_sq,
    phiT, Sphase, Ssum, phaseMomentValue] using
    PhaseMomentCheck.integral_phaseOfTerms_pow heps j

end

end Grothe.UpperChaos
