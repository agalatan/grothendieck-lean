import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 1136, count 4; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0Chunk_o1136_n4

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[[],[],[1464164018295975250221430996992],[-227823867182643628210730827776]],[[],[0,0,0],[-12915147513954616652832178176,-53053333027026569289353134080,-113911933591321814105365413888]],[[],[0,0,0,0,0]]]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop 1136).take 4).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop 1136).take 4) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.Q0Chunk_o1136_n4
