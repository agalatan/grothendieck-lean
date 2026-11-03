import Grothe.UpperChaos.Q0BasePairRoot10ProfileCheck005

namespace Grothe.UpperChaos.Q0BasePairRoot10Profile
open RectangleModelCheck RectangleHornerTrace
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem profile_checked :
    profiletrace.check sModel Q0ProfileRectangleModel.inputs = true := by
  exact profileHorner0_checked

theorem profile_contains {x y s : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1)
    (hs : Contains sModel x y s) :
    Contains profileModel x y (LeanCertProductionProfile.q0Kappa s) :=
  Q0ProfileRectangleModel.profile_of_trace sModel profiletrace profile_checked hx hy hs

end Grothe.UpperChaos.Q0BasePairRoot10Profile
