/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import Haagerup.Parameters
import HaagerupKernel.TaylorHardy

/-!
# The two checks on circles for channel 5

Channel 5 of the certificate is the smoothed cell map with the polynomials `(P_5, Q_5)`
(Table 1 of the article). This file holds the two finite computations for the tail of this channel, both evaluated by
Lean's kernel (`decide +kernel`) with the Taylor-model checkers of `HaagerupKernel/TaylorHardy.lean` (Appendix A.6):

* `reg5_ok` (Computation 5, positivity on the outer circle): on the circle of radius `r_reg,5 = regRQ 5`,
  parametrised over the first quadrant by `σ ∈ [0, 1]`, the matrices `I ± Re Γ_5(t)` are positive definite;
* `mean5_ok` (Computation 6, circle mean): on the circle of radius `ϱ_5 = rhoQ 5` the pair `(Γ_5(t), β_5)` is
  admissible and the mean of the reciprocal of the Schur denominator is at most `B_5 = budgetQ 5`.

The lists `reg5Steps` and `mean5Steps` are the partitions of `[0, 1]` into dyadic intervals on which the Taylor
models are evaluated: the entries are the lengths of the consecutive intervals in units of `2⁻ᵏ` (`k = 4` and
`k = 8`), and the checkers verify that the lengths add up to `2ᵏ`. What the two Boolean facts imply is proved in
`Haagerup/TaylorHardySound.lean`; they are used in `Haagerup/CertCheck.lean`.
-/

set_option warningAsError true

namespace Haagerup
open HaagerupKernel.TaylorHardy

/-- The partition of `[0, 1]` for the positivity check of channel 5: interval lengths in units of `2⁻⁴`. -/
def reg5Steps : List Nat := [1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 2]

/-- The partition of `[0, 1]` for the circle-mean check of channel 5: interval lengths in units of `2⁻⁸`. -/
def mean5Steps : List Nat := [
  1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
  2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2,
  2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 2, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
  4, 4, 4, 4, 4, 4, 4, 4, 4, 8, 8, 8, 8, 8, 8
]

/-- Computation 5 for channel 5: the positivity check on the circle of radius `regRQ 5` succeeds. -/
theorem reg5_ok : regQ1SmoothedOK ctQ stQ seQ p5Q q5Q (regRQ 5) 4 reg5Steps = true := by
  decide +kernel

/-- Computation 6 for channel 5: the circle-mean check on the circle of radius `rhoQ 5` succeeds. -/
theorem mean5_ok :
    meanQ1SmoothedOK ctQ stQ seQ p5Q q5Q (rhoQ 5) (jCertQ 5) (budgetQ 5) 8 mean5Steps = true := by
  decide +kernel

end Haagerup
