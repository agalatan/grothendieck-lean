import Grothe.UpperChaos.Q0BasePairRoot6Leaf0001Check015

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf0001
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem gaussianHorner7_mul_checked :
    mulOK gaussianTail8.output gaussianCertificate.delta gaussianproduct7 (542900098006159479940011068016377 / 365375409332725729550921208179070754913983135744) = true := by
  decide +kernel

theorem gaussianHorner7_add_checked :
    addOK gaussianproduct7 (constant (720 / 1)) gaussianresult7 (0 / 1) = true := by
  decide +kernel

theorem gaussianHorner7_checked :
    gaussianTail7.check gaussianCertificate.delta [constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (constant (720 / 1))
    [constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    gaussianproduct7 gaussianresult7 (542900098006159479940011068016377 / 365375409332725729550921208179070754913983135744) (0 / 1) gaussianTail8
    gaussianHorner8_checked gaussianHorner7_mul_checked gaussianHorner7_add_checked

theorem gaussianHorner6_mul_checked :
    mulOK gaussianTail7.output gaussianCertificate.delta gaussianproduct6 (12711480637514534332492433285463071 / 22835963083295358096932575511191922182123945984) = true := by
  decide +kernel

theorem gaussianHorner6_add_checked :
    addOK gaussianproduct6 (constant (5040 / 1)) gaussianresult6 (0 / 1) = true := by
  decide +kernel

theorem gaussianHorner6_checked :
    gaussianTail6.check gaussianCertificate.delta [constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (constant (5040 / 1))
    [constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    gaussianproduct6 gaussianresult6 (12711480637514534332492433285463071 / 22835963083295358096932575511191922182123945984) (0 / 1) gaussianTail7
    gaussianHorner7_checked gaussianHorner6_mul_checked gaussianHorner6_add_checked

end Grothe.UpperChaos.Q0BasePairRoot6Leaf0001
