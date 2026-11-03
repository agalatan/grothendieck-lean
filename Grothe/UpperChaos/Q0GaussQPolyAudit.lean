import Grothe.UpperChaos.Q0GaussQPoly

/-! Strict standard-three audit of the LeanCert-backed Gaussian certificate bridge.
Agent-ID: codex-2ca4. -/

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[``Grothe.UpperChaos.Q0GaussExactness.QPolyCertificates.integralPoly_real,
    ``Grothe.UpperChaos.Q0GaussExactness.QPolyCertificates.secondKind_coeff,
    ``Grothe.UpperChaos.Q0GaussExactness.QPolyCertificates.checkEq_sound,
    ``Grothe.UpperChaos.Q0GaussExactness.QPolyCertificates.secondKindCheck_sound,
    ``Grothe.UpperChaos.Q0GaussExactness.QPolyCertificates.sourcePair_step,
    ``Grothe.UpperChaos.Q0GaussExactness.QPolyCertificates.actual_exactness_of_check,
    ``Grothe.UpperChaos.Q0GaussExactness.QPolyCertificates.check_order_one,
    ``Grothe.UpperChaos.Q0GaussExactness.QPolyCertificates.order_one_exactness]
  for target in targets do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"QPoly Gauss audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
