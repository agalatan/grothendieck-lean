import Grothe.UpperChaos.Q0CommonMomentSum
import Grothe.UpperChaos.Q0RealPhaseSourceSum
import Grothe.UpperChaos.Q0RawWickTermDefs

/-!
# Source-derived rational terms for the q0 Wick expansion

These definitions construct trivariate rational monomials from source-format
phase terms using the common-index binomial factor. They do not assume an
external coefficient bank. The definitions are not yet connected by a theorem
to the real q0 source sum; the finite-sum algebra and radial substitution for
that connection remain separate obligations. Agent-ID: codex-8c4d.
-/

namespace Grothe.UpperChaos.Q0RawWickTerms

open Grothe.UpperChaos.Q0CommonMomentSum

/-- The rational factor is exactly the existing real Wick factor. -/
theorem imSqBinomialFactorQ_cast (p q j : ℕ) :
    (imSqBinomialFactorQ p q j : ℝ) = imSqBinomialFactor p q j := by
  unfold imSqBinomialFactorQ imSqBinomialFactor
  push_cast
  rfl

end Grothe.UpperChaos.Q0RawWickTerms
