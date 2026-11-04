import Grothe.UpperChaos.Q0BasePairRoot2Leaf10111Check023

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf10111
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem commonProduct1_checked :
    mulOK dampingModel gaussianModel commonProduct1Model (5 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem commonProduct2_checked :
    mulOK commonProduct1Model inverseModel commonProduct2Model (7819075488019007179839 / 45671926166590716193865151022383844364247891968) = true := by
  decide +kernel

theorem common_checked :
    mulOK commonProduct2Model inverseModel commonModel (31140166856317399474083 / 182687704666362864775460604089535377456991567872) = true := by
  decide +kernel

theorem twiceRadial_checked :
    scaleOK (2 / 1) sModel twiceRadialModel (0 / 1) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot2Leaf10111
