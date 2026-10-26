import Grothe.LowerAnalytic.CapPieceNodes
import Grothe.LowerAnalytic.CapPDVData
open GrotheKernel Grothe.Lower Grothe.LowerAnalytic

/-- Lean re-check of the SDP multiplier fixes (tools/caps_lmi.py): `nodeOKc` with the new λ, μ and cap
stored cap + capUp (capPad is added inside `nodeOKc`). -/
def runPDV : IO Unit := do
  let tabs := pieceGrids.map fun G => mkTables G.1 G.2.1 G.2.2
  for (i, j, dsS, ps, capS) in pdvPieces do
    let ds := parseDirs dsS
    let r := rowData.getD 14 row01
    let nd := r.nodeList.getD i (0, 0)
    let x := parsePiece ds ps
    let G := pieceGrids.getD x.1 (0, 0, 0)
    let T := tabs.getD x.1 (mkTables 1 1 1)
    let b := nodeOKc r (rowR 14) nd.1 (nd.2 + parseRat capS) x.2.1 G.1 G.2.1 G.2.2 T x.2.2
    IO.println s!"V 14:{i} piece {j} grid {x.1} capUp={capS} pieceOKc={b}"
    (← IO.getStdout).flush

#eval runPDV
