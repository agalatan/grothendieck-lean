import Grothe.UpperChaos.HermiteBasis

/-!
# Charge selection for the Hermite coefficients (U4 of PLAN_UPPER, one coordinate)

The rotation `z ↦ cz` (`|c| = 1`) acts on polynomials in `z, z̄` by `rotP c` (`z ↦ cz`,
`z̄ ↦ c̄z̄`), and `rotP c H_{pq} = c^p c̄^q H_{pq}` (`rotP_H`).  Hence, by rotation invariance of
`gaussC`, a function of charge one (`G(cz) = c G(z)` for `|c| = 1`) has Hermite coefficients
`E[conj H_{pq} · G] = 0` unless `p = q + 1` (`integral_H_charge_one`).
-/

open MeasureTheory ProbabilityTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- The rotation `z ↦ cz`, `z̄ ↦ c̄ z̄` on polynomials. -/
def rotP (c : ℂ) : CPoly →ₐ[ℂ] CPoly := aeval ![C c * X 0, C (conj c) * X 1]

lemma ev_rotP (c z : ℂ) (P : CPoly) : ev z (rotP c P) = ev (c * z) P := by
  induction P using MvPolynomial.induction_on with
  | C a => simp [ev, rotP]
  | add P Q hP hQ => simp only [map_add, ev] at *; rw [hP, hQ]
  | mul_X P i hP =>
    simp only [map_mul, ev] at *
    rw [hP]
    fin_cases i <;> simp [rotP, zv]

lemma pderiv_rotP (c : ℂ) (j : Fin 2) (P : CPoly) :
    pderiv j (rotP c P) = rotP c (pderiv 0 P) * pderiv j (C c * X 0)
      + rotP c (pderiv 1 P) * pderiv j (C (conj c) * X 1) := by
  induction P using MvPolynomial.induction_on with
  | C a => simp [rotP]
  | add P Q hP hQ => simp only [map_add, hP, hQ]; ring
  | mul_X P i hP =>
    simp only [map_mul, Derivation.leibniz, smul_eq_mul, map_add, hP]
    fin_cases i <;> fin_cases j <;> simp [rotP, pderiv_X] <;> ring

lemma A0_C_mul (k : ℂ) (g : CPoly) : A0 (C k * g) = C k * A0 g := by
  simp only [A0, Derivation.leibniz, smul_eq_mul, pderiv_C, mul_zero, add_zero]; ring

lemma A1_C_mul (k : ℂ) (g : CPoly) : A1 (C k * g) = C k * A1 g := by
  simp only [A1, Derivation.leibniz, smul_eq_mul, pderiv_C, mul_zero, add_zero]; ring

variable {c : ℂ} (hc : conj c * c = 1)
include hc

lemma rotP_A0 (f : CPoly) : rotP c (A0 f) = C c * A0 (rotP c f) := by
  have h1 : pderiv 1 (rotP c f) = C (conj c) * rotP c (pderiv 1 f) := by
    rw [pderiv_rotP]; simp [pderiv_X]; ring
  have hX : rotP c (X 0) = C c * X 0 := by simp [rotP]
  have hcc : C c * C (conj c) = (1 : CPoly) := by rw [← map_mul, mul_comm, hc, map_one]
  rw [A0, A0, map_sub, map_mul, h1, hX]
  linear_combination (rotP c (pderiv 1 f)) * hcc

lemma rotP_A1 (f : CPoly) : rotP c (A1 f) = C (conj c) * A1 (rotP c f) := by
  have h0 : pderiv 0 (rotP c f) = C c * rotP c (pderiv 0 f) := by
    rw [pderiv_rotP]; simp [pderiv_X]; ring
  have hX : rotP c (X 1) = C (conj c) * X 1 := by simp [rotP]
  have hcc : C (conj c) * C c = (1 : CPoly) := by rw [← map_mul, hc, map_one]
  rw [A1, A1, map_sub, map_mul, h0, hX]
  linear_combination (rotP c (pderiv 0 f)) * hcc

/-- **`H_{pq}(cz) = c^p c̄^q H_{pq}(z)`** for `|c| = 1` (polynomial form). -/
lemma rotP_H (p q : ℕ) : rotP c (H p q) = C (c ^ p * conj c ^ q) * H p q := by
  induction p with
  | zero =>
    induction q with
    | zero => simp [H_zero_zero]
    | succ q ih =>
      rw [H_zero_succ, rotP_A1 hc, ih, A1_C_mul, ← mul_assoc, ← map_mul, ← H_zero_succ]
      congr 2; ring
  | succ p ih =>
    rw [H_succ_left, rotP_A0 hc, ih, A0_C_mul, ← mul_assoc, ← map_mul, ← H_succ_left]
    congr 2; ring

lemma ev_mul_H (z : ℂ) (p q : ℕ) : ev (c * z) (H p q) = c ^ p * conj c ^ q * ev z (H p q) := by
  rw [← ev_rotP, rotP_H hc]; simp [ev]

omit hc

/-- A unit `c` with `c̄^p c^{q+1} ≠ 1` when `p ≠ q + 1`. -/
lemma exists_charge_witness {p q : ℕ} (hpq : p ≠ q + 1) :
    ∃ c : ℂ, ‖c‖ = 1 ∧ conj (c ^ p * conj c ^ q) * c ≠ 1 := by
  set k : ℤ := (q : ℤ) + 1 - p with hk
  have hk0 : (k : ℂ) ≠ 0 := by rw [Int.cast_ne_zero]; omega
  set c : ℂ := Complex.exp (((Real.pi : ℂ) / k) * Complex.I) with hcdef
  have hc1 : ‖c‖ = 1 := by
    rw [hcdef, show ((Real.pi : ℂ) / k) * Complex.I = ((Real.pi / k : ℝ) : ℂ) * Complex.I by
      push_cast; ring]
    exact Complex.norm_exp_ofReal_mul_I _
  have hc0 : c ≠ 0 := Complex.exp_ne_zero _
  have hci : conj c = c⁻¹ := by
    refine eq_inv_of_mul_eq_one_left ?_
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hc1]; simp
  refine ⟨c, hc1, ?_⟩
  have hpow : conj (c ^ p * conj c ^ q) * c = c ^ k := by
    rw [map_mul, map_pow, map_pow, Complex.conj_conj, hci, hk, zpow_sub₀ hc0, zpow_add₀ hc0,
      zpow_natCast, zpow_natCast, zpow_one, inv_pow]
    field_simp
  rw [hpow, hcdef, ← Complex.exp_int_mul,
    show (k : ℂ) * ((Real.pi : ℂ) / k * Complex.I) = Real.pi * Complex.I by field_simp,
    Complex.exp_pi_mul_I]
  norm_num

/-- **Charge selection**: if `G(cz) = c G(z)` for every `|c| = 1`, then `E[conj H_{pq} · G] = 0`
unless `p = q + 1`. -/
theorem integral_H_charge_one {G : ℂ → ℂ} (hG : ∀ c z, ‖c‖ = 1 → G (c * z) = c * G z)
    {p q : ℕ} (hpq : p ≠ q + 1) : ∫ z, conj (ev z (H p q)) * G z ∂gaussC = 0 := by
  -- a unit `c` with `c^{q+1} c̄^p ≠ 1`
  obtain ⟨c, hc1, hcne⟩ := exists_charge_witness hpq
  have hcc : conj c * c = 1 := by
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hc1]; simp
  have hrot := integral_rot_gaussC c hc1 (fun z => conj (ev z (H p q)) * G z)
  simp only [ev_mul_H hcc, hG c _ hc1, map_mul] at hrot
  have : ∀ z, conj (c ^ p) * conj (conj c ^ q) * conj (ev z (H p q)) * (c * G z)
      = (conj (c ^ p * conj c ^ q) * c) * (conj (ev z (H p q)) * G z) := fun z => by
    simp only [map_mul]; ring
  simp_rw [this, integral_const_mul] at hrot
  have h2 : (conj (c ^ p * conj c ^ q) * c - 1) * ∫ z, conj (ev z (H p q)) * G z ∂gaussC = 0 := by
    rw [sub_mul, hrot, one_mul, sub_self]
  exact (mul_eq_zero.1 h2).resolve_left (sub_ne_zero.2 hcne)

end

end Grothe.UpperChaos
