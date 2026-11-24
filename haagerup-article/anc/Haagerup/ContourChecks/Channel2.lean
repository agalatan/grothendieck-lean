import Haagerup.Parameters
import HaagerupKernel.TaylorHardy

set_option warningAsError true

-- Agent-ID: gemini-21d5, codex-a7c4, gemini-1aa9
namespace Haagerup
open HaagerupKernel.TaylorHardy

def reg2Steps : List Nat := [2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 4]

def mean2Steps : List Nat := [
  4, 4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1,
  1, 1, 1, 2, 2, 2, 4, 4
]

theorem reg2_ok : regQ1DiagOK p2Q (regRQ 2) 5 reg2Steps = true := by
  decide +kernel

theorem mean2_ok :
    meanQ1PhaseOK p2Q (rhoQ 2) (jCertQ 2) (budgetQ 2) 6 mean2Steps = true := by
  decide +kernel

end Haagerup
