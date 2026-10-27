import Grothe.UpperChaos.GaussianSmallBall
import Grothe.UpperChaos.ProfileUnitBounds

/-! A small-ball estimate for the actual argument of the production phase.
Agent-ID: codex-2ca4. -/

open MeasureTheory Set Real Grothe.LowerAnalytic

namespace Grothe.UpperChaos
noncomputable section

/-- The actual affine argument whose phase defines `F0`. -/
def basePhaseArg (u : ℂ × ℂ) : ℂ :=
  u.1 + ((Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖u.1‖ ^ 2) : ℝ) : ℂ) * u.2

lemma continuous_basePhaseArg : Continuous basePhaseArg := by
  unfold basePhaseArg
  have := continuous_vprof
  fun_prop

lemma F0_eq_ph_basePhaseArg (u : ℂ × ℂ) : F0 u = Grothe.Haag.ph (basePhaseArg u) := rfl

/-- Every fibre of the actual phase argument has the same quadratic small-ball bound. -/
theorem basePhaseArg_fibre_smallBall (z : ℂ) (r : ℝ) (hr : 0 ≤ r) :
    gaussC.real {w : ℂ | ‖basePhaseArg (z, w)‖ ≤ r} ≤ (100 / 9 : ℝ) * r ^ 2 := by
  let σ : ℝ := Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖z‖ ^ 2)
  change gaussC.real {w : ℂ | ‖z + (σ : ℂ) * w‖ ≤ r} ≤ _
  by_cases hrhalf : r ≤ 1 / 2
  · by_cases hz : ‖z‖ ≤ 1
    · have hzsq : ‖z‖ ^ 2 ≤ 1 := by nlinarith [norm_nonneg z]
      have hσ : 3 / 10 < σ := (profile_unit_bounds (‖z‖ ^ 2) (sq_nonneg _) hzsq).1
      have hσ0 : σ ≠ 0 := ne_of_gt (by linarith)
      have hb := affine_gaussian_smallBall z σ r hσ0 hr
      have hrec : 1 / σ ^ 2 ≤ (100 / 9 : ℝ) := by
        apply (div_le_iff₀ (sq_pos_of_ne_zero hσ0)).2
        nlinarith [sq_nonneg (σ - 3 / 10)]
      calc
        _ ≤ r ^ 2 / σ ^ 2 := hb
        _ = (1 / σ ^ 2) * r ^ 2 := by ring
        _ ≤ (100 / 9 : ℝ) * r ^ 2 := mul_le_mul_of_nonneg_right hrec (sq_nonneg r)
    · have hz1 : 1 < ‖z‖ := lt_of_not_ge hz
      have hfar : 2 * r < ‖z‖ := by linarith
      have hb := affine_gaussian_smallBall_far z σ r hr hfar
      have hnormsq : 1 ≤ ‖z‖ ^ 2 := by nlinarith
      have hrec : 4 / ‖z‖ ^ 2 ≤ (100 / 9 : ℝ) := by
        apply (div_le_iff₀ (by positivity : 0 < ‖z‖ ^ 2)).2
        linarith
      calc
        _ ≤ 4 * r ^ 2 / ‖z‖ ^ 2 := hb
        _ = (4 / ‖z‖ ^ 2) * r ^ 2 := by ring
        _ ≤ (100 / 9 : ℝ) * r ^ 2 := mul_le_mul_of_nonneg_right hrec (sq_nonneg r)
  · have hprob : gaussC.real {w : ℂ | ‖z + (σ : ℂ) * w‖ ≤ r} ≤ 1 := measureReal_le_one
    have hlarge : 1 ≤ (100 / 9 : ℝ) * r ^ 2 := by nlinarith
    exact hprob.trans hlarge

/-- The actual two-coordinate Gaussian phase argument satisfies a quadratic small-ball bound. -/
theorem basePhaseArg_smallBall (r : ℝ) (hr : 0 ≤ r) :
    mu2.real {u : ℂ × ℂ | ‖basePhaseArg u‖ ≤ r} ≤ (100 / 9 : ℝ) * r ^ 2 := by
  let S : Set (ℂ × ℂ) := {u | ‖basePhaseArg u‖ ≤ r}
  have hS : MeasurableSet S := measurableSet_le continuous_basePhaseArg.norm.measurable measurable_const
  have hI : Integrable (S.indicator (fun _ => (1 : ℝ))) mu2 :=
    (integrable_const 1).indicator hS
  have hfib (z : ℂ) :
      (∫ w, S.indicator (fun _ => (1 : ℝ)) (z, w) ∂gaussC) =
        gaussC.real {w : ℂ | ‖basePhaseArg (z, w)‖ ≤ r} := by
    have hSz : MeasurableSet {w : ℂ | ‖basePhaseArg (z, w)‖ ≤ r} := by
      apply measurableSet_le _ measurable_const
      exact (continuous_basePhaseArg.comp (continuous_const.prodMk continuous_id)).norm.measurable
    convert integral_indicator_one (μ := gaussC) hSz using 1
    apply integral_congr_ae
    exact Filter.Eventually.of_forall fun w => by
      by_cases hw : ‖basePhaseArg (z, w)‖ ≤ r <;> simp [S, hw]
  rw [← integral_indicator_one hS]
  change (∫ u, S.indicator (fun _ => (1 : ℝ)) u ∂mu2) ≤ _
  rw [mu2, integral_prod _ hI]
  simp_rw [hfib]
  calc
    _ ≤ ‖∫ z, gaussC.real {w : ℂ | ‖basePhaseArg (z, w)‖ ≤ r} ∂gaussC‖ := le_abs_self _
    _ ≤ ((100 / 9 : ℝ) * r ^ 2) * gaussC.real Set.univ := by
      apply norm_integral_le_of_norm_le_const
      exact Filter.Eventually.of_forall fun z => by
        rw [Real.norm_eq_abs, abs_of_nonneg measureReal_nonneg]
        exact basePhaseArg_fibre_smallBall z r hr
    _ = (100 / 9 : ℝ) * r ^ 2 := by simp

/-- The singular set of the actual base phase has zero Gaussian measure. -/
theorem basePhaseArg_ne_zero_ae : ∀ᵐ u ∂mu2, basePhaseArg u ≠ 0 := by
  have h := basePhaseArg_smallBall 0 le_rfl
  have hzero : mu2.real {u : ℂ × ℂ | basePhaseArg u = 0} = 0 := by
    have hle : mu2.real {u : ℂ × ℂ | basePhaseArg u = 0} ≤ 0 := by simpa using h
    exact le_antisymm hle measureReal_nonneg
  rw [ae_iff]
  simpa using (measureReal_eq_zero_iff).mp hzero

/-- The production base phase has unit modulus almost everywhere. -/
theorem norm_F0_ae_eq_one : ∀ᵐ u ∂mu2, ‖F0 u‖ = 1 := by
  filter_upwards [basePhaseArg_ne_zero_ae] with u hu
  rw [F0_eq_ph_basePhaseArg, Grothe.Haag.ph, norm_div, Complex.norm_real,
    Real.norm_of_nonneg (norm_nonneg _), div_self (norm_ne_zero_iff.mpr hu)]

/-- The exact base-phase energy is one; no numerical integration is required. -/
theorem integral_norm_F0_sq : (∫ u, ‖F0 u‖ ^ 2 ∂mu2) = 1 := by
  apply integral_eq_const
  filter_upwards [norm_F0_ae_eq_one] with u hu
  simp [hu]

end
end Grothe.UpperChaos
