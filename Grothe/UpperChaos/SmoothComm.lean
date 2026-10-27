import Grothe.UpperChaos.OUOp
import Grothe.UpperChaos.BandProj

/-!
# The smoothing of the rounding preserves the total degree

On the triple product `((x, Z), W)`, the pairs `(x, ρ(Mx + NZ) + σW)` and `(x, M(ρx + σW) + NZ)` have the same
Gaussian law (`law_comm`): both have covariance `[[I, ρM], [ρM, I]]`, since `M² + N² = I` and `ρ² + σ² = 1`.
Hence the smoothing `S` commutes with the Ornstein–Uhlenbeck smoothing `T_ρ` (`smoothOp_ouOp_comm`). As `T_ρ` has
eigenvalue `ρ^{|i|}` on the Hermite mode `i`, `S` has no matrix elements between different total degrees
(`inner_smoothOp_hvec2_eq_zero`), so it commutes with every projection onto a set of total degrees
(`projOn_smoothOp_comm`). In particular `‖P_I S g‖ = ‖S P_I g‖ ≤ ‖P_I g‖`.
-/

open MeasureTheory ProbabilityTheory Complex
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

open HardyReal

noncomputable section

/-- `((x, Z), W) ↦ (x, ρ(Mx + NZ) + σW)`. -/
def pA (ρ : ℝ) : ((ℂ × ℂ) × (ℂ × ℂ)) × (ℂ × ℂ) →L[ℝ] (ℂ × ℂ) × (ℂ × ℂ) :=
  (ContinuousLinearMap.fst ℝ (ℂ × ℂ) (ℂ × ℂ) ∘L ContinuousLinearMap.fst ℝ _ (ℂ × ℂ)).prod
    (ouCLM ρ ∘L ((smoothCLM ∘L ContinuousLinearMap.fst ℝ _ (ℂ × ℂ)).prod (ContinuousLinearMap.snd ℝ _ (ℂ × ℂ))))

/-- `((x, W), Z) ↦ (x, M(ρx + σW) + NZ)`. -/
def pB (ρ : ℝ) : ((ℂ × ℂ) × (ℂ × ℂ)) × (ℂ × ℂ) →L[ℝ] (ℂ × ℂ) × (ℂ × ℂ) :=
  (ContinuousLinearMap.fst ℝ (ℂ × ℂ) (ℂ × ℂ) ∘L ContinuousLinearMap.fst ℝ _ (ℂ × ℂ)).prod
    (smoothCLM ∘L ((ouCLM ρ ∘L ContinuousLinearMap.fst ℝ _ (ℂ × ℂ)).prod (ContinuousLinearMap.snd ℝ _ (ℂ × ℂ))))

/-- The covariance identity behind `law_comm`. -/
lemma cov_comm {ρ σ : ℝ} (hσ : σ ^ 2 = 1 - ρ ^ 2) (α : Fin 4 → ℝ) :
    (α 0 + ρ * (m00 * α 2 + m01 * α 3)) ^ 2 + (α 1 + ρ * (m01 * α 2 + m11 * α 3)) ^ 2
      + (ρ * (n00 * α 2 + n01 * α 3)) ^ 2 + (ρ * (n01 * α 2 + n11 * α 3)) ^ 2
      + (σ * α 2) ^ 2 + (σ * α 3) ^ 2 =
    (α 0 + ρ * (m00 * α 2 + m01 * α 3)) ^ 2 + (α 1 + ρ * (m01 * α 2 + m11 * α 3)) ^ 2
      + (σ * (m00 * α 2 + m01 * α 3)) ^ 2 + (σ * (m01 * α 2 + m11 * α 3)) ^ 2
      + (n00 * α 2 + n01 * α 3) ^ 2 + (n01 * α 2 + n11 * α 3) ^ 2 := by
  have e : (m00 * α 2 + m01 * α 3) ^ 2 + (m01 * α 2 + m11 * α 3) ^ 2 + (n00 * α 2 + n01 * α 3) ^ 2
      + (n01 * α 2 + n11 * α 3) ^ 2 = α 2 ^ 2 + α 3 ^ 2 := by
    linear_combination α 2 ^ 2 * mn_00 + 2 * α 2 * α 3 * mn_01 + α 3 ^ 2 * mn_11
  linear_combination (α 2 ^ 2 + α 3 ^ 2 - (m00 * α 2 + m01 * α 3) ^ 2 - (m01 * α 2 + m11 * α 3) ^ 2) * hσ
    - (1 - ρ ^ 2) * e

/-- **`(x, ρ(Mx + NZ) + σW)` and `(x, M(ρx + σW) + NZ)` have the same law.** -/
theorem law_comm {ρ : ℝ} (hρ : |ρ| ≤ 1) :
    ((mu2.prod mu2).prod mu2).map (pA ρ) = ((mu2.prod mu2).prod mu2).map (pB ρ) := by
  have hσ : √(1 - ρ ^ 2) ^ 2 = 1 - ρ ^ 2 := Real.sq_sqrt (by nlinarith [abs_le.1 hρ, sq_abs ρ])
  have hs : sig (ρ : ℂ) = ((√(1 - ρ ^ 2) : ℝ) : ℂ) := by simp [sig, Complex.norm_real, sq_abs]
  apply Measure.ext_of_charFunDual
  ext L
  rw [charFunDual_map, charFunDual_map, charFunDual_prod (μ := mu2.prod mu2) (ν := mu2),
    charFunDual_prod (μ := mu2.prod mu2) (ν := mu2), charFunDual_mu2prod, charFunDual_mu2prod,
    charFunDual_mu2, charFunDual_mu2, ← Complex.exp_add, ← Complex.exp_add]
  have e1 := cov_comm hσ ![Lc L 0 1, Lc L 1 1, Lc L 2 1, Lc L 3 1]
  have e2 := cov_comm hσ ![Lc L 0 I, Lc L 1 I, Lc L 2 I, Lc L 3 I]
  simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two, Matrix.cons_val_three,
    Matrix.head_cons, Matrix.tail_cons] at e1 e2
  congr 1
  simp only [Q, ContinuousLinearMap.comp_apply, ContinuousLinearMap.inl_apply, ContinuousLinearMap.inr_apply,
    pA, pB, ContinuousLinearMap.prod_apply, ContinuousLinearMap.coe_fst', ContinuousLinearMap.coe_snd',
    ouCLM_apply, smoothCLM_apply, smoothArg, Yof, mY, shuffle, hs]
  simp only [L_apply]
  simp only [Prod.fst_zero, Prod.snd_zero, mul_one, mul_zero, add_zero, zero_add, map_zero,
    dual_ofReal_mul, dual_ofReal]
  rw [← add_div, ← add_div, ← neg_add, ← neg_add, ← Complex.ofReal_add, ← Complex.ofReal_add,
    div_left_inj' (show (4 : ℂ) ≠ 0 by norm_num), neg_inj, Complex.ofReal_inj]
  linear_combination e1 + e2

/-! ### Iterated smoothing as one integral -/

lemma measurable_gFn (L : (ℂ × ℂ) × (ℂ × ℂ) →L[ℝ] ℂ × ℂ) {f : ℂ × ℂ → ℂ} (hf : Measurable f) :
    Measurable (gFn L f) :=
  ((hf.comp L.continuous.measurable).stronglyMeasurable.integral_prod_right' (ν := mu2)).measurable

/-- `⟪g, S₁ S₂ f⟫` as one integral over the triple product. -/
theorem inner_gFn_gFn (L₁ L₂ : (ℂ × ℂ) × (ℂ × ℂ) →L[ℝ] ℂ × ℂ)
    (h₁ : MeasurePreserving L₁ (mu2.prod mu2) mu2) (h₂ : MeasurePreserving L₂ (mu2.prod mu2) mu2)
    {f : ℂ × ℂ → ℂ} (hf : Measurable f) (hfL : MemLp f 2 mu2) (g : Lp ℂ 2 mu2)
    (hF : MemLp (gFn L₁ (gFn L₂ f)) 2 mu2) :
    ⟪g, hF.toLp (gFn L₁ (gFn L₂ f))⟫_ℂ =
      ∫ v, conj ((g : ℂ × ℂ → ℂ) v.1.1) * f (L₂ (L₁ v.1, v.2)) ∂((mu2.prod mu2).prod mu2) := by
  have hT : MemLp (gFn L₂ f) 2 mu2 := memLp_gFn L₂ h₂ hf hfL
  have hTm : Measurable (gFn L₂ f) := measurable_gFn L₂ hf
  -- the maps into the triple product
  have hm3 : MeasurePreserving (fun v : ((ℂ × ℂ) × (ℂ × ℂ)) × (ℂ × ℂ) => L₂ (L₁ v.1, v.2))
      ((mu2.prod mu2).prod mu2) mu2 :=
    h₂.comp ((h₁.prod (MeasurePreserving.id mu2)))
  have hf3 : MemLp (fun v : ((ℂ × ℂ) × (ℂ × ℂ)) × (ℂ × ℂ) => f (L₂ (L₁ v.1, v.2))) 2 ((mu2.prod mu2).prod mu2) :=
    hfL.comp_measurePreserving hm3
  have hg3 : MemLp (fun v : ((ℂ × ℂ) × (ℂ × ℂ)) × (ℂ × ℂ) => (g : ℂ × ℂ → ℂ) v.1.1) 2 ((mu2.prod mu2).prod mu2) :=
    ((Lp.memLp g).comp_measurePreserving mp_fst2).comp_measurePreserving
      (by simpa using (measurePreserving_fst (μ := mu2.prod mu2) (ν := mu2)))
  have hint3 : Integrable (fun v : ((ℂ × ℂ) × (ℂ × ℂ)) × (ℂ × ℂ) =>
      conj ((g : ℂ × ℂ → ℂ) v.1.1) * f (L₂ (L₁ v.1, v.2))) ((mu2.prod mu2).prod mu2) := by
    refine (hg3.norm.integrable_mul hf3.norm).mono'
      ((Complex.continuous_conj.comp_aestronglyMeasurable hg3.aestronglyMeasurable).mul
        hf3.aestronglyMeasurable) (Filter.Eventually.of_forall fun v => ?_)
    simp only [norm_mul, Complex.norm_conj, Pi.mul_apply, le_refl]
  have hg2 : MemLp (fun v : (ℂ × ℂ) × (ℂ × ℂ) => (g : ℂ × ℂ → ℂ) v.1) 2 (mu2.prod mu2) :=
    (Lp.memLp g).comp_measurePreserving mp_fst2
  have hT2 : MemLp (fun v : (ℂ × ℂ) × (ℂ × ℂ) => gFn L₂ f (L₁ v)) 2 (mu2.prod mu2) := hT.comp_measurePreserving h₁
  have hint2 : Integrable (fun v : (ℂ × ℂ) × (ℂ × ℂ) => conj ((g : ℂ × ℂ → ℂ) v.1) * gFn L₂ f (L₁ v))
      (mu2.prod mu2) := by
    refine (hg2.norm.integrable_mul hT2.norm).mono'
      ((Complex.continuous_conj.comp_aestronglyMeasurable hg2.aestronglyMeasurable).mul
        hT2.aestronglyMeasurable) (Filter.Eventually.of_forall fun v => ?_)
    simp only [norm_mul, Complex.norm_conj, Pi.mul_apply, le_refl]
  rw [integral_prod _ hint3, ← integral_prod _ hint2, integral_prod _ hint2, L2.inner_def]
  refine integral_congr_ae ?_
  filter_upwards [hF.coeFn_toLp] with x hx
  rw [hx, RCLike.inner_apply, gFn, ← integral_const_mul]
  refine integral_congr_ae (Filter.Eventually.of_forall fun Z => ?_)
  simp only [gFn]
  rw [← integral_const_mul]; ring_nf

end

end Grothe.UpperChaos
