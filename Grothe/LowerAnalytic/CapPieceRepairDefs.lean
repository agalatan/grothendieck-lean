import Grothe.LowerAnalytic.CapPieceRange

/-! Computable checks binding a multiplier repair to the original piece region.
Agent-ID: codex-2ca4. No analytic proof module is imported by the numerical check. -/

namespace Grothe.LowerAnalytic

/-- The geometric data of a constraint, independent of its certificate multipliers. -/
def Cons.regionData (c : Cons) : List ℚ × ℚ × Option ℚ := (c.v, c.lo, c.hi)

/-- The parsed region of one piece, retaining failure of an out-of-range index. -/
def pieceRegionData (x : ℕ × ℕ × List String × List String) (j : ℕ) :
    Option (List (List ℚ × ℚ × Option ℚ)) :=
  (((pieceList [] (parseDirs x.2.2.1) x.2.2.2).map fun y => y.2.2.2)[j]?).map
    (List.map Cons.regionData)

/-- Check the repaired grid, unchanged region, and actual Gaussian piece bound together. -/
def pieceRepairOK (source repair : ℕ × ℕ × List String × List String)
    (sourceIndex repairIndex : ℕ) : Bool :=
  repair.2.2.2.all (fun p =>
    decide ((parsePiece (parseDirs repair.2.2.1) p).1 < pieceGrids.length)) &&
  decide (pieceRegionData source sourceIndex = pieceRegionData repair repairIndex) &&
  pieceOneOK pieceTables repair repairIndex

end Grothe.LowerAnalytic
