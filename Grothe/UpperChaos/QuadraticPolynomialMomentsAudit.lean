import Grothe.UpperChaos.QuadraticPolynomialMoments
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Strict transitive audit for correlated Gaussian polynomial integration

Agent-ID: codex-2ca4.

The coercivity, genuine joint integrability, finite evaluator and Gaussian
normalization may depend only on the three standard axioms below.
-/

open Lean Elab Command

run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.QuadraticPolynomialIntegrability.quadraticForm_lower_bound,
    ``Grothe.UpperChaos.QuadraticPolynomialIntegrability.integrable_finite_mixed_polynomial,
    ``Grothe.UpperChaos.QuadraticPolynomialMoments.integral_mixed_monomial,
    ``Grothe.UpperChaos.QuadraticPolynomialMoments.integral_finite_mixed_polynomial,
    ``Grothe.UpperChaos.QuadraticPolynomialMoments.momentValue_zero]
  for target in targets do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
