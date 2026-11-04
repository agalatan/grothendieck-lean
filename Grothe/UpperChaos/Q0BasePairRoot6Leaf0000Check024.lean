import Grothe.UpperChaos.Q0BasePairRoot6Leaf0000Check023

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf0000
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem commonProduct1_checked :
    mulOK dampingModel gaussianModel commonProduct1Model (7 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem commonProduct2_checked :
    mulOK commonProduct1Model inverseModel commonProduct2Model (2430726366647424136162205 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem common_checked :
    mulOK commonProduct2Model inverseModel commonModel (2432216944317029709434983 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem twiceRadial_checked :
    scaleOK (2 / 1) sModel twiceRadialModel (0 / 1) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot6Leaf0000
