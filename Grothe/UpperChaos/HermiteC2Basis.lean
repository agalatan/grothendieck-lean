import Grothe.UpperChaos.HermiteC2

/-!
# Completeness of the tensor Hermite functions on `ℂ²`, Hilbert basis and Parseval

`hermite2_complete`: `F ∈ L²(gaussC ⊗ gaussC)` orthogonal to every `H2 i` vanishes a.e.
`hermiteBasis2 : HilbertBasis Idx2 ℂ (Lp ℂ 2 mu2)` and `hasSum_energy2`.
-/

open MeasureTheory ProbabilityTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

variable {F : ℂ × ℂ → ℂ}

/-- Orthogonality to the `H2 i` extends to the whole span (and the span lies in `L²`). -/
lemma V2_orth (hF : MemLp F 2 mu2) (h : ∀ i, ∫ u, conj (H2 i u) * F u ∂mu2 = 0)
    {v : ℂ × ℂ → ℂ} (hv : v ∈ V2) : MemLp v 2 mu2 ∧ ∫ u, conj (v u) * F u ∂mu2 = 0 := by
  induction hv using Submodule.span_induction with
  | mem v hv => obtain ⟨i, rfl⟩ := hv; exact ⟨memLp_H2 i, h i⟩
  | zero => exact ⟨MemLp.zero, by simp⟩
  | add u v _ _ hu hv =>
    refine ⟨hu.1.add hv.1, ?_⟩
    have iu : Integrable (fun x => conj (u x) * F x) mu2 :=
      (hu.1.star.integrable_mul hF).congr (Filter.Eventually.of_forall fun x => rfl)
    have iv : Integrable (fun x => conj (v x) * F x) mu2 :=
      (hv.1.star.integrable_mul hF).congr (Filter.Eventually.of_forall fun x => rfl)
    have e : (fun x => conj ((u + v) x) * F x) = fun x => conj (u x) * F x + conj (v x) * F x := by
      funext x; simp [add_mul]
    rw [e, integral_add iu iv, hu.2, hv.2, add_zero]
  | smul c v _ hv =>
    refine ⟨hv.1.const_smul c, ?_⟩
    have e : (fun x => conj ((c • v) x) * F x) = fun x => conj c * (conj (v x) * F x) := by
      funext x; simp [mul_assoc]
    rw [e, integral_const_mul, hv.2, mul_zero]

/-- **Completeness of the tensor Hermite functions on `ℂ²`.** -/
theorem hermite2_complete (hF : MemLp F 2 mu2) (h : ∀ i, ∫ u, conj (H2 i u) * F u ∂mu2 = 0) :
    F =ᵐ[mu2] 0 := by
  set G : (Fin 4 → ℝ) → ℂ := F ∘ e2 with hG_def
  have hFm : AEStronglyMeasurable F ((stdGaussian 4).map e2) := by rw [map_e2]; exact hF.aestronglyMeasurable
  have hG : MemLp G 2 (stdGaussian 4) := by
    have hF' : MemLp F 2 ((stdGaussian 4).map e2) := by rw [map_e2]; exact hF
    exact (memLp_map_measure_iff hFm measurable_e2.aemeasurable).1 hF'
  have horth : ∀ P : MvPolynomial (Fin 4) ℝ,
      ∫ x, ((eval x P : ℝ) : ℂ) * G x ∂(stdGaussian 4) = 0 := fun P => by
    have h0 := (V2_orth hF h (mem_V2_realPoly P)).2
    have hm : AEStronglyMeasurable
        (fun u => conj (((eval (fromC2 u) P : ℝ) : ℂ)) * F u) ((stdGaussian 4).map e2) := by
      rw [map_e2]
      exact ((Complex.continuous_conj.comp (Complex.continuous_ofReal.comp
        ((MvPolynomial.continuous_eval P).comp (by unfold fromC2 fromC; fun_prop)))).aestronglyMeasurable).mul
        hF.aestronglyMeasurable
    rw [← map_e2, integral_map measurable_e2.aemeasurable hm] at h0
    rw [← h0]
    refine integral_congr_ae (Filter.Eventually.of_forall fun x => ?_)
    simp only [hG_def, Function.comp, fromC2_e2, Complex.conj_ofReal]
  have hint : ∀ P : MvPolynomial (Fin 4) ℝ,
      Integrable (fun x => ((eval x P : ℝ) : ℂ) * G x) (stdGaussian 4) := fun P =>
    ((Complex.ofRealCLM.comp_memLp' (memLp_eval P)).integrable_mul hG).congr
      (Filter.Eventually.of_forall fun x => by simp)
  have hre : (fun x => (G x).re) =ᵐ[stdGaussian 4] 0 := by
    refine poly_complete (by simpa using hG.re) fun P => ?_
    have := congrArg Complex.re (horth P)
    have e := integral_re (hint P)
    simp only [RCLike.re_to_complex] at e
    rw [← e] at this
    simpa [Complex.mul_re, mul_comm] using this
  have him : (fun x => (G x).im) =ᵐ[stdGaussian 4] 0 := by
    refine poly_complete (by simpa using hG.im) fun P => ?_
    have := congrArg Complex.im (horth P)
    have e := integral_im (hint P)
    simp only [RCLike.im_to_complex] at e
    rw [← e] at this
    simpa [Complex.mul_im, mul_comm] using this
  have hG0 : ∀ᵐ x ∂(stdGaussian 4), F (e2 x) = 0 := by
    filter_upwards [hre, him] with x h1 h2
    exact Complex.ext h1 h2
  rw [← map_e2]
  exact (measurableEmbedding_e2.ae_map_iff).2 hG0

/-! ### Hilbert basis and Parseval -/

/-- `(p! q! r! s!)^{−1/2}`. -/
def nrm2 (i : Idx2) : ℝ := (√(fac2 i : ℝ))⁻¹

lemma fac2_pos (i : Idx2) : (0 : ℝ) < fac2 i := by
  unfold fac2
  have := Nat.factorial_pos i.1.1; have := Nat.factorial_pos i.1.2
  have := Nat.factorial_pos i.2.1; have := Nat.factorial_pos i.2.2
  positivity

lemma nrm2_pos (i : Idx2) : 0 < nrm2 i := by
  unfold nrm2; have := fac2_pos i; positivity

/-- The normalised tensor Hermite function. -/
def hfun2 (i : Idx2) (u : ℂ × ℂ) : ℂ := (nrm2 i : ℂ) * H2 i u

lemma memLp_hfun2 (i : Idx2) : MemLp (hfun2 i) 2 mu2 := (memLp_H2 i).const_mul _

/-- The normalised tensor Hermite function in `L²(mu2)`. -/
def hvec2 (i : Idx2) : Lp ℂ 2 mu2 := (memLp_hfun2 i).toLp _

lemma inner_toLp2 {F G : ℂ × ℂ → ℂ} (hF : MemLp F 2 mu2) (hG : MemLp G 2 mu2) :
    ⟪hF.toLp F, hG.toLp G⟫_ℂ = ∫ u, conj (F u) * G u ∂mu2 := by
  rw [L2.inner_def]
  refine integral_congr_ae ?_
  filter_upwards [hF.coeFn_toLp, hG.coeFn_toLp] with u h1 h2
  rw [h1, h2, RCLike.inner_apply, mul_comm]

lemma inner_hvec2 (i j : Idx2) : ⟪hvec2 i, hvec2 j⟫_ℂ = if i = j then 1 else 0 := by
  rw [hvec2, hvec2, inner_toLp2]
  simp only [hfun2, map_mul, Complex.conj_ofReal]
  have : ∀ u, (nrm2 i : ℂ) * conj (H2 i u) * ((nrm2 j : ℂ) * H2 j u)
      = ((nrm2 i : ℂ) * nrm2 j) * (conj (H2 i u) * H2 j u) := fun u => by ring
  simp_rw [this]
  rw [integral_const_mul, integral_hermite2]
  by_cases h : i = j
  · subst h
    simp only [↓reduceIte]
    have h1 : nrm2 i * nrm2 i * (fac2 i : ℝ) = 1 := by
      rw [nrm2, ← mul_inv, Real.mul_self_sqrt (fac2_pos i).le, inv_mul_cancel₀ (fac2_pos i).ne']
    exact_mod_cast h1
  · simp [h]

theorem orthonormal_hvec2 : Orthonormal ℂ hvec2 := orthonormal_iff_ite.2 inner_hvec2

lemma inner_hvec2_left (i : Idx2) (G : Lp ℂ 2 mu2) :
    ⟪hvec2 i, G⟫_ℂ = (nrm2 i : ℂ) * ∫ u, conj (H2 i u) * G u ∂mu2 := by
  rw [L2.inner_def, ← integral_const_mul]
  refine integral_congr_ae ?_
  filter_upwards [(memLp_hfun2 i).coeFn_toLp] with u hu
  simp only [hvec2] at *
  rw [hu, RCLike.inner_apply]
  simp [hfun2, Complex.conj_ofReal]; ring

theorem span_hvec2_perp : (Submodule.span ℂ (Set.range hvec2))ᗮ = ⊥ := by
  refine (Submodule.eq_bot_iff _).2 fun G hG => ?_
  have h0 : ∀ i, ∫ u, conj (H2 i u) * G u ∂mu2 = 0 := fun i => by
    have := Submodule.inner_right_of_mem_orthogonal
      (Submodule.subset_span ⟨i, rfl⟩ : hvec2 i ∈ Submodule.span ℂ (Set.range hvec2)) hG
    rw [inner_hvec2_left] at this
    exact (mul_eq_zero.1 this).resolve_left (by exact_mod_cast (nrm2_pos i).ne')
  exact Lp.eq_zero_iff_ae_eq_zero.2 (hermite2_complete (Lp.memLp G) h0)

/-- **The tensor Hermite Hilbert basis of `L²(gaussC ⊗ gaussC)`.** -/
def hermiteBasis2 : HilbertBasis Idx2 ℂ (Lp ℂ 2 mu2) :=
  HilbertBasis.mkOfOrthogonalEqBot orthonormal_hvec2 span_hvec2_perp

@[simp] lemma hermiteBasis2_apply (i : Idx2) : hermiteBasis2 i = hvec2 i := by
  simp [hermiteBasis2]

/-- **Parseval on `ℂ²`**: `Σ_i |⟪h_i, G⟫|² = ‖G‖²`. -/
theorem hasSum_energy2 (G : Lp ℂ 2 mu2) :
    HasSum (fun i => ‖⟪hvec2 i, G⟫_ℂ‖ ^ 2) (‖G‖ ^ 2) := by
  have h := lp.hasSum_norm (p := 2) (by norm_num) (hermiteBasis2.repr G)
  simp only [ENNReal.toReal_ofNat, Real.rpow_two, HilbertBasis.repr_apply_apply,
    hermiteBasis2_apply, LinearIsometryEquiv.norm_map] at h
  exact_mod_cast h

end

end Grothe.UpperChaos
