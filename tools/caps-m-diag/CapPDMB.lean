import Grothe.LowerAnalytic.CapPieceNodes
import Grothe.LowerAnalytic.CapPDDataB
open GrotheKernel Grothe.Lower Grothe.LowerAnalytic

/-- Float elimination of indices 1..12 of a 13×13 matrix: (Schur complement at (0,0), smallest pivot of the
cap-free block). The cap enters only entry (0,0), so the check passes iff minPivot ≥ 0 and schur ≥ 0, and the
missing cap is max(0, −schur). -/
def schurF (m : QMat) : Float × Float := Id.run do
  let mut a : Array (Array Float) := (Array.range 13).map fun i => (Array.range 13).map fun j => ratF (m.at i j)
  let mut mp : Float := 1e300
  for k in [1:13] do
    let p := (a[k]!)[k]!
    if p < mp then mp := p
    for i in [0:13] do
      if i != k then
        let f := (a[i]!)[k]! / p
        for j in [0:13] do
          if j != k then
            a := a.set! i ((a[i]!).set! j ((a[i]!)[j]! - f * (a[k]!)[j]!))
  return ((a[0]!)[0]!, mp)

def scaleCons (a : ℚ) (cs : List Cons) : List Cons := cs.map fun c => ⟨c.v, c.lo, c.hi, a * c.lam, a * c.mu⟩

def runPDM : IO Unit := do
  let tabs := pieceGrids.map fun G => mkTables G.1 G.2.1 G.2.2
  for (k, i, dsS, pcs) in pdiagNodesB do
    let ds := parseDirs dsS
    let r := rowData.getD k row01
    let nd := r.nodeList.getD i (0, 0)
    let P := pcs.map (parsePiece ds)
    let Rg := rowR k
    let mut j := 0
    for x in P do
      if j < 21 then
        let g := x.1
        let G := pieceGrids.getD g (0, 0, 0)
        let T := tabs.getD g (mkTables 1 1 1)
        let gd := mkGrid r.ell r.beta x.2.1 G.1 G.2.1 G.2.2 T
        let M := matI r.ell r.beta gd T
        let lo := loQ M
        let up := hiQ M
        let Tup := loewnerUp lo up 13
        let c0 := nd.2 + capPad
        let sc := fun (a : ℚ) => schurF (pieceNc (mMat r.E Rg) (avOf r) nd.1 c0 Tup (scaleCons a x.2.2))
        let (s1, p1) := sc 1
        let alts := [(1/4 : ℚ), 1/2, 2, 4].map fun a => let (s, p) := sc a; s!"x{a.toFloat}:{s},{p}"
        let cstr := x.2.2.map fun c => s!"[{c.lo.toFloat},{(c.hi.getD 999).toFloat}]"
        IO.println s!"M {k}:{i} piece {j} grid {g} enc={enclOK lo up 13} schur={s1} minpiv={p1} need={if s1 < 0 then -s1 else 0} lamscale {alts} cons={cstr}"
      j := j + 1

#eval runPDM
