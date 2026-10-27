import Grothe.UpperChaos.GaussianDensityBounds
import Grothe.LowerAnalytic.CapPolar
import Mathlib.MeasureTheory.Measure.Lebesgue.VolumeOfBalls

/-! Small-ball estimates for an affine complex Gaussian, including variance
that depends on the first coordinate. Agent-ID: codex-2ca4. -/

open MeasureTheory Set Real Grothe.LowerAnalytic

namespace Grothe.UpperChaos
noncomputable section

/-- The inverse image of a disk under a nondegenerate complex affine map. -/
theorem affine_smallBall_eq_closedBall (z : ℂ) (σ r : ℝ) (hσ : σ ≠ 0) :
    {w : ℂ | ‖z + (σ : ℂ) * w‖ ≤ r} =
      Metric.closedBall (-z / (σ : ℂ)) (r / |σ|) := by
  have hc : (σ : ℂ) ≠ 0 := by exact_mod_cast hσ
  have ha : 0 < |σ| := abs_pos.mpr hσ
  ext w
  rw [Set.mem_ofPred_eq, Metric.mem_closedBall, dist_eq_norm]
  have he : w - -z / (σ : ℂ) = (z + (σ : ℂ) * w) / (σ : ℂ) := by
    field_simp
    ring
  rw [he, norm_div, Complex.norm_real, Real.norm_eq_abs]
  exact (div_le_div_iff_of_pos_right ha).symm

/-- Integrating a density cap over the exact inverse-image disk gives a probability bound. -/
theorem affine_gaussian_smallBall_of_density (z : ℂ) (σ r C : ℝ)
    (hσ : σ ≠ 0) (hr : 0 ≤ r)
    (hden : ∀ w : ℂ, ‖z + (σ : ℂ) * w‖ ≤ r →
      Real.exp (-‖w‖ ^ 2) / σ ^ 2 ≤ C) :
    gaussC.real {w : ℂ | ‖z + (σ : ℂ) * w‖ ≤ r} ≤ C * r ^ 2 := by
  let S : Set ℂ := {w | ‖z + (σ : ℂ) * w‖ ≤ r}
  have hS : MeasurableSet S := by
    exact measurableSet_le (by fun_prop : Measurable fun w : ℂ => ‖z + (σ : ℂ) * w‖)
      measurable_const
  have hball : S = Metric.closedBall (-z / (σ : ℂ)) (r / |σ|) :=
    affine_smallBall_eq_closedBall z σ r hσ
  have hvol : volume.real S = (r / |σ|) ^ 2 * Real.pi := by
    rw [hball, measureReal_def, Complex.volume_closedBall]
    simp [ENNReal.toReal_mul, ENNReal.toReal_pow, ENNReal.toReal_ofReal,
      div_nonneg hr (abs_nonneg σ)]
  have hfinite : volume S < ⊤ := by
    rw [hball, Complex.volume_closedBall]
    finiteness
  have hσ2 : 0 < σ ^ 2 := sq_pos_of_ne_zero hσ
  have hnorm : ∀ᵐ w ∂(volume : Measure ℂ), w ∈ S →
      ‖Real.pi⁻¹ * Real.exp (-Complex.normSq w)‖ ≤ Real.pi⁻¹ * (C * σ ^ 2) := by
    exact Filter.Eventually.of_forall fun w hw => by
      rw [Real.norm_eq_abs, abs_of_nonneg (by positivity), Complex.normSq_eq_norm_sq]
      apply mul_le_mul_of_nonneg_left _ (by positivity)
      exact (div_le_iff₀ hσ2).mp (hden w hw)
  have hi : gaussC.real S = ∫ w in S, Real.pi⁻¹ * Real.exp (-Complex.normSq w) := by
    calc
      _ = ∫ w, S.indicator (fun _ : ℂ => (1 : ℝ)) w ∂gaussC :=
        (integral_indicator_one hS).symm
      _ = ∫ w : ℂ, (Real.pi⁻¹ * Real.exp (-Complex.normSq w)) *
          S.indicator (fun _ : ℂ => (1 : ℝ)) w :=
        integral_gaussC_eq_volume _ (measurable_const.indicator hS)
      _ = _ := by
        rw [← integral_indicator hS]
        apply integral_congr_ae
        exact Filter.Eventually.of_forall fun w => by
          by_cases hw : w ∈ S <;> simp [hw]
  rw [hi]
  calc
    _ ≤ ‖∫ w in S, Real.pi⁻¹ * Real.exp (-Complex.normSq w)‖ := le_abs_self _
    _ ≤ (Real.pi⁻¹ * (C * σ ^ 2)) * volume.real S :=
      norm_setIntegral_le_of_norm_le_const_ae' hfinite hnorm
    _ = C * r ^ 2 := by
      rw [hvol, div_pow, sq_abs]
      field_simp [ne_of_gt Real.pi_pos, hσ]

/-- A nonzero variance bounded away from zero controls every translated disk. -/
theorem affine_gaussian_smallBall (z : ℂ) (σ r : ℝ) (hσ : σ ≠ 0) (hr : 0 ≤ r) :
    gaussC.real {w : ℂ | ‖z + (σ : ℂ) * w‖ ≤ r} ≤ r ^ 2 / σ ^ 2 := by
  have h := affine_gaussian_smallBall_of_density z σ r (1 / σ ^ 2) hσ hr
    (fun w _ => div_le_div_of_nonneg_right
      (Real.exp_le_one_iff.mpr (neg_nonpos.mpr (sq_nonneg ‖w‖))) (sq_nonneg σ))
  simpa only [div_mul_eq_mul_div, one_mul] using h

/-- Away from the first-coordinate origin the disk bound is uniform in the variance. -/
theorem affine_gaussian_smallBall_far (z : ℂ) (σ r : ℝ) (hr : 0 ≤ r)
    (hz : 2 * r < ‖z‖) :
    gaussC.real {w : ℂ | ‖z + (σ : ℂ) * w‖ ≤ r} ≤ 4 * r ^ 2 / ‖z‖ ^ 2 := by
  by_cases hσ : σ = 0
  · have he : {w : ℂ | ‖z + (σ : ℂ) * w‖ ≤ r} = ∅ := by
      simp only [hσ, Complex.ofReal_zero, zero_mul, add_zero]
      exact Set.eq_empty_iff_forall_notMem.mpr (by intro w hw; dsimp at hw; linarith)
    rw [he, measureReal_empty]
    positivity
  · have h := affine_gaussian_smallBall_of_density z σ r (4 / ‖z‖ ^ 2) hσ hr
      (fun w hw => gaussian_affine_small_ball_density_bound z w σ r hr hz hσ hw)
    simpa only [div_mul_eq_mul_div] using h

end
end Grothe.UpperChaos
