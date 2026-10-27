import Grothe.UpperChaos.ComplexHermite

/-!
# Degrees of the complex Hermite polynomials

`D n` is the space of polynomials in `z, z̄` of total degree `≤ n`. Multiplication by `z` or `z̄` raises the degree by
one, `∂_z` and `∂_{z̄}` lower it (`pderiv_mem`), so `H_{pq} = A₀^p A₁^q 1` has degree `p + q` and
`H_{pq} − z^p z̄^q` has degree `< p + q` (`H_sub_monomial_mem`). Hence the Hermite polynomials of degree `≤ n` span
`D n` (`D_le_span_H`).
-/

open MvPolynomial

namespace Grothe.UpperChaos

noncomputable section

/-- Polynomials in `z, z̄` of total degree `≤ n`. -/
abbrev D (n : ℕ) : Submodule ℂ CPoly := restrictTotalDegree (Fin 2) ℂ n

lemma D_mono {m n : ℕ} (h : m ≤ n) : D m ≤ D n := fun p hp => by
  rw [mem_restrictTotalDegree] at hp ⊢; exact hp.trans h

lemma X_mul_mem (i : Fin 2) {n : ℕ} {p : CPoly} (hp : p ∈ D n) : X i * p ∈ D (n + 1) := by
  rw [mem_restrictTotalDegree] at hp ⊢
  refine (totalDegree_mul _ _).trans ?_
  rw [totalDegree_X]; omega

lemma one_mem_D (n : ℕ) : (1 : CPoly) ∈ D n := by
  rw [mem_restrictTotalDegree, totalDegree_one]; exact Nat.zero_le _

lemma pderiv_monomial_mem (i : Fin 2) {n : ℕ} (s : Fin 2 →₀ ℕ) (a : ℂ)
    (hs : (s.sum fun _ e => e) ≤ n + 1) : pderiv i (monomial s a) ∈ D n := by
  rw [pderiv_monomial]
  by_cases h0 : s i = 0
  · simp [h0]
  rw [mem_restrictTotalDegree]
  refine (totalDegree_monomial_le _ _).trans ?_
  have hle : Finsupp.single i 1 ≤ s := by rw [Finsupp.single_le_iff]; omega
  have hsum : (s - Finsupp.single i 1).sum (fun _ e => e) + 1 = s.sum (fun _ e => e) := by
    conv_rhs => rw [← tsub_add_cancel_of_le hle]
    rw [Finsupp.sum_add_index' (h := fun _ e => e) (fun _ => rfl) (fun _ _ _ => rfl)]
    simp
  have h2 : ((s - Finsupp.single i 1).sum fun _ => id) = (s - Finsupp.single i 1).sum fun _ e => e := rfl
  omega

/-- **Derivatives lower the degree.** -/
lemma pderiv_mem (i : Fin 2) {n : ℕ} {p : CPoly} (hp : p ∈ D (n + 1)) : pderiv i p ∈ D n := by
  rw [p.as_sum, map_sum]
  refine Submodule.sum_mem _ fun s hs => pderiv_monomial_mem i s _ ?_
  rw [mem_restrictTotalDegree] at hp
  exact (le_totalDegree hs).trans hp

lemma A0_mem {n : ℕ} {p : CPoly} (hp : p ∈ D n) : A0 p ∈ D (n + 1) :=
  Submodule.sub_mem _ (X_mul_mem 0 hp) (D_mono (Nat.le_succ n) (pderiv_mem 1 (D_mono (Nat.le_succ n) hp)))

lemma A1_mem {n : ℕ} {p : CPoly} (hp : p ∈ D n) : A1 p ∈ D (n + 1) :=
  Submodule.sub_mem _ (X_mul_mem 1 hp) (D_mono (Nat.le_succ n) (pderiv_mem 0 (D_mono (Nat.le_succ n) hp)))

lemma H_mem (p q : ℕ) : H p q ∈ D (p + q) := by
  induction p with
  | zero =>
    induction q with
    | zero => exact one_mem_D 0
    | succ q ih => rw [H_zero_succ]; exact A1_mem ih
  | succ p ih =>
    rw [H_succ_left, show p + 1 + q = p + q + 1 by omega]; exact A0_mem ih

/-- **`H_{pq}` is `z^p z̄^q` plus lower degree.** -/
lemma H_sub_monomial_mem (p q : ℕ) (h : 1 ≤ p + q) : H p q - X 0 ^ p * X 1 ^ q ∈ D (p + q - 1) := by
  induction p with
  | zero =>
    induction q with
    | zero => omega
    | succ q ih =>
      rw [H_zero_succ, A1, zero_add, pow_zero, one_mul, pow_succ]
      rcases Nat.eq_zero_or_pos q with rfl | hq
      · simp only [H_zero_zero, mul_one, pow_zero, one_mul, sub_sub_cancel_left]
        rw [show (0 + (0 + 1) - 1 : ℕ) = 0 by rfl]
        refine Submodule.neg_mem _ (pderiv_mem 0 ?_)
        simpa using one_mem_D 1
      · have ih' := ih (by omega)
        rw [zero_add, pow_zero, one_mul] at ih'
        have e : X 1 * H 0 q - (pderiv 0) (H 0 q) - X 1 ^ q * X 1
            = X 1 * (H 0 q - X 1 ^ q) - pderiv 0 (H 0 q) := by ring
        rw [e, show q + 1 - 1 = (q - 1) + 1 by omega]
        refine Submodule.sub_mem _ (X_mul_mem 1 ih') (D_mono (m := q - 1) (by omega) (pderiv_mem 0 ?_))
        rw [show q - 1 + 1 = q by omega]; simpa using H_mem 0 q
  | succ p ih =>
    rw [H_succ_left, A0, pow_succ]
    rcases Nat.eq_zero_or_pos (p + q) with hpq | hpq
    · have hp0 : p = 0 := by omega
      have hq0 : q = 0 := by omega
      subst hp0 hq0
      simp only [H_zero_zero, mul_one, pow_zero, one_mul, sub_sub_cancel_left]
      refine Submodule.neg_mem _ (pderiv_mem 1 ?_)
      simpa using one_mem_D 1
    · have ih' := ih (by omega)
      have e : X 0 * H p q - (pderiv 1) (H p q) - X 0 ^ p * X 0 * X 1 ^ q
          = X 0 * (H p q - X 0 ^ p * X 1 ^ q) - pderiv 1 (H p q) := by ring
      rw [e, show p + 1 + q - 1 = (p + q - 1) + 1 by omega]
      refine Submodule.sub_mem _ (X_mul_mem 0 ih') (D_mono (m := p + q - 1) (by omega) (pderiv_mem 1 ?_))
      rw [show p + q - 1 + 1 = p + q by omega]; exact H_mem p q

/-- The span of the Hermite polynomials of degree `≤ n`. -/
def Hspan (n : ℕ) : Submodule ℂ CPoly := Submodule.span ℂ {f | ∃ p q, p + q ≤ n ∧ f = H p q}

lemma Hspan_mono {m n : ℕ} (h : m ≤ n) : Hspan m ≤ Hspan n :=
  Submodule.span_mono fun _ ⟨p, q, hpq, hf⟩ => ⟨p, q, hpq.trans h, hf⟩

lemma H_mem_Hspan {p q n : ℕ} (h : p + q ≤ n) : H p q ∈ Hspan n :=
  Submodule.subset_span ⟨p, q, h, rfl⟩

/-- **The Hermite polynomials of degree `≤ n` span the polynomials of degree `≤ n`.** -/
theorem D_le_span_H (n : ℕ) : D n ≤ Hspan n := by
  induction n using Nat.strong_induction_on with
  | _ n ih =>
    -- the monomials `z^a z̄^b`, `a + b ≤ n`, lie in the span
    have hmon : ∀ a b : ℕ, a + b ≤ n → (X 0 ^ a * X 1 ^ b : CPoly) ∈ Hspan n := by
      intro a b hab
      rcases Nat.eq_zero_or_pos (a + b) with h0 | h0
      · have ha : a = 0 := by omega
        have hb : b = 0 := by omega
        subst ha hb
        simpa [H_zero_zero] using H_mem_Hspan (p := 0) (q := 0) (Nat.zero_le n)
      · have hlow : H a b - X 0 ^ a * X 1 ^ b ∈ Hspan n :=
          Hspan_mono (by omega) (ih (a + b - 1) (by omega) (H_sub_monomial_mem a b h0))
        have e : (X 0 ^ a * X 1 ^ b : CPoly) = H a b - (H a b - X 0 ^ a * X 1 ^ b) := by ring
        rw [e]
        exact Submodule.sub_mem _ (H_mem_Hspan hab) hlow
    intro f hf
    rw [f.as_sum]
    refine Submodule.sum_mem _ fun s hs => ?_
    rw [mem_restrictTotalDegree] at hf
    have hdeg : s 0 + s 1 ≤ n := by
      have := (le_totalDegree hs).trans hf
      simpa [Finsupp.sum_fintype, Fin.sum_univ_two] using this
    rw [monomial_eq, Finsupp.prod_fintype _ _ (fun _ => pow_zero _), Fin.prod_univ_two, ← smul_eq_C_mul]
    exact Submodule.smul_mem _ _ (hmon _ _ hdeg)

end

end Grothe.UpperChaos
