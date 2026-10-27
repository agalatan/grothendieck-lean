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
  simp only [Prod.fst_zero, Prod.snd_zero, mul_one, mul_zero, add_zero, zero_add, map_zero, dual_ofReal_mul,
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

end

end Grothe.UpperChaos
