import Grothe.UpperChaos.GaussOp
import Grothe.UpperChaos.HardyRealGauss

/-!
# The Ornstein–Uhlenbeck smoothing `T_ρ`

For real `|ρ| ≤ 1` and `σ = √(1 − ρ²)`, `T_ρ f(x) = E_W f(ρx + σW)` is the Gaussian smoothing along
`(x, W) ↦ ρx + σW` (`ouOp`). It is the diagonal Mehler operator with equal real correlations, so it is diagonal on the
Hermite basis with eigenvalue `ρ^{|i|}`, `|i|` the total degree (`inner_hvec2_ouOp`, `inner_ouOp`).
-/

open MeasureTheory Complex HardyReal
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- The total degree of a Hermite mode. -/
def tdeg (i : Idx2) : ℕ := i.1.1 + i.1.2 + i.2.1 + i.2.2

/-- `(x, W) ↦ ρx + σW` as a real-linear map. -/
def ouCLM (ρ : ℝ) : (ℂ × ℂ) × (ℂ × ℂ) →L[ℝ] ℂ × ℂ :=
  LinearMap.toContinuousLinearMap
    { toFun := fun v => Yof ρ ρ (shuffle v)
      map_add' := fun u v => by
        simp only [Yof, mY, shuffle, Prod.fst_add, Prod.snd_add]
        ext <;> simp <;> ring
      map_smul' := fun r v => by
        simp only [Yof, mY, shuffle, Prod.smul_fst, Prod.smul_snd, RingHom.id_apply]
        ext <;> simp <;> ring }

lemma ouCLM_apply (ρ : ℝ) (v : (ℂ × ℂ) × (ℂ × ℂ)) : ouCLM ρ v = Yof ρ ρ (shuffle v) := rfl

variable {ρ : ℝ} (hρ : |ρ| ≤ 1)
include hρ

lemma norm_ofReal_le : ‖(ρ : ℂ)‖ ≤ 1 := by rwa [Complex.norm_real, Real.norm_eq_abs]

lemma mp_shuffle2 : MeasurePreserving (shuffle : (ℂ × ℂ) × (ℂ × ℂ) → _) (mu2.prod mu2) mu4 :=
  measurePreserving_shuffle_prod gaussC

/-- `ρx + σW` is standard. -/
lemma mp_ou : MeasurePreserving (ouCLM ρ) (mu2.prod mu2) mu2 :=
  (mp_Y (norm_ofReal_le hρ) (norm_ofReal_le hρ)).comp (mp_shuffle2 hρ)

/-- **The Ornstein–Uhlenbeck smoothing.** -/
def ouOp : Lp ℂ 2 mu2 →L[ℂ] Lp ℂ 2 mu2 := gOp (ouCLM ρ) (mp_ou hρ)

lemma lam_real (i : Idx2) : lam (ρ : ℂ) (ρ : ℂ) i = (ρ : ℂ) ^ tdeg i := by
  simp only [lam, Complex.conj_ofReal, tdeg]; ring

/-- **`T_ρ` is diagonal on the Hermite basis**, with eigenvalue `ρ^{|i|}`. -/
theorem inner_hvec2_ouOp (j k : Idx2) :
    ⟪hvec2 j, ouOp hρ (hvec2 k)⟫_ℂ = if j = k then (ρ : ℂ) ^ tdeg j else 0 := by
  have h₁ := norm_ofReal_le hρ
  rw [← lam_real hρ, ← Bm_hvec2 h₁ h₁ j k, Bm_eq_integral, ouOp, inner_gOp, L2.inner_def]
  have hj := Lp.aestronglyMeasurable (hvec2 j)
  have hk := Lp.aestronglyMeasurable (hvec2 k)
  -- the integrand on `mu2 ⊗ mu2`, and the Mehler integrand on `mu4` after the shuffle
  have h1 : (fun v : (ℂ × ℂ) × (ℂ × ℂ) =>
        ⟪(PXs (hvec2 j) : _ → ℂ) v, (gPY (ouCLM ρ) (mp_ou hρ) (hvec2 k) : _ → ℂ) v⟫_ℂ)
      =ᵐ[mu2.prod mu2] fun v => conj ((hvec2 j : ℂ × ℂ → ℂ) (Xof (shuffle v))) *
        (hvec2 k : ℂ × ℂ → ℂ) (Yof ρ ρ (shuffle v)) := by
    filter_upwards [Lp.coeFn_compMeasurePreserving (hvec2 j) mp_fst2,
      Lp.coeFn_compMeasurePreserving (hvec2 k) (mp_ou hρ)] with v ha hb
    change ⟪(Lp.compMeasurePreserving Prod.fst mp_fst2 (hvec2 j) : _ → ℂ) v,
      (Lp.compMeasurePreserving _ (mp_ou hρ) (hvec2 k) : _ → ℂ) v⟫_ℂ = _
    rw [ha, hb, RCLike.inner_apply]
    simp only [Function.comp_apply, ouCLM_apply, Xof, shuffle]
    ring
  rw [integral_congr_ae h1]
  have hG : AEStronglyMeasurable (fun ω => conj ((hvec2 j : ℂ × ℂ → ℂ) (Xof ω)) *
      (hvec2 k : ℂ × ℂ → ℂ) (Yof ρ ρ ω)) (Measure.map shuffle (mu2.prod mu2)) := by
    rw [(mp_shuffle2 hρ).map_eq]
    exact (Complex.continuous_conj.comp_aestronglyMeasurable (hj.comp_measurePreserving mp_X)).mul
      (hk.comp_measurePreserving (mp_Y h₁ h₁))
  rw [← integral_map (mp_shuffle2 hρ).measurable.aemeasurable hG, (mp_shuffle2 hρ).map_eq]

/-- **`T_ρ` acts coefficientwise**: `⟪h_j, T_ρ g⟫ = ρ^{|j|} ⟪h_j, g⟫`. -/
theorem inner_ouOp (j : Idx2) (g : Lp ℂ 2 mu2) :
    ⟪hvec2 j, ouOp hρ g⟫_ℂ = (ρ : ℂ) ^ tdeg j * ⟪hvec2 j, g⟫_ℂ :=
  inner_hvec2_of_diag (ouOp hρ) (fun j => (ρ : ℂ) ^ tdeg j) (inner_hvec2_ouOp hρ) j g

end

end Grothe.UpperChaos
