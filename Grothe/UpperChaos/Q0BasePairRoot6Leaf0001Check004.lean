import Grothe.UpperChaos.Q0BasePairRoot6Leaf0001Check003

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf0001
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem inverseHorner2_mul_checked :
    mulOK inverseTail3.output inverseCertificate.argument inverseproduct2 (497974531548070340845067339 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem inverseHorner2_add_checked :
    addOK inverseproduct2 (constant (1 / 1)) inverseresult2 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner2_checked :
    inverseTail2.check inverseCertificate.argument [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons inverseCertificate.argument (constant (1 / 1))
    [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)]
    inverseproduct2 inverseresult2 (497974531548070340845067339 / 1461501637330902918203684832716283019655932542976) (0 / 1) inverseTail3
    inverseHorner3_checked inverseHorner2_mul_checked inverseHorner2_add_checked

theorem inverseHorner1_mul_checked :
    mulOK inverseTail2.output inverseCertificate.argument inverseproduct1 (497974531548070340845067339 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem inverseHorner1_add_checked :
    addOK inverseproduct1 (constant (1 / 1)) inverseresult1 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner1_checked :
    inverseTail1.check inverseCertificate.argument [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons inverseCertificate.argument (constant (1 / 1))
    [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)]
    inverseproduct1 inverseresult1 (497974531548070340845067339 / 1461501637330902918203684832716283019655932542976) (0 / 1) inverseTail2
    inverseHorner2_checked inverseHorner1_mul_checked inverseHorner1_add_checked

end Grothe.UpperChaos.Q0BasePairRoot6Leaf0001
