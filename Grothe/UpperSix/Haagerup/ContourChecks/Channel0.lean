import Grothe.UpperSix.Haagerup.Parameters
import Grothe.UpperSix.HaagerupKernel.TaylorHardy

set_option warningAsError true

-- Agent-ID: gemini-21d5, codex-a7c4, gemini-1aa9
namespace Haagerup
open HaagerupKernel.TaylorHardy

def reg0Steps : List Nat := [1, 1, 2, 4, 8, 8, 8, 8, 8, 16]

def mean0Steps : List Nat := [
  1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, 8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32,
  32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 16, 16, 16,
  16, 16, 16, 16, 16, 8, 8, 8, 8, 8, 8, 16, 16, 16, 16, 16, 16, 16, 16, 16,
  16, 16, 32, 32, 32, 32, 32, 32, 32, 64, 64, 64, 64, 64, 64, 64
]

theorem reg0_ok : regQ1SmoothedOK ctQ stQ seQ p0Q q0Q (regRQ 0) 6 reg0Steps = true := by
  decide +kernel

theorem mean0_ok :
    meanQ1SmoothedOK ctQ stQ seQ p0Q q0Q (rhoQ 0) (jCertQ 0) (budgetQ 0) 11 mean0Steps = true := by
  decide +kernel

end Haagerup
