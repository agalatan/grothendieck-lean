import Grothe.UpperChaos.ComplexHermite

/-!
# The complex Mehler formula for Hermite polynomials (U3 of PLAN_UPPER, one coordinate)

Let `X, W` be independent standard complex Gaussians, `|ρ| ≤ 1`, `σ = √(1 − |ρ|²)` and
`Y = ρX + σW`, a standard complex Gaussian with `E[conj(X) Y] = ρ`.  Then

    E[conj H_{pq}(X) · H_{rs}(Y)] = δ_{pr} δ_{qs} p! q! ρ^p ρ̄^q             (`integral_mehler`)

Proof: polynomials in `(x, x̄, w, w̄)` (`P4`) under the product measure satisfy the four complex
integration by parts rules (`E2_X0_mul` … `E2_X3_mul`, checked on monomials from
`E[z^a z̄^b] = δ_{ab} a!`).  With `F = conj f(X)`, `G = g(Y)` the chain rule gives
`∂_x G = ρ (∂_z g)(Y)`, `∂_{x̄} G = ρ̄ (∂_{z̄} g)(Y)`, so the creation operators satisfy
`M(A₀f, g) = ρ M(f, ∂_z g)`, `M(A₁f, g) = ρ̄ M(f, ∂_{z̄} g)` for `M(f, g) = E[conj f(X) g(Y)]`,
and `E[(A_i h)(Y)] = (|ρ|² + σ² − 1)(…) = 0`.  The induction is that of `ip_H`.
-/

open MeasureTheory ProbabilityTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-! ### The one-dimensional moments as a function -/

/-- `E[z^a z̄^b]`. -/
def mom (a b : ℕ) : ℂ := if a = b then (a.factorial : ℂ) else 0

lemma mom_succ_left (a b : ℕ) : mom (a + 1) b = b * mom a (b - 1) := by
  cases b with
  | zero => simp [mom]
  | succ k =>
    by_cases h : a = k
    · subst h; simp [mom, Nat.factorial_succ]
    · simp [mom, h]

lemma mom_succ_right (a b : ℕ) : mom a (b + 1) = a * mom (a - 1) b := by
  cases a with
  | zero => simp [mom]
  | succ k =>
    by_cases h : k = b
    · subst h; simp [mom, Nat.factorial_succ]
    · simp [mom, h]

/-! ### Polynomials in `(x, x̄, w, w̄)` under the product measure -/

/-- Polynomials in `x, x̄, w, w̄`. -/
abbrev P4 := MvPolynomial (Fin 4) ℂ

/-- The evaluation point `(x, x̄, w, w̄)`. -/
def wv (p : ℂ × ℂ) : Fin 4 → ℂ := ![p.1, conj p.1, p.2, conj p.2]

/-- `P(x, x̄, w, w̄)`. -/
def ev4 (p : ℂ × ℂ) (P : P4) : ℂ := eval (wv p) P

/-- Two independent standard complex Gaussians. -/
abbrev mu2 : Measure (ℂ × ℂ) := gaussC.prod gaussC

lemma ev4_monomial (p : ℂ × ℂ) (s : Fin 4 →₀ ℕ) (c : ℂ) :
    ev4 p (monomial s c) =
      c * ((p.1 ^ s 0 * conj p.1 ^ s 1) * (p.2 ^ s 2 * conj p.2 ^ s 3)) := by
  rw [ev4, eval_monomial, Finsupp.prod_fintype _ _ (fun i => pow_zero _), Fin.prod_univ_four]
  congr 1
  simp only [wv, Fin.isValue, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]
  ring

lemma integrable_ev4 (P : P4) : Integrable (fun p => ev4 p P) mu2 := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    simp_rw [ev4_monomial]
    exact ((integrable_monomial (s 0) (s 1)).mul_prod (integrable_monomial (s 2) (s 3))).const_mul c
  | add P Q hP hQ =>
    simp_rw [ev4, map_add]
    exact hP.add hQ

/-- The expectation of a polynomial in `x, x̄, w, w̄`. -/
def E2 : P4 →ₗ[ℂ] ℂ where
  toFun P := ∫ p, ev4 p P ∂mu2
  map_add' P Q := by
    simp_rw [ev4, map_add]; exact integral_add (integrable_ev4 P) (integrable_ev4 Q)
  map_smul' c P := by
    simp_rw [ev4, smul_eval, RingHom.id_apply, smul_eq_mul]
    exact integral_const_mul c _

lemma E2_apply (P : P4) : E2 P = ∫ p, ev4 p P ∂mu2 := rfl

lemma E2_monomial (s : Fin 4 →₀ ℕ) (c : ℂ) :
    E2 (monomial s c) = c * (mom (s 0) (s 1) * mom (s 2) (s 3)) := by
  rw [E2_apply]; simp_rw [ev4_monomial]
  rw [integral_const_mul, integral_prod_mul (f := fun z : ℂ => z ^ s 0 * conj z ^ s 1)
    (g := fun z : ℂ => z ^ s 2 * conj z ^ s 3), integral_moment, integral_moment]; rfl

lemma E2_one : E2 1 = 1 := by
  have : (1 : P4) = monomial 0 1 := rfl
  rw [this, E2_monomial]; simp [mom]

/-! ### Integration by parts on `(x, x̄, w, w̄)` -/

lemma single_add_apply (i j : Fin 4) (s : Fin 4 →₀ ℕ) :
    ((Finsupp.single i 1 + s : Fin 4 →₀ ℕ) : Fin 4 → ℕ) j = s j + if i = j then 1 else 0 := by
  simp [Finsupp.single_apply, add_comm]

lemma sub_single_apply (i j : Fin 4) (s : Fin 4 →₀ ℕ) :
    ((s - Finsupp.single i 1 : Fin 4 →₀ ℕ) : Fin 4 → ℕ) j = s j - if i = j then 1 else 0 := by
  simp [Finsupp.single_apply]

theorem E2_X0_mul (P : P4) : E2 (X 0 * P) = E2 (pderiv 1 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    rw [X, monomial_mul_monomial, one_mul, pderiv_monomial, E2_monomial, E2_monomial]
    simp only [single_add_apply, sub_single_apply]
    simp only [Fin.reduceEq, ↓reduceIte, add_zero, Nat.sub_zero, mom_succ_left]
    ring
  | add P Q hP hQ => simp only [mul_add, map_add, hP, hQ]

theorem E2_X1_mul (P : P4) : E2 (X 1 * P) = E2 (pderiv 0 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    rw [X, monomial_mul_monomial, one_mul, pderiv_monomial, E2_monomial, E2_monomial]
    simp only [single_add_apply, sub_single_apply]
    simp only [Fin.reduceEq, ↓reduceIte, add_zero, Nat.sub_zero, mom_succ_right]
    ring
  | add P Q hP hQ => simp only [mul_add, map_add, hP, hQ]

theorem E2_X2_mul (P : P4) : E2 (X 2 * P) = E2 (pderiv 3 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    rw [X, monomial_mul_monomial, one_mul, pderiv_monomial, E2_monomial, E2_monomial]
    simp only [single_add_apply, sub_single_apply]
    simp only [Fin.reduceEq, ↓reduceIte, add_zero, Nat.sub_zero, mom_succ_left]
    ring
  | add P Q hP hQ => simp only [mul_add, map_add, hP, hQ]

theorem E2_X3_mul (P : P4) : E2 (X 3 * P) = E2 (pderiv 2 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    rw [X, monomial_mul_monomial, one_mul, pderiv_monomial, E2_monomial, E2_monomial]
    simp only [single_add_apply, sub_single_apply]
    simp only [Fin.reduceEq, ↓reduceIte, add_zero, Nat.sub_zero, mom_succ_right]
    ring
  | add P Q hP hQ => simp only [mul_add, map_add, hP, hQ]

/-! ### Substitutions and the chain rule -/

/-- **The chain rule** for a substitution `z ↦ φ₀, z̄ ↦ φ₁`. -/
lemma pderiv_aeval (φ : Fin 2 → P4) (j : Fin 4) (g : CPoly) :
    pderiv j (aeval φ g) =
      aeval φ (pderiv 0 g) * pderiv j (φ 0) + aeval φ (pderiv 1 g) * pderiv j (φ 1) := by
  induction g using MvPolynomial.induction_on with
  | C a => simp
  | add P Q hP hQ => simp only [map_add, hP, hQ]; ring
  | mul_X P i hP =>
    simp only [map_mul, aeval_X, Derivation.leibniz, smul_eq_mul, map_add, hP]
    fin_cases i <;> simp [pderiv_X] <;> ring

/-- `f(X)`: `z ↦ x`, `z̄ ↦ x̄`. -/
def sX : CPoly →ₐ[ℂ] P4 := aeval ![X 0, X 1]

/-- `σ = √(1 − |ρ|²)`. -/
def sig (ρ : ℂ) : ℂ := ((√(1 - ‖ρ‖ ^ 2) : ℝ) : ℂ)

/-- `g(Y)`, `Y = ρx + σw`: `z ↦ ρx + σw`, `z̄ ↦ ρ̄x̄ + σw̄`. -/
def sY (ρ : ℂ) : CPoly →ₐ[ℂ] P4 :=
  aeval ![C ρ * X 0 + C (sig ρ) * X 2, C (conj ρ) * X 1 + C (sig ρ) * X 3]

lemma pderiv_sX (j : Fin 4) (h : CPoly) :
    pderiv j (sX h) = sX (pderiv 0 h) * pderiv j (X 0) + sX (pderiv 1 h) * pderiv j (X 1) := by
  rw [sX, pderiv_aeval]; rfl

lemma pderiv0_sX (h : CPoly) : pderiv 0 (sX h) = sX (pderiv 0 h) := by
  rw [pderiv_sX]; simp [pderiv_X]

lemma pderiv1_sX (h : CPoly) : pderiv 1 (sX h) = sX (pderiv 1 h) := by
  rw [pderiv_sX]; simp [pderiv_X]

lemma pderiv_sY (ρ : ℂ) (j : Fin 4) (g : CPoly) :
    pderiv j (sY ρ g) =
      sY ρ (pderiv 0 g) * pderiv j (C ρ * X 0 + C (sig ρ) * X 2)
        + sY ρ (pderiv 1 g) * pderiv j (C (conj ρ) * X 1 + C (sig ρ) * X 3) := by
  rw [sY, pderiv_aeval]; rfl

lemma pderiv0_sY (ρ : ℂ) (g : CPoly) : pderiv 0 (sY ρ g) = C ρ * sY ρ (pderiv 0 g) := by
  rw [pderiv_sY]; simp [pderiv_X, Derivation.leibniz]; ring

lemma pderiv1_sY (ρ : ℂ) (g : CPoly) : pderiv 1 (sY ρ g) = C (conj ρ) * sY ρ (pderiv 1 g) := by
  rw [pderiv_sY]; simp [pderiv_X, Derivation.leibniz]; ring

lemma pderiv2_sY (ρ : ℂ) (g : CPoly) : pderiv 2 (sY ρ g) = C (sig ρ) * sY ρ (pderiv 0 g) := by
  rw [pderiv_sY]; simp [pderiv_X, Derivation.leibniz]; ring

lemma pderiv3_sY (ρ : ℂ) (g : CPoly) : pderiv 3 (sY ρ g) = C (sig ρ) * sY ρ (pderiv 1 g) := by
  rw [pderiv_sY]; simp [pderiv_X, Derivation.leibniz]; ring

lemma E2_C_mul (a : ℂ) (P : P4) : E2 (C a * P) = a * E2 P := by
  rw [C_mul', map_smul, smul_eq_mul]

/-! ### The Mehler pairing -/

/-- `M(f, g) = E[conj f(X) · g(Y)]`. -/
def Mp (ρ : ℂ) (f g : CPoly) : ℂ := E2 (sX (conjP f) * sY ρ g)

lemma sX_conjP_A0 (f : CPoly) :
    sX (conjP (A0 f)) = X 1 * sX (conjP f) - pderiv 0 (sX (conjP f)) := by
  have h1 : conjP (pderiv 1 f) = pderiv 0 (conjP f) := by rw [pderiv_conjP]; simp
  rw [A0, map_sub, map_mul, conjP_X, h1, pderiv0_sX, map_sub, map_mul]
  simp [sX]

lemma sX_conjP_A1 (f : CPoly) :
    sX (conjP (A1 f)) = X 0 * sX (conjP f) - pderiv 1 (sX (conjP f)) := by
  have h1 : conjP (pderiv 0 f) = pderiv 1 (conjP f) := by rw [pderiv_conjP]; simp
  rw [A1, map_sub, map_mul, conjP_X, h1, pderiv1_sX, map_sub, map_mul]
  simp [sX]

theorem Mp_A0 (ρ : ℂ) (f g : CPoly) : Mp ρ (A0 f) g = ρ * Mp ρ f (pderiv 0 g) := by
  rw [Mp, Mp, sX_conjP_A0, sub_mul, map_sub, mul_assoc, E2_X1_mul, Derivation.leibniz, map_add,
    pderiv0_sY, smul_eq_mul, smul_eq_mul]
  rw [show sX (conjP f) * (C ρ * sY ρ (pderiv 0 g)) = C ρ * (sX (conjP f) * sY ρ (pderiv 0 g))
    by ring, E2_C_mul, mul_comm (sY ρ g)]
  ring

theorem Mp_A1 (ρ : ℂ) (f g : CPoly) : Mp ρ (A1 f) g = conj ρ * Mp ρ f (pderiv 1 g) := by
  rw [Mp, Mp, sX_conjP_A1, sub_mul, map_sub, mul_assoc, E2_X0_mul, Derivation.leibniz, map_add,
    pderiv1_sY, smul_eq_mul, smul_eq_mul]
  rw [show sX (conjP f) * (C (conj ρ) * sY ρ (pderiv 1 g))
      = C (conj ρ) * (sX (conjP f) * sY ρ (pderiv 1 g)) by ring, E2_C_mul, mul_comm (sY ρ g)]
  ring

lemma sig_sq {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) : sig ρ * sig ρ = 1 - ρ * conj ρ := by
  rw [sig, ← Complex.ofReal_mul, Real.mul_self_sqrt (by nlinarith [norm_nonneg ρ]),
    Complex.mul_conj, Complex.normSq_eq_norm_sq]
  push_cast; ring

lemma E2_sY_A0 {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (h : CPoly) : E2 (sY ρ (A0 h)) = 0 := by
  have hx : sY ρ (X 0) = C ρ * X 0 + C (sig ρ) * X 2 := by simp [sY]
  rw [A0, map_sub, map_mul, hx, add_mul, mul_assoc, mul_assoc, map_sub, map_add, E2_C_mul,
    E2_C_mul, E2_X0_mul, E2_X2_mul, pderiv1_sY, pderiv3_sY, E2_C_mul, E2_C_mul]
  linear_combination (E2 (sY ρ (pderiv 1 h))) * sig_sq hρ

lemma E2_sY_A1 {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (h : CPoly) : E2 (sY ρ (A1 h)) = 0 := by
  have hx : sY ρ (X 1) = C (conj ρ) * X 1 + C (sig ρ) * X 3 := by simp [sY]
  rw [A1, map_sub, map_mul, hx, add_mul, mul_assoc, mul_assoc, map_sub, map_add, E2_C_mul,
    E2_C_mul, E2_X1_mul, E2_X3_mul, pderiv0_sY, pderiv2_sY, E2_C_mul, E2_C_mul]
  linear_combination (E2 (sY ρ (pderiv 0 h))) * sig_sq hρ

lemma E2_sY_H {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (r s : ℕ) :
    E2 (sY ρ (H r s)) = if r = 0 ∧ s = 0 then 1 else 0 := by
  cases r with
  | succ r => rw [H_succ_left, E2_sY_A0 hρ]; simp
  | zero =>
    cases s with
    | zero => rw [H_zero_zero, map_one, E2_one]; simp
    | succ s => rw [H_zero_succ, E2_sY_A1 hρ]; simp

lemma Mp_zero (ρ : ℂ) (f : CPoly) : Mp ρ f 0 = 0 := by simp [Mp]

lemma Mp_nsmul (ρ : ℂ) (f g : CPoly) (n : ℕ) : Mp ρ f (n • g) = n * Mp ρ f g := by
  rw [Mp, Mp, map_nsmul, mul_smul_comm, map_nsmul, nsmul_eq_mul]

/-- **The complex Mehler formula** (algebraic form). -/
theorem Mp_H {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (p q r s : ℕ) :
    Mp ρ (H p q) (H r s) =
      if p = r ∧ q = s then ((p.factorial * q.factorial : ℕ) : ℂ) * ρ ^ p * conj ρ ^ q else 0 := by
  induction p generalizing r with
  | succ p ih =>
    rw [H_succ_left, Mp_A0]
    cases r with
    | zero => rw [pderiv0_H_zero, Mp_zero]; simp
    | succ r =>
      rw [pderiv0_H_succ, Mp_nsmul, ih]
      by_cases h : p = r ∧ q = s
      · obtain ⟨rfl, rfl⟩ := h; simp [Nat.factorial_succ]; ring
      · simp [h]
  | zero =>
    induction q generalizing r s with
    | succ q ih =>
      rw [H_zero_succ, Mp_A1]
      cases s with
      | zero => rw [pderiv1_H_zero, Mp_zero]; simp
      | succ s =>
        rw [pderiv1_H_succ, Mp_nsmul, ih]
        by_cases h : 0 = r ∧ q = s
        · obtain ⟨rfl, rfl⟩ := h; simp [Nat.factorial_succ]; ring
        · simp [h]
    | zero =>
      rw [H_zero_zero, Mp, map_one, map_one, one_mul, E2_sY_H hρ]
      by_cases h : r = 0 ∧ s = 0
      · obtain ⟨rfl, rfl⟩ := h; simp
      · have h' : ¬(0 = r ∧ 0 = s) := by omega
        simp [h, h']

/-! ### The analytic statement -/

lemma ev4_sX (u : ℂ × ℂ) (f : CPoly) : ev4 u (sX f) = ev u.1 f := by
  induction f using MvPolynomial.induction_on with
  | C a => simp [ev4, ev, sX]
  | add P Q hP hQ => simp only [map_add, ev4, ev] at *; rw [hP, hQ]
  | mul_X P i hP =>
    simp only [map_mul, ev4, ev] at *
    rw [hP]
    fin_cases i <;> simp [sX, wv, zv]

lemma ev4_sY (ρ : ℂ) (u : ℂ × ℂ) (g : CPoly) :
    ev4 u (sY ρ g) = ev (ρ * u.1 + sig ρ * u.2) g := by
  induction g using MvPolynomial.induction_on with
  | C a => simp [ev4, ev, sY]
  | add P Q hP hQ => simp only [map_add, ev4, ev] at *; rw [hP, hQ]
  | mul_X P i hP =>
    simp only [map_mul, ev4, ev] at *
    rw [hP]
    fin_cases i <;> simp [sY, wv, zv, sig, Complex.conj_ofReal]

/-- **The complex Mehler formula**: for independent standard complex Gaussians `x, w`, `|ρ| ≤ 1`
and `y = ρx + √(1 − |ρ|²) w`, `E[conj H_{pq}(x) · H_{rs}(y)] = δ_{pr} δ_{qs} p! q! ρ^p ρ̄^q`. -/
theorem integral_mehler {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (p q r s : ℕ) :
    ∫ u, conj (ev u.1 (H p q)) * ev (ρ * u.1 + sig ρ * u.2) (H r s) ∂mu2 =
      if p = r ∧ q = s then ((p.factorial * q.factorial : ℕ) : ℂ) * ρ ^ p * conj ρ ^ q else 0 := by
  rw [← Mp_H hρ, Mp, E2_apply]
  refine integral_congr_ae (Filter.Eventually.of_forall fun u => ?_)
  show conj (ev u.1 (H p q)) * ev (ρ * u.1 + sig ρ * u.2) (H r s)
    = eval (wv u) (sX (conjP (H p q)) * sY ρ (H r s))
  rw [map_mul, ← ev4, ← ev4, ev4_sX, ev4_sY, ev_conjP]

end

end Grothe.UpperChaos
