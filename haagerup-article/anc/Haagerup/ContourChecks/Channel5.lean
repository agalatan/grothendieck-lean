import Haagerup.Parameters
import HaagerupKernel.TaylorHardy

set_option warningAsError true

namespace Haagerup
open HaagerupKernel.TaylorHardy

def reg5Steps : List Nat := [1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 2]

def mean5Steps : List Nat := [
  1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
  2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2,
  2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 2, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
  4, 4, 4, 4, 4, 4, 4, 4, 4, 8, 8, 8, 8, 8, 8
]

theorem reg5_ok : regQ1SmoothedOK ctQ stQ seQ p5Q q5Q (regRQ 5) 4 reg5Steps = true := by
  decide +kernel

theorem mean5_ok :
    meanQ1SmoothedOK ctQ stQ seQ p5Q q5Q (rhoQ 5) (jCertQ 5) (budgetQ 5) 8 mean5Steps = true := by
  decide +kernel

end Haagerup
