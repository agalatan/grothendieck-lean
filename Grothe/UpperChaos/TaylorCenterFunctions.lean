import Grothe.UpperChaos.TaylorRounding
import Grothe.UpperChaos.ThirdCapturedTail

/-!
# Pointwise Taylor centers and the certified rounding piece

The preserved finite coefficient vectors have canonical polynomial
representatives satisfying `ChargeFn`. The zeroth comparison source is exactly
the finite rounding difference, so its comparison cap has no Gaussian error
premise. 

Agent-ID: codex-2ca4
-/

open MeasureTheory

namespace Grothe.UpperChaos

/-- Canonical pointwise polynomial for the first Taylor center. -/
noncomputable def firstCenterFn : ℂ × ℂ → ℂ := gradedHermiteFn 91 firstCenterCoeff

/-- Canonical pointwise polynomial for the second Taylor center. -/
noncomputable def secondCenterFn : ℂ × ℂ → ℂ := gradedHermiteFn 46 secondCenterCoeff

/-- Canonical pointwise polynomial for the frozen finite correction. -/
noncomputable def frozenCorrectionFn : ℂ × ℂ → ℂ := gradedHermiteFn 91 frozenCorrectionCoeff

/-- The concrete first center satisfies the charge-one function interface. -/
theorem chargeFn_firstCenterFn : ChargeFn firstCenterFn :=
  ⟨measurable_gradedHermiteFn 91 firstCenterCoeff, memLp_gradedHermiteFn 91 firstCenterCoeff,
    gradedHermiteFn_rot2 91 firstCenterCoeff⟩

/-- The concrete second center satisfies the charge-one function interface. -/
theorem chargeFn_secondCenterFn : ChargeFn secondCenterFn :=
  ⟨measurable_gradedHermiteFn 46 secondCenterCoeff, memLp_gradedHermiteFn 46 secondCenterCoeff,
    gradedHermiteFn_rot2 46 secondCenterCoeff⟩

/-- The concrete frozen correction satisfies the charge-one function interface. -/
theorem chargeFn_frozenCorrectionFn : ChargeFn frozenCorrectionFn :=
  ⟨measurable_gradedHermiteFn 91 frozenCorrectionCoeff,
    memLp_gradedHermiteFn 91 frozenCorrectionCoeff,
    gradedHermiteFn_rot2 91 frozenCorrectionCoeff⟩

/-- Passing the first pointwise center to `Lp` recovers its exact coefficient vector. -/
theorem toLp_firstCenterFn : chargeFn_firstCenterFn.memLp.toLp firstCenterFn = firstCenter :=
  toLp_gradedHermiteFn 91 firstCenterCoeff

/-- Passing the second pointwise center to `Lp` recovers its exact coefficient vector. -/
theorem toLp_secondCenterFn : chargeFn_secondCenterFn.memLp.toLp secondCenterFn = secondCenter :=
  toLp_gradedHermiteFn 46 secondCenterCoeff

/-- Passing the pointwise correction to `Lp` recovers its exact coefficient vector. -/
theorem toLp_frozenCorrectionFn :
    chargeFn_frozenCorrectionFn.memLp.toLp frozenCorrectionFn = frozenCorrection :=
  toLp_gradedHermiteFn 91 frozenCorrectionCoeff

private theorem srcP_zero_toLp {v c₁ c₂ c₃ : ℂ × ℂ → ℂ}
    (hv : ChargeFn v) (h₁ : ChargeFn c₁) (h₂ : ChargeFn c₂) (h₃ : ChargeFn c₃) :
    (chargeFn_srcP phiBound hv h₁ h₂ h₃ 0).memLp.toLp (srcP v c₁ c₂ c₃ 0) =
      h₁.memLp.toLp c₁ + (1 / 2 : ℂ) • h₂.memLp.toLp c₂ +
        (1 / 6 : ℂ) • h₃.memLp.toLp c₃ - hv.memLp.toLp v := by
  let hs := ((h₁.memLp.add (h₂.memLp.const_smul (1 / 2 : ℂ))).add
    (h₃.memLp.const_smul (1 / 6 : ℂ))).sub hv.memLp
  calc
    (chargeFn_srcP phiBound hv h₁ h₂ h₃ 0).memLp.toLp (srcP v c₁ c₂ c₃ 0) =
        hs.toLp (c₁ + (1 / 2 : ℂ) • c₂ + (1 / 6 : ℂ) • c₃ - v) := by
      apply (MemLp.toLp_eq_toLp_iff _ _).mpr
      exact Filter.Eventually.of_forall (fun u => by
        simp only [srcP, Pi.smul_apply, Pi.add_apply, Pi.sub_apply, smul_eq_mul]
        ring)
    _ = h₁.memLp.toLp c₁ + (1 / 2 : ℂ) • h₂.memLp.toLp c₂ +
        (1 / 6 : ℂ) • h₃.memLp.toLp c₃ - hv.memLp.toLp v := by rfl

/-- The concrete zeroth Taylor source is exactly the coefficient-certified rounding difference. -/
theorem taylorRounding_source_toLp :
    (chargeFn_srcP phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn 0).memLp.toLp
        (srcP frozenCorrectionFn firstCenterFn secondCenterFn thirdCenterFn 0) =
      roundingDifference := by
  have h := srcP_zero_toLp chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
    chargeFn_secondCenterFn chargeFn_thirdCenterFn
  rw [toLp_firstCenterFn, toLp_secondCenterFn, toLp_thirdCenterFn,
    toLp_frozenCorrectionFn] at h
  simpa only [roundingDifference, Rat.cast_div, Rat.cast_one, Rat.cast_ofNat] using h

private theorem toLp_div_sub {f g : ℂ × ℂ → ℂ}
    (hf : MemLp f 2 mu2) (hg : MemLp g 2 mu2) (a : ℂ)
    (hs : MemLp (fun u => (f u - g u) / a) 2 mu2) :
    hs.toLp (fun u => (f u - g u) / a) =
      (1 / a : ℂ) • (hf.toLp f - hg.toLp g) := by
  let ht := (hf.sub hg).const_smul (1 / a : ℂ)
  calc
    hs.toLp (fun u => (f u - g u) / a) = ht.toLp ((1 / a : ℂ) • (f - g)) := by
      apply (MemLp.toLp_eq_toLp_iff _ _).mpr
      exact Filter.Eventually.of_forall (fun u => by
        simp only [Pi.smul_apply, Pi.sub_apply, smul_eq_mul, div_eq_mul_inv]
        ring)
    _ = (1 / a : ℂ) • (hf.toLp f - hg.toLp g) := by rfl

/-- The first pointwise Taylor residual gives exactly the certified first center's error. -/
theorem toLp_taylorFirstSource :
    (chargeFn_srcP phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn 1).memLp.toLp
        (srcP frozenCorrectionFn firstCenterFn secondCenterFn thirdCenterFn 1) =
      (chargeFn_hpow phiBound 1).memLp.toLp (hpow 1) - firstCenter := by
  have h : (chargeFn_srcP phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn 1).memLp.toLp
        (srcP frozenCorrectionFn firstCenterFn secondCenterFn thirdCenterFn 1) =
      (chargeFn_hpow phiBound 1).memLp.toLp (hpow 1) -
        chargeFn_firstCenterFn.memLp.toLp firstCenterFn := by rfl
  rw [toLp_firstCenterFn] at h
  exact h

/-- The second pointwise Taylor residual includes exactly its factorial factor one half. -/
theorem toLp_taylorSecondSource :
    (chargeFn_srcP phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn 2).memLp.toLp
        (srcP frozenCorrectionFn firstCenterFn secondCenterFn thirdCenterFn 2) =
      (1 / 2 : ℂ) • ((chargeFn_hpow phiBound 2).memLp.toLp (hpow 2) - secondCenter) := by
  have h := toLp_div_sub (chargeFn_hpow phiBound 2).memLp
    chargeFn_secondCenterFn.memLp (2 : ℂ)
    (chargeFn_srcP phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn 2).memLp
  rw [toLp_secondCenterFn] at h
  exact h

/-- The third pointwise Taylor residual includes exactly its factorial factor one sixth. -/
theorem toLp_taylorThirdSource :
    (chargeFn_srcP phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn 3).memLp.toLp
        (srcP frozenCorrectionFn firstCenterFn secondCenterFn thirdCenterFn 3) =
      (1 / 6 : ℂ) • ((chargeFn_hpow phiBound 3).memLp.toLp (hpow 3) - thirdCenter) := by
  have h := toLp_div_sub (chargeFn_hpow phiBound 3).memLp
    chargeFn_thirdCenterFn.memLp (6 : ℂ)
    (chargeFn_srcP phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn 3).memLp
  rw [toLp_thirdCenterFn] at h
  exact h

/-- The rounding source is comparison index zero. -/
def taylorRoundingIndex : ComparisonIndex := ⟨0, by decide⟩

private theorem taylorRounding_pw : pw taylorRoundingIndex = 0 := by decide +kernel

/-- The production comparison records exactly the `10^-18` rounding cap. -/
theorem taylorRounding_error :
    (comparisonBand taylorRoundingIndex).error = (1 / 1000000000000000000 : ℚ) := by
  decide +kernel

/-- Every band projection of the exact rounding source satisfies its certified norm cap. -/
theorem norm_bandProj_roundingDifference_le (b : GrotheKernel.ComparisonBand) :
    ‖bandProj b roundingDifference‖ ≤ (1 / 1000000000000000000 : ℝ) := by
  have h := (modeSpace (bandModes b)).norm_starProjection_apply_le roundingDifference
  change ‖bandProj b roundingDifference‖ ≤ ‖roundingDifference‖ at h
  exact h.trans norm_roundingDifference_le

/-- The actual zeroth comparison piece satisfies its cap without an extra norm hypothesis. -/
theorem norm_piece0_taylorCenters_le :
    ‖piece phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
      chargeFn_secondCenterFn chargeFn_thirdCenterFn taylorRoundingIndex‖ ≤
      ((comparisonBand taylorRoundingIndex).error : ℝ) := by
  refine (norm_piece_le phiBound chargeFn_frozenCorrectionFn chargeFn_firstCenterFn
    chargeFn_secondCenterFn chargeFn_thirdCenterFn taylorRoundingIndex).trans ?_
  rw [taylorRounding_pw, taylorRounding_source_toLp]
  have he : ((comparisonBand taylorRoundingIndex).error : ℝ) =
      (1 / 1000000000000000000 : ℝ) := by
    rw [taylorRounding_error]
    norm_num
  rw [he]
  exact norm_bandProj_roundingDifference_le _

end Grothe.UpperChaos
