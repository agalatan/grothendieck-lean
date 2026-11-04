import Grothe.UpperChaos.Q0BasePairRoot2Leaf10011Check025

/-! Generated bounded arithmetic block (2 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf10011
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem companionNumerator_checked :
    mulOK twiceProfileModel companionFactorModel companionNumeratorModel (550282331097219549205256671299 / 365375409332725729550921208179070754913983135744) = true := by
  decide +kernel

theorem companionOutput_checked :
    mulOK companionNumeratorModel commonModel companionOutputModel (56827853640001185725674319 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot2Leaf10011
