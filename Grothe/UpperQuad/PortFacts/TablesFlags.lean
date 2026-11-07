import Grothe.UpperQuad.PortFacts.Common

/-!
# The table-level flags of the twisted loop

The kernel checks its validity flags per node (`twistValid`), but not those of the per-process
tables: the positivity of `λ_j` and `√λ_j`, of `√n` for `n < D' + 2`, and of the enclosures
`√(c! d!)` by which `normalise` divides.  `tablesFlags` is that `Bool`; the facts
`j<j>TablesValid` (`J<j>Tables.lean`, one `native_decide` each) evaluate it for the three powers.
Its body is the soundness layer's `twistTablesValid` (`Grothe/UpperQuad/TwistNodeSound.lean` on
`claude-b9ee/port-sound`), so the two agree by `rfl`.

Kept apart from `Common.lean` so that the range facts do not depend on it.

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad.PortFacts

open GrotheQuad

/-- The table-level validity flags of the power with parameters `prm`. -/
def tablesFlags (P : ℕ) (prm : TwistParams) (tabs : TwistTables) : Bool :=
  isPos (lamI P prm.j) && isPos (sqrtI P (lamI P prm.j)) &&
    (List.range (twistDin prm + 2)).all (fun n => isPos (sqrtNatI P (n + 1))) &&
    (List.range (prm.Dout + 1)).all (fun c =>
      (List.range (prm.Dout + 1 - c)).all fun d => isPos (ivGet tabs.sqf c d))

end Grothe.UpperQuad.PortFacts
