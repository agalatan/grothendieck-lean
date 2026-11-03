import Grothe.UpperChaos.Q0BasePairRoot2Leaf1110Check001

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf1110
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem inverseHorner6_mul_checked :
    mulOK inverseTail7.output inverseCertificate.argument inverseproduct6 (295096429721768348279829169261 / 365375409332725729550921208179070754913983135744) = true := by
  decide +kernel

theorem inverseHorner6_add_checked :
    addOK inverseproduct6 (constant (1 / 1)) inverseresult6 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner6_checked :
    inverseTail6.check inverseCertificate.argument [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons inverseCertificate.argument (constant (1 / 1))
    [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)]
    inverseproduct6 inverseresult6 (295096429721768348279829169261 / 365375409332725729550921208179070754913983135744) (0 / 1) inverseTail7
    inverseHorner7_checked inverseHorner6_mul_checked inverseHorner6_add_checked

theorem inverseHorner5_mul_checked :
    mulOK inverseTail6.output inverseCertificate.argument inverseproduct5 (1180380187123388684157634827539 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem inverseHorner5_add_checked :
    addOK inverseproduct5 (constant (1 / 1)) inverseresult5 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner5_checked :
    inverseTail5.check inverseCertificate.argument [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons inverseCertificate.argument (constant (1 / 1))
    [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)]
    inverseproduct5 inverseresult5 (1180380187123388684157634827539 / 1461501637330902918203684832716283019655932542976) (0 / 1) inverseTail6
    inverseHorner6_checked inverseHorner5_mul_checked inverseHorner5_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Leaf1110
