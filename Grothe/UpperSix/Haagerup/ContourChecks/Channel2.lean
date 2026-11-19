import Grothe.UpperSix.Haagerup.Parameters
import Grothe.UpperSix.Haagerup.SchurHardy

set_option warningAsError true

-- Agent-ID: gemini-21d5, codex-a7c4
namespace Haagerup
open HaagerupKernel.Hardy

set_option maxRecDepth 10000 in
theorem reg2_ok : regionOK (unsmoothedRData p2Q []) (regRQ 2) = true := by
  native_decide

set_option maxRecDepth 10000 in
theorem mean2_ok :
    circleMeanOK (unsmoothedRData p2Q []) (rhoQ 2) (jCertQ 2) (budgetQ 2) 16 = true := by
  native_decide

end Haagerup
