import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 1120, count 8; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0Chunk_o1120_n8

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[[],[],[2172733923230056188835690724720640],[-986030077195565342383587537715200],[108899010337167132872629168373760]],[[],[0,0,0],[0,-223312382499867321304126115020800,-493015038597782671191793768857600],[17753309891824941648711065272320,-964521633788869456888080629760,108899010337167132872629168373760],[-1113020516731995931949861437440]],[[],[0,0,0,0,0],[0,0,35506619783649883297422130544640,-321507211262956485629360209920,18149835056194522145438194728960],[0,-236883409196565113567528878080,-3339061550195987795849584312320]],[[],[0,0,0,0,0,0,0],[0,0,0,-157922272797710075711685918720,-742013677821330621299907624960]],[[],[0,0,0,0,0,0,0]]]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop 1120).take 8).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop 1120).take 8) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.Q0Chunk_o1120_n8
