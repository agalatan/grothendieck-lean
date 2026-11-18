import Grothe.UpperSix.Haagerup.Parameters
import Grothe.UpperSix.Haagerup.SchurHardy

set_option warningAsError true

-- Agent-ID: gemini-21d5, codex-a7c4
namespace Haagerup
open HaagerupKernel.Hardy

set_option maxRecDepth 10000 in
theorem reg5_ok : regionOK (smoothedRData ctQ stQ seQ p5Q q5Q) (regRQ 5) = true := by
  native_decide

set_option maxRecDepth 10000 in
theorem mean5_ok :
    circleMeanOK (smoothedRData ctQ stQ seQ p5Q q5Q) (rhoQ 5) (jCertQ 5) (budgetQ 5) 16 = true := by
  native_decide

end Haagerup
