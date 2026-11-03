import GrotheKernel.PhiCheck
import Grothe.Upper.Data
import Mathlib.Tactic

/-! Untrusted candidate; this equality is checked by the kernel (`decide +kernel`). Source SHA256:
cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Agent-ID: codex-8c4d (generator), claude-b9ee (kernel-checked form). -/

namespace Grothe.UpperChaos.PhiSourceDenChunk_o448_n32

set_option maxRecDepth 100000 in
theorem source_chunk_commonDen :
    GrotheKernel.commonDen
      (((Grothe.Upper.phaseStrs.drop 448).take 32).map GrotheKernel.parseTerm) =
      2168561463818164896554540859392000 := by
  decide +kernel

end Grothe.UpperChaos.PhiSourceDenChunk_o448_n32
