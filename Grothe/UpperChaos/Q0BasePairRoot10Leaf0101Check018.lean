import Grothe.UpperChaos.Q0BasePairRoot10Leaf0101Check017

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot10Leaf0101
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem gaussianHorner3_mul_checked :
    mulOK gaussianTail4.output gaussianCertificate.delta gaussianproduct3 (1333818337247231023535966760461817319659867 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem gaussianHorner3_add_checked :
    addOK gaussianproduct3 (constant (604800 / 1)) gaussianresult3 (0 / 1) = true := by
  decide +kernel

theorem gaussianHorner3_checked :
    gaussianTail3.check gaussianCertificate.delta [constant (604800 / 1), constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (constant (604800 / 1))
    [constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    gaussianproduct3 gaussianresult3 (1333818337247231023535966760461817319659867 / 730750818665451459101842416358141509827966271488) (0 / 1) gaussianTail4
    gaussianHorner4_checked gaussianHorner3_mul_checked gaussianHorner3_add_checked

theorem gaussianHorner2_mul_checked :
    mulOK gaussianTail3.output gaussianCertificate.delta gaussianproduct2 (32211931591051733638429321407694368845476805 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem gaussianHorner2_add_checked :
    addOK gaussianproduct2 (constant (1814400 / 1)) gaussianresult2 (0 / 1) = true := by
  decide +kernel

theorem gaussianHorner2_checked :
    gaussianTail2.check gaussianCertificate.delta [constant (1814400 / 1), constant (604800 / 1), constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons gaussianCertificate.delta (constant (1814400 / 1))
    [constant (604800 / 1), constant (151200 / 1), constant (30240 / 1), constant (5040 / 1), constant (720 / 1), constant (90 / 1), constant (10 / 1), constant (1 / 1)]
    gaussianproduct2 gaussianresult2 (32211931591051733638429321407694368845476805 / 1461501637330902918203684832716283019655932542976) (0 / 1) gaussianTail3
    gaussianHorner3_checked gaussianHorner2_mul_checked gaussianHorner2_add_checked

end Grothe.UpperChaos.Q0BasePairRoot10Leaf0101
