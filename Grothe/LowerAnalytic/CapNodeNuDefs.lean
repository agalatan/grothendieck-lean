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

/-- **The node check with a tail** (no constraints): the polynomial degrees fit the tables and the
piece check passes at `c + capPad` (the grid check holds for every recipe grid,
`gridOKNu_mkGridNu`). -/
def nodeOKNu (r : Grothe.Lower.Row) (Rg : Grothe.Lower.Sym2) (nu s c : ℚ) (rec : Recipe)
    (gauss : Bool) (Nr N : ℕ) (h : ℚ) (T : Tables) : Bool :=
  let gd := mkGridNu r.ell r.beta nu rec gauss Nr N h T
  let M := matINu r.ell r.beta gd T
  polyBoundsOKNu r.ell r.beta &&
    pieceOK (loQ M) (hiQ M) (mMat r.E Rg) (avOf r) s (c + Grothe.Lower.capPad)

/-- **The constrained node check with a tail** (a piece region). -/
def nodeOKcNu (r : Grothe.Lower.Row) (Rg : Grothe.Lower.Sym2) (nu s c : ℚ) (rec : Recipe)
    (gauss : Bool) (Nr N : ℕ) (h : ℚ) (T : Tables) (cs : List Cons) : Bool :=
  let gd := mkGridNu r.ell r.beta nu rec gauss Nr N h T
  let M := matINu r.ell r.beta gd T
  polyBoundsOKNu r.ell r.beta &&
    pieceOKc (loQ M) (hiQ M) (mMat r.E Rg) (avOf r) s (c + Grothe.Lower.capPad) cs

end Grothe.LowerAnalytic
