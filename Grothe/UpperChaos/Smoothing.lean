import Grothe.UpperChaos.HardyRealLaw

/-!
# The smoothing of the rounding as an operator on `L²(mu2)`

The rounding of the certificate is `G_T(x) = E_Z T(Mx + NZ)` (`GT`, `smoothArg`). Since `M² + N² = I`, the map
`(x, Z) ↦ Mx + NZ` carries two independent standard pairs to a standard pair (`mp_smooth`). The smoothing

    S = PXᴴ ∘ PS,   PX f = f(x),   PS f = f(Mx + NZ)      (isometries into `L²(mu2 ⊗ mu2)`)

is therefore a contraction of `L²(mu2)` (`norm_smoothOp_le`) with `⟪g, S f⟫ = E[conj g(x) f(Mx + NZ)]`
(`inner_smoothOp`), and `S T = G_T` (`smoothOp_toLp`).
-/

open MeasureTheory ProbabilityTheory Complex Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- `(x, Z) ↦ Mx + NZ` as a real-linear map. -/
def smoothCLM : (ℂ × ℂ) × (ℂ × ℂ) →L[ℝ] ℂ × ℂ :=
  LinearMap.toContinuousLinearMap
    { toFun := fun v => smoothArg v.1 v.2
      map_add' := fun u v => by
        simp only [smoothArg, Prod.fst_add, Prod.snd_add, Prod.mk_add_mk]
        ext <;> simp <;> ring
      map_smul' := fun r v => by
        simp only [smoothArg, Prod.smul_fst, Prod.smul_snd, Prod.smul_mk, RingHom.id_apply]
        ext <;> simp <;> ring }

lemma smoothCLM_apply (v : (ℂ × ℂ) × (ℂ × ℂ)) : smoothCLM v = smoothArg v.1 v.2 := rfl

open HardyReal in
/-- **`Mx + NZ` is a standard pair** (`M² + N² = I`). -/
theorem map_smooth : (mu2.prod mu2).map smoothCLM = mu2 := by
  apply Measure.ext_of_charFunDual
  ext L
  rw [charFunDual_map, charFunDual_mu2prod, charFunDual_mu2]
  congr 1
  -- `L` on `ℂ × ℂ` through its two coordinate functionals
  set ℓ₁ := L.comp (.inl ℝ ℂ ℂ) with hℓ₁
  set ℓ₂ := L.comp (.inr ℝ ℂ ℂ) with hℓ₂
  have hL : ∀ z : ℂ × ℂ, L z = ℓ₁ z.1 + ℓ₂ z.2 := by
    intro z
    have : z = (z.1, 0) + (0, z.2) := by ext <;> simp
    conv_lhs => rw [this]
    rw [map_add]; rfl
  simp only [Q, ContinuousLinearMap.comp_apply, ContinuousLinearMap.inl_apply,
    ContinuousLinearMap.inr_apply, smoothCLM_apply, smoothArg]
  simp only [hL]
  simp only [Prod.fst_zero, Prod.snd_zero, mul_one, mul_zero, add_zero, zero_add, dual_ofReal_mul,
    dual_ofReal]
  rw [div_left_inj' (show (4 : ℂ) ≠ 0 by norm_num), neg_inj, Complex.ofReal_inj]
  linear_combination (ℓ₁ 1 ^ 2 + ℓ₁ I ^ 2) * mn_00 + 2 * (ℓ₁ 1 * ℓ₂ 1 + ℓ₁ I * ℓ₂ I) * mn_01
    + (ℓ₂ 1 ^ 2 + ℓ₂ I ^ 2) * mn_11

lemma mp_smooth : MeasurePreserving (fun v : (ℂ × ℂ) × (ℂ × ℂ) => smoothArg v.1 v.2) (mu2.prod mu2) mu2 :=
  ⟨smoothCLM.continuous.measurable, map_smooth⟩

lemma mp_fst2 : MeasurePreserving (Prod.fst : (ℂ × ℂ) × (ℂ × ℂ) → ℂ × ℂ) (mu2.prod mu2) mu2 := by
  refine ⟨measurable_fst, ?_⟩
  rw [Measure.map_fst_prod, measure_univ, one_smul]

/-- `f ↦ f(x)` into `L²(mu2 ⊗ mu2)`. -/
def PXs : Lp ℂ 2 mu2 →ₗᵢ[ℂ] Lp ℂ 2 (mu2.prod mu2) := Lp.compMeasurePreservingₗᵢ ℂ Prod.fst mp_fst2

/-- `f ↦ f(Mx + NZ)` into `L²(mu2 ⊗ mu2)`. -/
def PS : Lp ℂ 2 mu2 →ₗᵢ[ℂ] Lp ℂ 2 (mu2.prod mu2) :=
  Lp.compMeasurePreservingₗᵢ ℂ (fun v : (ℂ × ℂ) × (ℂ × ℂ) => smoothArg v.1 v.2) mp_smooth

/-- **The smoothing operator** `S = PXᴴ ∘ PS`. -/
def smoothOp : Lp ℂ 2 mu2 →L[ℂ] Lp ℂ 2 mu2 :=
  (PXs.toContinuousLinearMap).adjoint ∘L PS.toContinuousLinearMap

lemma inner_smoothOp (g f : Lp ℂ 2 mu2) : ⟪g, smoothOp f⟫_ℂ = ⟪PXs g, PS f⟫_ℂ := by
  rw [smoothOp, ContinuousLinearMap.comp_apply, ContinuousLinearMap.adjoint_inner_right]; rfl

/-- **`S` is a contraction.** -/
lemma norm_smoothOp_le (f : Lp ℂ 2 mu2) : ‖smoothOp f‖ ≤ ‖f‖ := by
  have h1 : ‖(PXs.toContinuousLinearMap).adjoint‖ ≤ 1 := by
    rw [ContinuousLinearMap.adjoint.norm_map]; exact PXs.norm_toContinuousLinearMap_le
  calc ‖smoothOp f‖ ≤ ‖(PXs.toContinuousLinearMap).adjoint‖ * ‖PS f‖ :=
        (PXs.toContinuousLinearMap).adjoint.le_opNorm _
    _ ≤ 1 * ‖f‖ := by rw [PS.norm_map]; exact mul_le_mul_of_nonneg_right h1 (norm_nonneg _)
    _ = ‖f‖ := one_mul _

/-- **`S` on a bounded function is its smoothing** `x ↦ E_Z f(Mx + NZ)`. -/
theorem smoothOp_toLp {f : ℂ × ℂ → ℂ} (hfm : Measurable f) {C : ℝ} (hfb : ∀ u, ‖f u‖ ≤ C)
    (hfL : MemLp f 2 mu2) (hgL : MemLp (fun x => ∫ Z, f (smoothArg x Z) ∂mu2) 2 mu2) :
    smoothOp (hfL.toLp f) = hgL.toLp (fun x => ∫ Z, f (smoothArg x Z) ∂mu2) := by
  refine ext_inner_left ℂ fun g => ?_
  have hF : Measurable fun v : (ℂ × ℂ) × (ℂ × ℂ) => f (smoothArg v.1 v.2) := hfm.comp mp_smooth.measurable
  have hgi : Integrable (g : ℂ × ℂ → ℂ) mu2 := (Lp.memLp g).integrable one_le_two
  have hgf : Integrable (fun v : (ℂ × ℂ) × (ℂ × ℂ) => (g : ℂ × ℂ → ℂ) v.1) (mu2.prod mu2) :=
    (mp_fst2.integrable_comp hgi.aestronglyMeasurable).2 hgi
  have hint : Integrable (fun v : (ℂ × ℂ) × (ℂ × ℂ) => conj ((g : ℂ × ℂ → ℂ) v.1) * f (smoothArg v.1 v.2))
      (mu2.prod mu2) := by
    refine (hgf.norm.mul_const C).mono'
      ((Complex.continuous_conj.comp_aestronglyMeasurable hgf.aestronglyMeasurable).mul
        hF.aestronglyMeasurable) (Filter.Eventually.of_forall fun v => ?_)
    rw [norm_mul, Complex.norm_conj]
    exact mul_le_mul_of_nonneg_left (hfb _) (norm_nonneg _)
  have h1 : (fun v : (ℂ × ℂ) × (ℂ × ℂ) => ⟪(PXs g : _ → ℂ) v, (PS (hfL.toLp f) : _ → ℂ) v⟫_ℂ)
      =ᵐ[mu2.prod mu2] fun v => conj ((g : ℂ × ℂ → ℂ) v.1) * f (smoothArg v.1 v.2) := by
    filter_upwards [Lp.coeFn_compMeasurePreserving g mp_fst2,
      Lp.coeFn_compMeasurePreserving (hfL.toLp f) mp_smooth,
      mp_smooth.quasiMeasurePreserving.ae_eq_comp hfL.coeFn_toLp] with v ha hb hc
    change ⟪(Lp.compMeasurePreserving Prod.fst mp_fst2 g : _ → ℂ) v,
      (Lp.compMeasurePreserving _ mp_smooth (hfL.toLp f) : _ → ℂ) v⟫_ℂ = _
    rw [ha, hb]
    simp only [Function.comp_apply] at hc ⊢
    rw [hc, RCLike.inner_apply]; ring
  rw [inner_smoothOp, L2.inner_def, integral_congr_ae h1, integral_prod _ hint, L2.inner_def]
  refine integral_congr_ae ?_
  filter_upwards [hgL.coeFn_toLp] with x hx
  rw [hx, RCLike.inner_apply, integral_const_mul]; ring

end

end Grothe.UpperChaos
