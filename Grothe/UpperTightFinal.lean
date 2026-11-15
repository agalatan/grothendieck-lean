-- Grothe/UpperTightFinal.lean
import Grothe.UpperChaos.HardyGaussian
import Grothe.HeadHardy
import Grothe.UpperHead
import Grothe.UpperTightComparison
import Grothe.UpperTightSix
import Grothe.UpperTightPanelTotals
import Grothe.UpperClose
import Grothe.UpperTarget
import Grothe.UpperChaos.Structural
import Grothe.UpperChaos.ConcreteTaylorUpper
import Grothe.UpperQuad.PortFacts.Bundles
import Grothe.UpperQuad.TwistEllipseFacts.Checks
import Grothe.UpperQuad.TwistEllipseMassSound

/-!
# The tighter unconditional upper bound from the existing certificates

The same accepted panels and port tables give smaller quadrature and whole-source error radii.
The comparison combines those radii with longer coefficient prefixes and their exact mass
certificate, using the existing energy-table accuracy estimate.
The Gaussian-amplitude integral supplies the Hardy budget `117/100`; the final transfer
deducts the forced linear energy before applying its tail estimate.

Agent-ID: codex-c8a4. Refs #389.
Coefficient refinement: Agent-ID: codex-9b17. Refs #379.
Gaussian-amplitude refinement: Agent-ID: codex-9b17. Refs #380.
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

namespace Grothe.UpperChaos.TightEndpoint

open Finset Grothe.Upper GrotheKernel

noncomputable section

/-- The energies of the production rounding `G_T`. -/
def actualE : ℕ × ℕ → ℝ := energy ((memLp_GT phiBound).toLp GT)

/-- The energies of the stored finite Hermite expansion `X`. -/
def actualEX : ℕ × ℕ → ℝ :=
  energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn))

/-- The accuracy of the stored energy table on the head (`Final.hclose_final`). -/
def TableAccuracy : Prop :=
  ∑ p ∈ headIdx 501, |actualEX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)

/-- The production comparison feeds a shared finite-head/Hardy transfer theorem. -/
theorem endpoint_of_comparison
    (hcompare : ∑ p ∈ headIdx 501, improvedWeight p * |actualE p - actualEX p| ≤
      (tightThreeBandCompareQ : ℝ))
    (hclose : TableAccuracy) :
    Grothe.IsGrothendieckBound (tightValueQ : ℝ) := by
  obtain ⟨hv, hs, hpX⟩ := structural_fields measurable_GT (norm_GT_le phiBound)
    (fun _ u hc ↦ GT_rot2 hc u) (memLp_GT phiBound)
    (memLp_Xfun phiBound chargeFn_frozenCorrectionFn)
    (Xfun_rot2 phiBound chargeFn_frozenCorrectionFn)
  have hp : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → actualE p = 0 :=
    energy_eq_zero_of_even (memLp_GT phiBound) (fun _ u hc ↦ GT_rot2 hc u)
  have hhead : ∑ j ∈ range 251, |kernelCoeff actualE j - if j = 0 then (slopeQ : ℝ) else 0| ≤
      (tightHeadResidualQ : ℝ) := by
    simpa only [tightHeadResidualQ, Rat.cast_add] using
      kernel_head_residual_le_of_comparison actualE actualEX hp hpX Grothe.head_check
        improvedWeight_sound hclose hcompare
  have hL : 0 ≤ (slopeQ : ℝ) - (tightHeadResidualQ : ℝ) := by
    simpa only [tightLinearLowerQ, Rat.cast_sub] using
      (show 0 ≤ (tightLinearLowerQ : ℝ) from by exact_mod_cast tightLinearLowerQ_pos.le)
  have hnum :
      ((117 / 100 - ((slopeQ : ℝ) - (tightHeadResidualQ : ℝ)) ^ 2 *
        (4149 / 4000 : ℝ) ^ 2) / (4149 / 4000 : ℝ) ^ 4) *
          (4149 / 4000 : ℝ)⁻¹ ^ (2 * (2 * 250 + 1)) ≤
        (tightTailQ : ℝ) ^ 2 * (1 - (4149 / 4000 : ℝ)⁻¹ ^ 4) := by
    simpa only [tightShiftedBudgetQ, tightLinearLowerQ, Rat.cast_div, Rat.cast_sub,
      Rat.cast_pow, Rat.cast_mul, Rat.cast_ofNat] using tight_hardy_numeric
  have hdelta : (tightHeadResidualQ : ℝ) + (tightTailQ : ℝ) < (slopeQ : ℝ) := by
    simpa only [tightResidualQ, Rat.cast_add] using
      (show (tightResidualQ : ℝ) < (slopeQ : ℝ) from by
        exact_mod_cast tightResidualQ_lt_slopeQ)
  have hu := Grothe.transfer_of_head_hardy (Grothe.summable_kernelCoeff hs) hv
    (K := 250) (by norm_num : (1 : ℝ) < 4149 / 4000) hL hhead
    (HardyReal.hardy_GT_gaussian phiBound)
    (by exact_mod_cast tightTailQ_nonneg) hnum hdelta
  have heq : (tightHeadResidualQ : ℝ) + (tightTailQ : ℝ) = (tightResidualQ : ℝ) := by
    simp only [tightResidualQ, Rat.cast_add]
  rwa [heq, tight_real_reciprocal] at hu

end

end Grothe.UpperChaos.TightEndpoint

namespace Grothe.Statement

open Grothe.Upper Grothe.UpperQuad Grothe.UpperChaos

/-- The existing certificates supply the tighter exact rational Grothendieck bound. -/
theorem upper_bound_tight : Grothe.IsGrothendieckBound (tightValueQ : ℝ) := by
  obtain ⟨hfirst, hsecond, hthird, hwholeFirst, hwholeSecond, hwholeThird⟩ :=
    TightTwist.six_of_facts PortFacts.j1FactsOf PortFacts.j2FactsOf PortFacts.j3FactsOf
      TightTwist.remainder1 TightTwist.remainder2 TightTwist.remainder3
  exact TightEndpoint.endpoint_of_comparison
    (ThreeBandRegrouping.localized_comparison_tight_three_band
      hfirst hsecond hthird hwholeFirst hwholeSecond hwholeThird Final.hclose_final)
    Final.hclose_final

/-- Some Grothendieck bound lies strictly below `1.404599395362`, without hypotheses. -/
theorem upper_below_tight : UpperBelow (1404599395362 / 10 ^ 12) := by
  apply upperBelow_of_bound upper_bound_tight
  convert tight_real_value_lt using 1
  norm_num

/-- The improved unconditional upper bound for the complex Grothendieck constant. -/
theorem constant_lt_tight_upper : complexGrothendieckConstant < 1404599395362 / 10 ^ 12 :=
  constant_lt_of_upperBelow upper_below_tight

end Grothe.Statement
