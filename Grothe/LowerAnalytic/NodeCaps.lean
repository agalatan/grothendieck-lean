import Grothe.LowerAnalytic.FibreSup

/-!
# The Gaussian node-cap interface

`NodeCaps` bounds the same certified fibre potential `rowPot` at every stored node.
The geometric cap assembly and the refined finite-cover reduction share this hypothesis.
-/

open Grothe.Lower

namespace Grothe.LowerAnalytic

noncomputable section

/-- **The node caps of the certified potentials.** Proving this proposition for the
actual Gaussian potentials is part of the remaining lower-endpoint work. -/
def NodeCaps : Prop :=
  ∀ k, k < rowData.length → ∀ m ∈ (rowData.getD k row01).nodeList, rowPot k m.1 - capPad ≤ m.2

end

end Grothe.LowerAnalytic
