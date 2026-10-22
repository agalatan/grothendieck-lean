import Grothe.LowerAnalytic.CapHull
import Grothe.LowerAnalytic.CapTablesMk
import Grothe.LowerAnalytic.CapGridOK

/-!
# The vertex caps of whole rows from the node checker

`rowOK k recs Nr N h`: every vertex node of row `k` has a recipe in `recs` whose node check
`nodeOK` passes on the uniform grid `(Nr, N, h)` with the shared tables `mkTables Nr N h`
(the nodes are checked in parallel tasks).  `vertexCapsRow_of_rowOK`: then the vertex caps of
the row hold (`VertexCapsRow k`).  `VertexCaps` is `∀ k < 19, VertexCapsRow k`.
-/

open MeasureTheory Real Set Finset GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

/-- The vertex caps of row `k`. -/
def VertexCapsRow (k : ℕ) : Prop :=
  ∀ i, i < (rowData.getD k row01).nodeList.length →
    isChord (capChords.getD k []) i = false →
      rowPot k ((rowData.getD k row01).nodeList.getD i (0, 0)).1 - capPad
        ≤ ((rowData.getD k row01).nodeList.getD i (0, 0)).2

lemma vertexCaps_iff : VertexCaps ↔ ∀ k, k < rowData.length → VertexCapsRow k := Iff.rfl

/-- A grid `(Nr, N, h)` is admissible for the tables. -/
def gridAdm (G : ℕ × ℕ × ℚ) : Bool :=
  decide (0 < G.2.2) && decide (1 ≤ (G.1 : ℚ) * G.2.2) && decide ((G.1 : ℚ) * G.2.2 ≤ 8) &&
    decide (4 ≤ G.2.1) && decide (G.2.1 ≤ 4096)

/-- The check of one node of a row: a recipe `(grid index, recipe)` whose node check passes on that
grid with its tables `Ts`. -/
def nodeCheck (k : ℕ) (recs : List (ℕ × ℕ × Recipe)) (grids : List (ℕ × ℕ × ℚ))
    (Ts : List Tables) (i : ℕ) : Bool :=
  let r := rowData.getD k row01
  let nd := r.nodeList.getD i (0, 0)
  isChord (capChords.getD k []) i ||
    match recs.lookup i with
    | some (g, rc) =>
      let G := grids.getD g (0, 0, 0)
      decide (g < grids.length) && nodeOK r (rowR k) nd.1 nd.2 rc G.1 G.2.1 G.2.2
        (Ts.getD g ⟨#[], #[], #[]⟩)
    | none => false

/-- **The row check** (parallel over the nodes). -/
def rowOK (k : ℕ) (recs : List (ℕ × ℕ × Recipe)) (grids : List (ℕ × ℕ × ℚ)) : Bool :=
  let Ts := grids.map fun G => mkTables G.1 G.2.1 G.2.2
  grids.all gridAdm &&
    (((List.range (rowData.getD k row01).nodeList.length).map fun i =>
      Task.spawn fun _ => nodeCheck k recs grids Ts i).all fun t => t.get)

/-- **Soundness of the row check.** -/
theorem vertexCapsRow_of_rowOK {k : ℕ} {recs : List (ℕ × ℕ × Recipe)} {grids : List (ℕ × ℕ × ℚ)}
    (hok : rowOK k recs grids = true) : VertexCapsRow k := by
  simp only [rowOK, Bool.and_eq_true, List.all_map, List.all_eq_true,
    List.mem_range, Function.comp] at hok
  obtain ⟨hadm, hall⟩ := hok
  intro i hi hc
  have := hall i hi
  simp only [Task.spawn, nodeCheck, hc, Bool.false_or] at this
  revert this
  cases hl : recs.lookup i with
  | none => simp
  | some x =>
    obtain ⟨g, rc⟩ := x
    simp only [Bool.and_eq_true, decide_eq_true_eq]
    rintro ⟨hg, hchk⟩
    have e1 : grids.getD g (0, 0, 0) = grids[g] := List.getD_eq_getElem _ _ hg
    have e2 : (List.map (fun G => mkTables G.1 G.2.1 G.2.2) grids).getD g ⟨#[], #[], #[]⟩
        = mkTables grids[g].1 grids[g].2.1 grids[g].2.2 := by
      rw [List.getD_eq_getElem _ _ (by simpa using hg), List.getElem_map]
    rw [e1, e2] at hchk
    have hG := hadm _ (List.getElem_mem hg)
    simp only [gridAdm, Bool.and_eq_true, decide_eq_true_eq] at hG
    obtain ⟨⟨⟨⟨hh, h1⟩, h8⟩, hN⟩, hN'⟩ := hG
    have hNr : 0 < grids[g].1 := by
      by_contra h0
      have : grids[g].1 = 0 := by omega
      rw [this] at h1; norm_num at h1
    exact pot_le_of_nodeOK _ _ _ _ rc _ _ _ _ (tablesOK_mk hh h1 h8 hN hN') hh (by omega) hNr hchk

end Grothe.LowerAnalytic
