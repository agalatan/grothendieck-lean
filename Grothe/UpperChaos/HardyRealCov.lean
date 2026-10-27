import Grothe.UpperChaos.HardyRealAlg

/-!
# Equal covariances of the two Gaussian constructions (Hardy step 1(b), algebra)

The smoothed Mehler pair `U = MX + NZ`, `V = M(DX + ΣW) + NZ'` (8 standard base coordinates `x₁, x₂, w₁, w₂, Z₁,
Z₂, Z'₁, Z'₂`) and the pair `(u, Ru + Sw)` (4 base coordinates) have the same covariance `[[I, R], [R, I]]`
when `M² + N² = I`, `D² + Σ² = I`, `R = MDM` and `SSᵀ = I − R²`. In terms of a test vector `α ∈ ℝ⁴` (the
coefficients of a linear functional on `(U₁, U₂, V₁, V₂)`), the two sums of squared projections agree
(`cov_eq`).
-/

namespace Grothe.UpperChaos.HardyReal

noncomputable section

/-- `∑_k (c_k · α)²` for the Mehler family: the coefficient vectors of `x₁, x₂, w₁, w₂, Z₁, Z₂, Z'₁, Z'₂`
on `(U₁, U₂, V₁, V₂)`. -/
def covMehler (m00 m01 m11 n00 n01 n11 p q σ₁ σ₂ : ℝ) (α : Fin 4 → ℝ) : ℝ :=
  (m00 * α 0 + m01 * α 1 + m00 * p * α 2 + m01 * p * α 3) ^ 2 +
  (m01 * α 0 + m11 * α 1 + m01 * q * α 2 + m11 * q * α 3) ^ 2 +
  (m00 * σ₁ * α 2 + m01 * σ₁ * α 3) ^ 2 +
  (m01 * σ₂ * α 2 + m11 * σ₂ * α 3) ^ 2 +
  (n00 * α 0 + n01 * α 1) ^ 2 + (n01 * α 0 + n11 * α 1) ^ 2 +
  (n00 * α 2 + n01 * α 3) ^ 2 + (n01 * α 2 + n11 * α 3) ^ 2

/-- `∑_k (c_k · α)²` for `(u, Ru + Sw)`: the coefficient vectors of `u₁, u₂, w₁, w₂`. -/
def covPair (a b c : ℝ) (α : Fin 4 → ℝ) : ℝ :=
  (α 0 + a * α 2 + b * α 3) ^ 2 + (α 1 + b * α 2 + c * α 3) ^ 2 +
  (s11 a b * α 2 + s21 a b c * α 3) ^ 2 + (s22 a b c * α 3) ^ 2

/-- **The two constructions have the same covariance.** -/
theorem cov_eq {m00 m01 m11 n00 n01 n11 p q σ₁ σ₂ : ℝ}
    (hM00 : m00 ^ 2 + m01 ^ 2 + n00 ^ 2 + n01 ^ 2 = 1)
    (hM01 : m00 * m01 + m01 * m11 + n00 * n01 + n01 * n11 = 0)
    (hM11 : m01 ^ 2 + m11 ^ 2 + n01 ^ 2 + n11 ^ 2 = 1)
    (hσ₁ : σ₁ ^ 2 = 1 - p ^ 2) (hσ₂ : σ₂ ^ 2 = 1 - q ^ 2)
    {a b c : ℝ} (ha : a = m00 ^ 2 * p + m01 ^ 2 * q) (hb : b = m00 * m01 * p + m01 * m11 * q)
    (hc : c = m01 ^ 2 * p + m11 ^ 2 * q) (h : 0 < k11 a b) (hd : 0 < kdet a b c) (α : Fin 4 → ℝ) :
    covMehler m00 m01 m11 n00 n01 n11 p q σ₁ σ₂ α = covPair a b c α := by
  have e11 := s11_sq h
  have e22 := s22_sq h hd
  have h1 := (s11_pos h).ne'
  have e21 : s11 a b * s21 a b c = k12 a b c := by rw [s21]; field_simp
  have e2122 : s21 a b c ^ 2 + s22 a b c ^ 2 = k22 b c := by
    rw [e22, s21, div_pow, e11]; field_simp; simp only [kdet]; ring
  simp only [covMehler, covPair]
  have key : (s11 a b * α 2 + s21 a b c * α 3) ^ 2 + (s22 a b c * α 3) ^ 2 =
      k11 a b * α 2 ^ 2 + 2 * k12 a b c * α 2 * α 3 + k22 b c * α 3 ^ 2 := by
    linear_combination α 2 ^ 2 * e11 + 2 * α 2 * α 3 * e21 + α 3 ^ 2 * e2122
  simp only [k11, k12, k22] at key
  subst ha hb hc
  linear_combination -key + (α 0 ^ 2 + α 2 ^ 2) * hM00 + 2 * (α 0 * α 1 + α 2 * α 3) * hM01
    + (α 1 ^ 2 + α 3 ^ 2) * hM11 + (m00 * α 2 + m01 * α 3) ^ 2 * hσ₁ + (m01 * α 2 + m11 * α 3) ^ 2 * hσ₂

end

end Grothe.UpperChaos.HardyReal
