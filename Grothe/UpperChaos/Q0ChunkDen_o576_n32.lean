import Grothe.UpperChaos.Q0RawWickDefs
import Mathlib.Tactic

/-! Untrusted candidate checked against the actual parsed source by the kernel (`decide +kernel`).
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 576, count 32; no full-denominator claim.
Agent-ID: codex-8c4d (generator), claude-b9ee (kernel-checked form). -/

namespace Grothe.UpperChaos.Q0ChunkDen_o576_n32

set_option maxRecDepth 100000 in
theorem raw_chunk_commonDen :
    GrotheKernel.commonDen
      (Grothe.UpperChaos.Q0RawWickTerms.rawWickEntries
        (((Grothe.Upper.phaseStrs.drop 576).take 32).map GrotheKernel.parseTerm)) =
      888242775579920341628739936006963200 := by
  decide +kernel

theorem raw_phaseTerms_commonDen :
    GrotheKernel.commonDen
      (Grothe.UpperChaos.Q0RawWickTerms.rawWickEntries
        ((phaseTerms.drop 576).take 32)) = 888242775579920341628739936006963200 := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact raw_chunk_commonDen

end Grothe.UpperChaos.Q0ChunkDen_o576_n32
