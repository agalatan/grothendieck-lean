import Grothe.UpperChaos.ProductionFiniteLaplace

/-!
# Auxiliary tail decay in the actual phase argument

Rescaling the phase argument by two leaves a uniformly integrable kernel and
extracts Gaussian decay in the original argument. This estimate is useful for
omitting large auxiliary parameters near small-profile regions, where the
original first Gaussian coordinate stays away from zero.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set Grothe.Haag

namespace Grothe.UpperChaos
noncomputable section

private theorem norm_phaseLaplaceKernel_eq (z : ℂ) (t : ℝ) (ht : 0 ≤ t) :
    ‖phaseLaplaceKernel z t‖ =
      (t ^ (-(1 / 2 : ℝ)) * Real.exp (-(‖z‖ ^ 2 * t))) * ‖z‖ := by
  rw [phaseLaplaceKernel, norm_mul, Complex.norm_real,
    Real.norm_of_nonneg (mul_nonneg (Real.rpow_nonneg ht _) (Real.exp_pos _).le)]

/-- Exact extraction of an exponential by a harmless radius dilation. -/
theorem norm_phaseLaplaceKernel_half (z : ℂ) (t : ℝ) (ht : 0 ≤ t) :
    ‖phaseLaplaceKernel z t‖ =
      (2 * Real.exp (-((3 / 4 : ℝ) * ‖z‖ ^ 2 * t))) *
        ‖phaseLaplaceKernel (z / 2) t‖ := by
  rw [norm_phaseLaplaceKernel_eq z t ht,
    norm_phaseLaplaceKernel_eq (z / 2) t ht]
  have hn : ‖z / 2‖ = ‖z‖ / 2 := by simp
  rw [hn]
  have he : Real.exp (-(‖z‖ ^ 2 * t)) =
      Real.exp (-((3 / 4 : ℝ) * ‖z‖ ^ 2 * t)) *
        Real.exp (-((‖z‖ / 2) ^ 2 * t)) := by
    rw [← Real.exp_add]
    congr 1
    ring
  rw [he]
  ring

/-- The full omitted auxiliary kernel has Gaussian decay in its phase argument,
independently of the softening scale. -/
theorem integral_norm_softPhaseLaplaceKernel_tail_phase_le (η : ℝ) (z : ℂ)
    (T : ℝ) (hT : 0 ≤ T) :
    (∫ t : ℝ in Ioi T, ‖softPhaseLaplaceKernel η z t‖) ≤
      (2 * Real.exp (-((3 / 4 : ℝ) * ‖z‖ ^ 2 * T))) * Real.sqrt Real.pi := by
  let C : ℝ := 2 * Real.exp (-((3 / 4 : ℝ) * ‖z‖ ^ 2 * T))
  have hC : 0 ≤ C := by dsimp [C]; positivity
  have hsub : Ioi T ⊆ Ioi (0 : ℝ) := Ioi_subset_Ioi hT
  have hi := (integrableOn_phaseLaplaceKernel (z / 2)).norm
  have hb : (∫ t : ℝ in Ioi T, ‖phaseLaplaceKernel (z / 2) t‖) ≤
      Real.sqrt Real.pi :=
    (setIntegral_mono_set hi (Filter.Eventually.of_forall fun _ => norm_nonneg _)
      (Filter.Eventually.of_forall hsub)).trans (integral_norm_phaseLaplaceKernel_le _)
  calc
    _ ≤ ∫ t : ℝ in Ioi T, C * ‖phaseLaplaceKernel (z / 2) t‖ := by
      apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => norm_nonneg _)
        ((hi.mono_set hsub).const_mul C)
      filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht
      have ht0 : 0 ≤ t := hT.trans ht.le
      apply (norm_softPhaseLaplaceKernel_le η z t ht0).trans
      rw [norm_phaseLaplaceKernel_half z t ht0]
      apply mul_le_mul_of_nonneg_right _ (norm_nonneg _)
      apply mul_le_mul_of_nonneg_left _ (by norm_num : (0 : ℝ) ≤ 2)
      apply Real.exp_le_exp.mpr
      exact neg_le_neg (mul_le_mul_of_nonneg_left ht.le
        (mul_nonneg (by norm_num) (sq_nonneg ‖z‖)))
    _ = C * ∫ t : ℝ in Ioi T, ‖phaseLaplaceKernel (z / 2) t‖ :=
      integral_const_mul _ _
    _ ≤ _ := mul_le_mul_of_nonneg_left hb hC

/-- The actual finite-phase error inherits the phase-argument Gaussian decay. -/
theorem norm_softPhase_sub_finiteLaplacePhase_phase_le (η T : ℝ) (hη : 0 < η)
    (hT : 0 ≤ T) (z : ℂ) :
    ‖softPhase η z - finiteLaplacePhase η T z‖ ≤
      2 * Real.exp (-((3 / 4 : ℝ) * ‖z‖ ^ 2 * T)) := by
  rw [softPhase_sub_finiteLaplacePhase η T hη hT, norm_mul, norm_inv,
    Complex.norm_real, Real.norm_of_nonneg (Real.sqrt_nonneg _)]
  calc
    _ ≤ (Real.sqrt Real.pi)⁻¹ *
        ∫ t : ℝ in Ioi T, ‖softPhaseLaplaceKernel η z t‖ :=
      mul_le_mul_of_nonneg_left (norm_integral_le_integral_norm _) (by positivity)
    _ ≤ (Real.sqrt Real.pi)⁻¹ *
        ((2 * Real.exp (-((3 / 4 : ℝ) * ‖z‖ ^ 2 * T))) * Real.sqrt Real.pi) :=
      mul_le_mul_of_nonneg_left
        (integral_norm_softPhaseLaplaceKernel_tail_phase_le η z T hT) (by positivity)
    _ = _ := by field_simp [ne_of_gt (Real.sqrt_pos.2 Real.pi_pos)]

/-- The same phase-argument decay controls every actual Taylor source. -/
theorem norm_finiteLaplaceTailError_phase_le (η T : ℝ) (hη : 0 < η)
    (hT : 0 ≤ T) (j : ℕ) (u : ℂ × ℂ) :
    ‖finiteLaplaceTailError η T j u‖ ≤
      2 * Real.exp (-((3 / 4 : ℝ) * ‖basePhaseArg u‖ ^ 2 * T)) := by
  have he : finiteLaplaceTailError η T j u =
      (Complex.I * (phiT u : ℂ)) ^ j *
        (softPhase η (basePhaseArg u) - finiteLaplacePhase η T (basePhaseArg u)) := by
    simp only [finiteLaplaceTailError, softHpow, finiteLaplaceHpow, softF0, mul_sub]
  rw [he, norm_mul, norm_pow, norm_mul, Complex.norm_I, one_mul,
    Complex.norm_real, Real.norm_eq_abs]
  calc
    _ ≤ 1 * ‖softPhase η (basePhaseArg u) - finiteLaplacePhase η T (basePhaseArg u)‖ :=
      mul_le_mul_of_nonneg_right
        (pow_le_one₀ (abs_nonneg _) (phi_abs_lt_one u).le) (norm_nonneg _)
    _ ≤ _ := by simpa using norm_softPhase_sub_finiteLaplacePhase_phase_le η T hη hT _

end
end Grothe.UpperChaos
