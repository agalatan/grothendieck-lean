import Grothe.UpperChaos.Q0SourceExceptionWidth

/-! Only the four smallest Gauss orders occur in the exceptional panels.
These are quadrature orders, not conditional-mode cutoffs. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionOrders

open Grothe.UpperChaos.Q0SourceExceptionWidth

set_option maxRecDepth 65536
set_option maxHeartbeats 0

theorem checked :
    exceptionPanels.all (fun p => decide (1 ≤ p.order ∧ p.order ≤ 4)) = true := by
  decide +kernel

theorem counts :
    (exceptionPanels.filter (fun p => p.order == 1)).length = 361 ∧
    (exceptionPanels.filter (fun p => p.order == 2)).length = 8 ∧
    (exceptionPanels.filter (fun p => p.order == 3)).length = 8 ∧
    (exceptionPanels.filter (fun p => p.order == 4)).length = 4 := by
  decide +kernel

theorem each_order (p : Grothe.UpperChaos.Q0GaussAddress.Panel)
    (hp : p ∈ exceptionPanels) : 1 ≤ p.order ∧ p.order ≤ 4 :=
  of_decide_eq_true ((List.all_eq_true.mp checked) p hp)

end Grothe.UpperChaos.Q0SourceExceptionOrders
