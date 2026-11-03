import Grothe.UpperChaos.Q0BasePairRoot2Leaf10011Check005

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf10011
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem inverseField2_checked :
    addOK inverseCertificate.scaled (constant (-1)) inverseCertificate.delta 0 = true := by
  decide +kernel

theorem inverseField3_checked :
    scaleOK (-1) inverseCertificate.delta inverseCertificate.argument inverseCertificate.argumentBudget = true := by
  decide +kernel

theorem inverseField4_checked :
    inverseCertificate.trace.check inverseCertificate.argument ((List.replicate inverseCertificate.terms (1 : ℚ)).map constant) = true := by
  exact inverseHorner0_checked

theorem inverseField5_checked :
    scaleOK (1 / inverseCertificate.center) inverseCertificate.trace.output inverseCertificate.geometric inverseCertificate.geometricBudget = true := by
  decide +kernel

theorem inverseField6_checked :
    inverseCertificate.center⁻¹ * (inverseCertificate.radius^inverseCertificate.terms / (1 - inverseCertificate.radius)) ≤ inverseCertificate.error := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot2Leaf10011
