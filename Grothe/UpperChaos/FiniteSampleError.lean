import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.InnerProductSpace.Orthonormal
import Mathlib.Tactic

/-! A finite Hilbert-space bridge for the DFT error budget.
Character orthonormality, actual sample enclosures, and identification
with a normalized DFT are separate obligations. -/

open Finset
open scoped InnerProductSpace

namespace Grothe.UpperChaos.DirectSample
noncomputable section

/-- Bessel controls the total squared error in any finite set of Fourier modes,
provided the normalized characters and normalized sample vector are identified. -/
theorem finite_orthonormal_sample_error {ι E : Type*} [SeminormedAddCommGroup E]
    [InnerProductSpace ℂ E] (v : ι → E) (hv : Orthonormal ℂ v)
    (x : E) (s : Finset ι) (d : ι → ℂ) (e : ℝ)
    (he : 0 ≤ e) (hx : ‖x‖ ≤ e)
    (hid : ∀ j ∈ s, d j = ⟪v j, x⟫_ℂ) :
    ∑ j ∈ s, ‖d j‖ ^ 2 ≤ e ^ 2 := by
  calc
    _ = ∑ j ∈ s, ‖⟪v j, x⟫_ℂ‖ ^ 2 := by
      apply sum_congr rfl
      intro j hj
      rw [hid j hj]
    _ ≤ ‖x‖ ^ 2 := hv.sum_inner_products_le x
    _ ≤ e ^ 2 := sq_le_sq₀ (norm_nonneg _) he |>.2 hx

/-- Uniform component bounds imply an L2 bound for a sample vector when the
square of its normalization is the reciprocal number of samples. -/
theorem normalized_sample_norm {ι : Type*} [Fintype ι] (x : EuclideanSpace ℂ ι)
    (e c : ℝ) (he : 0 ≤ e) (hc : 0 ≤ c)
    (hpoint : ∀ i, ‖x i‖ ≤ c * e)
    (hscale : (Fintype.card ι : ℝ) * c ^ 2 ≤ 1) : ‖x‖ ≤ e := by
  have hsq : ‖x‖ ^ 2 ≤ e ^ 2 := by
    rw [EuclideanSpace.norm_sq_eq]
    calc
      _ ≤ ∑ _i : ι, (c * e) ^ 2 := by
        apply sum_le_sum
        intro i hi
        exact (sq_le_sq₀ (norm_nonneg _) (mul_nonneg hc he)).2 (hpoint i)
      _ = (Fintype.card ι : ℝ) * c ^ 2 * e ^ 2 := by simp [mul_pow, mul_assoc]
      _ ≤ e ^ 2 := by nlinarith [sq_nonneg e]
  exact (sq_le_sq₀ (norm_nonneg _) he).1 hsq

end
end Grothe.UpperChaos.DirectSample
