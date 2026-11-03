import Grothe.UpperChaos.Q0BasePairRoot2Leaf1110Check011

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf1110
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem dampingHorner1_mul_checked :
    mulOK dampingTail2.output dampingCertificate.delta dampingproduct1 (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem dampingHorner1_add_checked :
    addOK dampingproduct1 (constant (3628800 / 1)) dampingresult1 (0 / 1) = true := by
  decide +kernel

theorem dampingHorner1_checked :
    dampingTail1.check dampingCertificate.delta [constant (3628800 / 1), constant (1814400 / 1), constant (604800 / 1), constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons dampingCertificate.delta (constant (3628800 / 1))
    [constant (1814400 / 1), constant (604800 / 1), constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    dampingproduct1 dampingresult1 (1 / 1461501637330902918203684832716283019655932542976) (0 / 1) dampingTail2
    dampingHorner2_checked dampingHorner1_mul_checked dampingHorner1_add_checked

theorem dampingHorner0_mul_checked :
    mulOK dampingTail1.output dampingCertificate.delta dampingproduct0 (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem dampingHorner0_add_checked :
    addOK dampingproduct0 (constant (3628800 / 1)) dampingresult0 (0 / 1) = true := by
  decide +kernel

theorem dampingHorner0_checked :
    dampingTail0.check dampingCertificate.delta [constant (3628800 / 1), constant (3628800 / 1), constant (1814400 / 1), constant (604800 / 1), constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons dampingCertificate.delta (constant (3628800 / 1))
    [constant (3628800 / 1), constant (1814400 / 1), constant (604800 / 1), constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    dampingproduct0 dampingresult0 (1 / 1461501637330902918203684832716283019655932542976) (0 / 1) dampingTail1
    dampingHorner1_checked dampingHorner0_mul_checked dampingHorner0_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Leaf1110
