import Grothe.UpperChaos.IndependentSourcePolynomial
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Strict transitive audit for independent-source Gaussian polynomial integration

Agent-ID: codex-2ca4.

The uniform majorant, absolute integrability, both complex source derivatives,
Gaussian normalization and finite polynomial evaluator may depend only on the
three standard axioms below.
-/

open Lean Elab Command

run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.IndependentSourceMoments.norm_integrand_le_envelope,
    ``Grothe.UpperChaos.IndependentSourceMoments.integrable_integrand,
    ``Grothe.UpperChaos.IndependentSourceMoments.hasDerivAt_integral_a,
    ``Grothe.UpperChaos.IndependentSourceMoments.hasDerivAt_integral_b,
    ``Grothe.UpperChaos.IndependentSourceMoments.integral_zero,
    ``Grothe.UpperChaos.IndependentSourcePolynomial.integral_eq_polynomial,
    ``Grothe.UpperChaos.IndependentSourcePolynomial.integral_finite_polynomial,
    ``Grothe.UpperChaos.IndependentSourcePolynomial.integral_finite_mixed_polynomial]
  for target in targets do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
