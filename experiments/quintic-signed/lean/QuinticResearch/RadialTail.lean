import QuinticResearch.SignedFifth
import Grothe.LowerAnalytic.Fifth.RadialBounds

/-! Nonnegativity of the tail used by the fifth projection. Agent-ID: codex-a7c4 -/

set_option warningAsError true

namespace Grothe.LowerAnalytic
open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
noncomputable section

theorem radialTail_nonneg {M a x : ℝ} (hm : 6 ≤ M) (ha : 0 < a) :
    0 ≤ radialTail M a x := by
  by_cases hx : M < x
  · rw [radialTail,indicator_of_mem (show x ∈ Ioi M from hx)]
    have xpos : 0 ≤ x := by linarith
    apply mul_nonneg (by positivity : 0 ≤ (x+a^2)/(2*a))
    have id : laguerre2 x-laguerre2 M = (x-M)*(x+M-6)/2 := by unfold laguerre2; ring
    rw [id]; exact div_nonneg (mul_nonneg (by linarith) (by linarith)) (by norm_num)
  · rw [radialTail,indicator_of_notMem (show x ∉ Ioi M from hx)]

end
end Grothe.LowerAnalytic
