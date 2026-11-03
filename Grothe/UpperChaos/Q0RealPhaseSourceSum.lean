import Grothe.UpperChaos.Q0RealPhaseTerm

/-!
# The actual phase source as real finite Wick sums

The per-term real identity is summed over the literal `phaseTerms` list. This
preserves the binomial and moment sums and introduces no external coefficient
bank or numerical enclosure. Agent-ID: codex-8c4d.
-/

namespace Grothe.UpperChaos.Q0RealPhaseSourceSum

open Grothe.UpperChaos.Q0RealPhaseTerm
open Grothe.UpperChaos.Q0RealShiftMoments
open Grothe.UpperChaos.LeanCertProductionProfile

noncomputable section

/-- The exact real Wick contribution of one source-format phase monomial. -/
def realPhaseSourceTerm (β m r : ℝ) (t : (ℕ × ℕ × ℕ) × ℚ) : ℝ :=
  ∑ k ∈ Finset.range (t.1.2.2 + 1),
    realPhaseMonomialCoeff t.1.1 t.1.2.2 k t.2 r *
      realImSqMoment β m (t.1.2.1 + k) (t.1.2.1 + (t.1.2.2 - k))

end
end Grothe.UpperChaos.Q0RealPhaseSourceSum
