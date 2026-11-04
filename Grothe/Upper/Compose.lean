import Grothe.Upper.Realise

/-!
# Polynomials as power series on `[0, 1]`

For a real polynomial `T` and `0 ≤ x ≤ 1`, the series `Σ'_n [Xⁿ]T · xⁿ` is `T(x)`
(`tsum_coeff_mul_pow`), its terms are absolutely summable (`summable_coeff_mul_pow`) with total at
most the Wiener norm `‖T‖_𝒜 = l1 T` (`tsum_abs_coeff_mul_pow_le`), so `|T(x)| ≤ ‖T‖_𝒜`
(`abs_eval_le_l1`); and the radial kernel of a coefficient sequence `h` is
`radialKernel h z = z · Σ'_n hₙ |z|^{2n}` (`radialKernel_eq_mul`).

These are the evaluation facts behind the kernel computations of the upper bound
(`Grothe.UpperChaos.Kernel2`, `Grothe.UpperChaos.HardyReal`). The module keeps its name because
those modules import it.
-/

namespace Grothe

open scoped ComplexConjugate
open Finset Polynomial

noncomputable section

/-- A polynomial as a power series: `Σ'_n [Xⁿ]T · xⁿ = T(x)`. -/
lemma tsum_coeff_mul_pow (T : ℝ[X]) (x : ℝ) : ∑' n, T.coeff n * x ^ n = T.eval x := by
  rw [tsum_eq_sum (s := range (T.natDegree + 1)) fun n hn => by
    rw [coeff_eq_zero_of_natDegree_lt (by simpa using hn), zero_mul], eval_eq_sum_range]

lemma summable_coeff_mul_pow (T : ℝ[X]) (x : ℝ) : Summable fun n => |T.coeff n * x ^ n| :=
  summable_of_ne_finset_zero (s := range (T.natDegree + 1)) fun n hn => by
    rw [coeff_eq_zero_of_natDegree_lt (by simpa using hn), zero_mul, abs_zero]

lemma tsum_abs_coeff_mul_pow_le (T : ℝ[X]) {x : ℝ} (hx0 : 0 ≤ x) (hx : x ≤ 1) :
    ∑' n, |T.coeff n * x ^ n| ≤ l1 T := by
  apply Real.tsum_le_of_sum_range_le (fun _ => abs_nonneg _)
  intro N
  refine (sum_le_sum fun n _ => ?_).trans (sum_abs_coeff_le_l1 T N)
  rw [abs_mul, abs_of_nonneg (pow_nonneg hx0 n)]
  exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ hx0 hx)

/-- `‖P(x)‖ ≤ ‖P‖_𝒜 ≤ 1` on `[0, 1]`. -/
lemma abs_eval_le_l1 (P : ℝ[X]) {x : ℝ} (hx0 : 0 ≤ x) (hx : x ≤ 1) : |P.eval x| ≤ l1 P := by
  simpa only [Real.norm_eq_abs, tsum_coeff_mul_pow] using
    (norm_tsum_le_tsum_norm (f := fun n => P.coeff n * x ^ n)
      (summable_coeff_mul_pow P x)).trans (tsum_abs_coeff_mul_pow_le P hx0 hx)

/-- `radialKernel h z = z · Σ'_n hₙ |z|^{2n}`. -/
lemma radialKernel_eq_mul (h : ℕ → ℝ) (z : ℂ) :
    radialKernel h z = z * ((∑' n, h n * (‖z‖ ^ 2) ^ n : ℝ) : ℂ) := by
  rw [radialKernel, Complex.ofReal_tsum, ← tsum_mul_left]
  exact tsum_congr fun n => by push_cast; rw [pow_mul]; ring

end

end Grothe
