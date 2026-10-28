import Grothe.UpperChaos.AnalyticEnvelopeCell179
import Grothe.UpperChaos.AnalyticEnvelopeCell180
import Grothe.UpperChaos.AnalyticEnvelopeCell181
import Grothe.UpperChaos.AnalyticEnvelopeCell182
import Grothe.UpperChaos.Q0BasePairRoot2Integral
import Grothe.UpperChaos.Q0BasePairRoot6Integral
import Grothe.UpperChaos.Q0BasePairRoot7Integral
import Grothe.UpperChaos.Q0BasePairRoot10Integral
import Grothe.UpperChaos.Q0BasePairRoot11Integral
import Grothe.UpperChaos.Q0BasePairProductionRoots
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Strict transitive audit of the explicit base-pair integrals

The four terminal imports include every analytic-envelope cell through the
four bounded build lanes. This audit requires every cell theorem and each
complete-root theorem to exist and rejects any nonstandard axiom dependency.
It is a compilation guard, not a proof of the remaining upper-bound inputs.

Agent-ID: codex-2ca4
-/

open Lean Elab Command

run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let mut targets : Array Name := #[
    ``Grothe.UpperChaos.Q0BasePairRoot2Integral.fixed_root_integrals_mem,
    ``Grothe.UpperChaos.Q0BasePairRoot6Integral.fixed_root_integrals_mem,
    ``Grothe.UpperChaos.Q0BasePairRoot7Integral.fixed_root_integrals_mem,
    ``Grothe.UpperChaos.Q0BasePairRoot10Integral.fixed_root_integrals_mem,
    ``Grothe.UpperChaos.Q0BasePairRoot11Integral.integrals_mem,
    ``Grothe.UpperChaos.Q0BasePairProductionRoots.root2_integrals_mem,
    ``Grothe.UpperChaos.Q0BasePairProductionRoots.root6_integrals_mem,
    ``Grothe.UpperChaos.Q0BasePairProductionRoots.root7_integrals_mem,
    ``Grothe.UpperChaos.Q0BasePairProductionRoots.root10_integrals_mem,
    ``Grothe.UpperChaos.Q0BasePairProductionRoots.root11_integrals_mem]
  for i in List.range 183 do
    let digits := if i < 10 then "00" ++ toString i
      else if i < 100 then "0" ++ toString i else toString i
    targets := targets.push
      (Name.str (Name.str `Grothe.UpperChaos ("AnalyticEnvelopeCell" ++ digits))
        "integrals_mem")
  for target in targets do
    unless (← getEnv).contains target do
      throwError m!"Missing integral theorem {target}"
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
