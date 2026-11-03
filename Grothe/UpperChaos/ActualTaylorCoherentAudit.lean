import Grothe.UpperChaos.ActualTaylorCoherent
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Strict transitive audit for the actual Taylor coherent transform

Agent-ID: codex-2ca4.

The production multiplier identification, absolute integrability and finite
coherent-transform evaluations may depend only on the three standard axioms.
-/

open Lean Elab Command

run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.ActualTaylorCoherent.taylorPhasePower_eq_polynomial,
    ``Grothe.UpperChaos.ActualTaylorCoherent.integrable_coherentIntegrand,
    ``Grothe.UpperChaos.ActualTaylorCoherent.integral_coherentIntegrand_eq_moments,
    ``Grothe.UpperChaos.ActualTaylorCoherent.integral_coherentIntegrand]
  for target in targets do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
