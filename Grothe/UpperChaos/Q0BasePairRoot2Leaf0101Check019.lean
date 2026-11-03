import Grothe.UpperChaos.Q0BasePairRoot2Leaf0101Check018

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf0101
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem gaussianHorner1_mul_checked :
    mulOK gaussianTail2.output gaussianCertificate.delta gaussianproduct1 (300657759779659016403642572234271426258099 / 182687704666362864775460604089535377456991567872) = true := by
  decide +kernel

theorem gaussianHorner1_add_checked :
    addOK gaussianproduct1 (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 1 (constant 0)) gaussianresult1 0 = true := by
  decide +kernel

theorem gaussianHorner1_checked :
    gaussianTail1.check gaussianCertificate.delta [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 1 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 2 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 3 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 4 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 1 (constant 0))
    [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 2 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 3 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 4 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)]
    gaussianproduct1 gaussianresult1 (300657759779659016403642572234271426258099 / 182687704666362864775460604089535377456991567872) 0 gaussianTail2
    gaussianHorner2_checked gaussianHorner1_mul_checked gaussianHorner1_add_checked

theorem gaussianHorner0_mul_checked :
    mulOK gaussianTail1.output gaussianCertificate.delta gaussianproduct0 (5271612428242201389272366847097369767434497 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem gaussianHorner0_add_checked :
    addOK gaussianproduct0 (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 0 (constant 0)) gaussianresult0 0 = true := by
  decide +kernel

theorem gaussianHorner0_checked :
    gaussianTail0.check gaussianCertificate.delta [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 0 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 1 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 2 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 3 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 4 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 0 (constant 0))
    [((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 1 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 2 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 3 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 4 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 5 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 6 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 7 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 8 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 9 (constant 0), ((ExponentialHorner.coefficients gaussianCertificate.degree).map constant).getD 10 (constant 0)]
    gaussianproduct0 gaussianresult0 (5271612428242201389272366847097369767434497 / 1461501637330902918203684832716283019655932542976) 0 gaussianTail1
    gaussianHorner1_checked gaussianHorner0_mul_checked gaussianHorner0_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Leaf0101
