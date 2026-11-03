import Grothe.UpperChaos.Q0BasePairRoot2Leaf10111Check019

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf10111
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem gaussianField0_checked :
    addOK gaussianArgumentModel (constant (-gaussianCertificate.center)) gaussianCertificate.delta gaussianCertificate.deltaBudget = true := by
  decide +kernel

theorem gaussianField1_checked :
    gaussianCertificate.trace.check gaussianCertificate.delta ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant) = true := by
  exact gaussianHorner0_checked

theorem gaussianField2_checked :
    scaleOK (1 / (gaussianCertificate.degree.factorial : ℚ)) gaussianCertificate.trace.output gaussianCertificate.series gaussianCertificate.seriesBudget = true := by
  decide +kernel

theorem gaussianField3_checked :
    LeanCert.Engine.TaylorModel.expRemainderBound (range gaussianCertificate.delta) gaussianCertificate.degree ≤ gaussianCertificate.error := by
  decide +kernel

theorem gaussianField4_checked :
    roundOK gaussianCertificate.series.coefficients
      (IntervalRat.add gaussianCertificate.series.remainder (errorInterval gaussianCertificate.error gaussianCertificate.error_nonneg))
      gaussianCertificate.centered 0 = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot2Leaf10111
