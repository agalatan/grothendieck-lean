import Grothe.UpperChaos.Q0BasePairRoot2Leaf0001Check021

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf0001
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem denominatorProduct_checked :
    mulOK profile2Model aux2Model denominatorProductModel (20227845950403728679092019177 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem denominator_checked :
    addOK oneModel denominatorProductModel denominatorModel (0 / 1) = true := by
  decide +kernel

theorem argumentProduct_checked :
    mulOK aux2Model sModel argumentProductModel (3 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem argument_checked :
    mulOK argumentProductModel inverseModel argumentModel (5261585379677288939657171695051 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot2Leaf0001
