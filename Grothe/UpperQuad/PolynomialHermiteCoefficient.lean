import Grothe.UpperQuad.PolynomialHermiteNorm

/-!
# Explicit finite Hermite coefficients of a polynomial

The Gaussian inner products give the coefficients in the finite normalized Hermite expansion.
The expansion retains the polynomial's total-degree bound, and the same coefficients evaluate
the polynomial at two independent complex arguments.

Agent-ID: codex-f3dd. Refs #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.PolynomialHermite

open MeasureTheory MvPolynomial Grothe.LowerAnalytic Grothe.UpperChaos
open FinitePolynomialMehler
open scoped ComplexConjugate InnerProductSpace

noncomputable section

/-- The normalized Gaussian Hermite coefficient of a polynomial. -/
def hermiteCoeff (P : CPoly) (pq : ℕ × ℕ) : ℂ :=
  ⟪hvec pq, polynomialLp P⟫_ℂ

/-- The coefficient is the actual Gaussian integral against the conjugate basis function. -/
theorem hermiteCoeff_eq_integral (P : CPoly) (pq : ℕ × ℕ) :
    hermiteCoeff P pq = ∫ w, conj (hfun pq w) * ev w P ∂gaussC := by
  exact inner_toLp (memLp_hfun pq) (memLp_ev P)

@[simp]
lemma hermiteCoeff_zero (pq : ℕ × ℕ) : hermiteCoeff 0 pq = 0 := by
  simp only [hermiteCoeff, map_zero, inner_zero_right]

@[simp]
lemma hermiteCoeff_add (P Q : CPoly) (pq : ℕ × ℕ) :
    hermiteCoeff (P + Q) pq = hermiteCoeff P pq + hermiteCoeff Q pq := by
  simp only [hermiteCoeff, map_add, inner_add_right]

@[simp]
lemma hermiteCoeff_smul (a : ℂ) (P : CPoly) (pq : ℕ × ℕ) :
    hermiteCoeff (a • P) pq = a * hermiteCoeff P pq := by
  simp only [hermiteCoeff, map_smul, inner_smul_right]

/-- The coefficient, bundled as a complex linear functional on polynomials. -/
def hermiteCoeffLinear (pq : ℕ × ℕ) : CPoly →ₗ[ℂ] ℂ where
  toFun P := hermiteCoeff P pq
  map_add' P Q := hermiteCoeff_add P Q pq
  map_smul' a P := by
    simpa only [RingHom.id_apply, smul_eq_mul] using hermiteCoeff_smul a P pq

@[simp]
lemma hermiteCoeffLinear_apply (pq : ℕ × ℕ) (P : CPoly) :
    hermiteCoeffLinear pq P = hermiteCoeff P pq := rfl

/-- Coefficient extraction from any finite normalized Hermite sum. -/
theorem hermiteCoeff_sum_normalized_H (S : Finset (ℕ × ℕ)) (a : ℕ × ℕ → ℂ)
    (pq : ℕ × ℕ) :
    hermiteCoeff (∑ qr ∈ S, a qr • ((nrm qr.1 qr.2 : ℂ) • H qr.1 qr.2)) pq =
      if pq ∈ S then a pq else 0 := by
  classical
  have hterm (qr : ℕ × ℕ) :
      polynomialLp (a qr • ((nrm qr.1 qr.2 : ℂ) • H qr.1 qr.2)) = a qr • hvec qr := by
    rw [map_smul, polynomialLp_normalized_H]
  simp only [hermiteCoeff, map_sum, hterm]
  simp [inner_sum, inner_smul_right, inner_hvec, mul_ite]

/-- The normalized Hermite expansion uses the explicit Gaussian coefficients. -/
theorem normalized_expansion (P : CPoly) {N : ℕ} (hP : P.totalDegree ≤ N) :
    ∑ pq ∈ indices N, hermiteCoeff P pq • ((nrm pq.1 pq.2 : ℂ) • H pq.1 pq.2) = P := by
  classical
  obtain ⟨a, ha⟩ := exists_normalized_expansion_of_totalDegree_le P hP
  have hcoeff (pq : ℕ × ℕ) (hpq : pq ∈ indices N) : hermiteCoeff P pq = a pq := by
    rw [← ha, hermiteCoeff_sum_normalized_H]
    simp [hpq]
  calc
    ∑ pq ∈ indices N, hermiteCoeff P pq • ((nrm pq.1 pq.2 : ℂ) • H pq.1 pq.2) =
        ∑ pq ∈ indices N, a pq • ((nrm pq.1 pq.2 : ℂ) • H pq.1 pq.2) := by
      apply Finset.sum_congr rfl
      intro pq hpq
      rw [hcoeff pq hpq]
    _ = P := ha

/-- A polynomial has no Hermite coefficient above its total-degree bound. -/
theorem hermiteCoeff_eq_zero_of_degree_lt (P : CPoly) {N : ℕ} (hP : P.totalDegree ≤ N)
    (pq : ℕ × ℕ) (hpq : N < pq.1 + pq.2) : hermiteCoeff P pq = 0 := by
  classical
  obtain ⟨a, ha⟩ := exists_normalized_expansion_of_totalDegree_le P hP
  have hnot : pq ∉ indices N := by
    rcases pq with ⟨p, q⟩
    simpa only [mem_indices] using not_le.mpr hpq
  rw [← ha, hermiteCoeff_sum_normalized_H]
  simp [hnot]

/-- The finite coefficient family evaluates the formal polynomial at arbitrary complex inputs. -/
theorem eval_eq_sum_hermiteCoeff (P : CPoly) {N : ℕ} (hP : P.totalDegree ≤ N)
    (z₁ z₂ : ℂ) :
    eval ![z₁, z₂] P =
      ∑ pq ∈ indices N, hermiteCoeff P pq * normalizedHf pq.1 pq.2 z₁ z₂ := by
  have h := congrArg (eval ![z₁, z₂]) (normalized_expansion P hP)
  simpa only [map_sum, smul_eval, eval_H, normalizedHf] using h.symm

/-- Evaluation on the Gaussian plane is the finite sum of the normalized Hermite functions. -/
theorem ev_eq_sum_hermiteCoeff (P : CPoly) {N : ℕ} (hP : P.totalDegree ≤ N) (z : ℂ) :
    ev z P = ∑ pq ∈ indices N, hermiteCoeff P pq * hfun pq z := by
  simpa only [ev, zv, normalizedHf, hfun, ← Mehler.ev_H_eq_Hf] using
    eval_eq_sum_hermiteCoeff P hP z (conj z)

/-- The explicit finite Hermite coefficients have the exact Gaussian polynomial norm. -/
theorem sum_norm_hermiteCoeff_sq (P : CPoly) {N : ℕ} (hP : P.totalDegree ≤ N) :
    ∑ pq ∈ indices N, ‖hermiteCoeff P pq‖ ^ 2 = ‖polynomialLp P‖ ^ 2 := by
  have hLp : ∑ pq ∈ indices N, hermiteCoeff P pq • hvec pq = polynomialLp P := by
    have hterm (pq : ℕ × ℕ) :
        polynomialLp (hermiteCoeff P pq • ((nrm pq.1 pq.2 : ℂ) • H pq.1 pq.2)) =
          hermiteCoeff P pq • hvec pq := by
      rw [map_smul, polynomialLp_normalized_H]
    have h := congrArg polynomialLp (normalized_expansion P hP)
    simpa only [map_sum, hterm] using h
  rw [← hLp, norm_sum_hvec_sq]

end

end Grothe.UpperQuad.PolynomialHermite
