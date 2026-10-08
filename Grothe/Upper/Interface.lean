import Grothe.ListPoly
import Grothe.Haagerup
import Grothe.Upper.Data

/-!
# Interface of the upper certificate

The upper bound `K_G^ℂ < 1.404898357808` is obtained from six Gaussian rounding kernels
`K₁, …, K₆` (five scalar preprocessors `ρᵢ(t) = t·Pᵢ(t²)` composed with Haagerup's phase kernel,
and the origin-layer kernel `K₆`), mixed with the positive weights `wt`, and composed with the
common preprocessor `η(t) = t·E(t²)`.  This file fixes the shared definitions between

* the finite interval checker (`Checker.lean`, `Value.lean`), which proves
  `FiniteCertificate Dlo` for an explicit rational `Dlo` by sound interval arithmetic, and
* the analytic assembly (`Assembly.lean`, `Final.lean`), which derives
  `IsGrothendieckBound (M / (Dlo − ε − T))` from `FiniteCertificate Dlo` and the explicit
  analytic hypotheses (kernel domination, coefficient enclosures, energy bounds, Cauchy tails).

Conventions:

* radial index `n` ↔ odd degree `2n+1`; a preprocessor `ρ(t) = t·P(t²)` is stored as the
  coefficient list of `P`;
* `modes = 480` radial coefficients of the mixture are retained.  For `n < modes` the retained
  coefficient is `c_n = π · Σ_{i<5} wtᵢ · sProf (row i) n + wt₅ · Re(A_n conj(B_n))`, where
  `A_n, B_n` are the truncated radial coefficient integrals of the two origin phases (enclosed
  by the data boxes);
* `compose c E n = Σ_{j ≤ n} c_j · [x^{n-j}] E(x)^{2j+1}` is the radial coefficient sequence of
  `∑_j c_j η(t)^{2j+1}`.
-/

namespace Grothe

open Polynomial

namespace Upper

/-- Number of retained radial modes. -/
abbrev modes : ℕ := 480

/-- Largest radial index of the composition `Σ_{j<modes} c_j η^{2j+1}` with `deg E = 119`:
`(modes − 1) + (2·modes − 1)·119 = 114600`. -/
abbrev maxIndex : ℕ := 114600

lemma maxIndex_eq : maxIndex = (modes - 1) + (2 * modes - 1) * 119 := by decide

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

/-- Exact scalar profile: the radial coefficient `n` of `𝔥 ∘ ρ^phys`, divided by `π`, for
`ρ(t) = t·P(t²)` with `P` given by `row`:  `Σ_{j ≤ n} (h_j/π) · [x^{n-j}] P(x)^{2j+1}`. -/
def sProf (row : List ℚ) (n : ℕ) : ℚ :=
  ∑ j ∈ Finset.range (n + 1), hRat j * coeffQ (listPowQ row (2 * j + 1)) (n - j)

/-- The five scalar preprocessors in positive orientation. -/
def rowQ : Fin 5 → List ℚ := ![row1, row2, row3, row4, row5]

/-! ### Real-valued objects -/

noncomputable section

/-- The six mixture weights. -/
def wt : Fin 6 → ℝ :=
  ![0.983543458398378100, 0.012416654023174663, 0.003031585753026536,
    0.000593628184609741, 0.000016934659448514, 0.000397738981362458]

theorem wt_pos (i : Fin 6) : 0 < wt i := by
  fin_cases i <;> simp [wt] <;> norm_num

/-- The mass `M = Σ wtᵢ`. -/
theorem wt_mass : ∑ i, wt i = 1.000000000000000012 := by
  simp [wt, Fin.sum_univ_succ]; norm_num

/-- Real polynomial with rational coefficient list (Horner form). -/
def ofListQ : List ℚ → ℝ[X]
  | [] => 0
  | a :: l => C (a : ℝ) + X * ofListQ l

/-- The common preprocessor polynomial `E` (so that `η(t) = t·E(t²)`). -/
def etaPoly : ℝ[X] := ofListQ etaCoeffs

/-- Radial composition: `(c ∘ E)_n = Σ_{j ≤ n} c_j · [x^{n-j}] E(x)^{2j+1}`. -/
def compose (c : ℕ → ℝ) (E : ℝ[X]) (n : ℕ) : ℝ :=
  ∑ j ∈ Finset.range (n + 1), c j * (E ^ (2 * j + 1)).coeff (n - j)

/-- The retained (boxed) mixture coefficients, supported on `n < modes`, built from the exact
scalar profiles and the truncated origin coefficients `A B`. -/
def boxedCoeff (A B : ℕ → ℂ) (n : ℕ) : ℝ :=
  if n < modes then
    Real.pi * (∑ i : Fin 5, wt (Fin.castLE (by norm_num) i) * (sProf (rowQ i) n : ℝ))
      + wt 5 * (A n * (starRingEnd ℂ) (B n)).re
  else 0

/-- `A` lies in the left boxes for all `n < modes`. -/
def InBoxA (A : ℕ → ℂ) : Prop :=
  ∀ n < modes, ((coeffQ aReLo n : ℝ) ≤ (A n).re ∧ (A n).re ≤ coeffQ aReHi n) ∧
    ((coeffQ aImLo n : ℝ) ≤ (A n).im ∧ (A n).im ≤ coeffQ aImHi n)

/-- `B` lies in the right boxes for all `n < modes`. -/
def InBoxB (B : ℕ → ℂ) : Prop :=
  ∀ n < modes, ((coeffQ bReLo n : ℝ) ≤ (B n).re ∧ (B n).re ≤ coeffQ bReHi n) ∧
    ((coeffQ bImLo n : ℝ) ≤ (B n).im ∧ (B n).im ≤ coeffQ bImHi n)

/-- **The finite certificate statement.**  For every pair of truncated coefficient sequences in
the data boxes, the composed retained mixture `P = boxedCoeff A B ∘ E` (all `maxIndex + 1` radial
coefficients) satisfies `P_0 - Σ_{n=1}^{maxIndex} |P_n| ≥ Dlo`. -/
def FiniteCertificate (Dlo : ℚ) : Prop :=
  ∀ A B : ℕ → ℂ, InBoxA A → InBoxB B →
    (Dlo : ℝ) ≤ compose (boxedCoeff A B) etaPoly 0
      - ∑ n ∈ Finset.Icc 1 maxIndex, |compose (boxedCoeff A B) etaPoly n|

/-- Threshold for the certified finite value required by the assembly (`Assembly.lean`). -/
def DloNeeded : ℚ := 71179527215609909 / 10 ^ 17

end

end Upper

end Grothe
