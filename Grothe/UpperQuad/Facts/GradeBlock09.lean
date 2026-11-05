import Grothe.UpperQuad.Facts.Common

/-!
# Native fact: the grade block `9` of the quadrature checker (`[228, 237)`)

`blockFact 9 epsBlock bndBlock`: the profile flags, the node loop of the committed partition
restricted to the grades `[228, 237)` and the two checks of the block (the ℓ¹ excursion of its head
energies from `energyTable` is at most `epsBlock / 2^256`, the squared widths of its grade matrices
sum to at most `bndBlock / 2^256`).  One `native_decide`, one process (`docs/QUAD_CHECKER.md` §11.4);
consumed by `hclose_of_blockFacts`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad.Facts

theorem gradeBlock09 : blockFact 9 epsBlock bndBlock = true := by native_decide

end Grothe.UpperQuad.Facts
