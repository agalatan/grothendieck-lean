import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 188, count 4; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0Chunk_o188_n4

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := [[],[[],[],[],[-293282327807572062211594680562352128000]],[[],[],[0,0,-146641163903786031105797340281176064000],[0,-2996444637384607362225276585580167168000],[-1313931510945825267284844798579572736000]],[[],[0,0,0,0,0],[0,0,0,-998814879128202454075092195193389056000],[0,0,-3941794532837475801854534395738718208000],[0,-8280095704243512618127170582513451008000]],[[],[0,0,0,0,0,0],[0,0,0,0,-875954340630550178189896532386381824000],[0,0,0,-8970103679597138669637768131056238592000]],[[],[0,0,0,0,0,0,0],[0,0,0,0,0,-1380015950707252103021195097085575168000]],[[],[0,0,0,0,0,0,0,0]]]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop 188).take 4).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop 188).take 4) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.Q0Chunk_o188_n4
