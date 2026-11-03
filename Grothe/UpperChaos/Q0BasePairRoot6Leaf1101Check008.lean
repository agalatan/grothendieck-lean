import Grothe.UpperChaos.Q0BasePairRoot6Leaf1101Check007

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf1101
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem dampingHorner9_mul_checked :
    mulOK dampingTail10.output dampingCertificate.delta dampingproduct9 (0 / 1) = true := by
  decide +kernel

theorem dampingHorner9_add_checked :
    addOK dampingproduct9 (((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 9 (constant 0)) dampingresult9 0 = true := by
  decide +kernel

theorem dampingHorner9_checked :
    dampingTail9.check dampingCertificate.delta [((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons dampingCertificate.delta (((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 9 (constant 0))
    [((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 10 (constant 0)]
    dampingproduct9 dampingresult9 (0 / 1) 0 dampingTail10
    dampingHorner10_checked dampingHorner9_mul_checked dampingHorner9_add_checked

theorem dampingHorner8_mul_checked :
    mulOK dampingTail9.output dampingCertificate.delta dampingproduct8 (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem dampingHorner8_add_checked :
    addOK dampingproduct8 (((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 8 (constant 0)) dampingresult8 0 = true := by
  decide +kernel

theorem dampingHorner8_checked :
    dampingTail8.check dampingCertificate.delta [((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons dampingCertificate.delta (((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 8 (constant 0))
    [((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 10 (constant 0)]
    dampingproduct8 dampingresult8 (1 / 1461501637330902918203684832716283019655932542976) 0 dampingTail9
    dampingHorner9_checked dampingHorner8_mul_checked dampingHorner8_add_checked

end Grothe.UpperChaos.Q0BasePairRoot6Leaf1101
