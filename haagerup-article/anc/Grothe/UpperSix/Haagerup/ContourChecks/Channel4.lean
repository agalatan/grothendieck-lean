import Grothe.UpperSix.Haagerup.Parameters
import Grothe.UpperSix.Haagerup.SchurHardy

set_option warningAsError true

-- Agent-ID: gemini-21d5, codex-a7c4
namespace Haagerup
open HaagerupKernel.Hardy

set_option maxRecDepth 10000 in
theorem reg4_ok : regionOK (unsmoothedRData (r4Q.map (- ·)) r4Q) (regRQ 4) = true := by
  native_decide

set_option maxRecDepth 10000 in
theorem mean4_ok :
    circleMeanOK (unsmoothedRData (r4Q.map (- ·)) r4Q) (rhoQ 4) (jCertQ 4) (budgetQ 4) 12 = true := by
  native_decide

end Haagerup
