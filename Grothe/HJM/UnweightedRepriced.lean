import Grothe.HJM.OriginUnweightedTail

/-!
# Repricing with the stronger unweighted residual suffix caps

Agent-ID: codex-aa04. Both actual residual
suffix bounds and the published finite-head bounds are explicit hypotheses.
The decimal endpoint below is conditional on these hypotheses.
-/

open MeasureTheory Set Finset GrotheKernel Grothe.Upper

namespace Grothe.HJM

noncomputable section

/-- The exact weighted origin-tail cap from unweighted residual norm 0.0021. -/
def unweightedOriginTail : ℚ :=
  (397752354801503847 / 10 ^ 21) * (19761 / 100000000)

def unweightedScore : ℚ := ScalarTailRefinement.slopeLower -
  ScalarTailRefinement.prefixUpper - (scalarTailBudget + unweightedOriginTail)

def unweightedClaim : ℚ := ScalarTailRefinement.selectorMass / unweightedScore

theorem unweightedScore_pos : 0 < unweightedScore := by
  norm_num [unweightedScore, scalarTailBudget, unweightedOriginTail,
    ScalarTailRefinement.slopeLower, ScalarTailRefinement.prefixUpper,
    ScalarTailRefinement.finite67Upper]

/-- Exact rational form; this is arithmetic, not an unconditional bound. -/
theorem unweightedClaim_eq :
    unweightedClaim =
      100000000000000009759760000000 / 71179525447155802777502735633 := by
  norm_num [unweightedClaim, unweightedScore, scalarTailBudget, unweightedOriginTail,
    ScalarTailRefinement.selectorMass, ScalarTailRefinement.slopeLower,
    ScalarTailRefinement.prefixUpper, ScalarTailRefinement.finite67Upper]

theorem unweightedClaim_lt : (unweightedClaim : ℝ) < 1.404898380143 := by
  rw [unweightedClaim_eq]
  norm_num

/-- The strong unweighted suffix caps supply the exact weighted origin cap. -/
theorem origin_tail_of_strong_unweighted_caps
    (hL : Origin.leftUnweightedTail 120 ≤ (21 / 10000 : ℝ) ^ 2)
    (hR : Origin.rightUnweightedTail 120 ≤ (21 / 10000 : ℝ) ^ 2) :
    |wt 5| * ∑' n, |hc 5 (n + 120)| ≤ (unweightedOriginTail : ℝ) := by
  have hcap := Origin.coeff_tail_at_120_le_of_unweighted_residual_caps hL hR
  change |wt 5| * (∑' j : ℕ, |Origin.coeff (j + 120)|) ≤ (unweightedOriginTail : ℝ)
  rw [wt_five]
  have h := mul_le_mul_of_nonneg_left hcap
    (show (0 : ℝ) ≤ ((397752354801503847 / 10 ^ 21 : ℚ) : ℝ) by norm_num)
  norm_num only [unweightedOriginTail, Rat.cast_mul, Rat.cast_div, Rat.cast_pow,
    Rat.cast_ofNat] at h ⊢
  exact h

/-- Published finite-head inequalities and both full unweighted residual
suffix caps imply the repriced bound. None of these inputs is asserted here. -/
theorem unweighted_hjm_bound_of_head
    (hslope : (ScalarTailRefinement.slopeLower : ℝ) ≤ qhat 0)
    (hprefix : ∑ n ∈ range 119, |qhat (n + 1)| ≤ (ScalarTailRefinement.prefixUpper : ℝ))
    (hL : Origin.leftUnweightedTail 120 ≤ (21 / 10000 : ℝ) ^ 2)
    (hR : Origin.rightUnweightedTail 120 ≤ (21 / 10000 : ℝ) ^ 2) :
    IsGrothendieckBound (unweightedClaim : ℝ) := by
  have hden : 0 < (ScalarTailRefinement.slopeLower : ℝ) -
      ScalarTailRefinement.prefixUpper - ((scalarTailBudget : ℝ) + unweightedOriginTail) := by
    have h : (0 : ℝ) < (unweightedScore : ℝ) := by exact_mod_cast unweightedScore_pos
    simpa only [unweightedScore, Rat.cast_sub, Rat.cast_add] using h
  have h6 := origin_tail_of_strong_unweighted_caps hL hR
  have h := hjm_bound_of_head_origin_tail (unweightedOriginTail : ℝ) hslope hprefix h6 hden
  simpa only [unweightedClaim, unweightedScore, Rat.cast_div, Rat.cast_sub,
    Rat.cast_add] using h

/-- A convenient decimal ceiling under the same explicit assumptions. -/
theorem unweighted_hjm_decimal_bound_of_head
    (hslope : (ScalarTailRefinement.slopeLower : ℝ) ≤ qhat 0)
    (hprefix : ∑ n ∈ range 119, |qhat (n + 1)| ≤ (ScalarTailRefinement.prefixUpper : ℝ))
    (hL : Origin.leftUnweightedTail 120 ≤ (21 / 10000 : ℝ) ^ 2)
    (hR : Origin.rightUnweightedTail 120 ≤ (21 / 10000 : ℝ) ^ 2) :
    IsGrothendieckBound (1404898380143 / 10 ^ 12 : ℝ) :=
  (unweighted_hjm_bound_of_head hslope hprefix hL hR).mono unweightedClaim_lt.le

end
end Grothe.HJM
