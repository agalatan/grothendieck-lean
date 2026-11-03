import Grothe.UpperChaos.Q0SourceExceptionCentersAll
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Strict trust audit for the complete exceptional-row certificate.
This checks the dependency set, not the separate Gaussian enclosures.
Agent-ID: codex-aa04. -/
open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0SourceExceptionCentersAll.all_valid,
      ``Grothe.UpperChaos.Q0SourceExceptionCentersAll.ordinals,
      ``Grothe.UpperChaos.Q0SourceExceptionCentersAll.each_scalar,
      ``Grothe.UpperChaos.Q0SourceExceptionCenters.validRow_normSq_real] do
    let dependencies ← Lean.collectAxioms target
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
