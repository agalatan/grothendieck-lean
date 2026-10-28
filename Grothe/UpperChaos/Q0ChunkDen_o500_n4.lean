import Grothe.UpperChaos.Q0RawWickDefs
import Mathlib.Tactic

/-! Untrusted candidate checked against actual parsed source via `cbv`.
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 500, count 4; no full-denominator claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0ChunkDen_o500_n4

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem raw_chunk_commonDen :
    GrotheKernel.commonDen
      (Grothe.UpperChaos.Q0RawWickTerms.rawWickEntries
        (((Grothe.Upper.phaseStrs.drop 500).take 4).map GrotheKernel.parseTerm)) =
      10141204801825835211973625643008 := by
  cbv

theorem raw_phaseTerms_commonDen :
    GrotheKernel.commonDen
      (Grothe.UpperChaos.Q0RawWickTerms.rawWickEntries
        ((phaseTerms.drop 500).take 4)) = 10141204801825835211973625643008 := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact raw_chunk_commonDen

end Grothe.UpperChaos.Q0ChunkDen_o500_n4
