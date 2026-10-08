import Grothe.ListPoly
import Grothe.Haagerup
import Grothe.Upper.Data

/-!
# Interface of the upper certificate

The upper bound `K_G^ℂ < 1.404896257347` is obtained from a positive mixture of `49` rounding
kernels, each the composition of one of three Gaussian kernels with a preprocessor
`ρ(t) = t·P(t²)` of coefficient norm at most one:

* Haagerup's scalar kernel `𝔥(z) = Σₙ hₙ z|z|^{2n}` (`30` branches),
* the origin kernel `H` (`18` branches),
* the modified origin kernel `H*` (`1` branch).

This file fixes the definitions shared by

* the finite interval checker (`Checker.lean`, `Value.lean`), which proves
  `FiniteCertificate Dlo` for an explicit rational `Dlo` by sound interval arithmetic, and
* the analytic assembly (`Assembly.lean`, `Final.lean`), which derives
  `IsGrothendieckBound (M / (Dlo − T))` from `FiniteCertificate Dlo`, the analytic hypotheses
  (kernel domination, coefficient enclosures, energy bounds, Cauchy tails) and the explicit
  tail budget `T` of the two origin kernels.

Conventions:

* radial index `n` ↔ odd degree `2n+1`; a preprocessor `ρ(t) = t·P(t²)` is stored as the
  coefficient list of `P`;
* `compose c E n = Σ_{j ≤ n} c_j · [x^{n-j}] E(x)^{2j+1}` is the radial coefficient sequence of
  the composed kernel `z ↦ Σ_j c_j ρ(z)|ρ(z)|^{2j}` with `ρ(z) = z·E(|z|²)`;
* the first `cutoff = 2048` radial coefficients of every branch are retained (`col`); the
  origin kernels enter through their first `modes = 240` coefficients, enclosed by the data
  boxes, and everything else is charged to the tails.
-/

namespace Grothe

open Polynomial

namespace Upper

/-- Number of branches of the mixture. -/
abbrev branches : ℕ := 49

/-- Number of retained radial coefficients of every branch. -/
abbrev cutoff : ℕ := 2048

/-- Number of radial coefficients of the origin kernels enclosed by the data boxes. -/
abbrev modes : ℕ := 240

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

/-! ### The branches -/

/-- The preprocessor of branch `i` (coefficients of `P`). -/
def rowQ (i : Fin branches) : List ℚ := rowList.getD i []

/-- The preprocessor of branch `i` with absolute coefficients (the positive majorant). -/
def absRow (i : Fin branches) : List ℚ := (rowQ i).map fun q => |q|

/-- The weight of branch `i`. -/
def wtQ (i : Fin branches) : ℚ := wtList.getD i 0

/-- The kernel of branch `i`. -/
def tag (i : Fin branches) : Tag := tagList.getD i .scalar

/-- A length bound for the composition of a `modes`-term kernel with the preprocessor of
branch `i`: `modes + (2·modes − 1)·deg P`. -/
def fullLen (i : Fin branches) : ℕ := modes + (2 * modes - 1) * ((rowQ i).length - 1)

/-! ### Real-valued objects -/

noncomputable section

open scoped ComplexConjugate

/-- The real weight of branch `i`. -/
def wt (i : Fin branches) : ℝ := (wtQ i : ℝ)

/-- Real polynomial with rational coefficient list (Horner form). -/
def ofListQ : List ℚ → ℝ[X]
  | [] => 0
  | a :: l => C (a : ℝ) + X * ofListQ l

/-- The preprocessor polynomial `P` of branch `i` (so that `ρ(t) = t·P(t²)`). -/
def polyOf (i : Fin branches) : ℝ[X] := ofListQ (rowQ i)

/-- Radial composition: `(c ∘ E)_n = Σ_{j ≤ n} c_j · [x^{n-j}] E(x)^{2j+1}`. -/
def compose (c : ℕ → ℝ) (E : ℝ[X]) (n : ℕ) : ℝ :=
  ∑ j ∈ Finset.range (n + 1), c j * (E ^ (2 * j + 1)).coeff (n - j)

/-- The truncated coefficient sequence `Re(Aₙ conj Bₙ)` of an origin kernel, supported on
`n < modes`, built from the truncated coefficient integrals `A, B` of its two phases. -/
def headCoeff (A B : ℕ → ℂ) (n : ℕ) : ℝ :=
  if n < modes then (A n * conj (B n)).re else 0

/-- `A` lies in the boxes `[reLo, reHi] + i·[imLo, imHi]` for all `n < modes`. -/
def InBox (reLo reHi imLo imHi : List ℚ) (A : ℕ → ℂ) : Prop :=
  ∀ n < modes, ((coeffQ reLo n : ℝ) ≤ (A n).re ∧ (A n).re ≤ coeffQ reHi n) ∧
    ((coeffQ imLo n : ℝ) ≤ (A n).im ∧ (A n).im ≤ coeffQ imHi n)

/-- The coefficient column of branch `i`: the exact radial coefficients of `𝔥 ∘ ρᵢ` for the
scalar branches, and of the truncated origin kernel composed with `ρᵢ` for the origin
branches (`A, B` enclose the phases of `H`, `A', B'` those of `H*`). -/
def col (A B A' B' : ℕ → ℂ) (i : Fin branches) (n : ℕ) : ℝ :=
  match tag i with
  | .origin => compose (headCoeff A B) (polyOf i) n
  | .originStar => compose (headCoeff A' B') (polyOf i) n
  | _ => Real.pi * (sProf (rowQ i) n : ℝ)

/-- The retained mixture coefficient `Σᵢ wtᵢ · colᵢ n`. -/
def mix (A B A' B' : ℕ → ℂ) (n : ℕ) : ℝ := ∑ i, wt i * col A B A' B' i n

/-- The positive-majorant tail budget of a scalar branch:
`1 − Σ_{n < cutoff} (𝔥 ∘ |ρᵢ|)_n` (zero for the other branches). -/
def majTail (i : Fin branches) : ℝ :=
  match tag i with
  | .scalar => 1 - ∑ n ∈ Finset.range cutoff, Real.pi * (sProf (absRow i) n : ℝ)
  | _ => 0

/-- The discarded coefficients of the finite composition of an origin branch:
`Σ_{cutoff ≤ n < fullLen i} |colᵢ n|` (zero for the scalar branches). -/
def highTail (A B A' B' : ℕ → ℂ) (i : Fin branches) : ℝ :=
  match tag i with
  | .origin | .originStar => ∑ n ∈ Finset.Ico cutoff (fullLen i), |col A B A' B' i n|
  | _ => 0

/-- **The finite certificate statement.**  For all truncated coefficient sequences in the data
boxes, the retained mixture satisfies
`mix₀ − Σ_{n=1}^{cutoff−1} |mixₙ| − Σᵢ wtᵢ (majTailᵢ + highTailᵢ) ≥ Dlo`. -/
def FiniteCertificate (Dlo : ℚ) : Prop :=
  ∀ A B A' B' : ℕ → ℂ, InBox aReLo aReHi aImLo aImHi A → InBox bReLo bReHi bImLo bImHi B →
    InBox asReLo asReHi asImLo asImHi A' → InBox bsReLo bsReHi bsImLo bsImHi B' →
    (Dlo : ℝ) ≤ mix A B A' B' 0 - ∑ n ∈ Finset.Icc 1 (cutoff - 1), |mix A B A' B' n|
      - ∑ i, wt i * (majTail i + highTail A B A' B' i)

/-- Threshold for the certified finite value required by the assembly (`Assembly.lean`). -/
def DloNeeded : ℚ := 7117963574001465 / 10 ^ 16

end

end Upper

end Grothe
