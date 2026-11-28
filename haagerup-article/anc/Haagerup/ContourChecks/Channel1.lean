/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import Haagerup.Parameters
import HaagerupKernel.TaylorHardy

/-!
# The two checks on circles for channel 1

Channel 1 of the certificate is the smoothed cell map with the polynomials `(P_1, Q_1)`
(Table 1 of the article). This file holds the two finite computations for the tail of this channel, both evaluated by
Lean's kernel (`decide +kernel`) with the Taylor-model checkers of `HaagerupKernel/TaylorHardy.lean` (Appendix A.6):

* `reg1_ok` (Computation 5, positivity on the outer circle): on the circle of radius `r_reg,1 = regRQ 1`,
  parametrised over the first quadrant by `σ ∈ [0, 1]`, the matrices `I ± Re Γ_1(t)` are positive definite;
* `mean1_ok` (Computation 6, circle mean): on the circle of radius `ϱ_1 = rhoQ 1` the pair `(Γ_1(t), β_1)` is
  admissible and the mean of the reciprocal of the Schur denominator is at most `B_1 = budgetQ 1`.

The lists `reg1Steps` and `mean1Steps` are the partitions of `[0, 1]` into dyadic intervals on which the Taylor
models are evaluated: the entries are the lengths of the consecutive intervals in units of `2⁻ᵏ` (`k = 5` and
`k = 10`), and the checkers verify that the lengths add up to `2ᵏ`. What the two Boolean facts imply is proved in
`Haagerup/TaylorHardySound.lean`; they are used in `Haagerup/CertCheck.lean`.
-/

set_option warningAsError true

namespace Haagerup
open HaagerupKernel.TaylorHardy

/-- The partition of `[0, 1]` for the positivity check of channel 1: interval lengths in units of `2⁻⁵`. -/
def reg1Steps : List Nat := [1, 1, 2, 4, 4, 4, 4, 4, 8]

/-- The partition of `[0, 1]` for the circle-mean check of channel 1: interval lengths in units of `2⁻¹⁰`. -/
def mean1Steps : List Nat := [
  1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, 4, 4, 4, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 32, 16,
  16, 16, 16, 16, 16, 16, 16, 16, 16, 8, 8, 8, 8, 8, 8, 8, 8, 4, 4, 8, 4, 4,
  8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 16, 16, 16, 16, 16, 16, 16, 32, 32, 32, 32,
  32, 32, 32
]

/-- Computation 5 for channel 1: the positivity check on the circle of radius `regRQ 1` succeeds. -/
theorem reg1_ok : regQ1SmoothedOK ctQ stQ seQ p1Q q1Q (regRQ 1) 5 reg1Steps = true := by
  decide +kernel

/-- Computation 6 for channel 1: the circle-mean check on the circle of radius `rhoQ 1` succeeds. -/
theorem mean1_ok :
    meanQ1SmoothedOK ctQ stQ seQ p1Q q1Q (rhoQ 1) (jCertQ 1) (budgetQ 1) 10 mean1Steps = true := by
  decide +kernel

end Haagerup
