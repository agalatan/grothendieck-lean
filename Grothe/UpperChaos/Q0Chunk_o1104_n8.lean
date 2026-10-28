import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 1104, count 8; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0Chunk_o1104_n8

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := [[],[],[],[],[],[],[],[],[],[],[],[],[[],[],[],[],[],[],[],[6216872047748470418959505358028800]],[[],[],[-42002545947580318015494491996160000],[24907328873901536830360211895091200],[],[],[0,0,15542180119371176047398763395072000]],[[],[0,0,0],[0,5697592230215583389627285136998400,12453664436950768415180105947545600],[-771888069285270556677418285793280,-169792340339557340314286004633600],[],[0,0,0,0,10361453412914117364932508930048000]],[[],[0,0,0,0,0],[0,0,-1543776138570541113354836571586560,-56597446779852446771428668211200],[0,25472942935308709452249814794240],[-894865877831978509752336384000,0,0,0,0,0,2590363353228529341233127232512000]],[[],[0,0,0,0,0,0],[0,0,0,16981961956872472968166543196160],[0,0,-3579463511327914039009345536000,0,0,0,0,0,259036335322852934123312723251200]],[[],[0,0,0,0,0,0],[0,0,0,0,-1193154503775971346336448512000,0,0,0,0,0,8634544510761764470777090775040]],[[],[0,0,0,0,0,0,0,0,0,0,0,0,0]]]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop 1104).take 8).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop 1104).take 8) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.Q0Chunk_o1104_n8
