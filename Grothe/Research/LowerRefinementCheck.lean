-- Grothe/Research/LowerRefinementCheck.lean
import Grothe.Research.LowerRefinementData

/-! Exact reflection of the additional law bank, using the existing batch checker. -/

open Grothe.Lower Grothe.Research.LowerRefinementData

namespace Grothe.Research.LowerRefinementCheck

set_option maxRecDepth 100000 in
/-- Each new source envelope, spectral budget, majorant and radial tail passes
the existing sound Lean checker. This does not yet assert a complete cover. -/
theorem certRefinementBatches :
    refinementExtraBatches.all (checkBatch rowData) = true := by
  native_decide

end Grothe.Research.LowerRefinementCheck
