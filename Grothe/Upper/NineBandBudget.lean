import Grothe.Upper.ComparisonData
import Mathlib.Tactic

/-! # Exact cost screen for a shared-source nine-band comparison

These are arithmetic facts only. They do not establish the Gaussian band
bounds, the shared-source comparison, or a bound on the Grothendieck constant.

Agent-ID: codex-239c -/

namespace Grothe.Upper.NineBandBudget

open Finset

abbrev Index := Fin 18

def band (j : Index) := comparisonBands[j.val]'(by
  change j.val < 18
  exact j.isLt)
def weight (j : Index) : ℚ := (band j).norm + 71 / 100000

def retained : Finset Index := {0, 1, 2, 3, 4, 5, 8, 9, 13, 14}
def firstHigh : Finset Index := {6, 7}
def secondHigh : Finset Index := {10, 11, 12}
def thirdHigh : Finset Index := {15, 16, 17}
def firstLow : Finset Index := {1, 2, 3, 4, 5}
def secondLow : Finset Index := {8, 9}
def thirdLow : Finset Index := {13, 14}

def firstWeight : ℚ := 21126822199 / 500000000000
def secondWeight : ℚ := 76802079737 / 1000000000000
def thirdWeight : ℚ := 73533514863 / 500000000000

def firstSource : ℚ := 7517 / 1000000000
def secondSource : ℚ := 2823 / 1000000000
def thirdSource : ℚ := 2990 / 1000000000

def linearCost : ℚ :=
  (∑ j ∈ retained, weight j * (band j).error) +
  firstSource * firstWeight + weight 6 * (3386 / 1000000000) +
  secondSource / 2 * secondWeight +
    (weight 10 * (1455 / 1000000000) + weight 11 * (1022 / 1000000000)) / 2 +
  thirdSource / 6 * thirdWeight +
    (weight 15 * (1431 / 1000000000) + weight 16 * (1688 / 1000000000)) / 6

def groupSum : ℚ := 1 / 1000000000000000000 + 10910 / 1000000000 +
  2302 / 1000000000 + 868 / 1000000000

theorem weighted_union_caps :
    (∑ j ∈ firstHigh, weight j ^ 2) ≤ firstWeight ^ 2 ∧
    (∑ j ∈ secondHigh, weight j ^ 2) ≤ secondWeight ^ 2 ∧
    (∑ j ∈ thirdHigh, weight j ^ 2) ≤ thirdWeight ^ 2 := by
  decide +kernel

/-- Center norms and the resulting three orthogonal-group radii. -/
theorem center_union_caps :
    ((1455 / 1000000000 : ℚ) ^ 2 + (1022 / 1000000000 : ℚ) ^ 2) ≤
      (111129 / 62500000000 : ℚ) ^ 2 ∧
    ((1431 / 1000000000 : ℚ) ^ 2 + (1688 / 1000000000 : ℚ) ^ 2) ≤
      (2212941 / 1000000000000 : ℚ) ^ 2 := by
  decide +kernel

theorem group_radius_caps :
    (∑ j ∈ firstLow, (band j).error ^ 2) +
      (firstSource + 3386 / 1000000000) ^ 2 ≤ (10910 / 1000000000 : ℚ) ^ 2 ∧
    (∑ j ∈ secondLow, (band j).error ^ 2) +
      ((secondSource + 111129 / 62500000000) / 2) ^ 2 ≤
        (2302 / 1000000000 : ℚ) ^ 2 ∧
    (∑ j ∈ thirdLow, (band j).error ^ 2) +
      ((thirdSource + 2212941 / 1000000000000) / 6) ^ 2 ≤
        (868 / 1000000000 : ℚ) ^ 2 := by
  decide +kernel

theorem exact_comparison_budget :
    2 * linearCost + groupSum ^ 2 < 1258 / 1000000000 := by
  decide +kernel

/-- Given the same head, table and Hardy-tail costs as the twelve-band route,
this is the endpoint that the nine-band comparison budget would imply. -/
theorem exact_conditional_endpoint :
    (10000000000000 / 7119464937041 : ℚ) < 14046 / 10000 := by
  decide +kernel

theorem exact_denominator :
    (7119483103461 / 10000000000000 : ℚ) - 1258 / 1000000000 -
      28153 / 1000000000000 - 1 / 2000000 - 30489 / 1000000000000 =
        7119464937041 / 10000000000000 := by
  decide +kernel

end Grothe.Upper.NineBandBudget
