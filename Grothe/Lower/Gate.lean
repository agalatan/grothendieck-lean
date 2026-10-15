import Grothe.Lower.PSD

/-!
# The retained gate square and its completion with a fixed first coordinate

In the Gaussian reduction of a row, the term that the price `κσ²` summarizes is the quadratic
expression

  `G_r(X) = X*N X + 2 Re(conj X₁ · (g·X))`,   `N = M_E − diag(ε − δ, 0, 0)`,  `g = δ b`,

of the common gate variable `X = Q_w(c₁, c_A, conj c_B) ∈ ℂ³`, whose first coordinate is the
residual `p = Q_w c₁` itself (`gateForm`).  It is affine in the row parameters, so a mixture of
rows has the mixed gate form (`gateForm_mix`), and with `X₁ = p` fixed the completion of the
square over `(X₂, X₃)` gives the pointwise lower bound

  `G(X) ≥ (N₁₁ + 2g₁ − wᵀ M⁻¹ w) |p|²`,  `w = (N₁₂ + g₂, N₁₃ + g₃)`,  `M` the trailing block

(`gateForm_ge`, `gatePrice`), valid whenever the trailing `2×2` block is positive definite
(`gateOK`).
-/

namespace Grothe.Lower

/-- `Re(conj a · b)`, the real inner product of two complex numbers. -/
def hre (a b : ℂ) : ℝ := (starRingEnd ℂ a * b).re

lemma hre_eq (a b : ℂ) : hre a b = a.re * b.re + a.im * b.im := by
  simp [hre, Complex.mul_re]

lemma hre_self (a : ℂ) : hre a a = Complex.normSq a := by
  rw [hre_eq, Complex.normSq_apply]

/-- The gate form `X*N X + 2 Re(conj X₁ · (g·X))` of a real symmetric `N` and a real `g`. -/
def gateForm (N : Sym3) (g1 g2 g3 : ℚ) (X1 X2 X3 : ℂ) : ℝ :=
  N.m11 * hre X1 X1 + 2 * N.m12 * hre X1 X2 + 2 * N.m13 * hre X1 X3 + N.m22 * hre X2 X2
    + 2 * N.m23 * hre X2 X3 + N.m33 * hre X3 X3
    + 2 * (g1 * hre X1 X1 + g2 * hre X1 X2 + g3 * hre X1 X3)

/-- The trailing `2×2` block of `N` is positive definite. -/
def gateOK (N : Sym3) : Bool :=
  decide (0 < N.m22) && decide (0 < N.m22 * N.m33 - N.m23 ^ 2)

/-- The completion constant `N₁₁ + 2g₁ − wᵀ M⁻¹ w` with `w = (N₁₂ + g₂, N₁₃ + g₃)`. -/
def gatePrice (N : Sym3) (g1 g2 g3 : ℚ) : ℚ :=
  N.m11 + 2 * g1 - (N.m33 * (N.m12 + g2) ^ 2 - 2 * N.m23 * (N.m12 + g2) * (N.m13 + g3)
    + N.m22 * (N.m13 + g3) ^ 2) / (N.m22 * N.m33 - N.m23 ^ 2)

/-- The mixture `(1−θ)A + θB`. -/
def Sym3.mix (θ : ℚ) (A B : Sym3) : Sym3 :=
  ⟨(1 - θ) * A.m11 + θ * B.m11, (1 - θ) * A.m12 + θ * B.m12, (1 - θ) * A.m13 + θ * B.m13,
   (1 - θ) * A.m22 + θ * B.m22, (1 - θ) * A.m23 + θ * B.m23, (1 - θ) * A.m33 + θ * B.m33⟩

/-- The gate form is affine in `(N, g)`. -/
lemma gateForm_mix (θ : ℚ) (A B : Sym3) (a1 a2 a3 b1 b2 b3 : ℚ) (X1 X2 X3 : ℂ) :
    gateForm (Sym3.mix θ A B) ((1 - θ) * a1 + θ * b1) ((1 - θ) * a2 + θ * b2)
        ((1 - θ) * a3 + θ * b3) X1 X2 X3
      = (1 - θ) * gateForm A a1 a2 a3 X1 X2 X3 + θ * gateForm B b1 b2 b3 X1 X2 X3 := by
  simp only [gateForm, Sym3.mix]
  push_cast
  ring

/-- Completion of the square over `(u, v)` with `p` fixed, real form. -/
lemma real_completion (n w1 w2 m22 m23 m33 p u v : ℝ) (h22 : 0 < m22)
    (hdet : 0 < m22 * m33 - m23 ^ 2) :
    (n - (m33 * w1 ^ 2 - 2 * m23 * w1 * w2 + m22 * w2 ^ 2) / (m22 * m33 - m23 ^ 2)) * p ^ 2
      ≤ n * p ^ 2 + 2 * w1 * p * u + 2 * w2 * p * v + m22 * u ^ 2 + 2 * m23 * u * v
        + m33 * v ^ 2 := by
  obtain ⟨d, hd⟩ : ∃ d : ℝ, d = m22 * m33 - m23 ^ 2 := ⟨_, rfl⟩
  rw [← hd]
  rw [← hd] at hdet
  have hdne : d ≠ 0 := hdet.ne'
  have key : d * m22 * ((n * p ^ 2 + 2 * w1 * p * u + 2 * w2 * p * v + m22 * u ^ 2
      + 2 * m23 * u * v + m33 * v ^ 2)
      - (n - (m33 * w1 ^ 2 - 2 * m23 * w1 * w2 + m22 * w2 ^ 2) / d) * p ^ 2)
      = d * (m22 * u + m23 * v + w1 * p) ^ 2 + (d * v + (w2 * m22 - m23 * w1) * p) ^ 2 := by
    field_simp
    rw [hd]
    ring
  have hpos : 0 < d * m22 := mul_pos hdet h22
  have h0 : 0 ≤ d * m22 * ((n * p ^ 2 + 2 * w1 * p * u + 2 * w2 * p * v + m22 * u ^ 2
      + 2 * m23 * u * v + m33 * v ^ 2)
      - (n - (m33 * w1 ^ 2 - 2 * m23 * w1 * w2 + m22 * w2 ^ 2) / d) * p ^ 2) := by
    rw [key]
    positivity
  have := (mul_nonneg_iff_of_pos_left hpos).1 h0
  linarith

/-- **The fixed-first-coordinate completion**: `G(X) ≥ gatePrice · |X₁|²`. -/
theorem gateForm_ge (N : Sym3) (g1 g2 g3 : ℚ) (hok : gateOK N = true) (X1 X2 X3 : ℂ) :
    (gatePrice N g1 g2 g3 : ℝ) * Complex.normSq X1 ≤ gateForm N g1 g2 g3 X1 X2 X3 := by
  simp only [gateOK, Bool.and_eq_true, decide_eq_true_eq] at hok
  obtain ⟨h22, hdet⟩ := hok
  have h22R : (0 : ℝ) < N.m22 := by exact_mod_cast h22
  have hdetR : (0 : ℝ) < N.m22 * N.m33 - N.m23 ^ 2 := by exact_mod_cast hdet
  have hre_part := real_completion (N.m11 + 2 * g1) (N.m12 + g2) (N.m13 + g3) N.m22 N.m23 N.m33
    X1.re X2.re X3.re h22R hdetR
  have him_part := real_completion (N.m11 + 2 * g1) (N.m12 + g2) (N.m13 + g3) N.m22 N.m23 N.m33
    X1.im X2.im X3.im h22R hdetR
  simp only [gateForm, gatePrice, hre_eq, Complex.normSq_apply]
  push_cast
  nlinarith [hre_part, him_part]

/-! ### The gate form of a row -/

end Grothe.Lower
