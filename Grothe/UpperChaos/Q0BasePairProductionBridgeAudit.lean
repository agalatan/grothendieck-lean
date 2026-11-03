import Grothe.UpperChaos.Q0BasePairProductionBridge
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Strict axiom audit for the actual j0 production bridge. Agent-ID: codex-aa04. -/
open Lean Elab Command

run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.Q0BasePairProductionBridge.direct_pair,
    ``Grothe.UpperChaos.Q0BasePairProductionBridge.reciprocal_pair,
    ``Grothe.UpperChaos.Q0BasePairProductionBridge.direct_integral_pair,
    ``Grothe.UpperChaos.Q0BasePairProductionBridge.reciprocal_integral_pair]
  for target in targets do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Production bridge audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
