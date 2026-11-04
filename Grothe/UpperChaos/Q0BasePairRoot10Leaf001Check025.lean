import Grothe.UpperChaos.Q0BasePairRoot10Leaf001Check024

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot10Leaf001
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem firstOutput_checked :
    mulOK twiceRadialModel commonModel firstOutputModel (176031087093215612782826173 / 1461501637330902918203684832716283019655932542976) = true := by
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

end Grothe.UpperChaos.Q0BasePairRoot10Leaf001
