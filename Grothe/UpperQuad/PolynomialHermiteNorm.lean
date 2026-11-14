import Grothe.UpperQuad.PolynomialHermiteDegree
import Grothe.UpperQuad.FinitePolynomialMehler

/-!
# Gaussian norm and finite Hermite expansion of a polynomial

The normalized degree-bounded Hermite expansion has coefficient square sum equal to the
Gaussian `L²` norm of the polynomial. The same coefficients evaluate the formal polynomial at
two independent complex arguments, providing the norm input for the finite Mehler estimate.

Agent-ID: codex-1a87. Refs #339.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.PolynomialHermite

open MeasureTheory MvPolynomial Grothe.LowerAnalytic Grothe.UpperChaos
open FinitePolynomialMehler
open scoped ComplexConjugate InnerProductSpace

noncomputable section

/-- Evaluation on the conjugate diagonal, as an element of Gaussian `L²`. -/
def polynomialLp : CPoly →ₗ[ℂ] Lp ℂ 2 gaussC where
  toFun P := (memLp_ev P).toLp (fun z ↦ ev z P)
  map_add' P Q := by
    apply Lp.ext
    filter_upwards [(memLp_ev (P + Q)).coeFn_toLp, (memLp_ev P).coeFn_toLp,
      (memLp_ev Q).coeFn_toLp,
      Lp.coeFn_add ((memLp_ev P).toLp (fun z ↦ ev z P))
        ((memLp_ev Q).toLp (fun z ↦ ev z Q))] with z hsum hP hQ hadd
    rw [hsum, hadd]
    change ev z (P + Q) = _ + _
    rw [hP, hQ]
    simp [ev]
  map_smul' c P := by
    apply Lp.ext
    filter_upwards [(memLp_ev (c • P)).coeFn_toLp, (memLp_ev P).coeFn_toLp,
      Lp.coeFn_smul c ((memLp_ev P).toLp (fun z ↦ ev z P))] with z hc hP hsmul
    simp only [RingHom.id_apply]
    rw [hc, hsmul]
    change ev z (c • P) = c * _
    rw [hP]
    simp [ev]

/-- The formal Hermite polynomial evaluates to the falling-factorial expression in `Hf`. -/
lemma eval_H (p q : ℕ) (z₁ z₂ : ℂ) :
    eval ![z₁, z₂] (H p q) = Mehler.Hf p q z₁ z₂ := by
  rw [HermiteFallingFactorial.H_eq_fallingFactorial]
  simp [Mehler.Hf]

/-- Normalized polynomial evaluation agrees with the normalized formal Hermite function. -/
lemma eval_normalized_H (p q : ℕ) (z₁ z₂ : ℂ) :
    eval ![z₁, z₂] ((nrm p q : ℂ) • H p q) = normalizedHf p q z₁ z₂ := by
  rw [smul_eval, eval_H]
  rfl

/-- The normalized polynomial represents the existing orthonormal Gaussian Hermite vector. -/
lemma polynomialLp_normalized_H (pq : ℕ × ℕ) :
    polynomialLp ((nrm pq.1 pq.2 : ℂ) • H pq.1 pq.2) = hvec pq := by
  apply Lp.ext
  filter_upwards [(memLp_ev ((nrm pq.1 pq.2 : ℂ) • H pq.1 pq.2)).coeFn_toLp,
    (memLp_hfun pq).coeFn_toLp] with z hP hH
  change ((memLp_ev _).toLp _) z = ((memLp_hfun pq).toLp _) z
  rw [hP, hH]
  change eval (zv z) ((nrm pq.1 pq.2 : ℂ) • H pq.1 pq.2) =
    (nrm pq.1 pq.2 : ℂ) * eval (zv z) (H pq.1 pq.2)
  exact smul_eval _ _ _

/-- Finite orthonormal Hermite sums have the squared Euclidean coefficient norm. -/
theorem norm_sum_hvec_sq (S : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ) :
    ‖∑ pq ∈ S, a pq • hvec pq‖ ^ 2 = ∑ pq ∈ S, ‖a pq‖ ^ 2 := by
  rw [@norm_sq_eq_re_inner ℂ, orthonormal_hvec.inner_sum,
    RCLike.re_to_complex, Complex.re_sum]
  refine Finset.sum_congr rfl fun pq _ ↦ ?_
  rw [Complex.conj_mul', ← Complex.ofReal_pow, Complex.ofReal_re]

/-- Degree-bounded polynomial expansion in the normalized Hermite polynomials. -/
theorem exists_normalized_expansion_of_totalDegree_le (P : CPoly) {N : ℕ}
    (hP : P.totalDegree ≤ N) :
    ∃ a : ℕ × ℕ → ℂ,
      ∑ pq ∈ indices N, a pq • ((nrm pq.1 pq.2 : ℂ) • H pq.1 pq.2) = P := by
  classical
  obtain ⟨b, hb⟩ := exists_finset_expansion_of_totalDegree_le P hP
  refine ⟨fun pq ↦ b pq / (nrm pq.1 pq.2 : ℂ), ?_⟩
  calc
    ∑ pq ∈ indices N, (b pq / (nrm pq.1 pq.2 : ℂ)) •
        ((nrm pq.1 pq.2 : ℂ) • H pq.1 pq.2) =
        ∑ pq ∈ indices N, b pq • H pq.1 pq.2 := by
      refine Finset.sum_congr rfl fun pq _ ↦ ?_
      have hn : (nrm pq.1 pq.2 : ℂ) ≠ 0 := by exact_mod_cast (nrm_pos pq.1 pq.2).ne'
      rw [smul_smul, div_mul_cancel₀ _ hn]
    _ = P := hb

/-- One finite coefficient family gives arbitrary complex evaluation and exact Gaussian norm. -/
theorem exists_normalized_evaluation_of_totalDegree_le (P : CPoly) {N : ℕ}
    (hP : P.totalDegree ≤ N) :
    ∃ a : ℕ × ℕ → ℂ,
      (∀ z₁ z₂ : ℂ, eval ![z₁, z₂] P =
        ∑ pq ∈ indices N, a pq * normalizedHf pq.1 pq.2 z₁ z₂) ∧
      ∑ pq ∈ indices N, ‖a pq‖ ^ 2 = ‖polynomialLp P‖ ^ 2 := by
  obtain ⟨a, ha⟩ := exists_normalized_expansion_of_totalDegree_le P hP
  refine ⟨a, ?_, ?_⟩
  · intro z₁ z₂
    rw [← ha]
    simp only [map_sum, smul_eval, eval_H, normalizedHf]
  · have hLp : ∑ pq ∈ indices N, a pq • hvec pq = polynomialLp P := by
      have hterm (pq : ℕ × ℕ) :
          polynomialLp (a pq • ((nrm pq.1 pq.2 : ℂ) • H pq.1 pq.2)) =
            a pq • hvec pq := by
        rw [map_smul, polynomialLp_normalized_H]
      simpa only [map_sum, hterm] using congrArg polynomialLp ha
    rw [← hLp, norm_sum_hvec_sq]

/-- Polynomial evaluation is controlled by its Gaussian norm and the finite Mehler kernel. -/
theorem norm_eval_sq_le (P : CPoly) {N : ℕ} (hP : P.totalDegree ≤ N)
    (τ : ℝ) (hτ0 : 0 < τ) (hτ1 : τ < 1) (z₁ z₂ : ℂ) :
    ‖eval ![z₁, z₂] P‖ ^ 2 ≤ ‖polynomialLp P‖ ^ 2 *
      ((τ ^ N)⁻¹ * ((1 - τ ^ 2)⁻¹ * Real.exp (Mehler.mehlerExp τ z₁ z₂).re)) := by
  obtain ⟨a, heval, hnorm⟩ := exists_normalized_evaluation_of_totalDegree_le P hP
  rw [heval z₁ z₂, ← hnorm]
  exact norm_sum_normalizedHf_sq_le (indices N) N
    (fun pq hpq ↦ mem_indices.mp hpq) a τ hτ0 hτ1 z₁ z₂

end

end Grothe.UpperQuad.PolynomialHermite
