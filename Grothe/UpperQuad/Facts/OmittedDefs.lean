import Grothe.UpperQuad.Facts.Common
import GrotheQuadExtKernel.Omitted

/-!
# The omitted-pair check, computation only

The definitions the native fact `omittedCheck` (`Grothe/UpperQuad/Facts/Omitted.lean`) evaluates.
They live apart from `Facts/Budget.lean` so that the fact's import closure, which is hashed into the
caps digest (`scripts/caps_stamp.py`, `QUAD_TOPS`), contains the computation only, like the grade-block
facts, and not the soundness layer: an edit to a lower-bound proof must leave the verified caps cache
valid.

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.Facts

open GrotheQuad Grothe.UpperQuad

/-- The bound of the omitted-pair check at scale `2^256`: `10⁶³ / 2²⁵⁶ ≈ 8.6·10⁻¹⁵` (the measured sum
over the 10,322 nodes with a cutoff is `≈ 10⁻²⁰`). -/
def omittedBoundNum : ℤ := 10 ^ 63

/-- The omitted-pair fact: `Σ_a √(Z_a m̄_a) ≤ omittedBoundNum / 2²⁵⁶` over the committed partition. -/
def omittedFact : Bool := omittedOK P0 piI profile partitionSpecs omittedBoundNum

end Grothe.UpperQuad.Facts
