import Grothe.UpperChaos.Q0BasePairRoot6Leaf0010Check023

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf0010
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem commonProduct1_checked :
    mulOK dampingModel gaussianModel commonProduct1Model (3 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem commonProduct2_checked :
    mulOK commonProduct1Model inverseModel commonProduct2Model (1009152667965773317596699 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem common_checked :
    mulOK commonProduct2Model inverseModel commonModel (126282570893440343971799 / 182687704666362864775460604089535377456991567872) = true := by
  decide +kernel

theorem twiceRadial_checked :
    scaleOK (2 / 1) sModel twiceRadialModel (0 / 1) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot6Leaf0010
