import Grothe.LowerAnalytic.Fluctuation

/-!
# Hermite products of degree three are in the third chaos

`hermiteProd α = ∏ᵢ H_{αᵢ}(xᵢ)` with `H_n` the probabilists' Hermite polynomials.  From
`H_{n+1}' = (n+1) H_n` and the Hermite equation `H_n'' − x H_n' = −n H_n` one gets
`∂ⱼ H_α = αⱼ H_{α−eⱼ}` and `L H_α = −|α| H_α`; hence every real combination of the `H_α` with
`|α| = 3` satisfies `Chaos3` (`chaos3_hermite_sum`), and the fluctuation identity applies to it.
-/

namespace Grothe.LowerAnalytic

noncomputable section

section univariate

open Polynomial

lemma derivative_hermite_succ (n : ℕ) :
    derivative (hermite (n + 1)) = ((n : ℤ[X]) + 1) * hermite n := by
  induction n with
  | zero => simp [hermite_zero]
  | succ n ih =>
    rw [hermite_succ (n + 1), derivative_sub, derivative_mul, derivative_X, one_mul, ih,
      derivative_mul, show derivative ((n : ℤ[X]) + 1) = 0 by simp, zero_mul, zero_add,
      hermite_succ n]
    push_cast
    ring

/-- The Hermite equation. -/
lemma hermite_ode (n : ℕ) :
    derivative (derivative (hermite n)) - X * derivative (hermite n) = -(n : ℤ[X]) * hermite n := by
  cases n with
  | zero => simp [hermite_zero]
  | succ m =>
    rw [derivative_hermite_succ, derivative_mul, show derivative ((m : ℤ[X]) + 1) = 0 by simp,
      zero_mul, zero_add, hermite_succ m]
    push_cast
    ring

/-- The Hermite polynomials with real coefficients. -/
def hermiteR (n : ℕ) : ℝ[X] := (hermite n).map (Int.castRingHom ℝ)

lemma hermiteR_zero : hermiteR 0 = 1 := by simp [hermiteR, hermite_zero]

lemma derivative_hermiteR_succ (n : ℕ) :
    derivative (hermiteR (n + 1)) = ((n : ℝ[X]) + 1) * hermiteR n := by
  have h := congrArg (Polynomial.map (Int.castRingHom ℝ)) (derivative_hermite_succ n)
  simpa [hermiteR, derivative_map] using h

lemma hermiteR_ode (n : ℕ) :
    derivative (derivative (hermiteR n)) - X * derivative (hermiteR n)
      = -(n : ℝ[X]) * hermiteR n := by
  have h := congrArg (Polynomial.map (Int.castRingHom ℝ)) (hermite_ode n)
  simpa [hermiteR, derivative_map] using h

end univariate

open MvPolynomial

variable {ι : Type*}

/-- `H_n(xᵢ)`. -/
def hermiteVar (i : ι) (n : ℕ) : MvPolynomial ι ℝ := Polynomial.aeval (X i) (hermiteR n)

lemma pderiv_hermiteVar_self (i : ι) (n : ℕ) :
    pderiv i (hermiteVar i n) = Polynomial.aeval (X i) (Polynomial.derivative (hermiteR n)) := by
  unfold hermiteVar
  rw [Derivation.map_aeval, pderiv_X_self, smul_eq_mul, mul_one]

lemma pderiv_hermiteVar_of_ne {i j : ι} (h : i ≠ j) (n : ℕ) :
    pderiv j (hermiteVar i n) = 0 := by
  unfold hermiteVar
  rw [Derivation.map_aeval, pderiv_X_of_ne h, smul_zero]

lemma Chaos3.zero [Fintype ι] : Chaos3 (0 : MvPolynomial ι ℝ) where
  eig := by simp
  cubic _ _ _ := ⟨0, by simp⟩

lemma Chaos3.C_mul [Fintype ι] {F : MvPolynomial ι ℝ} (hF : Chaos3 F) (c : ℝ) :
    Chaos3 (C c * F) where
  eig := by
    rw [C_mul', map_smul, hF.eig]
    simp only [smul_eq_C_mul]
    ring
  cubic i j k := by
    obtain ⟨t, ht⟩ := hF.cubic i j k
    exact ⟨c * t, by rw [pderiv_C_mul, pderiv_C_mul, pderiv_C_mul, ht, map_mul]⟩

lemma Chaos3.sum [Fintype ι] {κ : Type*} (s : Finset κ) (f : κ → MvPolynomial ι ℝ)
    (h : ∀ k ∈ s, Chaos3 (f k)) : Chaos3 (∑ k ∈ s, f k) :=
  Finset.sum_induction f Chaos3 (fun _ _ ha hb => ha.add hb) Chaos3.zero h

variable [Fintype ι]

/-- The Hermite product `∏ᵢ H_{αᵢ}(xᵢ)`. -/
def hermiteProd (α : ι → ℕ) : MvPolynomial ι ℝ := ∏ i, hermiteVar i (α i)

variable [DecidableEq ι]

lemma pderiv_prod_erase (α : ι → ℕ) (j : ι) :
    pderiv j (∏ i ∈ Finset.univ.erase j, hermiteVar i (α i)) = 0 :=
  Finset.prod_induction _ (fun f => pderiv j f = 0)
    (fun f g hf hg => by rw [pderiv_mul, hf, hg, zero_mul, mul_zero, add_zero]) pderiv_one
    (fun i hi => pderiv_hermiteVar_of_ne (Finset.ne_of_mem_erase hi) _)

lemma hermiteProd_split (α : ι → ℕ) (j : ι) :
    hermiteProd α = hermiteVar j (α j) * ∏ i ∈ Finset.univ.erase j, hermiteVar i (α i) :=
  (Finset.mul_prod_erase _ _ (Finset.mem_univ j)).symm

/-- `∂ⱼ H_α = αⱼ H_{α − eⱼ}`. -/
lemma pderiv_hermiteProd (α : ι → ℕ) (j : ι) :
    pderiv j (hermiteProd α)
      = (α j : MvPolynomial ι ℝ) * hermiteProd (Function.update α j (α j - 1)) := by
  have hR : ∏ i ∈ Finset.univ.erase j, hermiteVar i (Function.update α j (α j - 1) i)
      = ∏ i ∈ Finset.univ.erase j, hermiteVar i (α i) :=
    Finset.prod_congr rfl fun i hi => by
      rw [Function.update_of_ne (Finset.ne_of_mem_erase hi)]
  rw [hermiteProd_split α j, hermiteProd_split (Function.update α j (α j - 1)) j, hR,
    Function.update_self, pderiv_mul, pderiv_prod_erase, mul_zero, add_zero,
    pderiv_hermiteVar_self]
  generalize α j = n
  cases n with
  | zero => simp [hermiteR_zero]
  | succ m =>
    rw [derivative_hermiteR_succ]
    simp only [hermiteVar, map_mul, map_add, map_natCast, map_one, Nat.add_sub_cancel,
      Nat.cast_add, Nat.cast_one]
    ring

/-- `L H_α = −|α| H_α`. -/
lemma ouL_hermiteProd (α : ι → ℕ) :
    ouL (hermiteProd α) = -((∑ i, α i : ℕ) : MvPolynomial ι ℝ) * hermiteProd α := by
  have each : ∀ j, pderiv j (pderiv j (hermiteProd α)) - X j * pderiv j (hermiteProd α)
      = -(α j : MvPolynomial ι ℝ) * hermiteProd α := by
    intro j
    have ode := congrArg (Polynomial.aeval (X j : MvPolynomial ι ℝ)) (hermiteR_ode (α j))
    simp only [map_sub, map_mul, Polynomial.aeval_X, map_neg, map_natCast] at ode
    rw [hermiteProd_split α j, pderiv_mul, pderiv_prod_erase, mul_zero, add_zero,
      pderiv_mul, pderiv_prod_erase, mul_zero, add_zero, pderiv_hermiteVar_self,
      Derivation.map_aeval, pderiv_X_self, smul_eq_mul, mul_one]
    unfold hermiteVar
    linear_combination
      (∏ i ∈ Finset.univ.erase j, Polynomial.aeval (X i) (hermiteR (α i))) * ode
  rw [ouL_apply, Finset.sum_congr rfl fun j _ => each j, ← Finset.sum_mul,
    Finset.sum_neg_distrib, Nat.cast_sum]

lemma pderiv_hermite_mem (m : ℕ) (G : MvPolynomial ι ℝ)
    (h : ∃ (c : ℝ) (β : ι → ℕ), (c = 0 ∨ ∑ i, β i = m + 1) ∧ G = C c * hermiteProd β) (j : ι) :
    ∃ (c : ℝ) (β : ι → ℕ), (c = 0 ∨ ∑ i, β i = m) ∧ pderiv j G = C c * hermiteProd β := by
  obtain ⟨c, β, hc, rfl⟩ := h
  refine ⟨c * β j, Function.update β j (β j - 1), ?_, ?_⟩
  · rcases hc with rfl | hs
    · left; simp
    · by_cases hβ : β j = 0
      · left; simp [hβ]
      · right
        have h1 := Finset.add_sum_erase Finset.univ β (Finset.mem_univ j)
        have h2 := Finset.add_sum_erase Finset.univ (Function.update β j (β j - 1))
          (Finset.mem_univ j)
        rw [Function.update_self] at h2
        have h3 : ∑ i ∈ Finset.univ.erase j, Function.update β j (β j - 1) i
            = ∑ i ∈ Finset.univ.erase j, β i :=
          Finset.sum_congr rfl fun i hi => by
            rw [Function.update_of_ne (Finset.ne_of_mem_erase hi)]
        omega
  · rw [pderiv_C_mul, pderiv_hermiteProd, C_mul, map_natCast]
    ring

/-- Hermite products of total degree three are in the third chaos. -/
theorem chaos3_hermiteProd (α : ι → ℕ) (hα : ∑ i, α i = 3) : Chaos3 (hermiteProd α) where
  eig := by
    rw [ouL_hermiteProd, hα]
    push_cast
    ring
  cubic i j k := by
    have h3 : ∃ (c : ℝ) (β : ι → ℕ), (c = 0 ∨ ∑ i, β i = 2 + 1)
        ∧ hermiteProd α = C c * hermiteProd β := ⟨1, α, Or.inr hα, by simp⟩
    obtain ⟨c, β, hc, h⟩ := pderiv_hermite_mem 0 _
      (pderiv_hermite_mem 1 _ (pderiv_hermite_mem 2 _ h3 k) j) i
    refine ⟨c, ?_⟩
    rw [h]
    rcases hc with rfl | hs
    · simp
    · have hβ : ∀ i, β i = 0 := fun i => Finset.sum_eq_zero_iff.mp hs i (Finset.mem_univ i)
      simp [hermiteProd, hermiteVar, hβ, hermiteR_zero]

/-- Real combinations of Hermite products of total degree three are in the third chaos. -/
theorem chaos3_hermite_sum (s : Finset (ι → ℕ)) (f : (ι → ℕ) → ℝ)
    (hs : ∀ α ∈ s, ∑ i, α i = 3) : Chaos3 (∑ α ∈ s, C (f α) * hermiteProd α) :=
  Chaos3.sum s _ fun α hα => (chaos3_hermiteProd α (hs α hα)).C_mul (f α)

end

end Grothe.LowerAnalytic
