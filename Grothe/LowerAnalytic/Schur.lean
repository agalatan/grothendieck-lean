import Mathlib

/-!
# The delta-tightening gate as a Schur complement

Reference: `handoff/lower/research-note.md` §3.  For the symmetric block matrix
`E = [[a, bᵀ], [b, C]]` with `C ≻ 0` (2×2), the gate `E − diag(ε−δ, 0, 0) ⪰ 0` is equivalent to
`δ ≥ ε − a + bᵀC⁻¹b`.  We state it with explicit real entries and the quadratic form.
-/

namespace Grothe.LowerAnalytic

noncomputable section

/-- Quadratic form of `[[a', b1, b2],[b1, c11, c12],[b2, c12, c22]]`. -/
def qform (a' b1 b2 c11 c12 c22 v0 v1 v2 : ℝ) : ℝ :=
  a' * v0 ^ 2 + 2 * v0 * (b1 * v1 + b2 * v2) + (c11 * v1 ^ 2 + 2 * c12 * v1 * v2 + c22 * v2 ^ 2)

/-- `bᵀ C⁻¹ b` for the 2×2 block `C = [[c11,c12],[c12,c22]]`. -/
def schurTerm (b1 b2 c11 c12 c22 : ℝ) : ℝ :=
  (c22 * b1 ^ 2 - 2 * c12 * b1 * b2 + c11 * b2 ^ 2) / (c11 * c22 - c12 ^ 2)

/-- `wᵀ C⁻¹ w ≥ 0` for `C ≻ 0`, in the form `c22 w1² − 2c12 w1w2 + c11 w2² ≥ 0`. -/
lemma inv_form_nonneg (c11 c12 c22 : ℝ) (hc11 : 0 < c11) (hdet : 0 < c11 * c22 - c12 ^ 2)
    (w1 w2 : ℝ) : 0 ≤ c22 * w1 ^ 2 - 2 * c12 * w1 * w2 + c11 * w2 ^ 2 := by
  have hc22 : 0 < c22 := by nlinarith [sq_nonneg c12]
  have : c22 * (c22 * w1 ^ 2 - 2 * c12 * w1 * w2 + c11 * w2 ^ 2)
      = (c22 * w1 - c12 * w2) ^ 2 + (c11 * c22 - c12 ^ 2) * w2 ^ 2 := by ring
  have h2 : 0 ≤ (c22 * w1 - c12 * w2) ^ 2 + (c11 * c22 - c12 ^ 2) * w2 ^ 2 := by positivity
  nlinarith

/-- Completing the square: with `w = C u + v0 b`,
`det(C) · q(v) = det(C)(a' − bᵀC⁻¹b) v0² + wᵀ adj(C) w`. -/
lemma qform_key (a' b1 b2 c11 c12 c22 : ℝ) (hdet : c11 * c22 - c12 ^ 2 ≠ 0) (v0 v1 v2 : ℝ) :
    (c11 * c22 - c12 ^ 2) * qform a' b1 b2 c11 c12 c22 v0 v1 v2
      = (c11 * c22 - c12 ^ 2) * (a' - schurTerm b1 b2 c11 c12 c22) * v0 ^ 2
        + (c22 * (c11 * v1 + c12 * v2 + v0 * b1) ^ 2
            - 2 * c12 * (c11 * v1 + c12 * v2 + v0 * b1) * (c12 * v1 + c22 * v2 + v0 * b2)
            + c11 * (c12 * v1 + c22 * v2 + v0 * b2) ^ 2) := by
  unfold qform schurTerm
  field_simp
  ring

/-- **Schur-complement gate.**  With `C ≻ 0`:
`(∀ v, vᵀ (E − diag(ε−δ,0,0)) v ≥ 0) ↔ δ ≥ ε − a + bᵀC⁻¹b`. -/
theorem schur_gate (a b1 b2 c11 c12 c22 ε δ : ℝ) (hc11 : 0 < c11)
    (hdet : 0 < c11 * c22 - c12 ^ 2) :
    (∀ v0 v1 v2 : ℝ, 0 ≤ qform (a - (ε - δ)) b1 b2 c11 c12 c22 v0 v1 v2)
      ↔ ε - a + schurTerm b1 b2 c11 c12 c22 ≤ δ := by
  have hdet' : c11 * c22 - c12 ^ 2 ≠ 0 := hdet.ne'
  constructor
  · intro h
    -- test with `v0 = 1`, `u = −C⁻¹ b`, for which `w = C u + b = 0`
    set u1 : ℝ := -((c22 * b1 - c12 * b2) / (c11 * c22 - c12 ^ 2)) with hu1
    set u2 : ℝ := -((c11 * b2 - c12 * b1) / (c11 * c22 - c12 ^ 2)) with hu2
    have hk : (c11 * c22 - c12 ^ 2) * (c11 * c22 - c12 ^ 2)⁻¹ = 1 := mul_inv_cancel₀ hdet'
    have hw1 : c11 * u1 + c12 * u2 + 1 * b1 = 0 := by
      rw [hu1, hu2, div_eq_mul_inv, div_eq_mul_inv]
      linear_combination (-b1) * hk
    have hw2 : c12 * u1 + c22 * u2 + 1 * b2 = 0 := by
      rw [hu1, hu2, div_eq_mul_inv, div_eq_mul_inv]
      linear_combination (-b2) * hk
    have hk := qform_key (a - (ε - δ)) b1 b2 c11 c12 c22 hdet' 1 u1 u2
    rw [hw1, hw2] at hk
    have h0 := h 1 u1 u2
    have : 0 ≤ (c11 * c22 - c12 ^ 2) * (a - (ε - δ) - schurTerm b1 b2 c11 c12 c22) := by
      have := mul_nonneg hdet.le h0
      rw [hk] at this
      simpa using this
    have := nonneg_of_mul_nonneg_right this hdet
    linarith
  · intro h v0 v1 v2
    have hk := qform_key (a - (ε - δ)) b1 b2 c11 c12 c22 hdet' v0 v1 v2
    have h1 : 0 ≤ a - (ε - δ) - schurTerm b1 b2 c11 c12 c22 := by linarith
    have h2 := inv_form_nonneg c11 c12 c22 hc11 hdet (c11 * v1 + c12 * v2 + v0 * b1)
      (c12 * v1 + c22 * v2 + v0 * b2)
    have h3 : 0 ≤ (c11 * c22 - c12 ^ 2) * qform (a - (ε - δ)) b1 b2 c11 c12 c22 v0 v1 v2 := by
      rw [hk]; positivity
    exact nonneg_of_mul_nonneg_right h3 hdet

end

end Grothe.LowerAnalytic
