import Grothe.UpperChaos.TaylorTailData
import Grothe.UpperChaos.TaylorFirstBandNorms
import Grothe.UpperChaos.TaylorSecondBandNorms
import Grothe.UpperChaos.TaylorCenterFunctions

/-!
# The first and second Taylor tails from captured finite bands

The exact even moments and finite-center norm certificates derive the two
production tail caps from six and four explicit unscaled Gaussian error
premises. The slightly tighter finite caps are retained separately: rounding
them up to the public comparison allowances loses too much captured energy.
The Gaussian error premises themselves are not proved by this module.

Agent-ID: codex-2ca4
-/

open MeasureTheory

namespace Grothe.UpperChaos

set_option maxRecDepth 4096

/-- Scalar energy left after preserving every separately captured norm/error pair. -/
def capturedTaylorBudgetQ {n : ℕ} (moment : ℚ) (lower error : Fin n → ℚ) : ℚ :=
  moment - ∑ k, (max 0 (lower k - error k)) ^ 2

private theorem norm_taylor_tail_le_of_captured {n : ℕ} (A : Fin n → Set Idx2)
    (B : Set Idx2) (f c : Lp ℂ 2 mu2) (moment cap : ℚ) (lower error : Fin n → ℚ)
    (hdisj : ∀ i j, i ≠ j → Disjoint (A i) (A j))
    (hB : ∀ i, Disjoint (A i) B) (hzero : projOn B c = 0)
    (hlower : ∀ i, (lower i : ℝ) ≤ ‖projOn (A i) c‖)
    (herror : ∀ i, ‖projOn (A i) (f - c)‖ ≤ (error i : ℝ))
    (henergy : ‖f‖ ^ 2 ≤ (moment : ℝ))
    (hbudget : capturedTaylorBudgetQ moment lower error ≤ cap ^ 2)
    (hcap : 0 ≤ cap) : ‖projOn B (f - c)‖ ≤ (cap : ℝ) := by
  have hbudgetR : (moment : ℝ) -
      (∑ k : Fin n, (max 0 ((lower k : ℝ) - (error k : ℝ))) ^ 2) ≤ (cap : ℝ) ^ 2 := by
    have h : (capturedTaylorBudgetQ moment lower error : ℝ) ≤ ((cap ^ 2 : ℚ) : ℝ) := by
      exact_mod_cast hbudget
    simpa only [capturedTaylorBudgetQ, Rat.cast_sub, Rat.cast_sum, Rat.cast_pow,
      Rat.cast_max, Rat.cast_zero] using h
  have hcapR : (0 : ℝ) ≤ cap := by exact_mod_cast hcap
  exact norm_projOn_residual_le_of_captured_family Finset.univ A B
    (fun i _ j _ hij => hdisj i j hij) (fun i _ => hB i) f c hzero
    (fun i => (lower i : ℝ)) (fun i => (error i : ℝ))
    (fun i _ => hlower i) (fun i _ => herror i) henergy hbudgetR hcapR

/-- The first source's captured comparison indices are one through six. -/
def firstCapturedIndex (k : Fin 6) : ComparisonIndex :=
  ⟨1 + k.val, by have hk := k.isLt; change 1 + k.val < 18; omega⟩

/-- The first source's omitted degree tail is comparison index seven. -/
def firstTailIndex : ComparisonIndex := ⟨7, by decide⟩

/-- The second source's captured comparison indices are eight through eleven. -/
def secondCapturedIndex (k : Fin 4) : ComparisonIndex :=
  ⟨8 + k.val, by have hk := k.isLt; change 8 + k.val < 18; omega⟩

/-- The second source's omitted degree tail is comparison index twelve. -/
def secondTailIndex : ComparisonIndex := ⟨12, by decide⟩

private theorem firstCapturedIndex_injective : Function.Injective firstCapturedIndex := by decide
private theorem firstCapturedIndex_ne_tail : ∀ k, firstCapturedIndex k ≠ firstTailIndex := by decide
private theorem firstCaptured_pw : ∀ k, pw (firstCapturedIndex k) = 1 := by decide
private theorem firstTail_pw : pw firstTailIndex = 1 := by decide
private theorem secondCapturedIndex_injective : Function.Injective secondCapturedIndex := by decide
private theorem secondCapturedIndex_ne_tail : ∀ k, secondCapturedIndex k ≠ secondTailIndex := by decide
private theorem secondCaptured_pw : ∀ k, pw (secondCapturedIndex k) = 2 := by decide
private theorem secondTail_pw : pw secondTailIndex = 2 := by decide

/-- The six finite degree sets are the production first-source comparison bands. -/
theorem firstCenterBandModes_eq_comparison (k : Fin 6) :
    firstCenterBandModes k = bandModes (comparisonBand (firstCapturedIndex k)) := by
  have hlo : ∀ j, (comparisonBand (firstCapturedIndex j)).lo = firstCenterBandLo j := by decide
  have hhi : ∀ j, (comparisonBand (firstCapturedIndex j)).hi = firstCenterBandHi j := by decide
  have hpos : ∀ j, firstCenterBandHi j ≠ 0 := by decide
  ext i
  change (firstCenterBandLo k < (bideg i).1 + (bideg i).2 ∧
    (bideg i).1 + (bideg i).2 ≤ firstCenterBandHi k) ↔
      (comparisonBand (firstCapturedIndex k)).contains (bideg i).1 (bideg i).2 = true
  rw [contains_iff, hlo k, hhi k]
  simp only [hpos k, false_or]

/-- The four finite degree sets are the production second-source comparison bands. -/
theorem secondCenterBandModes_eq_comparison (k : Fin 4) :
    secondCenterBandModes k = bandModes (comparisonBand (secondCapturedIndex k)) := by
  have hlo : ∀ j, (comparisonBand (secondCapturedIndex j)).lo = secondCenterBandLo j := by decide
  have hhi : ∀ j, (comparisonBand (secondCapturedIndex j)).hi = secondCenterBandHi j := by decide
  have hpos : ∀ j, secondCenterBandHi j ≠ 0 := by decide
  ext i
  change (secondCenterBandLo k < (bideg i).1 + (bideg i).2 ∧
    (bideg i).1 + (bideg i).2 ≤ secondCenterBandHi k) ↔
      (comparisonBand (secondCapturedIndex k)).contains (bideg i).1 (bideg i).2 = true
  rw [contains_iff, hlo k, hhi k]
  simp only [hpos k, false_or]

/-- The first comparison tail consists exactly of degrees greater than 181. -/
theorem firstTailModes_eq : bandModes (comparisonBand firstTailIndex) =
    {i : Idx2 | 181 < (bideg i).1 + (bideg i).2} := by
  have hlo : (comparisonBand firstTailIndex).lo = 181 := by decide +kernel
  have hhi : (comparisonBand firstTailIndex).hi = 0 := by decide +kernel
  ext i
  change (comparisonBand firstTailIndex).contains (bideg i).1 (bideg i).2 = true ↔ _
  rw [contains_iff, hlo, hhi]
  simp

/-- The second comparison tail consists exactly of degrees greater than 91. -/
theorem secondTailModes_eq : bandModes (comparisonBand secondTailIndex) =
    {i : Idx2 | 91 < (bideg i).1 + (bideg i).2} := by
  have hlo : (comparisonBand secondTailIndex).lo = 91 := by decide +kernel
  have hhi : (comparisonBand secondTailIndex).hi = 0 := by decide +kernel
  ext i
  change (comparisonBand secondTailIndex).contains (bideg i).1 (bideg i).2 = true ↔ _
  rw [contains_iff, hlo, hhi]
  simp

private theorem firstCaptured_disjoint {i j : Fin 6} (hij : i ≠ j) :
    Disjoint (firstCenterBandModes i) (firstCenterBandModes j) := by
  rw [firstCenterBandModes_eq_comparison, firstCenterBandModes_eq_comparison, Set.disjoint_left]
  intro k hki hkj
  exact hij (firstCapturedIndex_injective
    (band_unique ((firstCaptured_pw i).trans (firstCaptured_pw j).symm) hki hkj))

private theorem firstCaptured_disjoint_tail (i : Fin 6) :
    Disjoint (firstCenterBandModes i) (bandModes (comparisonBand firstTailIndex)) := by
  rw [firstCenterBandModes_eq_comparison, Set.disjoint_left]
  intro k hki hkt
  exact firstCapturedIndex_ne_tail i
    (band_unique ((firstCaptured_pw i).trans firstTail_pw.symm) hki hkt)

private theorem secondCaptured_disjoint {i j : Fin 4} (hij : i ≠ j) :
    Disjoint (secondCenterBandModes i) (secondCenterBandModes j) := by
  rw [secondCenterBandModes_eq_comparison, secondCenterBandModes_eq_comparison, Set.disjoint_left]
  intro k hki hkj
  exact hij (secondCapturedIndex_injective
    (band_unique ((secondCaptured_pw i).trans (secondCaptured_pw j).symm) hki hkj))

private theorem secondCaptured_disjoint_tail (i : Fin 4) :
    Disjoint (secondCenterBandModes i) (bandModes (comparisonBand secondTailIndex)) := by
  rw [secondCenterBandModes_eq_comparison, Set.disjoint_left]
  intro k hki hkt
  exact secondCapturedIndex_ne_tail i
    (band_unique ((secondCaptured_pw i).trans secondTail_pw.symm) hki hkt)

/-- The unscaled first Taylor source. -/
noncomputable def firstTaylorL2 : Lp ℂ 2 mu2 :=
  (chargeFn_hpow phiBound 1).memLp.toLp (hpow 1)

/-- The unscaled second Taylor source. -/
noncomputable def secondTaylorL2 : Lp ℂ 2 mu2 :=
  (chargeFn_hpow phiBound 2).memLp.toLp (hpow 2)

/-- The stronger first-source caps imply the public finite comparison allowances. -/
theorem firstCapturedErrorQ_le_public : ∀ k,
    firstCapturedErrorQ k ≤ (comparisonBand (firstCapturedIndex k)).error := by
  decide +kernel

/-- Division by two puts the stronger second-source caps inside the public allowances. -/
theorem secondCapturedErrorQ_le_public : ∀ k,
    secondCapturedErrorQ k ≤ 2 * (comparisonBand (secondCapturedIndex k)).error := by
  decide +kernel

/-- Exact first-source captured energy fits the production omitted-tail cap. -/
theorem first_captured_tail_budget :
    capturedTaylorBudgetQ phaseMoment2Q firstCenterBandLowerQ firstCapturedErrorQ ≤
      (comparisonBand firstTailIndex).error ^ 2 := by
  decide +kernel

/-- Exact second-source captured energy fits twice the production omitted-tail cap. -/
theorem second_captured_tail_budget :
    capturedTaylorBudgetQ phaseMoment4Q secondCenterBandLowerQ secondCapturedErrorQ ≤
      (2 * (comparisonBand secondTailIndex).error) ^ 2 := by
  decide +kernel

/-- The first tail follows from six finite-band Gaussian error premises. -/
theorem norm_firstCenter_tail_le
    (herror : ∀ k, ‖projOn (firstCenterBandModes k) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ k : ℝ)) :
    ‖bandProj (comparisonBand firstTailIndex) (firstTaylorL2 - firstCenter)‖ ≤
      ((comparisonBand firstTailIndex).error : ℝ) := by
  have hzero : projOn (bandModes (comparisonBand firstTailIndex)) firstCenter = 0 := by
    rw [firstTailModes_eq]
    exact firstCenter_tail_zero
  exact norm_taylor_tail_le_of_captured firstCenterBandModes
    (bandModes (comparisonBand firstTailIndex)) firstTaylorL2 firstCenter
    phaseMoment2Q (comparisonBand firstTailIndex).error firstCenterBandLowerQ firstCapturedErrorQ
    (fun _ _ hij => firstCaptured_disjoint hij) firstCaptured_disjoint_tail hzero
    firstCenterBand_norm_lower herror norm_hpow_one_sq.le first_captured_tail_budget
    (by decide +kernel)

/-- The second tail follows from four finite-band Gaussian error premises. -/
theorem norm_secondCenter_tail_scaled_le
    (herror : ∀ k, ‖projOn (secondCenterBandModes k) (secondTaylorL2 - secondCenter)‖ ≤
      (secondCapturedErrorQ k : ℝ)) :
    ‖bandProj (comparisonBand secondTailIndex) ((1 / 2 : ℂ) • (secondTaylorL2 - secondCenter))‖ ≤
      ((comparisonBand secondTailIndex).error : ℝ) := by
  have hzero : projOn (bandModes (comparisonBand secondTailIndex)) secondCenter = 0 := by
    rw [secondTailModes_eq]
    exact secondCenter_tail_zero
  have hs := norm_taylor_tail_le_of_captured secondCenterBandModes
    (bandModes (comparisonBand secondTailIndex)) secondTaylorL2 secondCenter
    phaseMoment4Q (2 * (comparisonBand secondTailIndex).error) secondCenterBandLowerQ
    secondCapturedErrorQ (fun _ _ hij => secondCaptured_disjoint hij)
    secondCaptured_disjoint_tail hzero secondCenterBand_norm_lower herror norm_hpow_two_sq.le
    second_captured_tail_budget (by decide +kernel)
  have h : ‖bandProj (comparisonBand secondTailIndex) (secondTaylorL2 - secondCenter)‖ ≤
      2 * ((comparisonBand secondTailIndex).error : ℝ) := by
    simpa only [Rat.cast_mul, Rat.cast_ofNat] using hs
  rw [map_smul, norm_smul]
  have hscale : ‖(1 / 2 : ℂ)‖ = (1 / 2 : ℝ) := by norm_num [norm_div]
  rw [hscale]
  linarith

/-- Smoothing preserves the derived first-tail cap. -/
theorem norm_firstCenter_tail_smoothed_le
    (herror : ∀ k, ‖projOn (firstCenterBandModes k) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ k : ℝ)) :
    ‖bandProj (comparisonBand firstTailIndex) (smoothOp (firstTaylorL2 - firstCenter))‖ ≤
      ((comparisonBand firstTailIndex).error : ℝ) :=
  (norm_bandProj_smoothOp_le _ _).trans (norm_firstCenter_tail_le herror)

/-- Smoothing preserves the derived second-tail cap. -/
theorem norm_secondCenter_tail_smoothed_le
    (herror : ∀ k, ‖projOn (secondCenterBandModes k) (secondTaylorL2 - secondCenter)‖ ≤
      (secondCapturedErrorQ k : ℝ)) :
    ‖bandProj (comparisonBand secondTailIndex)
      (smoothOp ((1 / 2 : ℂ) • (secondTaylorL2 - secondCenter)))‖ ≤
      ((comparisonBand secondTailIndex).error : ℝ) :=
  (norm_bandProj_smoothOp_le _ _).trans (norm_secondCenter_tail_scaled_le herror)

/-- Concrete comparison piece seven needs only the six stated finite-band Gaussian error bounds. -/
theorem norm_piece7_taylorCenters_le
    (herror : ∀ k, ‖projOn (firstCenterBandModes k) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ k : ℝ)) :
    ‖piece phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn chargeFn_secondCenterFn
      chargeFn_thirdCenterFn firstTailIndex‖ ≤ ((comparisonBand firstTailIndex).error : ℝ) := by
  refine (norm_piece_le phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
    chargeFn_secondCenterFn chargeFn_thirdCenterFn firstTailIndex).trans ?_
  rw [firstTail_pw, toLp_taylorFirstSource]
  exact norm_firstCenter_tail_le herror

/-- Concrete comparison piece twelve needs only the four stated finite-band Gaussian error bounds. -/
theorem norm_piece12_taylorCenters_le
    (herror : ∀ k, ‖projOn (secondCenterBandModes k) (secondTaylorL2 - secondCenter)‖ ≤
      (secondCapturedErrorQ k : ℝ)) :
    ‖piece phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn chargeFn_secondCenterFn
      chargeFn_thirdCenterFn secondTailIndex‖ ≤ ((comparisonBand secondTailIndex).error : ℝ) := by
  refine (norm_piece_le phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
    chargeFn_secondCenterFn chargeFn_thirdCenterFn secondTailIndex).trans ?_
  rw [secondTail_pw, toLp_taylorSecondSource]
  exact norm_secondCenter_tail_scaled_le herror

end Grothe.UpperChaos
