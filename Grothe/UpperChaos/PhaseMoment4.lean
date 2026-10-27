import Grothe.UpperChaos.ConcretePhaseMoments
import Grothe.UpperChaos.PhaseMomentData

/-!
# The exact fourth moment of the production phase

One single-threaded finite check computes the polynomial power from the actual
phase term list. The generic Gaussian integration theorem turns the resulting
rational equality into the moment of the concrete rounding phase.
-/

open MeasureTheory

namespace Grothe.UpperChaos

set_option maxRecDepth 4096

/-- Exact fourth-moment arithmetic on the production phase. -/
theorem phase_moment4_check : phaseMomentValue 2 = phaseMoment4Q := by
  native_decide

/-- The fourth moment of the actual phase is the certified rational value. -/
theorem integral_phiT_pow_four :
    (∫ u, phiT u ^ 4 ∂mu2) = (phaseMoment4Q : ℝ) := by
  rw [show 4 = 2 * 2 by decide, integral_phiT_pow_even, phase_moment4_check]

end Grothe.UpperChaos
