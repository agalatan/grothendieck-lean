import Grothe.UpperTightPanelTotals
import Grothe.UpperQuad.TwistEllipseFacts.Checks
import Grothe.UpperQuad.TwistEllipseMassSound

/-!
# Twisted quadrature remainders for the shared GT comparison

The production shard and panel-total certificates give the three remainder
bounds consumed by the Gaussian estimates. These proofs and their public
names are carried over verbatim from the earlier single-channel endpoint.

Original proofs by codex-c8a4. Agent-ID: codex-a7c4.
-/

namespace Grothe.UpperQuad.TightTwist

open Grothe.Upper Grothe.UpperChaos TwistEllCheck

/-- The first tightened remainder reuses every existing accepted production shard. -/
theorem remainder1 : TwistRemainderHyp 1 (tightPanelRadiusQ 0 : ℝ) := by
  exact remainder_of_prodShards (0 : Power) j1Certificates
    (fun i hi ↦ by
      interval_cases i
      exacts [Facts.j1Range00, Facts.j1Range01, Facts.j1Range02, Facts.j1Range03,
        Facts.j1Range04, Facts.j1Range05, Facts.j1Range06, Facts.j1Range07, Facts.j1Range08,
        Facts.j1Range09, Facts.j1Range10, Facts.j1Range11, Facts.j1Range12, Facts.j1Range13,
        Facts.j1Range14, Facts.j1Range15, Facts.j1Range16, Facts.j1Range17, Facts.j1Range18,
        Facts.j1Range19, Facts.j1Range20]) Facts.j1TightTotal

/-- The second tightened remainder reuses every existing accepted production shard. -/
theorem remainder2 : TwistRemainderHyp 2 (tightPanelRadiusQ 1 : ℝ) := by
  exact remainder_of_prodShards (1 : Power) j2Certificates
    (fun i hi ↦ by
      interval_cases i
      exacts [Facts.j2Range00, Facts.j2Range01, Facts.j2Range02, Facts.j2Range03,
        Facts.j2Range04, Facts.j2Range05, Facts.j2Range06, Facts.j2Range07, Facts.j2Range08,
        Facts.j2Range09, Facts.j2Range10, Facts.j2Range11, Facts.j2Range12, Facts.j2Range13,
        Facts.j2Range14, Facts.j2Range15, Facts.j2Range16, Facts.j2Range17, Facts.j2Range18,
        Facts.j2Range19, Facts.j2Range20]) Facts.j2TightTotal

/-- The third tightened remainder reuses every existing accepted production shard. -/
theorem remainder3 : TwistRemainderHyp 3 (tightPanelRadiusQ 2 : ℝ) := by
  exact remainder_of_prodShards (2 : Power) j3Certificates
    (fun i hi ↦ by
      interval_cases i
      exacts [Facts.j3Range00, Facts.j3Range01, Facts.j3Range02, Facts.j3Range03,
        Facts.j3Range04, Facts.j3Range05, Facts.j3Range06, Facts.j3Range07, Facts.j3Range08,
        Facts.j3Range09, Facts.j3Range10, Facts.j3Range11, Facts.j3Range12, Facts.j3Range13,
        Facts.j3Range14, Facts.j3Range15, Facts.j3Range16, Facts.j3Range17, Facts.j3Range18,
        Facts.j3Range19, Facts.j3Range20]) Facts.j3TightTotal

end Grothe.UpperQuad.TightTwist
