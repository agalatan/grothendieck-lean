import Grothe.Upper.RelaxedThreeBandBudget
import Grothe.UpperChaos.ThreeBandComparison

/-!
# Three-band comparison with relaxed low-band errors

The three raw low-band errors use `relaxedLowErrorQ`. The high-band pieces retain the original
whole-source radii, and the quadratic term still charges the four unsplit sources once.
The source functions, projections, mass certificates and energy-table allowance are unchanged.

Agent-ID: codex-1a87. Refs #332.
-/

open MeasureTheory Finset Grothe.Upper GrotheKernel

set_option warningAsError true

namespace Grothe.UpperChaos.ThreeBandRegrouping

noncomputable section

section Inputs

variable (hφ : PhiBound) (hf : OriginalFiniteChecks)
  (hfirst : ‖projOn (firstCenterBandModes 0) (taylorL2 hφ 1 - firstCenter)‖ ≤
    (relaxedLowErrorQ 0 : ℝ))
  (hsecond : ‖projOn (secondCenterBandModes 0) (taylorL2 hφ 2 - secondCenter)‖ ≤
    (relaxedLowErrorQ 1 : ℝ))
  (hthird : ‖projOn (thirdCenterBandModes 0) (taylorL2 hφ 3 - thirdCenter)‖ ≤
    (relaxedLowErrorQ 2 : ℝ))
  (hwholeFirst : ‖taylorL2 hφ 1 - firstCenter‖ ≤ (comparisonGroupRadiusQ 1 : ℝ))
  (hwholeSecond : ‖taylorL2 hφ 2 - secondCenter‖ ≤ 2 * (comparisonGroupRadiusQ 2 : ℝ))
  (hwholeThird : ‖taylorL2 hφ 3 - thirdCenter‖ ≤ 6 * (comparisonGroupRadiusQ 3 : ℝ))

include hf hfirst hsecond hthird hwholeFirst hwholeSecond hwholeThird

/-- Relaxing a low-band error changes only that linear piece; factorials enter exactly once. -/
theorem norm_threePiece_le_relaxed (j : Fin 7) :
    ‖threePiece hφ j‖ ≤ (relaxedThreeBandErrorQ j : ℝ) := by
  fin_cases j
  · simpa [relaxedThreeBandErrorQ, threeBandBands, threeBandPower,
      comparisonGroupRadiusQ, comparisonBands] using
      norm_threePiece_whole_le hφ hf hwholeFirst hwholeSecond hwholeThird 0
  · change ‖bandProj (comparisonBand (firstCapturedIndex 0))
        (smoothOp (rawSource hφ 1))‖ ≤ (relaxedLowErrorQ 0 : ℝ)
    refine (norm_bandProj_smoothOp_le _ _).trans ?_
    rw [rawSource_one]
    change ‖projOn (bandModes (comparisonBand (firstCapturedIndex 0)))
      (taylorL2 hφ 1 - firstCenter)‖ ≤ _
    rw [← firstCenterBandModes_eq_comparison]
    exact hfirst
  · simpa [relaxedThreeBandErrorQ, threeBandBands, threeBandPower, threeBandScaledRQ] using
      norm_threePiece_whole_le hφ hf hwholeFirst hwholeSecond hwholeThird 2
  · change ‖bandProj (comparisonBand (secondCapturedIndex 0))
        (smoothOp (rawSource hφ 2))‖ ≤ ((relaxedLowErrorQ 1 / 2 : ℚ) : ℝ)
    refine (norm_bandProj_smoothOp_le _ _).trans ?_
    rw [rawSource_two]
    change ‖projOn (bandModes (comparisonBand (secondCapturedIndex 0)))
      ((1 / 2 : ℂ) • (taylorL2 hφ 2 - secondCenter))‖ ≤ _
    rw [map_smul, norm_smul, ← secondCenterBandModes_eq_comparison]
    have hscale : ‖(1 / 2 : ℂ)‖ = (1 / 2 : ℝ) := by norm_num [norm_div]
    rw [hscale]
    push_cast
    linarith
  · simpa [relaxedThreeBandErrorQ, threeBandBands, threeBandPower, threeBandScaledRQ] using
      norm_threePiece_whole_le hφ hf hwholeFirst hwholeSecond hwholeThird 4
  · change ‖bandProj (comparisonBand (thirdCapturedIndex 0))
        (smoothOp (rawSource hφ 3))‖ ≤ ((relaxedLowErrorQ 2 / 6 : ℚ) : ℝ)
    refine (norm_bandProj_smoothOp_le _ _).trans ?_
    rw [rawSource_three]
    change ‖projOn (bandModes (comparisonBand (thirdCapturedIndex 0)))
      ((1 / 6 : ℂ) • (taylorL2 hφ 3 - thirdCenter))‖ ≤ _
    rw [map_smul, norm_smul, ← thirdCenterBandModes_eq_comparison]
    have hscale : ‖(1 / 6 : ℂ)‖ = (1 / 6 : ℝ) := by norm_num [norm_div]
    rw [hscale]
    push_cast
    linarith
  · simpa [relaxedThreeBandErrorQ, threeBandBands, threeBandPower, threeBandScaledRQ] using
      norm_threePiece_whole_le hφ hf hwholeFirst hwholeSecond hwholeThird 6

/-- The actual comparison with relaxed low bands and the original whole-source radii. -/
theorem localized_comparison_relaxed_of_checks
    (hclose : ∑ p ∈ headIdx 501,
      |energy (productionX hφ) p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)) :
    ∑ p ∈ headIdx 501, comparisonWeight p *
      |energy (productionG hφ) p - energy (productionX hφ) p| ≤
        (relaxedThreeBandCompareQ : ℝ) := by
  classical
  generalize hS : headIdx 501 = S at hclose ⊢
  let a : Fin 7 → ℝ := fun j ↦ ((threeBandBands j).norm : ℝ)
  let e : Fin 7 → ℝ := fun j ↦ (relaxedThreeBandErrorQ j : ℝ)
  have ha : ∀ j, 0 ≤ a j := by
    intro j
    change 0 ≤ ((threeBandBands j).norm : ℝ)
    exact_mod_cast (threeBand_nonneg j).1
  have he : ∀ j, 0 ≤ e j := by
    intro j
    change 0 ≤ (relaxedThreeBandErrorQ j : ℝ)
    exact_mod_cast relaxedThreeBandErrorQ_nonneg j
  have hz (j : Fin 7) (p : ℕ × ℕ)
      (hp : (threeBandBands j).contains p.1 p.2 = false) :
      energyBlock (threePiece hφ j) p = 0 := by
    have hh : ‖energyBlock (threePiece hφ j) p‖ ^ 2 = 0 :=
      (norm_energyBlock_sq _ _).trans (threePiece_support hφ j p hp)
    apply norm_eq_zero.mp
    nlinarith [norm_nonneg (energyBlock (threePiece hφ j) p)]
  have hc := BandComparison.weighted_compare S (univ : Finset (Fin 7))
    comparisonWeight (energyBlock (productionX hφ)) (energyBlock (productionG hφ))
    (fun j ↦ energyBlock (threePiece hφ j)) (fun j ↦ bandIndices (threeBandBands j))
    a e ((∑ g : Fin 4, (comparisonGroupRadiusQ g : ℝ)) ^ 2)
    (fun p _ ↦ comparisonWeight_bounds p)
    (fun p _ ↦ by rw [← energyBlock_sub, difference_threePieces, energyBlock_sum])
    (fun j _ p hp hpb ↦ hz j p (by simpa [bandIndices, hS, hp] using hpb))
    (fun j _ ↦ ha j) (fun j _ ↦ he j)
    (fun j _ ↦ by
      have hm := actual_threeBand_mass hf (by simpa only [hS] using hclose) j
      have hi : S ∩ bandIndices (threeBandBands j) = bandIndices (threeBandBands j) := by
        rw [← hS]
        exact inter_eq_right.mpr (bandIndices_subset _)
      simpa only [hi, mul_pow, norm_energyBlock_sq] using hm)
    (fun j _ ↦ by
      simp_rw [norm_energyBlock_sq]
      exact (energy_sum_le_norm_sq _ _).trans
        (pow_le_pow_left₀ (norm_nonneg _)
          (norm_threePiece_le_relaxed hφ hf hfirst hsecond hthird
            hwholeFirst hwholeSecond hwholeThird j) 2))
    (by simpa only [hS] using
      quadratic_threeBand_le hφ hf hwholeFirst hwholeSecond hwholeThird)
  simp_rw [norm_energyBlock_sq] at hc
  have hq : 2 * (∑ j : Fin 7, a j * e j) +
      (∑ g : Fin 4, (comparisonGroupRadiusQ g : ℝ)) ^ 2 =
        (relaxedThreeBandCompareQ : ℝ) := by
    simp only [relaxedThreeBandCompareQ, threeBandQuadraticQ, a, e,
      Rat.cast_add, Rat.cast_mul, Rat.cast_sum, Rat.cast_pow, Rat.cast_ofNat]
  exact hc.trans_eq hq

end Inputs

/-- Production comparison from relaxed low-band bounds, original whole-error bounds and table
accuracy, using the same production phase and finite certificates. -/
theorem localized_comparison_relaxed_three_band
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
    ∑ p ∈ headIdx 501, comparisonWeight p *
      |energy ((memLp_GT phiBound).toLp GT) p -
        energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
          (Xfun frozenCorrectionFn)) p| ≤ (relaxedThreeBandCompareQ : ℝ) :=
  localized_comparison_relaxed_of_checks phiBound productionFiniteChecks
    hfirst hsecond hthird hwholeFirst hwholeSecond hwholeThird hclose

end

end Grothe.UpperChaos.ThreeBandRegrouping
