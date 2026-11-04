import Grothe.UpperChaos.Q0BasePairRoot10Leaf111Check015

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot10Leaf111
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem gaussianHorner7_mul_checked :
    mulOK gaussianTail8.output gaussianCertificate.delta gaussianproduct7 (710888863160478459449008934437426203 / 5708990770823839524233143877797980545530986496) = true := by
  decide +kernel

theorem gaussianHorner7_add_checked :
    addOK gaussianproduct7 (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0)) gaussianresult7 0 = true := by
  decide +kernel

theorem gaussianHorner7_checked :
    gaussianTail7.check gaussianCertificate.delta [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0))
    [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)]
    gaussianproduct7 gaussianresult7 (710888863160478459449008934437426203 / 5708990770823839524233143877797980545530986496) 0 gaussianTail8
    gaussianHorner8_checked gaussianHorner7_mul_checked gaussianHorner7_add_checked

theorem gaussianHorner6_mul_checked :
    mulOK gaussianTail7.output gaussianCertificate.delta gaussianproduct6 (49038657983365667298037360508533247483757 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem gaussianHorner6_add_checked :
    addOK gaussianproduct6 (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0)) gaussianresult6 0 = true := by
  decide +kernel

theorem gaussianHorner6_checked :
    gaussianTail6.check gaussianCertificate.delta [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0))
    [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)]
    gaussianproduct6 gaussianresult6 (49038657983365667298037360508533247483757 / 1461501637330902918203684832716283019655932542976) 0 gaussianTail7
    gaussianHorner7_checked gaussianHorner6_mul_checked gaussianHorner6_add_checked

end Grothe.UpperChaos.Q0BasePairRoot10Leaf111
