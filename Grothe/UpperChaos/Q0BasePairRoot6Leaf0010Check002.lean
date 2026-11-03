import Grothe.UpperChaos.Q0BasePairRoot6Leaf0010Check001

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf0010
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem inverseHorner6_mul_checked :
    mulOK inverseTail7.output inverseCertificate.argument inverseproduct6 (836393816360355360779792339 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem inverseHorner6_add_checked :
    addOK inverseproduct6 (constant (1 / 1)) inverseresult6 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner6_checked :
    inverseTail6.check inverseCertificate.argument [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons inverseCertificate.argument (constant (1 / 1))
    [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)]
    inverseproduct6 inverseresult6 (836393816360355360779792339 / 1461501637330902918203684832716283019655932542976) (0 / 1) inverseTail7
    inverseHorner7_checked inverseHorner6_mul_checked inverseHorner6_add_checked

theorem inverseHorner5_mul_checked :
    mulOK inverseTail6.output inverseCertificate.argument inverseproduct5 (418196907816904657880962863 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem inverseHorner5_add_checked :
    addOK inverseproduct5 (constant (1 / 1)) inverseresult5 (0 / 1) = true := by
  decide +kernel

theorem inverseHorner5_checked :
    inverseTail5.check inverseCertificate.argument [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)] = true := by
  exact Trace.check_cons inverseCertificate.argument (constant (1 / 1))
    [constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1), constant (1 / 1)]
    inverseproduct5 inverseresult5 (418196907816904657880962863 / 730750818665451459101842416358141509827966271488) (0 / 1) inverseTail6
    inverseHorner6_checked inverseHorner5_mul_checked inverseHorner5_add_checked

end Grothe.UpperChaos.Q0BasePairRoot6Leaf0010
