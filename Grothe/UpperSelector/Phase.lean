import Grothe.UpperSelector.Realization

/-! # Scalar phase masses and the dominated selector kernel -/

open MeasureTheory Complex Finset
open scoped Polynomial

set_option warningAsError true

namespace Haagerup.AngularSelector

noncomputable section

theorem phaseMass_nonneg (k : ℕ) : 0 ≤ haagCoeff k := by
  rw [← energy_phase2_odd_zero]
  exact energy_nonneg _ _

private theorem phaseGrade_injective :
    Function.Injective (fun k : ℕ => ((2 * k + 1, 0) : ℕ × ℕ)) := by
  intro i j h
  have := congrArg Prod.fst h
  dsimp at this
  omega

theorem phaseMass_summable : Summable haagCoeff := by
  simpa [Function.comp_def, energy_phase2_odd_zero] using
    (hasSum_energy_bideg (memLp_phase2.toLp phase2)).summable.comp_injective phaseGrade_injective

/-- Bessel's inequality bounds the full mass, so lower enclosures can pay all lost grades. -/
theorem phaseMass_le_one : (∑' k, haagCoeff k) ≤ 1 := by
  let G := memLp_phase2.toLp phase2
  have h := tsum_comp_le_tsum_of_inj (hasSum_energy_bideg G).summable (energy_nonneg G)
    phaseGrade_injective
  have hLp : eLpNorm phase2 2 mu2 ≤ 1 := by
    simpa using eLpNorm_le_of_ae_bound (μ := mu2) (p := 2) measurable_phase2.aestronglyMeasurable
      (ae_of_all _ norm_phase2_le)
  have hn : ‖G‖ ≤ 1 := by
    rw [Lp.norm_toLp]
    simpa using ENNReal.toReal_mono ENNReal.one_ne_top hLp
  calc
    _ ≤ ∑' nm, energy G nm := by simpa [Function.comp_def, G, energy_phase2_odd_zero] using h
    _ = _ := (hasSum_energy_bideg G).tsum_eq
    _ ≤ 1 := pow_le_one₀ (norm_nonneg G) hn

private theorem phase_unprocessed (n : ℕ) :
    bivarKernel 1 0 (energy (memLp_phase2.toLp phase2)) n = haagCoeff n := by
  rw [phase_bivarKernel_eq]
  simp [Polynomial.coeff_X_pow]

theorem phaseKernel_dominated : DominatedKernel (radialKernel haagCoeff) := by
  have h := (rounding_diskKernel measurable_phase2 norm_phase2_le
    (fun _ u hc => phase2_rot2 hc u) memLp_phase2 (P := 1) (Q := 0) (by simp) (by simp)).dominated
  simpa only [funext phase_unprocessed] using h

theorem measurable_phaseKernel : Measurable (radialKernel haagCoeff) := by
  unfold radialKernel
  exact Measurable.tsum fun _ => by fun_prop

theorem phaseKernel_norm_le {z : ℂ} (hz : ‖z‖ ≤ 1) : ‖radialKernel haagCoeff z‖ ≤ 1 := by
  let F (k : ℕ) := (haagCoeff k : ℂ) * (z * (‖z‖ : ℂ) ^ (2 * k))
  have hF (k) : ‖F k‖ ≤ haagCoeff k := by
    dsimp [F]
    rw [norm_mul, norm_mul, norm_pow, Complex.norm_real, Complex.norm_real,
      Real.norm_eq_abs, Real.norm_eq_abs, abs_of_nonneg (norm_nonneg _), abs_of_nonneg (phaseMass_nonneg k)]
    apply mul_le_of_le_one_right (phaseMass_nonneg k)
    exact (mul_le_of_le_one_right (norm_nonneg z) (pow_le_one₀ (norm_nonneg _) hz)).trans hz
  have hs := Summable.of_nonneg_of_le (fun n => norm_nonneg (F n)) hF phaseMass_summable
  exact (norm_tsum_le_tsum_norm hs).trans ((hs.tsum_le_tsum hF phaseMass_summable).trans phaseMass_le_one)

/-- The scalar phase series, angular selector and signed polynomial are jointly dominated. -/
theorem phaseSelector_dominated (R : ℝ[X]) (hR : l1 R ≤ 1) (t : ℝ) :
    DominatedKernel (selectorKernel (radialKernel haagCoeff) R t) :=
  selectorKernel_dominated phaseKernel_dominated measurable_phaseKernel
    (fun _ hz => phaseKernel_norm_le hz) R hR t

end

end Haagerup.AngularSelector
