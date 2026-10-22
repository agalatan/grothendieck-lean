import Grothe.UpperChaos.Completeness

/-!
# The complex Hermite polynomials are complete in `L²(gaussC)` (U2 of PLAN_UPPER, Hermite form)

`hermite_complete`: if `f ∈ L²(gaussC)` and `E[conj H_{pq} · f] = 0` for all `p, q`, then `f = 0`
a.e.  The span of the `H_{pq}` is all of `ℂ[z, z̄]` (`mem_span_H`: it contains `1` and is closed
under multiplication by `z` and `z̄`, because `z f = A₀ f + ∂_{z̄} f`, `z̄ f = A₁ f + ∂_z f` and
`A₁ H_{pq} = H_{p,q+1}`), every real polynomial in `x = (√2 Re z, √2 Im z)` is a polynomial in
`z, z̄` (`ev_toC_realPoly`), and `poly_complete` applies to the real and imaginary parts of
`f(toC x)`.
-/

open MeasureTheory ProbabilityTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-! ### The span of the Hermite polynomials -/

lemma A1_A0 (f : CPoly) : A1 (A0 f) = A0 (A1 f) := by
  simp only [A1, A0, map_sub, Derivation.leibniz, smul_eq_mul, pderiv_X_self, pderiv_comm]
  simp; ring

lemma A1_H (p q : ℕ) : A1 (H p q) = H p (q + 1) := by
  induction p with
  | zero => rw [H_zero_succ]
  | succ p ih => rw [H_succ_left, A1_A0, ih, H_succ_left]

/-- The span of the Hermite polynomials. -/
def spanH : Submodule ℂ CPoly := Submodule.span ℂ (Set.range fun pq : ℕ × ℕ => H pq.1 pq.2)

lemma H_mem (p q : ℕ) : H p q ∈ spanH := Submodule.subset_span ⟨(p, q), rfl⟩

lemma X0_mul_mem {v : CPoly} (hv : v ∈ spanH) : X 0 * v ∈ spanH := by
  induction hv using Submodule.span_induction with
  | mem v hv =>
    obtain ⟨⟨p, q⟩, rfl⟩ := hv
    have : X 0 * H p q = A0 (H p q) + pderiv 1 (H p q) := by simp [A0]
    rw [this, ← H_succ_left]
    refine spanH.add_mem (H_mem _ _) ?_
    cases q with
    | zero => rw [pderiv1_H_zero]; exact spanH.zero_mem
    | succ q => rw [pderiv1_H_succ]; exact spanH.smul_of_tower_mem _ (H_mem _ _)
  | zero => simp
  | add u v _ _ hu hv => rw [mul_add]; exact spanH.add_mem hu hv
  | smul c v _ hv => rw [mul_smul_comm]; exact spanH.smul_mem c hv

lemma X1_mul_mem {v : CPoly} (hv : v ∈ spanH) : X 1 * v ∈ spanH := by
  induction hv using Submodule.span_induction with
  | mem v hv =>
    obtain ⟨⟨p, q⟩, rfl⟩ := hv
    have : X 1 * H p q = A1 (H p q) + pderiv 0 (H p q) := by simp [A1]
    rw [this, A1_H]
    refine spanH.add_mem (H_mem _ _) ?_
    cases p with
    | zero => rw [pderiv0_H_zero]; exact spanH.zero_mem
    | succ p => rw [pderiv0_H_succ]; exact spanH.smul_of_tower_mem _ (H_mem _ _)
  | zero => simp
  | add u v _ _ hu hv => rw [mul_add]; exact spanH.add_mem hu hv
  | smul c v _ hv => rw [mul_smul_comm]; exact spanH.smul_mem c hv

/-- **Every polynomial in `z, z̄` is a combination of Hermite polynomials.** -/
theorem mem_span_H (P : CPoly) : P ∈ spanH := by
  induction P using MvPolynomial.induction_on with
  | C a =>
    rw [← mul_one (C a), C_mul', ← H_zero_zero]; exact spanH.smul_mem a (H_mem 0 0)
  | add P Q hP hQ => exact spanH.add_mem hP hQ
  | mul_X P i hP =>
    rw [mul_comm]
    fin_cases i
    · exact X0_mul_mem hP
    · exact X1_mul_mem hP

/-! ### Orthogonality to all polynomials -/

lemma memLp_ev (P : CPoly) : MemLp (fun z => ev z P) 2 gaussC := by
  refine (memLp_two_iff_integrable_sq_norm (continuous_ev P).aestronglyMeasurable).2 ?_
  refine ((integrable_ev (conjP P * P)).norm).congr (Filter.Eventually.of_forall fun z => ?_)
  simp only [ev, map_mul]
  rw [← ev, ← ev, ev_conjP, norm_mul, Complex.norm_conj, sq]

lemma memLp_conj_ev (P : CPoly) : MemLp (fun z => conj (ev z P)) 2 gaussC := by
  refine (memLp_ev (conjP P)).congr_norm
    (Complex.continuous_conj.comp (continuous_ev P)).aestronglyMeasurable
    (Filter.Eventually.of_forall fun z => ?_)
  simp only [ev_conjP]

variable {f : ℂ → ℂ}

lemma integrable_conj_ev_mul (hf : MemLp f 2 gaussC) (P : CPoly) :
    Integrable (fun z => conj (ev z P) * f z) gaussC :=
  (memLp_conj_ev P).integrable_mul hf

/-- Orthogonality to the `H_{pq}` extends to every polynomial in `z, z̄`. -/
theorem integral_conj_ev_mul_eq_zero (hf : MemLp f 2 gaussC)
    (h : ∀ p q, ∫ z, conj (ev z (H p q)) * f z ∂gaussC = 0) (P : CPoly) :
    ∫ z, conj (ev z P) * f z ∂gaussC = 0 := by
  have hP := mem_span_H P
  induction hP using Submodule.span_induction with
  | mem v hv => obtain ⟨⟨p, q⟩, rfl⟩ := hv; exact h p q
  | zero => simp [ev]
  | add u v _ _ hu hv =>
    have e : ∀ z, conj (ev z (u + v)) * f z = conj (ev z u) * f z + conj (ev z v) * f z :=
      fun z => by simp [ev, add_mul]
    simp_rw [e]
    rw [integral_add (integrable_conj_ev_mul hf u) (integrable_conj_ev_mul hf v), hu, hv, add_zero]
  | smul c v _ hv =>
    have e : ∀ z, conj (ev z (c • v)) * f z = conj c * (conj (ev z v) * f z) :=
      fun z => by simp [ev, smul_eval, mul_assoc]
    simp_rw [e]
    rw [integral_const_mul, hv, mul_zero]

/-! ### Real polynomials in the real coordinates -/

/-- `x₀ = (z + z̄)/√2`, `x₁ = −i(z − z̄)/√2`. -/
def realPoly : MvPolynomial (Fin 2) ℝ →ₐ[ℝ] CPoly :=
  aeval ![C ((√2 : ℝ) : ℂ)⁻¹ * (X 0 + X 1), C (-Complex.I * ((√2 : ℝ) : ℂ)⁻¹) * (X 0 - X 1)]

lemma ev_toC_realPoly (x : Fin 2 → ℝ) (P : MvPolynomial (Fin 2) ℝ) :
    ev (toC x) (realPoly P) = (eval x P : ℂ) := by
  have h2 : ((√2 : ℝ) : ℂ) ≠ 0 := by
    rw [Complex.ofReal_ne_zero]; positivity
  have hs : ((√2 : ℝ) : ℂ) * ((√2 : ℝ) : ℂ) = 2 := by
    rw [← Complex.ofReal_mul, Real.mul_self_sqrt (by norm_num)]; norm_num
  induction P using MvPolynomial.induction_on with
  | C a => simp [realPoly, ev]
  | add P Q hP hQ => simp only [map_add, ev] at *; rw [hP, hQ]; push_cast; ring
  | mul_X P i hP =>
    simp only [map_mul, ev] at *
    rw [hP]
    push_cast
    congr 1
    fin_cases i
    · simp [realPoly, zv, toC]
      field_simp
      linear_combination (-(x 0 : ℂ)) * hs
    · simp [realPoly, zv, toC]
      field_simp
      linear_combination (-(x 1 : ℂ)) * hs + (-2 * (x 1 : ℂ)) * Complex.I_sq

/-! ### Completeness -/

/-- `x = (√2 Re z, √2 Im z)`, the inverse of `toC`. -/
def fromC (z : ℂ) : Fin 2 → ℝ := ![√2 * z.re, √2 * z.im]

lemma fromC_toC (x : Fin 2 → ℝ) : fromC (toC x) = x := by
  have h2 : (√2 : ℝ) ≠ 0 := by positivity
  ext i; fin_cases i <;> simp [fromC, toC, Complex.div_re, Complex.div_im] <;> field_simp <;>
    rw [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)] <;> ring

lemma toC_fromC (z : ℂ) : toC (fromC z) = z := by
  have hs : ((√2 : ℝ) : ℂ) * ((√2 : ℝ) : ℂ) = 2 := by
    rw [← Complex.ofReal_mul, Real.mul_self_sqrt (by norm_num)]; norm_num
  have h2 : ((√2 : ℝ) : ℂ) ≠ 0 := by rw [Complex.ofReal_ne_zero]; positivity
  simp only [toC, fromC, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_fin_one]
  push_cast
  field_simp
  exact Complex.re_add_im z

lemma measurableEmbedding_toC : MeasurableEmbedding toC := by
  refine MeasurableEmbedding.of_measurable_inverse measurable_toC ?_ (by unfold fromC; fun_prop)
    fromC_toC
  rw [Set.range_eq_univ.2 fun z => ⟨fromC z, toC_fromC z⟩]; exact MeasurableSet.univ

/-- **Completeness of the complex Hermite polynomials**: `f ∈ L²(gaussC)` orthogonal to every
`H_{pq}` vanishes almost everywhere. -/
theorem hermite_complete (hf : MemLp f 2 gaussC)
    (h : ∀ p q, ∫ z, conj (ev z (H p q)) * f z ∂gaussC = 0) : f =ᵐ[gaussC] 0 := by
  set g : (Fin 2 → ℝ) → ℂ := f ∘ toC with hg_def
  have hg : MemLp g 2 (stdGaussian 2) :=
    (memLp_map_measure_iff hf.aestronglyMeasurable measurable_toC.aemeasurable).1 hf
  have horth : ∀ P : MvPolynomial (Fin 2) ℝ,
      ∫ x, ((eval x P : ℝ) : ℂ) * g x ∂(stdGaussian 2) = 0 := fun P => by
    have := integral_conj_ev_mul_eq_zero hf h (realPoly P)
    have hm : AEStronglyMeasurable (fun z => conj (ev z (realPoly P)) * f z) gaussC :=
      (Complex.continuous_conj.comp (continuous_ev _)).aestronglyMeasurable.mul
        hf.aestronglyMeasurable
    rw [gaussC] at this hm
    rw [integral_map measurable_toC.aemeasurable hm] at this
    rw [← this]
    refine integral_congr_ae (Filter.Eventually.of_forall fun x => ?_)
    simp only [hg_def, Function.comp, ev_toC_realPoly, Complex.conj_ofReal]
  have hint : ∀ P : MvPolynomial (Fin 2) ℝ,
      Integrable (fun x => ((eval x P : ℝ) : ℂ) * g x) (stdGaussian 2) := fun P =>
    ((Complex.ofRealCLM.comp_memLp' (memLp_eval P)).integrable_mul hg).congr
      (Filter.Eventually.of_forall fun x => by simp)
  have hre : (fun x => (g x).re) =ᵐ[stdGaussian 2] 0 := by
    refine poly_complete (by simpa using hg.re) fun P => ?_
    have := congrArg Complex.re (horth P)
    have e := integral_re (hint P)
    simp only [RCLike.re_to_complex] at e
    rw [← e] at this
    simpa [Complex.mul_re, mul_comm] using this
  have him : (fun x => (g x).im) =ᵐ[stdGaussian 2] 0 := by
    refine poly_complete (by simpa using hg.im) fun P => ?_
    have := congrArg Complex.im (horth P)
    have e := integral_im (hint P)
    simp only [RCLike.im_to_complex] at e
    rw [← e] at this
    simpa [Complex.mul_im, mul_comm] using this
  have hg0 : ∀ᵐ x ∂(stdGaussian 2), f (toC x) = 0 := by
    filter_upwards [hre, him] with x h1 h2
    exact Complex.ext h1 h2
  exact (measurableEmbedding_toC.ae_map_iff).2 hg0

end

end Grothe.UpperChaos
