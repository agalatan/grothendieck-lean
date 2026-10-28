import Grothe.UpperChaos.HardyArcData

/-! Part 2 of the Hardy arc cover (−1 ≤ s ≤ 0, chart −): one single-threaded `native_decide`; the four parts are separate modules
so that Lake checks them in parallel. -/

namespace Grothe.UpperChaos

/-- **The arc cover, part 2** (−1 ≤ s ≤ 0, chart −): the Schur gates pass on every piece and the weighted sum is at most 2.73. -/
theorem hardy_arc_part_2 : HardyArcMean.partsOK true 0 = true := by
  native_decide

end Grothe.UpperChaos
