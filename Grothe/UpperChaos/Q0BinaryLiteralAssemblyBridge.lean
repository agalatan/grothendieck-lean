import Grothe.UpperChaos.Q0SourceChunkAssembly
import Grothe.UpperChaos.Q0LiteralBinaryFold

/-! Bind the independently checked groups to the actual source-derived
chunk tables, then use the literal-only batch proof. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.Q0BinaryLiteralAssemblyBridge
open GrotheKernel
open Grothe.UpperChaos.Q0RawWickTerms
open Grothe.UpperChaos.Q0LiteralSourceData
open Grothe.UpperChaos.Q0SourceChunkAssembly

set_option maxRecDepth 65536 in
set_option maxHeartbeats 16000000 in
theorem copied_literals_eq :
    pairs.map Prod.snd = Grothe.UpperChaos.Q0LiteralBinaryFold.groups.flatten := by
  rfl

theorem combined_literals_eq :
    (pairs.map Prod.snd).foldr add3 [] = sourceCoefficients := by
  rw [copied_literals_eq]
  exact Grothe.UpperChaos.Q0LiteralBinaryFold.fold_eq_literal

theorem sourceSum_eq_literal (s b v : ℝ) :
    Ssum q0RawWickEntries s b v = he3 sourceCoefficients s b v / sourceDen :=
  sourceSum_of_concrete_chunks combined_literals_eq s b v

end Grothe.UpperChaos.Q0BinaryLiteralAssemblyBridge
