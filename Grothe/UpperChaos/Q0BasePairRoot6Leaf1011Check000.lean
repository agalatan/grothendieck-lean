import Grothe.UpperChaos.Q0BasePairRoot6Leaf1011Data

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf1011
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem inverseHorner11_checked :
    inverseTail11.check inverseCertificate.argument [] = true := by
  rfl

theorem inverseHorner10_mul_checked :
    mulOK inverseTail11.output inverseCertificate.argument inverseproduct10 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner10_add_checked :
    addOK inverseproduct10 (constant (1 / 1)) inverseresult10 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner10_checked :
    inverseTail10.check inverseCertificate.argument [constant (1 / 1)] = true := by
  exact Trace.check_cons inverseCertificate.argument (constant (1 / 1))
    []
    inverseproduct10 inverseresult10 (0 / 1) (0 / 1) inverseTail11
    inverseHorner11_checked inverseHorner10_mul_checked inverseHorner10_add_checked

theorem inverseHorner9_mul_checked :
    mulOK inverseTail10.output inverseCertificate.argument inverseproduct9 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner9_add_checked :
    addOK inverseproduct9 (constant (1 / 1)) inverseresult9 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner9_checked :
    inverseTail9.check inverseCertificate.argument [constant (1 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons inverseCertificate.argument (constant (1 / 1))
    [constant (1 / 1)]
    inverseproduct9 inverseresult9 (0 / 1) (0 / 1) inverseTail10
    inverseHorner10_checked inverseHorner9_mul_checked inverseHorner9_add_checked

end Grothe.UpperChaos.Q0BasePairRoot6Leaf1011
