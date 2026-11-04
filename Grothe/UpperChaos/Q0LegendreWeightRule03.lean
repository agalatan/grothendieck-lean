import Grothe.UpperChaos.Q0LegendreWeightRule02

/-! Generated LeanCert formula-weight enclosures.
Actual Gauss rule and original fine weight intervals remain separate.
Agent-ID: codex-aa04. -/
open LeanCert.Core

namespace Grothe.UpperChaos.Q0LegendreWeightRule03

open Grothe.UpperChaos.Q0LegendreInteger

def r00Input : IntervalRat :=
  ⟨(-3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356902 : ℚ) / 2^640, (-3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356899 : ℚ) / 2^640, by decide +kernel⟩
def r00Interval : IntervalDyadic := IntervalDyadic.ofIntervalRat r00Input (-256)
def r00Upper : ℚ := 555555555555555555555555555556 / 10^30

theorem r00Lower : r00Interval.lo.toRat = (-89692166647737740217915101394207812146551313168221245221088132091739149480328 : ℚ) / 2^256 := by decide +kernel
theorem r00Checked : weightCheck 2 r00Interval r00Upper = true := by decide +kernel
theorem r00Bound {x : ℝ} (hx : x ∈ r00Input) : weight 2 x ≤ (r00Upper : ℝ) := by
  exact weightCheck_sound 2 r00Interval r00Upper r00Checked
    (IntervalDyadic.mem_ofIntervalRat hx (-256) (by decide))

def r01Input : IntervalRat :=
  ⟨(-1 : ℚ) / 2^640, (2 : ℚ) / 2^640, by decide +kernel⟩
def r01Interval : IntervalDyadic := IntervalDyadic.ofIntervalRat r01Input (-256)
def r01Upper : ℚ := 888888888888888888888888888889 / 10^30

theorem r01Lower : r01Interval.lo.toRat = (-1 : ℚ) / 2^256 := by decide +kernel
theorem r01Checked : weightCheck 2 r01Interval r01Upper = true := by decide +kernel
theorem r01Bound {x : ℝ} (hx : x ∈ r01Input) : weight 2 x ≤ (r01Upper : ℝ) := by
  exact weightCheck_sound 2 r01Interval r01Upper r01Checked
    (IntervalDyadic.mem_ofIntervalRat hx (-256) (by decide))

def r02Input : IntervalRat :=
  ⟨(3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356899 : ℚ) / 2^640, (3534051306022208684696129191843850747333214851720307563900331768168177604620575721645563698173222268463863797491326917109739275089813060047043972136377155154931201742653733512281268762809356902 : ℚ) / 2^640, by decide +kernel⟩
def r02Interval : IntervalDyadic := IntervalDyadic.ofIntervalRat r02Input (-256)
def r02Upper : ℚ := 555555555555555555555555555556 / 10^30

theorem r02Lower : r02Interval.lo.toRat = (89692166647737740217915101394207812146551313168221245221088132091739149480327 : ℚ) / 2^256 := by decide +kernel
theorem r02Checked : weightCheck 2 r02Interval r02Upper = true := by decide +kernel
theorem r02Bound {x : ℝ} (hx : x ∈ r02Input) : weight 2 x ≤ (r02Upper : ℝ) := by
  exact weightCheck_sound 2 r02Interval r02Upper r02Checked
    (IntervalDyadic.mem_ofIntervalRat hx (-256) (by decide))

end Grothe.UpperChaos.Q0LegendreWeightRule03
