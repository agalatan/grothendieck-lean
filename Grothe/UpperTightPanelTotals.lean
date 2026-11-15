import Grothe.UpperQuad.TwistEllipsePlans
import Grothe.UpperTightBudget

/-!
# Tight totals of the existing twisted-panel certificates

Only the requested budget changes. The serialized panel certificates and their interval
acceptance proofs are unchanged. Lean's kernel evaluates these rational sums directly.

Agent-ID: codex-c8a4. Refs #389.
-/

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

namespace Grothe.UpperQuad.TwistEllCheck.Facts

open Grothe.Upper

/-- The first power's stored panel caps sum to less than `8·10⁻¹⁵`. -/
theorem j1TightTotal : totalOK j1Certificates (tightPanelRadiusQ 0) = true := by
  decide +kernel

/-- The second power's stored panel caps sum to less than `16·10⁻¹⁵`. -/
theorem j2TightTotal : totalOK j2Certificates (tightPanelRadiusQ 1) = true := by
  decide +kernel

/-- The third power's stored panel caps sum to less than `1131·10⁻¹⁵`. -/
theorem j3TightTotal : totalOK j3Certificates (tightPanelRadiusQ 2) = true := by
  decide +kernel

end Grothe.UpperQuad.TwistEllCheck.Facts
