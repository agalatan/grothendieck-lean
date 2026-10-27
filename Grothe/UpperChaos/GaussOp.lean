import Grothe.UpperChaos.Smoothing

/-!
# Gaussian smoothing operators, generically

For a real-linear `L : (ℂ²) × (ℂ²) → ℂ²` with `L(x, Z)` a standard pair (`MeasurePreserving L (mu2 ⊗ mu2) mu2`),
`gOp L = PXᴴ ∘ (· ∘ L)` is a contraction of `L²(mu2)` with `⟪g, gOp L f⟫ = E[conj g(x) f(L(x, Z))]`
(`inner_gOp`), and on an `L²` function it is `x ↦ E_Z f(L(x, Z))` (`gOp_toLp`). The smoothing of the rounding is
the instance `L = smoothCLM` (`smoothOp_eq_gOp`).

An operator that is diagonal on the Hermite basis, `⟪h_j, A h_k⟫ = δ_{jk} λ_j`, acts by `⟪h_j, A g⟫ = λ_j ⟪h_j, g⟫`
on every `g` (`inner_hvec2_of_diag`).
-/

open MeasureTheory Complex
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

variable (L : (ℂ × ℂ) × (ℂ × ℂ) →L[ℝ] ℂ × ℂ) (hL : MeasurePreserving L (mu2.prod mu2) mu2)

/-- `f ↦ f ∘ L` into `L²(mu2 ⊗ mu2)`. -/
def gPY : Lp ℂ 2 mu2 →ₗᵢ[ℂ] Lp ℂ 2 (mu2.prod mu2) := Lp.compMeasurePreservingₗᵢ ℂ L hL

/-- **The Gaussian smoothing along `L`.** -/
def gOp : Lp ℂ 2 mu2 →L[ℂ] Lp ℂ 2 mu2 :=
  (PXs.toContinuousLinearMap).adjoint ∘L (gPY L hL).toContinuousLinearMap

lemma inner_gOp (g f : Lp ℂ 2 mu2) : ⟪g, gOp L hL f⟫_ℂ = ⟪PXs g, gPY L hL f⟫_ℂ := by
  rw [gOp, ContinuousLinearMap.comp_apply, ContinuousLinearMap.adjoint_inner_right]; rfl

lemma smoothOp_eq_gOp : smoothOp = gOp smoothCLM mp_smooth := rfl

/-- `x ↦ E_Z f(L(x, Z))`. -/
def gFn (f : ℂ × ℂ → ℂ) (x : ℂ × ℂ) : ℂ := ∫ Z, f (L (x, Z)) ∂mu2

/-- **`gOp L` on an `L²` function.** -/
theorem gOp_toLp {f : ℂ × ℂ → ℂ} (hfm : Measurable f) (hfL : MemLp f 2 mu2)
    (hgL : MemLp (gFn L f) 2 mu2) : gOp L hL (hfL.toLp f) = hgL.toLp (gFn L f) := by
  refine ext_inner_left ℂ fun g => ?_
  have hF : Measurable fun v : (ℂ × ℂ) × (ℂ × ℂ) => f (L v) := hfm.comp L.continuous.measurable
  have hG2 : MemLp (fun v : (ℂ × ℂ) × (ℂ × ℂ) => (g : ℂ × ℂ → ℂ) v.1) 2 (mu2.prod mu2) :=
    (Lp.memLp g).comp_measurePreserving mp_fst2
  have hF2 : MemLp (fun v : (ℂ × ℂ) × (ℂ × ℂ) => f (L v)) 2 (mu2.prod mu2) := hfL.comp_measurePreserving hL
  have hint : Integrable (fun v : (ℂ × ℂ) × (ℂ × ℂ) => conj ((g : ℂ × ℂ → ℂ) v.1) * f (L v)) (mu2.prod mu2) := by
    refine (hG2.norm.integrable_mul hF2.norm).mono'
      ((Complex.continuous_conj.comp_aestronglyMeasurable hG2.aestronglyMeasurable).mul
        hF.aestronglyMeasurable) (Filter.Eventually.of_forall fun v => ?_)
    simp only [norm_mul, Complex.norm_conj, Pi.mul_apply, le_refl]
  have h1 : (fun v : (ℂ × ℂ) × (ℂ × ℂ) => ⟪(PXs g : _ → ℂ) v, (gPY L hL (hfL.toLp f) : _ → ℂ) v⟫_ℂ)
      =ᵐ[mu2.prod mu2] fun v => conj ((g : ℂ × ℂ → ℂ) v.1) * f (L v) := by
    filter_upwards [Lp.coeFn_compMeasurePreserving g mp_fst2,
      Lp.coeFn_compMeasurePreserving (hfL.toLp f) hL,
      hL.quasiMeasurePreserving.ae_eq_comp hfL.coeFn_toLp] with v ha hb hc
    change ⟪(Lp.compMeasurePreserving Prod.fst mp_fst2 g : _ → ℂ) v,
      (Lp.compMeasurePreserving _ hL (hfL.toLp f) : _ → ℂ) v⟫_ℂ = _
    rw [ha, hb]
    simp only [Function.comp_apply] at hc ⊢
    rw [hc, RCLike.inner_apply]; ring
  rw [inner_gOp, L2.inner_def, integral_congr_ae h1, integral_prod _ hint, L2.inner_def]
  refine integral_congr_ae ?_
  filter_upwards [hgL.coeFn_toLp] with x hx
  rw [hx, RCLike.inner_apply, gFn, integral_const_mul]; ring

/-- **The smoothing along `L` of an `L²` function is in `L²`** (Jensen). -/
theorem memLp_gFn {f : ℂ × ℂ → ℂ} (hf : Measurable f) (hfL : MemLp f 2 mu2) : MemLp (gFn L f) 2 mu2 := by
  have hm : AEStronglyMeasurable (gFn L f) mu2 :=
    ((hf.comp L.continuous.measurable).stronglyMeasurable.integral_prod_right' (ν := mu2)).aestronglyMeasurable
  rw [memLp_two_iff_integrable_sq_norm hm]
  have hF2 : MemLp (fun v : (ℂ × ℂ) × (ℂ × ℂ) => f (L v)) 2 (mu2.prod mu2) := hfL.comp_measurePreserving hL
  have hsq : Integrable (fun v : (ℂ × ℂ) × (ℂ × ℂ) => ‖f (L v)‖ ^ 2) (mu2.prod mu2) :=
    (memLp_two_iff_integrable_sq_norm hF2.aestronglyMeasurable).1 hF2
  refine hsq.integral_prod_left.mono' (hm.norm.pow 2) ?_
  filter_upwards [hsq.prod_right_ae] with x hx
  rw [Real.norm_of_nonneg (sq_nonneg _)]
  exact sq_norm_integral_le ((hf.comp (L.continuous.measurable.comp (measurable_const.prodMk
    measurable_id))).aestronglyMeasurable) hx

theorem gOp_toLp' {f : ℂ × ℂ → ℂ} (hf : Measurable f) (hfL : MemLp f 2 mu2) :
    gOp L hL (hfL.toLp f) = (memLp_gFn L hL hf hfL).toLp (gFn L f) :=
  gOp_toLp L hL hf hfL (memLp_gFn L hL hf hfL)

/-- **A Hermite-diagonal operator acts coefficientwise.** -/
theorem inner_hvec2_of_diag (A : Lp ℂ 2 mu2 →L[ℂ] Lp ℂ 2 mu2) (lam : Idx2 → ℂ)
    (hA : ∀ j k, ⟪hvec2 j, A (hvec2 k)⟫_ℂ = if j = k then lam j else 0) (j : Idx2) (g : Lp ℂ 2 mu2) :
    ⟪hvec2 j, A g⟫_ℂ = lam j * ⟪hvec2 j, g⟫_ℂ := by
  have hs := hermiteBasis2.hasSum_repr g
  have hA' := (hs.mapL A).mapL (innerSL ℂ (hvec2 j))
  have hc : (fun k => (innerSL ℂ (hvec2 j)) (A (hermiteBasis2.repr g k • hermiteBasis2 k)))
      = fun k => if k = j then lam j * ⟪hvec2 j, g⟫_ℂ else 0 := by
    ext k
    rw [map_smul, innerSL_apply, inner_smul_right, hermiteBasis2_apply, hA,
      HilbertBasis.repr_apply_apply, hermiteBasis2_apply]
    by_cases hk : k = j
    · subst hk; simp; ring
    · simp [hk, Ne.symm hk]
  rw [hc] at hA'
  rw [innerSL_apply] at hA'
  exact hA'.unique (hasSum_ite_eq j _)

end

end Grothe.UpperChaos
