import Grothe.Upper.Certificate.Parameters
import Grothe.Upper.Rounding.CellOverlapCore
import Grothe.Upper.Rounding.Data.OverlapData

set_option warningAsError true

/-!
# Mixed head and six linear coefficient floors

Agent-ID: codex-a7c4, gemini-1aa9
-/

namespace Grothe.Upper.Channels

open Grothe.Upper.Kernel Grothe.Upper.Kernel.Cell Grothe.Upper.Data

/-- The phase map has certified moments beyond the five cell heads. -/
def lastIndex (p : Fin 6) : ℕ := if p = 2 then 320 else 250

/-- The phase tail starts at 321 and the five cell tails start at 251. -/
def phaseTailCap (p : Fin 6) : ℚ :=
  if p = 2 then 28458209 / 10 ^ 15 else tailCap p

/-- The total residual is computed from the head cap and the six weighted tails. -/
def phaseResidual : ℚ := headCap + ∑ p : Fin 6, wQ p * phaseTailCap p

theorem phaseResidual_eq : phaseResidual = 4524218278671805688787 / 10 ^ 27 := by
  decide +kernel

/-- Four cell channels retain their original heads. The phase channel uses 321 exact Haagerup moments. -/
def headIntervals : Fin 6 → List Ival
  | 0 => bivarT 251 tcellRows (firstPolynomial.map ofRatI) (q0Q.map ofRatI) 501 167
  | 1 => bivarT 251 tcellRows (p1Q.map ofRatI) (q1Q.map ofRatI) 501 167
  | 2 => bivarT 321 (onedRowsI 321 (phaseMuList 321)) (p2Q.map ofRatI) [] 643 0
  | 3 => bivarT 251 (onedRowsI 251 tigMuList) (r3Q.map ofRatI) [] 503 0
  | 4 => bivarT 251 (onedRowsI 251 tigMuList) (r4Q.map ofRatI) [] 503 0
  | 5 => bivarT 251 tcellRows (p5Q.map ofRatI) (q5Q.map ofRatI) 501 167

def linearFloorsOK : Bool :=
  (List.finRange 6).all (fun p =>
    decide (ofRatHi (linearFloor p) ≤ ((headIntervals p).getD 0 zeroI).lo))

def headLengthsOK : Bool :=
  (List.finRange 6).all (fun p => decide ((headIntervals p).length = lastIndex p + 1))

set_option maxRecDepth 10000 in
theorem head_and_floors_ok :
    decide ((absSum (addL (sumL ((List.finRange 6).map fun p =>
      (headIntervals p).map (mulI (ofRatI (wQ p))))) [negI (ofRatI slope)]) ≤
      ofRatLo headCap) ∧ linearFloorsOK = true ∧ headLengthsOK = true) = true := by
  native_decide

theorem head_length (p : Fin 6) : (headIntervals p).length = lastIndex p + 1 :=
  of_decide_eq_true (List.all_eq_true.1 (of_decide_eq_true head_and_floors_ok).2.2 p
    (List.mem_finRange p))

theorem head_sum_ok :
    decide (absSum (addL (sumL ((List.finRange 6).map fun p =>
      (headIntervals p).map (mulI (ofRatI (wQ p))))) [negI (ofRatI slope)]) ≤
      ofRatLo headCap) = true :=
  decide_eq_true (of_decide_eq_true head_and_floors_ok).1

end Grothe.Upper.Channels
