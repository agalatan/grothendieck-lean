import Grothe.UpperChaos.Q0BasePairRoot2ProfileCheck005

namespace Grothe.UpperChaos.Q0BasePairRoot2Profile
open RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem profile_checked :
    profiletrace.check sModel Q0ProfileRectangleModel.inputs = true := by
  have hi : [Q0ProfileRectangleModel.inputs.getD 0 (constant 0), Q0ProfileRectangleModel.inputs.getD 1 (constant 0), Q0ProfileRectangleModel.inputs.getD 2 (constant 0), Q0ProfileRectangleModel.inputs.getD 3 (constant 0), Q0ProfileRectangleModel.inputs.getD 4 (constant 0), Q0ProfileRectangleModel.inputs.getD 5 (constant 0), Q0ProfileRectangleModel.inputs.getD 6 (constant 0), Q0ProfileRectangleModel.inputs.getD 7 (constant 0), Q0ProfileRectangleModel.inputs.getD 8 (constant 0), Q0ProfileRectangleModel.inputs.getD 9 (constant 0), Q0ProfileRectangleModel.inputs.getD 10 (constant 0), Q0ProfileRectangleModel.inputs.getD 11 (constant 0)] = Q0ProfileRectangleModel.inputs := by rfl
  have ht : profileTail0 = profiletrace := by rfl
  rw [← ht, ← hi]
  exact profileHorner0_checked

theorem profile_contains {x y s : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1)
    (hs : Contains sModel x y s) :
    Contains profileModel x y (LeanCertProductionProfile.q0Kappa s) :=
  Q0ProfileRectangleModel.profile_of_trace sModel profiletrace profile_checked hx hy hs

end Grothe.UpperChaos.Q0BasePairRoot2Profile
