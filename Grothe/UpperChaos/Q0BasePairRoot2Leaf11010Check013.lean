import Grothe.UpperChaos.Q0BasePairRoot2Leaf11010Check012

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf11010
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem dampingField0_checked :
    addOK dampingArgumentModel (constant (-dampingCertificate.center)) dampingCertificate.delta dampingCertificate.deltaBudget = true := by
  decide +kernel

theorem dampingField1_checked :
    dampingCertificate.trace.check dampingCertificate.delta ((ExponentialHorner.coefficients dampingCertificate.degree).map constant) = true := by
  exact dampingHorner0_checked

theorem dampingField2_checked :
    scaleOK (1 / (dampingCertificate.degree.factorial : ℚ)) dampingCertificate.trace.output dampingCertificate.series dampingCertificate.seriesBudget = true := by
  decide +kernel

theorem dampingField3_checked :
    LeanCert.Engine.TaylorModel.expRemainderBound (range dampingCertificate.delta) dampingCertificate.degree ≤ dampingCertificate.error := by
  decide +kernel

theorem dampingField4_checked :
    roundOK dampingCertificate.series.coefficients
      (IntervalRat.add dampingCertificate.series.remainder (errorInterval dampingCertificate.error dampingCertificate.error_nonneg))
      dampingCertificate.centered 0 = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot2Leaf11010
