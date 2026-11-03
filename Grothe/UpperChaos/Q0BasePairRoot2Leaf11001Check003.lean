import Grothe.UpperChaos.Q0BasePairRoot2Leaf11001Check002

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf11001
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem inverseHorner4_mul_checked :
    mulOK inverseTail5.output inverseCertificate.argument inverseproduct4 (50791999465456805605407026509 / 365375409332725729550921208179070754913983135744) = true := by
  decide +kernel

theorem inverseHorner4_add_checked :
    addOK inverseproduct4 (constant (1 / 1)) inverseresult4 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner4_checked :
    inverseTail4.check inverseCertificate.argument [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons inverseCertificate.argument (constant (1 / 1))
    [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)]
    inverseproduct4 inverseresult4 (50791999465456805605407026509 / 365375409332725729550921208179070754913983135744) (0 / 1) inverseTail5
    inverseHorner5_checked inverseHorner4_mul_checked inverseHorner4_add_checked

theorem inverseHorner3_mul_checked :
    mulOK inverseTail4.output inverseCertificate.argument inverseproduct3 (25395999732728402802703598039 / 182687704666362864775460604089535377456991567872) = true := by
  decide +kernel

theorem inverseHorner3_add_checked :
    addOK inverseproduct3 (constant (1 / 1)) inverseresult3 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner3_checked :
    inverseTail3.check inverseCertificate.argument [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons inverseCertificate.argument (constant (1 / 1))
    [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)]
    inverseproduct3 inverseresult3 (25395999732728402802703598039 / 182687704666362864775460604089535377456991567872) (0 / 1) inverseTail4
    inverseHorner4_checked inverseHorner3_mul_checked inverseHorner3_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Leaf11001
