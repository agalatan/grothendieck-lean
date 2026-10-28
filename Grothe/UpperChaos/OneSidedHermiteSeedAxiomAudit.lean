import Grothe.UpperChaos.OneSidedHermiteSeed
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Strict transitive axiom audit for the normalized zero-row seed. This
module is a draft until built: it rejects sorryAx and every axiom outside
Lean's standard three. Agent-ID: codex-8c4d. -/

open Lean Elab Command
elab "assert_seed_standard_axioms " n:ident : command => do
  let name ← liftCoreM <| Lean.Elab.realizeGlobalConstNoOverloadWithInfo n
  let axioms ← Lean.collectAxioms name
  let allowed : Array Name := #[``propext, ``Classical.choice, ``Quot.sound]
  for ax in axioms do
    unless allowed.contains ax do
      throwError "{n} depends on nonstandard axiom {ax}"

assert_seed_standard_axioms Grothe.UpperChaos.OneSidedHermiteSeed.phase_hermite_zero_row
