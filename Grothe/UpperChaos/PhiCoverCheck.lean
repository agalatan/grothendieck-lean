import GrotheKernel.PhiCheck
import Grothe.UpperChaos.PhiCoverData
import Grothe.Upper.Data

/-!
# The finite phase-cover computation

`phi_cover_check`: the precompiled checker accepts the bisection tree `phiTree` for the phase
polynomial of `Data.lean` (12,084 checked leaves, about 1.5 min).
-/

namespace Grothe.UpperChaos

/-- **The phase cover** (one `native_decide`). -/
theorem phi_cover_check : GrotheKernel.phiCoverOK Grothe.Upper.phaseStrs phiTree = true := by
  native_decide

end Grothe.UpperChaos
