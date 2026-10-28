import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 1088, count 8; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0Chunk_o1088_n8

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := [[],[],[],[],[],[],[],[],[],[],[],[],[[],[],[],[-405550469960213337865473692994109440],[62270330178181215540063078595952640]],[[],[],[0,0,-202775234980106668932736846497054720],[0,9903732772053706283626572514590720,62270330178181215540063078595952640],[-3806240139403260358387280967106560]],[[],[0,0,0,0,0],[0,0,0,3301244257351235427875524171530240,10378388363030202590010513099325440],[0,0,-11418720418209781075161842901319680],[80732149660945250164881311662080,648956308382160992304832394035200],[37861869229358361864516403200000]],[[],[0,0,0,0,0,0,0],[0,0,0,0,-2537493426268840238924853978071040],[0,0,322928598643781000659525246648320,703036000747341074996901760204800],[0,-6790354014998039449060874649600,198774813454131399788711116800000]],[[],[0,0,0,0,0,0,0],[0,0,0,0,107642866214593666886508415549440,108159384730360165384138732339200],[0,0,0,-9053805353330719265414499532800,113585607688075085593549209600000]],[[],[0,0,0,0,0,0,0,0],[0,0,0,0,0,-1810761070666143853082899906560,12620623076452787288172134400000]],[[],[0,0,0,0,0,0,0,0,0]]]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop 1088).take 8).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop 1088).take 8) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.Q0Chunk_o1088_n8
