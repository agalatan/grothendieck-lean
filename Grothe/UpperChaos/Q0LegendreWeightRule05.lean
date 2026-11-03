import Grothe.UpperChaos.Q0LegendreWeightRule04

/-! Generated LeanCert formula-weight enclosures.
Actual Gauss rule and original fine weight intervals remain separate.
Agent-ID: codex-aa04. -/
open LeanCert.Core

namespace Grothe.UpperChaos.Q0LegendreWeightRule05

open Grothe.UpperChaos.Q0LegendreInteger

def r00Input : IntervalRat :=
  ⟨(-4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763810 : ℚ) / 2^640, (-4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763807 : ℚ) / 2^640, by decide +kernel⟩
def r00Interval : IntervalDyadic := IntervalDyadic.ofIntervalRat r00Input (-256)
def r00Upper : ℚ := 236926885056189087514264040720 / 10^30

theorem r00Lower : r00Interval.lo.toRat = (-104928457585987223002799602574336658664872617753242249063085602896070934889921 : ℚ) / 2^256 := by decide +kernel
theorem r00Checked : weightCheck 4 r00Interval r00Upper = true := by decide +kernel
theorem r00Bound {x : ℝ} (hx : x ∈ r00Input) : weight 4 x ≤ (r00Upper : ℝ) := by
  exact weightCheck_sound 4 r00Interval r00Upper r00Checked
    (IntervalDyadic.mem_ofIntervalRat hx (-256) (by decide))

def r01Input : IntervalRat :=
  ⟨(-2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478597 : ℚ) / 2^640, (-2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478594 : ℚ) / 2^640, by decide +kernel⟩
def r01Interval : IntervalDyadic := IntervalDyadic.ofIntervalRat r01Input (-256)
def r01Upper : ℚ := 478628670499366468041291514836 / 10^30

theorem r01Lower : r01Interval.lo.toRat = (-62350486407313343909707756752691578123666886964532301298472929083488240926983 : ℚ) / 2^256 := by decide +kernel
theorem r01Checked : weightCheck 4 r01Interval r01Upper = true := by decide +kernel
theorem r01Bound {x : ℝ} (hx : x ∈ r01Input) : weight 4 x ≤ (r01Upper : ℝ) := by
  exact weightCheck_sound 4 r01Interval r01Upper r01Checked
    (IntervalDyadic.mem_ofIntervalRat hx (-256) (by decide))

def r02Input : IntervalRat :=
  ⟨(-1 : ℚ) / 2^640, (2 : ℚ) / 2^640, by decide +kernel⟩
def r02Interval : IntervalDyadic := IntervalDyadic.ofIntervalRat r02Input (-256)
def r02Upper : ℚ := 568888888888888888888888888889 / 10^30

theorem r02Lower : r02Interval.lo.toRat = (-1 : ℚ) / 2^256 := by decide +kernel
theorem r02Checked : weightCheck 4 r02Interval r02Upper = true := by decide +kernel
theorem r02Bound {x : ℝ} (hx : x ∈ r02Input) : weight 4 x ≤ (r02Upper : ℝ) := by
  exact weightCheck_sound 4 r02Interval r02Upper r02Checked
    (IntervalDyadic.mem_ofIntervalRat hx (-256) (by decide))

def r03Input : IntervalRat :=
  ⟨(2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478594 : ℚ) / 2^640, (2456734251769170127206955861032500662757256261894272275586743671077469994827132333368147102979571652432649280897783698335977596289997911422765125201008479021867234832315652040344039416819478597 : ℚ) / 2^640, by decide +kernel⟩
def r03Interval : IntervalDyadic := IntervalDyadic.ofIntervalRat r03Input (-256)
def r03Upper : ℚ := 478628670499366468041291514836 / 10^30

theorem r03Lower : r03Interval.lo.toRat = (62350486407313343909707756752691578123666886964532301298472929083488240926982 : ℚ) / 2^256 := by decide +kernel
theorem r03Checked : weightCheck 4 r03Interval r03Upper = true := by decide +kernel
theorem r03Bound {x : ℝ} (hx : x ∈ r03Input) : weight 4 x ≤ (r03Upper : ℝ) := by
  exact weightCheck_sound 4 r03Interval r03Upper r03Checked
    (IntervalDyadic.mem_ofIntervalRat hx (-256) (by decide))

def r04Input : IntervalRat :=
  ⟨(4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763807 : ℚ) / 2^640, (4134391735981183858827318575265272044681180628614912538597972569055146521949434520253722173674579363444163048923577093618301014985570745096004477753894127100749223961200297576008573825457763810 : ℚ) / 2^640, by decide +kernel⟩
def r04Interval : IntervalDyadic := IntervalDyadic.ofIntervalRat r04Input (-256)
def r04Upper : ℚ := 236926885056189087514264040720 / 10^30

theorem r04Lower : r04Interval.lo.toRat = (104928457585987223002799602574336658664872617753242249063085602896070934889920 : ℚ) / 2^256 := by decide +kernel
theorem r04Checked : weightCheck 4 r04Interval r04Upper = true := by decide +kernel
theorem r04Bound {x : ℝ} (hx : x ∈ r04Input) : weight 4 x ≤ (r04Upper : ℝ) := by
  exact weightCheck_sound 4 r04Interval r04Upper r04Checked
    (IntervalDyadic.mem_ofIntervalRat hx (-256) (by decide))

end Grothe.UpperChaos.Q0LegendreWeightRule05
