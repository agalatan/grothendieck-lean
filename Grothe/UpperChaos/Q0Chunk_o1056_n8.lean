import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 1056, count 8; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0Chunk_o1056_n8

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := [[],[],[],[],[],[],[],[],[],[],[],[[],[],[-5346701685676602431747006601426370560],[4477776129389593207088979933879336960]],[[],[0,0,0],[0,1118918071256109447479225214786600960,2238888064694796603544489966939668480],[-320628512550296599957656594567659520]],[[],[0,0,0,0,0],[0,0,-641257025100593199915313189135319040],[0,32431595583838646336887598685880320],[-3109672895027742250908315738439680]],[[],[0,0,0,0,0],[0,0,0,21621063722559097557925065790586880],[0,0,-12438691580110969003633262953758720],[0,622613435628888446701987587686400],[-25001762236833678007403859148800]],[[],[0,0,0,0,0,0],[0,0,0,0,-4146230526703656334544420984586240],[0,0,0,830151247505184595602650116915200],[0,0,-150010573421002068044423154892800]],[[],[0,0,0,0,0,0,0],[0,0,0,0,0,166030249501036919120530023383040],[0,0,0,0,-100007048947334712029615436595200]],[[],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,-13334273192977961603948724879360]],[[],[0,0,0,0,0,0,0,0,0]]]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop 1056).take 8).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop 1056).take 8) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.Q0Chunk_o1056_n8
