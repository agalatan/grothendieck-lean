import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 920, count 8; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0Chunk_o920_n8

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := [[],[],[],[],[],[],[],[],[[],[],[660867321102280295560799889784622284800]],[[],[0,0,0],[0,-260124821903779949093642091571131187200],[155092639015468759592925769349726208000]],[[],[0,0,0,0],[0,0,310185278030937519185851538699452416000],[0,-53235585239906782953827555729080320000],[8011944933116889837105069924542054400]],[[],[0,0,0,0,0],[0,0,0,-35490390159937855302551703819386880000],[0,0,32047779732467559348420279698168217600],[0,-7080108412633720507930310520864768000],[775939591103249652589295951413248000]],[[],[0,0,0,0,0,0],[0,0,0,0,10682593244155853116140093232722739200],[0,0,0,-9440144550178294010573747361153024000],[0,0,4655637546619497915535775708479488000],[0,-177569159830304744105790183309312000]],[[],[0,0,0,0,0,0,0],[0,0,0,0,0,-1888028910035658802114749472230604800],[0,0,0,0,3103758364412998610357183805652992000],[0,0,0,-355138319660609488211580366618624000]],[[],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,413834448588399814714291174087065600],[0,0,0,0,0,-142055327864243795284632146647449600]],[[],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,-13529078844213694789012585394995200]],[[],[0,0,0,0,0,0,0,0,0,0]]]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop 920).take 8).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop 920).take 8) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.Q0Chunk_o920_n8
