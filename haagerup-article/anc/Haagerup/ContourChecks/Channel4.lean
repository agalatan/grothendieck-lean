import Haagerup.Parameters
import HaagerupKernel.TaylorHardy

set_option warningAsError true

namespace Haagerup
open HaagerupKernel.TaylorHardy

def reg4Steps : List Nat := [1, 1, 2]

def mean4Steps : List Nat := [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2]

theorem reg4_ok : regQ1DiagOK r4Q (regRQ 4) 2 reg4Steps = true := by
  decide +kernel

theorem mean4_ok :
    meanQ1AntiOK r4Q (rhoQ 4) (jCertQ 4) (budgetQ 4) 4 mean4Steps = true := by
  decide +kernel

end Haagerup
