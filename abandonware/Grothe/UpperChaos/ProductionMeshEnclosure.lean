import Grothe.UpperChaos.ProductionRectangleAssembly
import Grothe.UpperChaos.ReciprocalQuadraturePartition

/-!
# Combining retained-source quadrature enclosures

The complete coefficient enclosure combines regular and reciprocal rectangles
over every radial strip. These bounds concern the retained source. Its common
approximation reserve is added only after coefficient energies are assembled.

Agent-ID: codex-2ca4
-/

open MeasureTheory Set
open scoped InnerProductSpace

namespace Grothe.UpperChaos
open QuadraturePartition
noncomputable section

/-- The two auxiliary parts of every retained strip give one complete
coefficient enclosure, with the Gaussian normalization included. -/
theorem norm_retainedReciprocalMeshValue_sub_sum_le {N : ℕ} (i : GradedIdx N)
    (j : ℕ) (a : ℕ → ℝ) (n : ℕ) (selected : ℕ → Prop) [DecidablePred selected]
    (center₀ center₁ : ℕ → ℂ) (radius₀ radius₁ : ℕ → ℝ)
    (hregular : ∀ k < n,
      ‖rectangleIntegral (unitRectangleKernel i j finiteLaplaceEta)
          0 1 (a k) (a (k + 1)) - center₀ k‖ ≤ radius₀ k)
    (hreciprocal : ∀ k < n,
      ‖rectangleIntegral (reciprocalKernel (unitRectangleKernel i j finiteLaplaceEta))
          (if selected k then (100 : ℝ)⁻¹ else ((2 : ℝ) ^ 53)⁻¹)
          1 (a k) (a (k + 1)) - center₁ k‖ ≤ radius₁ k) :
    ‖retainedReciprocalMeshValue i j a n selected -
      (Real.sqrt Real.pi : ℂ)⁻¹ * ∑ k ∈ Finset.range n, (center₀ k + center₁ k)‖ ≤
      ‖(Real.sqrt Real.pi : ℂ)⁻¹‖ *
        ∑ k ∈ Finset.range n, (radius₀ k + radius₁ k) := by
  unfold retainedReciprocalMeshValue
  rw [← mul_sub, norm_mul, ← Finset.sum_sub_distrib]
  apply mul_le_mul_of_nonneg_left _ (norm_nonneg _)
  apply (norm_sum_le _ _).trans
  apply Finset.sum_le_sum
  intro k hk
  have hkn : k < n := Finset.mem_range.mp hk
  rw [add_sub_add_comm]
  exact (norm_add_le _ _).trans (add_le_add (hregular k hkn) (hreciprocal k hkn))

/-- The assembled enclosure applies to the actual retained Gaussian pairing.
No source error is charged inside this finite mesh estimate. -/
theorem norm_inner_profileRetained_sub_meshCenters_le {N : ℕ} (i : GradedIdx N)
    (j : ℕ) (a : ℕ → ℝ) (n : ℕ) (selected : ℕ → Prop) [DecidablePred selected]
    (hmono : Monotone a) (hleft : a 0 = 0) (hright : a n = 80)
    (center₀ center₁ : ℕ → ℂ) (radius₀ radius₁ : ℕ → ℝ)
    (hregular : ∀ k < n,
      ‖rectangleIntegral (unitRectangleKernel i j finiteLaplaceEta)
          0 1 (a k) (a (k + 1)) - center₀ k‖ ≤ radius₀ k)
    (hreciprocal : ∀ k < n,
      ‖rectangleIntegral (reciprocalKernel (unitRectangleKernel i j finiteLaplaceEta))
          (if selected k then (100 : ℝ)⁻¹ else ((2 : ℝ) ^ 53)⁻¹)
          1 (a k) (a (k + 1)) - center₁ k‖ ≤ radius₁ k) :
    ‖⟪hvec2 (gradedIdx i),
      profileRetainedL2
        (profileIntervalUnion ((Finset.range n).filter selected) a (fun k => a (k + 1)))
        (measurableSet_profileIntervalUnion _ _ _) j⟫_ℂ -
      (Real.sqrt Real.pi : ℂ)⁻¹ * ∑ k ∈ Finset.range n, (center₀ k + center₁ k)‖ ≤
      ‖(Real.sqrt Real.pi : ℂ)⁻¹‖ *
        ∑ k ∈ Finset.range n, (radius₀ k + radius₁ k) := by
  rw [inner_profileRetained_eq_reciprocalMesh i j a n selected hmono hleft hright]
  exact norm_retainedReciprocalMeshValue_sub_sum_le i j a n selected
    center₀ center₁ radius₀ radius₁ hregular hreciprocal

end
end Grothe.UpperChaos
