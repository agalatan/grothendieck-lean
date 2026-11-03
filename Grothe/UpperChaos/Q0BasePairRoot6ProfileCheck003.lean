import Grothe.UpperChaos.Q0BasePairRoot6ProfileCheck002

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot6Profile
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem profileHorner5_mul_checked :
    mulOK profileTail6.output sModel profileproduct5 (1 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem profileHorner5_add_checked :
    addOK profileproduct5 (Q0ProfileRectangleModel.inputs.getD 5 (constant 0)) profileresult5 0 = true := by
  decide +kernel

theorem profileHorner5_checked :
    profileTail5.check sModel [Q0ProfileRectangleModel.inputs.getD 5 (constant 0), Q0ProfileRectangleModel.inputs.getD 6 (constant 0), Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)] = true := by
  exact Trace.check_cons sModel (Q0ProfileRectangleModel.inputs.getD 5 (constant 0))
    [Q0ProfileRectangleModel.inputs.getD 6 (constant 0), Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)]
    profileproduct5 profileresult5 (1 / 730750818665451459101842416358141509827966271488) 0 profileTail6
    profileHorner6_checked profileHorner5_mul_checked profileHorner5_add_checked

theorem profileHorner4_mul_checked :
    mulOK profileTail5.output sModel profileproduct4 (3 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem profileHorner4_add_checked :
    addOK profileproduct4 (Q0ProfileRectangleModel.inputs.getD 4 (constant 0)) profileresult4 0 = true := by
  decide +kernel

theorem profileHorner4_checked :
    profileTail4.check sModel [Q0ProfileRectangleModel.inputs.getD 4 (constant 0), Q0ProfileRectangleModel.inputs.getD 5 (constant 0), Q0ProfileRectangleModel.inputs.getD 6 (constant 0), Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)] = true := by
  exact Trace.check_cons sModel (Q0ProfileRectangleModel.inputs.getD 4 (constant 0))
    [Q0ProfileRectangleModel.inputs.getD 5 (constant 0), Q0ProfileRectangleModel.inputs.getD 6 (constant 0), Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)]
    profileproduct4 profileresult4 (3 / 1461501637330902918203684832716283019655932542976) 0 profileTail5
    profileHorner5_checked profileHorner4_mul_checked profileHorner4_add_checked

end Grothe.UpperChaos.Q0BasePairRoot6Profile
