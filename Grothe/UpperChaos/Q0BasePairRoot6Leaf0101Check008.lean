import Grothe.UpperChaos.Q0BasePairRoot6Leaf0101Check007

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf0101
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem dampingHorner9_mul_checked :
    mulOK dampingTail10.output dampingCertificate.delta dampingproduct9 (0 / 1) = true := by
  decide +kernel

theorem dampingHorner9_add_checked :
    addOK dampingproduct9 (constant (10 / 1)) dampingresult9 (0 / 1) = true := by
  decide +kernel

theorem dampingHorner9_checked :
    dampingTail9.check dampingCertificate.delta [constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons dampingCertificate.delta (constant (10 / 1))
    [constant (1 / 1)]
    dampingproduct9 dampingresult9 (0 / 1) (0 / 1) dampingTail10
    dampingHorner10_checked dampingHorner9_mul_checked dampingHorner9_add_checked

theorem dampingHorner8_mul_checked :
    mulOK dampingTail9.output dampingCertificate.delta dampingproduct8 (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem dampingHorner8_add_checked :
    addOK dampingproduct8 (constant (90 / 1)) dampingresult8 (0 / 1) = true := by
  decide +kernel

theorem dampingHorner8_checked :
    dampingTail8.check dampingCertificate.delta [constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons dampingCertificate.delta (constant (90 / 1))
    [constant (10 / 1), constant (1 / 1)]
    dampingproduct8 dampingresult8 (1 / 1461501637330902918203684832716283019655932542976) (0 / 1) dampingTail9
    dampingHorner9_checked dampingHorner8_mul_checked dampingHorner8_add_checked

end Grothe.UpperChaos.Q0BasePairRoot6Leaf0101
