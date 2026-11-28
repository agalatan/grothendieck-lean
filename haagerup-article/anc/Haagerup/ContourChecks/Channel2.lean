/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import Haagerup.Parameters
import HaagerupKernel.TaylorHardy

/-!
# The two checks on circles for channel 2

Channel 2 of the certificate is Haagerup's phase channel with the polynomial `P₂`
(Table 1 of the article). This file holds the two finite computations for the tail of this channel, both evaluated by
Lean's kernel (`decide +kernel`) with the Taylor-model checkers of `HaagerupKernel/TaylorHardy.lean` (Appendix A.6):

* `reg2_ok` (Computation 5, positivity on the outer circle): on the circle of radius `r_reg,2 = regRQ 2`,
  parametrised over the first quadrant by `σ ∈ [0, 1]`, the matrices `I ± Re Γ_2(t)` are positive definite;
* `mean2_ok` (Computation 6, circle mean): on the circle of radius `ϱ_2 = rhoQ 2` the pair `(Γ_2(t), β_2)` is
  admissible and the mean of the reciprocal of the Schur denominator is at most `B_2 = budgetQ 2`.

The lists `reg2Steps` and `mean2Steps` are the partitions of `[0, 1]` into dyadic intervals on which the Taylor
models are evaluated: the entries are the lengths of the consecutive intervals in units of `2⁻ᵏ` (`k = 5` and
`k = 6`), and the checkers verify that the lengths add up to `2ᵏ`. What the two Boolean facts imply is proved in
`Haagerup/TaylorHardySound.lean`; they are used in `Haagerup/CertCheck.lean`.
-/

set_option warningAsError true

namespace Haagerup
open HaagerupKernel.TaylorHardy

/-- The partition of `[0, 1]` for the positivity check of channel 2: interval lengths in units of `2⁻⁵`. -/
def reg2Steps : List Nat := [2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 4]

/-- The partition of `[0, 1]` for the circle-mean check of channel 2: interval lengths in units of `2⁻⁶`. -/
def mean2Steps : List Nat := [
  4, 4, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1,
  1, 1, 1, 2, 2, 2, 4, 4
]

/-- Computation 5 for channel 2: the positivity check on the circle of radius `regRQ 2` succeeds. -/
theorem reg2_ok : regQ1DiagOK p2Q (regRQ 2) 5 reg2Steps = true := by
  decide +kernel

/-- Computation 6 for channel 2: the circle-mean check on the circle of radius `rhoQ 2` succeeds. -/
theorem mean2_ok :
    meanQ1PhaseOK p2Q (rhoQ 2) (jCertQ 2) (budgetQ 2) 6 mean2Steps = true := by
  decide +kernel

end Haagerup
