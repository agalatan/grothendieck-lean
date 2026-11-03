import Grothe.UpperChaos.Q0BasePairRoot6ProfileCheck004

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Profile
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem profileHorner1_mul_checked :
    mulOK profileTail2.output sModel profileproduct1 (3 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem profileHorner1_add_checked :
    addOK profileproduct1 (Q0ProfileRectangleModel.inputs.getD 1 (constant 0)) profileresult1 (0 / 1) = true := by
  decide +kernel

theorem profileHorner1_checked :
    profileTail1.check sModel [Q0ProfileRectangleModel.inputs.getD 1 (constant 0), Q0ProfileRectangleModel.inputs.getD 2 (constant 0), Q0ProfileRectangleModel.inputs.getD 3 (constant 0), Q0ProfileRectangleModel.inputs.getD 4 (constant 0), Q0ProfileRectangleModel.inputs.getD 5 (constant 0), Q0ProfileRectangleModel.inputs.getD 6 (constant 0), Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)] = true := by
  exact Trace.check_cons sModel (Q0ProfileRectangleModel.inputs.getD 1 (constant 0))
    [Q0ProfileRectangleModel.inputs.getD 2 (constant 0), Q0ProfileRectangleModel.inputs.getD 3 (constant 0), Q0ProfileRectangleModel.inputs.getD 4 (constant 0), Q0ProfileRectangleModel.inputs.getD 5 (constant 0), Q0ProfileRectangleModel.inputs.getD 6 (constant 0), Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)]
    profileproduct1 profileresult1 (3 / 1461501637330902918203684832716283019655932542976) (0 / 1) profileTail2
    profileHorner2_checked profileHorner1_mul_checked profileHorner1_add_checked

theorem profileHorner0_mul_checked :
    mulOK profileTail1.output sModel profileproduct0 (77546607 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem profileHorner0_add_checked :
    addOK profileproduct0 (Q0ProfileRectangleModel.inputs.getD 0 (constant 0)) profileresult0 (0 / 1) = true := by
  decide +kernel

theorem profileHorner0_checked :
    profileTail0.check sModel [Q0ProfileRectangleModel.inputs.getD 0 (constant 0), Q0ProfileRectangleModel.inputs.getD 1 (constant 0), Q0ProfileRectangleModel.inputs.getD 2 (constant 0), Q0ProfileRectangleModel.inputs.getD 3 (constant 0), Q0ProfileRectangleModel.inputs.getD 4 (constant 0), Q0ProfileRectangleModel.inputs.getD 5 (constant 0), Q0ProfileRectangleModel.inputs.getD 6 (constant 0), Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)] = true := by
  exact Trace.check_cons sModel (Q0ProfileRectangleModel.inputs.getD 0 (constant 0))
    [Q0ProfileRectangleModel.inputs.getD 1 (constant 0), Q0ProfileRectangleModel.inputs.getD 2 (constant 0), Q0ProfileRectangleModel.inputs.getD 3 (constant 0), Q0ProfileRectangleModel.inputs.getD 4 (constant 0), Q0ProfileRectangleModel.inputs.getD 5 (constant 0), Q0ProfileRectangleModel.inputs.getD 6 (constant 0), Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)]
    profileproduct0 profileresult0 (77546607 / 1461501637330902918203684832716283019655932542976) (0 / 1) profileTail1
    profileHorner1_checked profileHorner0_mul_checked profileHorner0_add_checked

end Grothe.UpperChaos.Q0BasePairRoot6Profile
