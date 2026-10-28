import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 204, count 4; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0Chunk_o204_n4

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := [[],[[],[],[],[],[2739257072820496837472070835051167744000]],[[],[],[],[0,0,2739257072820496837472070835051167744000],[0,15750785529071629034166379227138490368000],[7798813232191429300871433508607754240000]],[[],[],[0,0,0,0,456542845470082806245345139175194624000],[0,0,0,10500523686047752689444252818092326912000],[0,0,31195252928765717203485734034431016960000],[0,6871764032021665600091462086982369280000]],[[],[0,0,0,0,0,0,0],[0,0,0,0,0,1312565460755969086180531602261540864000],[0,0,0,0,13647923156335001276525008640063569920000],[0,0,0,10307646048032498400137193130473553920000]],[[],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,1299802205365238216811905584767959040000],[0,0,0,0,0,3092293814409749520041157939142066176000]],[[],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,229058801067388853336382069566078976000]],[[],[0,0,0,0,0,0,0,0,0,0]]]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop 204).take 4).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop 204).take 4) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.Q0Chunk_o204_n4
