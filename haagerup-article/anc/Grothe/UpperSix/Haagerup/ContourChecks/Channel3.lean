import Grothe.UpperSix.Haagerup.Parameters
import Grothe.UpperSix.Haagerup.SchurHardy

set_option warningAsError true

-- Agent-ID: gemini-21d5, codex-a7c4
namespace Haagerup
open HaagerupKernel.Hardy

set_option maxRecDepth 10000 in
theorem reg3_ok : regionOK (unsmoothedRData (r3Q.map (- ·)) r3Q) (regRQ 3) = true := by
  native_decide

set_option maxRecDepth 10000 in
theorem mean3_ok :
    circleMeanOK (unsmoothedRData (r3Q.map (- ·)) r3Q) (rhoQ 3) (jCertQ 3) (budgetQ 3) 12 = true := by
  native_decide

end Haagerup
