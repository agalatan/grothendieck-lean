import Grothe.UpperQuad.Facts.Budget

/-!
# Native fact: the omitted pairs of the cutoffs (part (C) of `hQuad`)

`omittedFact`: over the committed partition, the kernel's per-node bounds `√(Z_a m̄_a)` of the pairs
beyond each node's cutoff (`GrotheQuadKernel/Omitted.lean`; `Z_a` from the node factors, `m̄_a` the
Bessel deficit of the retained coefficients and their reflections) sum to at most
`omittedBoundNum / 2²⁵⁶ ≈ 8.6·10⁻¹⁵` (measured: `≈ 10⁻²⁰`).  Only the 10,322 nodes with a cutoff
below `501` cost anything (≈ 1 s each at `P = 512`).  One `native_decide`, one process; consumed by
`omitted_l2_of_fact` (`Grothe/UpperQuad/Facts/Budget.lean`).

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad.Facts

theorem omittedCheck : omittedFact = true := by native_decide

end Grothe.UpperQuad.Facts
