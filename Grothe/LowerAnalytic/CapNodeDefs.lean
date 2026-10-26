import Grothe.Lower.RowDataTypes
import Grothe.LowerAnalytic.CapPieceDefs
import GrotheCapsKernel.CapCheck

/-!
# Computable row-node cap checks

The rational gate matrix, row coupling vector and node predicate depend only on
row data and the precompiled checker. Their Gaussian soundness remains in
`CapCoord`, `CapPiece` and `CapGridOK`.
-/

open GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

/-- `M = diag(E, E, R, R, ε I₂)` in the coordinates `Fib.vec`. -/
def mMat (E : Sym3) (R : Sym2) (i j : ℕ) : ℚ :=
  let e : ℕ → ℕ → ℚ := fun a b =>
    match a, b with
    | 0, 0 => E.m11 | 0, 1 => E.m12 | 0, 2 => E.m13
    | 1, 0 => E.m12 | 1, 1 => E.m22 | 1, 2 => E.m23
    | 2, 0 => E.m13 | 2, 1 => E.m23 | 2, 2 => E.m33
    | _, _ => 0
  let r : ℕ → ℕ → ℚ := fun a b =>
    match a, b with
    | 0, 0 => R.m11 | 0, 1 => R.m12 | 1, 0 => R.m12 | 1, 1 => R.m22
    | _, _ => 0
  if i < 3 ∧ j < 3 then e i j
  else if 3 ≤ i ∧ i < 6 ∧ 3 ≤ j ∧ j < 6 then e (i - 3) (j - 3)
  else if 6 ≤ i ∧ i < 8 ∧ 6 ≤ j ∧ j < 8 then r (i - 6) (j - 6)
  else if 8 ≤ i ∧ i < 10 ∧ 8 ≤ j ∧ j < 10 then r (i - 8) (j - 8)
  else if 10 ≤ i ∧ i < 12 ∧ i = j then ε
  else 0

/-- The coupling vector `a = (1 + b₁, b₂, b₃, 0, …)` of a row. -/
def avOf (r : Grothe.Lower.Row) (j : ℕ) : ℚ :=
  if j = 0 then 1 + r.b1 else if j = 1 then r.b2 else if j = 2 then r.b3 else 0

/-- **The node check**: the polynomial degrees fit the tables and the piece check passes at
`c + capPad` (the grid check holds for every recipe grid, `gridOK_mkGrid`). -/
def nodeOK (r : Grothe.Lower.Row) (Rg : Grothe.Lower.Sym2) (s c : ℚ) (rec : Recipe) (Nr N : ℕ)
    (h : ℚ) (T : Tables) : Bool :=
  let gd := mkGrid r.ell r.beta rec Nr N h T
  let M := matI r.ell r.beta gd T
  polyBoundsOK r.ell r.beta &&
    pieceOK (loQ M) (hiQ M) (mMat r.E Rg) (avOf r) s (c + Grothe.Lower.capPad)

end Grothe.LowerAnalytic
