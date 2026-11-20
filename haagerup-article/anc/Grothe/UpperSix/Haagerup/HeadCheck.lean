import Grothe.UpperSix.Haagerup.Parameters
import Grothe.UpperSix.Haagerup.CellOverlapCore
import Grothe.UpperSix.Haagerup.Data.OverlapData

set_option warningAsError true

-- Agent-ID: gemini-21d5, codex-a7c4
namespace Haagerup
open HaagerupKernel HaagerupKernel.Cell Haagerup.Data

def headICert : Fin 6 → List Ival
  | 0 => bivarT 251 tcellRows (p0Q.map ofRatI) (q0Q.map ofRatI) 501 167
  | 1 => bivarT 251 tcellRows (p1Q.map ofRatI) (q1Q.map ofRatI) 501 167
  | 2 => bivarT 251 (onedRowsI 251 (haagMuList 251)) (p2Q.map ofRatI) [] 503 0
  | 3 => bivarT 251 (onedRowsI 251 tigMuList) (r3Q.map ofRatI) [] 503 0
  | 4 => bivarT 251 (onedRowsI 251 tigMuList) (r4Q.map ofRatI) [] 503 0
  | 5 => bivarT 251 tcellRows (p5Q.map ofRatI) (q5Q.map ofRatI) 501 167


set_option maxRecDepth 10000 in
theorem head_sum_ok :
    decide (absSum (addL (sumL ((List.finRange 6).map fun p =>
      (headICert p).map (mulI (ofRatI (wQ p))))) [negI (ofRatI cCertQ)]) ≤
      ofRatLo headCapCertQ) = true := by
  native_decide

end Haagerup
