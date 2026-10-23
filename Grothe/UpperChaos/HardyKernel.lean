import Grothe.UpperChaos.Rounder

/-!
# Holomorphic continuation of the rounding kernel (step 1 of the `hardy` plan, definitions)

For a complex symmetric 2×2 matrix `R = [[r₀₀, r₀₁], [r₀₁, r₁₁]]` the holomorphic Gaussian kernel on
pairs of real 2-vectors is

    k_R(x, y) = (2π)^{-2} det(I − R²)^{-1/2} exp(−xᵀAx/2 − yᵀAy/2 + xᵀCy),
    A = (I − R²)^{-1},  C = R A.

Two copies (real and imaginary parts) give the circular complex kernel, whose prefactor is
`(2π)^{-4} det(I − R²)^{-1}` — no square-root branch.  `Hhol R` is the correlation of the rounding
`Tround` under this kernel; the cross covariance of the certificate is `Rt t = M diag(p(t), −τ(t)) M`.

This file only fixes the definitions (`sym2`, `det2`, `inv2`, `Rt`, `kExp`, `Hhol`) and the
elementary algebra; see `docs/UPPER_STATUS.md` §3 for the remaining steps.
-/

open Complex
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- A complex symmetric 2×2 matrix `[[a, b], [b, c]]`. -/
structure Sym2C where
  a : ℂ
  b : ℂ
  c : ℂ

namespace Sym2C

/-- The (symmetric) product `R²`... as a general 2×2 matrix `[[e, f], [g, h]]` row-major. -/
def sq (R : Sym2C) : ℂ × ℂ × ℂ × ℂ :=
  (R.a * R.a + R.b * R.b, R.a * R.b + R.b * R.c, R.b * R.a + R.c * R.b, R.b * R.b + R.c * R.c)

/-- `det(I − R²)`. -/
def detIm (R : Sym2C) : ℂ :=
  let s := R.sq
  (1 - s.1) * (1 - s.2.2.2) - s.2.1 * s.2.2.1

lemma sq_symm (R : Sym2C) : R.sq.2.1 = R.sq.2.2.1 := by simp [sq]; ring

/-- `A = (I − R²)^{-1}` (symmetric), entries `(a, b, c)`. -/
def Amat (R : Sym2C) : Sym2C :=
  let s := R.sq
  ⟨(1 - s.2.2.2) / R.detIm, s.2.1 / R.detIm, (1 - s.1) / R.detIm⟩

/-- `C = R A` (symmetric, since `R` and `A` commute). -/
def Cmat (R : Sym2C) : Sym2C :=
  let A := R.Amat
  ⟨R.a * A.a + R.b * A.b, R.a * A.b + R.b * A.c, R.b * A.b + R.c * A.c⟩

/-- The quadratic form `xᵀ S y` of a symmetric matrix on real 2-vectors. -/
def form (S : Sym2C) (x y : ℝ × ℝ) : ℂ :=
  S.a * x.1 * y.1 + S.b * (x.1 * y.2 + x.2 * y.1) + S.c * x.2 * y.2

end Sym2C

/-- The exponent `−xᵀAx/2 − yᵀAy/2 + xᵀCy` of the holomorphic kernel. -/
def kExp (R : Sym2C) (x y : ℝ × ℝ) : ℂ :=
  -(R.Amat.form x x) / 2 - R.Amat.form y y / 2 + R.Cmat.form x y

/-- The circular complex kernel on `(ℂ² × ℂ²)` written in real coordinates
`z = x + iξ`, `w = y + iη` (prefactor `(2π)^{-4} det(I − R²)^{-1}`). -/
def kHol (R : Sym2C) (x ξ y η : ℝ × ℝ) : ℂ :=
  (((2 * Real.pi) ^ 4 : ℝ) : ℂ)⁻¹ * R.detIm⁻¹ * Complex.exp (kExp R x y + kExp R ξ η)

/-- `(x, ξ) ↦ (x₁ + iξ₁, x₂ + iξ₂)`, real-normalised: each real coordinate has variance 1, so the
complex coordinate is `(x + iξ)/√2` in the `gaussC` normalisation. -/
def toC2 (x ξ : ℝ × ℝ) : ℂ × ℂ :=
  (((x.1 : ℂ) + ξ.1 * I) / ((√2 : ℝ) : ℂ), ((x.2 : ℂ) + ξ.2 * I) / ((√2 : ℝ) : ℂ))

/-- **The holomorphic correlation** `H(R) = ∫ conj T(z) T(w) k_R` (Lebesgue measure on `ℝ⁸`). -/
def Hhol (R : Sym2C) : ℂ :=
  ∫ q : ((ℝ × ℝ) × (ℝ × ℝ)) × ((ℝ × ℝ) × (ℝ × ℝ)),
    conj (Tround (toC2 q.1.1 q.1.2)) * Tround (toC2 q.2.1 q.2.2) * kHol R q.1.1 q.1.2 q.2.1 q.2.2

/-- The cross covariance of the certificate at `t`: `M diag(p(t), −τ(t)) M` with
`p(t) = t P(t²)` (`primaryPoly`), `−τ(t) = t Q(t²)` (`auxPoly`). -/
def Rt (t : ℂ) : Sym2C :=
  let p : ℂ := t * (Polynomial.aeval (t ^ 2) Grothe.Upper.primaryPoly)
  let q : ℂ := t * (Polynomial.aeval (t ^ 2) Grothe.Upper.auxPoly)
  ⟨(m00 : ℂ) ^ 2 * p + (m01 : ℂ) ^ 2 * q, (m00 : ℂ) * m01 * p + (m01 : ℂ) * m11 * q,
    (m01 : ℂ) ^ 2 * p + (m11 : ℂ) ^ 2 * q⟩

end

end Grothe.UpperChaos
