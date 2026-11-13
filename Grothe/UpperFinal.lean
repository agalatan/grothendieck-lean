import Grothe.UpperQuad.RelaxedTwistSix
import Grothe.UpperQuad.PortFacts.Bundles
import Grothe.UpperQuad.TwistEllipseMassSound
import Grothe.UpperQuad.TwistEllipseFacts.Checks
import Grothe.UpperQuad.Facts.Final
import Grothe.UpperQuad.Facts.Omitted
import Grothe.UpperQuad.QuadDecomp
import Grothe.UpperQuad.QuadEllipseFacts.All

/-!
# The upper bound `K_G^ℂ < 1.4046`, without hypotheses

`RelaxedTwist.upper_target_of_facts` reduces the upper target to three groups of inputs; all are
proved here from the native certificate facts:

* the finite port facts of the three Taylor powers (`PortFacts.j1FactsOf`, `j2FactsOf`,
  `j3FactsOf`);
* the twisted Gauss–Legendre remainders on the covered set, `TwistRemainderHyp j ρ_j` with the
  relaxed panel radii `ρ_j = 4·10⁻⁹, 1.4·10⁻⁸, 7·10⁻⁸` minus the `10⁻¹⁵` tail reserve
  (`twistRemainder1/2/3`): the 21 accepted shard facts and the accepted total of each power,
  through `TwistEllCheck.remainder_of_prodShards`;
* the accuracy of the energy table (`hclose_final`): the 13 energy facts with the quadrature
  hypothesis `QuadHyp`, assembled from the tail, the omitted pairs (`Facts.omittedCheck`) and the
  covered-set remainder (`EllCheck.quadRemainderHyp`).

Agent-ID: claude-b9ee. Refs #334.
-/

namespace Grothe.UpperQuad.Final

open GrotheQuad Grothe.UpperQuad Grothe.UpperChaos Grothe.Upper TwistEllCheck

/-- The twisted remainder of the first power, from its shard and total facts. -/
theorem twistRemainder1 : TwistRemainderHyp 1 (relaxedPanelRadiusQ 0 : ℝ) := by
  have h := remainder_of_prodShards (0 : Power) j1Certificates
    (fun i hi ↦ by
      interval_cases i
      exacts [Facts.j1Range00, Facts.j1Range01, Facts.j1Range02, Facts.j1Range03,
        Facts.j1Range04, Facts.j1Range05, Facts.j1Range06, Facts.j1Range07, Facts.j1Range08,
        Facts.j1Range09, Facts.j1Range10, Facts.j1Range11, Facts.j1Range12, Facts.j1Range13,
        Facts.j1Range14, Facts.j1Range15, Facts.j1Range16, Facts.j1Range17, Facts.j1Range18,
        Facts.j1Range19, Facts.j1Range20])
    Facts.j1Total
  have hb : (((3999999 : ℚ) / 1000000000000000 : ℚ) : ℝ) = (relaxedPanelRadiusQ 0 : ℝ) := by
    norm_num [relaxedPanelRadiusQ, relaxedQuadRadiusQ]
  exact hb ▸ h

/-- The twisted remainder of the second power, from its shard and total facts. -/
theorem twistRemainder2 : TwistRemainderHyp 2 (relaxedPanelRadiusQ 1 : ℝ) := by
  have h := remainder_of_prodShards (1 : Power) j2Certificates
    (fun i hi ↦ by
      interval_cases i
      exacts [Facts.j2Range00, Facts.j2Range01, Facts.j2Range02, Facts.j2Range03,
        Facts.j2Range04, Facts.j2Range05, Facts.j2Range06, Facts.j2Range07, Facts.j2Range08,
        Facts.j2Range09, Facts.j2Range10, Facts.j2Range11, Facts.j2Range12, Facts.j2Range13,
        Facts.j2Range14, Facts.j2Range15, Facts.j2Range16, Facts.j2Range17, Facts.j2Range18,
        Facts.j2Range19, Facts.j2Range20])
    Facts.j2Total
  have hb : (((13999999 : ℚ) / 1000000000000000 : ℚ) : ℝ) = (relaxedPanelRadiusQ 1 : ℝ) := by
    norm_num [relaxedPanelRadiusQ, relaxedQuadRadiusQ]
  exact hb ▸ h

/-- The twisted remainder of the third power, from its shard and total facts. -/
theorem twistRemainder3 : TwistRemainderHyp 3 (relaxedPanelRadiusQ 2 : ℝ) := by
  have h := remainder_of_prodShards (2 : Power) j3Certificates
    (fun i hi ↦ by
      interval_cases i
      exacts [Facts.j3Range00, Facts.j3Range01, Facts.j3Range02, Facts.j3Range03,
        Facts.j3Range04, Facts.j3Range05, Facts.j3Range06, Facts.j3Range07, Facts.j3Range08,
        Facts.j3Range09, Facts.j3Range10, Facts.j3Range11, Facts.j3Range12, Facts.j3Range13,
        Facts.j3Range14, Facts.j3Range15, Facts.j3Range16, Facts.j3Range17, Facts.j3Range18,
        Facts.j3Range19, Facts.j3Range20])
    Facts.j3Total
  have hb : (((69999999 : ℚ) / 1000000000000000 : ℚ) : ℝ) = (relaxedPanelRadiusQ 2 : ℝ) := by
    norm_num [relaxedPanelRadiusQ, relaxedQuadRadiusQ]
  exact hb ▸ h

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

namespace Grothe.Statement

open Grothe.UpperQuad

/-- **The upper bound**: some Grothendieck bound is below `1.4046`. -/
theorem upper_target : UpperTarget :=
  RelaxedTwist.upper_target_of_facts PortFacts.j1FactsOf PortFacts.j2FactsOf PortFacts.j3FactsOf
    Final.twistRemainder1 Final.twistRemainder2 Final.twistRemainder3 Final.hclose_final

end Grothe.Statement
