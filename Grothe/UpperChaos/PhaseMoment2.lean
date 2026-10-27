import Grothe.UpperChaos.ConcretePhaseMoments
import Grothe.UpperChaos.PhaseMomentData

/-!
# The exact second moment of the production phase

The finite check computes the square of the integer polynomial obtained from
the actual phase term list. The Gaussian integration identity then supplies
the analytic moment without an external numerical premise.
-/

open MeasureTheory

namespace Grothe.UpperChaos

set_option maxRecDepth 4096

/-- Exact second-moment arithmetic on the production phase. -/
theorem phase_moment2_check : phaseMomentValue 1 = phaseMoment2Q := by
  native_decide

/-- The second moment of the actual rounding phase is the certified rational value. -/
theorem integral_phiT_sq : (∫ u, phiT u ^ 2 ∂mu2) = (phaseMoment2Q : ℝ) := by
  rw [show 2 = 2 * 1 by decide, integral_phiT_pow_even, phase_moment2_check]

end Grothe.UpperChaos
