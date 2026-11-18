import Grothe.UpperReplacement.GTComparison
import Grothe.UpperTightSix
import Grothe.UpperTightRemainders
import Grothe.UpperClose
import Grothe.UpperQuad.PortFacts.Bundles

/-!
# Production GT table error

Agent-ID: codex-a7c4. The proof combines the public port bundles, the
three twisted quadrature remainders and the frozen energy-table accuracy.
-/

namespace Grothe.UpperReplacement.GTClosed

open Grothe.Upper Grothe.UpperQuad Grothe.UpperChaos

/-- Closed comparison with the actual production rounding, before any preprocessor is chosen. -/
theorem table_error :
    ∑ p ∈ headIdx 501, |GTComparison.actualEG p - (energyTable p : ℝ)| ≤
      (GTComparison.univGTHeadErrQ : ℝ) := by
  obtain ⟨hfirst, hsecond, hthird, hwholeFirst, hwholeSecond, hwholeThird⟩ :=
    TightTwist.six_of_facts PortFacts.j1FactsOf PortFacts.j2FactsOf PortFacts.j3FactsOf
      TightTwist.remainder1 TightTwist.remainder2 TightTwist.remainder3
  exact GTComparison.univ_gt_table_l1_error GTComparison.mass_checked
    hfirst hsecond hthird hwholeFirst hwholeSecond hwholeThird Final.hclose_final

end Grothe.UpperReplacement.GTClosed
