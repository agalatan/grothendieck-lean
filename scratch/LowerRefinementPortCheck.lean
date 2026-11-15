-- scratch/LowerRefinementPortCheck.lean
import Grothe.Research.RefinedCoverData
import Grothe.Lower.BoxLookup

/-! Diagnostic export for exact cross-language comparison of the original boxes.
`indexedBoxBound_eq` proves that the indexed decoder returns `boxBound` exactly.
This adds no theorem or trusted numerical input to the lower-bound proof. -/

open Grothe.Lower Grothe.Research.RefinedCoverData

def main : IO Unit := do
  for (source, i) in refinedBoxes.zipIdx do
    match indexedBoxBound rowData refinedBatches (parseBox source) with
    | none => throw (IO.userError s!"original box {i} was rejected")
    | some q => IO.println s!"{i} {q.num}/{q.den}"
