import GrotheSign.HaagerupBaseRecurrence
import GrotheSign.HypergeometricFamily

/-!
# The first eight actual inverse coefficients at the Haagerup starting parameter

Exact rational recursion computes the coefficients. Its soundness follows from the formal
derivative recurrence, and the resulting values are connected to `inverseProfile`, hence to the
actual compositional inverse. This finite result does not assert the all-orders starting case.

Agent-ID: codex-1a87. Refs #367.
-/

set_option warningAsError true

namespace GrotheSign

open Finset PowerSeries

/-- Exact rational forward coefficients at the starting parameter `c = 2`. -/
def haagerupForwardCoeff : ℕ → ℚ
  | 0 => 1
  | n + 1 => haagerupForwardCoeff n * (2 * (n : ℚ) + 1) ^ 2 /
      (4 * ((n : ℚ) + 1) * ((n : ℚ) + 2))

theorem coeff_hypergeometricRadial_two (n : ℕ) :
    coeff n (hypergeometricRadial 2) = (haagerupForwardCoeff n : ℝ) := by
  induction n with
  | zero => simp [haagerupForwardCoeff]
  | succ n ih =>
    rw [coeff_hypergeometricRadial_succ (by norm_num : (0 : ℝ) < 2), ih,
      haagerupForwardCoeff]
    push_cast
    have h1 : (n : ℝ) + 1 ≠ 0 := by positivity
    have h2 : (n : ℝ) + 2 ≠ 0 := by positivity
    have h2' : (2 : ℝ) + n ≠ 0 := by positivity
    field_simp [h1, h2, h2']
    ring

/-- Triangular exact computation of the coefficient of `F⁻ᵐ` at the starting parameter. -/
def haagerupReciprocalCoeff (m : ℕ) : ℕ → ℚ
  | 0 => 1
  | n + 1 => -(∑ i : Fin (n + 1), ((n - i.val + m * (i.val + 1) : ℕ) : ℚ) *
      haagerupForwardCoeff (i.val + 1) * haagerupReciprocalCoeff m (n - i.val)) /
        ((n + 1 : ℕ) : ℚ)
termination_by n => n
decreasing_by exact Nat.lt_succ_of_le (Nat.sub_le _ _)

/-- The rational recurrence computes the actual reciprocal-power coefficient. -/
theorem coeff_haagerup_reciprocal (m n : ℕ) :
    coeff n ((hypergeometricRadial 2)⁻¹ ^ m) = (haagerupReciprocalCoeff m n : ℝ) := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    cases n with
    | zero => simp [haagerupReciprocalCoeff]
    | succ n =>
      rw [haagerupReciprocalCoeff]
      push_cast
      apply (eq_div_iff (show (n : ℝ) + 1 ≠ 0 by positivity)).2
      rw [mul_comm]
      calc
        _ = -(∑ i ∈ range (n + 1), ((n - i + m * (i + 1) : ℕ) : ℝ) *
            coeff (i + 1) (hypergeometricRadial 2) *
              coeff (n - i) ((hypergeometricRadial 2)⁻¹ ^ m)) :=
          by simpa only [Nat.cast_add, Nat.cast_one] using
            coeff_inv_pow_recurrence _ (constantCoeff_hypergeometricRadial 2) m n
        _ = _ := by
          rw [← Fin.sum_univ_eq_sum_range]
          congr 1
          apply Finset.sum_congr rfl
          intro i _
          rw [coeff_hypergeometricRadial_two,
            ih (n - i.val) (Nat.lt_succ_of_le (Nat.sub_le _ _))]
          push_cast
          rfl

/-- Exact rational inverse-profile coefficients, including an unused zeroth entry. -/
def haagerupBaseProfileCoeff (k : ℕ) : ℚ :=
  -haagerupReciprocalCoeff (2 * k + 1) k / (2 * (k : ℚ) + 1)

theorem coeff_inverseProfile_hypergeometricRadial_two (k : ℕ) (hk : 0 < k) :
    coeff k (inverseProfile (hypergeometricRadial 2)) = (haagerupBaseProfileCoeff k : ℝ) := by
  rw [coeff_inverseProfile_of_pos _ k hk, coeff_inverseRadial, coeff_haagerup_reciprocal]
  unfold haagerupBaseProfileCoeff
  push_cast
  ring

set_option maxRecDepth 4096 in
set_option maxHeartbeats 2000000 in
/-- The finite computation is checked by kernel reduction, with no native evaluation axiom. -/
theorem haagerupBaseProfileCoeff_nonneg_first_eight :
    ∀ k ∈ Finset.Icc 1 8, 0 ≤ haagerupBaseProfileCoeff k := by
  decide +kernel

/-- The first eight nonlinear coefficients of the actual inverse profile are nonnegative. -/
theorem haagerup_base_nonneg_first_eight (k : ℕ) (hk : 0 < k) (hk8 : k ≤ 8) :
    0 ≤ coeff k (inverseProfile (hypergeometricRadial 2)) := by
  rw [coeff_inverseProfile_hypergeometricRadial_two k hk]
  exact_mod_cast haagerupBaseProfileCoeff_nonneg_first_eight k
    (Finset.mem_Icc.mpr ⟨hk, hk8⟩)

/-- The second inverse-profile coefficient vanishes exactly at this starting case. -/
theorem haagerup_base_second_eq_zero :
    coeff 2 (inverseProfile (hypergeometricRadial 2)) = 0 := by
  rw [coeff_inverseProfile_hypergeometricRadial_two 2 (by decide)]
  have h : haagerupBaseProfileCoeff 2 = 0 := by decide +kernel
  rw [h]
  norm_num

end GrotheSign
