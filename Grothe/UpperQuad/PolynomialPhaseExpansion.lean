import Grothe.UpperQuad.PolynomialHermiteCoefficient
import Grothe.UpperQuad.QuadUpsilon
import Grothe.UpperChaos.HermiteConjugation

/-!
# Finite canonical-coefficient expansion of a polynomial phase integral

The normalized Hermite coefficients identify a polynomial's Gaussian integral against
`phase(A + w)` with a finite sum of the canonical conditional coefficients. The same finite
sum of their entire extensions is complex differentiable in the shift. The coefficient
family is explicit and complex linear in the polynomial.

Agent-ID: codex-f3dd. Refs #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.PolynomialPhase

open MeasureTheory MvPolynomial Grothe.LowerAnalytic Grothe.UpperChaos
open PolynomialHermite F0ConditionalEvaluator Explicit
open scoped ComplexConjugate

noncomputable section

lemma hfun_conj_swap (p q : ℕ) (w : ℂ) :
    conj (hfun (p, q) w) = hfun (q, p) w := by
  simp only [hfun, map_mul, Complex.conj_ofReal, conj_ev_H_swap]
  congr 1
  simp [nrm, mul_comm]

lemma integrable_ev_mul_phase (A : ℝ) (P : CPoly) :
    Integrable (fun w ↦ ev w P * Grothe.Haag.ph ((A : ℂ) + w)) gaussC := by
  apply (integrable_ev P).mul_bdd
    (Grothe.Haag.measurable_ph.comp (by fun_prop)).aestronglyMeasurable
  exact Filter.Eventually.of_forall fun w ↦ Grothe.Haag.norm_ph_le ((A : ℂ) + w)

/-- Gaussian integration of a polynomial against the translated phase. -/
def phaseMoment (A : ℝ) : CPoly →ₗ[ℂ] ℂ where
  toFun P := ∫ w, ev w P * Grothe.Haag.ph ((A : ℂ) + w) ∂gaussC
  map_add' P Q := by
    simp_rw [ev, map_add, add_mul]
    exact integral_add (integrable_ev_mul_phase A P) (integrable_ev_mul_phase A Q)
  map_smul' c P := by
    simp_rw [ev, smul_eval, RingHom.id_apply, smul_eq_mul, mul_assoc]
    exact integral_const_mul c _

lemma phaseMoment_apply (A : ℝ) (P : CPoly) :
    phaseMoment A P = ∫ w, ev w P * Grothe.Haag.ph ((A : ℂ) + w) ∂gaussC := rfl

lemma phaseMoment_normalized_H (A : ℝ) (p q : ℕ) :
    phaseMoment A ((nrm p q : ℂ) • H p q) = canonicalCoefficient A (q, p) := by
  rw [phaseMoment_apply, canonicalCoefficient]
  apply integral_congr_ae
  filter_upwards with w
  rw [hfun_conj_swap]
  simp only [ev, smul_eval, hfun]

/-- A polynomial phase integral has a finite Hermite expansion with explicit coefficients. -/
theorem phaseMoment_eq_sum (A : ℝ) (P : CPoly) {N : ℕ} (hP : P.totalDegree ≤ N) :
    phaseMoment A P = ∑ pq ∈ indices N,
      hermiteCoeff P pq * canonicalCoefficient A (pq.2, pq.1) := by
  have hterm (pq : ℕ × ℕ) :
      phaseMoment A (hermiteCoeff P pq • ((nrm pq.1 pq.2 : ℂ) • H pq.1 pq.2)) =
        hermiteCoeff P pq * canonicalCoefficient A (pq.2, pq.1) := by
    rw [map_smul, phaseMoment_normalized_H, smul_eq_mul]
  have h := congrArg (phaseMoment A) (normalized_expansion P hP)
  simpa only [map_sum, hterm] using h.symm

/-- The finite entire continuation, indexed by the canonical coefficient rather than its swap. -/
def phaseExtension (N : ℕ) (P : CPoly) (A : ℂ) : ℂ :=
  ∑ pq ∈ indices N, hermiteCoeff P (pq.2, pq.1) * Uext pq.1 pq.2 A

/-- The entire extension is the actual integral at every nonzero real shift. -/
theorem phaseExtension_real (P : CPoly) {N : ℕ} (hP : P.totalDegree ≤ N)
    (A : ℝ) (hA : A ≠ 0) : phaseExtension N P (A : ℂ) = phaseMoment A P := by
  rw [phaseMoment_eq_sum A P hP]
  unfold phaseExtension
  refine Finset.sum_equiv (Equiv.prodComm ℕ ℕ) ?_ ?_
  · rintro ⟨p, q⟩
    change (p, q) ∈ indices N ↔ (q, p) ∈ indices N
    simp only [mem_indices]
    omega
  · intro pq _
    simp only [Equiv.prodComm_apply]
    rw [canonicalCoefficient_eq_Uext A hA]
    rfl

/-- For a fixed polynomial, the finite phase extension is entire in its shift. -/
theorem differentiable_phaseExtension (N : ℕ) (P : CPoly) :
    Differentiable ℂ (phaseExtension N P) := by
  unfold phaseExtension
  apply Differentiable.fun_sum
  intro pq _
  exact (differentiable_const _).mul (QuadRem.differentiable_Uext pq.1 pq.2)

/-- The finite extension is bounded by the sum of coefficient and canonical-extension norms. -/
theorem norm_phaseExtension_le (N : ℕ) (P : CPoly) (A : ℂ) :
    ‖phaseExtension N P A‖ ≤
      ∑ pq ∈ indices N, ‖hermiteCoeff P (pq.2, pq.1)‖ * ‖Uext pq.1 pq.2 A‖ := by
  simpa only [phaseExtension, norm_mul] using
    norm_sum_le (indices N) (fun pq ↦ hermiteCoeff P (pq.2, pq.1) * Uext pq.1 pq.2 A)

end

end Grothe.UpperQuad.PolynomialPhase
