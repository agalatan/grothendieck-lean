import Grothe.UpperChaos.HardyArcRegion

/-! The region of holomorphy for the Hardy tail: one single-threaded `native_decide` (a quadtree over complex boxes of
`t` covering the square `[−2, 2]²`; every box lies outside the disc `|t| < 51863/50000` or passes the gates
`det(I ∓ R(t)) ≠ 0`, `Re (I ∓ R(t))⁻¹ ≻ 0`). -/

namespace Grothe.UpperChaos

/-- **The disc check** for the region of holomorphy. -/
theorem hardy_region_check :
    GrotheKernel.HardyArc.discCheck HardyArcSound.hardyData
      (GrotheKernel.ofRatHi (HardyArcRegion.regionR ^ 2)) = true := by
  native_decide

end Grothe.UpperChaos
