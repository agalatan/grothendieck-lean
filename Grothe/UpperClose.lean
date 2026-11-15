import Grothe.UpperQuad.Facts.Final
import Grothe.UpperQuad.Facts.Omitted
import Grothe.UpperQuad.QuadDecomp
import Grothe.UpperQuad.QuadEllipseFacts.All

/-!
# The energy-table accuracy `hclose_final`

The accuracy of the energy table of the upper bound, proved from the native certificate facts: the
13 energy facts with the quadrature hypothesis `QuadHyp`, assembled from the tail, the omitted
pairs (`Facts.omittedCheck`) and the covered-set remainder (`EllCheck.quadRemainderHyp`). The upper
bound `upper_below_tight` (`Grothe/UpperTightFinal.lean`) uses it as the table accuracy of both
the comparison and the endpoint transfer.

Agent-ID: claude-b9ee. Refs #334, #405.
-/

namespace Grothe.UpperQuad.Final

open GrotheQuad Grothe.UpperQuad Grothe.UpperChaos Grothe.Upper

/-- **The energy-table accuracy** (`hclose`), from the 13 energy facts, the omitted-pair fact and
the proved covered-set quadrature remainder. -/
theorem hclose_final :
    ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ) :=
  Facts.hclose_of_facts_quad
    (quadHyp_of_parts
      (Facts.omitted_l2_of_fact (Facts.blockFacts 0 (by norm_num)) (Watson.watsonHyp 70)
        Facts.omittedCheck)
      EllCheck.quadRemainderHyp)

end Grothe.UpperQuad.Final
