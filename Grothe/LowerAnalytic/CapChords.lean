import Grothe.LowerAnalytic.CapChordData

/-!
# Computable chord-node checks

The chord predicates depend only on the stored rational row nodes and chord data.
Their finite verification and analytic soundness are assembled in `CapAssembly`.
-/

open Grothe.Lower

namespace Grothe.LowerAnalytic

/-- Node `k` is a chord node of the list `ch`. -/
def isChord (ch : List (ℕ × ℕ × ℕ)) (k : ℕ) : Bool := ch.any fun t => t.1 == k

/-- The check of one chord node `(k, i, j)`: `i, j` are vertex nodes, `0 ≤ rᵢ < r_k < rⱼ` and
`c_k ≥ chord(cᵢ, cⱼ)(r_k)`. -/
def chordNodeOK (ns : List (ℚ × ℚ)) (ch : List (ℕ × ℕ × ℕ)) (t : ℕ × ℕ × ℕ) : Bool :=
  let a := ns.getD t.2.1 (0, 0)
  let m := ns.getD t.1 (0, 0)
  let b := ns.getD t.2.2 (0, 0)
  decide (t.2.1 < ns.length) && decide (t.2.2 < ns.length) && !isChord ch t.2.1 &&
    !isChord ch t.2.2 && decide (0 ≤ a.1) && decide (a.1 < m.1) && decide (m.1 < b.1) &&
    decide (a.2 + (b.2 - a.2) / (b.1 - a.1) * (m.1 - a.1) ≤ m.2)

/-- The check of the chord nodes of a row. -/
def chordOK (ns : List (ℚ × ℚ)) (ch : List (ℕ × ℕ × ℕ)) : Bool := ch.all (chordNodeOK ns ch)

end Grothe.LowerAnalytic
