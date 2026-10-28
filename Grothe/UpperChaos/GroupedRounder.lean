import Grothe.UpperChaos.PhiBound
import Grothe.UpperChaos.GroupedComparison
import Grothe.UpperChaos.ConcreteTaylorUpper
import Grothe.Upper.GroupedBridge

/-!
# The sharp upper bound for the concrete rounding

`fresh_upper_rounder`: `K_G^ℂ ≤ 500000000000000000/355973699960428191 < 1.404598148840` from the explicit
comparison inputs and the energy-table accuracy (the Hardy input is proved), with the grouped comparison.
`fresh_upper_concrete_taylor` fixes the Taylor centers; `fresh_upper_pieces` states the inputs as the 18 band norms.
-/

open GrotheKernel Grothe.Upper

namespace Grothe.UpperChaos

noncomputable section

/-- **The sharp upper bound for the concrete rounding** from the comparison inputs and the table accuracy. -/
theorem fresh_upper_rounder {X : ℂ × ℂ → ℂ} (hXL : MeasureTheory.MemLp X 2 mu2)
    (hXch : ∀ c u, ‖c‖ = 1 → X (rot2 c u) = c * X u)
    (herrors : ComparisonInputs ((memLp_GT phiBound).toLp GT) (hXL.toLp X))
    (hclose : ∑ p ∈ headIdx 501, |energy (hXL.toLp X) p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)) :
    IsGrothendieckBound (500000000000000000 / 355973699960428191) := by
  have hcompare := localized_comparison_grouped herrors hclose
  obtain ⟨hv, hs, hsX, hpX⟩ := structural_fields measurable_GT (norm_GT_le phiBound)
    (fun _ u hc => GT_rot2 hc u) (memLp_GT phiBound) hXL hXch
  have hc : (groupedCompareQ : ℝ) ≤ compareQ := by exact_mod_cast groupedCompareQ_le_compareQ
  have hE : DirectHyps (energy ((memLp_GT phiBound).toLp GT)) (energy (hXL.toLp X)) :=
    ⟨hv, hs, hsX, hpX, energy_eq_zero_of_even (memLp_GT phiBound)
      (fun _ u hc => GT_rot2 hc u), hcompare.trans hc, hclose, HardyReal.hardy_GT_tight phiBound⟩
  exact fresh_upper _ _ hE hcompare

/-- **The sharp upper bound for the specified Taylor centers**: only the finite-band Gaussian error families and
the energy-table accuracy remain assumptions. -/
theorem fresh_upper_concrete_taylor
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
    IsGrothendieckBound (500000000000000000 / 355973699960428191) :=
  fresh_upper_rounder (memLp_Xfun phiBound chargeFn_frozenCorrectionFn)
    (Xfun_rot2 phiBound chargeFn_frozenCorrectionFn)
    (comparisonInputs_taylorCenters hfirst hsecond hthird) hclose

/-- **The sharp upper bound from the 18 band norms of an explicit decomposition**: for charge-one `L²` functions
`v, c₁, c₂, c₃`, the remaining inputs are the 18 norm bounds `‖P_I srcₖ‖ ≤ εₖ` of the band pieces of the unsmoothed
sources and the table accuracy of `X = S(F₀ + v)`. -/
theorem fresh_upper_pieces {v c₁ c₂ c₃ : ℂ × ℂ → ℂ}
    (hv : ChargeFn v) (h₁ : ChargeFn c₁) (h₂ : ChargeFn c₂) (h₃ : ChargeFn c₃)
    (hnorm : ∀ k, ‖bandProj (comparisonBand k) ((chargeFn_srcP phiBound hv h₁ h₂ h₃ (pw k)).memLp.toLp
      (srcP v c₁ c₂ c₃ (pw k)))‖ ≤ ((comparisonBand k).error : ℝ))
    (hclose : ∑ p ∈ Grothe.Upper.headIdx 501,
      |energy ((memLp_Xfun phiBound hv).toLp (Xfun v)) p - (Grothe.Upper.energyTable p : ℝ)|
      ≤ (Grothe.Upper.energyErrQ : ℝ)) :
    IsGrothendieckBound (500000000000000000 / 355973699960428191) :=
  fresh_upper_rounder (memLp_Xfun phiBound hv) (Xfun_rot2 phiBound hv)
    (comparisonInputs_of_norms phiBound hv h₁ h₂ h₃ fun k =>
      (norm_piece_le phiBound hv h₁ h₂ h₃ k).trans (hnorm k)) hclose

end
end Grothe.UpperChaos
