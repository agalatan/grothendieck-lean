import Grothe.UpperChaos.CapturedTail
import Grothe.UpperChaos.GradedHermiteFn
import Grothe.UpperChaos.PhaseMomentNorms
import Grothe.UpperChaos.TaylorBandCheck

/-!
# The third Taylor tail from four captured bands

The exact sixth phase moment and the concrete center's four captured norms
bound the tail once four explicit Gaussian coefficient-error bounds hold.
Separate caps preserve the precision needed for the energy subtraction.
Finite rational checks establish their compatibility with the public comparison
allowances and the resulting tail budget; the Gaussian error bounds remain
hypotheses.

The canonical pointwise representative identifies the finite center with the
charge-one function used by comparison piece 17. No table-accuracy or final
Grothendieck-bound conclusion is asserted here.

Agent-ID: codex-2ca4
-/

open MeasureTheory

namespace Grothe.UpperChaos

set_option maxRecDepth 4096

/-- Comparison indices 13, 14, 15 and 16. -/
def thirdCapturedIndex (k : Fin 4) : ComparisonIndex :=
  ⟨13 + k.val, by have hk := k.isLt; change 13 + k.val < 18; omega⟩

/-- The third Taylor tail is comparison index 17. -/
def thirdTailIndex : ComparisonIndex := ⟨17, by decide⟩

private lemma thirdCapturedIndex_injective : Function.Injective thirdCapturedIndex := by decide

private lemma thirdCapturedIndex_ne_tail : ∀ k, thirdCapturedIndex k ≠ thirdTailIndex := by decide

private lemma thirdCaptured_pw : ∀ k, pw (thirdCapturedIndex k) = 3 := by decide

private lemma thirdTail_pw : pw thirdTailIndex = 3 := by decide

/-- The degree sets used by the coefficient certificate are the production comparison bands. -/
theorem thirdCenterBandModes_eq_comparison (k : Fin 4) :
    thirdCenterBandModes k = bandModes (comparisonBand (thirdCapturedIndex k)) := by
  have hlo : ∀ j, (comparisonBand (thirdCapturedIndex j)).lo = thirdCenterBandLo j := by decide
  have hhi : ∀ j, (comparisonBand (thirdCapturedIndex j)).hi = thirdCenterBandHi j := by decide
  have hpos : ∀ j, thirdCenterBandHi j ≠ 0 := by decide
  ext i
  change (thirdCenterBandLo k < (bideg i).1 + (bideg i).2 ∧
    (bideg i).1 + (bideg i).2 ≤ thirdCenterBandHi k) ↔
      (comparisonBand (thirdCapturedIndex k)).contains (bideg i).1 (bideg i).2 = true
  rw [contains_iff, hlo k, hhi k]
  simp only [hpos k, false_or]

theorem thirdTailModes_eq : bandModes (comparisonBand thirdTailIndex) =
    {i : Idx2 | 51 < (bideg i).1 + (bideg i).2} := by
  have hlo : (comparisonBand thirdTailIndex).lo = 51 := by decide +kernel
  have hhi : (comparisonBand thirdTailIndex).hi = 0 := by decide +kernel
  ext i
  change (comparisonBand thirdTailIndex).contains (bideg i).1 (bideg i).2 = true ↔ _
  rw [contains_iff, hlo, hhi]
  simp

private lemma thirdCaptured_disjoint {i j : Fin 4} (hij : i ≠ j) :
    Disjoint (thirdCenterBandModes i) (thirdCenterBandModes j) := by
  rw [thirdCenterBandModes_eq_comparison, thirdCenterBandModes_eq_comparison, Set.disjoint_left]
  intro k hki hkj
  exact hij (thirdCapturedIndex_injective
    (band_unique ((thirdCaptured_pw i).trans (thirdCaptured_pw j).symm) hki hkj))

private lemma thirdCaptured_disjoint_tail (i : Fin 4) :
    Disjoint (thirdCenterBandModes i) (bandModes (comparisonBand thirdTailIndex)) := by
  rw [thirdCenterBandModes_eq_comparison, Set.disjoint_left]
  intro k hki hkt
  exact thirdCapturedIndex_ne_tail i
    (band_unique ((thirdCaptured_pw i).trans thirdTail_pw.symm) hki hkt)

/-- The unscaled third Taylor source. -/
noncomputable def thirdTaylorL2 : Lp ℂ 2 mu2 :=
  (chargeFn_hpow phiBound 3).memLp.toLp (hpow 3)

/-- The exact scalar energy remaining after separately accounting for four captured bands. -/
def thirdTailBudgetQ (lower error : Fin 4 → ℚ) : ℚ :=
  phaseMoment6Q - ∑ k, (max 0 (lower k - error k)) ^ 2

/-- The four unscaled error hypotheses, rounded upward from the recovered allowances. -/
def thirdCapturedErrorQ : Fin 4 → ℚ
  | 0 => 47629771 / 1000000000000000000
  | 1 => 353989726 / 1000000000000000000
  | 2 => 4052571868 / 1000000000000000000
  | 3 => 150654124859 / 1000000000000000000

/-- These stronger error hypotheses suffice for the original four public comparison caps. -/
theorem thirdCapturedErrorQ_le_public : ∀ k,
    thirdCapturedErrorQ k ≤ 6 * (comparisonBand (thirdCapturedIndex k)).error := by
  decide +kernel

/-- The proposed four error caps and the exact captured lower norms fit the public tail cap. -/
theorem third_captured_tail_budget :
    thirdTailBudgetQ thirdCenterBandLowerQ thirdCapturedErrorQ ≤
      (6 * (comparisonBand thirdTailIndex).error) ^ 2 := by
  decide +kernel

/-- Any four captured norm/error enclosures satisfying the rational budget bound the unscaled tail. -/
theorem norm_third_tail_residual_le_of_captured (c : Lp ℂ 2 mu2) (lower error : Fin 4 → ℚ)
    (hlower : ∀ k, (lower k : ℝ) ≤ ‖projOn (thirdCenterBandModes k) c‖)
    (herror : ∀ k, ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - c)‖ ≤ (error k : ℝ))
    (hzero : bandProj (comparisonBand thirdTailIndex) c = 0)
    (hbudget : thirdTailBudgetQ lower error ≤ (6 * (comparisonBand thirdTailIndex).error) ^ 2) :
    ‖bandProj (comparisonBand thirdTailIndex) (thirdTaylorL2 - c)‖ ≤
      6 * ((comparisonBand thirdTailIndex).error : ℝ) := by
  have hbudgetR : (phaseMoment6Q : ℝ) -
      (∑ k : Fin 4, (max 0 ((lower k : ℝ) - (error k : ℝ))) ^ 2) ≤
        (6 * ((comparisonBand thirdTailIndex).error : ℝ)) ^ 2 := by
    have h : (thirdTailBudgetQ lower error : ℝ) ≤
        (((6 * (comparisonBand thirdTailIndex).error) ^ 2 : ℚ) : ℝ) := by
      exact_mod_cast hbudget
    simpa only [thirdTailBudgetQ, Rat.cast_sub, Rat.cast_sum, Rat.cast_pow, Rat.cast_max,
      Rat.cast_zero, Rat.cast_mul, Rat.cast_ofNat] using h
  have hcap : 0 ≤ 6 * ((comparisonBand thirdTailIndex).error : ℝ) := by
    norm_num [thirdTailIndex, comparisonBand, Grothe.Upper.comparisonBands]
  exact norm_projOn_residual_le_of_captured_family Finset.univ thirdCenterBandModes
    (bandModes (comparisonBand thirdTailIndex))
    (fun _ _ _ _ hij => thirdCaptured_disjoint hij)
    (fun k _ => thirdCaptured_disjoint_tail k) thirdTaylorL2 c hzero
    (fun k => (lower k : ℝ)) (fun k => (error k : ℝ))
    (fun k _ => hlower k) (fun k _ => herror k) norm_hpow_three_sq.le hbudgetR hcap

/-- The actual third center yields the scaled tail cap from four explicit Gaussian error premises. -/
theorem norm_thirdCenter_tail_scaled_le
    (herror : ∀ k, ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ k : ℝ)) :
    ‖bandProj (comparisonBand thirdTailIndex) ((1 / 6 : ℂ) • (thirdTaylorL2 - thirdCenter))‖ ≤
      ((comparisonBand thirdTailIndex).error : ℝ) := by
  have hzero : bandProj (comparisonBand thirdTailIndex) thirdCenter = 0 := by
    change projOn (bandModes (comparisonBand thirdTailIndex)) thirdCenter = 0
    rw [thirdTailModes_eq]
    exact thirdCenter_tail_zero
  have h := norm_third_tail_residual_le_of_captured thirdCenter thirdCenterBandLowerQ
    thirdCapturedErrorQ thirdCenterBand_norm_lower herror hzero third_captured_tail_budget
  rw [map_smul, norm_smul]
  have hscale : ‖(1 / 6 : ℂ)‖ = (1 / 6 : ℝ) := by norm_num [norm_div]
  rw [hscale]
  linarith

/-- Smoothing preserves the certified tail cap of the scaled third residual. -/
theorem norm_thirdCenter_tail_smoothed_le
    (herror : ∀ k, ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ k : ℝ)) :
    ‖bandProj (comparisonBand thirdTailIndex)
      (smoothOp ((1 / 6 : ℂ) • (thirdTaylorL2 - thirdCenter)))‖ ≤
        ((comparisonBand thirdTailIndex).error : ℝ) :=
  (norm_bandProj_smoothOp_le _ _).trans (norm_thirdCenter_tail_scaled_le herror)

private lemma third_srcP_toLp {v c₁ c₂ c₃ : ℂ × ℂ → ℂ}
    (hv : ChargeFn v) (h₁ : ChargeFn c₁) (h₂ : ChargeFn c₂) (h₃ : ChargeFn c₃) :
    (chargeFn_srcP phiBound hv h₁ h₂ h₃ 3).memLp.toLp (srcP v c₁ c₂ c₃ 3) =
      (1 / 6 : ℂ) • (thirdTaylorL2 - h₃.memLp.toLp c₃) := by
  let hs := ((chargeFn_hpow phiBound 3).memLp.sub h₃.memLp).const_smul (1 / 6 : ℂ)
  calc
    (chargeFn_srcP phiBound hv h₁ h₂ h₃ 3).memLp.toLp (srcP v c₁ c₂ c₃ 3) =
        hs.toLp ((1 / 6 : ℂ) • (hpow 3 - c₃)) := by
      apply (MemLp.toLp_eq_toLp_iff _ _).mpr
      exact Filter.Eventually.of_forall (fun u => by
        simp only [srcP, Pi.smul_apply, Pi.sub_apply, smul_eq_mul]
        ring)
    _ = (1 / 6 : ℂ) • (thirdTaylorL2 - h₃.memLp.toLp c₃) := by rfl

/-- The comparison piece at index 17, retaining the L² center-identification premise. -/
theorem norm_piece17_le_of_third_captured {v c₁ c₂ c₃ : ℂ × ℂ → ℂ}
    (hv : ChargeFn v) (h₁ : ChargeFn c₁) (h₂ : ChargeFn c₂) (h₃ : ChargeFn c₃)
    (hc₃ : h₃.memLp.toLp c₃ = thirdCenter)
    (herror : ∀ k, ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ k : ℝ)) :
    ‖piece phiBound hv h₁ h₂ h₃ thirdTailIndex‖ ≤ ((comparisonBand thirdTailIndex).error : ℝ) := by
  refine (norm_piece_le phiBound hv h₁ h₂ h₃ thirdTailIndex).trans ?_
  rw [thirdTail_pw, third_srcP_toLp hv h₁ h₂ h₃, hc₃]
  exact norm_thirdCenter_tail_scaled_le herror

/-- The canonical pointwise polynomial for the complete third Taylor center. -/
noncomputable def thirdCenterFn : ℂ × ℂ → ℂ := gradedHermiteFn 26 thirdCenterCoeff

/-- The concrete third center satisfies the comparison's charge-one function interface. -/
theorem chargeFn_thirdCenterFn : ChargeFn thirdCenterFn :=
  ⟨measurable_gradedHermiteFn 26 thirdCenterCoeff, memLp_gradedHermiteFn 26 thirdCenterCoeff,
    gradedHermiteFn_rot2 26 thirdCenterCoeff⟩

/-- The pointwise representative gives exactly the coefficient-certified Hermite center. -/
theorem toLp_thirdCenterFn : chargeFn_thirdCenterFn.memLp.toLp thirdCenterFn = thirdCenter :=
  toLp_gradedHermiteFn 26 thirdCenterCoeff

/-- For the concrete third center, four Gaussian error bounds suffice for comparison piece 17. -/
theorem norm_piece17_thirdCenter_le {v c₁ c₂ : ℂ × ℂ → ℂ}
    (hv : ChargeFn v) (h₁ : ChargeFn c₁) (h₂ : ChargeFn c₂)
    (herror : ∀ k, ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ k : ℝ)) :
    ‖piece phiBound hv h₁ h₂ chargeFn_thirdCenterFn thirdTailIndex‖ ≤
      ((comparisonBand thirdTailIndex).error : ℝ) :=
  norm_piece17_le_of_third_captured hv h₁ h₂ chargeFn_thirdCenterFn toLp_thirdCenterFn herror

end Grothe.UpperChaos
