import Mathlib.Algebra.Field.GeomSum
import Mathlib.Data.Real.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# A polynomial reciprocal approximation for Gaussian quadrature

The identities and uniform bounds here are independent of numerical data.
They give the reciprocal portion of a polynomial enclosure of the
one-dimensional conditional Gaussian pilot on 16 rational cells.

Agent-ID: codex-e4b7
-/

open Finset

namespace Grothe.UpperChaos

/-- A finite geometric series approximates `(1 + v)⁻¹` with an explicit tail. -/
theorem abs_inv_one_add_sub_geometric_le (v q : ℝ) (n : ℕ)
    (hq : 0 ≤ q) (hq1 : q < 1) (hv : |v| ≤ q) :
    |(1 + v)⁻¹ - ∑ k ∈ range n, (-v) ^ k| ≤ q ^ n / (1 - q) := by
  have hqden : 0 < 1 - q := by linarith
  have hden : 0 < 1 + v := by
    have hvlo := (abs_le.mp hv).1
    linarith
  have hg := geom_sum_mul_neg (-v) n
  have heq : (1 + v)⁻¹ - ∑ k ∈ range n, (-v) ^ k = (-v) ^ n / (1 + v) := by
    field_simp [ne_of_gt hden]
    linear_combination -hg
  rw [heq, abs_div, abs_pow, abs_neg, abs_of_pos hden]
  have hpow : |v| ^ n ≤ q ^ n := pow_le_pow_left₀ (abs_nonneg v) hv n
  have hdenle : 1 - q ≤ 1 + v := by
    have hvlo := (abs_le.mp hv).1
    linarith
  calc
    |v| ^ n / (1 + v) ≤ q ^ n / (1 + v) :=
      div_le_div_of_nonneg_right hpow hden.le
    _ ≤ q ^ n / (1 - q) :=
      div_le_div_of_nonneg_left (pow_nonneg hq n) hqden hdenle

/-- The relative perturbation of `1 + u²` stays below `1/16` on a pilot cell. -/
theorem abs_gaussian_reciprocal_perturbation_le
    (c δ : ℝ) (hc0 : 0 ≤ c) (hc : c ≤ 31 / 32) (hδ : |δ| ≤ 1 / 32) :
    |(2 * c * δ + δ ^ 2) / (1 + c ^ 2)| ≤ 1 / 16 := by
  have hnum : |2 * c * δ + δ ^ 2| ≤ 2 * c * |δ| + |δ| ^ 2 := by
    calc
      _ ≤ |2 * c * δ| + |δ ^ 2| := abs_add _ _
      _ = _ := by rw [abs_mul, abs_mul, abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 2),
          abs_of_nonneg hc0, abs_pow]; ring
  have hmul : c * |δ| ≤ (31 / 32 : ℝ) * (1 / 32 : ℝ) :=
    mul_le_mul hc hδ (abs_nonneg δ) (by norm_num)
  have hsq : |δ| ^ 2 ≤ (1 / 32 : ℝ) ^ 2 :=
    pow_le_pow_left₀ (abs_nonneg δ) hδ 2
  have hnumle : |2 * c * δ + δ ^ 2| ≤ (63 / 1024 : ℝ) := by
    nlinarith
  have hden : 1 ≤ 1 + c ^ 2 := by nlinarith [sq_nonneg c]
  have hdenpos : 0 < 1 + c ^ 2 := by positivity
  calc
    |(2 * c * δ + δ ^ 2) / (1 + c ^ 2)| =
        |2 * c * δ + δ ^ 2| / (1 + c ^ 2) := by
          rw [abs_div, abs_of_pos hdenpos]
    _ ≤ |2 * c * δ + δ ^ 2| := div_le_self (abs_nonneg _) hden
    _ ≤ 63 / 1024 := hnumle
    _ ≤ 1 / 16 := by norm_num

/-- Exact reciprocal polynomial used by the Gaussian slice certificate. -/
def gaussianReciprocalPoly (c δ : ℝ) : ℝ :=
  (1 + c ^ 2)⁻¹ * ∑ k ∈ range 12,
    (-( (2 * c * δ + δ ^ 2) / (1 + c ^ 2))) ^ k

/-- All 16 pilot cells share one explicit geometric reciprocal error bound. -/
theorem abs_gaussian_reciprocal_sub_poly_le
    (c δ : ℝ) (hc0 : 0 ≤ c) (hc : c ≤ 31 / 32) (hδ : |δ| ≤ 1 / 32) :
    |(1 + (c + δ) ^ 2)⁻¹ - gaussianReciprocalPoly c δ| ≤
      (1 / 16 : ℝ) ^ 12 / (1 - 1 / 16) := by
  let d : ℝ := 1 + c ^ 2
  let v : ℝ := (2 * c * δ + δ ^ 2) / d
  have hd : 1 ≤ d := by dsimp [d]; nlinarith [sq_nonneg c]
  have hdpos : 0 < d := by linarith
  have hv : |v| ≤ (1 / 16 : ℝ) := by
    dsimp only [v, d]
    exact abs_gaussian_reciprocal_perturbation_le c δ hc0 hc hδ
  have hgeom := abs_inv_one_add_sub_geometric_le v (1 / 16) 12 (by norm_num) (by norm_num) hv
  have hfactor : (1 + (c + δ) ^ 2)⁻¹ = d⁻¹ * (1 + v)⁻¹ := by
    have hid : 1 + (c + δ) ^ 2 = d * (1 + v) := by
      dsimp only [d, v]
      field_simp [ne_of_gt (show 0 < 1 + c ^ 2 by positivity)]
      <;> ring
    rw [hid, mul_inv]
  have hinv : 0 ≤ d⁻¹ ∧ d⁻¹ ≤ 1 :=
    ⟨inv_nonneg.mpr hdpos.le, (inv_le_one₀ hdpos).2 hd⟩
  rw [hfactor]
  change |d⁻¹ * (1 + v)⁻¹ - d⁻¹ * ∑ k ∈ range 12, (-v) ^ k| ≤ _
  rw [← mul_sub, abs_mul, abs_of_nonneg hinv.1]
  exact (mul_le_of_le_one_left (abs_nonneg _) hinv.2).trans hgeom

end Grothe.UpperChaos
