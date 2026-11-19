import Grothe.Lower.RowDataTypes

/-!
# Chord nodes

`isChord ch k`: node `k` is a chord node of the chord list `ch` (used by the chord check `chordOKLow`,
`CapRangeNuDefs.lean`).
-/

open Grothe.Lower

namespace Grothe.LowerAnalytic

/-- Node `k` is a chord node of the list `ch`. -/
def isChord (ch : List (ℕ × ℕ × ℕ)) (k : ℕ) : Bool := ch.any fun t => t.1 == k

end Grothe.LowerAnalytic
