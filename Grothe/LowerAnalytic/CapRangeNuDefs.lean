import Grothe.LowerAnalytic.CapRangeDefs
import Grothe.LowerAnalytic.CapPieceRange
import Grothe.LowerAnalytic.CapNodeNuDefs

/-!
# Computable range checks for the caps with an identity tail

The predicates of the native facts of a row with a tail `nu`, for a row given by its data: the row
`r` (even block, coupling, forcing parameters and node table), its odd block `R`, its chord data
`ch`, and the weight `eps` of the fibre form.

* `rangeOKNu`: the whole-fibre nodes of the row (anchored and global nodes), each with its recipe
  and its rule of the cell means (table means or Gauss-point means);
* `pieceRangeOKNu`: the pieces of a localised node (Gauss-point means), on their grids;
* `chordOKLow`: the chord nodes.

Their soundness, for `eps = ε`, is in `CapRowsNu.lean`.  The checks take the row and the weight as
arguments, so that the facts of a certificate do not depend on how the list of rows of the
repository is assembled, and can be checked for the weight of the certificate before the rows'
weight `ε` is set to it.

Every vertex node is checked at its table cap lowered by `capLow = 10⁻¹²`: the table caps are
rounded up at `10⁻¹²` one by one, so the chord of two table caps can exceed the cap of a chord node
by less than `10⁻¹²`, while the chord of the lowered caps cannot.
-/

open GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

/-- The amount `10⁻¹²` by which the vertex nodes are checked below their table caps. -/
def capLow : ℚ := 1 / 10 ^ 12

/-- Recipes `(node, grid index, Gauss-point means?, recipe string)`, parsed. -/
def parseRecsNu (l : List (ℕ × ℕ × Bool × String)) : List (ℕ × ℕ × Bool × Recipe) :=
  l.map fun x => (x.1, x.2.1, x.2.2.1, parseRecipe x.2.2.2)

/-- The check of one whole-fibre node `i` of a row with the tail `nu`: a recipe
`(grid index, rule of the cell means, recipe)` whose node check passes on that grid at the lowered
cap. Chord nodes and the nodes of `excl` (the localised nodes) pass without a check. -/
def nodeCheckNu (eps nu : ℚ) (r : Row) (R : Sym2) (ch : List (ℕ × ℕ × ℕ))
    (recs : List (ℕ × ℕ × Bool × Recipe)) (grids : List (ℕ × ℕ × ℚ)) (Ts : List Tables)
    (excl : List ℕ) (i : ℕ) : Bool :=
  let nd := r.nodeList.getD i (0, 0)
  isChord ch i || excl.contains i ||
    match recs.lookup i with
    | some (g, gauss, rc) =>
      let G := grids.getD g (0, 0, 0)
      decide (g < grids.length) && nodeOKNu eps r R nu nd.1 (nd.2 - capLow) rc gauss G.1 G.2.1
        G.2.2 (Ts.getD g ⟨#[], #[], #[]⟩)
    | none => false

/-- **The range check with a tail** of a row: the nodes `lo ≤ i < hi`, one after the other. -/
def rangeOKNu (eps nu : ℚ) (r : Row) (R : Sym2) (ch : List (ℕ × ℕ × ℕ))
    (recs : List (ℕ × ℕ × Bool × Recipe)) (grids : List (ℕ × ℕ × ℚ)) (excl : List ℕ)
    (lo hi : ℕ) : Bool :=
  let Ts := grids.map fun G => mkTables G.1 G.2.1 G.2.2
  grids.all gridAdm &&
    (List.range' lo (hi - lo)).all fun i => nodeCheckNu eps nu r R ch recs grids Ts excl i

/-- The tables of the piece grids, each built when a piece first needs it (a module of pieces on one
grid builds one table). -/
def pieceThunks : List (Thunk Tables) :=
  pieceGrids.map fun G => Thunk.mk fun _ => mkTables G.1 G.2.1 G.2.2

/-- **The check of piece `j`** of a localised node `x = (k, i, directions, pieces)` of a row with
the tail `nu`: the constrained node check with Gauss-point means on the piece's grid, at the
lowered cap of node `i`. -/
def pieceOneOKNu (eps nu : ℚ) (r : Row) (R : Sym2) (x : ℕ × ℕ × List String × List String)
    (j : ℕ) : Bool :=
  match x.2.2.2[j]? with
  | some p =>
    let y := parsePiece (parseDirs x.2.2.1) p
    let G := pieceGrids.getD y.1 (0, 0, 0)
    let nd := r.nodeList.getD x.2.1 (0, 0)
    nodeOKcNu eps r R nu nd.1 (nd.2 - capLow) y.2.1 true G.1 G.2.1 G.2.2
      (pieceThunks.getD y.1 (Thunk.pure ⟨#[], #[], #[]⟩)).get y.2.2
  | none => false

/-- **The range check with a tail** of a localised node: the pieces `lo ≤ j < hi`, one after the
other. -/
def pieceRangeOKNu (eps nu : ℚ) (r : Row) (R : Sym2) (x : ℕ × ℕ × List String × List String)
    (lo hi : ℕ) : Bool :=
  (List.range' lo (hi - lo)).all fun j => pieceOneOKNu eps nu r R x j

/-- The check of one chord node `(k, i, j)` against the lowered caps of its vertex nodes `i, j`:
`0 ≤ rᵢ < r_k < rⱼ` and `c_k ≥ chord(cᵢ − capLow, cⱼ − capLow)(r_k)`. -/
def chordNodeOKLow (ns : List (ℚ × ℚ)) (ch : List (ℕ × ℕ × ℕ)) (t : ℕ × ℕ × ℕ) : Bool :=
  let a := ns.getD t.2.1 (0, 0)
  let m := ns.getD t.1 (0, 0)
  let b := ns.getD t.2.2 (0, 0)
  decide (t.2.1 < ns.length) && decide (t.2.2 < ns.length) && !isChord ch t.2.1 &&
    !isChord ch t.2.2 && decide (0 ≤ a.1) && decide (a.1 < m.1) && decide (m.1 < b.1) &&
    decide (a.2 + (b.2 - a.2) / (b.1 - a.1) * (m.1 - a.1) - capLow ≤ m.2)

/-- The check of the chord nodes of a row against the lowered caps. -/
def chordOKLow (ns : List (ℚ × ℚ)) (ch : List (ℕ × ℕ × ℕ)) : Bool := ch.all (chordNodeOKLow ns ch)

end Grothe.LowerAnalytic
