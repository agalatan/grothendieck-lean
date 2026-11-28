import Grothe.LowerAnalytic.CapPolar
import Grothe.UpperChaos.ComplexMoments
import Mathlib.MeasureTheory.Integral.Gamma
import Grothe.LowerAnalytic.Fifth.VisibleMoments

/-! The even radial moment complements the production phase moments. Agent-ID: codex-a7c4 -/

namespace Grothe.LowerAnalytic
open MeasureTheory Real
noncomputable section

theorem visible_radial_even (k : ℕ) :
    (∫ z : ℂ, ‖z‖ ^ (2*k) ∂gaussC) = k.factorial := by
  rw [visible_radial_moment, show (((2*k : ℕ) : ℝ) + 2) / 2 = (k : ℝ) + 1 by push_cast; ring,
    Real.Gamma_nat_eq_factorial]

end
end Grothe.LowerAnalytic
