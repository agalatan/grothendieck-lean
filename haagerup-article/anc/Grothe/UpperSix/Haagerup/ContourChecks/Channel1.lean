import Grothe.UpperSix.Haagerup.Parameters
import Grothe.UpperSix.HaagerupKernel.TaylorHardy

set_option warningAsError true

-- Agent-ID: gemini-21d5, codex-a7c4, gemini-1aa9
namespace Haagerup
open HaagerupKernel.TaylorHardy

def reg1Steps : List Nat := [1, 1, 2, 4, 4, 4, 4, 4, 8]

def mean1Steps : List Nat := [
  1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, 4, 4, 4, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 32, 16,
  16, 16, 16, 16, 16, 16, 16, 16, 16, 8, 8, 8, 8, 8, 8, 8, 8, 4, 4, 8, 4, 4,
  8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 16, 16, 16, 16, 16, 16, 16, 32, 32, 32, 32,
  32, 32, 32
]

theorem reg1_ok : regQ1SmoothedOK ctQ stQ seQ p1Q q1Q (regRQ 1) 5 reg1Steps = true := by
  decide +kernel

theorem mean1_ok :
    meanQ1SmoothedOK ctQ stQ seQ p1Q q1Q (rhoQ 1) (jCertQ 1) (budgetQ 1) 10 mean1Steps = true := by
  decide +kernel

end Haagerup
