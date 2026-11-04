import Grothe.UpperChaos.Q0BasePairRoot10Leaf000Check025

/-! Generated bounded arithmetic block (2 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot10Leaf000
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem companionNumerator_checked :
    mulOK twiceProfileModel companionFactorModel companionNumeratorModel (14868129369952330279809153189367 / 182687704666362864775460604089535377456991567872) = true := by
  decide +kernel

theorem companionOutput_checked :
    mulOK companionNumeratorModel commonModel companionOutputModel (3875649584138946426984895177 / 365375409332725729550921208179070754913983135744) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot10Leaf000
