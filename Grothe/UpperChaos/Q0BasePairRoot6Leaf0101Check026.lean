import Grothe.UpperChaos.Q0BasePairRoot6Leaf0101Check025

/-! Generated bounded arithmetic block (2 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf0101
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem companionNumerator_checked :
    mulOK twiceProfileModel companionFactorModel companionNumeratorModel (16791740984554523602263613601 / 91343852333181432387730302044767688728495783936) = true := by
  decide +kernel

theorem companionOutput_checked :
    mulOK companionNumeratorModel commonModel companionOutputModel (99138677819528717178220355 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot6Leaf0101
