import Mathlib.Analysis.Real.Sqrt
import Mathlib.Tactic

/-!
# The Gaussian exponent of a real cross covariance (Hardy step 1(b), algebra)

For a real symmetric `R = [[a, b], [b, c]]` with `K = I − R² ≻ 0`, the pair `(u, Ru + Sw)` with `u, w` standard and
`S` the Cholesky factor of `K` has the Gaussian density whose exponent is that of the holomorphic kernel `kHol`:

    ‖x‖² + ‖S⁻¹(y − Rx)‖² = xᵀAx + yᵀAy − 2 xᵀCy,   A = K⁻¹,  C = RA       (`chol_quad`)

`S = [[s₁₁, 0], [s₂₁, s₂₂]]`, `s₁₁ = √k₁₁`, `s₂₁ = k₁₂/√k₁₁`, `s₂₂ = √(det K/k₁₁)`, so `det S = √(det K)`.
-/

namespace Grothe.UpperChaos.HardyReal

noncomputable section

/-- `k₁₁ = 1 − a² − b²`, the first diagonal entry of `K = I − R²`. -/
def k11 (a b : ℝ) : ℝ := 1 - a ^ 2 - b ^ 2
/-- `k₁₂ = −(ab + bc)`. -/
def k12 (a b c : ℝ) : ℝ := -(a * b + b * c)
/-- `k₂₂ = 1 − b² − c²`. -/
def k22 (b c : ℝ) : ℝ := 1 - b ^ 2 - c ^ 2
/-- `det K = det(I − R²)`. -/
def kdet (a b c : ℝ) : ℝ := k11 a b * k22 b c - k12 a b c ^ 2

/-- The Cholesky factor `S` of `K`: entries `s₁₁, s₂₁, s₂₂` (`s₁₂ = 0`). -/
def s11 (a b : ℝ) : ℝ := √(k11 a b)
def s21 (a b c : ℝ) : ℝ := k12 a b c / s11 a b
def s22 (a b c : ℝ) : ℝ := √(kdet a b c / k11 a b)

/-- `S⁻¹ d` for the lower-triangular `S`. -/
def solveS (a b c : ℝ) (d : ℝ × ℝ) : ℝ × ℝ :=
  (d.1 / s11 a b, (d.2 - s21 a b c * (d.1 / s11 a b)) / s22 a b c)

/-- `S w`. -/
def mulS (a b c : ℝ) (w : ℝ × ℝ) : ℝ × ℝ :=
  (s11 a b * w.1, s21 a b c * w.1 + s22 a b c * w.2)

/-- `R x`. -/
def mulR (a b c : ℝ) (x : ℝ × ℝ) : ℝ × ℝ := (a * x.1 + b * x.2, b * x.1 + c * x.2)

/-- The quadratic form `uᵀ [[p, q], [q, r]] v`. -/
def qf (p q r : ℝ) (u v : ℝ × ℝ) : ℝ := p * u.1 * v.1 + q * (u.1 * v.2 + u.2 * v.1) + r * u.2 * v.2

variable {a b c : ℝ}

lemma s11_sq (h : 0 < k11 a b) : s11 a b ^ 2 = k11 a b := Real.sq_sqrt h.le

lemma s22_sq (h : 0 < k11 a b) (hd : 0 < kdet a b c) : s22 a b c ^ 2 = kdet a b c / k11 a b :=
  Real.sq_sqrt (div_pos hd h).le

lemma s11_pos (h : 0 < k11 a b) : 0 < s11 a b := Real.sqrt_pos.2 h

lemma s22_pos (h : 0 < k11 a b) (hd : 0 < kdet a b c) : 0 < s22 a b c := Real.sqrt_pos.2 (div_pos hd h)

/-- `det S = s₁₁ s₂₂ = √(det K)`. -/
lemma detS_sq (h : 0 < k11 a b) (hd : 0 < kdet a b c) : (s11 a b * s22 a b c) ^ 2 = kdet a b c := by
  rw [mul_pow, s11_sq h, s22_sq h hd]; field_simp

lemma mulS_solveS (h : 0 < k11 a b) (hd : 0 < kdet a b c) (d : ℝ × ℝ) : mulS a b c (solveS a b c d) = d := by
  have h1 := (s11_pos h).ne'; have h2 := (s22_pos h hd).ne'
  ext <;> simp [mulS, solveS] <;> field_simp; ring

lemma solveS_mulS (h : 0 < k11 a b) (hd : 0 < kdet a b c) (w : ℝ × ℝ) : solveS a b c (mulS a b c w) = w := by
  have h1 := (s11_pos h).ne'; have h2 := (s22_pos h hd).ne'
  ext <;> simp [mulS, solveS] <;> field_simp; ring

lemma solveS_fst_sq (h : 0 < k11 a b) (d : ℝ × ℝ) : (solveS a b c d).1 ^ 2 = d.1 ^ 2 / k11 a b := by
  simp only [solveS, div_pow, s11_sq h]

lemma solveS_snd_sq (h : 0 < k11 a b) (hd : 0 < kdet a b c) (d : ℝ × ℝ) :
    (solveS a b c d).2 ^ 2 = (d.2 - k12 a b c * d.1 / k11 a b) ^ 2 * k11 a b / kdet a b c := by
  have h1 := (s11_pos h).ne'
  have e : s21 a b c * (d.1 / s11 a b) = k12 a b c * d.1 / k11 a b := by
    rw [s21, ← s11_sq h]; field_simp
  simp only [solveS, e, div_pow, s22_sq h hd]
  field_simp

/-- **The exponent identity**: `‖x‖² + ‖S⁻¹(y − Rx)‖² = (xᵀ K' x + yᵀ K' y − 2 xᵀ (R K') y) / det K`, where
`K' = adj K = [[k₂₂, −k₁₂], [−k₁₂, k₁₁]]` (so `A = K'/det K`, `C = R A`). -/
theorem chol_quad (h : 0 < k11 a b) (hd : 0 < kdet a b c) (x y : ℝ × ℝ) :
    x.1 ^ 2 + x.2 ^ 2 + (solveS a b c (y - mulR a b c x)).1 ^ 2 + (solveS a b c (y - mulR a b c x)).2 ^ 2 =
      (qf (k22 b c) (-k12 a b c) (k11 a b) x x + qf (k22 b c) (-k12 a b c) (k11 a b) y y
        - 2 * qf (a * k22 b c - b * k12 a b c) (-(a * k12 a b c) + b * k11 a b) (-(b * k12 a b c) + c * k11 a b)
          x y) / kdet a b c := by
  rw [solveS_fst_sq h, solveS_snd_sq h hd]
  have hk := h.ne'; have hdk := hd.ne'
  rw [eq_div_iff hdk]
  field_simp
  simp only [qf, mulR, kdet, k11, k12, k22, Prod.fst_sub, Prod.snd_sub]
  ring

end

end Grothe.UpperChaos.HardyReal
