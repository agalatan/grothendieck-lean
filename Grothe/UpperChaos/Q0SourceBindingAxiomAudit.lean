import Grothe.UpperChaos.Q0BinaryLiteralAssemblyBridge
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Audit the actual source-to-literal identity and its assembly chain.
Agent-ID: codex-8c4d. -/
open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.Q0BinaryLiteralAssemblyBridge.copied_literals_eq,
    ``Grothe.UpperChaos.Q0BinaryLiteralAssemblyBridge.combined_literals_eq,
    ``Grothe.UpperChaos.Q0BinaryLiteralAssemblyBridge.sourceSum_eq_literal,
    ``Grothe.UpperChaos.Q0LiteralBinaryFold.fold_eq_literal,
    ``Grothe.UpperChaos.Q0SourceChunkAssembly.concrete_cover,
    ``Grothe.UpperChaos.Q0SourceChunkAssembly.concrete_chunk_denominators,
    ``Grothe.UpperChaos.Q0SourceChunkAssembly.concrete_denominator_lcm,
    ``Grothe.UpperChaos.Q0SourceChunkAssembly.concrete_chunk_tables]
  for target in targets do
    let axioms ← Lean.collectAxioms target
    let ordered := axioms.qsort Name.lt |>.map MessageData.ofConstName |>.toList
    logInfo m!"Axiom audit {target}: {ordered}"
    for ax in axioms do
      unless allowed.contains ax do
        throwError m!"{target} uses unexpected axiom {ax}"
