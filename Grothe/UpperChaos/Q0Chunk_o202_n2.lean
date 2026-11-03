import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 202, count 2; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0Chunk_o202_n2

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := [[],[],[],[],[],[],[],[],[[],[],[],[],[],[],[],[],[],[],[-119704427776660826357718349649760000]],[[],[],[],[],[],[],[],[],[],[0,0,-1875369368501019612937587477846240000],[0,-76908076381286411383055501568000000]],[[],[],[],[],[],[],[],[],[0,0,0,0,-4282758416009420676353923176358080000],[0,0,0,-402485599728732219571323791539200000]],[[],[],[],[],[],[],[],[0,0,0,0,0,0,-3351723977746503138016113790193280000],[0,0,0,0,0,-552712708926845009806225537935360000]],[[],[],[],[],[],[],[0,0,0,0,0,0,0,0,-1170443293816239191053246085464320000],[0,0,0,0,0,0,0,-309683187561979949835770152980480000]],[[],[],[],[],[],[0,0,0,0,0,0,0,0,0,0,-203349743976154687738543764343296000],[0,0,0,0,0,0,0,0,0,-84314039292076954701423809126400000]],[[],[],[],[],[0,0,0,0,0,0,0,0,0,0,0,0,-18056425469341431046551454761984000],[0,0,0,0,0,0,0,0,0,0,0,-12015268498625217131898233241600000]],[[],[],[],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,-774791673723703477664688273408000],[0,0,0,0,0,0,0,0,0,0,0,0,0,-905128979737284261394986270720000]],[[],[],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-12598238597133389880726638592000],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-33752629962034208540282519552000]],[[],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-485649351971715230795431936000]],[[],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop 202).take 2).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop 202).take 2) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.Q0Chunk_o202_n2
