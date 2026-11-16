import Grothe.LowerAnalytic.CapRangeDefs
import Grothe.LowerAnalytic.CapPieceRange
import Grothe.LowerAnalytic.CapNodeNuDefs

/-!
# Computable range checks for the caps with an identity tail

The predicates of the native facts of the rows with a tail `ν`: the whole-fibre nodes of a row
(`rangeOKNu`: anchored and global nodes, each with its rule of the cell means), the pieces of a
localised node (`pieceRangeOKNu`, with Gauss-point means), and the chord nodes (`chordOKLow`).
Their soundness for the fibre potentials with the tail is in `CapRowsNu.lean`.

Every vertex node is checked at its table cap lowered by `capLow = 10⁻¹²`: the table caps are
rounded up at `10⁻¹²` one by one, so the chord of two table caps can exceed the cap of a chord node
by less than `10⁻¹²`, while the chord of the lowered caps cannot.
-/

open GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

/-- The amount `10⁻¹²` by which the vertex nodes are checked below their table caps. -/
def capLow : ℚ := 1 / 10 ^ 12

/-- The check of one whole-fibre node of row `k` with the tail `nu`: a recipe
`(grid index, rule of the cell means, recipe)` whose node check passes on that grid at the lowered
cap. -/
def nodeCheckNu (nu : ℚ) (k : ℕ) (recs : List (ℕ × ℕ × Bool × Recipe)) (grids : List (ℕ × ℕ × ℚ))
    (Ts : List Tables) (excl : List ℕ) (i : ℕ) : Bool :=
  let r := rowData.getD k row01
  let nd := r.nodeList.getD i (0, 0)
  isChord (capChords.getD k []) i || excl.contains i ||
    match recs.lookup i with
    | some (g, gauss, rc) =>
      let G := grids.getD g (0, 0, 0)
      decide (g < grids.length) && nodeOKNu r (rowR k) nu nd.1 (nd.2 - capLow) rc gauss G.1 G.2.1
        G.2.2 (Ts.getD g ⟨#[], #[], #[]⟩)
    | none => false

/-- **The range check with a tail** of row `k`: the nodes `lo ≤ i < hi`, one after the other. -/
def rangeOKNu (nu : ℚ) (k : ℕ) (recs : List (ℕ × ℕ × Bool × Recipe)) (grids : List (ℕ × ℕ × ℚ))
    (excl : List ℕ) (lo hi : ℕ) : Bool :=
  let Ts := grids.map fun G => mkTables G.1 G.2.1 G.2.2
  grids.all gridAdm && (List.range' lo (hi - lo)).all fun i => nodeCheckNu nu k recs grids Ts excl i

/-- The tables of the piece grids, each built when a piece first needs it (a module of pieces on one
grid builds one table). -/
def pieceThunks : List (Thunk Tables) :=
  pieceGrids.map fun G => Thunk.mk fun _ => mkTables G.1 G.2.1 G.2.2

/-- **The check of piece `j`** of a piece node with the tail `nu`: the constrained node check with
Gauss-point means on the piece's grid, at the lowered cap. -/
def pieceOneOKNu (nu : ℚ) (x : ℕ × ℕ × List String × List String) (j : ℕ) : Bool :=
  match x.2.2.2[j]? with
  | some p =>
    let y := parsePiece (parseDirs x.2.2.1) p
    let G := pieceGrids.getD y.1 (0, 0, 0)
    let r := rowData.getD x.1 row01
    let nd := r.nodeList.getD x.2.1 (0, 0)
    nodeOKcNu r (rowR x.1) nu nd.1 (nd.2 - capLow) y.2.1 true G.1 G.2.1 G.2.2
      (pieceThunks.getD y.1 (Thunk.pure ⟨#[], #[], #[]⟩)).get y.2.2
  | none => false

/-- **The range check with a tail** of a piece node: the pieces `lo ≤ j < hi`, one after the
other. -/
def pieceRangeOKNu (nu : ℚ) (x : ℕ × ℕ × List String × List String) (lo hi : ℕ) : Bool :=
  (List.range' lo (hi - lo)).all fun j => pieceOneOKNu nu x j

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
