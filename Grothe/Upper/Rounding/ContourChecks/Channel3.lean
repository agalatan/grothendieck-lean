import Grothe.Upper.Rounding.Parameters
import Grothe.Upper.Kernel.TaylorHardy

set_option warningAsError true

-- Agent-ID: gemini-21d5, codex-a7c4, gemini-1aa9
namespace Grothe.Upper
open Grothe.Upper.Kernel.TaylorHardy

def reg3Steps : List Nat := [1, 1, 2, 4, 8]

def mean3Steps : List Nat := [1, 1, 2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 8, 8, 8, 8]

theorem reg3_ok : regQ1DiagOK r3Q (regRQ 3) 4 reg3Steps = true := by
  decide +kernel

theorem mean3_ok :
    meanQ1AntiOK r3Q (rhoQ 3) (jCertQ 3) (budgetQ 3) 6 mean3Steps = true := by
  decide +kernel

end Grothe.Upper
