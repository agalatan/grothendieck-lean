import Grothe.UpperChaos.Q0BasePairRoot10Leaf0101Check010

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot10Leaf0101
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem dampingHorner3_mul_checked :
    mulOK dampingTail4.output dampingCertificate.delta dampingproduct3 (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem dampingHorner3_add_checked :
    addOK dampingproduct3 (constant (604800 / 1)) dampingresult3 (0 / 1) = true := by
  decide +kernel

theorem dampingHorner3_checked :
    dampingTail3.check dampingCertificate.delta [constant (604800 / 1), constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons dampingCertificate.delta (constant (604800 / 1))
    [constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    dampingproduct3 dampingresult3 (1 / 1461501637330902918203684832716283019655932542976) (0 / 1) dampingTail4
    dampingHorner4_checked dampingHorner3_mul_checked dampingHorner3_add_checked

theorem dampingHorner2_mul_checked :
    mulOK dampingTail3.output dampingCertificate.delta dampingproduct2 (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem dampingHorner2_add_checked :
    addOK dampingproduct2 (constant (1814400 / 1)) dampingresult2 (0 / 1) = true := by
  decide +kernel

theorem dampingHorner2_checked :
    dampingTail2.check dampingCertificate.delta [constant (1814400 / 1), constant (604800 / 1), constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons dampingCertificate.delta (constant (1814400 / 1))
    [constant (604800 / 1), constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    dampingproduct2 dampingresult2 (1 / 1461501637330902918203684832716283019655932542976) (0 / 1) dampingTail3
    dampingHorner3_checked dampingHorner2_mul_checked dampingHorner2_add_checked

end Grothe.UpperChaos.Q0BasePairRoot10Leaf0101
