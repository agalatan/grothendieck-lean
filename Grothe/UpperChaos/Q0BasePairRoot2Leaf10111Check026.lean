import Grothe.UpperChaos.Q0BasePairRoot2Leaf10111Check025

/-! Generated bounded arithmetic block (2 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf10111
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem companionNumerator_checked :
    mulOK twiceProfileModel companionFactorModel companionNumeratorModel (4006458730972482954322913092819 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem companionOutput_checked :
    mulOK companionNumeratorModel commonModel companionOutputModel (12677837535055872087281033 / 365375409332725729550921208179070754913983135744) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot2Leaf10111
