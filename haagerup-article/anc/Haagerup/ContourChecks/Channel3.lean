/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import Haagerup.Parameters
import HaagerupKernel.TaylorHardy

/-!
# The two checks on circles for channel 3

Channel 3 of the certificate is the reflected pair with the polynomials `(−R_3, R_3)`
(Table 1 of the article). This file holds the two finite computations for the tail of this channel, both evaluated by
Lean's kernel (`decide +kernel`) with the Taylor-model checkers of `HaagerupKernel/TaylorHardy.lean` (Appendix A.6):

* `reg3_ok` (Computation 5, positivity on the outer circle): on the circle of radius `r_reg,3 = regRQ 3`,
  parametrised over the first quadrant by `σ ∈ [0, 1]`, the matrices `I ± Re Γ_3(t)` are positive definite;
* `mean3_ok` (Computation 6, circle mean): on the circle of radius `ϱ_3 = rhoQ 3` the pair `(Γ_3(t), β_3)` is
  admissible and the mean of the reciprocal of the Schur denominator is at most `B_3 = budgetQ 3`.

The lists `reg3Steps` and `mean3Steps` are the partitions of `[0, 1]` into dyadic intervals on which the Taylor
models are evaluated: the entries are the lengths of the consecutive intervals in units of `2⁻ᵏ` (`k = 4` and
`k = 6`), and the checkers verify that the lengths add up to `2ᵏ`. What the two Boolean facts imply is proved in
`Haagerup/TaylorHardySound.lean`; they are used in `Haagerup/CertCheck.lean`.
-/

set_option warningAsError true

namespace Haagerup
open HaagerupKernel.TaylorHardy

/-- The partition of `[0, 1]` for the positivity check of channel 3: interval lengths in units of `2⁻⁴`. -/
def reg3Steps : List Nat := [1, 1, 2, 4, 8]

/-- The partition of `[0, 1]` for the circle-mean check of channel 3: interval lengths in units of `2⁻⁶`. -/
def mean3Steps : List Nat := [1, 1, 2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 8, 8, 8, 8]

/-- Computation 5 for channel 3: the positivity check on the circle of radius `regRQ 3` succeeds. -/
theorem reg3_ok : regQ1DiagOK r3Q (regRQ 3) 4 reg3Steps = true := by
  decide +kernel

/-- Computation 6 for channel 3: the circle-mean check on the circle of radius `rhoQ 3` succeeds. -/
theorem mean3_ok :
    meanQ1AntiOK r3Q (rhoQ 3) (jCertQ 3) (budgetQ 3) 6 mean3Steps = true := by
  decide +kernel

end Haagerup
