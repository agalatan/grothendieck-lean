import Grothe.UpperChaos.PhiBound

/-!
# Phase moments as bounds on the Taylor sources

The phase cover makes every power of `phiT` integrable. An even phase moment
controls the squared `L²` norm of any function with the corresponding pointwise
bound. This is the interface between exact Gaussian moment calculations and
the comparison pieces; no numerical moment value is assumed here.
-/

open MeasureTheory
open scoped InnerProductSpace ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

lemma integrable_phiT_pow (j : ℕ) : Integrable (fun u => phiT u ^ j) mu2 := by
  refine (integrable_const (1 : ℝ)).mono'
    (continuous_phiT.pow j).aestronglyMeasurable (Filter.Eventually.of_forall fun u => ?_)
  rw [Real.norm_eq_abs, abs_pow]
  exact pow_le_one₀ (abs_nonneg _) (phi_abs_lt_one u).le

/-- The squared norm of the `L²` representative is the integral of the pointwise squared norm. -/
lemma norm_toLp_sq_eq_integral {f : ℂ × ℂ → ℂ} (hf : MemLp f 2 mu2) :
    ‖hf.toLp f‖ ^ 2 = ∫ u, ‖f u‖ ^ 2 ∂mu2 := by
  calc
    ‖hf.toLp f‖ ^ 2 = RCLike.re ⟪hf.toLp f, hf.toLp f⟫_ℂ :=
      norm_sq_eq_re_inner (𝕜 := ℂ) _
    _ = ∫ u, RCLike.re ⟪hf.toLp f u, hf.toLp f u⟫_ℂ ∂mu2 := by
      rw [L2.inner_def]
      exact (integral_re (L2.integrable_inner (𝕜 := ℂ) _ _)).symm
    _ = _ := by
      refine integral_congr_ae ?_
      filter_upwards [hf.coeFn_toLp] with u hu
      rw [hu, ← norm_sq_eq_re_inner]

/-- A pointwise phase-power bound yields an `L²` bound by the exact phase moment. -/
theorem norm_sq_le_phiT_moment {f : ℂ × ℂ → ℂ} (hf : MemLp f 2 mu2) (j : ℕ)
    (h : ∀ᵐ u ∂mu2, ‖f u‖ ^ 2 ≤ phiT u ^ (2 * j)) :
    ‖hf.toLp f‖ ^ 2 ≤ ∫ u, phiT u ^ (2 * j) ∂mu2 := by
  rw [norm_toLp_sq_eq_integral]
  exact integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => sq_nonneg _)
    (integrable_phiT_pow (2 * j)) h

/-- Where the base phase fails to have unit norm, the phase perturbation vanishes. -/
lemma norm_F0_eq_one_or_phiT_eq_zero (u : ℂ × ℂ) : ‖F0 u‖ = 1 ∨ phiT u = 0 := by
  set r : ℝ := √(1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖u.1‖ ^ 2)
  by_cases h : u.1 + (r : ℂ) * u.2 = 0
  · right
    have hz : u.1 = -((r : ℂ) * u.2) := eq_neg_of_add_eq_zero_left h
    have he : conj u.1 * u.2 = -(r : ℂ) * (Complex.normSq u.2 : ℂ) := by
      rw [hz, map_neg, map_mul, Complex.conj_ofReal,
        Complex.normSq_eq_conj_mul_self]
      ring
    unfold phiT
    rw [he]
    simp
  · left
    change ‖(u.1 + (r : ℂ) * u.2) / (‖u.1 + (r : ℂ) * u.2‖ : ℂ)‖ = 1
    rw [norm_div, Complex.norm_real, Real.norm_of_nonneg (norm_nonneg _),
      div_self (norm_ne_zero_iff.2 h)]

end

end Grothe.UpperChaos
