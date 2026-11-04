import Grothe.UpperChaos.Q0BasePairRoot2Leaf11011Check025

/-! Generated bounded arithmetic block (2 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf11011
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem companionNumerator_checked :
    mulOK twiceProfileModel companionFactorModel companionNumeratorModel (9628196092925810586769300522569 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem companionOutput_checked :
    mulOK companionNumeratorModel commonModel companionOutputModel (9388328692496705213134991 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot2Leaf11011
