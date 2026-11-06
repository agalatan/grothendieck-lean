import Grothe.UpperQuad.CanonicalExplicit

/-!
# Total-degree shell bounds for the canonical coefficients

Taking the square root of the existing squared coefficient estimate gives a majorant depending
only on total degree. Summing over its `m + 1` pairs bounds the shell in the ordinary norm sum,
with the normalization of `Uext` unchanged.

Agent-ID: codex-1a87. Refs #342, #334.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.CanonicalShellBound

open Explicit

noncomputable section

/-- A total-degree majorant for one canonical coefficient in the right half-plane of `A²`. -/
theorem norm_Uext_le_shell (g h : ℕ) {A : ℂ} (hr : 0 < (A ^ 2).re) :
    ‖Uext g h A‖ ≤
      2 * Real.sqrt (‖A‖ ^ 2 / (A ^ 2).re) * Real.sqrt ((g + h).factorial : ℝ) *
        (Real.sqrt 8 * (‖A‖ ^ 2 / (A ^ 2).re) / ‖A‖) ^ (g + h) := by
  let θ := ‖A‖ ^ 2 / (A ^ 2).re
  have hθ : 0 ≤ θ := div_nonneg (sq_nonneg _) hr.le
  have hbase : (Real.sqrt 8 * θ / ‖A‖) ^ 2 = 8 * θ ^ 2 / ‖A‖ ^ 2 := by
    rw [div_pow, mul_pow, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 8)]
  have hpow : ((Real.sqrt 8 * θ / ‖A‖) ^ (g + h)) ^ 2 =
      (8 * θ ^ 2 / ‖A‖ ^ 2) ^ (g + h) := by
    rw [← pow_mul, Nat.mul_comm (g + h) 2, pow_mul, hbase]
  have hmajor :
      (2 * Real.sqrt θ * Real.sqrt ((g + h).factorial : ℝ) *
        (Real.sqrt 8 * θ / ‖A‖) ^ (g + h)) ^ 2 =
      4 * θ * ((g + h).factorial : ℝ) * (8 * θ ^ 2 / ‖A‖ ^ 2) ^ (g + h) := by
    rw [mul_pow, mul_pow, mul_pow, Real.sq_sqrt hθ,
      Real.sq_sqrt (Nat.cast_nonneg (g + h).factorial), hpow]
    ring
  have hnonneg : 0 ≤ 2 * Real.sqrt θ * Real.sqrt ((g + h).factorial : ℝ) *
      (Real.sqrt 8 * θ / ‖A‖) ^ (g + h) := by positivity
  apply (sq_le_sq₀ (norm_nonneg _) hnonneg).mp
  rw [hmajor]
  exact norm_Uext_sq_le g h hr

/-- The norm sum of the `m + 1` canonical pairs of total degree `m`. -/
theorem sum_norm_Uext_shell_le (m : ℕ) {A : ℂ} (hr : 0 < (A ^ 2).re) :
    ∑ g ∈ Finset.range (m + 1), ‖Uext g (m - g) A‖ ≤
      2 * Real.sqrt (‖A‖ ^ 2 / (A ^ 2).re) * ((m : ℝ) + 1) *
        Real.sqrt (m.factorial : ℝ) *
        (Real.sqrt 8 * (‖A‖ ^ 2 / (A ^ 2).re) / ‖A‖) ^ m := by
  calc
    _ ≤ ∑ _g ∈ Finset.range (m + 1),
        2 * Real.sqrt (‖A‖ ^ 2 / (A ^ 2).re) * Real.sqrt (m.factorial : ℝ) *
          (Real.sqrt 8 * (‖A‖ ^ 2 / (A ^ 2).re) / ‖A‖) ^ m := by
      apply Finset.sum_le_sum
      intro g hg
      have hdeg : g + (m - g) = m := by
        have := Finset.mem_range.mp hg
        omega
      simpa only [hdeg] using norm_Uext_le_shell g (m - g) hr
    _ = _ := by
      simp only [Finset.sum_const, Finset.card_range, nsmul_eq_mul, Nat.cast_add, Nat.cast_one]
      ring

end

end Grothe.UpperQuad.CanonicalShellBound
