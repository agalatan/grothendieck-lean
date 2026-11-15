import Grothe.UpperChaos.ReciprocalQuadrature

/-!
# Complete finite partitions in the reciprocal coordinate

Positive reciprocal boundaries map to ordinary auxiliary boundaries in reverse
order. Reusing the continuous original kernel proves cell coverage without any
continuity hypothesis at reciprocal zero. Certified cell errors then add over
the complete rectangle, before the single source reserve is applied.

Agent-ID: codex-2ca4
-/

namespace Grothe.UpperChaos.QuadraturePartition
noncomputable section

/-- The reciprocal rectangle equals the oppositely oriented original rectangle. -/
theorem rectangleIntegral_reciprocal_eq_neg (f : ℝ → ℝ → ℂ) (a b c d : ℝ)
    (ha : 0 < a) (hb : 0 < b) :
    rectangleIntegral (reciprocalKernel f) a b c d =
      -rectangleIntegral f a⁻¹ b⁻¹ c d := by
  calc
    _ = rectangleIntegral f b⁻¹ a⁻¹ c d := by
      symm
      simpa only [inv_inv] using rectangleIntegral_eq_reciprocal f b⁻¹ a⁻¹ c d
        (inv_pos.mpr hb) (inv_pos.mpr ha)
    _ = _ := intervalIntegral.integral_symm _ _

/-- Each reciprocal strip can have its own complete radial subdivision.
Only positivity of the finite auxiliary boundaries is required. -/
theorem rectangleIntegral_reciprocal_eq_sum (f : ℝ → ℝ → ℂ)
    (hf : Continuous f.uncurry) (a : ℕ → ℝ) (m : ℕ)
    (ha : ∀ i ≤ m, 0 < a i) (b : ℕ → ℕ → ℝ) (n : ℕ → ℕ) (c d : ℝ)
    (hleft : ∀ i < m, b i 0 = c) (hright : ∀ i < m, b i (n i) = d) :
    rectangleIntegral (reciprocalKernel f) (a 0) (a m) c d =
      ∑ i ∈ Finset.range m, ∑ k ∈ Finset.range (n i),
        rectangleIntegral (reciprocalKernel f) (a i) (a (i + 1))
          (b i k) (b i (k + 1)) := by
  rw [rectangleIntegral_reciprocal_eq_neg f _ _ _ _ (ha 0 (Nat.zero_le m)) (ha m le_rfl),
    rectangleIntegral_eq_sum f hf (fun i => (a i)⁻¹) m b n c d hleft hright]
  simp_rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro i hi
  have him : i < m := Finset.mem_range.mp hi
  apply Finset.sum_congr rfl
  intro k _hk
  exact (rectangleIntegral_reciprocal_eq_neg f _ _ _ _
    (ha i him.le) (ha (i + 1) (Nat.succ_le_of_lt him))).symm

/-- Cell radii control the entire positive reciprocal rectangle. This is
quadrature error only; the original-source reserve is not repeated per cell. -/
theorem norm_rectangleIntegral_reciprocal_sub_sum_le (f : ℝ → ℝ → ℂ)
    (hf : Continuous f.uncurry) (a : ℕ → ℝ) (m : ℕ)
    (ha : ∀ i ≤ m, 0 < a i) (b : ℕ → ℕ → ℝ) (n : ℕ → ℕ) (c d : ℝ)
    (hleft : ∀ i < m, b i 0 = c) (hright : ∀ i < m, b i (n i) = d)
    (center : ℕ → ℕ → ℂ) (radius : ℕ → ℕ → ℝ)
    (hcell : ∀ i < m, ∀ k < n i,
      ‖rectangleIntegral (reciprocalKernel f) (a i) (a (i + 1))
          (b i k) (b i (k + 1)) - center i k‖ ≤ radius i k) :
    ‖rectangleIntegral (reciprocalKernel f) (a 0) (a m) c d -
      ∑ i ∈ Finset.range m, ∑ k ∈ Finset.range (n i), center i k‖ ≤
      ∑ i ∈ Finset.range m, ∑ k ∈ Finset.range (n i), radius i k := by
  rw [rectangleIntegral_reciprocal_eq_sum f hf a m ha b n c d hleft hright,
    ← Finset.sum_sub_distrib]
  simp_rw [← Finset.sum_sub_distrib]
  apply (norm_sum_le _ _).trans
  apply Finset.sum_le_sum
  intro i hi
  apply (norm_sum_le _ _).trans
  apply Finset.sum_le_sum
  intro k hk
  exact hcell i (Finset.mem_range.mp hi) k (Finset.mem_range.mp hk)

end
end Grothe.UpperChaos.QuadraturePartition
