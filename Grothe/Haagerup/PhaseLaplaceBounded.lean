import Grothe.Haagerup.PhaseLaplaceFubini
import Mathlib.Tactic.Linarith

/-!
# The phase Laplace kernel at a fixed positive parameter

The bound is uniform in the complex phase argument. Multiplication by this
kernel preserves every integrable source, with no probability or profile
hypothesis. Agent-ID: codex-37fb.
-/

open MeasureTheory

namespace Grothe.Haag

noncomputable section

/-- A loose uniform bound at each positive Laplace parameter. -/
theorem norm_phaseLaplaceKernel_le (z : ℂ) (t : ℝ) (ht : 0 < t) :
    ‖phaseLaplaceKernel z t‖ ≤ t ^ (-(1 / 2 : ℝ)) * (1 + 1 / t) := by
  have hs : 0 ≤ t ^ (-(1 / 2 : ℝ)) := Real.rpow_nonneg ht.le _
  have he : 0 ≤ Real.exp (-(‖z‖ ^ 2 * t)) := (Real.exp_pos _).le
  have he_one : Real.exp (-(‖z‖ ^ 2 * t)) ≤ 1 :=
    Real.exp_le_one_iff.mpr (neg_nonpos.mpr (mul_nonneg (sq_nonneg _) ht.le))
  have hxexp : (‖z‖ ^ 2 * t) * Real.exp (-(‖z‖ ^ 2 * t)) ≤ 1 := by
    have hx : ‖z‖ ^ 2 * t ≤ Real.exp (‖z‖ ^ 2 * t) := by
      linarith [Real.add_one_le_exp (‖z‖ ^ 2 * t)]
    have h := mul_le_mul_of_nonneg_right hx he
    simpa only [← Real.exp_add, add_neg_cancel, Real.exp_zero] using h
  have hsq : ‖z‖ ^ 2 * Real.exp (-(‖z‖ ^ 2 * t)) ≤ 1 / t := by
    apply (le_div_iff₀ ht).mpr
    nlinarith [hxexp]
  have hr : ‖z‖ ≤ 1 + ‖z‖ ^ 2 := by
    nlinarith [sq_nonneg (‖z‖ - (1 / 2 : ℝ))]
  have hprofile : Real.exp (-(‖z‖ ^ 2 * t)) * ‖z‖ ≤ 1 + 1 / t := by
    calc
      _ ≤ Real.exp (-(‖z‖ ^ 2 * t)) * (1 + ‖z‖ ^ 2) :=
        mul_le_mul_of_nonneg_left hr he
      _ = Real.exp (-(‖z‖ ^ 2 * t)) +
          ‖z‖ ^ 2 * Real.exp (-(‖z‖ ^ 2 * t)) := by ring
      _ ≤ 1 + 1 / t := add_le_add he_one hsq
  calc
    _ = t ^ (-(1 / 2 : ℝ)) * (Real.exp (-(‖z‖ ^ 2 * t)) * ‖z‖) := by
      simp only [phaseLaplaceKernel, norm_mul, Complex.norm_real, Real.norm_eq_abs,
        abs_of_nonneg hs, abs_of_nonneg he]
      ring
    _ ≤ _ := mul_le_mul_of_nonneg_left hprofile hs

/-- At each positive parameter, the phase kernel preserves an arbitrary `L1` source. -/
theorem integrable_mul_phaseLaplaceKernel_at {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) {P f : Ω → ℂ} (hf : Measurable f) (hP : Integrable P μ)
    (t : ℝ) (ht : 0 < t) :
    Integrable (fun u => P u * phaseLaplaceKernel (f u) t) μ := by
  apply hP.mul_bdd
    (measurable_phaseLaplaceKernel.comp (hf.prodMk measurable_const)).aestronglyMeasurable
  exact Filter.Eventually.of_forall (fun u => norm_phaseLaplaceKernel_le (f u) t ht)

end
end Grothe.Haag
