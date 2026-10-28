import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 200, count 2; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0Chunk_o200_n2

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := [[],[],[],[],[],[],[],[[],[],[],[],[],[],[],[],[],[-4162491278883770166016391844495360000]],[[],[],[],[],[],[],[],[],[0,0,-56713943674791368511973338881249280000],[0,-9591722241206600683513345300600320000]],[[],[],[],[],[],[],[],[0,0,0,0,-110306018890419909399434383879127040000],[0,0,0,-43695623543274514224894128591623680000]],[[],[],[],[],[],[],[0,0,0,0,0,0,-71456100287504721183281393330503680000],[0,0,0,0,0,-51155851953101870312071174936535040000]],[[],[],[],[],[],[0,0,0,0,0,0,0,0,-19821387042303667457220913545216000000],[0,0,0,0,0,0,0,-23750931263940154073461616934819840000]],[[],[],[],[],[0,0,0,0,0,0,0,0,0,0,-2563566057471274324467238151847936000],[0,0,0,0,0,0,0,0,0,-5142651783645161565763768908963840000]],[[],[],[],[0,0,0,0,0,0,0,0,0,0,0,0,-150562455109215736644748757434368000],[0,0,0,0,0,0,0,0,0,0,0,-546252964578576970143328563535872000]],[[],[],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,-3203456491685441205207420370944000],[0,0,0,0,0,0,0,0,0,0,0,0,0,-27255865176477852980124502130688000]],[[],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-504738244008849129261564854272000]],[[],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop 200).take 2).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop 200).take 2) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.Q0Chunk_o200_n2
