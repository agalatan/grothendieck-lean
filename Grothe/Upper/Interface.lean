import Grothe.ListPoly
import Grothe.Haagerup

/-!
# Interface of the upper certificate

The upper bound is obtained from a positive mixture of valid rounding kernels:

* Haagerup's phase kernel `𝔥(z) = Σₙ hₙ z|z|^{2n}` composed with polynomial preprocessors
  `ρ(t) = t·P(t²)` of coefficient norm at most one;
* two-coordinate roundings `phase(Z·p(|Z|²) + W·q(|Z|²))`, where `Z` is a Gaussian coordinate
  with correlation `ρ(t)` and `W` an independent one with correlation `σ(t)` (a cubic-chaos
  coordinate when `σ(t) = −t³`); their kernels are `Σ_{n,m} μ[n,m] ρ(t)^n σ(t)^m` with `μ` the
  chaos-mass table of the rounding (`TwoCoordinate.lean`, `Spec.lean`).

This file fixes the exact rational objects shared by the interval checker and the analytic
assembly.  Conventions:

* radial index `n` ↔ odd degree `2n+1`; a preprocessor `ρ(t) = t·P(t²)` is stored as the
  coefficient list of `P`;
* `compose c E n = Σ_{j ≤ n} c_j · [x^{n-j}] E(x)^{2j+1}` is the radial coefficient sequence of
  the composed kernel `z ↦ Σ_j c_j ρ(z)|ρ(z)|^{2j}` with `ρ(z) = z·E(|z|²)`;
* at least `cutoff = 2048` radial coefficients of every branch are retained.
-/

namespace Grothe

open Polynomial

namespace Upper

/-- Number of retained radial coefficients of every branch. -/
abbrev cutoff : ℕ := 2048

/-! ### Computable exact rational polynomial arithmetic -/

/-- Pointwise addition of rational coefficient lists (zero-padded). -/
def addLQ : List ℚ → List ℚ → List ℚ
  | [], m => m
  | l, [] => l
  | a :: l, b :: m => (a + b) :: addLQ l m

/-- Convolution (polynomial product) of rational coefficient lists. -/
def convQ : List ℚ → List ℚ → List ℚ
  | [], _ => []
  | a :: l, m => addLQ (m.map (a * ·)) (0 :: convQ l m)

/-- `listPowQ l n` is the coefficient list of the `n`-th power. -/
def listPowQ (l : List ℚ) : ℕ → List ℚ
  | 0 => [1]
  | n + 1 => convQ l (listPowQ l n)

/-- Coefficient extraction (zero outside the list). -/
def coeffQ (l : List ℚ) (n : ℕ) : ℚ := l.getD n 0

/-- `h_j / π` as an exact rational: `hRat 0 = 1/4`, `hRat (j+1) = hRat j · (2j+1)²/(4(j+1)(j+2))`. -/
def hRat : ℕ → ℚ
  | 0 => 1 / 4
  | j + 1 => hRat j * ((2 * (j : ℚ) + 1) ^ 2) / (4 * ((j : ℚ) + 1) * ((j : ℚ) + 2))

lemma hRat_nonneg (n : ℕ) : 0 ≤ hRat n := by
  induction n with
  | zero => simp [hRat]
  | succ n ih =>
    rw [hRat]
    exact div_nonneg (mul_nonneg ih (sq_nonneg _)) (by positivity)

/-- Exact scalar profile: the radial coefficient `n` of `𝔥 ∘ ρ`, divided by `π`, for
`ρ(t) = t·P(t²)` with `P` given by `row`:  `Σ_{j ≤ n} (h_j/π) · [x^{n-j}] P(x)^{2j+1}`. -/
def sProf (row : List ℚ) (n : ℕ) : ℚ :=
  ∑ j ∈ Finset.range (n + 1), hRat j * coeffQ (listPowQ row (2 * j + 1)) (n - j)

/-! ### Real-valued objects -/

noncomputable section

open scoped ComplexConjugate

/-- Real polynomial with rational coefficient list (Horner form). -/
def ofListQ : List ℚ → ℝ[X]
  | [] => 0
  | a :: l => C (a : ℝ) + X * ofListQ l

/-- Radial composition: `(c ∘ E)_n = Σ_{j ≤ n} c_j · [x^{n-j}] E(x)^{2j+1}`. -/
def compose (c : ℕ → ℝ) (E : ℝ[X]) (n : ℕ) : ℝ :=
  ∑ j ∈ Finset.range (n + 1), c j * (E ^ (2 * j + 1)).coeff (n - j)

end

end Upper

end Grothe
