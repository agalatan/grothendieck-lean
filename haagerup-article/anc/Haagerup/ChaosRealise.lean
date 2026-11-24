import Haagerup.GaussianCore
import Haagerup.Transfer
import Mathlib.Analysis.InnerProductSpace.Adjoint

set_option warningAsError true

/-!
# Mehler expansion, chaos realisation, smoothed 2D channels, and Haagerup's phase channel

Connects complex Gaussian chaos on `ℂ × ℂ` to `DominatedKernel` and `bivarKernel` (`Transfer.lean`):
1. 1D and 2D complex Mehler formulas (`integral_mehler`, `mehler_L2`, `Bm_polyKernel`);
2. Tensor realisation of disk-valued charge-one maps (`DiskKernel.dominated`, `rounding_diskKernel`);
3. Rotated Ornstein–Uhlenbeck smoothing `smoothMap` with exact rational Pythagorean parameters,
   its symmetric-matrix law equivalence `smoothMap_eq_sym`, and the square-root-free binomial
   Hermite inner-product identity `integral_H2_smoothMap`;
4. Haagerup's phase map `ph`, `phase2`, `haagCoeff`, `energy_phase2_odd_zero`, and `phase_bivarKernel_eq`.
-/

namespace Haagerup

open MeasureTheory ProbabilityTheory Complex Real Set MvPolynomial Finset
open Haagerup.Statement
open scoped ComplexConjugate InnerProductSpace Nat ENNReal Polynomial

noncomputable section

/-! ### 1. Four-variable polynomial expectation `E2` and 1D Mehler (`integral_mehler`) -/

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

abbrev P4 := MvPolynomial (Fin 4) ℂ

def wv (p : ℂ × ℂ) : Fin 4 → ℂ := ![p.1, conj p.1, p.2, conj p.2]

def ev4 (p : ℂ × ℂ) (P : P4) : ℂ := eval (wv p) P

lemma ev4_monomial (p : ℂ × ℂ) (s : Fin 4 →₀ ℕ) (c : ℂ) :
    ev4 p (monomial s c) =
      c * ((p.1 ^ s 0 * conj p.1 ^ s 1) * (p.2 ^ s 2 * conj p.2 ^ s 3)) := by
  rw [ev4, eval_monomial, Finsupp.prod_fintype _ _ (fun _ => pow_zero _), Fin.prod_univ_four]
  congr 1
  simp only [wv, Fin.isValue, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]
  ring

lemma integrable_ev4 (P : P4) : Integrable (fun p => ev4 p P) mu2 := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    simp_rw [ev4_monomial]
    exact ((integrable_monomial (s 0) (s 1)).mul_prod (integrable_monomial (s 2) (s 3))).const_mul c
  | add _ _ hP hQ => simp_rw [ev4, map_add]; exact hP.add hQ

def E2 : P4 →ₗ[ℂ] ℂ where
  toFun P := ∫ p, ev4 p P ∂mu2
  map_add' P Q := by simp_rw [ev4, map_add]; exact integral_add (integrable_ev4 P) (integrable_ev4 Q)
  map_smul' c P := by
    simp_rw [ev4, smul_eval, smul_eq_mul]; exact integral_const_mul c _

lemma E2_apply (P : P4) : E2 P = ∫ p, ev4 p P ∂mu2 := rfl

lemma E2_monomial (s : Fin 4 →₀ ℕ) (c : ℂ) :
    E2 (monomial s c) = c * (mom (s 0) (s 1) * mom (s 2) (s 3)) := by
  rw [E2_apply]; simp_rw [ev4_monomial]
  rw [integral_const_mul, integral_prod_mul (f := fun z : ℂ => z ^ s 0 * conj z ^ s 1)
    (g := fun z : ℂ => z ^ s 2 * conj z ^ s 3), integral_moment, integral_moment]; rfl

lemma E2_one : E2 1 = 1 := by
  have : (1 : P4) = monomial 0 1 := rfl
  rw [this, E2_monomial]; simp [mom]

private lemma single_add_apply4 (i j : Fin 4) (s : Fin 4 →₀ ℕ) :
    ((Finsupp.single i 1 + s : Fin 4 →₀ ℕ) : Fin 4 → ℕ) j = s j + if i = j then 1 else 0 := by
  simp [Finsupp.single_apply, add_comm]

private lemma sub_single_apply4 (i j : Fin 4) (s : Fin 4 →₀ ℕ) :
    ((s - Finsupp.single i 1 : Fin 4 →₀ ℕ) : Fin 4 → ℕ) j = s j - if i = j then 1 else 0 := by
  simp [Finsupp.single_apply]

theorem E2_X0_mul (P : P4) : E2 (MvPolynomial.X 0 * P) = E2 (pderiv 1 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    rw [MvPolynomial.X, monomial_mul_monomial, one_mul, pderiv_monomial, E2_monomial, E2_monomial]
    simp only [single_add_apply4, sub_single_apply4, Fin.reduceEq, ↓reduceIte, add_zero,
      Nat.sub_zero, mom_succ_left]
    ring
  | add _ _ hP hQ => simp only [mul_add, map_add, hP, hQ]

theorem E2_X1_mul (P : P4) : E2 (MvPolynomial.X 1 * P) = E2 (pderiv 0 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    rw [MvPolynomial.X, monomial_mul_monomial, one_mul, pderiv_monomial, E2_monomial, E2_monomial]
    simp only [single_add_apply4, sub_single_apply4, Fin.reduceEq, ↓reduceIte, add_zero,
      Nat.sub_zero, mom_succ_right]
    ring
  | add _ _ hP hQ => simp only [mul_add, map_add, hP, hQ]

theorem E2_X2_mul (P : P4) : E2 (MvPolynomial.X 2 * P) = E2 (pderiv 3 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    rw [MvPolynomial.X, monomial_mul_monomial, one_mul, pderiv_monomial, E2_monomial, E2_monomial]
    simp only [single_add_apply4, sub_single_apply4, Fin.reduceEq, ↓reduceIte, add_zero,
      Nat.sub_zero, mom_succ_left]
    ring
  | add _ _ hP hQ => simp only [mul_add, map_add, hP, hQ]

theorem E2_X3_mul (P : P4) : E2 (MvPolynomial.X 3 * P) = E2 (pderiv 2 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    rw [MvPolynomial.X, monomial_mul_monomial, one_mul, pderiv_monomial, E2_monomial, E2_monomial]
    simp only [single_add_apply4, sub_single_apply4, Fin.reduceEq, ↓reduceIte, add_zero,
      Nat.sub_zero, mom_succ_right]
    ring
  | add _ _ hP hQ => simp only [mul_add, map_add, hP, hQ]

lemma pderiv_aeval2 {k : ℕ} (ψ : Fin 2 → MvPolynomial (Fin k) ℂ) (j : Fin k) (g : CPoly) :
    pderiv j (MvPolynomial.aeval ψ g) =
      MvPolynomial.aeval ψ (pderiv 0 g) * pderiv j (ψ 0) +
        MvPolynomial.aeval ψ (pderiv 1 g) * pderiv j (ψ 1) := by
  induction g using MvPolynomial.induction_on with
  | C _ => simp
  | add _ _ hP hQ => simp only [map_add, hP, hQ]; ring
  | mul_X _ i hP =>
    simp only [map_mul, aeval_X, Derivation.leibniz, smul_eq_mul, map_add, hP]
    fin_cases i <;> simp [pderiv_X] <;> ring

def sX : CPoly →ₐ[ℂ] P4 := MvPolynomial.aeval ![MvPolynomial.X 0, MvPolynomial.X 1]

def sY (ρ : ℂ) : CPoly →ₐ[ℂ] P4 :=
  MvPolynomial.aeval ![MvPolynomial.C ρ * MvPolynomial.X 0 + MvPolynomial.C (sig ρ) * MvPolynomial.X 2,
    MvPolynomial.C (conj ρ) * MvPolynomial.X 1 + MvPolynomial.C (sig ρ) * MvPolynomial.X 3]

private lemma pderiv0_sX (h : CPoly) : pderiv 0 (sX h) = sX (pderiv 0 h) := by
  rw [sX, pderiv_aeval2]; simp [pderiv_X]

private lemma pderiv1_sX (h : CPoly) : pderiv 1 (sX h) = sX (pderiv 1 h) := by
  rw [sX, pderiv_aeval2]; simp [pderiv_X]

private lemma pderiv0_sY (ρ : ℂ) (g : CPoly) : pderiv 0 (sY ρ g) = MvPolynomial.C ρ * sY ρ (pderiv 0 g) := by
  rw [sY, pderiv_aeval2]; simp [pderiv_X, Derivation.leibniz]; ring

private lemma pderiv1_sY (ρ : ℂ) (g : CPoly) :
    pderiv 1 (sY ρ g) = MvPolynomial.C (conj ρ) * sY ρ (pderiv 1 g) := by
  rw [sY, pderiv_aeval2]; simp [pderiv_X, Derivation.leibniz]; ring

private lemma pderiv2_sY (ρ : ℂ) (g : CPoly) :
    pderiv 2 (sY ρ g) = MvPolynomial.C (sig ρ) * sY ρ (pderiv 0 g) := by
  rw [sY, pderiv_aeval2]; simp [pderiv_X, Derivation.leibniz]; ring

private lemma pderiv3_sY (ρ : ℂ) (g : CPoly) :
    pderiv 3 (sY ρ g) = MvPolynomial.C (sig ρ) * sY ρ (pderiv 1 g) := by
  rw [sY, pderiv_aeval2]; simp [pderiv_X, Derivation.leibniz]; ring

private lemma E2_C_mul (a : ℂ) (P : P4) : E2 (MvPolynomial.C a * P) = a * E2 P := by
  rw [C_mul', map_smul, smul_eq_mul]

def Mp (ρ : ℂ) (f g : CPoly) : ℂ := E2 (sX (conjP f) * sY ρ g)

private lemma Mp_A0 (ρ : ℂ) (f g : CPoly) : Mp ρ (A0 f) g = ρ * Mp ρ f (pderiv 0 g) := by
  have hc : sX (conjP (A0 f)) = MvPolynomial.X 1 * sX (conjP f) - pderiv 0 (sX (conjP f)) := by
    have h1 : conjP (pderiv 1 f) = pderiv 0 (conjP f) := by rw [pderiv_conjP]; simp
    rw [A0, map_sub, map_mul, conjP_X, h1, pderiv0_sX, map_sub, map_mul]; simp [sX]
  rw [Mp, Mp, hc, sub_mul, map_sub, mul_assoc, E2_X1_mul, Derivation.leibniz, map_add,
    pderiv0_sY, smul_eq_mul, smul_eq_mul]
  rw [show sX (conjP f) * (MvPolynomial.C ρ * sY ρ (pderiv 0 g)) =
      MvPolynomial.C ρ * (sX (conjP f) * sY ρ (pderiv 0 g)) by ring, E2_C_mul, mul_comm (sY ρ g)]
  ring

private lemma Mp_A1 (ρ : ℂ) (f g : CPoly) : Mp ρ (A1 f) g = conj ρ * Mp ρ f (pderiv 1 g) := by
  have hc : sX (conjP (A1 f)) = MvPolynomial.X 0 * sX (conjP f) - pderiv 1 (sX (conjP f)) := by
    have h1 : conjP (pderiv 0 f) = pderiv 1 (conjP f) := by rw [pderiv_conjP]; simp
    rw [A1, map_sub, map_mul, conjP_X, h1, pderiv1_sX, map_sub, map_mul]; simp [sX]
  rw [Mp, Mp, hc, sub_mul, map_sub, mul_assoc, E2_X0_mul, Derivation.leibniz, map_add,
    pderiv1_sY, smul_eq_mul, smul_eq_mul]
  rw [show sX (conjP f) * (MvPolynomial.C (conj ρ) * sY ρ (pderiv 1 g)) =
      MvPolynomial.C (conj ρ) * (sX (conjP f) * sY ρ (pderiv 1 g)) by ring,
    E2_C_mul, mul_comm (sY ρ g)]
  ring

private lemma sig_sq {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) : sig ρ * sig ρ = 1 - ρ * conj ρ := by
  rw [sig, ← Complex.ofReal_mul, Real.mul_self_sqrt (by nlinarith [norm_nonneg ρ]),
    Complex.mul_conj, Complex.normSq_eq_norm_sq]
  push_cast; ring

private lemma E2_sY_A0 {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (h : CPoly) : E2 (sY ρ (A0 h)) = 0 := by
  have hx : sY ρ (MvPolynomial.X 0) =
      MvPolynomial.C ρ * MvPolynomial.X 0 + MvPolynomial.C (sig ρ) * MvPolynomial.X 2 := by simp [sY]
  rw [A0, map_sub, map_mul, hx, add_mul, mul_assoc, mul_assoc, map_sub, map_add, E2_C_mul,
    E2_C_mul, E2_X0_mul, E2_X2_mul, pderiv1_sY, pderiv3_sY, E2_C_mul, E2_C_mul]
  linear_combination E2 (sY ρ (pderiv 1 h)) * sig_sq hρ

private lemma E2_sY_A1 {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (h : CPoly) : E2 (sY ρ (A1 h)) = 0 := by
  have hx : sY ρ (MvPolynomial.X 1) =
      MvPolynomial.C (conj ρ) * MvPolynomial.X 1 + MvPolynomial.C (sig ρ) * MvPolynomial.X 3 := by
    simp [sY]
  rw [A1, map_sub, map_mul, hx, add_mul, mul_assoc, mul_assoc, map_sub, map_add, E2_C_mul,
    E2_C_mul, E2_X1_mul, E2_X3_mul, pderiv0_sY, pderiv2_sY, E2_C_mul, E2_C_mul]
  linear_combination E2 (sY ρ (pderiv 0 h)) * sig_sq hρ

private lemma E2_sY_H {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (r s : ℕ) :
    E2 (sY ρ (H r s)) = if r = 0 ∧ s = 0 then 1 else 0 := by
  cases r with
  | succ _ => rw [H_succ_left, E2_sY_A0 hρ]; simp
  | zero =>
    cases s with
    | zero => rw [H_zero_zero, map_one, E2_one]; simp
    | succ _ => rw [H_zero_succ, E2_sY_A1 hρ]; simp

theorem Mp_H {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (p q r s : ℕ) :
    Mp ρ (H p q) (H r s) =
      if p = r ∧ q = s then ((p.factorial * q.factorial : ℕ) : ℂ) * ρ ^ p * conj ρ ^ q else 0 := by
  have mp0 : ∀ f, Mp ρ f 0 = 0 := fun _ => by simp [Mp]
  have mps : ∀ f g (n : ℕ), Mp ρ f (n • g) = n * Mp ρ f g := fun f g n => by
    rw [Mp, Mp, map_nsmul, mul_smul_comm, map_nsmul, nsmul_eq_mul]
  induction p generalizing r with
  | succ p ih =>
    rw [H_succ_left, Mp_A0]
    cases r with
    | zero => rw [pderiv0_H_zero, mp0]; simp
    | succ r =>
      rw [pderiv0_H_succ, mps, ih]
      by_cases h : p = r ∧ q = s
      · obtain ⟨rfl, rfl⟩ := h; simp [Nat.factorial_succ]; ring
      · simp [h]
  | zero =>
    induction q generalizing r s with
    | succ q ih =>
      rw [H_zero_succ, Mp_A1]
      cases s with
      | zero => rw [pderiv1_H_zero, mp0]; simp
      | succ s =>
        rw [pderiv1_H_succ, mps, ih]
        by_cases h : 0 = r ∧ q = s
        · obtain ⟨rfl, rfl⟩ := h; simp [Nat.factorial_succ]; ring
        · simp [h]
    | zero =>
      rw [H_zero_zero, Mp, map_one, map_one, one_mul, E2_sY_H hρ]
      by_cases h : r = 0 ∧ s = 0
      · obtain ⟨rfl, rfl⟩ := h; simp
      · have h' : ¬(0 = r ∧ 0 = s) := by omega
        simp [h, h']

lemma ev4_sX (u : ℂ × ℂ) (f : CPoly) : ev4 u (sX f) = ev u.1 f := by
  induction f using MvPolynomial.induction_on with
  | C _ => simp [ev4, ev, sX]
  | add _ _ hP hQ => simp only [map_add, ev4, ev] at *; rw [hP, hQ]
  | mul_X _ i hP => simp only [map_mul, ev4, ev] at *; rw [hP]; fin_cases i <;> simp [sX, wv, zv]

lemma ev4_sY (ρ : ℂ) (u : ℂ × ℂ) (g : CPoly) :
    ev4 u (sY ρ g) = ev (ρ * u.1 + sig ρ * u.2) g := by
  induction g using MvPolynomial.induction_on with
  | C _ => simp [ev4, ev, sY]
  | add _ _ hP hQ => simp only [map_add, ev4, ev] at *; rw [hP, hQ]
  | mul_X _ i hP =>
    simp only [map_mul, ev4, ev] at *; rw [hP]
    fin_cases i <;> simp [sY, wv, zv, sig, Complex.conj_ofReal]

theorem integral_mehler {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (p q r s : ℕ) :
    ∫ u, conj (ev u.1 (H p q)) * ev (ρ * u.1 + sig ρ * u.2) (H r s) ∂mu2 =
      if p = r ∧ q = s then ((p.factorial * q.factorial : ℕ) : ℂ) * ρ ^ p * conj ρ ^ q else 0 := by
  rw [← Mp_H hρ, Mp, E2_apply]
  refine integral_congr_ae (Filter.Eventually.of_forall fun u => ?_)
  show conj (ev u.1 (H p q)) * ev (ρ * u.1 + sig ρ * u.2) (H r s)
    = eval (wv u) (sX (conjP (H p q)) * sY ρ (H r s))
  rw [map_mul, ← ev4, ← ev4, ev4_sX, ev4_sY, ev_conjP]

/-! ### 2. `L²(mu2)` Mehler, chaos energies, and `Bm_polyKernel` -/

theorem hasSum_diagonal_pairing {ι E K : Type*} [DecidableEq ι]
    [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
    [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    (b : HilbertBasis ι ℂ E) (P Q : E →L[ℂ] K) (lamv : ι → ℂ)
    (hdiag : ∀ i j, ⟪P (b i), Q (b j)⟫_ℂ = if i = j then lamv i else 0) (F G : E) :
    HasSum (fun i => conj ⟪b i, F⟫_ℂ * lamv i * ⟪b i, G⟫_ℂ) ⟪P F, Q G⟫_ℂ := by
  classical
  have step : ∀ i, ⟪P (b i), Q G⟫_ℂ = lamv i * ⟪b i, G⟫_ℂ := fun i => by
    have h := ((b.hasSum_repr G).mapL ((innerSL ℂ (P (b i))).comp Q)).tsum_eq.symm
    simp only [map_smul, smul_eq_mul, ContinuousLinearMap.comp_apply, innerSL_apply_apply,
      hdiag, mul_ite, mul_zero, tsum_ite_eq', HilbertBasis.repr_apply_apply] at h
    simpa only [mul_comm] using h
  have hs := b.hasSum_inner_mul_inner F (P.adjoint (Q G))
  simp only [ContinuousLinearMap.adjoint_inner_right, step] at hs
  convert hs using 1; ext i; rw [inner_conj_symm]; ring

abbrev mu4 : Measure ((ℂ × ℂ) × (ℂ × ℂ)) := mu2.prod mu2

def Xof (ω : (ℂ × ℂ) × (ℂ × ℂ)) : ℂ × ℂ := (ω.1.1, ω.2.1)
def mY (ρ : ℂ) (u : ℂ × ℂ) : ℂ := ρ * u.1 + sig ρ * u.2
def Yof (ρ₁ ρ₂ : ℂ) (ω : (ℂ × ℂ) × (ℂ × ℂ)) : ℂ × ℂ := (mY ρ₁ ω.1, mY ρ₂ ω.2)

lemma measurable_mY (ρ : ℂ) : Measurable (mY ρ) := by unfold mY; fun_prop

lemma mp_X : MeasurePreserving Xof mu4 mu2 := by
  refine ⟨by unfold Xof; fun_prop, ?_⟩
  have : Xof = Prod.map (Prod.fst : ℂ × ℂ → ℂ) Prod.fst := rfl
  rw [this, ← Measure.map_prod_map _ _ measurable_fst measurable_fst, Measure.map_fst_prod,
    measure_univ, one_smul]

lemma mp_Y {ρ₁ ρ₂ : ℂ} (h₁ : ‖ρ₁‖ ≤ 1) (h₂ : ‖ρ₂‖ ≤ 1) :
    MeasurePreserving (Yof ρ₁ ρ₂) mu4 mu2 := by
  refine ⟨(measurable_mY ρ₁).prodMap (measurable_mY ρ₂), ?_⟩
  have : Yof ρ₁ ρ₂ = Prod.map (mY ρ₁) (mY ρ₂) := rfl
  rw [this, ← Measure.map_prod_map _ _ (measurable_mY ρ₁) (measurable_mY ρ₂)]
  have e₁ : mu2.map (mY ρ₁) = gaussC := map_mehlerY h₁
  have e₂ : mu2.map (mY ρ₂) = gaussC := map_mehlerY h₂
  rw [e₁, e₂]

def lam (ρ₁ ρ₂ : ℂ) (i : Idx2) : ℂ :=
  ρ₁ ^ i.1.1 * conj ρ₁ ^ i.1.2 * (ρ₂ ^ i.2.1 * conj ρ₂ ^ i.2.2)

theorem integral_H2_XY {ρ₁ ρ₂ : ℂ} (h₁ : ‖ρ₁‖ ≤ 1) (h₂ : ‖ρ₂‖ ≤ 1) (i j : Idx2) :
    ∫ ω, conj (H2 i (Xof ω)) * H2 j (Yof ρ₁ ρ₂ ω) ∂mu4
      = if i = j then (fac2 i : ℂ) * lam ρ₁ ρ₂ i else 0 := by
  have e : ∀ ω : (ℂ × ℂ) × (ℂ × ℂ), conj (H2 i (Xof ω)) * H2 j (Yof ρ₁ ρ₂ ω)
      = (conj (ev ω.1.1 (H i.1.1 i.1.2)) * ev (ρ₁ * ω.1.1 + sig ρ₁ * ω.1.2) (H j.1.1 j.1.2))
        * (conj (ev ω.2.1 (H i.2.1 i.2.2)) * ev (ρ₂ * ω.2.1 + sig ρ₂ * ω.2.2) (H j.2.1 j.2.2)) :=
    fun _ => by simp only [H2, Xof, Yof, mY, map_mul]; ring
  simp_rw [e]
  rw [show mu4 = mu2.prod mu2 from rfl,
    integral_prod_mul
      (f := fun u : ℂ × ℂ => conj (ev u.1 (H i.1.1 i.1.2)) * ev (ρ₁ * u.1 + sig ρ₁ * u.2) (H j.1.1 j.1.2))
      (g := fun u : ℂ × ℂ => conj (ev u.1 (H i.2.1 i.2.2)) * ev (ρ₂ * u.1 + sig ρ₂ * u.2) (H j.2.1 j.2.2)),
    integral_mehler h₁, integral_mehler h₂]
  obtain ⟨⟨p, q⟩, ⟨r, s⟩⟩ := i
  obtain ⟨⟨p', q'⟩, ⟨r', s'⟩⟩ := j
  by_cases ha : p = p' ∧ q = q'
  · by_cases hb : r = r' ∧ s = s'
    · obtain ⟨rfl, rfl⟩ := ha; obtain ⟨rfl, rfl⟩ := hb; simp [fac2, lam]; ring
    · have : ¬((p, q), (r, s)) = ((p', q'), (r', s')) := fun h => hb (by simp_all)
      simp [hb, this]
  · have : ¬((p, q), (r, s)) = ((p', q'), (r', s')) := fun h => ha (by simp_all)
    simp [ha, this]

def PX : Lp ℂ 2 mu2 →ₗᵢ[ℂ] Lp ℂ 2 mu4 := Lp.compMeasurePreservingₗᵢ ℂ Xof mp_X
def PY {ρ₁ ρ₂ : ℂ} (h₁ : ‖ρ₁‖ ≤ 1) (h₂ : ‖ρ₂‖ ≤ 1) : Lp ℂ 2 mu2 →ₗᵢ[ℂ] Lp ℂ 2 mu4 :=
  Lp.compMeasurePreservingₗᵢ ℂ (Yof ρ₁ ρ₂) (mp_Y h₁ h₂)

def Bm {ρ₁ ρ₂ : ℂ} (h₁ : ‖ρ₁‖ ≤ 1) (h₂ : ‖ρ₂‖ ≤ 1) (F G : Lp ℂ 2 mu2) : ℂ :=
  ⟪PX F, PY h₁ h₂ G⟫_ℂ

theorem Bm_eq_integral {ρ₁ ρ₂ : ℂ} (h₁ : ‖ρ₁‖ ≤ 1) (h₂ : ‖ρ₂‖ ≤ 1) (F G : Lp ℂ 2 mu2) :
    Bm h₁ h₂ F G = ∫ ω, conj (F (Xof ω)) * G (Yof ρ₁ ρ₂ ω) ∂mu4 := by
  rw [Bm, L2.inner_def]
  refine integral_congr_ae ?_
  filter_upwards [Lp.coeFn_compMeasurePreserving F mp_X,
    Lp.coeFn_compMeasurePreserving G (mp_Y h₁ h₂)] with ω h1 h2
  change ⟪(Lp.compMeasurePreserving Xof mp_X F : _ → ℂ) ω,
    (Lp.compMeasurePreserving (Yof ρ₁ ρ₂) (mp_Y h₁ h₂) G : _ → ℂ) ω⟫_ℂ = _
  rw [h1, h2, RCLike.inner_apply, mul_comm]; rfl

lemma Bm_hvec2 {ρ₁ ρ₂ : ℂ} (h₁ : ‖ρ₁‖ ≤ 1) (h₂ : ‖ρ₂‖ ≤ 1) (i j : Idx2) :
    Bm h₁ h₂ (hvec2 i) (hvec2 j) = if i = j then lam ρ₁ ρ₂ i else 0 := by
  rw [Bm_eq_integral]
  have hx := mp_X.quasiMeasurePreserving.ae_eq_comp (memLp_hfun2 i).coeFn_toLp
  have hy := (mp_Y h₁ h₂).quasiMeasurePreserving.ae_eq_comp (memLp_hfun2 j).coeFn_toLp
  rw [integral_congr_ae (g := fun ω => ((nrm2 i : ℂ) * nrm2 j)
      * (conj (H2 i (Xof ω)) * H2 j (Yof ρ₁ ρ₂ ω))) ?_]
  · rw [integral_const_mul, integral_H2_XY h₁ h₂]
    by_cases h : i = j
    · subst h; simp only [↓reduceIte]
      have h1 : nrm2 i * nrm2 i * (fac2 i : ℝ) = 1 := by
        rw [nrm2, ← mul_inv, Real.mul_self_sqrt (fac2_pos i).le, inv_mul_cancel₀ (fac2_pos i).ne']
      have h1' : ((nrm2 i : ℂ) * nrm2 i) * (fac2 i : ℂ) = 1 := by exact_mod_cast h1
      linear_combination lam ρ₁ ρ₂ i * h1'
    · simp [h]
  · filter_upwards [hx, hy] with ω h1 h2
    simp only [Function.comp, hvec2] at h1 h2 ⊢
    rw [h1, h2]; simp [hfun2, Complex.conj_ofReal]; ring

theorem mehler_L2 {ρ₁ ρ₂ : ℂ} (h₁ : ‖ρ₁‖ ≤ 1) (h₂ : ‖ρ₂‖ ≤ 1) (F G : Lp ℂ 2 mu2) :
    HasSum (fun i => conj ⟪hvec2 i, F⟫_ℂ * lam ρ₁ ρ₂ i * ⟪hvec2 i, G⟫_ℂ) (Bm h₁ h₂ F G) := by
  simpa only [hermiteBasis2_apply, Bm, LinearIsometry.coe_toContinuousLinearMap] using
    hasSum_diagonal_pairing hermiteBasis2 PX.toContinuousLinearMap
      (PY h₁ h₂).toContinuousLinearMap (lam ρ₁ ρ₂)
      (fun i j => by simpa only [hermiteBasis2_apply, Bm,
        LinearIsometry.coe_toContinuousLinearMap] using Bm_hvec2 h₁ h₂ i j) F G

lemma Bm_toLp {G : ℂ × ℂ → ℂ} (hGL : MemLp G 2 mu2) {ρ₁ ρ₂ : ℂ} (h₁ : ‖ρ₁‖ ≤ 1) (h₂ : ‖ρ₂‖ ≤ 1) :
    Bm h₁ h₂ (hGL.toLp G) (hGL.toLp G) = ∫ ω, conj (G (Xof ω)) * G (Yof ρ₁ ρ₂ ω) ∂mu4 := by
  rw [Bm_eq_integral]
  refine integral_congr_ae ?_
  filter_upwards [mp_X.quasiMeasurePreserving.ae_eq_comp hGL.coeFn_toLp,
    (mp_Y h₁ h₂).quasiMeasurePreserving.ae_eq_comp hGL.coeFn_toLp] with _ hx hy
  simp only [Function.comp] at hx hy; rw [hx, hy]

def bideg (i : Idx2) : ℕ × ℕ := (i.1.1 + i.1.2, i.2.1 + i.2.2)

def energy (G : Lp ℂ 2 mu2) (nm : ℕ × ℕ) : ℝ := ∑' i : bideg ⁻¹' {nm}, ‖⟪hvec2 i, G⟫_ℂ‖ ^ 2

lemma energy_nonneg (G : Lp ℂ 2 mu2) (nm : ℕ × ℕ) : 0 ≤ energy G nm :=
  tsum_nonneg fun _ => sq_nonneg _

theorem hasSum_energy_bideg (G : Lp ℂ 2 mu2) : HasSum (energy G) (‖G‖ ^ 2) :=
  (hasSum_energy2 G).tsum_fiberwise bideg

theorem summable_abs_energy (G : Lp ℂ 2 mu2) : Summable fun nm => |energy G nm| := by
  simp_rw [abs_of_nonneg (energy_nonneg G _)]; exact (hasSum_energy_bideg G).summable

theorem energy_eq_zero_of_even {g : ℂ × ℂ → ℂ} (hg : MemLp g 2 mu2)
    (hch : ∀ c u, ‖c‖ = 1 → g (rot2 c u) = c * g u) (nm : ℕ × ℕ) (he : (nm.1 + nm.2) % 2 = 0) :
    energy (hg.toLp g) nm = 0 := by
  unfold energy
  have h0 : ∀ i : ↑(bideg ⁻¹' {nm}), ‖⟪hvec2 i.1, hg.toLp g⟫_ℂ‖ ^ 2 = 0 := fun i => by
    have hb : bideg i.1 = nm := i.2
    have hi : i.1.1.1 + i.1.2.1 ≠ i.1.1.2 + i.1.2.2 + 1 := by
      intro h; rw [← hb] at he; simp only [bideg] at he; omega
    rw [inner_hvec2_left]
    have hint : ∫ u, conj (H2 i.1 u) * (hg.toLp g) u ∂mu2 = ∫ u, conj (H2 i.1 u) * g u ∂mu2 := by
      refine integral_congr_ae ?_
      filter_upwards [hg.coeFn_toLp] with _ hu; rw [hu]
    rw [hint, integral_H2_charge_one hg hch hi]; simp
  simp_rw [h0, tsum_zero]

def polyKernel (P : ℝ[X]) (z : ℂ) : ℂ := z * ((P.eval (‖z‖ ^ 2) : ℝ) : ℂ)

def ChargeOne (G : Lp ℂ 2 mu2) : Prop :=
  ∀ i : Idx2, i.1.1 + i.2.1 ≠ i.1.2 + i.2.2 + 1 → ⟪hvec2 i, G⟫_ℂ = 0

lemma chargeOne_toLp {G : ℂ × ℂ → ℂ} (hGL : MemLp G 2 mu2)
    (hch : ∀ c u, ‖c‖ = 1 → G (rot2 c u) = c * G u) : ChargeOne (hGL.toLp G) := by
  intro i hi
  rw [inner_hvec2_left]
  have hint : ∫ u, conj (H2 i u) * (hGL.toLp G) u ∂mu2 = ∫ u, conj (H2 i u) * G u ∂mu2 := by
    refine integral_congr_ae ?_
    filter_upwards [hGL.coeFn_toLp] with _ hu; rw [hu]
  rw [hint, integral_H2_charge_one hGL hch hi, mul_zero]

theorem tsum_bivarKernel_mul_pow {P Q : ℝ[X]} (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1)
    {μ : ℕ × ℕ → ℝ} (hμ : Summable fun p => |μ p|) {r : ℝ} (hr0 : 0 ≤ r) (hr1 : r ≤ 1) :
    ∑' j, bivarKernel P Q μ j * r ^ j = ∑' p, μ p * (termOf P Q p).eval r := by
  have hpow_sum : ∀ S : ℝ[X], Summable fun n => S.coeff n * r ^ n := fun S =>
    summable_of_ne_finset_zero (s := range (S.natDegree + 1)) fun n hn => by
      rw [S.coeff_eq_zero_of_natDegree_lt (by simp at hn; omega), zero_mul]
  have hpow_abs : ∀ S : ℝ[X], Summable fun n => |S.coeff n * r ^ n| := fun S =>
    summable_of_ne_finset_zero (s := range (S.natDegree + 1)) fun n hn => by
      rw [S.coeff_eq_zero_of_natDegree_lt (by simp at hn; omega), zero_mul, abs_zero]
  have hpow_eval : ∀ S : ℝ[X], (∑' n, S.coeff n * r ^ n) = S.eval r := fun S => by
    rw [tsum_eq_sum (s := range (S.natDegree + 1)), S.eval_eq_sum_range]
    intro n hn; rw [S.coeff_eq_zero_of_natDegree_lt (by simp at hn; omega), zero_mul]
  have hpow_le : ∀ S : ℝ[X], (∑' n, |S.coeff n| * r ^ n) ≤ l1 S := fun S => by
    rw [tsum_eq_sum (s := range (S.natDegree + 1)), l1_eq_sum_range S (Nat.lt_succ_self _)]
    · exact sum_le_sum fun n _ => mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ hr0 hr1)
    · intro n hn; rw [S.coeff_eq_zero_of_natDegree_lt (by simp at hn; omega), abs_zero, zero_mul]
  set f : ℕ × ℕ → ℕ → ℝ := fun p j => μ p * (termOf P Q p).coeff j * r ^ j with hf
  have hsum : Summable (Function.uncurry f) := by
    refine Summable.of_norm ?_
    refine (summable_prod_of_nonneg fun _ => norm_nonneg _).2 ⟨fun p => ?_, ?_⟩
    · simp only [Function.uncurry_apply_pair, hf, Real.norm_eq_abs, mul_assoc, abs_mul]
      exact ((hpow_abs (termOf P Q p)).mul_left |μ p|).congr fun _ => by rw [abs_mul]
    · refine Summable.of_nonneg_of_le (fun _ => tsum_nonneg fun _ => norm_nonneg _) (fun p => ?_) hμ
      simp only [Function.uncurry_apply_pair, hf, Real.norm_eq_abs, mul_assoc, abs_mul,
        abs_of_nonneg (pow_nonneg hr0 _)]
      rw [tsum_mul_left]
      exact mul_le_of_le_one_right (abs_nonneg _)
        ((hpow_le (termOf P Q p)).trans (l1_termOf_le_one hP hQ p))
  have e1 : ∀ j, bivarKernel P Q μ j * r ^ j = ∑' p, f p j := fun j => by
    rw [bivarKernel, ← tsum_mul_right]
  have e2 : ∀ p, ∑' j, f p j = μ p * (termOf P Q p).eval r := fun p => by
    simp only [hf, mul_assoc]; rw [tsum_mul_left, hpow_eval]
  simp only [e1, ← e2]
  exact hsum.tsum_comm

private lemma radialKernel_eq_mul (h : ℕ → ℝ) (z : ℂ) :
    radialKernel h z = z * ((∑' n, h n * (‖z‖ ^ 2) ^ n : ℝ) : ℂ) := by
  rw [radialKernel, Complex.ofReal_tsum, ← tsum_mul_left]
  refine tsum_congr fun n => ?_
  push_cast; rw [pow_mul]; ring

private lemma lam_polyKernel (P Q : ℝ[X]) (z : ℂ) {i : Idx2} (h : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1) :
    lam (polyKernel P z) (polyKernel Q z) i
      = z * (((termOf P Q (bideg i)).eval (‖z‖ ^ 2) : ℝ) : ℂ) := by
  have hsh : shiftOf (bideg i) = i.1.2 + i.2.2 := by simp only [shiftOf, bideg]; omega
  have hev : (termOf P Q (bideg i)).eval (‖z‖ ^ 2) =
      (‖z‖ ^ 2) ^ (i.1.2 + i.2.2) *
        (P.eval (‖z‖ ^ 2) ^ (i.1.1 + i.1.2) * Q.eval (‖z‖ ^ 2) ^ (i.2.1 + i.2.2)) := by
    rw [termOf, hsh]; simp [bideg, Polynomial.eval_mul, Polynomial.eval_pow]
  rw [hev]
  have hzz : z * conj z = ((‖z‖ ^ 2 : ℝ) : ℂ) := by
    rw [Complex.mul_conj, Complex.normSq_eq_norm_sq]
  simp only [lam, polyKernel, map_mul, Complex.conj_ofReal, mul_pow]
  set A : ℂ := ((P.eval (‖z‖ ^ 2) : ℝ) : ℂ)
  set B : ℂ := ((Q.eval (‖z‖ ^ 2) : ℝ) : ℂ)
  obtain ⟨⟨p₁, q₁⟩, ⟨p₂, q₂⟩⟩ := i
  simp only at h ⊢
  have hp : z ^ p₁ * z ^ p₂ = z * z ^ (q₁ + q₂) := by rw [← pow_add, h, pow_succ, mul_comm]
  push_cast
  have hzz' : ((‖z‖ : ℂ) ^ 2) = z * conj z := by push_cast at hzz; exact hzz.symm
  rw [hzz']
  calc z ^ p₁ * A ^ p₁ * (conj z ^ q₁ * A ^ q₁) * (z ^ p₂ * B ^ p₂ * (conj z ^ q₂ * B ^ q₂))
      = (z ^ p₁ * z ^ p₂) * conj z ^ (q₁ + q₂) * (A ^ (p₁ + q₁) * B ^ (p₂ + q₂)) := by ring
    _ = z * ((z * conj z) ^ (q₁ + q₂) * (A ^ (p₁ + q₁) * B ^ (p₂ + q₂))) := by
        rw [hp, mul_pow]; ring

theorem Bm_polyKernel {G : Lp ℂ 2 mu2} (hG : ChargeOne G) {P Q : ℝ[X]} (hP : l1 P ≤ 1)
    (hQ : l1 Q ≤ 1) {z : ℂ} (hz : ‖z‖ ≤ 1) (h₁ : ‖polyKernel P z‖ ≤ 1)
    (h₂ : ‖polyKernel Q z‖ ≤ 1) :
    Bm h₁ h₂ G G = radialKernel (bivarKernel P Q (energy G)) z := by
  set r : ℝ := ‖z‖ ^ 2 with hr
  have hr0 : 0 ≤ r := sq_nonneg _
  have hr1 : r ≤ 1 := pow_le_one₀ (norm_nonneg _) hz
  have hm := mehler_L2 h₁ h₂ G G
  have e : ∀ i, conj ⟪hvec2 i, G⟫_ℂ * lam (polyKernel P z) (polyKernel Q z) i * ⟪hvec2 i, G⟫_ℂ
      = (((‖⟪hvec2 i, G⟫_ℂ‖ ^ 2 * (termOf P Q (bideg i)).eval r : ℝ) : ℂ)) * z := fun i => by
    by_cases hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1
    · have hc : conj ⟪hvec2 i, G⟫_ℂ * ⟪hvec2 i, G⟫_ℂ = ((‖⟪hvec2 i, G⟫_ℂ‖ ^ 2 : ℝ) : ℂ) := by
        rw [mul_comm, Complex.mul_conj, Complex.normSq_eq_norm_sq]
      rw [lam_polyKernel P Q z hi, ← hr]; push_cast; push_cast at hc
      linear_combination (z * (((termOf P Q (bideg i)).eval r : ℝ) : ℂ)) * hc
    · rw [hG i hi]; simp
  simp_rw [e] at hm
  have hf := hm.tsum_fiberwise bideg
  have hfib : ∀ nm : ℕ × ℕ,
      ∑' b : ↑(bideg ⁻¹' {nm}), (((‖⟪hvec2 b.1, G⟫_ℂ‖ ^ 2
          * (termOf P Q (bideg b.1)).eval r : ℝ) : ℂ)) * z
        = ((energy G nm * (termOf P Q nm).eval r : ℝ) : ℂ) * z := fun nm => by
    have hb : ∀ b : ↑(bideg ⁻¹' {nm}), (termOf P Q (bideg b.1)).eval r
        = (termOf P Q nm).eval r := fun b => by rw [show bideg b.1 = nm from b.2]
    simp_rw [hb]; rw [tsum_mul_right, ← Complex.ofReal_tsum, tsum_mul_right, energy]
  simp_rw [hfib] at hf
  rw [radialKernel_eq_mul, ← hr, tsum_bivarKernel_mul_pow hP hQ (summable_abs_energy G) hr0 hr1,
    ← hf.tsum_eq, tsum_mul_right, ← Complex.ofReal_tsum, mul_comm]

/-! ### 3. Disk-valued roundings and tensor-product Gaussian realisation (`rounding_diskKernel`) -/

private def phaseOf (b : ℂ) : ℂ := if b = 0 then 1 else b / ((‖b‖ : ℝ) : ℂ)

private lemma norm_phaseOf (b : ℂ) : ‖phaseOf b‖ = 1 := by
  unfold phaseOf; split_ifs with h
  · simp
  · rw [norm_div, Complex.norm_real, Real.norm_of_nonneg (norm_nonneg _),
      div_self (norm_ne_zero_iff.2 h)]

private lemma conj_phaseOf_mul (b : ℂ) : conj (phaseOf b) * b = ((‖b‖ : ℝ) : ℂ) := by
  unfold phaseOf; split_ifs with h
  · simp [h]
  · have hn : ((‖b‖ : ℝ) : ℂ) ≠ 0 := by exact_mod_cast norm_ne_zero_iff.2 h
    rw [map_div₀, Complex.conj_ofReal]; field_simp; rw [mul_comm, Complex.mul_conj', sq]

private lemma norm_pairing_le_scalarOpt {m n : ℕ} (A : Fin m → Fin n → ℂ)
    {ε : Fin m → ℂ} {δ : Fin n → ℂ} (hε : ∀ i, ‖ε i‖ ≤ 1) (hδ : ∀ j, ‖δ j‖ ≤ 1) :
    ‖∑ i, ∑ j, A i j * (conj (ε i) * δ j)‖ ≤ scalarOpt A := by
  have hsum_le : ∀ {ι : Type} (s : Finset ι) (e b : ι → ℂ), (∀ i, ‖e i‖ ≤ 1) →
      ‖∑ i ∈ s, conj (e i) * b i‖ ≤ ‖∑ i ∈ s, conj (phaseOf (b i)) * b i‖ := by
    intro ι s e b he
    calc ‖∑ i ∈ s, conj (e i) * b i‖
        ≤ ∑ i ∈ s, ‖b i‖ := (norm_sum_le _ _).trans (sum_le_sum fun i _ => by
          rw [norm_mul, Complex.norm_conj]; exact mul_le_of_le_one_left (norm_nonneg _) (he i))
      _ = ‖∑ i ∈ s, conj (phaseOf (b i)) * b i‖ := by
          simp only [conj_phaseOf_mul]
          rw [← Complex.ofReal_sum, Complex.norm_real,
            Real.norm_of_nonneg (sum_nonneg fun _ _ => norm_nonneg _)]
  have hleft : ∀ {d : Fin n → ℂ}, (∀ j, ‖d j‖ = 1) →
      ‖∑ i, ∑ j, A i j * (conj (ε i) * d j)‖ ≤ scalarOpt A := by
    intro d hd
    have e1 : ∀ e : Fin m → ℂ, ∑ i, ∑ j, A i j * (conj (e i) * d j)
        = ∑ i, conj (e i) * ∑ j, A i j * d j := fun e =>
      sum_congr rfl fun i _ => by rw [mul_sum]; exact sum_congr rfl fun _ _ => by ring
    rw [e1]; refine (hsum_le univ _ _ hε).trans ?_; rw [← e1]
    exact le_scalarOpt A (fun _ => norm_phaseOf _) hd
  have e2 : ∀ d : Fin n → ℂ, ∑ i, ∑ j, A i j * (conj (ε i) * d j)
      = ∑ j, conj (conj (d j)) * ∑ i, A i j * conj (ε i) := fun d => by
    rw [sum_comm]; refine sum_congr rfl fun j _ => ?_
    rw [Complex.conj_conj, mul_sum]; exact sum_congr rfl fun _ _ => by ring
  rw [e2]
  refine (hsum_le univ (fun j => conj (δ j)) _ fun j => by rw [Complex.norm_conj]; exact hδ j).trans ?_
  have e2' := e2 fun j => conj (phaseOf (∑ i, A i j * conj (ε i)))
  simp only [Complex.conj_conj] at e2'; rw [← e2']
  exact hleft fun _ => by rw [Complex.norm_conj]; exact norm_phaseOf _

def DiskKernel (Q : ℂ → ℂ) : Prop :=
  ∀ (m n : ℕ) (ι : Type) [Fintype ι]
    (x : Fin m → EuclideanSpace ℂ ι) (y : Fin n → EuclideanSpace ℂ ι),
    (∀ i, ‖x i‖ = 1) → (∀ j, ‖y j‖ = 1) →
    ∃ (Ω : Type) (_ : MeasurableSpace Ω) (μ : Measure Ω) (_ : IsProbabilityMeasure μ)
      (ε : Ω → Fin m → ℂ) (δ : Ω → Fin n → ℂ),
      (∀ i, AEStronglyMeasurable (fun ω => ε ω i) μ) ∧
      (∀ j, AEStronglyMeasurable (fun ω => δ ω j) μ) ∧
      (∀ ω i, ‖ε ω i‖ ≤ 1) ∧ (∀ ω j, ‖δ ω j‖ ≤ 1) ∧
      ∀ i j, ∫ ω, conj (ε ω i) * δ ω j ∂μ = Q (inner ℂ (x i) (y j))

theorem DiskKernel.dominated {Q : ℂ → ℂ} (hQ : DiskKernel Q) : DominatedKernel Q := by
  intro m n A ι _ x y hx hy
  obtain ⟨Ω, _, μ, _, ε, δ, hεm, hδm, hε1, hδ1, hint⟩ := hQ m n ι x y hx hy
  have hmeas : ∀ i j, AEStronglyMeasurable (fun ω => conj (ε ω i) * δ ω j) μ := fun i j =>
    (Complex.continuous_conj.comp_aestronglyMeasurable (hεm i)).mul (hδm j)
  have hint' : ∀ i j, Integrable (fun ω => conj (ε ω i) * δ ω j) μ := fun i j =>
    Integrable.mono' (integrable_const (1 : ℝ)) (hmeas i j)
      (Filter.Eventually.of_forall fun ω => by
        rw [norm_mul, Complex.norm_conj]
        exact (mul_le_mul (hε1 ω i) (hδ1 ω j) (norm_nonneg _) zero_le_one).trans (one_mul 1).le)
  have e : ∫ ω, ∑ i, ∑ j, A i j * (conj (ε ω i) * δ ω j) ∂μ
      = ∑ i, ∑ j, A i j * Q (inner ℂ (x i) (y j)) := by
    rw [integral_finsetSum _ fun i _ => integrable_finsetSum _ fun j _ => (hint' i j).const_mul _]
    refine sum_congr rfl fun i _ => ?_
    rw [integral_finsetSum _ fun j _ => (hint' i j).const_mul _]
    refine sum_congr rfl fun j _ => ?_
    rw [integral_const_mul, hint]
  rw [← e]
  calc ‖∫ ω, ∑ i, ∑ j, A i j * (conj (ε ω i) * δ ω j) ∂μ‖
      ≤ ∫ ω, ‖∑ i, ∑ j, A i j * (conj (ε ω i) * δ ω j)‖ ∂μ := norm_integral_le_integral_norm _
    _ ≤ ∫ _ω, scalarOpt A ∂μ :=
        integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => norm_nonneg _)
          (integrable_const _)
          (Filter.Eventually.of_forall fun ω =>
            norm_pairing_le_scalarOpt A (fun i => hε1 ω i) (fun j => hδ1 ω j))
    _ = scalarOpt A := by simp

section TensorRealise

abbrev RIdx (ι : Type) (N : ℕ) : Type := (Σ j : Fin N, TIdx ι j) ⊕ Bool

def realVec {ι : Type} [Fintype ι] (N : ℕ) (α : ℕ → ℂ) (a b : ℂ) (x : EuclideanSpace ℂ ι) :
    EuclideanSpace ℂ (RIdx ι N) :=
  WithLp.toLp 2 fun
    | Sum.inl q => α q.1 * tpow q.1 x q.2
    | Sum.inr true => a
    | Sum.inr false => b

private lemma inner_realVec {ι : Type} [Fintype ι] (N : ℕ) (α β : ℕ → ℂ) (a b a' b' : ℂ)
    (x y : EuclideanSpace ℂ ι) :
    inner ℂ (realVec N α a b x) (realVec N β a' b' y)
      = ∑ j ∈ range N, conj (α j) * β j * inner ℂ (tpow j x) (tpow j y)
        + (conj a * a' + conj b * b') := by
  rw [PiLp.inner_apply, Fintype.sum_sum_type, Fintype.sum_sigma, Fintype.sum_bool]
  simp only [realVec, PiLp.toLp_apply, RCLike.inner_apply]
  congr 1
  · rw [← Fin.sum_univ_eq_sum_range]
    refine sum_congr rfl fun j _ => ?_
    rw [PiLp.inner_apply, mul_sum]
    exact sum_congr rfl fun _ _ => by simp only [RCLike.inner_apply, map_mul]; ring
  · ring

private def sgn (r : ℝ) : ℝ := if r < 0 then -1 else 1

def realL {ι : Type} [Fintype ι] (P : ℝ[X]) (x : EuclideanSpace ℂ ι) :
    EuclideanSpace ℂ (RIdx ι (P.natDegree + 1)) :=
  realVec (P.natDegree + 1) (fun j => ((√|P.coeff j| : ℝ) : ℂ)) 0 ((√(1 - l1 P) : ℝ) : ℂ) x

def realR {ι : Type} [Fintype ι] (P : ℝ[X]) (y : EuclideanSpace ℂ ι) :
    EuclideanSpace ℂ (RIdx ι (P.natDegree + 1)) :=
  realVec (P.natDegree + 1) (fun j => ((sgn (P.coeff j) * √|P.coeff j| : ℝ) : ℂ))
    ((√(1 - l1 P) : ℝ) : ℂ) 0 y

lemma inner_realL_realR {ι : Type} [Fintype ι] (P : ℝ[X]) (x y : EuclideanSpace ℂ ι) :
    inner ℂ (realL P x) (realR P y) = polyKernel P (inner ℂ x y) := by
  rw [realL, realR, inner_realVec, polyKernel, Polynomial.eval_eq_sum_range,
    Complex.ofReal_sum, mul_sum]
  simp only [Complex.conj_ofReal, map_zero, zero_mul, mul_zero, add_zero, inner_tpow]
  refine sum_congr rfl fun j _ => ?_
  have hsgn : sgn (P.coeff j) * |P.coeff j| = P.coeff j := by
    unfold sgn; split_ifs with h
    · rw [abs_of_neg h]; ring
    · rw [abs_of_nonneg (not_lt.1 h)]; ring
  have e : ((√|P.coeff j| : ℝ) : ℂ) * ((sgn (P.coeff j) * √|P.coeff j| : ℝ) : ℂ)
      = (P.coeff j : ℂ) := by
    rw [← Complex.ofReal_mul, mul_left_comm, Real.mul_self_sqrt (abs_nonneg _), hsgn]
  rw [e]; push_cast; rw [pow_mul]; ring

private lemma inner_self_realVec_of_unit {ι : Type} [Fintype ι] (P : ℝ[X])
    (w : ℕ → ℝ) (hw : ∀ j, w j ^ 2 = |P.coeff j|) {a b : ℝ} (hab : a ^ 2 + b ^ 2 = 1 - l1 P)
    (x : EuclideanSpace ℂ ι) (hx : ‖x‖ = 1) :
    ‖realVec (P.natDegree + 1) (fun j => ((w j : ℝ) : ℂ)) (a : ℂ) (b : ℂ) x‖ = 1 := by
  have hxx : inner ℂ x x = (1 : ℂ) := by rw [inner_self_eq_norm_sq_to_K, hx]; simp
  have h1 : inner ℂ (realVec (P.natDegree + 1) (fun j => ((w j : ℝ) : ℂ)) (a : ℂ) (b : ℂ) x)
      (realVec (P.natDegree + 1) (fun j => ((w j : ℝ) : ℂ)) (a : ℂ) (b : ℂ) x) = 1 := by
    rw [inner_realVec]
    simp only [inner_tpow, hxx, norm_one, Complex.ofReal_one, one_pow, mul_one, Complex.conj_ofReal]
    have hs : ∑ j ∈ range (P.natDegree + 1), ((w j : ℝ) : ℂ) * (w j : ℂ) = ((l1 P : ℝ) : ℂ) := by
      rw [l1_eq_sum_range P (Nat.lt_succ_self _), Complex.ofReal_sum]
      exact sum_congr rfl fun j _ => by rw [← hw j]; push_cast; ring
    rw [hs, show ((a : ℂ) * a + (b : ℂ) * b) = ((1 - l1 P : ℝ) : ℂ) by rw [← hab]; push_cast; ring]
    push_cast; ring
  have h2 := inner_self_eq_norm_sq_to_K (𝕜 := ℂ)
    (realVec (P.natDegree + 1) (fun j => ((w j : ℝ) : ℂ)) (a : ℂ) (b : ℂ) x)
  rw [h1] at h2
  have h3 : (‖realVec (P.natDegree + 1) (fun j => ((w j : ℝ) : ℂ)) (a : ℂ) (b : ℂ) x‖ : ℝ) ^ 2 = 1 := by
    have h4 : (((‖realVec (P.natDegree + 1) (fun j => ((w j : ℝ) : ℂ)) (a : ℂ) (b : ℂ) x‖ : ℝ)
      ^ 2 : ℝ) : ℂ) = 1 := by rw [h2]; push_cast; rfl
    exact_mod_cast h4
  exact (pow_eq_one_iff_of_nonneg (norm_nonneg _) two_ne_zero).1 h3

lemma norm_realL {ι : Type} [Fintype ι] (P : ℝ[X]) (hP : l1 P ≤ 1) (x : EuclideanSpace ℂ ι)
    (hx : ‖x‖ = 1) : ‖realL P x‖ = 1 :=
  inner_self_realVec_of_unit P (fun j => √|P.coeff j|) (fun _ => Real.sq_sqrt (abs_nonneg _))
    (by rw [Real.sq_sqrt (by linarith)]; ring) x hx

lemma norm_realR {ι : Type} [Fintype ι] (P : ℝ[X]) (hP : l1 P ≤ 1) (y : EuclideanSpace ℂ ι)
    (hy : ‖y‖ = 1) : ‖realR P y‖ = 1 :=
  inner_self_realVec_of_unit P (fun j => sgn (P.coeff j) * √|P.coeff j|)
    (fun j => by rw [mul_pow, Real.sq_sqrt (abs_nonneg _)]; unfold sgn; split_ifs <;> ring)
    (by rw [Real.sq_sqrt (by linarith)]; ring) y hy

private def embOpt {ι : Type} [Fintype ι] (x : EuclideanSpace ℂ ι) : EuclideanSpace ℂ (Option ι) :=
  WithLp.toLp 2 fun | none => 0 | some i => x i

private def eNone (ι : Type) [Fintype ι] : EuclideanSpace ℂ (Option ι) :=
  WithLp.toLp 2 fun | none => 1 | some _ => 0

private lemma inner_embOpt {ι : Type} [Fintype ι] (x y : EuclideanSpace ℂ ι) :
    inner ℂ (embOpt x) (embOpt y) = inner ℂ x y := by
  simp [embOpt, PiLp.inner_apply, Fintype.sum_option]

private lemma norm_embOpt {ι : Type} [Fintype ι] {x : EuclideanSpace ℂ ι} (hx : ‖x‖ = 1) :
    ‖embOpt x‖ = 1 := by
  have hxx : inner ℂ x x = (1 : ℂ) := by rw [inner_self_eq_norm_sq_to_K, hx]; simp
  have h1 : inner ℂ (embOpt x) (embOpt x) = (1 : ℂ) := by rw [inner_embOpt, hxx]
  rw [inner_self_eq_norm_sq_to_K] at h1
  change (Complex.ofReal ‖embOpt x‖) ^ 2 = 1 at h1
  rw [← Complex.ofReal_pow, Complex.ofReal_eq_one] at h1
  nlinarith [norm_nonneg (embOpt x)]

private lemma norm_eNone (ι : Type) [Fintype ι] : ‖eNone ι‖ = 1 := by
  have h1 : inner ℂ (eNone ι) (eNone ι) = (1 : ℂ) := by
    rw [PiLp.inner_apply, Fintype.sum_option]; simp [eNone]
  rw [inner_self_eq_norm_sq_to_K] at h1
  change (Complex.ofReal ‖eNone ι‖) ^ 2 = 1 at h1
  rw [← Complex.ofReal_pow, Complex.ofReal_eq_one] at h1
  nlinarith [norm_nonneg (eNone ι)]

private lemma inner_embOpt_eNone {ι : Type} [Fintype ι] (x : EuclideanSpace ℂ ι) :
    inner ℂ (embOpt x) (eNone ι) = 0 := by
  simp [eNone, embOpt, PiLp.inner_apply, Fintype.sum_option]

private lemma exists_decomp {κ : Type} [Fintype κ] {x y e : EuclideanSpace ℂ κ}
    (hx : ‖x‖ = 1) (hy : ‖y‖ = 1) (he : ‖e‖ = 1) (hxe : inner ℂ x e = 0) :
    ∃ w : EuclideanSpace ℂ κ, ‖w‖ = 1 ∧ inner ℂ x w = 0 ∧
      y = inner ℂ x y • x + sig (inner ℂ x y) • w := by
  have hxx : inner ℂ x x = 1 := by rw [inner_self_eq_norm_sq_to_K, hx]; simp
  set z := inner ℂ x y
  set r := y - z • x with hr
  have hxr : inner ℂ x r = 0 := by rw [hr, inner_sub_right, inner_smul_right, hxx]; simp [z]
  have hpy : ‖r‖ ^ 2 = 1 - ‖z‖ ^ 2 := by
    have h := norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero (z • x) r
      (by rw [inner_smul_left, hxr, mul_zero])
    rw [show z • x + r = y by rw [hr]; abel, hy, norm_smul, hx] at h; linarith
  have hsr : sig z = ((‖r‖ : ℝ) : ℂ) := by
    simp only [sig]; rw [← hpy, Real.sqrt_sq (norm_nonneg _)]
  rcases eq_or_ne r 0 with h0 | h0
  · refine ⟨e, he, hxe, ?_⟩
    rw [hsr, h0, norm_zero, Complex.ofReal_zero, zero_smul, add_zero, ← sub_eq_zero]; exact h0
  · have hn : (‖r‖ : ℂ) ≠ 0 := by exact_mod_cast norm_ne_zero_iff.2 h0
    refine ⟨((‖r‖ : ℂ))⁻¹ • r, ?_, ?_, ?_⟩
    · rw [norm_smul, norm_inv, Complex.norm_real, Real.norm_of_nonneg (norm_nonneg _),
        inv_mul_cancel₀ (norm_ne_zero_iff.2 h0)]
    · rw [inner_smul_right, hxr, mul_zero]
    · rw [hsr, smul_smul, mul_inv_cancel₀ hn, one_smul, hr]; abel

private def gaussPi (κ : Type) [Fintype κ] : Measure (κ → ℂ) := Measure.pi fun _ => gaussC

private instance (κ : Type) [Fintype κ] : IsProbabilityMeasure (gaussPi κ) := by
  unfold gaussPi; infer_instance

private def projC {κ : Type} [Fintype κ] (u : EuclideanSpace ℂ κ) : (κ → ℂ) →L[ℝ] ℂ :=
  LinearMap.toContinuousLinearMap
    { toFun := fun g => ∑ k : κ, conj (g k) * u k
      map_add' := fun g₁ g₂ => by simp_rw [Pi.add_apply, map_add, add_mul, sum_add_distrib]
      map_smul' := fun r g => by
        simp only [Pi.smul_apply, Complex.real_smul, map_mul, Complex.conj_ofReal,
          RingHom.id_apply, mul_assoc, ← mul_sum] }

private lemma projC_linear {κ : Type} [Fintype κ] (ρ σ : ℂ) (a w : EuclideanSpace ℂ κ)
    (g : κ → ℂ) : projC (ρ • a + σ • w) g = ρ * projC a g + σ * projC w g := by
  simp only [projC, LinearMap.coe_toContinuousLinearMap', LinearMap.coe_mk, AddHom.coe_mk,
    PiLp.add_apply, PiLp.smul_apply, smul_eq_mul]
  rw [mul_sum, mul_sum, ← sum_add_distrib]
  exact sum_congr rfl fun _ _ => by ring

private lemma map_pairProj {κ : Type} [Fintype κ] {a w : EuclideanSpace ℂ κ}
    (ha : ‖a‖ = 1) (hw : ‖w‖ = 1) (haw : inner ℂ a w = 0) :
    (gaussPi κ).map (fun g => (projC a g, projC w g)) = mu2 := by
  classical
  set Φ : (κ → ℂ) →L[ℝ] ℂ × ℂ := (projC a).prod (projC w)
  change (gaussPi κ).map Φ = mu2
  apply Measure.ext_of_charFunDual
  ext L
  set L₁ : StrongDual ℝ ℂ := L.comp (.inl ℝ ℂ ℂ)
  set L₂ : StrongDual ℝ ℂ := L.comp (.inr ℝ ℂ ℂ)
  have hL : ∀ p : ℂ × ℂ, L p = L₁ p.1 + L₂ p.2 := fun p => by
    conv_lhs => rw [show p = (p.1, 0) + (0, p.2) by ext <;> simp]
    rw [map_add]; rfl
  rw [charFunDual_map, gaussPi, charFunDual_pi, show mu2 = gaussC.prod gaussC from rfl,
    charFunDual_prod, charFunDual_gaussC, charFunDual_gaussC, ← Complex.exp_add]
  simp_rw [charFunDual_gaussC, ← Complex.exp_sum]
  congr 1
  have hsingle : ∀ (k : κ) (z : ℂ),
      ((L.comp Φ).comp (.single ℝ (fun _ : κ => ℂ) k)) z =
        L₁ (conj z * a k) + L₂ (conj z * w k) := fun k z => by
    change L (projC a (Pi.single k z), projC w (Pi.single k z)) = _
    rw [hL]
    have hp : ∀ u : EuclideanSpace ℂ κ, projC u (Pi.single k z) = conj z * u k := fun u => by
      simp only [projC, LinearMap.coe_toContinuousLinearMap', LinearMap.coe_mk, AddHom.coe_mk]
      rw [sum_eq_single k]
      · simp
      · intro j _ hjk; simp [Pi.single_eq_of_ne hjk]
      · intro hk; exact absurd (Finset.mem_univ k) hk
    rw [hp, hp]
  have hterm : ∀ k : κ,
      ((((L.comp Φ).comp (.single ℝ (fun _ : κ => ℂ) k)) 1) ^ 2 +
        (((L.comp Φ).comp (.single ℝ (fun _ : κ => ℂ) k)) Complex.I) ^ 2) =
        ((a k).re ^ 2 + (a k).im ^ 2) * (L₁ 1 ^ 2 + L₁ Complex.I ^ 2) +
        ((w k).re ^ 2 + (w k).im ^ 2) * (L₂ 1 ^ 2 + L₂ Complex.I ^ 2) +
        2 * ((a k).re * (w k).re + (a k).im * (w k).im) * (L₁ 1 * L₂ 1 + L₁ Complex.I * L₂ Complex.I) +
        2 * ((a k).re * (w k).im - (a k).im * (w k).re) * (L₁ 1 * L₂ Complex.I - L₁ Complex.I * L₂ 1) := by
    intro k
    rw [hsingle k 1, hsingle k Complex.I]
    simp only [map_one, one_mul, Complex.conj_I]
    rw [dual_complex_apply L₁ (a k), dual_complex_apply L₂ (w k),
      dual_complex_apply L₁ (-Complex.I * a k), dual_complex_apply L₂ (-Complex.I * w k)]
    simp only [Complex.mul_re, Complex.mul_im, Complex.neg_re, Complex.neg_im,
      Complex.I_re, Complex.I_im, neg_zero, zero_mul, neg_one_mul, zero_sub, neg_neg]
    ring
  have ha1 : ∑ k : κ, ((a k).re ^ 2 + (a k).im ^ 2) = 1 := by
    have h1 : inner ℂ a a = 1 := by rw [inner_self_eq_norm_sq_to_K, ha]; simp
    have h2 := congrArg Complex.re h1
    simp only [PiLp.inner_apply, RCLike.inner_apply, Complex.re_sum, Complex.one_re,
      Complex.mul_re, Complex.conj_re, Complex.conj_im] at h2
    convert h2 using 1; exact sum_congr rfl fun _ _ => by ring
  have hw1 : ∑ k : κ, ((w k).re ^ 2 + (w k).im ^ 2) = 1 := by
    have h1 : inner ℂ w w = 1 := by rw [inner_self_eq_norm_sq_to_K, hw]; simp
    have h2 := congrArg Complex.re h1
    simp only [PiLp.inner_apply, RCLike.inner_apply, Complex.re_sum, Complex.one_re,
      Complex.mul_re, Complex.conj_re, Complex.conj_im] at h2
    convert h2 using 1; exact sum_congr rfl fun _ _ => by ring
  have haw_re : ∑ k : κ, ((a k).re * (w k).re + (a k).im * (w k).im) = 0 := by
    have h2 := congrArg Complex.re haw
    simp only [PiLp.inner_apply, RCLike.inner_apply, Complex.re_sum, Complex.zero_re,
      Complex.mul_re, Complex.conj_re, Complex.conj_im] at h2
    convert h2 using 1; exact sum_congr rfl fun _ _ => by ring
  have haw_im : ∑ k : κ, ((a k).re * (w k).im - (a k).im * (w k).re) = 0 := by
    have h2 := congrArg Complex.im haw
    simp only [PiLp.inner_apply, RCLike.inner_apply, Complex.im_sum, Complex.zero_im,
      Complex.mul_im, Complex.conj_re, Complex.conj_im] at h2
    convert h2 using 1; exact sum_congr rfl fun _ _ => by ring
  have hsumR : ∑ k : κ, ((((L.comp Φ).comp (.single ℝ (fun _ : κ => ℂ) k)) 1) ^ 2 +
      (((L.comp Φ).comp (.single ℝ (fun _ : κ => ℂ) k)) Complex.I) ^ 2) =
      (L₁ 1 ^ 2 + L₁ Complex.I ^ 2) + (L₂ 1 ^ 2 + L₂ Complex.I ^ 2) := by
    simp_rw [hterm]
    rw [sum_add_distrib, sum_add_distrib, sum_add_distrib, ← sum_mul, ← sum_mul,
      ← sum_mul, ← mul_sum, ← sum_mul, ← mul_sum, ha1, hw1, haw_re, haw_im]
    ring
  have hsumC : ∑ k : κ, -((((((L.comp Φ).comp (.single ℝ (fun _ : κ => ℂ) k)) 1) ^ 2 +
      (((L.comp Φ).comp (.single ℝ (fun _ : κ => ℂ) k)) Complex.I) ^ 2 : ℝ) : ℂ) / 4) =
      -(((L₁ 1 ^ 2 + L₁ Complex.I ^ 2 : ℝ) : ℂ) / 4) +
        -(((L₂ 1 ^ 2 + L₂ Complex.I ^ 2 : ℝ) : ℂ) / 4) := by
    rw [sum_neg_distrib, ← sum_div, ← Complex.ofReal_sum, hsumR]; push_cast; ring
  simpa only [neg_div] using hsumC

theorem rounding_diskKernel {G : ℂ × ℂ → ℂ} (hGm : Measurable G) (hG1 : ∀ u, ‖G u‖ ≤ 1)
    (hch : ∀ c u, ‖c‖ = 1 → G (rot2 c u) = c * G u) (hGL : MemLp G 2 mu2) {P Q : ℝ[X]}
    (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) :
    DiskKernel (radialKernel (bivarKernel P Q (energy (hGL.toLp G)))) := by
  intro m n ι _ x y hx hy
  let Ω₁ := Option (RIdx ι (P.natDegree + 1)) → ℂ
  let Ω₂ := Option (RIdx ι (Q.natDegree + 1)) → ℂ
  refine ⟨Ω₁ × Ω₂, inferInstance, (gaussPi _).prod (gaussPi _), inferInstance,
    fun q i => G (projC (embOpt (realL P (x i))) q.1, projC (embOpt (realL Q (x i))) q.2),
    fun q j => G (projC (embOpt (realR P (y j))) q.1, projC (embOpt (realR Q (y j))) q.2),
    fun _ => (hGm.comp (((projC _).continuous.measurable.comp measurable_fst).prodMk
      ((projC _).continuous.measurable.comp measurable_snd))).aestronglyMeasurable,
    fun _ => (hGm.comp (((projC _).continuous.measurable.comp measurable_fst).prodMk
      ((projC _).continuous.measurable.comp measurable_snd))).aestronglyMeasurable,
    fun _ _ => hG1 _, fun _ _ => hG1 _, fun i j => ?_⟩
  set a := embOpt (realL P (x i))
  set b := embOpt (realR P (y j))
  set a' := embOpt (realL Q (x i))
  set b' := embOpt (realR Q (y j))
  have ha : ‖a‖ = 1 := norm_embOpt (norm_realL P hP _ (hx i))
  have hb : ‖b‖ = 1 := norm_embOpt (norm_realR P hP _ (hy j))
  have ha' : ‖a'‖ = 1 := norm_embOpt (norm_realL Q hQ _ (hx i))
  have hb' : ‖b'‖ = 1 := norm_embOpt (norm_realR Q hQ _ (hy j))
  obtain ⟨w, hw, haw, hbw⟩ := exists_decomp ha hb (norm_eNone _) (inner_embOpt_eNone _)
  obtain ⟨w', hw', haw', hbw'⟩ := exists_decomp ha' hb' (norm_eNone _) (inner_embOpt_eNone _)
  have hρ₁ : inner ℂ a b = polyKernel P (inner ℂ (x i) (y j)) := by
    rw [inner_embOpt, inner_realL_realR]
  have hρ₂ : inner ℂ a' b' = polyKernel Q (inner ℂ (x i) (y j)) := by
    rw [inner_embOpt, inner_realL_realR]
  have h₁ : ‖polyKernel P (inner ℂ (x i) (y j))‖ ≤ 1 := by
    rw [← hρ₁]; simpa [ha, hb] using norm_inner_le_norm (𝕜 := ℂ) a b
  have h₂ : ‖polyKernel Q (inner ℂ (x i) (y j))‖ ≤ 1 := by
    rw [← hρ₂]; simpa [ha', hb'] using norm_inner_le_norm (𝕜 := ℂ) a' b'
  have hz : ‖inner ℂ (x i) (y j)‖ ≤ 1 := by
    simpa [hx i, hy j] using norm_inner_le_norm (𝕜 := ℂ) (x i) (y j)
  set ρ₁ := polyKernel P (inner ℂ (x i) (y j))
  set ρ₂ := polyKernel Q (inner ℂ (x i) (y j))
  set T : Ω₁ × Ω₂ → (ℂ × ℂ) × (ℂ × ℂ) :=
    Prod.map (fun g => (projC a g, projC w g)) (fun g => (projC a' g, projC w' g))
  have hTm : Measurable T :=
    (((projC a).continuous.measurable.prodMk (projC w).continuous.measurable)).prodMap
      (((projC a').continuous.measurable.prodMk (projC w').continuous.measurable))
  have hmapT : ((gaussPi _).prod (gaussPi _)).map T = mu4 := by
    rw [← Measure.map_prod_map _ _
      ((projC a).continuous.measurable.prodMk (projC w).continuous.measurable)
      ((projC a').continuous.measurable.prodMk (projC w').continuous.measurable),
      map_pairProj ha hw haw, map_pairProj ha' hw' haw']
  set Ψ : (ℂ × ℂ) × (ℂ × ℂ) → ℂ := fun ω => conj (G (Xof ω)) * G (Yof ρ₁ ρ₂ ω)
  have hΨm : Measurable Ψ :=
    (Complex.continuous_conj.measurable.comp (hGm.comp (by unfold Xof; fun_prop))).mul
      (hGm.comp ((measurable_mY ρ₁).prodMap (measurable_mY ρ₂)))
  have hpt : ∀ q : Ω₁ × Ω₂,
      conj (G (projC a q.1, projC a' q.2)) * G (projC b q.1, projC b' q.2) = Ψ (T q) := fun q => by
    dsimp only [Ψ, T, Prod.map, Xof, Yof, mY]
    congr 2
    rw [hbw, hbw', hρ₁, hρ₂, projC_linear, projC_linear]
  rw [integral_congr_ae (Filter.Eventually.of_forall hpt)]
  rw [← integral_map hTm.aemeasurable hΨm.aestronglyMeasurable, hmapT]
  exact (Bm_toLp hGL h₁ h₂).symm.trans (Bm_polyKernel (chargeOne_toLp hGL hch) hP hQ hz h₁ h₂)

end TensorRealise

/-! ### 4. Rotated Ornstein–Uhlenbeck smoothing `smoothMap` and `bCoeff` identity -/

def uRot (ct st : ℝ) (u : ℂ × ℂ) : ℂ × ℂ :=
  ((ct : ℂ) * u.1 + (st : ℂ) * u.2, -(st : ℂ) * u.1 + (ct : ℂ) * u.2)

def uRotInv (ct st : ℝ) (v : ℂ × ℂ) : ℂ × ℂ :=
  ((ct : ℂ) * v.1 - (st : ℂ) * v.2, (st : ℂ) * v.1 + (ct : ℂ) * v.2)

def smoothEff (ct st se ce : ℝ) (x z : ℂ × ℂ) : ℂ × ℂ :=
  ((ct : ℂ) * x.1 + (st : ℂ) * x.2,
   -(((se * st : ℝ) : ℂ)) * x.1 + ((se * ct : ℝ) : ℂ) * x.2 + (ce : ℂ) * z.2)

def smoothMap (ct st se ce : ℝ) (F : ℂ × ℂ → ℂ) (x : ℂ × ℂ) : ℂ :=
  ∫ z, F (smoothEff ct st se ce x z) ∂mu2

def m00Sym (ct st se : ℝ) : ℝ := ct ^ 2 + se * st ^ 2
def m01Sym (ct st se : ℝ) : ℝ := ct * st * (1 - se)
def m11Sym (ct st se : ℝ) : ℝ := st ^ 2 + se * ct ^ 2
def n00Sym (st ce : ℝ) : ℝ := ce * st ^ 2
def n01Sym (ct st ce : ℝ) : ℝ := -(ce * ct * st)
def n11Sym (ct ce : ℝ) : ℝ := ce * ct ^ 2

def smoothSym (m00 m01 m11 n00 n01 n11 : ℝ) (x z : ℂ × ℂ) : ℂ × ℂ :=
  ((m00 : ℂ) * x.1 + (m01 : ℂ) * x.2 + (n00 : ℂ) * z.1 + (n01 : ℂ) * z.2,
   (m01 : ℂ) * x.1 + (m11 : ℂ) * x.2 + (n01 : ℂ) * z.1 + (n11 : ℂ) * z.2)

lemma sym_mn_identities {ct st se ce : ℝ} (hd : ct ^ 2 + st ^ 2 = 1) (he : se ^ 2 + ce ^ 2 = 1) :
    (m00Sym ct st se ^ 2 + m01Sym ct st se ^ 2 + n00Sym st ce ^ 2 + n01Sym ct st ce ^ 2 = 1) ∧
    (m00Sym ct st se * m01Sym ct st se + m01Sym ct st se * m11Sym ct st se +
      n00Sym st ce * n01Sym ct st ce + n01Sym ct st ce * n11Sym ct ce = 0) ∧
    (m01Sym ct st se ^ 2 + m11Sym ct st se ^ 2 + n01Sym ct st ce ^ 2 + n11Sym ct ce ^ 2 = 1) := by
  simp only [m00Sym, m01Sym, m11Sym, n00Sym, n01Sym, n11Sym]
  refine ⟨?_, ?_, ?_⟩
  · linear_combination (ct ^ 2 + st ^ 2 + 1) * hd + (st ^ 2 * (ct ^ 2 + st ^ 2)) * he
  · linear_combination -(ct * st * (ct ^ 2 + st ^ 2)) * he
  · linear_combination (ct ^ 2 + st ^ 2 + 1) * hd + (ct ^ 2 * (ct ^ 2 + st ^ 2)) * he

lemma map_orth_mu2 {a b : ℝ} (hab : a ^ 2 + b ^ 2 = 1) :
    mu2.map (fun u : ℂ × ℂ => ((a : ℂ) * u.1 + (b : ℂ) * u.2, -(b : ℂ) * u.1 + (a : ℂ) * u.2)) =
      mu2 := by
  set Φ : ℂ × ℂ →L[ℝ] ℂ × ℂ :=
    LinearMap.toContinuousLinearMap
      { toFun := fun u => ((a : ℂ) * u.1 + (b : ℂ) * u.2, -(b : ℂ) * u.1 + (a : ℂ) * u.2)
        map_add' := fun u v => by ext <;> simp <;> ring
        map_smul' := fun r u => by ext <;> simp <;> ring }
  change mu2.map Φ = mu2
  apply Measure.ext_of_charFunDual
  ext L
  set L₁ : StrongDual ℝ ℂ := L.comp (.inl ℝ ℂ ℂ)
  set L₂ : StrongDual ℝ ℂ := L.comp (.inr ℝ ℂ ℂ)
  have hL : ∀ p : ℂ × ℂ, L p = L₁ p.1 + L₂ p.2 := fun p => by
    conv_lhs => rw [show p = (p.1, 0) + (0, p.2) by ext <;> simp]
    rw [map_add]; rfl
  rw [charFunDual_map, show mu2 = gaussC.prod gaussC from rfl, charFunDual_prod,
    charFunDual_prod, charFunDual_gaussC, charFunDual_gaussC, charFunDual_gaussC,
    charFunDual_gaussC, ← Complex.exp_add, ← Complex.exp_add]
  congr 1
  have hc1 : ∀ z : ℂ, ((L.comp Φ).comp (.inl ℝ ℂ ℂ)) z = L₁ ((a : ℂ) * z) + L₂ (-(b : ℂ) * z) :=
    fun z => by
      simp [ContinuousLinearMap.comp_apply, Φ, LinearMap.coe_toContinuousLinearMap', hL]
  have hc2 : ∀ z : ℂ, ((L.comp Φ).comp (.inr ℝ ℂ ℂ)) z = L₁ ((b : ℂ) * z) + L₂ ((a : ℂ) * z) :=
    fun z => by
      simp [ContinuousLinearMap.comp_apply, Φ, LinearMap.coe_toContinuousLinearMap', hL]
  have hreal : ∀ (ℓ : StrongDual ℝ ℂ) (r : ℝ) (z : ℂ), ℓ ((r : ℂ) * z) = r * ℓ z := fun ℓ r z => by
    rw [show (r : ℂ) * z = r • z by simp, map_smul, smul_eq_mul]
  have hneg : ∀ (ℓ : StrongDual ℝ ℂ) (r : ℝ) (z : ℂ), ℓ (-(r : ℂ) * z) = -(r * ℓ z) :=
    fun ℓ r z => by rw [neg_mul, map_neg, hreal]
  rw [hc1 1, hc1 Complex.I, hc2 1, hc2 Complex.I, hreal, hneg, hreal, hneg, hreal, hreal,
    hreal, hreal]
  have hid : ((a * L₁ 1 + -(b * L₂ 1)) ^ 2 + (a * L₁ Complex.I + -(b * L₂ Complex.I)) ^ 2) +
      ((b * L₁ 1 + a * L₂ 1) ^ 2 + (b * L₁ Complex.I + a * L₂ Complex.I) ^ 2) =
      (L₁ 1 ^ 2 + L₁ Complex.I ^ 2) + (L₂ 1 ^ 2 + L₂ Complex.I ^ 2) := by
    linear_combination (L₁ 1 ^ 2 + L₁ Complex.I ^ 2 + L₂ 1 ^ 2 + L₂ Complex.I ^ 2) * hab
  have hidC : (((a * L₁ 1 + -(b * L₂ 1)) ^ 2 + (a * L₁ Complex.I + -(b * L₂ Complex.I)) ^ 2 : ℝ) : ℂ) +
      (((b * L₁ 1 + a * L₂ 1) ^ 2 + (b * L₁ Complex.I + a * L₂ Complex.I) ^ 2 : ℝ) : ℂ) =
      ((L₁ 1 ^ 2 + L₁ Complex.I ^ 2 : ℝ) : ℂ) + ((L₂ 1 ^ 2 + L₂ Complex.I ^ 2 : ℝ) : ℂ) := by
    exact_mod_cast hid
  linear_combination -(1 / 4 : ℂ) * hidC

lemma smoothMap_eq_sym {ct st se ce : ℝ} (hd : ct ^ 2 + st ^ 2 = 1)
    {F : ℂ × ℂ → ℂ} (hFm : Measurable F) (x : ℂ × ℂ) :
    smoothMap ct st se ce F x =
      ∫ w, F (uRot ct st (smoothSym (m00Sym ct st se) (m01Sym ct st se) (m11Sym ct st se)
        (n00Sym st ce) (n01Sym ct st ce) (n11Sym ct ce) x w)) ∂mu2 := by
  have hd' : ct ^ 2 + (-st) ^ 2 = 1 := by linarith
  have hmap : mu2.map (uRotInv ct st) = mu2 := by
    convert map_orth_mu2 hd' using 2; (ext u <;> simp [uRotInv]); ring
  have hpt : ∀ z : ℂ × ℂ,
      uRot ct st (smoothSym (m00Sym ct st se) (m01Sym ct st se) (m11Sym ct st se)
        (n00Sym st ce) (n01Sym ct st ce) (n11Sym ct ce) x (uRotInv ct st z)) =
      smoothEff ct st se ce x z := fun z => by
    have hdC : (ct : ℂ) ^ 2 + (st : ℂ) ^ 2 = 1 := by exact_mod_cast hd
    ext <;> simp only [uRot, uRotInv, smoothSym, smoothEff, m00Sym, m01Sym, m11Sym,
      n00Sym, n01Sym, n11Sym] <;> push_cast
    · linear_combination ((ct : ℂ) * x.1 + (st : ℂ) * x.2) * hdC
    · linear_combination (-(se : ℂ) * (st : ℂ) * x.1 + (se : ℂ) * (ct : ℂ) * x.2 +
        ((ct : ℂ) ^ 2 + (st : ℂ) ^ 2 + 1) * (ce : ℂ) * z.2) * hdC
  have hm : AEStronglyMeasurable (fun w => F (uRot ct st (smoothSym (m00Sym ct st se)
      (m01Sym ct st se) (m11Sym ct st se) (n00Sym st ce) (n01Sym ct st ce) (n11Sym ct ce) x w)))
      (mu2.map (uRotInv ct st)) := by
    rw [hmap]
    exact (hFm.comp (by unfold uRot smoothSym; fun_prop)).aestronglyMeasurable
  have hi := integral_map (by unfold uRotInv; fun_prop : AEMeasurable (uRotInv ct st) mu2) hm
  rw [hmap] at hi
  rw [hi, smoothMap]
  exact integral_congr_ae (Filter.Eventually.of_forall fun z => congrArg F (hpt z).symm)

theorem measurable_smoothMap (ct st se ce : ℝ) {F : ℂ × ℂ → ℂ} (hFm : Measurable F) :
    Measurable (smoothMap ct st se ce F) := by
  have hm : Measurable fun p : (ℂ × ℂ) × (ℂ × ℂ) => F (smoothEff ct st se ce p.1 p.2) :=
    hFm.comp (by unfold smoothEff; fun_prop)
  exact hm.stronglyMeasurable.integral_prod_right'.measurable

theorem norm_smoothMap_le (ct st se ce : ℝ) {F : ℂ × ℂ → ℂ} (hF1 : ∀ v, ‖F v‖ ≤ 1) (x : ℂ × ℂ) :
    ‖smoothMap ct st se ce F x‖ ≤ 1 := by
  calc ‖∫ z, F (smoothEff ct st se ce x z) ∂mu2‖
      ≤ ∫ z, ‖F (smoothEff ct st se ce x z)‖ ∂mu2 := norm_integral_le_integral_norm _
    _ ≤ ∫ _z, (1 : ℝ) ∂mu2 := by
        by_cases hi : Integrable (fun z => ‖F (smoothEff ct st se ce x z)‖) mu2
        · exact integral_mono hi (integrable_const 1) fun z => hF1 _
        · rw [integral_undef hi]; simp
    _ = 1 := by simp

theorem smoothMap_rot2 (ct st se ce : ℝ) {F : ℂ × ℂ → ℂ}
    (hch : ∀ c v, ‖c‖ = 1 → F (rot2 c v) = c * F v) {c : ℂ} (hc : ‖c‖ = 1) (x : ℂ × ℂ) :
    smoothMap ct st se ce F (rot2 c x) = c * smoothMap ct st se ce F x := by
  unfold smoothMap
  have heq : ∫ z, F (smoothEff ct st se ce (rot2 c x) z) ∂mu2 =
      ∫ z, F (smoothEff ct st se ce (rot2 c x) (rot2 c z)) ∂mu2 := by
    have hc0 : c ≠ 0 := by rintro rfl; simp at hc
    let e : (ℂ × ℂ) ≃ᵐ (ℂ × ℂ) :=
      { toFun := rot2 c, invFun := rot2 c⁻¹,
        left_inv := fun u => by ext <;> simp [rot2, hc0],
        right_inv := fun u => by ext <;> simp [rot2, hc0],
        measurable_toFun := by show Measurable fun u : ℂ × ℂ => (c * u.1, c * u.2); fun_prop,
        measurable_invFun := by show Measurable fun u : ℂ × ℂ => (c⁻¹ * u.1, c⁻¹ * u.2); fun_prop }
    have := integral_map_equiv e (fun z => F (smoothEff ct st se ce (rot2 c x) z)) (μ := mu2)
    rwa [show (⇑e) = rot2 c from rfl, map_rot2 hc] at this
  rw [heq]
  have hpt : ∀ z, smoothEff ct st se ce (rot2 c x) (rot2 c z) = rot2 c (smoothEff ct st se ce x z) :=
    fun z => by ext <;> simp [smoothEff, rot2] <;> ring
  simp_rw [hpt, hch c _ hc]
  exact integral_const_mul c _

lemma memLp_smoothMap (ct st se ce : ℝ) {F : ℂ × ℂ → ℂ} (hFm : Measurable F)
    (hF1 : ∀ v, ‖F v‖ ≤ 1) : MemLp (smoothMap ct st se ce F) 2 mu2 :=
  MemLp.of_bound (measurable_smoothMap ct st se ce hFm).aestronglyMeasurable 1
    (Filter.Eventually.of_forall (norm_smoothMap_le ct st se ce hF1))

/-! ### 5. Exact square-root-free binomial Hermite expansion `integral_H2_smoothMap` -/

def bCoeff (u0 u1 v0 v1 : ℝ) : ℕ → ℕ → ℕ → ℝ
  | 0, 0, j => if j = 0 then 1 else 0
  | 0, b + 1, j =>
    v0 * (if j = 0 then 0 else bCoeff u0 u1 v0 v1 0 b (j - 1)) + v1 * bCoeff u0 u1 v0 v1 0 b j
  | a + 1, b, j =>
    u0 * (if j = 0 then 0 else bCoeff u0 u1 v0 v1 a b (j - 1)) + u1 * bCoeff u0 u1 v0 v1 a b j

lemma bCoeff_eq_zero_of_gt (u0 u1 v0 v1 : ℝ) :
    ∀ a b j, a + b < j → bCoeff u0 u1 v0 v1 a b j = 0
  | 0, 0, j, hj => by simp [bCoeff, show j ≠ 0 by omega]
  | 0, b + 1, j, hj => by
    rcases j with _ | j
    · omega
    · simp [bCoeff, bCoeff_eq_zero_of_gt u0 u1 v0 v1 0 b j (by omega),
        bCoeff_eq_zero_of_gt u0 u1 v0 v1 0 b (j + 1) (by omega)]
  | a + 1, b, j, hj => by
    rcases j with _ | j
    · omega
    · simp [bCoeff, bCoeff_eq_zero_of_gt u0 u1 v0 v1 a b j (by omega),
        bCoeff_eq_zero_of_gt u0 u1 v0 v1 a b (j + 1) (by omega)]

lemma bCoeff_scale (ct st se : ℝ) :
    ∀ a b j, j ≤ a + b →
      bCoeff ct (-st) st ct a b j * se ^ (a + b - j) =
        bCoeff ct (-(se * st)) st (se * ct) a b j := by
  intro a
  induction a with
  | zero =>
    intro b
    induction b with
    | zero =>
      intro j hj
      obtain rfl : j = 0 := by omega
      simp [bCoeff]
    | succ b ihb =>
      intro j hj
      cases j with
      | zero =>
        simp only [bCoeff, ↓reduceIte, mul_zero, zero_add, Nat.sub_zero, pow_succ]
        have h0 := ihb 0 (by omega)
        simp only [Nat.zero_add, Nat.sub_zero] at h0
        rw [← h0]; ring
      | succ j =>
        simp only [bCoeff, Nat.add_eq_zero_iff, one_ne_zero, and_false, ↓reduceIte,
          Nat.add_sub_cancel, Nat.zero_add]
        have h1 := ihb j (by omega)
        simp only [Nat.zero_add] at h1
        rw [show b + 1 - (j + 1) = b - j by omega]
        by_cases hjb : j + 1 ≤ b
        · have h2 := ihb (j + 1) (by omega)
          simp only [Nat.zero_add] at h2
          rw [show b - j = (b - (j + 1)) + 1 by omega, pow_succ] at h1 ⊢
          linear_combination st * h1 + se * ct * h2
        · have hgt : 0 + b < j + 1 := by omega
          rw [bCoeff_eq_zero_of_gt _ _ _ _ 0 b (j + 1) hgt,
            bCoeff_eq_zero_of_gt _ _ _ _ 0 b (j + 1) hgt]
          linear_combination st * h1
  | succ a iha =>
    intro b j hj
    cases j with
    | zero =>
      simp only [bCoeff, ↓reduceIte, mul_zero, zero_add, Nat.sub_zero]
      have h0 := iha b 0 (by omega)
      simp only [Nat.sub_zero] at h0
      rw [show a + 1 + b = (a + b) + 1 by omega, pow_succ, ← h0]; ring
    | succ j =>
      simp only [bCoeff, Nat.add_eq_zero_iff, one_ne_zero, and_false, ↓reduceIte, Nat.add_sub_cancel]
      have h1 := iha b j (by omega)
      rw [show a + 1 + b - (j + 1) = a + b - j by omega]
      by_cases hjb : j + 1 ≤ a + b
      · have h2 := iha b (j + 1) hjb
        rw [show a + b - j = (a + b - (j + 1)) + 1 by omega, pow_succ] at h1 ⊢
        linear_combination ct * h1 - st * se * h2
      · have hgt : a + b < j + 1 := by omega
        rw [bCoeff_eq_zero_of_gt _ _ _ _ a b (j + 1) hgt,
          bCoeff_eq_zero_of_gt _ _ _ _ a b (j + 1) hgt]
        linear_combination ct * h1

private lemma comm_linear_binom {V : Type*} [AddCommGroup V] [Module ℂ V]
    (L0 L1 : V →ₗ[ℂ] V) (hcomm : ∀ v, L0 (L1 v) = L1 (L0 v)) (u0 u1 v0 v1 : ℝ) (x : V) :
    ∀ a b : ℕ,
      ((u0 : ℂ) • L0 + (u1 : ℂ) • L1)^[a] ((((v0 : ℂ) • L0 + (v1 : ℂ) • L1))^[b] x) =
        ∑ j ∈ range (a + b + 1),
          ((bCoeff u0 u1 v0 v1 a b j : ℝ) : ℂ) • (L0^[j] (L1^[a + b - j] x)) := by
  have hL0_iter : ∀ k v, L1 (L0^[k] v) = L0^[k] (L1 v) := fun k v => by
    induction k generalizing v with
    | zero => rfl
    | succ k ih => rw [Function.iterate_succ_apply', Function.iterate_succ_apply', ← hcomm, ih]
  have step : ∀ (c0 c1 : ℝ) (n : ℕ) (f : ℕ → ℝ) (_hf0 : ∀ j, n < j → f j = 0),
      ((c0 : ℂ) • L0 + (c1 : ℂ) • L1)
          (∑ j ∈ range (n + 1), ((f j : ℝ) : ℂ) • (L0^[j] (L1^[n - j] x))) =
        ∑ j ∈ range (n + 2),
          ((c0 * (if j = 0 then 0 else f (j - 1)) + c1 * f j : ℝ) : ℂ) •
            (L0^[j] (L1^[n + 1 - j] x)) := by
    intro c0 c1 n f hf0
    rw [LinearMap.add_apply, LinearMap.smul_apply, LinearMap.smul_apply, map_sum, map_sum,
      Finset.smul_sum, Finset.smul_sum]
    simp only [map_smul, smul_smul]
    have s1 : ∑ j ∈ range (n + 1), ((c0 : ℂ) * f j) • L0 (L0^[j] (L1^[n - j] x)) =
        ∑ j ∈ range (n + 2), ((c0 * (if j = 0 then 0 else f (j - 1)) : ℝ) : ℂ) •
          (L0^[j] (L1^[n + 1 - j] x)) := by
      rw [sum_range_succ' _ (n + 1)]
      simp only [↓reduceIte, mul_zero, Complex.ofReal_zero, zero_smul, add_zero]
      refine sum_congr rfl fun j _ => ?_
      simp only [Nat.succ_ne_zero, ↓reduceIte, Nat.add_sub_cancel, Function.iterate_succ_apply']
      push_cast; rfl
    have s2 : ∑ j ∈ range (n + 1), ((c1 : ℂ) * f j) • L1 (L0^[j] (L1^[n - j] x)) =
        ∑ j ∈ range (n + 2), ((c1 * f j : ℝ) : ℂ) • (L0^[j] (L1^[n + 1 - j] x)) := by
      rw [sum_range_succ _ (n + 1), hf0 (n + 1) (by omega), mul_zero, Complex.ofReal_zero,
        zero_smul, add_zero]
      refine sum_congr rfl fun j hj => ?_
      have hjn : j ≤ n := Nat.lt_succ_iff.1 (mem_range.1 hj)
      rw [hL0_iter, ← Function.iterate_succ_apply' L1, show (n - j).succ = n + 1 - j by omega]
      push_cast; rfl
    rw [s1, s2, ← sum_add_distrib]
    exact sum_congr rfl fun j _ => by rw [← add_smul]; push_cast; rfl
  intro a b
  induction a with
  | zero =>
    induction b with
    | zero => simp [bCoeff]
    | succ b ih =>
      rw [Function.iterate_zero_apply, Function.iterate_succ_apply']
      rw [Function.iterate_zero_apply] at ih
      simp only [Nat.zero_add] at ih ⊢
      rw [ih, step v0 v1 b (bCoeff u0 u1 v0 v1 0 b)
        (fun j hj => bCoeff_eq_zero_of_gt u0 u1 v0 v1 0 b j (by omega))]
      refine sum_congr rfl fun j _ => ?_
      simp only [bCoeff]
  | succ a ih =>
    rw [Function.iterate_succ_apply', ih,
      step u0 u1 (a + b) (bCoeff u0 u1 v0 v1 a b) (bCoeff_eq_zero_of_gt u0 u1 v0 v1 a b)]
    have hr : range (a + b + 2) = range (a + 1 + b + 1) := by congr 1; omega
    rw [hr]
    refine sum_congr rfl fun j _ => ?_
    rw [show a + b + 1 - j = a + 1 + b - j by omega]
    simp only [bCoeff]

private def mk2 (a b : ℕ) : Fin 2 →₀ ℕ := Finsupp.equivFunOnFinite.symm ![a, b]

@[simp] private lemma mk2_apply_zero (a b : ℕ) : mk2 a b 0 = a := rfl
@[simp] private lemma mk2_apply_one (a b : ℕ) : mk2 a b 1 = b := rfl

private lemma mk2_zero : mk2 0 0 = 0 := by
  ext i; fin_cases i <;> simp [mk2]

private lemma single0_add_mk2 (a b : ℕ) : Finsupp.single 0 1 + mk2 a b = mk2 (a + 1) b := by
  ext i; fin_cases i <;> simp [mk2, add_comm]

private lemma single1_add_mk2 (a b : ℕ) : Finsupp.single 1 1 + mk2 a b = mk2 a (b + 1) := by
  ext i; fin_cases i <;> simp [mk2, add_comm]

private lemma mk2_sub_single0 (a b : ℕ) : mk2 a b - Finsupp.single 0 1 = mk2 (a - 1) b := by
  ext i; fin_cases i <;> simp [mk2]

private lemma mk2_sub_single1 (a b : ℕ) : mk2 a b - Finsupp.single 1 1 = mk2 a (b - 1) := by
  ext i; fin_cases i <;> simp [mk2]

private def toFinsuppL : P4 →ₗ[ℂ] (Fin 4 →₀ ℕ) →₀ ℂ where
  toFun := AddMonoidAlgebra.coeff
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

private def monomialMomL (m : Fin 4 →₀ ℕ) : ℂ →ₗ[ℂ] CPoly where
  toFun c := MvPolynomial.monomial (mk2 (m 0) (m 1)) (c * mom (m 2) (m 3))
  map_add' a b := by rw [add_mul, map_add]
  map_smul' r a := by rw [RingHom.id_apply, smul_monomial, smul_eq_mul, smul_eq_mul, mul_assoc]

private def projW : P4 →ₗ[ℂ] CPoly :=
  (Finsupp.lsum ℂ monomialMomL).comp toFinsuppL

private lemma projW_monomial (m : Fin 4 →₀ ℕ) (c : ℂ) :
    projW (MvPolynomial.monomial m c) =
      MvPolynomial.monomial (mk2 (m 0) (m 1)) (c * mom (m 2) (m 3)) := by
  change (Finsupp.lsum ℂ monomialMomL) (Finsupp.single m c) = _
  simp [monomialMomL]

private lemma projW_one : projW 1 = 1 := by
  change projW (monomial 0 1) = monomial 0 1
  rw [projW_monomial]; simp [mk2_zero, mom]

private lemma projW_C_mul (a : ℂ) (P : P4) :
    projW (MvPolynomial.C a * P) = MvPolynomial.C a * projW P := by
  rw [C_mul', map_smul, C_mul']

private lemma projW_X0_mul (P : P4) :
    projW (MvPolynomial.X 0 * P) = MvPolynomial.X 0 * projW P := by
  induction P using MvPolynomial.induction_on' with
  | monomial m c =>
    rw [MvPolynomial.X, monomial_mul_monomial, one_mul, projW_monomial, projW_monomial,
      MvPolynomial.X, monomial_mul_monomial, one_mul, single0_add_mk2]
    simp [single_add_apply4]
  | add _ _ hP hQ => simp only [mul_add, map_add, hP, hQ]

private lemma projW_X1_mul (P : P4) :
    projW (MvPolynomial.X 1 * P) = MvPolynomial.X 1 * projW P := by
  induction P using MvPolynomial.induction_on' with
  | monomial m c =>
    rw [MvPolynomial.X, monomial_mul_monomial, one_mul, projW_monomial, projW_monomial,
      MvPolynomial.X, monomial_mul_monomial, one_mul, single1_add_mk2]
    simp [single_add_apply4]
  | add _ _ hP hQ => simp only [mul_add, map_add, hP, hQ]

private lemma projW_pderiv0 (P : P4) : projW (pderiv 0 P) = pderiv 0 (projW P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial m c =>
    rw [pderiv_monomial, projW_monomial, projW_monomial, pderiv_monomial, mk2_sub_single0]
    simp only [sub_single_apply4, Fin.isValue, Fin.reduceEq, ↓reduceIte, Nat.sub_zero,
      mk2_apply_zero]
    congr 1; ring
  | add _ _ hP hQ => simp only [map_add, hP, hQ]

private lemma projW_pderiv1 (P : P4) : projW (pderiv 1 P) = pderiv 1 (projW P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial m c =>
    rw [pderiv_monomial, projW_monomial, projW_monomial, pderiv_monomial, mk2_sub_single1]
    simp only [sub_single_apply4, Fin.isValue, Fin.reduceEq, ↓reduceIte, Nat.sub_zero,
      mk2_apply_one]
    congr 1; ring
  | add _ _ hP hQ => simp only [map_add, hP, hQ]

private lemma projW_X2_mul (P : P4) : projW (MvPolynomial.X 2 * P) = projW (pderiv 3 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial m c =>
    rw [MvPolynomial.X, monomial_mul_monomial, one_mul, pderiv_monomial,
      projW_monomial, projW_monomial]
    simp only [single_add_apply4, sub_single_apply4, Fin.reduceEq, ↓reduceIte, add_zero,
      Nat.sub_zero, mom_succ_left]
    congr 1; ring
  | add _ _ hP hQ => simp only [mul_add, map_add, hP, hQ]

private lemma projW_X3_mul (P : P4) : projW (MvPolynomial.X 3 * P) = projW (pderiv 2 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial m c =>
    rw [MvPolynomial.X, monomial_mul_monomial, one_mul, pderiv_monomial,
      projW_monomial, projW_monomial]
    simp only [single_add_apply4, sub_single_apply4, Fin.reduceEq, ↓reduceIte, add_zero,
      Nat.sub_zero, mom_succ_right]
    congr 1; ring
  | add _ _ hP hQ => simp only [mul_add, map_add, hP, hQ]

private lemma integrable_ev4_snd (v2 : ℂ) (P : P4) :
    Integrable (fun w2 => ev4 (v2, w2) P) gaussC := by
  induction P using MvPolynomial.induction_on' with
  | monomial m c =>
    have h : ∀ w2 : ℂ, ev4 (v2, w2) (monomial m c) =
        (c * (v2 ^ m 0 * conj v2 ^ m 1)) * (w2 ^ m 2 * conj w2 ^ m 3) :=
      fun w2 => by rw [ev4_monomial]; ring
    simp_rw [h]
    exact (integrable_monomial (m 2) (m 3)).const_mul _
  | add _ _ hP hQ => simp_rw [ev4, map_add]; exact hP.add hQ

private lemma ev_projW (v2 : ℂ) (P : P4) : ev v2 (projW P) = ∫ w2, ev4 (v2, w2) P ∂gaussC := by
  induction P using MvPolynomial.induction_on' with
  | monomial m c =>
    rw [projW_monomial, ev_monomial]
    have h : ∀ w2 : ℂ, ev4 (v2, w2) (monomial m c) =
        (c * (v2 ^ m 0 * conj v2 ^ m 1)) * (w2 ^ m 2 * conj w2 ^ m 3) :=
      fun w2 => by rw [ev4_monomial]; ring
    simp_rw [h]
    rw [integral_const_mul, integral_moment]
    simp only [mk2_apply_zero, mk2_apply_one, mom]
    ring
  | add P Q hP hQ =>
    have hev : ∀ u v : CPoly, ev v2 (u + v) = ev v2 u + ev v2 v := fun _ _ => map_add _ _ _
    have hev4 : ∀ w2 : ℂ, ev4 (v2, w2) (P + Q) = ev4 (v2, w2) P + ev4 (v2, w2) Q :=
      fun _ => map_add _ _ _
    rw [map_add, hev, hP, hQ]
    simp_rw [hev4]
    exact (integral_add (integrable_ev4_snd v2 P) (integrable_ev4_snd v2 Q)).symm

private def sY2 (se ce : ℝ) : CPoly →ₐ[ℂ] P4 :=
  MvPolynomial.aeval
    ![MvPolynomial.C (se : ℂ) * MvPolynomial.X 0 + MvPolynomial.C (ce : ℂ) * MvPolynomial.X 2,
      MvPolynomial.C (se : ℂ) * MvPolynomial.X 1 + MvPolynomial.C (ce : ℂ) * MvPolynomial.X 3]

private lemma ev4_sY2 (se ce : ℝ) (u : ℂ × ℂ) (g : CPoly) :
    ev4 u (sY2 se ce g) = ev ((se : ℂ) * u.1 + (ce : ℂ) * u.2) g := by
  induction g using MvPolynomial.induction_on with
  | C _ => simp [ev4, ev, sY2]
  | add _ _ hP hQ => simp only [map_add, ev4, ev] at *; rw [hP, hQ]
  | mul_X _ i hP =>
    simp only [map_mul, ev4, ev] at *; rw [hP]
    fin_cases i <;> simp [sY2, wv, zv, Complex.conj_ofReal]

private lemma pderiv0_sY2 (se ce : ℝ) (g : CPoly) :
    pderiv 0 (sY2 se ce g) = MvPolynomial.C (se : ℂ) * sY2 se ce (pderiv 0 g) := by
  rw [sY2, pderiv_aeval2]; simp [pderiv_X, Derivation.leibniz]; ring

private lemma pderiv1_sY2 (se ce : ℝ) (g : CPoly) :
    pderiv 1 (sY2 se ce g) = MvPolynomial.C (se : ℂ) * sY2 se ce (pderiv 1 g) := by
  rw [sY2, pderiv_aeval2]; simp [pderiv_X, Derivation.leibniz]; ring

private lemma pderiv2_sY2 (se ce : ℝ) (g : CPoly) :
    pderiv 2 (sY2 se ce g) = MvPolynomial.C (ce : ℂ) * sY2 se ce (pderiv 0 g) := by
  rw [sY2, pderiv_aeval2]; simp [pderiv_X, Derivation.leibniz]; ring

private lemma pderiv3_sY2 (se ce : ℝ) (g : CPoly) :
    pderiv 3 (sY2 se ce g) = MvPolynomial.C (ce : ℂ) * sY2 se ce (pderiv 1 g) := by
  rw [sY2, pderiv_aeval2]; simp [pderiv_X, Derivation.leibniz]; ring

private lemma projW_sY2_A0 {se ce : ℝ} (he : se ^ 2 + ce ^ 2 = 1) (g : CPoly) :
    projW (sY2 se ce (A0 g)) = MvPolynomial.C (se : ℂ) * A0 (projW (sY2 se ce g)) := by
  have hx : sY2 se ce (MvPolynomial.X 0) =
      MvPolynomial.C (se : ℂ) * MvPolynomial.X 0 + MvPolynomial.C (ce : ℂ) * MvPolynomial.X 2 := by
    simp [sY2]
  have heC : MvPolynomial.C (se : ℂ) * MvPolynomial.C (se : ℂ) +
      MvPolynomial.C (ce : ℂ) * MvPolynomial.C (ce : ℂ) = (1 : CPoly) := by
    rw [← map_mul, ← map_mul, ← map_add,
      show (se : ℂ) * se + (ce : ℂ) * ce = 1 by exact_mod_cast (by nlinarith : se * se + ce * ce = 1),
      map_one]
  rw [A0, map_sub, map_mul, hx, add_mul, mul_assoc, mul_assoc, map_sub, map_add,
    projW_C_mul, projW_C_mul, projW_X0_mul, projW_X2_mul, pderiv3_sY2, projW_C_mul,
    A0, ← projW_pderiv1, pderiv1_sY2, projW_C_mul]
  linear_combination (projW (sY2 se ce (pderiv 1 g))) * heC

private lemma projW_sY2_A1 {se ce : ℝ} (he : se ^ 2 + ce ^ 2 = 1) (g : CPoly) :
    projW (sY2 se ce (A1 g)) = MvPolynomial.C (se : ℂ) * A1 (projW (sY2 se ce g)) := by
  have hx : sY2 se ce (MvPolynomial.X 1) =
      MvPolynomial.C (se : ℂ) * MvPolynomial.X 1 + MvPolynomial.C (ce : ℂ) * MvPolynomial.X 3 := by
    simp [sY2]
  have heC : MvPolynomial.C (se : ℂ) * MvPolynomial.C (se : ℂ) +
      MvPolynomial.C (ce : ℂ) * MvPolynomial.C (ce : ℂ) = (1 : CPoly) := by
    rw [← map_mul, ← map_mul, ← map_add,
      show (se : ℂ) * se + (ce : ℂ) * ce = 1 by exact_mod_cast (by nlinarith : se * se + ce * ce = 1),
      map_one]
  rw [A1, map_sub, map_mul, hx, add_mul, mul_assoc, mul_assoc, map_sub, map_add,
    projW_C_mul, projW_C_mul, projW_X1_mul, projW_X3_mul, pderiv2_sY2, projW_C_mul,
    A1, ← projW_pderiv0, pderiv0_sY2, projW_C_mul]
  linear_combination (projW (sY2 se ce (pderiv 0 g))) * heC

private lemma A0_C_mul' (k : ℂ) (g : CPoly) : A0 (MvPolynomial.C k * g) = MvPolynomial.C k * A0 g := by
  simp only [A0, Derivation.leibniz, smul_eq_mul, pderiv_C, mul_zero, add_zero]; ring

private lemma A1_C_mul' (k : ℂ) (g : CPoly) : A1 (MvPolynomial.C k * g) = MvPolynomial.C k * A1 g := by
  simp only [A1, Derivation.leibniz, smul_eq_mul, pderiv_C, mul_zero, add_zero]; ring

private lemma projW_sY2_H {se ce : ℝ} (he : se ^ 2 + ce ^ 2 = 1) (r s : ℕ) :
    projW (sY2 se ce (H r s)) = MvPolynomial.C ((se ^ (r + s) : ℝ) : ℂ) * H r s := by
  induction r with
  | zero =>
    induction s with
    | zero => simp [H_zero_zero, projW_one]
    | succ s ih =>
      rw [H_zero_succ, projW_sY2_A1 he, ih, A1_C_mul', ← mul_assoc, ← map_mul, ← H_zero_succ]
      congr 2; push_cast; ring
  | succ r ih =>
    rw [H_succ_left, projW_sY2_A0 he, ih, A0_C_mul', ← mul_assoc, ← map_mul, ← H_succ_left]
    congr 2; push_cast; ring

private lemma ou_one_coord {se ce : ℝ} (he : se ^ 2 + ce ^ 2 = 1) (r s : ℕ) (v2 : ℂ) :
    ∫ w2, ev ((se : ℂ) * v2 + (ce : ℂ) * w2) (H r s) ∂gaussC =
      ((se ^ (r + s) : ℝ) : ℂ) * ev v2 (H r s) := by
  simp_rw [← ev4_sY2 se ce (v2, _)]
  rw [← ev_projW v2 (sY2 se ce (H r s)), projW_sY2_H he]
  simp [ev]

private def sZ : CPoly →ₐ[ℂ] P4 := MvPolynomial.aeval ![MvPolynomial.X 2, MvPolynomial.X 3]

private lemma ev4_sZ (u : ℂ × ℂ) (g : CPoly) : ev4 u (sZ g) = ev u.2 g := by
  induction g using MvPolynomial.induction_on with
  | C _ => simp [ev4, ev, sZ]
  | add _ _ hP hQ => simp only [map_add, ev4, ev] at *; rw [hP, hQ]
  | mul_X _ i hP => simp only [map_mul, ev4, ev] at *; rw [hP]; fin_cases i <;> simp [sZ, wv, zv]

private lemma pderiv0_sZ (g : CPoly) : pderiv 0 (sZ g) = 0 := by
  rw [sZ, pderiv_aeval2]; simp [pderiv_X]

private lemma pderiv1_sZ (g : CPoly) : pderiv 1 (sZ g) = 0 := by
  rw [sZ, pderiv_aeval2]; simp [pderiv_X]

private lemma pderiv2_sX (f : CPoly) : pderiv 2 (sX f) = 0 := by
  rw [sX, pderiv_aeval2]; simp [pderiv_X]

private lemma pderiv3_sX (f : CPoly) : pderiv 3 (sX f) = 0 := by
  rw [sX, pderiv_aeval2]; simp [pderiv_X]

private lemma pderiv2_sZ (g : CPoly) : pderiv 2 (sZ g) = sZ (pderiv 0 g) := by
  rw [sZ, pderiv_aeval2]; simp [pderiv_X]

private lemma pderiv3_sZ (g : CPoly) : pderiv 3 (sZ g) = sZ (pderiv 1 g) := by
  rw [sZ, pderiv_aeval2]; simp [pderiv_X]

private def B0a : P4 →ₗ[ℂ] P4 where
  toFun P := MvPolynomial.X 0 * P - pderiv 1 P
  map_add' P Q := by simp only [mul_add, map_add]; ring
  map_smul' c P := by rw [Derivation.map_smul, mul_smul_comm, smul_sub]; rfl

private def B0b : P4 →ₗ[ℂ] P4 where
  toFun P := MvPolynomial.X 2 * P - pderiv 3 P
  map_add' P Q := by simp only [mul_add, map_add]; ring
  map_smul' c P := by rw [Derivation.map_smul, mul_smul_comm, smul_sub]; rfl

private def B1a : P4 →ₗ[ℂ] P4 where
  toFun P := MvPolynomial.X 1 * P - pderiv 0 P
  map_add' P Q := by simp only [mul_add, map_add]; ring
  map_smul' c P := by rw [Derivation.map_smul, mul_smul_comm, smul_sub]; rfl

private def B1b : P4 →ₗ[ℂ] P4 where
  toFun P := MvPolynomial.X 3 * P - pderiv 2 P
  map_add' P Q := by simp only [mul_add, map_add]; ring
  map_smul' c P := by rw [Derivation.map_smul, mul_smul_comm, smul_sub]; rfl

@[simp] private lemma B0a_apply (P : P4) : B0a P = MvPolynomial.X 0 * P - pderiv 1 P := rfl
@[simp] private lemma B0b_apply (P : P4) : B0b P = MvPolynomial.X 2 * P - pderiv 3 P := rfl
@[simp] private lemma B1a_apply (P : P4) : B1a P = MvPolynomial.X 1 * P - pderiv 0 P := rfl
@[simp] private lemma B1b_apply (P : P4) : B1b P = MvPolynomial.X 3 * P - pderiv 2 P := rfl

private lemma pderiv_comm4 (i j : Fin 4) (P : P4) :
    pderiv i (pderiv j P) = pderiv j (pderiv i P) := by
  induction P using MvPolynomial.induction_on with
  | C _ => simp
  | add _ _ hP hQ => simp [hP, hQ]
  | mul_X _ k hP =>
    simp only [Derivation.leibniz, smul_eq_mul, map_add, hP]
    fin_cases i <;> fin_cases j <;> fin_cases k <;> simp [pderiv_X] <;> ring

private lemma comm_B0 (P : P4) : B0a (B0b P) = B0b (B0a P) := by
  have h12 : pderiv (1 : Fin 4) (MvPolynomial.X 2 : P4) = 0 := pderiv_X_of_ne (by decide)
  have h30 : pderiv (3 : Fin 4) (MvPolynomial.X 0 : P4) = 0 := pderiv_X_of_ne (by decide)
  simp only [B0a_apply, B0b_apply, map_sub, Derivation.leibniz, smul_eq_mul, h12, h30,
    mul_zero, pderiv_comm4 1 3]
  ring

private lemma comm_B1 (P : P4) : B1a (B1b P) = B1b (B1a P) := by
  have h03 : pderiv (0 : Fin 4) (MvPolynomial.X 3 : P4) = 0 := pderiv_X_of_ne (by decide)
  have h21 : pderiv (2 : Fin 4) (MvPolynomial.X 1 : P4) = 0 := pderiv_X_of_ne (by decide)
  simp only [B1a_apply, B1b_apply, map_sub, Derivation.leibniz, smul_eq_mul, h03, h21,
    mul_zero, pderiv_comm4 0 2]
  ring

private lemma B0a_prod (f g : CPoly) : B0a (sX f * sZ g) = sX (A0 f) * sZ g := by
  simp only [B0a_apply, Derivation.leibniz, smul_eq_mul, pderiv1_sX, pderiv1_sZ,
    mul_zero, A0, map_sub, map_mul]
  have hx : sX (MvPolynomial.X 0) = MvPolynomial.X 0 := by simp [sX]
  rw [hx]; ring

private lemma B0b_prod (f g : CPoly) : B0b (sX f * sZ g) = sX f * sZ (A0 g) := by
  simp only [B0b_apply, Derivation.leibniz, smul_eq_mul, pderiv3_sX, pderiv3_sZ,
    mul_zero, A0, map_sub, map_mul]
  have hx : sZ (MvPolynomial.X 0) = MvPolynomial.X 2 := by simp [sZ]
  rw [hx]; ring

private lemma B1a_prod (f g : CPoly) : B1a (sX f * sZ g) = sX (A1 f) * sZ g := by
  simp only [B1a_apply, Derivation.leibniz, smul_eq_mul, pderiv0_sX, pderiv0_sZ,
    mul_zero, A1, map_sub, map_mul]
  have hx : sX (MvPolynomial.X 1) = MvPolynomial.X 1 := by simp [sX]
  rw [hx]; ring

private lemma B1b_prod (f g : CPoly) : B1b (sX f * sZ g) = sX f * sZ (A1 g) := by
  simp only [B1b_apply, Derivation.leibniz, smul_eq_mul, pderiv2_sX, pderiv2_sZ,
    mul_zero, A1, map_sub, map_mul]
  have hx : sZ (MvPolynomial.X 1) = MvPolynomial.X 3 := by simp [sZ]
  rw [hx]; ring

private lemma B_iter_one (p₁ q₁ p₂ q₂ : ℕ) :
    B0a^[p₁] (B0b^[p₂] (B1a^[q₁] (B1b^[q₂] 1))) = sX (H p₁ q₁) * sZ (H p₂ q₂) := by
  let one4 : P4 := 1
  change B0a^[p₁] (B0b^[p₂] (B1a^[q₁] (B1b^[q₂] one4))) = _
  have hb1b : ∀ n, B1b^[n] one4 = sX (H 0 0) * sZ (H 0 n) := fun n => by
    induction n with
    | zero => rw [Function.iterate_zero_apply, H_zero_zero, map_one, map_one, one_mul]
    | succ n ih => rw [Function.iterate_succ_apply', ih, B1b_prod, ← H_zero_succ n]
  have hb1a : ∀ m, B1a^[m] (B1b^[q₂] one4) = sX (H 0 m) * sZ (H 0 q₂) := fun m => by
    induction m with
    | zero => rw [Function.iterate_zero_apply]; exact hb1b q₂
    | succ m ih => rw [Function.iterate_succ_apply', ih, B1a_prod, ← H_zero_succ m]
  have hb0b : ∀ n, B0b^[n] (B1a^[q₁] (B1b^[q₂] one4)) = sX (H 0 q₁) * sZ (H n q₂) := fun n => by
    induction n with
    | zero => rw [Function.iterate_zero_apply]; exact hb1a q₁
    | succ n ih => rw [Function.iterate_succ_apply', ih, B0b_prod, ← H_succ_left n q₂]
  induction p₁ with
  | zero => rw [Function.iterate_zero_apply]; exact hb0b p₂
  | succ n ih => rw [Function.iterate_succ_apply', ih, B0a_prod, ← H_succ_left n q₁]

private lemma pderiv_aeval4 (ψ : Fin 4 → P4) (j : Fin 4) (P : P4) :
    pderiv j (MvPolynomial.aeval ψ P) =
      MvPolynomial.aeval ψ (pderiv 0 P) * pderiv j (ψ 0) +
        MvPolynomial.aeval ψ (pderiv 1 P) * pderiv j (ψ 1) +
        MvPolynomial.aeval ψ (pderiv 2 P) * pderiv j (ψ 2) +
        MvPolynomial.aeval ψ (pderiv 3 P) * pderiv j (ψ 3) := by
  induction P using MvPolynomial.induction_on with
  | C _ => simp
  | add _ _ hP hQ => simp only [map_add, hP, hQ]; ring
  | mul_X _ i hP =>
    simp only [map_mul, aeval_X, Derivation.leibniz, smul_eq_mul, map_add, hP]
    fin_cases i <;> simp [pderiv_X] <;> ring

private def rot4 (ct st : ℝ) : P4 →ₐ[ℂ] P4 :=
  MvPolynomial.aeval
    ![MvPolynomial.C (ct : ℂ) * MvPolynomial.X 0 - MvPolynomial.C (st : ℂ) * MvPolynomial.X 2,
      MvPolynomial.C (ct : ℂ) * MvPolynomial.X 1 - MvPolynomial.C (st : ℂ) * MvPolynomial.X 3,
      MvPolynomial.C (st : ℂ) * MvPolynomial.X 0 + MvPolynomial.C (ct : ℂ) * MvPolynomial.X 2,
      MvPolynomial.C (st : ℂ) * MvPolynomial.X 1 + MvPolynomial.C (ct : ℂ) * MvPolynomial.X 3]

private lemma ev4_rot4 (ct st : ℝ) (u : ℂ × ℂ) (P : P4) :
    ev4 u (rot4 ct st P) = ev4 (uRotInv ct st u) P := by
  induction P using MvPolynomial.induction_on with
  | C _ => simp [ev4, rot4]
  | add _ _ hP hQ => simp only [map_add, ev4] at *; rw [hP, hQ]
  | mul_X _ i hP =>
    simp only [map_mul, ev4] at *; rw [hP]
    fin_cases i <;> simp [rot4, wv, uRotInv, Complex.conj_ofReal]

private lemma rot4_B_comm {ct st : ℝ} (hd : ct ^ 2 + st ^ 2 = 1) (P : P4) :
    (rot4 ct st (B0a P) = (((ct : ℂ) • B0a + ((-st : ℝ) : ℂ) • B0b)) (rot4 ct st P)) ∧
    (rot4 ct st (B0b P) = (((st : ℂ) • B0a + (ct : ℂ) • B0b)) (rot4 ct st P)) ∧
    (rot4 ct st (B1a P) = (((ct : ℂ) • B1a + ((-st : ℝ) : ℂ) • B1b)) (rot4 ct st P)) ∧
    (rot4 ct st (B1b P) = (((st : ℂ) • B1a + (ct : ℂ) • B1b)) (rot4 ct st P)) := by
  have hdC : MvPolynomial.C (ct : ℂ) * MvPolynomial.C (ct : ℂ) +
      MvPolynomial.C (st : ℂ) * MvPolynomial.C (st : ℂ) = (1 : P4) := by
    rw [← map_mul, ← map_mul, ← map_add,
      show (ct : ℂ) * ct + (st : ℂ) * st = 1 by exact_mod_cast (by nlinarith : ct * ct + st * st = 1),
      map_one]
  have hp0 : pderiv 0 (rot4 ct st P) =
      MvPolynomial.C (ct : ℂ) * rot4 ct st (pderiv 0 P) +
        MvPolynomial.C (st : ℂ) * rot4 ct st (pderiv 2 P) := by
    rw [rot4, pderiv_aeval4]; simp [pderiv_X, Derivation.leibniz]; ring
  have hp1 : pderiv 1 (rot4 ct st P) =
      MvPolynomial.C (ct : ℂ) * rot4 ct st (pderiv 1 P) +
        MvPolynomial.C (st : ℂ) * rot4 ct st (pderiv 3 P) := by
    rw [rot4, pderiv_aeval4]; simp [pderiv_X, Derivation.leibniz]; ring
  have hp2 : pderiv 2 (rot4 ct st P) =
      -MvPolynomial.C (st : ℂ) * rot4 ct st (pderiv 0 P) +
        MvPolynomial.C (ct : ℂ) * rot4 ct st (pderiv 2 P) := by
    rw [rot4, pderiv_aeval4]; simp [pderiv_X, Derivation.leibniz]; ring
  have hp3 : pderiv 3 (rot4 ct st P) =
      -MvPolynomial.C (st : ℂ) * rot4 ct st (pderiv 1 P) +
        MvPolynomial.C (ct : ℂ) * rot4 ct st (pderiv 3 P) := by
    rw [rot4, pderiv_aeval4]; simp [pderiv_X, Derivation.leibniz]; ring
  have hx0 : rot4 ct st (MvPolynomial.X 0) =
      MvPolynomial.C (ct : ℂ) * MvPolynomial.X 0 - MvPolynomial.C (st : ℂ) * MvPolynomial.X 2 := by
    simp [rot4]
  have hx1 : rot4 ct st (MvPolynomial.X 1) =
      MvPolynomial.C (ct : ℂ) * MvPolynomial.X 1 - MvPolynomial.C (st : ℂ) * MvPolynomial.X 3 := by
    simp [rot4]
  have hx2 : rot4 ct st (MvPolynomial.X 2) =
      MvPolynomial.C (st : ℂ) * MvPolynomial.X 0 + MvPolynomial.C (ct : ℂ) * MvPolynomial.X 2 := by
    simp [rot4]
  have hx3 : rot4 ct st (MvPolynomial.X 3) =
      MvPolynomial.C (st : ℂ) * MvPolynomial.X 1 + MvPolynomial.C (ct : ℂ) * MvPolynomial.X 3 := by
    simp [rot4]
  refine ⟨?_, ?_, ?_, ?_⟩
  · simp only [B0a_apply, B0b_apply, LinearMap.add_apply, LinearMap.smul_apply,
      map_sub, map_mul, hx0, hp1, hp3, Complex.ofReal_neg, neg_smul, ← C_mul']
    linear_combination (rot4 ct st (pderiv 1 P)) * hdC
  · simp only [B0a_apply, B0b_apply, LinearMap.add_apply, LinearMap.smul_apply,
      map_sub, map_mul, hx2, hp1, hp3, ← C_mul']
    linear_combination (rot4 ct st (pderiv 3 P)) * hdC
  · simp only [B1a_apply, B1b_apply, LinearMap.add_apply, LinearMap.smul_apply,
      map_sub, map_mul, hx1, hp0, hp2, Complex.ofReal_neg, neg_smul, ← C_mul']
    linear_combination (rot4 ct st (pderiv 0 P)) * hdC
  · simp only [B1a_apply, B1b_apply, LinearMap.add_apply, LinearMap.smul_apply,
      map_sub, map_mul, hx3, hp0, hp2, ← C_mul']
    linear_combination (rot4 ct st (pderiv 2 P)) * hdC

private lemma iterate_linear_sum {V : Type*} [AddCommGroup V] [Module ℂ V] {ι : Type*}
    (L : V →ₗ[ℂ] V) (n : ℕ) (s : Finset ι) (c : ι → ℂ) (v : ι → V) :
    L^[n] (∑ i ∈ s, c i • v i) = ∑ i ∈ s, c i • (L^[n] (v i)) := by
  induction n with
  | zero => rfl
  | succ n ih => rw [Function.iterate_succ_apply', ih, map_sum]; simp [map_smul, Function.iterate_succ_apply']

lemma H2_uRotInv {ct st : ℝ} (hd : ct ^ 2 + st ^ 2 = 1) (i : Idx2) (u : ℂ × ℂ) :
    H2 i (uRotInv ct st u) =
      ∑ j₁ ∈ range (i.1.1 + i.2.1 + 1), ∑ j₂ ∈ range (i.1.2 + i.2.2 + 1),
        ((bCoeff ct (-st) st ct i.1.1 i.2.1 j₁ *
          bCoeff ct (-st) st ct i.1.2 i.2.2 j₂ : ℝ) : ℂ) *
          H2 ((j₁, j₂), (i.1.1 + i.2.1 - j₁, i.1.2 + i.2.2 - j₂)) u := by
  obtain ⟨⟨p₁, q₁⟩, ⟨p₂, q₂⟩⟩ := i
  have h0a : ∀ n P, rot4 ct st (B0a^[n] P) =
      (((ct : ℂ) • B0a + ((-st : ℝ) : ℂ) • B0b))^[n] (rot4 ct st P) := fun n P => by
    induction n with
    | zero => rfl
    | succ n ih => rw [Function.iterate_succ_apply', (rot4_B_comm hd _).1, ih, Function.iterate_succ_apply']
  have h0b : ∀ n P, rot4 ct st (B0b^[n] P) =
      (((st : ℂ) • B0a + (ct : ℂ) • B0b))^[n] (rot4 ct st P) := fun n P => by
    induction n with
    | zero => rfl
    | succ n ih => rw [Function.iterate_succ_apply', (rot4_B_comm hd _).2.1, ih, Function.iterate_succ_apply']
  have h1a : ∀ n P, rot4 ct st (B1a^[n] P) =
      (((ct : ℂ) • B1a + ((-st : ℝ) : ℂ) • B1b))^[n] (rot4 ct st P) := fun n P => by
    induction n with
    | zero => rfl
    | succ n ih => rw [Function.iterate_succ_apply', (rot4_B_comm hd _).2.2.1, ih, Function.iterate_succ_apply']
  have h1b : ∀ n P, rot4 ct st (B1b^[n] P) =
      (((st : ℂ) • B1a + (ct : ℂ) • B1b))^[n] (rot4 ct st P) := fun n P => by
    induction n with
    | zero => rfl
    | succ n ih => rw [Function.iterate_succ_apply', (rot4_B_comm hd _).2.2.2, ih, Function.iterate_succ_apply']
  have hpoly : rot4 ct st (sX (H p₁ q₁) * sZ (H p₂ q₂)) =
      ∑ j₁ ∈ range (p₁ + p₂ + 1), ∑ j₂ ∈ range (q₁ + q₂ + 1),
        ((bCoeff ct (-st) st ct p₁ p₂ j₁ *
          bCoeff ct (-st) st ct q₁ q₂ j₂ : ℝ) : ℂ) •
          (sX (H j₁ j₂) * sZ (H (p₁ + p₂ - j₁) (q₁ + q₂ - j₂))) := by
    rw [← B_iter_one, h0a, h0b, h1a, h1b, map_one,
      comm_linear_binom B1a B1b comm_B1 ct (-st) st ct 1 q₁ q₂,
      iterate_linear_sum, iterate_linear_sum]
    simp_rw [comm_linear_binom B0a B0b comm_B0 ct (-st) st ct _ p₁ p₂, Finset.smul_sum,
      smul_smul, B_iter_one]
    rw [Finset.sum_comm]
    refine sum_congr rfl fun j₁ _ => sum_congr rfl fun j₂ _ => ?_
    congr 1; push_cast; ring
  have hev : ∀ (f g : CPoly) (v : ℂ × ℂ), ev4 v (sX f * sZ g) = ev v.1 f * ev v.2 g :=
    fun f g v => by change eval (wv v) (sX f * sZ g) = _; rw [map_mul, ← ev4, ← ev4, ev4_sX, ev4_sZ]
  have hlhs : H2 ((p₁, q₁), (p₂, q₂)) (uRotInv ct st u) =
      ev4 u (rot4 ct st (sX (H p₁ q₁) * sZ (H p₂ q₂))) := by
    rw [ev4_rot4, hev]; rfl
  rw [hlhs, hpoly]
  unfold ev4 at hev ⊢
  simp only [map_sum, smul_eval, hev, H2]

private lemma integral_coord2_ou {se ce : ℝ} (he : se ^ 2 + ce ^ 2 = 1)
    {F : ℂ × ℂ → ℂ} (hFm : Measurable F) (hF1 : ∀ v, ‖F v‖ ≤ 1)
    (j₁ j₂ r₂ s₂ : ℕ) :
    ∫ u : ℂ × ℂ, conj (H2 ((j₁, j₂), (r₂, s₂)) u) *
        (∫ z2, F (u.1, (se : ℂ) * u.2 + (ce : ℂ) * z2) ∂gaussC) ∂mu2 =
      ((se ^ (r₂ + s₂) : ℝ) : ℂ) *
        ∫ w : ℂ × ℂ, conj (H2 ((j₁, j₂), (r₂, s₂)) w) * F w ∂mu2 := by
  set G2 : ℂ × ℂ → ℂ := fun u => ∫ z2, F (u.1, (se : ℂ) * u.2 + (ce : ℂ) * z2) ∂gaussC
  have hG2m : Measurable G2 :=
    (hFm.comp (by fun_prop : Measurable fun p : (ℂ × ℂ) × ℂ =>
      (p.1.1, (se : ℂ) * p.1.2 + (ce : ℂ) * p.2))).stronglyMeasurable.integral_prod_right'.measurable
  have hG2_le : ∀ u, ‖G2 u‖ ≤ 1 := fun u => by
    calc ‖∫ z2, F (u.1, (se : ℂ) * u.2 + (ce : ℂ) * z2) ∂gaussC‖
        ≤ ∫ z2, ‖F (u.1, (se : ℂ) * u.2 + (ce : ℂ) * z2)‖ ∂gaussC :=
          norm_integral_le_integral_norm _
      _ ≤ ∫ _z2, (1 : ℝ) ∂gaussC := by
          by_cases hi : Integrable (fun z2 => ‖F (u.1, (se : ℂ) * u.2 + (ce : ℂ) * z2)‖) gaussC
          · exact integral_mono hi (integrable_const 1) fun _ => hF1 _
          · rw [integral_undef hi]; simp
      _ = 1 := by simp
  have hΦ_int : Integrable (fun u => conj (H2 ((j₁, j₂), (r₂, s₂)) u) * G2 u) mu2 := by
    refine ((memLp_H2 ((j₁, j₂), (r₂, s₂))).integrable one_le_two).norm.mono'
      (((memLp_H2 _).aestronglyMeasurable.star).mul hG2m.aestronglyMeasurable)
      (Filter.Eventually.of_forall fun u => ?_)
    rw [norm_mul, Complex.norm_conj]
    exact mul_le_of_le_one_right (norm_nonneg _) (hG2_le u)
  rw [show mu2 = gaussC.prod gaussC from rfl, integral_prod _ hΦ_int]
  have hinner : ∀ u1 : ℂ,
      ∫ u2, conj (H2 ((j₁, j₂), (r₂, s₂)) (u1, u2)) * G2 (u1, u2) ∂gaussC =
        conj (ev u1 (H j₁ j₂)) * (((se ^ (r₂ + s₂) : ℝ) : ℂ) *
          ∫ w2, conj (ev w2 (H r₂ s₂)) * F (u1, w2) ∂gaussC) := fun u1 => by
    have hsplit : ∀ u2, conj (H2 ((j₁, j₂), (r₂, s₂)) (u1, u2)) * G2 (u1, u2) =
        conj (ev u1 (H j₁ j₂)) * (conj (ev u2 (H r₂ s₂)) * G2 (u1, u2)) :=
      fun _ => by simp only [H2, map_mul]; ring
    simp_rw [hsplit]
    rw [integral_const_mul]
    congr 1
    set Ψ : ℂ × ℂ → ℂ := fun p => conj (ev p.1 (H r₂ s₂)) * F (u1, (se : ℂ) * p.1 + (ce : ℂ) * p.2)
    have hΨ_int : Integrable Ψ mu2 := by
      refine (((integrable_ev (H r₂ s₂)).norm).mul_prod (integrable_const (1 : ℝ))).mono'
        (((Complex.continuous_conj.comp (continuous_ev _)).measurable.comp measurable_fst).mul
          (hFm.comp (by fun_prop))).aestronglyMeasurable
        (Filter.Eventually.of_forall fun p => ?_)
      simp only [Ψ, norm_mul, Complex.norm_conj]
      exact mul_le_mul_of_nonneg_left (hF1 _) (norm_nonneg _)
    have h1 : ∫ u2, conj (ev u2 (H r₂ s₂)) * G2 (u1, u2) ∂gaussC = ∫ p, Ψ p ∂mu2 := by
      rw [show mu2 = gaussC.prod gaussC from rfl, integral_prod _ hΨ_int]
      refine integral_congr_ae (Filter.Eventually.of_forall fun u2 => ?_)
      dsimp only [Ψ, G2]
      rw [← integral_const_mul]
    rw [h1]
    have heC : (se : ℂ) ^ 2 + (ce : ℂ) ^ 2 = 1 := by exact_mod_cast he
    let eEta : (ℂ × ℂ) ≃ᵐ (ℂ × ℂ) :=
      { toFun := fun q => ((se : ℂ) * q.1 - (ce : ℂ) * q.2, (ce : ℂ) * q.1 + (se : ℂ) * q.2)
        invFun := fun p => ((se : ℂ) * p.1 + (ce : ℂ) * p.2, -(ce : ℂ) * p.1 + (se : ℂ) * p.2)
        left_inv := fun q => by
          ext <;> simp
          · linear_combination q.1 * heC
          · linear_combination q.2 * heC
        right_inv := fun p => by
          ext <;> simp
          · linear_combination p.1 * heC
          · linear_combination p.2 * heC
        measurable_toFun := by
          show Measurable fun q : ℂ × ℂ =>
            ((se : ℂ) * q.1 - (ce : ℂ) * q.2, (ce : ℂ) * q.1 + (se : ℂ) * q.2)
          fun_prop
        measurable_invFun := by
          show Measurable fun p : ℂ × ℂ =>
            ((se : ℂ) * p.1 + (ce : ℂ) * p.2, -(ce : ℂ) * p.1 + (se : ℂ) * p.2)
          fun_prop }
    have hmap_eta : mu2.map eEta = mu2 := by
      have he' : se ^ 2 + (-ce) ^ 2 = 1 := by linarith
      convert map_orth_mu2 he' using 2; (ext q <;> simp [eEta]); ring
    have heq_eta : ∫ p, Ψ p ∂mu2 = ∫ q, Ψ (eEta q) ∂mu2 := by
      have := integral_map_equiv eEta Ψ (μ := mu2)
      rwa [hmap_eta] at this
    rw [heq_eta]
    have heEta : ∀ q : ℂ × ℂ,
        eEta q = ((se : ℂ) * q.1 - (ce : ℂ) * q.2, (ce : ℂ) * q.1 + (se : ℂ) * q.2) :=
      fun _ => rfl
    have hΨ_eta : ∀ q : ℂ × ℂ, Ψ (eEta q) =
        conj (ev ((se : ℂ) * q.1 + ((-ce : ℝ) : ℂ) * q.2) (H r₂ s₂)) * F (u1, q.1) := fun q => by
      dsimp only [Ψ]
      rw [heEta]
      dsimp only
      have harg : (se : ℂ) * ((se : ℂ) * q.1 - (ce : ℂ) * q.2) +
          (ce : ℂ) * ((ce : ℂ) * q.1 + (se : ℂ) * q.2) = q.1 := by
        linear_combination q.1 * heC
      have harg2 : (se : ℂ) * q.1 - (ce : ℂ) * q.2 =
          (se : ℂ) * q.1 + ((-ce : ℝ) : ℂ) * q.2 := by push_cast; ring
      rw [harg, harg2]
    simp_rw [hΨ_eta]
    have hΨe_int : Integrable
        (fun q : ℂ × ℂ =>
          conj (ev ((se : ℂ) * q.1 + ((-ce : ℝ) : ℂ) * q.2) (H r₂ s₂)) * F (u1, q.1)) mu2 := by
      refine (integrable_ev4 (sY2 se (-ce) (H r₂ s₂))).norm.mono'
        (((Complex.continuous_conj.comp (continuous_ev _)).measurable.comp (by fun_prop)).mul
          (hFm.comp (by fun_prop))).aestronglyMeasurable
        (Filter.Eventually.of_forall fun q => ?_)
      rw [norm_mul, Complex.norm_conj, ev4_sY2]
      exact mul_le_of_le_one_right (norm_nonneg _) (hF1 _)
    rw [show mu2 = gaussC.prod gaussC from rfl, integral_prod _ hΨe_int]
    simp_rw [integral_mul_const]
    have hou : ∀ w2 : ℂ,
        ∫ z2, conj (ev ((se : ℂ) * w2 + ((-ce : ℝ) : ℂ) * z2) (H r₂ s₂)) ∂gaussC =
          ((se ^ (r₂ + s₂) : ℝ) : ℂ) * conj (ev w2 (H r₂ s₂)) := fun w2 => by
      rw [integral_conj, ou_one_coord (show se ^ 2 + (-ce) ^ 2 = 1 by linarith) r₂ s₂ w2,
        map_mul, Complex.conj_ofReal]
    simp_rw [hou, mul_assoc]
    exact integral_const_mul _ _
  simp_rw [hinner]
  have hF_int : Integrable (fun w => conj (H2 ((j₁, j₂), (r₂, s₂)) w) * F w) mu2 := by
    refine ((memLp_H2 ((j₁, j₂), (r₂, s₂))).integrable one_le_two).norm.mono'
      (((memLp_H2 _).aestronglyMeasurable.star).mul hFm.aestronglyMeasurable)
      (Filter.Eventually.of_forall fun w => ?_)
    rw [norm_mul, Complex.norm_conj]
    exact mul_le_of_le_one_right (norm_nonneg _) (hF1 w)
  rw [integral_prod _ hF_int]
  have hrhs : ∀ u1 : ℂ,
      conj (ev u1 (H j₁ j₂)) * (((se ^ (r₂ + s₂) : ℝ) : ℂ) *
          ∫ w2, conj (ev w2 (H r₂ s₂)) * F (u1, w2) ∂gaussC) =
        ((se ^ (r₂ + s₂) : ℝ) : ℂ) *
          ∫ w2, conj (H2 ((j₁, j₂), (r₂, s₂)) (u1, w2)) * F (u1, w2) ∂gaussC := fun u1 => by
    have hs : ∀ w2, conj (H2 ((j₁, j₂), (r₂, s₂)) (u1, w2)) * F (u1, w2) =
        conj (ev u1 (H j₁ j₂)) * (conj (ev w2 (H r₂ s₂)) * F (u1, w2)) :=
      fun _ => by simp only [H2, map_mul]; ring
    simp_rw [hs, integral_const_mul]; ring
  simp_rw [hrhs]
  exact integral_const_mul _ _

theorem integral_H2_smoothMap {ct st se ce : ℝ} (hd : ct ^ 2 + st ^ 2 = 1)
    (he : se ^ 2 + ce ^ 2 = 1) {F : ℂ × ℂ → ℂ} (hFm : Measurable F)
    (hF1 : ∀ v, ‖F v‖ ≤ 1) (i : Idx2) :
    ∫ x, conj (H2 i x) * smoothMap ct st se ce F x ∂mu2 =
      ∑ j₁ ∈ range (i.1.1 + i.2.1 + 1), ∑ j₂ ∈ range (i.1.2 + i.2.2 + 1),
        ((bCoeff ct (-(se * st)) st (se * ct) i.1.1 i.2.1 j₁ *
          bCoeff ct (-(se * st)) st (se * ct) i.1.2 i.2.2 j₂ : ℝ) : ℂ) *
          ∫ w, conj (H2 ((j₁, j₂), (i.1.1 + i.2.1 - j₁, i.1.2 + i.2.2 - j₂)) w) * F w ∂mu2 := by
  have hdC : (ct : ℂ) ^ 2 + (st : ℂ) ^ 2 = 1 := by exact_mod_cast hd
  let eRot : (ℂ × ℂ) ≃ᵐ (ℂ × ℂ) :=
    { toFun := uRotInv ct st
      invFun := uRot ct st
      left_inv := fun u => by
        ext <;> simp [uRot, uRotInv]
        · linear_combination u.1 * hdC
        · linear_combination u.2 * hdC
      right_inv := fun x => by
        ext <;> simp [uRot, uRotInv]
        · linear_combination x.1 * hdC
        · linear_combination x.2 * hdC
      measurable_toFun := by
        show Measurable fun u : ℂ × ℂ =>
          ((ct : ℂ) * u.1 - (st : ℂ) * u.2, (st : ℂ) * u.1 + (ct : ℂ) * u.2)
        fun_prop
      measurable_invFun := by
        show Measurable fun u : ℂ × ℂ =>
          ((ct : ℂ) * u.1 + (st : ℂ) * u.2, -(st : ℂ) * u.1 + (ct : ℂ) * u.2)
        fun_prop }
  have hmap_rot : mu2.map eRot = mu2 := by
    have hd' : ct ^ 2 + (-st) ^ 2 = 1 := by linarith
    convert map_orth_mu2 hd' using 2; (ext u <;> simp [eRot, uRotInv]); ring
  have hrot_eq : ∫ x, conj (H2 i x) * smoothMap ct st se ce F x ∂mu2 =
      ∫ u, conj (H2 i (uRotInv ct st u)) * smoothMap ct st se ce F (uRotInv ct st u) ∂mu2 := by
    have := integral_map_equiv eRot (fun x => conj (H2 i x) * smoothMap ct st se ce F x) (μ := mu2)
    rwa [hmap_rot] at this
  rw [hrot_eq]
  have hsm_u : ∀ u : ℂ × ℂ, smoothMap ct st se ce F (uRotInv ct st u) =
      ∫ z2, F (u.1, (se : ℂ) * u.2 + (ce : ℂ) * z2) ∂gaussC := fun u => by
    unfold smoothMap
    have hpt : ∀ z : ℂ × ℂ, smoothEff ct st se ce (uRotInv ct st u) z =
        (u.1, (se : ℂ) * u.2 + (ce : ℂ) * z.2) := fun z => by
      ext <;> simp only [smoothEff, uRotInv] <;> push_cast
      · linear_combination u.1 * hdC
      · linear_combination (se : ℂ) * u.2 * hdC
    simp_rw [hpt]
    have h1 : (∫ z : ℂ × ℂ, F (u.1, (se : ℂ) * u.2 + (ce : ℂ) * z.2) ∂mu2) =
        ∫ z : ℂ × ℂ, (1 : ℂ) * F (u.1, (se : ℂ) * u.2 + (ce : ℂ) * z.2) ∂mu2 :=
      integral_congr_ae (Filter.Eventually.of_forall fun _ => (one_mul _).symm)
    rw [h1, integral_prod_mul (f := fun _ : ℂ => (1 : ℂ))
      (g := fun z2 : ℂ => F (u.1, (se : ℂ) * u.2 + (ce : ℂ) * z2)),
      integral_const, probReal_univ, one_smul, one_mul]
  set G2 : ℂ × ℂ → ℂ := fun u => ∫ z2, F (u.1, (se : ℂ) * u.2 + (ce : ℂ) * z2) ∂gaussC
  have hG2m : Measurable G2 :=
    (hFm.comp (by fun_prop : Measurable fun p : (ℂ × ℂ) × ℂ =>
      (p.1.1, (se : ℂ) * p.1.2 + (ce : ℂ) * p.2))).stronglyMeasurable.integral_prod_right'.measurable
  have hG2_le : ∀ u, ‖G2 u‖ ≤ 1 := fun u => by
    have := norm_smoothMap_le ct st se ce hF1 (uRotInv ct st u)
    rwa [hsm_u] at this
  have hterm_int : ∀ j₁ j₂ : ℕ, Integrable (fun u =>
      ((bCoeff ct (-st) st ct i.1.1 i.2.1 j₁ * bCoeff ct (-st) st ct i.1.2 i.2.2 j₂ : ℝ) : ℂ) *
        (conj (H2 ((j₁, j₂), (i.1.1 + i.2.1 - j₁, i.1.2 + i.2.2 - j₂)) u) * G2 u)) mu2 := by
    intro j₁ j₂
    refine Integrable.const_mul ?_ _
    refine ((memLp_H2 ((j₁, j₂), (i.1.1 + i.2.1 - j₁, i.1.2 + i.2.2 - j₂))).integrable one_le_two).norm.mono'
      (((memLp_H2 _).aestronglyMeasurable.star).mul hG2m.aestronglyMeasurable)
      (Filter.Eventually.of_forall fun u => ?_)
    rw [norm_mul, Complex.norm_conj]
    exact mul_le_of_le_one_right (norm_nonneg _) (hG2_le u)
  have hexp : ∀ u : ℂ × ℂ,
      conj (H2 i (uRotInv ct st u)) * smoothMap ct st se ce F (uRotInv ct st u) =
        ∑ j₁ ∈ range (i.1.1 + i.2.1 + 1), ∑ j₂ ∈ range (i.1.2 + i.2.2 + 1),
          ((bCoeff ct (-st) st ct i.1.1 i.2.1 j₁ *
            bCoeff ct (-st) st ct i.1.2 i.2.2 j₂ : ℝ) : ℂ) *
            (conj (H2 ((j₁, j₂), (i.1.1 + i.2.1 - j₁, i.1.2 + i.2.2 - j₂)) u) * G2 u) := fun u => by
    rw [H2_uRotInv hd i u, hsm_u u, map_sum, Finset.sum_mul]
    refine sum_congr rfl fun j₁ _ => ?_
    rw [map_sum, Finset.sum_mul]
    refine sum_congr rfl fun j₂ _ => ?_
    rw [map_mul, Complex.conj_ofReal, mul_assoc]
  simp_rw [hexp]
  rw [integral_finsetSum _ fun j₁ _ => integrable_finsetSum _ fun j₂ _ => hterm_int j₁ j₂]
  refine sum_congr rfl fun j₁ hj₁ => ?_
  rw [integral_finsetSum _ fun j₂ _ => hterm_int j₁ j₂]
  refine sum_congr rfl fun j₂ hj₂ => ?_
  rw [integral_const_mul, integral_coord2_ou he hFm hF1, ← mul_assoc, ← Complex.ofReal_mul]
  congr 1
  have hj₁_le : j₁ ≤ i.1.1 + i.2.1 := Nat.lt_succ_iff.1 (mem_range.1 hj₁)
  have hj₂_le : j₂ ≤ i.1.2 + i.2.2 := Nat.lt_succ_iff.1 (mem_range.1 hj₂)
  rw [← bCoeff_scale ct st se i.1.1 i.2.1 j₁ hj₁_le,
    ← bCoeff_scale ct st se i.1.2 i.2.2 j₂ hj₂_le, pow_add]
  push_cast; ring

/-! ### 6. Haagerup's phase channel `ph`, `phase2`, `haagCoeff`, and `phase_bivarKernel_eq` -/

def haagR : ℕ → ℚ
  | 0 => 1
  | k + 1 => haagR k * (((2 * k + 1) ^ 2 : ℕ) : ℚ) / ((4 * (k + 1) * (k + 2) : ℕ) : ℚ)

def haagCoeff (k : ℕ) : ℝ := Real.pi / 4 * haagR k

def ph (a : ℂ) : ℂ := a / ((‖a‖ : ℝ) : ℂ)

lemma norm_ph_le (a : ℂ) : ‖ph a‖ ≤ 1 := by
  unfold ph
  rcases eq_or_ne a 0 with rfl | ha
  · simp
  · rw [norm_div, Complex.norm_real, Real.norm_of_nonneg (norm_nonneg _),
      div_self (norm_ne_zero_iff.2 ha)]

lemma measurable_ph : Measurable ph := by unfold ph; fun_prop

lemma memLp_ph : MemLp ph 2 gaussC :=
  MemLp.of_bound measurable_ph.aestronglyMeasurable 1 (Filter.Eventually.of_forall norm_ph_le)

def phaseLp : Lp ℂ 2 gaussC := memLp_ph.toLp ph

private lemma conj_monomial_mul_div_norm (n : ℕ) (z : ℂ) :
    conj (z ^ (n + 1) * conj z ^ n) * (z / (‖z‖ : ℂ)) = ((‖z‖ ^ (2 * n + 1) : ℝ) : ℂ) := by
  by_cases hz : z = 0
  · subst z; simp
  have hn : (‖z‖ : ℂ) ≠ 0 := by exact_mod_cast norm_ne_zero_iff.mpr hz
  have hs : (‖z‖ : ℂ) ^ 2 = conj z * z := by
    rw [← Complex.ofReal_pow, ← Complex.normSq_eq_norm_sq, Complex.normSq_eq_conj_mul_self]
  calc conj (z ^ (n + 1) * conj z ^ n) * (z / (‖z‖ : ℂ))
      = (conj z * z) ^ (n + 1) / (‖z‖ : ℂ) := by
          simp only [map_mul, map_pow, Complex.conj_conj]; ring
    _ = (‖z‖ : ℂ) ^ (2 * n + 1 + 1) / (‖z‖ : ℂ) := by rw [← hs, ← pow_mul]; congr 2
    _ = ((‖z‖ ^ (2 * n + 1) : ℝ) : ℂ) := by
          rw [pow_succ, mul_div_cancel_right₀ _ hn, Complex.ofReal_pow]

private lemma integral_conj_monomial_mul_div_norm (n : ℕ) :
    ∫ z : ℂ, conj (z ^ (n + 1) * conj z ^ n) * (z / (‖z‖ : ℂ)) ∂gaussC =
      (Real.Gamma ((n : ℝ) + 3 / 2) : ℂ) := by
  simp_rw [conj_monomial_mul_div_norm]
  rw [integral_complex_ofReal, integral_norm_odd_pow]

private lemma X0_mul_pderiv0_monomial (s : Fin 2 →₀ ℕ) (c : ℂ) :
    (MvPolynomial.X 0 : CPoly) * pderiv 0 (monomial s c) = s 0 • monomial s c := by
  rw [pderiv_monomial, MvPolynomial.X, monomial_mul_monomial, one_mul]
  rcases Nat.eq_zero_or_pos (s 0) with h0 | hpos
  · simp [h0]
  · have hs : Finsupp.single 0 1 + (s - Finsupp.single 0 1) = s := by
      ext i; fin_cases i
      · simp; omega
      · simp
    rw [hs, smul_monomial]
    congr 1; rw [nsmul_eq_mul, mul_comm]

private lemma integrable_phase_pair (P : CPoly) :
    Integrable (fun z => ev z P * conj (ph z)) gaussC :=
  (memLp_ev P).integrable_mul memLp_ph.star

private def phaseMoment : CPoly →ₗ[ℂ] ℂ where
  toFun P := ∫ z, ev z P * conj (ph z) ∂gaussC
  map_add' P Q := by
    simp_rw [ev, map_add, add_mul]
    exact integral_add (integrable_phase_pair P) (integrable_phase_pair Q)
  map_smul' c P := by
    simp_rw [ev, smul_eval, RingHom.id_apply, smul_eq_mul, mul_assoc]
    exact integral_const_mul c _

private lemma phaseMoment_apply (P : CPoly) :
    phaseMoment P = ∫ z, ev z P * conj (ph z) ∂gaussC := rfl

private lemma phase_monomial (a b : ℕ) :
    ∫ z : ℂ, z ^ a * conj z ^ b * conj (ph z) ∂gaussC =
      if a = b + 1 then (Real.Gamma ((b : ℝ) + 3 / 2) : ℂ) else 0 := by
  have he : (∫ z : ℂ, z ^ a * conj z ^ b * conj (ph z) ∂gaussC) =
      conj (∫ z : ℂ, conj (z ^ a * conj z ^ b) * ph z ∂gaussC) := by
    rw [← integral_conj]; congr 1; funext z; simp
  rw [he]
  by_cases hab : a = b + 1
  · subst a; simp only [↓reduceIte, ph, integral_conj_monomial_mul_div_norm, Complex.conj_ofReal]
  · simp only [hab, ↓reduceIte]
    obtain ⟨c, hc, hcne⟩ := exists_charge_witness hab
    have hp : ∀ z, ph (c * z) = c * ph z := fun z => by simp only [ph, norm_mul, hc, one_mul]; ring
    have hr := integral_rot_gaussC c hc (fun z => conj (z ^ a * conj z ^ b) * ph z)
    have hf : ∀ z : ℂ, conj ((c * z) ^ a * conj (c * z) ^ b) * ph (c * z) =
        (conj (c ^ a * conj c ^ b) * c) * (conj (z ^ a * conj z ^ b) * ph z) := fun z => by
      rw [hp]; simp only [mul_pow, map_mul, map_pow]; ring
    simp_rw [hf, integral_const_mul] at hr
    have hz : (conj (c ^ a * conj c ^ b) * c - 1) *
        (∫ z : ℂ, conj (z ^ a * conj z ^ b) * ph z ∂gaussC) = 0 := by
      rw [sub_mul, hr, one_mul, sub_self]
    rw [(mul_eq_zero.mp hz).resolve_left (sub_ne_zero.mpr hcne), map_zero]

private lemma phaseMoment_monomial (s : Fin 2 →₀ ℕ) (c : ℂ) :
    phaseMoment (monomial s c) =
      c * if s 0 = s 1 + 1 then (Real.Gamma ((s 1 : ℝ) + 3 / 2) : ℂ) else 0 := by
  rw [phaseMoment_apply]; simp_rw [ev_monomial, mul_assoc]; rw [integral_const_mul]
  congr 1; simpa only [mul_assoc] using phase_monomial (s 0) (s 1)

private lemma phaseMoment_weighted (P : CPoly) :
    phaseMoment ((MvPolynomial.X 0 * MvPolynomial.X 1) * P) =
      phaseMoment (MvPolynomial.X 0 * pderiv 0 P) + (1 / 2 : ℂ) * phaseMoment P := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    rw [X0_mul_pderiv0_monomial, map_nsmul, nsmul_eq_mul]
    simp only [phaseMoment_monomial]
    have he : (MvPolynomial.X 0 * MvPolynomial.X 1 : CPoly) * monomial s c =
        monomial (Finsupp.single 0 1 + Finsupp.single 1 1 + s) c := by
      simp [MvPolynomial.X, monomial_mul_monomial]
    rw [he, phaseMoment_monomial]
    have h0 : ((Finsupp.single 0 1 + Finsupp.single 1 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 0 =
        s 0 + 1 := by simp [add_comm]
    have h1 : ((Finsupp.single 0 1 + Finsupp.single 1 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 1 =
        s 1 + 1 := by simp [add_comm]
    rw [h0, h1]
    by_cases hs : s 0 = s 1 + 1
    · simp only [hs, ite_true]; push_cast
      rw [show (s 1 : ℝ) + 1 + 3 / 2 = ((s 1 : ℝ) + 3 / 2) + 1 by ring,
        Real.Gamma_add_one (by positivity)]
      push_cast; ring
    · simp [hs]
  | add _ _ hP hQ => simp only [mul_add, map_add, hP, hQ]; ring

private lemma H_charge_step (k : ℕ) :
    H (k + 2) (k + 1) = (MvPolynomial.X 0 * MvPolynomial.X 1) * H (k + 1) k -
      MvPolynomial.X 0 * pderiv 0 (H (k + 1) k) - (k + 1) • H (k + 1) k := by
  rw [show k + 2 = (k + 1) + 1 by omega, H_succ_left, A0, pderiv1_H_succ, ← A1_H, A1]; ring

private lemma phaseMoment_charge_step (k : ℕ) :
    phaseMoment (H (k + 2) (k + 1)) =
      (((-(k : ℝ) - 1 / 2) : ℝ) : ℂ) * phaseMoment (H (k + 1) k) := by
  rw [H_charge_step, map_sub, map_sub, phaseMoment_weighted, map_nsmul, nsmul_eq_mul]
  push_cast; ring

private lemma phaseMoment_charge_zero : phaseMoment (H 1 0) = (Real.Gamma (3 / 2) : ℂ) := by
  rw [H_succ_left, H_zero_zero]; simp [A0, MvPolynomial.X, phaseMoment_monomial]

private lemma Gamma_three_halves : Real.Gamma (3 / 2) = Real.sqrt Real.pi / 2 := by
  rw [show (3 / 2 : ℝ) = 1 / 2 + 1 by norm_num, Real.Gamma_add_one (by norm_num),
    Real.Gamma_one_half_eq]
  ring

private lemma phaseMoment_charge_norm (k : ℕ) :
    ‖phaseMoment (H (k + 1) k)‖ ^ 2 = haagCoeff k * ((k + 1).factorial * k.factorial : ℕ) := by
  induction k with
  | zero =>
    rw [phaseMoment_charge_zero, Gamma_three_halves, Complex.norm_real, Real.norm_eq_abs, sq_abs,
      div_pow, Real.sq_sqrt Real.pi_pos.le]
    norm_num [haagCoeff, haagR]
  | succ k ih =>
    rw [show k + 1 + 1 = k + 2 by omega, phaseMoment_charge_step, norm_mul, Complex.norm_real,
      Real.norm_eq_abs, mul_pow, sq_abs, ih]
    unfold haagCoeff
    rw [haagR, Nat.factorial_succ (k + 1), Nat.factorial_succ k]
    push_cast
    have h1 : (k : ℝ) + 1 ≠ 0 := by positivity
    have h2 : (k : ℝ) + 2 ≠ 0 := by positivity
    field_simp; ring

private lemma integral_phase_eq_conj_phaseMoment (P : CPoly) :
    ∫ z, conj (ev z P) * ph z ∂gaussC = conj (phaseMoment P) := by
  rw [phaseMoment_apply, ← integral_conj]; congr 1; funext z; simp

theorem phase_energy (k : ℕ) : ‖⟪hvec (k + 1, k), phaseLp⟫_ℂ‖ ^ 2 = haagCoeff k := by
  rw [hvec, phaseLp, inner_toLp]
  simp only [hfun, map_mul, Complex.conj_ofReal]
  simp_rw [mul_assoc]
  rw [integral_const_mul, integral_phase_eq_conj_phaseMoment, norm_mul, Complex.norm_real,
    Real.norm_eq_abs, mul_pow, sq_abs, Complex.norm_conj, phaseMoment_charge_norm]
  calc _ = haagCoeff k * (nrm (k + 1) k * nrm (k + 1) k *
        ((k + 1).factorial * k.factorial : ℕ)) := by ring
    _ = _ := by rw [nrm_sq_mul, mul_one]

def phase2 (u : ℂ × ℂ) : ℂ := ph u.1

lemma measurable_phase2 : Measurable phase2 := measurable_ph.comp measurable_fst

lemma norm_phase2_le (u : ℂ × ℂ) : ‖phase2 u‖ ≤ 1 := norm_ph_le u.1

lemma phase2_rot2 {c : ℂ} (hc : ‖c‖ = 1) (u : ℂ × ℂ) : phase2 (rot2 c u) = c * phase2 u := by
  simp only [phase2, rot2, ph, norm_mul, hc, one_mul]; ring

lemma memLp_phase2 : MemLp phase2 2 mu2 :=
  MemLp.of_bound measurable_phase2.aestronglyMeasurable 1
    (Filter.Eventually.of_forall norm_phase2_le)

lemma energy_phase2_odd_zero (k : ℕ) :
    energy (memLp_phase2.toLp phase2) (2 * k + 1, 0) = haagCoeff k := by
  unfold energy
  set i₀ : Idx2 := ((k + 1, k), (0, 0))
  have hi₀ : i₀ ∈ bideg ⁻¹' {(2 * k + 1, 0)} := by
    simp only [Set.mem_preimage, Set.mem_singleton_iff, bideg, i₀]; (ext <;> simp); omega
  rw [tsum_eq_single (⟨i₀, hi₀⟩ : ↑(bideg ⁻¹' {(2 * k + 1, 0)}))]
  · rw [inner_hvec2_left]
    have hint : ∫ u, conj (H2 i₀ u) * (memLp_phase2.toLp phase2) u ∂mu2 =
        ∫ z₁, conj (ev z₁ (H (k + 1) k)) * ph z₁ ∂gaussC := by
      have h1 : ∫ u, conj (H2 i₀ u) * (memLp_phase2.toLp phase2) u ∂mu2 =
          ∫ u, conj (H2 i₀ u) * phase2 u ∂mu2 := by
        refine integral_congr_ae ?_
        filter_upwards [memLp_phase2.coeFn_toLp] with u hu; rw [hu]
      rw [h1]
      have h2 : ∀ u : ℂ × ℂ, conj (H2 i₀ u) * phase2 u =
          (conj (ev u.1 (H (k + 1) k)) * ph u.1) * (1 : ℂ) := fun u => by
        simp [H2, i₀, phase2, H_zero_zero, ev]
      simp_rw [h2]
      rw [integral_prod_mul (f := fun z₁ => conj (ev z₁ (H (k + 1) k)) * ph z₁)
        (g := fun _ => (1 : ℂ)), integral_const, probReal_univ, one_smul, mul_one]
    have hnrm : nrm2 i₀ = nrm (k + 1) k := by simp [nrm2, nrm, fac2, i₀]
    have hinner : ⟪hvec (k + 1, k), phaseLp⟫_ℂ =
        (nrm (k + 1) k : ℂ) * ∫ z₁, conj (ev z₁ (H (k + 1) k)) * ph z₁ ∂gaussC := by
      rw [hvec, phaseLp, inner_toLp]
      simp only [hfun, map_mul, Complex.conj_ofReal]
      rw [← integral_const_mul]
      exact integral_congr_ae (Filter.Eventually.of_forall fun _ => by ring)
    rw [hint, hnrm, ← hinner]
    exact phase_energy k
  · intro b hb
    have hb_deg : bideg b.1 = (2 * k + 1, 0) := b.2
    have h2 : b.1.2 = (0, 0) := by
      simp only [bideg, Prod.mk.injEq] at hb_deg; ext <;> simp <;> omega
    have hne : b.1.1.1 + b.1.2.1 ≠ b.1.1.2 + b.1.2.2 + 1 := by
      intro hch; apply hb; apply Subtype.ext
      simp only [bideg, Prod.mk.injEq] at hb_deg
      refine Prod.ext (Prod.ext ?_ ?_) h2 <;> dsimp only [i₀] <;> omega
    rw [inner_hvec2_left]
    have hint : ∫ u, conj (H2 b.1 u) * (memLp_phase2.toLp phase2) u ∂mu2 =
        ∫ u, conj (H2 b.1 u) * phase2 u ∂mu2 := by
      refine integral_congr_ae ?_
      filter_upwards [memLp_phase2.coeFn_toLp] with u hu; rw [hu]
    rw [hint, integral_H2_charge_one memLp_phase2 (fun _ u hc => phase2_rot2 hc u) hne]
    simp

theorem phase_bivarKernel_eq (P : ℝ[X]) (n : ℕ) :
    bivarKernel P 0 (energy (memLp_phase2.toLp phase2)) n =
      ∑ k ∈ range (n + 1), haagCoeff k * (Polynomial.X ^ k * P ^ (2 * k + 1)).coeff n := by
  unfold bivarKernel
  have hpar := energy_eq_zero_of_even memLp_phase2 (fun _ u hc => phase2_rot2 hc u)
  set S : Finset (ℕ × ℕ) := (range (n + 1)).image (fun k => (2 * k + 1, 0))
  rw [tsum_eq_sum (s := S)]
  · rw [sum_image (fun a _ b _ hab => by injection hab with h1 _; omega)]
    refine sum_congr rfl fun k _ => ?_
    rw [energy_phase2_odd_zero k]
    congr 1
    simp only [termOf, shiftOf, pow_zero, mul_one]
    rw [show (2 * k + 1) / 2 + 0 / 2 = k by omega]
  · intro p hp
    rcases Nat.eq_zero_or_pos p.2 with hm0 | hm_pos
    · rcases Nat.even_or_odd p.1 with ⟨k, hk⟩ | ⟨k, hk⟩
      · have hev : (p.1 + p.2) % 2 = 0 := by omega
        rw [hpar p hev, zero_mul]
      · have hkn : n < k := by
          by_contra hle; apply hp; rw [Finset.mem_image]
          exact ⟨k, mem_range.2 (by omega), Prod.ext (by omega) hm0.symm⟩
        have hsh : shiftOf p = k := by simp only [shiftOf]; omega
        rw [termOf, hsh, Polynomial.coeff_X_pow_mul']
        split_ifs with h
        · omega
        · rw [mul_zero]
    · have h0 : (0 : ℝ[X]) ^ p.2 = 0 := zero_pow hm_pos.ne'
      simp [termOf, h0]

end

end Haagerup
