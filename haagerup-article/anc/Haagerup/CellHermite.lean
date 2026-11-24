import Haagerup.CellMap
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic

set_option warningAsError true

/-!
# Polar Hermite-Laguerre overlaps for `cellFn` and square-root-free smoothed energy

1. Proves the square-root-free Laguerre polynomial identities (`rTilde`) and the polar evaluation
   formula `ev_H_polar` for complex Hermite polynomials `H p q` on `ℂ`;
2. Integrates `conj (H2 i u) * cellFn creArr cimArr u` in polar coordinates over `mu2`, cancelling
   `2π · π⁻¹ · (1/2) = 1` identically so no `π`, `√`, or `Γ` factors remain;
3. Proves `tig_bivarKernel_eq` for any antisymmetric channel `(-R, R)`;
4. Proves `smoothed_energy_eq` expressing `energy (toLp (smoothMap ct st se ce (cellFn ...))) (d₁, d₂)`
   for odd `d₁ + d₂ = 2k + 1` via `gScaled`, `bCoeff`, and binomial coefficients with zero square roots.

Agent-ID: gemini-21d5
-/

namespace Haagerup

open MeasureTheory ProbabilityTheory Finset Polynomial Complex Real
open HaagerupKernel HaagerupKernel.Cell
open scoped ComplexConjugate InnerProductSpace

noncomputable section

/-! ### 1. Normalized Laguerre polynomials `rTilde n a = (-1)^n L_n^{(a)}` -/

def rTilde : ℕ → ℕ → ℝ[X]
  | 0, _ => 1
  | 1, a => X - C (a + 1 : ℝ)
  | n + 2, a =>
    C (((n + 2 : ℝ))⁻¹) *
      ((X - C (2 * n + 3 + a : ℝ)) * rTilde (n + 1) a - C (n + 1 + a : ℝ) * rTilde n a)

lemma rTilde_rec_succ (n a : ℕ) :
    C (n + 2 : ℝ) * rTilde (n + 2) a =
      (X - C (2 * n + 3 + a : ℝ)) * rTilde (n + 1) a - C (n + 1 + a : ℝ) * rTilde n a := by
  conv_lhs => rw [rTilde]
  rw [← mul_assoc, ← C_mul, mul_inv_cancel₀ (by positivity), C_1, one_mul]

lemma rTilde_sub_succ_a : ∀ n a : ℕ, rTilde (n + 1) a - rTilde (n + 1) (a + 1) = rTilde n (a + 1)
  | 0, a => by
    simp only [rTilde]
    push_cast; simp only [map_add, map_one]; ring
  | 1, a => by
    have h1 := rTilde_rec_succ 0 a
    have h2 := rTilde_rec_succ 0 (a + 1)
    simp only [Nat.cast_zero, zero_add, mul_zero] at h1 h2
    have hsub : C (2 : ℝ) * (rTilde 2 a - rTilde 2 (a + 1)) = C (2 : ℝ) * rTilde 1 (a + 1) := by
      rw [mul_sub, h1, h2]
      simp only [rTilde]
      push_cast; simp only [map_add, map_ofNat, map_one]; ring
    have hinv := congrArg (C (2⁻¹ : ℝ) * ·) hsub
    simpa only [← mul_assoc, ← C_mul, inv_mul_cancel₀ (by norm_num : (2 : ℝ) ≠ 0), C_1, one_mul]
      using hinv
  | n + 2, a => by
    have ih1 := rTilde_sub_succ_a (n + 1) a
    have ih0 := rTilde_sub_succ_a n a
    have e1 : rTilde (n + 2) a = rTilde (n + 2) (a + 1) + rTilde (n + 1) (a + 1) :=
      sub_eq_iff_eq_add'.1 ih1
    have e0 : rTilde (n + 1) a = rTilde (n + 1) (a + 1) + rTilde n (a + 1) :=
      sub_eq_iff_eq_add'.1 ih0
    have r1 := rTilde_rec_succ (n + 1) a
    have r2 := rTilde_rec_succ (n + 1) (a + 1)
    have r0 := rTilde_rec_succ n (a + 1)
    simp only [Nat.cast_add, Nat.cast_one] at r1 r2
    have hsub : C ((n : ℝ) + 1 + 2) * (rTilde (n + 3) a - rTilde (n + 3) (a + 1)) =
        C ((n : ℝ) + 1 + 2) * rTilde (n + 2) (a + 1) := by
      rw [mul_sub, r1, r2, e1, e0]
      simp only [Nat.cast_add, Nat.cast_one, map_add, map_mul, map_ofNat, map_one] at r0 ⊢
      linear_combination -r0
    have hne : ((n : ℝ) + 1 + 2) ≠ 0 := by positivity
    have hinv := congrArg (C (((n : ℝ) + 1 + 2)⁻¹) * ·) hsub
    simpa only [← mul_assoc, ← C_mul, inv_mul_cancel₀ hne, C_1, one_mul] using hinv

lemma derivative_rTilde : ∀ n a : ℕ,
    (rTilde n a).derivative = if n = 0 then 0 else rTilde (n - 1) (a + 1)
  | 0, _ => by simp [rTilde]
  | 1, a => by simp [rTilde]
  | n + 2, a => by
    have ih1 := derivative_rTilde (n + 1) a
    have ih0 := derivative_rTilde n a
    simp only [Nat.add_eq_zero_iff, OfNat.ofNat_ne_zero, one_ne_zero, and_false, ↓reduceIte,
      Nat.add_sub_cancel] at ih1 ⊢
    rw [show n + 2 - 1 = n + 1 by omega]
    have r1 := congrArg Polynomial.derivative (rTilde_rec_succ n a)
    rw [derivative_mul, derivative_C, zero_mul, zero_add, derivative_sub,
      derivative_mul, derivative_sub, derivative_X, derivative_C, sub_zero, one_mul,
      derivative_mul, derivative_C, zero_mul, zero_add, ih1] at r1
    have hsub := sub_eq_iff_eq_add'.1 (rTilde_sub_succ_a n a)
    have hgoal : C (n + 2 : ℝ) * (rTilde (n + 2) a).derivative =
        C (n + 2 : ℝ) * rTilde (n + 1) (a + 1) := by
      cases n with
      | zero =>
        simp only [↓reduceIte] at ih0
        rw [r1, hsub, ih0, mul_zero, sub_zero]
        simp only [rTilde, Nat.cast_zero, mul_zero, zero_add]
        push_cast; simp only [map_add, map_ofNat, map_one]; ring
      | succ m =>
        simp only [Nat.add_eq_zero_iff, one_ne_zero, and_false, ↓reduceIte, Nat.add_sub_cancel] at ih0
        rw [r1, hsub, ih0]
        have r0 := rTilde_rec_succ m (a + 1)
        simp only [Nat.cast_add, Nat.cast_one, map_add, map_mul, map_ofNat, map_one] at r0 ⊢
        linear_combination -r0
    have hne : (n + 2 : ℝ) ≠ 0 := by positivity
    have hinv := congrArg (C ((n + 2 : ℝ)⁻¹) * ·) hgoal
    simpa only [← mul_assoc, ← C_mul, inv_mul_cancel₀ hne, C_1, one_mul] using hinv

lemma rTilde_sub_deriv (n a : ℕ) : rTilde n a - (rTilde n a).derivative = rTilde n (a + 1) := by
  cases n with
  | zero => simp [rTilde]
  | succ m =>
    rw [derivative_rTilde]
    simp only [Nat.add_eq_zero_iff, one_ne_zero, and_false, ↓reduceIte, Nat.add_sub_cancel]
    have h := rTilde_sub_succ_a m a
    exact sub_eq_iff_eq_add.2 (sub_eq_iff_eq_add'.1 h)

lemma X_mul_rTilde_succ_a : ∀ n a : ℕ,
    X * rTilde n (a + 1) = C (n + 1 : ℝ) * rTilde (n + 1) a + C (n + a + 1 : ℝ) * rTilde n a
  | 0, a => by
    simp only [rTilde, Nat.cast_zero, zero_add, map_add, map_one]; ring
  | m + 1, a => by
    have ih := X_mul_rTilde_succ_a m a
    have r1 := rTilde_rec_succ m a
    have hsub := rTilde_sub_succ_a m a
    simp only [Nat.cast_add, Nat.cast_one, map_add, map_mul, map_ofNat, map_one] at ih r1 ⊢
    linear_combination -X * hsub - ih - r1

/-! ### 2. Polar formula for complex Hermite polynomials `H p q` -/

def embedS : ℝ[X] →+* CPoly :=
  Polynomial.eval₂RingHom (MvPolynomial.C.comp Complex.ofRealHom) (MvPolynomial.X 0 * MvPolynomial.X 1)

lemma embedS_C (r : ℝ) : embedS (C r) = MvPolynomial.C (r : ℂ) := by simp [embedS]

lemma embedS_X : embedS X = MvPolynomial.X 0 * MvPolynomial.X 1 := by simp [embedS]

lemma pderiv0_embedS (P : ℝ[X]) :
    MvPolynomial.pderiv 0 (embedS P) = MvPolynomial.X 1 * embedS P.derivative := by
  induction P using Polynomial.induction_on with
  | C r => simp [embedS_C]
  | add p q hp hq => simp [map_add, mul_add, hp, hq]
  | monomial n r ih =>
    have he : C r * X ^ (n + 1) = (C r * X ^ n) * X := by rw [pow_succ, ← mul_assoc]
    rw [he, map_mul, embedS_X, Derivation.leibniz, ih]
    conv_rhs => rw [derivative_mul, derivative_X, mul_one]
    simp only [Derivation.leibniz, MvPolynomial.pderiv_X_self,
      MvPolynomial.pderiv_X_of_ne (show (1 : Fin 2) ≠ 0 by decide),
      smul_eq_mul, map_add, map_mul, embedS_X, mul_one, mul_zero, zero_add]
    ring

private lemma A1_C_mul' (c : ℂ) (f : CPoly) : A1 (MvPolynomial.C c * f) = MvPolynomial.C c * A1 f := by
  simp only [A1, Derivation.leibniz, MvPolynomial.pderiv_C, smul_eq_mul, mul_zero]
  ring

lemma A0_iter_A1 (p : ℕ) (f : CPoly) : A0^[p] (A1 f) = A1 (A0^[p] f) := by
  induction p with
  | zero => rfl
  | succ p ih => rw [Function.iterate_succ_apply', Function.iterate_succ_apply', ih, A1_A0]

lemma H_succ_right (p q : ℕ) : H p (q + 1) = A1 (H p q) := by
  simp only [H, Function.iterate_succ_apply', A0_iter_A1]

lemma conjP_A0 (f : CPoly) : conjP (A0 f) = A1 (conjP f) := by
  rw [A0, A1, map_sub, map_mul, conjP_X, pderiv_conjP]; rfl

lemma conjP_A1 (f : CPoly) : conjP (A1 f) = A0 (conjP f) := by
  rw [A1, A0, map_sub, map_mul, conjP_X, pderiv_conjP]; rfl

lemma conjP_H (p q : ℕ) : conjP (H p q) = H q p := by
  induction p with
  | zero =>
    induction q with
    | zero => simp [H_zero_zero]
    | succ q ih => rw [H_zero_succ, conjP_A1, ih, H_succ_left]
  | succ p ih => rw [H_succ_left, conjP_A0, ih, H_succ_right]

lemma pderiv0_X0_pow (m : ℕ) :
    MvPolynomial.pderiv 0 (MvPolynomial.X 0 ^ (m + 1) : CPoly) =
      MvPolynomial.C (m + 1 : ℂ) * MvPolynomial.X 0 ^ m := by
  induction m with
  | zero => simp [MvPolynomial.pderiv_X]
  | succ m ih =>
    rw [pow_succ (MvPolynomial.X 0) (m + 1), Derivation.leibniz, ih]
    simp only [MvPolynomial.pderiv_X, Pi.single_eq_same, smul_eq_mul, Nat.cast_add, Nat.cast_one,
      map_add, map_one, pow_succ]
    ring

lemma pderiv1_X0_pow (a : ℕ) : MvPolynomial.pderiv 1 (MvPolynomial.X 0 ^ a : CPoly) = 0 := by
  induction a with
  | zero => simp
  | succ a ih => rw [pow_succ, Derivation.leibniz, ih]; simp [MvPolynomial.pderiv_X]

lemma A1_pow_mul_embedS (a : ℕ) (P : ℝ[X]) :
    A1 (MvPolynomial.X 0 ^ (a + 1) * embedS P) =
      MvPolynomial.X 0 ^ a *
        embedS (X * (P - P.derivative) - C (a + 1 : ℝ) * P) := by
  unfold A1
  rw [Derivation.leibniz, pderiv0_X0_pow, pderiv0_embedS]
  simp only [smul_eq_mul, map_sub, map_mul, embedS_X, embedS_C, Complex.ofReal_add,
    Complex.ofReal_natCast, Complex.ofReal_one, pow_succ]
  ring

lemma H_zero_right (a : ℕ) : H a 0 = MvPolynomial.X 0 ^ a := by
  induction a with
  | zero => simp [H_zero_zero]
  | succ a ih =>
    rw [H_succ_left, ih, A0, pderiv1_X0_pow, sub_zero, pow_succ']

theorem H_eq_rTilde_nonneg : ∀ n a : ℕ,
    H (n + a) n = MvPolynomial.C (n.factorial : ℂ) * (MvPolynomial.X 0 ^ a * embedS (rTilde n a))
  | 0, a => by simp [H_zero_right, rTilde]
  | n + 1, a => by
    have hstep : H (n + 1 + a) (n + 1) = A1 (H (n + (a + 1)) n) := by
      rw [show n + 1 + a = n + (a + 1) by omega, H_succ_right]
    rw [hstep, H_eq_rTilde_nonneg n (a + 1), A1_C_mul', A1_pow_mul_embedS, rTilde_sub_deriv]
    have hrec : X * rTilde n (a + 2) - C (a + 1 : ℝ) * rTilde n (a + 1) =
        C (n + 1 : ℝ) * rTilde (n + 1) a := by
      rw [show a + 2 = (a + 1) + 1 by omega, X_mul_rTilde_succ_a n (a + 1)]
      have hsub := sub_eq_iff_eq_add'.1 (rTilde_sub_succ_a n a)
      push_cast; simp only [map_add, map_one]
      linear_combination -(C (n : ℝ) + 1) * hsub
    rw [hrec, map_mul, embedS_C, Nat.factorial_succ]
    push_cast; simp only [map_add, map_mul, map_one]; ring

lemma ev_embedS (z : ℂ) (P : ℝ[X]) : ev z (embedS P) = ((P.eval (‖z‖ ^ 2) : ℝ) : ℂ) := by
  induction P using Polynomial.induction_on with
  | C r => simp [embedS_C, ev]
  | add p q hp hq => simp only [ev, map_add, eval_add, Complex.ofReal_add] at *; rw [hp, hq]
  | monomial n r ih =>
    have he : C r * X ^ (n + 1) = (C r * X ^ n) * X := by rw [pow_succ, ← mul_assoc]
    rw [he, map_mul, embedS_X, eval_mul, eval_X]
    simp only [ev, map_mul, MvPolynomial.eval_X, zv, Matrix.cons_val_zero, Matrix.cons_val_one] at ih ⊢
    rw [ih, Complex.mul_conj, Complex.normSq_eq_norm_sq]
    push_cast; rfl

theorem ev_H_polar (p q : ℕ) {r θ : ℝ} (hr : 0 < r) :
    conj (ev ((r : ℂ) * Complex.exp (θ * Complex.I)) (H p q)) =
      (((min p q).factorial : ℝ) *
        (r ^ ((p : ℤ) - q).natAbs * (rTilde (min p q) ((p : ℤ) - q).natAbs).eval (r ^ 2)) : ℂ) *
        Complex.exp ((-(((p : ℤ) - q : ℤ) : ℂ)) * (θ * Complex.I)) := by
  set z : ℂ := (r : ℂ) * Complex.exp (θ * Complex.I)
  have hnorm : ‖z‖ = r := by
    dsimp only [z]
    rw [norm_mul, Complex.norm_exp_ofReal_mul_I, mul_one, Complex.norm_of_nonneg hr.le]
  rcases le_or_gt q p with hqp | hpq
  · set a := p - q
    have hp : p = q + a := by omega
    have hmin : min p q = q := Nat.min_eq_right hqp
    have hdiff : (p : ℤ) - q = (a : ℤ) := by omega
    have hna : ((p : ℤ) - q).natAbs = a := by omega
    rw [hmin, hna, hdiff, hp, H_eq_rTilde_nonneg q a]
    simp only [ev, map_mul, map_pow, MvPolynomial.eval_C, MvPolynomial.eval_X]
    rw [show MvPolynomial.eval (zv z) (embedS (rTilde q a)) = ev z (embedS (rTilde q a)) from rfl,
      ev_embedS, hnorm]
    simp only [zv, Matrix.cons_val_zero, map_mul, Complex.conj_natCast,
      Complex.conj_ofReal, z]
    have hcexp : conj (Complex.exp (θ * Complex.I)) ^ a =
        Complex.exp ((-((a : ℤ) : ℂ)) * (θ * Complex.I)) := by
      rw [← Complex.exp_conj, ← Complex.exp_nat_mul]
      congr 1
      simp only [map_mul, Complex.conj_ofReal, Complex.conj_I]
      push_cast; ring
    rw [mul_pow, hcexp]
    push_cast; ring
  · set a := q - p
    have hq : q = p + a := by omega
    have hmin : min p q = p := Nat.min_eq_left hpq.le
    have hdiff : (p : ℤ) - q = -(a : ℤ) := by omega
    have hna : ((p : ℤ) - q).natAbs = a := by omega
    rw [hmin, hna, hdiff, ← conjP_H, ev_conjP, Complex.conj_conj, hq, H_eq_rTilde_nonneg p a]
    simp only [ev, map_mul, map_pow, MvPolynomial.eval_C, MvPolynomial.eval_X]
    rw [show MvPolynomial.eval (zv z) (embedS (rTilde p a)) = ev z (embedS (rTilde p a)) from rfl,
      ev_embedS, hnorm]
    simp only [zv, Matrix.cons_val_zero, z]
    have hexp : Complex.exp (θ * Complex.I) ^ a =
        Complex.exp ((-(-(a : ℤ) : ℂ)) * (θ * Complex.I)) := by
      rw [← Complex.exp_nat_mul]; congr 1; push_cast; ring
    rw [mul_pow, hexp]
    push_cast; ring

/-! ### 3. Polar cell integrals and Hermite overlaps of `cellFn` -/

def cellLagInt (a n i : ℕ) : ℝ :=
  ∫ r in (3 * (i : ℝ) / 32)..(3 * ((i + 1 : ℕ) : ℝ) / 32),
    2 * r ^ (a + 1) * Real.exp (-r ^ 2) * (rTilde n a).eval (r ^ 2)

def modeOverlap (creArr cimArr : Array Int) (idxM n1 n2 : ℕ) : ℂ :=
  let mSigned : ℤ := (idxM : ℤ) - 17
  let a := mSigned.natAbs
  let b := (1 - mSigned).natAbs
  ∑ b1 ∈ range 64, ∑ b2 ∈ range 64,
    cellCoeffC creArr cimArr idxM (64 * b1 + b2) *
      ((cellLagInt a n1 b1 * cellLagInt b n2 b2 : ℝ) : ℂ)

def muTigOf (creArr cimArr : Array Int) (k : ℕ) : ℝ :=
  ∑ idxM ∈ range 36,
    let mSigned : ℤ := (idxM : ℤ) - 17
    let a := mSigned.natAbs
    let b := (1 - mSigned).natAbs
    let k0 := (a + b - 1) / 2
    if k < k0 then 0
    else
      ∑ n1 ∈ range (k - k0 + 1),
        let n2 := k - k0 - n1
        (if mSigned % 2 = 0 then (1 : ℝ) else -1) *
          (‖modeOverlap creArr cimArr idxM n1 n2‖ ^ 2 /
            ((risingFact n1 a * risingFact n2 b : ℕ) : ℝ))

private lemma integral_exp_int_Ioo (d : ℤ) :
    ∫ θ in Set.Ioo (-Real.pi) Real.pi, Complex.exp ((d : ℂ) * (θ * Complex.I)) =
      if d = 0 then ((2 * Real.pi : ℝ) : ℂ) else 0 := by
  rw [← MeasureTheory.integral_Ioc_eq_integral_Ioo,
    ← intervalIntegral.integral_of_le (by linarith [Real.pi_pos] : -Real.pi ≤ Real.pi)]
  split_ifs with hd
  · subst hd
    simp only [Int.cast_zero, zero_mul, Complex.exp_zero, intervalIntegral.integral_const,
      Complex.real_smul, mul_one]
    push_cast; ring
  · have hc : ((d : ℂ) * Complex.I) ≠ 0 :=
      mul_ne_zero (by exact_mod_cast hd) Complex.I_ne_zero
    have he : ∀ θ : ℝ, Complex.exp ((d : ℂ) * (θ * Complex.I)) =
        Complex.exp (((d : ℂ) * Complex.I) * θ) := fun θ => by ring_nf
    simp_rw [he]
    rw [integral_exp_mul_complex hc]
    have hper : Complex.exp (((d : ℂ) * Complex.I) * (Real.pi : ℂ)) =
        Complex.exp (((d : ℂ) * Complex.I) * (-(Real.pi : ℂ))) := by
      have hadd : ((d : ℂ) * Complex.I) * (Real.pi : ℂ) =
          ((d : ℂ) * Complex.I) * (-(Real.pi : ℂ)) + (d : ℂ) * (2 * Real.pi * Complex.I) := by ring
      rw [hadd, Complex.exp_add, Complex.exp_int_mul_two_pi_mul_I, mul_one]
    simp [hper]

private lemma integral_gaussC_polar_finSupport (F : ℂ → ℂ) (hFm : Measurable F)
    (hsupp : ∀ z : ℂ, 6 ≤ ‖z‖ → F z = 0) {M : ℝ} (hM : ∀ z : ℂ, ‖F z‖ ≤ M) :
    ∫ z, F z ∂gaussC =
      ∫ p in Set.Ioi (0 : ℝ) ×ˢ Set.Ioo (-Real.pi) Real.pi,
        ((p.1 * (Real.pi⁻¹ * Real.exp (-p.1 ^ 2)) : ℝ) : ℂ) * F (Complex.polarCoord.symm p) := by
  set T := Set.Ioi (0 : ℝ) ×ˢ Set.Ioo (-Real.pi) Real.pi
  set B := Set.Ioo (0 : ℝ) 6 ×ˢ Set.Ioo (-Real.pi) Real.pi
  set w : ℝ × ℝ → ℝ := fun p => p.1 * (Real.pi⁻¹ * Real.exp (-p.1 ^ 2))
  have hFi : Integrable F gaussC :=
    (integrable_const M).mono' hFm.aestronglyMeasurable (Filter.Eventually.of_forall hM)
  have hp_meas : Measurable (⇑Complex.polarCoord.symm) := by
    rw [show (⇑Complex.polarCoord.symm) =
      fun p : ℝ × ℝ => (p.1 : ℂ) * ((Real.cos p.2 : ℂ) + (Real.sin p.2 : ℂ) * Complex.I)
      from _root_.funext Complex.polarCoord_symm_apply]
    fun_prop
  have hwF_meas : Measurable fun p : ℝ × ℝ => (w p : ℂ) * F (Complex.polarCoord.symm p) :=
    ((by unfold w; fun_prop : Measurable w).complex_ofReal).mul (hFm.comp hp_meas)
  have hB_fin : volume B < ⊤ := by
    rw [Measure.volume_eq_prod, Measure.prod_prod]
    exact ENNReal.mul_lt_top (by simp) (by simp)
  have hB_int : IntegrableOn (fun p => (w p : ℂ) * F (Complex.polarCoord.symm p)) B volume := by
    refine Measure.integrableOn_of_bounded hB_fin.ne hwF_meas.aestronglyMeasurable
      (M := 6 * Real.pi⁻¹ * M)
      (ae_restrict_of_forall_mem (measurableSet_Ioo.prod measurableSet_Ioo) fun p hp => ?_)
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs,
      abs_of_nonneg (by dsimp only [w]; have := hp.1.1; positivity)]
    have hexp1 : Real.exp (-p.1 ^ 2) ≤ 1 := Real.exp_le_one_iff.2 (by nlinarith)
    have hw_le : w p ≤ 6 * Real.pi⁻¹ := by
      have hp0 : 0 ≤ p.1 := hp.1.1.le
      have hp6 : p.1 ≤ 6 := hp.1.2.le
      dsimp only [w]
      calc p.1 * (Real.pi⁻¹ * Real.exp (-p.1 ^ 2))
          ≤ 6 * (Real.pi⁻¹ * 1) := by gcongr
        _ = 6 * Real.pi⁻¹ := by ring
    exact mul_le_mul hw_le (hM _) (norm_nonneg _) (by positivity)
  have hT_eq_B : ∀ p ∈ T, p ∉ B → (w p : ℂ) * F (Complex.polarCoord.symm p) = 0 := by
    intro p hp hpB
    have h6 : 6 ≤ p.1 := by
      by_contra hlt
      exact hpB ⟨⟨hp.1, not_le.1 hlt⟩, hp.2⟩
    have hn : 6 ≤ ‖Complex.polarCoord.symm p‖ := by
      rw [norm_polarCoord_symm_of_mem hp]; exact h6
    rw [hsupp _ hn, mul_zero]
  have hT_int : IntegrableOn (fun p => (w p : ℂ) * F (Complex.polarCoord.symm p)) T volume := by
    have hsub : B ⊆ T := Set.prod_mono (fun _ hr => hr.1) Set.Subset.rfl
    rw [← integrable_indicator_iff (measurableSet_Ioi.prod measurableSet_Ioo)]
    have heq : T.indicator (fun p => (w p : ℂ) * F (Complex.polarCoord.symm p)) =
        B.indicator (fun p => (w p : ℂ) * F (Complex.polarCoord.symm p)) := by
      funext p
      by_cases hpB : p ∈ B
      · rw [Set.indicator_of_mem (hsub hpB), Set.indicator_of_mem hpB]
      · rw [Set.indicator_of_notMem hpB]
        by_cases hpT : p ∈ T
        · rw [Set.indicator_of_mem hpT, hT_eq_B p hpT hpB]
        · rw [Set.indicator_of_notMem hpT]
    rw [heq]
    exact (integrable_indicator_iff (measurableSet_Ioo.prod measurableSet_Ioo)).2 hB_int
  apply RCLike.ext
  · rw [← integral_re hFi, ← integral_re hT_int,
      show (fun z : ℂ => RCLike.re (F z)) = (fun z : ℂ => (F z).re) from rfl,
      integral_gaussC_polar (fun z => (F z).re) (Complex.continuous_re.measurable.comp hFm)]
    refine setIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo) fun p _ => ?_
    exact (Complex.re_ofReal_mul (w p) (F (Complex.polarCoord.symm p))).symm
  · rw [← integral_im hFi, ← integral_im hT_int,
      show (fun z : ℂ => RCLike.im (F z)) = (fun z : ℂ => (F z).im) from rfl,
      integral_gaussC_polar (fun z => (F z).im) (Complex.continuous_im.measurable.comp hFm)]
    refine setIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo) fun p _ => ?_
    exact (Complex.im_ofReal_mul (w p) (F (Complex.polarCoord.symm p))).symm

private lemma polarCoord_symm_eq_exp {p : ℝ × ℝ} (hp : p ∈ Set.Ioi (0 : ℝ) ×ˢ Set.Ioo (-Real.pi) Real.pi) :
    Complex.polarCoord.symm p = (p.1 : ℂ) * Complex.exp (p.2 * Complex.I) ∧
      ph (Complex.polarCoord.symm p) = Complex.exp (p.2 * Complex.I) := by
  have heq : Complex.polarCoord.symm p = (p.1 : ℂ) * Complex.exp (p.2 * Complex.I) := by
    rw [Complex.polarCoord_symm_apply, Complex.ofReal_cos, Complex.ofReal_sin, ← Complex.exp_mul_I]
  refine ⟨heq, ?_⟩
  rw [ph, norm_polarCoord_symm_of_mem hp, heq, mul_div_cancel_left₀ _ (by exact_mod_cast hp.1.ne')]

private lemma one_coord_cell_integral (p q b : ℕ) (mTarget : ℤ) :
    ∫ pt in Set.Ioi (0 : ℝ) ×ˢ Set.Ioo (-Real.pi) Real.pi,
      ((pt.1 * (Real.pi⁻¹ * Real.exp (-pt.1 ^ 2)) : ℝ) : ℂ) *
        ((Set.Ico (3 * (b : ℝ) / 32) (3 * ((b + 1 : ℕ) : ℝ) / 32)).indicator (fun _ => (1 : ℂ)) pt.1 *
          conj (ev (Complex.polarCoord.symm pt) (H p q)) *
          Complex.exp ((mTarget : ℂ) * (pt.2 * Complex.I))) =
      if mTarget = (p : ℤ) - q then
        (((min p q).factorial : ℝ) * cellLagInt ((p : ℤ) - q).natAbs (min p q) b : ℂ)
      else 0 := by
  set a := ((p : ℤ) - q).natAbs
  set m := min p q
  set ra := 3 * (b : ℝ) / 32
  set rb := 3 * ((b + 1 : ℕ) : ℝ) / 32
  have hra0 : 0 ≤ ra := by dsimp only [ra]; positivity
  have hrab : ra ≤ rb := by dsimp only [ra, rb]; push_cast; linarith
  set fR : ℝ → ℂ := fun r =>
    (Set.Ico ra rb).indicator
      (fun r => ((r * (Real.pi⁻¹ * Real.exp (-r ^ 2)) *
        ((m.factorial : ℝ) * (r ^ a * (rTilde m a).eval (r ^ 2))) : ℝ) : ℂ)) r
  set fTh : ℝ → ℂ := fun θ => Complex.exp (((mTarget - ((p : ℤ) - q) : ℤ) : ℂ) * (θ * Complex.I))
  have hcongr : ∀ pt ∈ Set.Ioi (0 : ℝ) ×ˢ Set.Ioo (-Real.pi) Real.pi,
      ((pt.1 * (Real.pi⁻¹ * Real.exp (-pt.1 ^ 2)) : ℝ) : ℂ) *
        ((Set.Ico ra rb).indicator (fun _ => (1 : ℂ)) pt.1 *
          conj (ev (Complex.polarCoord.symm pt) (H p q)) *
          Complex.exp ((mTarget : ℂ) * (pt.2 * Complex.I))) = fR pt.1 * fTh pt.2 := by
    intro pt hpt
    rw [(polarCoord_symm_eq_exp hpt).1, ev_H_polar p q hpt.1]
    dsimp only [fR, fTh, a, m]
    by_cases hr : pt.1 ∈ Set.Ico ra rb
    · rw [Set.indicator_of_mem hr, Set.indicator_of_mem hr]
      have hexp : Complex.exp ((-(((p : ℤ) - q : ℤ) : ℂ)) * (pt.2 * Complex.I)) *
          Complex.exp ((mTarget : ℂ) * (pt.2 * Complex.I)) =
          Complex.exp (((mTarget - ((p : ℤ) - q) : ℤ) : ℂ) * (pt.2 * Complex.I)) := by
        rw [← Complex.exp_add]; congr 1; push_cast; ring
      rw [show ∀ u v e1 e2 : ℂ, u * (1 * (v * e1) * e2) = u * v * (e1 * e2)
        from fun _ _ _ _ => by ring, hexp]
      push_cast; ring
    · rw [Set.indicator_of_notMem hr, Set.indicator_of_notMem hr]; simp
  rw [setIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo) hcongr,
    Measure.volume_eq_prod, setIntegral_prod_mul, integral_exp_int_Ioo]
  have hsub0 : mTarget - ((p : ℤ) - q) = 0 ↔ mTarget = (p : ℤ) - q := sub_eq_zero
  rw [ite_congr (propext hsub0) (fun _ => rfl) (fun _ => rfl)]
  split_ifs with hm
  · have hIco_sub : Set.Ico ra rb ⊆ Set.Ici 0 := fun _ hr => hra0.trans hr.1
    have hR_val : ∫ r in Set.Ioi (0 : ℝ), fR r =
        ((Real.pi⁻¹ * (m.factorial : ℝ) * (cellLagInt a m b / 2) : ℝ) : ℂ) := by
      dsimp only [fR]
      rw [← MeasureTheory.integral_Ici_eq_integral_Ioi,
        MeasureTheory.setIntegral_indicator measurableSet_Ico,
        Set.inter_eq_right.2 hIco_sub,
        show (fun r : ℝ => ((r * (Real.pi⁻¹ * Real.exp (-r ^ 2)) *
          ((m.factorial : ℝ) * (r ^ a * (rTilde m a).eval (r ^ 2))) : ℝ) : ℂ)) =
          fun r : ℝ => (((r * (Real.pi⁻¹ * Real.exp (-r ^ 2)) *
            ((m.factorial : ℝ) * (r ^ a * (rTilde m a).eval (r ^ 2)))) : ℝ) : ℂ) from rfl,
        integral_complex_ofReal,
        MeasureTheory.integral_Ico_eq_integral_Ioc,
        ← intervalIntegral.integral_of_le hrab]
      congr 1
      have he : ∀ r : ℝ, r * (Real.pi⁻¹ * Real.exp (-r ^ 2)) *
          ((m.factorial : ℝ) * (r ^ a * (rTilde m a).eval (r ^ 2))) =
          (Real.pi⁻¹ * (m.factorial : ℝ) / 2) *
            (2 * r ^ (a + 1) * Real.exp (-r ^ 2) * (rTilde m a).eval (r ^ 2)) := fun r => by
        rw [pow_succ']; ring
      simp_rw [he]
      rw [intervalIntegral.integral_const_mul, cellLagInt]
      ring
    rw [hR_val]
    have hpi : (Real.pi : ℂ) ≠ 0 := by exact_mod_cast Real.pi_ne_zero
    push_cast; field_simp
  · simp

private def radInd (b : ℕ) (z : ℂ) : ℂ :=
  if z = 0 then 0
  else (Set.Ico (3 * (b : ℝ) / 32) (3 * ((b + 1 : ℕ) : ℝ) / 32)).indicator (fun _ => (1 : ℂ)) ‖z‖

private def atom1D (b : ℕ) (m : ℤ) (z : ℂ) : ℂ :=
  radInd b z * ph z ^ m

private lemma measurable_radInd (b : ℕ) : Measurable (radInd b) := by
  unfold radInd
  refine Measurable.ite (measurableSet_singleton 0) measurable_const ?_
  exact measurable_const.indicator (measurableSet_Ico.preimage continuous_norm.measurable)

private lemma measurable_atom1D (b : ℕ) (m : ℤ) : Measurable (atom1D b m) := by
  refine (measurable_radInd b).mul ?_
  cases m with
  | ofNat n =>
    simp only [Int.ofNat_eq_natCast, zpow_natCast]
    exact measurable_ph.pow_const n
  | negSucc n =>
    simp only [zpow_negSucc]
    exact (measurable_ph.pow_const (n + 1)).inv

private lemma radInd_eq_zero_of_ge_six {b : ℕ} (hb : b < 64) {z : ℂ} (hz : 6 ≤ ‖z‖) :
    radInd b z = 0 := by
  unfold radInd
  split_ifs with h0
  · rfl
  · refine Set.indicator_of_notMem (f := fun _ => (1 : ℂ)) fun hmem => ?_
    have hlt := hmem.2
    have hle : 3 * ((b + 1 : ℕ) : ℝ) / 32 ≤ 6 := by
      have hb' : ((b + 1 : ℕ) : ℝ) ≤ 64 := by exact_mod_cast hb
      linarith
    linarith

private lemma norm_atom1D_le (b : ℕ) (m : ℤ) (z : ℂ) : ‖atom1D b m z‖ ≤ 1 := by
  unfold atom1D radInd
  by_cases hz : z = 0
  · simp [hz]
  · rw [ite_eq_right hz]
    by_cases hm : ‖z‖ ∈ Set.Ico (3 * (b : ℝ) / 32) (3 * ((b + 1 : ℕ) : ℝ) / 32)
    · rw [Set.indicator_of_mem hm, one_mul, norm_zpow]
      have hn : ‖ph z‖ = 1 := by
        rw [ph, norm_div, Complex.norm_real, Real.norm_of_nonneg (norm_nonneg z),
          div_self (norm_ne_zero_iff.2 hz)]
      rw [hn, one_zpow]
    · rw [Set.indicator_of_notMem hm, zero_mul, norm_zero]
      exact zero_le_one

private lemma radInd_of_lt_six {z : ℂ} (hz0 : z ≠ 0) (b : ℕ) :
    radInd b z = if b = radBin z then 1 else 0 := by
  unfold radInd
  rw [ite_eq_right hz0]
  have hiff : ‖z‖ ∈ Set.Ico (3 * (b : ℝ) / 32) (3 * ((b + 1 : ℕ) : ℝ) / 32) ↔ b = radBin z := by
    rw [Set.mem_Ico, eq_comm, radBin, Nat.floor_eq_iff (by positivity)]
    constructor <;> intro ⟨h1, h2⟩ <;> refine ⟨?_, ?_⟩ <;> push_cast at * <;> linarith
  by_cases hb : b = radBin z
  · rw [ite_eq_left hb, Set.indicator_of_mem (hiff.2 hb)]
  · rw [ite_eq_right hb, Set.indicator_of_notMem (mt hiff.1 hb)]

private lemma ph_zpow_decomp {z₁ z₂ : ℂ} (hz₁ : z₁ ≠ 0) (hz₂ : z₂ ≠ 0) (k : ℕ) :
    ph z₂ * conj (ph z₁ * conj (ph z₂)) ^ 17 * (ph z₁ * conj (ph z₂)) ^ k =
      ph z₁ ^ ((k : ℤ) - 17) * ph z₂ ^ (1 - ((k : ℤ) - 17)) := by
  have hunit : ∀ {z : ℂ}, z ≠ 0 → ph z ≠ 0 ∧ conj (ph z) = (ph z)⁻¹ := fun {z} hz => by
    have hn : ‖ph z‖ = 1 := by
      rw [ph, norm_div, Complex.norm_real, Real.norm_of_nonneg (norm_nonneg z),
        div_self (norm_ne_zero_iff.2 hz)]
    have hne : ph z ≠ 0 := fun h0 => by simp [h0] at hn
    refine ⟨hne, eq_inv_of_mul_eq_one_left ?_⟩
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hn]; simp
  obtain ⟨hu₁, hc₁⟩ := hunit hz₁
  obtain ⟨hu₂, hc₂⟩ := hunit hz₂
  set u₁ := ph z₁
  set u₂ := ph z₂
  rw [map_mul, Complex.conj_conj, hc₁, mul_pow, mul_pow, inv_pow, hc₂, inv_pow,
    ← zpow_natCast u₁ 17, ← zpow_neg, ← zpow_natCast u₂ 17,
    ← zpow_natCast u₁ k, ← zpow_natCast u₂ k, ← zpow_neg]
  calc u₂ * (u₁ ^ (-(17 : ℤ)) * u₂ ^ (17 : ℤ)) * (u₁ ^ (k : ℤ) * u₂ ^ (-(k : ℤ)))
      = (u₁ ^ (-(17 : ℤ)) * u₁ ^ (k : ℤ)) * ((u₂ ^ (1 : ℤ) * u₂ ^ (17 : ℤ)) * u₂ ^ (-(k : ℤ))) := by
        rw [zpow_one]; ring
    _ = u₁ ^ ((k : ℤ) - 17) * u₂ ^ (1 - ((k : ℤ) - 17)) := by
        rw [← zpow_add₀ hu₁, ← zpow_add₀ hu₂, ← zpow_add₀ hu₂]
        congr 2; omega

private lemma cellFn_eq_sum_atoms (creArr cimArr : Array Int) (u : ℂ × ℂ) :
    cellFn creArr cimArr u = ∑ k ∈ range 36, ∑ b1 ∈ range 64, ∑ b2 ∈ range 64,
      cellCoeffC creArr cimArr k (64 * b1 + b2) *
        (atom1D b1 ((k : ℤ) - 17) u.1 * atom1D b2 (1 - ((k : ℤ) - 17)) u.2) := by
  unfold cellFn
  split_ifs with h
  · symm
    refine sum_eq_zero fun k _ => sum_eq_zero fun b1 hb1 => sum_eq_zero fun b2 hb2 => ?_
    rcases h with h1 | h2 | h3 | h4
    · simp [atom1D, radInd, h1]
    · simp [atom1D, radInd, h2]
    · rw [atom1D, radInd_eq_zero_of_ge_six (mem_range.1 hb1) h3]; simp
    · rw [atom1D, atom1D, radInd_eq_zero_of_ge_six (mem_range.1 hb2) h4]; simp
  · push Not at h
    obtain ⟨hz1, hz2, hlt1, hlt2⟩ := h
    have hb1_lt : radBin u.1 < 64 := by
      rw [radBin, Nat.floor_lt (by positivity)]; linarith
    have hb2_lt : radBin u.2 < 64 := by
      rw [radBin, Nat.floor_lt (by positivity)]; linarith
    dsimp only
    rw [mul_sum]
    refine sum_congr rfl fun k _ => ?_
    have hinner1 : ∑ b1 ∈ range 64, ∑ b2 ∈ range 64,
        cellCoeffC creArr cimArr k (64 * b1 + b2) *
          (atom1D b1 ((k : ℤ) - 17) u.1 * atom1D b2 (1 - ((k : ℤ) - 17)) u.2) =
        cellCoeffC creArr cimArr k (cellIdx u.1 u.2) *
          (ph u.1 ^ ((k : ℤ) - 17) * ph u.2 ^ (1 - ((k : ℤ) - 17))) := by
      rw [sum_eq_single (radBin u.1)]
      · rw [sum_eq_single (radBin u.2)]
        · simp [atom1D, radInd_of_lt_six hz1, radInd_of_lt_six hz2, cellIdx]
        · intro b2 _ hb2ne
          simp [atom1D, radInd_of_lt_six hz2, hb2ne]
        · intro hmem; exact (hmem (mem_range.2 hb2_lt)).elim
      · intro b1 _ hb1ne
        refine sum_eq_zero fun b2 _ => ?_
        simp [atom1D, radInd_of_lt_six hz1, hb1ne]
      · intro hmem; exact (hmem (mem_range.2 hb1_lt)).elim
    rw [hinner1]
    calc ph u.2 * conj (ph u.1 * conj (ph u.2)) ^ 17 *
          (cellCoeffC creArr cimArr k (cellIdx u.1 u.2) * (ph u.1 * conj (ph u.2)) ^ k)
        = cellCoeffC creArr cimArr k (cellIdx u.1 u.2) *
          (ph u.2 * conj (ph u.1 * conj (ph u.2)) ^ 17 * (ph u.1 * conj (ph u.2)) ^ k) := by ring
      _ = _ := by rw [ph_zpow_decomp hz1 hz2 k]

private lemma bound_ev_H_atom1D (p q b : ℕ) (hb : b < 64) (mTarget : ℤ) :
    ∃ M : ℝ, 0 ≤ M ∧ ∀ z : ℂ, ‖conj (ev z (H p q)) * atom1D b mTarget z‖ ≤ M := by
  obtain ⟨M0, hM0⟩ := isCompact_closedBall (0 : ℂ) 6 |>.exists_bound_of_continuousOn
    (Complex.continuous_conj.comp (continuous_ev (H p q))).continuousOn
  refine ⟨max M0 0, le_max_right _ _, fun z => ?_⟩
  by_cases hz : 6 ≤ ‖z‖
  · rw [atom1D, radInd_eq_zero_of_ge_six hb hz, zero_mul, mul_zero, norm_zero]
    exact le_max_right _ _
  · have hmem : z ∈ Metric.closedBall (0 : ℂ) 6 := by
      rw [Metric.mem_closedBall, dist_zero_right]; linarith
    rw [norm_mul]
    calc ‖conj (ev z (H p q))‖ * ‖atom1D b mTarget z‖
        ≤ max M0 0 * 1 := mul_le_mul ((hM0 z hmem).trans (le_max_left _ _))
          (norm_atom1D_le b mTarget z) (norm_nonneg _) (le_max_right _ _)
      _ = max M0 0 := mul_one _

private lemma integral_ev_H_atom1D (p q b : ℕ) (hb : b < 64) (mTarget : ℤ) :
    ∫ z, conj (ev z (H p q)) * atom1D b mTarget z ∂gaussC =
      if mTarget = (p : ℤ) - q then
        (((min p q).factorial : ℝ) * cellLagInt ((p : ℤ) - q).natAbs (min p q) b : ℂ)
      else 0 := by
  set F : ℂ → ℂ := fun z => conj (ev z (H p q)) * atom1D b mTarget z
  have hFm : Measurable F :=
    (Complex.continuous_conj.comp (continuous_ev (H p q))).measurable.mul
      (measurable_atom1D b mTarget)
  have hsupp : ∀ z : ℂ, 6 ≤ ‖z‖ → F z = 0 := fun z hz => by
    dsimp only [F]; rw [atom1D, radInd_eq_zero_of_ge_six hb hz, zero_mul, mul_zero]
  obtain ⟨M, _, hM⟩ := bound_ev_H_atom1D p q b hb mTarget
  rw [integral_gaussC_polar_finSupport F hFm hsupp hM]
  have hcongr : ∀ pt ∈ Set.Ioi (0 : ℝ) ×ˢ Set.Ioo (-Real.pi) Real.pi,
      ((pt.1 * (Real.pi⁻¹ * Real.exp (-pt.1 ^ 2)) : ℝ) : ℂ) * F (Complex.polarCoord.symm pt) =
      ((pt.1 * (Real.pi⁻¹ * Real.exp (-pt.1 ^ 2)) : ℝ) : ℂ) *
        ((Set.Ico (3 * (b : ℝ) / 32) (3 * ((b + 1 : ℕ) : ℝ) / 32)).indicator (fun _ => (1 : ℂ)) pt.1 *
          conj (ev (Complex.polarCoord.symm pt) (H p q)) *
          Complex.exp ((mTarget : ℂ) * (pt.2 * Complex.I))) := by
    intro pt hpt
    dsimp only [F, atom1D, radInd]
    have hnorm := norm_polarCoord_symm_of_mem hpt
    have hne : Complex.polarCoord.symm pt ≠ 0 := fun h0 => by
      rw [h0, norm_zero] at hnorm; exact hpt.1.ne hnorm
    rw [ite_eq_right hne, hnorm, (polarCoord_symm_eq_exp hpt).2, ← Complex.exp_int_mul]
    ring
  rw [setIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo) hcongr]
  exact one_coord_cell_integral p q b mTarget

/-- Exact Hermite inner product of `cellFn creArr cimArr` with any basis element `H2 i` of charge `1`. -/
theorem integral_H2_cellFn_charge_one (creArr cimArr : Array Int) {i : Idx2}
    (hch : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1) :
    ∫ u, conj (H2 i u) * cellFn creArr cimArr u ∂mu2 =
      let mSigned : ℤ := (i.1.1 : ℤ) - i.1.2
      if -17 ≤ mSigned ∧ mSigned ≤ 18 then
        (((min i.1.1 i.1.2).factorial * (min i.2.1 i.2.2).factorial : ℕ) : ℂ) *
          modeOverlap creArr cimArr (mSigned + 17).toNat (min i.1.1 i.1.2) (min i.2.1 i.2.2)
      else 0 := by
  have hfun : ∀ u : ℂ × ℂ, conj (H2 i u) * cellFn creArr cimArr u =
      ∑ k ∈ range 36, ∑ b1 ∈ range 64, ∑ b2 ∈ range 64,
        cellCoeffC creArr cimArr k (64 * b1 + b2) *
          ((conj (ev u.1 (H i.1.1 i.1.2)) * atom1D b1 ((k : ℤ) - 17) u.1) *
            (conj (ev u.2 (H i.2.1 i.2.2)) * atom1D b2 (1 - ((k : ℤ) - 17)) u.2)) := fun u => by
    rw [cellFn_eq_sum_atoms creArr cimArr u, H2, map_mul, mul_sum]
    refine sum_congr rfl fun k _ => ?_
    rw [mul_sum]
    refine sum_congr rfl fun b1 _ => ?_
    rw [mul_sum]
    refine sum_congr rfl fun b2 _ => by ring
  simp_rw [hfun]
  have hint_term : ∀ k : ℕ, ∀ b1 ∈ range 64, ∀ b2 ∈ range 64,
      Integrable (fun u : ℂ × ℂ => cellCoeffC creArr cimArr k (64 * b1 + b2) *
        ((conj (ev u.1 (H i.1.1 i.1.2)) * atom1D b1 ((k : ℤ) - 17) u.1) *
          (conj (ev u.2 (H i.2.1 i.2.2)) * atom1D b2 (1 - ((k : ℤ) - 17)) u.2))) mu2 := by
    intro k b1 hb1 b2 hb2
    obtain ⟨M1, hM10, hM1⟩ := bound_ev_H_atom1D i.1.1 i.1.2 b1 (mem_range.1 hb1) ((k : ℤ) - 17)
    obtain ⟨M2, _, hM2⟩ := bound_ev_H_atom1D i.2.1 i.2.2 b2 (mem_range.1 hb2) (1 - ((k : ℤ) - 17))
    have hm1 : Measurable fun u : ℂ × ℂ =>
        conj (ev u.1 (H i.1.1 i.1.2)) * atom1D b1 ((k : ℤ) - 17) u.1 :=
      ((Complex.continuous_conj.comp (continuous_ev _)).measurable.mul
        (measurable_atom1D _ _)).comp measurable_fst
    have hm2 : Measurable fun u : ℂ × ℂ =>
        conj (ev u.2 (H i.2.1 i.2.2)) * atom1D b2 (1 - ((k : ℤ) - 17)) u.2 :=
      ((Complex.continuous_conj.comp (continuous_ev _)).measurable.mul
        (measurable_atom1D _ _)).comp measurable_snd
    refine Integrable.const_mul ?_ _
    refine (integrable_const (M1 * M2)).mono' (hm1.mul hm2).aestronglyMeasurable
      (Filter.Eventually.of_forall fun u => ?_)
    rw [norm_mul]
    exact mul_le_mul (hM1 u.1) (hM2 u.2) (norm_nonneg _) hM10
  rw [integral_finsetSum _ fun k _ => integrable_finsetSum _ fun b1 hb1 =>
    integrable_finsetSum _ fun b2 hb2 => hint_term k b1 hb1 b2 hb2]
  have hk_eval : ∀ k ∈ range 36,
      (∫ u, ∑ b1 ∈ range 64, ∑ b2 ∈ range 64,
        cellCoeffC creArr cimArr k (64 * b1 + b2) *
          ((conj (ev u.1 (H i.1.1 i.1.2)) * atom1D b1 ((k : ℤ) - 17) u.1) *
            (conj (ev u.2 (H i.2.1 i.2.2)) * atom1D b2 (1 - ((k : ℤ) - 17)) u.2)) ∂mu2) =
      if (k : ℤ) - 17 = (i.1.1 : ℤ) - i.1.2 then
        (((min i.1.1 i.1.2).factorial * (min i.2.1 i.2.2).factorial : ℕ) : ℂ) *
          modeOverlap creArr cimArr k (min i.1.1 i.1.2) (min i.2.1 i.2.2)
      else 0 := by
    intro k _
    rw [integral_finsetSum _ fun b1 hb1 => integrable_finsetSum _ fun b2 hb2 =>
      hint_term k b1 hb1 b2 hb2]
    have hb_eval : ∀ b1 ∈ range 64,
        (∫ u, ∑ b2 ∈ range 64,
          cellCoeffC creArr cimArr k (64 * b1 + b2) *
            ((conj (ev u.1 (H i.1.1 i.1.2)) * atom1D b1 ((k : ℤ) - 17) u.1) *
              (conj (ev u.2 (H i.2.1 i.2.2)) * atom1D b2 (1 - ((k : ℤ) - 17)) u.2)) ∂mu2) =
        ∑ b2 ∈ range 64, cellCoeffC creArr cimArr k (64 * b1 + b2) *
          ((∫ z₁, conj (ev z₁ (H i.1.1 i.1.2)) * atom1D b1 ((k : ℤ) - 17) z₁ ∂gaussC) *
            (∫ z₂, conj (ev z₂ (H i.2.1 i.2.2)) * atom1D b2 (1 - ((k : ℤ) - 17)) z₂ ∂gaussC)) := by
      intro b1 hb1
      rw [integral_finsetSum _ fun b2 hb2 => hint_term k b1 hb1 b2 hb2]
      refine sum_congr rfl fun b2 _ => ?_
      rw [integral_const_mul, show mu2 = gaussC.prod gaussC from rfl,
        integral_prod_mul
          (fun z₁ => conj (ev z₁ (H i.1.1 i.1.2)) * atom1D b1 ((k : ℤ) - 17) z₁)
          (fun z₂ => conj (ev z₂ (H i.2.1 i.2.2)) * atom1D b2 (1 - ((k : ℤ) - 17)) z₂)]
    rw [sum_congr rfl hb_eval]
    by_cases hk : (k : ℤ) - 17 = (i.1.1 : ℤ) - i.1.2
    · have hk2 : 1 - ((k : ℤ) - 17) = (i.2.1 : ℤ) - i.2.2 := by omega
      rw [ite_eq_left hk]
      unfold modeOverlap
      dsimp only
      rw [mul_sum]
      refine sum_congr rfl fun b1 hb1 => ?_
      rw [mul_sum]
      refine sum_congr rfl fun b2 hb2 => ?_
      rw [integral_ev_H_atom1D _ _ b1 (mem_range.1 hb1), ite_eq_left hk,
        integral_ev_H_atom1D _ _ b2 (mem_range.1 hb2), ite_eq_left hk2,
        show ((i.1.1 : ℤ) - i.1.2).natAbs = ((k : ℤ) - 17).natAbs by rw [hk],
        show ((i.2.1 : ℤ) - i.2.2).natAbs = (1 - ((k : ℤ) - 17)).natAbs by rw [hk2]]
      push_cast; ring
    · rw [ite_eq_right hk]
      refine sum_eq_zero fun b1 hb1 => sum_eq_zero fun b2 _ => ?_
      rw [integral_ev_H_atom1D _ _ b1 (mem_range.1 hb1), ite_eq_right hk, zero_mul, mul_zero]
  rw [sum_congr rfl hk_eval]
  set mSigned : ℤ := (i.1.1 : ℤ) - i.1.2
  split_ifs with hrange
  · set k0 := (mSigned + 17).toNat
    have hk0_lt : k0 < 36 := by omega
    rw [sum_eq_single k0]
    · rw [ite_eq_left (by omega)]
    · intro k _ hkne
      rw [ite_eq_right (by omega)]
    · intro hmem; exact (hmem (mem_range.2 hk0_lt)).elim
  · refine sum_eq_zero fun k hk => ?_
    have := mem_range.1 hk
    rw [ite_eq_right (by omega)]

/-! ### 4. Antisymmetric `(-R, R)` reduction `tig_bivarKernel_eq` -/

lemma factorial_mul_risingFact (n : ℕ) : ∀ a : ℕ,
    n.factorial * risingFact n a = (n + a).factorial
  | 0 => by simp [risingFact]
  | a + 1 => by
    rw [risingFact, ← mul_assoc, factorial_mul_risingFact n a,
      show n + (a + 1) = (n + a) + 1 by omega, Nat.factorial_succ]
    ring

lemma risingFact_pos (n : ℕ) : ∀ a : ℕ, 0 < risingFact n a
  | 0 => by simp [risingFact]
  | a + 1 => by rw [risingFact]; exact mul_pos (risingFact_pos n a) (by positivity)

private def mkIdx (idxM n1 n2 : ℕ) : Idx2 :=
  let mSigned : ℤ := (idxM : ℤ) - 17
  let a := mSigned.natAbs
  let b := (1 - mSigned).natAbs
  (if 0 ≤ mSigned then (n1 + a, n1) else (n1, n1 + a),
   if mSigned ≤ 1 then (n2 + b, n2) else (n2, n2 + b))

private lemma mkIdx_props (idxM n1 n2 : ℕ) :
    let i := mkIdx idxM n1 n2
    let mSigned : ℤ := (idxM : ℤ) - 17
    i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1 ∧
      (i.1.1 : ℤ) - i.1.2 = mSigned ∧
      min i.1.1 i.1.2 = n1 ∧
      min i.2.1 i.2.2 = n2 ∧
      bideg i = (2 * n1 + mSigned.natAbs, 2 * n2 + (1 - mSigned).natAbs) := by
  dsimp only [mkIdx, bideg]
  split_ifs <;> refine ⟨by omega, by omega, by omega, by omega, ?_⟩ <;> ext <;> simp <;> omega

private lemma fac2_mkIdx (idxM n1 n2 : ℕ) :
    fac2 (mkIdx idxM n1 n2) =
      (n1.factorial * n2.factorial) ^ 2 *
        (risingFact n1 ((idxM : ℤ) - 17).natAbs * risingFact n2 (1 - ((idxM : ℤ) - 17)).natAbs) := by
  unfold fac2 mkIdx
  dsimp only
  split_ifs <;> simp only [← factorial_mul_risingFact] <;> ring

private lemma norm_inner_mkIdx_sq {creArr cimArr qreArr qimArr : Array Int}
    (hsos : sosAllOK creArr cimArr qreArr qimArr = true) {idxM : ℕ} (hM : idxM < 36) (n1 n2 : ℕ) :
    ‖⟪hvec2 (mkIdx idxM n1 n2), (memLp_cellFn hsos).toLp (cellFn creArr cimArr)⟫_ℂ‖ ^ 2 =
      ‖modeOverlap creArr cimArr idxM n1 n2‖ ^ 2 /
        ((risingFact n1 ((idxM : ℤ) - 17).natAbs *
          risingFact n2 (1 - ((idxM : ℤ) - 17)).natAbs : ℕ) : ℝ) := by
  set i := mkIdx idxM n1 n2
  obtain ⟨hch, hm, hmin1, hmin2, _⟩ := mkIdx_props idxM n1 n2
  rw [inner_hvec2_left]
  have hint : ∫ u, conj (H2 i u) * ((memLp_cellFn hsos).toLp (cellFn creArr cimArr)) u ∂mu2 =
      ∫ u, conj (H2 i u) * cellFn creArr cimArr u ∂mu2 := by
    refine integral_congr_ae ?_
    filter_upwards [(memLp_cellFn hsos).coeFn_toLp] with u hu; rw [hu]
  rw [hint, integral_H2_cellFn_charge_one creArr cimArr hch]
  dsimp only
  rw [hm, ite_eq_left (by omega), show (((idxM : ℤ) - 17 + 17).toNat) = idxM by omega, hmin1, hmin2]
  rw [norm_mul, norm_mul, Complex.norm_real, Real.norm_of_nonneg (nrm2_pos i).le,
    Complex.norm_natCast, mul_pow, mul_pow]
  have hnrm : nrm2 i ^ 2 = ((fac2 i : ℕ) : ℝ)⁻¹ := by
    rw [nrm2, inv_pow, Real.sq_sqrt (fac2_pos i).le]
  rw [hnrm, fac2_mkIdx]
  have hfac_ne : (((n1.factorial * n2.factorial) ^ 2 : ℕ) : ℝ) ≠ 0 := by
    have := Nat.factorial_pos n1; have := Nat.factorial_pos n2; positivity
  push_cast at hfac_ne ⊢
  have hrf_ne : ((risingFact n1 ((idxM : ℤ) - 17).natAbs *
      risingFact n2 (1 - ((idxM : ℤ) - 17)).natAbs : ℕ) : ℝ) ≠ 0 := by
    have := risingFact_pos n1 ((idxM : ℤ) - 17).natAbs
    have := risingFact_pos n2 (1 - ((idxM : ℤ) - 17)).natAbs
    positivity
  push_cast at hrf_ne
  field_simp

def bidegFinset (p : ℕ × ℕ) : Finset Idx2 :=
  ((range (p.1 + 1) ×ˢ range (p.1 + 1)) ×ˢ (range (p.2 + 1) ×ˢ range (p.2 + 1))).filter
    fun i => bideg i = p

lemma mem_bidegFinset {p : ℕ × ℕ} {i : Idx2} : i ∈ bidegFinset p ↔ bideg i = p := by
  simp only [bidegFinset, mem_filter, mem_product, mem_range, bideg, Prod.ext_iff]
  omega

lemma energy_eq_sum_bidegFinset (G : Lp ℂ 2 mu2) (p : ℕ × ℕ) :
    energy G p = ∑ i ∈ bidegFinset p, ‖⟪hvec2 i, G⟫_ℂ‖ ^ 2 := by
  unfold energy
  rw [tsum_subtype (bideg ⁻¹' {p}) (fun i => ‖⟪hvec2 i, G⟫_ℂ‖ ^ 2),
    tsum_eq_sum (s := bidegFinset p)]
  · refine sum_congr rfl fun i hi => ?_
    rw [Set.indicator_of_mem]
    simpa using mem_bidegFinset.1 hi
  · intro i hi
    rw [Set.indicator_of_notMem]
    simpa [mem_bidegFinset] using hi

private lemma neg_one_pow_mode (n1 : ℕ) (mSigned : ℤ) :
    (-1 : ℝ) ^ (2 * n1 + mSigned.natAbs) = if mSigned % 2 = 0 then 1 else -1 := by
  rw [pow_add, pow_mul, neg_one_sq, one_pow, one_mul]
  split_ifs with h
  · rw [show mSigned.natAbs = 2 * (mSigned.natAbs / 2) by omega, pow_mul, neg_one_sq, one_pow]
  · rw [show mSigned.natAbs = 2 * (mSigned.natAbs / 2) + 1 by omega,
      pow_add, pow_mul, neg_one_sq, one_pow, one_mul, pow_one]

/-- Exact radial polynomial formula for `cellFn` on any antisymmetric channel `(-R, R)`:
equals `bivarKernel R 0 (onedTable (muTigOf creArr cimArr)) j`. -/
theorem tig_bivarKernel_eq {creArr cimArr qreArr qimArr : Array Int}
    (hsos : sosAllOK creArr cimArr qreArr qimArr = true) (R : ℝ[X]) (j : ℕ) :
    bivarKernel (-R) R (energy ((memLp_cellFn hsos).toLp (cellFn creArr cimArr))) j =
      bivarKernel R 0 (onedTable (muTigOf creArr cimArr)) j := by
  rw [bivarKernel_oned_eq_head R 0 (muTigOf creArr cimArr) (Nat.lt_succ_self j)]
  set G := (memLp_cellFn hsos).toLp (cellFn creArr cimArr)
  have hpar := energy_eq_zero_of_even (memLp_cellFn hsos) (fun _ u hc => cellFn_rot2 creArr cimArr hc u)
  set S : Finset (ℕ × ℕ) :=
    (range (2 * j + 2) ×ˢ range (2 * j + 2)).filter fun p =>
      (p.1 + p.2) % 2 = 1 ∧ p.1 + p.2 ≤ 2 * j + 1
  unfold bivarKernel
  rw [tsum_eq_sum (s := S)]
  · simp_rw [energy_eq_sum_bidegFinset G, sum_mul]
    have hdisj : (S : Set (ℕ × ℕ)).PairwiseDisjoint bidegFinset := fun p _ q _ hpq =>
      Finset.disjoint_left.2 fun i hip hiq =>
        hpq ((mem_bidegFinset.1 hip).symm.trans (mem_bidegFinset.1 hiq))
    have hbiU : ∑ p ∈ S, ∑ i ∈ bidegFinset p, ‖⟪hvec2 i, G⟫_ℂ‖ ^ 2 * (termOf (-R) R p).coeff j =
        ∑ i ∈ S.biUnion bidegFinset, ‖⟪hvec2 i, G⟫_ℂ‖ ^ 2 * (termOf (-R) R (bideg i)).coeff j := by
      rw [sum_biUnion hdisj]
      refine sum_congr rfl fun p _ => sum_congr rfl fun i hi => ?_
      rw [mem_bidegFinset.1 hi]
    rw [hbiU]
    set k0Of : ℕ → ℕ := fun idxM =>
      (((idxM : ℤ) - 17).natAbs + (1 - ((idxM : ℤ) - 17)).natAbs - 1) / 2
    set T : Finset (ℕ × ℕ × ℕ) :=
      (range 36 ×ˢ (range (j + 1) ×ˢ range (j + 1))).filter fun t =>
        k0Of t.1 ≤ t.2.1 ∧ t.2.2 ≤ t.2.1 - k0Of t.1
    set ψ : ℕ × ℕ × ℕ → Idx2 := fun t => mkIdx t.1 t.2.2 (t.2.1 - k0Of t.1 - t.2.2)
    have hψ_mem : ∀ t ∈ T, ψ t ∈ S.biUnion bidegFinset := by
      intro t ht
      simp only [T, mem_filter, mem_product, mem_range] at ht
      obtain ⟨⟨_, _, _⟩, hk0, hn1⟩ := ht
      rw [mem_biUnion]
      refine ⟨bideg (ψ t), ?_, mem_bidegFinset.2 rfl⟩
      have hp := (mkIdx_props t.1 t.2.2 (t.2.1 - k0Of t.1 - t.2.2)).2.2.2.2
      simp only [ψ] at hp ⊢
      rw [hp]
      simp only [S, mem_filter, mem_product, mem_range, k0Of] at hk0 hn1 ⊢
      omega
    have hψ_inj : ∀ t₁ ∈ T, ∀ t₂ ∈ T, ψ t₁ = ψ t₂ → t₁ = t₂ := by
      intro t₁ ht₁ t₂ ht₂ heq
      simp only [T, mem_filter, mem_product, mem_range] at ht₁ ht₂
      have p1 := mkIdx_props t₁.1 t₁.2.2 (t₁.2.1 - k0Of t₁.1 - t₁.2.2)
      have p2 := mkIdx_props t₂.1 t₂.2.2 (t₂.2.1 - k0Of t₂.1 - t₂.2.2)
      dsimp only [ψ] at heq
      rw [heq] at p1
      have hm_eq : (t₁.1 : ℤ) - 17 = (t₂.1 : ℤ) - 17 := p1.2.1.symm.trans p2.2.1
      have hidx : t₁.1 = t₂.1 := by omega
      have hn1_eq : t₁.2.2 = t₂.2.2 := p1.2.2.1.symm.trans p2.2.2.1
      have hn2_eq : t₁.2.1 - k0Of t₁.1 - t₁.2.2 = t₂.2.1 - k0Of t₂.1 - t₂.2.2 :=
        p1.2.2.2.1.symm.trans p2.2.2.2.1
      rw [hidx, hn1_eq] at hn2_eq ht₁
      have hk_eq : t₁.2.1 = t₂.2.1 := by omega
      exact Prod.ext hidx (Prod.ext hk_eq hn1_eq)
    have hzero_out : ∀ i ∈ S.biUnion bidegFinset, i ∉ T.image ψ →
        ‖⟪hvec2 i, G⟫_ℂ‖ ^ 2 * (termOf (-R) R (bideg i)).coeff j = 0 := by
      intro i hi hnot
      rw [mem_biUnion] at hi
      obtain ⟨p, hpS, hip⟩ := hi
      simp only [S, mem_filter, mem_product, mem_range] at hpS
      have hbi := mem_bidegFinset.1 hip
      by_cases hch : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1
      · set mSigned : ℤ := (i.1.1 : ℤ) - i.1.2
        by_cases hrange : -17 ≤ mSigned ∧ mSigned ≤ 18
        · exfalso
          apply hnot
          set idxM := (mSigned + 17).toNat
          set k := (p.1 + p.2 - 1) / 2
          set n1 := min i.1.1 i.1.2
          rw [Finset.mem_image]
          refine ⟨(idxM, k, n1), ?_, ?_⟩
          · simp only [T, mem_filter, mem_product, mem_range, k0Of, idxM, k, n1, mSigned]
            simp only [bideg, Prod.ext_iff] at hbi
            omega
          · simp only [ψ, mkIdx, k0Of, idxM, k, n1, mSigned]
            simp only [bideg, Prod.ext_iff] at hbi
            split_ifs <;> ext <;> simp <;> omega
        · rw [inner_hvec2_left]
          have hint : ∫ u, conj (H2 i u) * G u ∂mu2 =
              ∫ u, conj (H2 i u) * cellFn creArr cimArr u ∂mu2 := by
            refine integral_congr_ae ?_
            filter_upwards [(memLp_cellFn hsos).coeFn_toLp] with u hu; rw [hu]
          rw [hint, integral_H2_cellFn_charge_one creArr cimArr hch]
          dsimp only
          rw [ite_eq_right hrange]; simp
      · rw [inner_hvec2_left]
        have hint : ∫ u, conj (H2 i u) * G u ∂mu2 =
            ∫ u, conj (H2 i u) * cellFn creArr cimArr u ∂mu2 := by
          refine integral_congr_ae ?_
          filter_upwards [(memLp_cellFn hsos).coeFn_toLp] with u hu; rw [hu]
        rw [hint, integral_H2_charge_one (memLp_cellFn hsos)
          (fun _ u hc => cellFn_rot2 creArr cimArr hc u) hch]
        simp
    rw [← sum_subset (image_subset_iff.2 hψ_mem) hzero_out, sum_image hψ_inj]
    have hterm_val : ∀ t ∈ T,
        ‖⟪hvec2 (ψ t), G⟫_ℂ‖ ^ 2 * (termOf (-R) R (bideg (ψ t))).coeff j =
        (if ((t.1 : ℤ) - 17) % 2 = 0 then (1 : ℝ) else -1) *
          (‖modeOverlap creArr cimArr t.1 t.2.2 (t.2.1 - k0Of t.1 - t.2.2)‖ ^ 2 /
            ((risingFact t.2.2 ((t.1 : ℤ) - 17).natAbs *
              risingFact (t.2.1 - k0Of t.1 - t.2.2) (1 - ((t.1 : ℤ) - 17)).natAbs : ℕ) : ℝ)) *
          (X ^ t.2.1 * R ^ (2 * t.2.1 + 1)).coeff j := by
      intro t ht
      simp only [T, mem_filter, mem_product, mem_range] at ht
      obtain ⟨⟨hM, _, _⟩, hk0, hn1⟩ := ht
      dsimp only [ψ]
      rw [norm_inner_mkIdx_sq hsos hM, (mkIdx_props t.1 t.2.2 (t.2.1 - k0Of t.1 - t.2.2)).2.2.2.2]
      set mSigned : ℤ := (t.1 : ℤ) - 17
      set d1 := 2 * t.2.2 + mSigned.natAbs
      set d2 := 2 * (t.2.1 - k0Of t.1 - t.2.2) + (1 - mSigned).natAbs
      have hsum_d : d1 + d2 = 2 * t.2.1 + 1 := by dsimp only [d1, d2, k0Of, mSigned] at *; omega
      have hsh_d : shiftOf (d1, d2) = t.2.1 := by unfold shiftOf; dsimp only [d1, d2, k0Of, mSigned] at *; omega
      have hpoly : termOf (-R) R (d1, d2) =
          C ((-1 : ℝ) ^ d1) * (X ^ t.2.1 * R ^ (2 * t.2.1 + 1)) := by
        rw [termOf, hsh_d, show (-R : ℝ[X]) = C (-1 : ℝ) * R by simp, mul_pow, ← C_pow]
        calc X ^ t.2.1 * (C ((-1 : ℝ) ^ d1) * R ^ d1 * R ^ d2)
            = C ((-1 : ℝ) ^ d1) * (X ^ t.2.1 * (R ^ d1 * R ^ d2)) := by ring
          _ = C ((-1 : ℝ) ^ d1) * (X ^ t.2.1 * R ^ (2 * t.2.1 + 1)) := by rw [← pow_add, hsum_d]
      rw [hpoly, coeff_C_mul, neg_one_pow_mode t.2.2 mSigned]
      ring
    rw [sum_congr rfl hterm_val]
    symm
    calc ∑ k ∈ range (j + 1), muTigOf creArr cimArr k * (X ^ k * R ^ (2 * k + 1)).coeff j
        = ∑ idxM ∈ range 36, ∑ k ∈ range (j + 1),
            (if k < k0Of idxM then 0
             else ∑ n1 ∈ range (k - k0Of idxM + 1),
               (if ((idxM : ℤ) - 17) % 2 = 0 then (1 : ℝ) else -1) *
                 (‖modeOverlap creArr cimArr idxM n1 (k - k0Of idxM - n1)‖ ^ 2 /
                   ((risingFact n1 ((idxM : ℤ) - 17).natAbs *
                     risingFact (k - k0Of idxM - n1) (1 - ((idxM : ℤ) - 17)).natAbs : ℕ) : ℝ)) *
                 (X ^ k * R ^ (2 * k + 1)).coeff j) := by
          conv_lhs =>
            arg 2; ext k
            rw [muTigOf, sum_mul]
          rw [sum_comm]
          refine sum_congr rfl fun idxM _ => sum_congr rfl fun k _ => ?_
          dsimp only [k0Of]
          by_cases hlt : k < (((idxM : ℤ) - 17).natAbs + (1 - ((idxM : ℤ) - 17)).natAbs - 1) / 2
          · rw [ite_eq_left hlt, zero_mul, ite_eq_left hlt]
          · rw [ite_eq_right hlt, sum_mul, ite_eq_right hlt]
      _ = ∑ idxM ∈ range 36, ∑ k ∈ range (j + 1), ∑ n1 ∈ range (j + 1),
            if k0Of idxM ≤ k ∧ n1 ≤ k - k0Of idxM then
              (if ((idxM : ℤ) - 17) % 2 = 0 then (1 : ℝ) else -1) *
                (‖modeOverlap creArr cimArr idxM n1 (k - k0Of idxM - n1)‖ ^ 2 /
                  ((risingFact n1 ((idxM : ℤ) - 17).natAbs *
                    risingFact (k - k0Of idxM - n1) (1 - ((idxM : ℤ) - 17)).natAbs : ℕ) : ℝ)) *
                (X ^ k * R ^ (2 * k + 1)).coeff j
            else 0 := by
          refine sum_congr rfl fun idxM _ => sum_congr rfl fun k hk => ?_
          have hkj := mem_range.1 hk
          by_cases hlt : k < k0Of idxM
          · rw [ite_eq_left hlt]
            symm
            exact sum_eq_zero fun n1 _ => ite_eq_right (by omega)
          · rw [ite_eq_right hlt]
            rw [← sum_filter, show (range (j + 1)).filter (fun n1 => k0Of idxM ≤ k ∧ n1 ≤ k - k0Of idxM) =
              range (k - k0Of idxM + 1) by ext n1; simp only [mem_filter, mem_range]; omega]
      _ = _ := by
          rw [sum_filter]
          simp_rw [sum_product]
  · intro p hp
    rcases Nat.even_or_odd (p.1 + p.2) with ⟨k, hk⟩ | ⟨k, hk⟩
    · rw [hpar p (by omega), zero_mul]
    · have hgt : 2 * j + 1 < p.1 + p.2 := by
        by_contra hle
        apply hp
        simp only [S, mem_filter, mem_product, mem_range]
        omega
      have hsh : j < shiftOf p := by unfold shiftOf; omega
      rw [termOf, coeff_X_pow_mul']
      split_ifs with h
      · omega
      · rw [mul_zero]

/-! ### 5. Square-root-free smoothed energy formula `smoothed_energy_eq` -/

/-- Scaled overlap `modeOverlap / (choose(n1+n2, n1) * risingFact(n1+n2, k0))` (`0` outside `[-17, 18]`). -/
def gScaled (creArr cimArr : Array Int) (k j1 j2 : ℕ) : ℂ :=
  let mSigned : ℤ := (j1 : ℤ) - j2
  if -17 ≤ mSigned ∧ mSigned ≤ 18 then
    let idxM := (mSigned + 17).toNat
    let n1 := min j1 j2
    let n2 := min (k + 1 - j1) (k - j2)
    let k0 := (mSigned.natAbs + (1 - mSigned).natAbs - 1) / 2
    modeOverlap creArr cimArr idxM n1 n2 /
      (((n1 + n2).choose n1 * risingFact (n1 + n2) k0 : ℕ) : ℂ)
  else 0

private lemma integral_H2_cellFn_eq_gScaled (creArr cimArr : Array Int) (k j1 j2 : ℕ)
    (hj1 : j1 ≤ k + 1) (hj2 : j2 ≤ k) :
    ∫ w, conj (H2 ((j1, j2), (k + 1 - j1, k - j2)) w) * cellFn creArr cimArr w ∂mu2 =
      ((k.factorial : ℕ) : ℂ) * gScaled creArr cimArr k j1 j2 := by
  have hch : j1 + (k + 1 - j1) = j2 + (k - j2) + 1 := by omega
  rw [integral_H2_cellFn_charge_one creArr cimArr (i := ((j1, j2), (k + 1 - j1, k - j2))) hch]
  dsimp only
  unfold gScaled
  dsimp only
  set mSigned : ℤ := (j1 : ℤ) - j2
  split_ifs with hrange
  · set n1 := min j1 j2
    set n2 := min (k + 1 - j1) (k - j2)
    set k0 := (mSigned.natAbs + (1 - mSigned).natAbs - 1) / 2
    have hsum_k : n1 + n2 + k0 = k := by
      dsimp only [n1, n2, k0, mSigned]
      omega
    have hfac_eq : n1.factorial * n2.factorial *
        ((n1 + n2).choose n1 * risingFact (n1 + n2) k0) = k.factorial := by
      have hch_fac := Nat.choose_mul_factorial_mul_factorial (Nat.le_add_right n1 n2)
      rw [Nat.add_sub_cancel_left] at hch_fac
      calc n1.factorial * n2.factorial * ((n1 + n2).choose n1 * risingFact (n1 + n2) k0)
          = ((n1 + n2).choose n1 * n1.factorial * n2.factorial) * risingFact (n1 + n2) k0 := by ring
        _ = (n1 + n2).factorial * risingFact (n1 + n2) k0 := by rw [hch_fac]
        _ = (n1 + n2 + k0).factorial := factorial_mul_risingFact (n1 + n2) k0
        _ = k.factorial := by rw [hsum_k]
    have hden_pos : 0 < (n1 + n2).choose n1 * risingFact (n1 + n2) k0 :=
      mul_pos (Nat.choose_pos (Nat.le_add_right n1 n2)) (risingFact_pos (n1 + n2) k0)
    have hden_ne : (((n1 + n2).choose n1 * risingFact (n1 + n2) k0 : ℕ) : ℂ) ≠ 0 := by
      exact_mod_cast hden_pos.ne'
    have hfacC : ((k.factorial : ℕ) : ℂ) =
        ((n1.factorial * n2.factorial : ℕ) : ℂ) *
          (((n1 + n2).choose n1 * risingFact (n1 + n2) k0 : ℕ) : ℂ) := by
      exact_mod_cast hfac_eq.symm
    rw [hfacC]
    field_simp
  · simp

theorem smoothed_energy_eq {ct st se ce : ℝ} (hd : ct ^ 2 + st ^ 2 = 1)
    (he : se ^ 2 + ce ^ 2 = 1) {creArr cimArr qreArr qimArr : Array Int}
    (hsos : sosAllOK creArr cimArr qreArr qimArr = true)
    {d1 d2 : ℕ} (hodd : (d1 + d2) % 2 = 1) :
    let G := (memLp_smoothMap ct st se ce (measurable_cellFn creArr cimArr)
      (norm_cellFn_le hsos)).toLp (smoothMap ct st se ce (cellFn creArr cimArr))
    let k := (d1 + d2 - 1) / 2
    energy G (d1, d2) =
      ∑ p2 ∈ range (d2 + 1),
        if p2 ≤ k + 1 ∧ d2 - p2 ≤ k then
          let q2 := d2 - p2
          let p1 := k + 1 - p2
          let q1 := k - q2
          (((k + 1).choose p1 * k.choose q1 : ℕ) : ℝ) *
            ‖∑ j1 ∈ range (k + 2),
              ((bCoeff ct (-(se * st)) st (se * ct) p1 p2 j1 : ℝ) : ℂ) *
                ∑ j2 ∈ range (k + 1),
                  gScaled creArr cimArr k j1 j2 *
                    ((bCoeff ct (-(se * st)) st (se * ct) q1 q2 j2 : ℝ) : ℂ)‖ ^ 2 /
            (k + 1 : ℝ)
        else 0 := by
  dsimp only
  set F := cellFn creArr cimArr
  set hLP := memLp_smoothMap ct st se ce (measurable_cellFn creArr cimArr) (norm_cellFn_le hsos)
  set G := hLP.toLp (smoothMap ct st se ce F)
  set k := (d1 + d2 - 1) / 2
  have hsum_d : d1 + d2 = 2 * k + 1 := by omega
  rw [energy_eq_sum_bidegFinset G (d1, d2)]
  set P2Set : Finset ℕ := (range (d2 + 1)).filter fun p2 => p2 ≤ k + 1 ∧ d2 - p2 ≤ k
  set ι : ℕ → Idx2 := fun p2 => ((k + 1 - p2, k - (d2 - p2)), (p2, d2 - p2))
  have hι_mem : ∀ p2 ∈ P2Set, ι p2 ∈ bidegFinset (d1, d2) := by
    intro p2 hp2
    simp only [P2Set, mem_filter, mem_range] at hp2
    rw [mem_bidegFinset]
    simp only [ι, bideg, Prod.ext_iff]
    omega
  have hι_inj : ∀ a ∈ P2Set, ∀ b ∈ P2Set, ι a = ι b → a = b := by
    intro a _ b _ hab
    simp only [ι, Prod.mk.injEq] at hab
    exact hab.2.1
  have hzero_out : ∀ i ∈ bidegFinset (d1, d2), i ∉ P2Set.image ι → ‖⟪hvec2 i, G⟫_ℂ‖ ^ 2 = 0 := by
    intro i hi hnot
    have hbi := mem_bidegFinset.1 hi
    by_cases hch : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1
    · exfalso
      apply hnot
      rw [Finset.mem_image]
      refine ⟨i.2.1, ?_, ?_⟩
      · simp only [P2Set, mem_filter, mem_range]
        simp only [bideg, Prod.ext_iff] at hbi
        omega
      · simp only [ι]
        simp only [bideg, Prod.ext_iff] at hbi
        ext <;> simp <;> omega
    · rw [inner_hvec2_left]
      have hint : ∫ u, conj (H2 i u) * G u ∂mu2 =
          ∫ u, conj (H2 i u) * smoothMap ct st se ce F u ∂mu2 := by
        refine integral_congr_ae ?_
        filter_upwards [hLP.coeFn_toLp] with u hu; rw [hu]
      rw [hint, integral_H2_charge_one hLP
        (fun c x hc => smoothMap_rot2 ct st se ce
          (fun c' v hc' => cellFn_rot2 creArr cimArr hc' v) hc x) hch]
      simp
  rw [← sum_subset (image_subset_iff.2 hι_mem) hzero_out, sum_image hι_inj, ← sum_filter]
  refine sum_congr rfl fun p2 hp2 => ?_
  simp only [mem_filter, mem_range] at hp2
  obtain ⟨_, hp2_le, hq2_le⟩ := hp2
  set q2 := d2 - p2
  set p1 := k + 1 - p2
  set q1 := k - q2
  have hp_sum : p1 + p2 = k + 1 := by omega
  have hq_sum : q1 + q2 = k := by omega
  dsimp only [ι]
  change ‖⟪hvec2 ((p1, q1), (p2, q2)), G⟫_ℂ‖ ^ 2 = _
  rw [inner_hvec2_left]
  have hint : ∫ u, conj (H2 ((p1, q1), (p2, q2)) u) * G u ∂mu2 =
      ∫ u, conj (H2 ((p1, q1), (p2, q2)) u) * smoothMap ct st se ce F u ∂mu2 := by
    refine integral_congr_ae ?_
    filter_upwards [hLP.coeFn_toLp] with u hu; rw [hu]
  rw [hint, integral_H2_smoothMap hd he (measurable_cellFn creArr cimArr) (norm_cellFn_le hsos)]
  dsimp only
  rw [hp_sum, hq_sum]
  have hsum_eq :
      (∑ j1 ∈ range (k + 1 + 1), ∑ j2 ∈ range (k + 1),
        ((bCoeff ct (-(se * st)) st (se * ct) p1 p2 j1 *
          bCoeff ct (-(se * st)) st (se * ct) q1 q2 j2 : ℝ) : ℂ) *
          ∫ w, conj (H2 ((j1, j2), (k + 1 - j1, k - j2)) w) * F w ∂mu2) =
      ((k.factorial : ℕ) : ℂ) *
        ∑ j1 ∈ range (k + 2),
          ((bCoeff ct (-(se * st)) st (se * ct) p1 p2 j1 : ℝ) : ℂ) *
            ∑ j2 ∈ range (k + 1),
              gScaled creArr cimArr k j1 j2 *
                ((bCoeff ct (-(se * st)) st (se * ct) q1 q2 j2 : ℝ) : ℂ) := by
    rw [show k + 1 + 1 = k + 2 from rfl, mul_sum]
    refine sum_congr rfl fun j1 hj1 => ?_
    rw [mul_sum, mul_sum]
    refine sum_congr rfl fun j2 hj2 => ?_
    rw [integral_H2_cellFn_eq_gScaled creArr cimArr k j1 j2
      (by have := mem_range.1 hj1; omega) (by have := mem_range.1 hj2; omega)]
    push_cast; ring
  rw [hsum_eq, norm_mul, norm_mul, Complex.norm_real,
    Real.norm_of_nonneg (nrm2_pos ((p1, q1), (p2, q2))).le, Complex.norm_natCast,
    mul_pow, mul_pow]
  have hnrm : nrm2 ((p1, q1), (p2, q2)) ^ 2 = ((fac2 ((p1, q1), (p2, q2)) : ℕ) : ℝ)⁻¹ := by
    rw [nrm2, inv_pow, Real.sq_sqrt (fac2_pos _).le]
  rw [hnrm]
  have hbinom_fac : fac2 ((p1, q1), (p2, q2)) * ((k + 1).choose p1 * k.choose q1) =
      (k + 1) * k.factorial ^ 2 := by
    have hp2_eq : k + 1 - p1 = p2 := by omega
    have hq2_eq : k - q1 = q2 := by omega
    have hc1' := Nat.choose_mul_factorial_mul_factorial (show p1 ≤ k + 1 by omega)
    have hc2' := Nat.choose_mul_factorial_mul_factorial (show q1 ≤ k by omega)
    rw [hp2_eq] at hc1'
    rw [hq2_eq] at hc2'
    unfold fac2
    dsimp only
    calc p1.factorial * q1.factorial * (p2.factorial * q2.factorial) *
            ((k + 1).choose p1 * k.choose q1)
        = ((k + 1).choose p1 * p1.factorial * p2.factorial) *
            (k.choose q1 * q1.factorial * q2.factorial) := by ring
      _ = (k + 1).factorial * k.factorial := by rw [hc1', hc2']
      _ = (k + 1) * k.factorial ^ 2 := by rw [Nat.factorial_succ]; ring
  have hfac2_ne : ((fac2 ((p1, q1), (p2, q2)) : ℕ) : ℝ) ≠ 0 := by
    exact_mod_cast (fac2_pos ((p1, q1), (p2, q2))).ne'
  have hk1_ne : (k + 1 : ℝ) ≠ 0 := by positivity
  have hbinomR : ((fac2 ((p1, q1), (p2, q2)) : ℕ) : ℝ) *
      (((k + 1).choose p1 * k.choose q1 : ℕ) : ℝ) =
      (k + 1 : ℝ) * ((k.factorial : ℕ) : ℝ) ^ 2 := by
    exact_mod_cast hbinom_fac
  rw [eq_div_iff hk1_ne]
  have h1 : (((fac2 ((p1, q1), (p2, q2)) : ℕ) : ℝ)⁻¹ * ((k.factorial : ℕ) : ℝ) ^ 2) * (k + 1 : ℝ) =
      (((k + 1).choose p1 * k.choose q1 : ℕ) : ℝ) := by
    rw [inv_mul_eq_div, div_mul_eq_mul_div, div_eq_iff hfac2_ne]
    linarith [hbinomR]
  set S := ‖∑ j1 ∈ range (k + 2),
      ((bCoeff ct (-(se * st)) st (se * ct) p1 p2 j1 : ℝ) : ℂ) *
        ∑ j2 ∈ range (k + 1),
          gScaled creArr cimArr k j1 j2 *
            ((bCoeff ct (-(se * st)) st (se * ct) q1 q2 j2 : ℝ) : ℂ)‖ ^ 2
  linear_combination S * h1

end

end Haagerup
