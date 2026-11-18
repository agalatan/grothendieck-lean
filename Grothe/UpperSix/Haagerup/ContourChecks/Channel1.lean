import Grothe.UpperSix.Haagerup.Parameters
import Grothe.UpperSix.Haagerup.SchurHardy

set_option warningAsError true

-- Agent-ID: gemini-21d5, codex-a7c4
namespace Haagerup
open HaagerupKernel.Hardy

set_option maxRecDepth 10000 in
theorem reg1_ok : regionOK (smoothedRData ctQ stQ seQ p1Q q1Q) (regRQ 1) = true := by
  native_decide

set_option maxRecDepth 10000 in
theorem mean1_ok :
    circleMeanOK (smoothedRData ctQ stQ seQ p1Q q1Q) (rhoQ 1) (jCertQ 1) (budgetQ 1) 16 = true := by
  native_decide

end Haagerup
