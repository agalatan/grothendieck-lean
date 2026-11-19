import Grothe.UpperSix.Haagerup.Parameters
import Grothe.UpperSix.Haagerup.SchurHardy

set_option warningAsError true

-- Agent-ID: gemini-21d5, codex-a7c4
namespace Haagerup
open HaagerupKernel.Hardy

set_option maxRecDepth 10000 in
theorem reg0_ok : regionOK (smoothedRData ctQ stQ seQ p0Q q0Q) (regRQ 0) = true := by
  native_decide

set_option maxRecDepth 10000 in
theorem mean0_ok :
    circleMeanOK (smoothedRData ctQ stQ seQ p0Q q0Q) (rhoQ 0) (jCertQ 0) (budgetQ 0) 16 = true := by
  native_decide

end Haagerup
