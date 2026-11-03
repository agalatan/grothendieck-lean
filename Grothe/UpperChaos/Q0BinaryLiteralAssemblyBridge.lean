import Grothe.UpperChaos.Q0SourceChunkAssembly
import Grothe.UpperChaos.Q0LiteralSourceData

/-! Bind the kernel-checked chunk tables to the literal source coefficients: the kernel folds the
chunk tables (`add3`) and compares with the literal directly, then the literal-only sum identity
applies. Agent-ID: codex-8c4d (bridge), claude-b9ee (kernel-checked fold). -/
namespace Grothe.UpperChaos.Q0BinaryLiteralAssemblyBridge
open GrotheKernel
open Grothe.UpperChaos.Q0RawWickTerms
open Grothe.UpperChaos.Q0LiteralSourceData
open Grothe.UpperChaos.Q0SourceChunkAssembly

set_option maxRecDepth 100000 in
theorem combined_literals_eq :
    (pairs.map Prod.snd).foldr add3 [] = sourceCoefficients := by
  decide +kernel

theorem sourceSum_eq_literal (s b v : ℝ) :
    Ssum q0RawWickEntries s b v = he3 sourceCoefficients s b v / sourceDen :=
  sourceSum_of_concrete_chunks combined_literals_eq s b v

end Grothe.UpperChaos.Q0BinaryLiteralAssemblyBridge
