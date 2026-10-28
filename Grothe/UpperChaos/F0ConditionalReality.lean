import Grothe.UpperChaos.F0ConditionalCoefficientBounds
import Grothe.UpperChaos.RationalComplexHermite
import Grothe.LowerAnalytic.CapSymmetry

/-! Reality of every actual canonical conditional coefficient, and the
corresponding exact conversion to a real stored-center error.
Agent-ID: codex-8c4d. -/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.F0ConditionalEvaluator

noncomputable section

private theorem eval_rat_conj (P : RationalComplexHermite.RatPoly) (z : ℂ) :
    MvPolynomial.eval₂ (Rat.castHom ℂ) (zv (conj z)) P =
      conj (MvPolynomial.eval₂ (Rat.castHom ℂ) (zv z) P) := by
  induction P using MvPolynomial.induction_on with
  | C a => simp
  | add P Q hP hQ => simp [hP, hQ]
  | mul_X P i hP =>
    simp only [eval₂_mul, eval₂_X, map_mul, hP]
    congr 1
    fin_cases i <;> simp [zv]

theorem hfun_conj_argument (i : ℕ × ℕ) (z : ℂ) :
    hfun i (conj z) = conj (hfun i z) := by
  change (nrm i.1 i.2 : ℂ) * ev (conj z) (H i.1 i.2) =
    conj ((nrm i.1 i.2 : ℂ) * ev z (H i.1 i.2))
  rw [map_mul, Complex.conj_ofReal]
  congr 1
  simpa only [ev, MvPolynomial.eval₂_eq_eval_map, RationalComplexHermite.map_ratH] using
    eval_rat_conj (RationalComplexHermite.ratH i.1 i.2) z

private theorem phase_conj (z : ℂ) : Haag.ph (conj z) = conj (Haag.ph z) := by
  simp only [Haag.ph, map_div₀, Complex.norm_conj, Complex.conj_ofReal]

theorem canonicalIntegrand_conj (A : ℝ) (i : ℕ × ℕ) (w : ℂ) :
    conj (hfun i (conj w)) * Haag.ph ((A : ℂ) + conj w) =
      conj (conj (hfun i w) * Haag.ph ((A : ℂ) + w)) := by
  have he : (A : ℂ) + conj w = conj ((A : ℂ) + w) := by simp
  rw [he, phase_conj, hfun_conj_argument]
  simp only [map_mul, Complex.conj_conj]

private theorem integral_conj_of_symmetric {f : ℂ → ℂ} (hf : Integrable f gaussC)
    (hconj : ∀ w, f (conj w) = conj (f w)) :
    conj (∫ w, f w ∂gaussC) = ∫ w, f w ∂gaussC := by
  have hfm : AEStronglyMeasurable f (gaussC.map (fun z : ℂ => conj z)) := by
    rw [gaussC_map_conj]
    exact hf.aestronglyMeasurable
  have hmap := integral_map (μ := gaussC)
    Complex.continuous_conj.measurable.aemeasurable hfm
  rw [gaussC_map_conj] at hmap
  rw [← integral_conj]
  calc
    (∫ w, conj (f w) ∂gaussC) = ∫ w, f (conj w) ∂gaussC := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall fun w => (hconj w).symm
    _ = ∫ w, f w ∂gaussC := hmap.symm

theorem canonicalCoefficient_conj (A : ℝ) (i : ℕ × ℕ) :
    conj (canonicalCoefficient A i) = canonicalCoefficient A i := by
  let f : ℂ → ℂ := fun w => conj (hfun i w) * Haag.ph ((A : ℂ) + w)
  have hf : Integrable f gaussC := by
    simpa only [f, canonicalPhase, hfun, map_mul, Complex.conj_ofReal, mul_assoc] using
      (integrable_conj_ev_mul (canonicalPhase_memLp A) (H i.1 i.2)).const_mul
        (nrm i.1 i.2 : ℂ)
  exact integral_conj_of_symmetric hf (canonicalIntegrand_conj A i)

theorem canonicalCoefficient_im_eq_zero (A : ℝ) (i : ℕ × ℕ) :
    (canonicalCoefficient A i).im = 0 := by
  have h := congrArg Complex.im (canonicalCoefficient_conj A i)
  simp only [Complex.conj_im] at h
  linarith

theorem canonicalCoefficient_eq_ofReal_re (A : ℝ) (i : ℕ × ℕ) :
    canonicalCoefficient A i = ((canonicalCoefficient A i).re : ℂ) := by
  apply Complex.ext
  · simp
  · simp [canonicalCoefficient_im_eq_zero]

theorem norm_canonicalCoefficient_sub_real (A r : ℝ) (i : ℕ × ℕ) :
    ‖canonicalCoefficient A i - (r : ℂ)‖ = |(canonicalCoefficient A i).re - r| := by
  rw [canonicalCoefficient_eq_ofReal_re A i, ← Complex.ofReal_sub,
    Complex.norm_real, Real.norm_eq_abs]

theorem phaseSlice_conj (s : ℝ) (w : ℂ) :
    F0ConditionalNode.phaseSlice s (conj w) = conj (F0ConditionalNode.phaseSlice s w) := by
  unfold F0ConditionalNode.phaseSlice F0
  rw [← phase_conj]
  congr 1
  simp only [map_add, map_mul, Complex.conj_ofReal]

theorem coefficient_conj (s : ℝ) (i : ℕ × ℕ) :
    conj (F0ConditionalNode.coefficient s i) = F0ConditionalNode.coefficient s i := by
  let f : ℂ → ℂ := fun w => conj (hfun i w) * F0ConditionalNode.phaseSlice s w
  have hf : Integrable f gaussC := by
    simpa only [f, hfun, map_mul, Complex.conj_ofReal, mul_assoc] using
      (integrable_conj_ev_mul (F0ConditionalNode.phaseSlice_memLp s) (H i.1 i.2)).const_mul
        (nrm i.1 i.2 : ℂ)
  have hsym : ∀ w, f (conj w) = conj (f w) := by
    intro w
    dsimp only [f]
    rw [hfun_conj_argument, phaseSlice_conj]
    simp only [map_mul, Complex.conj_conj]
  simpa only [F0ConditionalNode.coefficient_eq_integral, f] using
    integral_conj_of_symmetric hf hsym

theorem coefficient_im_eq_zero (s : ℝ)
    (i : ℕ × ℕ) : (F0ConditionalNode.coefficient s i).im = 0 := by
  have h := congrArg Complex.im (coefficient_conj s i)
  simp only [Complex.conj_im] at h
  linarith

theorem norm_coefficient_sub_real (s r : ℝ)
    (i : ℕ × ℕ) :
    ‖F0ConditionalNode.coefficient s i - (r : ℂ)‖ =
      |(F0ConditionalNode.coefficient s i).re - r| := by
  have he : F0ConditionalNode.coefficient s i =
      ((F0ConditionalNode.coefficient s i).re : ℂ) := by
    apply Complex.ext
    · simp
    · simp [coefficient_im_eq_zero s i]
  rw [he, ← Complex.ofReal_sub, Complex.norm_real, Real.norm_eq_abs]

end
end Grothe.UpperChaos.F0ConditionalEvaluator
