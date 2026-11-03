import Grothe.UpperChaos.LinearTiltedMoments
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Strict transitive axiom audit for linearly tilted Gaussian moments

Agent-ID: codex-2ca4.

The translation, finite moment formulas, and polynomial integrability results
may depend only on `propext`, `Classical.choice`, and `Quot.sound`.
-/

open Lean Elab Command

run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.LinearTiltedMoments.complete_square,
    ``Grothe.UpperChaos.LinearTiltedMoments.integrable_finite_mixed_polynomial,
    ``Grothe.UpperChaos.LinearTiltedMoments.integrable_mixed_moment,
    ``Grothe.UpperChaos.LinearTiltedMoments.integral_finite_mixed_polynomial,
    ``Grothe.UpperChaos.LinearTiltedMoments.integral_linear_tilt,
    ``Grothe.UpperChaos.LinearTiltedMoments.integral_mixed_moment,
    ``Grothe.UpperChaos.LinearTiltedMoments.linear_tilt_le_half_rate]
  for target in targets do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
