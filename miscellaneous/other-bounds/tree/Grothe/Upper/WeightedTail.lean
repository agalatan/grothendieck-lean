import Grothe.Upper.ResolventCertificate
import Mathlib.Algebra.Polynomial.Eval.Degree

/-!
# A weighted coefficient norm bounds an unchecked polynomial tail

Scaling the variable by `rho ≥ 1` multiplies coefficient `n` by `rho^n`.
Consequently a short checked coefficient prefix and a coarse norm of the
scaled polynomial control the complete coefficient norm.
-/

namespace Grothe.Upper.WeightedTail

open Polynomial Finset
open Grothe.Upper.ResolventCertificate

noncomputable section

/-- A weighted norm bounds every coefficient beyond a checked prefix. -/
theorem l1_le_prefix_add_weighted_tail (Q : ℝ[X]) (rho : ℝ) (N : ℕ)
    (hrho : 1 ≤ rho) :
    l1 Q ≤ (∑ n ∈ range N, |Q.coeff n|) +
      l1 (Q.comp (C rho * X)) / rho ^ N := by
  let S := Q.comp (C rho * X)
  have hrho0 : 0 < rho := lt_of_lt_of_le zero_lt_one hrho
  have hpow : 0 < rho ^ N := pow_pos hrho0 N
  have hcoeff (n : ℕ) : |S.coeff n| = |Q.coeff n| * rho ^ n := by
    dsimp only [S]
    rw [comp_C_mul_X_coeff, abs_mul, abs_of_nonneg (pow_nonneg hrho0.le n)]
  have hpoint (n : ℕ) : |Q.coeff (n + N)| ≤
      (rho ^ N)⁻¹ * |S.coeff (n + N)| := by
    have hscaled : |Q.coeff (n + N)| * rho ^ N ≤ |S.coeff (n + N)| := by
      rw [hcoeff]
      exact mul_le_mul_of_nonneg_left (pow_le_pow_right₀ hrho (by omega)) (abs_nonneg _)
    calc
      _ ≤ |S.coeff (n + N)| / rho ^ N := (le_div_iff₀ hpow).mpr hscaled
      _ = _ := by rw [div_eq_mul_inv, mul_comm]
  have hs : Summable fun n => |S.coeff (n + N)| :=
    (summable_nat_add_iff N).mpr (summable_abs_coeff S)
  have ht : (∑' n, |Q.coeff (n + N)|) ≤
      (rho ^ N)⁻¹ * ∑' n, |S.coeff (n + N)| := by
    calc
      _ ≤ ∑' n, (rho ^ N)⁻¹ * |S.coeff (n + N)| :=
        ((summable_nat_add_iff N).mpr (summable_abs_coeff Q)).tsum_le_tsum
          hpoint (hs.mul_left _)
      _ = _ := by rw [tsum_mul_left]
  have hsle : (∑' n, |S.coeff (n + N)|) ≤ l1 S := by
    have hsplit := (summable_abs_coeff S).sum_add_tsum_nat_add N
    rw [tsum_abs_coeff_eq_l1] at hsplit
    have hnonneg : 0 ≤ ∑ n ∈ range N, |S.coeff n| := sum_nonneg fun _ _ => abs_nonneg _
    linarith
  calc
    l1 Q = (∑ n ∈ range N, |Q.coeff n|) + ∑' n, |Q.coeff (n + N)| := by
      rw [← tsum_abs_coeff_eq_l1 Q]
      exact ((summable_abs_coeff Q).sum_add_tsum_nat_add N).symm
    _ ≤ (∑ n ∈ range N, |Q.coeff n|) + (rho ^ N)⁻¹ * l1 S :=
      add_le_add le_rfl (ht.trans (mul_le_mul_of_nonneg_left hsle (inv_nonneg.mpr hpow.le)))
    _ = _ := by rw [div_eq_mul_inv, mul_comm]

end
end Grothe.Upper.WeightedTail
