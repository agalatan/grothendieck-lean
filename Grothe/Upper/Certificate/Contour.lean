import Grothe.Upper.Certificate.Parameters
import Grothe.Upper.Rounding.SchurHardy

set_option warningAsError true

/-!
# Disk positivity and circle budget for the changed first channel

Agent-ID: codex-a7c4
-/

namespace Grothe.Upper.Channels

open Grothe.Upper.Kernel.Hardy

set_option maxRecDepth 10000 in
theorem region_ok : regionOK (smoothedRData ctQ stQ seQ firstPolynomial q0Q) (regRQ 0) = true := by
  native_decide

set_option maxRecDepth 10000 in
theorem mean_ok :
    circleMeanOK (smoothedRData ctQ stQ seQ firstPolynomial q0Q) (rhoQ 0) (jCertQ 0) (circleBudget 0) 16 = true := by
  native_decide

end Grothe.Upper.Channels
