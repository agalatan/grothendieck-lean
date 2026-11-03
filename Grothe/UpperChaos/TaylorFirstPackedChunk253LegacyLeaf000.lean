import Grothe.UpperChaos.TaylorFirstPackedChunk253StructuralLeaf000

/-! The unchanged public parser on the bounded auxiliary leaf.
This does not identify any full public packed array.
Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.TaylorFirstPackedChunk253LegacyLeaf000
open TaylorFirstPackedChunk253StructuralLeaf000
set_option maxRecDepth 65536
set_option maxHeartbeats 2000000

theorem legacy_decoded : PackedDyadic.parse 206 text = some values.toArray := by
  decide +kernel

end Grothe.UpperChaos.TaylorFirstPackedChunk253LegacyLeaf000

open Lean Elab Command
run_cmd do
  for ax in ← Lean.collectAxioms ``Grothe.UpperChaos.TaylorFirstPackedChunk253LegacyLeaf000.legacy_decoded do
    unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
      throwError m!"legacy leaf has forbidden axiom {ax}"
