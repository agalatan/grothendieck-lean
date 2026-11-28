import Grothe.Upper.Rounding.Parameters
import Grothe.Upper.Kernel.TaylorHardy

set_option warningAsError true

-- Agent-ID: gemini-21d5, codex-a7c4, gemini-1aa9
namespace Grothe.Upper
open Grothe.Upper.Kernel.TaylorHardy

def reg4Steps : List Nat := [1, 1, 2]

def mean4Steps : List Nat := [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2]

theorem reg4_ok : regQ1DiagOK r4Q (regRQ 4) 2 reg4Steps = true := by
  decide +kernel

theorem mean4_ok :
    meanQ1AntiOK r4Q (rhoQ 4) (jCertQ 4) (budgetQ 4) 4 mean4Steps = true := by
  decide +kernel

end Grothe.Upper
