import GrotheSign.HypergeometricFinite
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral

/-!
# Positive normalization of the hypergeometric kernels

Multiplying the forward kernel by a positive constant rescales its actual inverse coefficients
by positive powers. The gamma factor is positive for every positive real dimension. This module
concerns formal series; it does not assert a Gaussian integral or analytic inverse identification.

Agent-ID: codex-1a87. Refs #367.
-/

set_option warningAsError true

namespace GrotheSign

open PowerSeries

/-- Constant normalization changes the radial inverse coefficients by the expected odd power. -/
theorem coeff_inverseRadial_C_mul (F : ℝ⟦X⟧) (a : ℝ) (k : ℕ) :
    coeff k (inverseRadial (C a * F)) =
      a⁻¹ ^ (2 * k + 1) * coeff k (inverseRadial F) := by
  rw [coeff_inverseRadial, coeff_inverseRadial, PowerSeries.mul_inv_rev, C_inv,
    mul_pow, ← map_pow, coeff_mul_C]
  ring

/-- The scaling rule applies to Mathlib's actual compositional inverse. -/
theorem coeff_inverseSeries_C_mul (F : ℝ⟦X⟧) (hF : constantCoeff F ≠ 0)
    (a : ℝ) (ha : a ≠ 0) (k : ℕ) :
    coeff (2 * k + 1) (inverseSeries (C a * F) (by simpa using mul_ne_zero ha hF)) =
      a⁻¹ ^ (2 * k + 1) * coeff (2 * k + 1) (inverseSeries F hF) := by
  rw [← oddLift_inverseRadial_eq_inverseSeries, ← oddLift_inverseRadial_eq_inverseSeries,
    coeff_oddLift, coeff_oddLift, coeff_inverseRadial_C_mul]

/-- The usual gamma normalization, extended to positive real dimensions. -/
noncomputable def kernelScale (n : ℝ) : ℝ :=
  (2 / n) * (Real.Gamma ((n + 1) / 2) / Real.Gamma (n / 2)) ^ 2

theorem kernelScale_pos {n : ℝ} (hn : 0 < n) : 0 < kernelScale n := by
  unfold kernelScale
  exact mul_pos (div_pos (by norm_num) hn)
    (sq_pos_of_pos (div_pos (Real.Gamma_pos_of_pos (by linarith))
      (Real.Gamma_pos_of_pos (by linarith))))

/-- At dimension two the normalization is Haagerup's factor `π / 4`. -/
theorem kernelScale_two : kernelScale 2 = Real.pi / 4 := by
  have h : Real.Gamma (3 / 2) = (1 / 2) * Real.sqrt Real.pi := by
    convert Real.Gamma_add_one (s := 1 / 2) (by norm_num) using 1 <;>
      norm_num [Real.Gamma_one_half_eq]
  norm_num [kernelScale, Real.Gamma_one, h, mul_pow,
    Real.sq_sqrt Real.pi_pos.le]
  ring

/-- The radial formal series with the gamma normalization of the rounding kernel. -/
noncomputable def kernelRadial (n : ℝ) : ℝ⟦X⟧ :=
  C (kernelScale n) * hypergeometricRadial ((n + 2) / 2)

@[simp] theorem constantCoeff_kernelRadial (n : ℝ) :
    constantCoeff (kernelRadial n) = kernelScale n := by
  simp [kernelRadial]

theorem constantCoeff_kernelRadial_ne_zero {n : ℝ} (hn : 0 < n) :
    constantCoeff (kernelRadial n) ≠ 0 := by
  rw [constantCoeff_kernelRadial]
  exact (kernelScale_pos hn).ne'

/-- The actual inverse has a positive leading coefficient in every positive real dimension. -/
theorem kernel_inverseSeries_linear_pos {n : ℝ} (hn : 0 < n) :
    0 < coeff 1 (inverseSeries (kernelRadial n)
      (constantCoeff_kernelRadial_ne_zero hn)) := by
  rw [← oddLift_inverseRadial_eq_inverseSeries, coeff_one_oddLift,
    constantCoeff_inverseRadial, constantCoeff_kernelRadial]
  exact inv_pos.mpr (kernelScale_pos hn)

/-- Every even coefficient of the normalized kernel's actual formal inverse vanishes. -/
theorem kernel_inverseSeries_even_eq_zero {n : ℝ} (hn : 0 < n) (k : ℕ) :
    coeff (2 * k) (inverseSeries (kernelRadial n)
      (constantCoeff_kernelRadial_ne_zero hn)) = 0 := by
  rw [← oddLift_inverseRadial_eq_inverseSeries, oddLift]
  cases k with
  | zero => simp
  | succ k =>
    rw [show 2 * (k + 1) = (2 * k + 1) + 1 by omega, coeff_succ_X_mul]
    exact coeff_expand_of_not_dvd 2 (by decide) _ (by omega)

/-- Positive gamma normalization preserves the nonlinear inverse signs. -/
theorem kernel_inverseSeries_sign_of_base
    (hbase : ∀ k, 0 < k → 0 ≤ coeff k (inverseProfile (hypergeometricRadial 2)))
    {n : ℝ} (hn : 2 ≤ n) (k : ℕ) (hk : 0 < k) :
    coeff (2 * k + 1)
      (inverseSeries (kernelRadial n) (constantCoeff_kernelRadial_ne_zero (by linarith)))
      ≤ 0 := by
  unfold kernelRadial
  rw [coeff_inverseSeries_C_mul _ (by simp) _ (kernelScale_pos (by linarith)).ne']
  exact mul_nonpos_of_nonneg_of_nonpos
    (pow_pos (inv_pos.mpr (kernelScale_pos (by linarith))) _).le
    (hypergeometric_dimension_inverseSeries_sign_of_base hbase hn k hk)

/-- The normalized inverse signs are strict in every real dimension greater than two. -/
theorem kernel_inverseSeries_strict_sign_of_base
    (hbase : ∀ k, 0 < k → 0 ≤ coeff k (inverseProfile (hypergeometricRadial 2)))
    {n : ℝ} (hn : 2 < n) (k : ℕ) (hk : 0 < k) :
    coeff (2 * k + 1)
      (inverseSeries (kernelRadial n) (constantCoeff_kernelRadial_ne_zero (by linarith)))
      < 0 := by
  unfold kernelRadial
  rw [coeff_inverseSeries_C_mul _ (by simp) _ (kernelScale_pos (by linarith)).ne']
  exact mul_neg_of_pos_of_neg
    (pow_pos (inv_pos.mpr (kernelScale_pos (by linarith))) _)
    (hypergeometric_dimension_inverseSeries_strict_sign_of_base hbase hn k hk)

/-- The first eight nonlinear odd inverse signs are unconditional for real dimension `n ≥ 2`. -/
theorem kernel_inverseSeries_sign_first_eight {n : ℝ} (hn : 2 ≤ n)
    (k : ℕ) (hk : 0 < k) (hk8 : k ≤ 8) :
    coeff (2 * k + 1)
      (inverseSeries (kernelRadial n) (constantCoeff_kernelRadial_ne_zero (by linarith)))
      ≤ 0 := by
  unfold kernelRadial
  rw [coeff_inverseSeries_C_mul _ (by simp) _ (kernelScale_pos (by linarith)).ne']
  exact mul_nonpos_of_nonneg_of_nonpos
    (pow_pos (inv_pos.mpr (kernelScale_pos (by linarith))) _).le
    (hypergeometric_dimension_inverseSeries_sign_first_eight hn k hk hk8)

/-- Those same coefficients are strictly negative in every real dimension greater than two. -/
theorem kernel_inverseSeries_strict_sign_first_eight {n : ℝ} (hn : 2 < n)
    (k : ℕ) (hk : 0 < k) (hk8 : k ≤ 8) :
    coeff (2 * k + 1)
      (inverseSeries (kernelRadial n) (constantCoeff_kernelRadial_ne_zero (by linarith)))
      < 0 := by
  unfold kernelRadial
  rw [coeff_inverseSeries_C_mul _ (by simp) _ (kernelScale_pos (by linarith)).ne']
  exact mul_neg_of_pos_of_neg
    (pow_pos (inv_pos.mpr (kernelScale_pos (by linarith))) _)
    (hypergeometric_dimension_inverseSeries_strict_sign_first_eight hn k hk hk8)

end GrotheSign
