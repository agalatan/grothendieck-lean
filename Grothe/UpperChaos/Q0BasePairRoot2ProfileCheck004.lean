import Grothe.UpperChaos.Q0BasePairRoot2ProfileCheck003

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Profile
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem profileHorner3_mul_checked :
    mulOK profileTail4.output sModel profileproduct3 (1 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem profileHorner3_add_checked :
    addOK profileproduct3 (Q0ProfileRectangleModel.inputs.getD 3 (constant 0)) profileresult3 (0 / 1) = true := by
  decide +kernel

theorem profileHorner3_checked :
    profileTail3.check sModel [Q0ProfileRectangleModel.inputs.getD 3 (constant 0), Q0ProfileRectangleModel.inputs.getD 4 (constant 0), Q0ProfileRectangleModel.inputs.getD 5 (constant 0), Q0ProfileRectangleModel.inputs.getD 6 (constant 0), Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)] = true := by
  exact Trace.check_cons sModel (Q0ProfileRectangleModel.inputs.getD 3 (constant 0))
    [Q0ProfileRectangleModel.inputs.getD 4 (constant 0), Q0ProfileRectangleModel.inputs.getD 5 (constant 0), Q0ProfileRectangleModel.inputs.getD 6 (constant 0), Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)]
    profileproduct3 profileresult3 (1 / 730750818665451459101842416358141509827966271488) (0 / 1) profileTail4
    profileHorner4_checked profileHorner3_mul_checked profileHorner3_add_checked

theorem profileHorner2_mul_checked :
    mulOK profileTail3.output sModel profileproduct2 (1 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem profileHorner2_add_checked :
    addOK profileproduct2 (Q0ProfileRectangleModel.inputs.getD 2 (constant 0)) profileresult2 (0 / 1) = true := by
  decide +kernel

theorem profileHorner2_checked :
    profileTail2.check sModel [Q0ProfileRectangleModel.inputs.getD 2 (constant 0), Q0ProfileRectangleModel.inputs.getD 3 (constant 0), Q0ProfileRectangleModel.inputs.getD 4 (constant 0), Q0ProfileRectangleModel.inputs.getD 5 (constant 0), Q0ProfileRectangleModel.inputs.getD 6 (constant 0), Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)] = true := by
  exact Trace.check_cons sModel (Q0ProfileRectangleModel.inputs.getD 2 (constant 0))
    [Q0ProfileRectangleModel.inputs.getD 3 (constant 0), Q0ProfileRectangleModel.inputs.getD 4 (constant 0), Q0ProfileRectangleModel.inputs.getD 5 (constant 0), Q0ProfileRectangleModel.inputs.getD 6 (constant 0), Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)]
    profileproduct2 profileresult2 (1 / 730750818665451459101842416358141509827966271488) (0 / 1) profileTail3
    profileHorner3_checked profileHorner2_mul_checked profileHorner2_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Profile
