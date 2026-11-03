import Grothe.UpperChaos.Q0BasePairRoot6Leaf1011Check017

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf1011
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem gaussianHorner3_mul_checked :
    mulOK gaussianTail4.output gaussianCertificate.delta gaussianproduct3 (9752602476036213287150582281398355713017615 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem gaussianHorner3_add_checked :
    addOK gaussianproduct3 (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 3 (constant 0)) gaussianresult3 0 = true := by
  decide +kernel

theorem gaussianHorner3_checked :
    gaussianTail3.check gaussianCertificate.delta [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 3 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 4 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 3 (constant 0))
    [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 4 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)]
    gaussianproduct3 gaussianresult3 (9752602476036213287150582281398355713017615 / 1461501637330902918203684832716283019655932542976) 0 gaussianTail4
    gaussianHorner4_checked gaussianHorner3_mul_checked gaussianHorner3_add_checked

theorem gaussianHorner2_mul_checked :
    mulOK gaussianTail3.output gaussianCertificate.delta gaussianproduct2 (472536030942176515842303678588834098836611401 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem gaussianHorner2_add_checked :
    addOK gaussianproduct2 (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 2 (constant 0)) gaussianresult2 0 = true := by
  decide +kernel

theorem gaussianHorner2_checked :
    gaussianTail2.check gaussianCertificate.delta [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 2 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 3 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 4 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 2 (constant 0))
    [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 3 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 4 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)]
    gaussianproduct2 gaussianresult2 (472536030942176515842303678588834098836611401 / 1461501637330902918203684832716283019655932542976) 0 gaussianTail3
    gaussianHorner3_checked gaussianHorner2_mul_checked gaussianHorner2_add_checked

end Grothe.UpperChaos.Q0BasePairRoot6Leaf1011
