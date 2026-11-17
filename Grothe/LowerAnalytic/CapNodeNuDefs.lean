import Grothe.LowerAnalytic.CapConstrDefs
import GrotheCapsKernel.CapCheckNu

/-!
# Computable node and piece checks with an identity tail

The analogues of `nodeOK` (`CapNodeDefs.lean`) and `nodeOKc` (`CapConstrDefs.lean`) for the cap
checker with a tail (`GrotheCapsKernel/CapCheckNu.lean`): the grid of the recipe (`mkGridNu`, with
table means or Gauss-point means of the cells), the enclosure of the coefficient matrix (`matINu`),
and the exact piece check at `c + capPad`.  Their soundness for the fibre potential with the tail
`ν` is in `CapNodeNu.lean`.
-/

open GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

/-- `M = diag(E, E, R, R, eps I₂)` for a given weight `eps` of the fibre form (`mMat` is
`mMatE E R ε`, `mMatE_eps`). -/
def mMatE (E : Sym3) (R : Sym2) (eps : ℚ) (i j : ℕ) : ℚ :=
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
  else if 10 ≤ i ∧ i < 12 ∧ i = j then eps
  else 0

/-- **The node check with a tail** (no constraints): the polynomial degrees fit the tables and the
piece check passes at `c + capPad` (the grid check holds for every recipe grid,
`gridOKNu_mkGridNu`). -/
def nodeOKNu (eps : ℚ) (r : Grothe.Lower.Row) (Rg : Grothe.Lower.Sym2) (nu s c : ℚ) (rec : Recipe)
    (gauss : Bool) (Nr N : ℕ) (h : ℚ) (T : Tables) : Bool :=
  let gd := mkGridNu r.ell r.beta nu rec gauss Nr N h T
  let M := matINu r.ell r.beta gd T
  polyBoundsOKNu r.ell r.beta &&
    pieceOK (loQ M) (hiQ M) (mMatE r.E Rg eps) (avOf r) s (c + Grothe.Lower.capPad)

/-- **The constrained node check with a tail** (a piece region). -/
def nodeOKcNu (eps : ℚ) (r : Grothe.Lower.Row) (Rg : Grothe.Lower.Sym2) (nu s c : ℚ) (rec : Recipe)
    (gauss : Bool) (Nr N : ℕ) (h : ℚ) (T : Tables) (cs : List Cons) : Bool :=
  let gd := mkGridNu r.ell r.beta nu rec gauss Nr N h T
  let M := matINu r.ell r.beta gd T
  polyBoundsOKNu r.ell r.beta &&
    pieceOKc (loQ M) (hiQ M) (mMatE r.E Rg eps) (avOf r) s (c + Grothe.Lower.capPad) cs

end Grothe.LowerAnalytic
