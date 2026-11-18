-- Grothe/UpperTightComparison.lean
import Grothe.UpperChaos.ThreeBandRegrouping
import Grothe.UpperTightBudget

/-!
# Three-band comparison with independent error radii

The seven linear comparison pieces may use arbitrary norm bounds, while the quadratic
charge uses the four unsplit sources. This separates the analytic comparison from the
numerical choice of radii. The production specialization uses the tighter radii recovered
from the existing panel and finite-table certificates, with each Taylor factorial applied once.

Agent-ID: codex-c8a4. Refs #389.
-/

set_option warningAsError true

open MeasureTheory Finset Grothe.Upper GrotheKernel

namespace Grothe.UpperChaos.ThreeBandRegrouping
noncomputable section

/-- Finite Bessel charges the difference once, using its four unsplit sources. -/
theorem quadratic_threeBand_le_of_radii (hφ : PhiBound) (R : Fin 4 → ℝ)
    (hR : ∀ p, ‖source hφ p‖ ≤ R p) :
    ∑ p ∈ headIdx 501, ‖energyBlock (productionG hφ) p -
      energyBlock (productionX hφ) p‖ ^ 2 ≤ (∑ p, R p) ^ 2 := by
  generalize headIdx 501 = S
  have hn : ‖productionG hφ - productionX hφ‖ ≤ ∑ p, R p := by
    rw [difference_sources]
    exact (norm_sum_le _ _).trans (sum_le_sum fun p _ ↦ hR p)
  calc
    _ = ∑ p ∈ S, energy (productionG hφ - productionX hφ) p :=
      sum_congr rfl fun p _ ↦ by rw [← energyBlock_sub, norm_energyBlock_sq]
    _ ≤ ‖productionG hφ - productionX hφ‖ ^ 2 := energy_sum_le_norm_sq _ _
    _ ≤ _ := pow_le_pow_left₀ (norm_nonneg _) hn 2

/-- Arbitrary mass and error bounds give the comparison with one unsplit quadratic charge. -/
theorem localized_comparison_of_weight_mass_radii (hφ : PhiBound)
    (w : ℕ × ℕ → ℝ) (hw : ∀ p, 0 ≤ w p ∧ w p ≤ 1)
    (a e : Fin 7 → ℝ) (R : Fin 4 → ℝ) (ha : ∀ j, 0 ≤ a j) (he : ∀ j, 0 ≤ e j)
    (hmass : ∀ j, ∑ p ∈ bandIndices (threeBandBands j),
      w p ^ 2 * energy (productionX hφ) p ≤ a j ^ 2)
    (hpiece : ∀ j, ‖threePiece hφ j‖ ≤ e j)
    (hsource : ∀ p, ‖source hφ p‖ ≤ R p) :
    ∑ p ∈ headIdx 501, w p *
      |energy (productionG hφ) p - energy (productionX hφ) p| ≤
      2 * ∑ j, a j * e j + (∑ p, R p) ^ 2 := by
  classical
  generalize hS : headIdx 501 = S
  have hz (j : Fin 7) (p : ℕ × ℕ)
      (hp : (threeBandBands j).contains p.1 p.2 = false) :
      energyBlock (threePiece hφ j) p = 0 := by
    have hh : ‖energyBlock (threePiece hφ j) p‖ ^ 2 = 0 :=
      (norm_energyBlock_sq _ _).trans (threePiece_support hφ j p hp)
    exact norm_eq_zero.mp ((pow_eq_zero_iff two_ne_zero).mp hh)
  have hc := BandComparison.weighted_compare S (univ : Finset (Fin 7))
    w (energyBlock (productionX hφ)) (energyBlock (productionG hφ))
    (fun j ↦ energyBlock (threePiece hφ j)) (fun j ↦ bandIndices (threeBandBands j))
    a e ((∑ p, R p) ^ 2)
    (fun p _ ↦ hw p)
    (fun p _ ↦ by rw [← energyBlock_sub, difference_threePieces, energyBlock_sum])
    (fun j _ p hp hpb ↦ by
      have hn : (threeBandBands j).contains p.1 p.2 = false := by
        simpa [bandIndices, hS, hp] using hpb
      exact hz j p hn)
    (fun j _ ↦ ha j) (fun j _ ↦ he j)
    (fun j _ ↦ by
      have hi : S ∩ bandIndices (threeBandBands j) = bandIndices (threeBandBands j) := by
        rw [← hS]
        exact inter_eq_right.mpr (bandIndices_subset _)
      simpa only [hi, mul_pow, norm_energyBlock_sq] using hmass j)
    (fun j _ ↦ by
      simp_rw [norm_energyBlock_sq]
      exact (energy_sum_le_norm_sq _ _).trans
        (pow_le_pow_left₀ (norm_nonneg _) (hpiece j) 2))
    (by simpa only [hS] using quadratic_threeBand_le_of_radii hφ R hsource)
  simpa only [norm_energyBlock_sq] using hc

section TightInputs

variable (hφ : PhiBound)
  (hfirst : ‖projOn (firstCenterBandModes 0) (taylorL2 hφ 1 - firstCenter)‖ ≤
    (tightLowErrorQ 0 : ℝ))
  (hsecond : ‖projOn (secondCenterBandModes 0) (taylorL2 hφ 2 - secondCenter)‖ ≤
    (tightLowErrorQ 1 : ℝ))
  (hthird : ‖projOn (thirdCenterBandModes 0) (taylorL2 hφ 3 - thirdCenter)‖ ≤
    (tightLowErrorQ 2 : ℝ))
  (hwholeFirst : ‖taylorL2 hφ 1 - firstCenter‖ ≤ (tightScaledRQ 0 : ℝ))
  (hwholeSecond : ‖taylorL2 hφ 2 - secondCenter‖ ≤ 2 * (tightScaledRQ 1 : ℝ))
  (hwholeThird : ‖taylorL2 hφ 3 - thirdCenter‖ ≤ 6 * (tightScaledRQ 2 : ℝ))

include hwholeFirst hwholeSecond hwholeThird

/-- The tight whole-source bounds include the Taylor factorials exactly once. -/
theorem norm_rawSource_tight_le (p : Fin 4) :
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

/-- Smoothing preserves each tighter whole-source radius. -/
theorem norm_source_tight_le (p : Fin 4) :
    ‖source hφ p‖ ≤ (tightGroupRadiusQ p : ℝ) :=
  (norm_smoothOp_le _).trans
    (norm_rawSource_tight_le hφ hwholeFirst hwholeSecond hwholeThird p)

private theorem norm_threePiece_tight_whole_le (j : Fin 7) :
    ‖threePiece hφ j‖ ≤ (tightGroupRadiusQ (threeBandPower j) : ℝ) :=
  ((modeSpace (bandModes (threeBandBands j))).norm_starProjection_apply_le _).trans
    (norm_source_tight_le hφ hwholeFirst hwholeSecond hwholeThird _)

include hfirst hsecond hthird in
/-- Low pieces use their captured errors; high pieces use independent whole-source bounds. -/
theorem norm_threePiece_tight_le (j : Fin 7) :
    ‖threePiece hφ j‖ ≤ (tightThreeBandErrorQ j : ℝ) := by
  fin_cases j
  · change ‖threePiece hφ 0‖ ≤ (tightGroupRadiusQ 0 : ℝ)
    exact norm_threePiece_tight_whole_le hφ hwholeFirst hwholeSecond hwholeThird 0
  · change ‖bandProj (comparisonBand (firstCapturedIndex 0))
        (smoothOp (rawSource hφ 1))‖ ≤ (tightLowErrorQ 0 : ℝ)
    refine (norm_bandProj_smoothOp_le _ _).trans ?_
    rw [rawSource_one]
    change ‖projOn (bandModes (comparisonBand (firstCapturedIndex 0)))
      (taylorL2 hφ 1 - firstCenter)‖ ≤ _
    rw [← firstCenterBandModes_eq_comparison]
    exact hfirst
  · simpa [tightThreeBandErrorQ, tightGroupRadiusQ, threeBandPower] using
      norm_threePiece_tight_whole_le hφ hwholeFirst hwholeSecond hwholeThird 2
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
      norm_threePiece_tight_whole_le hφ hwholeFirst hwholeSecond hwholeThird 4
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
      norm_threePiece_tight_whole_le hφ hwholeFirst hwholeSecond hwholeThird 6

end TightInputs

end
end Grothe.UpperChaos.ThreeBandRegrouping
