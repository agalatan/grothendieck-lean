import Grothe.UpperChaos.Q0BasePairRoot2Leaf10101Check025

/-! Generated bounded arithmetic block (2 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf10101
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem companionNumerator_checked :
    mulOK twiceProfileModel companionFactorModel companionNumeratorModel (693315027809353550829616472509 / 365375409332725729550921208179070754913983135744) = true := by
  decide +kernel

theorem companionOutput_checked :
    mulOK companionNumeratorModel commonModel companionOutputModel (11594717949841907270517393 / 182687704666362864775460604089535377456991567872) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot2Leaf10101
