import Grothe.UpperReplacement.GTMass
import Grothe.UpperTightComparison

/-! Universal GT energy-table comparison. Agent-ID: codex-a7c4.
Adapted from the reviewed local gemini-21d5 draft; the accepted production estimates
supply the comparison premises in GTClosed. The unit weight works for every preprocessor.
Mass source SHA256: b21fd00190452861c8f0f3e18f3cf14fef80df636c53565d3a1fbf1eccae3adc.
Comparison source SHA256: a149b24a5d52fcd366b6b643b8d3aaf4d7744a0e82828fcfe395b5b5f738b1bb. -/

set_option warningAsError true

namespace Grothe.UpperReplacement.GTComparison

open MeasureTheory Finset Polynomial Grothe.Upper Grothe.UpperChaos GrotheKernel

noncomputable section

open Grothe.UpperChaos.ThreeBandRegrouping

/-- Energies of the finite Hermite reference `X`. -/
def actualEX : ℕ × ℕ → ℝ :=
  energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn))

/-- Total unweighted `ℓ¹` table discrepancy `∑_{p ∈ headIdx 501} |E_GT(p) - energyTable(p)|`
from the six tighter Gaussian bounds and `hclose`. -/
theorem univ_gt_table_l1_error (hcheck : univMassCheck = true)
    (hfirst : ‖projOn (firstCenterBandModes 0) (firstTaylorL2 - firstCenter)‖ ≤
      (tightLowErrorQ 0 : ℝ))
    (hsecond : ‖projOn (secondCenterBandModes 0) (secondTaylorL2 - secondCenter)‖ ≤
      (tightLowErrorQ 1 : ℝ))
    (hthird : ‖projOn (thirdCenterBandModes 0) (thirdTaylorL2 - thirdCenter)‖ ≤
      (tightLowErrorQ 2 : ℝ))
    (hwholeFirst : ‖firstTaylorL2 - firstCenter‖ ≤ (tightScaledRQ 0 : ℝ))
    (hwholeSecond : ‖secondTaylorL2 - secondCenter‖ ≤ 2 * (tightScaledRQ 1 : ℝ))
    (hwholeThird : ‖thirdTaylorL2 - thirdCenter‖ ≤ 6 * (tightScaledRQ 2 : ℝ))
    (hclose : ∑ p ∈ headIdx 501, |actualEX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)) :
    ∑ p ∈ headIdx 501, |actualEG p - (energyTable p : ℝ)| ≤ (univGTHeadErrQ : ℝ) := by
  have hc := localized_comparison_of_weight_mass_radii phiBound
    (fun _ => (1 : ℝ)) (fun _ => ⟨zero_le_one, le_rfl⟩)
    (fun j => (univThreeBandMassQ j : ℝ))
    (fun j => (tightThreeBandErrorQ j : ℝ))
    (fun p => (tightGroupRadiusQ p : ℝ))
    (fun j => Rat.cast_nonneg.mpr (univThreeBandMassQ_nonneg j))
    (fun j => Rat.cast_nonneg.mpr (tightThreeBandErrorQ_nonneg j))
    (actual_univ_band_mass hcheck table_within hclose)
    (norm_threePiece_tight_le phiBound
      hfirst hsecond hthird hwholeFirst hwholeSecond hwholeThird)
    (norm_source_tight_le phiBound
      hwholeFirst hwholeSecond hwholeThird)
  have hcomp : ∑ p ∈ headIdx 501, |actualEG p - actualEX p| ≤ (univGTCompareQ : ℝ) := by
    simpa only [actualEG, actualEX, productionG, productionX, one_mul,
      univGTCompareQ, tightThreeBandQuadraticQ,
      Rat.cast_add, Rat.cast_mul, Rat.cast_sum, Rat.cast_pow, Rat.cast_ofNat] using hc
  calc ∑ p ∈ headIdx 501, |actualEG p - (energyTable p : ℝ)|
      ≤ ∑ p ∈ headIdx 501, (|actualEG p - actualEX p| + |actualEX p - (energyTable p : ℝ)|) := by
        refine sum_le_sum fun p _ => ?_
        have htri := abs_add_le (actualEG p - actualEX p) (actualEX p - (energyTable p : ℝ))
        have heq : (actualEG p - actualEX p) + (actualEX p - (energyTable p : ℝ))
            = actualEG p - (energyTable p : ℝ) := by ring
        rwa [heq] at htri
    _ = (∑ p ∈ headIdx 501, |actualEG p - actualEX p|)
        + ∑ p ∈ headIdx 501, |actualEX p - (energyTable p : ℝ)| := sum_add_distrib
    _ ≤ (univGTCompareQ : ℝ) + (energyErrQ : ℝ) := add_le_add hcomp hclose
    _ = (univGTHeadErrQ : ℝ) := by simp [univGTHeadErrQ]

end

end Grothe.UpperReplacement.GTComparison
