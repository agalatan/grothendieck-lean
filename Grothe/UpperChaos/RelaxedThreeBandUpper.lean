import Grothe.UpperChaos.RelaxedThreeBandComparison
import Grothe.UpperChaos.ThreeBandEndpointAdapter
import Grothe.UpperTarget

/-!
# The strict upper target from relaxed three-band estimates

The original production rounding, energy table, whole-error radii and Hardy estimate are used
unchanged. The larger low-band allowances of `RelaxedThreeBandBudget` permit weaker quadrature
remainders while keeping the resulting bound strictly below `1.4046`.

This is an assembly theorem: the six Gaussian estimates and table accuracy remain explicit
until the analytic remainder proofs and the finite facts supply them.

Agent-ID: codex-1a87. Refs #332, #334, #335.
-/

set_option warningAsError true

namespace Grothe.UpperChaos.RelaxedThreeBandEndpoint

open MeasureTheory Finset Grothe.Upper GrotheKernel ThreeBandEndpoint

noncomputable section

/-- Transfer the relaxed comparison estimate to a Grothendieck bound for the actual rounding. -/
theorem endpoint_of_comparison
    (hcompare : ∑ p ∈ headIdx 501, comparisonWeight p * |actualE p - actualEX p| ≤
      (relaxedThreeBandCompareQ : ℝ))
    (hclose : TableAccuracy) :
    Grothe.IsGrothendieckBound (relaxedThreeBandValueQ : ℝ) := by
  obtain ⟨hv, hs, hpX⟩ := structural_fields measurable_GT (norm_GT_le phiBound)
    (fun _ u hc ↦ GT_rot2 hc u) (memLp_GT phiBound)
    (memLp_Xfun phiBound chargeFn_frozenCorrectionFn)
    (Xfun_rot2 phiBound chargeFn_frozenCorrectionFn)
  have hp : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → actualE p = 0 :=
    energy_eq_zero_of_even (memLp_GT phiBound) (fun _ u hc ↦ GT_rot2 hc u)
  have htable : ∑ j ∈ range 251,
      |kernelCoeff actualEX j - if j = 0 then (slopeQ : ℝ) else 0| ≤
        (headCapQ : ℝ) + (energyErrQ : ℝ) := by
    have h1 := Grothe.Upper.head_residual_le primaryPoly auxPoly Grothe.l1_primaryPoly
      Grothe.l1_auxPoly Grothe.auxPoly_coeff_zero actualEX
      (fun p ↦ (energyTable p : ℝ)) hpX (N := 501) (K := 251)
      (by norm_num) (slopeQ : ℝ)
    have h2 : ∑ j ∈ range 251,
        |∑ p ∈ headIdx 501, (energyTable p : ℝ) *
          (termOf primaryPoly auxPoly p).coeff j - if j = 0 then (slopeQ : ℝ) else 0| ≤
        (headCapQ : ℝ) := head_le_of_check Grothe.head_check
    change ∑ p ∈ headIdx 501, |actualEX p - (energyTable p : ℝ)| ≤
      (energyErrQ : ℝ) at hclose
    unfold kernelCoeff
    linarith
  have hhead : ∑ j ∈ range 251,
      |kernelCoeff actualE j - if j = 0 then (slopeQ : ℝ) else 0| ≤
        (headCapQ : ℝ) + (energyErrQ : ℝ) + (relaxedThreeBandCompareQ : ℝ) := by
    have hloc := head_residual_le_weighted primaryPoly auxPoly Grothe.auxPoly_coeff_zero
      actualE actualEX hp (N := 501) (K := 251) (by norm_num) (slopeQ : ℝ)
      comparisonWeight (fun p _ ↦ comparisonWeight_sound p)
    have heq : (∑ j ∈ range 251,
        |∑ p ∈ headIdx 501, actualEX p * (termOf primaryPoly auxPoly p).coeff j -
          if j = 0 then (slopeQ : ℝ) else 0|) =
        ∑ j ∈ range 251, |kernelCoeff actualEX j - if j = 0 then (slopeQ : ℝ) else 0| := by
      refine sum_congr rfl fun j hj ↦ ?_
      rw [show kernelCoeff actualEX j = ∑ p ∈ headIdx 501,
        actualEX p * (termOf primaryPoly auxPoly p).coeff j from
        bivarKernel_eq_head primaryPoly auxPoly Grothe.auxPoly_coeff_zero actualEX hpX
          (by have := mem_range.mp hj; omega)]
    rw [heq] at hloc
    exact hloc.trans (add_le_add htable hcompare)
  have htail : ∑' n, |kernelCoeff actualE (n + 251)| ≤ (threeBandRawTailQ : ℝ) :=
    Grothe.hardy_tail (kernelCoeff actualE) (4149 / 4000 : ℝ) (by norm_num)
      (7 / 4) (HardyReal.hardy_GT phiBound) 251 (threeBandRawTailQ : ℝ)
      (by norm_num [threeBandRawTailQ]) threeBand_raw_hardy_numeric
  have hres : |kernelCoeff actualE 0 - (slopeQ : ℝ)| +
      ∑' n, |kernelCoeff actualE (n + 1)| ≤ (relaxedThreeBandResidualQ : ℝ) := by
    rw [Grothe.residual_split (kernelCoeff actualE) (Grothe.summable_kernelCoeff hs)
      (slopeQ : ℝ) 250]
    simpa only [relaxedThreeBandResidualQ, Rat.cast_add] using add_le_add hhead htail
  have hdelta : (relaxedThreeBandResidualQ : ℝ) < (slopeQ : ℝ) := by
    exact_mod_cast relaxedThreeBandResidualQ_lt_slopeQ
  have hu := Grothe.transfer (kernelCoeff actualE) (Grothe.summable_kernelCoeff hs) hv hdelta hres
  rwa [relaxedThreeBand_real_reciprocal] at hu

end

end Grothe.UpperChaos.RelaxedThreeBandEndpoint

namespace Grothe.Statement

open MeasureTheory Grothe.Upper Grothe.UpperChaos

noncomputable section

/-- The unchanged strict target from the relaxed low bands and original whole-error bounds. -/
theorem upper_target_of_relaxed_inputs
    (hfirst : ‖projOn (firstCenterBandModes 0) (firstTaylorL2 - firstCenter)‖ ≤
      (relaxedLowErrorQ 0 : ℝ))
    (hsecond : ‖projOn (secondCenterBandModes 0) (secondTaylorL2 - secondCenter)‖ ≤
      (relaxedLowErrorQ 1 : ℝ))
    (hthird : ‖projOn (thirdCenterBandModes 0) (thirdTaylorL2 - thirdCenter)‖ ≤
      (relaxedLowErrorQ 2 : ℝ))
    (hwholeFirst : ‖firstTaylorL2 - firstCenter‖ ≤ (comparisonGroupRadiusQ 1 : ℝ))
    (hwholeSecond : ‖secondTaylorL2 - secondCenter‖ ≤ 2 * (comparisonGroupRadiusQ 2 : ℝ))
    (hwholeThird : ‖thirdTaylorL2 - thirdCenter‖ ≤ 6 * (comparisonGroupRadiusQ 3 : ℝ))
    (hclose : ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)) :
    UpperTarget :=
  upperBelow_of_bound
    (RelaxedThreeBandEndpoint.endpoint_of_comparison
      (ThreeBandRegrouping.localized_comparison_relaxed_three_band
        hfirst hsecond hthird hwholeFirst hwholeSecond hwholeThird hclose) hclose)
    relaxedThreeBand_real_value_lt

end

end Grothe.Statement
