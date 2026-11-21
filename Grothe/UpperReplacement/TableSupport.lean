import Grothe.Upper.Data
import Lean.Elab.Tactic.Decide

/-!
# Support of the shared GT energy table

Agent-ID: codex-a7c4. Every stored bidegree lies in the finite head used by
the mixture comparison. The computation reads the table independently of any
choice of preprocessor, slope or residual.
-/

namespace Grothe.UpperReplacement.GTComparison

set_option maxRecDepth 10000 in
theorem table_within : GrotheKernel.tabWithin 501 Upper.energyRows = true := by
  native_decide

end Grothe.UpperReplacement.GTComparison
