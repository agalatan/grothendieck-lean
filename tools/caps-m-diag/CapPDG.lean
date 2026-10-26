import Grothe.LowerAnalytic.CapPieceNodes
import Grothe.LowerAnalytic.CapPDDataC
open GrotheKernel Grothe.Lower Grothe.LowerAnalytic

/-- scale λ, μ of the centre constraints (lo < 0, two-sided) by `a`. -/
def scaleCentre (a : ℚ) (cs : List Cons) : List Cons :=
  cs.map fun c => if c.lo < 0 ∧ c.hi.isSome then ⟨c.v, c.lo, c.hi, a * c.lam, a * c.mu⟩ else c

def scales : List ℚ := [1, 21/20, 11/10, 6/5, 13/10, 3/2, 7/4, 2]
def deltas : List ℚ := [0, 1/10^11, 1/10^10, 1/10^9, 3/10^9, 1/10^8, 3/10^8, 1/10^7, 3/10^7, 1/10^6, 3/10^6]

def runE : IO Unit := do
  let gs : List ℕ := [1]
  let tabs := (List.range 3).map fun g => if gs.contains g then
      let G := pieceGrids.getD g (0, 0, 0); mkTables G.1 G.2.1 G.2.2 else mkTables 1 1 1
  for (k, i, dsS, pcs) in pdiagNodesC do
    let ds := parseDirs dsS
    let r := rowData.getD k row01
    let nd := r.nodeList.getD i (0, 0)
    let P := pcs.map (parsePiece ds)
    let Rg := rowR k
    let mut j := 0
    for x in P do
      if ([0,1,2,5,6,31,32,36,98,99,103,104,129] : List ℕ).contains j then
        let g := x.1
        let G := pieceGrids.getD g (0, 0, 0)
        let T := tabs.getD g (mkTables 1 1 1)
        let gd := mkGrid r.ell r.beta x.2.1 G.1 G.2.1 G.2.2 T
        let M := matI r.ell r.beta gd T
        let lo := loQ M
        let up := hiQ M
        let Tup := loewnerUp lo up 13
        let c0 := nd.2 + capPad
        let chk := fun (cs : List Cons) (cap : ℚ) =>
          enclOK lo up 13 && cs.all Cons.ok && ldlOK (pieceNc (mMat r.E Rg) (avOf r) nd.1 cap Tup cs) 13
        let mut res : List String := []
        let mut best : Option (ℚ × ℚ) := none
        for a in scales do
          let cs := scaleCentre a x.2.2
          match deltas.find? fun d => chk cs (c0 + d) with
          | some d =>
              res := res ++ [s!"{a.toFloat}:{d.toFloat}"]
              match best with
              | none => best := some (a, d)
              | some (_, d0) => if d < d0 then best := some (a, d)
          | none => res := res ++ [s!"{a.toFloat}:none"]
        IO.println s!"E {k}:{i} piece {j} grid {g} best={best.map fun p => (p.1.toFloat, p.2.toFloat)} all={res}"
        (← IO.getStdout).flush
      j := j + 1

#eval runE
