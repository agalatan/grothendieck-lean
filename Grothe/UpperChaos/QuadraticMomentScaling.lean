import Grothe.UpperChaos.QuadraticPolynomialMoments
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring
import Lean.Elab.Tactic.Omega

/-!
# Finite diagonal scaling of the correlated Gaussian moment evaluator

Agent-ID: codex-2ca4.

Complete proof bodies, pending compilation. This is finite algebra on the
existing Wick evaluator; it does not use a change-of-variables theorem or
assume a moment identity. The powers of the two scales cancel in each
surviving Wick summand. The outer balance test supplies the second exponent
identity, and the two extra powers retain the complex Gaussian Jacobian.
-/

namespace Grothe.UpperChaos.QuadraticMomentScaling

open QuadraticPolynomialMoments

noncomputable section

private theorem balanced_scale_factor (U V : ℂ) (hU : U ≠ 0) (hV : V ≠ 0)
    (p q r s k : ℕ) (hkp : k ≤ p) (hkq : k ≤ q)
    (hbalance : (p - k) + r = (q - k) + s) :
    (U ^ (p + q + 2) * V ^ (r + s + 2) *
      (V / U) ^ ((p - k) + (q - k))) /
        ((U ^ 2) ^ (k + 1) * (V ^ 2) ^ (((p - k) + r) + 1)) = 1 := by
  have hUpow : U ^ (p + q + 2) =
      U ^ ((p - k) + (q - k)) * (U ^ 2) ^ (k + 1) := by
    rw [← pow_mul, ← pow_add]
    congr 1
    omega
  have hVpow : V ^ (r + s + 2) * V ^ ((p - k) + (q - k)) =
      (V ^ 2) ^ (((p - k) + r) + 1) := by
    rw [← pow_add, ← pow_mul]
    congr 1
    omega
  have hden : (U ^ 2) ^ (k + 1) * (V ^ 2) ^ (((p - k) + r) + 1) ≠ 0 :=
    mul_ne_zero (pow_ne_zero _ (pow_ne_zero 2 hU))
      (pow_ne_zero _ (pow_ne_zero 2 hV))
  apply (div_eq_iff hden).2
  rw [one_mul, div_pow]
  calc
    _ = ((U ^ 2) ^ (k + 1) *
        (V ^ (r + s + 2) * V ^ ((p - k) + (q - k)))) *
          U ^ ((p - k) + (q - k)) / U ^ ((p - k) + (q - k)) := by
      rw [hUpow]
      ring
    _ = (U ^ 2) ^ (k + 1) *
        (V ^ (r + s + 2) * V ^ ((p - k) + (q - k))) :=
      mul_div_cancel_right₀ _ (pow_ne_zero _ hU)
    _ = _ := by rw [hVpow]

private theorem balanced_summand (U V : ℂ) (hU : U ≠ 0) (hV : V ≠ 0)
    (p q r s k : ℕ) (hkp : k ≤ p) (hkq : k ≤ q)
    (hbalance : (p - k) + r = (q - k) + s) (K L X A D : ℂ) :
    (U ^ (p + q + 2) * V ^ (r + s + 2)) *
      (K * ((V / U) * X) ^ ((p - k) + (q - k)) /
          (U ^ 2 * A) ^ (k + 1) *
        (L / (V ^ 2 * D) ^ (((p - k) + r) + 1))) =
      K * X ^ ((p - k) + (q - k)) / A ^ (k + 1) *
        (L / D ^ (((p - k) + r) + 1)) := by
  calc
    _ = ((U ^ (p + q + 2) * V ^ (r + s + 2) *
          (V / U) ^ ((p - k) + (q - k))) /
            ((U ^ 2) ^ (k + 1) * (V ^ 2) ^ (((p - k) + r) + 1))) *
          (K * X ^ ((p - k) + (q - k)) / A ^ (k + 1) *
            (L / D ^ (((p - k) + r) + 1))) := by
      simp only [mul_pow, div_eq_mul_inv, mul_inv_rev]
      ring
    _ = _ := by
      rw [balanced_scale_factor U V hU hV p q r s k hkp hkq hbalance, one_mul]

private theorem scaled_mean (u v A B : ℝ) (hu : u ≠ 0) (hA : A ≠ 0) :
    (u * v * B) / (u ^ 2 * A) = (v / u) * (B / A) := by
  field_simp [hu, hA]

private theorem scaled_schur (u v A B C : ℝ) (hu : u ≠ 0) (hA : A ≠ 0) :
    ((u ^ 2 * A) * (v ^ 2 * C) - (u * v * B) ^ 2) / (u ^ 2 * A) =
      v ^ 2 * ((A * C - B ^ 2) / A) := by
  field_simp [hu, hA]

/-- The finite moment formula transforms with both complex-coordinate
Jacobian factors. Only the scales and first pivot must be nonzero; positivity
and the determinant condition are needed by the integral theorem, not by this
algebraic identity. -/
theorem momentValue_scale_mul (u v A B C : ℝ) (hu : u ≠ 0) (hv : v ≠ 0)
    (hA : A ≠ 0) (p q r s : ℕ) :
    ((u : ℂ) ^ (p + q + 2) * (v : ℂ) ^ (r + s + 2)) *
      momentValue (u ^ 2 * A) (u * v * B) (v ^ 2 * C) p q r s =
        momentValue A B C p q r s := by
  classical
  have huC : (u : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hu
  have hvC : (v : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hv
  have hmean : -(((u * v * B) / (u ^ 2 * A) : ℝ) : ℂ) =
      ((v : ℂ) / (u : ℂ)) * -((B / A : ℝ) : ℂ) := by
    rw [scaled_mean u v A B hu hA, Complex.ofReal_mul, Complex.ofReal_div v u]
    ring
  unfold momentValue
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  have hkmin : k < min p q + 1 := Finset.mem_range.mp hk
  have hkp : k ≤ p := by omega
  have hkq : k ≤ q := by omega
  by_cases hbalance : (p - k) + r = (q - k) + s
  · simp only [ite_eq_left hbalance]
    unfold wickCoeff
    rw [hmean, scaled_schur u v A B C hu hA]
    simp only [Complex.ofReal_mul, Complex.ofReal_pow]
    have ht := balanced_summand (u : ℂ) (v : ℂ) huC hvC
      p q r s k hkp hkq hbalance
      ((p.choose k : ℂ) * (q.choose k : ℂ) * (k.factorial : ℂ))
      ((((p - k) + r).factorial : ℂ)) (-((B / A : ℝ) : ℂ))
      (A : ℂ) ((((A * C - B ^ 2) / A : ℝ) : ℂ))
    simpa only [mul_assoc, mul_left_comm, mul_comm] using ht
  · simp only [ite_eq_right hbalance, mul_zero]

/-- Scaling a monomial and its conjugate leaves the inverse Gaussian
Jacobian. The right-hand side is an unnormalized Gaussian moment. -/
theorem momentValue_scale (u v A B C : ℝ) (hu : u ≠ 0) (hv : v ≠ 0)
    (hA : A ≠ 0) (p q r s : ℕ) :
    ((u : ℂ) ^ (p + q) * (v : ℂ) ^ (r + s)) *
      momentValue (u ^ 2 * A) (u * v * B) (v ^ 2 * C) p q r s =
        momentValue A B C p q r s / ((u : ℂ) ^ 2 * (v : ℂ) ^ 2) := by
  have huC : (u : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hu
  have hvC : (v : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr hv
  apply (eq_div_iff (mul_ne_zero (pow_ne_zero 2 huC) (pow_ne_zero 2 hvC))).2
  calc
    _ = ((u : ℂ) ^ (p + q + 2) * (v : ℂ) ^ (r + s + 2)) *
        momentValue (u ^ 2 * A) (u * v * B) (v ^ 2 * C) p q r s := by
      simp only [pow_add]
      ring
    _ = _ := momentValue_scale_mul u v A B C hu hv hA p q r s

/-- The square-root specialization needed by the original parameter gates.
The right-hand side has no square roots: when its five real parameters are
rational, it is a finite rational evaluator with exact inverse mass R*Q. -/
theorem momentValue_sqrt_scale (R Q A B C : ℝ) (hR : 0 < R) (hQ : 0 < Q)
    (hA : A ≠ 0) (p q r s : ℕ) :
    ((Real.sqrt R : ℂ) ^ (p + q) * (Real.sqrt Q : ℂ) ^ (r + s)) *
      momentValue (R * A) (Real.sqrt (R * Q) * B) (Q * C) p q r s =
        momentValue A B C p q r s / ((R * Q : ℝ) : ℂ) := by
  have hu : Real.sqrt R ≠ 0 := (Real.sqrt_pos.mpr hR).ne'
  have hv : Real.sqrt Q ≠ 0 := (Real.sqrt_pos.mpr hQ).ne'
  have hmul : Real.sqrt R * Real.sqrt Q = Real.sqrt (R * Q) :=
    (Real.sqrt_mul hR.le Q).symm
  have hden : (Real.sqrt R : ℂ) ^ 2 * (Real.sqrt Q : ℂ) ^ 2 =
      ((R * Q : ℝ) : ℂ) := by
    rw [← Complex.ofReal_pow, ← Complex.ofReal_pow,
      Real.sq_sqrt hR.le, Real.sq_sqrt hQ.le, Complex.ofReal_mul]
  have h := momentValue_scale (Real.sqrt R) (Real.sqrt Q) A B C hu hv hA p q r s
  simpa only [Real.sq_sqrt hR.le, Real.sq_sqrt hQ.le, hmul, hden] using h

end
end Grothe.UpperChaos.QuadraticMomentScaling
