import Mathlib

/-!
# The standard Gaussian measure on `Fin d → ℝ`

`stdGaussian d` is the product of `d` standard real Gaussians.  This file provides

* integrability of polynomials (`integrable_eval`, `memLp_eval`) and of functions dominated by a
  polynomial (`integrable_of_abs_le_eval`);
* the scalar Stein identity `∫ t f(t) = ∫ f'(t)` (`stein_scalar`);
* the coordinate Stein identity `∫ x_j F = ∫ D` for a function with slice derivative `D` in the
  `j`-th coordinate (`stein_coordinate`);
* the slice derivative of a polynomial (`hasDerivAt_eval_update`).
-/

open MeasureTheory ProbabilityTheory
open scoped NNReal

namespace Grothe.LowerAnalytic

/-- The standard Gaussian measure on `Fin d → ℝ`. -/
noncomputable def stdGaussian (d : ℕ) : Measure (Fin d → ℝ) :=
  Measure.pi fun _ => gaussianReal 0 1

instance (d : ℕ) : IsProbabilityMeasure (stdGaussian d) := by
  unfold stdGaussian; infer_instance

/-! ### Polynomials are integrable -/

lemma integrable_pow_gaussian (k : ℕ) : Integrable (fun t : ℝ => t ^ k) (gaussianReal 0 1) := by
  have h : Integrable (fun x : ℝ => |x| ^ k) (gaussianReal 0 1) := by
    simpa only [Real.norm_eq_abs, id_eq] using
      (memLp_id_gaussianReal (μ := 0) (v := 1) (k : ℝ≥0)).integrable_norm_pow'
  refine h.mono' (by fun_prop) (Filter.Eventually.of_forall fun t => ?_)
  rw [Real.norm_eq_abs, abs_pow]

lemma integrable_eval {d : ℕ} (p : MvPolynomial (Fin d) ℝ) :
    Integrable (fun x => MvPolynomial.eval x p) (stdGaussian d) := by
  induction p using MvPolynomial.induction_on' with
  | monomial s a =>
    have h : Integrable (fun x : Fin d → ℝ => ∏ j, x j ^ s j) (stdGaussian d) :=
      Integrable.fintype_prod (f := fun j (t : ℝ) => t ^ s j) fun j => integrable_pow_gaussian _
    refine (h.const_mul a).congr (Filter.Eventually.of_forall fun x => ?_)
    simp only [MvPolynomial.eval_monomial, Finsupp.prod_fintype _ _ (fun i => pow_zero _)]
  | add p q hp hq =>
    simp only [map_add]
    exact hp.add hq

/-- A function dominated by a polynomial is integrable. -/
lemma integrable_of_abs_le_eval {d : ℕ} {F : (Fin d → ℝ) → ℝ}
    (hF : AEStronglyMeasurable F (stdGaussian d)) (p : MvPolynomial (Fin d) ℝ)
    (h : ∀ x, |F x| ≤ MvPolynomial.eval x p) : Integrable F (stdGaussian d) :=
  (integrable_eval p).mono' hF (Filter.Eventually.of_forall fun x => by
    rw [Real.norm_eq_abs]; exact h x)

/-- Polynomials are square integrable. -/
lemma memLp_eval {d : ℕ} (p : MvPolynomial (Fin d) ℝ) :
    MemLp (fun x => MvPolynomial.eval x p) 2 (stdGaussian d) := by
  rw [memLp_two_iff_integrable_sq (MvPolynomial.continuous_eval p).aestronglyMeasurable]
  exact (integrable_eval (p * p)).congr (Filter.Eventually.of_forall fun x => by
    simp only [map_mul]; ring)

/-! ### The scalar Stein identity -/

lemma hasDerivAt_gaussianPDFReal (t : ℝ) :
    HasDerivAt (gaussianPDFReal 0 1) (-t * gaussianPDFReal 0 1 t) t := by
  have hd : HasDerivAt (fun x : ℝ => -(x ^ 2) / 2) (-t) t := by
    have h := ((hasDerivAt_pow 2 t).neg).div_const 2
    have e : -(((2 : ℕ) : ℝ) * t ^ (2 - 1)) / 2 = -t := by norm_num; ring
    rw [e] at h
    exact h
  convert hd.exp.const_mul ((Real.sqrt (2 * Real.pi))⁻¹) using 1
  · simp [gaussianPDFReal_def]
  · simp only [gaussianPDFReal_def, NNReal.coe_one, mul_one, sub_zero]
    ring

lemma integrable_gaussian_iff (f : ℝ → ℝ) :
    Integrable f (gaussianReal 0 1) ↔ Integrable (fun t => gaussianPDFReal 0 1 t * f t) := by
  rw [gaussianReal_of_var_ne_zero 0 (by norm_num : (1 : ℝ≥0) ≠ 0)]
  rw [integrable_withDensity_iff (measurable_gaussianPDF 0 1)
    (Filter.Eventually.of_forall fun x => gaussianPDF_lt_top (μ := 0) (v := 1) (x := x))]
  simp only [toReal_gaussianPDF, mul_comm]

/-- **Scalar Stein identity.** -/
theorem stein_scalar {f f' : ℝ → ℝ} (hderiv : ∀ t, HasDerivAt f (f' t) t)
    (hf : Integrable f (gaussianReal 0 1)) (hf' : Integrable f' (gaussianReal 0 1))
    (hxf : Integrable (fun t => t * f t) (gaussianReal 0 1)) :
    ∫ t, t * f t ∂(gaussianReal 0 1) = ∫ t, f' t ∂(gaussianReal 0 1) := by
  have hrhof := (integrable_gaussian_iff f).mp hf
  have hrhof' := (integrable_gaussian_iff f').mp hf'
  have hrhoxf := (integrable_gaussian_iff (fun t => t * f t)).mp hxf
  have hneg : Integrable (fun t => (-t * gaussianPDFReal 0 1 t) * f t) := by
    convert hrhoxf.neg using 1
    ext t
    simp only [Pi.neg_apply]
    ring
  have h := integral_mul_deriv_eq_deriv_mul_of_integrable
    (u := gaussianPDFReal 0 1) (u' := fun t => -t * gaussianPDFReal 0 1 t)
    (v := f) (v' := f')
    (fun t _ => hasDerivAt_gaussianPDFReal t) (fun t _ => hderiv t)
    hrhof' hneg hrhof
  rw [integral_gaussianReal_eq_integral_smul (by norm_num : (1 : ℝ≥0) ≠ 0),
      integral_gaussianReal_eq_integral_smul (by norm_num : (1 : ℝ≥0) ≠ 0)]
  simp only [smul_eq_mul]
  calc
    (∫ t, gaussianPDFReal 0 1 t * (t * f t)) =
        -(∫ t, (-t * gaussianPDFReal 0 1 t) * f t) := by
      rw [← integral_neg]
      congr 1
      ext t
      ring
    _ = ∫ t, gaussianPDFReal 0 1 t * f' t := h.symm

/-! ### The coordinate Stein identity -/

/-- **Coordinate Stein identity.**  If `F` has the slice derivative `D` in the `j`-th coordinate,
then `∫ D = ∫ x_j F` under the standard Gaussian measure. -/
theorem stein_coordinate {d : ℕ} (j : Fin d) (F D : (Fin d → ℝ) → ℝ)
    (hF : Integrable F (stdGaussian d)) (hD : Integrable D (stdGaussian d))
    (hxF : Integrable (fun x => x j * F x) (stdGaussian d))
    (hderiv : ∀ x, HasDerivAt (fun t => F (Function.update x j t)) (D x) (x j)) :
    ∫ x, D x ∂(stdGaussian d) = ∫ x, x j * F x ∂(stdGaussian d) := by
  cases d with
  | zero => exact j.elim0
  | succ n =>
    have hmp : MeasurePreserving (MeasurableEquiv.piFinSuccAbove (fun _ => ℝ) j).symm
        ((gaussianReal 0 1).prod (stdGaussian n)) (stdGaussian (n + 1)) :=
      (measurePreserving_piFinSuccAbove (fun _ => gaussianReal 0 1) j).symm _
    have key : ∀ G : (Fin (n + 1) → ℝ) → ℝ, Integrable G (stdGaussian (n + 1)) →
        Integrable (fun z : ℝ × (Fin n → ℝ) => G (Fin.insertNth j z.1 z.2))
          ((gaussianReal 0 1).prod (stdGaussian n)) ∧
        ∫ x, G x ∂(stdGaussian (n + 1))
          = ∫ y, ∫ t, G (Fin.insertNth j t y) ∂(gaussianReal 0 1) ∂(stdGaussian n) := by
      intro G hG
      have hi : Integrable (fun z : ℝ × (Fin n → ℝ) => G (Fin.insertNth j z.1 z.2))
          ((gaussianReal 0 1).prod (stdGaussian n)) :=
        (hmp.integrable_comp_emb (MeasurableEquiv.measurableEmbedding _)).2 hG
      refine ⟨hi, ?_⟩
      rw [← integral_prod_symm _ hi]
      exact (hmp.integral_comp' (f := (MeasurableEquiv.piFinSuccAbove (fun _ => ℝ) j).symm) G).symm
    obtain ⟨hFi, -⟩ := key F hF
    obtain ⟨hDi, hDe⟩ := key D hD
    obtain ⟨hxFi, hxFe⟩ := key (fun x => x j * F x) hxF
    rw [hDe, hxFe]
    refine integral_congr_ae ?_
    filter_upwards [hFi.prod_left_ae, hDi.prod_left_ae, hxFi.prod_left_ae] with y h1 h2 h3
    simp only [Fin.insertNth_apply_same] at h3 ⊢
    refine (stein_scalar (fun t => ?_) h1 h2 h3).symm
    have h := hderiv (Fin.insertNth j t y)
    simp only [Fin.update_insertNth, Fin.insertNth_apply_same] at h
    exact h

/-! ### Slice derivatives of polynomials -/

lemma hasDerivAt_eval_update {d : ℕ} (p : MvPolynomial (Fin d) ℝ) (x : Fin d → ℝ) (j : Fin d)
    (t : ℝ) :
    HasDerivAt (fun s => MvPolynomial.eval (Function.update x j s) p)
      (MvPolynomial.eval (Function.update x j t) (MvPolynomial.pderiv j p)) t := by
  induction p using MvPolynomial.induction_on with
  | C a => simpa using hasDerivAt_const t a
  | add p q hp hq =>
    simp only [map_add]
    exact hp.add hq
  | mul_X p i hp =>
    have hX : HasDerivAt (fun s => Function.update x j s i) (if i = j then 1 else 0) t := by
      by_cases hij : i = j
      · subst hij; simpa using hasDerivAt_id' t
      · simpa [Function.update_of_ne hij, hij] using hasDerivAt_const t (x i)
    have e : MvPolynomial.eval (Function.update x j t)
          (MvPolynomial.pderiv j (p * MvPolynomial.X i))
        = MvPolynomial.eval (Function.update x j t) (MvPolynomial.pderiv j p)
            * Function.update x j t i
          + MvPolynomial.eval (Function.update x j t) p * (if i = j then 1 else 0) := by
      rw [Derivation.leibniz, MvPolynomial.pderiv_X]
      simp only [map_add, smul_eq_mul, map_mul, MvPolynomial.eval_X, Pi.single_apply]
      split_ifs
      · simp only [map_one]; ring
      · simp only [map_zero]; ring
    rw [e]
    simp only [map_mul, MvPolynomial.eval_X]
    exact hp.mul hX

end Grothe.LowerAnalytic
