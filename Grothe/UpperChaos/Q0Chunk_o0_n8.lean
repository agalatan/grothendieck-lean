import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 0, count 8; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0Chunk_o0_n8

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := [[[],[],[4220008863205972508672000]],[[],[0,0,0],[0,-33252558728266078034000465432150016000],[7191422914202904202910593598881792000]],[[],[0,0,0,0],[0,0,14382845828405808405821187197763584000],[0,-270069273777698514905280866294956032000],[-74189558607860995326331678711873536000]],[[],[0,0,0,0,0],[0,0,0,-180046182518465676603520577529970688000],[0,0,-296758234431443981305326714847494144000],[0,-671890423632025485180462810047447040000],[-157519540567962764885791446694625280000]],[[],[0,0,0,0,0,0],[0,0,0,0,-98919411477147993768442238282498048000],[0,0,0,-895853898176033980240617080063262720000],[0,0,-945117243407776589314748680167751680000],[0,-561058282970980569036061887147540480000]],[[],[0,0,0,0,0,0,0],[0,0,0,0,0,-179170779635206796048123416012652544000],[0,0,0,0,-630078162271851059543165786778501120000],[0,0,0,-1122116565941961138072123774295080960000]],[[],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,-84010421636246807939088771570466816000],[0,0,0,0,0,-448846626376784455228849509718032384000]],[[],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,-42747297750169948117033286639812608000]],[[],[0,0,0,0,0,0,0,0,0,0]]]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop 0).take 8).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop 0).take 8) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.Q0Chunk_o0_n8
