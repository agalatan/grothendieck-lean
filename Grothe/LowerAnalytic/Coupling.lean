import Mathlib

/-!
# The coupling term of a row: completing the square

The Gaussian reduction of a row leaves, before the residual is discarded, the negative form
`−⟪x, N x⟫` of the remote component `x`, with `N = M_E − diag(ε − δ, 0, 0)` positive.  Instead of
discarding it one completes the square against a vector `N m`:

  `−⟪N x, x⟫ ≤ −2 ⟪N m, x⟫ + ⟪N m, m⟫`   (`coupling_square`).

With `N m = b ⊗ q` for a coupling vector `b` and the residual `q` this replaces the discarded
form by the coupling `2⟪b ⊗ q, x⟫` at the price `⟪b ⊗ q, N⁻¹(b ⊗ q)⟫ = (bᵀN⁻¹b) ‖q‖²`, which is
the origin of the potential with coupling `a = e₁ + b` and of the price `κ = 1/δ − bᵀN⁻¹b`.
-/

namespace Grothe.LowerAnalytic

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H]

/-- **Completing the square** for a symmetric positive operator. -/
theorem coupling_square (N : H →ₗ[ℝ] H) (hsym : ∀ a b, inner ℝ (N a) b = inner ℝ a (N b))
    (hpos : ∀ a, 0 ≤ inner ℝ (N a) a) (x m : H) :
    2 * inner ℝ (N m) x - inner ℝ (N m) m ≤ inner ℝ (N x) x := by
  have h := hpos (x - m)
  have e : inner ℝ (N x) m = inner ℝ (N m) x := by rw [hsym, real_inner_comm]
  rw [map_sub, inner_sub_left, inner_sub_right, inner_sub_right, e] at h
  linarith

/-- The price of a rank-one coupling: `⟪c ⊗ q, b ⊗ q⟫ = (b·c) ‖q‖²` in coordinates. -/
theorem coupling_price (b1 b2 b3 c1 c2 c3 : ℝ) (q : H) :
    inner ℝ (c1 • q) (b1 • q) + inner ℝ (c2 • q) (b2 • q) + inner ℝ (c3 • q) (b3 • q)
      = (b1 * c1 + b2 * c2 + b3 * c3) * ‖q‖ ^ 2 := by
  simp only [real_inner_smul_left, real_inner_smul_right, real_inner_self_eq_norm_sq]
  ring

end Grothe.LowerAnalytic
