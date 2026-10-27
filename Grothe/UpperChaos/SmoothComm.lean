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
  rw [integral_prod _ hint3]
  have step : ∀ v : (ℂ × ℂ) × (ℂ × ℂ), ∫ W, conj ((g : ℂ × ℂ → ℂ) v.1) * f (L₂ (L₁ v, W)) ∂mu2
      = conj ((g : ℂ × ℂ → ℂ) v.1) * gFn L₂ f (L₁ v) := fun v => by rw [integral_const_mul]; rfl
  simp only [step]
  rw [integral_prod _ hint2, L2.inner_def]
  refine integral_congr_ae ?_
  filter_upwards [hF.coeFn_toLp] with x hx
  rw [hx, RCLike.inner_apply, mul_comm, gFn, ← integral_const_mul]

/-! ### `S` commutes with `T_ρ` -/

lemma mp_fstfst :
    MeasurePreserving (fun v : ((ℂ × ℂ) × (ℂ × ℂ)) × (ℂ × ℂ) => v.1.1) ((mu2.prod mu2).prod mu2) mu2 :=
  mp_fst2.comp (by simpa using (measurePreserving_fst (μ := mu2.prod mu2) (ν := mu2)))

/-- Integrals over the triple product through `pA`/`pB` are integrals against the joint law. -/
lemma integral_triple_map (P : ((ℂ × ℂ) × (ℂ × ℂ)) × (ℂ × ℂ) →L[ℝ] (ℂ × ℂ) × (ℂ × ℂ))
    (hP1 : ∀ v, (P v).1 = v.1.1) (g : Lp ℂ 2 mu2) {f : ℂ × ℂ → ℂ} (hf : Measurable f) :
    ∫ v, conj ((g : ℂ × ℂ → ℂ) v.1.1) * f (P v).2 ∂((mu2.prod mu2).prod mu2) =
      ∫ w, conj ((g : ℂ × ℂ → ℂ) w.1) * f w.2 ∂(((mu2.prod mu2).prod mu2).map P) := by
  have hfst : MeasurePreserving Prod.fst (((mu2.prod mu2).prod mu2).map P) mu2 := by
    refine ⟨measurable_fst, ?_⟩
    rw [Measure.map_map measurable_fst P.continuous.measurable]
    have : (Prod.fst ∘ P) = fun v : ((ℂ × ℂ) × (ℂ × ℂ)) × (ℂ × ℂ) => v.1.1 := funext hP1
    rw [this]; exact mp_fstfst.map_eq
  have hG : AEStronglyMeasurable (fun w : (ℂ × ℂ) × (ℂ × ℂ) => conj ((g : ℂ × ℂ → ℂ) w.1) * f w.2)
      (((mu2.prod mu2).prod mu2).map P) :=
    (Complex.continuous_conj.comp_aestronglyMeasurable
      ((Lp.aestronglyMeasurable g).comp_measurePreserving hfst)).mul (hf.comp measurable_snd).aestronglyMeasurable
  rw [integral_map P.continuous.measurable.aemeasurable hG]
  simp only [hP1]

/-- **The smoothing commutes with the Ornstein–Uhlenbeck smoothing.** -/
theorem smoothOp_ouOp_comm {ρ : ℝ} (hρ : |ρ| ≤ 1) {f : ℂ × ℂ → ℂ} (hf : Measurable f) (hfL : MemLp f 2 mu2) :
    smoothOp (ouOp hρ (hfL.toLp f)) = ouOp hρ (smoothOp (hfL.toLp f)) := by
  have hTf := memLp_gFn (ouCLM ρ) (mp_ou hρ) hf hfL
  have hSf := memLp_gFn smoothCLM mp_smooth hf hfL
  rw [ouOp, gOp_toLp' (ouCLM ρ) (mp_ou hρ) hf hfL, smoothOp_eq_gOp,
    gOp_toLp' smoothCLM mp_smooth (measurable_gFn _ hf) hTf,
    gOp_toLp' smoothCLM mp_smooth hf hfL, gOp_toLp' (ouCLM ρ) (mp_ou hρ) (measurable_gFn _ hf) hSf]
  refine ext_inner_left ℂ fun g => ?_
  rw [inner_gFn_gFn smoothCLM (ouCLM ρ) mp_smooth (mp_ou hρ) hf hfL g,
    inner_gFn_gFn (ouCLM ρ) smoothCLM (mp_ou hρ) mp_smooth hf hfL g]
  have eA := integral_triple_map (pA ρ) (fun _ => rfl) g hf
  have eB := integral_triple_map (pB ρ) (fun _ => rfl) g hf
  rw [law_comm hρ, ← eB] at eA
  exact eA

/-! ### `S` preserves the total degree -/

lemma measurable_hfun2 (i : Idx2) : Measurable (hfun2 i) := by
  unfold hfun2 H2
  exact (continuous_const.mul (((continuous_ev _).comp continuous_fst).mul
    ((continuous_ev _).comp continuous_snd))).measurable

/-- `T_ρ h_i = ρ^{|i|} h_i`. -/
lemma ouOp_hvec2 {ρ : ℝ} (hρ : |ρ| ≤ 1) (i : Idx2) : ouOp hρ (hvec2 i) = ((ρ : ℂ) ^ tdeg i) • hvec2 i := by
  refine eq_of_inner_hvec2 fun k => ?_
  rw [inner_ouOp, inner_smul_right, inner_hvec2]
  split_ifs with h
  · subst h; ring
  · simp

/-- The expansion `⟪h_j, A g⟫ = Σ_k ⟪h_k, g⟫ ⟪h_j, A h_k⟫`. -/
lemma hasSum_inner_op (A : Lp ℂ 2 mu2 →L[ℂ] Lp ℂ 2 mu2) (j : Idx2) (g : Lp ℂ 2 mu2) :
    HasSum (fun k => ⟪hvec2 k, g⟫_ℂ * ⟪hvec2 j, A (hvec2 k)⟫_ℂ) ⟪hvec2 j, A g⟫_ℂ := by
  have h := ((hermiteBasis2.hasSum_repr g).mapL A).mapL (innerSL ℂ (hvec2 j))
  simpa only [map_smul, innerSL_apply_apply, inner_smul_right, hermiteBasis2_apply,
    HilbertBasis.repr_apply_apply, smul_eq_mul] using h

/-- **`S` has no matrix elements between different total degrees.** -/
theorem inner_smoothOp_hvec2_eq_zero {i j : Idx2} (h : tdeg i ≠ tdeg j) :
    ⟪hvec2 j, smoothOp (hvec2 i)⟫_ℂ = 0 := by
  have hρ : |(1 / 2 : ℝ)| ≤ 1 := by norm_num [abs_of_pos]
  have hc := congrArg (fun F => ⟪hvec2 j, F⟫_ℂ)
    (smoothOp_ouOp_comm hρ (measurable_hfun2 i) (memLp_hfun2 i))
  change ⟪hvec2 j, smoothOp (ouOp hρ (hvec2 i))⟫_ℂ = ⟪hvec2 j, ouOp hρ (smoothOp (hvec2 i))⟫_ℂ at hc
  rw [ouOp_hvec2, map_smul, inner_smul_right, inner_ouOp] at hc
  have hne : ((1 / 2 : ℝ) : ℂ) ^ tdeg i ≠ ((1 / 2 : ℝ) : ℂ) ^ tdeg j := by
    intro he
    apply h
    have he' : (1 / 2 : ℝ) ^ tdeg i = (1 / 2 : ℝ) ^ tdeg j := by exact_mod_cast he
    exact pow_right_injective₀ (by norm_num) (by norm_num) he'
  have : (((1 / 2 : ℝ) : ℂ) ^ tdeg i - ((1 / 2 : ℝ) : ℂ) ^ tdeg j) * ⟪hvec2 j, smoothOp (hvec2 i)⟫_ℂ = 0 := by
    linear_combination hc
  rcases mul_eq_zero.1 this with h0 | h0
  · exact absurd (sub_eq_zero.1 h0) hne
  · exact h0

/-- **`S` commutes with every projection onto a set of total degrees.** -/
theorem projOn_smoothOp_comm (B : Set Idx2) [DecidablePred (· ∈ B)]
    (hB : ∀ i j, tdeg i = tdeg j → (i ∈ B ↔ j ∈ B)) (f : Lp ℂ 2 mu2) :
    projOn B (smoothOp f) = smoothOp (projOn B f) := by
  refine eq_of_inner_hvec2 fun j => ?_
  rw [inner_projOn]
  have hP := hasSum_inner_op smoothOp j (projOn B f)
  have hf := hasSum_inner_op smoothOp j f
  have hterm : ∀ k, ⟪hvec2 k, projOn B f⟫_ℂ * ⟪hvec2 j, smoothOp (hvec2 k)⟫_ℂ
      = if j ∈ B then ⟪hvec2 k, f⟫_ℂ * ⟪hvec2 j, smoothOp (hvec2 k)⟫_ℂ else 0 := by
    intro k
    rw [inner_projOn]
    by_cases hk : tdeg k = tdeg j
    · have := hB k j hk
      by_cases hj : j ∈ B
      · simp [hj, this.2 hj]
      · have hk' : k ∉ B := fun h => hj (this.1 h)
        simp [hj, hk']
    · simp [inner_smoothOp_hvec2_eq_zero hk]
  simp only [hterm] at hP
  split_ifs with hj
  · simp only [hj, ite_true] at hP
    exact hf.unique hP
  · simp only [hj, ite_false] at hP
    exact (hasSum_zero.unique hP)

lemma tdeg_eq_bideg (i : Idx2) : tdeg i = (bideg i).1 + (bideg i).2 := by
  simp [tdeg, bideg]; ring

/-- **Band projections commute with the smoothing.** -/
theorem bandProj_smoothOp_comm (b : GrotheKernel.ComparisonBand) (f : Lp ℂ 2 mu2) :
    bandProj b (smoothOp f) = smoothOp (bandProj b f) := by
  refine projOn_smoothOp_comm _ (fun i j hij => ?_) f
  simp only [bandModes, Set.mem_ofPred_eq, GrotheKernel.ComparisonBand.contains]
  rw [tdeg_eq_bideg, tdeg_eq_bideg] at hij
  rw [hij]

/-- **`‖P_I S g‖ ≤ ‖P_I g‖`.** -/
theorem norm_bandProj_smoothOp_le (b : GrotheKernel.ComparisonBand) (f : Lp ℂ 2 mu2) :
    ‖bandProj b (smoothOp f)‖ ≤ ‖bandProj b f‖ := by
  rw [bandProj_smoothOp_comm]; exact norm_smoothOp_le _

end

end Grothe.UpperChaos
