import Grothe.UpperChaos.HardyArcData

/-! Part 3 of the Hardy arc cover (0 ≤ s ≤ 1, chart −): one single-threaded `native_decide`; the four parts are separate modules
so that Lake checks them in parallel. -/

namespace Grothe.UpperChaos

/-- **The arc cover, part 3** (0 ≤ s ≤ 1, chart −): the Schur gates pass on every piece and the weighted sum is at most 2.73. -/
theorem hardy_arc_part_3 : HardyArcMean.partsOK true 1024 = true := by
  native_decide

end Grothe.UpperChaos
