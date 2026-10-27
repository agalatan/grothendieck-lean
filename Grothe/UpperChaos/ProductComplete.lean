import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.MeasureTheory.Integral.Prod

/-!
# Completeness of product families in complex L²

Partial pairing against a fixed L² function preserves L² by Cauchy–Schwarz and
Fubini. Products of two complete families are therefore complete: apply
one-coordinate completeness to each partial coefficient, then to almost every
fibre. Only the second family needs a countable index.
-/

open MeasureTheory
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos.ProductComplete

noncomputable section

variable {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
  {μ : Measure α} {ν : Measure β}

private lemma inner_toLp_integral {f g : α → ℂ} (hf : MemLp f 2 μ) (hg : MemLp g 2 μ) :
    ⟪hf.toLp f, hg.toLp g⟫_ℂ = ∫ x, conj (f x) * g x ∂μ := by
  rw [L2.inner_def]
  refine integral_congr_ae ?_
  filter_upwards [hf.coeFn_toLp, hg.coeFn_toLp] with x hx hy
  rw [hx, hy, RCLike.inner_apply, mul_comm]

private lemma norm_toLp_sq {f : α → ℂ} (hf : MemLp f 2 μ) :
    ‖hf.toLp f‖ ^ 2 = ∫ x, ‖f x‖ ^ 2 ∂μ := by
  calc
    ‖hf.toLp f‖ ^ 2 = RCLike.re ⟪hf.toLp f, hf.toLp f⟫_ℂ :=
      norm_sq_eq_re_inner (𝕜 := ℂ) _
    _ = ∫ x, RCLike.re ⟪hf.toLp f x, hf.toLp f x⟫_ℂ ∂μ := by
      rw [L2.inner_def]
      exact (integral_re (L2.integrable_inner (𝕜 := ℂ) _ _)).symm
    _ = _ := by
      refine integral_congr_ae ?_
      filter_upwards [hf.coeFn_toLp] with x hx
      rw [hx, ← norm_sq_eq_re_inner]

lemma integral_conj_mul_sq_le {f g : α → ℂ} (hf : MemLp f 2 μ) (hg : MemLp g 2 μ) :
    ‖∫ x, conj (f x) * g x ∂μ‖ ^ 2 ≤
      (∫ x, ‖f x‖ ^ 2 ∂μ) * ∫ x, ‖g x‖ ^ 2 ∂μ := by
  have h := pow_le_pow_left₀ (norm_nonneg ⟪hf.toLp f, hg.toLp g⟫_ℂ)
    (norm_inner_le_norm (𝕜 := ℂ) (hf.toLp f) (hg.toLp g)) 2
  simpa only [inner_toLp_integral, mul_pow, norm_toLp_sq] using h

variable [SFinite ν]

lemma memLp_prod_mul {f : α → ℂ} {g : β → ℂ}
    (hf : MemLp f 2 μ) (hg : MemLp g 2 ν) :
    MemLp (fun u : α × β => f u.1 * g u.2) 2 (μ.prod ν) := by
  refine (memLp_two_iff_integrable_sq_norm
    (hf.aestronglyMeasurable.comp_fst.mul hg.aestronglyMeasurable.comp_snd)).2 ?_
  have h := (hf.integrable_norm_pow (by decide : 2 ≠ 0)).mul_prod
    (hg.integrable_norm_pow (by decide : 2 ≠ 0))
  simpa only [Pi.mul_apply, norm_mul, mul_pow] using h

variable [SFinite μ]

lemma ae_memLp_fibre {F : α × β → ℂ} (hF : MemLp F 2 (μ.prod ν)) :
    ∀ᵐ x ∂μ, MemLp (fun y => F (x, y)) 2 ν := by
  filter_upwards [hF.aestronglyMeasurable.prodMk_left,
    (hF.integrable_norm_pow (by decide : 2 ≠ 0)).prod_right_ae] with x hm hi
  exact (memLp_two_iff_integrable_sq_norm hm).2 hi

/-- Partial pairing with a fixed square-integrable function preserves square integrability. -/
lemma memLp_integral_conj_mul {F : α × β → ℂ} {g : β → ℂ}
    (hF : MemLp F 2 (μ.prod ν)) (hg : MemLp g 2 ν) :
    MemLp (fun x => ∫ y, conj (g y) * F (x, y) ∂ν) 2 μ := by
  have hm : AEStronglyMeasurable (fun x => ∫ y, conj (g y) * F (x, y) ∂ν) μ :=
    (hg.aestronglyMeasurable.star.comp_snd.mul hF.aestronglyMeasurable).integral_prod_right'
  refine (memLp_two_iff_integrable_sq_norm hm).2 ?_
  refine ((hF.integrable_norm_pow (by decide : 2 ≠ 0)).integral_prod_left.const_mul
    (∫ y, ‖g y‖ ^ 2 ∂ν)).mono' (hm.norm.pow 2) ?_
  filter_upwards [ae_memLp_fibre hF] with x hx
  rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)]
  exact integral_conj_mul_sq_le hg hx

/-- Products of two complete families are complete; only the second family needs a countable index. -/
theorem complete_prod {ι κ : Type*} [Countable κ]
    (b : ι → α → ℂ) (c : κ → β → ℂ)
    (hb : ∀ i, MemLp (b i) 2 μ) (hc : ∀ j, MemLp (c j) 2 ν)
    (hcomplete_b : ∀ {f : α → ℂ}, MemLp f 2 μ →
      (∀ i, ∫ x, conj (b i x) * f x ∂μ = 0) → f =ᵐ[μ] 0)
    (hcomplete_c : ∀ {g : β → ℂ}, MemLp g 2 ν →
      (∀ j, ∫ y, conj (c j y) * g y ∂ν = 0) → g =ᵐ[ν] 0)
    {F : α × β → ℂ} (hF : MemLp F 2 (μ.prod ν))
    (h : ∀ i j, ∫ u, conj (b i u.1 * c j u.2) * F u ∂μ.prod ν = 0) :
    F =ᵐ[μ.prod ν] 0 := by
  have hcoeff : ∀ j, (fun x => ∫ y, conj (c j y) * F (x, y) ∂ν) =ᵐ[μ] 0 := by
    intro j
    refine hcomplete_b (memLp_integral_conj_mul hF (hc j)) fun i => ?_
    have hi : Integrable (fun u : α × β => conj (b i u.1 * c j u.2) * F u) (μ.prod ν) :=
      ((memLp_prod_mul (hb i) (hc j)).star.integrable_mul hF).congr
        (Filter.Eventually.of_forall fun u => rfl)
    have hz := h i j
    rw [integral_prod _ hi] at hz
    rw [← hz]
    apply integral_congr_ae
    filter_upwards with x
    rw [← integral_const_mul]
    apply integral_congr_ae
    filter_upwards with y
    simp only [map_mul, mul_assoc]
  have hfibres : ∀ᵐ x ∂μ, (fun y => F (x, y)) =ᵐ[ν] 0 := by
    filter_upwards [ae_memLp_fibre hF, ae_all_iff.2 hcoeff] with x hx hz
    exact hcomplete_c hx hz
  have hsq := hF.integrable_norm_pow (by decide : 2 ≠ 0)
  have hzero : ∫ u, ‖F u‖ ^ 2 ∂μ.prod ν = 0 := by
    rw [integral_prod _ hsq]
    apply integral_eq_zero_of_ae
    filter_upwards [hfibres] with x hx
    apply integral_eq_zero_of_ae
    filter_upwards [hx] with y hy
    simp [hy]
  have hz := (integral_eq_zero_iff_of_nonneg (fun u => sq_nonneg ‖F u‖) hsq).1 hzero
  filter_upwards [hz] with u hu
  simpa using hu

end
end Grothe.UpperChaos.ProductComplete
