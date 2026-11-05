import Grothe.UpperQuad.Facts.Common

/-!
# Native fact: the even bidegrees of the head

`evenFact`: `energyTable` vanishes at the bidegrees `(n, m)` of the head `n + 3m ≤ 501` with `n + m`
even (where the energy of a charge-one vector is `0`), so the even part of the ℓ¹ comparison is `0`.
Consumed by `hclose_of_blockFacts` with `evenNum = 0`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad.Facts

theorem evenCheck : evenFact = true := by native_decide

end Grothe.UpperQuad.Facts
