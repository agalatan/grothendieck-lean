import Grothe.UpperChaos.Q0BasePairRoot6Leaf0100Check016

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf0100
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem gaussianHorner5_mul_checked :
    mulOK gaussianTail6.output gaussianCertificate.delta gaussianproduct5 (70047068871363815583645318309050651999 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem gaussianHorner5_add_checked :
    addOK gaussianproduct5 (constant (30240 / 1)) gaussianresult5 (0 / 1) = true := by
  decide +kernel

theorem gaussianHorner5_checked :
    gaussianTail5.check gaussianCertificate.delta [constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (constant (30240 / 1))
    [constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    gaussianproduct5 gaussianresult5 (70047068871363815583645318309050651999 / 1461501637330902918203684832716283019655932542976) (0 / 1) gaussianTail6
    gaussianHorner6_checked gaussianHorner5_mul_checked gaussianHorner5_add_checked

theorem gaussianHorner4_mul_checked :
    mulOK gaussianTail5.output gaussianCertificate.delta gaussianproduct4 (11922000764649809090010596763777608142181 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem gaussianHorner4_add_checked :
    addOK gaussianproduct4 (constant (151200 / 1)) gaussianresult4 (0 / 1) = true := by
  decide +kernel

theorem gaussianHorner4_checked :
    gaussianTail4.check gaussianCertificate.delta [constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (constant (151200 / 1))
    [constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    gaussianproduct4 gaussianresult4 (11922000764649809090010596763777608142181 / 1461501637330902918203684832716283019655932542976) (0 / 1) gaussianTail5
    gaussianHorner5_checked gaussianHorner4_mul_checked gaussianHorner4_add_checked

end Grothe.UpperChaos.Q0BasePairRoot6Leaf0100
