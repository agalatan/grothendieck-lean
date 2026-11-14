import GrotheSign.LagrangeSubstitution
import Mathlib.Algebra.BigOperators.NatAntidiagonal

/-!
# Exact triangular computation of reciprocal-power coefficients

The recurrence is derived from the formal derivative identity, so its finite rational evaluations
compute coefficients of the actual reciprocal series. It will be used for the finite part of the
Haagerup starting case, separately from the required all-orders argument.

Agent-ID: codex-1a87. Refs #367.
-/

set_option warningAsError true

namespace GrotheSign

open Finset PowerSeries

private theorem coeff_mul_range (F G : PowerSeries ℝ) (n : ℕ) :
    coeff n (F * G) =
      ∑ i ∈ range (n + 1), coeff i F * coeff (n - i) G := by
  rw [coeff_mul]
  exact Finset.Nat.sum_antidiagonal_eq_sum_range_succ
    (fun i j ↦ coeff i F * coeff j G) n

private theorem coeff_mul_derivative_of_constantCoeff_one
    (F G : PowerSeries ℝ) (hF : constantCoeff F = 1) (n : ℕ) :
    coeff n (F * derivative G) =
      ((n + 1 : ℕ) : ℝ) * coeff (n + 1) G +
        ∑ i ∈ range (n + 1), ((n - i : ℕ) : ℝ) *
          coeff (i + 1) F * coeff (n - i) G := by
  rw [coeff_mul_range, Finset.sum_range_succ']
  simp only [Nat.sub_zero, coeff_zero_eq_constantCoeff_apply, hF, one_mul,
    coeff_derivative]
  rw [Finset.sum_range_succ]
  simp only [Nat.sub_self, Nat.cast_zero, zero_mul, add_zero]
  have hs : (∑ i ∈ range n,
      coeff (i + 1) F *
        (coeff (n - (i + 1) + 1) G * (((n - (i + 1) : ℕ) : ℝ) + 1))) =
      ∑ i ∈ range n, ((n - i : ℕ) : ℝ) * coeff (i + 1) F * coeff (n - i) G := by
    apply Finset.sum_congr rfl
    intro i hi
    have hi' : i < n := Finset.mem_range.mp hi
    have hn : n - (i + 1) + 1 = n - i := by omega
    have hnR : ((n - (i + 1) : ℕ) : ℝ) + 1 = ((n - i : ℕ) : ℝ) := by
      exact_mod_cast hn
    rw [hn, hnR]
    ring
  rw [hs]
  push_cast
  ring

/-- A triangular recurrence for the coefficients of every reciprocal power of a normalized
formal power series. The weight is a natural number, including when the exponent is zero. -/
theorem coeff_inv_pow_recurrence (F : PowerSeries ℝ) (hF : constantCoeff F = 1)
    (m n : ℕ) :
    ((n + 1 : ℕ) : ℝ) * coeff (n + 1) (F⁻¹ ^ m) =
      -(∑ i ∈ range (n + 1), ((n - i + m * (i + 1) : ℕ) : ℝ) *
        coeff (i + 1) F * coeff (n - i) (F⁻¹ ^ m)) := by
  have hunit : constantCoeff F ≠ 0 := by rw [hF]; norm_num
  have hd : F * derivative (F⁻¹ ^ m) =
      -(m : PowerSeries ℝ) * (derivative F * F⁻¹ ^ m) := by
    rw [Lagrange.derivative_inv_pow]
    calc
      _ = -(m : PowerSeries ℝ) * (derivative F * F⁻¹ ^ m * (F * F⁻¹)) := by
        rw [pow_succ]
        ring
      _ = _ := by rw [PowerSeries.mul_inv_cancel F hunit, mul_one]
  have hc := congrArg (coeff n) hd
  rw [coeff_mul_derivative_of_constantCoeff_one F _ hF n] at hc
  simp only [neg_mul, map_neg, coeff_natCast_mul, coeff_mul_range,
    coeff_derivative, Finset.mul_sum] at hc
  have hs : (∑ i ∈ range (n + 1), ((n - i : ℕ) : ℝ) *
        coeff (i + 1) F * coeff (n - i) (F⁻¹ ^ m)) +
      (∑ i ∈ range (n + 1), (m : ℝ) *
        (coeff (i + 1) F * (i + 1) * coeff (n - i) (F⁻¹ ^ m))) =
      ∑ i ∈ range (n + 1), ((n - i + m * (i + 1) : ℕ) : ℝ) *
        coeff (i + 1) F * coeff (n - i) (F⁻¹ ^ m) := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i _
    push_cast
    ring
  linear_combination hc - hs

end GrotheSign
