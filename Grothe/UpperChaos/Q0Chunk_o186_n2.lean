import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 186, count 2; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0Chunk_o186_n2

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := [[],[],[],[],[],[],[],[],[],[[],[],[],[],[],[],[],[],[],[0,182560173531455612800392771686400000],[589545841788561736146128860800000]],[[],[],[],[],[],[],[],[],[0,0,0,851947476480126193068499601203200000],[0,0,9432733468616987778338061772800000]],[[],[],[],[],[],[],[],[0,0,0,0,0,1022336971776151431682199521443840000],[0,0,0,0,22009711426772971482788810803200000]],[[],[],[],[],[],[],[0,0,0,0,0,0,0,486827129417214967467714057830400000],[0,0,0,0,0,0,17607769141418377186231048642560000]],[[],[],[],[],[],[0,0,0,0,0,0,0,0,0,108183806537158881659492012851200000],[0,0,0,0,0,0,0,0,6288488979077991852225374515200000]],[[],[],[],[],[0,0,0,0,0,0,0,0,0,0,0,11801869804053696181035492311040000],[0,0,0,0,0,0,0,0,0,0,1117953596280531884840066580480000]],[[],[],[],[0,0,0,0,0,0,0,0,0,0,0,0,0,605224092515574163130025246720000],[0,0,0,0,0,0,0,0,0,0,0,0,101632145116411989530915143680000]],[[],[],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,11528077952677603107238576128000],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,4467347038084043495864401920000]],[[],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,74455783968067391597740032000]],[[],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop 186).take 2).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop 186).take 2) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.Q0Chunk_o186_n2
