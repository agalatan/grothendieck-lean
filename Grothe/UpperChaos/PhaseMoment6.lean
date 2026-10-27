import Grothe.UpperChaos.ConcretePhaseMoments
import Grothe.UpperChaos.PhaseMomentData

/-!
# The exact sixth moment of the production phase

One single-threaded finite check computes the polynomial power from the actual
phase term list. The generic Gaussian integration theorem turns the resulting
rational equality into the moment of the concrete rounding phase.
-/

open MeasureTheory

namespace Grothe.UpperChaos

set_option maxRecDepth 4096

/-- Exact sixth-moment arithmetic on the production phase. -/
theorem phase_moment6_check : phaseMomentValue 3 = phaseMoment6Q := by
  native_decide

/-- The sixth moment of the actual phase is the certified rational value. -/
theorem integral_phiT_pow_six :
    (∫ u, phiT u ^ 6 ∂mu2) = (phaseMoment6Q : ℝ) := by
  rw [show 6 = 2 * 3 by decide, integral_phiT_pow_even, phase_moment6_check]

end Grothe.UpperChaos
