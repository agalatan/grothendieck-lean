import Grothe.UpperChaos.Q0BasePairRoot6Leaf0001Check011

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf0001
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem dampingHorner1_mul_checked :
    mulOK dampingTail2.output dampingCertificate.delta dampingproduct1 (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem dampingHorner1_add_checked :
    addOK dampingproduct1 (((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 1 (constant 0)) dampingresult1 0 = true := by
  decide +kernel

theorem dampingHorner1_checked :
    dampingTail1.check dampingCertificate.delta [((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 1 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 2 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 3 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 4 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons dampingCertificate.delta (((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 1 (constant 0))
    [((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 2 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 3 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 4 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 10 (constant 0)]
    dampingproduct1 dampingresult1 (1 / 1461501637330902918203684832716283019655932542976) 0 dampingTail2
    dampingHorner2_checked dampingHorner1_mul_checked dampingHorner1_add_checked

theorem dampingHorner0_mul_checked :
    mulOK dampingTail1.output dampingCertificate.delta dampingproduct0 (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem dampingHorner0_add_checked :
    addOK dampingproduct0 (((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 0 (constant 0)) dampingresult0 0 = true := by
  decide +kernel

theorem dampingHorner0_checked :
    dampingTail0.check dampingCertificate.delta [((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 0 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 1 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 2 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 3 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 4 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons dampingCertificate.delta (((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 0 (constant 0))
    [((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 1 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 2 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 3 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 4 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients dampingCertificate.degree).map constant).getD 10 (constant 0)]
    dampingproduct0 dampingresult0 (1 / 1461501637330902918203684832716283019655932542976) 0 dampingTail1
    dampingHorner1_checked dampingHorner0_mul_checked dampingHorner0_add_checked

end Grothe.UpperChaos.Q0BasePairRoot6Leaf0001
