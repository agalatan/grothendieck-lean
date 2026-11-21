import Grothe.UpperReplacement.Assembly
import Grothe.UpperReplacement.TailFacts

set_option warningAsError true

/-!
# The eighteen-channel bound from the GT table comparison

Agent-ID: codex-a7c4. All head and contour certificates are closed here.
The only argument is the comparison with the production energy table.
-/

namespace Grothe.UpperReplacement

open Finset Upper

theorem bound_of_table_error
    (hGT : ∑ p ∈ headIdx 501, |GTComparison.actualEG p - (energyTable p : ℝ)| ≤
      (GTComparison.univGTHeadErrQ : ℝ)) :
    IsGrothendieckBound (1000000000000000 / 711962052581159) :=
  Assembly.bound_of_checks hGT TailFacts.all_channels

end Grothe.UpperReplacement
