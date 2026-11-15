import Grothe.UpperChaos.Q0PhaseMonomialExpansion
import Grothe.UpperChaos.LeanCertProductionProfile
import Grothe.LowerAnalytic.CapSymmetry
import Grothe.UpperChaos.Q0RealShiftMoments

/-!
# A source phase term evaluated at real radius and real shift

This joins the exact binomial expansion of an actual-format phase source term
to the real shifted-moment sums. It preserves the finite sums and does not
claim the compressed double-factorial form or any numerical enclosure.
Agent-ID: codex-8c4d.
-/

open Grothe.UpperChaos.Q0PhaseMonomialExpansion
open Grothe.UpperChaos.Q0RealShiftMoments

namespace Grothe.UpperChaos.Q0RealPhaseTerm

noncomputable section

/-- Real coefficient of one binomial contribution to a phase source term. -/
def realPhaseMonomialCoeff (a c k : ℕ) (d : ℚ) (r : ℝ) : ℝ :=
  (d : ℝ) * (r ^ 2) ^ a * (1 / 2 : ℝ) ^ c *
    (c.choose k : ℝ) * r ^ k * r ^ (c - k)

end
end Grothe.UpperChaos.Q0RealPhaseTerm
