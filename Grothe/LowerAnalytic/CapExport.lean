import Grothe.LowerAnalytic.CapPieceRange

/-!
# Export of the piece matrices (tooling for the S-lemma multiplier search)

Not part of any certificate. For a piece of a piece node, `pieceExportJson` computes, with the same functions as
the checker (`mkGrid`, `matI`, `loQ`, `hiQ`, `loewnerUp`, `pieceN`, `Cons.sMat`), the exact rational data of
the constrained check `pieceOKc`:

* `N`: the unconstrained matrix `pieceN` at the stored cap `c + capPad`;
* for every constraint `c`: `A = sMat` with `(λ, μ) = (1, 0)` and `B = sMat` with `(λ, μ) = (0, 1)`, so that the
  checked matrix is `N − Σ_c (λ_c A_c + μ_c B_c)` (`pieceNc` is linear in the multipliers);
* the stored multipliers, `hi` (none for a halfspace) and the enclosure check.

A multiplier search then works on these 13 × 13 matrices alone (`tools/caps_lmi.py`), instead of recomputing the
grid and the enclosures (minutes per piece) for every trial. Its proposals are certified only by the checker.
-/

open GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

/-- A rational as `"p/q"`. -/
def qStr (q : ℚ) : String := s!"\"{q.num}/{q.den}\""

/-- A 13 × 13 rational matrix as a JSON array of rows. -/
def qmatJson (m : ℕ → ℕ → ℚ) : String :=
  "[" ++ ",".intercalate ((List.range 13).map fun i =>
    "[" ++ ",".intercalate ((List.range 13).map fun j => qStr (m i j)) ++ "]") ++ "]"

/-- The JSON line of piece `j` of a piece node, on grid `gOv` if given, else on its stored grid (the override is for
planning the campaign: which grid suffices; the certificate always uses the grid stored with the piece). -/
def pieceExportJsonOn (Ts : List Tables) (x : ℕ × ℕ × List String × List String) (j : ℕ) (gOv : Option ℕ) :
    String :=
  let k := x.1
  let i := x.2.1
  let ds := parseDirs x.2.2.1
  let p := parsePiece ds (x.2.2.2.getD j "")
  let g := gOv.getD p.1
  let G := pieceGrids.getD g (0, 0, 0)
  let T := Ts.getD g ⟨#[], #[], #[]⟩
  let r := rowData.getD k row01
  let nd := r.nodeList.getD i (0, 0)
  let Mq := mMat r.E (rowR k)
  let gd := mkGrid r.ell r.beta p.2.1 G.1 G.2.1 G.2.2 T
  let M := matI r.ell r.beta gd T
  let lo := loQ M
  let up := hiQ M
  let cap := nd.2 + capPad
  let N := pieceN Mq (avOf r) nd.1 cap (loewnerUp lo up 13)
  let consJson := p.2.2.map fun c =>
    let c1 : Cons := ⟨c.v, c.lo, c.hi, 1, 0⟩
    let c2 : Cons := ⟨c.v, c.lo, c.hi, 0, 1⟩
    "{\"lo\":" ++ qStr c.lo ++ ",\"hi\":" ++ (match c.hi with | some h => qStr h | none => "null") ++
      ",\"lam\":" ++ qStr c.lam ++ ",\"mu\":" ++ qStr c.mu ++
      ",\"A\":" ++ qmatJson (c1.sMat Mq) ++ ",\"B\":" ++ qmatJson (c2.sMat Mq) ++ "}"
  "{\"k\":" ++ toString k ++ ",\"i\":" ++ toString i ++ ",\"j\":" ++ toString j ++ ",\"grid\":" ++ toString g ++
    ",\"s\":" ++ qStr nd.1 ++ ",\"cap\":" ++ qStr nd.2 ++ ",\"capPad\":" ++ qStr capPad ++
    ",\"polyOK\":" ++ toString (polyBoundsOK r.ell r.beta) ++ ",\"encl\":" ++ toString (enclOK lo up 13) ++
    ",\"ok\":" ++ toString (pieceOKc lo up Mq (avOf r) nd.1 cap p.2.2) ++
    ",\"N\":" ++ qmatJson N.at ++ ",\"cons\":[" ++ ",".intercalate consJson ++ "]}"

/-- The JSON line of piece `j` of a piece node, on its stored grid. -/
def pieceExportJson (Ts : List Tables) (x : ℕ × ℕ × List String × List String) (j : ℕ) : String :=
  pieceExportJsonOn Ts x j none

/-- Write the JSON lines of the pieces `js` of a node, all on grid `g`, to `path` (planning tool). -/
def exportPiecesOn (path : String) (x : ℕ × ℕ × List String × List String) (js : List ℕ) (g : ℕ) : IO Unit := do
  let h ← IO.FS.Handle.mk path .append
  let G := pieceGrids.getD g (0, 0, 0)
  let T := mkTables G.1 G.2.1 G.2.2
  let Ts := (List.range pieceGrids.length).map fun g' => if g' == g then T else mkTables 1 1 1
  for j in js do
    h.putStrLn (pieceExportJsonOn Ts x j (some g))
    h.flush

/-- Write the JSON lines of the pieces `js` of a node to `path` (one line per piece, flushed as it goes; the
tables of a grid are built only if a piece uses it). -/
def exportPieces (path : String) (x : ℕ × ℕ × List String × List String) (js : List ℕ) : IO Unit := do
  let h ← IO.FS.Handle.mk path .append
  let ds := parseDirs x.2.2.1
  let used := js.map fun j => (parsePiece ds (x.2.2.2.getD j "")).1
  let Ts := (List.range pieceGrids.length).map fun g =>
    if used.contains g then let G := pieceGrids.getD g (0, 0, 0); mkTables G.1 G.2.1 G.2.2
    else mkTables 1 1 1
  for j in js do
    h.putStrLn (pieceExportJson Ts x j)
    h.flush

end Grothe.LowerAnalytic
