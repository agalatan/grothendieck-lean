import Grothe.LowerAnalytic.WickCubic
import Grothe.LowerAnalytic.Bridge

/-!
# The Wick cubics as circular third-chaos polynomials

The real and imaginary parts `reW a b c`, `imW a b c` of the Wick cubic
`z_a z_b z̄_c − 2δ_ac z_b − 2δ_bc z_a` (as real polynomials in the `n + n` real coordinates) are in
the third chaos (`chaos3_reW`, `chaos3_imW`: OU eigenvalue `−3`, constant third derivatives), and
they form a circular pair for the standard complex structure `Jstd` of `ℂⁿ`
(`rotD_reW : D_J Re W = −Im W`, `rotD_imW : D_J Im W = Re W`).  With the closure lemmas
(`Chaos3.const_mul`, `Chaos3.finset_sum`, `rotD_finset_sum`) this transports to every element of
`H₂,₁` (in `WitnessCap.lean`).
-/

namespace Grothe.LowerAnalytic

open MeasureTheory MvPolynomial Grothe.Lower
open scoped ComplexConjugate

noncomputable section

variable (n : ℕ)

/-- The real coordinate polynomial `x_l`. -/
abbrev xP (l : Fin n) : MvPolynomial (Fin (n + n)) ℝ := X (Fin.castAdd n l)

/-- The real coordinate polynomial `y_l`. -/
abbrev yP (l : Fin n) : MvPolynomial (Fin (n + n)) ℝ := X (Fin.natAdd n l)

/-- The real part of the Wick cubic `z_a z_b z̄_c − 2δ_ac z_b − 2δ_bc z_a` as a polynomial. -/
def reW (a b c : Fin n) : MvPolynomial (Fin (n + n)) ℝ :=
  xP n a * xP n b * xP n c - yP n a * yP n b * xP n c + xP n a * yP n b * yP n c
    + yP n a * xP n b * yP n c - C (if a = c then 2 else 0) * xP n b
    - C (if b = c then 2 else 0) * xP n a

/-- The imaginary part of the Wick cubic as a polynomial. -/
def imW (a b c : Fin n) : MvPolynomial (Fin (n + n)) ℝ :=
  xP n a * yP n b * xP n c + yP n a * xP n b * xP n c - xP n a * xP n b * yP n c
    + yP n a * yP n b * yP n c - C (if a = c then 2 else 0) * yP n b
    - C (if b = c then 2 else 0) * yP n a

lemma eval_reW (a b c : Fin n) (x : Fin (n + n) → ℝ) :
    eval x (reW n a b c)
      = (wc n a b c x - (if a = c then 2 else 0) * zc n b x
          - (if b = c then 2 else 0) * zc n a x).re := by
  simp [reW, wc, zc, Complex.mul_re, Complex.mul_im]
  split_ifs <;> simp [Complex.mul_re] <;> ring

lemma eval_imW (a b c : Fin n) (x : Fin (n + n) → ℝ) :
    eval x (imW n a b c)
      = (wc n a b c x - (if a = c then 2 else 0) * zc n b x
          - (if b = c then 2 else 0) * zc n a x).im := by
  simp [imW, wc, zc, Complex.mul_re, Complex.mul_im]
  split_ifs <;> simp [Complex.mul_im] <;> ring

/-! ### The generator on monomials -/

section ou
variable {ι : Type*} [DecidableEq ι]

lemma pderiv_X' (i j : ι) : pderiv i (X j : MvPolynomial ι ℝ) = C (if j = i then 1 else 0) := by
  rw [pderiv_X, Pi.single_apply]; split_ifs <;> simp

variable [Fintype ι]

lemma gam_X (i j : ι) : gam (X i : MvPolynomial ι ℝ) (X j) = C (if i = j then 1 else 0) := by
  simp only [gam, pderiv_X']
  split_ifs with h
  · subst h; simp
  · rw [map_zero]; apply Finset.sum_eq_zero; intro k _
    split_ifs with h1 h2 <;> simp_all

lemma ouL_X (i : ι) : ouL (X i : MvPolynomial ι ℝ) = -X i := by
  simp only [ouL_apply, pderiv_X', pderiv_C, zero_sub, Finset.sum_neg_distrib]
  rw [Finset.sum_eq_single i]
  · simp
  · intro j _ hj; simp [Ne.symm hj]
  · simp

lemma ouL_cub (p q r : ι) :
    ouL (X p * X q * X r : MvPolynomial ι ℝ)
      = -(3 * (X p * X q * X r)) + 2 * (C (if p = q then 1 else 0) * X r
        + C (if p = r then 1 else 0) * X q + C (if q = r then 1 else 0) * X p) := by
  rw [ouL_mul, ouL_mul, gam_mul_left, ouL_X, ouL_X, ouL_X, gam_X, gam_X, gam_X]
  ring

end ou

/-- Rewriting the Kronecker deltas of real coordinates in terms of complex indices. -/
lemma delta_LL (a b : Fin n) :
    (C (if Fin.castAdd n a = Fin.castAdd n b then (1 : ℝ) else 0) : MvPolynomial (Fin (n + n)) ℝ)
      = C (if a = b then 1 else 0) := by simp only [castAdd_inj_iff]
lemma delta_RR (a b : Fin n) :
    (C (if Fin.natAdd n a = Fin.natAdd n b then (1 : ℝ) else 0) : MvPolynomial (Fin (n + n)) ℝ)
      = C (if a = b then 1 else 0) := by simp only [natAdd_inj_iff]
lemma delta_LR (a b : Fin n) :
    (C (if Fin.castAdd n a = Fin.natAdd n b then (1 : ℝ) else 0) : MvPolynomial (Fin (n + n)) ℝ)
      = 0 := by simp only [castAdd_ne_natAdd, ite_false, map_zero]
lemma delta_RL (a b : Fin n) :
    (C (if Fin.natAdd n a = Fin.castAdd n b then (1 : ℝ) else 0) : MvPolynomial (Fin (n + n)) ℝ)
      = 0 := by simp only [(castAdd_ne_natAdd n b a).symm, ite_false, map_zero]

lemma ouL_reW (a b c : Fin n) : ouL (reW n a b c) = -(3 * reW n a b c) := by
  unfold reW
  simp only [map_sub, map_add, ouL_cub, ouL_C_mul, ouL_X, delta_LL, delta_RR, delta_LR, delta_RL]
  rcases eq_or_ne a b with h1 | h1 <;> rcases eq_or_ne a c with h2 | h2 <;>
    rcases eq_or_ne b c with h3 | h3
  all_goals first
    | exact absurd (h1.symm.trans h2) h3
    | exact absurd (h1.trans h3) h2
    | exact absurd (h2.trans h3.symm) h1
    | (simp only [h1, h2, h3, ite_true, ite_false, map_zero, map_one, map_ofNat, mul_zero,
        zero_mul, add_zero, sub_zero, zero_add]; ring)

lemma ouL_imW (a b c : Fin n) : ouL (imW n a b c) = -(3 * imW n a b c) := by
  unfold imW
  simp only [map_sub, map_add, ouL_cub, ouL_C_mul, ouL_X, delta_LL, delta_RR, delta_LR, delta_RL]
  rcases eq_or_ne a b with h1 | h1 <;> rcases eq_or_ne a c with h2 | h2 <;>
    rcases eq_or_ne b c with h3 | h3
  all_goals first
    | exact absurd (h1.symm.trans h2) h3
    | exact absurd (h1.trans h3) h2
    | exact absurd (h2.trans h3.symm) h1
    | (simp only [h1, h2, h3, ite_true, ite_false, map_zero, map_one, map_ofNat, mul_zero,
        zero_mul, add_zero, sub_zero, zero_add]; ring)

/-! ### Third derivatives of cubics are constants -/

lemma third_cub {ι : Type*} [DecidableEq ι] (p q r i j k : ι) :
    ∃ t : ℝ, pderiv i (pderiv j (pderiv k (X p * X q * X r : MvPolynomial ι ℝ))) = C t := by
  simp only [map_add, pderiv_mul, pderiv_X', pderiv_C, pderiv_C_mul, mul_zero, zero_mul, add_zero,
    zero_add]
  simp only [← C_mul, ← C_add]
  exact ⟨_, rfl⟩

lemma third_X {ι : Type*} [DecidableEq ι] (p i j k : ι) :
    ∃ t : ℝ, pderiv i (pderiv j (pderiv k (X p : MvPolynomial ι ℝ))) = C t := by
  simp only [pderiv_X', pderiv_C]
  exact ⟨0, (map_zero C).symm⟩

lemma third_add {ι : Type*} {P Q : MvPolynomial ι ℝ} {i j k : ι}
    (hP : ∃ t : ℝ, pderiv i (pderiv j (pderiv k P)) = C t)
    (hQ : ∃ t : ℝ, pderiv i (pderiv j (pderiv k Q)) = C t) :
    ∃ t : ℝ, pderiv i (pderiv j (pderiv k (P + Q))) = C t := by
  obtain ⟨s, hs⟩ := hP; obtain ⟨t, ht⟩ := hQ
  exact ⟨s + t, by rw [map_add, map_add, map_add, hs, ht, map_add]⟩

lemma third_sub {ι : Type*} {P Q : MvPolynomial ι ℝ} {i j k : ι}
    (hP : ∃ t : ℝ, pderiv i (pderiv j (pderiv k P)) = C t)
    (hQ : ∃ t : ℝ, pderiv i (pderiv j (pderiv k Q)) = C t) :
    ∃ t : ℝ, pderiv i (pderiv j (pderiv k (P - Q))) = C t := by
  obtain ⟨s, hs⟩ := hP; obtain ⟨t, ht⟩ := hQ
  exact ⟨s - t, by rw [map_sub, map_sub, map_sub, hs, ht, map_sub]⟩

lemma third_C_mul {ι : Type*} {P : MvPolynomial ι ℝ} {i j k : ι} (c : ℝ)
    (hP : ∃ t : ℝ, pderiv i (pderiv j (pderiv k P)) = C t) :
    ∃ t : ℝ, pderiv i (pderiv j (pderiv k (C c * P))) = C t := by
  obtain ⟨s, hs⟩ := hP
  exact ⟨c * s, by rw [pderiv_C_mul, pderiv_C_mul, pderiv_C_mul, hs, C_mul]⟩

lemma chaos3_reW (a b c : Fin n) : Chaos3 (reW n a b c) where
  eig := ouL_reW n a b c
  cubic i j k := by
    unfold reW
    exact third_sub (third_sub (third_add (third_add (third_sub (third_cub _ _ _ _ _ _)
      (third_cub _ _ _ _ _ _)) (third_cub _ _ _ _ _ _)) (third_cub _ _ _ _ _ _))
      (third_C_mul _ (third_X _ _ _ _))) (third_C_mul _ (third_X _ _ _ _))

lemma chaos3_imW (a b c : Fin n) : Chaos3 (imW n a b c) where
  eig := ouL_imW n a b c
  cubic i j k := by
    unfold imW
    exact third_sub (third_sub (third_add (third_sub (third_add (third_cub _ _ _ _ _ _)
      (third_cub _ _ _ _ _ _)) (third_cub _ _ _ _ _ _)) (third_cub _ _ _ _ _ _))
      (third_C_mul _ (third_X _ _ _ _))) (third_C_mul _ (third_X _ _ _ _))


lemma fin_add_cases (i : Fin (n + n)) :
    (∃ l, i = Fin.castAdd n l) ∨ (∃ l, i = Fin.natAdd n l) := by
  by_cases h : (i : ℕ) < n
  · exact Or.inl ⟨⟨i, h⟩, Fin.ext (by simp)⟩
  · exact Or.inr ⟨⟨i - n, by omega⟩, Fin.ext (by simp only [Fin.val_natAdd]; omega)⟩

/-- The standard complex structure `J` on `ℝ^{n+n} = ℂⁿ`: `D_J = Σₗ (xₗ ∂_{yₗ} − yₗ ∂_{xₗ})`. -/
def Jstd : Fin (n + n) → Fin (n + n) → ℝ :=
  Fin.append (fun l => Fin.append (fun _ => 0) (fun m => if m = l then 1 else 0))
    (fun l => Fin.append (fun m => if m = l then -1 else 0) (fun _ => 0))

lemma Jstd_LL (l m : Fin n) : Jstd n (Fin.castAdd n l) (Fin.castAdd n m) = 0 := by
  simp only [Jstd, Fin.append_left]
lemma Jstd_LR (l m : Fin n) :
    Jstd n (Fin.castAdd n l) (Fin.natAdd n m) = if m = l then 1 else 0 := by
  simp only [Jstd, Fin.append_left, Fin.append_right]
lemma Jstd_RL (l m : Fin n) :
    Jstd n (Fin.natAdd n l) (Fin.castAdd n m) = if m = l then -1 else 0 := by
  simp only [Jstd, Fin.append_left, Fin.append_right]
lemma Jstd_RR (l m : Fin n) : Jstd n (Fin.natAdd n l) (Fin.natAdd n m) = 0 := by
  simp only [Jstd, Fin.append_right]

lemma ite_one_neg (l m : Fin n) : (if m = l then (1 : ℝ) else 0) = -(if l = m then -1 else 0) := by
  rcases eq_or_ne l m with rfl | h
  · simp
  · simp [h, Ne.symm h]

lemma ite_negone_neg (l m : Fin n) : (if m = l then (-1 : ℝ) else 0) = -(if l = m then 1 else 0) := by
  rcases eq_or_ne l m with rfl | h
  · simp
  · simp [h, Ne.symm h]

lemma Jstd_anti (i j : Fin (n + n)) : Jstd n i j = -Jstd n j i := by
  rcases fin_add_cases n i with ⟨l, rfl⟩ | ⟨l, rfl⟩ <;>
    rcases fin_add_cases n j with ⟨m, rfl⟩ | ⟨m, rfl⟩ <;>
    simp only [Jstd_LL, Jstd_LR, Jstd_RL, Jstd_RR, neg_zero]
  · exact ite_one_neg n l m
  · exact ite_negone_neg n l m

lemma Jstd_sq_diag (i : Fin (n + n)) : ∑ j, Jstd n i j * Jstd n j i = -1 := by
  rcases fin_add_cases n i with ⟨l, rfl⟩ | ⟨l, rfl⟩
  · rw [Fin.sum_univ_add]
    simp only [Jstd_LL, Jstd_LR, Jstd_RL, zero_mul, Finset.sum_const_zero, zero_add]
    have : ∀ m : Fin n, (if m = l then (1 : ℝ) else 0) * (if l = m then -1 else 0)
        = if m = l then -1 else 0 := fun m => by
      rcases eq_or_ne m l with rfl | h
      · simp
      · simp [h, Ne.symm h]
    simp only [this, Finset.sum_ite_eq', Finset.mem_univ, ite_true]
  · rw [Fin.sum_univ_add]
    simp only [Jstd_RL, Jstd_LR, Jstd_RR, zero_mul, Finset.sum_const_zero, add_zero]
    have : ∀ m : Fin n, (if m = l then (-1 : ℝ) else 0) * (if l = m then 1 else 0)
        = if m = l then -1 else 0 := fun m => by
      rcases eq_or_ne m l with rfl | h
      · simp
      · simp [h, Ne.symm h]
    simp only [this, Finset.sum_ite_eq', Finset.mem_univ, ite_true]

lemma natAdd_ne_castAdd (l m : Fin n) : Fin.natAdd n l ≠ Fin.castAdd n m :=
  (castAdd_ne_natAdd n m l).symm

lemma Jstd_sq_off (i k : Fin (n + n)) (hik : i ≠ k) : ∑ j, Jstd n i j * Jstd n j k = 0 := by
  rcases fin_add_cases n i with ⟨l, rfl⟩ | ⟨l, rfl⟩ <;>
    rcases fin_add_cases n k with ⟨m, rfl⟩ | ⟨m, rfl⟩ <;> rw [Fin.sum_univ_add] <;>
    simp only [Jstd_LL, Jstd_LR, Jstd_RL, Jstd_RR, zero_mul, mul_zero, Finset.sum_const_zero,
      zero_add, add_zero]
  · have hlm : l ≠ m := fun h => hik (h ▸ rfl)
    have : ∀ m' : Fin n, (if m' = l then (1 : ℝ) else 0) * (if m = m' then -1 else 0) = 0 :=
      fun m' => by
        rcases eq_or_ne m' l with rfl | h
        · simp [Ne.symm hlm]
        · simp [h]
    simp only [this, Finset.sum_const_zero]
  · have hlm : l ≠ m := fun h => hik (h ▸ rfl)
    have : ∀ m' : Fin n, (if m' = l then (-1 : ℝ) else 0) * (if m = m' then 1 else 0) = 0 :=
      fun m' => by
        rcases eq_or_ne m' l with rfl | h
        · simp [Ne.symm hlm]
        · simp [h]
    simp only [this, Finset.sum_const_zero]

/-- `D_J P = Σₗ (xₗ ∂_{yₗ} P − yₗ ∂_{xₗ} P)` for the standard complex structure. -/
lemma rotD_Jstd (P : MvPolynomial (Fin (n + n)) ℝ) :
    rotD (Jstd n) P
      = ∑ l, (xP n l * pderiv (Fin.natAdd n l) P - yP n l * pderiv (Fin.castAdd n l) P) := by
  simp only [rotD, Fin.sum_univ_add, Jstd_LL, Jstd_LR, Jstd_RL, Jstd_RR, map_zero, zero_mul,
    Finset.sum_const_zero, zero_add, add_zero, apply_ite C, map_neg, map_one, ite_mul, neg_mul,
    one_mul, Finset.sum_ite_eq, Finset.mem_univ, ite_true]
  rw [← Finset.sum_add_distrib]
  exact Finset.sum_congr rfl fun l _ => by ring

lemma rotD_xP (m : Fin n) : rotD (Jstd n) (xP n m) = -yP n m := by
  rw [rotD_Jstd]
  simp only [xP, yP, pderiv_X, Pi.single_apply, castAdd_ne_natAdd, ite_false, mul_zero, zero_sub,
    castAdd_inj_iff, Finset.sum_neg_distrib, mul_ite, mul_one, Finset.sum_ite_eq,
    Finset.mem_univ, ite_true]

lemma rotD_yP (m : Fin n) : rotD (Jstd n) (yP n m) = xP n m := by
  rw [rotD_Jstd]
  simp only [xP, yP, pderiv_X, Pi.single_apply, natAdd_ne_castAdd, natAdd_inj_iff, ite_false,
    mul_zero, sub_zero, mul_ite, mul_one, Finset.sum_ite_eq, Finset.mem_univ, ite_true]

/-! ### Closure lemmas -/

lemma rotD_zero {ι : Type*} [Fintype ι] (J : ι → ι → ℝ) : rotD J (0 : MvPolynomial ι ℝ) = 0 := by
  simpa using rotD_C J 0

lemma rotD_finset_sum {ι : Type*} [Fintype ι] (J : ι → ι → ℝ) {κ : Type*} (s : Finset κ)
    (P : κ → MvPolynomial ι ℝ) : rotD J (∑ k ∈ s, P k) = ∑ k ∈ s, rotD J (P k) := by
  classical
  induction s using Finset.induction_on with
  | empty => simp [rotD_zero]
  | insert k s hk ih => rw [Finset.sum_insert hk, Finset.sum_insert hk, rotD_add, ih]

lemma Chaos3.zero {ι : Type*} [Fintype ι] : Chaos3 (0 : MvPolynomial ι ℝ) where
  eig := by simp
  cubic _ _ _ := ⟨0, by simp⟩

lemma Chaos3.const_mul {ι : Type*} [Fintype ι] {P : MvPolynomial ι ℝ} (hP : Chaos3 P) (c : ℝ) :
    Chaos3 (C c * P) where
  eig := by rw [ouL_C_mul, hP.eig]; ring
  cubic i j k := by
    obtain ⟨t, ht⟩ := hP.cubic i j k
    exact ⟨c * t, by rw [pderiv_C_mul, pderiv_C_mul, pderiv_C_mul, ht, MvPolynomial.C_mul]⟩

lemma Chaos3.finset_sum {ι : Type*} [Fintype ι] {κ : Type*} (s : Finset κ)
    {P : κ → MvPolynomial ι ℝ} (hP : ∀ k ∈ s, Chaos3 (P k)) : Chaos3 (∑ k ∈ s, P k) := by
  classical
  induction s using Finset.induction_on with
  | empty => simpa using Chaos3.zero
  | insert k s hk ih =>
    rw [Finset.sum_insert hk]
    exact (hP k (Finset.mem_insert_self k s)).add
      (ih fun k' hk' => hP k' (Finset.mem_insert_of_mem hk'))

/-- `D_J Re W = −Im W` for the Wick cubic. -/
lemma rotD_reW (a b c : Fin n) : rotD (Jstd n) (reW n a b c) = -imW n a b c := by
  unfold reW imW
  simp only [rotD_sub, rotD_add, rotD_C_mul]
  simp only [rotD_mul, rotD_xP, rotD_yP]
  ring

/-- `D_J Im W = Re W` for the Wick cubic. -/
lemma rotD_imW (a b c : Fin n) : rotD (Jstd n) (imW n a b c) = reW n a b c := by
  unfold reW imW
  simp only [rotD_sub, rotD_add, rotD_C_mul]
  simp only [rotD_mul, rotD_xP, rotD_yP]
  ring

end

end Grothe.LowerAnalytic
