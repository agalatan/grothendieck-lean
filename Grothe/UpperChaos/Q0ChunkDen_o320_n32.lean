import Grothe.UpperChaos.Q0RawWickDefs
import Mathlib.Tactic

/-! Untrusted candidate checked against the actual parsed source by the kernel (`decide +kernel`).
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 320, count 32; no full-denominator claim.
Agent-ID: codex-8c4d (generator), claude-b9ee (kernel-checked form). -/

namespace Grothe.UpperChaos.Q0ChunkDen_o320_n32

set_option maxRecDepth 100000 in
theorem raw_chunk_commonDen :
    GrotheKernel.commonDen
      (Grothe.UpperChaos.Q0RawWickTerms.rawWickEntries
        (((Grothe.Upper.phaseStrs.drop 320).take 32).map GrotheKernel.parseTerm)) =
      1110303469474900427035924920008704000 := by
  decide +kernel

theorem raw_phaseTerms_commonDen :
    GrotheKernel.commonDen
      (Grothe.UpperChaos.Q0RawWickTerms.rawWickEntries
        ((phaseTerms.drop 320).take 32)) = 1110303469474900427035924920008704000 := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact raw_chunk_commonDen

end Grothe.UpperChaos.Q0ChunkDen_o320_n32
