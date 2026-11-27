import Grothe.UpperSelector.NumericParameters
import Grothe.UpperSixExact.Head

/-!
# Finite verification of the seven-channel upper witness

The joint check recomputes the six interval heads and the signed angular column directly
from their Lean definitions. The head norm requires cancellation between all seven channels.
The scalar comparisons and reciprocal rounding use kernel arithmetic. Agent-ID: codex-a7c4
-/

set_option warningAsError true

namespace Haagerup.AngularSelector.NumericWitness
open HaagerupKernel

set_option maxRecDepth 10000 in
/-- The compiled computation covers both expensive finite comparisons. -/
theorem budgets_ok : withinBudgets SixChannelExact.headIntervals Certificate.production = true := by
  native_decide

theorem head_ok :
    absSum (addL (sumL ((List.finRange 7).map fun i =>
      (heads SixChannelExact.headIntervals Certificate.production i).map (mulI (ofRatI (weight i)))))
      [negI (ofRatI center)]) ≤ ofRatLo headBudget :=
  (of_decide_eq_true budgets_ok).1

theorem selector_budget_ok : (Certificate.production.allowance : ℚ) / 2^89 ≤ selectorBudget :=
  (of_decide_eq_true budgets_ok).2

/-- Sum of the head budget and the seven nonnegative weighted tail/error budgets. -/
def residual : ℚ := headBudget + ∑ i, weight i * caps SixChannelExact.phaseTailCap selectorBudget i

theorem residual_eq : residual = 288031434182863288259330965 / 10^27 := by decide +kernel

theorem residual_lt_center : residual < center := by rw [residual_eq]; decide +kernel

theorem reciprocal_eq :
    1 / (center - residual) = 10^27 / 711968565817136711740669035 := by
  rw [residual_eq]
  decide +kernel

theorem reciprocal_lt_target : 1 / (center - residual) < 1404556392 / 10^9 := by
  rw [reciprocal_eq]
  decide +kernel

end Haagerup.AngularSelector.NumericWitness
