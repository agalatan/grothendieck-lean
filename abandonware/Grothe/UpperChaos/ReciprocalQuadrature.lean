import Grothe.UpperChaos.RetainedQuadraturePartition
import Mathlib.MeasureTheory.Integral.IntervalIntegral.IntegrationByParts
import Mathlib.Analysis.Calculus.Deriv.Inv

/-!
# Exact reciprocal auxiliary integration

A positive finite auxiliary interval is transformed by `x = 1/u`. The
Jacobian and orientation are explicit. The production endpoint `2^53`
becomes a strictly positive rational endpoint, so this identity does not
require a value or regularity assertion at zero.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set

namespace Grothe.UpperChaos.QuadraturePartition
noncomputable section

/-- Reciprocal substitution is exact for arbitrary complex integrands on a
positive interval; monotonicity supplies the change-of-variables theorem. -/
theorem integral_auxiliary_reciprocal (f : ℝ → ℂ) (a b : ℝ)
    (ha : 0 < a) (hb : 0 < b) :
    (∫ u in a..b, f u) =
      ∫ x in b⁻¹..a⁻¹, ((x ^ 2)⁻¹ : ℝ) • f x⁻¹ := by
  have hmin : 0 < min b⁻¹ a⁻¹ := lt_min (inv_pos.mpr hb) (inv_pos.mpr ha)
  have hx : ∀ x ∈ uIcc b⁻¹ a⁻¹, x ≠ 0 := by
    intro x hx
    exact ne_of_gt (hmin.trans_le hx.1)
  have h := intervalIntegral.integral_deriv_smul_comp_of_deriv_nonpos
    (f := fun x : ℝ => x⁻¹) (f' := fun x : ℝ => -(x ^ 2)⁻¹) (g := f)
    (a := b⁻¹) (b := a⁻¹)
    (continuousOn_id.inv₀ hx)
    (by
      intro x hxx
      exact hasDerivAt_inv (ne_of_gt (hmin.trans hxx.1)))
    (by
      intro x _hxx
      exact neg_nonpos.mpr (inv_nonneg.mpr (sq_nonneg x)))
  simp only [Function.comp_apply, neg_smul, intervalIntegral.integral_neg, inv_inv] at h
  rw [intervalIntegral.integral_symm a b] at h
  exact (neg_inj.mp h).symm

/-- The transformed kernel includes the entire reciprocal Jacobian. -/
def reciprocalKernel (f : ℝ → ℝ → ℂ) (x s : ℝ) : ℂ :=
  ((x ^ 2)⁻¹ : ℝ) • f x⁻¹ s

/-- The same radial cell has exactly the same integral after the reciprocal
auxiliary transformation, with reversed reciprocal endpoints. -/
theorem rectangleIntegral_eq_reciprocal (f : ℝ → ℝ → ℂ) (a b c d : ℝ)
    (ha : 0 < a) (hb : 0 < b) :
    rectangleIntegral f a b c d =
      rectangleIntegral (reciprocalKernel f) b⁻¹ a⁻¹ c d := by
  unfold rectangleIntegral
  rw [integral_auxiliary_reciprocal _ a b ha hb]
  apply intervalIntegral.integral_congr
  intro x _hx
  simp only [reciprocalKernel, intervalIntegral.integral_smul]

/-- The complete production tail from auxiliary one to `2^53` has rational
reciprocal endpoints and no missing boundary contribution. -/
theorem rectangleIntegral_production_tail_eq_reciprocal (f : ℝ → ℝ → ℂ) (c d : ℝ) :
    rectangleIntegral f 1 (2 ^ 53) c d =
      rectangleIntegral (reciprocalKernel f) ((2 : ℝ) ^ 53)⁻¹ 1 c d := by
  simpa only [inv_one] using rectangleIntegral_eq_reciprocal f 1 (2 ^ 53) c d
    (by norm_num) (by positivity)

/-- Split at auxiliary one and transform the entire remaining finite interval. -/
theorem rectangleIntegral_eq_initial_add_reciprocal (f : ℝ → ℝ → ℂ)
    (hf : Continuous f.uncurry) (v c d : ℝ) (hv : 0 < v) :
    rectangleIntegral f 0 v c d = rectangleIntegral f 0 1 c d +
      rectangleIntegral (reciprocalKernel f) v⁻¹ 1 c d := by
  have hF : Continuous (fun u => ∫ s in c..d, f u s) :=
    intervalIntegral.continuous_parametric_intervalIntegral_of_continuous' hf c d
  calc
    _ = rectangleIntegral f 0 1 c d + rectangleIntegral f 1 v c d := by
      exact (intervalIntegral.integral_add_adjacent_intervals
        (hF.intervalIntegrable 0 1) (hF.intervalIntegrable 1 v)).symm
    _ = _ := by
      rw [rectangleIntegral_eq_reciprocal f 1 v c d (by norm_num) hv, inv_one]

end
end Grothe.UpperChaos.QuadraturePartition
