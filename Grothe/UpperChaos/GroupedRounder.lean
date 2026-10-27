/- Intended path: Grothe/UpperChaos/GroupedRounder.lean -/
import Grothe.UpperChaos.PhiBound
import Grothe.UpperChaos.GroupedComparison
import Grothe.UpperChaos.ConcreteTaylorUpper
import Grothe.Upper.GroupedBridge

/-! The grouped endpoint uses exactly the same Gaussian comparison inputs as
`fresh_upper_rounder`; no new numerical assumption is introduced. -/

open GrotheKernel Grothe.Upper

namespace Grothe.UpperChaos

noncomputable section

/-- The improved upper bound for the existing concrete rounding. -/
theorem fresh_upper_rounder_grouped {X : ℂ × ℂ → ℂ} (hXL : MeasureTheory.MemLp X 2 mu2)
    (hXch : ∀ c u, ‖c‖ = 1 → X (rot2 c u) = c * X u)
    (herrors : ComparisonInputs ((memLp_GT phiBound).toLp GT) (hXL.toLp X))
    (hclose : ∑ p ∈ headIdx 501, |energy (hXL.toLp X) p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)) :
    IsGrothendieckBound (500000000000000000 / 355973699884132991) := by
  have hcompare := localized_comparison_grouped herrors hclose
  obtain ⟨hv, hs, hsX, hpX⟩ := structural_fields measurable_GT (norm_GT_le phiBound)
    (fun _ u hc => GT_rot2 hc u) (memLp_GT phiBound) hXL hXch
  have hc : (groupedCompareQ : ℝ) ≤ compareQ := by exact_mod_cast groupedCompareQ_le_compareQ
  have hE : DirectHyps (energy ((memLp_GT phiBound).toLp GT)) (energy (hXL.toLp X)) :=
    ⟨hv, hs, hsX, hpX, energy_eq_zero_of_even (memLp_GT phiBound)
      (fun _ u hc => GT_rot2 hc u), hcompare.trans hc, hclose, HardyReal.hardy_GT phiBound⟩
  exact fresh_upper_grouped _ _ hE hcompare

/-- The same improvement for the specified Taylor centers, with the identical
four remaining Gaussian input families as `fresh_upper_concrete_taylor`. -/
theorem fresh_upper_concrete_taylor_grouped
    (hfirst : ∀ k, ‖projOn (firstCenterBandModes k) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ k : ℝ))
    (hsecond : ∀ k, ‖projOn (secondCenterBandModes k) (secondTaylorL2 - secondCenter)‖ ≤
      (secondCapturedErrorQ k : ℝ))
    (hthird : ∀ k, ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ k : ℝ))
    (hclose : ∑ p ∈ Grothe.Upper.headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (Grothe.Upper.energyTable p : ℝ)| ≤
      (Grothe.Upper.energyErrQ : ℝ)) :
    IsGrothendieckBound (500000000000000000 / 355973699884132991) :=
  fresh_upper_rounder_grouped (memLp_Xfun phiBound chargeFn_frozenCorrectionFn)
    (Xfun_rot2 phiBound chargeFn_frozenCorrectionFn)
    (comparisonInputs_taylorCenters hfirst hsecond hthird) hclose

end
end Grothe.UpperChaos
