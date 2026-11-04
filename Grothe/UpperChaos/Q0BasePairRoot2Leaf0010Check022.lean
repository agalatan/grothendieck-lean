import Grothe.UpperChaos.Q0BasePairRoot2Leaf0010Check021

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Leaf0010
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem denominatorProduct_checked :
    mulOK profile2Model aux2Model denominatorProductModel (41431549808965818291077294985 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem denominator_checked :
    addOK oneModel denominatorProductModel denominatorModel (0 / 1) = true := by
  decide +kernel

theorem argumentProduct_checked :
    mulOK aux2Model sModel argumentProductModel (3 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem argument_checked :
    mulOK argumentProductModel inverseModel argumentModel (763029458261180450582881113559 / 182687704666362864775460604089535377456991567872) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot2Leaf0010
