import Grothe.UpperChaos.FirstSecondCapturedTail

/-!
# The concrete Taylor upper bound from finite Gaussian error families

The finite centers, their polynomial representatives, rounding source and
omitted tails are fixed and certified. The remaining Gaussian assumptions are
six unscaled first-order finite-band errors, four second-order errors and four
third-order errors, together with accuracy of the energy table of the concrete
smoothed frozen correction. Factorial scaling is applied exactly when these
unscaled errors enter the comparison decomposition.

This proves the existing conditional endpoint. It does not prove
those Gaussian inequalities or claim a new numerical Grothendieck constant.

Agent-ID: codex-37fb
-/

open MeasureTheory

namespace Grothe.UpperChaos

noncomputable section

/-- A first-source finite error bound supplies its actual comparison piece. -/
theorem norm_firstCaptured_taylorCenters_le (k : Fin 6)
    (herror : ‖projOn (firstCenterBandModes k) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ k : ℝ)) :
    ‖piece phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn (firstCapturedIndex k)‖ ≤
      ((comparisonBand (firstCapturedIndex k)).error : ℝ) := by
  have hpw : ∀ j : Fin 6, pw (firstCapturedIndex j) = 1 := by decide +kernel
  refine (norm_piece_le phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
    chargeFn_secondCenterFn chargeFn_thirdCenterFn (firstCapturedIndex k)).trans ?_
  rw [hpw k, toLp_taylorFirstSource]
  change ‖projOn (bandModes (comparisonBand (firstCapturedIndex k)))
    (firstTaylorL2 - firstCenter)‖ ≤ ((comparisonBand (firstCapturedIndex k)).error : ℝ)
  rw [← firstCenterBandModes_eq_comparison k]
  have hq := firstCapturedErrorQ_le_public k
  have hr : (firstCapturedErrorQ k : ℝ) ≤ ((comparisonBand (firstCapturedIndex k)).error : ℝ) := by
    exact_mod_cast hq
  exact herror.trans hr

/-- The second-source finite error bound is divided by two in its comparison piece. -/
theorem norm_secondCaptured_taylorCenters_le (k : Fin 4)
    (herror : ‖projOn (secondCenterBandModes k) (secondTaylorL2 - secondCenter)‖ ≤
      (secondCapturedErrorQ k : ℝ)) :
    ‖piece phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn (secondCapturedIndex k)‖ ≤
      ((comparisonBand (secondCapturedIndex k)).error : ℝ) := by
  have hpw : ∀ j : Fin 4, pw (secondCapturedIndex j) = 2 := by decide +kernel
  refine (norm_piece_le phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
    chargeFn_secondCenterFn chargeFn_thirdCenterFn (secondCapturedIndex k)).trans ?_
  rw [hpw k, toLp_taylorSecondSource]
  change ‖projOn (bandModes (comparisonBand (secondCapturedIndex k)))
    ((1 / 2 : ℂ) • (secondTaylorL2 - secondCenter))‖ ≤
      ((comparisonBand (secondCapturedIndex k)).error : ℝ)
  rw [map_smul, norm_smul, ← secondCenterBandModes_eq_comparison k]
  have hscale : ‖(1 / 2 : ℂ)‖ = (1 / 2 : ℝ) := by norm_num [norm_div]
  rw [hscale]
  have hq := secondCapturedErrorQ_le_public k
  have hr : (secondCapturedErrorQ k : ℝ) ≤
      2 * ((comparisonBand (secondCapturedIndex k)).error : ℝ) := by
    exact_mod_cast hq
  linarith

/-- The third-source finite error bound is divided by six in its comparison piece. -/
theorem norm_thirdCaptured_taylorCenters_le (k : Fin 4)
    (herror : ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ k : ℝ)) :
    ‖piece phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn (thirdCapturedIndex k)‖ ≤
      ((comparisonBand (thirdCapturedIndex k)).error : ℝ) := by
  have hpw : ∀ j : Fin 4, pw (thirdCapturedIndex j) = 3 := by decide +kernel
  refine (norm_piece_le phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
    chargeFn_secondCenterFn chargeFn_thirdCenterFn (thirdCapturedIndex k)).trans ?_
  rw [hpw k, toLp_taylorThirdSource]
  change ‖projOn (bandModes (comparisonBand (thirdCapturedIndex k)))
    ((1 / 6 : ℂ) • (thirdTaylorL2 - thirdCenter))‖ ≤
      ((comparisonBand (thirdCapturedIndex k)).error : ℝ)
  rw [map_smul, norm_smul, ← thirdCenterBandModes_eq_comparison k]
  have hscale : ‖(1 / 6 : ℂ)‖ = (1 / 6 : ℝ) := by norm_num [norm_div]
  rw [hscale]
  have hq := thirdCapturedErrorQ_le_public k
  have hr : (thirdCapturedErrorQ k : ℝ) ≤
      6 * ((comparisonBand (thirdCapturedIndex k)).error : ℝ) := by
    exact_mod_cast hq
  linarith

section GaussianInputs

variable
    (hfirst : ∀ k, ‖projOn (firstCenterBandModes k) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ k : ℝ))
    (hsecond : ∀ k, ‖projOn (secondCenterBandModes k) (secondTaylorL2 - secondCenter)‖ ≤
      (secondCapturedErrorQ k : ℝ))
    (hthird : ∀ k, ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ k : ℝ))

include hfirst hsecond hthird

/-- The fourteen finite Gaussian error premises supply all eighteen comparison caps. -/
theorem norm_pieces_taylorCenters_le (k : ComparisonIndex) :
    ‖piece phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn k‖ ≤ ((comparisonBand k).error : ℝ) := by
  fin_cases k
  · exact norm_piece0_taylorCenters_le
  · exact norm_firstCaptured_taylorCenters_le 0 (hfirst 0)
  · exact norm_firstCaptured_taylorCenters_le 1 (hfirst 1)
  · exact norm_firstCaptured_taylorCenters_le 2 (hfirst 2)
  · exact norm_firstCaptured_taylorCenters_le 3 (hfirst 3)
  · exact norm_firstCaptured_taylorCenters_le 4 (hfirst 4)
  · exact norm_firstCaptured_taylorCenters_le 5 (hfirst 5)
  · exact norm_piece7_taylorCenters_le hfirst
  · exact norm_secondCaptured_taylorCenters_le 0 (hsecond 0)
  · exact norm_secondCaptured_taylorCenters_le 1 (hsecond 1)
  · exact norm_secondCaptured_taylorCenters_le 2 (hsecond 2)
  · exact norm_secondCaptured_taylorCenters_le 3 (hsecond 3)
  · exact norm_piece12_taylorCenters_le hsecond
  · exact norm_thirdCaptured_taylorCenters_le 0 (hthird 0)
  · exact norm_thirdCaptured_taylorCenters_le 1 (hthird 1)
  · exact norm_thirdCaptured_taylorCenters_le 2 (hthird 2)
  · exact norm_thirdCaptured_taylorCenters_le 3 (hthird 3)
  · exact norm_piece17_thirdCenter_le chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn hthird

/-- The concrete Taylor decomposition, with no independent rounding or tail assumptions. -/
def comparisonInputs_taylorCenters :
    ComparisonInputs ((memLp_GT phiBound).toLp GT)
      ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp (Xfun frozenCorrectionFn)) :=
  comparisonInputs_of_norms phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
    chargeFn_secondCenterFn chargeFn_thirdCenterFn (norm_pieces_taylorCenters_le hfirst hsecond hthird)

/-- The existing sharp conditional upper bound for the fully specified Taylor centers.
Only the three finite Gaussian error families and concrete energy-table accuracy remain assumptions. -/
theorem fresh_upper_concrete_taylor
    (hclose : ∑ p ∈ Grothe.Upper.headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (Grothe.Upper.energyTable p : ℝ)| ≤
      (Grothe.Upper.energyErrQ : ℝ)) :
    IsGrothendieckBound (500000000000000000 / 355973699881431491) :=
  fresh_upper_rounder (memLp_Xfun phiBound chargeFn_frozenCorrectionFn)
    (Xfun_rot2 phiBound chargeFn_frozenCorrectionFn)
    (comparisonInputs_taylorCenters hfirst hsecond hthird) hclose

end GaussianInputs

end
end Grothe.UpperChaos
