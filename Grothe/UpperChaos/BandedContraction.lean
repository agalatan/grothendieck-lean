import Mathlib.Analysis.Matrix.Normed
import Mathlib.Tactic

/-! Frobenius error for a two-sided band truncation.
No numerical source gate, normalized-Hermite identification or Gaussian
approximation is assumed here. -/

open scoped Matrix Matrix.Norms.Frobenius
open Finset
namespace Grothe.UpperChaos.BandedContraction

variable {l m n p : Type*} [Fintype l] [Fintype m] [Fintype n] [Fintype p]

/-- Exact identity and Frobenius bound; `T` is already the transposed right
factor. This works for arbitrary rectangular dimensions. -/
theorem frobenius_two_sided (S S' : Matrix l m ℝ) (A : Matrix m n ℝ)
    (T T' : Matrix n p ℝ) :
    ‖(S * A) * T - (S' * A) * T'‖ ≤
      (‖S - S'‖ * ‖A‖) * ‖T‖ + (‖S'‖ * ‖A‖) * ‖T - T'‖ := by
  have hEq : (S * A) * T - (S' * A) * T' =
      ((S - S') * A) * T + (S' * A) * (T - T') := by
    simp only [Matrix.sub_mul, Matrix.mul_sub]
    abel
  rw [hEq]
  calc
    _ ≤ ‖((S - S') * A) * T‖ + ‖(S' * A) * (T - T')‖ := norm_add_le _ _
    _ ≤ (‖S - S'‖ * ‖A‖) * ‖T‖ + (‖S'‖ * ‖A‖) * ‖T - T'‖ := by
      apply add_le_add
      · exact (Matrix.frobenius_norm_mul _ _).trans
          (mul_le_mul_of_nonneg_right (Matrix.frobenius_norm_mul _ _) (norm_nonneg _))
      · exact (Matrix.frobenius_norm_mul _ _).trans
          (mul_le_mul_of_nonneg_right (Matrix.frobenius_norm_mul _ _) (norm_nonneg _))

/-- Scalar caps can be reused uniformly across degrees, including both left
and right truncation errors. All bounds concern Frobenius norms. -/
theorem frobenius_two_sided_of_caps (S S' : Matrix l m ℝ) (A : Matrix m n ℝ)
    (T T' : Matrix n p ℝ) (dl dr ml mr b : ℝ)
    (hdl0 : 0 ≤ dl) (hdr0 : 0 ≤ dr) (hml0 : 0 ≤ ml) (hmr0 : 0 ≤ mr) (hb0 : 0 ≤ b)
    (hdl : ‖S - S'‖ ≤ dl) (hdr : ‖T - T'‖ ≤ dr)
    (hml : ‖S'‖ ≤ ml) (hmr : ‖T‖ ≤ mr) (hb : ‖A‖ ≤ b) :
    ‖(S * A) * T - (S' * A) * T'‖ ≤ (dl * mr + ml * dr) * b := by
  calc
    _ ≤ (‖S - S'‖ * ‖A‖) * ‖T‖ + (‖S'‖ * ‖A‖) * ‖T - T'‖ :=
      frobenius_two_sided S S' A T T'
    _ ≤ (dl * b) * mr + (ml * b) * dr := by gcongr
    _ = (dl * mr + ml * dr) * b := by ring

/-- Uniform per-block norm ratios combine in squared norm without multiplying
by the number of degrees. -/
theorem sum_sq_error_of_block_ratios {ι : Type*} (s : Finset ι)
    (u v : ι → ℝ) (r : ℝ) (hr : 0 ≤ r)
    (hu : ∀ i ∈ s, 0 ≤ u i) (hv : ∀ i ∈ s, 0 ≤ v i)
    (hbound : ∀ i ∈ s, u i ≤ r * v i) :
    ∑ i ∈ s, (u i) ^ 2 ≤ r ^ 2 * ∑ i ∈ s, (v i) ^ 2 := by
  rw [Finset.mul_sum]
  apply Finset.sum_le_sum
  intro i hi
  have h := pow_le_pow_left₀ (hu i hi) (hbound i hi) 2
  simpa only [mul_pow] using h

end Grothe.UpperChaos.BandedContraction
