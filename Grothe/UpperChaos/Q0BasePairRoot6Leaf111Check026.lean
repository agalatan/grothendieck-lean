import Grothe.UpperChaos.Q0BasePairRoot6Leaf111Check025

/-! Generated bounded arithmetic block (2 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf111
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem companionNumerator_checked :
    mulOK twiceProfileModel companionFactorModel companionNumeratorModel (1453009923622023259514862198395 / 91343852333181432387730302044767688728495783936) = true := by
  decide +kernel

theorem companionOutput_checked :
    mulOK companionNumeratorModel commonModel companionOutputModel (387102179227600418055994159 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot6Leaf111
