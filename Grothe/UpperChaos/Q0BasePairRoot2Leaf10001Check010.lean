import Grothe.UpperChaos.Q0BasePairRoot2Leaf10001Check009

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf10001
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem dampingHorner5_mul_checked :
    mulOK dampingTail6.output dampingCertificate.delta dampingproduct5 (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem dampingHorner5_add_checked :
    addOK dampingproduct5 (constant (30240 / 1)) dampingresult5 (0 / 1) = true := by
  decide +kernel

theorem dampingHorner5_checked :
    dampingTail5.check dampingCertificate.delta [constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons dampingCertificate.delta (constant (30240 / 1))
    [constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    dampingproduct5 dampingresult5 (1 / 1461501637330902918203684832716283019655932542976) (0 / 1) dampingTail6
    dampingHorner6_checked dampingHorner5_mul_checked dampingHorner5_add_checked

theorem dampingHorner4_mul_checked :
    mulOK dampingTail5.output dampingCertificate.delta dampingproduct4 (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem dampingHorner4_add_checked :
    addOK dampingproduct4 (constant (151200 / 1)) dampingresult4 (0 / 1) = true := by
  decide +kernel

theorem dampingHorner4_checked :
    dampingTail4.check dampingCertificate.delta [constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons dampingCertificate.delta (constant (151200 / 1))
    [constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    dampingproduct4 dampingresult4 (1 / 1461501637330902918203684832716283019655932542976) (0 / 1) dampingTail5
    dampingHorner5_checked dampingHorner4_mul_checked dampingHorner4_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Leaf10001
