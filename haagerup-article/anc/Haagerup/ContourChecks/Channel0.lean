/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import Haagerup.Parameters
import HaagerupKernel.TaylorHardy

/-!
# The two checks on circles for channel 0

Channel 0 of the certificate is the smoothed cell map with the polynomials `(P_0, Q_0)`
(Table 1 of the article). This file holds the two finite computations for the tail of this channel, both evaluated by
Lean's kernel (`decide +kernel`) with the Taylor-model checkers of `HaagerupKernel/TaylorHardy.lean` (Appendix A.6):

* `reg0_ok` (Computation 5, positivity on the outer circle): on the circle of radius `r_reg,0 = regRQ 0`,
  parametrised over the first quadrant by `σ ∈ [0, 1]`, the matrices `I ± Re Γ_0(t)` are positive definite;
* `mean0_ok` (Computation 6, circle mean): on the circle of radius `ϱ_0 = rhoQ 0` the pair `(Γ_0(t), β_0)` is
  admissible and the mean of the reciprocal of the Schur denominator is at most `B_0 = budgetQ 0`.

The lists `reg0Steps` and `mean0Steps` are the partitions of `[0, 1]` into dyadic intervals on which the Taylor
models are evaluated: the entries are the lengths of the consecutive intervals in units of `2⁻ᵏ` (`k = 6` and
`k = 11`), and the checkers verify that the lengths add up to `2ᵏ`. What the two Boolean facts imply is proved in
`Haagerup/TaylorHardySound.lean`; they are used in `Haagerup/CertCheck.lean`.
-/

set_option warningAsError true

namespace Haagerup
open HaagerupKernel.TaylorHardy

/-- The partition of `[0, 1]` for the positivity check of channel 0: interval lengths in units of `2⁻⁶`. -/
def reg0Steps : List Nat := [1, 1, 2, 4, 8, 8, 8, 8, 8, 16]

/-- The partition of `[0, 1]` for the circle-mean check of channel 0: interval lengths in units of `2⁻¹¹`. -/
def mean0Steps : List Nat := [
  1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, 8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32,
  32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 16, 16, 16,
  16, 16, 16, 16, 16, 8, 8, 8, 8, 8, 8, 16, 16, 16, 16, 16, 16, 16, 16, 16,
  16, 16, 32, 32, 32, 32, 32, 32, 32, 64, 64, 64, 64, 64, 64, 64
]

/-- Computation 5 for channel 0: the positivity check on the circle of radius `regRQ 0` succeeds. -/
theorem reg0_ok : regQ1SmoothedOK ctQ stQ seQ p0Q q0Q (regRQ 0) 6 reg0Steps = true := by
  decide +kernel

/-- Computation 6 for channel 0: the circle-mean check on the circle of radius `rhoQ 0` succeeds. -/
theorem mean0_ok :
    meanQ1SmoothedOK ctQ stQ seQ p0Q q0Q (rhoQ 0) (jCertQ 0) (budgetQ 0) 11 mean0Steps = true := by
  decide +kernel

end Haagerup
