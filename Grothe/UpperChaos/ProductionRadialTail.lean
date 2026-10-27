import Grothe.UpperChaos.TaylorRadialTail
import Grothe.UpperChaos.TaylorSingularCut

/-! Radial truncation of the actual base response and every Taylor source.
The base source has exactly the Gaussian tail energy, including at order zero.
Agent-ID: codex-2ca4. -/

open MeasureTheory

namespace Grothe.UpperChaos.TaylorRadialTail
noncomputable section

/-- The squared-radius tail of the actual product Gaussian is exactly exponential. -/
theorem measure_cutoffSet (L : ℝ) (hL : 0 ≤ L) :
    mu2.real (cutoffSet L) = Real.exp (-L) := by
  have hz : Grothe.LowerAnalytic.gaussC.real {z : ℂ | L < ‖z‖ ^ 2} =
      Real.exp (-L) := by
    simpa using RadialCutoff.gaussC_radial_exp_tail 0 L 1 hL (by norm_num)
  simpa [cutoffSet, mu2, measureReal_prod_prod] using hz

/-- Every Taylor source, including the base source, has this Gaussian tail bound. -/
theorem norm_source_sq_le_exp (L : ℝ) (hL : 0 ≤ L) (j : ℕ) :
    ‖(source_memLp L j).toLp (source L j)‖ ^ 2 ≤ Real.exp (-L) := by
  rw [norm_toLp_sq_eq_integral]
  have hI : Integrable ((cutoffSet L).indicator (fun _ => (1 : ℝ))) mu2 :=
    (integrable_const 1).indicator (measurableSet_cutoffSet L)
  calc
    _ ≤ ∫ u, (cutoffSet L).indicator (fun _ => (1 : ℝ)) u ∂mu2 := by
      apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => sq_nonneg _) hI
      exact Filter.Eventually.of_forall fun u => by
        by_cases hu : u ∈ cutoffSet L
        · simp only [source, Set.indicator_of_mem hu]
          nlinarith [TaylorSingularCut.norm_hpow_le_one j u, norm_nonneg (hpow j u)]
        · simp [source, hu]
    _ = mu2.real (cutoffSet L) := integral_indicator_one (measurableSet_cutoffSet L)
    _ = _ := measure_cutoffSet L hL

/-- At Taylor order zero the radial energy is exact, since the phase is unit a.e. -/
theorem norm_base_source_sq_eq_exp (L : ℝ) (hL : 0 ≤ L) :
    ‖(source_memLp L 0).toLp (source L 0)‖ ^ 2 = Real.exp (-L) := by
  rw [norm_source_sq_eq_integral, muCut_eq_restrict]
  calc
    _ = ∫ _u : ℂ × ℂ in cutoffSet L, (1 : ℝ) ∂mu2 := by
      apply integral_congr_ae
      filter_upwards [ae_restrict_of_ae norm_F0_ae_eq_one] with u hu
      simp [hpow, hu]
    _ = mu2.real (cutoffSet L) := by simp
    _ = _ := measure_cutoffSet L hL

/-- A short exponential certificate for the base-source cutoff. -/
theorem exp_neg_seventy_lt : Real.exp (-70) < (5 / 10 ^ 15 : ℝ) ^ 2 := by
  have hp : (148 : ℝ) ^ 14 < Real.exp 70 := by
    calc
      (148 : ℝ) ^ 14 < (Real.exp 5) ^ 14 := by
        gcongr
        exact exp_five_gt_148
      _ = Real.exp 70 := by
        rw [← Real.exp_nat_mul]
        norm_num
  have hinv : Real.exp (-70) < 1 / (148 : ℝ) ^ 14 := by
    simpa only [Real.exp_neg, one_div] using
      one_div_lt_one_div_of_lt (show (0 : ℝ) < 148 ^ 14 by positivity) hp
  exact hinv.trans (by norm_num)

/-- A squared-radius cutoff of seventy meets the reserve at every Taylor order. -/
theorem norm_source_seventy_lt (j : ℕ) :
    ‖(source_memLp 70 j).toLp (source 70 j)‖ < (5 / 10 ^ 15 : ℝ) := by
  have h := (norm_source_sq_le_exp 70 (by norm_num) j).trans_lt exp_neg_seventy_lt
  exact (sq_lt_sq₀ (norm_nonneg _) (by positivity)).mp h

/-- The same cutoff error controls every band after actual production smoothing. -/
theorem norm_projOn_smooth_source_seventy_lt (B : Set Idx2) (j : ℕ) :
    ‖projOn B (smoothOp ((source_memLp 70 j).toLp (source 70 j)))‖ <
      (5 / 10 ^ 15 : ℝ) :=
  ((modeSpace B).norm_starProjection_apply_le _).trans_lt
    ((norm_smoothOp_le _).trans_lt (norm_source_seventy_lt j))

end
end Grothe.UpperChaos.TaylorRadialTail
