import Grothe.UpperChaos.Q0BasePairRoot10Leaf1000Check016

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot10Leaf1000
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem gaussianHorner5_mul_checked :
    mulOK gaussianTail6.output gaussianCertificate.delta gaussianproduct5 (1747114925783208304002955787188831385105 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem gaussianHorner5_add_checked :
    addOK gaussianproduct5 (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0)) gaussianresult5 0 = true := by
  decide +kernel

theorem gaussianHorner5_checked :
    gaussianTail5.check gaussianCertificate.delta [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0))
    [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)]
    gaussianproduct5 gaussianresult5 (1747114925783208304002955787188831385105 / 730750818665451459101842416358141509827966271488) 0 gaussianTail6
    gaussianHorner6_checked gaussianHorner5_mul_checked gaussianHorner5_add_checked

theorem gaussianHorner4_mul_checked :
    mulOK gaussianTail5.output gaussianCertificate.delta gaussianproduct4 (201909041509578917121748599897291602556079 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem gaussianHorner4_add_checked :
    addOK gaussianproduct4 (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 4 (constant 0)) gaussianresult4 0 = true := by
  decide +kernel

theorem gaussianHorner4_checked :
    gaussianTail4.check gaussianCertificate.delta [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 4 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 4 (constant 0))
    [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)]
    gaussianproduct4 gaussianresult4 (201909041509578917121748599897291602556079 / 1461501637330902918203684832716283019655932542976) 0 gaussianTail5
    gaussianHorner5_checked gaussianHorner4_mul_checked gaussianHorner4_add_checked

end Grothe.UpperChaos.Q0BasePairRoot10Leaf1000
