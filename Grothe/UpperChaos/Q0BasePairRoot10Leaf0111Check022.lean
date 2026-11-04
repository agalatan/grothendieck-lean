import Grothe.UpperChaos.Q0BasePairRoot10Leaf0111Check021

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot10Leaf0111
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem denominatorProduct_checked :
    mulOK profile2Model aux2Model denominatorProductModel (1350706023097 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem denominator_checked :
    addOK oneModel denominatorProductModel denominatorModel (0 / 1) = true := by
  decide +kernel

theorem argumentProduct_checked :
    mulOK aux2Model sModel argumentProductModel (1 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem argument_checked :
    mulOK argumentProductModel inverseModel argumentModel (326835632824710513745969357859 / 365375409332725729550921208179070754913983135744) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot10Leaf0111
