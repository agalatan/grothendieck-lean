import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 1128, count 8; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0Chunk_o1128_n8

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[[],[],[],[],[],[20910846567447493806878899568640]],[[],[],[-73609396906197122988985999687680],[22624330608837113713033432006656],[-1336005639664645839453759209472,-5705186521225859085475900293120,31366269851171240710318349352960]],[[],[0,0,0],[0,5159275248017609789224293236736,11312165304418556856516716003328],[-180178064810753349196003147776,57595576519548934137701203968,-1336005639664645839453759209472,-3803457680817239390317266862080,10455423283723746903439449784320]],[[],[0,0,0,0,0],[0,0,-360356129621506698392006295552,19198525506516311379233734656,-222667606610774306575626534912,-475432210102154923789658357760,871285273643645575286620815360]],[[],[0,0,0,0,0,0,0,0,0]]]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop 1128).take 8).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop 1128).take 8) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.Q0Chunk_o1128_n8
