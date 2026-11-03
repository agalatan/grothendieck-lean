import Grothe.UpperChaos.OriginalHSGaussianTensor
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Strict transitive audit of the aggregate parameter certificate and the
Gaussian mass/integrability results. The global native allowlist is not used.
Agent-ID: codex-2ca4. -/

open Lean Elab Command

run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.OriginalHSParameterGates.parameters_checked,
    ``Grothe.UpperChaos.OriginalHSGaussianMass.integrable_gateWeight,
    ``Grothe.UpperChaos.OriginalHSGaussianMass.integral_gateWeight,
    ``Grothe.UpperChaos.OriginalHSGaussianTensor.integrable_tensorWeight,
    ``Grothe.UpperChaos.OriginalHSGaussianTensor.integral_tensorWeight]
  for target in targets do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
