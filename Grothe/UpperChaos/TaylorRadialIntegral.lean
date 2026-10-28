import Grothe.UpperChaos.TaylorConditionalRadial
import Grothe.UpperChaos.TaylorWickReduction
import Grothe.UpperChaos.PhiBound
import Grothe.UpperChaos.PhaseMoments

/-!
# Real radial integration of the production Taylor evaluator

The exact conditional Wick expression is measurable and integrable because it
equals the conditional integral of the actual Gaussian source. Rotational
invariance then removes the remaining angular variable. With squared radius,
the remaining Gaussian density is simply `exp (-s)`.

Agent-ID: codex-2ca4
-/

open MeasureTheory Real Set Grothe.LowerAnalytic
open scoped InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- Radial integration for complex-valued functions of the standard Gaussian. -/
theorem integral_gaussC_radial_complex (f : ℝ → ℂ) (hf : Measurable f) :
    (∫ z, f ‖z‖ ∂gaussC) =
      2 * ∫ r in Ioi (0 : ℝ), (r * exp (-r ^ 2) : ℂ) * f r := by
  rw [integral_gaussC_eq_volume_complex (fun z : ℂ => f ‖z‖)
      (hf.comp measurable_norm),
    ← Complex.integral_comp_polarCoord_symm, polarCoord_target]
  have hp : ∀ p ∈ Ioi (0 : ℝ) ×ˢ Ioo (-π) π,
      p.1 • ((π⁻¹ * exp (-Complex.normSq (Complex.polarCoord.symm p))) •
        f ‖Complex.polarCoord.symm p‖) =
        ((π⁻¹ : ℝ) : ℂ) * ((p.1 * exp (-p.1 ^ 2) : ℂ) * f p.1) * 1 := by
    intro p hp
    rw [Complex.normSq_eq_norm_sq, norm_polarCoord_symm_of_mem hp]
    simp only [Complex.real_smul]
    push_cast
    ring
  rw [setIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo) hp,
    Measure.volume_eq_prod,
    setIntegral_prod_mul
      (fun r : ℝ => ((π⁻¹ : ℝ) : ℂ) * ((r * exp (-r ^ 2) : ℂ) * f r))
      (fun _ : ℝ => (1 : ℂ)) (Ioi 0) (Ioo (-π) π),
    integral_const_mul]
  have hangle : (∫ _θ in Ioo (-π) π, (1 : ℂ)) = ((2 * π : ℝ) : ℂ) := by
    have hr : (∫ _θ in Ioo (-π) π, (1 : ℝ)) = 2 * π := by
      simp only [integral_const, smul_eq_mul, mul_one, Measure.real,
        Measure.restrict_apply_univ, Real.volume_Ioo]
      rw [ENNReal.toReal_ofReal (by linarith [pi_pos])]
      ring
    exact (integral_complex_ofReal (f := fun _θ : ℝ => (1 : ℝ))
      (μ := volume.restrict (Ioo (-π) π))).trans (congrArg Complex.ofReal hr)
  rw [hangle]
  push_cast
  have hπ : (π : ℂ) ≠ 0 := by exact_mod_cast pi_ne_zero
  have cancel (x : ℂ) : (π : ℂ)⁻¹ * x * (2 * (π : ℂ)) = 2 * x := by
    calc
      _ = ((π : ℂ)⁻¹ * (π : ℂ)) * (2 * x) := by ring
      _ = _ := by rw [inv_mul_cancel₀ hπ, one_mul]
  exact cancel _

/-- The squared radius of a standard complex Gaussian has exponential density. -/
theorem integral_gaussC_norm_sq_complex (f : ℝ → ℂ) (hf : Measurable f) :
    (∫ z, f (‖z‖ ^ 2) ∂gaussC) =
      ∫ s in Ioi (0 : ℝ), (exp (-s) : ℂ) * f s := by
  rw [integral_gaussC_radial_complex (fun r => f (r ^ 2)) (hf.comp (by fun_prop))]
  have h := integral_comp_rpow_Ioi_of_pos
    (g := fun s : ℝ => (exp (-s) : ℂ) * f s) (p := 2) (by norm_num)
  simp only [show (2 : ℝ) - 1 = 1 by norm_num, Real.rpow_one,
    Real.rpow_two, Complex.real_smul] at h
  rw [← h, ← integral_const_mul]
  apply setIntegral_congr_fun measurableSet_Ioi
  intro r hr
  push_cast
  ring

/-- Measurability comes from the exact conditional source integral. -/
theorem measurable_taylorConditionalWick (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (t : ℝ) (ht : 0 < t) : Measurable (taylorConditionalWick j N a t) := by
  let hc : ChargeFn (gradedHermiteFn N a) :=
    ⟨measurable_gradedHermiteFn N a, memLp_gradedHermiteFn N a,
      gradedHermiteFn_rot2 N a⟩
  have hm : Measurable (fun u : ℂ × ℂ => taylorInnerSource j (gradedHermiteFn N a) u *
      Haag.phaseLaplaceKernel (basePhaseArgument u) t) :=
    (measurable_taylorInnerSource hc j).mul
      (Haag.measurable_phaseLaplaceKernel.comp
        (measurable_basePhaseArgument.prodMk measurable_const))
  have he : taylorConditionalWick j N a t = fun z =>
      ∫ w, taylorInnerSource j (gradedHermiteFn N a) (z, w) *
        Haag.phaseLaplaceKernel (basePhaseArgument (z, w)) t ∂gaussC := by
    funext z
    exact (integral_taylorInnerSource_conditional j N a t z ht).symm
  rw [he]
  exact hm.stronglyMeasurable.integral_prod_right'.measurable

/-- Absolute integrability is inherited from the production Gaussian source. -/
theorem integrable_taylorConditionalWick (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (t : ℝ) (ht : 0 < t) : Integrable (taylorConditionalWick j N a t) gaussC := by
  let hc : ChargeFn (gradedHermiteFn N a) :=
    ⟨measurable_gradedHermiteFn N a, memLp_gradedHermiteFn N a,
      gradedHermiteFn_rot2 N a⟩
  have h := (integrable_taylorInnerSource_kernel phiBound hc j t ht).integral_prod_left
  simpa only [integral_taylorInnerSource_conditional j N a t _ ht] using h

/-- Exact removal of the first Gaussian angle from the finite Wick evaluator. -/
theorem integral_taylorConditionalWick_eq_radial (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (t : ℝ) (ht : 0 < t) :
    (∫ z, taylorConditionalWick j N a t z ∂gaussC) =
      2 * ∫ r in Ioi (0 : ℝ), (r * exp (-r ^ 2) : ℂ) *
        taylorConditionalWick j N a t (r : ℂ) := by
  have hm := (measurable_taylorConditionalWick j N a t ht).comp Complex.measurable_ofReal
  calc
    _ = ∫ z, taylorConditionalWick j N a t (‖z‖ : ℂ) ∂gaussC := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall (taylorConditionalWick_eq_norm j N a t ht)
    _ = _ := integral_gaussC_radial_complex _ hm

/-- In squared radius the production evaluator has the elementary exponential weight. -/
theorem integral_taylorConditionalWick_eq_sq_radial (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (t : ℝ) (ht : 0 < t) :
    (∫ z, taylorConditionalWick j N a t z ∂gaussC) =
      ∫ s in Ioi (0 : ℝ), (exp (-s) : ℂ) *
        taylorConditionalWick j N a t (sqrt s : ℂ) := by
  have hm := (measurable_taylorConditionalWick j N a t ht).comp
    (Complex.measurable_ofReal.comp continuous_sqrt.measurable)
  calc
    _ = ∫ z, taylorConditionalWick j N a t (sqrt (‖z‖ ^ 2) : ℂ) ∂gaussC := by
      apply integral_congr_ae
      filter_upwards [] with z
      rw [sqrt_sq (norm_nonneg z)]
      exact taylorConditionalWick_eq_norm j N a t ht z
    _ = _ := integral_gaussC_norm_sq_complex _ hm

/-- The production Taylor inner product is an exact integral in two real variables. -/
theorem inner_gradedHermite_hpow_eq_sq_radial (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    ⟪gradedHermite N a, (chargeFn_hpow phiBound j).memLp.toLp (hpow j)⟫_ℂ =
      (sqrt π : ℂ)⁻¹ * ∫ t : ℝ in Ioi 0,
        ∫ s : ℝ in Ioi 0, (exp (-s) : ℂ) *
          taylorConditionalWick j N a t (sqrt s : ℂ) := by
  rw [inner_gradedHermite_hpow_eq_wick phiBound]
  congr 1
  apply setIntegral_congr_fun measurableSet_Ioi
  intro t ht
  exact integral_taylorConditionalWick_eq_sq_radial j N a t ht

end

end Grothe.UpperChaos
