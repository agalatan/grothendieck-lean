import Grothe.UpperChaos.Q0BasePairRoot2Leaf0010Check024

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf0010
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem firstOutput_checked :
    mulOK twiceRadialModel commonModel firstOutputModel (559514399293046118001857526737 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem twiceProfile_checked :
    scaleOK (2 / 1) profileModel twiceProfileModel (0 / 1) = true := by
  decide +kernel

theorem negArgument_checked :
    scaleOK (-1 / 1) argumentModel negArgumentModel (0 / 1) = true := by
  decide +kernel

theorem companionFactor_checked :
    addOK oneModel negArgumentModel companionFactorModel (0 / 1) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot2Leaf0010
