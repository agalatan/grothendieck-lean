import Grothe.UpperChaos.Q0BasePairRoot2Leaf01101Check025

/-! Generated bounded arithmetic block (2 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf01101
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem companionNumerator_checked :
    mulOK twiceProfileModel companionFactorModel companionNumeratorModel (109845780883018174407005727777 / 91343852333181432387730302044767688728495783936) = true := by
  decide +kernel

theorem companionOutput_checked :
    mulOK companionNumeratorModel commonModel companionOutputModel (20682355209091509566709269 / 91343852333181432387730302044767688728495783936) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot2Leaf01101
