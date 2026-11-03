import Grothe.UpperChaos.Q0BasePairRoot2Leaf10011Check018

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf10011
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem gaussianHorner1_mul_checked :
    mulOK gaussianTail2.output gaussianCertificate.delta gaussianproduct1 (406825232581543951820387437675654928249629 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem gaussianHorner1_add_checked :
    addOK gaussianproduct1 (constant (3628800 / 1)) gaussianresult1 (0 / 1) = true := by
  decide +kernel

theorem gaussianHorner1_checked :
    gaussianTail1.check gaussianCertificate.delta [constant (3628800 / 1), constant (1814400 / 1), constant (604800 / 1), constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (constant (3628800 / 1))
    [constant (1814400 / 1), constant (604800 / 1), constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    gaussianproduct1 gaussianresult1 (406825232581543951820387437675654928249629 / 1461501637330902918203684832716283019655932542976) (0 / 1) gaussianTail2
    gaussianHorner2_checked gaussianHorner1_mul_checked gaussianHorner1_add_checked

theorem gaussianHorner0_mul_checked :
    mulOK gaussianTail1.output gaussianCertificate.delta gaussianproduct0 (1413363237651200813263828498593370016177781 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem gaussianHorner0_add_checked :
    addOK gaussianproduct0 (constant (3628800 / 1)) gaussianresult0 (0 / 1) = true := by
  decide +kernel

theorem gaussianHorner0_checked :
    gaussianTail0.check gaussianCertificate.delta [constant (3628800 / 1), constant (3628800 / 1), constant (1814400 / 1), constant (604800 / 1), constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (constant (3628800 / 1))
    [constant (3628800 / 1), constant (1814400 / 1), constant (604800 / 1), constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    gaussianproduct0 gaussianresult0 (1413363237651200813263828498593370016177781 / 1461501637330902918203684832716283019655932542976) (0 / 1) gaussianTail1
    gaussianHorner1_checked gaussianHorner0_mul_checked gaussianHorner0_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Leaf10011
