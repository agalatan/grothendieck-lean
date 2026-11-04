import Grothe.UpperChaos.Q0BasePairRoot2ProfileCheck001

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Profile
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem profileHorner7_mul_checked :
    mulOK profileTail8.output sModel profileproduct7 (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem profileHorner7_add_checked :
    addOK profileproduct7 (Q0ProfileRectangleModel.inputs.getD 7 (constant 0)) profileresult7 0 = true := by
  decide +kernel

theorem profileHorner7_checked :
    profileTail7.check sModel [Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)] = true := by
  exact Trace.check_cons sModel (Q0ProfileRectangleModel.inputs.getD 7 (constant 0))
    [Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)]
    profileproduct7 profileresult7 (1 / 1461501637330902918203684832716283019655932542976) 0 profileTail8
    profileHorner8_checked profileHorner7_mul_checked profileHorner7_add_checked

theorem profileHorner6_mul_checked :
    mulOK profileTail7.output sModel profileproduct6 (1 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem profileHorner6_add_checked :
    addOK profileproduct6 (Q0ProfileRectangleModel.inputs.getD 6 (constant 0)) profileresult6 0 = true := by
  decide +kernel

theorem profileHorner6_checked :
    profileTail6.check sModel [Q0ProfileRectangleModel.inputs.getD 6 (constant 0), Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)] = true := by
  exact Trace.check_cons sModel (Q0ProfileRectangleModel.inputs.getD 6 (constant 0))
    [Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)]
    profileproduct6 profileresult6 (1 / 730750818665451459101842416358141509827966271488) 0 profileTail7
    profileHorner7_checked profileHorner6_mul_checked profileHorner6_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Profile
