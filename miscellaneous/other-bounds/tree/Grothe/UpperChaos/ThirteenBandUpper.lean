import Grothe.UpperChaos.ReducedGrouped
import Grothe.UpperChaos.SecondBandElimination

/-! Conditional upper bound from thirteen Gaussian band estimates. -/

open MeasureTheory
namespace Grothe.UpperChaos.Thirteen
open Grothe.UpperChaos
noncomputable section

/-- Smoothing and factorial scaling convert the coarse last-band bound. -/
theorem revised_second_last_piece
    (herror : ‖projOn (secondCenterBandModes 3) (secondTaylorL2 - secondCenter)‖ ≤
      (3474 / 1000000000 : ℝ)) :
    ‖piece phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn chargeFn_secondCenterFn
      chargeFn_thirdCenterFn (secondCapturedIndex 3)‖ ≤ (1737 / 1000000000 : ℝ) := by
  have hpw : pw (secondCapturedIndex 3) = 2 := by decide
  refine (norm_piece_le phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
    chargeFn_secondCenterFn chargeFn_thirdCenterFn (secondCapturedIndex 3)).trans ?_
  rw [hpw, toLp_taylorSecondSource]
  change ‖projOn (bandModes (comparisonBand (secondCapturedIndex 3)))
    ((1 / 2 : ℂ) • (secondTaylorL2 - secondCenter))‖ ≤ _
  rw [← secondCenterBandModes_eq_comparison 3, map_smul, norm_smul]
  have hscale : ‖(1 / 2 : ℂ)‖ = (1 / 2 : ℝ) := by norm_num [norm_div]
  rw [hscale]
  linarith

/-- The omitted second-order degree tail uses the same captured-energy budget. -/
theorem revised_second_tail_piece
    (herror : ‖projOn {i : Idx2 | 91 < (bideg i).1 + (bideg i).2}
      (secondTaylorL2 - secondCenter)‖ ≤ (secondResidualCapQ : ℝ)) :
    ‖piece phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn chargeFn_secondCenterFn
      chargeFn_thirdCenterFn secondTailIndex‖ ≤ (1226 / 1000000000 : ℝ) := by
  have hpw : pw secondTailIndex = 2 := by decide
  refine (norm_piece_le phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
    chargeFn_secondCenterFn chargeFn_thirdCenterFn secondTailIndex).trans ?_
  rw [hpw, toLp_taylorSecondSource]
  change ‖projOn (bandModes (comparisonBand secondTailIndex))
    ((1 / 2 : ℂ) • (secondTaylorL2 - secondCenter))‖ ≤ _
  rw [secondTailModes_eq, map_smul, norm_smul]
  have hscale : ‖(1 / 2 : ℂ)‖ = (1 / 2 : ℝ) := by norm_num [norm_div]
  rw [hscale]
  have hcap : (secondResidualCapQ : ℝ) = (2452 / 1000000000 : ℝ) := by
    norm_num [secondResidualCapQ]
  rw [hcap] at herror
  linarith

/-- All 18 revised piece caps from thirteen retained Gaussian bounds. -/
theorem revised_taylor_piece_bounds
    (hfirst : ∀ k, ‖projOn (firstCenterBandModes k) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ k : ℝ))
    (hsecond : ∀ i : Fin 3, ‖projOn (secondThreeModes i) (secondTaylorL2 - secondCenter)‖ ≤
      (secondThreeError i : ℝ))
    (hthird : ∀ k, ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ k : ℝ)) :
    ∀ j : ComparisonIndex,
      ‖piece phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn chargeFn_secondCenterFn
        chargeFn_thirdCenterFn j‖ ≤ (revisedErrorQ j : ℝ) := by
  have hs := second_last_and_tail_of_three hsecond
  intro j
  fin_cases j
  · simpa [revisedErrorQ, comparisonBand, taylorRoundingIndex] using norm_piece0_taylorCenters_le
  · simpa [revisedErrorQ, comparisonBand, firstCapturedIndex] using norm_firstCaptured_taylorCenters_le 0 (hfirst 0)
  · simpa [revisedErrorQ, comparisonBand, firstCapturedIndex] using norm_firstCaptured_taylorCenters_le 1 (hfirst 1)
  · simpa [revisedErrorQ, comparisonBand, firstCapturedIndex] using norm_firstCaptured_taylorCenters_le 2 (hfirst 2)
  · simpa [revisedErrorQ, comparisonBand, firstCapturedIndex] using norm_firstCaptured_taylorCenters_le 3 (hfirst 3)
  · simpa [revisedErrorQ, comparisonBand, firstCapturedIndex] using norm_firstCaptured_taylorCenters_le 4 (hfirst 4)
  · simpa [revisedErrorQ, comparisonBand, firstCapturedIndex] using norm_firstCaptured_taylorCenters_le 5 (hfirst 5)
  · simpa [revisedErrorQ, comparisonBand, firstTailIndex] using norm_piece7_taylorCenters_le hfirst
  · simpa [revisedErrorQ, comparisonBand, secondCapturedIndex, secondThreeModes, secondThreeError] using norm_secondCaptured_taylorCenters_le 0 (hsecond 0)
  · simpa [revisedErrorQ, comparisonBand, secondCapturedIndex, secondThreeModes, secondThreeError] using norm_secondCaptured_taylorCenters_le 1 (hsecond 1)
  · simpa [revisedErrorQ, comparisonBand, secondCapturedIndex, secondThreeModes, secondThreeError] using norm_secondCaptured_taylorCenters_le 2 (hsecond 2)
  · simpa [revisedErrorQ, secondCapturedIndex] using revised_second_last_piece hs.1
  · simpa [revisedErrorQ, secondTailIndex] using revised_second_tail_piece hs.2
  · simpa [revisedErrorQ, comparisonBand, thirdCapturedIndex] using norm_thirdCaptured_taylorCenters_le 0 (hthird 0)
  · simpa [revisedErrorQ, comparisonBand, thirdCapturedIndex] using norm_thirdCaptured_taylorCenters_le 1 (hthird 1)
  · simpa [revisedErrorQ, comparisonBand, thirdCapturedIndex] using norm_thirdCaptured_taylorCenters_le 2 (hthird 2)
  · simpa [revisedErrorQ, comparisonBand, thirdCapturedIndex] using norm_thirdCaptured_taylorCenters_le 3 (hthird 3)
  · simpa [revisedErrorQ, comparisonBand, thirdTailIndex] using
      norm_piece17_thirdCenter_le chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
        chargeFn_secondCenterFn hthird

/-- Concrete decomposition retaining only thirteen finite-band assumptions. -/
def revised_taylor_inputs
    (hfirst : ∀ k, ‖projOn (firstCenterBandModes k) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ k : ℝ))
    (hsecond : ∀ i : Fin 3, ‖projOn (secondThreeModes i) (secondTaylorL2 - secondCenter)‖ ≤
      (secondThreeError i : ℝ))
    (hthird : ∀ k, ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ k : ℝ)) :
    RevisedComparisonInputs ((memLp_GT phiBound).toLp GT)
      ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn)) :=
  ⟨piece phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn chargeFn_secondCenterFn
      chargeFn_thirdCenterFn,
    difference_pieces phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn,
    revised_taylor_piece_bounds hfirst hsecond hthird,
    fun _ p hp => energy_bandProj_eq_zero _ _ p hp⟩

/-- Conditional endpoint, with the relaxed energy discrepancy retained explicitly. -/
theorem fresh_upper_taylor_thirteen_bands
    (hfirst : ∀ k, ‖projOn (firstCenterBandModes k) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ k : ℝ))
    (hsecond : ∀ i : Fin 3, ‖projOn (secondThreeModes i) (secondTaylorL2 - secondCenter)‖ ≤
      (secondThreeError i : ℝ))
    (hthird : ∀ k, ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ k : ℝ))
    (hclose : ∑ p ∈ Grothe.Upper.headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (Grothe.Upper.energyTable p : ℝ)| ≤ (relaxedEnergyErrQ : ℝ)) :
    IsGrothendieckBound (10000000000000 / 7119467887041) :=
  fresh_upper_rounder_relaxed (memLp_Xfun phiBound chargeFn_frozenCorrectionFn)
    (Xfun_rot2 phiBound chargeFn_frozenCorrectionFn)
    (revised_taylor_inputs hfirst hsecond hthird) hclose

end
end Grothe.UpperChaos.Thirteen
