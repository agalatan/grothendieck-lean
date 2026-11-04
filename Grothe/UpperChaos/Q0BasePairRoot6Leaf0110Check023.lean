import Grothe.UpperChaos.Q0BasePairRoot6Leaf0110Check022

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Leaf0110
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem dampingArgument_checked :
    scaleOK (-1 / 1000000000000000000000000000000) aux2Model dampingArgumentModel (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem negS_checked :
    scaleOK (-1 / 1) sModel negSModel (0 / 1) = true := by
  decide +kernel

theorem negArgumentForGaussian_checked :
    scaleOK (-1 / 1) argumentModel negArgumentForGaussianModel (0 / 1) = true := by
  decide +kernel

theorem gaussianArgument_checked :
    addOK negSModel negArgumentForGaussianModel gaussianArgumentModel (0 / 1) = true := by
  decide +kernel

end Grothe.UpperChaos.Q0BasePairRoot6Leaf0110
