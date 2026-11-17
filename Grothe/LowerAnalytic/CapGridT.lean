import Grothe.LowerAnalytic.CapGrid
import GrotheCapsKernel.CapCheck

/-!
# Grid prices and the exact cell decomposition of the integrated majorant

`GridData`: a uniform grid (`Nr` rings of width `h`, `N` angular cells) with rational cell
prices `pa, pb`, reciprocal bounds `na, nb` and correction coefficients `gg`; on the tail
`A = B = nA = nB = 1`, `g = 0`.  `gridOK` checks the cell conditions (`1 ≤ na·pa`, `1 ≤ nb·pb`,
`0 ≤ gg`, `gg·D(pa, pb, rlb((i+1)h)) ≤ 8` with `rlb(r) = r(|ℓ − 2β| + |β|r²) ≥ |L|` on `|z| ≤ r`,
bounds by `c`); `gridPrices` are then admissible `Prices`.

**The decomposition** (`Tint_grid`): every entry of `T = ∫ Tz dγ` is the finite sum over the cells
of `TzW (cell weights) (cellT i j)` plus the tail term `TzW wTail tailT`, where `TzW` is the
entry formula (`ν|L|² + ξ`, `τ uⱼ`, `ν Gᵢⱼ − γ uᵢuⱼ`) applied to the cell functional of the
polynomials (`cellTerms`, `tailTerms`).
-/

open MeasureTheory Real Set Finset GrotheKernel
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

lemma absQ_eq (q : ℚ) : absQ q = |q| := by
  unfold absQ; split_ifs with h
  · rw [abs_of_neg h]
  · rw [abs_of_nonneg (not_lt.1 h)]

lemma norm_Lf_le_rlb (ell beta : ℚ) {z : ℂ} {r : ℚ} (hz : ‖z‖ ≤ r) :
    ‖Lf ell beta z‖ ≤ rlb ell beta r := by
  rw [Lf, norm_mul, Complex.norm_real, Real.norm_eq_abs]
  have hn := norm_nonneg z
  have e : (ell : ℝ) + beta * (Complex.normSq z - 2) = (ell - 2 * beta) + beta * ‖z‖ ^ 2 := by
    rw [Complex.normSq_eq_norm_sq]; ring
  rw [e]
  have h1 : |((ell : ℝ) - 2 * beta) + beta * ‖z‖ ^ 2| ≤ |(ell : ℝ) - 2 * beta| + |(beta : ℝ)| * (r : ℝ) ^ 2 := by
    refine (abs_add_le _ _).trans (add_le_add le_rfl ?_)
    rw [abs_mul, abs_pow, abs_norm]
    exact mul_le_mul_of_nonneg_left (pow_le_pow_left₀ hn hz 2) (abs_nonneg _)
  have : (rlb ell beta r : ℝ) = (r : ℝ) * (|(ell : ℝ) - 2 * beta| + |(beta : ℝ)| * (r : ℝ) ^ 2) := by
    simp [rlb, absQ_eq]
  rw [this]
  exact mul_le_mul hz h1 (abs_nonneg _) (hn.trans hz)

section ok

variable {gd : GridData} {ell beta : ℚ} (hok : gridOK gd ell beta = true)
include hok

end ok


/-! ### The cell decomposition -/

lemma eval_oneCP (z : ℂ) : oneCP.eval z = 1 := by simp [oneCP]

section dec

variable {gd : GridData} {ell beta : ℚ} (hok : gridOK gd ell beta = true)
include hok

omit hok in
lemma thN_bounds {N j : ℕ} (hN : 0 < N) (hj : j < N) :
    -π ≤ thN N j ∧ thN N j ≤ thN N (j + 1) ∧ thN N (j + 1) ≤ π := by
  have hN' : (0 : ℝ) < N := by exact_mod_cast hN
  have hj' : (j : ℝ) + 1 ≤ N := by exact_mod_cast hj
  have hp := pi_pos
  unfold thN
  push_cast
  refine ⟨?_, ?_, ?_⟩
  · have : 0 ≤ 2 * π * j / N := by positivity
    linarith
  · have : 2 * π * j / N ≤ 2 * π * (j + 1) / N := by
      apply div_le_div_of_nonneg_right _ hN'.le; nlinarith
    linarith
  · have : 2 * π * (j + 1) / N ≤ 2 * π := by
      rw [div_le_iff₀ hN']; nlinarith
    linarith

end dec

end

end Grothe.LowerAnalytic
