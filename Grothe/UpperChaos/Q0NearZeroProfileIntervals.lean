import Grothe.UpperChaos.Q0ProfileRatioBound
import Grothe.UpperChaos.Q0GaussAddressScan

/-!
# Certified profile intervals around the three source-profile zeros

The endpoints are taken from the actual source-panel blocks 102–318, 521–720 and
933–1118. Centered interval arithmetic bounds the scaled physical profile on the entire
intervals, independently of the source nodes and saved coefficient rows.

Agent-ID: codex-2f3d. Refs #334, #41.
-/

namespace Grothe.UpperChaos.Q0NearZeroSourceProfile

open Q0GaussAddressScan Q0SourceProfileRatio

set_option maxRecDepth 8192
set_option maxHeartbeats 4000000

/-- A common rational cap for the scaled physical profile on these blocks. -/
def profileBound : ℚ := 1 / 10 ^ 10

/-- The first near-zero block, using its actual source endpoints. -/
def block0 : ProfileRootScreen.Row :=
  ⟨(sourcePanels.get ⟨102, by decide +kernel⟩).lo,
    (sourcePanels.get ⟨318, by decide +kernel⟩).hi, false⟩

/-- The second near-zero block, using its actual source endpoints. -/
def block1 : ProfileRootScreen.Row :=
  ⟨(sourcePanels.get ⟨521, by decide +kernel⟩).lo,
    (sourcePanels.get ⟨720, by decide +kernel⟩).hi, false⟩

/-- The third near-zero block, using its actual source endpoints. -/
def block2 : ProfileRootScreen.Row :=
  ⟨(sourcePanels.get ⟨933, by decide +kernel⟩).lo,
    (sourcePanels.get ⟨1118, by decide +kernel⟩).hi, false⟩

/-- Exact centered interval arithmetic on the first near-zero block. -/
theorem block0_checked : rowAbsOK block0 profileBound = true := by
  decide +kernel

/-- Exact centered interval arithmetic on the second near-zero block. -/
theorem block1_checked : rowAbsOK block1 profileBound = true := by
  decide +kernel

/-- Exact centered interval arithmetic on the third near-zero block. -/
theorem block2_checked : rowAbsOK block2 profileBound = true := by
  decide +kernel

/-- Each near-zero block starts at squared radius at least 13. -/
theorem block_starts :
    (13 : ℚ) ≤ (sourcePanels.get ⟨102, by decide +kernel⟩).lo ∧
    (13 : ℚ) ≤ (sourcePanels.get ⟨521, by decide +kernel⟩).lo ∧
    (13 : ℚ) ≤ (sourcePanels.get ⟨933, by decide +kernel⟩).lo := by
  decide +kernel

end Grothe.UpperChaos.Q0NearZeroSourceProfile
