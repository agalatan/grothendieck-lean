import Grothe.UpperChaos.Q0BasePairRoot6Leaf1001Check014

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf1001
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem gaussianHorner9_mul_checked :
    mulOK gaussianTail10.output gaussianCertificate.delta gaussianproduct9 (0 / 1) = true := by
  decide +kernel

theorem gaussianHorner9_add_checked :
    addOK gaussianproduct9 (constant (10 / 1)) gaussianresult9 (0 / 1) = true := by
  decide +kernel

theorem gaussianHorner9_checked :
    gaussianTail9.check gaussianCertificate.delta [constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (constant (10 / 1))
    [constant (1 / 1)]
    gaussianproduct9 gaussianresult9 (0 / 1) (0 / 1) gaussianTail10
    gaussianHorner10_checked gaussianHorner9_mul_checked gaussianHorner9_add_checked

theorem gaussianHorner8_mul_checked :
    mulOK gaussianTail9.output gaussianCertificate.delta gaussianproduct8 (127246027187794399274222474583803 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem gaussianHorner8_add_checked :
    addOK gaussianproduct8 (constant (90 / 1)) gaussianresult8 (0 / 1) = true := by
  decide +kernel

theorem gaussianHorner8_checked :
    gaussianTail8.check gaussianCertificate.delta [constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (constant (90 / 1))
    [constant (10 / 1), constant (1 / 1)]
    gaussianproduct8 gaussianresult8 (127246027187794399274222474583803 / 730750818665451459101842416358141509827966271488) (0 / 1) gaussianTail9
    gaussianHorner9_checked gaussianHorner8_mul_checked gaussianHorner8_add_checked

end Grothe.UpperChaos.Q0BasePairRoot6Leaf1001
