import Grothe.UpperChaos.Q0BasePairRoot6Leaf1010Check025

/-! Generated bounded arithmetic block (2 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf1010
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem companionNumerator_checked :
    mulOK twiceProfileModel companionFactorModel companionNumeratorModel (97313118096041849048706178731 / 365375409332725729550921208179070754913983135744) = true := by
  decide +kernel

theorem companionOutput_checked :
    mulOK companionNumeratorModel commonModel companionOutputModel (9374065804221069193194941 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot6Leaf1010
