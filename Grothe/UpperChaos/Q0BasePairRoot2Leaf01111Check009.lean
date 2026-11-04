import Grothe.UpperChaos.Q0BasePairRoot2Leaf01111Check008

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf01111
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem dampingHorner7_mul_checked :
    mulOK dampingTail8.output dampingCertificate.delta dampingproduct7 (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem dampingHorner7_add_checked :
    addOK dampingproduct7 (((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 7 (constant 0)) dampingresult7 0 = true := by
  decide +kernel

theorem dampingHorner7_checked :
    dampingTail7.check dampingCertificate.delta [((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons dampingCertificate.delta (((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 7 (constant 0))
    [((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 10 (constant 0)]
    dampingproduct7 dampingresult7 (1 / 1461501637330902918203684832716283019655932542976) 0 dampingTail8
    dampingHorner8_checked dampingHorner7_mul_checked dampingHorner7_add_checked

theorem dampingHorner6_mul_checked :
    mulOK dampingTail7.output dampingCertificate.delta dampingproduct6 (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem dampingHorner6_add_checked :
    addOK dampingproduct6 (((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 6 (constant 0)) dampingresult6 0 = true := by
  decide +kernel

theorem dampingHorner6_checked :
    dampingTail6.check dampingCertificate.delta [((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons dampingCertificate.delta (((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 6 (constant 0))
    [((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 10 (constant 0)]
    dampingproduct6 dampingresult6 (1 / 1461501637330902918203684832716283019655932542976) 0 dampingTail7
    dampingHorner7_checked dampingHorner6_mul_checked dampingHorner6_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Leaf01111
