import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.Tactic

/-!
# A coefficient change of variables for formal power series

The residue change of variables needed for Lagrange inversion is proved using ordinary power
series and finite truncations. No convergence or Laurent-series substitution is required.

Agent-ID: codex-1a87. Refs #365.
-/

namespace GrotheSign.Lagrange

open Finset PowerSeries

variable {R : Type*} [Field R]

/-- The derivative of `X * F`, with its two terms explicit. -/
noncomputable def jacobian (F : R⟦X⟧) : R⟦X⟧ := F + X * derivative F

theorem jacobian_eq_derivative (F : R⟦X⟧) : jacobian F = derivative (X * F) := by
  simp only [jacobian, derivative.leibniz, derivative_X, smul_eq_mul, mul_one]
  ring

/-- Differentiating a natural power of the reciprocal keeps the unit factor explicit. -/
theorem derivative_inv_pow (F : R⟦X⟧) (n : ℕ) :
    derivative (F⁻¹ ^ n) = -(n : R⟦X⟧) * (F⁻¹ ^ (n + 1) * derivative F) := by
  cases n with
  | zero => simp
  | succ n =>
    rw [derivative_pow, derivative_inv']
    simp only [Nat.add_sub_cancel, pow_succ]
    ring

/-- Cancelling one unit factor separates the coefficient and derivative contributions. -/
theorem jacobian_mul_inv_pow (F : R⟦X⟧) (hF : constantCoeff F ≠ 0) (n : ℕ) :
    jacobian F * F⁻¹ ^ (n + 1) =
      F⁻¹ ^ n + X * (F⁻¹ ^ (n + 1) * derivative F) := by
  calc
    _ = (F * F⁻¹) * F⁻¹ ^ n + X * (F⁻¹ ^ (n + 1) * derivative F) := by
      simp only [jacobian, pow_succ]
      ring
    _ = _ := by rw [PowerSeries.mul_inv_cancel F hF, one_mul]

/-- The formal derivative gives the exact weighted coefficient relation. -/
theorem coeff_jacobian_mul_inv_pow (F : R⟦X⟧) (hF : constantCoeff F ≠ 0) (n d : ℕ) :
    (n : R) * coeff d (jacobian F * F⁻¹ ^ (n + 1)) =
      ((n : R) - d) * coeff d (F⁻¹ ^ n) := by
  rw [jacobian_mul_inv_pow F hF n, map_add]
  cases d with
  | zero => simp
  | succ d =>
    rw [coeff_succ_X_mul]
    have hd := congrArg (coeff d) (derivative_inv_pow F n)
    simp only [coeff_derivative, neg_mul, map_neg, coeff_natCast_mul] at hd
    push_cast
    linear_combination hd

variable [CharZero R]

private theorem coeff_jacobian_inverse_diagonal (F : R⟦X⟧)
    (hF : constantCoeff F ≠ 0) (d : ℕ) :
    coeff d (jacobian F * F⁻¹ ^ (d + 1)) = if d = 0 then 1 else 0 := by
  cases d with
  | zero =>
    rw [jacobian_mul_inv_pow F hF 0]
    simp
  | succ d =>
    have h := coeff_jacobian_mul_inv_pow F hF (d + 1) (d + 1)
    simp only [sub_self, zero_mul] at h
    have hd : ((d + 1 : ℕ) : R) ≠ 0 := Nat.cast_ne_zero.mpr (by omega)
    simpa using (mul_eq_zero.mp h).resolve_left hd

private theorem coeff_monomial_jacobian (F : R⟦X⟧) (hF : constantCoeff F ≠ 0)
    (k d : ℕ) :
    coeff (k + d) ((X * F) ^ k * jacobian F * F⁻¹ ^ (k + d + 1)) =
      if d = 0 then 1 else 0 := by
  have he : (X * F) ^ k * jacobian F * F⁻¹ ^ (k + d + 1) =
      X ^ k * (jacobian F * F⁻¹ ^ (d + 1)) := by
    rw [mul_pow, show k + d + 1 = k + (d + 1) by omega, pow_add]
    calc
      _ = X ^ k * (jacobian F * ((F * F⁻¹) ^ k * F⁻¹ ^ (d + 1))) := by
        rw [mul_pow]
        ring
      _ = _ := by rw [PowerSeries.mul_inv_cancel F hF]; simp
  rw [he, Nat.add_comm k d, coeff_X_pow_mul]
  exact coeff_jacobian_inverse_diagonal F hF d

omit [CharZero R] in
/-- Up to a fixed coefficient, substitution followed by multiplication is a finite sum. -/
theorem coeff_subst_mul_finite (H F K : R⟦X⟧) (n : ℕ) :
    coeff n (H.subst (X * F) * K) =
      ∑ k ∈ range (n + 1), coeff k H * coeff n ((X * F) ^ k * K) := by
  have hg : HasSubst (X * F) := HasSubst.of_constantCoeff_zero' (by simp)
  let T := mk (fun i ↦ coeff (i + (n + 1)) H)
  have htail : coeff n (((X * F) ^ (n + 1) * T.subst (X * F)) * K) = 0 := by
    rw [mul_pow]
    have he : ((X ^ (n + 1) * F ^ (n + 1)) * T.subst (X * F)) * K =
        X ^ (n + 1) * (F ^ (n + 1) * T.subst (X * F) * K) := by ring
    rw [he, coeff_X_pow_mul']
    simp
  calc
    coeff n (H.subst (X * F) * K) =
        coeff n (((trunc (n + 1) H : Polynomial R) : R⟦X⟧).subst (X * F) * K) := by
      conv_lhs => rw [eq_X_pow_mul_shift_add_trunc (n + 1) H]
      rw [subst_add hg, subst_mul hg, subst_pow hg, subst_X hg, add_mul, map_add,
        htail, zero_add]
    _ = _ := by
      rw [subst_coe hg, trunc_apply]
      simp only [map_sum, Polynomial.aeval_monomial, PowerSeries.algebraMap_eq,
        Nat.Ico_zero_eq_range, Finset.sum_mul, mul_assoc, coeff_C_mul]

/-- Formal coefficient change of variables for `X * F` with invertible linear coefficient. -/
theorem coeff_subst_jacobian (H F : R⟦X⟧) (hF : constantCoeff F ≠ 0) (n : ℕ) :
    coeff n (H.subst (X * F) * jacobian F * F⁻¹ ^ (n + 1)) = coeff n H := by
  rw [mul_assoc, coeff_subst_mul_finite]
  calc
    _ = coeff n H * coeff n ((X * F) ^ n * (jacobian F * F⁻¹ ^ (n + 1))) := by
      apply Finset.sum_eq_single n
      · intro k hk hkn
        have hle : k ≤ n := by simpa using hk
        obtain ⟨d, hd⟩ := Nat.exists_eq_add_of_le hle
        have hd0 : d ≠ 0 := by intro hz; simp [hz] at hd; exact hkn hd.symm
        have h := coeff_monomial_jacobian F hF k d
        rw [← hd, ite_eq_right hd0] at h
        rw [← mul_assoc, h, mul_zero]
      · simp
    _ = coeff n H := by
      have h : coeff n ((X * F) ^ n * (jacobian F * F⁻¹ ^ (n + 1))) = 1 := by
        simpa [mul_assoc] using coeff_monomial_jacobian F hF n 0
      rw [h, mul_one]

/-- Lagrange's power formula, stated without division and with actual inverse composition. -/
theorem lagrange_power (F W : R⟦X⟧) (hF : constantCoeff F ≠ 0)
    (hW : W.subst (X * F) = X) (n m : ℕ) (hmn : m ≤ n) :
    (n : R) * coeff n (W ^ m) = (m : R) * coeff (n - m) (F⁻¹ ^ n) := by
  have hg : HasSubst (X * F) := HasSubst.of_constantCoeff_zero' (by simp)
  have hc := coeff_subst_jacobian (W ^ m) F hF n
  rw [subst_pow hg, hW, mul_assoc, coeff_X_pow_mul', ite_eq_left hmn] at hc
  calc
    (n : R) * coeff n (W ^ m) =
        (n : R) * coeff (n - m) (jacobian F * F⁻¹ ^ (n + 1)) := by rw [hc]
    _ = ((n : R) - (n - m : ℕ)) * coeff (n - m) (F⁻¹ ^ n) :=
      coeff_jacobian_mul_inv_pow F hF n (n - m)
    _ = _ := by rw [Nat.cast_sub hmn]; ring

end GrotheSign.Lagrange
