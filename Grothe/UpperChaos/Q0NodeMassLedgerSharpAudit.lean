import Grothe.UpperChaos.Q0NodeMassLedgerSharp
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Strict audit of the tighter rational ledger. Agent-ID: codex-aa04. -/
open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.Q0NodeMassLedgerSharp.mass_cap_lt_norm_sq,
    ``Grothe.UpperChaos.Q0NodeMassLedgerSharp.sqrt_mass_lt_norm,
    ``Grothe.UpperChaos.Q0NodeMassLedgerSharp.rawUpper_lt_cap,
    ``Grothe.UpperChaos.Q0NodeMassLedgerSharp.rawUpper_add_smoothing_lt_cap,
    ``Grothe.UpperChaos.Q0NodeMassLedgerSharp.real_error_lt_cap]
  for target in targets do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Sharp node ledger audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
