import Grothe.UpperChaos.TaylorConditionalGaussian

/-!
# Rotational invariance of the Taylor conditional evaluator

The production conditional integral and its exact finite Wick evaluator are
radial in the first Gaussian coordinate.  This is a pointwise identity; it
does not assume a numerical Gaussian enclosure.

Agent-ID: codex-2ca4
-/

open MeasureTheory Complex Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

private lemma phaseLaplaceKernel_rot (c z : ℂ) (t : ℝ) (hc : ‖c‖ = 1) :
    Haag.phaseLaplaceKernel (c * z) t = c * Haag.phaseLaplaceKernel z t := by
  simp only [Haag.phaseLaplaceKernel, norm_mul, hc, one_mul]
  ring

private lemma basePhaseArgument_rot (c : ℂ) (u : ℂ × ℂ) (hc : ‖c‖ = 1) :
    basePhaseArgument (rot2 c u) = c * basePhaseArgument u := by
  simp only [basePhaseArgument, rot2, norm_mul, hc, one_mul]
  ring

private lemma taylorSource_kernel_rot {f : ℂ × ℂ → ℂ} (hf : ChargeFn f)
    (j : ℕ) (t : ℝ) (c : ℂ) (u : ℂ × ℂ) (hc : ‖c‖ = 1) :
    taylorInnerSource j f (rot2 c u) *
        Haag.phaseLaplaceKernel (basePhaseArgument (rot2 c u)) t =
      taylorInnerSource j f u * Haag.phaseLaplaceKernel (basePhaseArgument u) t := by
  have hcc : conj c * c = 1 := by
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hc]
    norm_num
  rw [taylorInnerSource, hf.rot c u hc, basePhaseArgument_rot c u hc,
    phaseLaplaceKernel_rot c _ t hc]
  simp only [map_mul, taylorPhasePower, phiT_rot2 hc]
  dsimp only [taylorInnerSource, taylorPhasePower]
  calc
    (conj c * conj (f u) * (I * (phiT u : ℂ)) ^ j) *
        (c * Haag.phaseLaplaceKernel (basePhaseArgument u) t) =
        (conj c * c) * (conj (f u) * (I * (phiT u : ℂ)) ^ j *
          Haag.phaseLaplaceKernel (basePhaseArgument u) t) := by ring
    _ = _ := by rw [hcc, one_mul]

/-- The Gaussian conditional integral depends only on the first radius. -/
theorem integral_taylorInnerSource_kernel_rot {f : ℂ × ℂ → ℂ} (hf : ChargeFn f)
    (j : ℕ) (t : ℝ) (c z : ℂ) (hc : ‖c‖ = 1) :
    (∫ w : ℂ, taylorInnerSource j f (c * z, w) *
        Haag.phaseLaplaceKernel (basePhaseArgument (c * z, w)) t ∂gaussC) =
      ∫ w : ℂ, taylorInnerSource j f (z, w) *
        Haag.phaseLaplaceKernel (basePhaseArgument (z, w)) t ∂gaussC := by
  have h := integral_rot_gaussC c hc (fun w : ℂ =>
    taylorInnerSource j f (c * z, w) *
      Haag.phaseLaplaceKernel (basePhaseArgument (c * z, w)) t)
  calc
    _ = ∫ w : ℂ, taylorInnerSource j f (c * z, c * w) *
        Haag.phaseLaplaceKernel (basePhaseArgument (c * z, c * w)) t ∂gaussC := h.symm
    _ = _ := by
      apply integral_congr_ae
      filter_upwards [] with w
      exact taylorSource_kernel_rot hf j t c (z, w) hc

/-- The finite conditional Wick evaluator is radial, including at zero. -/
theorem taylorConditionalWick_rot (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (t : ℝ) (ht : 0 < t) (c z : ℂ) (hc : ‖c‖ = 1) :
    taylorConditionalWick j N a t (c * z) = taylorConditionalWick j N a t z := by
  rw [← integral_taylorInnerSource_conditional j N a t (c * z) ht,
    ← integral_taylorInnerSource_conditional j N a t z ht]
  apply integral_taylorInnerSource_kernel_rot
  exact ⟨measurable_gradedHermiteFn N a, memLp_gradedHermiteFn N a,
    gradedHermiteFn_rot2 N a⟩

/-- The Wick evaluator is determined by its values on the nonnegative real axis. -/
theorem taylorConditionalWick_eq_norm (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (t : ℝ) (ht : 0 < t) (z : ℂ) :
    taylorConditionalWick j N a t z =
      taylorConditionalWick j N a t (‖z‖ : ℂ) := by
  by_cases hz : z = 0
  · simp [hz]
  · have hn : (‖z‖ : ℂ) ≠ 0 := by
      exact_mod_cast (norm_ne_zero_iff.mpr hz)
    let c : ℂ := z / (‖z‖ : ℂ)
    have hc : ‖c‖ = 1 := by
      dsimp only [c]
      rw [norm_div, Complex.norm_real, Real.norm_eq_abs,
        abs_of_nonneg (norm_nonneg z)]
      exact div_self (norm_ne_zero_iff.mpr hz)
    have he : c * (‖z‖ : ℂ) = z := by
      dsimp only [c]
      exact div_mul_cancel₀ z hn
    have h := taylorConditionalWick_rot j N a t ht c (‖z‖ : ℂ) hc
    rw [he] at h
    exact h

end
end Grothe.UpperChaos
