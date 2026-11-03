import Grothe.UpperChaos.Q0BasePairRoot2Leaf0100Check015

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf0100
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem gaussianHorner7_mul_checked :
    mulOK gaussianTail8.output gaussianCertificate.delta gaussianproduct7 (112887925755275224941706034049059631 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem gaussianHorner7_add_checked :
    addOK gaussianproduct7 (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0)) gaussianresult7 0 = true := by
  decide +kernel

theorem gaussianHorner7_checked :
    gaussianTail7.check gaussianCertificate.delta [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0))
    [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)]
    gaussianproduct7 gaussianresult7 (112887925755275224941706034049059631 / 1461501637330902918203684832716283019655932542976) 0 gaussianTail8
    gaussianHorner8_checked gaussianHorner7_mul_checked gaussianHorner7_add_checked

theorem gaussianHorner6_mul_checked :
    mulOK gaussianTail7.output gaussianCertificate.delta gaussianproduct6 (409446421611693155845221328713289189 / 182687704666362864775460604089535377456991567872) = true := by
  decide +kernel

theorem gaussianHorner6_add_checked :
    addOK gaussianproduct6 (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0)) gaussianresult6 0 = true := by
  decide +kernel

theorem gaussianHorner6_checked :
    gaussianTail6.check gaussianCertificate.delta [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0))
    [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)]
    gaussianproduct6 gaussianresult6 (409446421611693155845221328713289189 / 182687704666362864775460604089535377456991567872) 0 gaussianTail7
    gaussianHorner7_checked gaussianHorner6_mul_checked gaussianHorner6_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Leaf0100
