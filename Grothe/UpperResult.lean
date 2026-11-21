import Grothe.UpperReplacement.MixtureCertificate
import Grothe.UpperReplacement.GTClosed
import Grothe.UpperReplacement.GammaDagger

set_option warningAsError true

/-!
# The upper bound for the complex Grothendieck constant

Agent-ID: codex-a7c4. This endpoint has no certificate hypotheses: every finite interval,
analytic continuation, and infinite-tail obligation is supplied by an imported proof.
-/

namespace Grothe.UpperReplacement

theorem bound : IsGrothendieckBound (1000000000000000 / 711962052581159) :=
  bound_of_table_error GTClosed.table_error

/-- The exact rational upper bound on the infimum defining the complex constant. -/
theorem constant_le : Statement.complexGrothendieckConstant ≤ (1000000000000000 / 711962052581159 : ℝ) :=
  csInf_le Statement.bounds_bddBelow (Statement.isBound_iff.mpr bound)

theorem upper_below : Statement.UpperBelow (1404569241261 / 10 ^ 12) :=
  Statement.upperBelow_of_bound bound (by norm_num)

theorem constant_lt : Statement.complexGrothendieckConstant < (1404569241261 / 10 ^ 12 : ℝ) :=
  Statement.constant_lt_of_upperBelow upper_below

/-- The mixture places the complex Grothendieck constant below the reciprocal phase integral. -/
theorem constant_lt_inv_gammaDagger : Statement.complexGrothendieckConstant < 1 / gammaDagger :=
  constant_lt.trans ((by norm_num : (1404569241261 / 10 ^ 12 : ℝ) <
    140457588 / 100000000).trans inv_gammaDagger_gt)

end Grothe.UpperReplacement
