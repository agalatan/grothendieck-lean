import Grothe.UpperSixExact.Parameters
import Grothe.UpperSix.Haagerup.CellOverlapCore
import Grothe.UpperSix.Haagerup.Data.OverlapData

set_option warningAsError true

/-!
# Mixed head and six linear coefficient floors

Agent-ID: codex-a7c4, gemini-1aa9
-/

namespace Haagerup.SixChannelExact

open HaagerupKernel HaagerupKernel.Cell Haagerup.Data

/-- The five unchanged channels retain their original interval heads. -/
def headIntervals : Fin 6 → List Ival
  | 0 => bivarT 251 tcellRows (firstPolynomial.map ofRatI) (q0Q.map ofRatI) 501 167
  | 1 => bivarT 251 tcellRows (p1Q.map ofRatI) (q1Q.map ofRatI) 501 167
  | 2 => bivarT 251 (onedRowsI 251 (haagMuList 251)) (p2Q.map ofRatI) [] 503 0
  | 3 => bivarT 251 (onedRowsI 251 tigMuList) (r3Q.map ofRatI) [] 503 0
  | 4 => bivarT 251 (onedRowsI 251 tigMuList) (r4Q.map ofRatI) [] 503 0
  | 5 => bivarT 251 tcellRows (p5Q.map ofRatI) (q5Q.map ofRatI) 501 167

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
