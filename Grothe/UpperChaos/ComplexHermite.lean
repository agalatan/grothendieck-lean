import Grothe.UpperChaos.ComplexMoments

/-!
# Complex Hermite polynomials are orthogonal in `L²(gaussC)` (U1 of PLAN_UPPER)

Polynomials in `z, z̄` are `MvPolynomial (Fin 2) ℂ` (`X 0 = z`, `X 1 = z̄`), evaluated by
`ev z P = P(z, z̄)`.  The Gaussian expectation `Ef P = E[P(z, z̄)]` satisfies the complex
integration by parts

    E[z P] = E[∂_{z̄} P],   E[z̄ P] = E[∂_z P]                 (`Ef_X0_mul`, `Ef_X1_mul`)

(checked on monomials with `E[z^a z̄^b] = δ_{ab} a!`).  The creation operators
`A₀ f = z f − ∂_{z̄} f`, `A₁ f = z̄ f − ∂_z f` are adjoint to `∂_z`, `∂_{z̄}` for the pairing
`⟪f, g⟫ = E[conj(f) g]` (`ip_A0`, `ip_A1`), and the complex Hermite polynomials
`H_{pq} = A₀^p A₁^q 1` satisfy `∂_z H_{pq} = p H_{p−1,q}`, `∂_{z̄} H_{pq} = q H_{p,q−1}`.  Hence

    E[conj H_{pq}(z) · H_{rs}(z)] = δ_{pr} δ_{qs} p! q!            (`integral_hermite`)

so `h_{pq} = H_{pq}/√(p! q!)` is an orthonormal family in `L²(gaussC)`.
-/

open MeasureTheory ProbabilityTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- Polynomials in `z, z̄`. -/
abbrev CPoly := MvPolynomial (Fin 2) ℂ

/-- The evaluation point `(z, z̄)`. -/
def zv (z : ℂ) : Fin 2 → ℂ := ![z, conj z]

/-- `P(z, z̄)`. -/
def ev (z : ℂ) (P : CPoly) : ℂ := eval (zv z) P

lemma ev_monomial (z : ℂ) (s : Fin 2 →₀ ℕ) (c : ℂ) :
    ev z (monomial s c) = c * (z ^ s 0 * conj z ^ s 1) := by
  simp [ev, eval_monomial, Finsupp.prod_fintype, Fin.prod_univ_two, zv]

lemma continuous_ev (P : CPoly) : Continuous fun z => ev z P := by
  unfold ev zv
  exact (MvPolynomial.continuous_eval P).comp (by
    refine continuous_pi fun i => ?_
    fin_cases i <;> simp <;> fun_prop)

lemma integrable_ev (P : CPoly) : Integrable (fun z => ev z P) gaussC := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    simp_rw [ev_monomial]
    exact (integrable_monomial (s 0) (s 1)).const_mul c
  | add P Q hP hQ =>
    simp_rw [ev, map_add]
    exact hP.add hQ

/-- **The Gaussian expectation of a polynomial in `z, z̄`.** -/
def Ef : CPoly →ₗ[ℂ] ℂ where
  toFun P := ∫ z, ev z P ∂gaussC
  map_add' P Q := by simp_rw [ev, map_add]; exact integral_add (integrable_ev P) (integrable_ev Q)
  map_smul' c P := by
    simp_rw [ev, smul_eval, RingHom.id_apply, smul_eq_mul]
    exact integral_const_mul c _

lemma Ef_apply (P : CPoly) : Ef P = ∫ z, ev z P ∂gaussC := rfl

lemma Ef_monomial (s : Fin 2 →₀ ℕ) (c : ℂ) :
    Ef (monomial s c) = c * if s 0 = s 1 then ((s 0).factorial : ℂ) else 0 := by
  rw [Ef_apply]; simp_rw [ev_monomial]
  rw [integral_const_mul, integral_moment]

lemma Ef_one : Ef 1 = 1 := by
  have : (1 : CPoly) = monomial 0 1 := rfl
  rw [this, Ef_monomial]; simp

/-! ### Integration by parts -/

/-- **`E[z P] = E[∂_{z̄} P]`.** -/
theorem Ef_X0_mul (P : CPoly) : Ef (X 0 * P) = Ef (pderiv 1 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    rw [X, monomial_mul_monomial, one_mul, pderiv_monomial, Ef_monomial, Ef_monomial]
    have e0 : ((Finsupp.single 0 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 0 = s 0 + 1 := by simp [add_comm]
    have e1 : ((Finsupp.single 0 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 1 = s 1 := by simp
    have f0 : ((s - Finsupp.single 1 1 : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 0 = s 0 := by simp
    have f1 : ((s - Finsupp.single 1 1 : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 1 = s 1 - 1 := by simp
    rw [e0, e1, f0, f1]
    generalize s 0 = a
    generalize s 1 = b
    cases b with
    | zero => simp
    | succ k =>
      by_cases h : a = k
      · subst h; simp [Nat.factorial_succ]; ring
      · simp [h]
  | add P Q hP hQ => simp only [mul_add, map_add, hP, hQ]

/-- **`E[z̄ P] = E[∂_z P]`.** -/
theorem Ef_X1_mul (P : CPoly) : Ef (X 1 * P) = Ef (pderiv 0 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    rw [X, monomial_mul_monomial, one_mul, pderiv_monomial, Ef_monomial, Ef_monomial]
    have e0 : ((Finsupp.single 1 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 0 = s 0 := by simp
    have e1 : ((Finsupp.single 1 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 1 = s 1 + 1 := by simp [add_comm]
    have f0 : ((s - Finsupp.single 0 1 : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 0 = s 0 - 1 := by simp
    have f1 : ((s - Finsupp.single 0 1 : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 1 = s 1 := by simp
    rw [e0, e1, f0, f1]
    generalize s 1 = b
    generalize s 0 = a
    cases a with
    | zero => simp
    | succ k =>
      by_cases h : k = b
      · subst h; simp [Nat.factorial_succ]; ring
      · simp [h]
  | add P Q hP hQ => simp only [mul_add, map_add, hP, hQ]

/-! ### Conjugation -/

/-- `conj` on polynomials: swap `z ↔ z̄` and conjugate the coefficients. -/
def conjP : CPoly →+* CPoly :=
  (MvPolynomial.map (starRingEnd ℂ)).comp (rename (Equiv.swap (0 : Fin 2) 1)).toRingHom

lemma conjP_X (i : Fin 2) : conjP (X i) = X (Equiv.swap (0 : Fin 2) 1 i) := by
  simp [conjP]

lemma conjP_C (a : ℂ) : conjP (C a) = C (conj a) := by simp [conjP]

lemma ev_conjP (z : ℂ) (P : CPoly) : ev z (conjP P) = conj (ev z P) := by
  induction P using MvPolynomial.induction_on with
  | C a => simp [conjP_C, ev]
  | add P Q hP hQ => simp [ev, map_add] at *; rw [hP, hQ]
  | mul_X P i hP =>
    rw [map_mul, conjP_X]
    simp only [ev, map_mul, eval_X] at *
    rw [hP]
    fin_cases i <;> simp [zv]

lemma pderiv_comm (P : CPoly) : pderiv 0 (pderiv 1 P) = pderiv 1 (pderiv 0 P) := by
  induction P using MvPolynomial.induction_on with
  | C a => simp
  | add P Q hP hQ => simp [hP, hQ]
  | mul_X P k hP =>
    fin_cases k <;> simp [Derivation.leibniz, pderiv_X, hP] <;> ring

lemma pderiv_conjP (i : Fin 2) (P : CPoly) :
    pderiv i (conjP P) = conjP (pderiv (Equiv.swap (0 : Fin 2) 1 i) P) := by
  induction P using MvPolynomial.induction_on with
  | C a => simp [conjP_C]
  | add P Q hP hQ => simp [hP, hQ]
  | mul_X P k hP =>
    simp only [map_mul, conjP_X, Derivation.leibniz, smul_eq_mul, map_add, hP]
    fin_cases i <;> fin_cases k <;> simp [pderiv_X]

/-! ### The pairing and the creation operators -/

/-- `⟪f, g⟫ = E[conj(f) g]`. -/
def ip (f g : CPoly) : ℂ := Ef (conjP f * g)

lemma ip_eq_integral (f g : CPoly) :
    ip f g = ∫ z, conj (ev z f) * ev z g ∂gaussC := by
  rw [ip, Ef_apply]
  refine integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)
  show eval (zv z) (conjP f * g) = conj (ev z f) * ev z g
  rw [map_mul, ← ev_conjP]; rfl

/-- `A₀ f = z f − ∂_{z̄} f`. -/
def A0 (f : CPoly) : CPoly := X 0 * f - pderiv 1 f

/-- `A₁ f = z̄ f − ∂_z f`. -/
def A1 (f : CPoly) : CPoly := X 1 * f - pderiv 0 f

lemma A0_smul (n : ℕ) (f : CPoly) : A0 (n • f) = n • A0 f := by
  simp [A0, nsmul_eq_mul, mul_sub]; ring

lemma A1_smul (n : ℕ) (f : CPoly) : A1 (n • f) = n • A1 f := by
  simp [A1, nsmul_eq_mul, mul_sub]; ring

lemma Ef_A0 (f : CPoly) : Ef (A0 f) = 0 := by rw [A0, map_sub, Ef_X0_mul, sub_self]

lemma Ef_A1 (f : CPoly) : Ef (A1 f) = 0 := by rw [A1, map_sub, Ef_X1_mul, sub_self]

/-- **Adjointness**: `⟪A₀ f, g⟫ = ⟪f, ∂_z g⟫`. -/
theorem ip_A0 (f g : CPoly) : ip (A0 f) g = ip f (pderiv 0 g) := by
  have hc : conjP (A0 f) = X 1 * conjP f - pderiv 0 (conjP f) := by
    rw [A0, map_sub, map_mul, conjP_X, pderiv_conjP]; rfl
  rw [ip, ip, hc, sub_mul, map_sub, mul_assoc, Ef_X1_mul, Derivation.leibniz, map_add]
  simp [smul_eq_mul, mul_comm]

/-- **Adjointness**: `⟪A₁ f, g⟫ = ⟪f, ∂_{z̄} g⟫`. -/
theorem ip_A1 (f g : CPoly) : ip (A1 f) g = ip f (pderiv 1 g) := by
  have hc : conjP (A1 f) = X 0 * conjP f - pderiv 1 (conjP f) := by
    rw [A1, map_sub, map_mul, conjP_X, pderiv_conjP]; rfl
  rw [ip, ip, hc, sub_mul, map_sub, mul_assoc, Ef_X0_mul, Derivation.leibniz, map_add]
  simp [smul_eq_mul, mul_comm]

lemma pderiv0_A0 (f : CPoly) : pderiv 0 (A0 f) = f + A0 (pderiv 0 f) := by
  simp [A0, Derivation.leibniz, pderiv_X, pderiv_comm]; ring

lemma pderiv0_A1 (f : CPoly) : pderiv 0 (A1 f) = A1 (pderiv 0 f) := by
  simp [A1, Derivation.leibniz, pderiv_X]

lemma pderiv1_A0 (f : CPoly) : pderiv 1 (A0 f) = A0 (pderiv 1 f) := by
  simp [A0, Derivation.leibniz, pderiv_X]

lemma pderiv1_A1 (f : CPoly) : pderiv 1 (A1 f) = f + A1 (pderiv 1 f) := by
  simp [A1, Derivation.leibniz, pderiv_X, ← pderiv_comm]; ring

/-! ### The Hermite polynomials -/

/-- **The complex Hermite polynomial** `H_{pq} = A₀^p A₁^q 1`. -/
def H (p q : ℕ) : CPoly := A0^[p] (A1^[q] 1)

lemma H_succ_left (p q : ℕ) : H (p + 1) q = A0 (H p q) := by
  simp [H, Function.iterate_succ_apply']

lemma H_zero_succ (q : ℕ) : H 0 (q + 1) = A1 (H 0 q) := by
  simp [H, Function.iterate_succ_apply']

lemma H_zero_zero : H 0 0 = 1 := rfl

lemma pderiv0_A1_iter (q : ℕ) : pderiv 0 (A1^[q] 1) = 0 := by
  induction q with
  | zero => simp
  | succ q ih =>
    rw [Function.iterate_succ_apply', pderiv0_A1, ih]; simp [A1]

lemma pderiv1_A1_iter (q : ℕ) : pderiv 1 (A1^[q + 1] 1) = (q + 1) • A1^[q] 1 := by
  induction q with
  | zero => simp [A1, pderiv_X]
  | succ q ih =>
    rw [Function.iterate_succ_apply', pderiv1_A1, ih, A1_smul, ← Function.iterate_succ_apply' A1]
    simp only [add_smul, one_smul]; abel

/-- `∂_z H_{0,q} = 0` and `∂_z H_{p+1,q} = (p+1) H_{pq}`. -/
lemma pderiv0_H_zero (q : ℕ) : pderiv 0 (H 0 q) = 0 := pderiv0_A1_iter q

lemma pderiv0_H_succ (p q : ℕ) : pderiv 0 (H (p + 1) q) = (p + 1) • H p q := by
  induction p with
  | zero => rw [H_succ_left, pderiv0_A0, pderiv0_H_zero]; simp [A0]
  | succ p ih =>
    rw [H_succ_left, pderiv0_A0, ih, A0_smul, ← H_succ_left]
    simp only [add_smul, one_smul]; abel

lemma pderiv1_H (p q : ℕ) : pderiv 1 (H p q) = A0^[p] (pderiv 1 (A1^[q] 1)) := by
  induction p with
  | zero => rfl
  | succ p ih =>
    rw [H_succ_left, pderiv1_A0, ih, Function.iterate_succ_apply']

lemma A0_iter_smul (p n : ℕ) (f : CPoly) : A0^[p] (n • f) = n • A0^[p] f := by
  induction p with
  | zero => rfl
  | succ p ih => rw [Function.iterate_succ_apply', Function.iterate_succ_apply', ih, A0_smul]

lemma A0_iter_zero (p : ℕ) : A0^[p] (0 : CPoly) = 0 := by
  induction p with
  | zero => rfl
  | succ p ih => rw [Function.iterate_succ_apply', ih]; simp [A0]

lemma pderiv1_H_zero (p : ℕ) : pderiv 1 (H p 0) = 0 := by
  rw [pderiv1_H]; simp [A0_iter_zero]

lemma pderiv1_H_succ (p q : ℕ) : pderiv 1 (H p (q + 1)) = (q + 1) • H p q := by
  rw [pderiv1_H, pderiv1_A1_iter, A0_iter_smul]; rfl

lemma ip_zero (f : CPoly) : ip f 0 = 0 := by simp [ip]

lemma ip_nsmul (f g : CPoly) (n : ℕ) : ip f (n • g) = n * ip f g := by
  rw [ip, ip, mul_smul_comm, map_nsmul, nsmul_eq_mul]

lemma Ef_H (r s : ℕ) : Ef (H r s) = if r = 0 ∧ s = 0 then 1 else 0 := by
  cases r with
  | succ r => rw [H_succ_left, Ef_A0]; simp
  | zero =>
    cases s with
    | zero => rw [H_zero_zero, Ef_one]; simp
    | succ s => rw [H_zero_succ, Ef_A1]; simp

/-- **Orthogonality of the complex Hermite polynomials** (algebraic form). -/
theorem ip_H (p q r s : ℕ) :
    ip (H p q) (H r s) = if p = r ∧ q = s then ((p.factorial * q.factorial : ℕ) : ℂ) else 0 := by
  induction p generalizing r with
  | succ p ih =>
    rw [H_succ_left, ip_A0]
    cases r with
    | zero => rw [pderiv0_H_zero, ip_zero]; simp
    | succ r =>
      rw [pderiv0_H_succ, ip_nsmul, ih]
      by_cases h : p = r ∧ q = s
      · obtain ⟨rfl, rfl⟩ := h; simp [Nat.factorial_succ]; ring
      · simp [h]
  | zero =>
    induction q generalizing r s with
    | succ q ih =>
      rw [H_zero_succ, ip_A1]
      cases s with
      | zero => rw [pderiv1_H_zero, ip_zero]; simp
      | succ s =>
        rw [pderiv1_H_succ, ip_nsmul, ih]
        by_cases h : 0 = r ∧ q = s
        · obtain ⟨rfl, rfl⟩ := h; simp [Nat.factorial_succ]
        · simp [h]
    | zero =>
      rw [H_zero_zero, ip, map_one, one_mul, Ef_H]
      by_cases h : r = 0 ∧ s = 0
      · obtain ⟨rfl, rfl⟩ := h; simp
      · have h' : ¬(0 = r ∧ 0 = s) := by omega
        simp [h, h']

/-- **Orthogonality of the complex Hermite polynomials in `L²(gaussC)`**:
`E[conj H_{pq}(z) · H_{rs}(z)] = δ_{pr} δ_{qs} p! q!`. -/
theorem integral_hermite (p q r s : ℕ) :
    ∫ z, conj (ev z (H p q)) * ev z (H r s) ∂gaussC
      = if p = r ∧ q = s then ((p.factorial * q.factorial : ℕ) : ℂ) else 0 := by
  rw [← ip_eq_integral, ip_H]

end

end Grothe.UpperChaos
