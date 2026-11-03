import Grothe.UpperChaos.Q0RawWickDefs
import Mathlib.Tactic

/-! Untrusted candidate checked against the actual parsed source by the kernel (`decide +kernel`).
Source Data.lean SHA256: cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Offset 1120, count 20; no full-denominator claim.
Agent-ID: codex-8c4d (generator), claude-b9ee (kernel-checked form). -/

namespace Grothe.UpperChaos.Q0ChunkDen_o1120_n20

set_option maxRecDepth 100000 in
theorem raw_chunk_commonDen :
    GrotheKernel.commonDen
      (Grothe.UpperChaos.Q0RawWickTerms.rawWickEntries
        (((Grothe.Upper.phaseStrs.drop 1120).take 20).map GrotheKernel.parseTerm)) =
      4608193110613600405178399326208000 := by
  decide +kernel

theorem raw_phaseTerms_commonDen :
    GrotheKernel.commonDen
      (Grothe.UpperChaos.Q0RawWickTerms.rawWickEntries
        ((phaseTerms.drop 1120).take 20)) = 4608193110613600405178399326208000 := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact raw_chunk_commonDen

end Grothe.UpperChaos.Q0ChunkDen_o1120_n20
