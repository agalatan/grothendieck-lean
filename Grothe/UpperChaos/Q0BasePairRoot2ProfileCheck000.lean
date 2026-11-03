import Grothe.UpperChaos.Q0BasePairRoot2ProfileData

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Profile
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem profileHorner12_checked :
    profileTail12.check sModel [] = true := by
  rfl

theorem profileHorner11_mul_checked :
    mulOK profileTail12.output sModel profileproduct11 (0 / 1) = true := by
  decide +kernel

theorem profileHorner11_add_checked :
    addOK profileproduct11 (Q0ProfileRectangleModel.inputs.getD 11 (constant 0)) profileresult11 (0 / 1) = true := by
  decide +kernel

theorem profileHorner11_checked :
    profileTail11.check sModel [Q0ProfileRectangleModel.inputs.getD 11 (constant 0)] = true := by
  exact Trace.check_cons sModel (Q0ProfileRectangleModel.inputs.getD 11 (constant 0))
    []
    profileproduct11 profileresult11 (0 / 1) (0 / 1) profileTail12
    profileHorner12_checked profileHorner11_mul_checked profileHorner11_add_checked

theorem profileHorner10_mul_checked :
    mulOK profileTail11.output sModel profileproduct10 (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem profileHorner10_add_checked :
    addOK profileproduct10 (Q0ProfileRectangleModel.inputs.getD 10 (constant 0)) profileresult10 (0 / 1) = true := by
  decide +kernel

theorem profileHorner10_checked :
    profileTail10.check sModel [Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)] = true := by
  exact Trace.check_cons sModel (Q0ProfileRectangleModel.inputs.getD 10 (constant 0))
    [Q0ProfileRectangleModel.inputs.getD 11 (constant 0)]
    profileproduct10 profileresult10 (1 / 1461501637330902918203684832716283019655932542976) (0 / 1) profileTail11
    profileHorner11_checked profileHorner10_mul_checked profileHorner10_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Profile
