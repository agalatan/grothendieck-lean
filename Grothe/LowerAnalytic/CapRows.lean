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

/-- The check of one node of the row `r` (gate `R`, chord list `ch`): a recipe
`(grid index, recipe)` whose node check passes on that grid with its tables `Ts`. -/
def nodeCheckWith (r : Row) (R : Sym2) (ch : List (ℕ × ℕ × ℕ)) (recs : List (ℕ × ℕ × Recipe))
    (grids : List (ℕ × ℕ × ℚ)) (Ts : List Tables) (excl : List ℕ) (i : ℕ) : Bool :=
  let nd := r.nodeList.getD i (0, 0)
  isChord ch i || excl.contains i ||
    match recs.lookup i with
    | some (g, rc) =>
      let G := grids.getD g (0, 0, 0)
      decide (g < grids.length) && nodeOK r R nd.1 nd.2 rc G.1 G.2.1 G.2.2
        (Ts.getD g ⟨#[], #[], #[]⟩)
    | none => false

/-- The check of node `i` of row `k`. -/
def nodeCheck (k : ℕ) (recs : List (ℕ × ℕ × Recipe)) (grids : List (ℕ × ℕ × ℚ))
    (Ts : List Tables) (excl : List ℕ) (i : ℕ) : Bool :=
  nodeCheckWith (rowData.getD k row01) (rowR k) (capChords.getD k []) recs grids Ts excl i

/-- The nodes `[0, n)` in chunks of eight consecutive indices. -/
def nodeChunks (n : ℕ) : List (List ℕ) :=
  (List.range ((n + 7) / 8)).map fun c => ((List.range 8).map (8 * c + ·)).filter (· < n)

lemma mem_nodeChunks {n i : ℕ} (hi : i < n) : ∃ c ∈ nodeChunks n, i ∈ c := by
  refine ⟨((List.range 8).map (8 * (i / 8) + ·)).filter (· < n), ?_, ?_⟩
  · exact List.mem_map.2 ⟨i / 8, List.mem_range.2 (by omega), rfl⟩
  · simp only [List.mem_filter, List.mem_map, List.mem_range, decide_eq_true_eq]
    exact ⟨⟨i % 8, Nat.mod_lt _ (by norm_num), Nat.div_add_mod i 8⟩, hi⟩

/-- **The row check**: the nodes in parallel tasks, eight at a time (one chunk is finished before
the next is spawned).  Every datum a task uses (row, gate, chords, recipes, tables) is computed
here and captured by the task, so that the objects shared between threads are the ones the
runtime marks as shared when the task is spawned. -/
@[noinline]
def rowOK (k : ℕ) (recs : List (ℕ × ℕ × Recipe)) (grids : List (ℕ × ℕ × ℚ)) (excl : List ℕ) : Bool :=
  let r := rowData.getD k row01
  let R := rowR k
  let ch := capChords.getD k []
  let Ts := grids.map fun G => mkTables G.1 G.2.1 G.2.2
  grids.all gridAdm &&
    (nodeChunks r.nodeList.length).all fun c =>
      (c.map fun i => Task.spawn fun _ => nodeCheckWith r R ch recs grids Ts excl i).all
        fun t => t.get

/-- The caps of row `k` at the nodes of `excl` (the nodes left to certify). -/
def ExclCaps (k : ℕ) (excl : List ℕ) : Prop :=
  ∀ i ∈ excl, i < (rowData.getD k row01).nodeList.length →
    rowPot k ((rowData.getD k row01).nodeList.getD i (0, 0)).1 - capPad
      ≤ ((rowData.getD k row01).nodeList.getD i (0, 0)).2

/-- **Soundness of the row check.** -/
theorem vertexCapsRow_of_rowOK {k : ℕ} {recs : List (ℕ × ℕ × Recipe)} {grids : List (ℕ × ℕ × ℚ)}
    {excl : List ℕ} (hok : rowOK k recs grids excl = true) (hex : ExclCaps k excl) :
    VertexCapsRow k := by
  simp only [rowOK, Bool.and_eq_true, List.all_map, List.all_eq_true, Function.comp] at hok
  obtain ⟨hadm, hall⟩ := hok
  intro i hi hc
  by_cases hx : i ∈ excl
  · exact hex i hx hi
  have hx' : excl.contains i = false := by simp [hx]
  obtain ⟨c, hcm, hic⟩ := mem_nodeChunks hi
  have := hall c hcm i hic
  simp only [Task.spawn, nodeCheckWith, hc, hx', Bool.false_or] at this
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
