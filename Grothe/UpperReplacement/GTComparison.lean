import Grothe.UpperReplacement.GTMass
import Grothe.UpperTightComparison

/-! Universal GT energy-table comparison. Agent-ID: codex-a7c4, gemini-1aa9.
Adapted from the reviewed local gemini-21d5 draft; the accepted production estimates
supply the comparison premises in GTClosed. The unit weight works for every preprocessor.
Uses `norm_roundingDifference_le` directly so the legacy single-channel comparison and
head checks do not enter the transitive axioms.
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

private theorem norm_rawSource_tight_le' (hφ : PhiBound)
    (hwholeFirst : ‖taylorL2 hφ 1 - firstCenter‖ ≤ (tightScaledRQ 0 : ℝ))
    (hwholeSecond : ‖taylorL2 hφ 2 - secondCenter‖ ≤ 2 * (tightScaledRQ 1 : ℝ))
    (hwholeThird : ‖taylorL2 hφ 3 - thirdCenter‖ ≤ 6 * (tightScaledRQ 2 : ℝ))
    (p : Fin 4) :
    ‖rawSource hφ p‖ ≤ (tightGroupRadiusQ p : ℝ) := by
  fin_cases p
  · change ‖rawSource hφ 0‖ ≤ (comparisonGroupRadiusQ 0 : ℝ)
    rw [rawSource_zero]
    simpa [comparisonGroupRadiusQ] using norm_roundingDifference_le
  · change ‖rawSource hφ 1‖ ≤ (tightScaledRQ 0 : ℝ)
    rw [rawSource_one]
    exact hwholeFirst
  · change ‖rawSource hφ 2‖ ≤ (tightScaledRQ 1 : ℝ)
    rw [rawSource_two, norm_smul]
    have hscale : ‖(1 / 2 : ℂ)‖ = (1 / 2 : ℝ) := by norm_num [norm_div]
    rw [hscale]
    linarith
  · change ‖rawSource hφ 3‖ ≤ (tightScaledRQ 2 : ℝ)
    rw [rawSource_three, norm_smul]
    have hscale : ‖(1 / 6 : ℂ)‖ = (1 / 6 : ℝ) := by norm_num [norm_div]
    rw [hscale]
    linarith

private theorem norm_source_tight_le' (hφ : PhiBound)
    (hwholeFirst : ‖taylorL2 hφ 1 - firstCenter‖ ≤ (tightScaledRQ 0 : ℝ))
    (hwholeSecond : ‖taylorL2 hφ 2 - secondCenter‖ ≤ 2 * (tightScaledRQ 1 : ℝ))
    (hwholeThird : ‖taylorL2 hφ 3 - thirdCenter‖ ≤ 6 * (tightScaledRQ 2 : ℝ))
    (p : Fin 4) :
    ‖source hφ p‖ ≤ (tightGroupRadiusQ p : ℝ) :=
  (norm_smoothOp_le _).trans
    (norm_rawSource_tight_le' hφ hwholeFirst hwholeSecond hwholeThird p)

private theorem norm_threePiece_tight_whole_le' (hφ : PhiBound)
    (hwholeFirst : ‖taylorL2 hφ 1 - firstCenter‖ ≤ (tightScaledRQ 0 : ℝ))
    (hwholeSecond : ‖taylorL2 hφ 2 - secondCenter‖ ≤ 2 * (tightScaledRQ 1 : ℝ))
    (hwholeThird : ‖taylorL2 hφ 3 - thirdCenter‖ ≤ 6 * (tightScaledRQ 2 : ℝ))
    (j : Fin 7) :
    ‖threePiece hφ j‖ ≤ (tightGroupRadiusQ (threeBandPower j) : ℝ) :=
  ((modeSpace (bandModes (threeBandBands j))).norm_starProjection_apply_le _).trans
    (norm_source_tight_le' hφ hwholeFirst hwholeSecond hwholeThird _)

private theorem norm_threePiece_tight_le' (hφ : PhiBound)
    (hfirst : ‖projOn (firstCenterBandModes 0) (taylorL2 hφ 1 - firstCenter)‖ ≤
      (tightLowErrorQ 0 : ℝ))
    (hsecond : ‖projOn (secondCenterBandModes 0) (taylorL2 hφ 2 - secondCenter)‖ ≤
      (tightLowErrorQ 1 : ℝ))
    (hthird : ‖projOn (thirdCenterBandModes 0) (taylorL2 hφ 3 - thirdCenter)‖ ≤
      (tightLowErrorQ 2 : ℝ))
    (hwholeFirst : ‖taylorL2 hφ 1 - firstCenter‖ ≤ (tightScaledRQ 0 : ℝ))
    (hwholeSecond : ‖taylorL2 hφ 2 - secondCenter‖ ≤ 2 * (tightScaledRQ 1 : ℝ))
    (hwholeThird : ‖taylorL2 hφ 3 - thirdCenter‖ ≤ 6 * (tightScaledRQ 2 : ℝ))
    (j : Fin 7) :
    ‖threePiece hφ j‖ ≤ (tightThreeBandErrorQ j : ℝ) := by
  fin_cases j
  · change ‖threePiece hφ 0‖ ≤ (tightGroupRadiusQ 0 : ℝ)
    exact norm_threePiece_tight_whole_le' hφ hwholeFirst hwholeSecond hwholeThird 0
  · change ‖bandProj (comparisonBand (firstCapturedIndex 0))
        (smoothOp (rawSource hφ 1))‖ ≤ (tightLowErrorQ 0 : ℝ)
    refine (norm_bandProj_smoothOp_le _ _).trans ?_
    rw [rawSource_one]
    change ‖projOn (bandModes (comparisonBand (firstCapturedIndex 0)))
      (taylorL2 hφ 1 - firstCenter)‖ ≤ _
    rw [← firstCenterBandModes_eq_comparison]
    exact hfirst
  · simpa [tightThreeBandErrorQ, tightGroupRadiusQ, threeBandPower] using
      norm_threePiece_tight_whole_le' hφ hwholeFirst hwholeSecond hwholeThird 2
  · change ‖bandProj (comparisonBand (secondCapturedIndex 0))
        (smoothOp (rawSource hφ 2))‖ ≤ ((tightLowErrorQ 1 / 2 : ℚ) : ℝ)
    refine (norm_bandProj_smoothOp_le _ _).trans ?_
    rw [rawSource_two]
    change ‖projOn (bandModes (comparisonBand (secondCapturedIndex 0)))
      ((1 / 2 : ℂ) • (taylorL2 hφ 2 - secondCenter))‖ ≤ _
    rw [map_smul, norm_smul, ← secondCenterBandModes_eq_comparison]
    have hscale : ‖(1 / 2 : ℂ)‖ = (1 / 2 : ℝ) := by norm_num [norm_div]
    rw [hscale, Rat.cast_div, Rat.cast_ofNat]
    linarith
  · simpa [tightThreeBandErrorQ, tightGroupRadiusQ, threeBandPower] using
      norm_threePiece_tight_whole_le' hφ hwholeFirst hwholeSecond hwholeThird 4
  · change ‖bandProj (comparisonBand (thirdCapturedIndex 0))
        (smoothOp (rawSource hφ 3))‖ ≤ ((tightLowErrorQ 2 / 6 : ℚ) : ℝ)
    refine (norm_bandProj_smoothOp_le _ _).trans ?_
    rw [rawSource_three]
    change ‖projOn (bandModes (comparisonBand (thirdCapturedIndex 0)))
      ((1 / 6 : ℂ) • (taylorL2 hφ 3 - thirdCenter))‖ ≤ _
    rw [map_smul, norm_smul, ← thirdCenterBandModes_eq_comparison]
    have hscale : ‖(1 / 6 : ℂ)‖ = (1 / 6 : ℝ) := by norm_num [norm_div]
    rw [hscale, Rat.cast_div, Rat.cast_ofNat]
    linarith
  · simpa [tightThreeBandErrorQ, tightGroupRadiusQ, threeBandPower] using
      norm_threePiece_tight_whole_le' hφ hwholeFirst hwholeSecond hwholeThird 6

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
    (norm_threePiece_tight_le' phiBound
      hfirst hsecond hthird hwholeFirst hwholeSecond hwholeThird)
    (norm_source_tight_le' phiBound
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
