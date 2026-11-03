import Grothe.UpperChaos.Q0LegendreWeightCert

/-! Generated LeanCert formula-weight enclosures.
Actual Gauss rule and original fine weight intervals remain separate.
Agent-ID: codex-aa04. -/
open LeanCert.Core

namespace Grothe.UpperChaos.Q0LegendreWeightRule01

open Grothe.UpperChaos.Q0LegendreInteger

def r00Input : IntervalRat :=
  ⟨(-1 : ℚ) / 2^640, (2 : ℚ) / 2^640, by decide +kernel⟩
def r00Interval : IntervalDyadic := IntervalDyadic.ofIntervalRat r00Input (-256)
def r00Upper : ℚ := 2000000000000000000000000000001 / 10^30

theorem r00Lower : r00Interval.lo.toRat = (-1 : ℚ) / 2^256 := by decide +kernel
theorem r00Checked : weightCheck 0 r00Interval r00Upper = true := by decide +kernel
theorem r00Bound {x : ℝ} (hx : x ∈ r00Input) : weight 0 x ≤ (r00Upper : ℝ) := by
  exact weightCheck_sound 0 r00Interval r00Upper r00Checked
    (IntervalDyadic.mem_ofIntervalRat hx (-256) (by decide))

end Grothe.UpperChaos.Q0LegendreWeightRule01
