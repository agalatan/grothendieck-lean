import GrotheKernel.PhiCheck
import Grothe.Upper.Data
import Mathlib.Tactic

/-! Untrusted candidate; this equality must be checked by Lean. Source SHA256:
cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.PhiSourceDenChunk_o904_n8

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem source_chunk_commonDen :
    GrotheKernel.commonDen
      (((Grothe.Upper.phaseStrs.drop 904).take 8).map GrotheKernel.parseTerm) =
      194108998159947627104182678323200 := by
  cbv

end Grothe.UpperChaos.PhiSourceDenChunk_o904_n8
