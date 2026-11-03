import Grothe.UpperChaos.Q0BasePairRoot10Leaf1001Check000

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot10Leaf1001
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem inverseHorner8_mul_checked :
    mulOK inverseTail9.output inverseCertificate.argument inverseproduct8 (72230945310975857704455 / 365375409332725729550921208179070754913983135744) = true := by
  decide +kernel

theorem inverseHorner8_add_checked :
    addOK inverseproduct8 (constant (1 / 1)) inverseresult8 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner8_checked :
    inverseTail8.check inverseCertificate.argument [constant (1 / 1), constant (1 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons inverseCertificate.argument (constant (1 / 1))
    [constant (1 / 1), constant (1 / 1)]
    inverseproduct8 inverseresult8 (72230945310975857704455 / 365375409332725729550921208179070754913983135744) (0 / 1) inverseTail9
    inverseHorner9_checked inverseHorner8_mul_checked inverseHorner8_add_checked

theorem inverseHorner7_mul_checked :
    mulOK inverseTail8.output inverseCertificate.argument inverseproduct7 (34170732239793007772908792999 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem inverseHorner7_add_checked :
    addOK inverseproduct7 (constant (1 / 1)) inverseresult7 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner7_checked :
    inverseTail7.check inverseCertificate.argument [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons inverseCertificate.argument (constant (1 / 1))
    [constant (1 / 1), constant (1 / 1), constant (1 / 1)]
    inverseproduct7 inverseresult7 (34170732239793007772908792999 / 1461501637330902918203684832716283019655932542976) (0 / 1) inverseTail8
    inverseHorner8_checked inverseHorner7_mul_checked inverseHorner7_add_checked

end Grothe.UpperChaos.Q0BasePairRoot10Leaf1001
