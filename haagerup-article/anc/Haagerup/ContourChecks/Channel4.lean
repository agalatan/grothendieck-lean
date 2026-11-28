/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import Haagerup.Parameters
import HaagerupKernel.TaylorHardy

/-!
# The two checks on circles for channel 4

Channel 4 of the certificate is the reflected pair with the polynomials `(−R_4, R_4)`
(Table 1 of the article). This file holds the two finite computations for the tail of this channel, both evaluated by
Lean's kernel (`decide +kernel`) with the Taylor-model checkers of `HaagerupKernel/TaylorHardy.lean` (Appendix A.6):

* `reg4_ok` (Computation 5, positivity on the outer circle): on the circle of radius `r_reg,4 = regRQ 4`,
  parametrised over the first quadrant by `σ ∈ [0, 1]`, the matrices `I ± Re Γ_4(t)` are positive definite;
* `mean4_ok` (Computation 6, circle mean): on the circle of radius `ϱ_4 = rhoQ 4` the pair `(Γ_4(t), β_4)` is
  admissible and the mean of the reciprocal of the Schur denominator is at most `B_4 = budgetQ 4`.

The lists `reg4Steps` and `mean4Steps` are the partitions of `[0, 1]` into dyadic intervals on which the Taylor
models are evaluated: the entries are the lengths of the consecutive intervals in units of `2⁻ᵏ` (`k = 2` and
`k = 4`), and the checkers verify that the lengths add up to `2ᵏ`. What the two Boolean facts imply is proved in
`Haagerup/TaylorHardySound.lean`; they are used in `Haagerup/CertCheck.lean`.
-/

set_option warningAsError true

namespace Haagerup
open HaagerupKernel.TaylorHardy

/-- The partition of `[0, 1]` for the positivity check of channel 4: interval lengths in units of `2⁻²`. -/
def reg4Steps : List Nat := [1, 1, 2]

/-- The partition of `[0, 1]` for the circle-mean check of channel 4: interval lengths in units of `2⁻⁴`. -/
def mean4Steps : List Nat := [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2]

/-- Computation 5 for channel 4: the positivity check on the circle of radius `regRQ 4` succeeds. -/
theorem reg4_ok : regQ1DiagOK r4Q (regRQ 4) 2 reg4Steps = true := by
  decide +kernel

/-- Computation 6 for channel 4: the circle-mean check on the circle of radius `rhoQ 4` succeeds. -/
theorem mean4_ok :
    meanQ1AntiOK r4Q (rhoQ 4) (jCertQ 4) (budgetQ 4) 4 mean4Steps = true := by
  decide +kernel

end Haagerup
