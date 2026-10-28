import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 184, count 2; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0Chunk_o184_n2

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := [[],[],[],[],[],[],[],[],[[],[],[],[],[],[],[],[],[0,9207021948823700423739867773583360000],[252305851121373691713983632680960000]],[[],[],[],[],[],[],[],[0,0,0,36828087795294801694959471094333440000],[0,0,3532281915699231683995770857533440000]],[[],[],[],[],[],[],[0,0,0,0,0,36828087795294801694959471094333440000],[0,0,0,0,7064563831398463367991541715066880000]],[[],[],[],[],[],[0,0,0,0,0,0,0,14029747731540876836175036607365120000],[0,0,0,0,0,0,4709709220932308911994361143377920000]],[[],[],[],[],[0,0,0,0,0,0,0,0,0,2338291288590146139362506101227520000],[0,0,0,0,0,0,0,0,1345631205980659689141246040965120000]],[[],[],[],[0,0,0,0,0,0,0,0,0,0,0,170057548261101537408182261907456000],[0,0,0,0,0,0,0,0,0,0,179417494130754625218832805462016000]],[[],[],[0,0,0,0,0,0,0,0,0,0,0,0,0,4360449955412859933543134920704000],[0,0,0,0,0,0,0,0,0,0,0,0,10873787523076037892050473058304000]],[[],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,238984341166506327297812594688000]],[[],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop 184).take 2).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop 184).take 2) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.Q0Chunk_o184_n2
