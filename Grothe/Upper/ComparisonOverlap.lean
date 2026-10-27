import Grothe.Upper.ComparisonData
import Mathlib.Tactic

/-!
# The quadratic comparison budget retains disjoint degree supports

Only pairs of bands that can meet are charged. This uses the same eighteen
component errors as the finite mass certificate and introduces no Gaussian input.
-/

namespace Grothe.Upper

open GrotheKernel

/-- A conservative test for intersection of the two half-open degree bands. -/
def comparisonOverlap (a b : ComparisonBand) : Bool :=
  decide (¬ ((a.hi ≠ 0 ∧ a.hi ≤ b.lo) ∨ (b.hi ≠ 0 ∧ b.hi ≤ a.lo)))

/-- A pair excluded by the overlap test cannot contain the same degree. -/
lemma comparisonOverlap_separate (a b : ComparisonBand) (n m : ℕ)
    (h : comparisonOverlap a b = false) :
    a.contains n m = false ∨ b.contains n m = false := by
  have hd : (a.hi ≠ 0 ∧ a.hi ≤ b.lo) ∨ (b.hi ≠ 0 ∧ b.hi ≤ a.lo) := by
    simpa only [comparisonOverlap, decide_eq_false_iff_not, not_not] using h
  by_cases ha : a.contains n m = false
  · exact Or.inl ha
  right
  by_contra hb
  have ha' := Bool.eq_true_of_ne_false ha
  have hb' := Bool.eq_true_of_ne_false hb
  simp only [ComparisonBand.contains, Bool.and_eq_true, Bool.or_eq_true,
    decide_eq_true_eq, beq_iff_eq] at ha' hb'
  omega

/-- The sum of the pairwise products for possibly overlapping error pieces. -/
def comparisonQuadraticQ : ℚ :=
  (comparisonBands.map fun a => (comparisonBands.map fun b =>
    if comparisonOverlap a b then a.error * b.error else 0).sum).sum

/-- The exact rational overlap ledger needs no native evaluation. -/
lemma comparison_overlap_budget :
    2 * (comparisonBands.map fun b => b.norm * b.error).sum +
      comparisonQuadraticQ ≤ compareQ := by
  decide +kernel

end Grothe.Upper
