import Grothe.UpperChaos.HermiteComplete
import Mathlib.Algebra.MvPolynomial.Degrees
import Mathlib.LinearAlgebra.Finsupp.LinearCombination

/-!
# Hermite expansion with a total-degree bound

A polynomial in `z, z̄` of total degree at most `N` is a finite linear combination of the
complex Hermite polynomials `H p q` with `p + q ≤ N`. Multiplication by either variable raises
the degree bound by one. This retains the degree information needed for finite Mehler bounds.

Agent-ID: codex-1a87. Refs #339.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.PolynomialHermite

open MvPolynomial Grothe.UpperChaos

noncomputable section

/-- The finite triangle of Hermite indices of total degree at most `N`. -/
def indices (N : ℕ) : Finset (ℕ × ℕ) :=
  ((Finset.range (N + 1)) ×ˢ (Finset.range (N + 1))).filter fun pq ↦ pq.1 + pq.2 ≤ N

@[simp]
lemma mem_indices {N p q : ℕ} : (p, q) ∈ indices N ↔ p + q ≤ N := by
  simp only [indices, Finset.mem_filter, Finset.mem_product, Finset.mem_range]
  omega

/-- The span of the Hermite polynomials within the degree triangle. -/
def span (N : ℕ) : Submodule ℂ CPoly :=
  Submodule.span ℂ (Set.range fun pq : indices N ↦ H pq.1.1 pq.1.2)

lemma H_mem {N p q : ℕ} (hpq : p + q ≤ N) : H p q ∈ span N :=
  Submodule.subset_span ⟨⟨(p, q), mem_indices.mpr hpq⟩, rfl⟩

lemma span_mono {M N : ℕ} (hMN : M ≤ N) : span M ≤ span N := by
  apply Submodule.span_le.mpr
  rintro _ ⟨pq, rfl⟩
  exact H_mem ((mem_indices.mp pq.2).trans hMN)

lemma X0_mul_mem {N : ℕ} {P : CPoly} (hP : P ∈ span N) :
    X 0 * P ∈ span (N + 1) := by
  refine (Submodule.span_le.mpr ?_ :
    span N ≤ (span (N + 1)).comap (LinearMap.mul ℂ _ (X 0))) hP
  rintro _ ⟨pq, rfl⟩
  obtain ⟨⟨p, q⟩, hpq⟩ := pq
  have hpq' : p + q ≤ N := mem_indices.mp hpq
  change X 0 * H p q ∈ span (N + 1)
  have heq : X 0 * H p q = A0 (H p q) + pderiv 1 (H p q) := by simp [A0]
  rw [heq, ← H_succ_left]
  refine (span (N + 1)).add_mem (H_mem (by omega)) ?_
  cases q with
  | zero => rw [pderiv1_H_zero]; exact (span (N + 1)).zero_mem
  | succ q =>
    rw [pderiv1_H_succ]
    exact (span (N + 1)).smul_of_tower_mem _ (H_mem (by omega))

lemma X1_mul_mem {N : ℕ} {P : CPoly} (hP : P ∈ span N) :
    X 1 * P ∈ span (N + 1) := by
  refine (Submodule.span_le.mpr ?_ :
    span N ≤ (span (N + 1)).comap (LinearMap.mul ℂ _ (X 1))) hP
  rintro _ ⟨pq, rfl⟩
  obtain ⟨⟨p, q⟩, hpq⟩ := pq
  have hpq' : p + q ≤ N := mem_indices.mp hpq
  change X 1 * H p q ∈ span (N + 1)
  have heq : X 1 * H p q = A1 (H p q) + pderiv 0 (H p q) := by simp [A1]
  rw [heq, A1_H]
  refine (span (N + 1)).add_mem (H_mem (by omega)) ?_
  cases p with
  | zero => rw [pderiv0_H_zero]; exact (span (N + 1)).zero_mem
  | succ p =>
    rw [pderiv0_H_succ]
    exact (span (N + 1)).smul_of_tower_mem _ (H_mem (by omega))

lemma pow_mul_pow_mem (p q : ℕ) :
    (X 0 : CPoly) ^ p * X 1 ^ q ∈ span (p + q) := by
  induction p with
  | zero =>
    induction q with
    | zero => simpa [H_zero_zero] using (H_mem (N := 0) (p := 0) (q := 0) (by omega))
    | succ q ih =>
      simpa [pow_succ, mul_comm, mul_left_comm, mul_assoc] using X1_mul_mem ih
  | succ p ih =>
    simpa [pow_succ, mul_comm, mul_left_comm, mul_assoc, Nat.add_assoc, Nat.add_comm,
      Nat.add_left_comm] using X0_mul_mem ih

lemma monomial_mem {N : ℕ} (s : Fin 2 →₀ ℕ) (a : ℂ) (hs : s 0 + s 1 ≤ N) :
    monomial s a ∈ span N := by
  rw [monomial_eq, C_mul']
  have hprod : (s.prod fun n e ↦ (X n : CPoly) ^ e) = X 0 ^ s 0 * X 1 ^ s 1 := by
    simp [Finsupp.prod_fintype, Fin.prod_univ_two]
  rw [hprod]
  exact (span N).smul_mem a (span_mono hs (pow_mul_pow_mem (s 0) (s 1)))

/-- A polynomial of total degree at most `N` lies in the degree-`N` Hermite span. -/
theorem mem_span_of_totalDegree_le (P : CPoly) {N : ℕ} (hP : P.totalDegree ≤ N) :
    P ∈ span N := by
  rw [P.as_sum]
  refine (span N).sum_mem fun s hs ↦ monomial_mem _ _ ?_
  simpa [Finsupp.sum_fintype, Fin.sum_univ_two] using (MvPolynomial.le_totalDegree hs).trans hP

/-- The Hermite expansion can be indexed by the finite degree triangle. -/
theorem exists_expansion_of_totalDegree_le (P : CPoly) {N : ℕ} (hP : P.totalDegree ≤ N) :
    ∃ a : indices N → ℂ, ∑ pq, a pq • H pq.1.1 pq.1.2 = P :=
  (Submodule.mem_span_range_iff_exists_fun ℂ).mp (mem_span_of_totalDegree_le P hP)

/-- The same finite expansion with coefficients defined on all pairs of natural numbers. -/
theorem exists_finset_expansion_of_totalDegree_le (P : CPoly) {N : ℕ}
    (hP : P.totalDegree ≤ N) :
    ∃ a : ℕ × ℕ → ℂ, ∑ pq ∈ indices N, a pq • H pq.1 pq.2 = P := by
  classical
  obtain ⟨a, ha⟩ := exists_expansion_of_totalDegree_le P hP
  refine ⟨fun pq ↦ if h : pq ∈ indices N then a ⟨pq, h⟩ else 0, ?_⟩
  rw [← Finset.sum_coe_sort]
  simpa using ha

end

end Grothe.UpperQuad.PolynomialHermite
