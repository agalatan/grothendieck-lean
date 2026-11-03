import Grothe.UpperChaos.Q0BasePairRoot2Leaf11001Check000

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf11001
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem inverseHorner8_mul_checked :
    mulOK inverseTail9.output inverseCertificate.argument inverseproduct8 (152232506940243991476953562069 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem inverseHorner8_add_checked :
    addOK inverseproduct8 (constant (1 / 1)) inverseresult8 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner8_checked :
    inverseTail8.check inverseCertificate.argument [constant (1 / 1), constant (1 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons inverseCertificate.argument (constant (1 / 1))
    [constant (1 / 1), constant (1 / 1)]
    inverseproduct8 inverseresult8 (152232506940243991476953562069 / 730750818665451459101842416358141509827966271488) (0 / 1) inverseTail9
    inverseHorner9_checked inverseHorner8_mul_checked inverseHorner8_add_checked

theorem inverseHorner7_mul_checked :
    mulOK inverseTail8.output inverseCertificate.argument inverseproduct7 (50439779008361172577011984443 / 365375409332725729550921208179070754913983135744) = true := by
  decide +kernel

theorem inverseHorner7_add_checked :
    addOK inverseproduct7 (constant (1 / 1)) inverseresult7 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner7_checked :
    inverseTail7.check inverseCertificate.argument [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons inverseCertificate.argument (constant (1 / 1))
    [constant (1 / 1), constant (1 / 1), constant (1 / 1)]
    inverseproduct7 inverseresult7 (50439779008361172577011984443 / 365375409332725729550921208179070754913983135744) (0 / 1) inverseTail8
    inverseHorner8_checked inverseHorner7_mul_checked inverseHorner7_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Leaf11001
