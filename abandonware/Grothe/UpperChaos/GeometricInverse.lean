import Grothe.UpperChaos.GeometricReciprocal

/-!
# Geometric reciprocal expansion around a positive center

This source-independent pointwise bound is shared by rational interval and
Taylor-model enclosures. It has no production profile dependency.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos

noncomputable section

/-- The first `n` geometric terms for the reciprocal around `B`. -/
def inverseAround (β B : ℝ) (n : ℕ) : ℝ :=
  B⁻¹ * ∑ k ∈ Finset.range n, (-(β / B - 1)) ^ k

/-- A positive center and a relative radius below one give a uniform reciprocal
error bound. Applied pointwise, the finite sum is a polynomial in `β`. -/
theorem abs_inv_sub_inverseAround_le (β B q : ℝ) (n : ℕ)
    (hB : 0 < B) (hq : 0 ≤ q) (hq1 : q < 1)
    (hdev : |β / B - 1| ≤ q) :
    |β⁻¹ - inverseAround β B n| ≤ B⁻¹ * (q ^ n / (1 - q)) := by
  let v : ℝ := β / B - 1
  have hv : |v| ≤ q := hdev
  have hfactor : β = B * (1 + v) := by
    dsimp only [v]
    field_simp [ne_of_gt hB]; ring
  have hgeom := abs_inv_one_add_sub_geometric_le v q n hq hq1 hv
  have hinv : β⁻¹ = B⁻¹ * (1 + v)⁻¹ := by rw [hfactor, mul_inv]
  rw [hinv]
  change |B⁻¹ * (1 + v)⁻¹ - B⁻¹ * ∑ k ∈ Finset.range n, (-v) ^ k| ≤ _
  rw [← mul_sub, abs_mul, abs_of_nonneg (inv_nonneg.mpr hB.le)]
  exact mul_le_mul_of_nonneg_left hgeom (inv_nonneg.mpr hB.le)

end
end Grothe.UpperChaos
