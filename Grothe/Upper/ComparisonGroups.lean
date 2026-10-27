/- Intended path: Grothe/Upper/ComparisonGroups.lean -/
import Grothe.Upper.ComparisonOverlap
import Grothe.Upper.GroupedComparison

/-! The eighteen comparison pieces form four groups whose bands are disjoint
within each group. All group radii and the improved budget are rational. -/

namespace Grothe.Upper

open Finset GrotheKernel

abbrev GroupedComparisonIndex := Fin 18

/-- The full-band piece and the three disjoint Taylor-piece partitions. -/
def comparisonGroup (j : GroupedComparisonIndex) : Fin 4 :=
  if j.val = 0 then 0 else if j.val < 8 then 1 else if j.val < 13 then 2 else 3

/-- Rational upper bounds for the Euclidean norms of the four groups. -/
def comparisonGroupRadiusQ (g : Fin 4) : ℚ :=
  if g = 0 then 1 / 1000000000000000000 else
  if g = 1 then 7438538917225 / 1000000000000000000 else
  if g = 2 then 1164322916284 / 1000000000000000000 else
    355864656182 / 1000000000000000000

def groupedCompareQ : ℚ := 851922301 / 1000000000000000

/-- Distinct pieces in the same group cannot meet. -/
lemma comparison_group_separate :
    ∀ j k : GroupedComparisonIndex, comparisonGroup j = comparisonGroup k → j ≠ k →
      comparisonOverlap comparisonBands[j] comparisonBands[k] = false := by
  decide +kernel

/-- The sum of the squared component radii in each group has the displayed
rational square root. -/
lemma comparison_group_radii : ∀ g : Fin 4, 0 ≤ comparisonGroupRadiusQ g ∧
    ∑ j : GroupedComparisonIndex,
      (if comparisonGroup j = g then comparisonBands[j].error ^ 2 else 0) ≤
      comparisonGroupRadiusQ g ^ 2 := by
  decide +kernel

/-- The linear comparison term is unchanged; only the quadratic term is grouped. -/
lemma comparison_grouped_budget :
    2 * (comparisonBands.map fun b => b.norm * b.error).sum +
      (∑ g : Fin 4, comparisonGroupRadiusQ g) ^ 2 ≤ groupedCompareQ := by
  decide +kernel

lemma groupedCompareQ_le_compareQ : groupedCompareQ ≤ compareQ := by
  norm_num [groupedCompareQ, compareQ]

end Grothe.Upper
