import Grothe.LowerAnalytic.Fluctuation

/-!
# The Gaussian moment functional on polynomials

`gMom n` are the moments `1, 0, 1, 0, 3, 0, 15, …` of the standard Gaussian, defined by the
recurrence `m(n+2) = (n+1) m(n)`, and `gM` is the linear functional on polynomials in finitely many
variables whose value on a monomial is the product of the one-dimensional moments.  The recurrence
is exactly the Gaussian integration by parts, so `gM` is a Gaussian expectation
(`gM_isGaussianExpectation`) and the fluctuation identity holds for it.
-/

open MvPolynomial

namespace Grothe.LowerAnalytic

noncomputable section

/-- The moments of the standard Gaussian. -/
def gMom : ℕ → ℝ
  | 0 => 1
  | 1 => 0
  | n + 2 => (n + 1) * gMom n

lemma gMom_one_add (n : ℕ) : gMom (1 + n) = n * gMom (n - 1) := by
  cases n with
  | zero => simp [gMom]
  | succ k =>
    rw [show 1 + (k + 1) = k + 2 by ring]
    simp only [gMom, Nat.add_sub_cancel, Nat.cast_add, Nat.cast_one]

/-- The moments through degree twelve. -/
lemma gMom_table :
    (List.range 13).map gMom = [1, 0, 1, 0, 3, 0, 15, 0, 105, 0, 945, 0, 10395] := by
  norm_num [List.range_succ, gMom]

variable {ι : Type*} [Fintype ι]

/-- The **Gaussian moment functional**: on a monomial, the product of the one-dimensional
moments. -/
def gM : MvPolynomial ι ℝ →ₗ[ℝ] ℝ :=
  (basisMonomials ι ℝ).constr ℝ fun s => ∏ i, gMom (s i)

lemma gM_monomial (s : ι →₀ ℕ) (a : ℝ) : gM (monomial s a) = a * ∏ i, gMom (s i) := by
  have h : monomial s a = a • (basisMonomials ι ℝ) s := by
    rw [coe_basisMonomials, smul_monomial, smul_eq_mul, mul_one]
  rw [h, map_smul, gM, Module.Basis.constr_basis, smul_eq_mul]

lemma prod_shift [DecidableEq ι] (m : ℕ → ℝ) (h : ∀ n : ℕ, m (1 + n) = n * m (n - 1))
    (s : ι →₀ ℕ) (i : ι) :
    ∏ j, m ((Finsupp.single i 1 + s : ι →₀ ℕ) j)
      = s i * ∏ j, m ((s - Finsupp.single i 1 : ι →₀ ℕ) j) := by
  rw [← Finset.mul_prod_erase Finset.univ (fun j => m ((Finsupp.single i 1 + s : ι →₀ ℕ) j))
      (Finset.mem_univ i),
    ← Finset.mul_prod_erase Finset.univ (fun j => m ((s - Finsupp.single i 1 : ι →₀ ℕ) j))
      (Finset.mem_univ i)]
  have hrest : ∏ j ∈ Finset.univ.erase i, m ((Finsupp.single i 1 + s : ι →₀ ℕ) j)
      = ∏ j ∈ Finset.univ.erase i, m ((s - Finsupp.single i 1 : ι →₀ ℕ) j) := by
    refine Finset.prod_congr rfl fun j hj => ?_
    have hne : i ≠ j := (Finset.ne_of_mem_erase hj).symm
    have h0 : (Finsupp.single i 1 : ι →₀ ℕ) j = 0 := by simp [hne]
    simp [h0]
  rw [hrest]
  simp only [Finsupp.coe_add, Pi.add_apply, Finsupp.single_eq_same, Finsupp.coe_tsub,
    Pi.sub_apply, h]
  ring

/-- The moment functional is a Gaussian expectation. -/
theorem gM_isGaussianExpectation : IsGaussianExpectation (gM (ι := ι)) where
  one := by
    rw [← C_1, C_apply, gM_monomial]
    simp [gMom]
  ibp i P := by
    classical
    induction P using MvPolynomial.induction_on' with
    | monomial s a =>
      rw [pderiv_monomial, X, monomial_mul_monomial, gM_monomial, gM_monomial, one_mul,
        prod_shift gMom gMom_one_add s i]
      ring
    | add p q hp hq => simp only [mul_add, map_add, hp, hq]

end

end Grothe.LowerAnalytic
