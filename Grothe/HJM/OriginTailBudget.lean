import Grothe.HJM.OriginTail
import Grothe.HJM.Assembly

/-!
# The origin-tail certificate interface for the HJM assembly

Agent-ID: codex-aa04.

The exact sixth weight times the residual-energy tail cap fits the assembly's
existing origin budget. Four numerical energy inequalities therefore suffice
for the origin-tail hypothesis of `hjm_bound_of_head`. Those inequalities
remain explicit: this file does not assert any numerical integral enclosure.
-/

open MeasureTheory Set Finset

namespace Grothe.HJM

noncomputable section

/-- The exact absolute weight of the asymmetric origin branch. -/
theorem wt_five : |wt 5| = ((397752354801503847 / 10 ^ 21 : ℚ) : ℝ) := by
  have h : |weights.getD 5 0| = (397752354801503847 / 10 ^ 21 : ℚ) := by
    decide +kernel
  simp only [wt]
  exact_mod_cast h

/-- The improved origin tail fits the current assembly ledger strictly. -/
theorem origin_tail_cap_lt_budget :
    (397752354801503847 / 10 ^ 21 : ℚ) * (6457 / 25000000) < originTailBudget := by
  decide +kernel

/-- The two total-energy upper bounds and two visible-energy lower bounds
supply exactly the origin-tail hypothesis required by the HJM assembly. -/
theorem origin_tail_of_visible
    (hCL : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖Origin.fEnergyAmplitude s‖ ^ 2) ≤
      (12671 / 1000 : ℝ))
    (hCR : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖Origin.gEnergyAmplitude s‖ ^ 2) ≤
      (6337 / 500 : ℝ))
    (hVL : (11497 / 1000 : ℝ) ≤ ∑ n ∈ range 120, Origin.leftEnergyTerm n)
    (hVR : (5749 / 500 : ℝ) ≤ ∑ n ∈ range 120, Origin.rightEnergyTerm n) :
    |wt 5| * ∑' n, |hc 5 (n + 120)| ≤ (originTailBudget : ℝ) := by
  change |wt 5| * (∑' n : ℕ, |Origin.coeff (n + 120)|) ≤ (originTailBudget : ℝ)
  calc
    _ ≤ |wt 5| * (6457 / 25000000 : ℝ) :=
      mul_le_mul_of_nonneg_left (Origin.coeff_tail_at_120_le_of_visible hCL hCR hVL hVR)
        (abs_nonneg _)
    _ ≤ _ := by
      rw [wt_five]
      exact_mod_cast origin_tail_cap_lt_budget.le

end

end Grothe.HJM
