import Grothe.UpperChaos.PhaseAuxiliaryDecay
import Grothe.UpperChaos.ProductionRadialTail

/-!
# Uniform omission of large auxiliary parameters near profile zeros

On the fixed small-profile region, a second Gaussian coordinate of norm at
most ten leaves the actual phase argument away from zero. Its complement has
exact Gaussian tail mass. This controls every Taylor order in the original
Gaussian L² space, before any Hermite coefficient or band is selected.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set Grothe.LowerAnalytic

namespace Grothe.UpperChaos
noncomputable section

def smallProfileRegion : Set (ℂ × ℂ) :=
  {u | (1 / 4 : ℝ) ≤ ‖u.1‖ ∧
    |Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖u.1‖ ^ 2)| ≤ 1 / 100}

lemma measurableSet_smallProfileRegion : MeasurableSet smallProfileRegion := by
  have hc : Continuous (fun u : ℂ × ℂ =>
      |Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖u.1‖ ^ 2)|) := by
    have := continuous_vprof
    fun_prop
  exact (measurableSet_le measurable_const continuous_fst.norm.measurable).inter
    (measurableSet_le hc.measurable measurable_const)

theorem norm_basePhaseArg_smallProfile (u : ℂ × ℂ) (hu : u ∈ smallProfileRegion)
    (hw : ‖u.2‖ ≤ 10) : (1 / 8 : ℝ) ≤ ‖basePhaseArg u‖ := by
  let κ : ℝ := Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖u.1‖ ^ 2)
  change (1 / 4 : ℝ) ≤ ‖u.1‖ ∧ |κ| ≤ 1 / 100 at hu
  have hp : |κ| * ‖u.2‖ ≤ (1 / 10 : ℝ) := by
    calc
      _ ≤ (1 / 100 : ℝ) * 10 :=
        mul_le_mul hu.2 hw (norm_nonneg _) (by norm_num)
      _ = _ := by norm_num
  have h := norm_sub_le (u.1 + (κ : ℂ) * u.2) ((κ : ℂ) * u.2)
  simp only [add_sub_cancel_right, norm_mul, Complex.norm_real, Real.norm_eq_abs] at h
  change (1 / 8 : ℝ) ≤ ‖u.1 + (κ : ℂ) * u.2‖
  linarith [hu.1]

private theorem exp_neg_eighty_le_sq :
    Real.exp (-80) ≤ (1 / 10 ^ 17 : ℝ) ^ 2 := by
  have he : Real.exp (-80) = (Real.exp (-40)) ^ 2 := by
    rw [pow_two, ← Real.exp_add]
    norm_num
  rw [he]
  exact pow_le_pow_left₀ (Real.exp_pos _).le exp_neg_forty_le 2

/-- On the central second-coordinate event the entire auxiliary tail is tiny. -/
theorem norm_finiteLaplaceTailError_smallProfile_le (η : ℝ) (hη : 0 < η)
    (j : ℕ) (u : ℂ × ℂ) (hu : u ∈ smallProfileRegion) (hw : ‖u.2‖ ≤ 10) :
    ‖finiteLaplaceTailError η 10000 j u‖ ≤ (1 / 10 ^ 17 : ℝ) := by
  have hz := norm_basePhaseArg_smallProfile u hu hw
  have he : Real.exp (-((3 / 4 : ℝ) * ‖basePhaseArg u‖ ^ 2 * 10000)) ≤
      Real.exp (-80) := by
    apply Real.exp_le_exp.mpr
    nlinarith [sq_nonneg (‖basePhaseArg u‖ - 1 / 8)]
  calc
    _ ≤ 2 * Real.exp (-((3 / 4 : ℝ) * ‖basePhaseArg u‖ ^ 2 * 10000)) :=
      norm_finiteLaplaceTailError_phase_le η 10000 hη (by norm_num) j u
    _ ≤ 2 * Real.exp (-80) := mul_le_mul_of_nonneg_left he (by norm_num)
    _ ≤ _ := by nlinarith [exp_neg_eighty_le_sq]

def smallProfileAuxiliaryTail (η : ℝ) (j : ℕ) : ℂ × ℂ → ℂ :=
  smallProfileRegion.indicator (finiteLaplaceTailError η 10000 j)

lemma smallProfileAuxiliaryTail_memLp (η : ℝ) (hη : 0 < η) (j : ℕ) :
    MemLp (smallProfileAuxiliaryTail η j) 2 mu2 :=
  (finiteLaplaceTailError_memLp η 10000 hη (by norm_num) j).indicator
    measurableSet_smallProfileRegion

/-- Omitting all auxiliary values above one hundred on the fixed small-profile
region costs at most `2e-17` in the actual Gaussian source norm, uniformly in j. -/
theorem norm_smallProfileAuxiliaryTail_le (η : ℝ) (hη : 0 < η) (j : ℕ) :
    ‖(smallProfileAuxiliaryTail_memLp η hη j).toLp (smallProfileAuxiliaryTail η j)‖ ≤
      (2 / 10 ^ 17 : ℝ) := by
  let B : Set (ℂ × ℂ) := univ ×ˢ {w : ℂ | (100 : ℝ) < ‖w‖ ^ 2}
  have hB : MeasurableSet B := MeasurableSet.univ.prod
    (isOpen_lt continuous_const (continuous_norm.pow 2)).measurableSet
  have hmass : mu2.real B = Real.exp (-100) := by
    have hw : gaussC.real {w : ℂ | (100 : ℝ) < ‖w‖ ^ 2} = Real.exp (-100) := by
      simpa using RadialCutoff.gaussC_radial_exp_tail 0 100 1 (by norm_num) (by norm_num)
    simpa [B, mu2, measureReal_prod_prod] using hw
  have hmajor : Integrable (fun u : ℂ × ℂ =>
      (1 / 10 ^ 17 : ℝ) ^ 2 + B.indicator (fun _ => (1 : ℝ)) u) mu2 :=
    (integrable_const _).add ((integrable_const _).indicator hB)
  have hpoint (u : ℂ × ℂ) : ‖smallProfileAuxiliaryTail η j u‖ ^ 2 ≤
      (1 / 10 ^ 17 : ℝ) ^ 2 + B.indicator (fun _ => (1 : ℝ)) u := by
    by_cases hu : u ∈ smallProfileRegion
    · rw [smallProfileAuxiliaryTail, indicator_of_mem hu]
      by_cases hb : u ∈ B
      · rw [indicator_of_mem hb]
        have h := norm_finiteLaplaceTailError_pointwise_le η 10000 hη (by norm_num) j u
        have he : Real.exp (-(η ^ 2 * 10000)) ≤ 1 :=
          Real.exp_le_one_iff.mpr
            (neg_nonpos.mpr (mul_nonneg (sq_nonneg η) (by norm_num)))
        nlinarith [norm_nonneg (finiteLaplaceTailError η 10000 j u)]
      · rw [indicator_of_notMem hb, add_zero]
        have hw : ‖u.2‖ ≤ 10 := by
          have hs : ‖u.2‖ ^ 2 ≤ 100 := by simpa [B] using hb
          nlinarith [norm_nonneg u.2]
        exact pow_le_pow_left₀ (norm_nonneg _)
          (norm_finiteLaplaceTailError_smallProfile_le η hη j u hu hw) 2
    · simp only [smallProfileAuxiliaryTail, indicator_of_notMem hu, norm_zero, zero_pow
        (by decide : (2 : ℕ) ≠ 0)]
      exact add_nonneg (sq_nonneg _) (indicator_nonneg (fun _ _ => by norm_num) _)
  apply (sq_le_sq₀ (norm_nonneg _) (by positivity : (0 : ℝ) ≤ 2 / 10 ^ 17)).mp
  rw [norm_toLp_sq_eq_integral]
  have hI : (∫ u : ℂ × ℂ, B.indicator (fun _ => (1 : ℝ)) u ∂mu2) = mu2.real B :=
    integral_indicator_one hB
  calc
    _ ≤ ∫ u : ℂ × ℂ, (1 / 10 ^ 17 : ℝ) ^ 2 + B.indicator (fun _ => (1 : ℝ)) u ∂mu2 :=
      integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => sq_nonneg _)
        hmajor (Filter.Eventually.of_forall hpoint)
    _ = (1 / 10 ^ 17 : ℝ) ^ 2 + Real.exp (-100) := by
      rw [integral_add (integrable_const _) ((integrable_const _).indicator hB), hI, hmass]
      simp
    _ ≤ _ := by
      have h100 : Real.exp (-100) ≤ (1 / 10 ^ 17 : ℝ) ^ 2 :=
        (Real.exp_le_exp.mpr (by norm_num : (-100 : ℝ) ≤ -80)).trans exp_neg_eighty_le_sq
      nlinarith

end
end Grothe.UpperChaos
