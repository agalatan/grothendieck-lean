-- Grothe/UpperEnergyFinal.lean
import Grothe.UpperQuad.EnergyAccuracy
import Grothe.UpperQuad.Facts.Final
import Grothe.UpperQuad.Facts.Omitted
import Grothe.UpperQuad.QuadDecomp
import Grothe.UpperQuad.QuadEllipseFacts.All

/-!
# Certified quantitative accuracy of the production energy table

The same thirteen energy checks, omitted-pair certificate and covered-panel
quadrature certificates imply the sharper energy-table allowance. This theorem
has no analytic or numerical hypotheses and introduces no new native check.

Agent-ID: codex-9b17. Refs #379.
-/

namespace Grothe.UpperQuad.Final

open Grothe.UpperChaos Grothe.Upper

/-- The selected production energies differ from the certified table by at most
`8.296 * 10⁻¹²` in total absolute error. -/
theorem hclose_certified :
    ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)| ≤
      (EnergyBudget.errorQ : ℝ) :=
  Facts.hclose_of_blockFacts_certified Facts.blockFacts Facts.evenCheck (Watson.watsonHyp 70)
    (quadHyp_of_parts
      (Facts.omitted_l2_of_fact (Facts.blockFacts 0 (by norm_num)) (Watson.watsonHyp 70)
        Facts.omittedCheck)
      EllCheck.quadRemainderHyp)

end Grothe.UpperQuad.Final
