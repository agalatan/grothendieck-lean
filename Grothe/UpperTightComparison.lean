-- Grothe/UpperTightComparison.lean
import Grothe.Upper.ImprovedHeadMass
import Grothe.UpperChaos.ThreeBandComparison
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

/-- Any rational bounds on the grouped mass squares bound the corresponding actual masses. -/
theorem actual_threeBand_mass_of_caps (hf : OriginalFiniteChecks) {EX : ℕ × ℕ → ℝ}
    (hclose : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ))
    (A : Fin 7 → ℚ)
    (hA : ∀ j, (∑ k : Fin 18, if threeBandOldGroup k = j then
      comparisonBands[k].norm ^ 2 else 0) ≤ A j ^ 2) (j : Fin 7) :
    ∑ p ∈ bandIndices (threeBandBands j), comparisonWeight p ^ 2 * EX p ≤
      (A j : ℝ) ^ 2 := by
  classical
  rw [threeBand_indices_union, sum_biUnion (old_group_indices_disjoint j)]
  calc
    _ ≤ ∑ k ∈ (univ : Finset (Fin 18)).filter (fun k ↦ threeBandOldGroup k = j),
        ((comparisonBand k).norm : ℝ) ^ 2 :=
      sum_le_sum fun k _ ↦ actual_band_mass_of_checks hf hclose (comparisonBand_mem k)
    _ ≤ (A j : ℝ) ^ 2 := by
      rw [sum_filter]
      change (∑ k : Fin 18, if threeBandOldGroup k = j then
        (comparisonBands[k].norm : ℝ) ^ 2 else 0) ≤ (A j : ℝ) ^ 2
      have h := (Rat.cast_le (K := ℝ)).mpr (hA j)
      simpa only [Rat.cast_sum, apply_ite (fun q : ℚ ↦ (q : ℝ)),
        Rat.cast_zero, Rat.cast_pow] using h

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

/-- The original coefficient costs specialize the arbitrary-weight comparison. -/
theorem localized_comparison_of_mass_radii (hφ : PhiBound)
    (a e : Fin 7 → ℝ) (R : Fin 4 → ℝ) (ha : ∀ j, 0 ≤ a j) (he : ∀ j, 0 ≤ e j)
    (hmass : ∀ j, ∑ p ∈ bandIndices (threeBandBands j),
      comparisonWeight p ^ 2 * energy (productionX hφ) p ≤ a j ^ 2)
    (hpiece : ∀ j, ‖threePiece hφ j‖ ≤ e j)
    (hsource : ∀ p, ‖source hφ p‖ ≤ R p) :
    ∑ p ∈ headIdx 501, comparisonWeight p *
      |energy (productionG hφ) p - energy (productionX hφ) p| ≤
      2 * ∑ j, a j * e j + (∑ p, R p) ^ 2 :=
  localized_comparison_of_weight_mass_radii hφ comparisonWeight comparisonWeight_bounds
    a e R ha he hmass hpiece hsource

/-- The actual comparison is independent of the chosen seven piece and four source radii. -/
theorem localized_comparison_of_radii (hφ : PhiBound) (hf : OriginalFiniteChecks)
    (e : Fin 7 → ℝ) (R : Fin 4 → ℝ) (he : ∀ j, 0 ≤ e j)
    (hpiece : ∀ j, ‖threePiece hφ j‖ ≤ e j)
    (hsource : ∀ p, ‖source hφ p‖ ≤ R p)
    (hclose : ∑ p ∈ headIdx 501,
      |energy (productionX hφ) p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)) :
    ∑ p ∈ headIdx 501, comparisonWeight p *
      |energy (productionG hφ) p - energy (productionX hφ) p| ≤
      2 * ∑ j, ((threeBandBands j).norm : ℝ) * e j + (∑ p, R p) ^ 2 :=
  localized_comparison_of_mass_radii hφ (fun j ↦ ((threeBandBands j).norm : ℝ)) e R
    (fun j ↦ Rat.cast_nonneg.mpr (threeBand_nonneg j).1) he
    (actual_threeBand_mass hf hclose) hpiece hsource

section TightInputs

variable (hφ : PhiBound) (hf : OriginalFiniteChecks)
  (hfirst : ‖projOn (firstCenterBandModes 0) (taylorL2 hφ 1 - firstCenter)‖ ≤
    (tightLowErrorQ 0 : ℝ))
  (hsecond : ‖projOn (secondCenterBandModes 0) (taylorL2 hφ 2 - secondCenter)‖ ≤
    (tightLowErrorQ 1 : ℝ))
  (hthird : ‖projOn (thirdCenterBandModes 0) (taylorL2 hφ 3 - thirdCenter)‖ ≤
    (tightLowErrorQ 2 : ℝ))
  (hwholeFirst : ‖taylorL2 hφ 1 - firstCenter‖ ≤ (tightScaledRQ 0 : ℝ))
  (hwholeSecond : ‖taylorL2 hφ 2 - secondCenter‖ ≤ 2 * (tightScaledRQ 1 : ℝ))
  (hwholeThird : ‖taylorL2 hφ 3 - thirdCenter‖ ≤ 6 * (tightScaledRQ 2 : ℝ))

include hf hwholeFirst hwholeSecond hwholeThird

/-- The tight whole-source bounds include the Taylor factorials exactly once. -/
theorem norm_rawSource_tight_le (p : Fin 4) :
    ‖rawSource hφ p‖ ≤ (tightGroupRadiusQ p : ℝ) := by
  fin_cases p
  · change ‖rawSource hφ 0‖ ≤ (comparisonGroupRadiusQ 0 : ℝ)
    rw [rawSource_zero]
    exact norm_roundingDifference_le_of_checks hf
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
    (norm_rawSource_tight_le hφ hf hwholeFirst hwholeSecond hwholeThird p)

private theorem norm_threePiece_tight_whole_le (j : Fin 7) :
    ‖threePiece hφ j‖ ≤ (tightGroupRadiusQ (threeBandPower j) : ℝ) :=
  ((modeSpace (bandModes (threeBandBands j))).norm_starProjection_apply_le _).trans
    (norm_source_tight_le hφ hf hwholeFirst hwholeSecond hwholeThird _)

include hfirst hsecond hthird in
/-- Low pieces use their captured errors; high pieces use independent whole-source bounds. -/
theorem norm_threePiece_tight_le (j : Fin 7) :
    ‖threePiece hφ j‖ ≤ (tightThreeBandErrorQ j : ℝ) := by
  fin_cases j
  · change ‖threePiece hφ 0‖ ≤ (tightGroupRadiusQ 0 : ℝ)
    exact norm_threePiece_tight_whole_le hφ hf hwholeFirst hwholeSecond hwholeThird 0
  · change ‖bandProj (comparisonBand (firstCapturedIndex 0))
        (smoothOp (rawSource hφ 1))‖ ≤ (tightLowErrorQ 0 : ℝ)
    refine (norm_bandProj_smoothOp_le _ _).trans ?_
    rw [rawSource_one]
    change ‖projOn (bandModes (comparisonBand (firstCapturedIndex 0)))
      (taylorL2 hφ 1 - firstCenter)‖ ≤ _
    rw [← firstCenterBandModes_eq_comparison]
    exact hfirst
  · simpa [tightThreeBandErrorQ, tightGroupRadiusQ, threeBandPower] using
      norm_threePiece_tight_whole_le hφ hf hwholeFirst hwholeSecond hwholeThird 2
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
      norm_threePiece_tight_whole_le hφ hf hwholeFirst hwholeSecond hwholeThird 4
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
      norm_threePiece_tight_whole_le hφ hf hwholeFirst hwholeSecond hwholeThird 6

include hfirst hsecond hthird in
/-- The tighter error and grouped mass radii specialize the same generic comparison. -/
theorem localized_comparison_tight_three_band_of_checks
    (hclose : ∑ p ∈ headIdx 501,
      |energy (productionX hφ) p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)) :
    ∑ p ∈ headIdx 501, improvedWeight p *
      |energy (productionG hφ) p - energy (productionX hφ) p| ≤
      (tightThreeBandCompareQ : ℝ) := by
  have hc := localized_comparison_of_weight_mass_radii hφ improvedWeight improvedWeight_bounds (fun j ↦ (tightThreeBandMassQ j : ℝ))
    (fun j ↦ (tightThreeBandErrorQ j : ℝ)) (fun p ↦ (tightGroupRadiusQ p : ℝ))
    (fun j ↦ Rat.cast_nonneg.mpr (tightThreeBandMassQ_nonneg j))
    (fun j ↦ Rat.cast_nonneg.mpr (tightThreeBandErrorQ_nonneg j))
    (actual_improved_threeBand_mass hf (fun p ↦ energy_nonneg (productionX hφ) p) hclose)
    (norm_threePiece_tight_le hφ hf hfirst hsecond hthird
      hwholeFirst hwholeSecond hwholeThird)
    (norm_source_tight_le hφ hf hwholeFirst hwholeSecond hwholeThird)
  simpa only [tightThreeBandCompareQ, tightThreeBandQuadraticQ, Rat.cast_add,
    Rat.cast_mul, Rat.cast_sum, Rat.cast_pow, Rat.cast_ofNat] using hc

end TightInputs

/-- Production comparison from the six tighter Gaussian bounds and unchanged table accuracy. -/
theorem localized_comparison_tight_three_band
    (hfirst : ‖projOn (firstCenterBandModes 0) (firstTaylorL2 - firstCenter)‖ ≤
      (tightLowErrorQ 0 : ℝ))
    (hsecond : ‖projOn (secondCenterBandModes 0) (secondTaylorL2 - secondCenter)‖ ≤
      (tightLowErrorQ 1 : ℝ))
    (hthird : ‖projOn (thirdCenterBandModes 0) (thirdTaylorL2 - thirdCenter)‖ ≤
      (tightLowErrorQ 2 : ℝ))
    (hwholeFirst : ‖firstTaylorL2 - firstCenter‖ ≤ (tightScaledRQ 0 : ℝ))
    (hwholeSecond : ‖secondTaylorL2 - secondCenter‖ ≤ 2 * (tightScaledRQ 1 : ℝ))
    (hwholeThird : ‖thirdTaylorL2 - thirdCenter‖ ≤ 6 * (tightScaledRQ 2 : ℝ))
    (hclose : ∑ p ∈ headIdx 501,
      |energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
        (Xfun frozenCorrectionFn)) p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)) :
    ∑ p ∈ headIdx 501, improvedWeight p *
      |energy ((memLp_GT phiBound).toLp GT) p -
        energy ((memLp_Xfun phiBound chargeFn_frozenCorrectionFn).toLp
          (Xfun frozenCorrectionFn)) p| ≤ (tightThreeBandCompareQ : ℝ) :=
  localized_comparison_tight_three_band_of_checks phiBound productionFiniteChecks
    hfirst hsecond hthird hwholeFirst hwholeSecond hwholeThird hclose

end
end Grothe.UpperChaos.ThreeBandRegrouping
