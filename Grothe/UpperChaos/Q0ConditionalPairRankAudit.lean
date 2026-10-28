import Grothe.UpperChaos.Q0ConditionalPairRankAll
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Strict transitive audit of the original finite pair-rank table.
Agent-ID: codex-aa04. -/
open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0ConditionalPairRankAll.checked,
      ``Grothe.UpperChaos.Q0ConditionalPairRankAll.indices,
      ``Grothe.UpperChaos.Q0ConditionalPairRankAll.unique_row,
      ``Grothe.UpperChaos.Q0ConditionalPairRankAll.rowAt_spec,
      ``Grothe.UpperChaos.Q0ConditionalPairRankAll.rowAt_rank,
      ``Grothe.UpperChaos.Q0ConditionalPairRankAll.pair_unique] do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Conditional pair-rank audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
