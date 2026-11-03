import Grothe.UpperChaos.Q0BasePairRoot6Leaf0111Check016

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf0111
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem gaussianHorner5_mul_checked :
    mulOK gaussianTail6.output gaussianCertificate.delta gaussianproduct5 (99472901272914517876137699674442235273 / 365375409332725729550921208179070754913983135744) = true := by
  decide +kernel

theorem gaussianHorner5_add_checked :
    addOK gaussianproduct5 (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0)) gaussianresult5 0 = true := by
  decide +kernel

theorem gaussianHorner5_checked :
    gaussianTail5.check gaussianCertificate.delta [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0))
    [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)]
    gaussianproduct5 gaussianresult5 (99472901272914517876137699674442235273 / 365375409332725729550921208179070754913983135744) 0 gaussianTail6
    gaussianHorner6_checked gaussianHorner5_mul_checked gaussianHorner5_add_checked

theorem gaussianHorner4_mul_checked :
    mulOK gaussianTail5.output gaussianCertificate.delta gaussianproduct4 (28754132767972237885046566205964546493451 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem gaussianHorner4_add_checked :
    addOK gaussianproduct4 (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 4 (constant 0)) gaussianresult4 0 = true := by
  decide +kernel

theorem gaussianHorner4_checked :
    gaussianTail4.check gaussianCertificate.delta [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 4 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 4 (constant 0))
    [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)]
    gaussianproduct4 gaussianresult4 (28754132767972237885046566205964546493451 / 1461501637330902918203684832716283019655932542976) 0 gaussianTail5
    gaussianHorner5_checked gaussianHorner4_mul_checked gaussianHorner4_add_checked

end Grothe.UpperChaos.Q0BasePairRoot6Leaf0111
