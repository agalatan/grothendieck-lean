import Grothe.UpperSixExact.Parameters
import Grothe.UpperSix.Haagerup.HeadCheck

set_option warningAsError true

/-!
# Mixed head and six linear coefficient floors

Agent-ID: codex-a7c4
-/

namespace Haagerup.SixChannelExact

open HaagerupKernel HaagerupKernel.Cell Haagerup.Data

/-- The five unchanged channels retain their original interval heads. -/
def headIntervals : Fin 6 → List Ival
  | 0 => bivarT 251 tcellRows (firstPolynomial.map ofRatI) (q0Q.map ofRatI) 501 167
  | 1 => headICert 1
  | 2 => headICert 2
  | 3 => headICert 3
  | 4 => headICert 4
  | 5 => headICert 5

def linearFloorsOK : Bool :=
  (List.finRange 6).all (fun p =>
    decide (ofRatHi (linearFloor p) ≤ ((headIntervals p).getD 0 zeroI).lo))

set_option maxRecDepth 10000 in
theorem head_and_floors_ok :
    decide ((absSum (addL (sumL ((List.finRange 6).map fun p =>
      (headIntervals p).map (mulI (ofRatI (wQ p))))) [negI (ofRatI slope)]) ≤
      ofRatLo headCap) ∧ linearFloorsOK = true) = true := by
  native_decide

theorem head_sum_ok :
    decide (absSum (addL (sumL ((List.finRange 6).map fun p =>
      (headIntervals p).map (mulI (ofRatI (wQ p))))) [negI (ofRatI slope)]) ≤
      ofRatLo headCap) = true :=
  decide_eq_true (of_decide_eq_true head_and_floors_ok).1

end Haagerup.SixChannelExact
