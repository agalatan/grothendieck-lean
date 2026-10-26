import Grothe.Lower.RowGateData
import Grothe.LowerAnalytic.CapChords
import Grothe.LowerAnalytic.CapNodeDefs
import Grothe.LowerAnalytic.CapTablesData

/-!
# Computable range checks for the vertex-node caps

The heavy native facts need only these predicates, rational data and the
precompiled checker. `CapRows` proves their soundness for the fibre potentials.
-/

open GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

/-- A grid `(Nr, N, h)` is admissible for the tables. -/
def gridAdm (G : ℕ × ℕ × ℚ) : Bool :=
  decide (0 < G.2.2) && decide (1 ≤ (G.1 : ℚ) * G.2.2) && decide ((G.1 : ℚ) * G.2.2 ≤ 8) &&
    decide (4 ≤ G.2.1) && decide (G.2.1 ≤ 4096)

/-- The check of one node of a row: a recipe `(grid index, recipe)` whose node check passes on that
grid with its tables `Ts`. -/
def nodeCheck (k : ℕ) (recs : List (ℕ × ℕ × Recipe)) (grids : List (ℕ × ℕ × ℚ))
    (Ts : List Tables) (excl : List ℕ) (i : ℕ) : Bool :=
  let r := rowData.getD k row01
  let nd := r.nodeList.getD i (0, 0)
  isChord (capChords.getD k []) i || excl.contains i ||
    match recs.lookup i with
    | some (g, rc) =>
      let G := grids.getD g (0, 0, 0)
      decide (g < grids.length) && nodeOK r (rowR k) nd.1 nd.2 rc G.1 G.2.1 G.2.2
        (Ts.getD g ⟨#[], #[], #[]⟩)
    | none => false

/-- **The range check** of row `k`: the nodes `lo ≤ i < hi`, one after the other (no parallel
tasks; the ranges of a row are separate `native_decide` facts in separate modules). -/
def rangeOK (k : ℕ) (recs : List (ℕ × ℕ × Recipe)) (grids : List (ℕ × ℕ × ℚ)) (excl : List ℕ)
    (lo hi : ℕ) : Bool :=
  let Ts := grids.map fun G => mkTables G.1 G.2.1 G.2.2
  grids.all gridAdm && (List.range' lo (hi - lo)).all fun i => nodeCheck k recs grids Ts excl i

end Grothe.LowerAnalytic
