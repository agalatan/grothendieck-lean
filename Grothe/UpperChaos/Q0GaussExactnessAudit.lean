import Grothe.UpperChaos.Q0GaussExactness
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Exact quadrature algebra dependency audit. Agent-ID: codex-2ca4. -/
open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[``Grothe.UpperChaos.Q0GaussExactness.integralPoly_eq_moment_sum,
    ``Grothe.UpperChaos.Q0GaussExactness.integralPoly_divByMonic,
    ``Grothe.UpperChaos.Q0GaussExactness.cardinal_eq_lagrange,
    ``Grothe.UpperChaos.Q0GaussExactness.integralPoly_cardinal_weight,
    ``Grothe.UpperChaos.Q0GaussExactness.exactness_of_cardinal_integrals,
    ``Grothe.UpperChaos.Q0GaussExactness.actual_recurrence_gauss_exactness]
  for target in targets do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Gauss exactness audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
