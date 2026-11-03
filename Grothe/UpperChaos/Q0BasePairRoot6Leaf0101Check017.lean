import Grothe.UpperChaos.Q0BasePairRoot6Leaf0101Check016

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf0101
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem gaussianHorner5_mul_checked :
    mulOK gaussianTail6.output gaussianCertificate.delta gaussianproduct5 (70564789654971867331933417476886436047 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem gaussianHorner5_add_checked :
    addOK gaussianproduct5 (constant (30240 / 1)) gaussianresult5 (0 / 1) = true := by
  decide +kernel

theorem gaussianHorner5_checked :
    gaussianTail5.check gaussianCertificate.delta [constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (constant (30240 / 1))
    [constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    gaussianproduct5 gaussianresult5 (70564789654971867331933417476886436047 / 730750818665451459101842416358141509827966271488) (0 / 1) gaussianTail6
    gaussianHorner6_checked gaussianHorner5_mul_checked gaussianHorner5_add_checked

theorem gaussianHorner4_mul_checked :
    mulOK gaussianTail5.output gaussianCertificate.delta gaussianproduct4 (15594609203768020706584464233568929378293 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem gaussianHorner4_add_checked :
    addOK gaussianproduct4 (constant (151200 / 1)) gaussianresult4 (0 / 1) = true := by
  decide +kernel

theorem gaussianHorner4_checked :
    gaussianTail4.check gaussianCertificate.delta [constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (constant (151200 / 1))
    [constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    gaussianproduct4 gaussianresult4 (15594609203768020706584464233568929378293 / 1461501637330902918203684832716283019655932542976) (0 / 1) gaussianTail5
    gaussianHorner5_checked gaussianHorner4_mul_checked gaussianHorner4_add_checked

end Grothe.UpperChaos.Q0BasePairRoot6Leaf0101
