import Grothe.UpperChaos.Q0BasePairRoot2ProfileCheck000

/-! Generated bounded arithmetic block (4 closed operations, maximum 4).
tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0BasePairRoot2Profile
open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem profileHorner9_mul_checked :
    mulOK profileTail10.output sModel profileproduct9 (1 / 1461501637330902918203684832716283019655932542976) = true := by
  decide +kernel

theorem profileHorner9_add_checked :
    addOK profileproduct9 (Q0ProfileRectangleModel.inputs.getD 9 (constant 0)) profileresult9 0 = true := by
  decide +kernel

theorem profileHorner9_checked :
    profileTail9.check sModel [Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)] = true := by
  exact Trace.check_cons sModel (Q0ProfileRectangleModel.inputs.getD 9 (constant 0))
    [Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)]
    profileproduct9 profileresult9 (1 / 1461501637330902918203684832716283019655932542976) 0 profileTail10
    profileHorner10_checked profileHorner9_mul_checked profileHorner9_add_checked

theorem profileHorner8_mul_checked :
    mulOK profileTail9.output sModel profileproduct8 (1 / 730750818665451459101842416358141509827966271488) = true := by
  decide +kernel

theorem profileHorner8_add_checked :
    addOK profileproduct8 (Q0ProfileRectangleModel.inputs.getD 8 (constant 0)) profileresult8 0 = true := by
  decide +kernel

theorem profileHorner8_checked :
    profileTail8.check sModel [Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)] = true := by
  exact Trace.check_cons sModel (Q0ProfileRectangleModel.inputs.getD 8 (constant 0))
    [Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)]
    profileproduct8 profileresult8 (1 / 730750818665451459101842416358141509827966271488) 0 profileTail9
    profileHorner9_checked profileHorner8_mul_checked profileHorner8_add_checked

end Grothe.UpperChaos.Q0BasePairRoot2Profile
